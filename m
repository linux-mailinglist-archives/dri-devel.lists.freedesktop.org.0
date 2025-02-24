Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889CCA420D7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0832410E2C8;
	Mon, 24 Feb 2025 13:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="mPEkZA0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DE110E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:38:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myFLqygOa1NiOXNB2h0oOl/Chm4I/F8WXRrAvOuOWimewlCr2W57OD/6WHywhv5akjMHuXrtA2h/WOEHd886B9ziGq+WtALCK0v3ZPCu0nRTDMF6spMkrihZEu1b9YsSek07gAou+4dIMun0/0O6thPOg0DnnVb+5qyH6aVxaOhNcDtuIc0L8bjex8bcNAzDfcqrSqUPdQ/Tc2YmQXfmwbGtKaNQzMfgyt49PA7Xl0dmp0P7IDBwOplfMhsOJuC8hm9qV0aFUK1M28rhjKmaezQyHehMDSdr+estg3VnO5v2BrT4HGaiYM8KCGG5m7YqF5GxE6afeUllw2fEJyuehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FCds3b/QmmynJQ7MQzxTAlFQCSAu2ViSKAeZGNZS3s=;
 b=trlS2HdnS2QDnijksFUJt5DgStBEGAXfb5WOjrg/RrvRVvJ86cDuLMJg7GnFIyAGhu4hzN+7URizy09DslSgA+iG4L/kesjyJeATF5k/i0rnK2COEKvn37c8z2AKILYwsCu3e1NexQVu23kWfoYYsgtIQegI2PhjRxbYF7Ze5YG5bV3HUdLIU0rVlPuRyVJRqMyMxWPMkxjb+UV+iOlsQF2E+3Ntp3L9hOU2QNTC98kcUMFhhnirTHakVa7YuZc8shAWV3le9y35/xqsygBKaZdkjJQUW4AZR3c80iwUsCdQgcRpOwJ7WUMAXGSHpFFvQA38TcbKBFOFhN4+UQfcbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FCds3b/QmmynJQ7MQzxTAlFQCSAu2ViSKAeZGNZS3s=;
 b=mPEkZA0Pyzb3dHdsN7ufwd82C1uwQRcJLXTdZoemJxQ9Cdbxn9oTxQps/Fl+6nx7vT24AiAhJyYuOO8VkIZIG+Q09XxFJBC3eJ49zGnkU741B5Wfb86vog4LYzYIYSWdIfhnmbzGNRP6557vr0ilac6oRbe6hnWV/6b8HDjrwVyMU38u0ykeip0lvVe8mC27CTRuP4s4PJr0cSp94UfGcu6V8l499ubmht/gE3J9GDOFyz/jpN/rcY6QNdKgOULGyFbbcb5HMumWhRYIKW0kk3GcRzdYc5XMapNS+l+s+LO9aTZKdwnQ0SCdCMePr3dpmg9b+ajgkK1/HwvklYltrg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7723.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 13:38:32 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 13:38:32 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/2] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v4 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbhsFlGUIZDknNSEG9RDJ+nh1Fxg==
