Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F4666870
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAF10E2D9;
	Thu, 12 Jan 2023 01:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531510E0D8;
 Thu, 12 Jan 2023 01:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApVEhPd6t0Osp9bUZtclyiOBcok8yP/kcBaAG4qeASH533gVXgcVJtp9+ieq9qNW4+3fwjl+0WX0auZdYmUgFpJgt0t+BblYQSB+p9aTEjsc4QQGY/gApbvwEEx9l66p8gkWiMBccVmIzjr7wuj/dMmz95k1Ln1NCaOcPArAWmkv7zUJbCE2kBXfy+VywNODJQvcdF6SO9GXRm7C2Y6Jh38K9bN4ncayb3qTbY1ULFWvGuvwq4/COc11MVJSjjd9hJUslofsWh0Yo0yr3tOgE1Y01FhgvrLL7bOPiAwJ84VRDq8KTc8JNV3ALPvmugnaAF2ZsMUuSUbGRukv+PSIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO9vkgSplNK1GjhlIU77/g7yq+zX4ASO7LfHo16F9o0=;
 b=kF5PsCt4bWZUV5hqoSTt/lEunCPWGOQPoVetS8+vDVZLVPNEKPYdFY/PKcQvyjCxF7ZK4VpeuYAikULxd83VMTnAiAytiteHlozTCbvOWiVIV3aNOqy8RQ9UOddV+FBn8o1hAKjUlqIYSDdP1i/bNNsUvFOfULGqHMcBCPVXOH6kJs8jQNsIgAEbr6E1aiXG9/qX9RXsfwlYZuwBcXBIqSSZfR1Fb0KFMRyoyJrx1eMA9W9LkjMTlgUpkHcyAVxNbswkEX9T52euIXzYjw9zVu17DjgxioP2D38mzaystuw587OArNj64eWtvuLpnGuqRq2Uiw80z7PvLRk0T5rRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qO9vkgSplNK1GjhlIU77/g7yq+zX4ASO7LfHo16F9o0=;
 b=odkvweg4bqIpYg0+rKrMoZP8Xvf5XoZ/NbmikvDP2NOMAqhSvD3mUs8PyZJOvfOrIRjFLFcRLAEHrn8WM7p/VahqLTC4xBEiwcfDlg/tOtqkn+T3g/CEYWb7qUt1MrMen13t/lNwoPX7it4dbZe0uRdf5SKY1IutcpXYIg43NeY=
Received: from MW4PR04CA0175.namprd04.prod.outlook.com (2603:10b6:303:85::30)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:28 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::bc) by MW4PR04CA0175.outlook.office365.com
 (2603:10b6:303:85::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:27 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:25 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdkfd: Improve amdgpu_vm_handle_moved
Date: Wed, 11 Jan 2023 20:31:54 -0500
Message-ID: <20230112013157.750568-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112013157.750568-1-Felix.Kuehling@amd.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|SA1PR12MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 04db2221-39b4-47d5-a32b-08daf43cdd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVswR2iLVibp+UQaQlY424/pO0+wwxj1W5ElJ1YNuZ8glWN+jzbfyW7PHgMKYmZKcCKXua3+UfUt044jUAB1dmBYUljauADxSzcWfQnOUGswKUqwNQYk2ESNsL4x1altaqeTPU+DGMkPyDIUfB2kTqvxgJE6mxBRFjzLHDVoUK/89Qhit7H7Q9kDXythwECheyYq7rMixtTDExTBZegZmcdnuUvLwDfNL+U03dtn4JvBuabS8mfStN8IQQ9edBTUY1MMnrn1TOMzcftSizksPt8cHPzSOs4wWwHPBVzuGZ33pg5L4WMMIt1VJtu3zkW3bDLPlLDVaNdypTZDCt7mPdep3w6b6QsNjRVGoQR/ThvU4BOv3QUM7CxhSm01z3bnldSIJFbqLzoS5M2SmiNALqfAOqRrOfcvUPn39Gd0Jr/Nowqkn28WK8oILAyu5N3RdY+Dx4IgWLGuLC2EH2nlUy9pbxRRqfUqio8pvsoXa1lk3w+WSsMKLIoi7hl8KY2Ng+zRoqWe7aBI1FF4Q4rzUl4WKYAC0xyrfPxBdWTbY2DTN3U0soDgooHulcdWqGny3RXultxrQ1HFYvtgMkgm2B+MoAoDNdwOYAKlz1lMVI5WK5BmJfNHdPupXYVpm2FzrYg38w0mUXJJGTrF6tJZFLwyA3w7Djw1htw/uo9Pi+2IG6JhYbT8pHkv0Vw0H0uUOtlGFfuBpvp5S99sWKo1JXIRHTCdLtk6I7LKhJ0p91I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(110136005)(2906002)(54906003)(4326008)(336012)(5660300002)(40460700003)(36860700001)(426003)(47076005)(86362001)(36756003)(66574015)(8936002)(41300700001)(8676002)(70206006)(40480700001)(70586007)(82740400003)(356005)(316002)(81166007)(450100002)(82310400005)(83380400001)(7696005)(16526019)(2616005)(6666004)(26005)(478600001)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:27.7202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04db2221-39b4-47d5-a32b-08daf43cdd8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993
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
Cc: xiaogang.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
the caller. This will be useful for handling extra BO VA mappings in
KFD VMs that are managed through the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 275da612cd87..a80d2557edb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1121,6 +1121,10 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
+	/* TODO: Is this loop still needed, or could this be handled by
+	 * amdgpu_vm_handle_moved, now that it can handle all BOs that are
+	 * reserved under p->ticket?
+	 */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		/* ignore duplicates */
 		bo = ttm_to_amdgpu_bo(e->tv.bo);
@@ -1140,7 +1144,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	r = amdgpu_vm_handle_moved(adev, vm);
+	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 271e30e34d93..23a213e4ab2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -404,7 +404,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 
 		r = amdgpu_vm_clear_freed(adev, vm, NULL);
 		if (!r)
-			r = amdgpu_vm_handle_moved(adev, vm);
+			r = amdgpu_vm_handle_moved(adev, vm, ticket);
 
 		if (r && r != -EBUSY)
 			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index dc379dc22c77..75dae2850e75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1286,11 +1286,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  * PTs have to be reserved!
  */
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm)
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket)
 {
 	struct amdgpu_bo_va *bo_va;
 	struct dma_resv *resv;
-	bool clear;
+	bool clear, unlock;
 	int r;
 
 	spin_lock(&vm->status_lock);
@@ -1313,17 +1314,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_unlock(&vm->status_lock);
 
 		/* Try to reserve the BO to avoid clearing its ptes */
-		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
+		if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
 			clear = false;
+			unlock = true;
+		/* The caller is already holding the reservation lock */
+		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+			clear = false;
+			unlock = false;
 		/* Somebody else is using the BO right now */
-		else
+		} else {
 			clear = true;
+			unlock = false;
+		}
 
 		r = amdgpu_vm_bo_update(adev, bo_va, clear);
 		if (r)
 			return r;
 
-		if (!clear)
+		if (unlock)
 			dma_resv_unlock(resv);
 		spin_lock(&vm->status_lock);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 094bb4807303..03a3314e5b43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -400,7 +400,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct amdgpu_vm *vm,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
-			   struct amdgpu_vm *vm);
+			   struct amdgpu_vm *vm,
+			   struct ww_acquire_ctx *ticket);
 void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.34.1

