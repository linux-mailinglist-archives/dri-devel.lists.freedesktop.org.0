Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393238129A
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78B46F46C;
	Fri, 14 May 2021 21:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2046.outbound.protection.outlook.com [40.107.101.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC166E442;
 Fri, 14 May 2021 21:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAT96o2yzuLZJw3dapbx+keFXz4ZoApxXJNNLgFt4r0fIEXQA1MweZ1qe++jZzvJTn9tkl2IPpgOIQh+1Qnl+qF/Hwpzdip3U8Wt+Wu4cbF5NeDYL6nU8cLuO+89zZUVd2/+FDfFhqGpLr6rdhBIsQbSO0Qn6Bb0sKXB/Atz8Q42J7Zy5bF7JLgAlD8rE6faHzL49OCYxY9ylQBL3yH9yVhZct90GhkzsM2n6RTTNKlHIurwUVlxIyQ62tIAlUw5qB3rCPx82GJUYdzzpWW3Wp3wa308SbY4byzoMIAk0yQmLqxldME6oGE5hheNG8fSQyK40njeDX/h9gs71cOaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygsas+t5Apx1CF6f17RO8m8Gb4kwg+2vf24IrtCw2Oo=;
 b=iiDnzF+i8IV0dhETU3vz+GQwXbhStraJDty9gEcuG1zPn2sFGl5Ac4JFTxZK/JBhFvSopfXIzCmx9W2iXTfmyVRVrAxhqSCwQmx9rBegJYDkRFCq84Es9gDeYZTLG8ThjroUBPjI4W3JibJgAe4RE4/eVSlvyeqOZZFuCjzNAOqq74FCbsL5bb8VcFJeQoFEn4LqE5d/WJQYV+HAx0wWjTsik++6nZzsEUoaMcPc2PYIG9b2n9Yqs6Lscq+Dzph2Kyk90+q8xyqMQ7IiyL8wWEgOnipP0MJJLcWaEGbPFEEquzh1P5Uvg5+1HaYCrINDv8xXI8TttE+fLaibNYrHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygsas+t5Apx1CF6f17RO8m8Gb4kwg+2vf24IrtCw2Oo=;
 b=STfKivfaF4TNxG9HT6YMm1mpLcjooo/yxuV3gC8HSVNgvdLWZvYawPZiyxCGSJh5Oksu6YkCK7ODjMuikmzPix+47cBOBMN4pOhtE4ZZ3UMWs92bJPV3C3JQx/Gxjrj/qRVRunITzIwSRE1TIeY+A7RNuDRbDrQzSE9ympQexPg=
Received: from BN6PR1401CA0019.namprd14.prod.outlook.com
 (2603:10b6:405:4b::29) by BN8PR12MB3299.namprd12.prod.outlook.com
 (2603:10b6:408:9a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 21:07:34 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::e0) by BN6PR1401CA0019.outlook.office365.com
 (2603:10b6:405:4b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 21:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 21:07:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 14 May
 2021 16:07:33 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 14 May 2021 16:07:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH v2 3/6] drm/color: Add output transfer function to crtc
Date: Fri, 14 May 2021 17:07:17 -0400
Message-ID: <20210514210720.157892-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514210720.157892-1-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f011c4a2-1d29-443d-012e-08d9171c4b86
X-MS-TrafficTypeDiagnostic: BN8PR12MB3299:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3299D20B11DD64D87DDEBE2A8C509@BN8PR12MB3299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFqUZ557BPJsKhYJ76vBqf0H7+i8TzM8N3CJmQlg/oVhBVsijzPisvIu2YV6IKnEm5yRDJ5ododsRswUlcn5N0trv+pWPZvApDOMZhMP+kv9ylwfsVUMBBdsBGmbOGWZMaj0Ps5RK2g0uQIQ+xpmOkbcYghMKZ9N/VkeuxfSoIAYeJA6aNctZxcI3MupalC80h9ilVY8eDlanHhvSTfOclBU/qZE8sJeHSSoZBDSVC60h1FEMhg741pROJ4IK3uI6QDEPRsDgxASRneZCwEvEk2YMeiUP56gIkoBjjphMiwsdHb5Cp3eYC8vdt6pw1oxr2zJq7O01U8AtZ4/CUT6BzAyaVVwPeRyiDa+8lMcM+8y/1ThhgQUmZiyQB3/fMgQZwOtt8SzHscadtHMlqGgJuq+LJuTea2TNZ18MW5M+6VDDQlNwaKEpH+Qy78WGXLzKfUSRxeRuJ3yGMsUeKbuSNeT9UJcQjdup1oQmDzGPJNvW+VWq9UTyVxk7fgZnQ9KXoWhtOs5C/RWMgqXIFzPC1PC5AVqPPBO2nwf+RCgabunVevo8yWg16P8XL2r/WyxsjmsV1rIq1Rs8JtwZxEqRubQqXK265WWdx6K9wMHssfNwf+m8L0IMopLlr3aje3F7ED9Cs9saAzDo1HMjlfdWj39GIZ39nsHSodCgqfHQheGRT+5dn7hw60NfjOMUS2F
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(36840700001)(47076005)(82310400003)(82740400003)(8936002)(6666004)(86362001)(186003)(26005)(7696005)(8676002)(36756003)(70586007)(83380400001)(36860700001)(4326008)(81166007)(316002)(356005)(5660300002)(44832011)(478600001)(1076003)(2906002)(54906003)(70206006)(2616005)(336012)(110136005)(30864003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:07:34.2792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f011c4a2-1d29-443d-012e-08d9171c4b86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3299
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have 1D LUTs to define output transfer function but using a
1D LUT is not always the best way to define a transfer function for HW
that has ROMs for certain transfer functions, or for HW that has complex
PWL definition for accurate LUT definitions.

For this reason we're introducing named transfer functions. The original
LUT behavior is preserved with the default "1D LUT" transfer function.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 +++-
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  7 ++-
 drivers/gpu/drm/arm/malidp_crtc.c             |  7 ++-
 drivers/gpu/drm/armada/armada_crtc.c          |  5 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  7 ++-
 drivers/gpu/drm/drm_color_mgmt.c              | 54 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_color.c    | 11 ++--
 drivers/gpu/drm/i915/display/intel_color.h    |  2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  9 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  8 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  9 +++-
 drivers/gpu/drm/nouveau/dispnv50/head.c       | 13 +++--
 drivers/gpu/drm/omapdrm/omap_crtc.c           | 10 +++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  7 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  5 +-
 drivers/gpu/drm/stm/ltdc.c                    |  8 ++-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  9 +++-
 drivers/gpu/drm/vc4/vc4_crtc.c                | 16 +++++-
 include/drm/drm_color_mgmt.h                  | 37 +++++++------
 include/drm/drm_crtc.h                        | 20 +++++++
 21 files changed, 208 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 041576945a0d..59d277c31864 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7139,8 +7139,15 @@ static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	acrtc->otg_inst = -1;
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
-	drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
-				   true, MAX_COLOR_LUT_ENTRIES);
+
+	res = drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
+					 true, MAX_COLOR_LUT_ENTRIES,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (res) {
+		drm_crtc_cleanup(&acrtc->base);
+		goto fail;
+	}
+
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
 	return 0;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 59172acb9738..f364d37232b5 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -626,7 +626,12 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 
 	crtc->port = kcrtc->master->of_output_port;
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);
+	err = drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (err) {
+		drm_crtc_cleanup(crtc);
+		return err;
+	}
 
 	return err;
 }
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 494075ddbef6..7af87002c375 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -552,7 +552,12 @@ int malidp_crtc_init(struct drm_device *drm)
 	drm_crtc_helper_add(&malidp->crtc, &malidp_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&malidp->crtc, MALIDP_GAMMA_LUT_SIZE);
 	/* No inverse-gamma: it is per-plane. */
