Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CAA41DE7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 12:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E2010E2C9;
	Mon, 24 Feb 2025 11:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="aVjSrwEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011039.outbound.protection.outlook.com
 [52.103.67.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2010E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dnw1FdZvutv4csTrAp7ithON8GpoKysOe19dCPuDKsCYP5fcEzvh4z33l9pTxqryfjn3NFCF1Ejqvt9AN3VLXTdmlk0+uhegVm4dDrudsUzxlvMsLKZ6xyRdaAV/RNVHexNq0fUtTAefoGAtNnh/SPvC3R70BvzkDYY1BEDC8VnXBSfH+dFoKWgxQ6ZVGMhu0IUQ/OtQRWjzx7IK3fKnE0GdVYMklOTwXWcHPqbt/vx9hCtOUgmasOrk/06DDS/2ZgLpifDHZbNfPAQEZuAYgzu7UyAozl4W2TDYTbFqmpENEoTTBWCMIKocy7OAuYAcjda/YYnCwX2b1g7h2w2QvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rux+U3xU4MQaX0tj0gPtFQz/BC9Dt+THR6PmEcHcIj0=;
 b=nbA3foCvuT8WY5E1v3h6+MbqfqkQ42HlS3sXvdis54Np56TXRWgMcDkKMCBHNiUbPVvf3D2p1eDTxiK5+3ZDnnJpKf0gZGdtPaCif2yZifYGtxmdqCEGmbGOB6UY6h/xVT2DRVXzRMsMCOUKTuHCUO0TgAaOkXA9Rak4na6/ileJ3JIUGaOHEOObvkdQEM6AoCDHpPQP3ZpV/k2Kto3RFWGyaBrAhZzZNVYtMIRuXlNyymJeR0N8LiTgDThVnArTdbHQDSuFj03Tn3xPgFuf1PEyVwZ3+JQgbgDMTTvofW2yD+pb0uAnM86+msO8l7pfozICteDz+osUnYoYvcc9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rux+U3xU4MQaX0tj0gPtFQz/BC9Dt+THR6PmEcHcIj0=;
 b=aVjSrwEltHMt/zQ8/p33jJdKy/PDA2sOc35F2POhGkDflm0FQkq8eJFxKxIfb1OniLEJ7dP7PrtV33l9PQEpYvyuoXeIiW8KRKoI8OFUEQvj6FdXdRJvHZCNnp/aDBHZ8JFp8sGwxHxHDQ4Vcc406ZYheBfXH4bDpP0zrXS7g+YfAJQOG4S+8DWw+BhR9MnxecImLHn8s1o9Azx2Kd+QqPUVm0PouAJjQGKtoQyPEDRo6zSNK1RXQFyykpGWmhjrsCLvVo7EboHqp8h7aCXvO6Z9vU8oA2ny4VeL+yOk5j7fFpAu6xqqz5V3ho+g8bQ+Np6/Qw1GKOs2lx7cWX4CCw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB8004.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:8f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 11:57:47 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 11:57:47 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>, "pmladek@suse.com"
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi
 <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>, Atharva
 Tiwari <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhFUNsu7CitoQSEyg6//EGVnJDbNR53mAgAA5FACAABkMgIAA0A4AgAMdi4CAABJLAIAAGe2AgAAGWoCAAAQ1Iw==
Date: Mon, 24 Feb 2025 11:57:47 +0000
Message-ID: <PN3PR01MB95974767785F92606B5EA96EB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
 <6f7b0886-5f31-4ba9-b82e-e9d3614b504f@suse.de>
 <Z7xAINooeB7zpnhf@smile.fi.intel.com>
 <3AC583EA-AA74-4F75-ADB9-3270519E8448@live.com>
 <Z7xbM_8fV4MT_TJ0@smile.fi.intel.com>
In-Reply-To: <Z7xbM_8fV4MT_TJ0@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB8004:EE_
x-ms-office365-filtering-correlation-id: 6928323a-d972-4faa-76c8-08dd54ca74b0
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|461199028|7092599003|8060799006|6072599003|8062599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?VTRkcmRDUGI4OTZLZ0gwbnJGTE1GaDRQQUl0L1R5QlZVUlNPOC91SUdTQXNu?=
 =?utf-8?B?OHJQMFhXQ0JmeE1JT2g1K29lQXB6NnVEdmlqRjlPNGp3dS9oeDVSalJpSzNP?=
 =?utf-8?B?OTRDU3VCdGR2S0VuTUk0ZWRiZTJSRWo2eklCeWN2azRwWkxra0ZCNTdLMGtx?=
 =?utf-8?B?UU9JWWcveFNxcHdjTkF6Uzh6WFg5RVlmRVdZZU51Z0ZiS0ViSHZsVGl4a29I?=
 =?utf-8?B?NFV4eGxLSzlJVzJkZm9rOXhPYXJFQzNCcEl4WnFDRENiWUJ5TmRRQjh0U282?=
 =?utf-8?B?UU9NVHE0WlpWTjA2ZmFrQnlhN2I5Nm03cHZidjM4ci8vT0VZeWl6cm9kU3dP?=
 =?utf-8?B?bFJZVENSODRIdzQvUGJTOWc5OXowYjltTkU5TmdYOHA4S0dMMWxycVFYb3lD?=
 =?utf-8?B?NWRkWFVuV3MvVVV0R2lJN2FEVkVucHdmSmFCT2tEL1kvYTBHVGFVYU12bG1L?=
 =?utf-8?B?aGh4NmpXN3dWcWs5UGVlbEF1TXlGdStIcG5seHlXVDlUTjJDcXVLNitCUW1F?=
 =?utf-8?B?UHJxaVBLR1grNFR3dGwyYzh4QVN3dGZDektTVkM3ejl2amZsR3FZMTBDOW0y?=
 =?utf-8?B?OXFsVVhYQVFQQWVvRWxjK3MzV2dkbnFxcXlnMm16N29oOXdHaHFiMjB3VFhG?=
 =?utf-8?B?TVBGSE1BQ3E5YzJoVWpwYjJmaE0ybDNTR1hsU05TUkx4K1ZSV2wxWldMOStJ?=
 =?utf-8?B?ZkZSd0NHWENTNDJyRThtY0dFNUFOa3VoZmVQK3NDdVJ1UEQ3dXRsTEZLVEty?=
 =?utf-8?B?SmUycDIrSDhnSWxqOENCNTlMbEl2UktBN1U1d2MrdFBYNDZqSXovNGlib1dW?=
 =?utf-8?B?ZHBBTmdJT3ovVHNxS2E0dFYxMnBCbzE1NUFtbjNBTDVLa1RVTVVsd29qdE93?=
 =?utf-8?B?V0tyRmNiTFdOc1FMeVUvYWtVR3ZlMWU3eGFFaThCZkpuL1ZPL3gySjAyRVlM?=
 =?utf-8?B?L3BvTktLYTIrSGlpMzhQbDFEWHFIV29HZTRQY042M01KRlpPSTk0M1MwZFRU?=
 =?utf-8?B?M0V5ajl6ekpiL3FwQmQ0U3RxdHcwWmVnTHdkQWRZQmQ0eEwzb2xkS1oyRXpN?=
 =?utf-8?B?SkRkcW5Wb0hpYk5qMGczVDNIZzV2aGVZZ1FRNmZ6NVZlTWhqZW40TFVjbnFn?=
 =?utf-8?B?UEh6ZkFNRkpoRjZyU2dBczN0eWI1UTcyZmh6V0Q4NXJLTWNza0tPSzBjQVBs?=
 =?utf-8?B?WUJzZ1lGbmZDYlBpUC92KzF6MGFxaEltT3RUVkpkY3EvTnV0eHJhdThDRU90?=
 =?utf-8?B?ZkRTM2pYamd6U3gxOENvaEtnU3pBMkNucDJTNnZkRzNycnU1VGRFVElaNHRN?=
 =?utf-8?B?dHBpSFd6dlRtUmRkQ3Rra3pURzRCMWc1QmFNMzhRTVdMVysxM0ZES3YvQTlT?=
 =?utf-8?B?bFVhVktvMU9EcFFRamROcmExT1RVMVVLdnBOeUx0allqcXJCNkorQ2JNbkky?=
 =?utf-8?B?c0d0UlNwa05sT2hSOHpJZjBGekFtWVhpNE1OODJvRko3UWxraUExTWxJdEg0?=
 =?utf-8?Q?A/ORdY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cngvSUl3TUNPVDRXNmhyZHdnRWZBbm1aaTAySVdKcWN2QVZ0bEpkSklIZ2gw?=
 =?utf-8?B?alVqRWNYenFyQkRZOFJZQmluWDVneXpYZmlyeWlUdndJeUhWbVNxM2d5WjFB?=
 =?utf-8?B?WTJZYkUxK0FMS2EzeXdHUWsvcmpLUHFLS3ZLS1RJNlhXK1RWT0pmc2NaNlZ6?=
 =?utf-8?B?VXpCcHFJd1hYdDVQcTJMajRsZ0V3akdsc1YwWkhoOHMydTQzdW9xdTYvbjVD?=
 =?utf-8?B?R25IUDhaS2RNRlU3ZXJkVWtYbVd0Wkh2SjQvNlZlY1NXdGEvMlRXN2tJSU9K?=
 =?utf-8?B?WG16akZtU2tDNk1xWTd4L0h1SFZWRDdBSXBmeDVvSkcrSEUvTE8rQXlobXRQ?=
 =?utf-8?B?ZjNobTROOEJ5bkY2MmFtU2RXc3kvNlpGQkFPeDYvYmp0c2VPd0ZmVjd3UUJH?=
 =?utf-8?B?c1liYndaSXB2MlBNdkYvWEJpeWN2bHR2Zm9objVhMVNyN2RET3JUYzZvelhI?=
 =?utf-8?B?SytFZExiK0ZIMjkvZ3hyMlFIcUNrWVlVeVRPWllLc3BVUVJ6WnUwYTcxS0pD?=
 =?utf-8?B?ZVRWbDRwN05JMk1WblhqL29BQmxDZ1UyK0pCQWg5NTVodzI5UFRiRUY5MEI3?=
 =?utf-8?B?bldBSEdMWUpSYlR1d2crTzRIa243VjhCM2tzdTc5emV3ejR5N05vQWwvaGlT?=
 =?utf-8?B?WW92TWZnS2ZvZHZ3a1FuT0xwZmVQVTIwQ0xoOXVQK2F4WmVob210M0NRVzZZ?=
 =?utf-8?B?em11ZHJ3MHVRcUZWc1FuMW03Umg3N053L3N3R1lCSTlhK04wVHUrYkVMZHhN?=
 =?utf-8?B?eCtWQnNqMVRaTC9Ic05TS0dZZGpBSlVGZy91TXp3MWJiY2VHdkdDOEd4RE1v?=
 =?utf-8?B?OVJmTm9JNUJwRU1jTlFZVVBWNUNMNkp3UWxGcjBXNzhUUmlXTVhZc20rVXVP?=
 =?utf-8?B?QVgraEVETjVldzhpOGZmc2x2VjhJNWswREtpbkF4U3pITzNWMFZBdEJza01R?=
 =?utf-8?B?YjFueHZqVitnUVg4UmUrNmpWek1MY01qeGxMeE9Dd0lvVEQyb3RMMTN0MERt?=
 =?utf-8?B?NWRNdGJFdFZqSlp2emd4L1ZQSW9OeHpLYm9mRDlxcm9Lb2JEdkdSYVBuK2Zp?=
 =?utf-8?B?UGwwMExaRlpXT3BlQlhxa3AwYmMvV1JmbTFnOERMckZHSUxXL04xSm8wKzBD?=
 =?utf-8?B?TFpVVHhidWQ2byt4VG9KVFYrZHIrd2g4YlBTdEttK0tPcjRZZnlQbnZBV3Ri?=
 =?utf-8?B?dy9lZmZVMnA5bGRWdUhOYW93SW81U0FzQ3BCSkVLOUpIdGVkTGJOTklsOGp5?=
 =?utf-8?B?cUd3d29DQUV5eFBDU1ZybFRIcW1yOG9XNi9rdGVtOVdOWG1obzl4aFM4eFVR?=
 =?utf-8?B?cEFFRVgxTVFFOGNreElqelNwTVRpNnQzcGd1OW9neUVtaHd4WWEwbnlTM2Vp?=
 =?utf-8?B?cEtkc2U5YWlUNG9icS81UWdURFlmNGFSRG1hZWpRQjZwd3pBd1hBTGxoU2pO?=
 =?utf-8?B?SDRnZFdGVVUrb2JELzlUOUJtUVNkS09hdFFqRlg3SVlGWk0xZVVmMy90OTcw?=
 =?utf-8?B?aGRDNkpsZ0o1T3E3SVZFOG1SYThydE5sZXhUZlpnbk9oaVM3ZnY3UEFVOWxW?=
 =?utf-8?B?Rlh6UnRySW1vK2JnUGR2L0JISzZ4OXB2QnRNaGZPYmM5aGtSTG5EWG5DYm5N?=
 =?utf-8?B?Rm5ocW1rMTNVQlJEZFBZSm9pRzBGelVOS1d4QlZBcHpONTJReE8rT3R1L3RG?=
 =?utf-8?B?VXFnUlVKTnZ3RjdzU0NUaUw4S080ZjhQZ29HajJWaFNDU3Z6elZFd3FjbWtJ?=
 =?utf-8?Q?1E9W1RDbnRNg/r9UB0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6928323a-d972-4faa-76c8-08dd54ca74b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 11:57:47.4107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8004
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDU6MTPigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMTE6
MjA6MTJBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiANCj4+PiANCj4+PiBJdCB3b3Vs
ZCBiZSBuaWNlIHRvIHNlZSB0aGUgZGlmZmVyZW5jZSBpbiB0aGUgY29kZSBnZW5lcmF0aW9uIGZv
ciB0aGUgYWxsDQo+Pj4gX19wYWNrZWQgdnMuIG9ubHkgdGhvc2UgdGhhdCByZXF1aXJlIGl0Lg0K
Pj4+IA0KPj4+PiBBdCBsZWFzdCBpdCdzIGNsZWFyIHRoZW4NCj4+Pj4gd2hhdCBoYXBwZW5zLiBB
bmQgaWYgeW91ciBoYXJkd2FyZSByZXF1aXJlcyB0aGlzLCB5b3UgY2FuJ3QgZG8gbXVjaCBhbnl3
YXkuDQo+Pj4gDQo+Pj4gT25lIGFzcGVjdCAobWVtYmVyIGxldmVsIGFsaWdubWVudCkgaXMgY2xl
YXIgYnV0IHRoZSBvdGhlciBpcyBub3QNCj4+PiAob2JqZWN0IGxldmVsIGFsaWdubWVudCkuIEkg
ZHVubm8gaWYgaXQgbWFrZXMgc2Vuc2UgdG8gYmUgcGVkYW50aWMgYWJvdXQgdGhpcywNCj4+PiBi
dXQgd291bGQgbGlrZSB0byBzZWUgdGhlIGJpbmFyeSBvdXRjb21lIGFza2VkIGZvci4NCj4+IA0K
Pj4gSGV4IGR1bXAgb2YgdGhlIGNvbXBpbGVkIGJpbmFyeToNCj4gDQo+IE9oLCBzb3JyeSBJIHdh
c24ndCBjbGVhci4gV2UgaGF2ZSBhIHNjcmlwdCBjYWxsZWQgYmxvYXQtby1tZXRlciBmb3IgdGhl
c2UNCj4gcHVycG9zZXMuIFBsZWFzZSwgcnVuIGl0IHdpdGggb2xkIGFuZCBuZXcgYmluYXJpZXMg
YXMgcGFyYW1ldGVycyBhbmQgc2hhcmUgdGhlDQo+IG91dHB1dC4NCg0KYWRpdHlhQE1hY0Jvb2s6
fi9saW51eCQgLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgJFBBQ0tFRCAkVU5QQUNLRUQNCmFkZC9y
ZW1vdmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkNCkZ1bmN0aW9uICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGENClRv
dGFsOiBCZWZvcmU9MTMyODYsIEFmdGVyPTEzMjg2LCBjaGcgKzAuMDAlDQoNCmFkaXR5YUBNYWNC
b29rOn4vbGludXgkIC4vc2NyaXB0cy9ibG9hdC1vLW1ldGVyICRQQUNLRUQgJFVOUEFDS0VEIC1j
DQphZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvMCB1cC9kb3duOiAwLzAgKDApDQpGdW5j
dGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRl
bHRhDQpUb3RhbDogQmVmb3JlPTQ5NTcsIEFmdGVyPTQ5NTcsIGNoZyArMC4wMCUNCmFkZC9yZW1v
dmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkNCkRhdGEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGENClRvdGFs
OiBCZWZvcmU9MTU2MCwgQWZ0ZXI9MTU2MCwgY2hnICswLjAwJQ0KYWRkL3JlbW92ZTogMC8wIGdy
b3cvc2hyaW5rOiAwLzAgdXAvZG93bjogMC8wICgwKQ0KUk8gRGF0YSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQ0KVG90YWw6IEJlZm9yZT02
NzY5LCBBZnRlcj02NzY5LCBjaGcgKzAuMDAlDQoNCmFkaXR5YUBNYWNCb29rOn4vbGludXgkIC4v
c2NyaXB0cy9ibG9hdC1vLW1ldGVyICRQQUNLRUQgJFVOUEFDS0VEIC1kDQphZGQvcmVtb3ZlOiAw
LzAgZ3Jvdy9zaHJpbms6IDAvMCB1cC9kb3duOiAwLzAgKDApDQpEYXRhICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhDQpUb3RhbDogQmVm
b3JlPTgzMjksIEFmdGVyPTgzMjksIGNoZyArMC4wMCUNCg0KYWRpdHlhQE1hY0Jvb2s6fi9saW51
eCQgLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgJFBBQ0tFRCAkVU5QQUNLRUQgLXQNCmFkZC9yZW1v
dmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkNCkZ1bmN0aW9uICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGENClRvdGFs
OiBCZWZvcmU9NDk1NywgQWZ0ZXI9NDk1NywgY2hnICswLjAwJQ0KDQo+IA0KPiAtLQ0KPiBXaXRo
IEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg==
