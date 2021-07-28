Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7043D847E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A016A6E321;
	Wed, 28 Jul 2021 00:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7F6E429;
 Wed, 28 Jul 2021 00:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxbUqzGbbaiMIeCC3dTKNeqdeYAM4Q7aZYF47YFz27OG3YNKya6ERoP8XhrzszyF58E9T76q/GQ4sCtl+Ato+KU4pA/ng5jNuW2WMUCJkyP2wL3WjlSDSEw7/KdJs3QKdsLNAyLIfPnhm7RqZ7ZIu47Hers1kxqyS74TtfXSO+BfQ7rfecpzLfNMg5w/RQ9F715iyIT9aZ8RR0gtEBYwUWPr/AdP9la2MdrCxFHld7LFFlwFHd1+vcx8a72jQirfGkshXtHp+Ni4vAJMfRZT4vOtbQgJL8iUSdg+rBw2R4p+NUDqC6XXZPfhPqGOXzv2Aonb87z3h0yZY3bMwp8xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzZ4Z3w93veknjaz50S2y1CgJE4/W3KA4oBomesCFPI=;
 b=X7/hBFHCZAzJa7YOsqEOHo7bPYOKdo5SKc4pnnzVLViZOrRpvYcDsYAHJZIVzVOf5CtRQ7O660srHXypVmwfEWlXuJ8WREaBMUmL3iJCVMHoYTlgws0ny9R1nKPOKqDEuuvZDJW6VEaHcwt8VVZc/HWTKotFQrQ7V1RimbQ5PR+OhwBbp8utPuS2DInf2ifD5pfpFFLCOUkeS5xyZURiwc/yvIF6RyLa74aTbirydMe85bqWKz2/n/MJLluqufBwbpCjHi+ULb7WH3oXWR+4uVVDqtDOQ6nXLfQsgBh8pp5VI+nNp+8APKowSSINIOts7mdubscwCb7NRqo8W3S7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzZ4Z3w93veknjaz50S2y1CgJE4/W3KA4oBomesCFPI=;
 b=bJRxb63Y+bYFzfPVuZlrtWdbSMh7KiU30Iwo3HAPO8/aWo4m1E6KWHbz4Mn4u1glz/Dw0+B89eSUIA436xVcNAnYPjnJI78cRHymJHObS+fwoC+U7qOgm+vxAZHn8lBGgmYP4nnfGTbgtNHS3NHoEVHHI3f3XKcCUCwMnCbeZwM=
