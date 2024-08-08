Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397994BD1F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9666F10E702;
	Thu,  8 Aug 2024 12:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Kp2BFGt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2077.outbound.protection.outlook.com [40.92.103.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5610E702
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaS7CIuUqsgsvdFlSly2s5mQOokWhHD2qYsE2L5KyB34OSmidsFOFnnOemIp839inAgJBHOeYNotD8uUYMNfuQqffsMIxbGQSmYidf/K9qmbYZvKulTvr9Bv0tHAdcO85DTMH6c460zYgrDS86g6DQ2EoWF+0t7pUYmmgtBuyZnzWFQc+G1W/jBakyXQT4/jyRTb87OiO3zldgT6jguHJi/d/exIvPDNbG7PtB3yyxkUDURSbq+MqfB/41zDPaMb+msuJDRSPZWyjPy101tYlNdwR4i6UKlHjPa3+Q8AJ1jvMMbzCAqfNejco5v+dfrcUmndau5+1uGFab14grVsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtdQ3/r+0UdrKlCuSHzXkJk1YWEEi4Wt1GXubHNHEfc=;
 b=cH/bdha/X6Ds49K2JONPB4GsjgabJZFYsVGJXs0SYPPIjmk9VWPbh3GLpPUlZXUVFBkb/QevXBIUDKmZcXXG39IWnaUruh1bLosy/LdjxzT+zu9sHg/v787ok5OwHyCb1f6L3OaI3ZnsNigSAthrXcv8gdA00R7ZLVFEpiluDuc8r2nc6bUXaP5J0nAcwc5zQkcZSfa2J9eNIlFCBH336x2mh1FgNRqwsiKwJNvitA88N1oMS42hu9bNKwKy1v6cGpCBcVbMhmo7oICOcFOB38Z/47aFu91Vyr3C1/R/M//OjcnMcZcfDmXcadWdimxvfi+1vZSDJp2kUWqFR5ifIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtdQ3/r+0UdrKlCuSHzXkJk1YWEEi4Wt1GXubHNHEfc=;
 b=Kp2BFGt+6K3aDhsw8wjKURZZ6fkpcmvkgWDwBPQd45m/rMPH1CbucjJplPvJeYeoDeg/vOLUNuFwUALPOdfMp4Bdog1RQUE0VI1r9Hk0S57uV6Y+J7kEdhNG5xD2H/d/KTNzCYFlJb51meyWGVRp3BwFMIScoexS570B34L470MU0m/bH/PrFPM4MqboZODvAiFsVJ8kWHM3zL2Iup8D4blCG0ULVxcfP3qKtce9/sQcX1wV9MoeMIQ5jhIiG1c1J42YwZHp9YANshqMbqnC1/7vBZCuQdYdyH2LpsMCSyxRYVquzVncwaKaFiFPZiaRPJy5lNJ9w1Y0c2Q5lLgCAA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2144.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:13:10 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:13:10 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH RESEND v2 8/9] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Topic: [PATCH RESEND v2 8/9] drm/format-helper: Add conversion from
 XRGB8888 to BGR888