-	drm_crtc_enable_color_mgmt(&malidp->crtc, 0, true, MALIDP_GAMMA_LUT_SIZE);
+	ret = drm_crtc_enable_color_mgmt(&malidp->crtc, 0, true, MALIDP_GAMMA_LUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(&malidp->crtc);
+		return ret;
+	}
 
 	malidp_se_set_enh_coeffs(malidp->dev);
 
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index b7bb90ae787f..d44a1d4fa475 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -992,7 +992,10 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 	if (ret)
 		return ret;
 
-	drm_crtc_enable_color_mgmt(&dcrtc->crtc, 0, false, 256);
+	ret = drm_crtc_enable_color_mgmt(&dcrtc->crtc, 0, false, ,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret)
+		return ret;
 
 	return armada_overlay_plane_create(drm, 1 << dcrtc->num);
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 05ad75d155e8..e5911826d002 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -528,8 +528,11 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
 
 	drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SIZE);
-	drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
-				   ATMEL_HLCDC_CLUT_SIZE);
+	ret = drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
+					 ATMEL_HLCDC_CLUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret)
+		goto fail;
 
 	dc->crtc = &crtc->base;
 
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index daf62fb090a6..196544951ab7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -147,12 +147,21 @@ u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n)
 }
 EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
 
