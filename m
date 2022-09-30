Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C15F06C4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFAE10E1C1;
	Fri, 30 Sep 2022 08:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1910E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:44:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG1sx5qhJ6ZQw6KmnremZujhAmUVEKJ9iZhli+eMydRkO8CdHQ43ncbfbPLWFIEZN4C88hOZE+n03/0qHqMyRN4v8EwZxonKVjNOMhaTc5xFPCDXmDq2DR4kJ66Ln5/4uRRMKK0hY6qcLfm8qdmf9mrcqDZpARfGHyzz+XZ3VM/UnE++uftgJejnXtx5kzf1zYq/ozBxhw4JVRgg74+SoSvllGERCeFtJF2B8iGvqrbG9ba5gVLPlktG1ZLL1uBEHSbXruOmmwRiO6etgHhb45b8r+ObMYCGPwluypFGyo1JOfYgL1uPctLrVLPh2v98zyGJh5ZMtHuPIxtS86LMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovTAwTGYqpBr/VUCtH3KVkXD12PBf17GYFma5i0Rz+w=;
 b=Qi0+Iz3rCdIEyF+TscInx+nKvBkF+KjGmG+t5eHwDzQDJM7ATxZgwjpe3olF0+97IXEB1ztlwwQ/10LIOU1Z6qq1Wzho/PFmwXQQT6FTnVl3mElwn/lEKK81YPP8chOf0bbMqV9T7+0KW995sIvi7SPWcFx4kxFv8Ezz3Y1Ypn7I6rn0PNqWbssXTJDK4dz7wiD1/cRGQ0bcHdSPLheXKj7p4nQykpFqBljXKQUENrOcNRQr30NlAM+2JM5a6fz/V3i9i4MTWWrvUEmAq41MOvVlfH/s2gMveekvChcF4/iiL+fKqsiGU8z9CzuuDc6MjROyUsM6WYXE5tEAwFrNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovTAwTGYqpBr/VUCtH3KVkXD12PBf17GYFma5i0Rz+w=;
 b=QMMHdeeBD54xyDtLee3OTFlfjZ6VWiL4yRMaC/7aicZwH3lsZx7JypzSQ8aF/tcfsmP+LcDo7zBbvhqYiarGgUAyw9SO0cs4jnYLyF5eigTGWWZ946CwwIKeJq0Bm0cEYz27fStzrDzecsqb8ciZeCAtUqAPy5m7lkY57PTfPIY=
Received: from MW3PR05CA0005.namprd05.prod.outlook.com (2603:10b6:303:2b::10)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 08:44:50 +0000
Received: from CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::c4) by MW3PR05CA0005.outlook.office365.com
 (2603:10b6:303:2b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.7 via Frontend
 Transport; Fri, 30 Sep 2022 08:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT074.mail.protection.outlook.com (10.13.174.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 08:44:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 03:44:45 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <andrey.grodzovsky@amd.com>,
 <shashank.sharma@amd.com>, <amaranath.somalapuram@amd.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <sumit.semwal@linaro.org>,
 <gustavo@padovan.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <steven.price@arm.com>
Subject: [PATCH v2] drm/sched: Add NULL check for s_fence->parent
Date: Fri, 30 Sep 2022 14:14:26 +0530
Message-ID: <20220930084426.4356-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT074:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: c48204af-c742-4b6d-6814-08daa2c00991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sYzvSy/VSGWGBasSNOz6q2uo7iG4qc45roxlrZrXTvvmgElSaH32GAZmwBhZTqaQ3sR9LxK0xCIvaBIJrPAlGFsPoEEtSJ99udC32jTlMassh4G389o89ZLT4cbQAgezW07GsW4eyqdjQfyQ3QzkKz/9YQxae0IQjTeNAeCwIOhSmCEEjcs+TUNk8A/qKwdPkGlaW6Ecb3eH0mrI0Lz8GxHOuZo3QkSP6aTwjarJSZ1KNHgaIUIFkg4kpowD1kjeS/VHOCvbZ4UVfaW3LjvSBbJPmDsqTIBDQDpl7HqedQq5hsPaiGDU6pQBRuU5Sptr/uE7Loz76uSEb17jEWpxA9kGKK2vJDhd7OOouZB73HL2pwcHATtCX5TeEa411G8r8D9oc+S8F1YFj62S8fGG9XWbX6kPcdKdBoR69kiU294N7xdCuDggPbO+8fQdW6t9o2tkJvf8DW5TXzby7gTK1UXKnVlHMBYpqokPDFDw2Kud2Cq9BZ8Lvs2Qd5HzlxVWS/9XcglI6Rxy8jS9wnXBSEZqo6HiO2r9Mw9jSiFEKXpk2dbhO87HrGf/dB52miwdnboeVpxjOmCHPUereKRen4OvtnLbRDr1pp5sLqCDltxnyNOWIiSH9mSVu3NGL2z8LCWqcJ8/bX6xmIdAp9DjSehg+i+Re+gs1fmiv+EhQyhuEFp8X9CXSQxcMPTVe6PQLrttKSC2VbiJzyvoY1BAWZoTAuYPIC3Y9+zBvM2oSTU1VKzvrQfLwQT98fKlC9CU6/wHDv9YEEdVkf7Jqy7zIS1oA3WPVI8p7WVKKlWj+1pN3oD4QDol237dDWlfDkHblTrxKdnCBWVtZK5vToG4V1UxRUUPfX5QeNu3k1ABGH0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(40480700001)(83380400001)(356005)(921005)(478600001)(81166007)(82740400003)(82310400005)(36756003)(26005)(2616005)(8936002)(2906002)(47076005)(6666004)(86362001)(5660300002)(4744005)(1076003)(186003)(16526019)(316002)(4326008)(41300700001)(426003)(8676002)(36860700001)(70206006)(70586007)(40460700003)(110136005)(7696005)(336012)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 08:44:50.2416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c48204af-c742-4b6d-6814-08daa2c00991
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NULL check is added for s_fence->parent.

Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
changes in v1 : subject 'drm/sched:' was missing.

 drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4f2395d1a791..6684d88463b4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -829,7 +829,8 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 	job = list_first_entry_or_null(&sched->pending_list,
 				       struct drm_sched_job, list);
 
-	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
+	if (job && job->s_fence->parent &&
+	    dma_fence_is_signaled(job->s_fence->parent)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
 
-- 
2.25.1

