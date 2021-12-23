Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460647DC3B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37E710E1C0;
	Thu, 23 Dec 2021 00:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7036510E156;
 Thu, 23 Dec 2021 00:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdX9sDCs0jMwxUSnsurIL90/U9QQwGr6DgSAEW9uK93aVQV/nM4Qq07/iqb83+XzllPEN1nU6VS5LwQQf6IJimUPzK2thpeqpIWjUs336xuWxWW9T9WLjtSRl2ZZ7zo2DKJYwfao3KM75/nS+bBuizLZvWZbywzdWGzMSBrcJRQ8FxQnCwSw2yGQN6k30KPhNfK2/Tad9STYGqbbMx4fn7UELOoOp2MrtMYb+JnNu8FGGouaMyYLaQYInBwRPNQN1oBw72nY4tH1MTQdi2Aa7qZFLyEyA1mLFEOp5WIqsmKMM4l8Bncpknw0962tECHXyyvxKRGevkmTuzSqwDXB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4UwIjO3MqWNxy2Xdwir3I2Ezu66/PLthSWw2i8Rdq0=;
 b=c6dxT2suV3ZtoEWz+pcPCgXUiE6+fRzDAqqzK7Y09iNu05NBeKxvXBzTghiSe6dXHPrmAiupt14AzgI5GRvFRsJ+xGMK/eqHKFdM5kC1WXGFLyCQnJBzuTYyyP9TA/QoUHoFS+3rY7mBA3cH0IzOwPaiv8xMZ9/gfW1EAG6N2+ZaqNsv2jSbT9BZ1l4kZ8td5JUbYQ4JuiQXmLNBvibl/T99186Gl36rWLuoIaPAhIlwe6RBofPVpcQZgqljsEAxC94/Cm99Qqh5eHxBx97IgGNQVDMVCHT/3U4a6jgFscQIXBYhZbHUZbTiZQN2nuV/qKwr1SOKvF6uXrvA7iFgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4UwIjO3MqWNxy2Xdwir3I2Ezu66/PLthSWw2i8Rdq0=;
 b=esBIcinGFlNVhBfJuxkg5vreuIsTJEZrDHDEYQjPKnWSLmREeY12Q6rpLo8+eh/P0dEabCK7wQmzJzPI4D0R9qCEZJ4q3mytT3GW0H2/t82vwbj4Tcuy468onhsSM5aMFYpU24KgD8PvWC5rEYyQA+1bKgLPgyotNKhW1Rq+kfA=
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Thu, 23 Dec
 2021 00:37:32 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::25) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:32 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:30 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 11/24] drm/amdkfd: CRIU restore sdma id for queues
Date: Wed, 22 Dec 2021 19:36:58 -0500
Message-ID: <20211223003711.13064-12-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37dede18-4a21-46c2-200a-08d9c5ac685a
X-MS-TrafficTypeDiagnostic: BL0PR12MB5506:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55061CA4D43D12C4C3ADD6D7FE7E9@BL0PR12MB5506.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Ln0uC1YRahWe5upoKpWDX2D0Vbr8e3J4okvFo7jSInfdTbbLRbNkHPlQDV/XlTb1xu/eaVpgPdx00e7dKbuPqPAZPo6KDo0mctfLw2s2BOh2SSoJEsAn4VuZwVIX7GO6yWJ72CDraQwmVVX5jvml+zuDi5vCZvecZiTBqm35sk+HPiHoO05E5gdcoBVDTZhOBy06ysFbluuYUzwlCJM8auid1HFAtlmf6hnWrlE6rFjD7hRPZpH1Otj038Fxo9PUb6ihXTYGgimqohzZXCkqwDmniWQS4pNTpGan/pW1JyTW0dMQFXjXVwiPQAEuQvn2V1zqyqvva09lFxtxpePI4y6qOjhMIpdKL6XdUDFL6hooCyYVqMw0zAorVp/DiNtQcR9dCaUgHK/G3xt/ExiW17w6RpQ6ZBecdJ0CHZRaKaae0VB94qaywRmWOI5NDOC0LZ4T+56uOG4bK4shPP50BEOPWKFaGP9BSnPaSCNyhzOcw6/t9nTK1C7b1TtEiENr6kLMdGqY9333r770ftS8mX2R6JJrMvgXBTkwIWDyoxEGiPv8n0n9kYaV6LZpjLT5jvk2KXEzGyJmelw11/Ps/uiCJ1iFQ++rYoIwaMRCEq3GFR5O/ZnlK3U16EoV03N3vLuaIYU6gn6NpmYWA18DsSTLEG3dR4Qv+2MiI20ISwSo6Aw7wR9iFj7JocT6Mzo7SRqvH33/S58uIpRMfuR+cm0TE8wNTopwryEGG5cYVoxXVbRAigejIE6N6WVT10stFaCm5PwqU8AC8RthxdJyeWevDUU9VahJRjPpOvT/bE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(47076005)(36756003)(44832011)(26005)(8936002)(316002)(7696005)(1076003)(356005)(70586007)(70206006)(36860700001)(5660300002)(82310400004)(81166007)(54906003)(2906002)(508600001)(8676002)(426003)(110136005)(83380400001)(336012)(40460700001)(16526019)(4326008)(6666004)(86362001)(2616005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:32.5107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dede18-4a21-46c2-200a-08d9c5ac685a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 David Yat Sin <david.yatsin@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

When re-creating queues during CRIU restore, restore the queue with the
same sdma id value used during CRIU dump.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>

---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 48 ++++++++++++++-----
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |  4 +-
 3 files changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 62fe28244a80..7e49f70b81b9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -58,7 +58,7 @@ static inline void deallocate_hqd(struct device_queue_manager *dqm,
 				struct queue *q);
 static int allocate_hqd(struct device_queue_manager *dqm, struct queue *q);
 static int allocate_sdma_queue(struct device_queue_manager *dqm,
-				struct queue *q);
+				struct queue *q, const uint32_t *restore_sdma_id);
 static void kfd_process_hw_exception(struct work_struct *work);
 
 static inline