+static const char * const tf_name[] = {
+	[DRM_TF_UNDEFINED] = "undefined",
+	[DRM_TF_SRGB] = "sRGB",
+	[DRM_TF_PQ2084] = "PQ2084",
+	[DRM_TF_1D_LUT] = "1D LUT",
+};
+
 /**
  * drm_crtc_enable_color_mgmt - enable color management properties
  * @crtc: DRM CRTC
  * @degamma_lut_size: the size of the degamma lut (before CSC)
  * @has_ctm: whether to attach ctm_property for CSC matrix
  * @gamma_lut_size: the size of the gamma lut (after CSC)
+ * @supported_tfs: bitfield indicating supported transfer functions
+ * @default_tf: default output transfer function
  *
  * This function lets the driver enable the color correction
  * properties on a CRTC. This includes 3 degamma, csc and gamma
@@ -162,13 +171,27 @@ EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
  * their size is not 0 and ctm_property is only attached if has_ctm is
  * true.
  */
-void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
+bool drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				uint degamma_lut_size,
 				bool has_ctm,
-				uint gamma_lut_size)
+				uint gamma_lut_size,
+				u32 supported_tfs,
+				enum drm_transfer_function default_tf)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property *prop;
+	struct drm_prop_enum_list enum_list[DRM_TF_MAX];
+	int i, len;
+
+	if (WARN_ON(supported_tfs == 0 ||
+		    (supported_tfs & -BIT(DRM_TF_MAX)) != 0 ||
+		    (supported_tfs & BIT(default_tf)) == 0))
+		return -EINVAL;
+
+	if (!!(supported_tfs & BIT(DRM_TF_1D_LUT)) !=
+	    !!(degamma_lut_size || gamma_lut_size))
+		return -EINVAL;
 
 	if (degamma_lut_size) {
 		drm_object_attach_property(&crtc->base,
@@ -189,6 +212,28 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 					   config->gamma_lut_size_property,
 					   gamma_lut_size);
 	}
