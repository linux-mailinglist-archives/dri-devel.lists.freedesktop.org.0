Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656F94AE5F8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2AB10E5FE;
	Wed,  9 Feb 2022 00:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A654310E5D7;
 Wed,  9 Feb 2022 00:24:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aimxbgssYhlJ2ep78ygozcHP58aTtY0ldaDpJNdezFFbo1zFgw7kXQPkAN4LYON7rfkp2x0bb9Pib2LI8dmnbI6ICp9WCEsBoE3ai3k6O45SEbCsm0Scwm5WSguaJMA5JeybyQzLNp0dQCIyfVw5OwD2QiJzL6A+Jcg1SEPEVrMoeohLXj9Hyq8/R6P7f+VVlutV2EwK6SU/Tz02yYGbUJbsrFtnSDwuYP0IRUjyVqxtcxOQgWWru04/7Fu2fOVs9HC2LybKOdGYrE1rqKtEP6RCcx5dNcBBaFl/CAL0ppsGdVGTPIWlRafFvezMHfVPKJbRqdEK2heGakxs1pSP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXKlWw60aZc4dfXjumE/g6YvQ6ng8izhgXIVxvlcfBQ=;
 b=RkQX1RHXSGGtu97X/JIRFK+0fpP1Gkuk6bzd+NjiEBOnsARg4zVTlBZUEvOelWyrI05NDPrZT4hFa1biep2v0rc6Wa05pBihiPUsiL8jx14OM1LEa88MYmSUvZvmlrK0YnAebQXRyDbH+1kNSp7V926JI8MzivXOY5ZT0SRDZzP7LpCRUG6c2HjACYYZSGnVzCOFvPIJUbhfBDyhtmaFa6KJquYMX9Qswu1OokJ6PPHoTfqY7oc5vu/wfSFC1o00jbm3cEOPMbdioL7Y4GY/v9qXwqGIOx3eHcw5E9IG+4TzBymof3WyOKCH7j52TUs9rdo6ZdHEk31A3sMGPz/sqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXKlWw60aZc4dfXjumE/g6YvQ6ng8izhgXIVxvlcfBQ=;
 b=WglxhTLkH8oCoU8yu0ypF4UcqWHYMphb+d3iHFUVh/vesR9MLAvSEFhUDYO9jSJefG0P70U7gHrF/4YK9cuQmmCd0lwYGd37E5h+hTw6BsXGiCZ+iLYERw+0es6/aPSzPgg3mZrrnPxpsroNVRHxH1TCKQIeBRBZvSSGAEu/r3A=
Received: from CO2PR04CA0079.namprd04.prod.outlook.com (2603:10b6:102:1::47)
 by BL0PR12MB5012.namprd12.prod.outlook.com (2603:10b6:208:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 00:23:52 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::96) by CO2PR04CA0079.outlook.office365.com
 (2603:10b6:102:1::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:51 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:50 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 06/11] drm/amdgpu: Drop concurrent GPU reset protection for
 device
Date: Tue, 8 Feb 2022 19:23:15 -0500
Message-ID: <20220209002320.6077-7-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d338f89-1125-470f-16e3-08d9eb627324
X-MS-TrafficTypeDiagnostic: BL0PR12MB5012:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB5012F1A27D13595F2DDE86EAEA2E9@BL0PR12MB5012.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pI6bIC9D5FDBwnadErqN7lrPuNJw6IF5qbuB2xNn+mnMmRyfiSx/xCozSUtBe00HOHjMMxQTAAirBj0POA/4yf1XVE0kyGRDl3R+Qr12xz1rSL581DkTWEG8NuSycZb2Ip9xCAyCgJGEq7FfMr0AV4p/pXekn9+X2VlP0NxhPqt2T9s/Ms+V9tSbjsNtDdRSOI8O2I2KU5IhPRyl0mlTUBIB/m4/Ib7XTt3sJvPRoZAUPXqVvKop72/6UJBNTh3mSzyW0iakwFTMsjCSBfTtlq8sxLEoo210R6OT6wMNFaitEdeMuCMAS1Thm9XS1l/PTc2wD3MNzFWBzd1WE6muWfUgCQcZ94FRkKc9OTE7A3qQ0j0dTznrSdQgAW+8zrCSRWQcK51CAaBnVCsiZ4aeimupyMAicXKGFU6WxjDPcOv97q+jvO6Av0SMK4v2w/9wN6p9IbW/xd6iFpA4jHpCzjuCjocHZQHOh/Vq9QTcNM/JGHNLobb/OEFVjbql5lhn+6mO2kzpHiKKmQeUfATBrurMwHHkwJql7w8HjmoxxzUtBfMa/R7OTvniZDWuqUfeXig51aKp04OwTP+bOB3we3xGjc0Lkyqnm0yAHIi/NcCkJ3EaPXLOpYabaP6jmXQeB/63lReBWdevD+tPmavQg+KdfnYplCbpoBnHoTFwELJ4QRBFiqD8wtrctTCY+Cj39N6xf7E3iP8XZd4KGR/Z7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(316002)(426003)(83380400001)(8676002)(2906002)(16526019)(8936002)(82310400004)(356005)(110136005)(54906003)(40460700003)(2616005)(70586007)(44832011)(186003)(4326008)(26005)(70206006)(1076003)(5660300002)(47076005)(86362001)(66574015)(508600001)(6666004)(7696005)(81166007)(36756003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:51.8828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d338f89-1125-470f-16e3-08d9eb627324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5012
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

Since now all GPU resets are serialzied there is no need for this.

This patch also reverts 'drm/amdgpu: race issue when jobs on 2 ring timeout'

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 89 ++--------------------
 1 file changed, 7 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7e92f2432087..e3c0ec684a85 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4817,11 +4817,10 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	return r;
 }
 
