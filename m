Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E56906AD4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EA910EA32;
	Thu, 13 Jun 2024 11:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w7I+PB+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C378210EA2B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:17:16 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2eae5b2ddd8so17710401fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718277435; x=1718882235; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lRg9QU9KEyvIM7hg+h8JQRq1rNS69OHbVb2oGuE/2Vw=;
 b=w7I+PB+wR6r32CXl/xFOjNM5ilH8OO6MJfGQ+Tg91joAZlExilRpUrxn291IOpgJ0+
 HPLRLeDC8wdNSsWazD4GFZPwvM+CqGiwVBXYDsGvcKXGIoXc0XSKX0q3kA4KqBSESHi3
 1J/FPSJSyDhCNlP87sj4VckuUw5XemPelzD7m+jE0wn0y8GD3nRvzsEndnDTS5hE0f6B
 0zAkWbpWudve8GTqckT7sdqzr+tucRCgOZPC7vMndAc2DQRUTuzXHXBU4x1VJesKUXjq
 k/fNURGjk8aWXDzZavYAUgrZCgHnTnePTpDPtqUqtBPtEkT68i3LJ7LfzvOevYAYnz5X
 mtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718277435; x=1718882235;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lRg9QU9KEyvIM7hg+h8JQRq1rNS69OHbVb2oGuE/2Vw=;
 b=TWUIHBXLfFYck5T9Nmjs7N+wvp2EqHngP6JS91qdufdfC1B0iHEE8Q7YFXsgtD7O9A
 58zvoAb21D9jAgg1nrNawhQb7WTxHjRHznibn4UNxA2Lr45wpRlS4e16hb1SO/x8Ru78
 fsBGz61Uy5dayysD7r2q4KgehS5iuOMvF0/xRjxufwUy59tivTjDYzPxw1G8tRb4s0VS
 7Xqe8HXRMkHqyo4AQJotFv7hXRFouTrRjeMnBbjLXKobfYj8omFB6zMmUoXmYJeW5EOa
 uDFJ1De12hD+5Bsn4Pu480dWRNYWBlAjY7r5iyjKLELtUmp7GGV67267Nf9sgyoSXTen
 MBGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVfn7Mi+hhI/wN33rRvZ9x7WZ8B0MxduUCnnNhc+eVtdx+gHeI9rYFSvYS7CxACfLtA3AoN1+lzAMvQrg0owmrBoeqMYhly7H6sMzVmbJh
X-Gm-Message-State: AOJu0YwBXWHaK7xhEMdi+8ztM68lVAHp8Kzxke6Efvu+fLbEvCKWDXbM
 N2/Oms39ZwdddlFI0tEARh0MIyHgwpGXzwmDw1gqCh5D8WJffysTY8yGLPVKjeU=
X-Google-Smtp-Source: AGHT+IH4B65GpoKnV2+iqbQRge/DOF9VS0xG4DmrQy0bcpXk4rksSN3R9r+SKa/I+WNnGRzCuubh3A==
X-Received: by 2002:a2e:2e18:0:b0:2ea:8d49:c063 with SMTP id
 38308e7fff4ca-2ec02b833a9mr7435201fa.13.1718277434685; 
 Thu, 13 Jun 2024 04:17:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c8ad55sm1777841fa.127.2024.06.13.04.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 04:17:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 14:17:10 +0300
Subject: [PATCH RFC v2] drm/msm/dpu: Configure DP INTF/PHY selector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org>
X-B4-Tracking: v=1; b=H4sIADXVamYC/x2NwQ6CMBBEf4Xs2SVtIQU9mZj4AV4NMdCuskZbb
 JVICP9u5fhmMm9miBSYIuyyGQKNHNm7BGqTgelbdyNkmxiUUKXQskA74NBPGOmBshPamrImWxW
 QBkOgK39X2RlOxwM0Kew5vn2Y1oNRrlVyFcmllJKirHJZ17oSW5T4+rC5dHcfWmdp/yd2Jjf+C
 c2yLD/JjptWrAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7931;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hMo4/f/X4bTvPKBSY1eiPzqCzsv0HlfgBHiWpPsAB+A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmatU5p8Vmt1ZBzaa2WuGh6VVAHU4Zc48m3ZwjO
 X5UV1r1hW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmrVOQAKCRCLPIo+Aiko
 1ahOCACMePI9NdSjS7z9SGdbjxqBdBYT6C5PN6TLg2aam5taE06jX+6+I87P8FQucTTyHcz03eu
 /3orohBbVWvzPl0lDT08/7Cq3GPnJxSyOYAm+plYxE8BHiMixTqgnu4/J06gn3vM5XdoLPgZVeI
 tp16EvEcTBvP5tkSIs8CoVCx5figzwRMDibOVcUcYSLv9wMRUDvhhgJx3UkNy2t7eNvr8YCkmKW
 1GLD1VgoCvuquVCBJR+UGPjc/QB7k1LZ8m9XF5sZzqx5U6xiQqdVRIX5tD5xrWKdQUBUBpQPyub
 WQWyI+kLD+22VArXFBfqSTDVNf2h8Dgj84iBO+L35btfv6kb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Bjorn Andersson <andersson@kernel.org>

Some platforms provides a mechanism for configuring the mapping between
(one or two) DisplayPort intfs and their PHYs.

In particular SC8180X provides this functionality, without a default
configuration, resulting in no connection between its two external
DisplayPort controllers and any PHYs.

The change implements the logic for optionally configuring which PHY
each of the DP INTFs should be connected to and marks the SC8180X DPU to
program 2 entries.

