Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC3803576
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB38E10E1DA;
	Mon,  4 Dec 2023 13:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54B810E1DA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:51:23 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B49RV2j003429; Mon, 4 Dec 2023 13:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=4kn1BHcHSyav6Qt0leqjLoPjCvGX78h76W3/exxLz6Y=; b=
 vEp+Ot0iQ4yn1K9lUE7lWgHi1L4SL/ur6wHYbNYPC3R0Y+6DWsb2sxBZrJYkGmke
 QWUi6iQ3mdV50BuzSMkdqG08yDfEoRIfg7LlxlZ0ln/3/WorXutdVmtdNMg6PVvP
 KvJN6ryg3/QqQeELxM9DDcXeLmoRuNz+4WJCnawJapSfytNQfpD8QiLQW6n5nurM
 3x/6l8GTIf8zIL4fw6S8oaNDK+n6yOKex0mmpsKLShSEhWVzTGivAQY/uFkLgb4s
 rcK95tYGH3b0ypjatwRaA8RUssyyQTqzGc74ZnAtEDTb4ASJkVFGbQ3hstyW1wGU
 IzZQigpsIf46cKR8dT6uEA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uqwhw9gfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Dec 2023 13:51:10 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 13:51:09 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 13:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al48PjjpTzI4GKgiAZalZu/9xdL8AGo6tCBM1ye1MgBOr1vIa0NtE2C+cM9geOzMiZBPkAuHYSiC4O5n2eiRgsWErHf6CWm+A6GfAgnbiFjJL++8HXdvhuiaKbXKYAldrIPRA6xiWt/ZtmXiRUmUqaQ0xD+1R0j+dg+DKE+kFHYmMLs+J+hqT7kCJKpP1r+DgpXYLI63enpXuM6Iyz54tZZJFH5jMQKU1Bf4kTypZq0AuRDbUhgBKrAj7Z5k2Xk3ptmz3rX6CiEQ/bcgMOOB5L0eQyEdHjzjWIsPmwo10WfgJ9Ayirw5riYRGtboOOkdzVlmihog/cX19fAdzahxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kn1BHcHSyav6Qt0leqjLoPjCvGX78h76W3/exxLz6Y=;
 b=GnX9yAtPTpl7BaweS2LkZlWZtEZC/hVVw1db0ahf0OKxbi3Q0JwBJ22YC5zg/BbU2IK7LQGHwrA38jBc8HZ7qZX3sMC5IXbOCOSYfcAKwVCRF17vxtbUYPKZLyG/C7Br2mbjnRVSceVn1fuUSzhTNKk3ebyX5wHTIiPo0N28lXklhGLXwsAJaUaXwp7BkaJtD5xTblixtMFuKfRUSPj/dI5J6y5/KNcvRG/nA5E9LfKi9QyGPCdPA07aRlrA73GtcAhuZw1/kupF8Zqe4mxiqBTdRxOQpgCSglfpYEfSPY4dlAK4qoloYjk7JDcndAWMqX/LjSJOdGQoUW7ORf/fZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kn1BHcHSyav6Qt0leqjLoPjCvGX78h76W3/exxLz6Y=;
 b=qoO24lOIX5qy5MyqQBBykhIxfGjeafxpj5KRV61TQL4Y9W58Or4s4pur+uihNI3X5CKHvYuwNEYJRi5zd/scz99ehR71cwTzJ93eBdf1A78kLtL556Dv3K/T8Q+z9dCu79UsPQIgCKqGaxDtBgs1US/td8Mrj/KMKon9YPQ2KVs=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB7296.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 13:51:08 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 13:51:08 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/imagination: Removed unused functions in
 pvr_fw_trace
Thread-Topic: [PATCH 1/2] drm/imagination: Removed unused functions in
 pvr_fw_trace
