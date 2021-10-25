Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E264396F0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BA089B48;
	Mon, 25 Oct 2021 13:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E742589B30;
 Mon, 25 Oct 2021 13:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+mKkINbKUJSWisTXT/6xBud53cguk+pOa2p1Oe5nu1MrUzHsELJWjhtzXU9Tg/dxnc6hbUFq36OU2AeL2m6cYfnGMEjJg2AmzwndWJ+GCAhroJQJl8H/024eZyYJrUitRsxCXGeh0BnUd5OY9n2BGk1KMPEvwaMRw10nv/wd6XBqNsz2Dz99BrHUgeo88A78016+qxh53wdhmZGd6AuVpf2Fp0fFRxF59cANMv/wmSbDZ0+DX47i7zzMbYyOm2m03uistpLqpJRhtnrC+0jJH9QCUkT1x1G2zrncSvC0n9zkIa1+oHa6DaFqh3hBZ05TaP4A/q9cFfLihOp8QEMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVKfp+UasF+faPIK7HAVVvnTABrIDKneu42ZwA7LOAY=;
 b=Sm6kvoSu0yoF5PiLcJoyODKpeZtWKum1DT9FdnMEUp1y+eNVaWcjbst3G+fwImSIf8aqLTzdqrgZm3oRVgAM8n9Z3T29exbvbMWDOX6bmaHehhBVJh0qEjwaBOHe1mPH9Q3lWNH9KXkU7a8Xv+RKTZLRMLQzJaX/g7nvQQtZX/Kr/1BtGUQ/D5BQON7e1LpSxTGT+1Cyzrv/CF5bf2H1sG44nEn4UB1OkN7lvc7RbyCcb2poZw5svG+sHa8g1wSEvEF5pPC8LLDPqdliQ6v+L+JyG+tXuyt6j5DGBktF7trW4rEx1GwhdEdDerxOA9qKwQUWD5OtKWuHYhfL2aeIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVKfp+UasF+faPIK7HAVVvnTABrIDKneu42ZwA7LOAY=;
 b=5qyC3jceyWTfZAcaz5Id8eXA6CCLrfgfTaSIrPPS6JP4+I/wzNOtO9sMrQprxJ28IrZp7f4wflRmiskrSor4lS4MT+hFSeUOaVBlA/oNCWxAf/woyKzc4SIBeYM/fTZp/7Nx+zAu7emF3sn/OL7bR6EtZNcm8XlfjJQN/0B55+c=
Received: from CO2PR04CA0199.namprd04.prod.outlook.com (2603:10b6:104:5::29)
 by DM6PR12MB3961.namprd12.prod.outlook.com (2603:10b6:5:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:01:02 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::d9) by CO2PR04CA0199.outlook.office365.com
 (2603:10b6:104:5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:02 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:00:57 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 4/8] drm/i915: add top-down alloc support to i915
Date: Mon, 25 Oct 2021 18:30:27 +0530
Message-ID: <20211025130033.1547667-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3825a3-d382-4de5-dee3-08d997b77f98
X-MS-TrafficTypeDiagnostic: DM6PR12MB3961:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39619CF236952CE2D9EE051CE4839@DM6PR12MB3961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZ63zC0bYHuik878Odnf2t/da+kxMb7vRZ8UDhop89kzXcaroQofExOYCBtimzsxdbjbLbXzEz3bGyZ8A3Rjv1OAApkgu53BZtrciq7emPWMjSrmZLQfazFE020KHp7Rgrcgj+1Uw5+ad0F5nCw8r2QLUARG/MrvCLSN9LA0q1MKBKVDdDc/j/nc9TqQC3yxv9vbWRmggwhe3RukCk97dDl4/pOWU5ATy+fCBtRyexINjGxsgLc/2ZfTPAE3h4u30Nf7Wbu+/YPENK+mME1JfGGGr7xXYZj5MTQdt01lzFPG+lLnmjpznLBDqrmrZId9K811TYbkTaKwB50faPfY11CJ+bdW4vIUkVUe56bddRq6VtUW+6DbQPY0OpU+uSa9l5/PxTb6uIm7CqsDpTb702tCvxGc9eVpX0GJlEPHV7EwpN6JkeM09MUgX9FHGSvldl2e6DoLC6ezxa30tPV5nDGEVL28za6/E1b3l3seL03EIZOiulk9/Zxr9MOmNzQOYaWxFZzE9y4wrO6zE77uFcfUcBNOpBJ22vVETK1N7WfnbtS0gjuUlXPhR/jJDZngSfLv/5qafNX97SVlGkN5FgtD1NUd8OLODK6e34ITzSS3KvM6viy21Ne7m3Q/m3ZFV4Xrz7U2glfURTrrSeEEaqRvN5z9z9JxOkrBNS3FZsaqFtRcohCQFJPepes5qqxDqKpzYckYvY/SlsdzgXHd7lVKW4MH9q9R47tHy9kYFA4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(2616005)(82310400003)(70586007)(70206006)(186003)(8936002)(356005)(4744005)(26005)(426003)(16526019)(83380400001)(508600001)(316002)(8676002)(36756003)(7696005)(4326008)(1076003)(86362001)(110136005)(47076005)(2906002)(54906003)(81166007)(36860700001)(6666004)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:02.3651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3825a3-d382-4de5-dee3-08d997b77f98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3961
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

add top down allocation support to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 75197ba6e40d..963468228392 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-- 
2.25.1

