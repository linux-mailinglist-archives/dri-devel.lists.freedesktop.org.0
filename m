Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB347D924
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF72E10E376;
	Wed, 22 Dec 2021 22:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143CB10E34F;
 Wed, 22 Dec 2021 22:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOKBC0+3Lz10Q0e0kOaQTtlLuKTOAUVPBrYw6slnRMiKsH1sMKuDL7r1jRVRA+M9+NMJl9dSunRkfaAmH8uvd/HfbpLaadJYrP6RFF6q1G6pUunXx3errJAGXCmGA/svACgRkd8iS8La28f2pmElvKEdaw7mbvO9kBtc5Ii+6kk/zE7tqP9nLY3yZHsHglpGeUNvijWSKB8LaAVMusWbKRDgvTnkyh7RBarKGhygAYNvcZfc657TRNoCI5pK7DvVI5yfbDooFdo9NLHlMEBiQr602VGjpc6EAP9vuYC5B6yjNtL49oaYeiS0/Aqqz47yz7AQOjIIv7mGSXrNBTz0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk+/v5Ru5WVHNwhF49eB/zlLQWIh929hS53FBd/x8jo=;
 b=XREJkiPlIjFnoP7zA+WWqyCS+EEQHwKOAkNfvxmSShuu4a3WNeXipqWtf781XarbYXLMfLy3sayfnLGsN99TzkxG1CxfcMdhar2MhkWUVosf0WmV/yy0CSG8CeNElSiUsWzeGpU0/YKyQlrdWZnPSw1peQNryRbtDE4UNCCU0J9d5gf6V36PiFqwtX3Bap2g/MCYoYK13mNsFh52qXT7ejWqObWM7nBWxq9rjhbKW+1IUZRAxS7fA+ovt3EhyNDeAY6P2ajm3SVGgMDxA1mQiLbrvIQKZpVN2iOS50Lykl49xKM5YKZr8mxCLcRFjhuotDlcgr2x0flblS/pl4pr/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk+/v5Ru5WVHNwhF49eB/zlLQWIh929hS53FBd/x8jo=;
 b=UIejDADHTDQ3ueckHqECXsw17b6XZcIYi8/mWGUU+swDyAq0nl39P9yzeuCixKoCJKElQ/Uf2Qa1W7ZbHHL8ZRpaoTBLTh+6tfCXLd/oRNFQlq8aKBegNHAS7B5Fv9P2wMtNNBzOOBTCJwoVIPzyvTWgeRpixIHuC6wk6/wx++4=
Received: from CO2PR04CA0202.namprd04.prod.outlook.com (2603:10b6:104:5::32)
 by CY4PR12MB1480.namprd12.prod.outlook.com (2603:10b6:910:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 22:05:55 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::16) by CO2PR04CA0202.outlook.office365.com
 (2603:10b6:104:5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Wed, 22 Dec 2021 22:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:05:55 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:05:54 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 2/8] drm/amdgpu: Move scheduler init to after XGMI is ready
Date: Wed, 22 Dec 2021 17:05:00 -0500
Message-ID: <20211222220506.789133-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4c354bd-30aa-4560-1def-08d9c5973a16
X-MS-TrafficTypeDiagnostic: CY4PR12MB1480:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1480122C60CCEE6AC3254586EA7D9@CY4PR12MB1480.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nst00jqddR+LwDzG0uVMp6uLxK/iK5CgdbDxyXKBFRCR1GyUvYaaOho5MhQIP/BcuEuWl7uhiS8juxpISxMHrsdRufIam41nQGMSUroA109cqI9yeoBVYx8EtSldoojbsheeAcUH6QHtO52X++m/3rDcv4tp2DnLYV3URjmIZ9xGaNwR8bTSJQekdGzP2RXS9LdctYNkzO6aCaG7z33SqFoiYNFq1qchqBbdINfKpuYfanEorEqwRdFYjm9555gB4WzE5siKv1o5xW/6z5vhiYxFmvX2sGvzQcXQjUuXrsGPF5xujLn/HNedDBk6NnHhEIyQisAs8Yw1wgc0DeH4X2UAYJHndZg2Oar6H1vz6tufG2uwi6rHzuELF3N6Az78F6iKFBz+ZenYBj10Em+8b/9YiuWRrpfcTwh2ScV5ayHFoXW4ai3o3zmPMeT5cV1UlnJhKtUIiyWYdVyaNtymNPrCDwMlUAfGQMYgUBxkJCg6LnWCi4P4HL/mj7Ajg8nUHNZ/I/gSwMKF4/qwZI85JlojFaX35+04+jrLrNN9pT8jn8C69H9mWp7+i+C5LIcl6/rKusCAtmodkrvbLxIH4aqpsTSxXZ/6ck1/tprfDdGwfKyojO/XENkOzv9BXHMWbeVDO5kBMp1pKAttmh74zIzD1s3Z2JL/Q0scjKWYlh30JxJfHGCDzjlFL89Ory0yxozjWb21dkPu8Jkje5jrYUgeEirkBYWmNQwtD8fgF463NJaT1o/SQTgLuaRK/l4OBlBmocTe9Qy7i8tmrgMGWRPbcl7FCWovGYuRQLOybLg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(6666004)(70586007)(36860700001)(2616005)(81166007)(70206006)(44832011)(26005)(336012)(47076005)(1076003)(426003)(4326008)(54906003)(16526019)(83380400001)(5660300002)(36756003)(316002)(7696005)(8676002)(40460700001)(110136005)(356005)(82310400004)(186003)(2906002)(86362001)(8936002)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:05:55.3335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c354bd-30aa-4560-1def-08d9c5973a16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1480
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
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
index 0f3e6c078f88..7c063fd37389 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
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
@@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
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
index 3b7e86ea7167..5527c68c51de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 				  atomic_t *sched_score)
 {
 	struct amdgpu_device *adev = ring->adev;
-	long timeout;
-	int r;
 
 	if (!adev)
 		return -EINVAL;
@@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
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
index 4d380e79752c..a4b8279e3011 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -253,6 +253,8 @@ struct amdgpu_ring {
 	bool			has_compute_vm_bug;
 	bool			no_scheduler;
 	int			hw_prio;
+	unsigned 		num_hw_submission;
+	atomic_t		*sched_score;
 };
 
 #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
-- 
2.25.1

