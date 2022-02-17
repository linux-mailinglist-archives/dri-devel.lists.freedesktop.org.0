Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B744BA9B0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEF410E6ED;
	Thu, 17 Feb 2022 19:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2164810E6E9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:22:03 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a23so9637068eju.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JtsCsaktpNdBnwP/8uHDo/igt3svF7h0+evxTunoIpQ=;
 b=Cjd/HN0MoaxIO0R9wa2O4dQvhZcRov2ZZBR6JKX1U6Kwf+4Kul2A6IIYhJ+HCxug7/
 wIce+7p1wzuQc4diUmbzA6O/KB9XqHk0T6JEf7a//JQQvBhcAxqr0RMIhKyzAr7cxLDx
 OJHXaTzJ7WlifA9coC5W0IKMQWdsfUdPMJ4WjrFJWH1Ciyt/Bx2N8k/vPDgfnt8iUk0b
 caJ69oPa0CNG/+/L0Ir+c580OItIT9zfnUsJkpM7NUtFwfERDrmcBKbzJK1AiYCYGSpl
 wQvIzwu1UY+1Mho+Yf3+nMCBRhGgHn1Ev+vMVKGOngapln/UaxSUxm/jRGpR6B8hPbva
 vLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JtsCsaktpNdBnwP/8uHDo/igt3svF7h0+evxTunoIpQ=;
 b=gNHnFxNNlGZ03Awh4rNvGHlVaJJ0pnnDbTGDUthdDzzFLEGcI+gYcdzqAlwgkICIhG
 t87S18N12KvHrUGoGG6CxbXTC0P/bYWyh/Q2rsLfjzumPXsrUmVTqwqa39UL695trZp7
 HejLuw3IuY1Xo6SxB18wFiB7xeznOF6UxgdqdKOzHlYPBR4Me55R3xvLpTzFeVPXuf17
 fSALiOlET0yXW2b5IcFVMgL7lzhnBUcB3EltKJFDWuWEX0Svp4seob9HjUp0QI3ZfGH9
 z42xnQ3ZSKh7Kt5SkAhWR3GTP6tJfWh4W1oea6fq8hGPsDq2gPa/lpOCw3bRq5L2JrlE
 Z2ow==
X-Gm-Message-State: AOAM532MpjPuS9QXbCgezQE8BkFRPlqihRrkRxqVopoVGGy39QlGesz8
 ZgCVus6dqbtfo9EcMXlyauwzATZtUGc=
X-Google-Smtp-Source: ABdhPJzK+XSgNBdd9PHUFhGIssF7+f/WaOOUqZ3ojPARprNM1vGamtTxotKs12wo4sI7nk9LrGEiKQ==
X-Received: by 2002:a17:906:b0f:b0:6ce:e79:75c2 with SMTP id
 u15-20020a1709060b0f00b006ce0e7975c2mr3554607ejg.668.1645125721338; 
 Thu, 17 Feb 2022 11:22:01 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id c22sm1509186ejp.146.2022.02.17.11.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:22:00 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 21/25] tests: tegra: Add VIC 4.1 support
Date: Thu, 17 Feb 2022 20:19:27 +0100
Message-Id: <20220217191931.2534836-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The Video Image Composer (VIC) 4.1 can be found on NVIDIA Tegra186 SoCs.
It uses a different class (B1B6) that is slightly incompatible with the
class found on earlier generations.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   2 +
 tests/tegra/vic.c       |   7 +
 tests/tegra/vic41.c     | 374 ++++++++++++++++++++++++++++++++++++++++
 tests/tegra/vic41.h     | 372 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 755 insertions(+)
 create mode 100644 tests/tegra/vic41.c
 create mode 100644 tests/tegra/vic41.h

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index e9c2bc875a01..f50f3705c09f 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -38,6 +38,8 @@ libdrm_test_tegra = static_library(
     'vic30.h',
     'vic40.c',
     'vic40.h',
+    'vic41.c',
+    'vic41.h',
   ), config_file ],
   include_directories : [inc_root, inc_drm, inc_tegra],
   link_with : libdrm,
diff --git a/tests/tegra/vic.c b/tests/tegra/vic.c
index e0a97c059eca..c5745ae58d29 100644
--- a/tests/tegra/vic.c
+++ b/tests/tegra/vic.c
@@ -138,6 +138,10 @@ int vic30_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
 int vic40_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
               struct vic **vicp);
 
