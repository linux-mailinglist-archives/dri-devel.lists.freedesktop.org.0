Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04C4AE5EA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA19610E56C;
	Wed,  9 Feb 2022 00:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00E510E489;
 Wed,  9 Feb 2022 00:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON/6CzXfzCfHa5DCOcjCLUkVA4u06FvBd4RcgKU+QNNSiQcw1gDOTCgGwF6PmpbOiL6Vqf0+sL/tgKmGvk37dolOJSBpl4LvL13iFp13CXE3pAXLkDfRw5LYd1LeN0qXfAhXfQmlifT/ykhxFL+g+JGbuh5JnXZ+VcQ6jcPUeW2kUK9kGIisoMuno/HxEbjwCO4wRyiKu2RzQjTLfO+RQnVYOOWxRC/jiWfMiFKx3rL274DpLTdTs6BwXFpqegob8fYohNmj+7jRKw5zZs2DPeNG/ZVb/vOQavkj8kmrFSLzpLQjo/6PoHSHF9HxPF2yT11k4rQwtL6q1blGl2nCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ma7hRo0GhsIkrYEx9MDZ8zTHSRMDY/YVevQV68+NOIk=;
 b=g9U7oLJmwcRBVl1HW6Xdf0uK56JDN1f2kGywyaXTIkeihrKJtljKNX93pvoz4bpx3A1LHzPFGL0LE5KdmcuVOPVTk0+pMJp/T7QMXNbYdeJL3gC4rE1vFH/kYJDejqQyx4A7woVuIFNzLO5LkHSy0W3c1W+WllE+smhs8WOXAfX7Yqgh/4HgzhG23zkx5FyKuk2Yx7mA6p8cPVaMWwrmZSCfzRat6NR+5FaXRP5qOfGWVPikdomcbbib31LHn/4LKJK3L1QT/0qHWyETtBOBw/MHCwLnlkGu6RemPcA/3N8EYdwojPb0dMAvQ2/YbvLjc7ZnD/invZlwXaTka+Pjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma7hRo0GhsIkrYEx9MDZ8zTHSRMDY/YVevQV68+NOIk=;
 b=irVLgAA+67JPUC/Cguk1n1k9nCCz7vaC/OM8vEp6EWCmTwrpI2xorXFHdl2WoslNnH2POUgwSwZa2vlxL4+Xq3LP5T2ZWiLEVu5FV44W59fhbKTbwOm1bS6mAzdOB0BHpw//Fm1CpT8+PZ7+1/ibPeEhwSbFVnCd1ltdusi0+Uc=
Received: from MWHPR11CA0025.namprd11.prod.outlook.com (2603:10b6:300:115::11)
 by DM6PR12MB5550.namprd12.prod.outlook.com (2603:10b6:5:1b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 9 Feb
 2022 00:23:46 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::c3) by MWHPR11CA0025.outlook.office365.com
 (2603:10b6:300:115::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:46 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:44 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is ready
Date: Tue, 8 Feb 2022 19:23:11 -0500
Message-ID: <20220209002320.6077-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5da3761-f4dc-47b6-a953-08d9eb626fe7
X-MS-TrafficTypeDiagnostic: DM6PR12MB5550:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5550AA3AF71CE0ADE7492339EA2E9@DM6PR12MB5550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jlWlVNVNfFbB++gpCgDfyjfwWOAoa4pfF4d4ft78unV1wBXhicvjL0Txj+zGxJsU2hof4ply2WwVh4GGyFivLhM65sf308tHnfxmG/92XgKbENhVfxFcqKdElEkEpNr+Ixc9jJ6KXmsnWMABCpM//TeygDgl4XhRe8moxeHRLHnwIfTatAOlWxFH5TVS512jLrPWySKkabpyGB+joW/yatCoS4PGo96+oKTiCUFJcXBzdxJh8je8p/tTrxGOUC7ahOnUytColuOy5PwMpM9RelwCICMjpQMbjOaTmBVP6ZNHXhoSDo7O02+EUxdXBBMYDBv73wpjXcWP44TEUQNFlLAMVyyfvFOWwFbeWinOrt6By0UO+orYaI2CO0W23BUwCnRojLaw+fGhyEA7gXXMuqnMAfVoY2GiiVclvkwV1/xSwys/326Xx5HeVKMHPWK6+p31SVDEPFTEs0yU/TAlZy/p7XdiGN4hSz69uUr0qvNS96aNwu+LnScL+e/gI7Lya3jVnglxHqUDn8y8NKqF98Qaz2d2ce6V0th3T0yxmWe57p8v4884UMTdVsCxLEsB763Lr1puoEXb6K1H3F1WFZIfcj7hjQAncQDtdYbbNhKbXphDolRPjfqbNRjOmwRp3lb7L79Dcl1IY7uPv/fCFbejrtPHpA7WyU/W4HvvUOiL6dqIcbdyjSOShC9i2DWIo5kbHoD721/MUC7E6DrpqEmjB7Hm6Mqg1rMfzrvA/ORFhm/OtlF01FYFTbmcE9RyS7WnLtz1YFFst3w8UEdgIYfLZsBKvBpyuIGJJzYdMU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700004)(46966006)(47076005)(2906002)(83380400001)(8936002)(36860700001)(44832011)(70206006)(36756003)(54906003)(110136005)(508600001)(5660300002)(7696005)(8676002)(70586007)(316002)(356005)(16526019)(6666004)(426003)(82310400004)(2616005)(81166007)(40460700003)(86362001)(186003)(336012)(1076003)(4326008)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:46.4536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5da3761-f4dc-47b6-a953-08d9eb626fe7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5550
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before we initialize schedulers we must know which reset
domain are we in - for single device there iis a single
domain per device and so single wq per device. For XGMI
the reset domain spans the entire XGMI hive and so the
reset wq is per hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
 3 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 9704b0e1fd82..00123b0013d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 	return r;
 }
 
