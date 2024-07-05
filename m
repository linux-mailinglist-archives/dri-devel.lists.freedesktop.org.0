Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A62929829
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 15:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055BC10E0C1;
	Sun,  7 Jul 2024 13:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="jjS5vZ7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2078.outbound.protection.outlook.com [40.92.103.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E855210EB66
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9PefxstraXxJI2A7K/HrLZ4VyJXoTrkhR7nSmM003EN8cozpmiABsPvR/Z2r6MAkW1i9L6Bfw1eR5age9vVkrJboEq9RF4Yc4pzk2w7MuISqInbvUoNBE2J8fQ/U08gD6yV1bOpsyE8ZThAUwiTPcvyDofqrlIcDeZtnNUbuwlQ7KqNFbnFak1CU7emzJq7icm4+PB80NPSig2S7ZArMq1lOtQulKs5xWmfgpYnWrQsp0tBiuoU4RwT7zHHahjkY80GV4KdQbcDcQoZNESgKxdvA0myfoU5Iw4gAbUDFpmDnP8VBhHIn5CQL0Ef/OsZqrWHP6dD3BkhBFDtI7gcpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xEcWa5kp2VliKfvzY4gmVML9aX1YNmeNytLhWkP2fg=;
 b=XxBMITfK6vttTz/htvIvyfelJGVTu2WWpAeV7a5rG/q/+vf1XanuciUQ6EK/I+elBUIwr+ZZwbh5tXxdLvxCwZ7KKV1dK95MZpWK+JDOFRzeIEnXI5DVozfUjElS+zUimkcVMlLVdF29UAZ+IoE1abN5LqwTk97BOSsQb0GcdBgWQjmrGtVvUeXwKXvVUmSarYpeUEKV2eNiAxo4mHjEOFAgwKTdk5Meum81Vr0I0ceJSUdrBow7peUa5050mE+5G5yp7Bh5uPA7iNq2iUJLQROW9j2p44AWss6zFS85FcgIuvLGkOdwW5oncTA7E7p/W6Nm084mXqqPTcAURQJ0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xEcWa5kp2VliKfvzY4gmVML9aX1YNmeNytLhWkP2fg=;
 b=jjS5vZ7+kIgcglmo65lQY0Um6kjXgDFxb2VRsuWL5xILoeaX/+noUXu2vXcUVsq3ooYspD/gyUhi0iqlyBOV7BAHE71wZOkov9s4vr9XWoYGh6OMaB+9WX/GS2IJgjES81hniOx5k7PcPVaXW44D64s5QRXIC64MsWnCPDU+t2/ddDtr5xQvZOrfWtuEkRuY/Nob92Ap90YToba42k9IscNqHnRWOq5w0YyoFi6hZw3aWISRBvvCYYZ//dgSij/18ZCd3U+yEvyuw1qEsIOlx9qrpX2dM2k26zV4OA2HjxF/pg73NK+/MG1v/qKR/2x9gXLxc5FFgJktNkJGQ//H9A==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1034.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:108::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.30; Fri, 5 Jul 2024 11:38:49 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 11:38:49 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR888
