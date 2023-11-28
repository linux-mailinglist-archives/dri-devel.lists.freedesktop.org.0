Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE467FB800
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8510E4B3;
	Tue, 28 Nov 2023 10:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCF810E4B3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:36:20 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AS6n1bN024911; Tue, 28 Nov 2023 10:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=/fGNbUOPeiuCDgUqZbFj/ztcayPJP8LdqcZjmCBbUJU=; b=
 HBaBkO+nrI7V9fAYXA7eRIlZe4YBJYsDDX6JAnQzS/AF8pXwogXJBKw+I09sNDrk
 bSwdkpqmWf6d/MG3vuYO+E8iaEHQzwYdH+4g27ZdBaQ5hgYwgnaU/Tm48+sNvQJq
 4yaP6+lEVU8tvw/V3LpMWBd3DS3/AcNB+YTALWmX9t8qwDdemYgGVAMY7KMIQ0cw
 OyktNkIx9GN1KNy/IP2DyQMDlZy3IJWHnTIQZmyXfNXH7ExpqcH76E/Cj/CsqeK5
 FG6dT+zRaRk+J7sxA81RTncaWW+STcjPa/p5GNXWl6aTqI8rcZ43/U9AVfKzPNZc
 rVrb+6AUduvEqX9rbuVCKA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uk82sj1f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 10:36:12 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:36:12 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 10:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb4nQL4QcJYg19H8VJybOWfNaf2XEyHtfFCrNCRaVi4sFPECmNOodEi8CFlX7F4EsUgtEI2RjIhzM9ld7g6QCvR+vIsSJLTJa3yjaLEgiEu6RIg5yGGTIxwV0lsDnblF4jk6epDSIFRTCBSlkc07v4qVgP47WqcXtMyrl4nAFXwIERtWO9OaDPuAFSd9VUDYnUHaxIf3tpr6qA1j6KWrQbU67hNTon4EwFFRgAFslvACDQJ86jndosqsYZx04b0hoCqY4D2wuTbhtGftxpnIkQi8j7PtAsDYrg3bYTXWm0SR7BQPahBvyZFmH1H3nFI1e1bwwevgnFloBR0mpHHaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fGNbUOPeiuCDgUqZbFj/ztcayPJP8LdqcZjmCBbUJU=;
 b=AhKO5Cjm9e2J6I/j6Iquhsq54QE2E7K27HffpcKiRKA67YScqZa1pjG+i76Jtnzb87Gv7cX1MTQAqdK/6MC/RbGoFJMrWMOy8X2f/fJU78Vwtpv0+s1r2gj6COsBHkl7RSAoF60KyALqZ7OmW2unxuzkup6llXBNZqlJ1SCRgaIC0mhQSejN2C9p0hu+txCWYZajT/QPBYLropZyATXz/hQipNS/AjW+2jRPdvFiaJumlcNGvLcoci60nVsIHZfS1USzXx4iiCpnHLfMBWFsIGToXWbWcZiVZ5kbDM+lPK2j/UNhQ7oGk96plr49bHVz48how8NJl15vON8b6JCJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fGNbUOPeiuCDgUqZbFj/ztcayPJP8LdqcZjmCBbUJU=;
 b=C5cpyz0iP1Z7ySLBBaMxw9+WgUUcURqpwe92p2FVFKXUxBkSBLpAh6x0Cymxyc6IWe4m6yuxRGK/ENxQa+gE1e4ISWduRR3+Sj3iIoC8mnUmtWpjSYDenBjvH3RdSOIMh2EmJiba8E2pJdvqDu31TIucXsFkYEdFdFbeSWnmtJc=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6596.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 10:36:10 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:36:10 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Frank Binns <Frank.Binns@imgtec.com>, 
 Matt Coster <Matt.Coster@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH drm-misc-next 3/5] drm/imagination: vm: fix drm_gpuvm
 reference count
Thread-Topic: [PATCH drm-misc-next 3/5] drm/imagination: vm: fix drm_gpuvm
 reference count
