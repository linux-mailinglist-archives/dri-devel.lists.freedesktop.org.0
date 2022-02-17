Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B59B4BA9A0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BAE10E6C6;
	Thu, 17 Feb 2022 19:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1DE10E6B9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:20:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cm8so1805956edb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0CBUKTu9jvdnKAxoRqrP7A+K60SFKzC6qVq1NHT6MU=;
 b=OifxYkL6sXL6jA5oH0esrqBFzHKTnl/nJWzn9j+dv1g127c+rL05F0EstvTRUDfUNJ
 NGbbrUBcj1/ARTA5eAKYv5mKA6c/h+dPvyyD3ILndAl2AAKDxC9FeU+I3lWIi8bR4Aoz
 Dl5hHhqVR8fei764wUH9JmHSr6NP5hGQlCiR2fapcYy7zszzpxNWoFxkMbykMil2Ela5
 UMzppQhgQy0pEt7pvmmttPyLb0poGgOGyMPpNInRRElfQINTzSi04pI3vhRSNw77Te0R
 n4oFxwDIgau1kwjyQ5WXMCrGTErUCwqjteE3z7/RobvLKoKqw2ntM+drciv2GOgxv9FL
 RckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0CBUKTu9jvdnKAxoRqrP7A+K60SFKzC6qVq1NHT6MU=;
 b=dYFe+GyWnCM2NxrrHPnugd6Vc52QphJKMJTf4AArSVXU2lgU8R3HOlJWPI1xcMBGCQ
 WY89SON+Ck9ZadrWBlI50FUt66+9kzTfZtv3P79+798OEOeXNMiqwMAyj7kbXnLz6ulB
 pR74GeMA7OAvosfmMA8Hy20wkhqINMuVBEHZBSszh3OU2OVfbEcds1KUcwhLXU4getAY
 9jJO4cCGVHVzz/wiQbNk23LW9jw5DHEihUPmaZOf1XOSE3RbSS+cYhXzYOm6d4XUotDC
 yA8qsW3uZUk1iTOW+5DgG8CDhYWnby8Y0UORH8+IHpHqIaiVWYQuBTmJaj0q7O4wBwm9
 xy0Q==
X-Gm-Message-State: AOAM532RnCBo2qxJZF5Y8ZH0sUyUfW7UjnuJPn2YR2oOYpzNWYcvLf5e
 j95qDtwEO9B2UgYpBnbtkAUHG2ez/Dk=
X-Google-Smtp-Source: ABdhPJzzrX84zZCB+NwRoB50YxXfr9TKCbe5TFljOYBoRkFW84B3tuenocPsQmy3TwiqCuD2RawOpg==
X-Received: by 2002:a05:6402:f04:b0:410:f0a5:5b02 with SMTP id
 i4-20020a0564020f0400b00410f0a55b02mr4410620eda.209.1645125642577; 
 Thu, 17 Feb 2022 11:20:42 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id 22sm1472267eja.165.2022.02.17.11.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:20:41 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 14/25] tests: tegra: Add helper library for tests
Date: Thu, 17 Feb 2022 20:19:20 +0100
Message-Id: <20220217191931.2534836-9-thierry.reding@gmail.com>
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
2.35.1

