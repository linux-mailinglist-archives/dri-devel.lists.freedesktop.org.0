Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384BA38B8A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 19:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7522610E0D5;
	Mon, 17 Feb 2025 18:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="PX9jXAeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.68.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960110E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 18:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fld3132OfuH6Wnyt7g5Vsomd6t6A5PNvJNJ5O3AlYYaHFWxxeMBqpv3ncXwMrXL+HxzEPVROYjTKfvKF76dHv20JLxwG1QSBcovrq+M2MNvcMj01KAcRMOCX2Sewgr7CP13jDlPgZB2xIFk31F5NnqT0coHtmJS7Eav38+2/j2s25tOjzWYd3HdHBnLyrBwmCJ/eZsrYRLv9er/TN/mKU9/kDSyL9VG8Z7qE2Opw07gjp0efPKSiiPg/8MOhissWV2lQGNKWeLBcS50k0a22HEHpi6uNqvuo+ry3CJ5Q9ojMechVlAc+XTXL+Pwtpu6tf/mZi2xqtmBuqOlZmbp5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62KJYxqjdLK52fmMbzBHLseVGxE1hasiN2C3JEIImlY=;
 b=tzvMRh9hoEp9Bc/GjTolf1MwbIzCdzle3UpHwBTloNsxYGVWJkOUdXiLbSPdJRNCS+g5cJ0X40u3spmtOP+oHnKHiXp5yt6UPyky2lb+RQmf7hkmobemZO+5ERicmQt2hZ0NyJ1Pvz+J0oghvCBOgEE7k2LsVN/DGNeUp0cfMUrGfLLR1+DaALlYmXrbMTxHLh/8LYBgmRVsPEP2h5HSERkcIz3STHEi/hJAD7H74R9V9mK3numwoixf4wTK9SNfh/dvOECtLH7ZJfT4q9sVf++wtwO8WpsMJH9OQPy4pj664pApAChtt3/MShhnlzPDFwir9d0JO4/xtmWObbXIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62KJYxqjdLK52fmMbzBHLseVGxE1hasiN2C3JEIImlY=;
 b=PX9jXAeV0ROfhKZvyZyexbT3dK8cnKt4ppoADzYoybx/JYHTLKhuIWPoyAW2kVC9h4sw7S+u2stG7aIFDRPJ5wYs0mMwEC7pNZgUu3M5sI6/lCWxgla71Wrk7lYghEEYOMRn8TyPSG0E9HGz8+4u7c9D8ynADTSEW7WnwR3v71nvCgdq4vibf5xXFdAVRFe7DNLO1R/qp+6EMt8SHGq5/szhaGXgyXJtnzYfTRamFlK9BSznZLb5Y4AVWeJ6CakcvpYbBKhxcT43BebZPcyKoVPGUqkW83/Q1QwwCkyXEE2qkt632N5HRlX1wOqjBP9ZoMoOVS+eyUJJCaE1860wyA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PR01MB4457.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Mon, 17 Feb
 2025 18:51:50 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 18:51:50 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/format-helper: add helper for BGR888 to XRGB8888
 conversion
Thread-Topic: [PATCH 1/2] drm/format-helper: add helper for BGR888 to XRGB8888
 conversion