+
+	len = 0;
+	for (i = 0; i < DRM_TF_MAX; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = tf_name[i];
+		len++;
+	}
+
+	prop = drm_property_create_enum(dev, 0, "OUT TRANSFER_FUNCTION",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+	crtc->out_transfer_function_property = prop;
+	drm_object_attach_property(&crtc->base, prop, default_tf);
+	if (crtc->state)
+		crtc->state->out_transfer_function = default_tf;
+	
+	return 0;
+
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
@@ -481,11 +526,6 @@ static const char * const color_range_name[] = {
 	[DRM_COLOR_YCBCR_LIMITED_RANGE] = "YCbCr limited range",
 };
 
-static const char * const tf_name[] = {
-	[DRM_TF_UNDEFINED] = "undefined",
-	[DRM_TF_SRGB] = "sRGB",
-	[DRM_TF_PQ2084] = "PQ2084",
-};
 /**
  * drm_get_color_encoding_name - return a string for color encoding
  * @encoding: color encoding to compute name of
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index c75d7124d57a..1d4b2824dcf1 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2092,7 +2092,7 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
-void intel_color_init(struct intel_crtc *crtc)
+bool intel_color_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	bool has_ctm = INTEL_INFO(dev_priv)->color.degamma_lut_size != 0;
@@ -2149,8 +2149,9 @@ void intel_color_init(struct intel_crtc *crtc)
 		}
 	}
 
-	drm_crtc_enable_color_mgmt(&crtc->base,
-				   INTEL_INFO(dev_priv)->color.degamma_lut_size,
-				   has_ctm,
-				   INTEL_INFO(dev_priv)->color.gamma_lut_size);
+	return drm_crtc_enable_color_mgmt(&crtc->base,
+					  INTEL_INFO(dev_priv)->color.degamma_lut_size,
+					  has_ctm,
+					  INTEL_INFO(dev_priv)->color.gamma_lut_size,
+					  BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 173727aaa24d..a8e015acc60c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -12,7 +12,7 @@ struct intel_crtc_state;
 struct intel_crtc;
 struct drm_property_blob;
 
-void intel_color_init(struct intel_crtc *crtc);
+bool intel_color_init(struct intel_crtc *crtc);
 int intel_color_check(struct intel_crtc_state *crtc_state);
 void intel_color_commit(const struct intel_crtc_state *crtc_state);
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 39358076c05b..c0bdad412032 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -340,7 +340,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
-	intel_color_init(crtc);
+	ret = intel_color_init(crtc);
+	if (ret)
+		goto fail;
 
 	intel_crtc_crc_init(crtc);
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 29742ec5ab95..9aabaf499065 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -971,8 +971,13 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		return ret;
 	}
 
-	drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
-				   ARRAY_SIZE(priv->dma_hwdescs->palette));
+	ret = drm_crtc_enable_color_mgmt(&priv->crtc, 0, false,
+					 ARRAY_SIZE(priv->dma_hwdescs->palette),
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		dev_err(dev, "Failed to init color management: %i\n", ret);
+		return ret;
+	}
 
 	if (soc_info->has_osd) {
 		drm_plane_helper_add(&priv->f0,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 40df2c823187..943ba13ff55e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -827,7 +827,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	if (gamma_lut_size)
 		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
-	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
+	ret = drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size,
+					BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(mtk_crtc->base);
+		kfree(mtk_crtc);
+		return ret;
+
 	priv->num_pipes++;
 	mutex_init(&mtk_crtc->hw_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 18bc76b7f1a3..4b01196fc093 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1340,6 +1340,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i;
+	int ret = 0;
 
 	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
 	if (!dpu_crtc)
@@ -1368,7 +1369,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
-	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
+	ret = drm_crtc_enable_color_mgmt(crtc, 0, true, 0,
+					 BIT(DRM_TF_UNDEFINED), DRM_TF_UNDEFINED);
+	if (ret) {
+		drm_crtc_cleanup(crtc);
+		kfree(dpu_crtc);
+		return ERR_PTR(ret);
+	}
 
 	/* save user friendly CRTC name for later */
 	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index ec361d17e900..f97b3f70152b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -589,9 +589,16 @@ nv50_head_create(struct drm_device *dev, int index)
 	drm_crtc_helper_add(crtc, &nv50_head_help);
 	/* Keep the legacy gamma size at 256 to avoid compatibility issues */
 	drm_mode_crtc_set_gamma_size(crtc, 256);
-	drm_crtc_enable_color_mgmt(crtc, base->func->ilut_size,
-				   disp->disp->object.oclass >= GF110_DISP,
-				   head->func->olut_size);
+	ret = drm_crtc_enable_color_mgmt(crtc, base->func->ilut_size,
+					 disp->disp->object.oclass >= GF110_DISP,
+					 head->func->olut_size,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(crtc);
+		kfree(head);
+		return ERR_PTR(ret);
+	}
+
 
 	if (head->func->olut_set) {
 		ret = nv50_lut_init(disp, &drm->client.mmu, &head->olut);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 06a719c104f4..a618b3338c38 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -839,7 +839,15 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	if (dispc_mgr_gamma_size(priv->dispc, channel)) {
 		unsigned int gamma_lut_size = 256;
 
-		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, true, 0);
+		ret = drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, true, 0,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			dev_err(dev->dev, "$s(): could not init color management for: %s\n",
+				__func__, pipe->output->name);
+			drm_crtc_cleanup(crtc);
+			kfree(omap_crtc);
+			return ERR_PTR(ret);
+		}
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..02d8737e6603 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1263,7 +1263,12 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		rgrp->cmms_mask |= BIT(hwindex % 2);
 
 		drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
-		drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			drm_crtc_cleanup(crtc);
+			return ret;
+		}
 	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 64469439ddf2..e303c06f9913 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1816,7 +1816,10 @@ static int vop_create_crtc(struct vop *vop)
 	drm_crtc_helper_add(crtc, &vop_crtc_helper_funcs);
 	if (vop->lut_regs) {
 		drm_mode_crtc_set_gamma_size(crtc, vop_data->lut_size);
-		drm_crtc_enable_color_mgmt(crtc, 0, false, vop_data->lut_size);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, false, vop_data->lut_size,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret)
+			goto err_cleanup_crtc;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 65c3c79ad1d5..861e79873f09 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1034,7 +1034,13 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 	drm_crtc_helper_add(crtc, &ltdc_crtc_helper_funcs);
 
 	drm_mode_crtc_set_gamma_size(crtc, CLUT_SIZE);
