Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49157060D7
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E2F10E3BF;
	Wed, 17 May 2023 07:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA4210E194
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:52:33 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-52c30fbccd4so12777828a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684223553; x=1686815553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DsbgPvP2eQIlq7kmg9LRSNNJDTLHGkJ+z06cRTvKmPo=;
 b=IH+OxDSCnRj0n1+jRXRta3jGInukoO1b64cA9Ks3MpgqXpCEwOnM302HL6p8kvhp/e
 aPMX07wda3y0nd5ZSLerXfaIGKieDc8n8lZx60O7D8jSajKtwimD5dCqv6lhBlGlImbZ
 jHr//F3JhpGK2c7Vf7rN3vxbl1LlgT1P22lKQsUj4vhIXfsPjUK+FeAQC6Hjq/omI4Bm
 7s4ACIpULaePWNWnMZ41UP/l4A/F4KgFtM4SvMJJIqvJjq5xJI++SOCvgJu/pJHrSq2u
 QiN78KmcMJWKubO3i1xueBFg50LiOQORNyq6G5lpCdGlcRjvqi6C54cfoYhsdTqm6QQ1
 yzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684223553; x=1686815553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DsbgPvP2eQIlq7kmg9LRSNNJDTLHGkJ+z06cRTvKmPo=;
 b=VNR9ZwDYBN0v0/+ZMl12MmVk0z4BSaTDWEVSfMSC1uX2Ya61p3Y6VLRcZoe6GMa5lU
 A6OXy925m9Ed6EOvOjfl4D3gtr7PeMeRRUWikDDzIpAdD9JTQ3+UMwj0sq6MslH4tRGf
 NzSQAKwIqwf6YnOzUMcWEyQLGrWLf5Pz9/rLKr1Jn9KvlFZZUeP7U5tS7iJaCmGsuMxV
 rmeZO3k8ZuxkDShlmm3VSemNzXuUbaSxsmdsjEbqsHUYf7bcITB5uOe/s6gCnnz9KC53
 TIQGmRYEyqGIqhyPrIl13JRUooZe8Z0ngY9pPXLmYxvq1zkFTDoPUW+eL/gWG5flhxrq
 fKHg==
X-Gm-Message-State: AC+VfDy0aE0pGzagQUyuqPKlEGn44SmwunFlyxqsB7tP2zz1so2sbSEV
 aFwpiNygmAHAc7jYaiNy9ctVvmIt0xAsit8btCA=
X-Google-Smtp-Source: ACHHUZ5Ar5+E5Aib3r0ioU3vwbYtx1KUxFjcdflrsZ0se9OUf9+0vHEriXuUqUch7mtfTXZaPsN+X/ZxbkDBNUefhK4=
X-Received: by 2002:a17:90b:3909:b0:24e:1144:ef52 with SMTP id
 ob9-20020a17090b390900b0024e1144ef52mr35607506pjb.11.1684223552706; Tue, 16
 May 2023 00:52:32 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UGF1bG8gUGF2YcSNacSH?= <pavacic.p@gmail.com>
Date: Tue, 16 May 2023 09:52:21 +0200
Message-ID: <CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.com>
Subject: drm/panel: Add panel-mipi-dsi-bringup
To: "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, sam@ravnborg.org, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 118419935002e076b44292c832e9b26106f93c89 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Paulo=3D20Pava=3DC4=3D8Di=3DC4=3D87?=3D <pavacic.p@gmail.=
com>
Date: Fri, 12 May 2023 17:38:29 +0200
Subject: [PATCH] drm/panel: add panel-mipi-dsi-bringup driver
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

This driver makes it easy to add new MIPI DSI panel drivers
if one already has panel enabled on the embedded system
without Linux kernel.

I have developed it out of the need because no other driver worked
for me without big amount of changes. Currently it supports fannal C3004.

