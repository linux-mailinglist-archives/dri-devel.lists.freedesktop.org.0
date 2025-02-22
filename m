Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2BA406AC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 10:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D4810E26E;
	Sat, 22 Feb 2025 09:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="CEht5sEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010010.outbound.protection.outlook.com
 [52.103.67.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C835710E261
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 09:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZvZOs/iqWran6vDJqCplDuCYmGbDT+TevhYJyaBufqjMb6GaH4lomuL+Jac1EUChglFwb9NypI4+0vTvTe+TCVycb7Dc4EIX4SKNpIfHJaqo08gzcsFGKANC04FUR0GW9lcJf5z97nEg44wzR7ooS6v+G1Skpcx+DEJUK54Koqp6kworigteHhZIM/aUOifGW6x9oXX5LoV4JHXgAOHI/oJ554YgbnEbOIyDzBFBNMWvxM6tlMUXzznTl/KA4Dp/BCh6EPBLZKLHuPVNf663mAlgJoeUy8nft0msQvogsOSyrzlB80dU2/Arssj+NY5Lcb8Fmr7VT6biiNeocDxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z76rtHdbQuca6rKwQqfun4ri+jWUhf4EU0QpfRNl/0w=;
 b=vkV2TccWch0JT41Bn3Jfzo5wgpg5qnzuyAdyCw5O1jpTiuSAZhJborLtHK2/RXpOaN88Qoes+0Dbi7hNTQ/+8qXLcOaajmQDY1JgfmgwFvuj9sOKuJD7rpY5yIsXPculh6QdXH9NFVPXT0CH3T+vUwYupcoGFauBzRzZnn2ebXflJphbgEvWPcXOOMYJFp9vzws63b5ueEkAelB08TEgdy0FGIbdK/0ex5oJcAunL96+tk42TzijnT3FGVnv2/3Mqm1pCPKw0AGjsj0C1ubiJO+7vFRT0FLiT3N7VOSFJFAz98mQg4rY4c/aIPZ9TLBx6C1OSJSc9yqHVWDcbg+KZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z76rtHdbQuca6rKwQqfun4ri+jWUhf4EU0QpfRNl/0w=;
 b=CEht5sEQTkYwZJO/7IQNNpvpw/7ePgnKTXXtGOeWhxwjO4/cAZ0HWJqQOEkMfqLWYZVtNpYJIGrA4ASwuaamQyK2Q0bTY4hWE1ABlFOFhUJZOlz13N0R6EFNRY12vw/6F1W3mlQ/Wbf0H01qsQfNgk9GH2QhP94su7PoPJnIMSvnH9yUtXXshGhX80lTbXN2yQJul/x6ZRYHK0l86X98Stwn+3KRgBVBqZWVUeCMLxrmnLS91QtSSl8zPWGDjvf8h/W2oWn01n/qAKJmDgHlPftzcLHtrHo4sr6Hmj6j+ir8aetIXJdatVVBOXGsW9rKnPIHDU3kT/E0jCiqg/Xf+w==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN0PR01MB6407.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:74::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 09:07:24 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 09:07:24 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, Kerem Karabay
 <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhFUNsu7CitoQSEyg6//EGVnJDbNR53mAgAA5FACAABkMgIAA0A4A
Date: Sat, 22 Feb 2025 09:07:24 +0000
Message-ID: <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
In-Reply-To: <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN0PR01MB6407:EE_
x-ms-office365-filtering-correlation-id: 1383049e-7009-47aa-7759-08dd53205296
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|461199028|7092599003|15080799006|3412199025|440099028|4302099013|10035399004|41001999003|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?d2RzenlBTWhtSHNPTnNTT0NOekY0U3F5cGJ5ZWhKNEt3cmpVSnp1UnVCT1Zq?=
 =?utf-8?B?bkdNOFMwVHZSY0JJUUFrL1dBMTR2ckllMHM3VmNWOFV1TFU2ekdvYkFOTlBm?=
 =?utf-8?B?TnNqZVI1bEREaGhjNmZtMnRSeWh2ZkxvNFd0bSt3M2dnMUFUc3kxT29nZklB?=
 =?utf-8?B?emJGZ3NtS0dadlIvK0oyMFJBc1RSMVBITE1nSzluODVsTXBKaUpISFpneDZz?=
 =?utf-8?B?aFJuSlFRWjFDSGlScjBETTRzcGtEcTZ2OVNQazFub0lGVDNzT1ljSjVBRitw?=
 =?utf-8?B?aXF2Q1NHSzVBUjhsZkMxc0t6ZnVQS2tiOGsvaGtBcjZpNEhjcG1TSm1zLzQr?=
 =?utf-8?B?c3ZFNUlBb1N3SDdCZ2hqQVJ5MkUxMXZDRkQ2bHFsUi95bHJkbDZoWDhtZmVH?=
 =?utf-8?B?cUVvVkFnblRkbWhxWmQ0VTJKWEswS2dnWVM3eGdKZjdiQWw2cEpnQVEvUURG?=
 =?utf-8?B?L21LblJyRFZzNXQ5elQ5VHJEdDBuR2RIZGhORTVNMHpIUWhHVXZkWGZXamlU?=
 =?utf-8?B?cGl4V0JkZzB5MmlpV3V0TEhkMGF1Nk1IMTRXTndIUlU2UmtSNXM5ZzBqMUox?=
 =?utf-8?B?NGNla3VLVno1c2s5aFgrV3dBZjFKMERlQlI4NHZiZGxMY3BSVytxaVFKL0Uy?=
 =?utf-8?B?aXZ1eGFRcHB4d3pHV3FRZC90RHRLQis5dUU5Wk5KZ1JVUXNDWFVlT2NNdmgy?=
 =?utf-8?B?VXp2ZW9LeGI5N2lFd0JaSngvN1Q2dTFvSGx4WUdyNHJ5QmNBQlhBWXBjdnZX?=
 =?utf-8?B?THZ2dVhHa1h5Ym5GNUpQN0pWSlkyaUs5MStlTURlSDZRVExxR3JIeDlaSXdH?=
 =?utf-8?B?VXBiMXdveGYzS2hqOXBnN09mb1FBWk1NUmFJcUxYamMvaHN1RDMwckQ4OXRz?=
 =?utf-8?B?ejNxNnZBRUNNS1dZZG5zOGtaT1o5bk1EckZuaFdMK0xWandyT25rZmtBYUFC?=
 =?utf-8?B?L1BxTUhIYk9oakNzUFhnTHFoVFFjVXkxemsyenJhZFpYYll5OVZva29Qa2cr?=
 =?utf-8?B?M3hQRkR6dkJCUHV5ZjNpc0RvaitvYXluSzdLck9HRmJEWlhZaGZOMXlOVlpU?=
 =?utf-8?B?L2hGazFwQ2tsbVNnSW1VRTdhVWNqME1yK0ZqVnJROWo1VzBuVGdhOG0yVkt4?=
 =?utf-8?B?MWEwNk42Um5GRGZpSE52dDE0Tzc4T29ETE5oV2d3aVBZVmd6WVkrTUtoSi8r?=
 =?utf-8?B?OXVNdFVlWld1M1FGSlVGOHZpdExIVjlWKzl6LzdhS2VJZXIyTU5mM3pSVE9h?=
 =?utf-8?B?eTNQUTR6S3llNWZlVFJSZ01EdlVDYzZ0bXp0eS9PMm00U3AzNnczbGlHTlhZ?=
 =?utf-8?B?Y3BjbzY1NXF5NWlpSG12cmNGczNvM2VjMEFPNzZBWFpHeUk1NWJBQlNPdEh1?=
 =?utf-8?B?ZkZZaTZUakxtTVdtZkVVYzZEYS9kRjhTeUdiYzF0d3ZUeDgyK3VqMDBSb0Q0?=
 =?utf-8?B?V1JpaFp2aWRWMTlwR3ZKODNPeWNYRW1DTFVVc1k1MDJwQlZ0UjZvR2tPWmFr?=
 =?utf-8?B?dXZ1M09iYmZzb2lTdHBYZENTT0RZdlFZVWZxL0R6WW5zZkVLeWNPYkhjZm15?=
 =?utf-8?B?SDdZc1hjK0MvbTZ0RzVhcFNpNkgwN2FZNE1oaVY0VG15TDhQeWxORU82YzJU?=
 =?utf-8?Q?GmJhSSUyA0TGUtceUici1w79ywmV0gnOszqzOv7A44vY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V25nQ1pVZHJvYktMaFlyT253MEdiUjY3UWNJTkY5MTBzei9xS0oxK3k4N2Zj?=
 =?utf-8?B?QUc5YmtTdWJtcms2QStHSUoxMHhvNnNYcncrUjR3a0VTazhXZStVd0g3b05a?=
 =?utf-8?B?ZTJCK0ZtdjkyNllGVEcydURod0NNWkJ2dHUyQlovQmYxRThxS1k3U2U1K2VP?=
 =?utf-8?B?UGRWMW9LcEFERGlTYkVZdlo4NDV2ZFBqRWVoRnJDbDFKT2lCT1h3ME1sVFFI?=
 =?utf-8?B?SlRiQVZtc00vWFJrU3EwTmZCVHNzZ2VDZHBINzJOa3Q2OHhva3JONVhUWFJj?=
 =?utf-8?B?Z3NEQngrcXQ1Kys3ckRtMHRjNm5VcWxDVk1aQWt5YzVRamg0eU9vMTRHQTEz?=
 =?utf-8?B?d1k2WkUzMmxKV3JYOG5CQk85elpIMmlpUHlRWVl5WVE1V3FOcUhkSHRDeXI3?=
 =?utf-8?B?dFNSWjRHdUxBYUhLK1doMWpXY2V2eGNBd2FWYzNGRGY3K0NWRjAyazdXTi9O?=
 =?utf-8?B?eWw5Y2ExYlNiRGowSTlvWGJxYmhESC9VNHpLY1F0OUx6VjVPOHNKZFVtYXJw?=
 =?utf-8?B?RWMyN0wrOFFhaFVNZTU4cGV4Rkk1SVNZNFc5NkY1dFcwajRRcTlEUFdLUW5X?=
 =?utf-8?B?N3hxL05UaDVnTzB4UGJpUDhEV1I0N1BMajFOTGpYcThuSHEyUG1zMkMzeE4y?=
 =?utf-8?B?YkZ3SUxIaGRFZERYc2tXVVBHdFJrckh1ci9UNTVKZW8zcXFlUWt5Si9OeHcy?=
 =?utf-8?B?ZS9Md21TWGNDclhqZFZ5Q0U4U3Z3OThGY2gvc2RJbDZLeFdNQ0UrM3R6Yllt?=
 =?utf-8?B?ZnZLRDNQZ3prMmgyMWkrbkkrdmIzQWxCMXN0VUNmUHAydDdSTEdvdnZXeEJr?=
 =?utf-8?B?V1laR0E3akFvajBQckhPNVpMbGNwSnlDa2JuaUh0YUprckpoSU5ZNXQyNzZk?=
 =?utf-8?B?bW1PQUh3eWNrNGk3L0xuN1lXYld1YS9tNk1Sb2Q4Q2V3THd5Y1NVZzdmMmND?=
 =?utf-8?B?N0pieklWSlY4eXluUzV0Y3poVVdkdkZTdHpidEpqUDEzS3hCYnd4YnByNmND?=
 =?utf-8?B?MFBLZ0ZJOGpCeGpsdXluUCtneWlpK00wMEUrcDJuRm9Xb2hoTHNSR3F3bXJq?=
 =?utf-8?B?OENSVGFhUVZlbEFNVW1qbXUyTlRjOFkrN3BjdDlQYWgwS2RlUWVZMWpaQ0RH?=
 =?utf-8?B?ZUVyaHNpMmQwMnlwdllabE5HTERPSG04YVNaQitodjQ4aVVZU1RwSyttbWtC?=
 =?utf-8?B?NzJnVzVSNVhCQStFazZ5TG9Ta05YOU96QWFsSUVUSURrM0VuWlVHdEVZdW5U?=
 =?utf-8?B?bERXcU9DaVVYcWNjaERNbjl2aFBJSDhCRkJsMkFJRm83UHFlVElpUFRqVTd3?=
 =?utf-8?B?MDc2bmc2aGEvc1ZIbTVvRHhPdDNzaXppbzZvR3FselY5QWVXbmlrVWp2Unkw?=
 =?utf-8?B?R2pKdGs4NnpWV1FXeCtIalFvWVZYeEprR2czcUQ5MVBJTksvcDIvZ3hKbXJu?=
 =?utf-8?B?bHdkMG5kVWU4bkRNUHF3S0xvV2s0Y0M3MS9lYU80R0Vzc1crOWR2aG41TGd3?=
 =?utf-8?B?NjkxemEzOUVQWit2VnhWeTlHL2dZdUYvelEwQ2JaZGRTamIzNHFwRXh5anJU?=
 =?utf-8?B?Rm9SWFBoeDFTK21kWFZ1SEdaWXovSzVTVFhvMzN0VFpnNGdpZTRjWG44Qlpv?=
 =?utf-8?B?eldCWWE1UTdqRlpyUExxUEZLMExTTzM3dUkvYllLam1IdkEyRkQrTUZFUjdO?=
 =?utf-8?B?cFMrQTVKUnZRazRGUlF1Y2liYjM3NjFiV3BoM3N5SGhERitQTU9LNVJNVDRB?=
 =?utf-8?Q?jx+QHHiqR9HqbK3OgSBPbwETrkvxZocK7cegpYY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBBBDF2B701DA545A919F8369ECB377E@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1383049e-7009-47aa-7759-08dd53205296
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 09:07:24.5617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6407
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

DQo+IFdoYXQgcGFkZGluZywgcGxlYXNlPyBXaHkgVENQIFVBUEkgaGVhZGVycyBkbyBub3QgaGF2
ZSB0aGVzZSBhdHRyaWJ1dGVzPw0KPiBUaGluayBhYm91dCBpdCwgYW5kIHRoaW5rIGFib3V0IHdo
YXQgYWN0dWFsbHkgX19wYWNrZWQgZG9lcyBhbmQgaG93IGl0IGFmZmVjdHMNCj4gKGJhZGx5KSB0
aGUgY29kZSBnZW5lcmF0aW9uLiBPdGhlcndpc2UgaXQgbG9va3MgbGlrZSBhIGNhcmdvIGN1bHQu
DQo+IA0KPj4gSSB0cmllZCByZW1vdmluZyBfX3BhY2tlZCBidHcgYW5kIGRyaXZlciBubyBsb25n
ZXIgd29ya3MuDQo+IA0KPiBTbywgeW91IG5lZWQgdG8gZmluZCBhIGp1c3RpZmljYXRpb24gd2h5
LiBCdXQgZGVmaW5pdGVseSBub3QgZHVlIHRvIHBhZGRpbmcgaW4NCj4gbWFueSBvZiB0aGVtLiBU
aGV5IGNhbiBnbyB3aXRob3V0IF9fcGFja2VkIGFzIHRoZXkgYXJlIG5hdHVyYWxseSBhbGlnbmVk
Lg0KDQpBbHJpZ2h0LCBJIGRpZCBzb21lIGRlYnVnZ2luZywgYmFzaWNhbGx5IHByaW50ayBzaXpl
b2Yoc3RydWN0KS4gRGlkIGl0IGZvciBib3RoIHBhY2tlZCBhbmQgdW5wYWNrZWQgd2l0aCB0aGUg
Zm9sbG93aW5nIHJlc3VsdHM6DQoNCkZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6
ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfcmVxdWVzdF9oZWFkZXIgaXMgMTYNCkZlYiAyMiAx
MzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfcmVx
dWVzdF9oZWFkZXJfdW5wYWNrZWQgaXMgMTYNCg0KRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2Vy
bmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX21zZ19yZXNwb25zZV9oZWFkZXIgaXMgMjAN
CkZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRy
bV9tc2dfcmVzcG9uc2VfaGVhZGVyX3VucGFja2VkIGlzIDIwDQoNCkZlYiAyMiAxMzowMjowMyBN
YWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfc2ltcGxlX3JlcXVl
c3QgaXMgMzINCkZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3Qg
YXBwbGV0YmRybV9tc2dfc2ltcGxlX3JlcXVlc3RfdW5wYWNrZWQgaXMgMzINCg0KRmViIDIyIDEz
OjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX21zZ19pbmZv
cm1hdGlvbiBpcyA2NQ0KRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0
cnVjdCBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbl91bnBhY2tlZCBpcyA2OA0KDQpGZWIgMjIg
MTM6MDI6MDMgTWFjQm9vayBrZXJuZWw6IHNpemUgb2Ygc3RydWN0IGFwcGxldGJkcm1fZnJhbWUg
aXMgMTINCkZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBw
bGV0YmRybV9mcmFtZV91bnBhY2tlZCBpcyAxMg0KDQpGZWIgMjIgMTM6MDI6MDMgTWFjQm9vayBr
ZXJuZWw6IHNpemUgb2Ygc3RydWN0IGFwcGxldGJkcm1fZmJfcmVxdWVzdF9mb290ZXIgaXMgODAN
CkZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRy
bV9mYl9yZXF1ZXN0X2Zvb3Rlcl91bnBhY2tlZCBpcyA4MA0KDQpGZWIgMjIgMTM6MDI6MDMgTWFj
Qm9vayBrZXJuZWw6IHNpemUgb2Ygc3RydWN0IGFwcGxldGJkcm1fZmJfcmVxdWVzdCBpcyA0OA0K
RmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJt
X2ZiX3JlcXVlc3RfdW5wYWNrZWQgaXMgNDgNCg0KRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2Vy
bmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX2ZiX3JlcXVlc3RfcmVzcG9uc2UgaXMgNDAN
CkZlYiAyMiAxMzowMjowNCBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRy
bV9mYl9yZXF1ZXN0X3Jlc3BvbnNlX3VucGFja2VkIGlzIDQwDQoNClNvLCB0aGUgZGlmZmVyZW5j
ZSBpbiBzaXplb2YgaW4gdW5wYWNrZWQgYW5kIHBhY2tlZCBpcyBvbmx5IGluIGFwcGxldGJkcm1f
bXNnX2luZm9ybWF0aW9uLiBTbywgSSBrZXB0IHRoaXMgcGFja2VkLCBhbmQgcmVtb3ZlZCBpdCBm
cm9tIG90aGVycy4gVGhlIFRvdWNoIEJhciBzdGlsbCB3b3Jrcy4NCg0KU28gbWF5YmUga2VlcCBq
dXN0IHRoaXMgcGFja2VkPw0KPiANCj4gDQo+IA0KPiAuLi4NCj4gDQo+Pj4+ICsgaWYgKHJlc3Bv
bnNlLT5tc2cgPT0gQVBQTEVUQkRSTV9NU0dfU0lHTkFMX1JFQURJTkVTUykgew0KPj4+PiArIGlm
ICghcmVhZGluZXNzX3NpZ25hbF9yZWNlaXZlZCkgew0KPj4+PiArIHJlYWRpbmVzc19zaWduYWxf
cmVjZWl2ZWQgPSB0cnVlOw0KPj4+PiArIGdvdG8gcmV0cnk7DQo+Pj4+ICsgfQ0KPj4+PiArDQo+
Pj4+ICsgZHJtX2Vycihkcm0sICJFbmNvdW50ZXJlZCB1bmV4cGVjdGVkIHJlYWRpbmVzcyBzaWdu
YWxcbiIpOw0KPj4+PiArIHJldHVybiAtRUlPOw0KPj4+PiArIH0NCj4+Pj4gKw0KPj4+PiArIGlm
IChhY3R1YWxfc2l6ZSAhPSBzaXplKSB7DQo+Pj4+ICsgZHJtX2Vycihkcm0sICJBY3R1YWwgc2l6
ZSAoJWQpIGRvZXNuJ3QgbWF0Y2ggZXhwZWN0ZWQgc2l6ZSAoJWx1KVxuIiwNCj4+Pj4gKyBhY3R1
YWxfc2l6ZSwgc2l6ZSk7DQo+Pj4+ICsgcmV0dXJuIC1FSU87DQo+Pj4+ICsgfQ0KPj4+PiArDQo+
Pj4+ICsgaWYgKHJlc3BvbnNlLT5tc2cgIT0gZXhwZWN0ZWRfcmVzcG9uc2UpIHsNCj4+Pj4gKyBk
cm1fZXJyKGRybSwgIlVuZXhwZWN0ZWQgcmVzcG9uc2UgZnJvbSBkZXZpY2UgKGV4cGVjdGVkICVw
NGNoIGZvdW5kICVwNGNoKVxuIiwNCj4+Pj4gKyAmZXhwZWN0ZWRfcmVzcG9uc2UsICZyZXNwb25z
ZS0+bXNnKTsNCj4+Pj4gKyByZXR1cm4gLUVJTzsNCj4+PiANCj4+PiBGb3IgdGhyZWUgZGlmZmVy
ZW50IGNhc2VzIHRoZSBzYW1lIGVycm9yIGNvZGUsIGNhbiBpdCBiZSBhZGp1c3RlZCBtb3JlIHRv
IHRoZQ0KPj4+IHNpdHVhdGlvbj8NCj4+IA0KPj4gQWxsIHRoZXNlIGFyZSBJL08gZXJyb3JzLCB5
b3UgZ290IGFueSBzdWdnZXN0aW9uPw0KPiANCj4gWW91ciBlbWFpbCBjbGllbnQgbWFuZ2xlZCB0
aGUgY29kZSBzbyBiYWRseSB0aGF0IGl0J3MgaGFyZCB0byByZWFkLiBCdXQgSSB3b3VsZA0KPiBz
dWdnZXN0IHRvIHVzZSAtRUlOVFIgaW4gdGhlIGZpcnN0IGNhc2UsIGFuZCAtRUJBRE1TRy4gQnV0
IGFsc28geW91IG1heSBjb25zaWRlcg0KPiAtRVBST1RPLg0KVGhhbmtzDQo+IA0KPj4+PiArIH0N
Cj4gDQo+IC4uLg0KPiANCj4+Pj4gKyBpZiAocmV0KQ0KPj4+PiArIHJldHVybiByZXQ7DQo+Pj4g
DQo+Pj4+ICsgZWxzZSBpZiAoIW5ld19wbGFuZV9zdGF0ZS0+dmlzaWJsZSkNCj4+PiANCj4+PiBX
aHkgJ2Vsc2UnPyBJdCdzIHJlZHVuZGFudC4NCj4+IA0KPj4gSeKAmXZlIGp1c3QgZm9sbG93ZWQg
d2hhdCBvdGhlciBkcm0gZHJpdmVycyBhcmUgZG9pbmcgaGVyZToNCj4+IA0KPj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTMuMy9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvYm9jaHMuYyNMNDM2DQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4x
My4zL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vdGlueS9jaXJydXMuYyNMMzYzDQo+PiANCj4+IEFu
ZCBwbGVudHkgbW9yZQ0KPiANCj4gQSBiYWQgZXhhbXBsZSBpcyBzdGlsbCBhIGJhZCBleGFtcGxl
LiAnZWxzZScgaXMgc2ltcGx5IHJlZHVuZGFudCBpbiB0aGlzDQo+IGNhc2UgYW5kIGFkZCBhIG5v
aXN5IHRvIHRoZSBjb2RlLg0KPiANCj4+IEkgd29u4oCZdCBtaW5kIHJlbW92aW5nIGVsc2UuIFlv
dSB3YW50IHRoYXQ/DQo+IA0KPiBTdXJlLg0KPiANCj4gLi4uDQo+IA0KPj4+PiArIHJlcXVlc3Rf
c2l6ZSA9IEFMSUdOKHNpemVvZihzdHJ1Y3QgYXBwbGV0YmRybV9mYl9yZXF1ZXN0KSArDQo+Pj4+
ICsgICAgICAgIGZyYW1lc19zaXplICsNCj4+Pj4gKyAgICAgICAgc2l6ZW9mKHN0cnVjdCBhcHBs
ZXRiZHJtX2ZiX3JlcXVlc3RfZm9vdGVyKSwgMTYpOw0KPj4+IA0KPj4+IE1pc3NpbmcgaGVhZGVy
IGZvciBBTElHTigpLg0KPj4+IA0KPj4+IEJ1dCBoYXZlIHlvdSBjaGVja2VkIG92ZXJmbG93Lmgg
Zm9yIHRoZSBwb3NzaWJpbGl0eSBvZiB1c2luZyBzb21lIGhlbHBlciBtYWNyb3MNCj4+PiBmcm9t
IHRoZXJlPyBUaGlzIGlzIHdoYXQgc2hvdWxkIGJlIHVzdWFsbHkgZG9uZSBmb3IgayphbGxvYygp
IGluIHRoZSBrZXJuZWwuDQo+PiANCj4+IEkgZG9u4oCZdCByZWFsbHkgdGhpbmsgd2UgbmVlZCBh
IG1hY3JvIGhlcmUuDQo+IA0KPiBIbW0uLi4gaXMgZnJhbWVzX3NpemUga25vd24gdG8gYmUgaW4g
YSBndWFyYW50ZWVkIHJhbmdlIHRvIG1ha2Ugc3VyZSBubw0KPiBwb3RlbnRpYWwgb3ZlcmZsb3cg
aGFwcGVucz8NCg0KSSBkb27igJl0IHJlYWxseSBmaW5kIGFueSBjYXVzZSBvZiBwb3RlbnRpYWwg
b3ZlcmZsb3cuDQoNCg0KPiANCj4+Pj4gKyBhcHBsZXRiZHJtX3N0YXRlLT5yZXF1ZXN0ID0ga3ph
bGxvYyhyZXF1ZXN0X3NpemUsIEdGUF9LRVJORUwpOw0KPj4+PiArDQo+Pj4+ICsgaWYgKCFhcHBs
ZXRiZHJtX3N0YXRlLT5yZXF1ZXN0KQ0KPj4+PiArIHJldHVybiAtRU5PTUVNOw0KPiANCj4gLi4u
DQo+IA0KPj4+PiArIHJlcXVlc3QtPm1zZ19pZCA9IHRpbWVzdGFtcCAmIDB4ZmY7DQo+Pj4gDQo+
Pj4gV2h5ICcgJiAweGZmJz8NCj4+IA0KPj4gaHR0cHM6Ly9naXRodWIuY29tL2ltYnVzaHVvL0RG
UkRpc3BsYXlLbS9ibG9iL21hc3Rlci9zcmMvREZSRGlzcGxheUttL0RmckRpc3BsYXkuYyNMMTQ3
DQo+IA0KPiBUaGlzIGlzIG5vdCBhbiBhbnN3ZXIuDQo+IFdoeSBkbyB5b3UgbmVlZCB0aGlzIGhl
cmU/IElzbid0IHRoZSB0eXBlIG9mIG1zZ19pZCBlbm91Z2g/DQoNCkhtbSwgSSBkb3VibGUgY2hl
Y2tlZCB0aGlzLiBtc2dfaWQgaXMgdTggaW4gdGhlIExpbnV4IHBvcnQgc28gd291bGQgYW55d2F5
cyBuZXZlciBleGNlZWQgMHhmZi4gSeKAmWxsIHJlbW92ZSB0aGlzLg0KSXRzIGRpZmZlcmVudCBp
biB0aGUgV2luZG93cyBkcml2ZXIuDQo+IA0KPiAuLi4NCj4gDQo+Pj4+ICsgYWRldi0+bW9kZSA9
IChzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSkgew0KPj4+IA0KPj4+IFdoeSBkbyB5b3UgbmVlZCBh
IGNvbXBvdW5kIGxpdGVyYWwgaGVyZT8gUGVyaGFwcyB5b3Ugd2FudCB0byBoYXZlIHRoYXQgdG8g
YmUNCj4+PiBkb25lIGRpcmVjdGx5IGluIERSTV9NT0RFX0lOSVQoKT8NCj4+IA0KPj4gSSByZWFs
bHkgZG9u4oCZdCBmaW5kIHRoaXMgYXMgYW4gaXNzdWUuIFlvdSB3YW50IG1lIHRvIGRlY2xhcmUg
YW5vdGhlciBzdHJ1Y3R1cmUsIGJhc2ljYWxseSB0aGlzPzoNCj4gDQo+IE5vcGUsIEknbSBhc2tp
bmcgaWYgdGhlIERSTV9NT0RFX0lOSVQoKSBpcyBkb25lIGluIGEgd2F5IHRoYXQgaXQgb25seSBj
YW4gYmUNCj4gdXNlZCBmb3IgdGhlIHN0YXRpYyBkYXRhLiBTZWVtcyBsaWtlIHRoZSBjYXNlLiBI
YXZlIHlvdSB0cmllZCB0byBjb252ZXJ0DQo+IERSTV9NT0RFX0lOSVQoKSB0byBiZSBhbHdheXMg
YSBjb21wb3VuZCBsaXRlcmFsPyBEb2VzIGl0IGJyZWFrIHRoaW5ncz8NCg0KU2VlbXMgdG8gYmUg
YnJlYWtpbmcgdGhpbmdzLg0KPiANCj4+IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG1vZGUgPSB7
DQo+PiBEUk1fTU9ERV9JTklUKDYwLCBhZGV2LT5oZWlnaHQsIGFkZXYtPndpZHRoLA0KPj4gRFJN
X01PREVfUkVTX01NKGFkZXYtPmhlaWdodCwgMjE4KSwNCj4+IERSTV9NT0RFX1JFU19NTShhZGV2
LT53aWR0aCwgMjE4KSkNCj4+IH07DQo+PiBhZGV2LT5tb2RlID0gbW9kZTsNCj4+IA0KPj4+PiAr
IERSTV9NT0RFX0lOSVQoNjAsIGFkZXYtPmhlaWdodCwgYWRldi0+d2lkdGgsDQo+Pj4+ICsgICAg
ICAgRFJNX01PREVfUkVTX01NKGFkZXYtPmhlaWdodCwgMjE4KSwNCj4+Pj4gKyAgICAgICBEUk1f
TU9ERV9SRVNfTU0oYWRldi0+d2lkdGgsIDIxOCkpDQo+Pj4+ICsgfTsNCj4gDQo+IC0tIA0KPiBX
aXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg0K
