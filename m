Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7492A3E600
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E3410E9DC;
	Thu, 20 Feb 2025 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="TBZBr8F9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.67.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABBE10E9DC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 20:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtmAOzeiebnsYQXMfUReeN3anJAi5SyTuwDZB8wfTBeYodQmv82wcD7xKBuCRlXJ3MNXT1NZmukI+vayodi0YPsj+AX9EK8O1Qd3bTvKceq1qqqeKI2ip5f0N8duf9RbNY2SzMSzjVlIQgy3+KfsVINlEx/lb3h7OUthyKnwx1MWTG795Kv7vHiHRgyjGovusT1wD/r4uBiGxw0Eb+jBKysvgR322NC+T12pMxilLBfl+xUpx6NLpNMbUXQad/yv3a7PAENdWvfcGregj9OkoFgpKouu1FENnGqCBOqMPvCX+W/yeOFjUdKLaLQkJG/vclEQcK26oWXjBR6n6K3ajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9wmHMBSZh0bUKqYZCXP6X/WUzMxmqZWUQHWoKmtq4I=;
 b=ZcjI0L8FARu7ZH/G1CR7Rpp3ZfskLjRCAl7HMnUBuoti8X36aqD3+ZGGm5uaxwaRJzBS29wFFbFGh9T0NRSAsfqtjgaBL3iI1ZowwMa5bOTHcuCWBi/TBoaoqg3t/6pPH63yRYne3hhcMhxph7dGoJJzU0vHrHuWP+j+u9Ds3Tf0kdBI3Fv3oCxobW1JYgqoxpbbAUwg0vCUCWqK9J02af9/KB7uD6W30O9QlSem9s7BrYCWfZMZjpFcU1A3iHewLn1bOOpg/7GijI3kXMh4w1Hio8EvayVoK0+ERc1uyhN6rnCQBOu6PD/6nrbJxaj8TewY4mUK/UjFVNOpL/Ys5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9wmHMBSZh0bUKqYZCXP6X/WUzMxmqZWUQHWoKmtq4I=;
 b=TBZBr8F9axsemIivg8TvIu7WCOB83nCHHNIWf91O9Zuzpc+P/3woln/TudlJlwYGYpx8iX2pYslODhpk27iepzUdtbCkReguI81LHt2eKfFAJQvCXjo3GJq1IgGn5114mvxy3pRtHohHYuR+ZfGMgORQnjkidh2DZavfjS27KGoUoXgV3o5W5we+YhC8wlSLdkorQbqvmz0iBriCHbghvKZWH6nZ6RaaJ3w0Bgco0mbxJbrITHJidcTvEF4rLw5I3LgS2DhCdYYqIuORcgrOnAxBcbQ74AMsj3NkGoOjlunYuhkDxAwlE1Aae8yHLmR49GIuZXcPF4xoCnEMMg7wdA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA1PR01MB4273.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:15::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Thu, 20 Feb
 2025 20:41:05 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Thu, 20 Feb 2025
 20:41:05 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Neal Gompa <neal@gompa.dev>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "kekrby@gmail.com" <kekrby@gmail.com>,
 "admin@kodeit.net" <admin@kodeit.net>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, "evepolonium@gmail.com" <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector
 Martin <marcan@marcan.st>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>, Sven Peter
 <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v2 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbg7Yiy5uw96uLM0CihTgzlh/R37NQhMwAgAAjP4A=
Date: Thu, 20 Feb 2025 20:41:05 +0000
Message-ID: <2F0ACEE2-231F-426C-952E-975670AFC87D@live.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <1EFD4096-FB85-47BB-9952-E014E463DB1B@live.com>
 <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
