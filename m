Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9770D05F58
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 21:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF9E10E378;
	Thu,  8 Jan 2026 20:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davesawyer.co.uk header.i=kernel@davesawyer.co.uk header.b="adIqBFHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 796 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jan 2026 17:43:58 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCD410E20C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davesawyer.co.uk;
 s=s1-ionos; t=1767894236; x=1768499036; i=kernel@davesawyer.co.uk;
 bh=bU5J4NJhoK3Bni25JlO414ZkaBfvpnus+4uCnocgLyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=adIqBFHyz4skRvvEaSuYhzmX9f3I+WrvEdRWoUILDtEXXoRYsZP7P7zPjDP9bxHO
 8+bB/dTDOF1B8ieNwqo5JSRVSBzhTTDYZXBH008KCeRFPKCJQiNo68XOLykM4GzOR
 5eHA0++0h89A+opr82gTkoFUJKr22Ob2wzlgzZDTDoV6uo2p4TvHcfuxONyJZAEhs
 +erd3dBaN0meS/ExUQfwR1rtpX5HVz7H0xb2zq1VW0HLA+mo5y4pZ5KH3XJYJqIFS
 Y9atoELo7Gcfdo8iFa96WNG1621AFVPhFV4jE4hp6fJIhUvfJ3U0htFQaqtlOXgRJ
 LfybUbHmjMiJy8sIWA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from DESKTOP-TR20AEF.broadband ([84.64.173.57]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.115]) with ESMTPSA (Nemesis)
 id 1MuluP-1vuT5D1Ddb-00qpND; Thu, 08 Jan 2026 18:30:12 +0100
From: Dave Sawyer <kernel@davesawyer.co.uk>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Sawyer <kernel@davesawyer.co.uk>
Subject: [PATCH drm] drm: panel-orientation-quirks: Add quirk for ONE-NETBOOK
 One-Mix3 Pro