Documentation/* files will be added in second patch since checkpatch.pl was
complaining.

Signed-off-by: Paulo Pava=C4=8Di=C4=87 <pavacic.p@gmail.com>
---
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-mipi-dsi-bringup.c    | 418 ++++++++++++++++++
 4 files changed, 437 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-mipi-dsi-bringup.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..8eff1e6f884c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6566,6 +6566,13 @@ T:    git git://anongit.freedesktop.org/drm/drm-misc
 F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.y=
aml
 F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c

+DRM DRIVER FOR MIPI DSI BRINGUP
+M:    Paulo Pava=C4=8Di=C4=87 <paulo.pavacic@zenitel.com>, <pavacic.p@gmai=
l.com>
+S:    Maintained
+C:    mipi-dsi-bringup:matrix.org
+F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bring=
up.yaml
+F:    drivers/gpu/drm/panel/panel-mipi-dsi-bringup.c
+
 DRM DRIVER FOR MSM ADRENO GPU
 M:    Rob Clark <robdclark@gmail.com>
 M:    Abhinav Kumar <quic_abhinavk@quicinc.com>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2b9d6db7860b..b2ccb3a376a3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -805,4 +805,15 @@ config DRM_PANEL_XINPENG_XPP055C272
       Say Y here if you want to enable support for the Xinpeng
       XPP055C272 controller for 720x1280 LCD panels with MIPI/RGB/SPI
       system interfaces.
+
+config DRM_PANEL_MIPI_DSI_BRINGUP
+    tristate "Bringup driver for MIPI DSI panels"
+    depends on OF
+    depends on DRM_MIPI_DSI
+    help
+      Say Y here if you want to enable support for MIPI DSI bringup panel
+      driver. This driver helps with initial porting of panels to the Linu=
x
+      kernel but can also be used as a daily driver. This driver by defaul=
t
+      supports Fannal's C3004 480x800 panel.
+
 endmenu
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefil=
e
index ff169781e82d..c00fb78e6fc4 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -82,3 +82,4 @@ obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) +=3D
panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) +=3D panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) +=3D panel-widechips-ws2401.o
 obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) +=3D panel-xinpeng-xpp055c272.o
+obj-$(CONFIG_DRM_PANEL_MIPI_DSI_BRINGUP) +=3D panel-mipi-dsi-bringup.o
diff --git a/drivers/gpu/drm/panel/panel-mipi-dsi-bringup.c
b/drivers/gpu/drm/panel/panel-mipi-dsi-bringup.c
new file mode 100644
index 000000000000..0a37d0ea2a79
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-mipi-dsi-bringup.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MIPI DSI Panel bringup driver. Purpose of this driver is to provide eas=
y way
+ * for panel manufacturers to enable their panels which were previously on=
ly
+ * available on the kernel-less systems. This driver is made to be very si=
mple
+ * so that you may add new panels easily. All the values are set directly =
in
+ * this file so that only device tree node has to be added with gpio reset=
 pin.
+ * Parts that you usually have to change are market with "INTERACTION" wor=
d.
+ * Search for word "INTERACTION" in this file if you are trying to
+ * enable new panel. Namsepace is brup as in brungup,
+ * so prepend all your functions with "brup_" prefix.
+ *
+ * Copyright 2023 Zenitel
+ */
+
+// =E2=86=93 include headers, static values, static functions =E2=86=93
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+
+#include <video/mipi_display.h>
+#include <video/of_videomode.h>
+#include <video/videomode.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
+
+static const struct brup_panel_info brup_fannal_c3004_panel_info;
+
+struct brup_panel_info {
+    const struct drm_display_mode *display_mode;
+    u32 num_of_dsi_lanes;
+    u32 mipi_dsi_format;
+    u32 mipi_dsi_mode_flags;
+    u32 bus_flags;
+    u32 video_mode;
+    void (*panel_enable_function)(struct mipi_dsi_device *dsi);
+};
+
+struct brup_panel_data {
+    const struct brup_panel_info *panel_info;
+    struct drm_panel panel;
+    struct gpio_desc *reset;
+};
+
+static struct brup_panel_data *
+get_brup_panel_data_from_panel(struct drm_panel *panel)
+{
+    return container_of(panel, struct brup_panel_data, panel);
+}
+
+static const struct brup_panel_info *
+get_brup_panel_info_from_panel(struct drm_panel *panel)
+{
+    return get_brup_panel_data_from_panel(panel)->panel_info;
+}
+
+enum BRUP_VIDEO_MODES_ENUM {
+    BRUP_BURST,
+    BRUP_SYNC_EVENT,
+    BRUP_SYNC_PULSE,
+    BRUP_COMMAND,
+};
+
+static const u32 BRUP_VIDEO_MODES[] =3D {
+    MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO, //BURST
+    MIPI_DSI_MODE_VIDEO, //SYNC_EVENT
+    MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO, //SYNC_PULSE
+    MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_VSYNC_FLUSH //COMMAND MO=
DE
+};
+
+//macro for writing to DSI
+#define WRITE_DSI(dsi, seq...)
           \
