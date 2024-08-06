Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F230D949619
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6FD10E3BB;
	Tue,  6 Aug 2024 17:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="rU//rA0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2090.outbound.protection.outlook.com [40.92.102.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1290F10E396
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkV/nDkWjlpDd6hw9RJZR4vaYZqlxj1Yni2QoUm/UHwBYfsaT1GvP8xUXlTo+JTdh34wtKo5u9ECe13S5HVwYFVGqy/DesXMtfTv5uaVTCI/bsg7Se1YI/5Ly3qrcHtyTBS7lyyRBoaGN+JL9ujH6NwMWBbJJeAxI8x7j1tKvQ43JLjPTFjQCfQRcWteuLg+/QF4SDoR1Od9jhiflqUdmjUtHZiKsBz0z43kDEZbTiLQ8GQijRUh/3Mg4YfaMASTytEvyw7bJDMOmT5nIZQ0nFaGfKYbdyKEDvv7bLNgOvJL8OPa4Ev+NOQ79GuPDE8X+Shh/kc5SiplttwGHV52qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=GtgYO83F15gmP3wnjrOCsg52N+PnLFe82NhcpqVlGQxpJCMC797F1yNyRmpA7BxUjLD8FeWM5raknW1H2bi2toBUAlQ0k0X3NZYrr6j6aQ3x4/t3ygCDp0bDE/44E3t5zxU0iz+g2zPXI9F3emZi+Og3OPkuFCXrSPg9/R7TvPvn/Sr747Md3PNs3+uM2Zz44z4p5cnyZTjni1PF4HOZXDe2tczAp/2krwLVVgCXuDDCNyVH1uoCaJKFLRXz7NBIK/iD5KZLELjgq3N/8Fcl3UPNEgMx4N7WpjdjIEAVc9eU2CqfiuWfenEGqAoenficJgOvLiPvnoqnTHqZC4FTdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=rU//rA0ByWKSC9XFKEynGZJwiCkFOA6blyF1LWGy7zvlV/hYuXX9/nC4acDuoyrCUXyjkyOW7LbFpW9IexrRUWV782YtTGpvWM0/Psug11qU0+JRXRTyfuIUNCbIGfId5W4wINxc2rX/FghX+cz0J458GtsBNunJzUCZerdF7LYHJuMa3cGKEvMAqJwRK+OLSjEWlUX/yfiHqxgllwcixTsHu3kxWi3jBWSluXzKCK2MDJ1Rg1jCgreTp6UwbOzBpxvkw2LzrXsO9huWyrZLURRY41/9t/goEFBb3D6inQwRH2V2ok62bW/fdWJ70z609pGEAZ1bY5+y7/lXOl+f2A==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1708.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:53:28 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:53:28 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Aditya Garg <gargaditya08@live.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH 8/9] drm/format-helper: add helper for BGR888 to XRGB8888
 conversion
Thread-Topic: [PATCH 8/9] drm/format-helper: add helper for BGR888 to XRGB8888
 conversion
Thread-Index: AQHa6AgDTZhoiVxMIE++l+iOjtd1ZA==
Date: Tue, 6 Aug 2024 13:53:28 +0000
Message-ID: <9B1AD5F1-4539-409C-BC34-DF9E196DE6DA@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
 <C0F2E161-BBAD-4AF7-B39F-015A5A609CD4@live.com>
 <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
 <9223E804-286F-4692-9726-2306361F1909@live.com>
 <C2CAAA64-500A-4D76-905B-DC3E2A884941@live.com>
 <BDCA0457-7A04-4705-892F-CC8DF493DBC7@live.com>
 <708F206D-3571-42E2-BA6B-5AD9EEF66073@live.com>
 <4BB7CA6D-1554-4784-9F7E-BFDBCD9D8B5A@live.com>
