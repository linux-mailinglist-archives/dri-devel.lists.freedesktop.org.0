Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068942CBA4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DA16EB24;
	Wed, 13 Oct 2021 20:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E146EB23;
 Wed, 13 Oct 2021 20:49:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D8913581178;
 Wed, 13 Oct 2021 16:49:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 13 Oct 2021 16:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1GQDtrRIicUub
 XM4IWgOJW9q6Bt3kzDCmFE/H911f9o=; b=X3XvcuQLO6/iEs0vtpvScF/DMfPNl
 kna4Ix6PvsNbV19cL87zvfzMqH2KgG3lxpQWhSolJotcNaqVbFoOFfPmGHPASYVI
 okBDs9zDrJOs4gIx25Z/yZZM+tTGgOlaHs8AkW7ZaNVfmkD4u//WFjij8wO6mCJx
 TNpsmfrd6CrWE1kjF6okGI4czyF+PyKeQyENUJWZLrEwGCjnBeoMd8j22NrzIBZV
 Z8MYyvzxC24XZktBuGtD8KITxNs+2/Ig45OtP9qnrBg+iBDLiYeQ/QJ9tSQqne3W
 vYLUrDafsfho/kyr9db1WS7R/MDwm7iderc3Qqvczrrrti6dUqzmLXsyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1GQDtrRIicUubXM4IWgOJW9q6Bt3kzDCmFE/H911f9o=; b=LxN8ObR0
 iQ9glnzWet8sGca9TB66AecyeQBL/uTIWdGYwJebfFqlGZVujO4PlhJQaGngJVAf
 zWEFkb7BYYiP9oyXlxCm60BBBt/JSB86ZEqgdzz+Oddx6AM0rp9Qiu4rJjvqNoTF
 6ORaiQrQj0nUPBd+z0PEnL/ECaruJJcyKPXsz0QvymlHUaG00PKOliNk7uj65D1h
 zIqgmC9VmFksjRWPNVPYR40w3CiozziflI/WpBCK1zWDdj9w8SO8u3M2wYgHEnXb
 1yaTMQAUeGb8OU4E7UVNRtFpxxz+ex55B3VEyE5d2upu7v6AAR7ZcoUDCzZGAeuG
 XPOSEMzkdnvVnw==
X-ME-Sender: <xms:RkZnYVU0o5tFIkgYA6r0RbwXjxhn860fXEwpNwCtUcXioKjvMHiHdQ>
 <xme:RkZnYVnC0yHt-d7G8ItGIZ-2JKf0qcDPbnTMb0D92AGxrBNQsB6RnD_WKE5xRV1QE
 VF4J2j6RUt-efKf3g>
X-ME-Received: <xmr:RkZnYRYOMveaJxSLZM4lAkuNCLvQBstrM1pVKE7fbIW2KAcLK-qnX3GqvJQ-roTIGqRl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:RkZnYYUvI44Ufog4bhdJ_nmAYymx4QuieJMICxlC4U_w2-_g2D-osA>
 <xmx:RkZnYfl9jIJUTUsU3adWeBOpB3Bvpp266iDzNNya9UYDuujIj72f4Q>
 <xmx:RkZnYVf1cV-8TQm1KA3yzfTfANvUrOPTjOnwQpePtVS3tmKGNBonYA>
 <xmx:RkZnYYg7p-KkpJeBdoCbAlGT1FUfsMevHAOUZ6fnVYI-uWxbMMfGHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:08 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v4 06/20] drm/tegra: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Wed, 13 Oct 2021 22:48:32 +0200
Message-Id: <20211013204846.90026-7-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
MIME-Version: 1.0
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/tegra/dsi.c  |  6 ++++--
 drivers/gpu/drm/tegra/hdmi.c |  6 ++++--
 drivers/gpu/drm/tegra/sor.c  | 11 +++++++----
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f46d377f0c30..28050c188c1c 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -23,6 +23,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -202,10 +203,11 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	struct tegra_dsi *dsi = node->info_ent->data;
 	struct drm_crtc *crtc = dsi->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -220,7 +222,7 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..a62de7f92414 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_drv.h>
 
 #include "hda.h"
 #include "hdmi.h"
@@ -1031,10 +1032,11 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	struct tegra_hdmi *hdmi = node->info_ent->data;
 	struct drm_crtc *crtc = hdmi->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1049,7 +1051,7 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..3d1c8b3d1358 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -23,6 +23,7 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "dp.h"
@@ -1490,10 +1491,11 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	int err = 0;
 	u32 value;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1522,7 +1524,7 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	seq_printf(s, "%08x\n", value);
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
@@ -1652,10 +1654,11 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1670,7 +1673,7 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
-- 
2.33.0

