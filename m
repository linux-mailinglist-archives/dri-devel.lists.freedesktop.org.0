Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F2425BDD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4A6F3A8;
	Thu,  7 Oct 2021 19:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A1A6F4BD;
 Thu,  7 Oct 2021 19:38:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 48A652B009FD;
 Thu,  7 Oct 2021 15:38:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=1GQDtrRIicUub
 XM4IWgOJW9q6Bt3kzDCmFE/H911f9o=; b=pStEJrOOWmHDhJgM8JC9SBAKFaRc2
 7mkkSY4/o9davZ+EbuOmbmmMTqzNxLFdTuQwpRPAffqP1+lz0FXWIkPTcwQDQlgO
 TOpes5xUfFuZJAkSJDI0liCd2GrqVT8n/nJeyKZxetGHy+Hyq+1aYyU3NTySx23J
 UQWGDVa+f9/gsmuMqYtrMUKqGpsXMDsII1JcRD4BAr0uO4M2QxqLzvoo9bpfhGpv
 tRLog8wghdYeJlB+9jER76b+ggM9hsASMzt70TFbvbkqZOUwjULyjKvw/dHhoq3Z
 wW7lBJMtEDrKVMCFtP/9rnTZDur5T1Yq70q0ejnn+4pINXcN8RA1bUryQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=1GQDtrRIicUubXM4IWgOJW9q6Bt3kzDCmFE/H911f9o=; b=Q0c4DddP
 OU+OBGarBfwujOfxfHz3kVBLIGkl5pATwpKEkAPPWDSVWCwkArKTWl36GBe/seOQ
 Hiev5HVJLwGFyTcFLh/qrf86R+bw4Vvu1JdG1wmdJVAuVg6jLI6I0n+y+7u1LmW9
 7MXXwCxlUyThwx94l51o+l6yyMHD8zyWNxAQL88KbRAU55xKVcOoKY04IJ5L1Tt9
 TG9XKHc5ZZauk7GFvzuIySwmWJfOnzg11ga7dT7Fy1qFLA5Afk/sE1EskbFLcMfs
 /3xPLDc9rNYQbfDRKlUjuSu5w4RBVdI8LrLwCI3Q451Zv24U8Qzgrt8pq6GMdMw5
 mVRzB0Fg4iJeNg==
X-ME-Sender: <xms:s0xfYXCN19Mua9JVFD3Kw6I5pFJXcovVBEPQ6jiJpnr0-O9pvbx35g>
 <xme:s0xfYdj0D6dWXFZcAqhkdxW3FvjU52VaZJhMCMh7rEW3DKg7cKE4KOIZIKrbdq_75
 vnWWxc1uPuDtKtZsw>
X-ME-Received: <xmr:s0xfYSmoRXYovZvPm4FxadmWtfRtMbF47PMVDJeLR3TmfzNHLWbWd2-RVCahhLaXLRMN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:s0xfYZzbbMk7TnlmRGOuEYHoC4IohbeRlB2vfYvfAKwr16zVYQCbpw>
 <xmx:s0xfYcRtu4jsDqLRaDi2Ttc3pzoY_Q2NvLKWjkU7k0CzgWgTXKJa-A>
 <xmx:s0xfYcZwAkZNc9BLKsnV9F4R5zAvjSSaZ5T8J2mifjBdwqI1aLagCQ>
 <xmx:s0xfYV8bIB4bPvJ0Zcq0odhOivU8J8Hjus-TRpQ7Yb6pItl-tkoojAcV9Lc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:24 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 06/20] drm/tegra: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Date: Thu,  7 Oct 2021 21:37:41 +0200
Message-Id: <20211007193755.29579-7-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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

