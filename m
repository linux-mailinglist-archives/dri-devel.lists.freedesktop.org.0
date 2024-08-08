Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761EA94BEE8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCB110E746;
	Thu,  8 Aug 2024 13:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ZGooGa1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2066.outbound.protection.outlook.com [40.92.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5891210E743
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNUg4W1GCUFz+4lbziPRb2r1jtqQ8CkyUENEEAWkkeNasH61g8IeLJbQ2ibIRBvkymDK6fl5WvUAcHgk4c+zcg3QYhHueXvS60No8mpe5u+M2NajUjRtMC8UT37d3ZvyWrZAPpBL00seWgBQUF17Xs+y12h+NaQPhY0VhTEVOyNjn1n1LU+Xo7CHoSLqcO4nDSwJTQcNHN3oFwUjR1kQVBQRlzfWNUjcQv1jibmi4izEFDwCTBJvKVezFjGSVFphOdGT02Gp2NEp8vUKwvpjwlIVaO7EZIX9C6be0hiXJlG37IpA1YgykdsoGVhTrN/MKt+CWL2uyIn3XMpWNd7s1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=GY1tz482OsDB6RE5F6kIcJsMRV3xEpEPu9TyGfubgQ7n3cwdVUHLZP+82Lhg1fn3WXKypxg9GhsedEbzC0HwkN2sGsa7lus9Gkg108IFoSxRad5uvv14Lq1f/CxV/oykwRkgLXFuiuTKeNE7h/hNUNHaGkv0Qj1MYigfvlok6jY0CebIVEZiIMyFC9olVKGbw1ZAY34GiXxBH0neIJKp9gq/a0wW3e+0tMTN3U2zLaxgzdHhKqS2/9sirDrNQSjoYjrFNWG0OS2nbQm7eRPaoH9SNo3BBjFYyGeqEyOsknkPFkZK1Jd31VANxzMk5e276nx/ZM4gss3SJLTJ/LjuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=ZGooGa1gLyEqf2GTcfDmatLxL9Na93eBMQNjifez9ww8q+1HtV5jVRZsLowkznCrghY+AXyyjnmEtJrT+2EDfUIWvtmbATs1EbOsdXcQ9TMuaey/CjQwrEMPF3hOWABg3KVVpC4i6lWa85eW3ifIGgyinJqxHJ1u2ISpOqsJbHSgkecvi/no5yA6XyjcHfl+n+dW+Tgxvd4dMCAFYPX8h8bzdM5lmuG5jtOus41MUnh9pusm3rcQozbVIY63jmazG7pq6s31/JxGWDXC9PRBy3D8YR5vsX5hp2fvnSP5Cn5mxLB9YL5QP/3x0Cz5Pf+BVHxCu8Mmj2kSLFwla/xxrQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2013.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 13:56:40 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:56:40 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 8/9] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v3 8/9] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHa6ZrK6g20cjdVoUSll6vOyi0YUA==
Date: Thu, 8 Aug 2024 13:56:39 +0000
Message-ID: <95B6A54B-E2D3-47F0-8055-E0DB31F951C3@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [DVrbohJuur7GtwCx+exGsk1oL2GNCsf8aly4hNVnXOJmbCdxh+HX7Ww1TDqYRn4ZQJEJYhDdhWw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2013:EE_
x-ms-office365-filtering-correlation-id: f7ddf7ae-cc8f-486f-3b9d-08dcb7b1ed6f
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|461199028|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: VZ2XSMpnhj5aHSw/g2lbzlTSGXj8M//NRSlRZqj0NP40hcajHJXjgKPjnkR1offXzafCQnk63Rx2zckqOynAaiVYah3tQRQXtmWKKwYsfaiDupyyWxkr6A0p2X7LoimNL0ox+4owmqSJVogdh12N5X1fn9xejZMN8RAAgruQRntzijp+nxJMKAzfOTdIIFa7BLcKWCPVAdNmbhkZEfS6A6P9GZIZBBPq996dcXZnGJNf6rJFv31saQ6QCt18UcVrFFQ81Z6T0SZcpwFG9/zDKyqlCE/xb/kBcVTL2uTeoumaw8Hx0m3JU5Q0i/D919MfLTfuz0S9N+XxoWkzFH2NTdT54hYClrupxC6nG8rxnCS/nCVBDuXZVKrgw/FOypnN4VSqGK7W2YqbyIswxcCF+TvVWidVuRn3veb9edgjYxQnWyLkMQetJ5BrstAzhzPo9w+LJWKyYxZc+1T63oWH27FGV+uvbcLCcqLbsu3EnkG8J7O+gflU6tY1r1iM2KBb0LbG9OXdserAjsnYrZkJdPdr8AovmWm39qQ6cr4S8+7aCS7+k252vCRCrDLyp1w4nEm8CxEOqlx31t9I1pydb2b89TuYwVmMm07ENSg18zOe+juxVswHG4mCHXz5ZdoHbdwKFLVzuewbH8X9ilDhvsyk+y2QGxN8hlBM71fmJuo=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1qY1zMHD0iQimpV1NApTrZpai6WjyVY1WAPwP8QxInyXe9Em2ov/wOB0/UUs?=
 =?us-ascii?Q?oZZWS08bVqJln2EWIezv/GVVVukpDik4KvPBgI3Vx4xkC31vmPwmLR6ZIkzX?=
 =?us-ascii?Q?ExkozZuSc1SaNhXqNLbPCNvszdw3K/5S03yMKY++Ojqk9WrK8DA/uqUCmuI5?=
 =?us-ascii?Q?9+NRFDO3DmSaVVPXA+QQhSSx9064ntkb7xKC4qANUjPDUqfdn0zUf9/niB2Q?=
 =?us-ascii?Q?2YZWqRiU301ImtXmNRpIkgIoa5TCCUD8q+37z6rAHtx/P4gG/Qq2xqkocCnT?=
 =?us-ascii?Q?zoojYJ2hInmj+AsY1WBtxQHZdsQAclU0FpCuJhMT+lTku53gQpqkUPblVl5h?=
 =?us-ascii?Q?H8SKgIQ2b8nS2zV2JvgirpADHrsyfEk108GYiJhmtdds/3n9K6DXJKU8Lt6I?=
 =?us-ascii?Q?mDML1B5YK/+3se2QMAHxB3VvLwThqy0MgqoehZVI+UwHOmpXVkw5DiRin6+G?=
 =?us-ascii?Q?GPQyGDKOV8HY+EDSoA2kneVTji+p89rAegU44V2NY2G+UHfnK2m+JuxEtMZZ?=
 =?us-ascii?Q?c2qOPqeTHbefDesq+QGCjAvk+yTwr9577ypuCWJgc7fdJMPMjw12s7FJ227q?=
 =?us-ascii?Q?GLBNDOL0b8kdbE+1U+uN4gextTafCytjITuSZNDGiObKE8e5nCJnpzPkdw/h?=
 =?us-ascii?Q?1ueDht8kkVL2vU8J9aLCP4fbtrr7cWGAFncPA8qXXEAL4hveOHz78Jhbs3Cg?=
 =?us-ascii?Q?QHVMckSJfefHwx21y1q9P71LcXDVH9QZ2HWlyAqXkdFTGpVTujxcQceBQ91C?=
 =?us-ascii?Q?u9HEUGWGSZ37AyIMF6hrubi7yuHmAS58OUqappnPAOOCVgRZ2pBxgRh70yZx?=
 =?us-ascii?Q?hwYpL3W1HIkcbwDsOcjtYJT9IJjxP29c76yMV5tpCLplzKB7C+cvrBoISi+N?=
 =?us-ascii?Q?saQH/q5mtSa1ZUtFKRWavReOjjoPo+aJyFmvMfxz0RIoYyKdXvLs/iAElbkL?=
 =?us-ascii?Q?ir3E81yb7bE7Nq9QSFKxG5no+W0l/tWIKd6Kb+w+RBt956gmGiBHRP1fQ0ar?=
 =?us-ascii?Q?bKYqyLtFvyHOaYG/C50im9aZQWPYwWZ7yhHsNOuoI15Ym5Jq6jUxUQDFr46E?=
 =?us-ascii?Q?vPUqi65Le0QUh6UqaUtBwJT3boXRTjmNruh9VDMIvI4FoIq+xOxd3R8m6Mc9?=
 =?us-ascii?Q?OWAZ48ZktJLrOrhFv3D8z+a4+W/pqMLsS1c1S7Kys9JMaXZppnSc5tQjCFax?=
 =?us-ascii?Q?JOA1lGZz8V6loqm5J0p5ej1dgKKymvwKKScW4roA0U7daENYu3WNx++mCaRX?=
 =?us-ascii?Q?RniPP4YUFbEdULlp6cCqukGTCbVEuq3n1G/vYIB46z1geDGFQeMnGo6bdhJk?=
 =?us-ascii?Q?T3Q8B3UHFq+ej7jX9AryuGNr?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AFB98901BFC5F34792B901D7D959D52A@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ddf7ae-cc8f-486f-3b9d-08dcb7b1ed6f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:56:39.9749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2013
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