In-Reply-To: <CAEg-Je8VaMGxztdu9+Uk5dFJeYaru=nFSZhpVczM79GaCYURkw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA1PR01MB4273:EE_
x-ms-office365-filtering-correlation-id: 1cdf8d40-a235-44e9-1f11-08dd51eee5e2
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8060799006|7092599003|15080799006|19110799003|12121999004|8062599003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?Y2RUelQxaGNVclBYSGllamxLRVBMQzY0Ung1eUdyUXB2bWVOUlloQ3JJN0V4?=
 =?utf-8?B?dkNtZTlMMnp0MHJsTjA4d0F6cjZ0aXV1SUorNFpFZmZ2d1JMbGF4SW1udU1Y?=
 =?utf-8?B?MnBITllRaWJaam5mQzBid3FqK0x0TEdNTkcxcjFHdlZ4UnkrMUJsNnVKVkww?=
 =?utf-8?B?d25abDlLcnJIV0lzOUdqSEpRekZOMU4yelVZQzlxRjdlQlNiYmN0T3hVcnYr?=
 =?utf-8?B?Wm0wUkdQeXllUmlrT0sxMnpMNG96cCtTbVJ3ckJKUW9IRFZwdm9yYUIxY05J?=
 =?utf-8?B?V3pLSVhqbmhSakIzR0ZtbExIN1pnU25XeEozUHBKTDk5N0ZvekRPWCtYemJB?=
 =?utf-8?B?TVRqVHR2YXRaR3ZDckQ5bTFrby8zd01uNFc1TWhrU28vMytKM0YzSkpvSFFn?=
 =?utf-8?B?VklOS1FPcWJQZUsvQUU2akpSWlU3Q0VyNG1heWNBWWpLdGpRemFtaWF2U05s?=
 =?utf-8?B?OHZVSHJyKzE5YmNuT3NZZzR6ejd5WjhHeW9IMmMzREswU3lyTzlDMzVqYmZJ?=
 =?utf-8?B?bFVQa1ZzcUpkWjZNUHBCa3g2NDRjVXJnMUFQUHphTlRhT0pkWGhyRVp6dkQ2?=
 =?utf-8?B?anVqRm0rM1dtWFB0Y1VLdE8wNjh6eDR0a1NmZTl1Qk5MYUdmdHoyYkh0R2JK?=
 =?utf-8?B?bFc2eHdLN3kwcjcvYkxlcjMvTWRlSTdhWVJCaEIxT2NQWVk1OVd5NWYvckZz?=
 =?utf-8?B?Vk1ROEgyTXZNL2NrbkRiZVhTUnd6cGhZMUFvUmg2UFcyNkYxNk1FT1hEUysz?=
 =?utf-8?B?M3c5MmJEUWdOdUI0Q2NCV0pVczVoMmYwcDExSEcweTJHWTN3bUdZbytjKy9h?=
 =?utf-8?B?UVM5Nk1ITjRyTCtOTzNJZ3hhYjBJM1IySWFhYnI5bTNpZkpGSVc4a3pLY1pX?=
 =?utf-8?B?dHhXanMrcWhUMGxWd1FxYVRFZzVGNDVQSmhlUldZNXdFbm8vamRnZlpkL2w2?=
 =?utf-8?B?eXVvM3VCc05KYUxDYzByQldOcTdPOXVhdXl3NklSTXR0dzBrV2xFU2hqejJM?=
 =?utf-8?B?VERYZzBFOXlxWDk3VnRkdmFlaENXT01Rb1A3RFJJWmpMY1lOT015aE8wRm56?=
 =?utf-8?B?Y3lFcDQ5Q0FTM3FHR3NsK1QwZ282TDBkNWVJdEpaSDZoRTM5N0dwS3IzeUx1?=
 =?utf-8?B?a0FuaFhpdUdQeUpYaytkempVWkhsSXBnZGpjaDR0ZlVjRTZXbW1jbTc3SW1W?=
 =?utf-8?B?M0ZiT3BvemI5TUh1NHMxNFhlcXNtKzFQdXFDVW51NFBKV1FYMStINjB0b09B?=
 =?utf-8?B?VzIyRjVacXphUzdzWEpGRm8rTmMwZ0dhMWtXTWZNVWorUWVkR2hwK1htSzly?=
 =?utf-8?B?STlGNkNuZUVuZUduU0JObDJlSUU3UkhYRUgzY3VWazQ0NDMrVkJxeUluL3FB?=
 =?utf-8?B?QVdoUDRtVlJqNWRZQmUyMzFHSmtURDRERGFMbFVyU015NzBBZWIvOE9SRHND?=
 =?utf-8?B?ZDQ4VDlpUjlxN3VZMWQrZ254UFBFMExCNi80MjZlblRDcG12ak5zeHpHUTRP?=
 =?utf-8?Q?AUOzuI=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGh0T0RaZVdMQ2tjenpjanM3WmhmVkI4YVNkTXdhSlhpLy82MHIxVXRTbmpG?=
 =?utf-8?B?UmFXd20wR1Vrc05RdmwzQllTbkFMY3hiRlZGcExyZk5SNVplcXZvS0krQ3di?=
 =?utf-8?B?czh0WmtwVkw5YmtlVnBnOTYzRndKR2Y2UWwweEJRYWl1bGQ5ZzBOU0lHbHZ0?=
 =?utf-8?B?YkE3N2NMcUdvLzNxSzFwYU5nZUZPSk92dk1KcTFULzV1aUE2cDh6ZUg2R1k2?=
 =?utf-8?B?TDluVHhTQlJkc0VrTnR4eHRQd1A0NWZFRzl3cFVUbllMaUkxM1pHUG0vRHZw?=
 =?utf-8?B?Qm1RMFVhdnYvSE5NRk9CdlVHdnpDdll6SVRESm9UUjM3a3BRNVBKMi9iV2ov?=
 =?utf-8?B?ZjhlaUM4MmJNWmc2eFpEUThIa0hlUWZHYzJodFJOU2hOLzlzcG1FMElCZExG?=
 =?utf-8?B?NUpXWFhLbHRqOXFDUmtscWJpSDdhK0grNVlpM1hIc0ZiQVhhSE5zaHk0QjZP?=
 =?utf-8?B?MmN5YnNYT2hqS2RUalJQL20walphTTZZOVFtYXlSUWw4WWF6Z3lVNWpvd0hl?=
 =?utf-8?B?M0NkMW9xNEVlQllOVC9EbnZjdE1VVk5wSjJ6VS9LTFZZRFFLV1U2UlIrUkdp?=
 =?utf-8?B?VDBqcUtleG1mMENicnlYU1dKOFRnOGNiSE1PZnpaNlQ3ekJCaEdxMkQ4MFMw?=
 =?utf-8?B?UkVYNks4QTNUSUhXQXZqQWNDWkRCWElXVzFzcVlISTZuUmRPZ2VKREVxWXQv?=
 =?utf-8?B?Tng0Q2dMSkp6ZU5STHpCVWppL29KZXl5RkJ0NXFpY1F0aTVtbG5Fd2ZTZUNM?=
 =?utf-8?B?VlZPWkFuSE5tQTBubFBoQkVQSFNYakU4LytaWm9QTUtsNDVkek9HUlZ2WktS?=
 =?utf-8?B?Nm55NnRWR3ZCV3UwdFg0WXdxUXJoRGw4bnlJZEhnOWtvNXRtc2ZFZ1J4YW5u?=
 =?utf-8?B?VDQ0VDI1ZFZ0OGlyVGFCOGxRREZ5dnU1Z0N1V2hUamNPUnRqWENIUHM1MW1L?=
 =?utf-8?B?QlBUU1lzZCtIZzJrR3F6cjd2NGduT080cmp3Tmp6K0VLLzdieU1iU0pYZ1Mz?=
 =?utf-8?B?WGxiNStYemJZeElaRHVHd2pKaFhraEJneHBocnpteGFZVG9aY255NnhyK0Z4?=
 =?utf-8?B?czgzcG5LYTF2SCsyWTVvQjA3cTVzUTlUYlcvTmJsb0lIeFRLUlF5SElYVGda?=
 =?utf-8?B?bFEyczlzVkVKbitzNlliQ0llbUZJZnNVWkp3czF4WkI3ZWFWVjFnSHBQdVhG?=
 =?utf-8?B?SklrS2pBRWk1ZUpTWGFGMjZPdEJxUWJCY2JKemt3UFI3MW8xMWR4N0NQUEVN?=
 =?utf-8?B?QUl2N2tNTVVwbjB1TUFRYW8xL01ZNzl5TUhZcWZLOTdSd3E4bklabTFzamE1?=
 =?utf-8?B?NGR2TUZ2QlZwUTVMVEhMT09tWUJ4MTE0OGovWFhwSHk0ZkhYejd5cVBKeTQy?=
 =?utf-8?B?QXhkTG1tbXdrdGkrNHVpNTZRNm9VeCtZWkRic0RwejVLVzhJZFdlQVU3djdx?=
 =?utf-8?B?L3NsNXBQVU1vUWMrUE5VQW9wMVZpT3RaOTUyL0c1ejcrSGJYTDhJK1AzZVBP?=
 =?utf-8?B?V0RGeXJaNklDYTlLWmFEbUFEc3FNRWJYL0hzdW93NFg3Q0QzNW1QYXdQaCtH?=
 =?utf-8?B?Wm9zK2w0bDBTZWt6MllGMUNYWlR1bERPanNxbW1NdFhmcmE1SFNFU2lCZHFH?=
 =?utf-8?B?WjBjcUhhZGVRNDdvZzVzMElKd1NUQlpkY1RsdTl5czI1OXNqcGNtaE14L1I4?=
 =?utf-8?B?Nmg2Rmk0NDNCY1lRUnc4cWFHTFdkUE1NNHdKT3NoNlQyL2dLb0liemowbVVl?=
 =?utf-8?Q?9w57aSDXi/7A26wB/QMqdWyusif168tZmkrgGht?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4C8DC5B5C3DE04B95F9B328441AFF9A@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdf8d40-a235-44e9-1f11-08dd51eee5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 20:41:05.7130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4273
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

