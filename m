Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C794DBAF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251FF10E112;
	Sat, 10 Aug 2024 08:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="SvFSHw0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2070.outbound.protection.outlook.com [40.92.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461410E107
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYIyz2ovTzFgAcMq7BjYhM1IEwxbY7EVQcrMIRBANmO+ql4T3uAGE7DwSvYM2V2N/Ngh5h7DFZL5s10Lt6UX0zTEfMUm8T2k0Z1Gz2OFXRtM7WqwjnXyI4NkCIoZ9cuQeLbSZIBnerCXDnn4X+meDRxt5U73vrpBqnBdguMjgeuTgJt58cJ+s057PEwE7VQzYTxcjhx7bNYhWkDfbkJDvsaeMAQGwITcutKSTVJTn8oWxXzbgms6VaeLTdVniOHNfkHHZl5XePrrQRdQxrlEUffQBvjctCSDTv47PPPv2VWo+vFLEA0OnEOVoHAe+/P7S89mkYa4fQuPeZxD70LYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=BYxYn3cMpTCsxaUt/Tqc8N5C07zOvr/IGyoBFczXP1EbBl5dCXVNi+Q3kQJr0TI88iaHGyPYbd446xzru459fmBd81gUZhInJJw9uOyI0jIEM8Rzl5DXjqwhAbwd5BB2ZhPTYWKFkP3hgr5gvWBtopT9SA4dzvmpQMtbhPcZVfqWUHMWx+IM9243g32wv7I6Xo2hWLCzIfd1MceNULg/PJdEdYWEWx50oRu62ipFQYnmKYIYZFwK7tFf89OnkNfWBAY/42gIMMH/NR/A8OaCheACttq67kAiZeMuE86p/9NcXZP7daRwOXuhuXhkFnLcWnN3mLwGKlEG5ZiHegc/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YKvWjMS/3d5yhekXwRD9oNba+UDTt190X8eov0k1HE=;
 b=SvFSHw0X5e+pT1j/YICFr6MOBita72lEENJNZy/t1Dm2g4kq9hg3dXf2E6DLUj1Qr3iYIEjWqCbYi7AMzdFK+cq5dAYifqHpcN5pjSZmQ/wdhNxTixBUlMwHCqp11Y3MW+E7nCjrmvkxg1Dt5Pc+odvvccGL9mAcu4CN4Oq61pfUFBxid1OiHnoFEpia2bW3effQEBnqNhl5DAwV6vJHI5v2wW27QfdbAka1F8BPuMyczSxiw24sU9EcOXpVi6li8bw5TmqD1BvJMfLAd+7uc05IxXSUIgROgdGmoJwWDktxN0HwUG+88XJzo99MXICPHPrdytyvPZFcpTaMkvzwng==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB1551.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b6::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.15; Sat, 10 Aug 2024 08:55:38 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:55:38 +0000
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
Subject: [PATCH v4 9/10] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v4 9/10] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHa6wMSNL1oIz0uVUieieuDGft55A==
Date: Sat, 10 Aug 2024 08:55:38 +0000
Message-ID: <B4040DE0-6B5E-4266-B4C7-E78AA1AE8AC9@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [/N1beJX1l49LYxgaB3S+w7TfrLuEM+yKJbM6wq5nzQFXrMsvM8bmaTXrbb492V6pPJ7GOnFmCjU=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB1551:EE_
x-ms-office365-filtering-correlation-id: bf253b18-a26e-4012-69e2-08dcb91a3491
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|19110799003|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: sQKs2zIcQaJn5mGOoC8+qjh84RFAEwb6AZkGvxslprKLof2T3F6+o4DZQx+rZIcMTpa2RptqrrE+yUizMP94+mqaUCMzNlztsGV2Ld+mmrP7+k1POilM0fmItNeHiRSIrVzVPcRkvcrNUBKcd8ofzCkTahVZ6VrqK0Aeu3geIkCy8D26gIYs4E4zYKmOgQLKUgxcLJTd6qK1kGNvqQKRHXRchB4u2VZhX9wPkvgioG2mxSeGwYx8TdIWCGGqxCwa2srmxBDD+U4Rg7PbUCgkjyoI27gtDDLnQEdF8omffZRpHotW/UCRLfiXwTQz/hjU3hEsMUtFMfNeZ58SAQkmcQU/APFhe/cg8hHx7J72WNuyqriVujFl7hq/4mXeTv36OVdYjCmlaqXc1Bx3rF3kzXUI2RUQVWYZlTHEhn7CoHKh0wCalgRRu+sU4TZcBM95lQyShvfXfiywrtQBqTnaQODgJdmdvjWwt80wmTqUA9KW9dUGMve8uEJHZc9LoSM1FfOo3XEh2Kt4m+iqWSlor+J7SRNHpPmEHsRvICVzO5621PVD+ZrHY72BkKl3+jjAsOe6EqAz1zQZWn/MwyMdUQW1wAXBLVzEYGlbX0gg5WeRwqN2DTMHxNnHiiPiSmDNJB23AOjdOzdQXURyHUD0INXSGigJrbs7jZ39jmgcWfE=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DyMss4Eqcg8mheMabfW9UIMVOaTExVK8qvbaGWJRWACsexO0R1ym6j5ZN1m1?=
 =?us-ascii?Q?3BnQGc6QSMrhz0EaLH0ShEXFx/1ZtLAFiV4TinAVbeT9BfyNBAldKWmLnvFA?=
 =?us-ascii?Q?L8R6HedrH8YtHNDmTOAY7mGeoWP8b1KflrOcocPgmO5jZzNb0DpGa3gnv9WH?=
 =?us-ascii?Q?vxD/8ojJ2foBGzeX4P8hDgY3v+0R7f0rqvDUg9YtpL0tbRTMM20ngpKJYacN?=
 =?us-ascii?Q?cgVHD8jHx+niYPKMK9awx3x/nORpry2coMWdZC37rBpKqaSPmYmS2UnB1gxZ?=
 =?us-ascii?Q?X2A8VAAtn0UwzaS9/jRGGC1MeaRMwV8m4YC9ZzHLn9pT7wCfObrzYp4fK8pd?=
 =?us-ascii?Q?CNwL0FXeCd72QMokTpd1ypZ6LkNsFO42mV6h9Ae9ySpRKmIaKM3LI+X6tweR?=
 =?us-ascii?Q?2tdHZISt3n2Tdr7Cxw4ZkxYqyKe8RAnzbm+32D4Toe5mUz7H5T3nAZI1He9z?=
 =?us-ascii?Q?Em2cZOfw1PJPG+OIBc/Lb2FT4cvzFpgm+tbZ9r4pwDzxyVQfgXpQuECiv4Iu?=
 =?us-ascii?Q?QeBSGwFvHTY9JKFzvoSQ2EnszSKMZ46VA+FFuQ4a2QL/0oDJJnV1FB6xhG/l?=
 =?us-ascii?Q?H7iCt3Jtp3VNR7OH1SDMWOUWHv4CiRlQH8UQENieFZKvMFdlGJFx/eMZFlUM?=
 =?us-ascii?Q?iIIg6APuQDf0fwh2VQk0+SsSYkjH9odFeqWP9ye36YyUxFthxrZKZNAXJ8ZZ?=
 =?us-ascii?Q?gSGcW8DmqKeAi+eCy8GGQaLus/MzuTJO8pDaWtEn+HDKERqdFQP07DsSWy86?=
 =?us-ascii?Q?hkImJ5a0RC4yMyOmwsakv76lzHsPuxmLf4wAD4ZiTI/uGSyNnFBMSUJkhqya?=
 =?us-ascii?Q?INei3vDNzrh3nxQrOf26YOk929AmcBsfIZ0huFtVImvz2+4QRrCwtH9g7TJP?=
 =?us-ascii?Q?6qdSnb4o4h/QKuZgYLK4RK9rwhtJPet2Bw/A1nsZPyc9/DjtCBmI2G0/sU1w?=
 =?us-ascii?Q?P3NjeVgUX9/h87wwJDwNFnZAyNVawl+mud2wFFBoB6xSbSV4DH4DCOgrVE5s?=
 =?us-ascii?Q?+WHd1KXsUD0B6GmmtZYWwCO3DQ+iTysMtvuy7R/P1thtd4e7E7jhpYDv4Mkh?=
 =?us-ascii?Q?yro8B6UBuJFdnjTMyqAzazYS4fKlJx8WWLBQL8SuMngE9bm5gut7OC/36+4V?=
 =?us-ascii?Q?4SqwrKZe0jfOAp2YMrGfQkpKnMnW5Rt/5T5XMFIysNDbm4CINvmSY7Y3Z7ja?=
 =?us-ascii?Q?A9+hFc4z3eRmRSG2NlI7aRngYo8x40WmS0SOvaqbbdBS+eQHTTiSyKaVSlZp?=
 =?us-ascii?Q?+KLtKU+URPinKEr8MJqopS2raFnZI0s1yC1kBcb8BYEgJiBUe6Nnkhu01t84?=
 =?us-ascii?Q?NAmR+/uzEUltAbIc6PY9Fz31?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <984321920D6DBD4F954417DEB8699654@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bf253b18-a26e-4012-69e2-08dcb91a3491
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:55:38.1767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1551
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

