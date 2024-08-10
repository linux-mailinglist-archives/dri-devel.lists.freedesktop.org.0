Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320494DD7B
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 17:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9010E130;
	Sat, 10 Aug 2024 15:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Y/dlVpLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2016.outbound.protection.outlook.com [40.92.102.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3FB10E130
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 15:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMaFCNVBxmRijVTXveolf8Km2VidbwRWiMY1eYqfDbgLHgThSTPz5kBggN36A6oEOUuPX0Sw6j11E7N1QMRqHFiR0roF1t86gbQ9nSVq6tHz9RphDGtV0uTOgMaAViaiakVEhsOHxgpTne11xPvyP5hqeWosNWKI/MkYuYbPPwMVAyDLxJyzSIRFkOaXnZb/bSp9Orwtg25Q1EoQj5/HXQXvEGSjgcEMXCRpAItP9W8SCEu8TI2qTtiGPlvRvNMZ8CrG+dV6FGF1JA6tto6TkAndQYSgZ2TiqF6SP70khco54XU1GGM7CMbODgSyquf1SOjdr/Rh1u/J2Vttfb+tAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdSwqHOAXBPqtLCwNW9vduPoREyy/l1NmcVVval+/eo=;
 b=XlZ1BzwvrRxtMoCfxyFEXO8yuFw2I2ar2wShai5t96ViVVD37Wiy4SNPcI2Gtm6+TDWq6rQlGrT6Hw5U082R2RUM6mDjkZOIF4CA1THv5GtHsDebWA1iavjXB99W7XSDvAnjmk/6uXnC5ygy91+aVrsyJwDS5A8zO6FHKstSYbS8XIO55b406uHiS4l1d+gh4merSNF5zjjf1q18PEW5K8ga9Pgue22eqZIcbnF04wF2j7oblFO1rBX7l48AfpTVBPqNpJhZ6hykJHPx2q7kmtsC0OtAMvFqbkEMAKLVTnFkaAEZNhznXTcLERgScnCaNj608n0ubgWUoBgl5v46pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdSwqHOAXBPqtLCwNW9vduPoREyy/l1NmcVVval+/eo=;
 b=Y/dlVpLL++Rtd0Ti7Jk0FIpYgKe//T6K28JWQW5aaDv9qKW4tOJ2aKtc3wqPVkmOCVKljLBP56Rfd23eSE/PHoX/AGHOdFnfprQDq+WOnfldwN7692xLNJS5h4fnuxvnESmEqf57F8PNancOFJxkI8wm6OF9wWlhdHpX1CRx7usDFViv8XJ8sokctaKZCKcT1sitVUBKM74AKWKwpyId31WfAdX5pK2b1S0Xdxg6s29mo5tJJu+Qarj0TlqWJfcz9R4s0n6CWSfui4X6exyVOQw0Loow7QbcLv0tbzYXX/Lj0XWPR8EJJQvWjdl48GSzSNDhNNA3Qv+ZqvH9tqOTTg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MAZP287MB0408.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 15:30:58 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 15:30:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Thread-Topic: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Thread-Index: AQHa6ZnwyB5bPU44IEyDnWntQU6RLbIgavQAgAASw4CAABOOAIAAEBEA
Date: Sat, 10 Aug 2024 15:30:58 +0000
Message-ID: <6340DD46-4537-434E-9E14-EEFE7E04AAD0@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
 <0DDD5C22-A42A-49F2-984C-F3595F71AB1C@live.com>
 <9e398f1b-05c2-4dd3-bc56-2b61c6784aef@t-8ch.de>
 <79DB1D9D-8D32-474F-972F-F82C818AF38F@live.com>
 <375d99a9-5516-4a39-a912-1961b3dd725d@t-8ch.de>
In-Reply-To: <375d99a9-5516-4a39-a912-1961b3dd725d@t-8ch.de>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [o/BNm2l7MdqRuZdYEX0+O58jhFLKbXMTvH9cQcEuHAkHXdpqG2rS3djVECxycf3r]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MAZP287MB0408:EE_
x-ms-office365-filtering-correlation-id: 5ec367e5-5c47-4ad7-6152-08dcb9516ec0
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799003|19110799003|461199028|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: 43Ww+8st+CXZ5CKrVkCL7i6unoBZt7Axz87eEjqB98uwt8MJeDLTHGQdRbYZ2E8iIKIRINqNxUbp+8S62lrWSzz3k4dzAjJ7Nda+izAjwGkf7znaBoCwZfV/6yHyhR4f/uTr+eGWjpvnQiYGi7tw6dQyfzMAsoHSeJs7eXCcNllS8JpHyIo2J4jFi2sV/s51XRvnvFkwgQqh3IyiBy1BhJXtHCeWluuKba33IJa1vxUSNn+bLBfziZICMSeBRjV6hBG+OeR62bs2RMnn71sMyt9DNsA0uHeq3V2wfSh+ODRXV2GcEZpv7crhNUl4rpKcodMMFBu7ecrZwe/0zMOMaiahveWJANW/+fE6Gv/kfa9c+JR8mNV5msSDm0g3Sijue0MsAfFC2MeloFuNEaTS0p0BdBzZ5xCDqnA9IuwUX1whxge+8HJo4t5xceHkgJ1OAi+8rH8KJH+a/PMPbcGLPfYB3hBY+0dxMhvOXXN0lG5omAGx4JJZ1hZRCegnwgVnHvWNUVyjdp+I9QKlDoMVwydtn1yoJn23Xin9ccMjgH97Yedn90CeTh3LXTs/4+IfT2mdLS4s8GYk36nowF929Ffg54D6iHPbh/EHoWLej55iAd3AUJKUAMLj9Levn+JsZwsLaU/u8KNvuy+elDovyLjmLeAsI9yzqTokN7KX21k9+8yWDwqyj1jbHsHsuzqa
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T29ERXdnQ2xuVm4zTHp5NFpGb0pqNTRkcDh2RytRa2xTdXRaOTN2MHU4emps?=
 =?utf-8?B?WUlUQlFNNjBWNDUvTkFHaElxbjFDQjY2U3d2OWJwV3c4akRIeTI2N0M2ZWlR?=
 =?utf-8?B?MlFpbGtiTlU0dCtMVTJRWG9MaFVSL0FWYkMxeGVvblhDTXVwdXRzeWlNb3ZR?=
 =?utf-8?B?blJYc1gxMEFxZlhNRVBBNXRpZWJKUi9Tc1I3TDJ5MHY2TXdjeUFCcUdSMkQw?=
 =?utf-8?B?aTc4TGZhcGJZOFJaVzh3UTg0KytTeXk5WVI5V01rSVZoRHRnUnBDektXRUpu?=
 =?utf-8?B?eEVLNlR5TElpQzRtSUhwdkpMcGhFSjViZVRLV05JTlk3R1ZBaG85T0R0Qm5r?=
 =?utf-8?B?K3IzUDduZG1KblE0MVZjWktuekM0SnFIT0hiWmNXMVlpQ2NHb0NlUjNLMStp?=
 =?utf-8?B?aHZQdVk4QS9uekVrQTNYeWVQVlVyd1Z6aHJsTFlrMHJ5bEVMc1kvUExoZEg2?=
 =?utf-8?B?WXN1cFFKZUpPM0RMVmpPQWdqTkVEMEpuUm40TURsS2JJNVRGWkNtNzV6dXNL?=
 =?utf-8?B?LzkxOGZoWDNmY2YvNGc0Ni9HRDRiYzhDN0JyNFUxU3pTRlpHQlNCUHJKVnRK?=
 =?utf-8?B?NXl0Sk1MYjBuRE13TTA3Q09lQkJidmxDM0lRRFdlNHhmcDljdGtZZGxtQ3du?=
 =?utf-8?B?RjFmQnVzbkVoSDh2WDl0cXdySllUQTlvVy9obWxpYTVGeldrcWlEVzNabGlF?=
 =?utf-8?B?ZFNnMzFtdnZOa0lYSndESG8zdi9QNWFxMElrZnVwQnBhNStVOHV5bmdJbjgz?=
 =?utf-8?B?Y1Bra2R6MlQ4dG5GZ2xIbFptSmppQUs3QUZRaUVObkowV21ybE1VWllZRmph?=
 =?utf-8?B?L2ZkUEMvckU3cTZGZWVlc1ErNWdiOHRIc213NmlmSzVScElqdHg5anFadW00?=
 =?utf-8?B?dVZEYklLZG16dGJjZXhubCtFN3Q0VUpsKzJQQ2RQMDYxS1pNZE4rZEpyNUV5?=
 =?utf-8?B?RU9iWFVleFU5N3huYUJCN1YyWFBaRXNQdk9ZQWR6MTJQQ05uVE9iNituRHBO?=
 =?utf-8?B?MGcxQ2ViellONzNnYk1aT1ZOZXBMNWhoRjBUbzRJQXNZS29XWlhFNjRaYk9w?=
 =?utf-8?B?ZUdSUGtMOVdqN3dyOEkwRmRmdlEvdWlPZzkvd2IwOTZGZndDb0FVR3VaREhM?=
 =?utf-8?B?TmJYUDhtdDZxejZvYnBDTSsyaXNtNlpkOFRQMzhGUUJQeS94bUVoTzhra0pD?=
 =?utf-8?B?RW1jd09HRk1JbTBQWFBpUXRRUkZvM0JsbjhhbkR1YVhpRkZXWDQrOWhnbWt4?=
 =?utf-8?B?Y1RNd21pVTBYK3RTY01ycGFoUWU1VFNYbFVhQmZYSGpuRFNTeC9XU2ZuUUhV?=
 =?utf-8?B?Y3lrSFN1RXZJdkZLRUhFSHRDL2FOc0ZFUGhDRmkrTC80YjYzbDVlaEJMM1RO?=
 =?utf-8?B?RkNuZjFvMVFiaE5LYmprbjNrdlYzYmNlNlZTL1lzQ0ZENnM4U3ppQ0cyd2pQ?=
 =?utf-8?B?ZzZaNGRNaGhtUDdsMEVPb1VtWW45MVlWeWxRNjZ1SWdRdit3M09tVnRTbDVS?=
 =?utf-8?B?M0dnZmNENjNKRmprVmhhNGM1KzBjNTFHMGVQcG9CbEJCRFFNM3hPWHRwdW45?=
 =?utf-8?B?WTJaeDJNa3ErVTJjeVJXMFA3ME5hRE8ybk1KOHNxc3RlcWEzRkpNc2YzcXFw?=
 =?utf-8?B?T2YwbHljemQ4UUtodDNKSmNkVEllaDFvZng2OXQ1dEdUTWFKRUZXMWF2UEpE?=
 =?utf-8?B?dkhkcDkwMzdvamdwODgvZklIY0tKSGNuYW5WOEl3YzFYUC9VT1pKQVdLV2cx?=
 =?utf-8?Q?Pqy91X1eDzR62aqcYTtP5xikDcH8ITDWMLiKExU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D37DB1927A8314AA8EF5E2466B885D7@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec367e5-5c47-4ad7-6152-08dcb9516ec0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 15:30:58.1242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0408
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

DQo+IA0KPiBBbHNvIGluY2x1ZGUgbGludXgvZGV2aWNlLmggYXMgeW91IGFyZSB1c2luZyBmdW5j
dGlvbnMgZnJvbSB0aGVyZS4NCj4gTGlrZSBkZXZtX2tjYWxsb2MoKS4NCg0KQWxyaWdodCwgSeKA
mWxsIGFkZCB0aGF0DQo+IA0KPj4+IA0KPj4+PiArI2luY2x1ZGUgPGxpbnV4L2hpZC5oPg0KPj4+
PiArI2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPg0KPj4+PiArDQo+Pj4+ICsjaW5jbHVkZSAi
aGlkLWlkcy5oIg0KPj4+PiArDQo+Pj4+ICsjZGVmaW5lIEFQUExFVEJfQkxfT04gMQ0KPj4+PiAr
I2RlZmluZSBBUFBMRVRCX0JMX0RJTSAzDQo+Pj4+ICsjZGVmaW5lIEFQUExFVEJfQkxfT0ZGIDQN
Cj4+Pj4gKw0KPj4+PiArI2RlZmluZSBISURfVVBfQVBQTEVWRU5ET1JfVEJfQkwgMHhmZjEyMDAw
MA0KPj4+PiArDQo+Pj4+ICsjZGVmaW5lIEhJRF9WRF9BUFBMRV9UQl9CUklHSFRORVNTIDB4ZmYx
MjAwMDENCj4+Pj4gKyNkZWZpbmUgSElEX1VTQUdFX0FVWDEgMHhmZjEyMDAyMA0KPj4+PiArI2Rl
ZmluZSBISURfVVNBR0VfQlJJR0hUTkVTUyAweGZmMTIwMDIxDQo+Pj4+ICsNCj4+Pj4gK3N0YXRp
YyBpbnQgYXBwbGV0Yl9ibF9kZWZfYnJpZ2h0bmVzcyA9IDI7DQo+Pj4+ICttb2R1bGVfcGFyYW1f
bmFtZWQoYnJpZ2h0bmVzcywgYXBwbGV0Yl9ibF9kZWZfYnJpZ2h0bmVzcywgaW50LCAwNDQ0KTsN
Cj4+Pj4gK01PRFVMRV9QQVJNX0RFU0MoYnJpZ2h0bmVzcywgIkRlZmF1bHQgYnJpZ2h0bmVzczpc
biINCj4+Pj4gKyAgIiAgICAwIC0gVG91Y2hiYXIgaXMgb2ZmXG4iDQo+Pj4+ICsgICIgICAgMSAt
IERpbSBicmlnaHRuZXNzXG4iDQo+Pj4+ICsgICIgICAgWzJdIC0gRnVsbCBicmlnaHRuZXNzIik7
DQo+Pj4+ICsNCj4+Pj4gK3N0cnVjdCBhcHBsZXRiX2JsIHsNCj4+Pj4gKyBzdHJ1Y3QgaGlkX2Zp
ZWxkICphdXgxX2ZpZWxkLCAqYnJpZ2h0bmVzc19maWVsZDsNCj4+Pj4gKyBzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmRldjsNCj4+Pj4gKw0KPj4+PiArIGJvb2wgZnVsbF9vbjsNCj4+Pj4gK307
DQo+Pj4+ICsNCj4+Pj4gK2NvbnN0IHU4IGFwcGxldGJfYmxfYnJpZ2h0bmVzc19tYXBbXSA9IHsN
Cj4+PiANCj4+PiBzdGF0aWM/DQo+Pj4gDQo+Pj4+ICsgQVBQTEVUQl9CTF9PRkYsDQo+Pj4+ICsg
QVBQTEVUQl9CTF9ESU0sDQo+Pj4+ICsgQVBQTEVUQl9CTF9PTg0KPj4+IA0KPj4+IFRoZSBsYXN0
IGVsZW1lbnQgaXMgbm90IGEgc2VudGluZWwgZWxlbWVudCwgc28gaXQgc2hvdWxkIGhhdmUgY29t
bWEuDQo+PiANCj4+IHN0YXRpYyBjb25zdCB1OCBhcHBsZXRiX2JsX2JyaWdodG5lc3NfbWFwW10g
PSB7DQo+PiBBUFBMRVRCX0JMX09GRiwNCj4+IEFQUExFVEJfQkxfRElNLA0KPj4gQVBQTEVUQl9C
TF9PTiwNCj4+IH07DQo+PiANCj4+IFRoaXM/DQo+IA0KPiBZZXMuDQo+IA0KPj4+IA0KPj4+PiAr
fTsNCj4+Pj4gKw0KPj4+PiArc3RhdGljIGludCBhcHBsZXRiX2JsX3NldF9icmlnaHRuZXNzKHN0
cnVjdCBhcHBsZXRiX2JsICpibCwgdTggYnJpZ2h0bmVzcykNCj4+Pj4gK3sNCj4+Pj4gKyBzdHJ1
Y3QgaGlkX3JlcG9ydCAqcmVwb3J0ID0gYmwtPmJyaWdodG5lc3NfZmllbGQtPnJlcG9ydDsNCj4+
Pj4gKyBzdHJ1Y3QgaGlkX2RldmljZSAqaGRldiA9IHJlcG9ydC0+ZGV2aWNlOw0KPj4+PiArIGlu
dCByZXQ7DQo+Pj4+ICsNCj4+Pj4gKyByZXQgPSBoaWRfc2V0X2ZpZWxkKGJsLT5hdXgxX2ZpZWxk
LCAwLCAxKTsNCj4+Pj4gKyBpZiAocmV0KSB7DQo+Pj4+ICsgaGlkX2VycihoZGV2LCAiRmFpbGVk
IHRvIHNldCBhdXhpbGlhcnkgZmllbGQgKCVwZSlcbiIsIEVSUl9QVFIocmV0KSk7DQo+Pj4+ICsg
cmV0dXJuIHJldDsNCj4+Pj4gKyB9DQo+Pj4+ICsNCj4+Pj4gKyByZXQgPSBoaWRfc2V0X2ZpZWxk
KGJsLT5icmlnaHRuZXNzX2ZpZWxkLCAwLCBicmlnaHRuZXNzKTsNCj4+Pj4gKyBpZiAocmV0KSB7
DQo+Pj4+ICsgaGlkX2VycihoZGV2LCAiRmFpbGVkIHRvIHNldCBicmlnaHRuZXNzIGZpZWxkICgl
cGUpXG4iLCBFUlJfUFRSKHJldCkpOw0KPj4+PiArIHJldHVybiByZXQ7DQo+Pj4+ICsgfQ0KPj4+
PiArDQo+Pj4+ICsgaWYgKCFibC0+ZnVsbF9vbikgew0KPj4+PiArIHJldCA9IGhpZF9od19wb3dl
cihoZGV2LCBQTV9ISU5UX0ZVTExPTik7DQo+Pj4+ICsgaWYgKHJldCA8IDApIHsNCj4+Pj4gKyBo
aWRfZXJyKGhkZXYsICJEZXZpY2UgZGlkbid0IHBvd2VyIG9uICglcGUpXG4iLCBFUlJfUFRSKHJl
dCkpOw0KPj4+PiArIHJldHVybiByZXQ7DQo+Pj4+ICsgfQ0KPj4+PiArDQo+Pj4+ICsgYmwtPmZ1
bGxfb24gPSB0cnVlOw0KPj4+PiArIH0NCj4+Pj4gKw0KPj4+PiArIGhpZF9od19yZXF1ZXN0KGhk
ZXYsIHJlcG9ydCwgSElEX1JFUV9TRVRfUkVQT1JUKTsNCj4+Pj4gKw0KPj4+PiArIGlmIChicmln
aHRuZXNzID09IEFQUExFVEJfQkxfT0ZGKSB7DQo+Pj4+ICsgaGlkX2h3X3Bvd2VyKGhkZXYsIFBN
X0hJTlRfTk9STUFMKTsNCj4+Pj4gKyBibC0+ZnVsbF9vbiA9IGZhbHNlOw0KPj4+PiArIH0NCj4+
Pj4gKw0KPj4+PiArIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgaW50
IGFwcGxldGJfYmxfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmRldikN
Cj4+Pj4gK3sNCj4+Pj4gKyBzdHJ1Y3QgYXBwbGV0Yl9ibCAqYmwgPSBibF9nZXRfZGF0YShiZGV2
KTsNCj4+Pj4gKyB1MTYgYnJpZ2h0bmVzczsNCj4+Pj4gKw0KPj4+PiArIGlmIChiZGV2LT5wcm9w
cy5zdGF0ZSAmIEJMX0NPUkVfU1VTUEVOREVEKQ0KPj4+PiArIGJyaWdodG5lc3MgPSAwOw0KPj4+
IA0KPj4+IEZyb20gYmFja2xpZ2h0Lmg6DQo+Pj4gDQo+Pj4gKiBiYWNrbGlnaHQgZHJpdmVycyBh
cmUgZXhwZWN0ZWQgdG8gdXNlIGJhY2tsaWdodF9pc19ibGFuaygpDQo+Pj4gKiBpbiB0aGVpciB1
cGRhdGVfc3RhdHVzKCkgb3BlcmF0aW9uIHJhdGhlciB0aGFuIHJlYWRpbmcgdGhlDQo+Pj4gKiBz
dGF0ZSBwcm9wZXJ0eS4NCj4+PiANCj4+PiBTZWVtcyB0byBiZSBhcHBsaWNhYmxlIGhlcmUuDQo+
Pj4gDQo+Pj4gQWxzbyB0aGUgaGFyZGNvZGVkICIwIiBhcyBpbmRleCBpbnRvIGFwcGxldGJfYmxf
YnJpZ2h0bmVzc19tYXAgY291bGQgYmUNCj4+PiBhdm9pZGVkIGJ5IHNvbWUgcmVzdHJ1Y3R1cmlu
Zy4NCj4+IA0KPj4gc3RhdGljIGludCBhcHBsZXRiX2JsX3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJh
Y2tsaWdodF9kZXZpY2UgKmJkZXYpDQo+PiB7DQo+PiBzdHJ1Y3QgYXBwbGV0Yl9ibCAqYmwgPSBi
bF9nZXRfZGF0YShiZGV2KTsNCj4+IHUxNiBicmlnaHRuZXNzOw0KPj4gDQo+PiBpZiAoYmFja2xp
Z2h0X2lzX2JsYW5rKGJkZXYpKQ0KPj4gYnJpZ2h0bmVzcyA9IEFQUExFVEJfQkxfT0ZGOw0KPj4g
ZWxzZQ0KPj4gYnJpZ2h0bmVzcyA9IGJhY2tsaWdodF9nZXRfYnJpZ2h0bmVzcyhiZGV2KTsNCj4+
IA0KPj4gcmV0dXJuIGFwcGxldGJfYmxfc2V0X2JyaWdodG5lc3MoYmwsIGFwcGxldGJfYmxfYnJp
Z2h0bmVzc19tYXBbYnJpZ2h0bmVzc10pOw0KPj4gfQ0KPj4gDQo+PiBUaGlzPw0KPiANCj4gVGhp
cyBub3cgbG9va3MgdG8gYmUgYSBkaWZmZXJlbnQgbG9naWMgdGhhbiBiZWZvcmUuDQo+IEJlbG93
IHNob3VsZCBiZSB0aGUgc2FtZSBhcyBpbiB0aGUgb3JpZ2luYWwgcGF0Y2guDQo+IA0KPiBzdGF0
aWMgaW50IGFwcGxldGJfYmxfdXBkYXRlX3N0YXR1cyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAq
YmRldikNCj4gew0KPiBzdHJ1Y3QgYXBwbGV0Yl9ibCAqYmwgPSBibF9nZXRfZGF0YShiZGV2KTsN
Cj4gdTggYnJpZ2h0bmVzczsNCj4gDQo+IGlmIChiYWNrbGlnaHRfaXNfYmxhbmsoYmRldikpDQo+
IGJyaWdodG5lc3MgPSBBUFBMRVRCX0JMX09GRjsNCj4gZWxzZQ0KPiBicmlnaHRuZXNzID0gYXBw
bGV0Yl9ibF9icmlnaHRuZXNzX21hcFtiYWNrbGlnaHRfZ2V0X2JyaWdodG5lc3MoYmRldildKTsN
Cj4gDQo+IHJldHVybiBhcHBsZXRiX2JsX3NldF9icmlnaHRuZXNzKGJsLCBicmlnaHRuZXNzKTsN
Cj4gfQ0KDQpJ4oCZbGwgcmVwbGFjZSB0aGUgb3JpZ2luYWwgY29kZSB3aXRoIHRoaXMNCg0KPiAN
Cj4gTWF5YmUgaXQncyB3b3J0aCB0byBtYWtlIEFQUExFVEJfQkxfKiBhbiBlbnVtIGZvciBtb3Jl
IGNsYXJpdHkuDQoNCkkgZG9u4oCZdCB0aGluayB0aGVyZSBpcyBhIHNwZWNpZmljIG5lZWQgZm9y
IGFuIGVudW0gaGVyZQ0KDQpJZiB5b3UgYXJlIGZpbmUgd2l0aCB0aGVzZSBjaGFuZ2VzLCBJ4oCZ
bGwgc2VuZCBhIHY1DQo+IA0KPj4+PiArIGVsc2UNCj4+Pj4gKyBicmlnaHRuZXNzID0gYmFja2xp
Z2h0X2dldF9icmlnaHRuZXNzKGJkZXYpOw0KPj4+PiArDQo+Pj4+ICsgcmV0dXJuIGFwcGxldGJf
Ymxfc2V0X2JyaWdodG5lc3MoYmwsIGFwcGxldGJfYmxfYnJpZ2h0bmVzc19tYXBbYnJpZ2h0bmVz
c10pOw0KPj4+PiArfQ0KPj4+PiArDQo+IA0KPiA8c25pcD4NCg0KVGhhbmtzDQpBZGl0eWENCg0K