Date: Thu,  8 Jan 2026 17:28:06 +0000
Message-ID: <20260108172926.4296-1-kernel@davesawyer.co.uk>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wVJlagJf3fkAgkGg8pDHoeMpWoCdBL3XplnRnog15VAjCQzuz7r
 yDjkOkqU8ZDz6ZCygfVW7SpFuTlPO56OhLXy2wNB68XSCag5HDXT9r+NVRpTj8B5Z76OTG1
 ZZtvowmdYiVJK0asNqRNl5kDH8sJqydAbiC4RFMJ4s46bu8Yl8QJwnqOekArQ3nSulY9XRb
 wj0wTyVCEjGkdJP89dlSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7lYzRvdFtnM=;kL3mNgN366De6Wy0Klrj4nyOyTe
 Cqfr47cAcpr5xEcWS9KRu2O/g0ILHamSjcyW6kJT7RndRlg5gHnw5WJyKe3pNtXq3jHIED9TX
 qEmbSazFnHltzv3t13pxo/rHTGBlKLSPHcCOu6AmWxw8DaMEbH5yUMluuUs/ZUAbZSXUt2bod
 hiABdgARL1kA85PjTr28QXOYl5wG7vxR5EtqgYe9uluUanoKs+qxxbVQ4WLqbyoC7ZjLR/aNx
 XZm+FliMAKPE49XQjoK7Job6L6RDWB59B2FC+vXA2DLJRLVHPHgm9Y1au5YGU/cePQs2ulyO5
 xMN3pZaNfOQozhZ0DRMF1mhdwr82KDi+w++xLmv5OmtVhbqFq216v/pC9wiQEoFhFi355d6Ds
 gP0z515u7YOXy99WEkOosQJ/vDsTQ8Hq2WpzS3RmVLn3BiV/hyIsHYDCyfG6+yjC/dZbxyVSB
 rUJIkY53DaSCwuzSDAJ6uHocO6vigMFrd8TzaJI3L7HZqE6aUmP1G6Nt9LtpK2cMn87Y36veD
 5DZYa2LfZTiJoXPPkntVBUAvlDFFyPd5tudM9DOVFyr6jssScWRVe5P6TK1umpvtuhL7apZd1
 JXAV390oPgCJrd9MjaANirT57HDZgWz8j2K0JMuxqidK7e65q1+Ex/TqRYxQFRxQvyJ7cS/7w
 jpMWyTdaaIYuh+72bvt4OANnOZsVJg5dnFvGZS1QaBEF5qzWOAQCUgkQzdboYWlExZCqjr4uW
 3CsIZG5DsMhcDI9RaBVCx6HWzbq3dMuF8iVoWGf/lyR9lrN838Ziz4Y9XQ97jTxVsrnw5TMeW
 /wk5B83f4MobYzsVNtax84OGjpPMW9Zs9WtCT9Fw1KNeMDm1rK1s44fM3lHmlC/u81s7Qp6uD
 2zYtNzgX+u1ps6Bye8NnOClZRMfxTyB2Uy/3uCW4YZjZn3AtuR3u5XNdCVIfs9j0xZYPAss5s
 Fyj7/tkvrgLHmf7kiVVE6EsfrwpdrLrc4fvTeOqmo2HoIH7QDrgWE158Y5eMd5gkV8syTXzjL
 m1okzuKuE9S/nE1BAm7FdFaQP1kxVLGZjIpXrRweYTWZ7f3oo8roHCgg5BYxrT7e1NWPPj7+z
 KxiS3xH4JH64/MTxYjHmJMuaXdUfOb2ICDO37EghtR52rQGAVYrCBIa4te81IgKw2JohSDEM3
 XEkNrOK763dwXp457hNQz8oMGdE254fl+BOs1iRxsuR/B3dgbYOpBZ/2yuG0DXI8b0EIUU9Nl
 Dm0q9fsmlkb9avDU8cmjrgZkl0XvO6zipKinygaGScY38orKyiXZTtTpLsJeTwc8lpQzCoGMO
 qd8myi6uZHA9vvMSZBTIvyWWC+X/qbCxXQSDxhT3Ose29OceF9rfm7WJh/NdiifgUUdh6XHQs
 4ClAToDnJ0dEOleXCH2ASl8OnFC7cD0I+iSdCXzDV97zW0DHubNrkUdqHAchYwgaT+Vf5de2F
 1bfS6XIpSIQM23OfmG6BYPIRM5HboO2CpT1J6yJ3Zw+Jo6lMwMvK4WJJ5SnHXfDurRvXqP+BW
 zGD0zbQLC3VqgVc5mSLriPNkQCaw6mnkREwjUzif3nKtLtMTOSnbIbSD4Jag/utSL84ECvGzw
 P40wJBg3CAzorY/k4snM/D/lGdWuK74y4pI/osqH9mnUIe8Kw5XR0Fhd0anEQGhJNemNp0L40
 TpakCCwLF6raAlXuuelED1MCqnQabwwu3tKwajVpwbH8ZCgNQ4Eq75ZYo230Ko4vfObUJFAHL
 xD/RPKLOKQ5mL
X-Mailman-Approved-At: Thu, 08 Jan 2026 20:01:51 +0000
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

The ONE-NETBOOK One-Mix3 Pro uses a portrait-mounted 1600x2560 panel,
but firmware reports an incorrect orientation. This causes early
userspace (e.g. fbcon and GDM) to appear rotated.

Add a DMI-based panel orientation quirk so the kernel reports the
correct orientation from boot.

