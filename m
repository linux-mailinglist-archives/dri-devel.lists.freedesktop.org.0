Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8F4AE5F6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C9E10E3ED;
	Wed,  9 Feb 2022 00:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2060.outbound.protection.outlook.com [40.107.101.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BEB10E5FD;
 Wed,  9 Feb 2022 00:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMibF9Di2LdrJ+5P5E5o3DvnaaIsQGkpGUvgiJ1NoQOdmgEicqqVHRCbY8/PWDHgAMkT3XSG4YMOiO6gbntXc73oD/Qw6c2OEEuZEOw+qiQ9cG/re7+NyTRBGnqRI5qBV8kao5NIahH/oDzJS4wgYTejWGVNqH7623gF0fGDO+QhO760dtldjrqkJ5pbhBxgrh01lT17C+vM9XcIIAuaDof0A/MWbA/MOoUYWJ7GyZmPJz5MOT9PWw4nsKAdQKdkDvJY/CcNf0B5HCVUdffeFxx4/Aq12+zUN6JvYpL46FlGdJvCLuiZIIGSV8ejgvt+foiB+LMCkwJqeoLPyW84FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys/uEsFNf+ZsQSWOo3elYlI5iooePiA9TDEUR2ulXMI=;
 b=I7mbjwhYHtAikzXTj25oVWicQyJmR07mA3oOQOTY2CjffKvIxJVX2niKXiXrfcIvMtAhLQHuAndYIG6pKC2uVljzSCVatOasQZ+rQulaapB+tIzyRnTNFiBap+nPNDe8hq5vYIjQnrygF+RUm74WHg8T3kJv/4+9VUTtCHwGjRd/w/GOSB4aVDh7g7V2CJ156qlD+N8OvMvCSFnxGGaUU4Nd5R39RfC+yE009enj0IER2WT1UbzgMVUaZ66QWgBQSlhaPAkJz7PK2IKleVl55j0CK1OaqF4mlc/eVBODOt65ecai+UhtvEX4G5+3PoKaSIEeLdaF8ZxlLKgEueEktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys/uEsFNf+ZsQSWOo3elYlI5iooePiA9TDEUR2ulXMI=;
 b=1dHRazN5+Kcp93cbZTgPz7Jfcak6ZixygBCEHGznC4iwQd+jDr8iFUHe7Fji4fcxUZ8Aif1iRsW0uJWff2iswWN8L86EUSnPYJuTrglYTwEB8/tKARECxIoAxtEFh4RfpTlFiBvSTHm12Hu3GHRfZI1vgR0DhQvnRV1LdNHk1jc=
Received: from MWHPR10CA0055.namprd10.prod.outlook.com (2603:10b6:300:2c::17)
 by BYAPR12MB2823.namprd12.prod.outlook.com (2603:10b6:a03:96::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 00:23:54 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::b6) by MWHPR10CA0055.outlook.office365.com
 (2603:10b6:300:2c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:54 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:52 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 07/11] drm/amdgpu: Rework reset domain to be refcounted.
Date: Tue, 8 Feb 2022 19:23:16 -0500
Message-ID: <20220209002320.6077-8-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: dc516a0e-9064-4c50-4740-08d9eb627467
X-MS-TrafficTypeDiagnostic: BYAPR12MB2823:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2823AD8D2D0131CDFA741A5EEA2E9@BYAPR12MB2823.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpERlYX7lJJlEM2M+Z/vgyMkHlLjY6rugOEp/x/8sAu8t3gN7NTvvnjbB6bwF2TD3Z24MINc1wDkpZyRuRf4mVh1Wu0T4s7n7ZSaeJ/rbJElLhqtaBdkgi7IjzrmlEe2LRy4JrHEf+JsJvTOEneIfsZi1XtCBRIfbQQtZe8XWz1hG6xWWF/6v63DORSLhTTX+2rdl8q9GY2+pjKjzPi8ivISoRz8uRZFyom+u+uFre9JA1urdrp1X6r6hNlG88M8zV4tUtVfWs36jcOg8bx6mtrRIr4gcoWIOuSl3nLOO01neeOh3r7BjBfIDuLEY0ANcXxVruUdMVSrPcDp2d667JkMMwDtmXhe9NGb3Q0VkgvYCYxWehWcViidt0JcFJa84m0kuRCRoj0MzRTl493n047IWUxTpmmCNHjDeQxmavDeo7Glx8Ze2hvn0Eh/huCW68mZOJkFVXuX1sv0K3NhJop6PlyKng0HICqaKBueho/Jp5iMorjJN2mCyldx/QLAXrf0XclMps6gPkEcOzlnFDCSAnr1urfflnE8pvWe82ypQ5bu7wwtGta+dAPBchmmV1g0Ti/Lq+5uANkTVzbiT/12xkL75m3mobrklfy0QDfIt3FSWbIlOJkrxYKq3z6YXixqI/sJIPQzbu3nuqi5QqrHBawcAmA3MH631Sab1BzV1zRdtZ41dkhoLyet258x71U74seGF8kqHD28Br5sj+wOrFvqcFFUeKG4nruqQc4SFzvUCTLew8UEYxKWAwEhJFKfTorslUwrh4ijx1EnEEhCq1fXYsxQ322CAve/o+w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(44832011)(426003)(30864003)(36860700001)(2616005)(2906002)(966005)(36756003)(336012)(7696005)(26005)(16526019)(508600001)(186003)(47076005)(6666004)(5660300002)(83380400001)(8936002)(40460700003)(110136005)(54906003)(70586007)(86362001)(8676002)(70206006)(356005)(4326008)(316002)(1076003)(81166007)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:54.0008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc516a0e-9064-4c50-4740-08d9eb627467
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2823
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

The reset domain contains register access semaphor
now and so needs to be present as long as each device
in a hive needs it and so it cannot be binded to XGMI
hive life cycle.
Adress this by making reset domain refcounted and pointed
by each member of the hive and the hive itself.

v4:

Fix crash on boot witrh XGMI hive by adding type to reset_domain.
XGMI will only create a new reset_domain if prevoius was of single
device type meaning it's first boot. Otherwsie it will take a
refocunt to exsiting reset_domain from the amdgou device.

Add a wrapper around reset_domain->refcount get/put
and a wrapper around send to reset wq (Lijo)

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 40 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 35 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 29 +++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  6 ++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  6 ++-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  6 ++-
 9 files changed, 140 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 540a38fe5cd6..cb9764513df8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -813,9 +813,7 @@ struct amd_powerplay {
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
 #define AMDGPU_PRODUCT_NAME_LEN 64
-struct amdgpu_reset_domain {
-	struct workqueue_struct *wq;
-};
+struct amdgpu_reset_domain;
 
 struct amdgpu_device {
 	struct device			*dev;
@@ -1104,7 +1102,7 @@ struct amdgpu_device {
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
 	bool				ram_is_direct_mapped;
-	struct amdgpu_reset_domain	reset_domain;
+	struct amdgpu_reset_domain	*reset_domain;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e3c0ec684a85..d61bc0a0457c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2316,7 +2316,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 
 		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
 				   ring->num_hw_submission, amdgpu_job_hang_limit,
-				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
+				   timeout, adev->reset_domain->wq, ring->sched_score, ring->name);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
 				  ring->name);
@@ -2439,24 +2439,22 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
+	/**
+	 * In case of XGMI grab extra reference for reset domain for this device
+	 */
 	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		struct amdgpu_hive_info *hive;
+		if (amdgpu_xgmi_add_device(adev) == 0) {
+			struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
 
-		amdgpu_xgmi_add_device(adev);
+			if (!hive->reset_domain ||
+			    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
+				r = -ENOENT;
+				goto init_failed;
+			}
 
-		hive = amdgpu_get_xgmi_hive(adev);
-		if (!hive || !hive->reset_domain.wq) {
-			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
-			r = -EINVAL;
-			goto init_failed;
-		}
-
-		adev->reset_domain.wq = hive->reset_domain.wq;
-	} else {
-		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
-		if (!adev->reset_domain.wq) {
-			r = -ENOMEM;
-			goto init_failed;
+			/* Drop the early temporary reset domain we created for device */
+			amdgpu_reset_put_reset_domain(adev->reset_domain);
+			adev->reset_domain = hive->reset_domain;
 		}
 	}
 
@@ -3640,6 +3638,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		return r;
 	}
 
+	/*
+	 * Reset domain needs to be present early, before XGMI hive discovered
+	 * (if any) and intitialized to use reset sem and in_gpu reset flag
+	 * early on during init.
+	 */
+	adev->reset_domain = amdgpu_reset_create_reset_domain(SINGLE_DEVICE ,"amdgpu-reset-dev");
+	if (!adev->reset_domain)
+		return -ENOMEM;
+
 	/* early init functions */
 	r = amdgpu_device_ip_early_init(adev);
 	if (r)
@@ -4016,6 +4023,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	if (adev->mman.discovery_bin)
 		amdgpu_discovery_fini(adev);
 
+	amdgpu_reset_put_reset_domain(adev->reset_domain);
+	adev->reset_domain = NULL;
+
 	kfree(adev->pci_state);
 
 }
