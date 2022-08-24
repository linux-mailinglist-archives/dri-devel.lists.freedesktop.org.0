Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BC59FD24
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384F1B693B;
	Wed, 24 Aug 2022 14:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57CB6898;
 Wed, 24 Aug 2022 14:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7LPPB7bhOoRmAS1zGYyJlLoRoPjcaUdPmp1ynevTEOAQ3e2YoCNMFnl27Cjs881O5qy9jNDzIHHLxjb0vRkCLT0HyPibFLtQrgpj2xZgJPeJgrAvOALQRGbOzgDsX5gtBpKaAqYR8fmNnumePqQ3tBXPgW/m/c1f/k5gNwmb8ZraIoIpT98Yn0vgHlW2/MbAtqraT8e6QXR78J2PBNuh1YWXnjgb4sAlKUbqQYik8uMcHkkIXeQnmKK6Pc7pNFAc2pr0YXzMRm0FbLA361n++L28nl6Cq/VpcMcgwAaokurByHO5RlaWnAavWYaM95MyFCxpfDp+6QVlR+sFX2Eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxLTSJyRnDsL4mHuMW46Vuwh++MIQjo10ta1aVKEVmQ=;
 b=oWEV8HLMahbTQ7/5eu/gayLDD5VQ34p3lqGKY3t6MS3cskb1PuPzq/4CCJNWIn1uiaB5YCuAOnrf3BiJfCLpLUaFDMXyYc2GRj+7LsuaiEz1R1wXtAmc+Kn9n9yXD8PbD9iRB61O06nmc27gIKzyAVbqvm69199LT3is/+smVS5/7YiYBNeAW6flI2ZuYh9kViuszXtSxQEYAn3ZVOtzt3H1v/k9LZy43Tzy+QG0EQtibEGrnITd/jSDJZIBj2E5j/lFoYDUGeHYxve3qDOhInNd5T2huJICtfoZeCLfZiaD2W8GRZaLm0ix/prePFXiFQJheehYLRI5nFvxlWwRsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxLTSJyRnDsL4mHuMW46Vuwh++MIQjo10ta1aVKEVmQ=;
 b=kNpIjr1cFFZv0KUA5Dc9pQdT2+NmUgFXUhIZNAMD1nqlK3fef1BixkMYK5Fm/cetosyo2deSCLwH9lW/EdPgiSwr8pT3UD9mdZr/ErT/dgQqdygPjU3LWC86JDGpVIikuwGpSYnMVpsvY2Qjq02/U4DLCrMtO2T7H1TzWCvv08A=
Received: from BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::31)
 by MWHPR12MB1758.namprd12.prod.outlook.com (2603:10b6:300:10f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 14:24:08 +0000
Received: from BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::1e) by BN9P221CA0011.outlook.office365.com
 (2603:10b6:408:10a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Wed, 24 Aug 2022 14:24:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT072.mail.protection.outlook.com (10.13.176.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 14:24:08 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 24 Aug
 2022 09:24:06 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: <dri-devel@lists.freedesktop.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915: audit bo->resource usage
Date: Wed, 24 Aug 2022 10:23:51 -0400
Message-ID: <20220824142353.10293-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.36.1.74.g277cf0bc36
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1492a163-d83b-4983-a56d-08da85dc4e74
X-MS-TrafficTypeDiagnostic: MWHPR12MB1758:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAGV63V9goosvHoaPyMRWXY6JgRsNLlD8dADNSUel+XfCgVwLsDhJJLgeHbNvq9QvNmJiXqt0REsVyOKaAW8XDAqcaIxOXMI0mMsCLonQAkOdipJ84LTrKgSi3e+iAY+fMAjgA+xg4r7bIwZt+1pOVQGMkaW4RqwNtGaAItiILNnNzBRrDEOGQSesKoQUzkugRWapUOEAo/whzU+7CTF449X+w6npd7o30eMIv/CQKnJ6mvRfoqLTLniS03m3fK7WPKM2/zvDyO8vGzAZNRT6VDT/A7xdo8YW9COuytifnBJiSPT5ASlt54YKuzW3GnrS+ec8386J9rhZrR8O3jvdH7JG1h+Uuoaep56weT3DFEK1po+PlV80oTeP0m1lHtWVrbP/PhX399vL2eOb/mMl+DHbpCUcavn6eKfNxvT98UVpkE1WDOxT+XeVz57sZ7G6RfkRUY59AnjP1p9DCU1FZcCpbaQrmzZ4XQsZwhbzgvb38EhUGAbNLbJE17ffcLCJvU7nMQtvhUwclOZqgRdqnyuVZdftdKZGEEb2HovtC1gTW9xBl+hP6erP9TZlIjVirFenPRkO6wMuVOgzmuubOMCb4Lu/GRIfGBnlnRSH5Mm/WTqqoHzS5hSE+AmjQxlka5s6ryqdFJgp9P7v95jrJLhHo/mnl8H+y9T24c7lc1VmU1NUrHd3HFzUJ6mdhKe2s8FGKIWoli06u8TQXspAJA/NbEBogB5DHCLkSNJF8+H4I6VBczWNKS0qn3WWjyqIybQhkVxFllRMg9WB9dYXCkIhaeq7FAiLuHSbcy3b/wqrF4n14wcYa8PvMafTQWn
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(40480700001)(36860700001)(83380400001)(40460700003)(82740400003)(86362001)(356005)(81166007)(82310400005)(70206006)(70586007)(450100002)(8676002)(4326008)(26005)(8936002)(478600001)(110136005)(316002)(54906003)(1076003)(36756003)(2616005)(16526019)(186003)(336012)(44832011)(5660300002)(41300700001)(426003)(47076005)(2906002)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:24:08.1288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1492a163-d83b-4983-a56d-08da85dc4e74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1758
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <christian.koenig@amd.com>

Make sure we can at least move and alloc TT objects without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index bc9c432edffe03..45ce2d1f754cc4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -271,8 +271,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
 						     bdev);
-	struct ttm_resource_manager *man =
-		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	unsigned long ccs_pages = 0;
 	enum ttm_caching caching;
@@ -286,8 +284,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (!i915_tt)
 		return NULL;
 
-	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
-	    man->use_tt)
+	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
+	    ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 9a7e50534b84bb..c420d1ab605b6f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	bool clear;
 	int ret;
 
-	if (GEM_WARN_ON(!obj)) {
+	if (GEM_WARN_ON(!obj) || !bo->resource) {
 		ttm_bo_move_null(bo, dst_mem);
 		return 0;
 	}
-- 
2.36.1.74.g277cf0bc36

