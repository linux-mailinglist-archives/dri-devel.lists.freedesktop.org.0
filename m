Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964934003E6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 19:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188EC6E8B7;
	Fri,  3 Sep 2021 17:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5036E8B7;
 Fri,  3 Sep 2021 17:09:28 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id n18so6112709pgm.12;
 Fri, 03 Sep 2021 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oML9T4hNm8T0JbKhVIBMBwI7KEbiqjIJg/n4n2ZhuRU=;
 b=hprSMkscOds52ztZ0BN1ncqwRrMGErH4qUBwiBSGlOxjVqx/rLSVp+NTIbG9FxMkyA
 uEUKcOlUE2bBlIKnUckrrIDt861OR+pc3cJKAtAobVUIQDYaLRo8L/0SMaNcUPIlxrVo
 jpTDplN8FwdiUYy3eeOfR+s8TS//2Arsea/rY8Zx0XecOEz9xvYvfKHKYIs9UerkARnx
 rFbgDTKO/DoqsUvPokQmx8T1U9oaRWAM2mW2y1ctXFYzUd3+tyxZ7pYcZGq7u1agNY+J
 xYd3+Tn0QgcQs8jdC9MCogCZ10hT0iPX8ECgx6oqBUPc33HQXQGQCaYFCOtQXA1mWP4i
 RIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oML9T4hNm8T0JbKhVIBMBwI7KEbiqjIJg/n4n2ZhuRU=;
 b=sM4OvzUelyNeu+txWcQXmvy+StwclO4u7DXjxD13Mylk1jIc4/l5qvNyVS+wqhNpsV
 V6bTFyUhT3Hwyn0GEfb9D9AtrkbICW+sfR3F2HXw4Wa3ZmzyfYCCMcdK5tvPMfi5Vume
 Tiah4JauJA4NciUmBpNwrF/S04O3cH6nDZ7MU1CTo3gFgln/jHHYgatNSDS6B1CU0BMf
 kMtqc3BC6scSpxRT7au0szdJJBtiWVSYyyAPYSwo7AQ1BIPJ3guDQf2pTurRKBZEt7rt
 bLdfPaK0N4G+XbitKykB/LmDzyHsB13SfoU55KK5Y2l+gGRvaPXSz7Z6hHYhaLfTnOtT
 /9HA==
X-Gm-Message-State: AOAM533vrQn/mK5y9TRo1j7ISeuxKf4WNHniKXrAsCjUcdmdD09jxAkR
 xhIBZbyuctPahP9hmN4LyKE=
X-Google-Smtp-Source: ABdhPJzffmEzGJBQOIV01Wm1saidXbtMvwXfO7+MxwVKmd6kYopuUGSM5lHgrgqvCPH66IrCl7Sa0w==
X-Received: by 2002:a63:b707:: with SMTP id t7mr57341pgf.460.1630688967994;
 Fri, 03 Sep 2021 10:09:27 -0700 (PDT)
Received: from skynet-linux.local ([122.171.5.147])
 by smtp.googlemail.com with ESMTPSA id 130sm5905361pfy.175.2021.09.03.10.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:09:27 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Vladimir Lypak <vladimir.lypak@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sireesh Kodali <sireeshkodali1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/dsi: Add phy configuration for MSM8953
Date: Fri,  3 Sep 2021 22:38:43 +0530
Message-Id: <20210903170844.35694-3-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903170844.35694-1-sireeshkodali1@gmail.com>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
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

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add phy configuration for 14nm dsi phy found on MSM8953 SoC. Only
difference from existing configurations are io_start addresses.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6968ca..9842e04b5858 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -627,6 +627,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-8953",
+	  .data = &dsi_phy_14nm_8953_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b91303ada74f..4c8257581bfc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -48,6 +48,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index d13552b2213b..9a6b1f0cbbaf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1065,3 +1065,24 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
+	.has_phy_lane = true,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vcca", 17000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.pll_init = dsi_pll_14nm_init,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+};
-- 
2.33.0