Date: Mon, 24 Feb 2025 13:38:32 +0000
Message-ID: <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
In-Reply-To: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7723:EE_
x-ms-office365-filtering-correlation-id: 7912c2e2-2471-4c86-377c-08dd54d887cb
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|7092599003|19110799003|8062599003|461199028|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?nX1e2+U9bFl9OJhljlPGYrO3JIX29WnIcMnZM/cCstRWY/hFouqzrjlOj+AX?=
 =?us-ascii?Q?o//ZmK39Ftv6RWi9Sx4FPyTQrHYVqX6wxFokxyrW+c6PDJ+vB7siYhcdonU1?=
 =?us-ascii?Q?csRysQFVY3zaQVg7RrWf5vun1X60/r1qBeBMDd1QR9u3KtM4khpMfochlSmP?=
 =?us-ascii?Q?3ZDZu/9EADulBsZh8ucHOd3GALyIooZcqpVPt0WuFKW0hjsSHXITrgUjn7f7?=
 =?us-ascii?Q?tevbqUDdUuiirFRG/8ylmVzRr5SMBpnQ6x1ddWiQMzVDBes3GWOO+tzazZMF?=
 =?us-ascii?Q?LFfnnHWzVNjBkQF3zStHu3YEt0xgcqIwkjYF/ocQul6IV74ZgBH60U7Ip9T7?=
 =?us-ascii?Q?ddf6MQNbuIMxbsHEhnglo+T2cK9NasNuy5pLt2GoDr21+x5H+PpGgQ4y2XB6?=
 =?us-ascii?Q?zMa4g75LU7HhSgWUWIzUGfWtS0XGHbH7DzGPEMuLteXAjk31zYng+FOaG5MX?=
 =?us-ascii?Q?TZIP0sJ/rgG9AA6zc1uInDbbKO2Pt4NZvO/iW9ixIj31UwmEEbpFppoWWvRG?=
 =?us-ascii?Q?Y/fRfFzq3iK0OaCpnao7Wk5fneXPLwz5ywQ34f5u3A9uo8nT/rZN5tgi3SFU?=
 =?us-ascii?Q?hk/s8PIWDFDMsoeoI8oKRdq/qHeFoNiEssm3gf18czoKhVORrV/sz5nUABrj?=
 =?us-ascii?Q?B/JhYjbKcv7g1jtWCh7FLqtEa4M9ptaPYuAJb6OSiGxlp5YU66I8+BBJ4oYV?=
 =?us-ascii?Q?uO3F0eqAROSr2CPfowqJ7yzKpiSHE/TFspWXSkKkslRYAfyEumOf2yaSy5y8?=
 =?us-ascii?Q?ZyKZgh6eVc1T9gI04zbzxLjqd1iLvWaVNxr0OiO112Jg9N6sG0fzB6zo2hnD?=
 =?us-ascii?Q?7wVhNDnfPwSrpJ5u0ND3dBPO3+45iBOY9GCJjOLncqwldVgDVYhF89y6Lytg?=
 =?us-ascii?Q?Dz72GXarwcsdXi6GcUDm9cPb0loyr7fD4nR4/LLWkbAqqw/MKLjvM0D8UXEB?=
 =?us-ascii?Q?63ScgbD2IiBs0okW/OYdzGl8D6iVADViWipnnTq8T4NzyzD1IsJPPoVgdATo?=
 =?us-ascii?Q?eASRYRePmQQV4FTamQF0p1FwZdenkEm0p1S4gvbFTZjfD6SLRBqyyfDLJ/57?=
 =?us-ascii?Q?+k5/utpsIYVKmxEusBQqWz2TefmfXeLpcVjJDqD/U0V0Yn3yg8s=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BPFoAq0e0oTIItt3e0yWqo5sMxKPGhZGN0IKvetO99NtrWfu0roy3D1Wjhj4?=
 =?us-ascii?Q?Sod7EzbVEgai8uD2JE7WGuTO/F2xGr13NMXFv+lTOdL6QVBnJNvL1TaEHCpi?=
 =?us-ascii?Q?X0FpOjp68oBkooMoM0W70GB03YxzIuFA7ulLqvSa6WpjpjFm9myN8PllKEvy?=
 =?us-ascii?Q?FVUm81hvRjIJXJ4RdoVRTMTcCJt94P4m86NGPPVSuYZ1ATQjT+M/GvfGgzrT?=
 =?us-ascii?Q?hhulJn+6oivYOvVLHZZN0tRcMZLK7Fm6IkK66IwPQziBsQTs0DD+jR+ZqJRC?=
 =?us-ascii?Q?dJa3VG2aAVg5w2lkFNrlx9OJmt3nsrZt92B/8VhafDUfdmiZ1QV+bjbmpqHL?=
 =?us-ascii?Q?RZ+U3HwDYHOzRmaKUMADt/jdU8THZ+u5s6JoZXeYOPm3o1MWQI7ic4ZLg5yk?=
 =?us-ascii?Q?4vxkz8qrdSBCVZigmbCQO401f2VXNnyu1F6O+XR1n5EchOO0YUOhGvtrBl07?=
 =?us-ascii?Q?LMbu8wFk4i3RDrUWWLK1h+OzdZkPUNws7GupLU2xs5ePv5Njkm3yPy/J9jtC?=
 =?us-ascii?Q?Q3Ybjdlq44YTugHaT8CeVxDf6CkVZ/6R7npGE7D/xZXxJD7if4UXXmQlmQ3L?=
 =?us-ascii?Q?Wo+Qv7oofgWjtOdfJhz24OXMy9Bjy0ZvqGGm64Vs9iqT8+f7M8r1DQex/+uT?=
 =?us-ascii?Q?Yfe/iWe/odWl6Bk80+P5rqjdEOTo2hPtHakQMydtTOq+Dw12lHDHi9FP/NX8?=
 =?us-ascii?Q?JZAbfs0qHYK50LUr9lPy3mrin85uzqLBdipbFGXCk+VMkBIXsJxoKCdWTHWx?=
 =?us-ascii?Q?bqBJ4La0+rVKnw6mIE+IC0L9tlSMAYAYF4MwgrpyU3cbubIrl47l84wNPotf?=
 =?us-ascii?Q?kohS3/vFLtoOp6z/hWhVoOsCLj8sdPHYJSrsJk8BKYPR+jCeenOGFw9D1IgJ?=
 =?us-ascii?Q?RzDOTajvJfnvc8je26hP94pD6QJgAXPrHnbW3OqqKnOtTxkFeNTPtMlpuGso?=
 =?us-ascii?Q?SdgsQ+q18boHh5W7RpvEtHpUGMDq5Lx5ck+pBKvA2/4vOFAz11kuGsHqupFJ?=
 =?us-ascii?Q?CulzACTBpz7ZSdV+/iAmX8zCuD2fdh+dGTqZ3Crp513Hopp1A2UawBo11Wkz?=
 =?us-ascii?Q?RMWuOmDnUBf4O81FwJJVPtg4YthdGfdga9vCSls5wFogi5CqP1T8jI6ZSQxC?=
 =?us-ascii?Q?i8FDIZ0L/iFiAgCjsMF7oq5+FSnUuacfarIsi2fUzNCaSt93JRO7ZbAKOfQp?=
 =?us-ascii?Q?7I39sHchgU2NLI/HErtaBE+DaO+0nC6tMmZio7ZMK/wa6QGx0NyOcJWSqjK2?=
 =?us-ascii?Q?qk9PdPPzY5b/6my7/tJEpPjh6BcXCECQlGmpo0Z9viQlvFACIZP/uURFlFDG?=
 =?us-ascii?Q?awykpbpNZHtlYUswj/FhfTDe?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B734F1CF786FC84FAD5052C0DE08ACB4@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7912c2e2-2471-4c86-377c-08dd54d887cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:38:32.4089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7723
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2 -> Fix incorrect description
v3 -> No change in this patch
v4 -> No change in this patch

 drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
 .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
 include/drm/drm_format_helper.h               |  3 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_form=
at_helper.c
index b1be458ed..4f60c8d8f 100644
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
+		*dbuf8++ =3D (pix & 0x00ff0000) >> 16;
+		*dbuf8++ =3D (pix & 0x0000ff00) >> 8;
+		*dbuf8++ =3D (pix & 0x000000ff) >> 0;
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

