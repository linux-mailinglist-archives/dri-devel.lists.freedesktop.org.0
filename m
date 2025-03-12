Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE5A5D8D2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F8810E25E;
	Wed, 12 Mar 2025 09:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="BNuQ+CPi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7210E733
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM3V6HsVeLO0Uw00C6ITvQX4UTcY2UggFAExeyuvt7+qF/+dD7SLveo6uFFBf30KtoMhstKuH50KVIGr5PCeaQr6NT5ZYBrO+ewKbLC/GiiGTz7HsxbiKH8MvZU0HeIaG/qiil42MUxTnMJJ27chUbi6oWELodsUvZ7X2LyYjMrfvsrZp0CIzItFh9UZPJ4iEZ0Wf/PPEUFp33bu23oqp92zRXxiE7dQmlgeiHZFeT/SxnjzjG0q7h8c/mXzkWNgMSkVGMpkyipz7MgKHe/fDPdvMXmysXXWEpBKs1GDRQZ8ht0ECbZeeGG8885RNpUDBnYxYMxo5lhS+t/WX5fr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVB/RurBXXHna+Eq/8c0d428rxIGTZnnNd/mEfa+/SE=;
 b=xOGL/kAQPdIe5qit2e1jwQeYF3Oe9JJXxlk2GQM9SNkIoKdX+NSJtzddlrvZB54A2tpOysjlGhtykDSVKAjtInbhLYS0diQuYbv/zpSuvNF9VsTz/jP01RzVisi1XczT8AiJYKt0P1mqKXC1srBpDJ01Zox6aDHODvmT2ytYwheH3bYRJWRblNsqf/+C3jm4+Awf6Q4g1WxiwQb5EmPH11/6BBlEso3hS7PWqf/5t/YZAaytCpT9j1EwG3aWnZbbJisUt4kP4q4zDQsXtFR1vfKtIY/I84zI7/C6BPrYLFVfgy07njIYZUB5eRBVVguGWV9u3pi0jWdWssOKtjfNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVB/RurBXXHna+Eq/8c0d428rxIGTZnnNd/mEfa+/SE=;
 b=BNuQ+CPiEpfAuN1zcpmhjZUHmfsBD+VXQAf1Eq/3Ed8DN2AEgmIbYCM0nDlo3LYPabs9kIuoXUlSf/eIKluWyCqCdckG3s+wWscnn6eIqhBe0CxYsF3mhKo/be5gFIiklYA/4Ee4LGnBocrDqYtIrV1vPR5mZ7lmqO2Bmr+eCzuspoQq23qkiAsB+skB69cIwQTe9PHoLj6pZzQgxOyzssYneJtib8zoyEtR0xTGeCb2CdpmZ297hXfSDx7MnJl96SeFerExeFZeHg262HK58BixPwaMQnpIzPOnjlIwUDjO2/IeTrgL4OhkfW7mtEAoQShmkjeO6BaxMRrtlqSAjw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9981.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:151::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:04:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:04:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Maxime Ripard <mripard@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Petr
 Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>
Subject: [PATCH 0/2] Use proper printk format in appletbdrm
Thread-Topic: [PATCH 0/2] Use proper printk format in appletbdrm
Thread-Index: AQHbky3U9w8l4yRNnUaBXR/HGMS8kA==
Date: Wed, 12 Mar 2025 09:04:58 +0000
Message-ID: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9981:EE_
x-ms-office365-filtering-correlation-id: a1784385-b722-463c-d697-08dd6144f6e6
x-microsoft-antispam: BCL:0;
 ARA:14566002|5062599005|15080799006|7092599003|19110799003|8060799006|8062599003|461199028|1602099012|102099032|10035399004|440099028|3412199025|4302099013;
