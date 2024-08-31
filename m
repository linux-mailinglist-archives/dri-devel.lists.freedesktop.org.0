Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2F967192
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 14:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EB010E102;
	Sat, 31 Aug 2024 12:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="m/S50bNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2097.outbound.protection.outlook.com [40.92.103.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFEC10E102
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 12:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUyIglKT/dTX0Db5DeamZb+ZvkwQFl/D9p1btr3P8RZSKbPWp5Kp1jlMuYIGiusiVjAlTkqNKQcvjlGHtZJj9XguUmGN+TA/3p9IezKhmzs5J4uYFSbfSei8hTm+j8XEnNHpDivbU3VD7ZTisrF0GHJa5+zfKL3EFDLCtZSb+97pWn9Kz0tn0wkt2pdAmrvzQxNYeFGFdhlWMZfJ/8j4OqaLn8WYwtXNE1YygQ8AQx/vhoS7mXxA+zfOzoqgq8sVe/Osb5h0Jm3sy4lwRBgDLoi/hcwW0G5uTCK2D3jgh/0H5ZsJXHfIhfjhXpi/lKXWBGAenxLK8FxZMFQNBnafhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axyQaBy9GzuUk/kvLNWsY9Ow+v+ERtj47jw0irMAQ/c=;
 b=XRkUjr9Rsfpqa73v7txs2SmgdVYTFd4xrRfdCUu1qAbeMRh3HKdl0nwBKnimtcNDrDS2/Mals5ZjObRgBZs33Fk5fSlDHRAeOvCrd6cymocV+DJ5+L5+IQEOfUlK+qzQxNeibhEQpdx6qntTKfcNkR75hom5izobjEjQjxgXb85IQFsQBiRwERaEJaKtD8mm8Mf4bS97oXl1G0Hb7C3yvWKaGKgspTgl29fIrn3vZjT+I2yxpaNHiNqQ5yFmcXkxV+e5g/R13v8mPVQubB3+J/Xh6+ZDgsq7Vl6I1+vG0NSN5AQzrSi5ouIfVm1n75G3WULJ30oezJtHzZ2r2waQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axyQaBy9GzuUk/kvLNWsY9Ow+v+ERtj47jw0irMAQ/c=;
 b=m/S50bNdirx0aa2eUMMipvh063BWK9GfYILCYKVtAWEP6rvXo6FCjAUmSOs8XPHaMx2WKcoy3S1c2raNZ5HNId+nkvwurL/MIzF+Jr5Z8z1r9J5i1U3e9sN7VpkvdjdEwZY4xylburG6KaVSYDYxN2kd5BliailVLJzIqxlkhgTF3+EG/fkdYkNsYj95tUPwCi+c8LgQ2XeEtU02V7pGY3lgsizfmcIWYVlJ+zfmJGfj6lz+DVscgMTInYYg0kC1IZJzWh6SMwFX9IuNuuW1wmuXmYm2+bIy2KGKL8xV9eOiePZV0d0EdtGL/JSAfep05aHIjvhDlIUo6yKCvU1JvA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB1602.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:186::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.21; Sat, 31 Aug 2024 12:37:02 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7918.020; Sat, 31 Aug 2024
 12:37:02 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 0/10] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v5 0/10] Touch Bar support for T2 Macs