Thread-Index: AQHaIea02sTQUVrj3k+ysru0BXe5Mg==
Date: Tue, 28 Nov 2023 10:36:10 +0000
Message-ID: <90f220de5aeb91e5e2dc64ec662ee961414c067f.camel@imgtec.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-4-dakr@redhat.com>
In-Reply-To: <20231124233650.152653-4-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB6596:EE_
x-ms-office365-filtering-correlation-id: 394a529c-12e2-4030-cb4a-08dbeffdd681
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6sWzQRQWoR9vQJPXJel2squBMgXJLWD0H+HwgkqWUzVdNdYbvfJc318MTUT7FXm+3n26uWQBS+Vc7OF51SjVvOQThX6oIiIacrzmARU6aKveTto7QjksMDkNXFqF+eRowu5NuhhL0U8igG93psoIrDEuk6jDBNCUrjBm2vH09s7BhCV1EDBbuyeRkaLvbgKh7gHdpGr4e3P0n/OScHvrdGMcpYbnkoUdNNQfsBD4s9RswbFaZ/ScwdhxuZgAm6Z1YGvIuDFzBVUiVmRCdM1Xv+Pw+9dwYqWBsJJ6wte1BU/YSDC8YuUp2O5fUYFEVIwPzvwPi+ypF8CqhofS+er9u9X14Qs7awq9hkzBGKfnV7luE0Xw16+HmSw4ITNXYp6GB+RizPBH1mHjgc+BJdNFxQXjVRbcr8LwmDun9WnC6e8smI0TpiNOREfr9jD09JEfxbaBRrXHn8/5NyIhZpIAcPrzyHRYEYqHe2bxJu8tfdt2Bc+9vNwAPm0/kNWPPZo6JB7SRiM3BG7I0V+Y/Lswnk+iGs1l6lHymH2Xbbr0BgJFx300h4Ae5I1W/C4In1OUSSOINQ9ea5Z6vsbdQllXWUtLFJAz8/cXm+u8DXmMs38KjzVGurBB5EmR9u0QxT357McbUO95+AuDDx5XYbCy09txhhL9YyRUXf3WtAJHoj0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(366004)(346002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(83380400001)(38100700002)(4326008)(8676002)(8936002)(86362001)(38070700009)(4001150100001)(2906002)(26005)(5660300002)(122000001)(36756003)(6512007)(2616005)(6506007)(76116006)(91956017)(110136005)(71200400001)(6486002)(478600001)(6636002)(54906003)(66556008)(66476007)(66446008)(66946007)(64756008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2hybkl0U3RWRmxPd1FqMWd2cHNiODF1ZkJDRHVRRFZmRXdINForRU01MGFE?=
 =?utf-8?B?TmJWcStzRjREQ280STlYanNBQ2NBM29nWEpnM2J1cGNYNTB2ZEFoTmsrQ0k2?=
 =?utf-8?B?TER5WTVKK2ZBMjFsejlqWHZLbWRNbHNGVmt1SEtVZms4Vk1rZlpsTS85MTJL?=
 =?utf-8?B?KzlkTzhiU1k3Vi9STkM0ZlppaHRBQzA3SHc5MWczQ1c0Z1VhZHRnTmVnamNM?=
 =?utf-8?B?NExtamlxb1NhMnBmWnhBenc3ZHRKYzk3Z0JtSUlERXlndStIN3ppMXU0VHJk?=
 =?utf-8?B?ODlNTGoyQnI3cnZWUDhFdndaUTJ4bUxLR20vSTFpbC9WZUEwYVNteUpTZURx?=
 =?utf-8?B?cElNNWNHc3h5cDI2RnRScS9sR2FlRFdxc3RISlVPT09oc0VaNlJPc3NIYVRm?=
 =?utf-8?B?S3hIRm1PRElkaDhCeEpjeVBDeUQ5M2d0OGw2d1g4QzZYeFhZMVF4YlYwVzYr?=
 =?utf-8?B?UmhkeUxXK1B1UG1QS3VTQ1ZMeUV0Ylh1QktZdUJVT0hnWGwwVVl4Qi91NnZK?=
 =?utf-8?B?clI4eTM1ZHlkZEREbElGSlNqR0ExQU94ZUk3UmwrejV4YnhVRjdVYzdna2lV?=
 =?utf-8?B?NTczUmRTTGxYc3RVd0l3Tm1tZjh5OTdCQVBQL3lQWS8wSHFRZ0V6R1VOQUhB?=
 =?utf-8?B?KzFINzh4b0JudVBHMFJZRE9GUUNiTzAwY1JGS3pLRm9YVmJIQ3AvMXhjN0Na?=
 =?utf-8?B?OUduNnVxSEtuSjF5SzBnSnBjdlFkUi92anY0RTVJWnpJWXAvcTlEOFdvNk1L?=
 =?utf-8?B?eVJ5QXRIOTNveU8wY3M0ZE05RkR3c2E4bVJSaHAxc2Z0a0NaclU4cnUwWHhk?=
 =?utf-8?B?SW5EWll5ZjJPczdFdy9HeHNXVmJudXZRU3ZhYUdMN09BcUF1T3p6MHZZOUtK?=
 =?utf-8?B?aURZUHFkR2xHRFNIUDlHaWZtK2pyZTl3YjVZOHVvTmpTSDFReFdVemtaQlBT?=
 =?utf-8?B?ajcvZ2srSThaRmlHaWYxZi9NeVM5VU9idmRLeVdaTHpTOUN6ank2SklSdVZp?=
 =?utf-8?B?dy9mRHpIbVJEVUlyakN6QlBDV215cU9RaVk4UGE2VnptZjlpSkUxc0ZzWHBp?=
 =?utf-8?B?RjR6c2h4aW0zR1dzNE9QVHZuMTV6bjU0QmRxaWRucHcrWFZGUVJZQS9KRHpv?=
 =?utf-8?B?RmR3N3JUenZUQ3RsbU1RUnlaVXUrTVdQbVZ1MGdpc28ydUJ2ZzlDVlludTRQ?=
 =?utf-8?B?Q3R0TExQS2NMeWhrRzl1WXZ1dVJidElWK1RpQms1WDFJaU9VZURqRGVGTWlM?=
 =?utf-8?B?WFdYaFVkY2N0aWJKMk5mdTY2M1U3d3EySVJpWVhUMGdMRnRlVHdzSWs5Yit0?=
 =?utf-8?B?Z1hScDlNVU1lSnZaSU1yYlBpS2lLMHpPUzlNaStmSE1Jdml0WW16Tk9BYU1r?=
 =?utf-8?B?SjFDOFdwQzRTUlNFczVleFdjYlRVcHljU3d3dzAxRERvMldqWENmSHlpVGxo?=
 =?utf-8?B?MHU2WjlFbGY0cU1zMmdCdXRrU1NCRmNlN0hXb2MwdXExVlM3UlVYRmNzQi9J?=
 =?utf-8?B?UGc0S0hFSU1HUGovak9SdXRCanJhMHkwNGdMTE02aVoxQWk2Y1NZRWJ5a3RS?=
 =?utf-8?B?dGZCQ2U2WjYvYU9MTjlWVWlYMjRQNS9OcHN1aldTS3crdGlqcjJ5RFU5aVNO?=
 =?utf-8?B?QzZKYVAxcU9VaWwxdUdwMmEvSUFOTnh4ZjNGMzdKQXY0NGhwSFhSdWFxK0x3?=
 =?utf-8?B?YnE3STNhMjRyVkFQU1JMUUdVQkxJczg3SGpEb3M4ZHA1VUxDaUp3SlJLdTN1?=
 =?utf-8?B?TFMva01IKzRJL21wbjZxdzR2NnRHbjRxWFBMWGxYNWorUTI3aG1LSDJhcDU5?=
 =?utf-8?B?ZFdjeTN4V1RIT1NvZ0RoVDBMZ25mSTRjWTREdUpneWJXNmpzV2tKdDhzOVJR?=
 =?utf-8?B?T0tSeGZUTjhyZ2tBMVJvOTMwRTJnUVNyNld6UWZKZCt6SGZiVnd2a3BNNUZ2?=
 =?utf-8?B?QjR2QnI3UDVXbjJtUHp0TmhlV1A4TmszZ3RvRmlHSkJsOHdNUE1tTGIrR2pE?=
 =?utf-8?B?dVpVQnJkL0FES2RmSFZLOGF6dkVBTFQ3RWRsbDJia0hibklYLzkxbkd6K3NS?=
 =?utf-8?B?ZGN2U0V1TGNLMStERW80dlFRV3E0U0JQaFFMQVhnYllZSzNiOTFsTWVySytj?=
 =?utf-8?B?SUJCWHBNV3N6QWdiS1JNbHV4ckVZU0h0U3hQWWJRM3Y0QXU2TTAxSmhLdWZI?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F951CAC87782B34E9689C57F410C0C88@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 394a529c-12e2-4030-cb4a-08dbeffdd681
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 10:36:10.7403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAZpfZtI0fW8pEulZoj/vq9h21XhYT52VwOB+RTfPYEgZmExzZXT2ZmptnWhuULt+zrN5WsEC63yTNxVbB+q6YAwPp1UvWh3XGon2bPEsJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6596
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: DTF1ofafVHm9BfzgjXIsZpd7H0erUDKj
X-Proofpoint-GUID: DTF1ofafVHm9BfzgjXIsZpd7H0erUDKj
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIERhbmlsby4gSXQncyBvYnZpb3VzIG5vdyB5b3UndmUgcG9pbnRlZCBpdCBvdXQhDQoN
ClJldmlld2VkLWJ5OiBEb25hbGQgUm9ic29uIDxkb25hbGQucm9ic29uQGltZ3RlYy5jb20+DQoN
Ck9uIFNhdCwgMjAyMy0xMS0yNSBhdCAwMDozNiArMDEwMCwgRGFuaWxvIEtydW1tcmljaCB3cm90
ZToNCj4gKioqIENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlcyBmcm9tIGEgc291cmNlIG5v
dCBrbm93biB0byBJbWFnaW5hdGlvbiBUZWNobm9sb2dpZXMuIFRoaW5rIGJlZm9yZSB5b3UgY2xp
Y2sgYSBsaW5rIG9yIG9wZW4gYW4gYXR0YWNobWVudCAqKioNCj4gDQo+IFRoZSBkcml2ZXIgc3Bl
Y2lmaWMgcmVmZXJlbmNlIGNvdW50IGluZGljYXRlcyB3aGV0aGVyIHRoZSBWTSBzaG91bGQgYmUN
Cj4gdGVhcmVkIGRvd24sIHdoZXJlYXMgR1BVVk0ncyByZWZlcmVuY2UgY291bnQgaW5kaWNhdGVz
IHdoZXRoZXIgdGhlIFZNDQo+IHN0cnVjdHVyZSBjYW4gZmluYWxseSBiZSBmcmVlZC4NCj4gDQo+
IEhlbmNlLCBmcmVlIHRoZSBWTSBzdHJ1Y3R1cmUgaW4gcHZyX2dwdXZtX2ZyZWUoKSBhbmQgZHJv
cCB0aGUgbGFzdA0KPiBHUFVWTSByZWZlcmVuY2UgYWZ0ZXIgdGVhcmluZyBkb3duIHRoZSBWTS4g
R2VuZXJhbGx5LCB0aGlzIHByZXZlbnRzDQo+IGxpZmV0aW1lIGlzc3VlcyBzdWNoIGFzIHRoZSBW
TSBiZWluZyBmcmVlZCBhcyBsb25nIGFzIGRybV9ncHV2bV9ibw0KPiBzdHJ1Y3R1cmVzIHN0aWxs
IGhvbGQgcmVmZXJlbmNlcyB0byB0aGUgVk0uDQo+IA0KPiBGaXhlczogZmY1ZjY0M2RlMGJmICgi
ZHJtL2ltYWdpbmF0aW9uOiBBZGQgR0VNIGFuZCBWTSByZWxhdGVkIGNvZGUiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jIHwgMTEgKysrKysrKystLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IGluZGV4IDFlODkwOTJjM2RjYy4uZTBkNzRk
OWE2MTkwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3Zt
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IEBAIC02
NCw2ICs2NCwxMiBAQCBzdHJ1Y3QgcHZyX3ZtX2NvbnRleHQgew0KPiAgCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCBkdW1teV9nZW07DQo+ICB9Ow0KPiAgDQo+ICtzdGF0aWMgaW5saW5lDQo+ICtzdHJ1
Y3QgcHZyX3ZtX2NvbnRleHQgKnRvX3B2cl92bV9jb250ZXh0KHN0cnVjdCBkcm1fZ3B1dm0gKmdw
dXZtKQ0KPiArew0KPiArCXJldHVybiBjb250YWluZXJfb2YoZ3B1dm0sIHN0cnVjdCBwdnJfdm1f
Y29udGV4dCwgZ3B1dm1fbWdyKTsNCj4gK30NCj4gKw0KPiAgc3RydWN0IHB2cl92bV9jb250ZXh0
ICpwdnJfdm1fY29udGV4dF9nZXQoc3RydWN0IHB2cl92bV9jb250ZXh0ICp2bV9jdHgpDQo+ICB7
DQo+ICAJaWYgKHZtX2N0eCkNCj4gQEAgLTUzNSw3ICs1NDEsNyBAQCBwdnJfZGV2aWNlX2FkZHJf
YW5kX3NpemVfYXJlX3ZhbGlkKHN0cnVjdCBwdnJfdm1fY29udGV4dCAqdm1fY3R4LA0KPiAgDQo+
ICB2b2lkIHB2cl9ncHV2bV9mcmVlKHN0cnVjdCBkcm1fZ3B1dm0gKmdwdXZtKQ0KPiAgew0KPiAt
DQo+ICsJa2ZyZWUodG9fcHZyX3ZtX2NvbnRleHQoZ3B1dm0pKTsNCj4gIH0NCj4gIA0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZ3B1dm1fb3BzIHB2cl92bV9ncHV2YV9vcHMgPSB7DQo+IEBA
IC02NTUsMTIgKzY2MSwxMSBAQCBwdnJfdm1fY29udGV4dF9yZWxlYXNlKHN0cnVjdCBrcmVmICpy
ZWZfY291bnQpDQo+ICAJV0FSTl9PTihwdnJfdm1fdW5tYXAodm1fY3R4LCB2bV9jdHgtPmdwdXZt
X21nci5tbV9zdGFydCwNCj4gIAkJCSAgICAgdm1fY3R4LT5ncHV2bV9tZ3IubW1fcmFuZ2UpKTsN
Cj4gIA0KPiAtCWRybV9ncHV2bV9wdXQoJnZtX2N0eC0+Z3B1dm1fbWdyKTsNCj4gIAlwdnJfbW11
X2NvbnRleHRfZGVzdHJveSh2bV9jdHgtPm1tdV9jdHgpOw0KPiAgCWRybV9nZW1fcHJpdmF0ZV9v
YmplY3RfZmluaSgmdm1fY3R4LT5kdW1teV9nZW0pOw0KPiAgCW11dGV4X2Rlc3Ryb3koJnZtX2N0
eC0+bG9jayk7DQo+ICANCj4gLQlrZnJlZSh2bV9jdHgpOw0KPiArCWRybV9ncHV2bV9wdXQoJnZt
X2N0eC0+Z3B1dm1fbWdyKTsNCj4gIH0NCj4gIA0KPiAgLyoqDQo=
