Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA09E91727E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 22:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409FA10E73A;
	Tue, 25 Jun 2024 20:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a+jIuFtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3275610E737
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 20:25:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cdb9526e2so3641338e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719347100; x=1719951900; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EGSrExRHaYAC12I3fY4kfdCfI8K5ixp22xz8c3OXhqc=;
 b=a+jIuFtUdo7K59SCMzrNkLUF8JkGrKXvidlVM0dXmwcys/bxz/NoKQUKHRLdd7XtLj
 ciLCj1DpTbZDN3V2UaAOeHVAv/sLpCZUvZ3BKCvn2CDyw30MJX8jTGVApPEh42VLbWNX
 lwPFFoVfkNhBxYfsGxMfHNx91ZHyZBuQ7XwB76Qo/rMluOMlT7/WqgUBXd256R8Nh1Vu
 HHJISHhd99ZOuEuKYvu82jRFFxxJd76D+VYJ9SMr2oIwJJ7b2HQGEVTRqTz8Wb4GxudK
 hwI8XaNthm4ZKBzdHvmG46a1G/p1XsRX2/+QdQxkNqbSt24naQEIbZQBAok5WBnCQwTq
 +bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719347100; x=1719951900;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGSrExRHaYAC12I3fY4kfdCfI8K5ixp22xz8c3OXhqc=;
 b=DVDmvt8DtXUrY6cwmr6jFndP2HgRTer1AbBff74q2XA7KVfM3jTKGD5ub0aCrUo0k3
 Z/r3KhNb8BwxryRL4RhnpO4hdLvqW7U/Wca3C8ByBga06gxNy3/RLLjSHokxk3axkT2w
 YVmQyF4emhvx9st1qlnJyy18xBxEZ9LVJnk6vjnW91IoIWN0ZyegO8ZsFtuPgMkeyN/1
 OufihH1Y0ZHCnCsJZ9YpBWMdbjBd2dL+8o6VCWgYOaoj43g6j+CvlKWIBeZTFgnGNyNw
 CU62P0lZUpBmqqxy5JxjteAlF1FB00Tqp6yt8TsCY54pLF8KfTV4fFO61NU3X4jQGSyJ
 rv3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtouZHI44USVq4WrLy4s50S2Sl33r15+HEns1q8iQr6myTGfbYHDfXgQPX8qnJ0+x1I3bKXUomHOEOyi/NgxaddppwcypdubELXRRtI1mj
X-Gm-Message-State: AOJu0Ywnh8hlwtVdkpprzzqw4Gfjf2oI/e2Jgpccsow60cPWXX+8/6gn
 M0h5Da2p0+gY02XLXZO5osXDpLTQ0DeOq5cX0RKgrMWwW3PMAqE1o8yPQVXfyLIa6LyLKPnmuu+
 m7JQ=
X-Google-Smtp-Source: AGHT+IGvZKN0bua6TVN/7VXdsjrb+MYYawhQuZHbwn7dzTE3zJ8f7WalpmdFudMnw2ffUpwm9BDvUQ==
X-Received: by 2002:a05:6512:33cc:b0:52c:ebf6:9a7f with SMTP id
 2adb3069b0e04-52cebf69b22mr1746440e87.11.1719347100412; 
 Tue, 25 Jun 2024 13:25:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cf4c4aef0sm133983e87.279.2024.06.25.13.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 13:24:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 23:24:58 +0300
Subject: [PATCH RFC v3] drm/msm/dpu: Configure DP INTF/PHY selector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJkne2YC/2WOSwrCMBBAryKzNiWf0o+rguAB3IpImox2RJOaa
 LGU3t1YcOXyzfDezAQRA2GEzWqCgANF8i6BWq/AdNpdkJFNDJLLnBdCMduzvhtZxBsTLS+sySu
 0pYIk9AHP9F5iB9jvtnBMw47i04dxOTCIZZVaKrWklILnZSaqqih5zQR7vMic2qsP2llsvkTOZ
 Mbfl9Igf/bfJ4NMdl3rs8orU7camxs5HXzmwwWO8zx/AG5ArCroAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8174;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jd9TJprlmcMJiSuEHm0k/6OujE/VuztR4MVhGAt8TOc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeyebRP/+uVJ+TBNUVJswAgrltR6mnO8c2gyvl
 HXXnwRyvSCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnsnmwAKCRCLPIo+Aiko
 1QClB/4400kWq+L2Gj1ozzKn23iBw+KPOoF/FxSZIGUL02ipGLdsL5Rkv83RHgy0gv9WFmI3zB+
 lBHlb7eV6lFFPHYJBBGhD73aYTpeac2tpXIa112VWuOzWiUmEkyDiWf96G8GwTmbT1+sQSoh0bW
 13grvdJggo+cywubJvoJfUW1Fa0k/sL+9skLNN578RdoKMrpd7K0FKqfxgQW7g4CN/vBm1mzjBC
 Qtf/PBCmQxzwDXlLY+5vdBAdRMgdJTN7arH4TIRp/MSsOK/JpnftDCOWhw3camJTUXKYcLlUcIe
 w5NWk3JXE2/b0AmdZIldTBk9zyBRjGhkAUcQkhWDzO1zJHm3
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

In particular SC8180X requires this to be configured, since on this
platform there are fewer controllers than PHYs.

The change implements the logic for optionally configuring which PHY
each of the DP INTFs should be connected to and marks the SC8180X DPU to
program 2 entries.

For now the request is simply to program the mapping 1:1, any support
for alternative mappings is left until the use case arrise.

Note that e.g. msm-4.14 unconditionally maps INTF 0 to PHY 0 on all
platforms, so perhaps this is needed in order to get DisplayPort working
on some other platforms as well.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Co-developed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Expanded the commit message and in-code comment based on feedback from
  Abhinav
- Fixed field masks for the affected register (Abhinav)
- Link to v2: https://lore.kernel.org/r/20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 12 ++++++++-
 4 files changed, 70 insertions(+), 6 deletions(-)

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
index 5acd5683d25a..054fe097ebf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
@@ -60,6 +60,13 @@
 #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
 #define DCE_SEL                         0x450
 
+#define MDP_DP_PHY_INTF_SEL             0x460
+#define MDP_DP_PHY_INTF_SEL_INTF0		GENMASK(2, 0)
+#define MDP_DP_PHY_INTF_SEL_INTF1		GENMASK(5, 3)
+#define MDP_DP_PHY_INTF_SEL_PHY0		GENMASK(8, 6)
+#define MDP_DP_PHY_INTF_SEL_PHY1		GENMASK(11, 9)
+#define MDP_DP_PHY_INTF_SEL_PHY2		GENMASK(14, 12)
+
 #define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
 #define MDP_PERIPH_TOP0_END		CLK_CTRL3
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1955848b1b78..cc350deaa140 100644
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
@@ -1137,6 +1137,16 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
+	/*
+	 * We need to program DP <-> PHY relationship only for SC8180X since it
+	 * has fewer DP controllers than DP PHYs.
+	 * If any other platform requires the same kind of programming, or if
+	 * the INTF <->DP relationship isn't static anymore, this needs to be
+	 * configured through the DT.
+	 */
+	if (of_device_is_compatible(dpu_kms->pdev->dev.of_node, "qcom,sc8180x-dpu"))
+		dpu_kms->hw_mdp->ops.dp_phy_intf_sel(dpu_kms->hw_mdp, (unsigned int[]){ 1, 2, });
+
 	dpu_kms->hw_intr = dpu_hw_intr_init(dev, dpu_kms->mmio, dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);

---
base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
change-id: 20240613-dp-phy-sel-1b06dc48ed73

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

