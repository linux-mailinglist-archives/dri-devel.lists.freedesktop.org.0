Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361DA94E9E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 11:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77EB10E06B;
	Mon, 21 Apr 2025 09:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T8wkcWyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88110E357
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:59:17 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so2882091b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745225957; x=1745830757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJt22UoxXb5se2qcHLgjOMoqAZDai1RFkWwTDCGzVRA=;
 b=T8wkcWyUYsE/H2wKH80uLRQPiZg3lDrnu1TbN72fsPOVK7p5mHJends4FzUUhGQCsK
 pNAFNhdMNjZqL1yvKo/8/BEUEh+tU/M5m413PNbhpnl01shsAUSp79FB6BJKb7nm/ofW
 r867H++Nfv4eKoQ+lM1eo8Su7heUUYTxmO4k85t4mCt5Y6NQxOka87LFO6L1rjawQnB0
 oSshVqdDXbeRT4/Nrrwt3d0Qu3C4oiSth9hWH8HSy0lfqJWHdRtlG0rIRJyzjbu8tgLq
 Dhqf7+GVCk3kS/bqRKGb3VXnuII0631K91tZ/4bjP02Skl/kuu0VwCQx7THKzpPi9R7N
 ippw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745225957; x=1745830757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJt22UoxXb5se2qcHLgjOMoqAZDai1RFkWwTDCGzVRA=;
 b=CCvWdRnrtHCSKu7ctPpY2WVWb8a2PQtqbhNtDv4OTryKFuZbTMXRb6KkhW7iJ2LuTY
 i0IAYuJMNgQJNClPI+fHLIh1VvWGzxymKLJAaFQuS2wM3H/eQBl09RBNDO49trMBiC/G
 pTru2IuHfFJawIq8MjDbkmO4UbLZQdBPr02b0ZdPQzEJ2ag0s1TVJ3SonasxH2yROW9K
 GzzGW48gU4sL2VPlI7KTJEMgRDLdqc1A43Ttr1jLkxWFKZXV26HRacAfmD4wu7Sylh/J
 sYeaEQI8TZgqT85Iy14X/Ur7jJETjY9DAqGrFq1i/tdpoayg+xVFLsXPhjeiI9MnADH2
 vB5w==
X-Gm-Message-State: AOJu0Yy5ZpFKA8ZFTHgquVxu0vbXS57NTF8Gx7erJT/d6yoCgTZj7CEq
 T4kh0bv5gn5yKG+SuY0jn/7xafnhwHWgvw5etTgxkasDh/eayvlgNA4PVjZ6
X-Gm-Gg: ASbGncvGbsA7h/FjufG8uG0z635k8kx8/87x7cDh1ZUGe+liFUT5nRTisAsW3UEkP40
 Zcwtlxt1x4z525BJqFoH8sMa7BeIH+s23vklYKxzVLnBvsqSAZifM6vLH2muadXyBRfPsZJDMzX
 +9B3DgbtMEolLRK9SA8G5NITpx3ITmau6xl2YsLM+x51x5v1F0BDxlSUqr1s0afShDM5Xv1vcFS
 Z2ilEFGzU0pYC0LLkLhtQgvSQ+dKY1W7kMwi91RXlRPJSJy1jh+RtOqo8C6nbea8cBsJsgsulbX
 Yo9JfJJi4brs00vZPXO+A6XP5IMs6xB8bo1yrqnOEjc1zZgceevsMYuw4zg=
X-Google-Smtp-Source: AGHT+IH5Wf2H5/XfeVWo/gM8JBViwj+Bhcr0UREOSEQDI8YTwTqKmFyv0rFYQoa0bheieT8p1RmNfw==
X-Received: by 2002:a05:6a00:18a5:b0:736:4110:5579 with SMTP id
 d2e1a72fcca58-73dc14537f0mr14483327b3a.2.1745225957159; 
 Mon, 21 Apr 2025 01:59:17 -0700 (PDT)
Received: from localhost.localdomain ([115.99.204.184])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8beb0dsm6082879b3a.33.2025.04.21.01.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 01:59:16 -0700 (PDT)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, mcanal@igalia.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jagathjog1996@gmail.com
Subject: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs,
 drop drm_minor and .debugfs_init
Date: Mon, 21 Apr 2025 14:29:07 +0530
Message-Id: <20250421085907.24972-2-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250421085907.24972-1-jagathjog1996@gmail.com>
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Apr 2025 09:27:07 +0000
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

Refactor to use drm_device.debugfs_root instead of drm_minor for
debugfs file creation. The driver can now initialize debugfs directly
in probe(), before drm_dev_register(). This also removes the use of
.debugfs_init callback.

Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
 drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
 include/drm/drm_mipi_dbi.h            | 4 ++--
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 89e05a5bed1d..66f292c48a78 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -1488,17 +1488,17 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
  *
  * This function creates a 'command' debugfs file for sending commands to the
  * controller or getting the read command values.
- * Drivers can use this as their &drm_driver->debugfs_init callback.
+ * Drivers can call this function before registering their device to drm.
  *
  */
-void mipi_dbi_debugfs_init(struct drm_minor *minor)
+void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
 	umode_t mode = S_IFREG | S_IWUSR;
 
 	if (dbidev->dbi.read_commands)
 		mode |= S_IRUGO;
-	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
+
+	debugfs_create_file("command", mode, dbidev->drm.debugfs_root, dbidev,
 			    &mipi_dbi_debugfs_command_fops);
 }
 EXPORT_SYMBOL(mipi_dbi_debugfs_init);
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 62cadf5e033d..351d2a5b9f27 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -115,7 +115,6 @@ static struct drm_driver ili9163_driver = {
 	.fops			= &ili9163_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
 	DRM_FBDEV_DMA_DRIVER_OPS,
-	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "ili9163",
 	.desc			= "Ilitek ILI9163",
 	.major			= 1,
@@ -182,6 +181,8 @@ static int ili9163_probe(struct spi_device *spi)
 
 	drm_mode_config_reset(drm);
 
+	mipi_dbi_debugfs_init(dbidev);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 0460ecaef4bd..94466dd8db9f 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -267,7 +267,6 @@ static const struct drm_driver panel_mipi_dbi_driver = {
 	.fops			= &panel_mipi_dbi_fops,
 	DRM_GEM_DMA_DRIVER_OPS_VMAP,
 	DRM_FBDEV_DMA_DRIVER_OPS,
-	.debugfs_init		= mipi_dbi_debugfs_init,
 	.name			= "panel-mipi-dbi",
 	.desc			= "MIPI DBI compatible display panel",
 	.major			= 1,
@@ -384,6 +383,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 
 	drm_mode_config_reset(drm);
 
+	mipi_dbi_debugfs_init(dbidev);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index f45f9612c0bc..88a9c87a1e99 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -230,9 +230,9 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 })
 
 #ifdef CONFIG_DEBUG_FS
-void mipi_dbi_debugfs_init(struct drm_minor *minor);
+void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev);
 #else
-static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
+static inline void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev) {}
 #endif
 
 /**
-- 
2.20.1