@@ -5241,7 +5251,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
 
-	if (!queue_work(adev->reset_domain.wq, &work.base))
+	if (!amdgpu_reset_domain_schedule(adev->reset_domain, &work.base))
 		return -EAGAIN;
 
 	flush_work(&work.base);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 02afd4115675..91864947063f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -96,3 +96,43 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
 	return reset_handler->restore_hwcontext(adev->reset_cntl,
 						reset_context);
 }
+
+
+void amdgpu_reset_destroy_reset_domain(struct kref *ref)
+{
+	struct amdgpu_reset_domain *reset_domain = container_of(ref,
+								struct amdgpu_reset_domain,
+								refcount);
+	if (reset_domain->wq)
+		destroy_workqueue(reset_domain->wq);
+
+	kvfree(reset_domain);
+}
+
+struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
+							     char *wq_name)
+{
+	struct amdgpu_reset_domain *reset_domain;
+
+	reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), GFP_KERNEL);
+	if (!reset_domain) {
+		DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
+		return NULL;
+	}
+
+	reset_domain->type = type;
+	kref_init(&reset_domain->refcount);
+
+	reset_domain->wq = create_singlethread_workqueue(wq_name);
+	if (!reset_domain->wq) {
+		DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
+		amdgpu_reset_put_reset_domain(reset_domain);
+		return NULL;
+
+	}
+
+	return reset_domain;
+}
+
+
+
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index e00d38d9160a..cc625e441fa0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -70,6 +70,19 @@ struct amdgpu_reset_control {
 	void (*async_reset)(struct work_struct *work);
 };
 