Thread-Index: AQHa8JrmaYTRUCEWd0ms5DAZWvEMRrJBY7/K
Date: Sat, 31 Aug 2024 12:37:02 +0000
Message-ID: <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [b/xsFKJl7l3eHdTgFhVi1jvZLOmK2Q88ZZ0ayZqrgqHWGnb9eg40tv2JvkSdH32j]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB1602:EE_
x-ms-office365-filtering-correlation-id: 7a2f24fe-5cb0-45a7-e30a-08dcc9b99d33
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799006|461199028|1602099012|3412199025|4302099013|440099028|102099032;
x-microsoft-antispam-message-info: Rg+5+7KhckutI7sNzl+Ie6BITJUNlLekVaAzVCEEnDszyb4a+KnMp/mTAV6026dDDAZO/R6F4Tmyq4ATFu9N2/T5eBpECMb8KGB9o4WzJ7gJtfdwiRlz25HiScBJh+Pj2yzyKHfr749viWmrOEScFCbsaasc3XOvUW1KowGgCenVJweGODKnyHQLpgnNc/aOsRkZut3ZLmD9manNy2judIkvnv3125DurWJmGd9xDOVanhjtMG4URAetIey0zSfjspQ2hN/aXpsC1uO5F9d6nKraC3z7TzDglOW1wTAVoHg2Y0q65NsjzP+pkz1kUzUKBF1DbHQ1NMjJX5Ajvw3MFHKC4QE2HKRDXaYYEy6JBFp40xMge7hlMbfPeowgvRhdNWQcRxaXXKc6NcF+XgpX+RHX1MoiaiEcdJfn4wFh+LA/VAaBptiK846DKNPK23NmOtRHps7yMaWA0B0GYJ4lsFS6cdKU1nnAloixF7B4XbmZIs8gvqfatbi75xehM/NAUKWSGkvronLK4QTMYH1O8238MFoaUUEH59bFjyOjUVNSuTHqtnnEQQvb6pUJsDUW0/lkMbzhkwS5LCGi2T0Mp6SsIwVt7tPmuTmRHEucBU/pAlEXJ+vEOG3isd0E9IJ25D4u/iJSe58KeFcTiAWEwRv4SGKSKw2E7azHYbgf6PEb9Qy3DcZVE15AC8QAZJg48oKxzPE0iYVkIQWuMnNMVhgwOzFmUGhpW/CRO+nEB4FFPqQWNoYf5aBJ+CBnnaPlaFOOEfjpVTEvW5X2zyFTLjQAY/8UrAKuswu5+0UVpok=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFlQa204L3FxL0pUQUxGdjJEME9YWEhTRFJZcWMyajdUeXdqTGJXbk1scFhE?=
 =?utf-8?B?Z0llSkkxUGZXMXlkblpQaDhDUEl2Q2RrdEt2eDBVdHpReFltZXFLQTIvRC9v?=
 =?utf-8?B?WVBMS3R6OHIrWHgxcXg2TjMreHNTbHh1cUEyVE9mRXFwaEt0dXRvenozMDRu?=
 =?utf-8?B?Q0V1ZXMrZFUwMEVrSG9UMGRxd2R6eFluWGpOaWFXUmZ6R1pycVpzQjk0dCtW?=
 =?utf-8?B?M2FlN0RIN2RPU0pLbnN5OFhzeEVXWTRhQVNoK2NLZVZhNFFIL0k0QUlrY2g2?=
 =?utf-8?B?REplbWh5TUZLSzVzS3NyYkpNb2xoVmljdVBlVmo4OS9ObU9uMVhSL01qUUps?=
 =?utf-8?B?eVE0aEY0bmFxdHJyUTFDRVRTK0dja1JmRGF0Z2w2T1o3RS82S0F6a3pIRjF5?=
 =?utf-8?B?NjBaMTdsRmhBZWNwSlV4cXRoK0RZa2o5bzNETkhVb2lwRFhYWWpIS2t2S2Vv?=
 =?utf-8?B?UlFyelRTdXpFSytnTmNHTkhURzJReGdrNUw4YWdaRjdHNFhwRlhuODlzeHZ2?=
 =?utf-8?B?emx0T2VhZWpjSWFwVXUxOVdiZEwycnZJM1NmTnFCcXFCN29CYmNrY2sybGhn?=
 =?utf-8?B?WWJuRkJiekMyTHo3NkNGMlBqcldSTHU5NGdFbzVLdGxwN1hSamthZjUzajcw?=
 =?utf-8?B?TURSdjl3N21GTEpFNTZnRkRtZWdlUEdlWmthQzdGQndpRi9zS05UWVBmNFN3?=
 =?utf-8?B?byt3UldMUFU0QWhUSCtZODJtTjN2YW9sZXVHN01xcTVvQ2lHTFlyT2NXTlU0?=
 =?utf-8?B?NmgxdU5HOFlYYU05dUFxNFpsWlRIL3FueDZ5a1NnQXRSVnJYd0laWm9UaStY?=
 =?utf-8?B?SzBtTHZlRFV3QnRzMlFMazZJL2FqLzJRSUF3c1BiNm1iRTA1RmcxR2ZNZUdK?=
 =?utf-8?B?UjRKWTBZUzBONmJxQ2FWdGlFU1V6Q0NZdWhTdXRhaUVLb3Z3blVaSWwzMWJp?=
 =?utf-8?B?cEVza3k5QmZKa1JTZTI5T3haNHVPU1ppaVdzMTRoTFk3MXpOVmtlTnpVb25Z?=
 =?utf-8?B?dWNqU2dudjBnc0FUSmlNOUtFMXpTZ3JtSWo5dHU4NmNEODNPZWtvemFJdlE4?=
 =?utf-8?B?YjV3LzB4VDM3TFM5RktTSEJ5bUhvTWRkYWV2TTBEdXlsRUNCbGV5aU1rUEJH?=
 =?utf-8?B?SzFUcGpBK0tyT0ZjSjQvb0Z2aWl1SnJQS01SZ1JRc2xSR0d3M2Q4NFRGcFVE?=
 =?utf-8?B?L1JDMmdFU08xTG90VHZZcnJ5TitLZ2VzS1g1ak1xdEZXU0ZMTFpzV0dFbjRN?=
 =?utf-8?B?ZUIzczFNdHdjWHFJYmVuYTN1L0IxdFFwK1JQSFcybDhQejVRNTVMb0NnK3Za?=
 =?utf-8?B?MExVZE5tOGlzSUtMREU1U3FSN3VTK3hTYVdhTmlnNExZOTVrejRBZm55cld2?=
 =?utf-8?B?bDNBS3dEejBRN0JBNWNsN3VYTHpYRUZONnUySFo2bWNCK0JPUlkvT2RZaEtC?=
 =?utf-8?B?SFVTdVQ0VzdnN3hFMGhEMC9kdFFVNUFEeVhwaHR5VDVJY1lOZzlMN3RyZDVB?=
 =?utf-8?B?RkJ0cGh5K2NGUVh3dG1VYVdMUVJmTzNWZWllU2p3UWVrb0FNNW9KVzZQU2dq?=
 =?utf-8?B?OXVFYnMySi9DaDhqV2lWeTJFZFZVNWZJRE9WYzJrUldQSWJDWWFSL0lUWEp1?=
 =?utf-8?B?NlpEcEhVSlJWSUdPWlpZK2pHRWFYUHQ2T25JN1ptVzJ5YTZkYXl5d1cxR09D?=
 =?utf-8?B?R0hTbGhXcXJxTnZpdm9XbUtQbEpVWEsyajF5UVRrbkduU0FUK2ROc3VKcm52?=
 =?utf-8?Q?jkV6M8VUKx2JzfGQ7E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2f24fe-5cb0-45a7-e30a-08dcc9b99d33
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2024 12:37:02.3222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1602
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