-static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
+static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 				struct amdgpu_hive_info *hive)
 {
-	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
-		return false;
+	atomic_set(&adev->in_gpu_reset, 1);
 
 	if (hive) {
 		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
@@ -4840,8 +4839,6 @@ static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
 		adev->mp1_state = PP_MP1_STATE_NONE;
 		break;
 	}
-
-	return true;
 }
 
 static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
@@ -4852,46 +4849,6 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 	up_write(&adev->reset_sem);
 }
 
-/*
- * to lockup a list of amdgpu devices in a hive safely, if not a hive
- * with multiple nodes, it will be similar as amdgpu_device_lock_adev.
- *
- * unlock won't require roll back.
- */
-static int amdgpu_device_lock_hive_adev(struct amdgpu_device *adev, struct amdgpu_hive_info *hive)
-{
-	struct amdgpu_device *tmp_adev = NULL;
-
-	if (!amdgpu_sriov_vf(adev) && (adev->gmc.xgmi.num_physical_nodes > 1)) {
-		if (!hive) {
-			dev_err(adev->dev, "Hive is NULL while device has multiple xgmi nodes");
-			return -ENODEV;
-		}
-		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			if (!amdgpu_device_lock_adev(tmp_adev, hive))
-				goto roll_back;
-		}
-	} else if (!amdgpu_device_lock_adev(adev, hive))
-		return -EAGAIN;
-
-	return 0;
-roll_back:
-	if (!list_is_first(&tmp_adev->gmc.xgmi.head, &hive->device_list)) {
-		/*
-		 * if the lockup iteration break in the middle of a hive,
-		 * it may means there may has a race issue,
-		 * or a hive device locked up independently.
-		 * we may be in trouble and may not, so will try to roll back
-		 * the lock and give out a warnning.
-		 */
-		dev_warn(tmp_adev->dev, "Hive lock iteration broke in the middle. Rolling back to unlock");
-		list_for_each_entry_continue_reverse(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			amdgpu_device_unlock_adev(tmp_adev);
-		}
-	}
-	return -EAGAIN;
-}
-
 static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
 {
 	struct pci_dev *p = NULL;
@@ -5078,22 +5035,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	reset_context.hive = hive;
 	clear_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
 
-	/*
-	 * lock the device before we try to operate the linked list
-	 * if didn't get the device lock, don't touch the linked list since
-	 * others may iterating it.
-	 */
-	r = amdgpu_device_lock_hive_adev(adev, hive);
-	if (r) {
-		dev_info(adev->dev, "Bailing on TDR for s_job:%llx, as another already in progress",
-					job ? job->base.id : -1);
-
-		/* even we skipped this reset, still need to set the job to guilty */
-		if (job && job->vm)
-			drm_sched_increase_karma(&job->base);
-		goto skip_recovery;
-	}
-
 	/*
 	 * Build list of devices to reset.
 	 * In case we are in XGMI hive mode, resort the device list
@@ -5113,6 +5054,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+
+		amdgpu_device_lock_adev(tmp_adev, hive);
+
 		/*
 		 * Try to put the audio codec into suspend state
 		 * before gpu reset started.
@@ -5264,13 +5208,12 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 		amdgpu_device_unlock_adev(tmp_adev);
 	}
 
-skip_recovery:
 	if (hive) {
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
 
-	if (r && r != -EAGAIN)
+	if (r)
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
 	return r;
 }
@@ -5493,20 +5436,6 @@ int amdgpu_device_baco_exit(struct drm_device *dev)
 	return 0;
 }
 
-static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
-{
-	int i;
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-		cancel_delayed_work_sync(&ring->sched.work_tdr);
-	}
-}
-
 /**
  * amdgpu_pci_error_detected - Called when a PCI error is detected.
  * @pdev: PCI device struct
@@ -5537,14 +5466,10 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 	/* Fatal error, prepare for slot reset */
 	case pci_channel_io_frozen:
 		/*
-		 * Cancel and wait for all TDRs in progress if failing to
-		 * set  adev->in_gpu_reset in amdgpu_device_lock_adev
-		 *
 		 * Locking adev->reset_sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		while (!amdgpu_device_lock_adev(adev, NULL))
-			amdgpu_cancel_all_tdr(adev);
+		amdgpu_device_lock_adev(adev, NULL);
 
 		/*
 		 * Block any work scheduling as we do for regular GPU reset
-- 
2.25.1

