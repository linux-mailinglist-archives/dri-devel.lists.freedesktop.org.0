Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F3A38219
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFD610E42E;
	Mon, 17 Feb 2025 11:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="VZCVEFkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5CA10E42C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1q9VMtXjOjfhEwkadCC4uROJ7YkirhM08fOe1SnooJojY1HeYxZk/ohmE1bIcJtcNVvQDgHc4FDlmLBREwB+/r9G1q5joVgMaWoviLJSzcVwZkOIbdA7YEC6buZYMZWNwszYDtrVqGhG3Wv02DMKfuPX3NwrtlSTTkGwpNiKtj9jLsqROTkm3Cxh+0QyO/Ju9sNfHklZjq8bC4J2z0436OdVwmntXGw13d0cim6Hqt8dzWn2FGvzkNvHQWCn9p+EWaJUKm6l7O3YU75NoAFe44F6cKcUXoMEczR19QkGXGP979CePR8Az5G+ztclSOCfrS0yWGRDBwSI51fXu9KGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/YlweUwXO2tO9dgaZ7mM6areTJMSoaDGuLtXGJiHBg=;
 b=O3C4PhYm/fe2Y7E4sB1Ipvl/goYN17cn16toHH8lDhhF8mxFYfcqiS/F3wuaOV0BsfQiQDID1peiW4huK0maRdnDzWsJsst+zt/DzOtTTNX22yTHeL6bYlPolaTyOe6QiZhPeI9vuRa1rZ0ns7hPdeO3SJr3Yw7L9Yn4I+1w8yFROxTlhdM4DKR4RZKKq3ptsMPThh6TYZhK6zIC7T5wt5oCnFbBrrBgdtfFsrkVFnntyFBNATbjIawVvF66GZ+r1CCmpTTwP5BrPeIHI0SUOl3Oz8gJG6l3OPl4G04S1R67R1dTDYZCI7zibYn5ttgAIDpgnRWWHvVldsMHsOOz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/YlweUwXO2tO9dgaZ7mM6areTJMSoaDGuLtXGJiHBg=;
 b=VZCVEFkLY4Oylw+hdsT2cBs+9xlhyL6WVCQiIYcjKHkYTV++i2U0Vao1dnALI+wD2EzOiSF6kfETWZqF9h5jqu2uhTgkWaPl04kSKPF0acMx0i0WeG4bfebaCSfKXcB6tyO/ucRUqcSDTMyk2tJP42eVROLTil9KfQvMPasSp+ylY2ji+bqux6L4+kprxMotx3/4FhfzRG7jX+3NfS5kP1kcV6XuOUd2EkU+vevjUOWFSUR5HKxp0S7IdbmraQ8zX0IpJFXHqhi9cbJkRW6s9tldPYxx6GBxX6HLEAoZfli09qzYlkYzNzw1NQa+iAR2PUtGQgRZwBBsRDZBAgzdUA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PPF22C3B29B7.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::18f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Mon, 17 Feb
 2025 11:43:22 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 11:43:22 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in
 x86 Macs
