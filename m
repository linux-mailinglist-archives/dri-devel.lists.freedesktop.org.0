Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9B757A0F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3B010E008;
	Tue, 18 Jul 2023 11:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACAE10E008
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:08:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I5e1VU010456; Tue, 18 Jul 2023 12:08:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=4AZTzAPJU9HXqZOr0pMZpkVaAYcd/NE9gnlPQ1XkvK4=; b=
 jgnp2+VxhIldCeGEEqVEDU+kx7y/I9QrohMhxGkQ73fGoqQIh8Q3GH2Xc83dJMtt
 kr1H8o5p4NHH1u11OzWaks6H9u+E9uw7QjcWeyRZCf9uXrPJ4vtv2zpik3kIk0EH
 nphWaOZ1In88jBXb8ZvWzHNvnDwTeQgMZxcFlUp+KA76ostIFkx6Lf96Ueum2kXi
 XNur2Tj9+auZubRFbNljzJuN5xjjFCwTVd1a5r8inBllTJprYXTqww7OZ7ptC7tz
 RJor9CfmL9+DDKz/CNC2d0FH2JamwC77bfGVwBG4CydJI/ffUq/7bH4srWwJ5aWk
 zWw8YwRAgJC60Kukj7X3WQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rutdrt17b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jul 2023 12:08:14 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:08:14 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 18 Jul 2023 12:08:14 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+folBSXbC2GwQpA1R0EPpP1M9gW5ucK37XhCRGuk+HHIIcsrE6j1qKshcZz/z6tOTM1imaU5n6D6suGFoLFJuIwP32fA2IzllaRw8CcAPvuChAu+HjuaUmUlO2s3qrp4icwwCCwGsdpn9/DGXeI4i8nLJ4rNFNwYTIJDTsd6gb/nIIAZOF/cWt4Rh6Y8g/1ldmKqfQ8RnJAki+Ta2kX0i5jLTApXEsGFdHzjOhvNPKZMgDkvnz7BjkMipfvUHDclgS8T3t7x2E530LEZJxRfeIRwqsxifpMQnIg0aiTtYaIDzDDwzbxYzZZI7MmP0kYJVD1mwAUQep+oL81hoGcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AZTzAPJU9HXqZOr0pMZpkVaAYcd/NE9gnlPQ1XkvK4=;
 b=aJNEk4VvCAT9TkIl+32hsjA9h8dhfXfWaRhGSzQ0unaCcJ8V0S2DHgeLlmLtiMuESx1HibemNUWh4j6XTB0RFLSRKZtyxLix9qMAv6292ds99LUSDnOLFcXqTToYDjU4F5Pr+eWULC4UTFJQ2uqDJep6KpWi4geMQKhnOqLgzVenlu6U1sCgfhjHOac1oJ/tdQ+fSRREnJ3SfxJ/foY0aJdgoX/mUkinTpIiBwRGpYSFdiqLqObySnNZwwGpz/T7cbv0Rw4/8a+GAF0O6J41SLBDmBJJdhax5BcLF95tR5rEU3m0p0AU5tNk/OR1yrvlFVlydaWw5dOcQFA5afqr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AZTzAPJU9HXqZOr0pMZpkVaAYcd/NE9gnlPQ1XkvK4=;
 b=l4l6kiIFNtZxDBx3omwXouKu93E/UehxyKlNUqttRH9B06YGNU7g4N3UMPKkvFs2X44Z69hfNXKNq7WxMllNfs4R4ko9/1EV6POzTwmwYJzmmx4YU2dGLN/eZxiGOwgCRCAll6+9L1pw+Jb/pWqxas01ICOcuLnhPXUpz+ZP58E=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB5692.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 11:08:12 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:08:05 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "conor@kernel.org" <conor@kernel.org>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZtl8P3D36r4o1qUe5ZVQPQ0pfk6+6pMUAgAS+uwA=