+
+enum amdgpu_reset_domain_type {
+	SINGLE_DEVICE,
+	XGMI_HIVE
+};
+
+struct amdgpu_reset_domain {
+	struct kref refcount;
+	struct workqueue_struct *wq;
+	enum amdgpu_reset_domain_type type;
+};
+
+
 int amdgpu_reset_init(struct amdgpu_device *adev);
 int amdgpu_reset_fini(struct amdgpu_device *adev);
 
@@ -82,4 +95,26 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
 int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
 			     struct amdgpu_reset_handler *handler);
 
+struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
+							     char *wq_name);
+
+void amdgpu_reset_destroy_reset_domain(struct kref *ref);
+
+static inline bool amdgpu_reset_get_reset_domain(struct amdgpu_reset_domain *domain)
+{
+	return kref_get_unless_zero(&domain->refcount) != 0;
+}
+
+static inline void amdgpu_reset_put_reset_domain(struct amdgpu_reset_domain *domain)
+{
+	kref_put(&domain->refcount, amdgpu_reset_destroy_reset_domain);
+}
+
+static inline bool amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *domain,
+						struct work_struct *work)
+{
+	return queue_work(domain->wq, work);
+}
+
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 89b682afe821..eb06322d2972 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -32,6 +32,8 @@
 #include "wafl/wafl2_4_0_0_smn.h"
 #include "wafl/wafl2_4_0_0_sh_mask.h"
 