+    {                                                                     =
   \
+        const u8 d[] =3D { seq };                                         =
 \
+        int ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));        =
 \
+        if (ret < 0) {                                                   \
+            dev_err(&dsi->dev,                                       \
+                "Error (%d) occurred while trying to"            \
+                " write MIPI DSI command: %s (decimal value)\n", \
+                ret, d);                                         \
+        }                                                                \
+    }
+
+// =E2=86=91 include headers, static values, static functions =E2=86=91
+// =E2=86=93 INTERACTION whole section: panel specific values, add panel a=
s is shown =E2=86=93
+
+/**
+ * @brief Adding new panel
+ * Includes but isn't limited to following steps:
+ * 1. define new `brup_fannal_yourpanel_display_mode` with correct timings
+ * 2. define new `brup_panel_yourpanel_enable_function`
+ * 3. glue everything with brup_yourpanel_panel_info and set that
srtucts values
+ * 4. add .compatible =3D "you,yourpanel", .data =3D &brup_yourpanel_panel=
_info }
+ */
+
+static const u32 brup_bus_formats[] =3D {
+    MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+// resolution 480p x 800p, 56mmx93mm
+static const struct drm_display_mode brup_fannal_c3004_display_mode =3D {
+    .clock =3D 27000,
+    .hdisplay =3D 480, // display height pixels
+    .hsync_start =3D 480 + 30, // hdisplay + HBP
+    .hsync_end =3D 480 + 30 + 8, // hdisplay + HBP + HSync
+    .htotal =3D 480 + 30 + 8 + 30, // hdisplay + HBP + HSync + HFP
+    .vdisplay =3D 800, // display width pixels
+    .vsync_start =3D 800 + 20, // vdisplay + VBP
+    .vsync_end =3D 800 + 20 + 8, // vdisplay + VBP + VSync
+    .vtotal =3D 800 + 20 + 8 + 20, // vdisplay + VBP + VSync + VFP
+    .width_mm =3D 93,
+    .height_mm =3D 56,
+    .flags =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static void brup_panel_fannal_c3004_enable_function(struct
mipi_dsi_device *dsi)
+{
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+    WRITE_DSI(dsi, 0xEF, 0x08);
+
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x10);
+    WRITE_DSI(dsi, 0xC0, 0x63, 0x00);
+    WRITE_DSI(dsi, 0xC1, 0x0A, 0x0C);
+    WRITE_DSI(dsi, 0xC2, 0x31, 0x08);
+    WRITE_DSI(dsi, 0xCC, 0x18);
+
+    WRITE_DSI(dsi, 0xB0, 0x00, 0x08, 0x10, 0x0E, 0x11, 0x07, 0x08, 0x08,
+          0x08, 0x25, 0x04, 0x12, 0x0F, 0x2C, 0x30, 0x1F);
+    WRITE_DSI(dsi, 0xB1, 0x00, 0x11, 0x18, 0x0C, 0x10, 0x05, 0x07, 0x09,
+          0x08, 0x24, 0x04, 0x11, 0x10, 0x2B, 0x30, 0x1F);
+
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x11);
+    WRITE_DSI(dsi, 0xB0, 0x4D);
+    WRITE_DSI(dsi, 0xB1, 0x39);
+    WRITE_DSI(dsi, 0xB2, 0x87);
+    WRITE_DSI(dsi, 0xB3, 0x80);
+    WRITE_DSI(dsi, 0xB5, 0x47);
+    WRITE_DSI(dsi, 0xB7, 0x8A);
+    WRITE_DSI(dsi, 0xB8, 0x20);
+    WRITE_DSI(dsi, 0xB9, 0x10, 0x13);
+    WRITE_DSI(dsi, 0xC1, 0x78);
+    WRITE_DSI(dsi, 0xC2, 0x78);
+    WRITE_DSI(dsi, 0xD0, 0x88);
+
+    //PANEL
+    WRITE_DSI(dsi, 0xE0, 0x00, 0x00, 0x02);
+    WRITE_DSI(dsi, 0xE1, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,
+          0x00, 0x20, 0x20);
+    WRITE_DSI(dsi, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+          0x00, 0x00, 0x00, 0x00, 0x00);
+    WRITE_DSI(dsi, 0xE3, 0x00, 0x00, 0x33, 0x00);
+    WRITE_DSI(dsi, 0xE4, 0x22, 0x00);
+    WRITE_DSI(dsi, 0xE5, 0x04, 0x34, 0xAA, 0xAA, 0x06, 0x34, 0xAA, 0xAA,
+          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+    WRITE_DSI(dsi, 0xE6, 0x00, 0x00, 0x33, 0x00);
+    WRITE_DSI(dsi, 0xE7, 0x22, 0x00);
+    WRITE_DSI(dsi, 0xE8, 0x05, 0x34, 0xAA, 0xAA, 0x07, 0x34, 0xAA, 0xAA,
+          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+    WRITE_DSI(dsi, 0xEB, 0x02, 0x00, 0x40, 0x40, 0x00, 0x00, 0x00);
+    WRITE_DSI(dsi, 0xEC, 0x00, 0x00);
+    WRITE_DSI(dsi, 0xED, 0xFA, 0x45, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
+          0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xB0, 0x54, 0xAF);
+    WRITE_DSI(dsi, 0xEF, 0x10, 0x0D, 0x04, 0x08, 0x3F, 0x1F);
+
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+    WRITE_DSI(dsi, 0xE8, 0x00, 0x0E);
+
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+    WRITE_DSI(dsi, 0x11); //MIPI_DCS_EXIT_SLEEP_MODE
+
+    msleep(600);
+
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
+    WRITE_DSI(dsi, 0xE8, 0x00, 0x0C);
+    msleep(50);
+    WRITE_DSI(dsi, 0xE8, 0x00, 0x00);
+
+    WRITE_DSI(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x00);
+    WRITE_DSI(dsi, 0x29); //MIPI_DCS_SET_DISPLAY_ON
+    msleep(100);
+}
+
+static const struct brup_panel_info brup_fannal_c3004_panel_info =3D {
+    .display_mode =3D &brup_fannal_c3004_display_mode,
+    .num_of_dsi_lanes =3D 2, //how many wires are connected to the panel
+    .video_mode =3D BRUP_VIDEO_MODES[BRUP_SYNC_PULSE],
+    .mipi_dsi_format =3D MIPI_DSI_FMT_RGB888,
+    .mipi_dsi_mode_flags =3D
+        MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_VSYNC_FLUSH |
+        MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET,
+    .bus_flags =3D DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSED=
GE,
+    /*
+     * you have to define your own brup_panel_yourpanel_function and
+     */
+    .panel_enable_function =3D &brup_panel_fannal_c3004_enable_function
+};
+
+// =E2=86=91 INTERACTION: panel specific values, add panel as is show in t=
he example =E2=86=91
+// =E2=86=93 remove driver/cleanup =E2=86=93
+static void brup_panel_remove(struct mipi_dsi_device *dsi)
+{
+    struct brup_panel_data *panel_data =3D mipi_dsi_get_drvdata(dsi);
+    struct device *dev =3D &dsi->dev;
+    int ret;
+
+    ret =3D mipi_dsi_detach(dsi);
+    if (ret)
+        dev_err(dev, "error: disable: mipi detach (%d)\n", ret);
+
+    drm_panel_remove(&panel_data->panel);
+}
+
+static int brup_panel_disable(struct drm_panel *panel)
+{
+    struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(panel->dev);
+    struct device *dev =3D panel->dev;
+    int ret;
+
+    dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
+
+    ret =3D mipi_dsi_dcs_set_display_off(dsi);
+    if (ret < 0) {
+        dev_err(dev, "error: disable: turn display OFF (%d)\n", ret);
+        return ret;
+    }
+
+    usleep_range(5000, 10000);
+
+    ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
+    if (ret < 0) {
+        dev_err(dev, "error: disable: enter sleep mode (%d)\n", ret);
+        return ret;
+    }
+
+    return 0;
+}
+
+static int brup_panel_unprepare(struct drm_panel *panel)
+{
+    struct brup_panel_data *panel_data =3D
+        get_brup_panel_data_from_panel(panel);
+
+    if (panel_data->reset) {
+        gpiod_set_value_cansleep(panel_data->reset, 1);
+        usleep_range(15000, 17000);
+        gpiod_set_value_cansleep(panel_data->reset, 0);
+    }
+
+    return 0;
+}
+
+static void brup_panel_shutdown(struct mipi_dsi_device *dsi)
+{
+    struct brup_panel_data *panel_data =3D mipi_dsi_get_drvdata(dsi);
+
+    brup_panel_disable(&panel_data->panel);
+    brup_panel_unprepare(&panel_data->panel);
+}
+
+// =E2=86=91 remove driver/cleanup =E2=86=91
+// =E2=86=93 probe/create functions =E2=86=93
+
+static int brup_panel_get_modes(struct drm_panel *panel,
+                struct drm_connector *connector)
+{
+    struct drm_display_mode *mode;
+    const struct brup_panel_info *panel_info =3D
+        get_brup_panel_info_from_panel(panel);
+    const struct drm_display_mode *panel_display_mode =3D
+        panel_info->display_mode;
+
+    mode =3D drm_mode_duplicate(connector->dev, panel_display_mode);
+    if (!mode) {
+        dev_err(panel->dev, "error: get_modes: add drm mode %ux%u@%u\n",
+            panel_display_mode->hdisplay,
+            panel_display_mode->vdisplay,
+            drm_mode_vrefresh(panel_display_mode));
+        return -ENOMEM;
+    }
+
+    drm_mode_set_name(mode);
+    mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+    drm_mode_probed_add(connector, mode);
+
+    connector->display_info.width_mm =3D mode->width_mm;
+    connector->display_info.height_mm =3D mode->height_mm;
+    connector->display_info.bus_flags =3D panel_info->bus_flags;
+
+    drm_display_info_set_bus_formats(&connector->display_info,
+                     brup_bus_formats,
+                     ARRAY_SIZE(brup_bus_formats));
+    return 1;
+}
+
+static const struct of_device_id brup_of_match[] =3D {
+    { .compatible =3D "fannal,C3004", .data =3D &brup_fannal_c3004_panel_i=
nfo },
+    /*{INTERACTION: .compatible =3D "you,yourpanel", .data =3D &yourpanel_=
info } */
+    { /* sentinel */ }
+};
+
+static int brup_panel_enable(struct drm_panel *panel)
+{
+    struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(panel->dev);
+    const struct brup_panel_info *panel_info =3D
+        get_brup_panel_info_from_panel(panel);
+    panel_info->panel_enable_function(dsi);
+
+    return 0;
+}
+
+static int brup_panel_prepare(struct drm_panel *panel)
+{
+    struct brup_panel_data *panel_data =3D
+        get_brup_panel_data_from_panel(panel);
+
+    /* At lest 10ms needed between power-on and reset-out as RM specifies =
*/
+    usleep_range(10000, 12000);
+
+    if (panel_data->reset) {
+        gpiod_set_value_cansleep(panel_data->reset, 0);
+        /*
+         * 50ms delay after reset-out, as per manufacturer initalization
+         * sequence.
+         */
+        msleep(50);
+    }
+
+    return 0;
+}
+
+static const struct drm_panel_funcs brup_panel_funcs =3D {
+    .prepare =3D brup_panel_prepare,
+    .unprepare =3D brup_panel_unprepare,
+    .enable =3D brup_panel_enable,
+    .disable =3D brup_panel_disable,
+    .get_modes =3D brup_panel_get_modes,
+};
+
+static int brup_panel_probe(struct mipi_dsi_device *dsi)
+{
+    struct device *dev =3D &dsi->dev;
+    const struct of_device_id *of_id =3D of_match_device(brup_of_match, de=
v);
+    const struct brup_panel_info *panel_info =3D of_id->data;
+    struct brup_panel_data *panel_data;
+    int ret;
+
+    dev_notice(dev, "probe driver called\n");
+    if (!panel_info) {
+        dev_err(dev, "error: probe: get panel_data!\n");
+        return -ENODEV;
+    }
+
+    panel_data =3D devm_kzalloc(&dsi->dev, sizeof(*panel_data), GFP_KERNEL=
);
+
+    if (!panel_data)
+        return -ENOMEM;
+
+    panel_data->panel_info =3D panel_info;
+    panel_data->reset =3D devm_gpiod_get_optional(
+        dev, "reset", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+
+    if (IS_ERR(panel_data->reset)) {
+        ret =3D PTR_ERR(panel_data->reset);
+        dev_err(dev,
+            "error: probe: get reset GPIO: (%d) Check the fdt\n", ret);
+        return ret;
+    }
+
+    mipi_dsi_set_drvdata(dsi, panel_data);
+
+    dsi->format =3D panel_info->mipi_dsi_format;
+    dsi->mode_flags =3D panel_info->mipi_dsi_mode_flags |
+              panel_info->video_mode;
+    dsi->lanes =3D panel_info->num_of_dsi_lanes;
+
+    gpiod_set_value_cansleep(panel_data->reset, 1);
+
+    drm_panel_init(&panel_data->panel, dev, &brup_panel_funcs,
+               DRM_MODE_CONNECTOR_DSI);
+    dev_set_drvdata(dev, panel_data);
+
+    drm_panel_add(&panel_data->panel);
+
+    ret =3D mipi_dsi_attach(dsi);
+    if (ret) {
+        drm_panel_remove(&panel_data->panel);
+        dev_err(dev, "error: probe fail: can't attach mipi_dsi!\n");
+    } else
+        dev_notice(dev, "probe driver success. Good job!\n");
+
+    return ret;
+}
+
+// =E2=86=91 probe/create functions =E2=86=91
+// =E2=86=93 generic driver stuff =E2=86=93
+
+static struct mipi_dsi_driver brup_panel_driver =3D {
+    .driver =3D {
+        .name =3D "panel-mipi-dsi-bringup",
+        .of_match_table =3D brup_of_match,
+    },
+    .probe =3D brup_panel_probe,
+    .remove =3D brup_panel_remove,
+    .shutdown =3D brup_panel_shutdown,
+};
+
+module_mipi_dsi_driver(brup_panel_driver);
+
+MODULE_AUTHOR(
+    "Paulo Pava=C4=8Di=C4=87 <ppavacic@zenitel.com> <pavacic.p@gmail.com>
<@ppavacic:matrix.org>");
+MODULE_DESCRIPTION(
+    "Driver that enables you to enable MIPI DSI panels on Linux.");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, brup_of_match);
--=20
2.40.1