SGkNCg0KPiBPbiAyMSBGZWIgMjAyNSwgYXQgMTI6MDTigK9BTSwgTmVhbCBHb21wYSA8bmVhbEBn
b21wYS5kZXY+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMTE6NDfigK9B
TSBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToNCj4+IA0KPj4gRnJv
bTogS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4NCj4+IA0KPj4gVGhlIFRvdWNoIEJh
cnMgZm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUN
Cj4+IHdoZXJlIHRoZSBkZXZpY2UgcHJlc2VudHMgaXRzZWxmIGFzIGEgSElEIGtleWJvYXJkIGFu
ZCBjYW4gZGlzcGxheQ0KPj4gcHJlZGVmaW5lZCBzZXRzIG9mIGtleXMsIGFuZCBvbmUgd2hlcmUg
dGhlIG9wZXJhdGluZyBzeXN0ZW0gaGFzIGZ1bGwNCj4+IGNvbnRyb2wgb3ZlciB3aGF0IGlzIGRp
c3BsYXllZC4NCj4+IA0KPj4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgZGlzcGxh
eSBmdW5jdGlvbmFsaXR5IG9mIHRoZSBzZWNvbmQNCj4+IGNvbmZpZ3VyYXRpb24uIEZ1bmN0aW9u
YWxpdHkgZm9yIHRoZSBmaXJzdCBjb25maWd1cmF0aW9uIGhhcyBiZWVuDQo+PiBtZXJnZWQgaW4g
dGhlIEhJRCB0cmVlLg0KPj4gDQo+PiBOb3RlIHRoYXQgdGhpcyBkcml2ZXIgaGFzIG9ubHkgYmVl
biB0ZXN0ZWQgb24gVDIgTWFjcywgYW5kIG9ubHkgaW5jbHVkZXMNCj4+IHRoZSBVU0IgZGV2aWNl
IElEIGZvciB0aGVzZSBkZXZpY2VzLiBUZXN0aW5nIG9uIFQxIE1hY3Mgd291bGQgYmUNCj4+IGFw
cHJlY2lhdGVkLg0KPj4gDQo+PiBDcmVkaXQgZ29lcyB0byBAaW1idXNodW8gb24gR2l0SHViIGZv
ciByZXZlcnNlIGVuZ2luZWVyaW5nIG1vc3Qgb2YgdGhlDQo+PiBwcm90b2NvbC4NCj4+IA0KPiAN
Cj4gQ2FuIHdlIGNyZWRpdCB0aGVtIGFzICJCZW4gKEJpbmd4aW5nKSBXYW5nIiBpbnN0ZWFkPyBU
aGF0J3MgdGhlIG5hbWUNCj4gb24gdGhlaXIgR2l0SHViIHByb2ZpbGUuDQoNClN1cmUgSSBjYW4g
Y2hhbmdlIHRoYXQuIEnigJlsbCB3YWl0IGZvciBhIHJldmlldyBvbiB0aGUgZHJpdmVyIGl0c2Vs
ZiBhcyB3ZWxsLCBhbmQgaW5jb3Jwb3JhdGUgdGhpcyBjaGFuZ2UgYWxvbmcgd2l0aCBvdGhlciBj
aGFuZ2VzIHJlcXVlc3RlZCAoaWYgYW55KS4NCj4gDQo+IA0KPiAtLSANCj4g55yf5a6f44Gv44GE
44Gk44KC5LiA44Gk77yBLyBBbHdheXMsIHRoZXJlJ3Mgb25seSBvbmUgdHJ1dGghDQoNCg0K
