Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AAE59AC51
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 09:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD1510E247;
	Sat, 20 Aug 2022 07:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330A110E062;
 Sat, 20 Aug 2022 07:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcKrwNTYsY1DZzj172uEBJjmFUgQo4oZlCIm1oZf8AcxKqnJ/zs/sshpAUySstJdZrAcVylI6lrEagxKT0xDjK56LT2hLQ5BeeeKOfBsuqPzU17YzTj3MxTPGO/jPxkTQdl+1h5KaqCSIJHzPBhpfqtLXJqZHmiTNg/IFsAZD2I1KRmQZWFfKEX+xgqXzgQRvNuSJ2piwEKcksZ+wSD0LOIjXrIM6+OYJ26SusE+j4ERh8LI8yBbJmt1RWOcDOpfytgjgKxBmEmDq4jlSPn1mqXwAbZC48IrYQ5V9ID7DRoYe/rUcb7W1JrshUqK70+S2lmlSZVnnjc9qVtW2wotBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfXwmkGW5HiD76e+dCwUhrgXfAr6Rp3lvcDkQcZJ6sc=;
 b=TzBfUsv7ittrMBlHiWRt96BAxaCNBJgF4fp2mn6EkRVxrmPdgwnFVEQIXqq77Rxzj8jJuOmdAWY+rf7P9WW2ZIXBbRX5DyNJg2rhvdrWWrkxWm2CXvoCOikomvRVzsl5AlhLPT8xdiMlKcdldvFKOIxNMu3ulucLPOCNujS4haOdn7i0CIu7NZlyRWFdgCwX30L2w0jUwhFX3SIvirRFjZJbjEzL9Zj//kT3kG5/tp6aubtMWmoPjnBxpTf+9BsRPBljS3HRggqmyt1Joilftp3y8uJPfCIsABMMDYUmqViYk3bknT5ecaMLJqe0jE9+Dcuw4e0+cGiIrbHIikLfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfXwmkGW5HiD76e+dCwUhrgXfAr6Rp3lvcDkQcZJ6sc=;
 b=CsvgRvJXI8YBunBq963si30Zr63FoR10jXlPNeqCG6mOZhlb6oj/wGbUHTpK9GNJxZkgny4mzrdpJfcAEvZMULBKClJOcg30s16ldh4FL3mm6+YBl/2+WQw/cYL3t4G7RKdoqsJq6lDES0oJ8xF7wefmiVA5O8pXfc/YZyKhE+8=
Received: from MW4PR03CA0006.namprd03.prod.outlook.com (2603:10b6:303:8f::11)
 by CY4PR1201MB0214.namprd12.prod.outlook.com (2603:10b6:910:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Sat, 20 Aug
 2022 07:33:34 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::e3) by MW4PR03CA0006.outlook.office365.com
 (2603:10b6:303:8f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Sat, 20 Aug 2022 07:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Sat, 20 Aug 2022 07:33:33 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sat, 20 Aug 2022 02:33:30 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v6 2/6] drm/ttm: Implement intersect/compatible functions
Date: Sat, 20 Aug 2022 00:33:00 -0700
Message-ID: <20220820073304.178444-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696c1b80-3a8d-42f1-ad09-08da827e49c6
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0214:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IS/PMycOmr4QsAamPUuK2quY9XqEzmP7dYqrOqIjnwxlFejJAI7XUqXDCJJ3Xl61Ss0LDCxqDesn2fqwphtsXCGhqRPPJGFAX18flNktYrjhYUqT/Wfcd05f9SxQJAy1GdzRA4xxBSGzKf8ixrGkI5qo19a20d1Vroo4CVGvimYzHdG/7EWknK0RDWxxBNgUkAKO5RCFNzOcfq01MQMxMbVdSrOKQ48XQ5GvZ1QAzUvM24gKVB++MfSEA0FGGFJDdjEAQORcU9B5GiftEQYQQu/+4dTdk8EOJksqe4iwzeDUHykCTSckVuHHsnk2t9X9UkplNhHic5AeiCWPsxPz58ibPsiupxKHcDyUIq/H7ei9G2R1slHcTeT4QLtdvyXNA2us0PQPJ/RP34REurb0Qulz8AhJOPY+QtbC9APIQQjTpNTGxwUpk5iQj1vShv5vDe5Fqc5dLWSOT0jQXSyV3pAIsWKQfcKJCaAbrcUkSKifHI5rgETIDny0WHLP03zNVGb0RUDEyYCBICKhJGCW7bLwaSeptv3SsL9wqRCyWZm10T32E6oqOlXXU5telJH1wBUG5o2XebYl1/iPUnyXfBK3MtQqVLP874T2ehPs5uQMbMx0CdtI/2XruwqHey8cnpd5/VU3bgneet4lBHtPljOKT+q9OweV6lBBcXBpvU4WtB8xsQOuu2AuRVCBLg9o3imnhXs09iSrO2qZasiSo4gUSQ9wNt/HvYuXhp7cRC0gX4ubTtIed45D3Q2n78opBhic/wP3IhXHH03FaUoTO0gO33w/lSnB0SWqpA3WAOjlrAl8VxY4xciUfQ5aGcyg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(40470700004)(46966006)(6666004)(336012)(478600001)(70206006)(70586007)(8936002)(41300700001)(40460700003)(5660300002)(1076003)(8676002)(40480700001)(36860700001)(86362001)(4326008)(2906002)(426003)(16526019)(186003)(47076005)(81166007)(356005)(2616005)(54906003)(26005)(82740400003)(83380400001)(82310400005)(316002)(7696005)(36756003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 07:33:33.9875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696c1b80-3a8d-42f1-ad09-08da827e49c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0214
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback functions
to ttm range manager fetching start offset from drm mm range
allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index d91666721dc6..4cfef2b3514d 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -113,6 +113,37 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	kfree(node);
 }
 
+static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (node->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= node->start))
+		return false;
+
+	return true;
+}
+
+static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	if (node->start < place->fpfn ||
+	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
+
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
 				struct drm_printer *printer)
 {
@@ -126,6 +157,8 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.alloc = ttm_range_man_alloc,
 	.free = ttm_range_man_free,
+	.intersects = ttm_range_man_intersects,
+	.compatible = ttm_range_man_compatible,
 	.debug = ttm_range_man_debug
 };
 
-- 
2.25.1