SGkgTWFpbnRhaW5lcnMNCg0KSXQgaGFzIGJlZW4gMiB3ZWVrcyBidXQgSSBzdGlsbCBoYXZlbid0
IHJlY2VpdmVkIGEgc2luZ2xlIHJlcGx5IG9uIHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggc2Vy
aWVzLiBDb25zaWRlciB0aGlzIGVtYWlsIGFzIGEgZnJpZW5kbHkgcmVtaW5kZXIuDQoNCj4gT24g
MTcgQXVnIDIwMjQsIGF0IDU6MTXigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZl
LmNvbT4gd3JvdGU6DQo+IA0KPiDvu79IaSBNYWludGFpbmVycw0KPiANCj4gVGhlIFRvdWNoIEJh
cnMgZm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUN
Cj4gd2hlcmUgdGhlIGRldmljZSBwcmVzZW50cyBpdHNlbGYgYXMgYSBISUQga2V5Ym9hcmQgYW5k
IGNhbiBkaXNwbGF5DQo+IHByZWRlZmluZWQgc2V0cyBvZiBrZXlzLCBhbmQgb25lIHdoZXJlIHRo
ZSBvcGVyYXRpbmcgc3lzdGVtIGhhcyBmdWxsDQo+IGNvbnRyb2wgb3ZlciB3aGF0IGlzIGRpc3Bs
YXllZC4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYm90aCB0aGUg
Y29uZmlndXJhdGlvbnMuDQo+IA0KPiBUaGUgaGlkLWFwcGxldGItYmwgZHJpdmVyIGFkZHMgc3Vw
cG9ydCBmb3IgdGhlIGJhY2tsaWdodCBvZiB0aGUgVG91Y2ggQmFyLg0KPiBUaGlzIGVuYWJsZXMg
dGhlIHVzZXIgdG8gY29udHJvbCB0aGUgYnJpZ2h0bmVzcyBvZiB0aGUgVG91Y2ggQmFyIGZyb20N
Cj4gdXNlcnNwYWNlLiBUaGUgVG91Y2ggQmFyIHN1cHBvcnRzIDMgbW9kZXMgaGVyZTogTWF4IGJy
aWdodG5lc3MsIERpbSBhbmQgT2ZmLg0KPiBTbywgZGFlbW9ucywgdXNlZCB0byBtYW5hZ2UgVG91
Y2ggQmFyIGNhbiBlYXNpbHkgbWFuYWdlIHRoZXNlIG1vZGVzIGJ5IHdyaXRpbmcNCj4gdG8gL3N5
cy9jbGFzcy9iYWNrbGlnaHQvYXBwbGV0Yl9iYWNrbGlnaHQvYnJpZ2h0bmVzcy4gSXQgaXMgbmVl
ZGVkIGJ5IGJvdGggdGhlDQo+IGNvbmZpZ3VyYXRpb25zIG9mIHRoZSBUb3VjaCBCYXIuDQo+IA0K
PiBUaGUgaGlkLWFwcGxldGIta2JkIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGZpcnN0IChwcmVkZWZp
bmVkIGtleXMpIGNvbmZpZ3VyYXRpb24uDQo+IFRoZXJlIGFyZSA0IG1vZGVzIGhlcmU6IEVzYyBr
ZXkgb25seSwgRm4gbW9kZSwgTWVkaWEga2V5cyBhbmQgTm8ga2V5cy4NCj4gTW9kZSBjYW4gYmUg
Y2hhbmdlZCBieSB3cml0aW5nIHRvIC9zeXMvYnVzL2hpZC9kcml2ZXJzL2hpZC1hcHBsZXRiLWti
ZC88ZGV2Pi9tb2RlDQo+IFRoaXMgY29uZmlndXJhdGlvbiBpcyB3aGF0IFdpbmRvd3MgdXNlcyB3
aXRoIHRoZSBvZmZpY2lhbCBBcHBsZSBCb290Y2FtcCBkcml2ZXJzLg0KPiANCj4gUmVzdCBwYXRj
aGVzIHN1cHBvcnQgdGhlIHNlY29uZCBjb25maWd1cmF0aW9uLCB3aGVyZSB0aGUgT1MgaGFzIGZ1
bGwgY29udHJvbA0KPiBvbiB3aGF0J3MgZGlzcGxheWVkIG9uIHRoZSBUb3VjaCBCYXIuIEl0IGlz
IGFjaGlldmVkIGJ5IHRoZSBwYXRjaGluZyB0aGUNCj4gaGlkLW11bHRpdG91Y2ggZHJpdmVyIHRv
IGFkZCBzdXBwb3J0IGZvciB0b3VjaCBmZWVkYmFjayBmcm9tIHRoZSBUb3VjaCBCYXINCj4gYW5k
IHRoZSBhcHBsZXRiZHJtIGRyaXZlciwgdGhhdCBkaXNwbGF5cyB3aGF0IHdlIHdhbnQgdG8gb24g
dGhlIFRvdWNoIEJhci4NCj4gVGhpcyBjb25maWd1cmF0aW9uIGlzIHdoYXQgbWFjT1MgdXNlcy4N
Cj4gDQo+IFRoZSBhcHBsZXRiZHJtIGRyaXZlciBpcyBiYXNlZCBvbiB0aGUgc2ltaWxhciBkcml2
ZXIgbWFkZSBmb3IgV2luZG93cyBieQ0KPiBpbWJ1c2h1byBbMV0uDQo+IA0KPiBDdXJyZW50bHks
IGEgZGFlbW9uIG5hbWVkIHRpbnktZGZyIFsyXSBpcyBiZWluZyB1c2VkIHRvIGRpc3BsYXkgZnVu
Y3Rpb24ga2V5cw0KPiBhbmQgbWVkaWEgY29udHJvbHMgdXNpbmcgdGhlIHNlY29uZCBjb25maWd1
cmF0aW9uIGZvciBib3RoIEFwcGxlIFNpbGljb24gYW5kDQo+IFQyIE1hY3MuDQo+IA0KPiBBIGRh
ZW1vbiBmb3IgdGhlIGZpcnN0IGNvbmZpZ3VyYXRpb24gaXMgYmVpbmcgZGV2ZWxvcGVkLCBidXQg
dGhhdCdzIGEgdXNlcnNwYWNlDQo+IHRoaW5nLg0KPiANCj4gWzFdOiBodHRwczovL2dpdGh1Yi5j
b20vaW1idXNodW8vREZSRGlzcGxheUttDQo+IFsyXTogaHR0cHM6Ly9naXRodWIuY29tL1doYXRB
bUlTdXBwb3NlZFRvUHV0SGVyZS90aW55LWRmcg0KPiANCj4gdjI6DQo+IDEuIENsZWFuZWQgdXAg
c29tZSBjb2RlIGluIHRoZSBoaWQtYXBwbGV0Yi1rYmQgZHJpdmVyLg0KPiAyLiBGaXhlZCB3cm9u
ZyBzdWJqZWN0IGluIGRybS9mb3JtYXQtaGVscGVyIHBhdGNoLg0KPiAzLiBGaXhlZCBDby1kZXZl
bG9wZWQtYnkgd3JvbmdseSBhZGRlZCB0byBoaWQtbXVsdGl0b3VjaCBwYXRjaC4NCj4gDQo+IHYz
Og0KPiAxLiBGaXhlZCBrZXkgbWFwcGluZyBmb3IgRnVuY3Rpb24ga2V5cyBpbiBoaWQtYXBwbGV0
Yi1rYmQgZHJpdmVyLg0KPiANCj4gdjQ6DQo+IDEuIEFkZGVkIHN1cHBvcnQgZm9yIGZuIGtleSB0
b2dnbGUgaW4gdGhlIGhpZC1hcHBsZXRiLWtiZCBkcml2ZXIuDQo+IA0KPiB2NToNCj4gMS4gRG8g
cmVxdWlyZWQgY2hhbmdlcyB0byBoaWQtYXBwbGV0Yi1ibCBhcyByZXF1ZXN0ZWQgYnkgdXBzdHJl
YW0uDQo+IA0KPiBBZGl0eWEgR2FyZyAoMSk6DQo+IEhJRDogaGlkLWFwcGxldGIta2JkOiBhZGQg
c3VwcG9ydCBmb3IgZm4gdG9nZ2xlIGJldHdlZW4gbWVkaWEgYW5kDQo+ICBmdW5jdGlvbiBtb2Rl
DQo+IA0KPiBLZXJlbSBLYXJhYmF5ICg5KToNCj4gSElEOiBoaWQtYXBwbGV0Yi1ibDogYWRkIGRy
aXZlciBmb3IgdGhlIGJhY2tsaWdodCBvZiBBcHBsZSBUb3VjaCBCYXJzDQo+IEhJRDogaGlkLWFw
cGxldGIta2JkOiBhZGQgZHJpdmVyIGZvciB0aGUga2V5Ym9hcmQgbW9kZSBvZiBBcHBsZSBUb3Vj
aA0KPiAgQmFycw0KPiBISUQ6IG11bHRpdG91Y2g6IHN1cHBvcnQgZ2V0dGluZyB0aGUgY29udGFj
dCBJRCBmcm9tDQo+ICBISURfREdfVFJBTlNEVUNFUl9JTkRFWCBmaWVsZHMNCj4gSElEOiBtdWx0
aXRvdWNoOiBzdXBwb3J0IGdldHRpbmcgdGhlIHRpcCBzdGF0ZSBmcm9tIEhJRF9ER19UT1VDSA0K
PiAgZmllbGRzDQo+IEhJRDogbXVsdGl0b3VjaDogdGFrZSBjbHMtPm1heGNvbnRhY3RzIGludG8g
YWNjb3VudCBmb3IgZGV2aWNlcw0KPiAgd2l0aG91dCBhIEhJRF9ER19DT05UQUNUTUFYIGZpZWxk
IHRvbw0KPiBISUQ6IG11bHRpdG91Y2g6IGFsbG93IHNwZWNpZnlpbmcgaWYgYSBkZXZpY2UgaXMg
ZGlyZWN0IGluIGEgY2xhc3MNCj4gSElEOiBtdWx0aXRvdWNoOiBhZGQgZGV2aWNlIElEIGZvciBB
cHBsZSBUb3VjaCBCYXJzDQo+IGRybS9mb3JtYXQtaGVscGVyOiBBZGQgY29udmVyc2lvbiBmcm9t
IFhSR0I4ODg4IHRvIEJHUjg4OCBjb252ZXJzaW9uDQo+IGRybS90aW55OiBhZGQgZHJpdmVyIGZv
ciBBcHBsZSBUb3VjaCBCYXJzIGluIHg4NiBNYWNzDQo+IA0KPiAuLi4vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZHJpdmVyLWhpZC1hcHBsZXRiLWtiZCAgfCAgMTMgKw0KPiBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KPiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2Zvcm1hdF9oZWxwZXIuYyAgICAgICAgICAgfCAgNTQgKysNCj4gLi4uL2dwdS9kcm0vdGVzdHMv
ZHJtX2Zvcm1hdF9oZWxwZXJfdGVzdC5jICAgIHwgIDgxICsrKw0KPiBkcml2ZXJzL2dwdS9kcm0v
dGlueS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMTIgKw0KPiBkcml2ZXJzL2dwdS9kcm0v
dGlueS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiBkcml2ZXJzL2dwdS9kcm0v
dGlueS9hcHBsZXRiZHJtLmMgICAgICAgICAgICAgfCA2MjQgKysrKysrKysrKysrKysrKysrDQo+
IGRyaXZlcnMvaGlkL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyMiArDQo+
IGRyaXZlcnMvaGlkL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQo+
IGRyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWJsLmMgICAgICAgICAgICAgICAgICB8IDIwNyArKysr
KysNCj4gZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMgICAgICAgICAgICAgICAgIHwgNDMy
ICsrKysrKysrKysrKw0KPiBkcml2ZXJzL2hpZC9oaWQtbXVsdGl0b3VjaC5jICAgICAgICAgICAg
ICAgICAgfCAgNjAgKy0NCj4gZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jICAgICAgICAgICAgICAg
ICAgICAgIHwgICA4ICstDQo+IGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggICAgICAg
ICAgICAgICB8ICAgMyArDQo+IDE0IGZpbGVzIGNoYW5nZWQsIDE1MDkgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWRyaXZlci1oaWQtYXBwbGV0Yi1rYmQNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS90aW55L2FwcGxldGJkcm0uYw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9oaWQvaGlkLWFwcGxldGItYmwuYw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCj4gDQo+IC0tDQo+IDIuNDMuMA0KPiANCg==