+#include "amdgpu_reset.h"
+
 #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
 #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
 #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
@@ -227,6 +229,9 @@ static void amdgpu_xgmi_hive_release(struct kobject *kobj)
 	struct amdgpu_hive_info *hive = container_of(
 		kobj, struct amdgpu_hive_info, kobj);
 
+	amdgpu_reset_put_reset_domain(hive->reset_domain);
+	hive->reset_domain = NULL;
+
 	mutex_destroy(&hive->hive_lock);
 	kfree(hive);
 }
@@ -398,12 +403,24 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 		goto pro_end;
 	}
 
-	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
-	if (!hive->reset_domain.wq) {
-		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
-		kfree(hive);
-		hive = NULL;
-		goto pro_end;
+	/**
+	 * Avoid recreating reset domain when hive is reconstructed for the case
+	 * of reset the devices in the XGMI hive during probe for SRIOV
+	 * See https://www.spinics.net/lists/amd-gfx/msg58836.html
+	 */
+	if (adev->reset_domain->type != XGMI_HIVE) {
+		hive->reset_domain = amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
+			if (!hive->reset_domain) {
+				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
+				ret = -ENOMEM;
+				kobject_put(&hive->kobj);
+				kfree(hive);
+				hive = NULL;
+				goto pro_end;
+			}
+	} else {
+		amdgpu_reset_get_reset_domain(adev->reset_domain);
+		hive->reset_domain = adev->reset_domain;
 	}
 
 	hive->hive_id = adev->gmc.xgmi.hive_id;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index 2f2ce53645a5..dcaad22be492 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -42,7 +42,7 @@ struct amdgpu_hive_info {
 		AMDGPU_XGMI_PSTATE_UNKNOWN
 	} pstate;
 
-	struct amdgpu_reset_domain reset_domain;
+	struct amdgpu_reset_domain *reset_domain;
 };
 
 struct amdgpu_pcs_ras_field {
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 5869d51d8bee..6740eef84ee1 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -32,6 +32,8 @@
 #include "soc15_common.h"
 #include "mxgpu_ai.h"
 
+#include "amdgpu_reset.h"
+
 static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
 {
 	WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
@@ -308,8 +310,8 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
 		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
-			WARN_ONCE(!queue_work(adev->reset_domain.wq,
-					      &adev->virt.flr_work),
+			WARN_ONCE(!amdgpu_reset_domain_schedule(adev->reset_domain,
+								&adev->virt.flr_work),
 				  "Failed to queue work! at %s",
 				  __func__);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 5728a6401d73..e967d61c7134 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -31,6 +31,8 @@
 #include "soc15_common.h"
 #include "mxgpu_nv.h"
 
+#include "amdgpu_reset.h"
+
 static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
 {
 	WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
@@ -338,8 +340,8 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
 		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
-			WARN_ONCE(!queue_work(adev->reset_domain.wq,
-					      &adev->virt.flr_work),
+			WARN_ONCE(!amdgpu_reset_domain_schedule(adev->reset_domain,
+				   &adev->virt.flr_work),
 				  "Failed to queue work! at %s",
 				  __func__);
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index 02290febfcf4..531cfba759dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -42,6 +42,8 @@
 #include "smu/smu_7_1_3_d.h"
 #include "mxgpu_vi.h"
 
+#include "amdgpu_reset.h"
+
 /* VI golden setting */
 static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
 	mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
@@ -551,8 +553,8 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 		/* only handle FLR_NOTIFY now */
 		if (!r && !amdgpu_in_reset(adev))
-			WARN_ONCE(!queue_work(adev->reset_domain.wq,
-					      &adev->virt.flr_work),
+			WARN_ONCE(!amdgpu_reset_domain_schedule(adev->reset_domain,
+								&adev->virt.flr_work),
 				  "Failed to queue work! at %s",
 				  __func__);
 	}
-- 
2.25.1

