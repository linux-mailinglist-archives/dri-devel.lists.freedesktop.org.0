Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C03C640B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941D389DA5;
	Mon, 12 Jul 2021 19:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6675E89D8D;
 Mon, 12 Jul 2021 19:46:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMRYQr7BnTFSvtDCrQZRKUiZxTial9C+EI62iRPrAuxtjg3bBb3aBycKMCtTx3j/c8ytLeTL2DUolBlnnNo70uWO6Y3h1GVvj7gpfIwsTdHnGqbBBLB1Cl6zBL+ITZauq8zQf6fQzDxMU8wiBKajJY6Fm7P/z4ag0i2soohA9x760wzO4a1KEm4otlOzZOGJJMX2QLwcMxDiSQ82SFl5p8A74qjYsmsmEnoskbOgF6VfJDKohoPUygrbna/UfG8eixdhLk+LiOGCsw22/fe0mlnppf7S1TOI7t3r0lex5kWX8c5WL69onimx+qkVoxktLUxMDi3qX8OiNM5IHy3HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rT2eT1AGr8g7bU7Vl1O/RS6pBcWOXVDeapSCDAwBX9k=;
 b=ge5N3afQ+B3epnErgFZsJWAFrR1v4jRNQ5kl25MzuMTWznTzL4MvCyGcxLhzMHbLYMOmJ6F99+eIouaUuUgne4w8ZH+vut9Sf3CwePhqSSBuNQFaZkXSPkZWA4Vi71U2Nq1UnFULn4oWhjRGd9FR0zpfgdL2yJRPeBapeoeqbd0B5APVroQbNPq1MzociBEO5YmFAmxSwXqiN7OdDWgPnN6TO+9i0mdgsgTQWX73fh+2WwGXu3AlJbzan2BdAob377MMO5LwgTyPoODXeducgW2u1WDPgiBjDtDPuWPChr11F+9eemrF/EJaGjVpwgImJck1FcdLxhrpWl1XaGGdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rT2eT1AGr8g7bU7Vl1O/RS6pBcWOXVDeapSCDAwBX9k=;
 b=nY6DTksZdTUKi5KJbkgxnzn0Brfye0+3iqZbJfgf7XD1bNPDcqL0gb3XsdOWLHt3Qej4jquaQjGAJrm8iAEF8hSV4jSeKD/OIU9OHVKtHli9OZyLdggdgbfzisrrHO36P1ncnAJrJVJNVh60obptPjYTIs2jtQJClaZyn4fyfRI=
