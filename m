Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2769557AD
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6010E09A;
	Sat, 17 Aug 2024 11:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Y6G+O4ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2025.outbound.protection.outlook.com [40.92.102.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F8F10E09A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkB5/w+j1YpS+CZIhvcMCbs8fHK8abedN9CoduV5EzbiLwvn455PhezZkLrpaZzbvCGD3A+V8m/wpOBvEqKcT0s0EwWyE9PqNL0eZNpJMGI9T4hb79BFMNKxZZJhdBkvGr+BrUChPj+LAiQzscJZ/ZhwcP/CGFwjsnSY3Z72Ty7Z/1LP2JIpAerF4x3C+/WhZjgaXTylwa7DcqYtagiWGMh5dDEOxdcZyodkBkWDAj6NpIkuu6jxqM2Bcoskug7JIgFTbGpGQoosOpsILCaw459Gjwe649+mrltfBeWo5dxi2zvWgYCJU+SZYt61YS+yAvldNO3jtapuMHUh6zjLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=flm5b6oqCjcYqw7sa4zU7H5c79bkt+q1dJA0xieZpmGAWfyL28Fm3jeZhFeHIgyFC8ZjKHEEDHNs9EoxV3TteCXopC/9txwvaI0zWz8Yl46fEPvnITuLSvuuA0ZaUmfcZN0/0CR8qusMI7XMfmUPB4NQsYeEwBmXFYOuIKkIepo6e/gExMipe5ukrLkK5/NkaDEzTweYra/zVPSZD8yDsYVxVgYVQucDsalPRYmIEMFRTSJYEH+l0U1SpqNzl5+GO514cLTB5CVwDk9TIihw70G++xLfhvF/Oy6QgVr1pQL9lUH1OcTLobZbqxNYtAjyotxSsTgtBbPNh3Qvmwmdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=Y6G+O4udgKrwK26S5JaLRC0YkHR/lxC8lz5oBuxipSC6PxgEkQGi24IVrYk8RWlY7luUXEWUn8EHrudqLJXGms+A+yxS5mocG7ZM1+9bWrUz+xW3detB86XC+O+9KcgAhtQIg0xRIGZFAb8r+o+1moxUByOruoY8kI3bgWxeuxc7lablzVU8bvaUAQLLtWZCSe4XipwJyj4mZABs3QddOSaQIwfNIFLMcRPTmN8uZbmcFAKPdBVyBwSCi8yljVGnALRy0ouP3dGdvr/6k9s+UFMd+c2147BguTzWJp7BimoK2AqaMWr9s9RnQwifVrQRltnpABsQNZLrdijKdk7Amw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0120.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.18; Sat, 17 Aug 2024 11:51:41 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:51:41 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 9/10] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v5 9/10] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHa8JvSrP6YA8vkbEOmU2NaACH4gQ==
