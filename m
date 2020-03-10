Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA849180C77
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD696E8ED;
	Tue, 10 Mar 2020 23:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4384D89F5B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p2so15086327wrw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G149HR10JeFsH0MMHDPJ4uWLrRfOBJMgPlVLfjG9f5k=;
 b=Nw4rwu6aUJpGLWbL/FmdLWXay8R+N4E+Yd+oM/a/1JUyQ/3eLhcDQVpn5RpvOA+rWQ
 tQQNbixC7mjJaZs96APPYpAfhf3mPdj5BybhmS3c1vcmhxCdRMwzVOrmvIlZtevYnVly
 FN8ML5YKr04ARzKl2gM4bULFinfQm9XFPALiNCXABJYTxqWkTjdfWxGAjwjXWXcl3D3R
 IvPxtQWs8XAeXTN1Ai4MmVh2lOtSn3ksh+/vSL+PJtfUTPQJKTqAHx+oB+pvDinBiPY3
 6yMfrPCpR67fvb5xcO+guIf80KuBtQnUcQFGIjheAPACQqNVgxTlEblOpYsEUnQD5643
 oiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G149HR10JeFsH0MMHDPJ4uWLrRfOBJMgPlVLfjG9f5k=;
 b=nizNZZxGn0ZSx5C4HZwtUIS3HgcBFpJBZlpweif57+bavGkrx82thBk12lIp8L+Rbk
 qdLgVELjMIAoeTNgER9tIc/ud0df8l1Yn8dXjWovDNFMniDPFc8vxlClPcuFbuuMT3j4
 iAr9MAEcxiub3csXWG97NAckXEyozU8UPw3tHoFKAAbeJYV6zqXG32Oe0Da7nT3IQ0sL
 lp84A9OMbz2gAhbe9x/KRdLYW7l6o5asQZerI1ARzasx6tJZKn3YLbXOu6vh4vmVc5nU
 +EHqEYPizFLBCH0L2396Bjye0MFZahVjK7yQiE6nZJAVZwQ0f2cCXDtl50CHLZOZG/1E
 YVmQ==
X-Gm-Message-State: ANhLgQ08P2ZF02UH9qYRquT1E/IIRKpBXzF762oTBK/k2zNQdvti7dsz
 pjZKKAGLezUXAOwIxlPN/7s=
X-Google-Smtp-Source: ADFU+vtSPl822KtbbYb3HmqLrR+NNh2YHwYo2tqNxpGz1ftCSqNQ2O4HZyjzk9I9JZeYS6RK8V+MQg==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr17168712wre.270.1583847089918; 
 Tue, 10 Mar 2020 06:31:29 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:28 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 01/17] drm/tegra: remove checks for debugfs functions
 return value
Date: Tue, 10 Mar 2020 16:31:05 +0300
Message-Id: <20200310133121.27913-2-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

v2: remove conversion of tegra_debugfs_init() to void to avoid build
breakage.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 11 +----------
 drivers/gpu/drm/tegra/drm.c  |  7 ++++---
 drivers/gpu/drm/tegra/dsi.c  | 11 +----------
 drivers/gpu/drm/tegra/hdmi.c | 11 +----------
 drivers/gpu/drm/tegra/sor.c  | 11 +----------
 5 files changed, 8 insertions(+), 43 deletions(-)

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
index bd268028fb3d..6ec224f3d824 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -841,9 +841,10 @@ static struct drm_info_list tegra_debugfs_list[] = {
 
 static int tegra_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(tegra_debugfs_list,
-					ARRAY_SIZE(tegra_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(tegra_debugfs_list,
+				 ARRAY_SIZE(tegra_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
