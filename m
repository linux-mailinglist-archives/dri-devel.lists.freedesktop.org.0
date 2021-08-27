Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7833F99AC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828286E94F;
	Fri, 27 Aug 2021 13:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2136E947
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h13so10453196wrp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aI+eRZIPA68+BQOf6pZ4Fn2ln7XtsHtZd/t5vg9lWz0=;
 b=GitwlYsws4/6Ibk9hbNuANUa/3L2LpPonXKvuUVoJGPxTxExewK7PJQ/NlmpFQeVFI
 HVq9wXoVwotD2UnFNr2oAmYUeGidtoX9Uu7DJ7etzeEIOVXRezLY2av2AUwC0Eoq/PiU
 PstTlh/jfxSZdQdUswVBbz7Od1fizVcaQzi8z8eKcATDtIFZEiVJPV2UyLTDIDZMVW8h
 eY3bfJyDRN0gw0GJjq+mrk7c/8aIn83Lgc+VGwgAzN8P1Ca+VCd0K33Wq3Z3ONyd7pGB
 XEPrsimfKYotfttCXF/RbkqIrEyDSn6mPeAHqmszZ5ZoTavdoVt0aM5IetcIH8eleyQz
 0rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aI+eRZIPA68+BQOf6pZ4Fn2ln7XtsHtZd/t5vg9lWz0=;
 b=J9yRfTk472KGP/Dfp0oByKM9+GPGSyOTe/cmZyM9IuZfuGKTTTHCztejVjoCD9RAYu
 ZWwwvS6Yxlx35bOTSeQ3fr6uDL2FTwB1Z+NwcoiS6/nm/KppsSRGnYxqzPuvBmG5SnWa
 Bep/4M5teYUs4VUNK7wT782TWMARH4CGPXrhxhPJ1Ns0H1CFXLByegvxgAClRRv+1aTf
 7FX7pyk6q+VVbAhh6Gk5Qt3L4ts3+C9E8cZJyUbGXCY6pRbAz5+WKMRew7GhoVZa8Lv9
 EPujVCPu/Lu0rAeUo/QxEm9IK5c00qSxcAACADHG30Vaze1ZdxNdhx8pai5+07uXNrZK
 jNpg==
X-Gm-Message-State: AOAM531VpMUUbOwjJ2v0sdbKeb5AFSkN4LY1/Cv9nhUSlt61iWZxq+9C
 KKD4Mb8RWMlgBAOUbIIHRws=
X-Google-Smtp-Source: ABdhPJyk+bHMdnQ/EK8/VVwp7FWH68xnHn33Ts2WFXh60ZvKGZfBIV+a9drS5H9+ScQtPZCE//wRMA==
X-Received: by 2002:adf:b741:: with SMTP id n1mr9004107wre.120.1630070618617; 
 Fri, 27 Aug 2021 06:23:38 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t11sm6026677wmi.23.2021.08.27.06.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 14/25] tests: tegra: Add helper library for tests
Date: Fri, 27 Aug 2021 15:22:54 +0200
Message-Id: <20210827132305.3572077-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This library provides helpers for common functionality needed by test
programs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/drm-test.c  | 248 ++++++++++++++++++++++++++++++++++++++++
 tests/tegra/drm-test.h  |  72 ++++++++++++
 tests/tegra/meson.build |   7 ++
 3 files changed, 327 insertions(+)
 create mode 100644 tests/tegra/drm-test.c
 create mode 100644 tests/tegra/drm-test.h