Date: Tue, 18 Jul 2023 11:08:05 +0000
Message-ID: <a86f6359706485cf595889a07e513e2b9fd6d71b.camel@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <20230715-paramount-straining-6a486f8af20d@spud>
In-Reply-To: <20230715-paramount-straining-6a486f8af20d@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB5692:EE_
x-ms-office365-filtering-correlation-id: 025637fc-0afa-466e-8d2a-08db877f42c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LqUMEbG9atg4QAK9RBIm52E5vVUVw6dy/oG7/pgYofVqAD1KplgbxQtPrarh4u/keivY9o7R9ndv8pKEzegEPwKZ/ZRgMzx1ypX7rF2kNw3+k6vqkT/TOVuYUkK/awfm+fdRSXrnKIo3fWnPS3Kgb3H34jjB5mpszerrtBVDgdQqBlPgvXvPfLyEB10MQMqJDkQliFdY5YxwMuGzJZVfMWM1jihcRGJrI7cTGbYnFdS1jB4Jd47gDC181rzYkO1PHal2hglb/a4JVH4C3QNZVGLkINF5/ZpLB7Dim6dMSu4lTUppurfM2PWbNlzN52A3rd+Z/XhHeFBfJw7HFv9B7qMLOm04h9DzBzcamOowzIdUf/ENNzZ2WPC0fgOK7Lt8RjKb8Hhv4Q9RGuudeDUXheJisRxgffz7p2gTW6t/yReoV2gX8Kwm2eXjiqvicsjK+L9FepQBxMucYFu+CuLS7WomVFtBgm8nN2iBBqFpg+VOzGG7FWCCGyPFmwbOHei2qzKE+2Xzi7RF21TdSRD78R0kNoWdUrWIyiTqNTOc44slrS4ik+GHEFF9Hmcg28at21Nm/kiYMMzouDUfV2Nu91DdTNs1CkTnUI+BSx+KRNk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39850400004)(346002)(376002)(366004)(396003)(451199021)(6486002)(71200400001)(478600001)(83380400001)(6506007)(26005)(966005)(6512007)(110136005)(38100700002)(54906003)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(122000001)(6636002)(4326008)(316002)(186003)(2616005)(5660300002)(7416002)(41300700001)(38070700005)(2906002)(8676002)(8936002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVF0SDYrbEZwOWl3a2RHdk4wM1VGWExvTWVVMUpxQUtqaCtvYThFM2tJT3BI?=
 =?utf-8?B?ZytEdUZFeWRmNHNLcnpOK00zSk04dTAzWVVNd2MwUTM5aHdoT29UdTVYa21z?=
 =?utf-8?B?RzZIeUt2bVVPaEdOUzlVd0Nnek9sdW93VHJ6OHRaeWZSYWd4d00rMG4xN1hw?=
 =?utf-8?B?YUtlOFVhZHRnVkdIeWErVkVmSG82VWcxdE5MOEI4SElYQVJDTElhM1cySW0x?=
 =?utf-8?B?Vi9MdzBqRlF6czdqQlB2QzR2WkhrTURiNUlVWUNhYS9BVDZCeVAxRkNNN0tO?=
 =?utf-8?B?YlRhNHYvcDZmOEhoUEdUMGwyc0JFcDcraVpqUjQ5YjhzSVJwNFZsSkF0bkFU?=
 =?utf-8?B?ejF2UUJzZmYrRkFicnU2N0lTakZHekpEN0NjdTJOZXMrTWxzTldobDdCK3hY?=
 =?utf-8?B?OUdDRFRCUE83MjFVZnJXRFd1WEczckxjQkF1TCtGOGdKSHN3VG03RUxQTkVU?=
 =?utf-8?B?NkNXcks1UUhLUWE1OG01VWlVNUxMdlMxNU13d0cwejk3bitOWmRxNEpQRTBu?=
 =?utf-8?B?NzMxODFKS1dLeXlOeVZhQmJKTjI1UmRUd25acjBoWFJYb2J0bTlMRVR6UWpy?=
 =?utf-8?B?NnBzMVd0Q2RLTDQwbEhFeTdGWUV0T01FQTBhMS9ZOVNxRnVoUVBDSEVnbmwv?=
 =?utf-8?B?V3NEeUdWVU93ZllPZjNNSjFSU05PMVRRcUp5V1RjT1I2Y1lseFlmaVVGNjEx?=
 =?utf-8?B?Yno5SlRLUWVBVVlmeDZsMGZ1eGVvZ3dlZjU0aDFVTFFjQzNCdDlWRlpaSlhR?=
 =?utf-8?B?ZUx4QlMzanBtTVY5ZExONEtyTjN2UzhWUFZHRVlkZnNnLzFlSVVkRkZDSEQy?=
 =?utf-8?B?U3IxejlWVEI1OE1ibWFCMVo5NjZSSTl2Wlh4dFc4SWtUbzNyZkFZaTVYZDFv?=
 =?utf-8?B?dlFoUmk2SzZPQVhPVGt3SUhTTko5c3p4a2ZPVG9GYUtid2xiNkdmeG81US9D?=
 =?utf-8?B?V1FhSW5nWUN0bXo1VGlHaFBzMDBIMnJRWWpEMTVMUkF2NnJEbktjaXZGbXNw?=
 =?utf-8?B?ZXVGSTlyOHdRV1Q4amF4cmNLVFhsNlROVld3R0RNRzQ0V2JLN0V6enY4MVdR?=
 =?utf-8?B?bGJSQ1BsL1VobUtqZ3FpdWphdTdwZ2tYV3JSYWFKV1NMNm1vVXY5QS80Q3h6?=
 =?utf-8?B?cEp0bTIyVmpEUThzT1V5WU9LSGxWSlc0MXZHK2wrelhoYUgzNjNpcjNNY2pE?=
 =?utf-8?B?R0RMU0FZRzdGMmdLUVRsOUd6eGFMTTFsOFVselR4a0RoYkVEelJMMExBeFlP?=
 =?utf-8?B?TENYZytGVVRRRHUydG9LR0ZVc3lqWGJkZTByMGEyMmZ3dTg1bFd1MWRnZDh5?=
 =?utf-8?B?VXJQZEV4N05LQ1BDRnlGc2d6aU53dEtuTGYxc3JuamROYnRIbXQ0NzlXZzl4?=
 =?utf-8?B?aUxmK1Y0NnhCUmFsMG8rZGR0VEFhTzNVVTJ5Zk9ETUZLK1A5c1IvRFVlYlhX?=
 =?utf-8?B?S292YkFoZ2NScVVYR010RTFOVVA3YjVpSEVDWHR6Q3J3a2c2aTZRSGo5c3g5?=
 =?utf-8?B?Z0VuaDltNnJ1Qy9KbWhBb2Jra3BEY0wrTDFhUm05MlBEaU1GT2FBRVdua000?=
 =?utf-8?B?dmh3ZWxkWUZCNnk5Z2RSK1A4Q3RwSXFRc2thTlVvaFo0WUc1MlQyb3hUeXkr?=
 =?utf-8?B?UUx6L1ZtQkU1bjZTQzZ5VnBUbGpGU3VhTks3Zk9aRkswV25DNCt3NjFDZTRD?=
 =?utf-8?B?b2JiRWplTUpqNVlKVkxOSnVmakhRRVozMmlyYW5FaTRPMUloUERDVGRqeUIv?=
 =?utf-8?B?SVFZZm5JN3NNMXMvSG5HMkpKOGx4ZFI2VGlpcVFkSkMvUkFEYTBPQ2E0VVJI?=
 =?utf-8?B?dG41TmE3N2VGZ3BXKzgrKytmTmVUOUNUV3BvaG5tNkJ3KzNyTzdLOGNUV29h?=
 =?utf-8?B?VVJRbCtUMEhveEFBZmphZVVZbHJhS24rT0Z2OVhmZ1JLbGR6Tktrd2twcHJI?=
 =?utf-8?B?eWVtRXFvRHJERWRlQndOZnMyL1hqblRuck9QdC9uZ3Q0WHVwLzBKVFNwdmRL?=
 =?utf-8?B?cDNRVlBGWEdUZTlnRFppcjd3TW5MRVBKdnlLNEl2KzkvNHlQRG9qSUtJNzkw?=
 =?utf-8?B?R2ZySUZIa3VVdk9qaEVNNm1hSDU5U3pyRnpFQnF6eGFKT3kwTjlJWHRWNkt4?=
 =?utf-8?B?a3Z3VDE5ZDBSZDhvRjAxQnl2YWdWOFFhRTNkMy83cGFpSzRESUpLdXNGQ1o3?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40C79CDB962E2B49BEEA7A20E23AA476@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 025637fc-0afa-466e-8d2a-08db877f42c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 11:08:05.3364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E4v1kvwgdfwvV/fXWGHZezgO2JpRohabLdIt3DXbNmx2BA0XKhZ+kpTI9gRo2C18SkN93y8kBZn8r9MPc33E5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5692
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: tz-Ah-4gXmyvHFmDKCwJrY8hEu-yC5sT
X-Proofpoint-ORIG-GUID: tz-Ah-4gXmyvHFmDKCwJrY8hEu-yC5sT
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>, Donald
 Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ29ub3IsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayAoY29tbWVudHMgYmVsb3cp
Lg0KDQpPbiBTYXQsIDIwMjMtMDctMTUgYXQgMTE6NDAgKzAxMDAsIENvbm9yIERvb2xleSB3cm90
ZToNCj4gSGV5IFNhcmFoLA0KPiANCj4gWW91ciBzZXJpZXMgZG9lcyBub3QgYXBwZWFyIHRvIGJl
IHRocmVhZGVkLiBgZ2l0IHNlbmQtZW1haWxgIGNhbiBiZQ0KPiBwYXNzZWQsIGZvciBleGFtcGxl
LCBhIGRpcmVjdG9yeSBjb250YWluaW5nIGEgd2hvbGUgc2VyaWVzICYgd2lsbCBzZXQNCj4gdGhl
IGNvcnJlY3QgaW4tcmVwbHktdG8gaGVhZGVycyBzbyB0aGF0IHRoZSBzZXJpZXMgaXMgaW4gYSBz
aW5nbGUNCj4gdGhyZWFkLg0KDQpUaGFuayB5b3UgcG9pbnRpbmcgdGhpcyBvdXQsIHdlJ2xsIG1h
a2Ugc3VyZSB3ZSBkbyB0aGlzIGZvciB0aGUgbmV4dCBpdGVyYXRpb24uDQoNCj4gDQo+IE9uIEZy
aSwgSnVsIDE0LCAyMDIzIGF0IDAzOjI1OjI2UE0gKzAxMDAsIFNhcmFoIFdhbGtlciB3cm90ZToN
Cj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFNl
cmllcyBBWEUgR1BVIHVzZWQgaW4NCj4gPiBUSSBBTTYyIFNvQ3MuDQo+ID4gQ2hhbmdlcyBzaW5j
ZSB2MzoNCj4gPiAtIFJlbW92ZSBvbmVPZiBpbiBjb21wYXRpYmxlIHByb3BlcnR5DQo+ID4gLSBS
ZW1vdmUgcG93ZXItc3VwcGx5IChub3QgdXNlZCBvbiBBTTYyKQ0KPiA+IA0KPiA+IENoYW5nZXMg
c2luY2UgdjI6DQo+ID4gLSBBZGQgY29tbWl0IG1lc3NhZ2UgZGVzY3JpcHRpb24NCj4gPiAtIFJl
bW92ZSBtdDgxNzMtZ3B1IHN1cHBvcnQgKG5vdCBjdXJyZW50bHkgc3VwcG9ydGVkKQ0KPiA+IC0g
RHJvcCBxdW90ZXMgZnJvbSAkaWQgYW5kICRzY2hlbWENCj4gPiAtIFJlbW92ZSByZWc6IG1pbkl0
ZW1zDQo+ID4gLSBEcm9wIF9jbGsgc3VmZml4ZXMgZnJvbSBjbG9jay1uYW1lcw0KPiA+IC0gUmVt
b3ZlIG9wZXJhdGluZy1wb2ludHMtdjIgcHJvcGVydHkgYW5kIGNvb2xpbmctY2VsbHMgKG5vdCBj
dXJyZW50bHkNCj4gPiAgIHVzZWQpDQo+ID4gLSBBZGQgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlDQo+ID4gLSBSZW1vdmUgc3RyYXkgYmxhbmsgbGluZSBhdCB0aGUgZW5kIG9mIGZpbGUNCj4g
DQo+IFRoZSBjaGFuZ2Vsb2cgc2hvdWxkIGdvIGJlbG93IHRoZSAtLS0gbGluZS4NCg0KQWNrDQoN
Cj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2FyYWggV2Fsa2VyIDxzYXJhaC53YWxrZXJAaW1ndGVj
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dl
cnZyLnlhbWwgIHwgNjggKysrKysrKysrKysrKysrKysrKw0KPiA+ICBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDc1IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLnlh
bWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzI5
MmEwNDQwNDY1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnIueWFtbA0KPiA+IEBAIC0wLDAgKzEsNjgg
QEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpDQo+ID4gKyMgQ29weXJpZ2h0IChjKSAyMDIyIEltYWdpbmF0aW9uIFRlY2hub2xv
Z2llcyBMdGQuDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9ncHUvaW1nLHBvd2VydnIueWFtbCMNCj4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+
ICt0aXRsZTogSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlIgR1BVDQo+ID4gKw0KPiA+
ICttYWludGFpbmVyczoNCj4gPiArICAtIFNhcmFoIFdhbGtlciA8c2FyYWgud2Fsa2VyQGltZ3Rl
Yy5jb20+DQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBHUFUgaW50ZXJydXB0DQo+IA0KPiBUaGUgZGVzY3JpcHRpb24gaGVyZSBk
b2Vzbid0IGFkZCBhbnkgdmFsdWUsIHNpbmNlIHRoZXJlIGlzIG9ubHkgb25lDQo+IGludGVycnVw
dCwgc28geW91IGNhbiBkcm9wIGl0IGFuZCBkbyBtYXhJdGVtczogMSBhcyB5b3UgaGF2ZSBkb25l
DQo+IGVsc2V3aGVyZS4NCg0KU3VyZSwgd2lsbCBtYWtlIHRoaXMgY2hhbmdlLg0KDQo+IA0KPiA+
ICsgIGludGVycnVwdC1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0
OiBncHUNCj4gDQo+IEFuZCB0aGlzDQo+IGl0ZW1zOg0KPiAgIC0gY29uc3Q6IGdwdQ0KPiBjYW4g
anVzdCBiZQ0KPiBjb25zdDogZ3B1DQo+IA0KPiBBbHRob3VnaCwgaWYgdGhlcmUgaXMgb25seSBv
bmUgaW50ZXJydXB0IHRoaXMgaXMgcHJvYmFibHkgbm90DQo+IHBhcnRpY3VsYXJseSBoZWxwZnVs
LiBBcmUgdGhlcmUgb3RoZXIgaW1wbGVtZW50YXRpb25zIG9mIHRoaXMgSVAgdGhhdA0KPiBoYXZl
IG1vcmUgaW50ZXJydXB0cz8NCg0KTm8sIGFsbCBvdXIgY3VycmVudCBHUFVzIGp1c3QgaGF2ZSBh
IHNpbmdsZSBpbnRlcnJ1cHQuIEkgYXNzdW1lIGl0J3MgbW9yZSBmdXR1cmUNCnByb29mIHRvIGtl
ZXAgdGhlIG5hbWUgaW4gY2FzZSB0aGF0IGV2ZXIgY2hhbmdlcz8gQXMgaW4sIGJ5IGhhdmluZyB0
aGUgbmFtZSBub3cNCndlIGNhbiBtYWtlIGl0IGEgcmVxdWlyZWQgcHJvcGVydHksIHdoaWNoIEkg
Z3Vlc3Mgd2Ugd29uJ3QgYmUgYWJsZSB0byBkbyBhdCBzb21lDQpsYXRlciBwb2ludC4NCg0KVGhh
bmtzDQpGcmFuaw0KDQo+IA0KPiBPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4NCj4g
DQo+IFRoYW5rcywNCj4gQ29ub3IuDQo=