-	drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE);
+	ret = drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		DRM_ERROR("Can not initialize color management\n");
+		drm_crtc_cleanup(crtc);
+		goto cleanup;
+	}
 
 	DRM_DEBUG_DRIVER("CRTC:%d created\n", crtc->base.id);
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 2218da3b3ca3..34ed098887bc 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -439,7 +439,14 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 	if (tidss->feat->vp_feat.color.gamma_size)
 		gamma_lut_size = 256;
 
-	drm_crtc_enable_color_mgmt(crtc, 0, has_ctm, gamma_lut_size);
+	ret = drm_crtc_enable_color_mgmt(crtc, 0, has_ctm, gamma_lut_size,
+					 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+	if (ret) {
+		drm_crtc_cleanup(crtc);
+		kfree(tcrtc);
+		return ERR_PTR(ret);
+	}
+
 	if (gamma_lut_size)
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 76657dcdf9b0..f0919a6e999f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1074,12 +1074,24 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 	if (!vc4->hvs->hvs5) {
 		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 
-		drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, false, crtc->gamma_size,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			dev_err(drm->dev, "failed to enable color management\n");
+			drm_crtc_cleanup(crtc);
+			return ret;
+		}
 
 		/* We support CTM, but only for one CRTC at a time. It's therefore
 		 * implemented as private driver state in vc4_kms, not here.
 		 */
-		drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size);
+		ret = drm_crtc_enable_color_mgmt(crtc, 0, true, crtc->gamma_size,
+						 BIT(DRM_TF_1D_LUT), DRM_TF_1D_LUT);
+		if (ret) {
+			dev_err(drm->dev, "failed to enable color management\n");
+			drm_crtc_cleanup(crtc);
+			return ret;
+		}
 	}
 
 	for (i = 0; i < crtc->gamma_size; i++) {
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 370bbc55b744..408561acdb3d 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -54,10 +54,29 @@ static inline u32 drm_color_lut_extract(u32 user_input, int bit_precision)
 
 u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
 
-void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
+/**
+ * enum drm_transfer_function - common transfer function used for sdr/hdr formats
+ *
+ * DRM_TF_UNDEFINED - The legacy case where a TF in and out of the blending
+ *                    space is undefined
+ * DRM_TF_SRGB - Based on gamma curve and is used for printer/monitors/web
+ * DRM_TF_PQ2084 - Used for HDR and allows for up to 10,000 nit support.
+ * DRM_TF_1D_LUT - Use 1D gamma/degamma LUTs (currently only defined on crtc)
+*/
+enum drm_transfer_function {
+	DRM_TF_UNDEFINED,
+	DRM_TF_SRGB,
+	DRM_TF_PQ2084,
+	DRM_TF_1D_LUT,
+	DRM_TF_MAX,
+};
+
+bool drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				uint degamma_lut_size,
 				bool has_ctm,
-				uint gamma_lut_size);
+				uint gamma_lut_size,
+				u32 supported_tfs,
+				enum drm_transfer_function default_tf);
 
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
@@ -87,20 +106,6 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
-/**
- * enum drm_transfer_function - common transfer function used for sdr/hdr formats
- *
- * DRM_TF_UNDEFINED - The legacy case where a TF in and out of the blending
- *                    space is undefined
- * DRM_TF_SRGB - Based on gamma curve and is used for printer/monitors/web
- * DRM_TF_PQ2084 - Used for HDR and allows for up to 10,000 nit support.
-*/
-enum drm_transfer_function {
-	DRM_TF_UNDEFINED,
-	DRM_TF_SRGB,
-	DRM_TF_PQ2084,
-	DRM_TF_MAX,
-};
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 13eeba2a750a..35580dd36294 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -288,6 +288,15 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @out_transfer_function:
+	 *
+	 * Transfer function for conversion from blending space to
+	 * display space. DRM_TF_1D_LUT can be specified to use the
+	 * gamma/degamma LUTs from mode_config instead.
+	 */
+	enum drm_transfer_function out_transfer_function;
+
 	/**
 	 * @target_vblank:
 	 *
@@ -1096,6 +1105,17 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @out_transfer_function_property:
+	 *
+	 * Optional "OUT TRANSFER FUNCTION" enum property for specifying
+	 * an output transfer function, i.e. a TF to convert from
+	 * blending space to luminance space. Use DRM_TF_1D_LUT to
+	 * indicate using the 1D gamma/degamma LUTs instead of a
+	 * named transfer function.
+	 */
+	struct drm_property *out_transfer_function_property;
+
 	/**
 	 * @state:
 	 *
-- 
2.31.1