Received: from DS7PR03CA0224.namprd03.prod.outlook.com (2603:10b6:5:3ba::19)
 by SA0PR12MB4575.namprd12.prod.outlook.com (2603:10b6:806:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 00:11:41 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::32) by DS7PR03CA0224.outlook.office365.com
 (2603:10b6:5:3ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Wed, 28 Jul 2021 00:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 00:11:41 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 27 Jul
 2021 19:11:40 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu_vkms (v3)
Date: Tue, 27 Jul 2021 17:11:19 -0700
Message-ID: <20210728001119.12807-4-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728001119.12807-1-Ryan.Taylor@amd.com>
References: <20210728001119.12807-1-Ryan.Taylor@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b0a6f9e-2ac8-491e-3e25-08d9515c46dd
X-MS-TrafficTypeDiagnostic: SA0PR12MB4575:
X-Microsoft-Antispam-PRVS: <SA0PR12MB457526E453CC0091C6F40612EAEA9@SA0PR12MB4575.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5wLrEGFsStHug6ZYOtLOsmZbW7y7Rbb3K4sbv1q5frJ30T+4+CpdwaIw5OpH952tAskQgejBUbWZeTe69yBQln1GMrBVivjfejLX/I+Khf9GiQsAs732XLPr2yR3cJPZZVXkGTmJ0FBNoKs3OHBc/mrQGi+2KCLnPPF/EbNWzEyE8BrbYeCFn5Ecg2GMvIJYSWwZ8KMW5QRGuDKX0P5eBq/gn+cG/poHF7QDan4C0hT2fqJMnWghVpJCcqhbVBaX8X5AIZ9jJ/61eraxcMLckgZsDVQTW4vLbk0h3qPWk2U7WsD91qGHuOBrfTgjxvZwKMpOVn3A/ty+VsQGuWV6VhpnPEdW22xuFWC+Co0/NPTFmCG+1SavW1xyb1EM5GOkYULzM4/BIld8dM6bPd5nuUvXPbC3hvljLCugta0n//rkFHWYKyGy1/EVQWn/KDH6Upthkxp3yeAYn/yPWyNsuKAZdA/eICLIbZWaiqp7FnEXJO2vQ7M3JItCcA4PvNcV07VS0PbVlT/poj1mrUiZPUmXtbS4dhjTu8D4e4D3Q8FAMXLFqqxV3LTlILiyO3XuPkDQ+Ni/mhr4Q13G/lPHz8SLNMWt31OOmf7bKUFEye7UkTSbkrJb6lHKQ3T79vGtTlJT3D5x9kKuMdf+BIb5a4JsenRObFXbYTYBmDPDJBpfKNQElnPO8Qk9IHAg5XV8grAA4YYfZjy2Lhkb4ntPSWRf/w5WPvtsbzU+MUxU/I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(110136005)(54906003)(6666004)(4326008)(8676002)(356005)(36860700001)(508600001)(316002)(8936002)(36756003)(83380400001)(2906002)(82310400003)(1076003)(426003)(47076005)(30864003)(5660300002)(26005)(2616005)(7696005)(16526019)(70586007)(336012)(70206006)(86362001)(81166007)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 00:11:41.6381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0a6f9e-2ac8-491e-3e25-08d9515c46dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4575
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
Cc: kernel test
 robot <lkp@intel.com>, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>, melissa.srw@gmail.com,
 Alex Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move dce_virtual into amdgpu_vkms and update all references to
dce_virtual with amdgpu_vkms.

v2: Removed more references to dce_virtual.

v3: Restored display modes from previous implementation.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 195 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |   3 -
 drivers/gpu/drm/amd/amdgpu/cik.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 223 -----------------------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 ---
 drivers/gpu/drm/amd/amdgpu/nv.c          |  22 +--
 drivers/gpu/drm/amd/amdgpu/si.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
 10 files changed, 228 insertions(+), 290 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 30cbcd5ce1cc..0d814c957461 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -120,8 +120,7 @@ amdgpu-y += \
 amdgpu-y += \
 	dce_v10_0.o \
 	dce_v11_0.o \
-	amdgpu_vkms.o \
-	dce_virtual.o
+	amdgpu_vkms.o
 
 # add GFX block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index e2810b22bb43..50bdc39733aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -5,6 +5,15 @@
 #include <drm/drm_vblank.h>
 
 #include "amdgpu.h"
+#ifdef CONFIG_DRM_AMDGPU_SI
+#include "dce_v6_0.h"
+#endif
+#ifdef CONFIG_DRM_AMDGPU_CIK
+#include "dce_v8_0.h"
+#endif
+#include "dce_v10_0.h"
+#include "dce_v11_0.h"
+#include "ivsrcid/ivsrcid_vislands30.h"
 #include "amdgpu_vkms.h"
 #include "amdgpu_display.h"
 
@@ -444,3 +453,189 @@ int amdgpu_vkms_output_init(struct drm_device *dev,
 
 	return ret;
 }
+
+const struct drm_mode_config_funcs amdgpu_vkms_mode_funcs = {
+	.fb_create = amdgpu_display_user_framebuffer_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int amdgpu_vkms_sw_init(void *handle)
+{
+	int r, i;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev_to_drm(adev)->max_vblank_count = 0;
+
+	adev_to_drm(adev)->mode_config.funcs = &amdgpu_vkms_mode_funcs;
+
+	adev_to_drm(adev)->mode_config.max_width = XRES_MAX;
+	adev_to_drm(adev)->mode_config.max_height = YRES_MAX;
+
+	adev_to_drm(adev)->mode_config.preferred_depth = 24;
+	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
+
+	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
+
+	r = amdgpu_display_modeset_create_props(adev);
+	if (r)
+		return r;
+
+	adev->amdgpu_vkms_output = kcalloc(adev->mode_info.num_crtc, sizeof(struct amdgpu_vkms_output), GFP_KERNEL);
+
+	/* allocate crtcs, encoders, connectors */
+	for (i = 0; i < adev->mode_info.num_crtc; i++) {
+		r = amdgpu_vkms_output_init(adev_to_drm(adev), &adev->amdgpu_vkms_output[i], i);
+		if (r)
+			return r;
+	}
+
+	drm_kms_helper_poll_init(adev_to_drm(adev));
+
+	adev->mode_info.mode_config_initialized = true;
+	return 0;
+}
+
+static int amdgpu_vkms_sw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i = 0;
+
+	for (i = 0; i < adev->mode_info.num_crtc; i++)
+		if (adev->mode_info.crtcs[i])
+			hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
+
+	kfree(adev->mode_info.bios_hardcoded_edid);
+	kfree(adev->amdgpu_vkms_output);
+
+	drm_kms_helper_poll_fini(adev_to_drm(adev));
+
+	adev->mode_info.mode_config_initialized = false;
+	return 0;
+}
+
+static int amdgpu_vkms_hw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	switch (adev->asic_type) {
+#ifdef CONFIG_DRM_AMDGPU_SI
+	case CHIP_TAHITI:
+	case CHIP_PITCAIRN:
+	case CHIP_VERDE:
+	case CHIP_OLAND:
+		dce_v6_0_disable_dce(adev);
+		break;
+#endif
+#ifdef CONFIG_DRM_AMDGPU_CIK
+	case CHIP_BONAIRE:
+	case CHIP_HAWAII:
+	case CHIP_KAVERI:
+	case CHIP_KABINI:
+	case CHIP_MULLINS:
+		dce_v8_0_disable_dce(adev);
+		break;
+#endif
+	case CHIP_FIJI:
+	case CHIP_TONGA:
+		dce_v10_0_disable_dce(adev);
+		break;
+	case CHIP_CARRIZO:
+	case CHIP_STONEY:
+	case CHIP_POLARIS10:
+	case CHIP_POLARIS11:
+	case CHIP_VEGAM:
+		dce_v11_0_disable_dce(adev);
+		break;
+	case CHIP_TOPAZ:
+#ifdef CONFIG_DRM_AMDGPU_SI
+	case CHIP_HAINAN:
+#endif
+		/* no DCE */
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int amdgpu_vkms_hw_fini(void *handle)
+{
+	return 0;
+}
+
+static int amdgpu_vkms_suspend(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int r;
+
+	r = drm_mode_config_helper_suspend(adev_to_drm(adev));
+	if (r)
+		return r;
+	return amdgpu_vkms_hw_fini(handle);
+}
+
+static int amdgpu_vkms_resume(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int r;
+
+	r = amdgpu_vkms_hw_init(handle);
+	if (r)
+		return r;
+	return drm_mode_config_helper_resume(adev_to_drm(adev));
+}
+
+static bool amdgpu_vkms_is_idle(void *handle)
+{
+	return true;
+}
+
+static int amdgpu_vkms_wait_for_idle(void *handle)
+{
+	return 0;
+}
+
+static int amdgpu_vkms_soft_reset(void *handle)
+{
+	return 0;
+}
+
+static int amdgpu_vkms_set_clockgating_state(void *handle,
+					  enum amd_clockgating_state state)
+{
+	return 0;
+}
+
+static int amdgpu_vkms_set_powergating_state(void *handle,
+					  enum amd_powergating_state state)
+{
+	return 0;
+}
+
+static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
+	.name = "amdgpu_vkms",
+	.early_init = NULL,
+	.late_init = NULL,
+	.sw_init = amdgpu_vkms_sw_init,
+	.sw_fini = amdgpu_vkms_sw_fini,
+	.hw_init = amdgpu_vkms_hw_init,
+	.hw_fini = amdgpu_vkms_hw_fini,
+	.suspend = amdgpu_vkms_suspend,
+	.resume = amdgpu_vkms_resume,
+	.is_idle = amdgpu_vkms_is_idle,
+	.wait_for_idle = amdgpu_vkms_wait_for_idle,
+	.soft_reset = amdgpu_vkms_soft_reset,
+	.set_clockgating_state = amdgpu_vkms_set_clockgating_state,
+	.set_powergating_state = amdgpu_vkms_set_powergating_state,
+};
+
+const struct amdgpu_ip_block_version amdgpu_vkms_ip_block =
+{
+	.type = AMD_IP_BLOCK_TYPE_DCE,
+	.major = 1,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &amdgpu_vkms_ip_funcs,
+};
+
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
index 251881b60048..97f1b79c0724 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
@@ -23,7 +23,4 @@ struct amdgpu_vkms_output {
 	struct drm_pending_vblank_event *event;
 };
 
-int amdgpu_vkms_output_init(struct drm_device *dev,
-			    struct amdgpu_vkms_output *output, int index);
-
 #endif /* _AMDGPU_VKMS_H_ */
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index c0fcc41ee574..54f28c075f21 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -70,7 +70,7 @@
 
 #include "amdgpu_dm.h"
 #include "amdgpu_amdkfd.h"
-#include "dce_virtual.h"
+#include "amdgpu_vkms.h"
 
 static const struct amdgpu_video_codec_info cik_video_codecs_encode_array[] =
 {
@@ -2259,7 +2259,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2277,7 +2277,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2295,7 +2295,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
 		amdgpu_device_ip_block_add(adev, &kv_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2315,7 +2315,7 @@ int cik_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &cik_sdma_ip_block);
 		amdgpu_device_ip_block_add(adev, &kv_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
deleted file mode 100644
index 4d7069b2d0f9..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ /dev/null
@@ -1,223 +0,0 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#include <drm/drm_atomic_helper.h>
-
-#include "amdgpu.h"
-#ifdef CONFIG_DRM_AMDGPU_SI
-#include "dce_v6_0.h"
-#endif
-#ifdef CONFIG_DRM_AMDGPU_CIK
-#include "dce_v8_0.h"
-#endif
-#include "dce_v10_0.h"
-#include "dce_v11_0.h"
-#include "dce_virtual.h"
-#include "ivsrcid/ivsrcid_vislands30.h"
-#include "amdgpu_display.h"
-#include "amdgpu_vkms.h"
-
-const struct drm_mode_config_funcs dce_virtual_mode_funcs = {
-	.fb_create = amdgpu_display_user_framebuffer_create,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
-static int dce_virtual_sw_init(void *handle)
-{
-	int r, i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	adev_to_drm(adev)->max_vblank_count = 0;
-
-	adev_to_drm(adev)->mode_config.funcs = &dce_virtual_mode_funcs;
-
-	adev_to_drm(adev)->mode_config.max_width = XRES_MAX;
-	adev_to_drm(adev)->mode_config.max_height = YRES_MAX;
-
-	adev_to_drm(adev)->mode_config.preferred_depth = 24;
-	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
-
-	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
-
-	r = amdgpu_display_modeset_create_props(adev);
-	if (r)
-		return r;
-
-	adev->amdgpu_vkms_output = kcalloc(adev->mode_info.num_crtc, sizeof(struct amdgpu_vkms_output), GFP_KERNEL);
-
-	/* allocate crtcs, encoders, connectors */
-	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		r = amdgpu_vkms_output_init(adev_to_drm(adev), &adev->amdgpu_vkms_output[i], i);
-		if (r)
-			return r;
-	}
-
-	drm_kms_helper_poll_init(adev_to_drm(adev));
-
-	adev->mode_info.mode_config_initialized = true;
-	return 0;
-}
-
-static int dce_virtual_sw_fini(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int i = 0;
-
-	for (i = 0; i < adev->mode_info.num_crtc; i++)
-		if (adev->mode_info.crtcs[i])
-			hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
-
-	kfree(adev->mode_info.bios_hardcoded_edid);
-	kfree(adev->amdgpu_vkms_output);
-
-	drm_kms_helper_poll_fini(adev_to_drm(adev));
-
-	adev->mode_info.mode_config_initialized = false;
-	return 0;
-}
-
-static int dce_virtual_hw_init(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	switch (adev->asic_type) {
-#ifdef CONFIG_DRM_AMDGPU_SI
-	case CHIP_TAHITI:
-	case CHIP_PITCAIRN:
-	case CHIP_VERDE:
-	case CHIP_OLAND:
-		dce_v6_0_disable_dce(adev);
-		break;
-#endif
-#ifdef CONFIG_DRM_AMDGPU_CIK
-	case CHIP_BONAIRE:
-	case CHIP_HAWAII:
-	case CHIP_KAVERI:
-	case CHIP_KABINI:
-	case CHIP_MULLINS:
-		dce_v8_0_disable_dce(adev);
-		break;
-#endif
-	case CHIP_FIJI:
-	case CHIP_TONGA:
-		dce_v10_0_disable_dce(adev);
-		break;
-	case CHIP_CARRIZO:
-	case CHIP_STONEY:
-	case CHIP_POLARIS10:
-	case CHIP_POLARIS11:
-	case CHIP_VEGAM:
-		dce_v11_0_disable_dce(adev);
-		break;
-	case CHIP_TOPAZ:
-#ifdef CONFIG_DRM_AMDGPU_SI
-	case CHIP_HAINAN:
-#endif
-		/* no DCE */
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
-static int dce_virtual_hw_fini(void *handle)
-{
-	return 0;
-}
-
-static int dce_virtual_suspend(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int r;
-
-	r = drm_mode_config_helper_suspend(adev_to_drm(adev));
-	if (r)
-		return r;
-	return dce_virtual_hw_fini(handle);
-}
-
-static int dce_virtual_resume(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	int r;
-
-	r = dce_virtual_hw_init(handle);
-	if (r)
-		return r;
-	return drm_mode_config_helper_resume(adev_to_drm(adev));
-}
-
-static bool dce_virtual_is_idle(void *handle)
-{
-	return true;
-}
-
-static int dce_virtual_wait_for_idle(void *handle)
-{
-	return 0;
-}
-
-static int dce_virtual_soft_reset(void *handle)
-{
-	return 0;
-}
-
-static int dce_virtual_set_clockgating_state(void *handle,
-					  enum amd_clockgating_state state)
-{
-	return 0;
-}
-
-static int dce_virtual_set_powergating_state(void *handle,
-					  enum amd_powergating_state state)
-{
-	return 0;
-}
-
-static const struct amd_ip_funcs dce_virtual_ip_funcs = {
-	.name = "dce_virtual",
-	.early_init = NULL,
-	.late_init = NULL,
-	.sw_init = dce_virtual_sw_init,
-	.sw_fini = dce_virtual_sw_fini,
-	.hw_init = dce_virtual_hw_init,
-	.hw_fini = dce_virtual_hw_fini,
-	.suspend = dce_virtual_suspend,
-	.resume = dce_virtual_resume,
-	.is_idle = dce_virtual_is_idle,
-	.wait_for_idle = dce_virtual_wait_for_idle,
-	.soft_reset = dce_virtual_soft_reset,
-	.set_clockgating_state = dce_virtual_set_clockgating_state,
-	.set_powergating_state = dce_virtual_set_powergating_state,
-};
-
-const struct amdgpu_ip_block_version dce_virtual_ip_block =
-{
-	.type = AMD_IP_BLOCK_TYPE_DCE,
-	.major = 1,
-	.minor = 0,
-	.rev = 0,
-	.funcs = &dce_virtual_ip_funcs,
-};
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h b/drivers/gpu/drm/amd/amdgpu/dce_virtual.h
deleted file mode 100644
index ed422012c8c6..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef __DCE_VIRTUAL_H__
-#define __DCE_VIRTUAL_H__
-
-extern const struct amdgpu_ip_block_version dce_virtual_ip_block;
-
-#endif
-
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 436fb13e32f0..ff80786e3918 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -58,7 +58,7 @@
 #include "jpeg_v2_0.h"
 #include "vcn_v3_0.h"
 #include "jpeg_v3_0.h"
-#include "dce_virtual.h"
+#include "amdgpu_vkms.h"
 #include "mes_v10_1.h"
 #include "mxgpu_nv.h"
 #include "smuio_v11_0.h"
@@ -721,7 +721,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    !amdgpu_sriov_vf(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -749,7 +749,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -779,7 +779,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    is_support_sw_smu(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -802,7 +802,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    is_support_sw_smu(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -823,7 +823,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -843,7 +843,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    is_support_sw_smu(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
                 else if (amdgpu_device_has_dc_support(adev))
                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -865,7 +865,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -883,11 +883,11 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &psp_v13_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &smu_v13_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -905,7 +905,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		}
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_0_ip_block);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 7cbc2bb03bc6..e6d2f74a7976 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -44,7 +44,7 @@
 #include "dce_v6_0.h"
 #include "si.h"
 #include "uvd_v3_1.h"
-#include "dce_virtual.h"
+#include "amdgpu_vkms.h"
 #include "gca/gfx_6_0_d.h"
 #include "oss/oss_1_0_d.h"
 #include "oss/oss_1_0_sh_mask.h"
@@ -2759,7 +2759,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
 		amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC) && defined(CONFIG_DRM_AMD_DC_SI)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2777,7 +2777,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
 		amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC) && defined(CONFIG_DRM_AMD_DC_SI)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2795,7 +2795,7 @@ int si_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &si_dma_ip_block);
 		amdgpu_device_ip_block_add(adev, &si_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 		break;
 	default:
 		BUG();
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index a5e085e570f7..f7b56a746c15 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -74,7 +74,7 @@
 #include "smuio_v9_0.h"
 #include "smuio_v11_0.h"
 #include "smuio_v13_0.h"
-#include "dce_virtual.h"
+#include "amdgpu_vkms.h"
 #include "mxgpu_ai.h"
 #include "amdgpu_ras.h"
 #include "amdgpu_xgmi.h"
@@ -843,7 +843,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		}
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -863,7 +863,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -885,7 +885,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		}
 
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 		amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
@@ -909,7 +909,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
                 else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 3d21c0799037..fe9a7cc8d9eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -77,7 +77,7 @@
 #if defined(CONFIG_DRM_AMD_ACP)
 #include "amdgpu_acp.h"
 #endif
-#include "dce_virtual.h"
+#include "amdgpu_vkms.h"
 #include "mxgpu_vi.h"
 #include "amdgpu_dm.h"
 
@@ -2102,7 +2102,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v2_4_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 		break;
 	case CHIP_FIJI:
 		amdgpu_device_ip_block_add(adev, &vi_common_ip_block);
@@ -2112,7 +2112,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2132,7 +2132,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2155,7 +2155,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v3_1_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2173,7 +2173,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -2194,7 +2194,7 @@ int vi_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v3_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display)
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
-- 
2.32.0