Thread-Topic: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR888
Thread-Index: AQHazs/njcTATpGwcUGZTLkvEbNPGA==
Date: Fri, 5 Jul 2024 11:38:49 +0000
Message-ID: <4C98332B-4E56-4314-8BDA-709AD3974899@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [5aJwhNqa8K+XmiabSocOh4gYukYLhu0hiREzotLbHN8e1TZLyTq7bBKT/l+u01+b]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1034:EE_
x-ms-office365-filtering-correlation-id: 775f557f-a405-4815-a27b-08dc9ce70995
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8060799006|102099032|3412199025|440099028; 
x-microsoft-antispam-message-info: Hm8SgvWLlQmXNCbILgsmt8ox/AdtHqafLbz/tF0zOQ4gj9dHMIC1dUxKkaPR0HG/sh/gxtu8TiEtlcq7OO2zwuM/eO8ajuxe5XfO5fOVS+tUyg6Gao6kAES9Kj06Tlm7WmU86vsEdRBSFjwXB4tF/+LccjOKymORD1TISFgNTgEqcdsldcrm0L+qjJhwn9gB35enxvQMDETetsZ0mC6z1J44R5rQ2eZDrV3uaUktj54EYLpOgM7Bp1bI/Ci4Sjtj+Ly5hRRitsvkmrQ2OtMXC7unCnCZ5JAPHIWW4v+kIOMrJYps4pF05mUR3HIzKM9Z8/8KSDfxioUHil7fGAbPOXKJMcHPDiPAoGxi5IRpKzhhGYcVkxVQKoHc0Q6f4GWhoUE6mfkUDIUKsNls64N5blz0GlwbImssOWBqs2vJkVf4JmQltINzWfqfqech7LXhzhaUYLVXFpdnmqm6Dq6tee3WYysX7PpowVxoH5B1dZ6cokDEvEPQuSdZlRb+fWeAMrz/HrCPQAsB/fd0ynkFOD76CABPgwYOkTvQSOiAZbgK01lR0O/Ihj/G+B/3fTjZpSo/KY9CxMIYmnxi1dWiRGdQpYeC8/QMuCvZwzBMoCTuSJToLtWrvtM5iJgkoAZpI5T7CQXamMuZ0LeHE+JGWA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0JEvb6cigOwFpzIPpmR5Oj0Tv6QaHtOW57oVMAO0BTjKFRnnBGrSvfq4CkhR?=
 =?us-ascii?Q?S3FZEewfQu5NK6QJYrkVK1kjdyGlG5V4L5hc0xNR8IxtVBJud60f8Nes9Sfh?=
 =?us-ascii?Q?9kPMr16ckrqHpn+jesHq9lmc/JHbhKtThLBXQdb3i6UG0NaiQ/nFaLrwKENV?=
 =?us-ascii?Q?HVYiMoNdVGuvbMWqh0NvFlOC/zwq3lWtchW55WhLaEa2XWhBKS5qaRbuUwqz?=
 =?us-ascii?Q?rUemcEgfSVAq/zINi9DlS1DeUT6focqLBDqG6kfGrVi+6w/dBVtJcqIQtxzs?=
 =?us-ascii?Q?BnDMAKbpzujjI8sFHlzbSSQrtxFPosZ2xbjN7rlBY/53Wo0/t2Lifn0s+TrZ?=
 =?us-ascii?Q?a1QkCPRD6yY0Vhb9BxH3PjDzc0FCoKSw4lCp9sSB0HanBNq03pmo0sZQDoSv?=
 =?us-ascii?Q?/BBp8VlWwqFLzbXKWe7HdSGACPwenMHrlWo9kp4z0GTK0bcOvF3HpL5Otijk?=
 =?us-ascii?Q?a2ESl7C3ANQ4FHxyjbMzKtxnRaLkyxXQiTwzcz1QjFqGW9gzKGrUYRS75YqY?=
 =?us-ascii?Q?h4i+BrF9UG+hCtURYMeKy+oLqt5oTU8Lj2WudoDH+gmxrUkoIs6KlHyCdzS+?=
 =?us-ascii?Q?Z1uhs4h2ykf7KxU7bSjlKW+ZSX+tfcTT3WJgx7OpzxMi2OnUBqKvEKNRskJ8?=
 =?us-ascii?Q?3m9awcXTj07fL6VyOUKCGdGEXDJ7ql8IBCbmxNx9GSVWrgR/3Qt0BK0dRx6n?=
 =?us-ascii?Q?Ho8EqQA4ZMFvR/wkMWBuTCmExsuhRxLBa+viSW5xVkibKhh79vIK1dImWf5c?=
 =?us-ascii?Q?gyntG7PoJMykkVSivSmPiS4L7xTydj1Zgm8E96gUuGJUtDX8ewqMzRKxgREM?=
 =?us-ascii?Q?n+8G0ta94bg05+SWi3eaaFSn0+V9BdYEiGR+EQkN69lyRS9NE7DC0tBnFBu0?=
 =?us-ascii?Q?++wJO/CBDI90YvzDLTyTabTQSI+HIFnTl01/JRE6fe8pR9ZWXXzEtZdkuzUJ?=
 =?us-ascii?Q?w7FCVHnfJPqVk1Xkqi7uNAf85JKPEdHMVioub3EURevQehgjE4KOMIObItMo?=
 =?us-ascii?Q?CfMGtlIBg1uIjWg+qJmabLVi8ox+PbarYEPu2nFocN4O8OJWqyeOatXODI9C?=
 =?us-ascii?Q?kcoN/mOrU2EJt1JwFwJi0GFvlyeK2C/HLMFmFL4HQUsEvTfquNcOUsK52W6U?=
 =?us-ascii?Q?eTw+Xul88uiAjWyRPt5ex7YsJoO8osYDsP8veFt2JCgMCxLbE1leV3WRgsxH?=
 =?us-ascii?Q?degdNLjLoTTT8KkkUIS6MEQ/B27Hcw3ZRp6Mw/wOo7Zf5lwc8tGmxipbT30I?=
 =?us-ascii?Q?SbYPkamd+93pm60xzJkwllpn+pJFg/fN1EOI6JRqL/KfKK3E72XVdB9Pq9AJ?=
 =?us-ascii?Q?MZBZ/UfLomRqHc63SCVpaVz/?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2199F7F7A61F76438D3355CFDB5FFD0E@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 775f557f-a405-4815-a27b-08dc9ce70995
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 11:38:49.1514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1034
X-Mailman-Approved-At: Sun, 07 Jul 2024 13:45:08 +0000
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
index 08992636e..e54f0f6e7 100644
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
index f13b34e0b..b53cf85ca 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -95,6 +95,9 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, c=
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
2.34.1