In-Reply-To: <4BB7CA6D-1554-4784-9F7E-BFDBCD9D8B5A@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [4Ph7+QV4JmbJr6ZfIsb5vs605nBYE7BAunad3a05q4UClP+d0L+EYqGgcqYt3afPhyrLXKhJ0wU=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1708:EE_
x-ms-office365-filtering-correlation-id: 964576ec-f6e8-404f-2b97-08dcb61f2642
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info: yHeSL+GszHGZz25s1cfhm8bkClnqeb6uWYr/fjHQ/n5LIZiAOMBUMKf50ING+7k/L3MDSnMqlV4AAbJke7sttlmEX5OlH6KrDpbsYfcUajxNTy/OfDjHQ7Pe73IsJSeJTYK3w09AosVM2VbjYUK2GB6Q+D62LQ6waZN7SPxbM/z8oWYdEz3PWmPwvcXVXyS9itpiHux9rJXtnLfy7/5BktK/3rqcqWT32tOFMxCQVFE6UvJnKRzK7Iy9pWzAMuO2aL6uZQqkT4BGZk4bPMRxSWCUQeGaH9ZZKlb6LEzT59KilN9uOzoLWK9jDiB5ls87+3q7H1OKO2xNoIoP/DA8kGagj/dnvn6EHjKTas/mV3nzDvpYGC4ZYjlEQCfQCD6P8QxEWoqFx4holirIAi1MNkRA66XSJv/p2gvaCkY8oPvDb12lIoGpB3dYvJF6rHdXRsKDvR+MAN8ZX4e+btQpSizs5SDyp27Pfqiq/reJ26rH79jMh0u1scSTvwiulVcgP8hlbwX1LwMtAxCuZ3i3hYRjT6T6ufyg+wFBWGGT7h+QBzLWtlIINO+8bS2CBzJwutI4FAVjKZ1S6/WOiaC7gCJ+1072yQRKbe8osbPMf8aGa3taHRPCu1HYmbcb6dOdvixtkiRmGm6NIfFJx6quDEQqBG2hp/IBpHZPoV47ySA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BI3h8Xy+8YOmtoPeK9OST9ZGBoA05F+KcFO+B0r19GPACaXe5624U72dYY/R?=
 =?us-ascii?Q?FECzJYUahJ94W+VBp5VJqF9cbEmcgitXqDv53zbwbRaaI/2/NGXEY2vuBrfq?=
 =?us-ascii?Q?A3MripAH+zjUInUyag68C3oV8M8DAhOilUNyEex++5Gr5TxrUCim/jrPs5Cf?=
 =?us-ascii?Q?YHfaE5zdYbgbfi5wceEaLY+jXoG6bKxh7kois3jXYqEJefj7ygWSUUWjEk/w?=
 =?us-ascii?Q?WgRfBo2VjzZV/gTUrhyZYz1Rl2AVbjpE7RYhKA1tfckpih/Oxi3rwme2cHTX?=
 =?us-ascii?Q?7HOmQurIdNE4zhWUIgGfLoqu7Wkwb6k59/A1AlEVgwUxZhwHSmJ07sDELxy0?=
 =?us-ascii?Q?jpK0jKk7SOjDuGYc9gMGPqQgtaReBgjfzCOACF2egwTevQzvbaVBV3xekmsY?=
 =?us-ascii?Q?/FXSjrwIL1zAOL11zr1Xn+dOboGSKmNp0E1JyHzsot9JxpDDNWgMUuO02GJj?=
 =?us-ascii?Q?a4mkiDhaB8kuFKu5zJpDli/5f+9HaWmkb0oNUjQysw5GbNA/eBnkr8LEy0Aj?=
 =?us-ascii?Q?RzvKGLiH9f37I2UT2K8QUYMYQYvSsq8dFhYojJrisXhhLGn0unwZKYAtee7x?=
 =?us-ascii?Q?h2LI0OQ1K+hwQZj4pSExDOo7Mec0E3FRSLOAZ3/bv79XvAZoSUstpTlcGs1x?=
 =?us-ascii?Q?Njx+W60viI7yAwKiftI1PWDTOGWAwx7wzu16TqRaL6Ay/HkCE0SbCc4K0yWX?=
 =?us-ascii?Q?DaaYuo6qfrnKo8RmgBFfBKu7wI75vvQBAvkIzdJWJOzj/0jgBBTC+vY+ql8c?=
 =?us-ascii?Q?BJGItRrwC/a+2oiiWHCdcrUI14NPq5arFd9AwM4ctdYIjsZW8MMZipiiDqN6?=
 =?us-ascii?Q?9Xndh1MDKq4nBiXDZmIsZHaWq453CGK7/eBEFoSKnXC7vGZWpI1Va2lb6PFx?=
 =?us-ascii?Q?ZvXPNw82pBlzOFAF44wKDKF5qNBtIndHjXK1nhkOq/ebLVUaz3hvv4txH5HA?=
 =?us-ascii?Q?1szQq4pU4IK0PZBWujgLRTMi1kMLYtq3g5Oh3dT0P1CmdTzuFzQGZ4JhmfwF?=
 =?us-ascii?Q?nNnl+ykDcMmg7P/5HaJXHr30Nv6Qowgp3pBEmFx/0WM/AQhtLCkybHY3tDCN?=
 =?us-ascii?Q?ANjf8gyEgpz+R3PlgnNZXdWVMYDp+4mdJ3UYIcX9GA7hXhcv1s0UCtwW2f1P?=
 =?us-ascii?Q?zoalMXQdgAzyx8by7wiau5rOEsbpleEzXJMD4NmHPJKSis+wspRYz/Tql47O?=
 =?us-ascii?Q?cJif3vhhYC/uYVpzybsTulYrgH05bwB3FdL4P/KYJEnOv7SM8QG4xdu5/Ao/?=
 =?us-ascii?Q?k5BjpEIY9av8qtnN3EBXQOHGF6X6Zk+pQT4Zukhy1MhvEeKtO9wuIBIfjRze?=
 =?us-ascii?Q?FcbFGc3D1/ddgp6EOccZssde?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F2EB4661E3E0A4993085A7714691867@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 964576ec-f6e8-404f-2b97-08dcb61f2642
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:53:28.1511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1708
X-Mailman-Approved-At: Tue, 06 Aug 2024 17:01:42 +0000
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

From: Kerem Karabay <kekrby@gmail.com>

Add XRGB8888 emulation helper for devices that only support BGR888.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
 .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
 include/drm/drm_format_helper.h               |  3 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_form=
at_helper.c
index b1be458ed..28c0e76a1 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -702,6 +702,57 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, =
const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
=20
+static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, u=
nsigned int pixels)
+{
+	u8 *dbuf8 =3D dbuf;
+	const __le32 *sbuf32 =3D sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x =3D 0; x < pixels; x++) {
+		pix =3D le32_to_cpu(sbuf32[x]);
+		/* write red-green-blue to output in little endianness */
+		*dbuf8++ =3D (pix & 0x00FF0000) >> 16;
+		*dbuf8++ =3D (pix & 0x0000FF00) >> 8;
+		*dbuf8++ =3D (pix & 0x000000FF) >> 0;
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_bgr888 - Convert XRGB8888 to BGR888 clip buffer
+ * @dst: Array of BGR888 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecut=
ive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to ea=
ch other.
+ * @src: Array of XRGB8888 source buffers
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ * @state: Transform and conversion state
+ *
+ * This function copies parts of a framebuffer to display memory and conve=
rts the
+ * color format during the process. Destination and framebuffer formats mu=
st match. The
+ * parameters @dst, @dst_pitch and @src refer to arrays. Each array must h=
ave at
+ * least as many entries as there are planes in @fb's format. Each entry s=
tores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is =
at the
+ * top-left corner).
+ *
+ * Drivers can use this function for BGR888 devices that don't natively
+ * support XRGB8888.
+ */
+void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *=
dst_pitch,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, struct drm_format_conv_state *state=
)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] =3D {
+		3,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+		    drm_fb_xrgb8888_to_bgr888_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
+
 static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf,=
 unsigned int pixels)
 {
 	__le32 *dbuf32 =3D dbuf;
@@ -1035,6 +1086,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned=
 int *dst_pitch, uint32_t d
 		} else if (dst_format =3D=3D DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
+		} else if (dst_format =3D=3D DRM_FORMAT_BGR888) {
+			drm_fb_xrgb8888_to_bgr888(dst, dst_pitch, src, fb, clip, state);
+			return 0;
 		} else if (dst_format =3D=3D DRM_FORMAT_ARGB8888) {
 			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/d=
rm/tests/drm_format_helper_test.c
index 08992636e..35cd3405d 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -60,6 +60,11 @@ struct convert_to_rgb888_result {
 	const u8 expected[TEST_BUF_SIZE];
 };
=20
+struct convert_to_bgr888_result {
+	unsigned int dst_pitch;
+	const u8 expected[TEST_BUF_SIZE];
+};
+
 struct convert_to_argb8888_result {
 	unsigned int dst_pitch;
 	const u32 expected[TEST_BUF_SIZE];
@@ -107,6 +112,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_argb1555_result argb1555_result;
 	struct convert_to_rgba5551_result rgba5551_result;
 	struct convert_to_rgb888_result rgb888_result;
+	struct convert_to_bgr888_result bgr888_result;
 	struct convert_to_argb8888_result argb8888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
 	struct convert_to_argb2101010_result argb2101010_result;
@@ -151,6 +157,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0x00, 0x00, 0xFF },
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
+			.expected =3D { 0xFF, 0x00, 0x00 },
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0xFFFF0000 },
@@ -217,6 +227,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0x00, 0x00, 0xFF },
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
+			.expected =3D { 0xFF, 0x00, 0x00 },
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D { 0xFFFF0000 },
@@ -330,6 +344,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
 			},
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
+			.expected =3D {
+				0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
+				0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00,
+				0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF,
+				0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
+			},
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D TEST_USE_DEFAULT_PITCH,
 			.expected =3D {
@@ -468,6 +491,17 @@ static struct convert_xrgb8888_case convert_xrgb8888_c=
ases[] =3D {
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			},
 		},
