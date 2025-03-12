Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CEA5D8D9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF66610E73A;
	Wed, 12 Mar 2025 09:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="FNQ0i+Y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4875710E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfd4gcQKLyZsTX2GifhnfLMTCv0svcL/BHpWIMxywoldifjm1k4+E3+vE9IYGo7mSsmEu0VqoTQlX4bNysRey1NqujdZQRt+dy0EGM5J3SKK48ROp16j2BYpkP9SIp8BuKH+8nnOMKzk8+bqqkUK1HBGyOw1jxL+qTJhp5DcDk3/REcWJkQPmQ/1+5vWKr4p+P7+HdKThASTIneNj0lhPu/WkK++AcZqXXmCtl/uhaOGOCBdk+jS/Fevd6T50+3EHCMTJf/XLaxfFEoQ5JU4NRWStu5KNokLD8qE3T1HQV7G+y33JPcaCVKfRmq+YzscrvAUkTjoKrcG/Z6NC5AV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWytK++w7efVge2S3HCDfNc7xFUv7xIt7O1G0q5iL4I=;
 b=vud2i8XGlyKDEVreERdC1LQgH3/BqHaKq4K//z/FJcEGopZiWBj4PJ1gtPfwIodlc7MApZSmtGRLks7Hp5AkjaVXj/X5CYTybDIfCYINHKb4oh86PLRxivU4O9VAzKYbkGeydrYeSV5McKE7GJLlyUMY4Ct7sL868EVhhovglG4mksOX8d/Qk8Pka69ACYSKYq5cpU8JmkOk9T2BFIqc/CBSLFdMaP8QwF19mOZAGbt8d+0fajqFysEu1QKl7GeDEncF1/wA0cgfYbDfJS3JW0vJPUuP0pKeeClw6rn8bv8exxbpkLgVdZTFaTgC+SxUDdTTP+wp0vPG0WkW+6SOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWytK++w7efVge2S3HCDfNc7xFUv7xIt7O1G0q5iL4I=;
 b=FNQ0i+Y1+VPVPkj7SHutnXpMR7w9CG55koqpQX3Uy09//9z3XUzhoteiyr01bbcM/kgSQOWw7xRZV1M7YE8kqf6KBTH6Nx2AXh5G9apOu2ZH1y4LKRZMr+FRK6FH2emHbjv9JLFkFvTSbA5DULJJmwWwRSwGw8sP8DOABSq9Z4tN5shpOqfTjr5By8ELvjRgSiQSicoXCrRgRkmIAAagbGYjw7L7IXmm92HXrcQMxBwuxmw3tU9eNOqo9ca6dWW32Fx2isqH+ocwLleUQwlldwWRjShJa7dOf14gKRdqq2nyPz1PuDwGXZuQ8Z711E/ti31/8t8lH6JbKJn9kIwE4A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9981.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:151::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:06:42 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:06:42 +0000
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
Subject: [PATCH 2/2] drm/appletbdm: use %p4cl instead of %p4cc
Thread-Topic: [PATCH 2/2] drm/appletbdm: use %p4cl instead of %p4cc
Thread-Index: AQHbky4SdzBfIMQKI0KeiKFo673KWg==
Date: Wed, 12 Mar 2025 09:06:42 +0000
Message-ID: <33F3F7E2-24AE-4F29-9053-3B502D075BA8@live.com>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
In-Reply-To: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9981:EE_
x-ms-office365-filtering-correlation-id: d9a03da8-9340-4d3b-8bed-08dd614534d3
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|19110799003|8060799006|8062599003|461199028|41001999003|12091999003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?us-ascii?Q?0IkeCQEaT+5TqGNhQUnL9iwHKeCeEeMy6VBGJkLSKkFKh2YDEKSHCBwM3y/a?=
 =?us-ascii?Q?3FVDhbGEl5t2BdtM6YanjgKqd6CBOVDyR1Osly/1U5oJ92gBy6SgSeymN0+k?=
 =?us-ascii?Q?m/W8pfiIfzWP/eRpS0JDAGXHkNJe45IytVTVFyNZ6kx5/3bIuf5GekVp8iP2?=
 =?us-ascii?Q?cKH0vb7T2x0JqL2ASNBa/9f4jV9RUz8i7WM3VAYkG9bmnRQr8mxKqJOz8Om6?=
 =?us-ascii?Q?oar+8AdQjVIiPoQzhVRuBJdDDjgKYjc4e0LCgNeaIzp79Gvz89fzxlwTEoqZ?=
 =?us-ascii?Q?su4akItx89mzZnPkvGXnA8cXjdbayrsEgvg0VB0Pfqhva5j/R0Ckzf1GoHuo?=
 =?us-ascii?Q?kkPKz+G6d6htwPZGhntE0MRIiiQOVal0L7GivaXKivJBzAP2KT/MrA+msnJ1?=
 =?us-ascii?Q?4l8kIuawchYB0yXhrHQHitGlrylWvk6S1jRstgxTVjiHm5VeOYqDNmrPynh2?=
 =?us-ascii?Q?4o2FQNTchUhP5tg1yQKnOylaLrrgLdWFhp99Ugdz4NqtNCKVg6Q+95LV7Kqj?=
 =?us-ascii?Q?9gGMTyQhKqlEalGpzfWJSvF+/a18opYDP2ruJ6GPykmmCs7ij73Hox+wOhuO?=
 =?us-ascii?Q?w8Kr+LcW19EM7aeoNgC6AUUwNaiosJS3GzojnLaupCpcN4i1mcFhuTf01h0R?=
 =?us-ascii?Q?tvxLoPI+TA7cbnCH8fMOdd2eJVLpuYtwJWQcfRcfCykFbLUFC2Kq8XeYaRu7?=
 =?us-ascii?Q?tEfSp33Q3786CyWjg1vdxi47xrDBLnE1737992QUiUfE02IU+DAc8jfbcvrB?=
 =?us-ascii?Q?fMqPit89L312D5CXW56l/FCGE4deGb9hD+I8Xv0XHQm3Zx/OqgBxpFy3l3Ik?=
 =?us-ascii?Q?819BsbjbhBq+xGUFz6Y9PBlclx+twGgOmDIDfzfU46Ag/9c/7TvaoHsRRHXI?=
 =?us-ascii?Q?A2bad1r9rEVModzUu9GChmJuB5avX7/lmmzwfhEjqjoZAFN7yjYNjnSOWu/4?=
 =?us-ascii?Q?rvp5k6Cu8Zms+eEBz7lkcwmLxMDnQ6+LCd3z+M3WOEays3xSKMviA8qIs9Q2?=
 =?us-ascii?Q?ybmgBm9CQG7gj+x1iSU0MDareVmGg+jH0bKahSercmK/DuUmoIsDunITHPqv?=
 =?us-ascii?Q?hkFAnZKJuSsRAZU3QaKs34PHwl/nTm12IQA5SqMwlw+PEVaj8wI4HXRrOnh/?=
 =?us-ascii?Q?9+x29FbmteXA?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6H8SSlEyPGktk2PXzl/SWqZVKsI/2VsZRE0kpSP2KZeJK9kEiw93jY8xHMNb?=
 =?us-ascii?Q?sFgSA1L9aP2j/Iu4aEAzcrAduZMp7rJDK865PjymIdZLGpeHOz9Ur4mQZFBs?=
 =?us-ascii?Q?RtVJH2hGVJ7AujRSRl+UkFYzSUVG2UDLXavYlXBqIvSYnbxVptLje0pd+ad8?=
 =?us-ascii?Q?gk0r7wz6XtDFW5ryAIIFZbj0eK6MBWZSjosWPs3AbLEohBKHVwXoL+APmDPU?=
 =?us-ascii?Q?3sV0kEJeqt73r52kw5V8ihXVa42SUkp2grD+HX0+KjKXh1TOvYCfTFWJFoYo?=
 =?us-ascii?Q?OtbbEntYrF2+thDW3I9RAPEKmqw6P7dhRP8ENJHoa4k2kT0ygnq2QIvuWJEm?=
 =?us-ascii?Q?Zca3R5kUO6iUSZPXjLtVQbqVN+ZITOPy5TsIAYwYDGW3w/PZAI1y2Lne9G2W?=
 =?us-ascii?Q?P5tXQMY1g8RqLg8ZWxZsz0VqgPpG6MdG+aWFLaUKnN4KX5+YFWfTN6NK9LnA?=
 =?us-ascii?Q?6mn1vBn0A9AGJPBqL2qk2CLpGp+zFKk7yf2ReKRZ2C3nDucOlZg28Kc2YHpc?=
 =?us-ascii?Q?ru6j0O0keK8KfP1PGZg0Bidn2ezxR4JAj2HD5L4G71FZa57QR3KD/soMpiMQ?=
 =?us-ascii?Q?ghj81zGPiZqfj6E3Nx9T92gNLZhyG9cTTFyl/lSsylO3GE9FLVEYOgWrgH31?=
 =?us-ascii?Q?l5O46hymoh7kGGrKCqCdrinKKWLDwZQgSEgvj/mhTGkLMR28gVwUW39EQSaz?=
 =?us-ascii?Q?++DyOPDfMldc9DjHEb0DO2nmHCAijCL+4d53mXCvs6RNnHGCb4Gyqr1l/Nls?=
 =?us-ascii?Q?Ez4dR0vTN4KssecsnFOdT2f1pU4wQuvDreORnILvqB3Zd7rsTswdxYsXt4PF?=
 =?us-ascii?Q?4G7Nj0+esWHK2KhCdyfk7zJqdaxoYvH4wtKZsYLOeSAa8ujrXXEoMV8IKMoq?=
 =?us-ascii?Q?KC1KA9F+ASVZXsYyrHE9grLAIzS2abAyujqDJqkf7Z2yOfC/OwKzPgGHKEb4?=
 =?us-ascii?Q?FyZ56ehUTBWUKEjthK9yjAvuipFuuDkwCaFaJsqfvl0X68iOMc0IL/9Wk9Af?=
 =?us-ascii?Q?447huUdZQ4AJ2uRL1HoZ1Y3fFeoP63MRCaVlPhccyV2b4FArjP2M35VFAPCe?=
 =?us-ascii?Q?xMfkj5IrovE7bk+jyfRylz5MyDGf+QQDWgiZyPfIkEhGLg0aas86fnr5EY7T?=
 =?us-ascii?Q?J7s0kb41SCp8eAn2J9CRnkU7kZiPIq32ybesTQQmb/vZdBCPEqYw9DO5vBle?=
 =?us-ascii?Q?+Qe0bQDTis29fDynmfyPpDAv8HbjmezrXoNMRHBrO3e9ZJDEvKaRb19WIUuw?=
 =?us-ascii?Q?CpESqMz1ZwO+YVVVN4aRwa6F3CynH8jE2OupB4M/3BPaIg6RSQk43WG1isYt?=
 =?us-ascii?Q?exEGc3IO8+j6tlfBYWza8Yje?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4831D0BA280B6E4697AE095A0C14C852@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a03da8-9340-4d3b-8bed-08dd614534d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 09:06:42.2799 (UTC)
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

From: Aditya Garg <gargaditya08@live.com>

Due to lack of a proper printk format, %p4cc was being used instead of
%p4cl for the purpose of printing FourCCs. But the disadvange was that
they were being printed in a reverse order. %p4cl should correct this
issue.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/apple=
tbdrm.c
index 703b9a41a..751b05753 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -212,7 +212,7 @@ static int appletbdrm_read_response(struct appletbdrm_d=
evice *adev,
 	}
=20
 	if (response->msg !=3D expected_response) {
-		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4c=
c)\n",
+		drm_err(drm, "Unexpected response from device (expected %p4cl found %p4c=
l)\n",
 			&expected_response, &response->msg);
 		return -EIO;
 	}
@@ -286,7 +286,7 @@ static int appletbdrm_get_information(struct appletbdrm=
_device *adev)
 	}
=20
 	if (pixel_format !=3D APPLETBDRM_PIXEL_FORMAT) {
-		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format=
);
+		drm_err(drm, "Encountered unknown pixel format (%p4cl)\n", &pixel_format=
);
 		ret =3D -EINVAL;
 		goto free_info;
 	}
--=20
2.47.1

