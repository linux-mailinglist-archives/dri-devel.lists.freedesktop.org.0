Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA84A3FD48
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 18:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2422310EB0E;
	Fri, 21 Feb 2025 17:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="JjthWdk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010013.outbound.protection.outlook.com
 [52.103.68.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4FF10EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 17:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOtG3lC6DuQo2ZLrbSQSPIit9GYD1iTDH4xllSGAKKgXYOWjl+7PmVDAXW8/DEG3dW82YNts3z4dnrRsCkW6YwcLD73p3YSMPKzCz4slCmEFWy58CitulakE6h1bMgcbW9gX44QPwp4Cc90G5fJ1Dd4pNumrtIUgfM5wbGkWi7maf6xdeuAtoVweFC+nErcqfRdGYsVkAdep5+sdifX5M8Jf2vWABib4DhJfqpbPtHFaZMO1KJ2o/Yw6ET4D+MSWKZQVAmOsP8UY0hc4RBqQ/k6u0vfhu/wronAikOxW0Lg9RLMomJWj5ExeO5pEhtmEeNryzeqE8Tc9MGfXZmZ+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVA58dv8F5hhp4P2XQy0/98+eX4WUUmQyztE4a/vmhI=;
 b=MoJ11nfwrLCJpu0VZAeoFhtvp/CA55MiC+dvanAiQeqiNXde6QEeKHBcrmfofhvYdzyr5dmu5JAf0GI8s56zV7xzi4iOLn57+oHL1PfFHnk3uYba/tcQTFAnj46MFYX8Zi4OHujDtwJd2xd5QrAQrue0PA9Hjybl2QnSzM5BUG8+e2gfaz1iPcIXkdYWFcVuwmRCn9wfPprl/12fhao3yxLdQcI9jUz5Cf4a7TwOzNCZuViehAJwUw9Rq9vj/9W6otHj+s978xrsmsIxE1MhnRRdkAkkcVAsawH9uVjlQ0YVNqR1Fpu6p77rB3umAki/2AfZywRqqW1EIdldTIa/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVA58dv8F5hhp4P2XQy0/98+eX4WUUmQyztE4a/vmhI=;
 b=JjthWdk2FFnQ/dXJ5WFLoeIFsJgnsnhiBy41NypiXiaZnWYmgpASbQSvEhAQNmcSh04t4iYSSbEvcM5gDq+TNFcLCVwwuUudWLrWBkKe8nzoPMbBrD6MmvyDG0hoflVb7WooSVOyKHYDXlMusWM878vLPQDUtvEfuHn+tgRESjH92+Cu7pvCiFcqNgaQoL4boZQTZ3E4VxgrsPFI8QWyrvZBQYQYt2r//eMghH+NVRhjcCNd9nYbTr02BHZi7LpG9Ldj+oM7K7ID19dhMACTHY/N3uiazZUhpLvKRKl4yp+2/OUi0KJ4wrWpSFMtf0//BQR5TevD511qp58Lqm+CGQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB6292.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:83::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 17:21:08 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 17:21:08 +0000
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
Subject: Re: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbhFTIObWDiH99WU6+/IlqdSWkt7NR6DMAgAAZEgA=
Date: Fri, 21 Feb 2025 17:21:08 +0000
Message-ID: <6623056D-2107-48FB-B18D-2DB90D8F78A2@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
In-Reply-To: <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB6292:EE_
x-ms-office365-filtering-correlation-id: 551b1068-fb4e-42af-9a92-08dd529c2133
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|15080799006|461199028|7092599003|440099028|3412199025|10035399004|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?aFJQb1RnVGZ4RGY5QWZUcmRvRjl4WWh5S1lENWszYkl4WWpseU5tMUExWXBD?=
 =?utf-8?B?ekxyd0JxM243a0VWblhBTVlVSkxrOUdnblZwdDIxTkFrWDJZeDB1N0JJMHRl?=
 =?utf-8?B?YUxneGxQM09NN25UQTF2WGVWcFdpUU1VTjdlVWRBV3hiSXlHYjVuZ2xLbWlE?=
 =?utf-8?B?WFlqb25rMUg4czlva09tRERwTzY1SWxTUHpGUW1taFVEaUhvVS8ydDhuN3Nw?=
 =?utf-8?B?c1AzWFJkdFcvWVN5UlV3b1VQdVF6eU5CUDd3MEhKTmFucFV6bU5OUDJZQUdw?=
 =?utf-8?B?ZGl3RkF2aDNidk5RZG5BdVZGNW1CeGhYZXpmR1FuQTdUTTdkdzJ5V0pXTEpV?=
 =?utf-8?B?c0xkbFhVV0dTWG9Yd2JzYkFIM1ozaWI2RElCSms3bWZFcVpZTFdmbWZlYTRG?=
 =?utf-8?B?Ym5oWGhmb2wySGR0bDY5QkJ0NUtCdUUwbElZcVRsYjNXcHp5R2Ftd1RkSmd4?=
 =?utf-8?B?ZlpiQXZKNnFYekZnenhveWZkZloyNlpMN1BiWlEvb1RCbHZzc0FEQkNSV3Ri?=
 =?utf-8?B?QkhPQkNXeEkzTzkwdG1DM0hJUFlVSmNmS1NGZmVmMTg1VkVxTE9DYXdvamlJ?=
 =?utf-8?B?b0Z2K0l1bktvcjEzdWEzZTFWa3dQbWxXMUhuVGhGUGJqd3o1SDRwZVNTRGJG?=
 =?utf-8?B?OWVNK1pSSkh0cnZFM2h2dXArUjRwM0FSaFpQUnNDRExxbXZTK3Z3dE9HOXpQ?=
 =?utf-8?B?Q1krMG1USUJsMTlpWnhER0hUVnR6bjNNNklQY0lrSWdyUE50TWhiWWZKa1E2?=
 =?utf-8?B?Y1Y4QlBHcXRNbUM5Mnd6a3dpMFFOS00yd3pJMEdDVzVxSFg3WW9IRndWbnFv?=
 =?utf-8?B?bjJ4dmxlL0N6dEovZG5iNjJyMVJrNG1lRzRDb2ZyNmZ4anFxT05KOGNKd3lU?=
 =?utf-8?B?czA4bGROb29oMzJUWkVEcFIwM1VQaVAyRWkyOHRaWnVZWlhsT0tES0tTK3BG?=
 =?utf-8?B?bHYxYVRKdnlqUlRGQVlZTzJZN3diQWorR0diUEtXd3RqVldxWTZQWUllaE1k?=
 =?utf-8?B?dElVdWM1QXhmSjc3d3ZlNTN6Sno4WU1KVHlCYUJjam5UM0t4d3VsSzRWUXlW?=
 =?utf-8?B?SE9VeERWZDlLRTQ4SGRnNmYvT0k2V1FJb0NRRm55a05OY1hEa1ZYZFFIZDhQ?=
 =?utf-8?B?MkRXYWF5T0gwQ2ZTbXlZRW96dVpST0tKKzhuSGJUZzVtV0NXU1JadDJML2pl?=
 =?utf-8?B?ZEozcnNHTzljQVpsdUs3R1FHc0NtUDNlLzNicjdrSEs3aEw0WjllM1FDanY5?=
 =?utf-8?B?MFRIQW5Dc1JjVlpPUFVHR1IwdWFCVFAxYUpjZC9tck5yOHNzc2xZcWw4eDhm?=
 =?utf-8?B?cDBVb3BRQUk3V3pwcWRXMjhFVUx6Q2xVWHA3WmZJamZkWjNNcERMT21aUmhi?=
 =?utf-8?B?dEk4UEtwNHJPbm5aeHNwU0ZsVFVlRnd2c2Fodks5WS9yM0EyUHdpYWgvRTN3?=
 =?utf-8?B?N1gwdWJENnlIZjhsUzRheTdDbWZKclNpV1BaSGl0NXM0ZmJ0aDBZUnloV0tL?=
 =?utf-8?B?M3NORHNxTjJ4dnJCY0NIK243cHRUa0NWU0hrWEFUV3MwajN3SWQ0bjRoaVBW?=
 =?utf-8?Q?71+iTFZ4oNX6OMHq/0ZRWd/LY8kh32fo6nAYzrDWQJz7AL?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3ZrUUo3UnRUbWIxSTlJVDFwYlgrZHg3NkYremZqbXl4cnpGYWt4MkpZL2wz?=
 =?utf-8?B?NktKVXQwalhxaXc2WFV0T1V1c1pGNUg3Nm11V3NVVkN4NGNpU2JZZGRmSFls?=
 =?utf-8?B?K2F6dkdQNGRrVVV1ZEpDdHN5OXRQSCs0Z1FOVUpFQlBsdW04Y3dwSUFOazJj?=
 =?utf-8?B?Zi9QWDh5dmpnVUhJcm9aQ2VXMlVBdS9Kc2V6czhpS2ZOcXBpb3ZKVWZFVnVM?=
 =?utf-8?B?ckJGQVNEZXdibk9pZmUvWnBmYmRBaG1iSmplYjFsTklnWGIrb3ZyM2tXenRU?=
 =?utf-8?B?YjV1R3E2KzF0cm0zckg5QjdxMzdQVlYxQk02LzVLdDA2NHZ5UzZFSllRZlRw?=
 =?utf-8?B?bVA0ZlFuc0RRVVhyaDRSbGdPdzZndWM4Z2V4ZUl2NWM0dVdXMGF3Mm5aMFRK?=
 =?utf-8?B?d0duRVZ3RlBLOGdZS3JVazNqNEN0RmZRS0NtWi84Qm9iZWVybFJIT1hsTElB?=
 =?utf-8?B?MmFSTVpMVVpVUVhsU3JkWG5DWjZ1aVVYSXFJUk9KanVYTXczanBHVW5MWFNr?=
 =?utf-8?B?Q1RrV29VUTdCMlM4MzNjeDR2b2tGalJkOUV2SGtvV21jTjlQNzlvQzNMdmRi?=
 =?utf-8?B?RWJsKzdUWldGY2RPYnU2ZmtjNThjN1BRWWd2UTBQWXN1TjVtb3BpQjdsRHFj?=
 =?utf-8?B?Q1pjNE03aVpwVjA0cXJXeTdSY2NkT1NwcmhVN0pjU3laay83eGIzRGkzN0NS?=
 =?utf-8?B?aGR4aGtCYVY1MGhhSERGM05OTzJqRVRxWm5zNWgwekxhYzJtY3E2UWxLaDJh?=
 =?utf-8?B?ZkYzNElxUi9WYm5vZUdES09oNU12L2diVUZKMUV1eVVTbjhzSEFhaHFXQXdr?=
 =?utf-8?B?d1ZqU1NTa0IvQ2NqWldEUCtzbUxrTTJ2UisxWUQwUFlZb1hrL09Jc1VycHRa?=
 =?utf-8?B?TEhWTC9kQVRqNDFFRTJyaXU5YWk1aE02eDBidHhxYzZZNU0zbk5UZXpjTjNi?=
 =?utf-8?B?clphY1RYdzZWWEhMOGh3NzRsZnM3Yk5aTzJpSkJpcFdVZEJvQy9RdUM1ZjZJ?=
 =?utf-8?B?MjNzaEw2YnlwVGV3Qm5yaXF1VDRlYXNIRlhoTHJKdnlrcE5QNk15RHVPdmRD?=
 =?utf-8?B?NDNGYXk3c0tZa3RmUFBEYi9PYVozSlBvcTA2aDdlRGQ3YWRicXJJNGplMmw3?=
 =?utf-8?B?QXprTXBBWVpHQWFKRzhRR2daNWZiOEtFL2Q0b1ZOMTJBcFh5dEZCbjdnd0Rp?=
 =?utf-8?B?bzlwQmxyR2JWOWNoYmludDVOU2JXTml1aWRaUlB6ZXVlZDA2MU1URzdtQTFG?=
 =?utf-8?B?NVBoUE5yNllsU0xSMU5sVU1OV2JSeWt4a00vMG1Ta0xwRXlvOUFRRXJSRzJ0?=
 =?utf-8?B?eWNYRnV5V0RlUlU1Mzd2R1lIUmR4SlZRTUowNzkrTTN4VWVnSEFuaWxyYUMr?=
 =?utf-8?B?Q1Q1c2EvTUE2YTFqT28yYmozYlQrcG9xeXNwaTZHbHVmdzNsQWwwMXVtMzJh?=
 =?utf-8?B?NjRiUjZ1MXk4aEFENXdiZ2VpT0hRd1lpUk9velAzNlovRithd1VTL1NWN3BY?=
 =?utf-8?B?UWNpb1VjZHM1UkhtTHdKaElvcXU1eVJwaDlJdmlBajlXMUtCSE5QY2FLaWZu?=
 =?utf-8?B?MTVIMzR2NGJFRUM4N3ZSR2Q4eU5uOElFbTFLVzlyZTNIc3lXSTdhR0pudzgv?=
 =?utf-8?B?QmZhWUpoMXp1TkFWZWNaOHkyN1llVzBzc3lCaW9mRmtEUGliWDhwb016cUNr?=
 =?utf-8?B?cjBrQmZ5d0gvVFhsMyt3RUlRNERuVEQ3aXNJWHFtVHZBYXZDckMycWVIckFC?=
 =?utf-8?Q?C+X0BwMWzCksD+pkTfVfQE9GrlbXnFLKeHVsF53?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <954B3BDFC934DB46A001BF60D943D891@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 551b1068-fb4e-42af-9a92-08dd529c2133
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 17:21:08.1789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6292
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

SGkgQW5keQ0KDQo+IE9uIDIxIEZlYiAyMDI1LCBhdCA5OjIx4oCvUE0sIGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4gDQo+IE9uIEZyaSwgRmViIDIxLCAyMDI1IGF0
IDExOjM2OjAwQU0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4gRnJvbTogS2VyZW0gS2Fy
YWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4NCj4+IA0KPj4gQWRkIFhSR0I4ODg4IGVtdWxhdGlvbiBo
ZWxwZXIgZm9yIGRldmljZXMgdGhhdCBvbmx5IHN1cHBvcnQgQkdSODg4Lg0KPiANCj4gLi4uDQo+
IA0KPj4gKyBmb3IgKHggPSAwOyB4IDwgcGl4ZWxzOyB4KyspIHsNCj4+ICsgcGl4ID0gbGUzMl90
b19jcHUoc2J1ZjMyW3hdKTsNCj4+ICsgLyogd3JpdGUgcmVkLWdyZWVuLWJsdWUgdG8gb3V0cHV0
IGluIGxpdHRsZSBlbmRpYW5uZXNzICovDQo+PiArICpkYnVmOCsrID0gKHBpeCAmIDB4MDBmZjAw
MDApID4+IDE2Ow0KPj4gKyAqZGJ1ZjgrKyA9IChwaXggJiAweDAwMDBmZjAwKSA+PiA4Ow0KPj4g
KyAqZGJ1ZjgrKyA9IChwaXggJiAweDAwMDAwMGZmKSA+PiAwOw0KPiANCj4gcHV0X3VuYWxpZ25l
ZF9iZTI0KCkNCj4gDQo+PiArIH0NCj4gDQo+IC4uLg0KPiANCj4+ICsgc3RhdGljIGNvbnN0IHU4
IGRzdF9waXhzaXplW0RSTV9GT1JNQVRfTUFYX1BMQU5FU10gPSB7DQo+PiArIDMsDQo+PiArIH07
DQo+IA0KPiBPbmUgbGluZT8NCj4gDQo+IHN0YXRpYyBjb25zdCB1OCBkc3RfcGl4c2l6ZVtEUk1f
Rk9STUFUX01BWF9QTEFORVNdID0geyAzIH07DQoNCldydCBhbGwgdGhlIGFib3ZlIHJlc3BlY3Rp
dmUgY2hhbmdlcywgdGhlIGZvcm1hdHRpbmcgaGFzIGJlZW4gZG9uZSBleGFjdGx5IGxpa2Ugd2hh
dCBvdGhlciBlbXVsYXRpb24gaGVscHMgZG8gaW4gdGhlIHVwc3RyZWFtIHBhdGNoLg0KDQpJIGRv
dWJ0IFRob21hcyB3b3VsZCB3YW50IHRoZXNlIGNoYW5nZXMgdG8gYmUgZG9uZSwgb3Igd291bGQg
d2FudCB0aGVzZSBjaGFuZ2VzIHRvIGJlIGRvbmUgZm9yIHRoZSB1cHN0cmVhbSBlbXVsYXRpb24g
aGVscGVycyBhcyB3ZWxsLg0KDQpGb3IgcmVmZXJlbmNlOiBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVy
LmMNCg0KUmVnYXJkcw0KQWRpdHlh
