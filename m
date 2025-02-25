Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C5A43AC7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC9B10E5F9;
	Tue, 25 Feb 2025 10:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="U4cqvkoU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010014.outbound.protection.outlook.com
 [52.103.68.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6210E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMzwuVn2zEDcQd/QuH0kI1lVqrWBBHIhO9ZWU9FOfFxK821oc1tUEzz3ovDSRJqfhAVFCEILqCnNv1WS47cA25IuPC/jw1CPg2LcbgOTrx4nIUx7EVw6OwU75Uhjr2AKCRsjMaNvwUQmWJETS6d7vNq6h5+UXtTYTu+oPnFKaDQQP2LkgTh3ImlIIDp/4F0TvuYHDg6xRnHoYE8q1I6aLiuvEqpah0QWAR49i9S1yWGf38xfkoa1AEng3n0q8CkUgUqtsNoa04g9tp6mbkXEfvfQykFDMPT55YZtA8Ri8VFvB/DJadoxcpD5XoVNIxBiGDPhI3TMeFExE2Zu+nC8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JgHTf9xVn9SV/6jTT1YL1mhzpcCYrfQCr1BMktE79Y=;
 b=rJioMe3S+Sj10TGD6jOiBiBAW5VhBTRgJ4zK17uoyIO1B1g8eS8S2ZqwXbbDqF6HDZlE+TWWy7+WaAK9RTHVyYAs6JLZTX9/ENXR0rXQ/tjkN3JOupzNIT3puQ474882We0sF4BNNc161uIAPyTJE4LcMnehp4G30xqJjpfuXvIUMmmoKHwnydh+3T8WqJ4F5eRtuBC9Dt6BL0vVHpQI3ifZhMZn0VSI40nzvj1kPIYvH929FInhaqQezjf+4YrMGkbplH68HDh0pGpxQlA2ZYgpGYyoJBIsaIjLf75Uw3CSK0l3xKeUcsO5BgZlVyInocGPNRah5NKNVjfxod559g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JgHTf9xVn9SV/6jTT1YL1mhzpcCYrfQCr1BMktE79Y=;
 b=U4cqvkoUmfo2C5ApRLnD06suMddksXr1yfDOuMRgNZTcMx8NunQoQTc/LU9P2F8/POaCrxZDt1SNPGtoA6bRrH7mrVUzAo/Toj1ECf+3JDEheyK7ydQZAQK4JEC6KkLslEvAxit3+1d1umCGb2OHmB824VHYy0ud8BxedrolOIoYhyH+36napN17YoTRFkzRL8jAoz1kAp811rfjEbUkR3r0N63NowSA7YmfwsQBwBfKdWXTdm/8s5SvVycFGIxanoRGgli1qkXRavvluhQjO3V7WuOHxs/PSKGZpGPjzQsrvdmt6fl+qLHLQFYuDLx36yKa9dzzmjGCUpZe9atZPA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA1PR01MB4370.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:13::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 10:07:58 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:07:58 +0000
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
Subject: [PATCH v5 1/2] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v5 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbh20lMrV/LxQfFkGuftYBqy5i8Q==
Date: Tue, 25 Feb 2025 10:07:58 +0000
Message-ID: <8997D0CC-621C-4373-9998-5125D91A7B61@live.com>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
In-Reply-To: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA1PR01MB4370:EE_
x-ms-office365-filtering-correlation-id: a0cc1f16-408a-4128-506b-08dd55844799
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|7092599003|461199028|8060799006|8062599003|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?/Jf5jrfM6tXnLyoP9D3QZbF+DPpzjJTcH4l1j04vsf0+Euo60cHDWdfPH24C?=
 =?us-ascii?Q?4SdBWgPIETvtcLGNBdv8M04JlT1n3CjjsCv8RutkpWXoLUG8CTR6BOORgapX?=
 =?us-ascii?Q?qswp/d5Z5UIDmtwWO3sRk9AC5URotX6QX91G/Alp0iLjpPcu5Wj4EA4ZK4La?=
 =?us-ascii?Q?+juxcHGvPbii9yXv0bbAoc7k55t8Jb1TUzvE0rCRuU8QGFFeW01Qm5l4N5EK?=
 =?us-ascii?Q?zHGn9ctf/xy7gQUtZkYIzkZS8wEe+fe/jncDgbMf+q00u9c5PATNi3UM2zXY?=
 =?us-ascii?Q?EXeGmBm5Mer2HPO4iwYhible/RCVxtrjQBOCphKaOmMzHP+4V0JCd7Ol8VZi?=
 =?us-ascii?Q?XjaXsmKzxWxCH73lJGM8+b8TrydJCLAkzPwN7nNtd9g6tBWOiGVXDprgx5Kd?=
 =?us-ascii?Q?wgkA2V6yitvbtGlfipJPIMkRaDOneNDpCnlwPWFOFizNtaJWRtDmjqccHAPy?=
 =?us-ascii?Q?tPtBupSNUHOje+Tg8sH6V48xYtCj0nGu6MDhFVcoaQXbiWmohbOpFN0365LD?=
 =?us-ascii?Q?L0BAgEfPoBRfRcbeq/KaHpDw5v7GutBFAiPp4OONF5ZVu95zZrgVOP98HtA2?=
 =?us-ascii?Q?WLPW2tgT3yyMIa49bjrcZTgAT1ApRywO2gXZQUzSydij8sKtwxl6rp2nHeI8?=
 =?us-ascii?Q?0sH6REGEK4RxDilf6xArSL6zBE4JfX8BeAb4PnVN++shvac6jkRfyXGVzsoc?=
 =?us-ascii?Q?UUEHMT1zbkqeccm215BOKguF8d1SOiEgRVH/Y1GTC5/zfeda57BC2bakN2uC?=
 =?us-ascii?Q?4Tl9LL5RscQlIZiH4kBfQJEhTM74LvUA2BMeZ7w9ekLjjvSaFpJD4VK3La+T?=
 =?us-ascii?Q?XT/jzy7jv5lRgdS7xrlcrZd3VkxPD0+ARvhQr9wky0aFxF54KBhiBc72AFrB?=
 =?us-ascii?Q?cvDqMy3aVsCO2ziDkA9GK45OzRah04X6JDXEnpqJeGBBhL5b925uXEhswFUs?=
 =?us-ascii?Q?ZmYlrU9hgbRWSu4v6Rc+yyIzf9kU8P4n7aHG2JGeqHhnoLVmkuqiqCWP2XhA?=
 =?us-ascii?Q?8BLK3OyfetgII3DPJ0hOganhuWxPCyhnK5vJtMNivxMVAuTV0dRgQrIlAyym?=
 =?us-ascii?Q?mU6eKqqiM0Z05sDD+LtBx5S1/IQVZCpFMtmNr8qXE7aBWt7Nl/c=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G+P7dMgBnOrBI7pxEG/HEE5y+Ag6P0q/6tiScQJsfpopz5znnOZu302liaKF?=
 =?us-ascii?Q?/tu+Mi3vchf5wVQjarNWH7p5yYAeMJ92d76UCPbAIyDJexgEAAFnxOoVhmBH?=
 =?us-ascii?Q?7Nh8iAuyqb/3fbpmHctvVtK6Fv66bq8ijtUtYZIjexi1YwwUpT7kQBmTa5/2?=
 =?us-ascii?Q?/mgzq9cpndDEi5RDtRIzSgFcvJAwLIXZ90YlztpGnvnENgW7ZHZO9sE4uTOH?=
 =?us-ascii?Q?mYCCwulPHiABO0nwcaXH1C0Xqzfy4a/Q/FoPRblBcQwXWq/9LI9/MaVAD3TQ?=
 =?us-ascii?Q?sHRduh4wgG9Yq5wuKAhLpIzTYxaMZGP0/e2YbKRcrkMdQJHg7ezTmouF5rkl?=
 =?us-ascii?Q?fizsPkvsdp6/HkIFszDPOcUOuW3Tt8mlj92WeiDf5w4otXOjnsJTjE/Tf2Mu?=
 =?us-ascii?Q?4qaVBi/3Ek1fctizdVH9KBkQJoRZylkTe+bZMcRkNCD9/GIxByiXjAz88iWF?=
 =?us-ascii?Q?LlVdgj24rrsOc5g/3/1StksYvcluGyISwRYvVUxwS6SVufCWkuMMmH+VmWaS?=
 =?us-ascii?Q?RG86mVZuwV5+lcMKr9BcFpr2OHYlP8tILkFW0zmvVlwt2wqHkijgPQIXmWyh?=
 =?us-ascii?Q?4IQ9xw/TxXoDeqR4qUC4p6vkbcqlhJE/iq6OfT090kpFIrUHfJ9TedObT6UC?=
 =?us-ascii?Q?o2CWRexYhMvbuIW1EPt0dMcAWfBeTLkL0OLwv+I+RvNWLnYO9hTDGQ7M6JGL?=
 =?us-ascii?Q?R12UqbX71dmNJ8tjuZaRBMAh8ndMSY42ThvEyVVwljjKUbQP+Lhpo7uoKS9I?=
 =?us-ascii?Q?SiOD/txbx8rbNRP6ebydlNNHRpOeoY+lRIfFjUpZ8kv5fRdfC/oMiqv/MJgd?=
 =?us-ascii?Q?zmcy2GeuwwKdrF2C8CmYEy0+kHKzAf2fO3bbREUrSYrBkX0nBQf76zjT5nMY?=
 =?us-ascii?Q?cBd5KiuLoQ4ojpfdWS/iaXAR6c4JuGxsY39Gh3iHYOhYC38nypwxmwcMvcJg?=
 =?us-ascii?Q?p13CTK2QZ3rqc7SF67rkmLCmnCJ3EQ+6CuhfCFVJZSGmISLH08S26TfftYtz?=
 =?us-ascii?Q?H834rwA+GKzKVOlJqm4w8mZukSau49khxc5hj1q4Ls8MVgiI38piqm5DmJqN?=
 =?us-ascii?Q?eCLu46KaDSUDlvwvvOr+VQ2NQwY75byPowsy6clVlO+LPh3P1al09z7QZnRL?=
 =?us-ascii?Q?8qQDMVov7aOwdxoq3eds7h+e24uW71nxGXHa21dkXCCvgm3oINbRdbs/AN9Q?=
 =?us-ascii?Q?njQaKzXrUa+lAZG7JHcau0i1B9CyP1pa6oVQVhMotAeFjwXykRRPgeU8gMoc?=
 =?us-ascii?Q?EU1ljLmRe53nj5SkbSf4+7KrBawyjCBDStqIgFlCD0K5yQLJ57lOTFs6csKm?=
 =?us-ascii?Q?nVSVGCs3QgK9XnuSyzPkKDZU?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57F4AC347B39C84CBB2DC84F0EAC1437@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cc1f16-408a-4128-506b-08dd55844799
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:07:58.1284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4370
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2 -> Fix incorrect description
v3 -> No change in this patch
v4 -> No change in this patch
v5 -> No change in this patch

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

