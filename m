Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB554BA9B4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB56A10E710;
	Thu, 17 Feb 2022 19:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A9710E710
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:22:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w3so11463038edu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0e3VJ0bS12JJ8JkG0rtjJHWWTbEehg0Nr+IkUkHMC8=;
 b=GMik/6fCXgjyX9ftT57GCPA3ldu3Xnr6TksIaE8B5fsj8AH8lf9tL7yigq0UVvhtQl
 qjodrBTwlvSeE0Y6YHnmVaACZMZLJmxRolUmlvx0IJ7av6m004LIQJNQqkl4KetiBxlM
 FYrESBXnJRJcwMb5UCf08BCovpSgrtC7esTd8FWDLHF6gyp1YcujBVVbV8EW3zfsLpE6
 L2KidxZNn3tCy7xY33LHETiSrZcn7eEnWQvsXyfCzpaxEaj4WTikhcH9b45YzMkWiZ9M
 S/cUKOs2YnIZvt+POrGHL5y3B+BBH08w9D/nRVuEBfPE6f5uPISLBpnpwOrBDoJ4Jx12
 0D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0e3VJ0bS12JJ8JkG0rtjJHWWTbEehg0Nr+IkUkHMC8=;
 b=j14SiHkdG/gceU2bwxiaCXBBG9z7pG4Et018iHjhcnfTxSydnldvTilh70rnRmuScc
 lcO5//3kPPQiWEhY8R5hMZ9xV8kunxdn/t5PCfcfMq1UvlAVwmJYkt0hWG9bZfprKFce
 BgVCz5G+Z2t1j04EdPNli/FcP+qJBLO95BDHgaLnTsUPM8+L3jbAq2vBAyNYPBIU0d35
 7fI7paVV6LZwPQ1z3Si+h5P5x5TMrJuZGuWaobxFT6MVTtSV7tsnHFCsJj/Iq5ZIx11P
 gOXDls5uzlFuCDd8pDZcmtcqrFvSR1uZLTsHqICBu+yeOxerpLQPkDf7UgIf8CcAQthm
 YtsQ==
X-Gm-Message-State: AOAM533TW58+sYfYD+3odajrPp4IhII2ooLFmxj+LVGVJGl8sS5tNoW0
 5zGcn9Gw+zDMRYYuP901b+k=
X-Google-Smtp-Source: ABdhPJxU892lGYgPUi2T0/gdWx0X4JhVGmTmdh0ClJvG/Kpx95ZQG5qZZtbrvI9nh6F3StwPHelzWA==
X-Received: by 2002:a05:6402:42ca:b0:408:ed7:b011 with SMTP id
 i10-20020a05640242ca00b004080ed7b011mr4208022edc.6.1645125768597; 
 Thu, 17 Feb 2022 11:22:48 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id d25sm1490580ejz.4.2022.02.17.11.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:22:47 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 25/25] tests: tegra: Add VIC flip test
Date: Thu, 17 Feb 2022 20:19:31 +0100
Message-Id: <20220217191931.2534836-20-thierry.reding@gmail.com>
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

This test will attempt to use the VIC to blit one surface to another
and perform a vertical flip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/meson.build |   9 ++
 tests/tegra/vic-flip.c  | 333 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 342 insertions(+)
 create mode 100644 tests/tegra/vic-flip.c

diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 3cccbf64ecf4..26a32e868593 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -100,3 +100,12 @@ vic_blit = executable(
   link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
   install : with_install_tests,
 )
