Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70B57FE93
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711589A0EF;
	Mon, 25 Jul 2022 11:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6899E9C;
 Mon, 25 Jul 2022 11:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfMEc6GEMRUSfiVRdcT6gCLQoOhOTxVO+08HVqjBBh9VhlhyWwk/DTk5KgkHTSzmlDivzLaTuFvtMbsll1DIyj6/olDmKP62BStP4jGcwvhKZ7GPjZdsDfvsUPAb44ZZcaOrevd+0LPnqO20fUsMeQ9M2ncPmKbZZbD/gDYa4AbiROJqjR4g7VJMBhvaSwHzHejElZ1QPLqVhYPip9xrO+r/WMMbzxAMUEdxElq/7xZUull914N5pI0XF/zUSGmGhan3WGhxqmYNJzZef8rvRYPEorKN6wq821N9sn20oL6uV1LXQ9ZjtaCXWiuZup3Q8rS9bG7DQ+itTPiEsE/YCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PJ2jh0XwEZtDkW+pCgWiHbQ7yCi3N35Juh2tK0fN1I=;
 b=oQuo/o+aLWMqt8jv8Q62idc4F2k1vhC59bpb8twd+wZ3xWjL1ix+NcWwPCUYZtpoFVtABLYyp5I3RMqbXOQqIdF992XDqdmJb96422ukBmaOEerXxc68yWDVH9f4akr4YnhI2iF/yr366wQAsceaM1N/OFiFcQF0L/IKRgH877tS6ky+W8aZDRrjrki01T4b5lyZ8unUsPS/wvOWk4VAcSuJ747UBoatyB3AwWBLO70mxBIHatICRExYKcxVV+Q9A0SfblFbGU3MvDSRkGMtxTGNzdQmZ0rqCa9NFw+Z9d7nFo1UBMxUmJ2wRmwjy7f1BWjr5jB+DYlqIe0+EM94/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PJ2jh0XwEZtDkW+pCgWiHbQ7yCi3N35Juh2tK0fN1I=;
 b=aqfMB3V/djHJqyzHJUOlktPfIqeFRE96tBnt69t2EHRoBYx0ylHuWsOTA4ZoDWrwEKzcdXJXpuF04N4xSX14o2MlgbaGxiQB0JzoMt+DEhuAwzOQT6E2hQnUmcolkiuKqIBz4j46/kL7HeVHl9i7QVc2jok3/0w6PVWIWa6xk98=
Received: from BN1PR14CA0004.namprd14.prod.outlook.com (2603:10b6:408:e3::9)
 by DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 11:43:35 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::36) by BN1PR14CA0004.outlook.office365.com
 (2603:10b6:408:e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Mon, 25 Jul 2022 11:43:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 11:43:35 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:43:32 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 4/6] drm/i915: Implement intersect/compatible functions
Date: Mon, 25 Jul 2022 04:42:38 -0700
Message-ID: <20220725114240.4844-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4a1213-a32c-4d87-629e-08da6e32e866
X-MS-TrafficTypeDiagnostic: DM4PR12MB5182:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBhZFK3ivGUWRl4DcLi3XdREAM5hYN+3YLUHLNmYHyfQMVp1sfx1hBZl9j/NVzP5EBaauOBcuhVEE6S8QCC9IJm1YQUEl9qzl4JihC17dPaXLiI/DSR/P8gwybU/fxH8UwhgueKY6ldkSA1ARLkrIFIG+gVMGdq6RRPJMiHsyPiu4OyMI9M4MZP4tCbz+DlaXxPx+OlVYIR70vTCy5RGieeda2HgqzsAvNf9hf/27WPOYyRPEoz0ynTlhC2ZLMS/eSUAwXqTMsO5cXF9DEOGG7NoFKoWqe9CYnADlfJoQOOSyhPL3beVSSCId4PKc3sbs6th9rKWHojHNZ/sDzkXNCyBYOnYztjqpmlaclzK3QVVIqMm+RjPFOcvEPWraXpB6zX0lUFEnBAFfe1hI4KSFBE9UqoVC8nPpb2Wken5qxZEKK1ZhMNmZk/p6gBUwSns+kWS0lASiF64qju3q+GGBoVl22GUioVb2OAIw6dZ0C3SpCzmvseVxN5MvdgfeYLBMiHMie3DHzdnnwAJnL9uLc+KTGewhl/ROZH2/s/BNOd8Ngrn06u9Cz4g2qKB0l26eBfOfAR2fgTPDTa1w/8vwxavkExshxKpku4+MKhCLBlZxHCBJgv0jzWZ/loXYl1wf64uvuAUrH9QYbtpcWwD1jMR6+iuDW4i+mCsg2MCZNhKzFC/o2Rze8hvt6hhCqY06mhitcFvFUy+qyXyZLFn8v7+whX+HiPB0F0Go9hdk7a0sPi7Qc6jMN+2VdC835GJ8/kYMJqKKdV/TZgJG0hR0bDd+SeAUFT6AfvtynBiiCxZXl5zA5Ev7VNp1WxBtzSkJp6FqdUSlVmFI6ifyNqJWQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(40470700004)(46966006)(36756003)(110136005)(82310400005)(356005)(54906003)(36860700001)(4326008)(70586007)(82740400003)(8676002)(316002)(40480700001)(81166007)(70206006)(5660300002)(41300700001)(86362001)(2906002)(2616005)(478600001)(186003)(7696005)(336012)(426003)(40460700003)(47076005)(26005)(83380400001)(1076003)(16526019)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 11:43:35.2009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4a1213-a32c-4d87-629e-08da6e32e866
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182
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

Implemented a new intersect and compatible callback function
fetching start offset from drm buddy allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a5109548abc0..b5801c05bd41 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -178,6 +178,47 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	kfree(bman_res);
 }
 
+static bool i915_ttm_buddy_man_intersect(struct ttm_resource_manager *man,
+					 struct ttm_resource *res,
+					 const struct ttm_place *place,
+					 size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &bman_res->blocks, link) {
+		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		/* Don't evict BOs outside of the requested placement range */
+		if (place->fpfn >= (start + num_pages) ||
+		    (place->lpfn && place->lpfn <= start))
+			return false;
+	}
+
+	return true;
+}
+
+static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
+					  struct ttm_resource *res,
+					  const struct ttm_place *place,
+					  size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &bman_res->blocks, link) {
+		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		if (start < place->fpfn ||
+		    (place->lpfn && (start + num_pages) > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 				     struct drm_printer *printer)
 {
@@ -205,6 +246,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
 	.alloc = i915_ttm_buddy_man_alloc,
 	.free = i915_ttm_buddy_man_free,
+	.intersect = i915_ttm_buddy_man_intersect,
+	.compatible = i915_ttm_buddy_man_compatible,
 	.debug = i915_ttm_buddy_man_debug,
 };
 
-- 
2.25.1

