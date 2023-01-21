Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5416768FE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293210E42F;
	Sat, 21 Jan 2023 20:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297AF10E403
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED1CD60BB9;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0AD0C433A7;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331673;
 bh=QsBx/GmBME9aZJLSputQS7mfn/Ytwy05Em6ZDCgDmL0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=tK8E0zsj0zhR25ajJmTY6T8j+8Xqud/jpnnn2h0G/Lr2+Pq0NvgYnskJN22p2Cpmh
 SDdGMzhyWQ1JrsRlEidYa+QMJnN5zRWyB/bbgyqCv77NtgZvu3ux2W9Jt609FXFZGZ
 OF0D5vOAiLZdniKfWGPrLlCAI4VBzku/KQnk0fS/JwXPGcW6LUdosp2pv3gMC0rEgy
 L89nSS0ybye/s5nNKSAdkjMo3MWi56AaZVA5eBYOPTDfUyiOoYQNv9EAnq2ZmP9VZn
 CPjAjQ/1dBnWfceLinsjdSZ4Xq1ugXeWfO5/Poz7Ot2JTVhG3Ilc+LdI7lJEBpg8RI
 nh68etoiltuOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B28FBC38142;
 Sat, 21 Jan 2023 20:07:53 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:08:54 +0100
Subject: [PATCH 76/86] drm/tiny: Direct include headers from drm_atomic_helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-76-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331667; l=3033;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=nQNnFeUadU6fhc/gsSOibAyq+eoBmyRxkXmgQPl6+HU=; =?utf-8?q?b=3DWXYOiy3n9cOg?=
 =?utf-8?q?OPtlZmiThz12bRhwpvZkLJ9L2JwAjhy0vUqOsroh3aL7q0jgEWjTFdS0YnZHcxYD?=
 3HgEm3jgB+0lKh5BrBZ3uYyMHB839MFGCtDe3d+LNQxfeLeBUO2t
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_atomic_helper, because drm_atomic_helper will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/tiny/arcpgu.c   | 2 ++
 drivers/gpu/drm/tiny/bochs.c    | 3 +++
 drivers/gpu/drm/tiny/gm12u320.c | 1 +
 drivers/gpu/drm/tiny/repaper.c  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 611bbee15071..e2b1af1aa974 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -17,6 +18,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 024346054c70..764d5c8b6ce0 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fbdev_generic.h>
@@ -13,6 +14,8 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index c5bb683e440c..68ae29cff259 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -23,6 +23,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c2677d081a7b..af339798b8ea 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -22,6 +22,7 @@
 #include <linux/thermal.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
@@ -33,6 +34,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_probe_helper.h>

-- 
2.34.1

