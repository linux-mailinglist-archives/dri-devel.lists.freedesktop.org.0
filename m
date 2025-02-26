Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F3A465F3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2CD10E27C;
	Wed, 26 Feb 2025 16:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="GvB2sv7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011031.outbound.protection.outlook.com
 [52.103.67.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000F710E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 16:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk/kEFJRptywICL8idd47e9c0b+fEtpMHG94cQIGlVgwcPMJC9xUce9i9S/WMNxjtG5LsS0+5VqYa7iXb7yyiLL0Q/FQEgEXOPVkxzPTP6I0GVZZECAPstZkrXzmxRWlFrlu4Rq40e8NGjdLYWdgSqQV0qJPcBtokLrPaF8rnarKplBxZZF0z6sKiQoKmYWc5h00sQhaceVPoHIRb05qUI4qA/LwCRrMpZnu/laRZIyvEV/Pga2BbnuM7Sj64kQBpHOr6lG4fOQf0qn6hvGByG2ykQ/dGGUEowxvoxFlhZdGxoEhGZLrc2EcfVXZ8i0gTLf9Wmtpdm59ih6SG9SZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnIa/weZ1vZAc04cLquzJngle4sCIe4M0v7NPh8nKOQ=;
 b=ZNNHFHPTLSSiP/B+4flGlLMBc+TO5zwpmI5YePSAS052VhR0hqLlb3p36CtBJlvf5hPtbnCrOuWK1DDPDZo/XXc79WgAlgyit928qAdFImkSse5wGzbgVP6mEIEnD1ORhnBtt9jQ6AAIOsZV9DScJkaSLvYqAr6VpEEaphNrU5pIzy0g7+Hm0UQqLUreoFFjDuBg6qU+s06Px9QrL4wvf/UeLcyywgVuHGpWe4IgJoYfscV7R4t9yIqsYkRngukBIAFpOz13OUQhZjs47DqbO2Px1u74H0Zr87euFfQGmWBlkeDqXiNXaZtLVXjhb44aJ+YVQH2TAHMus0eJ/CZxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnIa/weZ1vZAc04cLquzJngle4sCIe4M0v7NPh8nKOQ=;
 b=GvB2sv7K3UsvgVqzMuEAyeH05r+/sE1HPu2eYqqIHytXnGJoNz79/ugbt2L2HmM03crohIVGBcmZ+aTvsXBrLXXrVSiItw5Lir1dndME8p/Kq5JQhJs2uY71yXYauDm0pFG9fnp37LVroVQtHqpdiP1HJ/AeTMIgvRQiRoGno2SE2aaZq8Tr+gW6gh0aGDrrZIFZUPZlcSynsNNCKcQ1fjQf+71ITYyvESvGQ+9lung+pp49eRgHWGh5TAZCHjoPhzIMq6Z0JsBV80hLzR0KNwJx20jiNmaMYMCu/kgQ76EYMfaPzWko9FIIwIPXiNGEYFva4T8SN87vcPkb5Q3AcA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8842.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Wed, 26 Feb
 2025 16:03:48 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:03:47 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 1/2] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v7 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbiGgEjHDb/pitMkqBqp5xDPfXnA==