+static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
+{
+	long timeout;
+	int r, i;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		/* No need to setup the GPU scheduler for rings that don't need it */
+		if (!ring || ring->no_scheduler)
+			continue;
+
+		switch (ring->funcs->type) {
+		case AMDGPU_RING_TYPE_GFX:
+			timeout = adev->gfx_timeout;
+			break;
+		case AMDGPU_RING_TYPE_COMPUTE:
+			timeout = adev->compute_timeout;
+			break;
+		case AMDGPU_RING_TYPE_SDMA:
+			timeout = adev->sdma_timeout;
+			break;
+		default:
+			timeout = adev->video_timeout;
+			break;
+		}
+
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+				   ring->num_hw_submission, amdgpu_job_hang_limit,
+				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
+		if (r) {
+			DRM_ERROR("Failed to create scheduler on ring %s.\n",
+				  ring->name);
+			return r;
+		}
+	}
+
+	return 0;
+}
+
+
 /**
  * amdgpu_device_ip_init - run init for hardware IPs
  *
@@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 		}
 	}
 
+	r = amdgpu_device_init_schedulers(adev);
+	if (r)
+		goto init_failed;
+
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 45977a72b5dd..fa302540c69a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 				  atomic_t *sched_score)
 {
 	struct amdgpu_device *adev = ring->adev;
-	long timeout;
-	int r;
 
 	if (!adev)
 		return -EINVAL;
@@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 	spin_lock_init(&ring->fence_drv.lock);
 	ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
 					 GFP_KERNEL);
-	if (!ring->fence_drv.fences)
-		return -ENOMEM;
 
-	/* No need to setup the GPU scheduler for rings that don't need it */
-	if (ring->no_scheduler)
-		return 0;
+	ring->num_hw_submission = num_hw_submission;
+	ring->sched_score = sched_score;
 
-	switch (ring->funcs->type) {
-	case AMDGPU_RING_TYPE_GFX:
-		timeout = adev->gfx_timeout;
-		break;
-	case AMDGPU_RING_TYPE_COMPUTE:
-		timeout = adev->compute_timeout;
-		break;
-	case AMDGPU_RING_TYPE_SDMA:
-		timeout = adev->sdma_timeout;
-		break;
-	default:
-		timeout = adev->video_timeout;
-		break;
-	}
-
-	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
-			   num_hw_submission, amdgpu_job_hang_limit,
-			   timeout, NULL, sched_score, ring->name);
-	if (r) {
-		DRM_ERROR("Failed to create scheduler on ring %s.\n",
-			  ring->name);
-		return r;
-	}
+	if (!ring->fence_drv.fences)
+		return -ENOMEM;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index fae7d185ad0d..7f20ce73a243 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -251,6 +251,8 @@ struct amdgpu_ring {
 	bool			has_compute_vm_bug;
 	bool			no_scheduler;
 	int			hw_prio;
+	unsigned 		num_hw_submission;
+	atomic_t		*sched_score;
 };
 
 #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
-- 
2.25.1