Thread-Index: AQHaJrbmSD2YuIOxek60ieUq6FcIYrCZJG6A
Date: Mon, 4 Dec 2023 13:51:08 +0000
Message-ID: <d8a7c276a8c7c9713d21aaeb3c4bb45fbfa43af8.camel@imgtec.com>
References: <20231204133611.53913-1-donald.robson@imgtec.com>
In-Reply-To: <20231204133611.53913-1-donald.robson@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LO6P265MB7296:EE_
x-ms-office365-filtering-correlation-id: 13ffc277-80a2-44ac-b3ac-08dbf4d01153
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iGNjAitrZeF1oo4hARROsr71AYCCz/sziVRi+6WtB/0oiTjyCR/C3j+rBNLoWfFc6i7LWXL5+oRE6fgEZBIdbYUaNEg4C3hqh626jkrIR43RfWlHecNerLr26GmfGzdZ08oPoYisY5Wp7KIazAoFvJ5B2Ey207OJxQhTp/MIyjp8sSzgppWVUglU8ZZMT9U8U6e6WK9D2oYCwzU+vokeDPilxPjgMV5f55fjccsWyKPl8YirA+qlvz3jBVGBgdLS3tVULukPMg/0aNJR47Yvtr6nKSB7WcSJ5zF5ajjVYawraQ1w5t++GQ8vODQU3PmoNLyyjjF/y+GKbmVhDK9T+ojqxHeAuhtmJ0amIqItBnvVrle2VGovgtLEFlH8p90LS4b5KlKqjTQ55d9j/gOv+s6Xlio+pPagQO5aEa7DLcrpco3lnjpqTQWbQwJkH6DtqQar8H7nsu+k9OV8AjkcFYHoTGqwhlzWcTy/eKBBtnNXfYJqbzR9K9oUJUfAIKu15DejZcVYukP45RaBsFY3+iISp12XF+arkEEbbtrQAMx7AKvp7+0TiOhjSIv/Oi73THgG5Sy/aYBcWa5/PKoSI0GPfIjoePAQfLqRt33EXwcQpLPKwRe6ExjU6ETjUaSlwnUfveQkdqDX0E4D7bHcFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(136003)(39850400004)(366004)(230173577357003)(230922051799003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(2616005)(122000001)(4326008)(8676002)(8936002)(6512007)(6506007)(83380400001)(26005)(966005)(6486002)(71200400001)(478600001)(91956017)(66476007)(76116006)(66446008)(64756008)(66946007)(66556008)(54906003)(110136005)(316002)(2906002)(36756003)(41300700001)(38100700002)(38070700009)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzZjSlA3VTZ3am9SdzhQcDRKWjEwcXBmUTlQSHdsNHJ4VStwTm9yakpkb29R?=
 =?utf-8?B?ZWlIeTNOYUZSemhLeDVOOS9nTDlRbWRCOFQweXZwTWo4TU13a0hzK0RUeHdX?=
 =?utf-8?B?Rys2Q3VNNGFNZFIvSFlleHhlZEgzVlQ5RThpUk55VlNUK2QwMUpEQVRCaHpx?=
 =?utf-8?B?TUYzb05CUThXL1pBcDlxZXdJVGM5RklNMzBPcnFLSVBmTkVRbnJsa090Nlpy?=
 =?utf-8?B?WjBwQ1pyWDFuaktWMXhhbi9QcncyV2U0MmlhOHBjRXJoMlAxZ1RIV0d1czJZ?=
 =?utf-8?B?ZjhSMHVTRUpsWjB5N0dPNlhzL3d3c0RHZUFHeGtsdjR6enZkYUJKRTc2ZGNI?=
 =?utf-8?B?cTA0Rk9GNThrTS81b01YTWY2WVAxb2xPUnBxeG5DUDEyMHYyVkhGS0FwY1li?=
 =?utf-8?B?TnY3QjE1NGVFcTJuYWRXb3QyNTdDYUNaWWZFeWFoNXNNdTBPcjNPZ2h2Z0g5?=
 =?utf-8?B?aGQ5eEJsTWtTelJ0MXBQV2FETjZIb2RUTEhoU01EbHpTS1E2M1JUOGMvVHpn?=
 =?utf-8?B?WkhnT29Bb1RqTlFaU0Jla2c5YzZ6TWJMVGpXN202ZktoZUliNnd3ZXhJZElQ?=
 =?utf-8?B?c1JmWWQzZWFzQmZsWUx0TndIRFptRzRFVVZCeW5yU0VYN2FlS3pLYUVnWmcr?=
 =?utf-8?B?bGtueFRwczBPRnJTSUZFS3NMVU9XU1ErVE5laFlVbFBZMjRnYnhyWFptbnZm?=
 =?utf-8?B?UFNVd0YxY3B6Yjc3ZU5oaTVUS25CeTc1UjVscjhCZk40VmJGWlA1dU43Snc4?=
 =?utf-8?B?dnRYMUZjc0JRbUpRQlB3Z1NwUlhNNzFEdTJDZVhuOGpZYWY0Qm4yMFVXQ0g1?=
 =?utf-8?B?ejgrMDBqYzlMeWJWSTBYWDBDTGo3WG56dkNEMThMdEJSaTFVdHplS1pQaDJS?=
 =?utf-8?B?VW1aZ1psYU1tUHM0R2NtOTY5UFM2REo1L3lJWW5NK1lwNVV2bkVsQ2g1UjJN?=
 =?utf-8?B?YkhBa05TZFo4NWlSeVd6d2M0Vm0xdDJJbWVEdU1iNWtObWcwbitXaU5Lc0V4?=
 =?utf-8?B?THZ6c3FIOE5xa3NjTElSamtiM093clBJV2JIa1JsMlRZNmp4TElXeUpvMWdm?=
 =?utf-8?B?dFFlRHBZSnU1NVYwa3ZybmhqbnFhc0VGNFhiYlF4SDU5TVhyVnBlNXEwWFky?=
 =?utf-8?B?OUZPRER3TEVxcXJUbFM2R0J6SURyRGVnSXVFNWJGcTF6MUVOeTdOZEI4NVZq?=
 =?utf-8?B?Nzl2MmRRWnozdElwV1JUQzFsVXVvUVU3N2l3eSt3UEJCYnU1OTUxanpLMHNM?=
 =?utf-8?B?eHVvS1BDbHpoWGtMZUsycTZyTThzYkZFNEhINDlXNUVXWlFlQVZUWFdESGtC?=
 =?utf-8?B?eXBmdC9tUXI0K1M3WlpjbXVzb0N0M29wMVhMYXI4UUtsTU1QdHdOTlVVVVVM?=
 =?utf-8?B?NFhuZzc0Z0NrMG1pNVlVbmdvbk5CVTZ1bHpmenJYSkJZazEwb052ekdNYU5B?=
 =?utf-8?B?UnVwUDNSMGxHZTNrU1k4OGFkVm0yUFRYSFkzREJ5Q1U1WjVFSTlXMjN6VklP?=
 =?utf-8?B?amVHSmhOeGJVMGtENVU1OHF6T1BoOWVsVHdmcFZBRkUvU0E2YUVHTHpoRHgy?=
 =?utf-8?B?TG1ZUktWWVMrM0JWbEJmWHdBWmtVRjVwaDFiQVJ5dC84emVDWTVJQkwwWUdz?=
 =?utf-8?B?VEp3cllNNlZDM01mWVhPeXZIK3NyU1ZickRMV2RxemxZZ0Z0TEVrTkNBTTJQ?=
 =?utf-8?B?MS9wamRTMEdnM2ltVDNLUEJBalRnc1FLYitxaHcwdm9LeHVuTFNLOHVwR1BE?=
 =?utf-8?B?aktWZ0t4VTlQL0orQklRZE1FT1hrWE9FS1lueGRDOEQvczdoSjFjMkQxL0RY?=
 =?utf-8?B?NVhFNFduMDNJNWZYelVUTi9TeVFlYTQrcDJqQXFjUlN2VzUrb2VJUVhMbDJp?=
 =?utf-8?B?Z3luS0NIRjR5dDN1SDBVM3lWUzlOYTFNQjVTR3prNW14SEwwT1JJODNHRVBv?=
 =?utf-8?B?bDZ6UlJLY1dPOEs5cVYrKzkwdjdCcElhRkpMazNmaStDc2xJNGFzeFBlTzcy?=
 =?utf-8?B?NnQ3TDBEYy9XRHlOZFNwMGZHenYydEFZT3d0MVZ4b2NENkJGMXJrSGZya2Y0?=
 =?utf-8?B?aUZPVXZnQlpqMGdqVlVEV2o5UEFhbXM2V0JYODZuOWFldUk2NlVVbzIwK2xN?=
 =?utf-8?B?c1R2eEJFZGhzY0ZBanBHVk5PYlV1UHozSW5TVzVML2o0OFZPR3ZrOUVCczhM?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5DF285B35AE2944ACC526D8E62E21F5@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ffc277-80a2-44ac-b3ac-08dbf4d01153
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 13:51:08.3682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAhhMUN3bY1Ja9+zyiGWs8+qcQ19sVrnfjWP2pqGNpZR+TI4YDN/6MgkjYZ34Br5sZEirkWlSiuJmaFL741AlFiYPkcPVYdeAKNGRSyVNNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB7296
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: jcYJ2dK-xUE8c3kKexM2S3iBJaovVIRq
X-Proofpoint-ORIG-GUID: jcYJ2dK-xUE8c3kKexM2S3iBJaovVIRq
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
Cc: "lkp@intel.com" <lkp@intel.com>, "mripard@kernel.org" <mripard@kernel.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCB0byBjbGFyaWZ5LCB0aGVyZSBpcyBubyBbUEFUQ0ggMi8yXS4gIEkgbWFkZSB0aGUgcGF0
Y2ggZnJvbSB0aGUgd3JvbmcgYnJhbmNoDQphbmQgZGlkbid0IG5vdGljZSBmb3JtYXQtcGF0Y2gg
aGFkIHBpY2tlZCB1cCBhbm90aGVyIGNvbW1pdC4NCg0KVGhhbmtzLA0KRG9uYWxkDQoNCk9uIE1v
biwgMjAyMy0xMi0wNCBhdCAxMzozNiArMDAwMCwgRG9uYWxkIFJvYnNvbiB3cm90ZToNCj4gKioq
IE5PVEU6IFRoaXMgaXMgYW4gaW50ZXJuYWwgZW1haWwgZnJvbSBJbWFnaW5hdGlvbiBUZWNobm9s
b2dpZXMgKioqDQo+IA0KPiANCj4gDQo+IA0KPiBGaXhpbmcgdGhlIHdhcm5pbmcgYmVsb3cgZHVl
IHRvIGFuIHVudXNlZCBmaWxlIGxldmVsIHZ0YWJsZS4gUmVtb3ZpbmcNCj4gb25seSB0aGlzIGNh
dXNlcyBhZGRpdGlvbmFsIHdhcm5pbmdzIGZvciB0aGUgbm93IHVudXNlZCBmdW5jdGlvbnMsIHNv
DQo+IEkndmUgcmVtb3ZlZCB0aG9zZSB0b28uDQo+IA0KPiA+ID4gZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl9md190cmFjZS5jOjIwNTozNzogd2FybmluZzogJ3B2cl9md190cmFjZV9n
cm91cF9tYXNrX2ZvcHMnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJp
YWJsZT1dDQo+ICAgICAgMjA1IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMg
cHZyX2Z3X3RyYWNlX2dyb3VwX21hc2tfZm9wcyA9IHsNCj4gICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+
IA0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMTEzMDIwNTQu
TVZZUHhGQ0UtbGtwQGludGVsLmNvbS8NCj4gRml4ZXM6IGM5OGNjOTJhYjZjZSAoImRybS9pbWFn
aW5hdGlvbjogQWRkIGZpcm13YXJlIHRyYWNlIHRvIGRlYnVnZnMiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBEb25hbGQgUm9ic29uIDxkb25hbGQucm9ic29uQGltZ3RlYy5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9md190cmFjZS5jIHwgNDQgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZndfdHJhY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZndfdHJhY2UuYw0KPiBpbmRleCA4N2E0MmZi
NmFjZTYuLjMwZjQxYTEwYTBjZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9md190cmFjZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlv
bi9wdnJfZndfdHJhY2UuYw0KPiBAQCAtMTY3LDUwICsxNjcsNiBAQCB1cGRhdGVfbG9ndHlwZShz
dHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldiwgdTMyIGdyb3VwX21hc2spDQo+IA0KPiAgI2lmIGRl
ZmluZWQoQ09ORklHX0RFQlVHX0ZTKQ0KPiANCj4gLXN0YXRpYyBpbnQgZndfdHJhY2VfZ3JvdXBf
bWFza19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gLXsNCj4gLSAgICAg
ICBzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldiA9IG0tPnByaXZhdGU7DQo+IC0NCj4gLSAgICAg
ICBzZXFfcHJpbnRmKG0sICIlMDh4XG4iLCBwdnJfZGV2LT5md19kZXYuZndfdHJhY2UuZ3JvdXBf
bWFzayk7DQo+IC0NCj4gLSAgICAgICByZXR1cm4gMDsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGlu
dCBmd190cmFjZV9ncm91cF9tYXNrX29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZp
bGUgKmZpbGUpDQo+IC17DQo+IC0gICAgICAgcmV0dXJuIHNpbmdsZV9vcGVuKGZpbGUsIGZ3X3Ry
YWNlX2dyb3VwX21hc2tfc2hvdywgaW5vZGUtPmlfcHJpdmF0ZSk7DQo+IC19DQo+IC0NCj4gLXN0
YXRpYyBzc2l6ZV90IGZ3X3RyYWNlX2dyb3VwX21hc2tfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUs
IGNvbnN0IGNoYXIgX191c2VyICp1YnVmLCBzaXplX3QgbGVuLA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxvZmZfdCAqb2ZmcCkNCj4gLXsNCj4gLSAgICAgICBz
dHJ1Y3Qgc2VxX2ZpbGUgKm0gPSBmaWxlLT5wcml2YXRlX2RhdGE7DQo+IC0gICAgICAgc3RydWN0
IHB2cl9kZXZpY2UgKnB2cl9kZXYgPSBtLT5wcml2YXRlOw0KPiAtICAgICAgIHUzMiBuZXdfZ3Jv
dXBfbWFzazsNCj4gLSAgICAgICBpbnQgZXJyOw0KPiAtDQo+IC0gICAgICAgZXJyID0ga3N0cnRv
dWludF9mcm9tX3VzZXIodWJ1ZiwgbGVuLCAwLCAmbmV3X2dyb3VwX21hc2spOw0KPiAtICAgICAg
IGlmIChlcnIpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiAtDQo+IC0gICAgICAg
ZXJyID0gdXBkYXRlX2xvZ3R5cGUocHZyX2RldiwgbmV3X2dyb3VwX21hc2spOw0KPiAtICAgICAg
IGlmIChlcnIpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiAtDQo+IC0gICAgICAg
cHZyX2Rldi0+ZndfZGV2LmZ3X3RyYWNlLmdyb3VwX21hc2sgPSBuZXdfZ3JvdXBfbWFzazsNCj4g
LQ0KPiAtICAgICAgIHJldHVybiAoc3NpemVfdClsZW47DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBj
b25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHB2cl9md190cmFjZV9ncm91cF9tYXNrX2ZvcHMg
PSB7DQo+IC0gICAgICAgLm93bmVyID0gVEhJU19NT0RVTEUsDQo+IC0gICAgICAgLm9wZW4gPSBm
d190cmFjZV9ncm91cF9tYXNrX29wZW4sDQo+IC0gICAgICAgLnJlYWQgPSBzZXFfcmVhZCwNCj4g
LSAgICAgICAud3JpdGUgPSBmd190cmFjZV9ncm91cF9tYXNrX3dyaXRlLA0KPiAtICAgICAgIC5s
bHNlZWsgPSBkZWZhdWx0X2xsc2VlaywNCj4gLSAgICAgICAucmVsZWFzZSA9IHNpbmdsZV9yZWxl
YXNlLA0KPiAtfTsNCj4gLQ0KPiAgc3RydWN0IHB2cl9md190cmFjZV9zZXFfZGF0YSB7DQo+ICAg
ICAgICAgLyoqIEBidWZmZXI6IFBvaW50ZXIgdG8gY29weSBvZiB0cmFjZSBkYXRhLiAqLw0KPiAg
ICAgICAgIHUzMiAqYnVmZmVyOw0KPiAtLQ0KPiAyLjI1LjENCj4gDQo=
