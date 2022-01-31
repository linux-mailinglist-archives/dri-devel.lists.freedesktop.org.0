Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50AE4A4CA3
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 18:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074089FDB;
	Mon, 31 Jan 2022 17:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283D89FDB
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 17:00:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f10so1679023lfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 09:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fE3ECNf001fTkykiAFzeh+dTOBrJ9rF5+nmO4lzI2vc=;
 b=R828+GbRL+FpSF6SNfwCZ6vqmU8ia/M0M7ZlwitaJWXXi/IgWGUz2H534OG3vwwZmR
 7dQSkoeBZ7yORS1JzIu0IZafUHsFHm9Z9py0/lcZhF7cWBabbsYgmU3wzIFnPDvbexv0
 JrV2Teo8I/p2Uqu1qWX8PuO/ss3fxqitOE3tuhfI4fJYlXb6ba8cWEroLdroAxevW4i+
 dNNZywP9CM/rKLGHdGBASqI6ISAvlxXYY8EmT9U5hTzLU/0WxINITEFul/4Km3agwQvc
 n9WU91+45mUTVK78//uelF5Ee9G8liuCXBj+sDrypzRp2iClQ/x9ym8xQaVLIFutJeSg
 +g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fE3ECNf001fTkykiAFzeh+dTOBrJ9rF5+nmO4lzI2vc=;
 b=koHSTBB1PIAJZ+4vENPT5+oA9VLjZ+nWkfFzjvOKwDXh7WJRJkU0PpA2D4mLaLh1tH
 BVPLDFZ9A9d4FSoW87ZlDZqkzF9NklFlwe8eQq0+EDandZtyLIQvIpjsmbgcsRueuy3W
 ViGzQfcvJsHRdb19dZh/6D5kNeb5mvfyw40ZXwYIae+SfMdTqM0PodpctT/7UJiQ/WTc
 wEDEWSTz2WjaroMVvGAe6RKcbaYlD/scU2RJdgjUAVTDEnIrfVOsZYkfjtL0+Ov++2wd
 nmVyR2hpLLwOrSxCUsIPH2mfsq8qqZJifJcrWpzDDp6bHT1cyA4uIaaB4crF5EwanXvz
 kX3Q==
X-Gm-Message-State: AOAM5336al6x86ERwS2EQSWlgmjjp7GQdVo306spdp6HxEi+9j+OFJQa
 uhMWFyUNO0NYpDJ6tEvDoLcRDw==
X-Google-Smtp-Source: ABdhPJybcLwdDVgdzcarM1Sr6ldL5ivbwFN8JuhK3JougbGwxnChCONUX5AjIRMr3ZS1+HUSlWKFJg==
X-Received: by 2002:a05:6512:ac3:: with SMTP id
 n3mr16148375lfu.274.1643648404419; 
 Mon, 31 Jan 2022 09:00:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q2sm3539045lfb.111.2022.01.31.09.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 09:00:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel/edp: make PANEL_EDP depend on DRM_KMS_HELPER
Date: Mon, 31 Jan 2022 20:00:03 +0300
Message-Id: <20220131170003.2118200-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

panel-edp calls into drm-kms-helper module (by calling
drm_panel_dp_aux_backlight), so it should depend on respective module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 434c2861bb40..b0d637669ee6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -104,6 +104,7 @@ config DRM_PANEL_EDP
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
+	depends on DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select DRM_DP_AUX_BUS
 	help
-- 
2.34.1