Thread-Topic: [RFC PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars
 in x86 Macs
Thread-Index: AQHbf6+coceLhcy3oU2ax9gp3VEqqLNLJcIAgAA9KYk=
Date: Mon, 17 Feb 2025 11:43:21 +0000
Message-ID: <PNZPR01MB447845E0E272252D11BDB60DB8FB2@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
 <8d0296fe-536f-4a9a-bd9e-624bb4cd8703@suse.de>
 <1C5F4A8E-018C-4A39-B8EE-CDDDF9FABD7A@live.com>
 <3df4e526-66a4-4dcd-8c6e-adacd9a2a5aa@suse.de>
In-Reply-To: <3df4e526-66a4-4dcd-8c6e-adacd9a2a5aa@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PPF22C3B29B7:EE_
x-ms-office365-filtering-correlation-id: 121826c1-27b4-4423-f08e-08dd4f4847f9
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|19110799003|15080799006|7092599003|6072599003|8060799006|3412199025|10035399004|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?dWxlN0ZCaUdVWnVXSGpNb3FObFhTRnFRMUdNQnRWcHNKZlUycXc1ZldhZi9x?=
 =?utf-8?B?NkhqckwxWHZzYWFlR0FpSmZKKzZUYk1BbGg0S1BUVmNvNGpQZ2dmNTIwVnVU?=
 =?utf-8?B?WUZRMWsrc2E2alBFSmlPc2F4cXdCUnhLeXlvdmRLWHl0SURaWkpLRDl6LzNB?=
 =?utf-8?B?WmRNd3lwRWhnR1J4L1lJU1ZLVCtIY1c3NU11dS9vS1R2VzBVRTE1VVR1T3B6?=
 =?utf-8?B?Q21LeDB3aTYwSkMyTEF1WXBROHdZTzRzWk0wWGJYSjl5NzJYbU5ZdU1INGpL?=
 =?utf-8?B?S2ZLTXNzcUVGbm5GcEVkc2RoU3BUR1VYcHI0WXVRS1htaUc1bGgyeGtBRmwy?=
 =?utf-8?B?dzdBSkFSRjFoc3J6K1pFeGJ6WmpLTTFvMnNuMlR2amJPdHBYUjB0VXdJZ3Fh?=
 =?utf-8?B?WWpHQTB1NHJoazltTkZabFRoYUU3WTRoVzJaVzQ2TXp2THhVeEZBeFhqZmVT?=
 =?utf-8?B?Vk1hQzRHRk5yS3hqSHg5a0hVdWFpT1paTmRWY3VzQVdYM0JlUGlPYzRmNENl?=
 =?utf-8?B?ckUzMTBjc2QzQkYyc0JCcFpoNkVxRWNuRDF0VnBxajdjQnI5YTFUYjRvR2ZZ?=
 =?utf-8?B?QlQ2cldkRS9UNzN4M0lzM0NmVWlYYUkzVWFBTEhZTEFmOXdNaFhJamEybGhT?=
 =?utf-8?B?Wk02aWVmK0ZZM1ErYzlrc3BYWDg0ajE3TGNTMWJMU1V3K002VGg4TGdEZWg2?=
 =?utf-8?B?RG9YYWN1SXpHTHlIREw3T3NpaUh6UHBaWTRqTUNpdG10TW9NdWtvU0xYeENH?=
 =?utf-8?B?R2lkZ243YVhWZGI0RTl6cDUydlNqQ0lZWTlxTXIzdUo0ZGY4bDREbFdReTVM?=
 =?utf-8?B?amNUMDgzYkRvVmZHYzFlRmtKdC9XdkJLZTMwSzZrKzRVY2Jaa0hJcDZTaTJs?=
 =?utf-8?B?Y3BsOEtuOHNUR0sycVd3VzY1UnVxdVd4bDh0aDArMVFLTXAzM0Mrd0tTRUVP?=
 =?utf-8?B?T1hYQkZpVDJPU2pJWFV3NTF0NWJLM0VSbjVsbURHUGQrd0RYeUZiaGh6VWxi?=
 =?utf-8?B?NURrZ0phVkNuS2lkZWtlMGk4UmhCN1ZQblpyY3M5WVNieUJzU1JRYXNIckdh?=
 =?utf-8?B?R2E4V3psYkxHbkU1YXpONGg5MHNVREQrYVlyS0dyc3hxajFNdG1QNHQ2NHFq?=
 =?utf-8?B?Z2pySVBpTTd5cFEyZDF6L09IRlczOC9tR3ZjaFo0RTdmd3V5TnhFelVkNHlO?=
 =?utf-8?B?My9PYzAxS2pCcWdOWFF6WlBZaGxoV25SN1AvY2psalR0TUhxNU9JL0Fna0hK?=
 =?utf-8?B?UnhoT0NxdzZKTzJGUzFFTVoyay9tVUdyV3dqVGEyUUtJMXhOdmlPblFzV2dW?=
 =?utf-8?B?a2xSK0h1WE9pSTYvKzYwa25ySnpaTmtuSFRjNDdvd29xUXdFWmpUdnBRdHV5?=
 =?utf-8?B?MW9MN3pncEpqNFV0S0xYL0d2MGhDTmhtNWJWY1I3WXlWNHF6MExCMm0xY1Fx?=
 =?utf-8?B?YU9VZ1FnK3dwQlExbnBpVGkwMFlzYlpRc29qem5JM3ZXSEIzb0Y0MGx4MDBn?=
 =?utf-8?B?c284ZjRSZUlrNHdpR2daZno0cGl6M3JsWWQzMlpuZERvcHc1cXp1QkhJSXQy?=
 =?utf-8?Q?Hk3/Omf2nJIfl8rdEDJXfJzr+TR6mWruLzRyYhw7UmHDA9?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVZHQkMvTjhpVkN3NlJqT3hCaytHWjlyeUo1UjFRcGJhZklXNWtUN1p3MnMx?=
 =?utf-8?B?Z0NDN3BFSTFkMW8rNTNBUDZkUHEwOVZTTmxrRnE5QTRnSTZJVFE2MktSWjVU?=
 =?utf-8?B?b2JGM1d3aVVSeXhRc3BoTDRvZlpHdk8vZ2pIbXkxL1hxanlDTXJCNVM4ZENx?=
 =?utf-8?B?UjMzOGtRd3VVM1hQbnkxYVE3aklPK3R4d1JkSVhReDBIRW5UZGdZbEx4RVF2?=
 =?utf-8?B?RzBFNmI3MU54ZUJ3OTdlZ0Q3K0FyTUdwVVJ5eG55TkU5M3F0WnJsSGRnenlw?=
 =?utf-8?B?RVNSWXk1YU9iZXFPWmQwZHNmMk9xT3dacUZaVDNFbUUwcHFxVkRXM2tOMVJW?=
 =?utf-8?B?Q3J3ZXlOWUlwdjhVSm1UOWd1RDE1b0l5Rkh2ajkwNllqdnBDMWxwc0pHNnpN?=
 =?utf-8?B?WXJKTUsyNkJwSzMzcHNJUm9mZVRKNUE2d20rc0hadFlVWm1jRHBFOVVmRllt?=
 =?utf-8?B?cFlhRjczbUJoaWFYcjRZalFnMnR3eis2M3N3SVFiakhqV3ltQ1RIdFFyN09Q?=
 =?utf-8?B?MzVJczZHWi9HakJBTEtQUHZZMWNsSHlNSlFxK3cxWFZMZVVQOVVuR1RRNlJz?=
 =?utf-8?B?a3ZqZ0tWTkFvbmNUQ2ZxSkxQQzFEcExmZ3EwcGxsZ0c1akpTU1BDVGxRSU5I?=
 =?utf-8?B?dUU3cC9tNTQrWHFONDNxQVNobHhETnFkWjI2cHhhd1hoLzU4dVBzbkpJNGRj?=
 =?utf-8?B?cWhhZUplRjFkYlRNaks4ODNLN0VyM1JGK0hSN2JxQ05qSFBZUjV5RjhOaU96?=
 =?utf-8?B?WndwNmg1MXBWd211L3R2YmwwSUpQREJBTm96N2puKzF5OWhCWlUvSTlqQTNS?=
 =?utf-8?B?cnRxKzcvODdhdEpsWkNrTzZLNFRPQUhtZkl1V0pGNDZDOUE5VFZYcHROZUhz?=
 =?utf-8?B?M25lUnR0d0c3dVNvTVJIZnR1ZWYvbDNPQ1JhdUtESHhQWmhvWnArU3RXalA2?=
 =?utf-8?B?U1MxcXJiV2lTWkFuNGo3VFFrWVFteEdtNmN1STlwb21tREh3b3hxZjBVNk5p?=
 =?utf-8?B?VXlId0JJbWZkWXZaU1JlREttdjdQL2JGSlUvOGFYVmhhWUpVRkFyalF5a243?=
 =?utf-8?B?WlMyWCtreitmNkdBekQrR2xzQWlralNQUVFnY3FtSnZWeEtyRkRuSXlOd3Vj?=
 =?utf-8?B?NkRmakplbFo5RENVZGQ2SG03Q3grL0pxNWJTMVB2Z2J2cXU1V01wNkcvOHcr?=
 =?utf-8?B?cDJlNXRVYUhSNWVBSGpaU1F0RU5oTUxGRXVLV3M2OVo3WjlHbXZQR3YvYUJ6?=
 =?utf-8?B?NHhqenZlbU9ZTFBOSGtjaTM5UysrYUUwLzRNVGxsb0ZuazgrTnBKYXEzWXR6?=
 =?utf-8?B?TnZoOU0yZ3ZDUlk1Ym14UWhCVU81WHpzYmpFcXBPZjgzRzdWSXZyYnpZRG44?=
 =?utf-8?B?NDdaUkpiajlFL25PVVRseHBpbkVoRVN4NzcvTnVrRXM5RUFicnE4KytBcEU1?=
 =?utf-8?B?T0QxMTFEMlpZc1V0VUZFb3p4SEJxSHUwVmZkUklpUkx1OHYwRUJKVENLaVR4?=
 =?utf-8?B?c3dYQVZ5aXpDbmwrT0hLME5hMWt3R1ppUnAyQ09LcWJRM1hkVjNNQXhIL2hu?=
 =?utf-8?B?bUFwY2hZSkRCYmhrQzBQL0ErSGUzdWZrZURYenZtL29BdDJpdy9SZTZNTUhY?=
 =?utf-8?B?YkhSY3NSSTFlcWlCMXlLbTluSmNhbjZRTEJCWHZxcUhyWTVrZXl2RTlnVmNY?=
 =?utf-8?B?bWlGWXlORElwREt6M21zbjJZVS9LL3ZCcXBPZlFiVFNzLy95eExJeG8vVXYy?=
 =?utf-8?Q?yUncVnPuNbg9YhN90I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 121826c1-27b4-4423-f08e-08dd4f4847f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 11:43:21.9842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF22C3B29B7
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

SGkgVGhvbWFzDQoNCj4gT24gMTcgRmViIDIwMjUsIGF0IDE6MzTigK9QTSwgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkgQWRpdHlhLA0K
PiANCj4gdGhlIGNvZGUgbG9va3MgY29ycmVjdCBvdmVyYWxsLiBUaGVyZSdzIG9uZSBwbGFjZSB3
aGVyZSBJIHRoaW5rIGl0IGZhaWxzLiBTZWUgYmVsb3cuDQo+IA0KPiBBbSAxNS4wMi4yNSB1bSAx
NDo0MyBzY2hyaWViIEFkaXR5YSBHYXJnOg0KPiBbLi4uXQ0KPj4gREVGSU5FX0RSTV9HRU1fRk9Q
UyhhcHBsZXRiZHJtX2RybV9mb3BzKTsNCj4+IEBAIC00ODQsMTAgKzUzNywzOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9kcml2ZXIgYXBwbGV0YmRybV9kcm1fZHJpdmVyID0gew0KPj4gc3Rh
dGljIGludCBhcHBsZXRiZHJtX3NldHVwX21vZGVfY29uZmlnKHN0cnVjdCBhcHBsZXRiZHJtX2Rl
dmljZSAqYWRldikNCj4+IHsNCj4+ICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ig
PSAmYWRldi0+Y29ubmVjdG9yOw0KPj4gKyAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwcmltYXJ5X3Bs
YW5lOw0KPj4gKyAgICBzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+PiArICAgIHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlcjsNCj4+ICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAmYWRldi0+
ZHJtOw0KPj4gICAgc3RydWN0IGRldmljZSAqZGV2ID0gYWRldi0+ZGV2Ow0KPj4gICAgaW50IHJl
dDsNCj4+IA0KPj4gKyAgICBwcmltYXJ5X3BsYW5lID0gJmFkZXYtPnByaW1hcnlfcGxhbmU7DQo+
PiArICAgIHJldCA9IGRybV91bml2ZXJzYWxfcGxhbmVfaW5pdChkcm0sIHByaW1hcnlfcGxhbmUs
IDAsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAmYXBwbGV0YmRybV9wcmltYXJ5X3BsYW5l
X2Z1bmNzLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXBwbGV0YmRybV9wcmltYXJ5X3Bs
YW5lX2Zvcm1hdHMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKGFwcGxl
dGJkcm1fcHJpbWFyeV9wbGFuZV9mb3JtYXRzKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IE5VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBEUk1fUExBTkVfVFlQRV9QUklNQVJZ
LCBOVUxMKTsNCj4+ICsgICAgaWYgKHJldCkNCj4+ICsgICAgICAgIHJldHVybiByZXQ7DQo+PiAr
ICAgIGRybV9wbGFuZV9oZWxwZXJfYWRkKHByaW1hcnlfcGxhbmUsICZhcHBsZXRiZHJtX3ByaW1h
cnlfcGxhbmVfaGVscGVyX2Z1bmNzKTsNCj4+ICsNCj4+ICsgICAgY3J0YyA9ICZhZGV2LT5jcnRj
Ow0KPj4gKyAgICByZXQgPSBkcm1fY3J0Y19pbml0X3dpdGhfcGxhbmVzKGRybSwgY3J0YywgcHJp
bWFyeV9wbGFuZSwgTlVMTCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICZhcHBsZXRiZHJtX2Ny
dGNfZnVuY3MsIE5VTEwpOw0KPj4gKyAgICBpZiAocmV0KQ0KPj4gKyAgICAgICAgcmV0dXJuIHJl
dDsNCj4+ICsgICAgZHJtX2NydGNfaGVscGVyX2FkZChjcnRjLCAmYXBwbGV0YmRybV9jcnRjX2hl
bHBlcl9mdW5jcyk7DQo+PiArDQo+PiArICAgIGVuY29kZXIgPSAmYWRldi0+ZW5jb2RlcjsNCj4+
ICsgICAgcmV0ID0gZHJtX2VuY29kZXJfaW5pdChkcm0sIGVuY29kZXIsICZhcHBsZXRiZHJtX2Vu
Y29kZXJfZnVuY3MsDQo+PiArICAgICAgICAgICAgICAgICAgIERSTV9NT0RFX0VOQ09ERVJfREFD
LCBOVUxMKTsNCj4+ICsgICAgaWYgKHJldCkNCj4+ICsgICAgICAgIHJldHVybiByZXQ7DQo+PiAr
ICAgIGVuY29kZXItPnBvc3NpYmxlX2NydGNzID0gZHJtX2NydGNfbWFzayhjcnRjKTsNCj4+ICsN
Cj4+ICAgIHJldCA9IGRybW1fbW9kZV9jb25maWdfaW5pdChkcm0pOw0KPiANCj4gVHJ5IHRvIGRv
IGRybW1fbW9kZV9jb25maWdfaW5pdCgpIGZpcnN0LiBUaGUgaW5pdGlhbGl6YXRpb24gb2YgcGxh
bmVzLCBjcnRjcyBhbmQgZW5jb2RlcnMgcmVxdWlyZXMgaXQuIFNlZSBbMV0gZm9yIGhvdyBvdGhl
ciBkcml2ZXJzIG9yZGVyIHRoZXNlIGNhbGxzLg0KDQpJbmRlZWQgdGhhdCB3YXMgdGhlIGlzc3Vl
LiBUaGFua3MgYSBsb3QgZm9yIGdpdmluZyBtZSB0aW1lIHRvIGZpeCB0aGlzLiBZb3UgYXJlIGEg
bGlmZXNhdmVyIQ0KPiANCj4+ICAgIGlmIChyZXQpDQo+PiAgICAgICAgcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBtb2RlIGNvbmZpZ3VyYXRpb25c
biIpOw0KPj4gQEAgLTUzMCwxMyArNjExLDEzIEBAIHN0YXRpYyBpbnQgYXBwbGV0YmRybV9zZXR1
cF9tb2RlX2NvbmZpZyhzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UgKmFkZXYpDQo+PiAgICBpZiAo
cmV0KQ0KPj4gICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRv
IHNldCBub24tZGVza3RvcCBwcm9wZXJ0eVxuIik7DQo+PiANCj4+IC0gICAgcmV0ID0gZHJtX3Np
bXBsZV9kaXNwbGF5X3BpcGVfaW5pdChkcm0sICZhZGV2LT5waXBlLCAmYXBwbGV0YmRybV9waXBl
X2Z1bmNzLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgYXBwbGV0YmRybV9mb3JtYXRzLCBB
UlJBWV9TSVpFKGFwcGxldGJkcm1fZm9ybWF0cyksDQo+PiAtICAgICAgICAgICAgICAgICAgICAg
ICBOVUxMLCAmYWRldi0+Y29ubmVjdG9yKTsNCj4+ICsgICAgcmV0ID0gZHJtX2Nvbm5lY3Rvcl9h
dHRhY2hfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIpOw0KPj4gKw0KPj4gICAgaWYgKHJldCkN
Cj4+ICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBpbml0
aWFsaXplIHNpbXBsZSBkaXNwbGF5IHBpcGVcbiIpOw0KPj4gDQo+PiAtICAgIGRybV9wbGFuZV9l
bmFibGVfZmJfZGFtYWdlX2NsaXBzKCZhZGV2LT5waXBlLnBsYW5lKTsNCj4gDQo+PiArICAgIGRy
bV9wbGFuZV9oZWxwZXJfYWRkKHByaW1hcnlfcGxhbmUsICZhcHBsZXRiZHJtX3ByaW1hcnlfcGxh
bmVfaGVscGVyX2Z1bmNzKTsNCj4gDQo+IFRoaXMgbGluZSBjYW4gYmUgcmVtb3ZlZC4gWW91J3Zl
IGFscmVhZHkgc2V0IHRoZSBwbGFuZSBoZWxwZXJzIGEgZmV3IGxpbmVzIGFib3ZlLg0KPiANCj4+
ICsgICAgZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoJmFkZXYtPnByaW1hcnlfcGxh
bmUpOw0KPiANCj4gQW5kIHRoaXMgY2FsbCBzaG91bGQgYmV0dGVyIGJlIGRvbmUgbmV4dCB0byB0
aGUgcGxhbmUgaW5pdC4gVGhlIGNvZGUgYXQgWzFdIGFnYWluIGdpdmVzIHlvdSBhbiBleGFtcGxl
IG9mIHRoZSBwcmVmZXJhYmxlIG9yZGVyLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0K
PiANCj4gWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEzLjIvc291cmNl
L2RyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMjTDYwNg0KPiANCj4+IA0KPj4gICAgZHJtX21v
ZGVfY29uZmlnX3Jlc2V0KGRybSk7DQo+PiANCj4+IA0KPj4gVGhlIGNvbW1pdCBoaXN0b3J5IGhh
dmluZyBib3RoIG9sZCBhbmQgbmV3IHJldmlzaW9ucyBvZiB0aGUgZHJpdmVyIGlzIGhlcmU6DQo+
PiANCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9BZGl0eWFHYXJnOC9hcHBsZS10b3VjaGJhci1kcnYv
YmxvYi9hdG9taWMvdXNyL3NyYy9hcHBsZS10b3VjaGJhci1hZHZhbmNlZC0wLjEvYXBwbGV0YmRy
bS5jDQo+PiANCj4+IFRoYW5rcw0KPj4gQWRpdHlhDQo+IA0KPiAtLQ0KPiAtLQ0KPiBUaG9tYXMg
WmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0Rv
bmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0KPiANCg==
