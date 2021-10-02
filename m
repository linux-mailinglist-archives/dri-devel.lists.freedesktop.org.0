Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9EB41FCD6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 17:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480FE6F4AE;
	Sat,  2 Oct 2021 15:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B716E850
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 15:45:59 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id r16so11902432qtw.11
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezMr2w2ZTkQq7+S7EIPWLLppt85Jku/rY0PIAocDono=;
 b=UcvZi5N1QymT64iJW0mkbdAr/acdxd7hIzM21SbSpWGnMdl001xCySFRTuwt/11QHl
 Rlr8JHjYqyAViJ9VSKZHmSB8NxTmP779415WTUGQn5AEZ5JcOqpHbVNSgePZqb9UFJa2
 ZYLdEbjURmKu2iMubis9YfNiRnq91A4eOMvk1NEpf23j8vhdIH1l0Oj8Q6ePu2xubrzZ
 cnwkv1J3WWMBqAt0IWgj+/B8NKgdcr3pAxZYiucJzi1BUd/E/Y/GCrnNo4QOiMfNglj9
 VaR5z8jCdhxo6/byaG9494HHOp5jRVPN2tbgkHNEKXzNp8pT02rk/J35tfMfhEA9Cqsr
 iZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezMr2w2ZTkQq7+S7EIPWLLppt85Jku/rY0PIAocDono=;
 b=U//da6ONMmnw3rfa8tKhQBnRFjyZb0a9Mx87jm2O5osdvCCmd8CAwXq5ax6kx0wdQn
 aEmUAeMg66QC4psKMDHL4bKLbgtISVTDsye7+2NDhYQSqUm8ZbmAp7bqQcFZZlMebgeu
 3mryWjD/6VR/3LcTb3Wn0Llhh1EwCIKmi0oLd5DZPTMEFUppc9+PZJ6vKFPZrONEuJ2S
 4lZqkKL9uAStuLvg366xS3Rw2R17YG8jWcBOOvMNfA6ADXas9NMZSUUtrypoyDFak3Bs
 KOo2oPXwaXa88LWCAgiSM2SAr5smSw4Zwor44iFePFdBnb07stW/xmhuenokoZeI54Lf
 59MQ==
X-Gm-Message-State: AOAM533MFpFgE5FYwnA8t44jIcXK1JY2M2epeICM5Dgxg7+ADioMBd5w
 a2jCtX4s7jxsnxFAsntjVlvu8RLpMec/DQ==
X-Google-Smtp-Source: ABdhPJxc1Krs3tV5A4zZMl53j7wmUJh6nWC4/Dwv4BicUeuDeNFlOJGVNLkyiPNjHPKJcpvs29CfLw==
X-Received: by 2002:aed:2791:: with SMTP id a17mr4159427qtd.193.1633189558269; 
 Sat, 02 Oct 2021 08:45:58 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 18sm5710949qtz.49.2021.10.02.08.45.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 08:45:58 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Subject: [PATCH 11/16] Revert "drm/tegra: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()"
Date: Sat,  2 Oct 2021 11:45:37 -0400
Message-Id: <20211002154542.15800-11-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211002154542.15800-1-sean@poorly.run>
References: <20211002154542.15800-1-sean@poorly.run>
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

From: Sean Paul <seanpaul@chromium.org>

This reverts commit a2cd9947d99b54c959fce20dc19d81af53f4674e.

This patchset breaks on intel platforms and was previously NACK'd by
Ville.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fernando Ramos <greenfoo@u92.eu>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/tegra/dsi.c  |  6 ++----
 drivers/gpu/drm/tegra/hdmi.c |  6 ++----
 drivers/gpu/drm/tegra/sor.c  | 11 ++++-------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 28050c188c1c..f46d377f0c30 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -23,7 +23,6 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -203,11 +202,10 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	struct tegra_dsi *dsi = node->info_ent->data;
 	struct drm_crtc *crtc = dsi->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
-	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
+	drm_modeset_lock_all(drm);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -222,7 +220,7 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
+	drm_modeset_unlock_all(drm);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index a62de7f92414..e5d2a4026028 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -22,7 +22,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_drv.h>
 
 #include "hda.h"
 #include "hdmi.h"
@@ -1032,11 +1031,10 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	struct tegra_hdmi *hdmi = node->info_ent->data;
 	struct drm_crtc *crtc = hdmi->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
-	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
+	drm_modeset_lock_all(drm);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1051,7 +1049,7 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
+	drm_modeset_unlock_all(drm);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 3d1c8b3d1358..0ea320c1092b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -23,7 +23,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/drm_drv.h>
 
 #include "dc.h"
 #include "dp.h"
@@ -1491,11 +1490,10 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
-	struct drm_modeset_acquire_ctx ctx;
 	int err = 0;
 	u32 value;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
+	drm_modeset_lock_all(drm);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1524,7 +1522,7 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	seq_printf(s, "%08x\n", value);
 
 unlock:
-	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
+	drm_modeset_unlock_all(drm);
 	return err;
 }
 
@@ -1654,11 +1652,10 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
-	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
+	drm_modeset_lock_all(drm);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1673,7 +1670,7 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
+	drm_modeset_unlock_all(drm);
 	return err;
 }
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