Thread-Index: AQHbgW0BEka+hiUGWUqTLyisV9XNcg==
Date: Mon, 17 Feb 2025 18:51:50 +0000
Message-ID: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PR01MB4457:EE_
x-ms-office365-filtering-correlation-id: 24fcb8fc-2d1e-44e3-54a5-08dd4f84238b
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|7092599003|461199028|15080799006|8062599003|8060799006|440099028|3412199025|102099032|41001999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?bkjjTjqx5fjJdT/z8uFwA94ZSNP/MpJkHT+l4mRX90ZbKhymdyr+KKFQhJbv?=
 =?us-ascii?Q?5L14cq3CdQIQNQ7Y3LUD4Dhcz8LCQkeiAmGTVHQc52oEEqx3h7sSizejIhdp?=
 =?us-ascii?Q?vvG5Y0CcSeCK6NCJTserRyo8ZTvLIUiSGSUi/fwrUs3cDDKKYIJwuEpAbwO8?=
 =?us-ascii?Q?eKCMGb3m9GdEVhuOBt59FHsYU4M8yPFHFf5h0ub0yMGXTFGvXAq+Q/ETXxTi?=
 =?us-ascii?Q?2rQLj4X59UUky4CPk7XfWxFE5e1LjX4gsRdkV8pRa4WygpqJ7tamFRHT3P/B?=
 =?us-ascii?Q?UVaRG9n9fdqrVfPGZnNwcDIIhoRr6hJ0/XW3vmUH6QV50NVNREm3qqPJEu/1?=
 =?us-ascii?Q?s8fYj61yHbcYZ7PZvCRXcYTZ1hmwWVKC/M3Yz7ZM7MlGNv8ZmTVFv7ZebJxt?=
 =?us-ascii?Q?1JfBDeyDwUtejlDu4RPEa1jlUWuH5zDMHuW5rZN7bj2GEd9LHaKOCp/jOiAv?=
 =?us-ascii?Q?ZInvdLvNVARCKsaVnyGZWXXlFgb16hdAFyh+XyOk013vEDlRl8faop6iylQ/?=
 =?us-ascii?Q?H59ARxdvrKc4t/MzjWN+UFMVs34AcwpNcBwNm8lsv95Yrijd9SiQpb0fp3tz?=
 =?us-ascii?Q?jjKhUjKxSsRxTlNOmPRE9eSrHepzHqIY2w0xCjhu7oNS+qDzldyctlEG+v/S?=
 =?us-ascii?Q?wyy1qH1c32h0syz2gNHWpdTco4N3JuPgfE19DikZtfDaQ+G9pFctWBgTs79Z?=
 =?us-ascii?Q?QtBqeR9+ypSqg3U4ghKJwSll8KxsiZPabDlUP0hKSDz/Mz/7k7Sl29s4Qe/0?=
 =?us-ascii?Q?F9MDq6gKoqQaGGuxEk9WeScWoN3zj8uRim1ayamqX5BQOchm8iR+x+7tkrtx?=
 =?us-ascii?Q?FyJmeSiiZpoGOGAvwp2Y6oX3sdETflue/p/JHanlQjz6/C0FWpBp61yrKu91?=
 =?us-ascii?Q?2MOMPwZXV6HRlKZtea5/kmJdAoIe+GrJLcHMNHGekwdKJUFm2CaothCpV/Ld?=
 =?us-ascii?Q?E69goOLO18JUbi4Ujf2/nrqkObvuFyPcEWVeAC6ete/WMPv9nfl5JjCfM2yK?=
 =?us-ascii?Q?2CHJpR1zyLYkLj92IflBqo58UuF0+dTI+Pi5gpDej1gxy0hjm9WSQbNILrMI?=
 =?us-ascii?Q?fwr/pFgRweLuioycEpoVVAZ85RN7hHAMjSiiAssOnVM+SvyPq0k=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4I02tvytjU057xI03nlPwK4M3lwyUNgzZhVnjAqNoRjkUQQ3WcNUm0iNzNwd?=
 =?us-ascii?Q?pyxh/MqMq5aTlANnUcCOe6wOb/H2B0fknyPzbMgpzUhdULofJGj0wn8mPEUU?=
 =?us-ascii?Q?hY+qJukIelBIJkfK33mQYP2HDOzAPiB6ur9T8rM88zKa/Xm5Km/GiH30Z67C?=
 =?us-ascii?Q?0NaJkpXbiaoGyVh/ibGblMUH/zMr14JHuDwVkuBl5pRdUitWSW+2oZce12vV?=
 =?us-ascii?Q?ykOnIo7BINxg0q6VcXUcjC7dP0vh+Zp5Pfhv5R+QJ/bNw5Q7u5F+Cv57i2eo?=
 =?us-ascii?Q?c3trpXUeF43IAvzN0aAx10ZlP58FO+X6TqLwjaiUmmPygbnXyAQSlRrpGKuu?=
 =?us-ascii?Q?YFOhrUTuSz8pMm2MLdy40jfngYzOmXb1LdpNEj9R/Gf77mV73siyhfK7Qrk1?=
 =?us-ascii?Q?xZBVlwdK9P/8TVYgkyomD28Q7OlObJ6Xdr8Ia3pvMKSg5LE7VzNGoJmVOHVR?=
 =?us-ascii?Q?/h3rU2O3zA6Es04sXvJKfBUMoR6FUBzlEolhujAAkzIb9FVXmgpzZKR1HCpH?=
 =?us-ascii?Q?HuBEJlEG56SN45kg07OJVg+1yVeIuCDULancyIdCb8RYflT4xeTRvW93TVS8?=
 =?us-ascii?Q?Gqp/gGJnvo9TIdGAl2Vv4fNslpAkgJkgTlrJDUOSbbkg5w7rH3ECdJMGwaGp?=
 =?us-ascii?Q?DNdWIjaKgdbZ8rmnicjmV7qGgIeuMml8rAECp11LeW/bdS9iAg4SpwICfy4C?=
 =?us-ascii?Q?85KPqLaxlEBjQXHYeRNu/g+8dTXc+3TogVMBUXZ5AV3kPOcuMuWFmXreAbr9?=
 =?us-ascii?Q?Q05rV/Ib8DyHBGaJu6FqJxKMGKyv91G0TKVUrajSYCjV0o1w87PqUQFSOR7r?=
 =?us-ascii?Q?WmpD9scRY1DZLQ8Y5SW64MWwgHrjGirRPFl2SwitThle8oda7RC+xE70jcKN?=
 =?us-ascii?Q?O8y1KuiWHV61GUAcK1vE+9WUO0uwfn12Jz4VQViFp849qGNkmRvpo4BGc8yc?=
 =?us-ascii?Q?RROtfqVrDsGDwlmxseMysMfhAyaEYe3rAb5cFWyjSR7bcIyWTI/CrBZrJrlB?=
 =?us-ascii?Q?92wWuOah2Cz7V7w9HMtt3cDh40rHdqIetT2Rh1we4DuSStgjgEhkzA8S0l6G?=
 =?us-ascii?Q?/jcnemJrK5vK8BfyyDUaa+SfSOpR0OVJpkVR/93gvGIT+xhVAqKU+LP6uVN1?=
 =?us-ascii?Q?dcxPrlxhOcpaYJHxj5Bno7GGNQPYQzRzRy7UXfCYdYOQDS3U2Dzb7cWU+1vi?=
 =?us-ascii?Q?vyhPKFRjXJ9PIjvqRMit1pFuCU550JE/ciffhTWjSdfPXuXKuEV6xvTONI+N?=
 =?us-ascii?Q?m9mm8TZvbZ2IpeZgBl2josWFSZuSpjsjm67nhv5f9YvmGEDhHx2ugSDuF3BG?=
 =?us-ascii?Q?3yLQIaNBdvpam3ZGcv61e6L3?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4FB3607E2791046BAF7784E5411A12A@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fcb8fc-2d1e-44e3-54a5-08dd4f84238b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 18:51:50.6592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4457
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

