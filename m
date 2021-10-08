Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F436426689
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AA66F412;
	Fri,  8 Oct 2021 09:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC306E871;
 Fri,  8 Oct 2021 09:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqrIzzFeyX20tdLwBZ86tb4zR6H129gkiVn7Le+j1L+dm4MhmNZOBjfHllHsmX2xcTCxNgdC6dNBMV676cbX3lzZSBea1bzNDdVmsHuFM7eU0KjKOxPCLf4S6NWIg+/biw6PM6d79QmFTdOSXD4xTsuoUSQIoPY3Hmrcka82zMLsDEu3IWyLmGKyC8KfrKsHexKXVk6RcHJoCJjzBOm9TkWji1/lroGVR1e6cAtCLBfv2JFeE8lirKOR/ofbTMno/D49YmW4/79IX9je6gAtcrEfvoV+dyRe3zm5g2At9DhCIKAbNP+md9KUk/FZB3AuXAp+MKKrN4BwwyXYAh6TIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbMJ4JmsFYHaAvFNj9rfg9N8g/IyI3zux5OH0cXhHyw=;
 b=B/q2/783u+r2G215HfTtleV3rGZGilIYaq/+ulv6G5GKQ0NIKU+T9ZnY/zMKLoDA12IaiSir3ijVnRz9IWOCqsdfVckZnpk8LFNxZGn3+7P//O06jLN4PGuyJu8CvP3M16DsQ4H0Ck8HoBqHRwwMGh7z+oej5n6bRd/vDojULmFpfcxjtST0dsyVOC7hKQfJxetv1T9YU5aPAOpHEWw+5rq4VbnvamSNeerrrwiFC7Rq3Y+rAsoDmtPd6UErAJZihSZnQfRAJldNeTdCKJ2hQ1fG5b1pqruklg1yi0+i58v/1NAu6hqF2lV2Di0dNaitvid0rGHf2w7VDkCLCBY0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbMJ4JmsFYHaAvFNj9rfg9N8g/IyI3zux5OH0cXhHyw=;
 b=tO8AjV3sJxYfV4DR0vPVhr7PIMg3TaB5LHdLNGFpb/sXqa4YxUTwTni08Kc6ly2H0Uk85VuryxGyRxnxpv4ow6AHqfozkrukyKkAnP7gfZsJXH3CNu+UamT2rTrfooUPcpm0DXFK0sk70cNchgwhip10xJ3LeygttSfoWDi/ww8=
Received: from DM5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:3:13f::34)
 by CO6PR12MB5459.namprd12.prod.outlook.com (2603:10b6:303:13b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 09:17:25 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::c7) by DM5PR17CA0072.outlook.office365.com
 (2603:10b6:3:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 09:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 09:17:25 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 8 Oct 2021
 04:17:21 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH 3/5] drm/radeon: check dri root before debugfs init
Date: Fri, 8 Oct 2021 11:17:02 +0200
Message-ID: <20211008091704.27094-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb37df61-8a9a-4c8b-c777-08d98a3c715e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5459:
X-Microsoft-Antispam-PRVS: <CO6PR12MB545997108E1E3C89A97B12578BB29@CO6PR12MB5459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:72;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ens6D4J9t0FardCKM4cVqO/hglsOBG0b532CLipqaO+EON2eEUROt5npGY+HTVtbR6UgqLzyAT9pL92GeoOu9cv5Sc4MejE1sxZsDEXXGfaTduMkCGWfeLMH6msfvEsQNCwbUiKQyf7Kf8SGHv21ZhKbbdk3NF0AaaKa6KfMkdNZwUTwd1D8JBYkKODXd0esbzzw2NIwgH7iOp7mDbtqfrf4phxU1nKgh3MvjwBs6LXzwpW2xHtils8OTKHIhDBxHDy0LNVxznXy3VlxsxrWj7JHvQuAe4g4+cCpl4qRozikfdr9DUfw7gj8OZsbHwKWKuFfUvR86/pyDYsH6bHnm1ZG5XUyVjpHZZfydAkp8LnjjmsJF/YqHINa4ArNLkFWE7K4E1W2HbhJJ9l5zi0BuIfzP0mn82UkdatXPLq+qzocN6arr4eUnlNv8KlN3HeOkPC5jWj380KpGAsalkipCbKL0LXpiufWtAhA9M4vH6LTDTszMGnAC3JcEJazX5+D12er1y9qkdKSiA7Xbgib/YRvwLcbubEuxVG2UA3iiBR0TbFzwQCKuk4dZTE8mck4HkJsGYUQJmeEuHBvOicc6eHnsVlfFrHtiVzusMWrJKzMjncpjlieMiqNtGfIE9BAO0toDIOI1fh4BLdU2ijYp/QI7dIYm7+RFAz5/zDoQ0+iybs5Ky4aXWOUiSPXqIicI066Ersp+eBKKdSlXmeDT9Qm9x5jOk9ivehpsGP3hqk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(356005)(81166007)(44832011)(47076005)(86362001)(82310400003)(26005)(336012)(8936002)(2616005)(426003)(316002)(54906003)(70206006)(70586007)(36860700001)(508600001)(6666004)(66574015)(1076003)(7696005)(8676002)(16526019)(36756003)(83380400001)(186003)(6916009)(5660300002)(450100002)(2906002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:17:25.3184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb37df61-8a9a-4c8b-c777-08d98a3c715e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5459
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

Return early if dri minor root dentry is NULL.

CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: "Pan, Xinhui" <Xinhui.Pan@amd.com>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/radeon/r100.c          | 9 +++++++++
 drivers/gpu/drm/radeon/r300.c          | 3 +++
 drivers/gpu/drm/radeon/r420.c          | 3 +++
 drivers/gpu/drm/radeon/r600.c          | 3 +++
 drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++
 drivers/gpu/drm/radeon/radeon_fence.c  | 3 +++
 drivers/gpu/drm/radeon/radeon_gem.c    | 3 +++
 drivers/gpu/drm/radeon/radeon_ib.c     | 3 +++
 drivers/gpu/drm/radeon/radeon_pm.c     | 5 ++++-
 drivers/gpu/drm/radeon/radeon_ring.c   | 3 +++
 drivers/gpu/drm/radeon/radeon_ttm.c    | 3 +++
 drivers/gpu/drm/radeon/rs400.c         | 3 +++
 drivers/gpu/drm/radeon/rv515.c         | 3 +++
 13 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 2dd85ba1faa2..ae6c95b34013 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -3059,6 +3059,9 @@ void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
 			    &r100_debugfs_rbbm_info_fops);
 #endif