+/* from vic41.c */
+int vic41_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp);
+
 int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
             struct vic **vicp)
 {
@@ -151,6 +155,9 @@ int vic_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
 
     case 0x21:
         return vic40_new(drm, channel, vicp);
+
+    case 0x18:
+        return vic41_new(drm, channel, vicp);
     }
 
     return -ENOTSUP;
diff --git a/tests/tegra/vic41.c b/tests/tegra/vic41.c
new file mode 100644
index 000000000000..0412fb24c537
--- /dev/null
+++ b/tests/tegra/vic41.c
@@ -0,0 +1,374 @@
+/*
+ * Copyright © 2018 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <errno.h>
+#include <string.h>
+
+#include "private.h"
+#include "tegra.h"
+#include "vic.h"
+#include "vic41.h"
+
+struct vic41 {
+    struct vic base;
+
+    struct {
+        struct drm_tegra_mapping *map;
+        struct drm_tegra_bo *bo;
+    } config;
+
+    struct {
+        struct drm_tegra_mapping *map;
+        struct drm_tegra_bo *bo;
+    } filter;
+
+    struct {
+        struct drm_tegra_mapping *map;
+        struct drm_tegra_bo *bo;
+    } hist;
+};
+
+static int vic41_fill(struct vic *v, struct vic_image *output,
+                      unsigned int left, unsigned int top,
+                      unsigned int right, unsigned int bottom,
+                      unsigned int alpha, unsigned int red,
+                      unsigned int green, unsigned int blue)
+{
+    struct vic41 *vic = container_of(v, struct vic41, base);
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = top;
+    c->outputConfig.TargetRectLeft = left;
+    c->outputConfig.TargetRectRight = right;
+    c->outputConfig.TargetRectBottom = bottom;
+    c->outputConfig.BackgroundAlpha = alpha;
+    c->outputConfig.BackgroundR = red;
+    c->outputConfig.BackgroundG = green;
+    c->outputConfig.BackgroundB = blue;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic41_blit(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic41 *vic = container_of(v, struct vic41, base);
+    SlotSurfaceConfig *surface;
+    SlotConfig *slot;
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = 0;
+    c->outputConfig.TargetRectLeft = 0;
+    c->outputConfig.TargetRectRight = output->width - 1;
+    c->outputConfig.TargetRectBottom = output->height - 1;
+    c->outputConfig.BackgroundAlpha = 255;
+    c->outputConfig.BackgroundR = 1023;
+    c->outputConfig.BackgroundG = 1023;
+    c->outputConfig.BackgroundB = 1023;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    slot = &c->slotStruct[0].slotConfig;
+    slot->SlotEnable = 1;
+    slot->CurrentFieldEnable = 1;
+    slot->PlanarAlpha = 255;
+    slot->ConstantAlpha = 1;
+    slot->SourceRectLeft = 0 << 16;
+    slot->SourceRectRight = (input->width - 1) << 16;
+    slot->SourceRectTop = 0 << 16;
+    slot->SourceRectBottom = (input->height - 1) << 16;
+    slot->DestRectLeft = 0;
+    slot->DestRectRight = output->width - 1;
+    slot->DestRectTop = 0;
+    slot->DestRectBottom = output->height - 1;
+    slot->SoftClampHigh = 1023;
+
+    surface = &c->slotStruct[0].slotSurfaceConfig;
+    surface->SlotPixelFormat = input->format;
+    surface->SlotBlkKind = input->kind;
+    surface->SlotBlkHeight = 0; /* XXX */
+    surface->SlotCacheWidth = VIC_CACHE_WIDTH_64Bx4; /* XXX */
+    surface->SlotSurfaceWidth = input->width - 1;
+    surface->SlotSurfaceHeight = input->height - 1;
+    surface->SlotLumaWidth = input->stride - 1;
+    surface->SlotLumaHeight = input->height - 1;
+    surface->SlotChromaWidth = 16383;
+    surface->SlotChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic41_flip(struct vic *v, struct vic_image *output,
+                      struct vic_image *input)
+{
+    struct vic41 *vic = container_of(v, struct vic41, base);
+    SlotSurfaceConfig *surface;
+    SlotConfig *slot;
+    ConfigStruct *c;
+    int err;
+
+    err = drm_tegra_bo_map(vic->config.bo, (void **)&c);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    memset(c, 0, sizeof(*c));
+
+    c->outputConfig.TargetRectTop = 0;
+    c->outputConfig.TargetRectLeft = 0;
+    c->outputConfig.TargetRectRight = output->width - 1;
+    c->outputConfig.TargetRectBottom = output->height - 1;
+    c->outputConfig.BackgroundAlpha = 255;
+    c->outputConfig.BackgroundR = 1023;
+    c->outputConfig.BackgroundG = 1023;
+    c->outputConfig.BackgroundB = 1023;
+    c->outputConfig.OutputFlipY = 1;
+
+    c->outputSurfaceConfig.OutPixelFormat = output->format;
+    c->outputSurfaceConfig.OutBlkKind = output->kind;
+    c->outputSurfaceConfig.OutBlkHeight = 0;
+    c->outputSurfaceConfig.OutSurfaceWidth = output->width - 1;
+    c->outputSurfaceConfig.OutSurfaceHeight = output->height - 1;
+    c->outputSurfaceConfig.OutLumaWidth = output->stride - 1;
+    c->outputSurfaceConfig.OutLumaHeight = output->height - 1;
+    c->outputSurfaceConfig.OutChromaWidth = 16383;
+    c->outputSurfaceConfig.OutChromaHeight = 16383;
+
+    slot = &c->slotStruct[0].slotConfig;
+    slot->SlotEnable = 1;
+    slot->CurrentFieldEnable = 1;
+    slot->PlanarAlpha = 255;
+    slot->ConstantAlpha = 1;
+    slot->SourceRectLeft = 0 << 16;
+    slot->SourceRectRight = (input->width - 1) << 16;
+    slot->SourceRectTop = 0 << 16;
+    slot->SourceRectBottom = (input->height - 1) << 16;
+    slot->DestRectLeft = 0;
+    slot->DestRectRight = output->width - 1;
+    slot->DestRectTop = 0;
+    slot->DestRectBottom = output->height - 1;
+    slot->SoftClampHigh = 1023;
+
+    surface = &c->slotStruct[0].slotSurfaceConfig;
+    surface->SlotPixelFormat = input->format;
+    surface->SlotBlkKind = input->kind;
+    surface->SlotBlkHeight = 0; /* XXX */
+    surface->SlotCacheWidth = VIC_CACHE_WIDTH_64Bx4; /* XXX */
+    surface->SlotSurfaceWidth = input->width - 1;
+    surface->SlotSurfaceHeight = input->height - 1;
+    surface->SlotLumaWidth = input->stride - 1;
+    surface->SlotLumaHeight = input->height - 1;
+    surface->SlotChromaWidth = 16383;
+    surface->SlotChromaHeight = 16383;
+
+    drm_tegra_bo_unmap(vic->config.bo);
+
+    return 0;
+}
+
+static int vic41_execute(struct vic *v, struct drm_tegra_pushbuf *pushbuf,
+                         uint32_t **ptrp, struct vic_image *output,
+                         struct vic_image **inputs, unsigned int num_inputs)
+{
+    struct vic41 *vic = container_of(v, struct vic41, base);
+    unsigned int i;
+
+    if (num_inputs > 1)
+        return -EINVAL;
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVB1B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID, 1);
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVB1B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS, (sizeof(ConfigStruct) / 16) << 16);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVB1B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET, vic->config.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVB1B6_VIDEO_COMPOSITOR_SET_FILTER_STRUCT_OFFSET, vic->filter.map, 0, 0);
+    VIC_PUSH_BUFFER(pushbuf, ptrp, NVB1B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET, output->map, 0, 0);
+
+    for (i = 0; i < num_inputs; i++) {
+        uint32_t method = NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE0_LUMA_OFFSET(0) + (i * 3) * 4;
+
+        VIC_PUSH_BUFFER(pushbuf, ptrp, method, inputs[i]->map, 0, 0);
+    }
+
+    VIC_PUSH_METHOD(pushbuf, ptrp, NVB1B6_VIDEO_COMPOSITOR_EXECUTE, 1 << 8);
+
+    return 0;
+}
+
+static void vic41_free(struct vic *v)
+{
+    struct vic41 *vic = container_of(v, struct vic41, base);
+
+    drm_tegra_channel_unmap(vic->hist.map);
+    drm_tegra_bo_unref(vic->hist.bo);
+
+    drm_tegra_channel_unmap(vic->filter.map);
+    drm_tegra_bo_unref(vic->filter.bo);
+
+    drm_tegra_channel_unmap(vic->config.map);
+    drm_tegra_bo_unref(vic->config.bo);
+
+    drm_tegra_syncpoint_free(v->syncpt);
+
+    free(vic);
+}
+
+static const struct vic_ops vic41_ops = {
+    .fill = vic41_fill,
+    .blit = vic41_blit,
+    .flip = vic41_flip,
+    .execute = vic41_execute,
+    .free = vic41_free,
+};
+
+int vic41_new(struct drm_tegra *drm, struct drm_tegra_channel *channel,
+              struct vic **vicp)
+{
+    struct vic41 *vic;
+    void *ptr;
+    int err;
+
+    vic = calloc(1, sizeof(*vic));
+    if (!vic)
+        return -ENOMEM;
+
+    vic->base.drm = drm;
+    vic->base.channel = channel;
+    vic->base.ops = &vic41_ops;
+    vic->base.version = 0x18;
+
+    err = drm_tegra_syncpoint_new(drm, &vic->base.syncpt);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 16384, &vic->config.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate configuration structurer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_channel_map(channel, vic->config.bo, DRM_TEGRA_CHANNEL_MAP_READ,
+                                &vic->config.map);
+    if (err < 0) {
+        fprintf(stderr, "failed to map configuration structure: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 16384, &vic->filter.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate filter buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_map(vic->filter.bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map filter buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    memset(ptr, 0, 16384);
+    drm_tegra_bo_unmap(vic->filter.bo);
+
+    err = drm_tegra_channel_map(channel, vic->filter.bo, DRM_TEGRA_CHANNEL_MAP_READ,
+                                &vic->filter.map);
+    if (err < 0) {
+        fprintf(stderr, "failed to map filter buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_new(drm, 0, 4096, &vic->hist.bo);
+    if (err < 0) {
+        fprintf(stderr, "failed to allocate history buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_bo_map(vic->hist.bo, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to map history buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    memset(ptr, 0, 4096);
+    drm_tegra_bo_unmap(vic->hist.bo);
+
+    err = drm_tegra_channel_map(channel, vic->hist.bo, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                                &vic->hist.map);
+    if (err < 0) {
+        fprintf(stderr, "failed to map histogram buffer: %s\n",
+                strerror(-err));
+        return err;
+    }
+
+    if (vicp)
+        *vicp = &vic->base;
+
+    return 0;
+}
diff --git a/tests/tegra/vic41.h b/tests/tegra/vic41.h
new file mode 100644
index 000000000000..07d7019a7a4e
--- /dev/null
+++ b/tests/tegra/vic41.h
@@ -0,0 +1,372 @@
+/*
+ * Copyright © 2018 NVIDIA Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef VIC41_H
+#define VIC41_H
+
+#include <stdint.h>
+
+#define NVB1B6_VIDEO_COMPOSITOR_SET_APPLICATION_ID 0x00000200
+#define NVB1B6_VIDEO_COMPOSITOR_EXECUTE 0x00000300
+#define NVB1B6_VIDEO_COMPOSITOR_SET_PICTURE_INDEX 0x00000700
+#define NVB1B6_VIDEO_COMPOSITOR_SET_CONTROL_PARAMS 0x00000704
+#define NVB1B6_VIDEO_COMPOSITOR_SET_CONFIG_STRUCT_OFFSET 0x00000708
+#define NVB1B6_VIDEO_COMPOSITOR_SET_FILTER_STRUCT_OFFSET 0x0000070c
+#define NVB1B6_VIDEO_COMPOSITOR_SET_HIST_OFFSET 0x00000714
+#define NVB1B6_VIDEO_COMPOSITOR_SET_OUTPUT_SURFACE_LUMA_OFFSET 0x00000720
+#define NVB1B6_VIDEO_COMPOSITOR_SET_HISTORY_BUFFER_OFFSET(slot) (0x00000780 + (slot) * 4)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE0_LUMA_OFFSET(slot) (0x00001200 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE0_CHROMA_U_OFFSET(slot) (0x00001204 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE0_CHROMA_V_OFFSET(slot) (0x00001208 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE1_LUMA_OFFSET(slot) (0x0000120c + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE1_CHROMA_U_OFFSET(slot) (0x00001210 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE1_CHROMA_V_OFFSET(slot) (0x00001214 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE2_LUMA_OFFSET(slot) (0x00001218 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE2_CHROMA_U_OFFSET(slot) (0x0000121c + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE2_CHROMA_V_OFFSET(slot) (0x00001220 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE3_LUMA_OFFSET(slot) (0x00001224 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE3_CHROMA_U_OFFSET(slot) (0x00001228 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE3_CHROMA_V_OFFSET(slot) (0x0000122c + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE4_LUMA_OFFSET(slot) (0x00001230 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE4_CHROMA_U_OFFSET(slot) (0x00001234 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE4_CHROMA_V_OFFSET(slot) (0x00001238 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE5_LUMA_OFFSET(slot) (0x0000123c + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE5_CHROMA_U_OFFSET(slot) (0x00001240 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE5_CHROMA_V_OFFSET(slot) (0x00001244 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE6_LUMA_OFFSET(slot) (0x00001248 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE6_CHROMA_U_OFFSET(slot) (0x0000124c + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE6_CHROMA_V_OFFSET(slot) (0x00001250 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE7_LUMA_OFFSET(slot) (0x00001254 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE7_CHROMA_U_OFFSET(slot) (0x00001258 + (slot) * 0x00000060)
+#define NVB1B6_VIDEO_COMPOSITOR_SET_SURFACE7_CHROMA_V_OFFSET(slot) (0x0000125c + (slot) * 0x00000060)
+
+typedef struct {
+    uint64_t SlotEnable : 1; /* 0 */
+    uint64_t DeNoise : 1; /* 1 */
+    uint64_t AdvancedDenoise : 1; /* 2 */
+    uint64_t CadenceDetect : 1; /* 3 */
+    uint64_t MotionMap : 1; /* 4 */
+    uint64_t MMapCombine : 1; /* 5 */
+    uint64_t IsEven : 1; /* 6 */
+    uint64_t ChromaEven : 1; /* 7 */
+    uint64_t CurrentFieldEnable : 1; /* 8 */
+    uint64_t PrevFieldEnable : 1; /* 9 */
+    uint64_t NextFieldEnable : 1; /* 10 */
+    uint64_t NextNrFieldEnable : 1; /* 11 */
+    uint64_t CurMotionFieldEnable : 1; /* 12 */
+    uint64_t PrevMotionFieldEnable : 1; /* 13 */
+    uint64_t PpMotionFieldEnable : 1; /* 14 */
+    uint64_t CombMotionFieldEnable : 1; /* 15 */
+    uint64_t FrameFormat : 4; /* 19..16 */
+    uint64_t FilterLengthY : 2; /* 21..20 */
+    uint64_t FilterLengthX : 2; /* 23..22 */
+    uint64_t Panoramic : 12; /* 35..24 */
+    uint64_t ChromaUpLengthY : 2; /* 37..36 */
+    uint64_t ChromaUpLengthX : 2; /* 39..38 */
+    uint64_t reserved1 : 18; /* 57..40 */
+    uint64_t DetailFltClamp : 6; /* 63..58 */
+    uint64_t FilterNoise : 10; /* 73..64 */
+    uint64_t FilterDetail : 10; /* 83..74 */
+    uint64_t ChromaNoise : 10; /* 93..84 */
+    uint64_t ChromaDetail : 10; /* 103..94 */
+    uint64_t DeinterlaceMode : 4; /* 107..104 */
+    uint64_t MotionAccumWeight : 3; /* 110..108 */
+    uint64_t NoiseIir : 11; /* 121..111 */
+    uint64_t LightLevel : 4; /* 125..122 */
+    uint64_t reserved4 : 2; /* 127..126 */
+    /* 128 */
+    uint64_t SoftClampLow : 10; /* 9..0 */
+    uint64_t SoftClampHigh : 10; /* 19..10 */
+    uint64_t reserved5 : 12; /* 31..20 */
+    uint64_t reserved6 : 2; /* 33..32 */
+    uint64_t PlanarAlpha : 8; /* 41..34 */
+    uint64_t ConstantAlpha : 1; /* 42 */
+    uint64_t StereoInterleave : 3; /* 45..43 */
+    uint64_t ClipEnabled : 1; /* 46 */
+    uint64_t ClearRectMask : 8; /* 54..47 */
+    uint64_t DegammaMode : 2; /* 56..55 */
+    uint64_t reserved7 : 1; /* 57 */
+    uint64_t DecompressEnable : 1; /* 58 */
+    uint64_t DecompressKind : 4; /* 62..59 */
+    uint64_t reserved9 : 1; /* 63 */
+    uint64_t DecompressCtbCount : 8; /* 71..64 */
+    uint64_t DecompressZbcColor : 32; /* 103..72 */
+    uint64_t reserved12 : 24; /* 127..104 */
+    /* 256 */
+    uint64_t SourceRectLeft : 30; /* 29..0 */
+    uint64_t reserved14 : 2; /* 31..30 */
+    uint64_t SourceRectRight : 30; /* 61..32 */
+    uint64_t reserved15 : 2; /* 63..62 */
+    uint64_t SourceRectTop : 30; /* 93..64 */
+    uint64_t reserved16 : 2; /* 95..94 */
+    uint64_t SourceRectBottom : 30; /* 125..96 */
+    uint64_t reserved17 : 2; /* 127..126 */
+    /* 384 */
+    uint64_t DestRectLeft : 14; /* 13..0 */
+    uint64_t reserved18 : 2; /* 15..14 */
+    uint64_t DestRectRight : 14; /* 29..16 */
+    uint64_t reserved19 : 2; /* 31..30 */
+    uint64_t DestRectTop : 14; /* 45..32 */
+    uint64_t reserved20 : 2; /* 47..46 */
+    uint64_t DestRectBottom : 14; /* 61..48 */
+    uint64_t reserved21 : 2; /* 63..62 */
+    uint64_t reserved22 : 32; /* 95..64 */
+    uint64_t reserved23 : 32; /* 127..96 */
+} SlotConfig;
+
+typedef struct {
+    uint64_t SlotPixelFormat : 7; /* 6..0 */
+    uint64_t SlotChromaLocHoriz : 2; /* 8..7 */
+    uint64_t SlotChromaLocVert : 2; /* 10..9 */
+    uint64_t SlotBlkKind : 4; /* 14..11 */
+    uint64_t SlotBlkHeight : 4; /* 18..15 */
+    uint64_t SlotCacheWidth : 3; /* 21..19 */
+    uint64_t reserved0 : 10; /* 31..22 */
+    uint64_t SlotSurfaceWidth : 14; /* 45..32 */
+    uint64_t SlotSurfaceHeight : 14; /* 59..46 */
+    uint64_t reserved1 : 4; /* 63..60 */
+    uint64_t SlotLumaWidth : 14; /* 77..64 */
+    uint64_t SlotLumaHeight : 14; /* 91..78 */
+    uint64_t reserved2 : 4; /* 95..92 */
+    uint64_t SlotChromaWidth : 14; /* 109..96 */
+    uint64_t SlotChromaHeight : 14; /* 123..110 */
+    uint64_t reserved3 : 4; /* 127..124 */
+} SlotSurfaceConfig;
+
+typedef struct {
+    uint64_t luma_coeff0 : 20; /* 19..0 */
+    uint64_t luma_coeff1 : 20; /* 39..20 */
+    uint64_t luma_coeff2 : 20; /* 59..40 */
+    uint64_t luma_r_shift : 4; /* 63..60 */
+    uint64_t luma_coeff3 : 20; /* 83..64 */
+    uint64_t LumaKeyLower : 10; /* 93..84 */
+    uint64_t LumaKeyUpper : 10; /* 103..94 */
+    uint64_t LumaKeyEnabled : 1; /* 104 */
+    uint64_t reserved0 : 2; /* 106..105 */
+    uint64_t reserved1 : 21; /* 127..107 */
+} LumaKeyStruct;
+
+typedef struct {
+    uint64_t matrix_coeff00 : 20; /* 19..0 */
+    uint64_t matrix_coeff10 : 20; /* 39..20 */
+    uint64_t matrix_coeff20 : 20; /* 59..40 */
+    uint64_t matrix_r_shift : 4; /* 63..60 */
+    uint64_t matrix_coeff01 : 20; /* 83..64 */
+    uint64_t matrix_coeff11 : 20; /* 103..84 */
+    uint64_t matrix_coeff21 : 20; /* 123..104 */
+    uint64_t reserved0 : 3; /* 126..124 */
+    uint64_t matrix_enable : 1; /* 127 */
+    /* 128 */
+    uint64_t matrix_coeff02 : 20; /* 19..0 */
+    uint64_t matrix_coeff12 : 20; /* 39..20 */
+    uint64_t matrix_coeff22 : 20; /* 59..40 */
+    uint64_t reserved1 : 4; /* 63..60 */
+    uint64_t matrix_coeff03 : 20; /* 83..64 */
+    uint64_t matrix_coeff13 : 20; /* 103..84 */
+    uint64_t matrix_coeff23 : 20; /* 123..104 */
+    uint64_t reserved2 : 4; /* 127..124 */
+} MatrixStruct;
+
+typedef struct {
+    uint64_t ClearRect0Left : 14; /* 13..0 */
+    uint64_t reserved0 : 2; /* 15..14 */
+    uint64_t ClearRect0Right : 14; /* 29..16 */
+    uint64_t reserved1 : 2; /* 31..30 */
+    uint64_t ClearRect0Top : 14; /* 45..32 */
+    uint64_t reserved2 : 2; /* 47..46 */
+    uint64_t ClearRect0Bottom : 14; /* 61..48 */
+    uint64_t reserved3 : 2; /* 63..62 */
+    uint64_t ClearRect1Left : 14; /* 77..64 */
+    uint64_t reserved4 : 2; /* 79..78 */
+    uint64_t ClearRect1Right : 14; /* 93..80 */
+    uint64_t reserved5 : 2; /* 95..94 */
+    uint64_t ClearRect1Top : 14; /* 109..96 */
+    uint64_t reserved6 : 2; /* 111..110 */
+    uint64_t ClearRect1Bottom : 14; /* 125..112 */
+    uint64_t reserved7 : 2; /* 127..126 */
+} ClearRectStruct;
+
+typedef struct {
+    uint64_t reserved0 : 2; /* 1..0 */
+    uint64_t AlphaK1 : 8; /* 9..2 */
+    uint64_t reserved1 : 6; /* 17..10 */
+    uint64_t AlphaK2 : 8; /* 25..18 */
+    uint64_t reserved2 : 6; /* 31..26 */
+    uint64_t SrcFactCMatchSelect : 3; /* 34..32 */
+    uint64_t reserved3 : 1; /* 35 */
+    uint64_t DstFactCMatchSelect : 3; /* 38..36 */
+    uint64_t reserved4 : 1; /* 39 */
+    uint64_t SrcFactAMatchSelect : 3; /* 42..40 */
+    uint64_t reserved5 : 1; /* 43 */
+    uint64_t DstFactAMatchSelect : 3; /* 46..44 */
+    uint64_t reserved6 : 1; /* 47 */
+    uint64_t reserved7 : 4; /* 51..48 */
+    uint64_t reserved8 : 4; /* 55..52 */
+    uint64_t reserved9 : 4; /* 59..56 */
+    uint64_t reserved10 : 4; /* 63..60 */
+    uint64_t reserved11 : 2; /* 65..64 */
+    uint64_t OverrideR : 10; /* 75..66 */
+    uint64_t OverrideG : 10; /* 85..76 */
+    uint64_t OverrideB : 10; /* 95..86 */
+    uint64_t reserved12 : 2; /* 97..96 */
+    uint64_t OverrideA : 8; /* 105..98 */
+    uint64_t reserved13 : 2; /* 107..106 */
+    uint64_t UseOverrideR : 1; /* 108 */
+    uint64_t UseOverrideG : 1; /* 109 */
+    uint64_t UseOverrideB : 1; /* 110 */
+    uint64_t UseOverrideA : 1; /* 111 */
+    uint64_t MaskR : 1; /* 112 */
+    uint64_t MaskG : 1; /* 113 */
+    uint64_t MaskB : 1; /* 114 */
+    uint64_t MaskA : 1; /* 115 */
+    uint64_t reserved14 : 12; /* 127..116 */
+} BlendingSlotStruct;
+
+typedef struct {
+    uint64_t AlphaFillMode : 3; /* 2..0 */
+    uint64_t AlphaFillSlot : 3; /* 5..3 */
+    uint64_t reserved0 : 2; /* 6..5 */
+    uint64_t BackgroundAlpha : 8; /* 15..7 */
+    uint64_t BackgroundR : 10; /* 25..16 */
+    uint64_t BackgroundG : 10; /* 35..26 */
+    uint64_t BackgroundB : 10; /* 45..36 */
+    uint64_t RegammaMode : 2; /* 47..46 */
+    uint64_t OutputFlipX : 1; /* 48 */
+    uint64_t OutputFlipY : 1; /* 49 */
+    uint64_t OutputTranspose : 1; /* 50 */
+    uint64_t reserved1 : 1; /* 51 */
+    uint64_t reserved2 : 12; /* 63..52 */
+    uint64_t TargetRectLeft : 14; /* 77..64 */
+    uint64_t reserved3 : 2; /* 79..78 */
+    uint64_t TargetRectRight : 14; /* 93..80 */
+    uint64_t reserved4 : 2; /* 95..94 */
+    uint64_t TargetRectTop : 14; /* 109..96 */
+    uint64_t reserved5 : 2; /* 111..110 */
+    uint64_t TargetRectBottom : 14; /* 125..112 */
+    uint64_t reserved6 : 2; /* 127..126 */
+} OutputConfig;
+
+typedef struct {
+    uint64_t OutPixelFormat : 7; /* 6..0 */
+    uint64_t OutChromaLocHoriz : 2; /* 8..7 */
+    uint64_t OutChromaLocVert : 2; /* 10..9 */
+    uint64_t OutBlkKind : 4; /* 14..11 */
+    uint64_t OutBlkHeight : 4; /* 18..15 */
+    uint64_t reserved0 : 3; /* 21..19 */
+    uint64_t reserved1 : 10; /* 31..22 */
+    uint64_t OutSurfaceWidth : 14; /* 45..32 */
+    uint64_t OutSurfaceHeight : 14; /* 59..46 */
+    uint64_t reserved2 : 4; /* 63..60 */
+    uint64_t OutLumaWidth : 14; /* 77..64 */
+    uint64_t OutLumaHeight : 14; /* 91..78 */
+    uint64_t reserved3 : 4; /* 95..92 */
+    uint64_t OutChromaWidth : 14; /* 109..96 */
+    uint64_t OutChromaHeight : 14; /* 123..110 */
+    uint64_t reserved4 : 4; /* 127..124 */
+} OutputSurfaceConfig;
+
+typedef struct {
+    uint64_t f00 : 10; /* 9..0 */
+    uint64_t f10 : 10; /* 19..10 */
+    uint64_t f20 : 10; /* 29..20 */
+    uint64_t reserved0 : 2; /* 31..30 */
+    uint64_t f01 : 10; /* 41..32 */
+    uint64_t f11 : 10; /* 51..42 */
+    uint64_t f21 : 10; /* 61..52 */
+    uint64_t reserved1 : 2; /* 63..62 */
+    uint64_t f02 : 10; /* 73..64 */
+    uint64_t f12 : 10; /* 83..74 */
+    uint64_t f22 : 10; /* 93..84 */
+    uint64_t reserved2 : 2; /* 95..94 */
+    uint64_t f03 : 10; /* 105..96 */
+    uint64_t f13 : 10; /* 115..106 */
+    uint64_t f23 : 10; /* 125..116 */
+    uint64_t reserved3 : 2; /* 127..126 */
+} FilterCoeffStruct;
+
+typedef struct {
+    uint64_t DownsampleHoriz : 11; /* 10..0 */
+    uint64_t reserved0 : 5; /* 15..11 */
+    uint64_t DownsampleVert : 11; /* 26..16 */
+    uint64_t reserved1 : 5; /* 31..27 */
+    uint64_t reserved2 : 32; /* 63..32 */
+    uint64_t reserved3 : 32; /* 95..64 */
+    uint64_t reserved4 : 32; /* 127..96 */
+} PipeConfig;
+
+typedef struct {
+    uint64_t OldCadence : 32; /* 31..0 */
+    uint64_t OldDiff : 32; /* 63..32 */
+    uint64_t OldWeave : 32; /* 95..64 */
+    uint64_t OlderWeave : 32; /* 127..96 */
+} SlotHistoryBuffer;
+
+typedef struct {
+    uint64_t crc0 : 32; /* 31..0 */
+    uint64_t crc1 : 32; /* 63..32 */
+    uint64_t crc2 : 32; /* 95..64 */
+    uint64_t crc3 : 32; /* 127..96 */
+} PartitionCrcStruct;
+
+typedef struct {
+    uint64_t crc0 : 32; /* 31..0 */
+    uint64_t crc1 : 32; /* 63..32 */
+} SlotCrcStruct;
+
+typedef struct {
+    uint64_t ErrorStatus : 32; /* 31..0 */
+    uint64_t CycleCount : 32; /* 63..32 */
+    uint64_t reserved0 : 32; /* 95..64 */
+    uint64_t reserved1 : 32; /* 127..96 */
+} StatusStruct;
+
+typedef struct {
+    SlotConfig slotConfig;
+    SlotSurfaceConfig slotSurfaceConfig;
+    LumaKeyStruct lumaKeyStruct;
+    MatrixStruct colorMatrixStruct;
+    MatrixStruct gamutMatrixStruct;
+    BlendingSlotStruct blendingSlotStruct;
+} SlotStruct;
+
+typedef struct {
+    FilterCoeffStruct filterCoeffStruct[520];
+} FilterStruct;
+
+typedef struct {
+    PipeConfig pipeConfig;
+    OutputConfig outputConfig;
+    OutputSurfaceConfig outputSurfaceConfig;
+    MatrixStruct outColorMatrixStruct;
+    ClearRectStruct clearRectStruct[4];
+    SlotStruct slotStruct[16];
+} ConfigStruct;
+
+typedef struct {
+    PartitionCrcStruct partitionCrcStruct[4];
+} InterfaceCrcStruct;
+
+typedef struct {
+    SlotCrcStruct slotCrcStruct[16];
+} InputCrcStruct;
+
+#endif
-- 
2.35.1