+		.bgr888_result =3D {
+			.dst_pitch =3D 15,
+			.expected =3D {
+				0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05, 0xA8, 0xF3, 0x03,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				0xA8, 0x03, 0x03, 0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C,
+				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			},
+		},
 		.argb8888_result =3D {
 			.dst_pitch =3D 20,
 			.expected =3D {
@@ -914,6 +948,52 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kuni=
t *test)
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
=20
+static void drm_test_fb_xrgb8888_to_bgr888(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params =3D test->param_value;
+	const struct convert_to_bgr888_result *result =3D &params->bgr888_result;
+	size_t dst_size;
+	u8 *buf =3D NULL;
+	__le32 *xrgb8888 =3D NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb =3D {
+		.format =3D drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches =3D { params->pitch, 0, 0 },
+	};
+
+	dst_size =3D conversion_buf_size(DRM_FORMAT_BGR888, result->dst_pitch,
+				       &params->clip, 0);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf =3D kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 =3D cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	/*
+	 * BGR888 expected results are already in little-endian
+	 * order, so there's no need to convert the test output.
+	 */
+	drm_fb_xrgb8888_to_bgr888(&dst, &result->dst_pitch, &src, &fb, &params->c=
lip,
+				  &fmtcnv_state);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+
+	buf =3D dst.vaddr; /* restore original value of buf */
+	memset(buf, 0, dst_size);
+
+	int blit_result =3D 0;
+
+	blit_result =3D drm_fb_blit(&dst, &result->dst_pitch, DRM_FORMAT_BGR888, =
&src, &fb, &params->clip,
+				  &fmtcnv_state);
+
+	KUNIT_EXPECT_FALSE(test, blit_result);
+	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
+}
+
 static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params =3D test->param_value;
@@ -1851,6 +1931,7 @@ static struct kunit_case drm_format_helper_test_cases=
[] =3D {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888_gen_p=
arams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888_gen_p=
arams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_par=
ams),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_bgr888, convert_xrgb8888_gen_par=
ams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_p=
arams),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_ge=
n_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_ge=
n_params),
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helpe=
r.h
index 428d81afe..aa1604d92 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -96,6 +96,9 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, c=
onst unsigned int *dst_
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *=
dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, struct drm_format_conv_state *state=
);
+void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *=
dst_pitch,
+			       const struct iosys_map *src, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, struct drm_format_conv_state *state=
);
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int=
 *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip, struct drm_format_conv_state *state);
--=20
2.43.0

