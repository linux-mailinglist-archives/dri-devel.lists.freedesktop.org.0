Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF204C005E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286E010EA47;
	Tue, 22 Feb 2022 17:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6000F10EA0F;
 Tue, 22 Feb 2022 17:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb9i04C5ad1VNsgc3GkzzLBFu4rIgn0GuIzoUEWXKnBNshg26Aqp9bzGjX39klaT4G07LWJeLth9AI0ep9kGvOpgT8/7mIVRk+PcQvpV05UTBSGJgZLMXiWjZ9uKIEBgUnCGGBV9mH/OCX5KQsGdm9PSbgPSP9rhEZfuQpyJZZxx3N8XGpL3qA/UB98A4HX93EEVwBYpQzBIH9sJgBOfzI0G8apsaHjZxLnPesgWm/7FZ0w8gJAFKR3ho4MxvBSLm2kM/p3iATYI+KcXHafVI9e9E+3WTayVEKNQaKToP1TwguyH2lZ1AangEtnQTjx7iWDsLAeT/eNk561t+3BlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alBm/1wz+RQqDqy4aIQkCqT0LV9IgBPEYD9sZKwMZY4=;
 b=mappCAYbYa6hldtNzNUIfJm+WaEDN6NI5mFE707W0qIv4NHtqxz9G79UQDRr9i+mZ3D6ci5oGNh0Ys451vZHwWURHNK1zKeVhoXiIVe1oWnWImUR8rqqbez9E1M4I7idiWpYqroam22FkY0EoiUweYiiQ8EgLUYTBV6R5KxpEGwMe0/VP8bxlo7XfcUjwi9/OZf1ClB4+7qFTyP7dF1zi9BNigaZDDhaAmOC50CFOGfSwLQnDdc0UjAAgo/G483Fh0TwnxOtIpvxmG+E44p7mkFXRwRJNI/in2r91Yn2h7Mg5K0YxUg6BxGyze1AlNDAVnsIoWfm8EGXPokJGpHgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alBm/1wz+RQqDqy4aIQkCqT0LV9IgBPEYD9sZKwMZY4=;
 b=ei6ivWm/eupSr0yNWLvG9KodRYJ5dxNxKlqg9H9Ft5URdTJrFf3ZqavLeJcVilBAHGaD/Td5tIMhXKyszd19RK5DrR+6VZi4qGnZ7ETr6cLeWsgvd513Gl325xQgOdhdmeZBWlOYx2MUWp6sCEVdEhvKSKaZpFfdYOtjilHxFiY=
Received: from DS7PR06CA0037.namprd06.prod.outlook.com (2603:10b6:8:54::12) by
 BYAPR12MB2950.namprd12.prod.outlook.com (2603:10b6:a03:131::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 17:49:19 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::cb) by DS7PR06CA0037.outlook.office365.com
 (2603:10b6:8:54::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Tue, 22 Feb 2022 17:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 17:49:19 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 11:49:11 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/7] drm/selftests: add drm buddy alloc limit testcase