@@ -3069,6 +3072,9 @@ void r100_debugfs_cp_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
 			    &r100_debugfs_cp_ring_info_fops);
 	debugfs_create_file("r100_cp_csq_fifo", 0444, root, rdev,
@@ -3081,6 +3087,9 @@ void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("r100_mc_info", 0444, root, rdev,
 			    &r100_debugfs_mc_info_fops);
 #endif
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 621ff174dff3..b22969e2394f 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -618,6 +618,9 @@ static void rv370_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("rv370_pcie_gart_info", 0444, root, rdev,
 			    &rv370_debugfs_pcie_gart_info_fops);
 #endif
diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
index 7e6320e8c6a0..cdb4ac3e346b 100644
--- a/drivers/gpu/drm/radeon/r420.c
+++ b/drivers/gpu/drm/radeon/r420.c
@@ -494,6 +494,9 @@ void r420_debugfs_pipes_info_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("r420_pipes_info", 0444, root, rdev,
 			    &r420_debugfs_pipes_info_fops);
 #endif
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index ca3fcae2adb5..d8f525cf0c3b 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -4360,6 +4360,9 @@ static void r600_debugfs_mc_info_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("r600_mc_info", 0444, root, rdev,
 			    &r600_debugfs_mc_info_fops);

diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index ec867fa880a4..cf06da89bb7c 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -771,6 +771,9 @@ void radeon_mst_debugfs_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("radeon_mst_info", 0444, root, rdev,
 			    &radeon_debugfs_mst_info_fops);

diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 73e3117420bf..11f30349de46 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -1006,6 +1006,9 @@ void radeon_debugfs_fence_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
 			    &radeon_debugfs_gpu_reset_fops);
 	debugfs_create_file("radeon_fence_info", 0444, root, rdev,
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 458f92a70887..e6df1451af37 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -890,6 +890,9 @@ void radeon_gem_debugfs_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("radeon_gem_info", 0444, root, rdev,
 			    &radeon_debugfs_gem_info_fops);

diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
index 62b116727b4f..28316eb4fd49 100644
--- a/drivers/gpu/drm/radeon/radeon_ib.c
+++ b/drivers/gpu/drm/radeon/radeon_ib.c
@@ -311,6 +311,9 @@ static void radeon_debugfs_sa_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("radeon_sa_info", 0444, root, rdev,
 			    &radeon_debugfs_sa_info_fops);
 #endif
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index c67b6ddb29a4..c09e574d04f0 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1958,6 +1958,9 @@ static void radeon_debugfs_pm_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("radeon_pm_info", 0444, root, rdev,
 			    &radeon_debugfs_pm_info_fops);

diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
index 7e207276df37..31a5b1ebf7c9 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -550,6 +550,9 @@ static void radeon_debugfs_ring_init(struct radeon_device *rdev, struct radeon_r
 	const char *ring_name = radeon_debugfs_ring_idx_to_name(ring->idx);
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	if (ring_name)
 		debugfs_create_file(ring_name, 0444, root, ring,
 				    &radeon_debugfs_ring_info_fops);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 11b21d605584..2e18ec93768d 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -942,6 +942,9 @@ static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
 	struct drm_minor *minor = rdev->ddev->primary;
 	struct dentry *root = minor->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("radeon_vram", 0444, root, rdev,
 			    &radeon_ttm_vram_fops);

diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 6383f7a34bd8..b41a903a29c3 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -380,6 +380,9 @@ static void rs400_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("rs400_gart_info", 0444, root, rdev,
 			    &rs400_debugfs_gart_info_fops);
 #endif
diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index 63fb06e8e2d7..f39b6ab554f2 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -257,6 +257,9 @@ void rv515_debugfs(struct radeon_device *rdev)
 #if defined(CONFIG_DEBUG_FS)
 	struct dentry *root = rdev->ddev->primary->debugfs_root;

+	if (!root)
+		return;
+
 	debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
 			    &rv515_debugfs_pipes_info_fops);
 	debugfs_create_file("rv515_ga_info", 0444, root, rdev,
--
2.32.0

