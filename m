Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FFA44638
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A15D10E165;
	Tue, 25 Feb 2025 16:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="g6WPAS1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010008.outbound.protection.outlook.com [52.103.67.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C535D10E165
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHdlzew0n50SNQe6zd03EoWGMr6pF4ChL4DwpmDXRn810rg+tzdOxTdb1Yp6Fo+2WbI+QuDQ7HBivF7cwIsKc28h45y37YKfVDJc/Nrecuy42GbYR3/iMdA2leP5FKMNHUBKwdu1ukioeCsW/+PId+kWHfMqoy1t6GtXfzNBXVg9YtFExNimatW/2qlE+FrrM/BgtBOb4ON2udciAljLleKdxktX8lXByb9qW2kaEedOitWuqbwu+ZWZm25v2G+zBTrrkjHs9FoZkxT/HFVG9niluzMqrAk0j0wQRDN0aAA3BE2/77sr6FYMDntgURrxl4PT9kLvUfb60kQpGrYqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiYE++PLbJirHrp8i57r8rQoc7jL+K2GwE6sxLen2WY=;
 b=FTsAE4NVsCses4I01lYWMwutNwEug8MOjVRtd2CE9gPVRpPu/+VwgfOZcDGeqCovTDvfdDI7K0cknVgokFvwjDgpnxi6GlbJPfk+cNhBn0ZNVtgDrBIMbCv8qFsXDSvXvcFBv69dXSTCKVbMVOisQeeo1vyqTuJRwff4fs68XWSkmbYqxQXLIMu2Ajgs3/1YtykBeH8tc+CYChjQ3IY6KgsitFQ6BrSZcbqoNMdHcQ49ll9H0TH8vy7uVgMFq4C+fXZ6T9bJqmCLxFPHm3zHqNsuaDixGBN90KYlSsNQbjjKdl5Vf6V+f9WtQGkiWoTDi33lyRie9r5bdjEGModRpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiYE++PLbJirHrp8i57r8rQoc7jL+K2GwE6sxLen2WY=;
 b=g6WPAS1cA5++zz44r+SEHUynj8SNpDFezKPc0ju8cTaDwsybSPqeBMZy6T5TxeFRpeS5RSN1f3748Ozc1CKiREcUpjp28TJERzDgJpCJMI2JIEaNzgjXp5VaMwH+IZ4iwG69R6oGRjAi0Z3hXyWUGewOlFHtRxYeN49PC0bcTNuS6uMCSVxMgRkqo+nbk2vRdcafh5OZyOdoJY7z/GHo8qnutxzJw8awuAb0XfzTsCHrd1mzHxgSaGlVBUWx30x+BEBEs0tHll7uSDZizIIjJpJZh9372jAR2DFwy+HKSXk98c9Y2/mIyJo7/igX29KPhmdDJQw5fkFsQOgTtpX7bg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9876.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:36:56 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:36:56 +0000
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
Subject: [PATCH v6 1/2] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v6 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbh6N7cJBm+m8/TU2QUIiZ6ySDAQ==
Date: Tue, 25 Feb 2025 16:36:56 +0000
Message-ID: <2EABEB5D-B9F2-4B20-A363-612C27374588@live.com>
References: <0BAB26BE-5BB6-467F-BED3-9AA8DE25433B@live.com>
In-Reply-To: <0BAB26BE-5BB6-467F-BED3-9AA8DE25433B@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9876:EE_
x-ms-office365-filtering-correlation-id: 8fb8067f-2c36-4c0e-658d-08dd55ba9e4d
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|15080799006|461199028|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?WJuZbqnFyOAHiXmt7PCY1yc3CVwQ2pJweXMT/IOcX3XKmxjk3DGGpD2oTsLS?=
 =?us-ascii?Q?S3WSK/vuw4qGQQ7LWf+Um/YsaGlmjQKQ55IWJR+uqhWuQrG1PdlDl1TTGq7e?=
 =?us-ascii?Q?dJGY0jVz63OphGhyZoPkC8cN6o61juI79l6QLK9SbNGqACwm26DDZlIciQz1?=
 =?us-ascii?Q?sRB6dmvEun5z2dRkuIOvrURL5ebZDNr3FoPILm4mx/PMGJFAQKoeNQ91TixY?=
 =?us-ascii?Q?+08z8wE7muiAYsZ5Hd6sIC+KGkeTabzJ3r+aeuE1vqzCSqDJF+/lq+0jltWV?=
 =?us-ascii?Q?q8155o1XWDGBMtaQqhX74Mw6fFd4df4PJ3SMXRscFq4je2asqSc9ExMEdFS0?=
 =?us-ascii?Q?bP6JloAsTDVjEDbpByd4tcexkBnjN/99vMRtHYm+kyemLqyZhyJcll+qAn9O?=
 =?us-ascii?Q?jcaB4ebCdiVpqoc7VW0eJFrvEyIiYwz5KnsyeNh1JG+/pN+Nds2v8fFylSnG?=
 =?us-ascii?Q?VB/tAypDdQ5B7uniNMQCu9aBWC6AYcgjQGzka49mylCCPe2umIuC4eaUc0I0?=
 =?us-ascii?Q?j3Iab8epE0+6MjmegrPCxsd2yl6UfqW2j8nDadDjHlIxDCGPmEPkrPiVnzMd?=
 =?us-ascii?Q?QuxValBpB5rJbBIgl3msl0Lex6h62uSBVIwfaWYeFI/a6hGaT46fDzoTwFXT?=
 =?us-ascii?Q?Hkqs5Kc+dbuzLIVtyc17dB2RJB+p8UepMSGidqPbn+eDS98fqVB+ESoxccKI?=
 =?us-ascii?Q?vQ9GJoDuHDU3gS/KV/FGu9tsjQVMzXHyG2TEsZfUrtH7S1DdrR6eUrGFVJ7r?=
 =?us-ascii?Q?Npm3OcG/sN6SBYOTQgx6ph3xSaNVkQelkL+Q9gGNMEO+nuXQszgfS1MQ/+Fy?=
 =?us-ascii?Q?lxla7JxmZikSHlnKMlO0oLSVHR3BFx8P9t3qjgN7O0PgnzDInV70iFIzSK4E?=
 =?us-ascii?Q?pJsf8vHjbf25J3d+/o0XiykhSvHxMCny8kZgUI5h6+TW3nrnwD3plKOs0iSt?=
 =?us-ascii?Q?b25e5tgUrk5/F70pQzjMEFeEq3m8Hfln31S/78exZ+yeMYPM4kkbCqxPo5fI?=
 =?us-ascii?Q?e1bSoSrUaWzYgOPkAbcvPWryugXRHjTSacC90WNJVBI+tqaF9bSd19reF1n6?=
 =?us-ascii?Q?pp6Wi9kTtM3tS+FCFZ2qeI6ik2HpM9YjrlBb6OJbqP9u9fGveDA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Waad6yjn2aicd6713fSnBteDeF6v/L3nMR9U1vWB8X6tNpEcaB+bTKV+2iaE?=
 =?us-ascii?Q?FT8GEYnjVG5fdU378mqRHBYk7rHO2nir7XPY22jk1E1g1NZS9G5S3llsIhye?=
 =?us-ascii?Q?E5m9aoWhsbeZ2PRcbWd/1A8mwtebwbw6q7fdhOkR0mh9D2EjkPOdSTzzmJ6d?=
 =?us-ascii?Q?ZAw00NSUGM0mEme7AHzkayD1EVsireS2KWtA9axVURYnMscX/jigYLTFFU2s?=
 =?us-ascii?Q?uQHvoNDYP3LTa2FXSDiyDTM7jG4kaREb40QPQpLoIhwoPssUFDlnw2THHzaW?=
 =?us-ascii?Q?jOUTHcMxZAB6+T6mAT8hKcy4a3wIlY9FxVSLodgxYJRZjDuAtGGhw83vdyB0?=
 =?us-ascii?Q?V4nVNbTLFlvwtQhT0Xzoe6TkgESrV6vxWMaShp4OzYkwVb87FAn9HvJn0FGR?=
 =?us-ascii?Q?xI3W5IEsywALuRHJK/KCzBBYjanzmj9avBQQFO3sV1TacdohFYMqTAdq+m0A?=
 =?us-ascii?Q?hkRCuo6FKkD2pCDL+R3RCwCF6aRl9TmGqm6xYpi9lXFkQg2Y0pVLjY+xAu/D?=
 =?us-ascii?Q?yjHFPoRhP79d9M9ECoSJ/qxuTM6EyPZ+m0Z2XXWaumMECF+hYhnFJwyEDYjV?=
 =?us-ascii?Q?KMDFQjpwzO7Ix2I5X1dGKNbFpAGuiykhXk3fvQgc3AqLpbkC4SC3f4uW4b1c?=
 =?us-ascii?Q?fVbJ32y62C1Sex+h5JuSnxdry8p048aH0jmT4jKh4dlY1tHD57Y0yVAqrQ4k?=
 =?us-ascii?Q?/BGmMaLTsOtd+HQ6vybsmYQG13Rif3nGKPiwZdnEe0k4G4xD9kDkf6jEfkWX?=
 =?us-ascii?Q?PMyPJH5sikAdZxBtlbKwv2kvhbtGpx9CHcqJ/MfedQFCY/dJ7+SQK5icZcC4?=
 =?us-ascii?Q?fktyq/petJPJ20T6YqMZm3J9GqLa4WUZqVOkeBXtWJMxQMX8QpDnC6oRzpZp?=
 =?us-ascii?Q?9jsWQlOAGFI4vfg9z8UsygeLJbaI1/AOU+PVYX29QpvZNndNRVeaN9AGAkU5?=
 =?us-ascii?Q?b2T4xWS2Zxw+zHqp1daD06JELPsox7sHbDBL0tWDiStEJ4Gl7GQ9Nc2W1daI?=
 =?us-ascii?Q?9HwwCcjY3BdCYu+S4Bsz04WEqxsyTEblqob31DfMiBlmjRFiCezqU3k8iLmW?=
 =?us-ascii?Q?3/8DPgCXqyuQzH76Ze+2QXs9L8re+NI6mFGfOdTA9JFH5dFNnpQzjHKtRmyy?=
 =?us-ascii?Q?j42zOOlOR+eoIpS5zNPbBvud00EG9OVNN0Zcd9n5HZiJC3My2R2z+VzZOD+L?=
 =?us-ascii?Q?QejgGUt3XT1kcmBJT2JBhnJYMVgAjqoKJr9rOWUkUJ0RhfMmorFi7Ka83E9u?=
 =?us-ascii?Q?+4KudaIvSWOvP8Hzq2UpF3esxr2+tDBXcZvA6HTOnoPg/CWgHfkwqq1QX7/r?=
 =?us-ascii?Q?xEfrQ6TZbbO9CGkfWUw4we5N?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <800A1DB3866F7D41946BC3AE20A0EAE8@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb8067f-2c36-4c0e-658d-08dd55ba9e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:36:56.4304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9876
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
v5 -> No change in this patch
v6 -> No change in this patch

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