Date: Tue, 22 Feb 2022 23:18:40 +0530
Message-ID: <20220222174845.2175-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222174845.2175-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220222174845.2175-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd823394-e4dc-4d71-0eb5-08d9f62ba6da
X-MS-TrafficTypeDiagnostic: BYAPR12MB2950:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB295099966C6DA510E1215C2DE43B9@BYAPR12MB2950.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQbFcG0nKHR1IsQHN8W9AVasC9GYfVBQmMFjrSNLx2Gz1/fvBdw0+n965XF/tcFeCgH7yXWNSxsB3dZexSsUVIzg3GStm5uG02C9gNJ+2ehWhwzd5WJxRBlSHE2uHOjAoD6lSWVtzxmxnqw7v+JvIku10h4ns4E3Kn14qBa33kkiuTMQfZe2BvXMB81pgGevrDQviAxtEc4EkQ1TTcPD8xqXifoildvCtPw4srfxBLf4WLwdvgLuf3EjaW/90DNVspJr7UzolyV2pizCUXA5XBRaKc8hQ7DO2uBUb8rvxGnpYkfGOFRe7kAWn8kh4Qzk0cTWcO2zuL0aglgNdqo6aC/k+pNLISR6a8esfnSztD7LXjaQOlYyw4AnhDDccF4C/u0BANLNWqc1LTtBbQWXWnR7aOZt41JwRspYQV2B7eZmJveF03uNSHIMpELFnyFZEK6D4pi4wPuFz+YGX/zKwSHYm1UCMVhgMTSUPXsuuLlc9ciQhtPlVbn7gg20RgkwfkhCIPW1DEhbu96eVqEea4Fiy2m0DjgkiIUMxNCSgRXFsIMko/yt+hXzsmALZNl3w7+Uqii3yTgSmJSIfK0BBZMGkakXT1f3cTD2HeWag5hLvCg+gYWBvbE9FpQ9n4DCqR7+PA7fZ+d65pN9ZHAzgIiO+g2/I9+P3ELfotxVqk463zKaEla+y58moVE/IGyJYqd+XHZmLNH64STsiRYvfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(426003)(7696005)(54906003)(110136005)(83380400001)(336012)(2906002)(40460700003)(6666004)(66574015)(8936002)(47076005)(5660300002)(36860700001)(26005)(82310400004)(186003)(8676002)(70206006)(2616005)(316002)(4326008)(1076003)(81166007)(70586007)(356005)(86362001)(16526019)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 17:49:19.1877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd823394-e4dc-4d71-0eb5-08d9f62ba6da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2950
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add a test to check the maximum allocation limit

v2(Matthew Auld):
  - added err = -EINVAL in block NULL check
  - removed unnecessary test succeeded print

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/selftests/drm_buddy_selftests.h   |  1 +
 drivers/gpu/drm/selftests/test-drm_buddy.c    | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
index a4bcf3a6dfe3..ebe16162762f 100644
--- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
+++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
@@ -7,3 +7,4 @@
  * Tests are executed in order by igt/drm_buddy
  */
 selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
+selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
index 51e4d393d22c..0df41e1cb8a6 100644
--- a/drivers/gpu/drm/selftests/test-drm_buddy.c
+++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
@@ -16,6 +16,65 @@
 
 static unsigned int random_seed;
 
+static int igt_buddy_alloc_limit(void *arg)
+{
+	u64 end, size = U64_MAX, start = 0;
+	struct drm_buddy_block *block;
+	unsigned long flags = 0;
+	LIST_HEAD(allocated);
+	struct drm_buddy mm;
+	int err;
+
+	size = end = round_down(size, 4096);
+	err = drm_buddy_init(&mm, size, PAGE_SIZE);
+	if (err)
+		return err;
+
+	if (mm.max_order != DRM_BUDDY_MAX_ORDER) {
+		pr_err("mm.max_order(%d) != %d\n",
+		       mm.max_order, DRM_BUDDY_MAX_ORDER);
+		err = -EINVAL;
+		goto out_fini;
+	}
+
+	err = drm_buddy_alloc_blocks(&mm, start, end, size,
+				     PAGE_SIZE, &allocated, flags);
+
+	if (unlikely(err))
+		goto out_free;
+
+	block = list_first_entry_or_null(&allocated,
+					 struct drm_buddy_block,
+					 link);
+
+	if (!block) {
+		err = -EINVAL;
+		goto out_fini;
+	}
+
+	if (drm_buddy_block_order(block) != mm.max_order) {
+		pr_err("block order(%d) != %d\n",
+		       drm_buddy_block_order(block), mm.max_order);
+		err = -EINVAL;
+		goto out_free;
+	}
+
+	if (drm_buddy_block_size(&mm, block) !=
+	    BIT_ULL(mm.max_order) * PAGE_SIZE) {
+		pr_err("block size(%llu) != %llu\n",
+		       drm_buddy_block_size(&mm, block),
+		       BIT_ULL(mm.max_order) * PAGE_SIZE);
+		err = -EINVAL;
+		goto out_free;
+	}
+
+out_free:
+	drm_buddy_free_list(&mm, &allocated);
+out_fini:
+	drm_buddy_fini(&mm);
+	return err;
+}
+
 static int igt_sanitycheck(void *ignored)
 {
 	pr_info("%s - ok!\n", __func__);
-- 
2.25.1