Date: Wed, 26 Feb 2025 16:03:47 +0000
Message-ID: <9A67EA95-9BC7-4D56-8F87-05EAC1C166AD@live.com>
References: <361DAD47-01E8-4ED9-BC8C-0F98B08FFA5C@live.com>
In-Reply-To: <361DAD47-01E8-4ED9-BC8C-0F98B08FFA5C@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8842:EE_
x-ms-office365-filtering-correlation-id: 372221bb-fd9b-44a7-8479-08dd567f2773
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|461199028|15080799006|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?Bi9PqBa+ZYjb/Weu4w/JiYOXbrohPhHpbkA36ywFspqbDZjIU6atMxgyLWEl?=
 =?us-ascii?Q?fqJAfhEZH4JxUz15scpScSPTQSfd4coDx3vVb/BoDxRpxQtqFR2fzOnb1O7S?=
 =?us-ascii?Q?JkQh9FHGP/YsOw6VtxYix7pigKqC8oaMtcNH56SAK31kTjPZKdAhP8DEqZPI?=
 =?us-ascii?Q?huDurU05EY64/PWzs23o8/CPQ/ykveTxTQxDa/rfxhoDHaDWg5NDVKasBV7m?=
 =?us-ascii?Q?Y0ctpPVd2gR2WrSMhsqScTMFWlJxyp/Ct1hCnXO5q+NX1YxeLVSmuifQcWJ1?=
 =?us-ascii?Q?MVsQRRk+8LPswv0F4QCTcvPo3wGc6mjIWaeylLS1ryLdZ/B3rNyXU9XIA+Uy?=
 =?us-ascii?Q?j/Cgx3W8H/ISAwmbB2O6pyrLxdEWI1XwF04nL5tU6b9UhiRSTADZI92btQfa?=
 =?us-ascii?Q?4tjNS4kWZqAni1GMe98P24DJYjA242Ffhn6U6NHSEbaBHnG1T2AyMy5toqvZ?=
 =?us-ascii?Q?7bmIuqJIFIQFrX/BTGQOczFuMjpspsHoAWwoa2fXtsxIWpZ9dihiIk0U8EEJ?=
 =?us-ascii?Q?ZsRtvwx5LkU96fT3YLt/Wm6hHIteLwvJzOOl7qP+wIWIMrUMgbJgjm3yuvfB?=
 =?us-ascii?Q?veqt5SteElDltwu23gbXNCX7GnXZ/6pa8b5R6F3XoSBXYEFo0CMVXuuPTXDu?=
 =?us-ascii?Q?EEtuLTRmkijjyBpKPM/+qvbuuBtt4Jrgy7wedRfTTiZ2Qxcc1SqQ40GltzOv?=
 =?us-ascii?Q?hkewwz/fEN07Z1lLlPOFB4f6DH8nxV4efQ6bxyAPSkXM3BE9X5JLTOthvziz?=
 =?us-ascii?Q?BzkZz7KA7fORq+SpU0hyhZ2Qhjs70ZxaqkP426Dj+n9W0YOxBOtr9ds4JSO/?=
 =?us-ascii?Q?f6ZfM1bBL0JrpFJq9P8Kw5+5wJ//gNptwHcyVuAC5Sbilqt8nFkZdR0w5Xz/?=
 =?us-ascii?Q?YUCUGA23Va6yOeyNDrgnoNZrmzj4jQhzurrpcZWEkqsLnzxHKr5JopKPiVfN?=
 =?us-ascii?Q?g83KAD7f9SbL9Amq3316d/fEytLuwnYWY0j7ozp+fU7y+SBTaqTrBxYlbPGQ?=
 =?us-ascii?Q?CF+xQxKZCPslEE+GWt66ZhP8sdKjaBGYyXYdR3xgjTt5CLYhJUh47EoZON+J?=
 =?us-ascii?Q?MfJXv2REc2wmw762mmHXbSFa6m2bKsGUEY6JFav9zrgy4aLNLgs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QBtxNN0kbK+uno0y3QJCHIDoE5rrvRzzq1wscjs1NLLp/MzcadkmQ0K7UZi8?=
 =?us-ascii?Q?6+WQuW8aLmkjkYGqt6+m+uq7eoq/H2Jhh7G89bGTtdZMAqP20B6a0HJSyVes?=
 =?us-ascii?Q?a8BvVTYY12yfan/ptKxYZPtWJmcOMIF+wVFFEllsZIjMFpNUjRkBzcHsKqP6?=
 =?us-ascii?Q?gx3vIH4he0FuC3a/Po9Vahcd+SsK8IjLgUnHyKIzOBryjm9zQ0s4dQlGVdth?=
 =?us-ascii?Q?ar+FRjOqbOmjCgGjnJcE8utXgtAwxsmLR5M89JvG/X7736CS7TCix0NGhFHf?=
 =?us-ascii?Q?CPe9ObcchExoNvcDOjKBhgEPyq0poE332QqZ/HAmFNLQBSM2baJejQslrrGL?=
 =?us-ascii?Q?CUgGhDoBPjU9/0FGi0KRXlP+T3RskKdBUXF25KNxz37g/3i6IipikzfGVXZu?=
 =?us-ascii?Q?LAMZhUuiXR8M7GeZpb9M22TEJwtL4ihBtHkYc7iPzMesw6M9pf68esQhrYS/?=
 =?us-ascii?Q?DnB7rmQWFheejKqvDwgeURcEWaLQwEAUbS3qHh3ZmkW4HdVOGOPz7DN7duWx?=
 =?us-ascii?Q?XWBRhIvSoILNpfAZfxOuAMYis5p7xXUiddVkN3qu82ORiPQCM2LEPUTugSdY?=
 =?us-ascii?Q?tvn6qNwWAC2fxGmFuKNVnH1WWLbIxmnLrlnQs+5hTzDCWGtPLN8ox9kc8q0i?=
 =?us-ascii?Q?y8boLxmpjb12ljLt/o46XNyQMB2dGhTWGtR88oY5t5tTprZKgWXDsd8NVUUE?=
 =?us-ascii?Q?/n4ypzEcPK8dOT+IGRXbmvFwAH4/qbv7v6glExlm0UyhO+5YS75eQ1RO3FRL?=
 =?us-ascii?Q?d5nuQqOzEMj8rJtrzIbC6QS8Za13etH44HBAVbK78y54leImeaJIdWK3j6tu?=
 =?us-ascii?Q?UHwC0K35pN0hwiUhsVnwTBYdXkWX8m0dyhrutamM3X7Z4CyrQSMXwucCQPeV?=
 =?us-ascii?Q?Qf6KnS0ThF29Cy0i/rTxQpV88tpIqv7Ml392YceyLxXe5SiJUTrbp2TdX/yV?=
 =?us-ascii?Q?25tcPbPAV0QrtiO+WN04DWUXZDEJibYKJ2gjhvPXKGjUJFFQkUb/Bwgcx45w?=
 =?us-ascii?Q?CZuhkmWnPfePJ3BYmqzVBntkn9c18sw4jHk85U7oyCmdiAK2hSHlrr6J1Dfh?=
 =?us-ascii?Q?LXk0Gmr0ijTTH3AXCp5jPexlLrv1cgrF7AaZCSFUXdSj9rrxS+rKYrt0S/I6?=
 =?us-ascii?Q?cvN1xmCar3Zyi0JGTg56KFtyV53WghiI+2iMOYN+5aXPPbhn/kBWa5xhstqE?=
 =?us-ascii?Q?rjk49UbWBr1cAbdSf6HtoUEk85tJF748IcEoabqEqzXZ8EYId6MLHRHhLAty?=
 =?us-ascii?Q?mLxOm//GmdAkY8rRecVHV+EOIsDtTVzDVbjcXHs65PHEvT9yK75MoJbafTKI?=
 =?us-ascii?Q?rJn+wZgsF2Tz2hxpbhIo1ql3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <144D416F79B5C44EA43649C8FDB42980@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 372221bb-fd9b-44a7-8479-08dd567f2773
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 16:03:47.8880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8842
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
v7 -> No change in this patch

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