diff --git a/tests/tegra/drm-test.c b/tests/tegra/drm-test.c
new file mode 100644
index 000000000000..b1ded9cf5fac
--- /dev/null
+++ b/tests/tegra/drm-test.c
@@ -0,0 +1,248 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#ifdef HAVE_CONFIG_H
+#  include "config.h"
+#endif
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include <sys/ioctl.h>
+
+#include "xf86drm.h"
+#include "xf86drmMode.h"
+#include "drm_fourcc.h"
+
+#include "drm-test.h"
+
+static int drm_screen_probe_connector(struct drm_screen *screen,
+                                      drmModeConnectorPtr connector)
+{
+    drmModeEncoderPtr encoder;
+    drmModeCrtcPtr crtc;
+    drmModeFBPtr fb;
+
+    encoder = drmModeGetEncoder(screen->fd, connector->encoder_id);
+    if (!encoder)
+        return -ENODEV;
+
+    crtc = drmModeGetCrtc(screen->fd, encoder->crtc_id);
+    if (!crtc) {
+        drmModeFreeEncoder(encoder);
+        return -ENODEV;
+    }
+
+    screen->old_fb = crtc->buffer_id;
+
+    fb = drmModeGetFB(screen->fd, crtc->buffer_id);
+    if (!fb) {
+        /* TODO: create new framebuffer */
+        drmModeFreeEncoder(encoder);
+        drmModeFreeCrtc(crtc);
+        return -ENOSYS;
+    }
+
+    screen->connector = connector->connector_id;
+    screen->old_fb = crtc->buffer_id;
+    screen->crtc = encoder->crtc_id;
+    /* TODO: check crtc->mode_valid */
+    screen->mode = crtc->mode;
+
+    screen->width = fb->width;
+    screen->height = fb->height;
+    screen->pitch = fb->pitch;
+    screen->depth = fb->depth;
+    screen->bpp = fb->bpp;
+
+    drmModeFreeEncoder(encoder);
+    drmModeFreeCrtc(crtc);
+    drmModeFreeFB(fb);
+
+    return 0;
+}
+
+int drm_screen_open(struct drm_screen **screenp, int fd)
+{
+    drmModeConnectorPtr connector;
+    struct drm_screen *screen;
+    bool found = false;
+    drmModeResPtr res;
+    unsigned int i;
+    int err;
+
+    if (!screenp || fd < 0)
+        return -EINVAL;
+
+    screen = calloc(1, sizeof(*screen));
+    if (!screen)
+        return -ENOMEM;
+
+    screen->format = DRM_FORMAT_XRGB8888;
+    screen->fd = fd;
+
+    res = drmModeGetResources(fd);
+    if (!res) {
+        free(screen);
+        return -ENOMEM;
+    }
+
+    for (i = 0; i < (unsigned int)res->count_connectors; i++) {
+        connector = drmModeGetConnector(fd, res->connectors[i]);
+        if (!connector)
+            continue;
+
+        if (connector->connection != DRM_MODE_CONNECTED) {
+            drmModeFreeConnector(connector);
+            continue;
+        }
+
+        err = drm_screen_probe_connector(screen, connector);
+        if (err < 0) {
+            drmModeFreeConnector(connector);
+            continue;
+        }
+
+        drmModeFreeConnector(connector);
+        found = true;
+        break;
+    }
+
+    drmModeFreeResources(res);
+
+    if (!found) {
+        free(screen);
+        return -ENODEV;
+    }
+
+    *screenp = screen;
+
+    return 0;
+}
+
+int drm_screen_close(struct drm_screen *screen)
+{
+    int err;
+
+    err = drmModeSetCrtc(screen->fd, screen->crtc, screen->old_fb, 0, 0,
+                         &screen->connector, 1, &screen->mode);
+    if (err < 0) {
+        fprintf(stderr, "drmModeSetCrtc() failed: %m\n");
+        return -errno;
+    }
+
+    free(screen);
+
+    return 0;
+}
+
+int drm_framebuffer_new(struct drm_framebuffer **fbp,
+                        struct drm_screen *screen, uint32_t handle,
+                        unsigned int width, unsigned int height,
+                        unsigned int pitch, uint32_t format,
+                        void *data)
+{
+    struct drm_framebuffer *fb;
+    uint32_t handles[4];
+    uint32_t pitches[4];
+    uint32_t offsets[4];
+    int err;
+
+    fb = calloc(1, sizeof(*fb));
+    if (!fb)
+        return -ENOMEM;
+
+    fb->fd = screen->fd;
+    fb->width = width;
+    fb->height = height;
+    fb->pitch = pitch;
+    fb->format = format;
+    fb->data = data;
+
+    handles[0] = handle;
+    pitches[0] = pitch;
+    offsets[0] = 0;
+
+    err = drmModeAddFB2(screen->fd, width, height, format, handles,
+                        pitches, offsets, &fb->handle, 0);
+    if (err < 0)
+        return -errno;
+
+    *fbp = fb;
+
+    return 0;
+}
+
+int drm_framebuffer_free(struct drm_framebuffer *fb)
+{
+    int err;
+
+    err = drmModeRmFB(fb->fd, fb->handle);
+    if (err < 0)
+        return -errno;
+
+    free(fb);
+
+    return 0;
+}
+
+int drm_screen_set_framebuffer(struct drm_screen *screen,
+                               struct drm_framebuffer *fb)
+{
+    int err;
+
+    err = drmModeSetCrtc(screen->fd, screen->crtc, fb->handle, 0, 0,
+                         &screen->connector, 1, &screen->mode);
+    if (err < 0)
+        return -errno;
+
+    return 0;
+}
+
+int drm_open(const char *path)
+{
+    int fd, err;
+
+    fd = open(path, O_RDWR);
+    if (fd < 0)
+        return -errno;
+
+    err = drmSetMaster(fd);
+    if (err < 0) {
+        close(fd);
+        return -errno;
+    }
+
+    return fd;
+}
+
+void drm_close(int fd)
+{
+    drmDropMaster(fd);
+    close(fd);
+}
diff --git a/tests/tegra/drm-test.h b/tests/tegra/drm-test.h
new file mode 100644
index 000000000000..f11aed42343e
--- /dev/null
+++ b/tests/tegra/drm-test.h
@@ -0,0 +1,72 @@
+/*
+ * Copyright © 2014 NVIDIA Corporation
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
+#ifndef TEGRA_DRM_TEST_H
+#define TEGRA_DRM_TEST_H
+
+#include <stdint.h>
+#include <stdlib.h>
+
+#include "xf86drmMode.h"
+
+struct drm_screen {
+    int fd;
+
+    unsigned int width;
+    unsigned int height;
+    unsigned int pitch;
+    unsigned int depth;
+    unsigned int bpp;
+
+    drmModeModeInfo mode;
+    uint32_t connector;
+    uint32_t old_fb;
+    uint32_t format;
+    uint32_t crtc;
+};
+
+struct drm_framebuffer {
+    unsigned int width;
+    unsigned int height;
+    unsigned int pitch;
+    uint32_t format;
+    uint32_t handle;
+    void *data;
+    int fd;
+};
+
+int drm_screen_open(struct drm_screen **screenp, int fd);
+int drm_screen_close(struct drm_screen *screen);
+int drm_screen_set_framebuffer(struct drm_screen *screen,
+                               struct drm_framebuffer *fb);
+
+int drm_framebuffer_new(struct drm_framebuffer **fbp,
+                        struct drm_screen *screen, uint32_t handle,
+                        unsigned int width, unsigned int height,
+                        unsigned int pitch, uint32_t format,
+                        void *data);
+int drm_framebuffer_free(struct drm_framebuffer *fb);
+
+int drm_open(const char *path);
+void drm_close(int fd);
+
+#endif
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index fbf4e6d8d4a3..3ac9015fbed8 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -20,6 +20,13 @@
 
 inc_tegra = include_directories('../../tegra')
 
+libdrm_test = static_library(
+  'drm-test',
+  [files('drm-test.c', 'drm-test.h'), config_file ],
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  link_with : libdrm,
+)
+
 openclose = executable(
   'tegra-openclose',
   files('openclose.c'),
-- 
2.32.0