@@ -308,7 +308,8 @@ static void deallocate_vmid(struct device_queue_manager *dqm,
 
 static int create_queue_nocpsch(struct device_queue_manager *dqm,
 				struct queue *q,
-				struct qcm_process_device *qpd)
+				struct qcm_process_device *qpd,
+				const struct kfd_criu_queue_priv_data *qd)
 {
 	struct mqd_manager *mqd_mgr;
 	int retval;
@@ -348,7 +349,7 @@ static int create_queue_nocpsch(struct device_queue_manager *dqm,
 			q->pipe, q->queue);
 	} else if (q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 		q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
-		retval = allocate_sdma_queue(dqm, q);
+		retval = allocate_sdma_queue(dqm, q, qd ? &qd->sdma_id : NULL);
 		if (retval)
 			goto deallocate_vmid;
 		dqm->asic_ops.init_sdma_vm(dqm, q, qpd);
@@ -1040,7 +1041,7 @@ static void pre_reset(struct device_queue_manager *dqm)
 }
 
 static int allocate_sdma_queue(struct device_queue_manager *dqm,
-				struct queue *q)
+				struct queue *q, const uint32_t *restore_sdma_id)
 {
 	int bit;
 
@@ -1050,9 +1051,21 @@ static int allocate_sdma_queue(struct device_queue_manager *dqm,
 			return -ENOMEM;
 		}
 
-		bit = __ffs64(dqm->sdma_bitmap);
-		dqm->sdma_bitmap &= ~(1ULL << bit);
-		q->sdma_id = bit;
+		if (restore_sdma_id) {
+			/* Re-use existing sdma_id */
+			if (!(dqm->sdma_bitmap & (1ULL << *restore_sdma_id))) {
+				pr_err("SDMA queue already in use\n");
+				return -EBUSY;
+			}
+			dqm->sdma_bitmap &= ~(1ULL << *restore_sdma_id);
+			q->sdma_id = *restore_sdma_id;
+		} else {
+			/* Find first available sdma_id */
+			bit = __ffs64(dqm->sdma_bitmap);
+			dqm->sdma_bitmap &= ~(1ULL << bit);
+			q->sdma_id = bit;
+		}
+
 		q->properties.sdma_engine_id = q->sdma_id %
 				get_num_sdma_engines(dqm);
 		q->properties.sdma_queue_id = q->sdma_id /
@@ -1062,9 +1075,19 @@ static int allocate_sdma_queue(struct device_queue_manager *dqm,
 			pr_err("No more XGMI SDMA queue to allocate\n");
 			return -ENOMEM;
 		}
-		bit = __ffs64(dqm->xgmi_sdma_bitmap);
-		dqm->xgmi_sdma_bitmap &= ~(1ULL << bit);
-		q->sdma_id = bit;
+		if (restore_sdma_id) {
+			/* Re-use existing sdma_id */
+			if (!(dqm->xgmi_sdma_bitmap & (1ULL << *restore_sdma_id))) {
+				pr_err("SDMA queue already in use\n");
+				return -EBUSY;
+			}
+			dqm->xgmi_sdma_bitmap &= ~(1ULL << *restore_sdma_id);
+			q->sdma_id = *restore_sdma_id;
+		} else {
+			bit = __ffs64(dqm->xgmi_sdma_bitmap);
+			dqm->xgmi_sdma_bitmap &= ~(1ULL << bit);
+			q->sdma_id = bit;
+		}
 		/* sdma_engine_id is sdma id including
 		 * both PCIe-optimized SDMAs and XGMI-
 		 * optimized SDMAs. The calculation below
@@ -1293,7 +1316,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
 }
 
 static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
-			struct qcm_process_device *qpd)
+			struct qcm_process_device *qpd,
+			const struct kfd_criu_queue_priv_data *qd)
 {
 	int retval;
 	struct mqd_manager *mqd_mgr;
@@ -1308,7 +1332,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	if (q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 		q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI) {
 		dqm_lock(dqm);
-		retval = allocate_sdma_queue(dqm, q);
+		retval = allocate_sdma_queue(dqm, q, qd ? &qd->sdma_id : NULL);
 		dqm_unlock(dqm);
 		if (retval)
 			goto out;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 499fc0ea387f..6fa43215e3e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -86,7 +86,8 @@ struct device_process_node {
 struct device_queue_manager_ops {
 	int	(*create_queue)(struct device_queue_manager *dqm,
 				struct queue *q,
-				struct qcm_process_device *qpd);
+				struct qcm_process_device *qpd,
+				const struct kfd_criu_queue_priv_data *qd);
 
 	int	(*destroy_queue)(struct device_queue_manager *dqm,
 				struct qcm_process_device *qpd,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 275aeebc58fa..25cf97d97d87 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -273,7 +273,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
 		print_queue(q);
 		break;
 
@@ -293,7 +293,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 			goto err_create_queue;
 		pqn->q = q;
 		pqn->kq = NULL;
-		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd);
+		retval = dev->dqm->ops.create_queue(dev->dqm, q, &pdd->qpd, q_data);
 		print_queue(q);
 		break;
 	case KFD_QUEUE_TYPE_DIQ:
-- 
2.17.1