Thread-Index: AQHa6YxVlajliY3BmUmFXaQEzoUoow==
Date: Thu, 8 Aug 2024 12:13:10 +0000
Message-ID: <FF3C7349-D5E2-46BA-8300-867BB58B1867@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [UeTAULfIFEQ45uuhlBBtcqYHGJOhzlOrWc2cdcNz2qrLsZN06MQTm7L7r7B7/Bd8njuN8jO6+Fw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2144:EE_
x-ms-office365-filtering-correlation-id: b873eca1-6da0-4086-a5db-08dcb7a37824
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|19110799003|8060799006|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: VRgWMOV6UKEebcoMBjROchWKDslqvT1MT1FXNAVqTuzNpJMAKqbOI/keUAhr1ll8qEUfldgnkH3hqezR5nbZ2ARDyW8kazA+NQJZ3jUSaqZsD04Fhk3ixmq7zo4zsnsbaxnV5ZzDrijmhd0KjYka6KcfR/N8/i2nBWc2NVJDafwzyX2Z5wsYAihRIXP0uJt6YhGVQ9O0qT4E+aijul3LiC3KIzVS3N69kmoZvlyJxQ5cDpwu0R7Z4spMn/CsXDSO4JElo2tx7TB/crxgPzUQc35b82fHV1nj94nuMXagIViBndWNkfrHGGlvO9GYW5NbAZ4h9Na6Rvel8jvXOOAYt1gEJokGacIaY6gXTaqiOejTL3+hedM2mwZQsrBWmiTEq8jM43wELFD+FpTwUPImOd7Bin7kR1OCG8rUihCjRStEOivPH3bYBbpaHRSINApMY2FyXQhCaQOjlNNNYu/ynvpwvIKWJC58Qals3V5QQNkbxOOXVUGjgkopNsMvMKHqNs6gErxt0VxdzZqtS4SKV22XrF8Js1QZGeKwM/oIDjheLgQd9VUDWHGNEIeJQdsfxd7FYixatXTS11mvHe6agy3js0qkMeq5e5KUwsHntLX6pGIxlLj/ViG5zeBCQ0cbCH3tRqMDFpZXHXIQDmW1WZsvh/Wlb4mFo8pxlVFgDk0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iCrwHF6JEoV8jV2BShdvU6A4n+rqJKZNEMMO+0PtU0SP5D8YuGPRQCXW7LXs?=
 =?us-ascii?Q?O+7/wHVQ//O8e1vvPtI88l/sdQk+RICop826qo/IMxHEiDiV3aKlh6ypK4/B?=
 =?us-ascii?Q?n5o4JsCGf80CxYfV52eDCjnxAmRBM0srwQ5vM/+BH0iQYBL31cfrHRR+H40m?=
 =?us-ascii?Q?AWMo3mT5u0rohPDfaraJ4RskIDmqyxPYDl7Tp7O68w8bqU+QgHscRZIksTa4?=
 =?us-ascii?Q?LYvblpS2q/SG4q8a5XQP7U9XP+QppjfG47fuhsD9K7O1n9d9Yd5JFuDvi45u?=
 =?us-ascii?Q?sSqnVWDuvkPgGrQpIYTl6/h9loiLPJmQkdVPgAk4vk3vCY1+oU/dIKWVu0I7?=
 =?us-ascii?Q?+kwVtQR+kMHFHy3WtFNC/+FEhk0v8lsGplnG7ihZVt4KvflwTWfT8WYixVj/?=
 =?us-ascii?Q?m3UeqS8H++EeJiWwo96r/PpbrL3OqYVo9XxeFTFIwvWZbcUmF+m/9cmOHuB3?=
 =?us-ascii?Q?Oif+ynAWA/fm3vExRAUuFW85CrHvI1v/ynpoNglAlzQNjZqOJmzv7dOkRRT5?=
 =?us-ascii?Q?SPJJApv0vfjQqcDQKIoxlr57wLgAoxnZZBTgKNXidMbWDQ7e+hkb+qKMHGus?=
 =?us-ascii?Q?LOBNFskwzV6iff2tk3pj8asvw4P3GuX0d3YHRZ4eB6yYdkgZcOOEfIcFaino?=
 =?us-ascii?Q?YjqEo1qxfSCMEKYv6v0Hx6x0/UJcQ81kLeUVK54DPPjEXphob4aq0VMYT20e?=
 =?us-ascii?Q?3fhEc6kvGgdGVBWicE8WwnJiIDFQp04qNIE6ijmGtvqvtuZAg84zaaNQdZBt?=
 =?us-ascii?Q?hDX6NYoP7S7nShRnqqm8TeFGxOq63uXdAVjHttvfUljgMLcjF+G0XNr4q4cN?=
 =?us-ascii?Q?qFNhAsjSEdER3R4e6ilD+LIkS/+0lupV4I3wo0QTa3Xv0MFD2YMTEpBffQsX?=
 =?us-ascii?Q?I4OiJGqFXTkUkfM2ny0jpUvbprBXT5DkjJqKSkvDfkaprhybGNvbugkxXvVb?=
 =?us-ascii?Q?6uOqOYPN5HdZXW1NpoARfGlbiY5sLTAUHfi0fKJ6XAlsdGotxb939/ZxSDEw?=
 =?us-ascii?Q?QGtoyioJMY0/gD3sbwn7vZ0FiCU3jLOeY1n8YGZ7sqZiHvgg+uU4Up/SQIPS?=
 =?us-ascii?Q?W/ml7Z1r0iqlRWmnYQeCr38MLDEV5Ei9FcTHxzR9yA20OXBW09NjaLZA4x/O?=
 =?us-ascii?Q?g8jcKHiMLf+aT49tmC4xGMrbop+GFb6cQ5Wm12x2CmFBZyHxwDpS+63FHywP?=
 =?us-ascii?Q?v8l7JkdfKF7EAMMekeJeYrBNr5UItmP/o4HEzeLn1CHBFmoP7EUcUMWquzcH?=
 =?us-ascii?Q?nQzCVnlW6mL0J5IgXZTosuMyp2UKPBYlr+JAX0Xu/GIfpSO8q9QMEuDWa3Df?=
 =?us-ascii?Q?Ne2BOLaQhiIAopVBiukm6NBO?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF3EC79541234E4994BB852912244645@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b873eca1-6da0-4086-a5db-08dcb7a37824
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:13:10.2607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2144
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
2.39.3 (Apple Git-146)

