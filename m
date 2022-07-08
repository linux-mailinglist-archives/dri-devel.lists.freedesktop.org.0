Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080DD56B579
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB46010F946;
	Fri,  8 Jul 2022 09:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9311D10F946;
 Fri,  8 Jul 2022 09:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChmztFi/3xNfMNZDu/rh1fd9kvzlOykyeVbCqKNLIj63yCc+FbYo+HkV5nVSc61Q8/WEyHP2+hjNjlF851LcOX4sGcomRVksteTL+VwYV2zUV67hf07XMrB+MhGrKRBln08oi8ZoFlGuxNQkHP/T5ngbZQ5MtBkNVm2cpvVOoRMHfnqFNq88m0uaAByWanFRZRN0r0izjLtsofHc7XrjEEvhYYdyVZGM+v60h/u4IpqNKBCv7/hHpF+uS4wXkiYLTWQvnL29CTSEub0il0xGYEO7mDGzYCzB5aTqPKn9ih1p+eFYTINPEfeo/J+S3Q0WhN3zOjsc3Cj4A4kHK8t+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCV3fWk18eMub4Jz3A2q6IaY00+0UNYWvjO7dIEY7jQ=;
 b=bwtK5hbbcDEsJVJcimML3byeZYb7PSDLKFww6Pydk8fLYgRLeH8CxPwZlETSo2tXW5MNMWF9gKuyK7GVmqCW5RK4AotuL1l6ezaueXYvpKV/QI1n6W+0cC2g9Hrpu7xT2hzDUgqwJ4zOxgCkz9oxKAB/SG4omVMQm5vcTZy56l1DJtpxUe0wkhgSAZi0J0Cx3jht0/ndoHLFjsuVtAhxtxQES5iJrtCmnxhckgeJRwM4uqW1bqWZHdRb4+96//5i/8W4YHk+TsgBJ5iiBR47pc9b6ZOMWgengPg/CgUrWe3h89kodi+5E0g4h6mvr9WMPb2Nfq/VMhN6XWUVah7CVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCV3fWk18eMub4Jz3A2q6IaY00+0UNYWvjO7dIEY7jQ=;
 b=pXgxhGQ/YIqFnfO7p5iRg4c/9diMrexNyxqbU6jnNyQWqTZIwpgznABwF7C0OfJjCDQEMfCGCrnM9uvFut7kAq5CgshB6h1Ac4DxR4MiU/bnMLQMN8TVvr1Cy8/VhYufUrCl24iXkPBBAJQmXZ4sy6V8gEyt2oPNUrrboWde2Q0=