x-microsoft-antispam-message-info: =?us-ascii?Q?8nb7OcNeVSeT6y/o9D0kKzjRctmOMs7gncGY8WDCZwwp5XwOWapTWEdSyK6d?=
 =?us-ascii?Q?4i7XXJi2FHgx6xmb6h6EhDT9Cj2LU2gH/LpxMmnVEjowf+L0R6NjF5HYdCd9?=
 =?us-ascii?Q?W+VaiC04xA7auH5Q/xk0sOLVWZeajAEXI8wZ+OzEcG4m/V6CD7D3kRFFy0Ui?=
 =?us-ascii?Q?wJQgjX/NzbMZBTiYcdPV1SA8/nUJ+U1Wv8bzFacc0+x7XYHR6XSKSHKgEsiB?=
 =?us-ascii?Q?fTb2W2/a6lSatyPLBfMTmQbuU4NcZZI1quMthLyO9UPId6Wzy4H6LwKKcT+r?=
 =?us-ascii?Q?mywhYkLzSGi/nbQ2kgoJvIxoFoxunQFpgJjh6AXMeNu4NhXmZUPBe9T2wvJ/?=
 =?us-ascii?Q?07yWzdzIkeHJPO/Rt+MSf2zaw2QI9E9TuwsZvrWiTadfZjB8859OR1pAME9/?=
 =?us-ascii?Q?kGkLIiRLmVRR4O1zDQNHSEvLOEcmUgCxm1To3H2pA24OdzesdRN0CeUL9q7y?=
 =?us-ascii?Q?Z3Ha1xlXwmF2r1v/QmkALgNND4ELQppeP+T6wt/VeatufN0z6bLQZtfS88ds?=
 =?us-ascii?Q?5C2heMQZ8DYv75e9e05lrEQ+tOI+PPdYCYJfF9SI2DeUhzlknyttMULlJ/w/?=
 =?us-ascii?Q?dWuwLQJFokPzVfAbA1MY+MaZCCPhWZQfgvRMXsgygHS7/23sZQ6naImPlByV?=
 =?us-ascii?Q?GpQViX0x1w4UITFJgjqXO99Olm8ivZe96HPNgnlZfI+3zWPOT85osrj8ESBL?=
 =?us-ascii?Q?9aw2YZj2yTGfsmzuZqG1HXimjNztp5nUthn1IB+cFjNmSTSRASOoecRT4lzO?=
 =?us-ascii?Q?syU1qOsS2pcKcF/TCUXJK3UYu024d+A8LlbeFLfzs3yWhrOubBoEts9OZnr7?=
 =?us-ascii?Q?bW8YhOtmpLwHbwNrTZf0tZP0BJ1KDav2IPgB6sCAVg86GHi0Zn20UrE9sDK1?=
 =?us-ascii?Q?zgvDS4m4yGIjWywb80KCcY6mXv/QE+UzNOtqJvmwr6hQrnUn2yjH6ogADBW9?=
 =?us-ascii?Q?B8TABoOqIuCrMXAUOCwuf7tCc481TMGMoGO5t7s+I+hM+0SA2DakL6xpJd3+?=
 =?us-ascii?Q?AhyKTIdfHQp4vWKetWUJJbXWsAU1iS1CjdNCazICwlsYJScdulOti+hNi7nX?=
 =?us-ascii?Q?gcHZTlt5s86j7La4aJpsXoweQ3FfH/voV+kQPaLFmXGpgLMp5Dam+fzpSzRy?=
 =?us-ascii?Q?p1E2Mat1BRvdaktCiRkKMWC95xCiojlgIX4m8MX65UxLASvLbe1jS3qZTy+/?=
 =?us-ascii?Q?sqRCnn1SyoMqHiiLEbn/Ig3IHeStTL0c740WxkfWbFHbcLgI5mgBqT26Gbcz?=
 =?us-ascii?Q?XP8fmjUTcuVlmwECgSPZ5Gk5dnZki/RTvGfyWqok5w=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JKkBZKVdEFxU/ttA0gdgNgtuhKBYsEED/rSt1SM61Fl2PLMBWmacGE0x4WhP?=
 =?us-ascii?Q?cjUhWcF9Y7pt3f68VNs9Q5pEDR8EMhmkJ8x2o40AUUQjmJ/Rk/SUbFOwywcU?=
 =?us-ascii?Q?kquhGb4FLVC7dqAmR1O+2scXPQzjeFECbQj6CUQ6lq/tLBqpsJ4OLMGtmDNx?=
 =?us-ascii?Q?D0ZE06y7Jp/qJ/dIz/77U/kL9YL50HLj+MHapgvM4q3Ts+0zUNNw/oQET8cv?=
 =?us-ascii?Q?pOdSMQqxlmQ04BtBOBzd+FRhaA72RXwrbQpkcFqINX4GgobBH0AipHIjw8Qp?=
 =?us-ascii?Q?4w6iO2hjIeA5Ad/2d6i9Lut/w5qig+Z9AgiyhAy26DoQGU1kSAMCs+9wb7hl?=
 =?us-ascii?Q?2+cEhpVWXy/yvOZwLBdw4g9Cy8gsBvhed9QebkHxbm3yO6YvyLdrXrDipGPA?=
 =?us-ascii?Q?K9jxHLLNTs9ZLwooA8v3HyKtLXp5LCAGNdbA+ieoNa2LzLWKDJvpfG7MmhyX?=
 =?us-ascii?Q?IN20DqBhrs5yphdgw54NrVaHFaxDXH8pjNpM0fL69S4FOaZy8+NVMlFhAi7T?=
 =?us-ascii?Q?+LbFfM9rY04YKR3kjkoQyXFms3ngTxKQ468uEHXPCSBiJf+Bz8eSw092AHea?=
 =?us-ascii?Q?HiPjyenYAHXkdX/RU8g6o1yRC0nW9m6faEyIX13i+xK8GKx9dPHcahbIpgG1?=
 =?us-ascii?Q?7R42TVFP2vXp7cXhVA4jcoPs2GgKpIfHxaOEgWy1Mt4M0HyA7muH5lMnojl6?=
 =?us-ascii?Q?9xiQtSssHdnAWV9Xh+DNA7q2jD463qOXAW8yAlA0OvI7xRNaXKMVw/7Ul5A4?=
 =?us-ascii?Q?ptg/4LimXnWWwyhuN9EFLE6nLgr9o6oMo88cGs4gptjlDSc1hMqkbk2AaW/I?=
 =?us-ascii?Q?jEGvQ7tZp46FMXaUvZYOZ1mw2B9BfK454PsbJAcdk9h7SA5DLISilaB9gFwz?=
 =?us-ascii?Q?g0/hHz0/wwPpDlZnH6iSLoWWW7T7C/Vs9p251yI7GmAci+f+hcynuqeesg9/?=
 =?us-ascii?Q?/0Yn2VvlwZcqxTK+lJxuc389czpOJ5/TWE1Nu0ejMbNSbuC5garn1ggYIe8Z?=
 =?us-ascii?Q?vMd08i67hvAojVNWVv7zJ7ZLkoVQCaTPBUlRtsUi2tkTFdk/e8eLvy3bzck+?=
 =?us-ascii?Q?VpFhLreMWO+Vgo1OmgEExJJqsgJkhR7l9tm9FMU3GZhJPgLtNHDG9gEH2DMi?=
 =?us-ascii?Q?OiwW7BiIhCi/WTPe4mDb0/IRjn0+hzsZXvAXEP9i7GHXahN5AFGsfQqORb/R?=
 =?us-ascii?Q?WaBalVnErqw1ldPkEebnAuX9zpmT4hbfyx6YlMkzGaF+J7y2uFkaw/YlKkwZ?=
 =?us-ascii?Q?5cdsUKu8bze2HbreHb36AtBFhS2RHpIr+/E4y1AWhHq1SUNc9uNNAxRcQtYp?=
 =?us-ascii?Q?gmLj3LbklJkwL6uJBz5aymN9?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40713153B48E154A9C0A6EC14B60E022@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a1784385-b722-463c-d697-08dd6144f6e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 09:04:58.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9981
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

The vsprint patch was originally being sent as a seperate patch [1], and
I was waiting it to be taken up. But since 6.15 merge window is near, a
potential delay between the drm and vsprintf patch might make the vsprint
patch as an unused addition in 6.15. So, I am sending it together. From
what I have observed in LKML, vsprintf patches are being preferred to be
taken upon by trees which are actually using them.

[1]: https://lore.kernel.org/lkml/1A03A5B4-93AC-4307-AE6A-4A4C4B7E9472@live=
.com/

Aditya Garg (1):
  drm/appletbdm: use %p4cl instead of %p4cc

Hector Martin (1):
  lib/vsprintf: Add support for generic FourCCs by extending %p4cc

 Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
 drivers/gpu/drm/tiny/appletbdrm.c         |  4 +--
 lib/test_printf.c                         | 39 +++++++++++++++++++----
 lib/vsprintf.c                            | 35 ++++++++++++++++----
 scripts/checkpatch.pl                     |  2 +-
 5 files changed, 96 insertions(+), 16 deletions(-)

--=20
2.47.1

