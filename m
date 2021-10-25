Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401584396F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AFB89CA0;
	Mon, 25 Oct 2021 13:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1C989B62;
 Mon, 25 Oct 2021 13:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLmZd4XLyGOrTNwfipM+QvM/BG8aOKtJHDhQvoouWkNlu3xE0Y83xEk9z83AD1iWNyBJgwDSg5t1+/8wlg+U0vvDxF3EwjkymCv2CyliTFm83IP9aUZKh+qBd8Imx5odBC1T756BPQURj3YzULXOBN5/vm9L2JToZRAIzMYns6eANx8DKyXtxR6uUI8+PilnOmvGItR28nbBx8C4onjHuGLkPz+8j1CkBAKtZudbKr8tBEMNJ1Fi4k0TwjQhqr9ehC9tq0NneWwMhACGXZvct8/akke+JQjVIOU6OES0O1CAx68MHICN28suoCY19UtOVKfzPCE6/87QZfRaQnERpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooDZGDNLkVMjaONUkWxDKi0n1m9IvyPqSNV+7h1B0Ds=;
 b=Aci3ePQE2BGsgIUeLFELDbzcqx2ZvwQ+1rBsj5U+5fYBXM40mXhbIV6YFRQwtAgGAZEpUdam2OCES3PJteCZEWop5CT6xg+w7SzJYD9qkJTqmRebpQNXr473JFchlYj2dsb9BQE1IjNnsAkzAdoIVxvFsweEZN+B6WOPF61cU5E3Nhk02OnjpsBoxzaepuNmmVKMQ3Lo0fBJbl/XbBQxtqTj+ZPjrjQaWW92gIJjdxjhymjO1dBeDK+yRBIfmFrtRLPWFRJPzfM6+mte0AVKBt+F+YaWflrUex+dId9a89xKLi+02n9wiEjoAbmCqhCkCRbiG8cWdHH+yWGIDaEYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooDZGDNLkVMjaONUkWxDKi0n1m9IvyPqSNV+7h1B0Ds=;
 b=P0L7hkqRhFK4THG0bjesKl4E6Z+57DP8CMC0YCyDSmNatrR3V8G7Giu1KziI9N9+j8Bw1MiUzuCVZ7IO8SN6LFbHSrTdLZVCoNCKzK16S9voOY2/y8kLg5Jn6CQrXk9+meMnBvVgDmHPLaF0NfpovyDnHc/gP6Tw7JHMory5c30=
Received: from CO2PR04CA0192.namprd04.prod.outlook.com (2603:10b6:104:5::22)
 by SN1PR12MB2416.namprd12.prod.outlook.com (2603:10b6:802:2f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 13:01:05 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::93) by CO2PR04CA0192.outlook.office365.com
 (2603:10b6:104:5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Mon, 25 Oct 2021 13:01:05 +0000
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
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 13:01:04 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 25 Oct
 2021 08:01:01 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <daniel@ffwll.ch>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <matthew.auld@intel.com>, <tzimmermann@suse.de>, 
 <jani.nikula@linux.intel.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 5/8] drm: Implement method to free unused pages
Date: Mon, 25 Oct 2021 18:30:28 +0530
Message-ID: <20211025130033.1547667-3-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a21b3c99-8929-4c19-9c78-08d997b7811b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2416:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2416C4F55FD9367E35A8B867E4839@SN1PR12MB2416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iawzv+Oa07irpDTlyILTJRaU9gLV1tm1eKZjtb/DKeewrkwF4Lfat7cFDu06PY5J65I8v1CMbbenjRros+yRy10RAjUQIYVYti3veabs7Hp00v/JM14yZ+Z11fPpJbz3MH87y+gvRWGMEnGYGRFUBB4M8g7elGnqpAqbdf5vHpIFxuAG+v6z/dHNabMAQYmBwW4dhg2wkTj8Qx7OX2Ofc5bn6eCy93gwZeJ3ZNWWMmYPB47P+ymqckQ0AvciEeM2xy92PbqE+AsgPz1sEbKSembBV3bTHbfgWZGRl74nTbvD5Jte/t2t615wsuWb+d5cqxSQs11DAt655R8xkU6NHobyb3Gbxov4o7nnGj9DYPDMkvrV28GR6wAwk2WBa9ZJZl6L4s/HudMhVT8T+u5h4RTt/EaRRfdU7jkFVfSyffc57Il6mdSYFHcD0kdYH798XPHp5ej0Qr5scZWgLTd1Exu0hC0IKqsa6tz7TTn7PW7zv4JJeLo5/GeickvvIly61bWcpuhbydaDuAkeFQC3V7cc03wEV8yDjxjJWAlRDwpOzrwI69H2TDW6AB4oAkWmOM8+JaKtwbMryLKSObjQDgvuSz0MQk3YmsHqxu2Mxm/uLl7DoqVpFiiREi/M/8v3ceY4HOvXP9JD8cXNPV0Poc8WHI6BUeoRcOZQUdfrEVQJsIwlPCDb5alLXNfD6f8nP3r4fmi6zgrB1kxvPvunHaAam3cNb3ZntqfF1GedTeE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8936002)(316002)(26005)(47076005)(8676002)(6666004)(36860700001)(70586007)(336012)(82310400003)(508600001)(110136005)(186003)(54906003)(7696005)(5660300002)(2906002)(83380400001)(4326008)(426003)(81166007)(16526019)(2616005)(356005)(36756003)(86362001)(1076003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 13:01:04.8976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a21b3c99-8929-4c19-9c78-08d997b7811b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2416
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

On contiguous allocation, we round up the size
to the *next* power of 2, implement a function
to free the unused pages after the newly allocate block.

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 103 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_buddy.h     |   4 ++
 2 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 9d3547bcc5da..0da8510736eb 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -284,6 +284,109 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
+/**
+ * drm_buddy_free_unused_pages - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @actual_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
+				u64 actual_size,
+				struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	u64 actual_start;
+	u64 actual_end;
+	LIST_HEAD(dfs);
+	u64 count = 0;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry_or_null(blocks,
+					 struct drm_buddy_block,
+					 link);
+
+	if (!block)
+		return -EINVAL;
+
+	if (actual_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (actual_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+
+	actual_start = drm_buddy_block_offset(block);
+	actual_end = actual_start + actual_size - 1;
+
+	if (drm_buddy_block_is_allocated(block))
+		mark_free(mm, block);
+
+	list_add(&block->tmp_link, &dfs);
+
+	while (1) {
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (count == actual_size)
+			return 0;
+
+		if (contains(actual_start, actual_end, drm_buddy_block_offset(block),
+			(drm_buddy_block_offset(block) + drm_buddy_block_size(mm, block) - 1))) {
+			BUG_ON(!drm_buddy_block_is_free(block));
+
+			/* Allocate only required blocks */
+			mark_allocated(block);
+			mm->avail -= drm_buddy_block_size(mm, block);
+			list_add_tail(&block->link, blocks);
+			count += drm_buddy_block_size(mm, block);
+			continue;
+		}
+
+		if (drm_buddy_block_order(block) == 0)
+			continue;
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	}
+
+	return -ENOSPC;
+
+err_undo:
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_free_unused_pages);
+
 static struct drm_buddy_block *
 alloc_range(struct drm_buddy_mm *mm,
 	    u64 start, u64 end,
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index cd8021d2d6e7..1dfc80c88e1f 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
 
+int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
+				u64 actual_size,
+				struct list_head *blocks);
+
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
-- 
2.25.1

