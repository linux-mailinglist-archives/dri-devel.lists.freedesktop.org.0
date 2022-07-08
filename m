Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0856B578
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84AF10F967;
	Fri,  8 Jul 2022 09:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1593210F946;
 Fri,  8 Jul 2022 09:32:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YI230Dy7UX4EaFbwS4t3gAhF5pNCL9BPPrQcFUuH/U729M3yWAXgxg0gx+qUZ8/Rot2cT56oPkzsLKsAmhJjsHI6Mz+7kCRo0pDpP4SlQlJGZUslO6mHTEU8t3iEFujyaPLCWdpdA267MDHBSS8fGeI6ALRjGPiYIigmKPi0NmPbLxaj4DKXqqzDHqf4SeS5FLUTKcQrKlFbQqAh15RI5ddiyYD/185yVJHrEbqGnUkJv2bjbY5n0LxYtT/f9WeaKn3681UgusOm4q1fhLI5s0pk+RhpBmvVcTMlYtfzFavPBXcjnqo2qJxO2jobhN7J6ODoevC7RCi3ZOEWeEfY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKFFRQi3kt2k9+LM/AS/Tb5zH5CFq8F+zchD4I2UY/Y=;
 b=FtJUKgHTg0Y+Puow3e1kJOF4/gehBFHrPDKAiOSErnuPyJufYiAVPcgXj9C+aI/+ArcegqJVp4YneNxw4xckwtNgFcAMf0B4pMerpdYNhi2LCIAGTdP4i/NkkNaoQIVeeuoU1jEMModeynIClTaBcqVxwzDd2qsDv+iOY3STzTxyKh5Ig/+Q3DwMSWb10R765/VZYGAFMDa6yYx1KzkYpo/kNlX8Vc+JjFXjfiXRL3QBbqpHAqwfcRjaSlmPeDBRRb4n+keBeHozzLXnNbgoeiSy9G5z77kMrHOUwf/Y3Bf9zwgZzjzbI5gn4UJcpZiiIPgqNyfHKWcNJN6NivVBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKFFRQi3kt2k9+LM/AS/Tb5zH5CFq8F+zchD4I2UY/Y=;
 b=Jza1AR58TtmZ1PccvGul9A9LC+0ZqXX36+D7LUpmgRLVtbH49cqso/J3rpkywojpyfGwAg3i12NHix9y1XYF1+lxzZV1Luq8x5PTZgWWFHM+YLXhwHMGyTLuY1LtEjSzFofG/GgiJoCZsjcEpqRLolF7Vh+Unu8Tw1MeGorEJZg=
Received: from MW4PR04CA0164.namprd04.prod.outlook.com (2603:10b6:303:85::19)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 09:32:48 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::2c) by MW4PR04CA0164.outlook.office365.com
 (2603:10b6:303:85::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 09:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 09:32:47 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 8 Jul 2022 04:32:44 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] Revert "drm/amdgpu: fix start calculation in
 amdgpu_vram_mgr_new"
Date: Fri, 8 Jul 2022 02:30:46 -0700
Message-ID: <20220708093047.492662-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c99380-81bd-4ff6-54b6-08da60c4d1d3
X-MS-TrafficTypeDiagnostic: LV2PR12MB5845:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gepPmijmLz00UQSuc4OXH4ldDzIMnN/M3qKoLr88ktuk16aIEBiLxm839jaLfqdDFxuuPSVMWmj6EGZYyou1jnUiWIVotaWTLqXX24fnLAI3R/SPYJvqsMIRZBBIsh5dLXxNVGJ61EyfoROcUPgci39WLQ6H/HQW/ev1/KsK59NXqNbJVOdO3nw+WPboByGuQ6MuL8xNkJrxl2WFMi4+WKKZ4s+SRcGXErxM16Uh5dFw79C08zLkwMt4mNfyDBqgWfefRupqg97hX22QP6l5gT7dIpd7+oGRPiITeKE1GLuiCOn7RdisUPc/gJzJi6EqIUeaOmzIRGRGA1S4g1fAS+RuM3jV2LV+59/BAHmQ6hxth36Km7Hg6MB9rUG/PjID3C4jPXKtpS1KaTaWPHCwixPL7UKVdG02PagikxxeFo7eorEhhbaL11Rln/dy6Lps+8nUFgTOqZBjOL1JDv70uPM1J6d9qjzEr2BT5TS2lNxAJuSVROClcT77FPhZqeb87ysRvPSQwtN8zhOYc0hI+Y0Nk+vadl73tookrnrQQvnbGW+zHUVQk84ZnJtwT7+gFuJfHfrq/TJo84aemEpeR6ypLrcjp6heca2A7dt3DIpbmRUiEQdnjpYaBrQgGLValo9rlrYXGfKBb8EWwEJD9yoC+MlouZvRPv/NqGhOvwfQJytdSKaL3UZ3UiUuqPpWspr1nqybsg2ZOqEjxw6U/tJx/bQ0k9gZSzi42jM3lmJ54rI7oe3nUtnRbxC4cha6wF5tnOp9VE9GzlTXJmjeelxcppbGLYqbPEWr2PsGng2dY4YYZw1nhbeLE9ahuqd3PlyDRIwXppvtIoQv+cpyPxyyVRhvEGQ7VInM1VfVCTwwrgdXfsQhjlTj5WHz6Yt/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(40470700004)(46966006)(36840700001)(2906002)(8936002)(81166007)(5660300002)(82310400005)(82740400003)(478600001)(450100002)(40460700003)(356005)(8676002)(40480700001)(70206006)(4326008)(70586007)(186003)(86362001)(36756003)(36860700001)(16526019)(41300700001)(336012)(7696005)(316002)(83380400001)(2616005)(34020700004)(54906003)(426003)(110136005)(26005)(47076005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 09:32:47.4616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c99380-81bd-4ff6-54b6-08da60c4d1d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Arunpravin
 Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 5e3f1e7729ec7a99e145e9d8ed58963d86cdfb98.

This is part of a revert of the following commits:
commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")

[WHY]
Few users reported garbaged graphics as soon as x starts,
reverting until this can be resolved.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 22 +++++++-------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 51d9d3a4456c..49e4092f447f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -496,23 +496,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			list_splice_tail(trim_list, &vres->blocks);
 	}
 
-	vres->base.start = 0;
-	list_for_each_entry(block, &vres->blocks, link) {
-		unsigned long start;
-
-		start = amdgpu_vram_mgr_block_start(block) +
-			amdgpu_vram_mgr_block_size(block);
-		start >>= PAGE_SHIFT;
-
-		if (start > vres->base.num_pages)
-			start -= vres->base.num_pages;
-		else
-			start = 0;
-		vres->base.start = max(vres->base.start, start);
-
+	list_for_each_entry(block, &vres->blocks, link)
 		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+
+	block = amdgpu_vram_mgr_first_block(&vres->blocks);
+	if (!block) {
+		r = -EINVAL;
+		goto error_fini;
 	}
 
+	vres->base.start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+
 	if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
 		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
-- 
2.25.1