Received: from MW4PR03CA0112.namprd03.prod.outlook.com (2603:10b6:303:b7::27)
 by BN9PR12MB5194.namprd12.prod.outlook.com (2603:10b6:408:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 19:46:51 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::4a) by MW4PR03CA0112.outlook.office365.com
 (2603:10b6:303:b7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Mon, 12 Jul 2021 19:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 19:46:51 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 12 Jul
 2021 14:46:49 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: replace dce_virtual with amdgpu_vkms
Date: Mon, 12 Jul 2021 12:46:29 -0700
Message-ID: <20210712194629.4569-4-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712194629.4569-1-Ryan.Taylor@amd.com>
References: <20210712194629.4569-1-Ryan.Taylor@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40565ccd-c847-41da-4b1c-08d9456dcb35
X-MS-TrafficTypeDiagnostic: BN9PR12MB5194:
X-Microsoft-Antispam-PRVS: <BN9PR12MB519417E1D3843A8C27CAFB90EA159@BN9PR12MB5194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHqmX6ecGTQyG2jgZV8/i3MmUXPFR/lv4xYJ+eGTtx7wyE2bCXCYDpmqkU/z7+fR+/RbQpC6oVAXvkGLd0uXb7HE1rBwWTfKxbEy9paEb+zKzFKE/0aHjOCzr49Fsil04iZXnIIIrncOTUGjHoKUTD1TPn7vNFo/PgmxepjwEuDk1pmsvPmSgU7vbDS7MM15agIt8cmKkCMs1lvshdqS1pYUpZ2p5NMSp5MVNBoMk1i8/rPuv6+pfv6AJjTZEBLqGqRQbwONKoflssSWVgnlReQb5WFoLIAsOaXsvJKWq2VFbjoXx+2JoFGWstvdEYDHgYeghg9OXbxdKJLfbLNpAHa8NxziJ47qnaTDxlc7glPXTYgTrNr6Zk8nj+XbFjggaN3MoWNtC4I+9Ua59Mv46HlMLAS1w9n46s4HnRSUQtpc5G/Es4Qyxi8/h6G1M9cIr1MjDZ91XOqR2UsWguOv6Bh+5COaQ1Ay80TDurIxdSWxSDBB4SOBLj9rh92CD4Vi0LV+c+MIAJbnqVfadLWE0RnaZfhZWlPHGEZPtf4ar1SuO0UyIhiLok7ROuv1UVFEssJqM1VpUoO6Mfu9uPKR+R4Mv8pi5puvufYYQW0+eyAYqJRsPWiWL30xuvJaWPgvZZcfKIjf0urQlSQm3sUkpOuwkVJ4S6yvsc2jh212M7Unq1ZkBCUxLZElfBFMchmZgfp3kPs5mfg7p863x3yp0+jAe5hVeRvm9d0nZcWBTOs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(186003)(16526019)(6666004)(70586007)(5660300002)(86362001)(83380400001)(30864003)(478600001)(36756003)(81166007)(26005)(356005)(70206006)(4326008)(8936002)(316002)(54906003)(1076003)(2906002)(336012)(2616005)(426003)(7696005)(8676002)(82310400003)(47076005)(110136005)(36860700001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:46:51.0996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40565ccd-c847-41da-4b1c-08d9456dcb35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5194
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move dce_virtual into amdgpu_vkms and update all references to
dce_virtual with amdgpu_vkms.

Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 195 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |   3 -
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 223 -----------------------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.h |  30 ---
 drivers/gpu/drm/amd/amdgpu/nv.c          |  20 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c       |  10 +-
 drivers/gpu/drm/amd/amdgpu/vi.c          |  14 +-
 8 files changed, 218 insertions(+), 280 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_virtual.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index dfcf3b39a2f6..fd9c06c5d263 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -119,8 +119,7 @@ amdgpu-y += \
 amdgpu-y += \
 	dce_v10_0.o \
 	dce_v11_0.o \
-	amdgpu_vkms.o \
-	dce_virtual.o
+	amdgpu_vkms.o
 
 # add GFX block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 58bd0d7b4602..1301df309aa4 100644
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
 
@@ -408,3 +417,189 @@ int amdgpu_vkms_output_init(struct drm_device *dev,
 
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
+	adev->amdgpu_vkms_output = kzalloc(sizeof(struct amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
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
+	.name = "dce_virtual",
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
index 5dab51fbecf3..59f850ac4204 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
@@ -23,7 +23,4 @@ struct amdgpu_vkms_output {
 	struct drm_pending_vblank_event *event;
 };
 
-int amdgpu_vkms_output_init(struct drm_device *dev,
-			    struct amdgpu_vkms_output *output, int index);
-
 #endif /* _AMDGPU_VKMS_H_ */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
deleted file mode 100644
index 18369b47eac7..000000000000
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
-	adev->amdgpu_vkms_output = kzalloc(sizeof(struct amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
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
index 94a2c0742ee5..f948f7036985 100644
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
@@ -866,7 +866,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    !amdgpu_sriov_vf(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -894,7 +894,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -924,7 +924,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    is_support_sw_smu(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -947,7 +947,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    is_support_sw_smu(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -968,7 +968,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -988,7 +988,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		    is_support_sw_smu(adev))
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
                 else if (amdgpu_device_has_dc_support(adev))
                         amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -1010,7 +1010,7 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -1028,11 +1028,11 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
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
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index b02436401d46..ece900b902fd 100644
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
@@ -975,7 +975,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		}
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -995,7 +995,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 #if defined(CONFIG_DRM_AMD_DC)
 		else if (amdgpu_device_has_dc_support(adev))
 			amdgpu_device_ip_block_add(adev, &dm_ip_block);
@@ -1017,7 +1017,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		}
 
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
-			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+			amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
 		amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
@@ -1041,7 +1041,7 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
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