Received: from MW4PR03CA0326.namprd03.prod.outlook.com (2603:10b6:303:dd::31)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 09:32:46 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::98) by MW4PR03CA0326.outlook.office365.com
 (2603:10b6:303:dd::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 09:32:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 09:32:45 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 8 Jul 2022 04:32:42 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function into
 the C file"
Date: Fri, 8 Jul 2022 02:30:45 -0700
Message-ID: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebebcfc5-fe2d-4fcb-e407-08da60c4d0ab
X-MS-TrafficTypeDiagnostic: DS7PR12MB5839:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKUUdm+rct6LGIh0x/tU1zZOxQrxfdKNuLrus3kJWS4VLDVLwLhjHljQC1DOVaVcdCJYb4ALK6fnODx2/uZ++zXFRH8zSUGvu5qsG1R6w3f/P8A3RD8Gp47YhYO9QZH/z/vpfzpOpp2ER/Xyzlt56BVJjGBKn15wHHo+nkYGCNKrIz+7qMl4+Pjdz7O6KtLHuRb35APPiEeW51Q0/gTm/CSW8xPiyrcTh1WLm3MWYIPFlkd/1tVZWWQE2yved+Cl3RrC5KQVlaPpXofblpsErJpVFf2XS/qmAyCSPhKi6sGjyrEnKfzXF8dWWmn2n46+o5H7mPUpYTea8xXbllLOok9vnyqNxrJuf7Rmwt4gSstkyU300CLIlGDCRG2JH+HQLiSyxfk2BgZNp+w8TBsAvfyYx5XPW/rH2WOwB2K8ViPyuLn++85KKPoAX5nCx0shdblfreZWZr/dUU0Nszw0Pp82+m3Ey/eoleyT1HnH0EDhUi2pmix1ePQVonvt/ciYOYnCeXuc8tRkilW6iEf9HRJzfCg682+M7gxGamGadiIBSkFX87c/qPeowQkl67plevSSiKbFpqqt/w8tSPHldtRgTa1skm3HWKXMnvDW8pAo7UqjmTxQd4z6JPloNCLINfvvQnjDZjN+EEC/Ef7eTHJFawpndqlvJU/QhplD1qrzRFlUgihjvfR63TaR6N/m1vPO6NMy7r7E3vWPaPp9vxXEsqdYRLpyCyNL4acCNF2eaXMrbPl9a3U6WUG2qpFNzJjWaDEPTplsm19f9qEAVcHS1QRpu7yYAbkPzzVQiMuM4y2TGS5xvEZ5lvGgGz6kSf8Ih+x7R2rUOpP91vKe3LH725oKfvR9VsSSNj5mOf4gH72gq9MbgGg2K2Mip2Dv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(40470700004)(81166007)(54906003)(82310400005)(83380400001)(356005)(40480700001)(36756003)(316002)(5660300002)(7696005)(86362001)(186003)(8936002)(16526019)(47076005)(426003)(336012)(70206006)(34020700004)(110136005)(36860700001)(82740400003)(41300700001)(26005)(8676002)(450100002)(4326008)(70586007)(478600001)(40460700003)(2906002)(1076003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 09:32:45.5254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebebcfc5-fe2d-4fcb-e407-08da60c4d0ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Arunpravin
 Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 708d19d9f362766147cab79eccae60912c6d3068.

This is part of a revert of the following commits:
commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")

[WHY]
Few users reported garbaged graphics as soon as x starts,
reverting until this can be resolved.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 --------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 27 ++++++++++++++++++
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7a5e8a7b4a1b..51d9d3a4456c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -50,35 +50,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
 	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
 }
 
-static inline struct drm_buddy_block *
-amdgpu_vram_mgr_first_block(struct list_head *list)
-{
-	return list_first_entry_or_null(list, struct drm_buddy_block, link);
-}
-
-static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct list_head *head)
-{
-	struct drm_buddy_block *block;
-	u64 start, size;
-
-	block = amdgpu_vram_mgr_first_block(head);
-	if (!block)
-		return false;
-
-	while (head != block->link.next) {
-		start = amdgpu_vram_mgr_block_start(block);
-		size = amdgpu_vram_mgr_block_size(block);
-
-		block = list_entry(block->link.next, struct drm_buddy_block, link);
-		if (start + size != amdgpu_vram_mgr_block_start(block))
-			return false;
-	}
-
-	return true;
-}
-
-
-
 /**
  * DOC: mem_info_vram_total
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 4b267bf1c5db..9a2db87186c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -53,6 +53,33 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
 	return PAGE_SIZE << drm_buddy_block_order(block);
 }
 
+static inline struct drm_buddy_block *
+amdgpu_vram_mgr_first_block(struct list_head *list)
+{
+	return list_first_entry_or_null(list, struct drm_buddy_block, link);
+}
+
+static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct list_head *head)
+{
+	struct drm_buddy_block *block;
+	u64 start, size;
+
+	block = amdgpu_vram_mgr_first_block(head);
+	if (!block)
+		return false;
+
+	while (head != block->link.next) {
+		start = amdgpu_vram_mgr_block_start(block);
+		size = amdgpu_vram_mgr_block_size(block);
+
+		block = list_entry(block->link.next, struct drm_buddy_block, link);
+		if (start + size != amdgpu_vram_mgr_block_start(block))
+			return false;
+	}
+
+	return true;
+}
+
 static inline struct amdgpu_vram_mgr_resource *
 to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.25.1

