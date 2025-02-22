Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058FA40837
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 13:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276CA10E277;
	Sat, 22 Feb 2025 12:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="GVl1SlyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010008.outbound.protection.outlook.com [52.103.67.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257710E277
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 12:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG4mBwcC1dBLW5DEG4H70haVoTt89PbOeUz47IlkOYjvEeU0PnlxXdZY5fMNzW0wOFxtXHNeXnTbf/n0+gF+TkzxrkTH5pSC4PJEStc2LRT3s5JH0KYyBlmc2Pu5ueMmm8qTEKedSIlwbqq1Z78eh0Ubk/SA5LUfGwaJ8yDp5WpwBRomeorV4uhArF5e93mV/8pMY4NiXJRrDvgZV6AulSe2bf+03teJJ77aH9lu1UwX52eL6ExILRInST0QmTxlri8jvla5V5QYZDVJDb+3gEpXY9iAXn86BW3il3TtpZvMfSP4KIxLOodoQiCyTvAxjOUSjx+dCRA/PpmvthZYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FcxkHsRAL/hdnUmAJHRYqZorL7W5/PtSYXXh0hQMSc=;
 b=UED7eMYW/a0CpoLaHDTNZEVJbRV4ng7/QCBjk+WMKQrr8cFu4V1LkQ8yPcIF+mkeeP8nezdjtWup6VoeQCgYHIlrhZO3+Oz3JtodoIm9u4ljanR5Dr/uV5FIuKnvKgbMa5HkoT2C/0fMjtkHYEwwqX9yll5jZJ8J/8sw84k6VbXobVXfjuAHpyG/7SzfFcxE2RS2HIt90e2FWHYKFqj6xq8HpLdlfaMI2pfukUWNqByz8gK5OMgpUiPfawE8mByNkgWg/2Fu/g2It7fL5Gj3o3v66OqWJt2nvDB7DwU2jw8W24Vz3Vs70RpU4ipWmO0AZPb4q70Y42ecBovb/D/YkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FcxkHsRAL/hdnUmAJHRYqZorL7W5/PtSYXXh0hQMSc=;
 b=GVl1SlyMUcYlf7EHGk71yCWIpkmnwzozwuaOm5lRp2mfowG+ssNAEqTFYoNEjO3rj1pFhJEHvQAtFBWsMP6O03HJhp/g3RnFceIn/prIBMBUPPnhbQwkMt9IPtUvBNjVHNse1AWEYEHwGRPzcF16wG8TWp0h4tqPeUiUUxFftNaWolkRAhSvSDaNBhgrQUG6nY5Gq459bpedQXxUhicsZvpGtwpwTYzYPmefpi5xEUOGkVTQ82n8Zk214wDeqonPCJYAIKW8jFit8wues1VrpbRkqwg6W0x3pP892qw0hSMQB80DBs+utLefMar5oqtEjgiyS7fjiKk2KYxKCXiL1g==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PR01MB10260.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 12:11:01 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 12:11:01 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com"
 <kekrby@gmail.com>, "admin@kodeit.net" <admin@kodeit.net>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, "evepolonium@gmail.com"
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NR4q0AgAFbhYA=
Date: Sat, 22 Feb 2025 12:11:00 +0000
Message-ID: <03136A04-5D00-4A67-9837-1F382CD54913@live.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
In-Reply-To: <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PR01MB10260:EE_
x-ms-office365-filtering-correlation-id: 2bab0b6d-bfdb-4c40-fa30-08dd5339f8dd
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|7092599003|461199028|15080799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?RXRlaCtCWFE2ZllRUTFLajdhZ1JjcFpsSUs3MDZRMjFuNFIvZmx0YWNLNTNw?=
 =?utf-8?B?R05UVWY5WnVoMTlKaldaY01DTkNFczZIVklqenFZYjFUMVg5WGJsRzlxS2pC?=
 =?utf-8?B?eXhPVWw4WDNrQTdtZU5xbUZIdUVaN3pQbXhzR25yVlc4NXBTTlFvd0d4Sk9n?=
 =?utf-8?B?L01oYUhJbzJyUWtCQThZUHJMSHNXcG1Ia2p6ZE9JY0paTVJvSHlaOWhGczhL?=
 =?utf-8?B?RkVFdmFjL29CdWJWNnIxdk9rcmduQ2E2TGt6L2Vvd2tUVk51RDg5cDJVbXl1?=
 =?utf-8?B?d3FiL3FTTkJmQTJSdG1lb0E3Yi9LVlM5OE5vTjg4T2FsTmxDUEdNMTNKanZ3?=
 =?utf-8?B?ODVRUnNIMkZtMmYzcVZROHk0cmU1Wlk2Q1JDb0RuMXRSZVRkazR4d1dPNjVm?=
 =?utf-8?B?TU51OStENWhaQVhXRkZ2UmhFK3pEeGNES094SWJMU2FKVnVnNUsyZjlQTkdB?=
 =?utf-8?B?US9zbEZvWHJqU3NRTmpVT0loRFU2eFZCaVdIOHVLNVJhcTZYV0hnSVUxd2NH?=
 =?utf-8?B?SURwaTYyRXQ1UmVxQ1k0YU9uVk5iLzRrdk1LWFBnc0NHanQzSTRsblJRenR0?=
 =?utf-8?B?NWI5emtpdjAzRnB5NVFhdExCaGNiZnJ2WmRNb1hCRTJxVzUzSFc2M0VzT0Zp?=
 =?utf-8?B?SjdqeVBOMWNFdFdyNFpCWDFXV3lPSXJOTE0wdUFEclYyNDFnQnM5NHRsMGFi?=
 =?utf-8?B?TklTMDhYRjJXeEpxTEs2UmRzM1g1WHFtTCtPSS9ZdGRacDdrMXlneWhydDhx?=
 =?utf-8?B?b1llS3IzN01SS0M2UmFKakJnY3EyaXBoVmhJVjF3c0c4YXNpWnB1TFpJYVcz?=
 =?utf-8?B?bHFjeUkvb05maWpNdUxtUEt4c1RkMG5ER29EelROalNCektKK1M0dXFueDRt?=
 =?utf-8?B?Q1ZKQ09EYWJ6SnpIeVNqN0l3OUNzdHRrWVZXT1RUL050RmdXdmh0WExFRHFY?=
 =?utf-8?B?dmdySWJSa0Vya2lGand2MjFndTNIQ2FzbXZMd3JIUUVoSTlzM2VrZ3hsa1FZ?=
 =?utf-8?B?NUlOL0VqS3V3Z3htd1R2L0ZoU1Rvb3R1NUZlVEN0SURwVlplR3U3djY3UjZz?=
 =?utf-8?B?Y2hpaTJDdWhQTkpsQzFmTUQ0ZTB2bHN4anNoQ0hHWGFMTFlaeVRqMW9Uempv?=
 =?utf-8?B?WW9VbkI3KzZnSTExYStEUHF5RnhXSUNBemc3K3VUejdvRDFhZnd2L0k2OXlw?=
 =?utf-8?B?N2l2OUJLT0pDakJZTVpMdWVoUnA2V3JuWjducUE0SytUMlE1QnBIMW80SWtM?=
 =?utf-8?B?S3dUOGVYV3d5Z3d6NEtXQWo5ZU1nK0hZdXdGdFNBTGo2Y002QlEvL2IwUjRC?=
 =?utf-8?B?UVJySGdSbWgvOEJESnFSNVVZMU1Ld2VZOGdiZTJIdlZnS3B4V3lyVm81VWhN?=
 =?utf-8?B?UFUyci9NSnBCRUhTOUN0SHd0bng2VEk5eGxNRXEzN2kza3lyeWQ2ejIyRmNH?=
 =?utf-8?B?OS9oNmc1b29aMG50UlB2RGdBeEpPNmNRV01oZTdGTUpRSWJ0YWNLQ2ZJa254?=
 =?utf-8?Q?kkq+DA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNMNmhlbGZ2UzdtRS9zMFVKb1JFV2lSOVB3WTlaUkxyL3ZLK2djbnpCOVdt?=
 =?utf-8?B?RXhiRVZJQlNYdVA5SjgzRzdsYnVabE1nd0VRWkJwWlMxbXRpWVdRWEV5M2NI?=
 =?utf-8?B?Tm16NXFPUDIvd3dHQ2FrZjlwa2JJYi9HdmxjaTFZWG92ekYwdHJWK1pGUHd0?=
 =?utf-8?B?NlhueC9hNjdDUHJaWEdBTDE1bk95QjZCRUhaWXNzeGpKNjB1K3lGcXNoazVu?=
 =?utf-8?B?UGduQ3k1Z1NORXdQZGNyVmt0OEtLRmpOTU1ucE9BcXgvNTkyWUIrTzdSV2h3?=
 =?utf-8?B?dzdwVktvRnA5d2JUMGFibGpoWjhkczByTWpvaG1IczFBclRJRlFBdkhtNlNL?=
 =?utf-8?B?R0crM1lrdzQ0LzkydVRHbzFRYVdsZkRIRVBHV21GbmtMTEJLbzI0bnAwUnds?=
 =?utf-8?B?WVYrSy9IQzBaNEM3MEJ4d01IWk5wSmZIdDVqTTQxUVo2TmRsMVdGRmpCTUdy?=
 =?utf-8?B?TzBraEY5RzlEaDViSEtXQzExb0dsWXE1aDNtMVB3ZmYyUmdVSW0xSmVlQ1Uy?=
 =?utf-8?B?bmU0dW54S3llWCtzclZLenRZZTZJSEFyREE3Q2lJdzVqaVVJcDRsSE9yQXlq?=
 =?utf-8?B?aGJubVkyRlBCeGZ1bDBtU2hxNXhnekIrMHNzZExrcGtBOURFMEtaT2FISjVK?=
 =?utf-8?B?bjh3NlBXVCtOSXlnZDZRMW81MjdJZ2lMN0w2T1NLNU1LaExsbythS2FoQjZN?=
 =?utf-8?B?V3JmUm5va2Y5VXl3Q3ViUUMwYzc3Z0UwUXN2Z2VGcVVPdjRLN2tHZmF1dExZ?=
 =?utf-8?B?OElTbnIvMFBFUC9QVDZqZGovUm9rd1UwdHdYc1pOKzIzZUFzTGtmYjRyc0dH?=
 =?utf-8?B?dVlxNTFHWUt6ZHVIYlB5RWRWNEFIK0h0eTFCS0VkNUdpOUIyN0M1Ungvczhi?=
 =?utf-8?B?Z2ZYTHo4d2o5NFpWZy8xazFXT0F5S0U3MWd6eW5BRjhFZi9EVGR2Uld1bDds?=
 =?utf-8?B?NlNZZWl0aW4rRUl5Ui9jalJWWXJ0TGg4TFB2Z1ptelYxVGw0V0ZmZDFvemtK?=
 =?utf-8?B?NVg0V0RDUVE1eDVBQU9KRkQyQWhoZEpDWERBSjM1U3BnQUlJY0ZmM3pTOC9V?=
 =?utf-8?B?MGRkczlVUDdYZFMwS2JzdU81OVB1Z3FIRWkyWGJBeWJIZEp5NWtxRDQzTzNR?=
 =?utf-8?B?eUJmTlhiaUFIWnIrWGs1SXk4d3FlY0F6dmNwb01XVTBzanpQMzdsZCtiY2Jp?=
 =?utf-8?B?Q1Y2NEZjNE5QalBXY3Z5dmdPU0MvbHhmM1N1TkJrNGxKR3VieTVOWEZEdEp5?=
 =?utf-8?B?ZFY3TU10QUV2RUlZZTFDRTUzOW5FVmlwR3lOaE16M21jWlNlbFJIVythV2Q5?=
 =?utf-8?B?L0psdkx1djJPTWxEV0RXelg4VitHV3FIYi95d2w4WGVROHNCanl4U09pcGU5?=
 =?utf-8?B?OTE4SmMzMXlaMDZBVzRHakxWUWUwR29DRU1lSFNTMGxQRUFQbjdaVWJCK0RP?=
 =?utf-8?B?Y0UwbFZDVHlXcEpadkFMdmxLc1hpaWtrZlhZWXlWUTNyczJmaFU3M1VTcG41?=
 =?utf-8?B?bHM1M05HMTJ5MHdVZzRJaTc0RWQzMHRYU3dYVFBnUkxEZmNhV21QaEZlVFg2?=
 =?utf-8?B?K2k1YjEyOE5peVJscGRUMlExQWsxRGhvcU5rZVErcnhFS2ltVnZzZm9URC8r?=
 =?utf-8?B?dy9GTEo4QVJQNHk1N1l0S0R0MEtiRDRkV2NRejNxa0xqSzVTOGFnTHhWZFl1?=
 =?utf-8?B?TTdQZ2d4RW5FRHZjU25UcUU4UkpZOWxEUFI2aFhjYjZEVFQrL1VGemZwczVN?=
 =?utf-8?Q?tEvaM1GUvDYDxGx90+F6YIiaFknsuREDREEGUzF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A20B3BCC12765478168C1AD23AFE4F5@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bab0b6d-bfdb-4c40-fa30-08dd5339f8dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 12:11:00.9751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB10260
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gMjEgRmViIDIwMjUsIGF0IDg6NTfigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMDQ6Mzk6
MjNQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9tOiBIZWN0b3IgTWFydGluIDxt
YXJjYW5AbWFyY2FuLnN0Pg0KPj4gDQo+PiAlcDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0TDIg
Rk9VUkNDcyB3aXRoIHRoZWlyIHNwZWNpZmljIHF1aXJrcywgYnV0DQo+PiBpdCdzIHVzZWZ1bCB0
byBiZSBhYmxlIHRvIHByaW50IGdlbmVyaWMgNC1jaGFyYWN0ZXIgY29kZXMgZm9ybWF0dGVkIGFz
DQo+PiBhbiBpbnRlZ2VyLiBFeHRlbmQgaXQgdG8gYWRkIGZvcm1hdCBzcGVjaWZpZXJzIGZvciBw
cmludGluZyBnZW5lcmljDQo+PiAzMi1iaXQgRk9VUkNDcyB3aXRoIHZhcmlvdXMgZW5kaWFuIHNl
bWFudGljczoNCj4+IA0KPj4gJXA0Y2ggICBIb3N0LWVuZGlhbg0KPj4gJXA0Y2wgTGl0dGxlLWVu
ZGlhbg0KPj4gJXA0Y2IgQmlnLWVuZGlhbg0KPj4gJXA0Y3IgUmV2ZXJzZS1lbmRpYW4NCj4+IA0K
Pj4gVGhlIGVuZGlhbm5lc3MgZGV0ZXJtaW5lcyBob3cgYnl0ZXMgYXJlIGludGVycHJldGVkIGFz
IGEgdTMyLCBhbmQgdGhlDQo+PiBGT1VSQ0MgaXMgdGhlbiBhbHdheXMgcHJpbnRlZCBNU0J5dGUt
Zmlyc3QgKHRoaXMgaXMgdGhlIG9wcG9zaXRlIG9mDQo+PiBWNEwvRFJNIEZPVVJDQ3MpLiBUaGlz
IGNvdmVycyBtb3N0IHByYWN0aWNhbCBjYXNlcywgZS5nLiAlcDRjciB3b3VsZA0KPj4gYWxsb3cg
cHJpbnRpbmcgTFNCeXRlLWZpcnN0IEZPVVJDQ3Mgc3RvcmVkIGluIGhvc3QgZW5kaWFuIG9yZGVy
DQo+PiAob3RoZXIgdGhhbiB0aGUgaGV4IGZvcm0gYmVpbmcgaW4gY2hhcmFjdGVyIG9yZGVyLCBu
b3QgdGhlIGludGVnZXINCj4+IHZhbHVlKS4NCj4gDQo+IC4uLg0KPiANCj4+IG9yaWcgPSBnZXRf
dW5hbGlnbmVkKGZvdXJjYyk7DQo+PiAtIHZhbCA9IG9yaWcgJiB+QklUKDMxKTsNCj4+ICsgc3dp
dGNoIChmbXRbMl0pIHsNCj4+ICsgY2FzZSAnaCc6DQo+PiArIHZhbCA9IG9yaWc7DQo+PiArIGJy
ZWFrOw0KPj4gKyBjYXNlICdyJzoNCj4+ICsgb3JpZyA9IHN3YWIzMihvcmlnKTsNCj4+ICsgdmFs
ID0gb3JpZzsNCj4+ICsgYnJlYWs7DQo+PiArIGNhc2UgJ2wnOg0KPiANCj4+ICsgb3JpZyA9IGxl
MzJfdG9fY3B1KG9yaWcpOw0KPj4gKyB2YWwgPSBvcmlnOw0KPj4gKyBicmVhazsNCj4+ICsgY2Fz
ZSAnYic6DQo+PiArIG9yaWcgPSBiZTMyX3RvX2NwdShvcmlnKTsNCj4gDQo+IEkgZG8gbm90IHNl
ZSB0aGF0IG9yaWcgaXMgYSB1bmlvbiBvZiBkaWZmZXJlbnQgdHlwZXMuIEhhdmUgeW91IHJ1biBz
cGFyc2U/DQo+IEl0IHdpbGwgZGVmaW5pdGVseSBjb21wbGFpbiBvbiB0aGlzIGNvZGUuDQoNCkFm
dGVyIG1lc3NpbmcgYXJvdW5kIHdpdGggdGhpcywgd2hhdCBJ4oCZdmUgbm90aWNlZCBpcyB0aGF0
IG9yaWcgYW5kIHZhbCB1c2VkIGluIHRoaXMgc3RydWN0IHNob3VsZCBiZSB1MzIuIE5vdyBpbiBj
YXNlIG9mIGxpdHRsZSBlbmRpYW4gYW5kIGJpZyBlbmRpYW4sIHRoYXQgdGhpbmdzIGFyZSBtZXNz
eS4gVGhlIG9yaWdpbmFsIGNvZGUgYnkgSGVjdG9yIHdhcyB1c2luZyBsZTMyX3RvX2NwdSBvbiBv
cmlnLCB3aGljaCBpdHNlbGYgaXMgZGVjbGFyZWQgYXMgYSB1MzIgaGVyZSAobWF5YmUgd2FzIGRv
bmUgd2l0aCB0aGUgaW50ZW50aW9uIHRvIGNvbnZlcnQgbGUzMiBvcmlnIHRvIHUzMiBvcmlnPyku
DQoNCkFueXdheXMsIHdoYXQgSSBoYXZlIGRvbmUgaXMgdGhhdDoNCg0KMS4gRGVjbGFyZSBuZXcg
dmFyaWFibGUsIG9yaWdfbGUgd2hpY2ggaXMgX19sZTMyLg0KMi4gSW5zdGVhZCBvZiBkb2luZyBv
cmlnID0gbGUzMl90b19jcHUob3JpZyk7ICwgd2UgY2FuIGRvIG9yaWdfbGUgPSBjcHVfdG9fbGUz
MihvcmlnKS4gVGhpcyBmaXhlcyB0aGUgc3BhcnNlIHdhcm5pbmc6IGNhc3QgdG8gcmVzdHJpY3Rl
ZCBfX2xlMzINCjMuIE5vdyB0aGUgb3JpZ2luYWwgY29kZSB3YXMgaW50ZW5kaW5nIHRvIHVzZSB2
YWw9b3JpZz1sZTMyX3RvX2NwdShvcmlnKSBhdCB0aGUgYm90dG9tIHBhcnQgb2YgdGhpcyBzdHJ1
Y3QuIFRob3NlIHBhcnRzIGFsc28gcmVxdWlyZSB2YWwgYW5kIG9yaWcgdG8gYmUgdTMyLiBGb3Ig
dGhhdCwgd2UgYXJlIG5vdyB1c2luZyBsZTMyX3RvX2NwdShvcmlnX2xlKS4gU2luY2UgdmFsIGlz
IHNhbWUgYXMgb3JpZywgaW4gY2FzZSB0aGVzZSBjYXNlcywgaW5zdGVhZCBvZiBtYWtpbmcgYSB2
YWxfbGUsIEnigJl2ZSBzaW1wbHkgdXNlZCBvcmlnX2xlIHRoZXJlIGFzIHdlbGwuDQoNClNpbWls
YXIgY2hhbmdlcyBkb25lIGZvciBiaWcgZW5kaWFuLg0KDQpTbywgdGhlIHN0cnVjdCBsb29rcyBs
aWtlIHRoaXMgbm93Og0KDQpzdGF0aWMgbm9pbmxpbmVfZm9yX3N0YWNrDQpjaGFyICpmb3VyY2Nf
c3RyaW5nKGNoYXIgKmJ1ZiwgY2hhciAqZW5kLCBjb25zdCB1MzIgKmZvdXJjYywNCgkJICAgIHN0
cnVjdCBwcmludGZfc3BlYyBzcGVjLCBjb25zdCBjaGFyICpmbXQpDQp7DQoJY2hhciBvdXRwdXRb
c2l6ZW9mKCIwMTIzIGxpdHRsZS1lbmRpYW4gKDB4MDEyMzQ1NjcpIildOw0KCWNoYXIgKnAgPSBv
dXRwdXQ7DQoJdW5zaWduZWQgaW50IGk7DQoJdW5zaWduZWQgY2hhciBjOw0KCWJvb2wgcGl4ZWxf
Zm10ID0gZmFsc2U7DQoJdTMyIG9yaWcsIHZhbDsNCglfX2xlMzIgb3JpZ19sZTsNCglfX2JlMzIg
b3JpZ19iZTsNCg0KCWlmIChmbXRbMV0gIT0gJ2MnKQ0KCQlyZXR1cm4gZXJyb3Jfc3RyaW5nKGJ1
ZiwgZW5kLCAiKCVwND8pIiwgc3BlYyk7DQoNCglpZiAoY2hlY2tfcG9pbnRlcigmYnVmLCBlbmQs
IGZvdXJjYywgc3BlYykpDQoJCXJldHVybiBidWY7DQoNCglvcmlnID0gZ2V0X3VuYWxpZ25lZChm
b3VyY2MpOw0KCXN3aXRjaCAoZm10WzJdKSB7DQoJY2FzZSAnaCc6DQoJCXZhbCA9IG9yaWc7DQoJ
CWJyZWFrOw0KCWNhc2UgJ3InOg0KCQlvcmlnID0gc3dhYjMyKG9yaWcpOw0KCQl2YWwgPSBvcmln
Ow0KCQlicmVhazsNCgljYXNlICdsJzoNCgkJb3JpZ19sZSA9IGNwdV90b19sZTMyKG9yaWcpOw0K
CQlicmVhazsNCgljYXNlICdiJzoNCgkJb3JpZ19iZSA9IGNwdV90b19iZTMyKG9yaWcpOw0KCQli
cmVhazsNCgljYXNlICdjJzoNCgkJLyogUGl4ZWwgZm9ybWF0cyBhcmUgcHJpbnRlZCBMU0ItZmly
c3QgKi8NCgkJdmFsID0gc3dhYjMyKG9yaWcgJiB+QklUKDMxKSk7DQoJCXBpeGVsX2ZtdCA9IHRy
dWU7DQoJCWJyZWFrOw0KCWRlZmF1bHQ6DQoJCXJldHVybiBlcnJvcl9zdHJpbmcoYnVmLCBlbmQs
ICIoJXA0PykiLCBzcGVjKTsNCgl9DQoNCglmb3IgKGkgPSAwOyBpIDwgc2l6ZW9mKHUzMik7IGkr
Kykgew0KCQlzd2l0Y2ggKGZtdFsyXSkgew0KCQljYXNlICdoJzoNCgkJY2FzZSAncic6DQoJCWNh
c2UgJ2MnOg0KCQkJYyA9IHZhbCA+PiAoKDMgLSBpKSAqIDgpOw0KCQkJYnJlYWs7DQoJCWNhc2Ug
J2wnOg0KCQkJYyA9IGxlMzJfdG9fY3B1KG9yaWdfbGUpID4+ICgoMyAtIGkpICogOCk7DQoJCQli
cmVhazsNCgkJY2FzZSAnYic6DQoJCQljID0gYmUzMl90b19jcHUob3JpZ19iZSkgPj4gKCgzIC0g
aSkgKiA4KTsNCgkJCWJyZWFrOw0KCQl9DQoNCgkJLyogUHJpbnQgbm9uLWNvbnRyb2wgQVNDSUkg
Y2hhcmFjdGVycyBhcy1pcywgZG90IG90aGVyd2lzZSAqLw0KCQkqcCsrID0gaXNhc2NpaShjKSAm
JiBpc3ByaW50KGMpID8gYyA6ICcuJzsNCgl9DQoNCglpZiAocGl4ZWxfZm10KSB7DQoJCSpwKysg
PSAnICc7DQoJCXN0cmNweShwLCBvcmlnICYgQklUKDMxKSA/ICJiaWctZW5kaWFuIiA6ICJsaXR0
bGUtZW5kaWFuIik7DQoJCXAgKz0gc3RybGVuKHApOw0KCX0NCg0KCSpwKysgPSAnICc7DQoJKnAr
KyA9ICcoJzsNCg0KCXN3aXRjaCAoZm10WzJdKSB7DQoJY2FzZSAnaCc6DQoJY2FzZSAncic6DQoJ
Y2FzZSAnYyc6DQoJCXAgPSBzcGVjaWFsX2hleF9udW1iZXIocCwgb3V0cHV0ICsgc2l6ZW9mKG91
dHB1dCkgLSAyLCBvcmlnLCBzaXplb2YodTMyKSk7DQoJCWJyZWFrOw0KCWNhc2UgJ2wnOg0KCQlw
ID0gc3BlY2lhbF9oZXhfbnVtYmVyKHAsIG91dHB1dCArIHNpemVvZihvdXRwdXQpIC0gMiwgbGUz
Ml90b19jcHUob3JpZ19sZSksIHNpemVvZih1MzIpKTsNCgkJYnJlYWs7DQoJY2FzZSAnYic6DQoJ
CXAgPSBzcGVjaWFsX2hleF9udW1iZXIocCwgb3V0cHV0ICsgc2l6ZW9mKG91dHB1dCkgLSAyLCBi
ZTMyX3RvX2NwdShvcmlnX2JlKSwgc2l6ZW9mKHUzMikpOw0KCQlicmVhazsNCgl9DQoNCgkqcCsr
ID0gJyknOw0KCSpwID0gJ1wwJzsNCg0KCXJldHVybiBzdHJpbmcoYnVmLCBlbmQsIG91dHB1dCwg
c3BlYyk7DQp9DQoNCkFuZHksIGNvdWxkIHlvdSB2ZXJpZnkgdGhpcz8NCg0K