For now the request is simply to program the mapping 1:1, any support
for alternative mappings is left until the use case arrise.

Note that e.g. msm-4.14 unconditionally maps INTF 0 to PHY 0 on all
rlatforms, so perhaps this is needed in order to get DisplayPort working
on some other platforms as well.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Co-developed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Removed entry from the catalog.
- Reworked the interface of dpu_hw_dp_phy_intf_sel(). Pass two entries
  for the PHYs instead of three entries.
- It seems the register isn't present on sdm845, enabled the callback
  only for DPU >= 5.x
- Added a comment regarding the data being platform-specific.
- Link to v1: https://lore.kernel.org/r/20230612221047.1886709-1-quic_bjorande@quicinc.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 39 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 18 ++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h   |  7 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 11 ++++++++-
 4 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 05e48cf4ec1d..a11fdbefc8d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -231,8 +231,38 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
 }
 
+static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
+				   enum dpu_dp_phy_sel phys[2])
+{
+	struct dpu_hw_blk_reg_map *c = &mdp->hw;
+	unsigned int intf;
+	u32 sel = 0;
+
+	sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF0, phys[0]);
+	sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_INTF1, phys[1]);
+
+	for (intf = 0; intf < 2; intf++) {
+		switch (phys[intf]) {
+		case DPU_DP_PHY_0:
+			sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY0, intf + 1);
+			break;
+		case DPU_DP_PHY_1:
+			sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY1, intf + 1);
+			break;
+		case DPU_DP_PHY_2:
+			sel |= FIELD_PREP(MDP_DP_PHY_INTF_SEL_PHY2, intf + 1);
+			break;
+		default:
+			/* ignore */
+			break;
+		}
+	}
+
+	DPU_REG_WRITE(c, MDP_DP_PHY_INTF_SEL, sel);
+}
+
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap)
+		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
@@ -245,6 +275,9 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
 
+	if (mdss_rev->core_major_ver >= 5)
+		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
+
 	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
@@ -252,7 +285,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 				      const struct dpu_mdp_cfg *cfg,
 				      void __iomem *addr,
-				      const struct dpu_mdss_cfg *m)
+				      const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_mdp *mdp;
 
@@ -270,7 +303,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 	 * Assign ops
 	 */
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
+	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
 
 	return mdp;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 6f3dc98087df..3a17e63b851c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -67,6 +67,13 @@ struct dpu_vsync_source_cfg {
 	u32 vsync_source;
 };
 
+enum dpu_dp_phy_sel {
+	DPU_DP_PHY_NONE,
+	DPU_DP_PHY_0,
+	DPU_DP_PHY_1,
+	DPU_DP_PHY_2,
+};
+
 /**
  * struct dpu_hw_mdp_ops - interface to the MDP TOP Hw driver functions
  * Assumption is these functions will be called after clocks are enabled.
@@ -125,6 +132,13 @@ struct dpu_hw_mdp_ops {
 	void (*get_safe_status)(struct dpu_hw_mdp *mdp,
 			struct dpu_danger_safe_status *status);
 
+	/**
+	 * dp_phy_intf_sel - configure intf to phy mapping
+	 * @mdp: mdp top context driver
+	 * @phys: list of phys the DP interfaces should be connected to. 0 disables the INTF.
+	 */
+	void (*dp_phy_intf_sel)(struct dpu_hw_mdp *mdp, enum dpu_dp_phy_sel phys[2]);
+
 	/**
 	 * intf_audio_select - select the external interface for audio
 	 * @mdp: mdp top context driver
@@ -148,12 +162,12 @@ struct dpu_hw_mdp {
  * @dev:  Corresponding device for devres management
  * @cfg:  MDP TOP configuration from catalog
  * @addr: Mapped register io address of MDP
- * @m:    Pointer to mdss catalog data
+ * @mdss_rev: dpu core's major and minor versions
  */
 struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 				      const struct dpu_mdp_cfg *cfg,
 				      void __iomem *addr,
-				      const struct dpu_mdss_cfg *m);
+				      const struct dpu_mdss_version *mdss_rev);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
index 5acd5683d25a..f1acc04089af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
@@ -60,6 +60,13 @@
 #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
 #define DCE_SEL                         0x450
 
+#define MDP_DP_PHY_INTF_SEL             0x460
+#define MDP_DP_PHY_INTF_SEL_INTF0		GENMASK(3, 0)
+#define MDP_DP_PHY_INTF_SEL_INTF1		GENMASK(6, 3)
+#define MDP_DP_PHY_INTF_SEL_PHY0		GENMASK(9, 6)
+#define MDP_DP_PHY_INTF_SEL_PHY1		GENMASK(12, 9)
+#define MDP_DP_PHY_INTF_SEL_PHY2		GENMASK(15, 12)
+
 #define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
 #define MDP_PERIPH_TOP0_END		CLK_CTRL3
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..9db5a784c92f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,7 +1102,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
 					     dpu_kms->catalog->mdp,
 					     dpu_kms->mmio,
-					     dpu_kms->catalog);
+					     dpu_kms->catalog->mdss_ver);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
@@ -1137,6 +1137,15 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
+	/*
+	 * We need to program DP <-> PHY relationship only for SC8180X.  If any
+	 * other platform requires the same kind of programming, or if the INTF
+	 * <->DP relationship isn't static anymore, this needs to be configured
+	 * through the DT.
+	 */
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,sc8180x-dpu"))
+		dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, (unsigned int[]){ 1, 2, });
+
 	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);

---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240613-dp-phy-sel-1b06dc48ed73

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