+
+vic_flip = executable(
+  'tegra-vic-flip',
+  files('vic-flip.c'),
+  include_directories : [inc_root, inc_drm, inc_tegra],
+  c_args : libdrm_c_args,
+  link_with : [libdrm, libdrm_tegra, libdrm_test, libdrm_test_tegra],
+  install : with_install_tests,
+)
diff --git a/tests/tegra/vic-flip.c b/tests/tegra/vic-flip.c
new file mode 100644
index 000000000000..e94336be1697
--- /dev/null
+++ b/tests/tegra/vic-flip.c
@@ -0,0 +1,333 @@
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
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "tegra.h"
+
+#include "host1x.h"
+#include "vic.h"
+
+/* clear output image to red */
+static int clear(struct vic *vic, struct drm_tegra_channel *channel,
+                 struct vic_image *output)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
+
+    err = drm_tegra_job_new(channel, &job);
+    if (err < 0) {
+        fprintf(stderr, "failed to create job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0) {
+        fprintf(stderr, "failed to create push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic_clear(vic, output, 1023, 0, 0, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+/* fill bottom half of image to blue */
+static int fill(struct vic *vic, struct drm_tegra_channel *channel,
+                struct vic_image *output)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
+
+    err = drm_tegra_job_new(channel, &job);
+    if (err < 0) {
+        fprintf(stderr, "failed to create job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0) {
+        fprintf(stderr, "failed to create push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->fill(vic, output, 0, output->height / 2, output->width - 1,
+                         output->height - 1, 0, 0, 1023, 1023);
+    if (err < 0) {
+        fprintf(stderr, "failed ot fill surface: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, NULL, 0);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+/* flip image vertically */
+static int flip(struct vic *vic, struct drm_tegra_channel *channel,
+                struct vic_image *output, struct vic_image *input)
+{
+    struct drm_tegra_pushbuf *pushbuf;
+    struct drm_tegra_job *job;
+    uint32_t *ptr;
+    int err;
+
+    err = drm_tegra_job_new(channel, &job);
+    if (err < 0) {
+        fprintf(stderr, "failed to create job: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_job_get_pushbuf(job, &pushbuf);
+    if (err < 0) {
+        fprintf(stderr, "failed to create push buffer: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = drm_tegra_pushbuf_begin(pushbuf, 32, &ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to prepare push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->flip(vic, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to flip: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = vic->ops->execute(vic, pushbuf, &ptr, output, &input, 1);
+    if (err < 0) {
+        fprintf(stderr, "failed to execute operation: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_sync_cond(pushbuf, &ptr, vic->syncpt,
+                                      DRM_TEGRA_SYNC_COND_OP_DONE);
+    if (err < 0) {
+        fprintf(stderr, "failed to push syncpoint: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_pushbuf_end(pushbuf, ptr);
+    if (err < 0) {
+        fprintf(stderr, "failed to update push buffer: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_submit(job, NULL);
+    if (err < 0) {
+        fprintf(stderr, "failed to submit job: %s\n", strerror(-err));
+        return err;
+    }
+
+    err = drm_tegra_job_wait(job, 1000000000);
+    if (err < 0) {
+        fprintf(stderr, "failed to wait for job: %s\n", strerror(-err));
+        return err;
+    }
+
+    drm_tegra_job_free(job);
+
+    return 0;
+}
+
+int main(int argc, char *argv[])
+{
+    const unsigned int format = VIC_PIXEL_FORMAT_A8R8G8B8;
+    const unsigned int kind = VIC_BLK_KIND_PITCH;
+    const unsigned int width = 16, height = 16;
+    const char *device = "/dev/dri/renderD128";
+    struct drm_tegra_channel *channel;
+    struct vic_image *input, *output;
+    struct drm_tegra *drm;
+    unsigned int version;
+    struct vic *vic;
+    int fd, err;
+
+    if (argc > 1)
+        device = argv[1];
+
+    fd = open(device, O_RDWR);
+    if (fd < 0) {
+        fprintf(stderr, "open() failed: %s\n", strerror(errno));
+        return 1;
+    }
+
+    err = drm_tegra_new(fd, &drm);
+    if (err < 0) {
+        fprintf(stderr, "failed to open Tegra device: %s\n", strerror(-err));
+        close(fd);
+        return 1;
+    }
+
+    err = drm_tegra_channel_open(drm, DRM_TEGRA_VIC, &channel);
+    if (err < 0) {
+        fprintf(stderr, "failed to open channel to VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    version = drm_tegra_channel_get_version(channel);
+    printf("version: %08x\n", version);
+
+    err = vic_new(drm, channel, &vic);
+    if (err < 0) {
+        fprintf(stderr, "failed to create VIC: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = vic_image_new(vic, width, height, format, kind, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                        &input);
+    if (err < 0) {
+        fprintf(stderr, "failed to create input image: %d\n", err);
+        return 1;
+    }
+
+    err = vic_image_new(vic, width, height, format, kind, DRM_TEGRA_CHANNEL_MAP_READ_WRITE,
+                        &output);
+    if (err < 0) {
+        fprintf(stderr, "failed to create output image: %d\n", err);
+        return 1;
+    }
+
+    err = clear(vic, channel, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to clear image: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = fill(vic, channel, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to fill rectangle: %s\n", strerror(-err));
+        return 1;
+    }
+
+    err = flip(vic, channel, output, input);
+    if (err < 0) {
+        fprintf(stderr, "failed to flip image: %s\n", strerror(-err));
+        return 1;
+    }
+
+    printf("input: %ux%u\n", input->width, input->height);
+    vic_image_dump(input, stdout);
+
+    printf("output: %ux%u\n", output->width, output->height);
+    vic_image_dump(output, stdout);
+
+    vic_image_free(output);
+    vic_image_free(input);
+
+    vic_free(vic);
+    drm_tegra_channel_close(channel);
+    drm_tegra_close(drm);
+    close(fd);
+
+    return 0;
+}
-- 
2.35.1