Tested-by: Dave Sawyer <kernel@davesawyer.co.uk>
Signed-off-by: Dave Sawyer <kernel@davesawyer.co.uk>
=2D--
 .../gpu/drm/drm_panel_orientation_quirks.c    | 595 ++++++++++++++++++
 1 file changed, 595 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panel_orientation_quirks.c

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/=
drm/drm_panel_orientation_quirks.c
new file mode 100644
index 0000000..c554ad8
=2D-- /dev/null
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -0,0 +1,595 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * drm_panel_orientation_quirks.c -- Quirks for non-normal panel orientat=
ion
+ *
+ * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
+ *
+ * Note the quirks in this file are shared with fbdev/efifb and as such
+ * must not depend on other drm code.
+ */
+
+#include <linux/dmi.h>
+#include <linux/module.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_utils.h>
+
+#ifdef CONFIG_DMI
+
+/*
+ * Some x86 clamshell design devices use portrait tablet screens and a di=
splay
+ * engine which cannot rotate in hardware, so we need to rotate the fbcon=
 to
+ * compensate. Unfortunately these (cheap) devices also typically have qu=
ite
+ * generic DMI data, so we match on a combination of DMI data, screen res=
olution
+ * and a list of known BIOS dates to avoid false positives.
+ */
+
+struct drm_dmi_panel_orientation_data {
+	int width;
+	int height;
+	const char * const *bios_dates;
+	int orientation;
+};
+
+static const struct drm_dmi_panel_orientation_data gpd_micropc =3D {
+	.width =3D 720,
+	.height =3D 1280,
+	.bios_dates =3D (const char * const []){ "04/26/2019",
+		NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data gpd_onemix2s =3D {
+	.width =3D 1200,
+	.height =3D 1920,
+	.bios_dates =3D (const char * const []){ "05/21/2018", "10/26/2018",
+		"03/04/2019", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data gpd_pocket =3D {
+	.width =3D 1200,
+	.height =3D 1920,
+	.bios_dates =3D (const char * const []){ "05/26/2017", "06/28/2017",
+		"07/05/2017", "08/07/2017", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data gpd_pocket2 =3D {
+	.width =3D 1200,
+	.height =3D 1920,
+	.bios_dates =3D (const char * const []){ "06/28/2018", "08/28/2018",
+		"12/07/2018", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data gpd_win =3D {
+	.width =3D 720,
+	.height =3D 1280,
+	.bios_dates =3D (const char * const []){
+		"10/25/2016", "11/18/2016", "12/23/2016", "12/26/2016",
+		"02/21/2017", "03/20/2017", "05/25/2017", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data gpd_win2 =3D {
+	.width =3D 720,
+	.height =3D 1280,
+	.bios_dates =3D (const char * const []){
+		"12/07/2017", "05/24/2018", "06/29/2018", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data itworks_tw891 =3D {
+	.width =3D 800,
+	.height =3D 1280,
+	.bios_dates =3D (const char * const []){ "10/16/2015", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data onegx1_pro =3D {
+	.width =3D 1200,
+	.height =3D 1920,
+	.bios_dates =3D (const char * const []){ "12/17/2020", NULL },
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd640x960_leftside_up=
 =3D {
+	.width =3D 640,
+	.height =3D 960,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_=
up =3D {
+	.width =3D 720,
+	.height =3D 1280,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_u=
p =3D {
+	.width =3D 800,
+	.height =3D 1280,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd800x1280_rightside_=
up =3D {
+	.width =3D 800,
+	.height =3D 1280,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_=
up =3D {
+	.width =3D 1080,
+	.height =3D 1920,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside=
_up =3D {
+	.width =3D 1080,
+	.height =3D 1920,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_=
up =3D {
+	.width =3D 1200,
+	.height =3D 1920,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside=
_up =3D {
+	.width =3D 1200,
+	.height =3D 1920,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside=
_up =3D {
+	.width =3D 1280,
+	.height =3D 1920,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_=
up =3D {
+	.width =3D 1600,
+	.height =3D 2560,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
+static const struct drm_dmi_panel_orientation_data lcd1600x2560_rightside=
_up =3D {
+	.width =3D 1600,
+	.height =3D 2560,
+	.orientation =3D DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
+static const struct dmi_system_id orientation_data[] =3D {
+	{	/* Acer One 10 (S1003) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Acer Switch V 10 (SW5-017) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SW5-017"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Anbernic Win600 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Anbernic"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Win600"),
+		},
+		.driver_data =3D (void *)&lcd720x1280_rightside_up,
+	}, {	/* Asus T100HA */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100HAN"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_leftside_up,
+	}, {	/* Asus T101HA */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T101HA"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Asus T103HAF */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO AYANEO 2/2S */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYANEO 2"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* AYA NEO 2021 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO AIR */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
+		},
+		.driver_data =3D (void *)&lcd1080x1920_leftside_up,
+	}, {    /* AYA NEO Flip DS Bottom Screen */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FLIP DS"),
+		},
+		.driver_data =3D (void *)&lcd640x960_leftside_up,
+	}, {    /* AYA NEO Flip KB/DS Top Screen */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "FLIP"),
+		},
+		.driver_data =3D (void *)&lcd1080x1920_leftside_up,
+	}, {	/* AYA NEO Founder */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYA NEO Founder"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO GEEK */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "GEEK"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO KUN */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data =3D (void *)&lcd1600x2560_rightside_up,
+	}, {	/* AYA NEO SLIDE */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "SLIDE"),
+		},
+		.driver_data =3D (void *)&lcd1080x1920_leftside_up,
+	}, {    /* AYN Loki Max */
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
+		},
+		.driver_data =3D (void *)&lcd1080x1920_leftside_up,
+	}, {	/* AYN Loki Zero */
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Zero"),
+		},
+		.driver_data =3D (void *)&lcd1080x1920_leftside_up,
+	}, {	/* Chuwi HiBook (CWI514) */
+		.matches =3D {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+			/* Above matches are too generic, add bios-date match */
+			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Chuwi Hi10 Pro (CWI529) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Dynabook K50 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "dynabook K50/FR"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_leftside_up,
+	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		},
+		.driver_data =3D (void *)&gpd_micropc,
+	}, {	/* GPD MicroPC (later BIOS versions with proper DMI strings) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MicroPC"),
+		},
+		.driver_data =3D (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Max */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/*
+		 * GPD Pocket, note that the DMI data is less generic then
+		 * it seems, devices with a board-vendor of "AMI Corporation"
+		 * are quite rare, as are devices which have both board- *and*
+		 * product-id set to "Default String"
+		 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_SERIAL, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		},
+		.driver_data =3D (void *)&gpd_pocket,
+	}, {	/* GPD Pocket 2 (generic strings, also match on bios date) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		},
+		.driver_data =3D (void *)&gpd_pocket2,
+	}, {	/* GPD Win (same note on DMI match as GPD Pocket) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_SERIAL, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		},
+		.driver_data =3D (void *)&gpd_win,
+	}, {	/* GPD Win 2 (too generic strings, also match on bios date) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		},
+		.driver_data =3D (void *)&gpd_win2,
+	}, {	/* GPD Win 2 (correct DMI strings) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "WIN2")
+		},
+		.driver_data =3D (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win 3 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
+		},
+		.driver_data =3D (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Mini */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1617-01")
+		},
+		.driver_data =3D (void *)&lcd1080x1920_rightside_up,
+	}, {	/* I.T.Works TW891 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "TW891"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "To be filled by O.E.M."),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "TW891"),
+		},
+		.driver_data =3D (void *)&itworks_tw891,
+	}, {	/* KD Kurio Smart C15200 2-in-1 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "KD Interactive"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Kurio Smart"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "KDM960BCP"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/*
+		 * Lenovo Ideapad Miix 310 laptop, only some production batches
+		 * have a portrait screen, the resolution checks makes the quirk
+		 * apply only to those batches.
+		 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "80SG"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10ICR"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo Ideapad Miix 320 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "80XF"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo MIIX 320-10ICR"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGM (HD) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGM (FHD) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGL (HD) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo IdeaPad Duet 3 10IGL5 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Legion Go 8APU1 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
+		},
+		.driver_data =3D (void *)&lcd1600x2560_leftside_up,
+	}, {	/* Lenovo Yoga Book X90F / X90L */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Yoga Book X91F / X91L */
+		.matches =3D {
+		  /* Non exact match to match F + L versions */
+		  DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Yoga Tablet 2 830F / 830L */
+		.matches =3D {
+		 /*
+		  * Note this also matches the Lenovo Yoga Tablet 2 1050F/L
+		  * since that uses the same mainboard. The resolution match
+		  * will limit this to only matching on the 830F/L. Neither has
+		  * any external video outputs so those are not a concern.
+		  */
+		 DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
+		 DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
+		 DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
+		 /* Partial match on beginning of BIOS version */
+		 DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo Yoga Tab 3 X90F */
+		.matches =3D {
+		 DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+		 DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+		.driver_data =3D (void *)&lcd1600x2560_rightside_up,
+	}, {	/* Nanote UMPC-01 */
+		.matches =3D {
+		 DMI_MATCH(DMI_SYS_VENDOR, "RWC CO.,LTD"),
+		 DMI_MATCH(DMI_PRODUCT_NAME, "UMPC-01"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* OneGX1 Pro */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SYSTEM_MANUFACTURER"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "SYSTEM_PRODUCT_NAME"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
+		},
+		.driver_data =3D (void *)&onegx1_pro,
+	}, {	/* OneXPlayer */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data =3D (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer Mini (Intel) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_leftside_up,
+	}, {	/* OrangePi Neo */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NEO-01"),
+		},
+		.driver_data =3D (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Samsung GalaxyBook 10.6 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
+		},
+		.driver_data =3D (void *)&lcd1280x1920_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck (Galileo) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* VIOS LTH17 */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
+		},
+		.driver_data =3D (void *)&lcd800x1280_rightside_up,
+	}, {	/* One Mix 2S (generic strings, also match on bios date) */
+		.matches =3D {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		},
+		.driver_data =3D (void *)&gpd_onemix2s,
+	},
+	{}
+};
+
+/**
+ * drm_get_panel_orientation_quirk - Check for panel orientation quirks
+ * @width: width in pixels of the panel
+ * @height: height in pixels of the panel
+ *
+ * This function checks for platform specific (e.g. DMI based) quirks
+ * providing info on panel_orientation for systems where this cannot be
+ * probed from the hard-/firm-ware. To avoid false-positive this function
+ * takes the panel resolution as argument and checks that against the
+ * resolution expected by the quirk-table entry.
+ *
+ * Note this function is also used outside of the drm-subsys, by for exam=
ple
+ * the efifb code. Because of this this function gets compiled into its o=
wn
+ * kernel-module when built as a module.
+ *
+ * Returns:
+ * A DRM_MODE_PANEL_ORIENTATION_* value if there is a quirk for this syst=
em,
+ * or DRM_MODE_PANEL_ORIENTATION_UNKNOWN if there is no quirk.
+ */
+int drm_get_panel_orientation_quirk(int width, int height)
+{
+	const struct dmi_system_id *match;
+	const struct drm_dmi_panel_orientation_data *data;
+	const char *bios_date;
+	int i;
+
+	for (match =3D dmi_first_match(orientation_data);
+	     match;
+	     match =3D dmi_first_match(match + 1)) {
+		data =3D match->driver_data;
+
+		if (data->width !=3D width ||
+		    data->height !=3D height)
+			continue;
+
+		if (!data->bios_dates)
+			return data->orientation;
+
+		bios_date =3D dmi_get_system_info(DMI_BIOS_DATE);
+		if (!bios_date)
+			continue;
+
+		i =3D match_string(data->bios_dates, -1, bios_date);
+		if (i >=3D 0)
+			return data->orientation;
+	}
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+EXPORT_SYMBOL(drm_get_panel_orientation_quirk);
+
+#else
+
+/* There are no quirks for non x86 devices yet */
+int drm_get_panel_orientation_quirk(int width, int height)
+{
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+EXPORT_SYMBOL(drm_get_panel_orientation_quirk);
+
+#endif
+
+MODULE_DESCRIPTION("Quirks for non-normal panel orientation");
+MODULE_LICENSE("Dual MIT/GPL");
=2D-=20
2.47.3

