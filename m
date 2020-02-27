Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB2171811
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993EC6ECB8;
	Thu, 27 Feb 2020 12:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A826EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:03:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f15so3238495wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMyHRnupYOweRXusdsPzOOaYHKBaQWgPr4VgAjx/YvA=;
 b=J26Ir02KepKBJUbXxXkkWJYVkP5vOgClZy+ask2wsbUGCXhEGHhsdjjBMp4pQeyL4v
 o+PockS+TMBNAj3bDRcefvZcTiGRv//s7LP6xY6F+VIkrxqhEpnYaMhZkScQ6ysjJ1kp
 Vp3lVS1t6hzYlLN9T4BABFFkiDQUghrhefzvXox7WxnQSf4ze69i0XCqKtlcRumUAyoS
 cxm0yHZKo9AnodukiroeL7uqp0p26ZtcPOC45KXNVKrfM5QZYTdTeqhPS3kn/oS4bWRg
 4AVKdsxNrNwlrkr8WIVIGkAi4/xGyozaKVgg9yaksEXPuNddWbur6TmFwvaUNFEe7IDF
 7mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMyHRnupYOweRXusdsPzOOaYHKBaQWgPr4VgAjx/YvA=;
 b=oOOHh/i122LgCwgyilVuG8DvS4Nw1VP7NIvBFzYU4xOPQ0Khs/yt3Kyl6QRMw1LaJz
 pzOqjeS51c8TT7utAHzTf9LxZ8hj4+ZCUNesYtAU/zeYRcRmqTOp12HWZ+Yd7pOS//dK
 VlYAu6O22mZUI2c6/UFYE8ntqT+ye4OPPzbrw3Qp1Xw0d8p/SKIYp1oNgwL+qryv5owc
 7piG/IcG0c1YZqVrPkb/AAu7aLlbQTFYH3nXjuPKBw8r7OEl9avFXe6FmiUw50XSpzJJ
 ZwRiRXBWo9C2Xa9TClYC75JwZH7e4LNyMUUWxCfMRt0kEGlUwDf/BnVLs8NQtFDOhAkP
 gwwQ==
X-Gm-Message-State: APjAAAXkuhTmckmGatQcVJraHsOZ9kqulm5MYWIxYgykLLxYJtRCKXJh
 tAvLf8WpOJ1hXWJGYNAg1uc=
X-Google-Smtp-Source: APXvYqznZ4u0tPG2uNCyuNN6BfskJAo0b9TRFN1GjptJ8HTDJvFgiy5ZFR47VHg554ltfojRoFkY5w==
X-Received: by 2002:a1c:108:: with SMTP id 8mr4988938wmb.30.1582805002941;
 Thu, 27 Feb 2020 04:03:22 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:03:22 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 10/21] drm/tegra: remove checks for debugfs functions return
 value
Date: Thu, 27 Feb 2020 15:02:21 +0300
Message-Id: <20200227120232.19413-11-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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
Cc: linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail) there is no need to check the
return value of drm_debugfs_create_files(). Therefore, remove the
return checks and error handling of the drm_debugfs_create_files()
function from various debugfs init functions in drm/tegra and have
them return 0 directly.

This change also includes removing the use of drm_debugfs_create_files
as a return value in tegra_debugfs_init() and have the function declared
as void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 11 +----------
 drivers/gpu/drm/tegra/drm.c  |  8 ++++----
 drivers/gpu/drm/tegra/dsi.c  | 11 +----------
 drivers/gpu/drm/tegra/hdmi.c | 11 +----------
 drivers/gpu/drm/tegra/sor.c  | 11 +----------
 5 files changed, 8 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a4c2..e70d58b21964 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1496,7 +1496,6 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	struct drm_minor *minor = crtc->dev->primary;
 	struct dentry *root;
 	struct tegra_dc *dc = to_tegra_dc(crtc);
-	int err;
 
 #ifdef CONFIG_DEBUG_FS
 	root = crtc->debugfs_entry;
@@ -1512,17 +1511,9 @@ static int tegra_dc_late_register(struct drm_crtc *crtc)
 	for (i = 0; i < count; i++)
 		dc->debugfs_files[i].data = dc;
 
-	err = drm_debugfs_create_files(dc->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(dc->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(dc->debugfs_files);
-	dc->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_dc_early_unregister(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index bd268028fb3d..d4f51b5c7ee5 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -839,11 +839,11 @@ static struct drm_info_list tegra_debugfs_list[] = {
 	{ "iova", tegra_debugfs_iova, 0 },
 };
 
-static int tegra_debugfs_init(struct drm_minor *minor)
+static void tegra_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(tegra_debugfs_list,
-					ARRAY_SIZE(tegra_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(tegra_debugfs_list,
+				 ARRAY_SIZE(tegra_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 88b9d64c77bf..30626fcf61eb 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -234,7 +234,6 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_dsi *dsi = to_dsi(output);
-	int err;
 
 	dsi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
@@ -244,17 +243,9 @@ static int tegra_dsi_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		dsi->debugfs_files[i].data = dsi;
 
-	err = drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(dsi->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(dsi->debugfs_files);
-	dsi->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_dsi_early_unregister(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..d7799d13d8ad 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1064,7 +1064,6 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_hdmi *hdmi = to_hdmi(output);
-	int err;
 
 	hdmi->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				      GFP_KERNEL);
@@ -1074,17 +1073,9 @@ static int tegra_hdmi_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		hdmi->debugfs_files[i].data = hdmi;
 
-	err = drm_debugfs_create_files(hdmi->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(hdmi->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(hdmi->debugfs_files);
-	hdmi->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_hdmi_early_unregister(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..47c1d133069a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1687,7 +1687,6 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root = connector->debugfs_entry;
 	struct tegra_sor *sor = to_sor(output);
-	int err;
 
 	sor->debugfs_files = kmemdup(debugfs_files, sizeof(debugfs_files),
 				     GFP_KERNEL);
@@ -1697,17 +1696,9 @@ static int tegra_sor_late_register(struct drm_connector *connector)
 	for (i = 0; i < count; i++)
 		sor->debugfs_files[i].data = sor;
 
-	err = drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
-	if (err < 0)
-		goto free;
+	drm_debugfs_create_files(sor->debugfs_files, count, root, minor);
 
 	return 0;
-
-free:
-	kfree(sor->debugfs_files);
-	sor->debugfs_files = NULL;
-
-	return err;
 }
 
 static void tegra_sor_early_unregister(struct drm_connector *connector)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
