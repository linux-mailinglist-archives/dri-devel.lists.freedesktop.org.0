Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFC986C2A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 07:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E756E10EA8C;
	Thu, 26 Sep 2024 05:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="WyhWTGMG";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lLemQXQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AABE10EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1727330164; x=1758866164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bLzJtbfa2s5QAjm0ipC22hKl20Uv3y0q/Em4v3hXr0c=;
 b=WyhWTGMGBNSZfzI0FuaTY0Tozu5sfyqBPV/jg3xIQg0OlNJuCwQ2w7Yk
 7JnmItXEwOBm+JCn28pDCk/fP59ISUtBe6JWMrknwz6TneqR1bqeHRB88
 Nc3i7c60/MkzcjtAvY51RRPw7ZJ3injHuwWyc152NAJO2rxjTMluIjFsB
 cdWMDWCrfmsAijNoSSAB77jTeCiHBBMY7b7emKFTOiRzmJf89PALNikuw
 zM/ikFkpgQcNruh8zV5MXA8bes/ihQocQw/oQJ3xWqC76vVwwCS9HfbMg
 sBE2jAyDNxDlR/ipk1jcMAvTJ4vhURrVL1D52bKh5gRiqQo+BwD5ZFCw2 Q==;
X-CSE-ConnectionGUID: aU/ZGlV9RNKTAdhj5VL7+g==
X-CSE-MsgGUID: BALAbA55R4iTxhd71svacw==
X-IronPort-AV: E=Sophos;i="6.10,259,1719871200"; d="scan'208";a="39129818"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Sep 2024 07:56:03 +0200
X-CheckPoint: {66F4F773-16-B62731C4-FB8D8F8A}
X-MAIL-CPID: 0B3461EE8FD9AE5E753EA9A3C01306C1_3
X-Control-Analysis: str=0001.0A682F27.66F4F773.00E7, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F06CB160A3D; Thu, 26 Sep 2024 07:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1727330159; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=bLzJtbfa2s5QAjm0ipC22hKl20Uv3y0q/Em4v3hXr0c=;
 b=lLemQXQ3BMrZxixLXAaMhfzBGdx/uHDt++UGsHM032fL6xcM1L7iYRAtkO+4lAWvDG1Wtb
 158c7GQmzz9yvpCgrxTM9rxJdliCnTAtgapqi4+SiNpSd83+t06bNba79h/vVNAxZ8ALo0
 Ogv7LLiKOaVj7/ZNb1+tPVzoJAmvdAr1EXw9QwFiAMtJxkUnHqR25NuXZo6aWZ4FliSNVa
 bM0GggHKYRR/t2jWYhyNu8fyJv4cRRbG3QCYUTk7rlDc483CDuEk/TLc3slEcThQt2mS6d
 F6ebguRBQDuTsAfIGvzPXVwHeBuGzwhGzp+LMplDw69Cv5UsFiazLvnK5cziHQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Thu, 26 Sep 2024 07:55:51 +0200
Message-Id: <20240926055552.1632448-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
References: <20240926055552.1632448-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

The PIXCLK needs to be enabled in SCFG before accessing certain DCU
registers, or the access will hang. For simplicity, the PIXCLK is enabled
unconditionally, resulting in increased power consumption.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Add note about power consumption in commit message
* Add note about power consumption in comment
* Fix alignment

 drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 15 +++++++++++++++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 5ca71ef873259..c9ee98693b48a 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -8,6 +8,7 @@ config DRM_FSL_DCU
 	select DRM_PANEL
 	select REGMAP_MMIO
 	select VIDEOMODE_HELPERS
+	select MFD_SYSCON if SOC_LS1021A
 	help
 	  Choose this option if you have an Freescale DCU chipset.
 	  If M is selected the module will be called fsl-dcu-drm.
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index dd820f19482ad..63da55fe2eaf8 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -100,12 +100,27 @@ static void fsl_dcu_irq_uninstall(struct drm_device *dev)
 static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
+	struct regmap *scfg;
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
 	if (ret < 0)
 		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
+	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
+	if (PTR_ERR(scfg) != -ENODEV) {
+		/*
+		 * For simplicity, enable the PIXCLK unconditionally,
+		 * resulting in increased power consumption. Disabling
+		 * the clock in PM or on unload could be implemented as
+		 * a future improvement.
+		 */
+		ret = regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
+					 SCFG_PIXCLKCR_PXCEN);
+		if (ret < 0)
+			return dev_err_probe(dev->dev, ret, "failed to enable pixclk\n");
+	}
+
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to initialize vblank\n");
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
index e2049a0e8a92a..566396013c04a 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
@@ -160,6 +160,9 @@
 #define FSL_DCU_ARGB4444		12
 #define FSL_DCU_YUV422			14
 
+#define SCFG_PIXCLKCR			0x28
+#define SCFG_PIXCLKCR_PXCEN		BIT(31)
+
 #define VF610_LAYER_REG_NUM		9
 #define LS1021A_LAYER_REG_NUM		10
 
-- 
2.34.1

