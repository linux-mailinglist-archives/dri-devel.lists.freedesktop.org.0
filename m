Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024024396EE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9E689B06;
	Mon, 25 Oct 2021 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C0B89A91;
 Mon, 25 Oct 2021 13:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpYCuV9kJGSo8F9nzv4IJ+DqNilYxrkqq47mOrWrUvUi3b77mEau8U9WMqTDwrYCZADNWz7ytuLPAZ06PcpeRb3IYAmjq2GL8npLG3OfsoCy21keRzAhWsGqX5qVjwg4Dy60nn1jw3HCEBBXyV+hQop0EjoTcOhotHe4Wb1kvDJprIzgwT7g3lyxeDLzcR5OjjHewBcvpgJ2CrBxkkmz2azI+Mz2dd4EZZmE2Hj02bSbwZZYlRCfuDCXGH32BGRRA1pWzdUicPCZn5Qsvk3l1HOSGmUHK2PCBJmO0tfIR/s1A77fWA5nTH+RKjFb843vtXH9Z6y5nBfVyTohKNYYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us3JNuG6N8AXoie3m/X1bgSUNsweSx6jhAEpFgOgLiA=;
 b=UmlxwRXOGAyilKcUGgAbvpzahM6Uu/aEEYlom/ydJ4zjmki75yYf0Dl9qxIkpqVg+RhdMqQmhUZP8knokCKcWGNoXJJ+A6yWbgz1la8mgARx7twog52IF7+Ugfrz7Jq9Ntk92D3Ny8DbBUBRsWb25U1fJZ6cjblYUhli7IHu0dhp32xjdG0/ov4dT7TmVHh+FlQIK/XdLuhFkwbk4UxA1URlbYXImFIEpmOWGaoFEDcWubF0FlhWLfwWaBkD6ED1l73Fkj1LLwygDFuSNzLEGL3pE2Wn81i3r2TdQ4oYNAiBOBzE6n2NxN1rgb0gSOd+zEyPA9zem++6gxYOv+VDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=us3JNuG6N8AXoie3m/X1bgSUNsweSx6jhAEpFgOgLiA=;
 b=gOePl02F2l/aDC66s6RZgfKfWjlZ6MQEGMS305or+s9qDjWiZi5Wd+1pbcAHlu3GTY21e192NOY+xgVfLRwpDqTXL6Zy8s8IRmt6LiVdxGSxzf6TnjLIbu6EEgxmEh3ncCjfgaPHJ1NPdcu8d0Eujw8UtbDobVr6fKZyuDxbANY=
Received: from MW4PR04CA0278.namprd04.prod.outlook.com (2603:10b6:303:89::13)
 by BYAPR12MB2776.namprd12.prod.outlook.com (2603:10b6:a03:67::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:00:58 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::a4) by MW4PR04CA0278.outlook.office365.com
 (2603:10b6:303:89::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Mon, 25 Oct 2021 13:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:00:58 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:00:54 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 3/8] drm: implement top-down allocation method
Date: Mon, 25 Oct 2021 18:30:26 +0530
Message-ID: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 168b5a7b-7c3a-42a6-bce8-08d997b77d31
X-MS-TrafficTypeDiagnostic: BYAPR12MB2776:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27760427C4E3458EB212C263E4839@BYAPR12MB2776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEBviGEutuXtepigL+TDNjEV71eCeExdTPhOKvR6RFTI/9gC/iRepMSb6XSSYSpqbPcjBbiQBki2gigDHp9mCzizR2lJhX6L7HJn6nEZFsgAB39SxP8ksyjhlPU9qaCHLLMmCvZBzns7g4kEXydcxualqu2GF9RD1PIq7RmcwSpVAEAUEHOZjZAyghAU3AVJ/Tr2DjVHmI9OYW8HyOIViv7DLuiDPbn5+hkODQAJ5lbMcK4KebaG51LPDQvnQEGvJyfUSCPxbrnBUX5VN9OMKUQjaSvhn6+swq1i10FsLi+2ZzqorCmV1lKg+ytbrUJrhloW88BEM7ALeH/nj7mIa9ZV3zm8xoOwXs2X+8z8PlpfDr3ffHb1v6rA0QRHBEpC/DPb62RwZKYU882gQ3/S91UIk5TUBG0VDEWGMbnLP7Tz0El5ur65wF2BYmIO+TJsQHod1PqJH7hvZgKwqd6ksmVAr9a6Nq5rB1/y9sNhzMGbkskakbFYxZrlGrRLTVKsnO2KbmtehyVzVMbGKHLsp1nO5pxiRP1J4DP9dYLj+2o9ECKkICd5urzEBw/MJW9csKSUaV68p2EXVIXEBF8dGDQUa5ST3rGyx1KRY3QkYDQIQ6Um2WDBXPbSta6Jh+GXa0TZXjbLaPnbg1Xxjd8oJ5wONEHuMy2Z9Wl6egerCxQY9dc5Kvr3Nr7H59t4YoFmtw+BXyFwpQpy1m1REbPEc9yvcR1OdPWrxA9Opja/n/Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(26005)(47076005)(70206006)(336012)(6666004)(16526019)(54906003)(110136005)(186003)(4326008)(1076003)(2616005)(70586007)(508600001)(36860700001)(2906002)(5660300002)(316002)(86362001)(83380400001)(81166007)(356005)(82310400003)(36756003)(7696005)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:00:58.3327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168b5a7b-7c3a-42a6-bce8-08d997b77d31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2776
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

Implemented a function which walk through the order list,
compares the offset and returns the maximum offset block,
this method is unpredictable in obtaining the high range
address blocks which depends on allocation and deallocation.
for instance, if driver requests address at a low specific
range, allocator traverses from the root block and splits
the larger blocks until it reaches the specific block and
in the process of splitting, lower orders in the freelist
are occupied with low range address blocks and for the
subsequent TOPDOWN memory request we may return the low
range blocks.To overcome this issue, we may go with the
below approach.

The other approach, sorting each order list entries in
ascending order and compares the last entry of each
order list in the freelist and return the max block.
This creates sorting overhead on every drm_buddy_free()
request and split up of larger blocks for a single page
request.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 42 +++++++++++++++++++++++++++++++------
 include/drm/drm_buddy.h     |  1 +
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 406e3d521903..9d3547bcc5da 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -362,6 +362,27 @@ alloc_range(struct drm_buddy_mm *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+				drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy_mm *mm,
 		    unsigned int order,
@@ -372,13 +393,22 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		if (!list_empty(&mm->free_list[i])) {
-			block = list_first_entry_or_null(&mm->free_list[i],
-							 struct drm_buddy_block,
-							 link);
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			if (!list_empty(&mm->free_list[i])) {
+				block = get_maxblock(&mm->free_list[i]);
 
-			if (block)
-				break;
+				if (block)
+					break;
+			}
+		} else {
+			if (!list_empty(&mm->free_list[i])) {
+				block = list_first_entry_or_null(&mm->free_list[i],
+								 struct drm_buddy_block,
+								 link);
+
+				if (block)
+					break;
+			}
 		}
 	}
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index c7bb5509a7ad..cd8021d2d6e7 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -28,6 +28,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