Date: Sat, 17 Aug 2024 11:51:41 +0000
Message-ID: <ECFD946D-2DCD-46DE-A86C-616496D1ACE7@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [0if0doK1Dj4+Grt19w3GWQ7jELUTPmZ6XIg4nqFdA3YlA50L/N7cOgUl3nS2ugzPRnkeGiU8hJU=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0120:EE_
x-ms-office365-filtering-correlation-id: 47cd1aab-22cd-45d6-16de-08dcbeb2f577
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: kFjtvnv5IORFfqcwqT2ULS1Dvb2VWDfEAR6mBJAU2fsmXnr8k4LoqFcagkuagYjr6ISkROp6scTgxKUHF1BJSeI0gArCIMRNvY4+WeHFAvFO5MlL1jt+NAGout4nZHqHMezTsYjlKbwF7ZEROK8Lrc5sDvP8fI6jKXq/dIvNnHTeioXOW0aIPbtNDXHPcR0Ob4cL5SJDUTSvj1JEh6g6Jn60KuZbrW9taGhPD4nw40IVobhswNk6prxWj4M5DfFoer5OZ5/Or7mRc0f/AmPsME7ECbiaLgwhXPGVxrLhkW7tNoyrhwA+wXb+HvRHqAxa5/BtF7EJ0es41WLe9LW1bSCq5jzhoIM9rmaq9D4loGmILSAqChHhjSWS7dAQl5LoxgVhXaWiT/Iiw0hXWnfcEo4iobcb8UIJJLE36ahdjMGl+00PyIFrbfaKLYFt+mr9NeObETb4/p9p1ma37Cvt8BCK2U1Fa/hPYROVLIKTdPimkz10EpPvGFzf+ToFzqeeJBQb8Nr1lKGckH78R7oCfYHpZqA/PjqZnHjeeURtNwfYEAAN1+gQTpoB+MjXzLD+6BuC6WUCgHrEEQdjS9qb/EuCQk3m1tHyeJTem0uvz7TPohj7vAosC44kz3/Eh82uLKjqhE9ljtoNenCndoT89qqRngecn8pTDOZ7YACcVwc=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?82EqXpJql5/QjyNEDtJd/yJETeq82+m7h6ImVQzYM1sWq1lpR0xUFtjx1Q?=
 =?iso-8859-1?Q?z8O52z199sf/GeFh1aCUg+MwGeag/XLpOsJQEgZjcQfX3Kg8C5LFQsJH9u?=
 =?iso-8859-1?Q?/lH+ZYf/pJObE2ADtcCJuaZwbn9ZKfSaBaoltrHiUrmMRiZOhtR4hLx/yv?=
 =?iso-8859-1?Q?V7mknmEBc33KDKVQc13aPb17nEZx7sQphpWqaCVCOa8BURkEfjqB49JiCp?=
 =?iso-8859-1?Q?UyCY2LeW1LdvKFfLfpjEUKkWxUwWIiRvklEuNNZGReLK2kKhwoMkkXwdHL?=
 =?iso-8859-1?Q?TJnTg8/0ZUa2StXOC9Omp30Q/KL5F/NJY5dUds2vMbuKE6P4jfelGQ5hQA?=
 =?iso-8859-1?Q?iSh/6vzWQjpjOO/ZpDd6Wmzxj8zNUf9VVWHBbb/M4uHFAuJx8HTDn2IuAz?=
 =?iso-8859-1?Q?t9Ep8OI6SUHxvRJx4lDDLXsQiSwosxhRUok/EI4rTrOMq6kUKSa0R2OkXC?=
 =?iso-8859-1?Q?PNcFq5BcumkUDpL9MA4w6SeueLNdms7toNCbzwqxTCldO4gAmKnzERNpkF?=
 =?iso-8859-1?Q?O1CCoN32yzjy0ByvoMwZ8qvBD+y/v/ioUMCESGxeUlroKKbq15nWqHEUUd?=
 =?iso-8859-1?Q?FGXvGBnyzVS/YMTSh1nOh5YGXmkzri3IA4YGI7w75S9P6FZQSkmL/MN04j?=
 =?iso-8859-1?Q?GHttnN1niFH6f+u3ARp0VI6tL1tYyR/CKYAVvYpKFiuKNkQC9wlAvLG1ag?=
 =?iso-8859-1?Q?BVS/oFUCM/jA3EiKLVjn+iR92J+2Mh2YAI5ht/SG8T8I7MlSSiC9jk38F+?=
 =?iso-8859-1?Q?da6c/S+uzXc/rMCk/DQg+GbTjPeTQKmQW6iGIZEnsCOpvG+MzmGw5ADA0O?=
 =?iso-8859-1?Q?4v80VJooD9+EEYgEeeeG+K2Z/6cNw1zc3rxAhSDrTICNreySNPo0G+oQ8m?=
 =?iso-8859-1?Q?9OrxBcQU5B4c7WOi1opF1CdSDUHAJpcsIC47TMhki6pn4Dt3nkH7SODAep?=
 =?iso-8859-1?Q?lGgZpgZAm4XrfAn86NbG/ERMYEqp0YynE2b3rATELpnOKhxOfrBI69hGgs?=
 =?iso-8859-1?Q?ZcBW9PW5aCrRK+psw551Cy/W4/itP2mrL93aTbC23naWLasf7pvwi7ESEX?=
 =?iso-8859-1?Q?2T7gij4smaBDWjsYU/aHprWlq7yIebzN40QSMMDDylMdQu7U8ReuqXFhPB?=
 =?iso-8859-1?Q?b2SBPZQht9jbMxqcOcZigQEYOI/BgEd7ZPcutr6ZkKM49aLD+VamIhP8kG?=
 =?iso-8859-1?Q?+sswVvUqOdgyKcA3lKL6+qlDk0TGvy72J5P/2J7oIo1Y0WDIzVn5OkQigt?=
 =?iso-8859-1?Q?eJIgkAq1beFkrMmBSrH1hGzTlHnNguh1xfMxxDjCmTiHssAYKn7x1QrDp5?=
 =?iso-8859-1?Q?2p5LXIeU4v33NsueU4HkoRWJSGRMnFTYFEiBEltS4OTgPmEgpe7KEfeCK8?=
 =?iso-8859-1?Q?qwELaa1yev?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4583DFF36093704998B9690370DE8348@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cd1aab-22cd-45d6-16de-08dcbeb2f577
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:51:41.1304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0120
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

