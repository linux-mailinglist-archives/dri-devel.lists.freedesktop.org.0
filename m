Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54114509FBD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E70A10E27F;
	Thu, 21 Apr 2022 12:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5356310E3FA;
 Thu, 21 Apr 2022 12:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSq9h5Pc+irtdkjZ6phnbRE2+90aFoJXzYeUPVyW9rn5cPxB8NlvlriNtd3ydwAV+JcTUESaRuodRkQnQPxTcSDciW1FPnx2DByjIXm/y0cbvza4DHy0srpjTmarvuWG9rLVXkt4KJBEEfc8zghVsjukOISwA9Xi1OCDtTSjCxYB5vl+QNLXIkC3vfLWCALUtjAtSK0+f8JHO/LeGa14y+57TGwK+AXI6rtYorZdQSyGakG8IzQXdSJ4tdwufTsd4eusEqgL64thIsuQ/6d+yxgG1Cd6cyPJUoKwbzzu6/gVMR9hctvSguclnRhzqKfwLyz/id9n0Wb1HRqwxO3xeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9KQLx2ofPeXAmPWLTSRogFsDMR16IedcJxSkF1orlw=;
 b=HEIzyR02gtp39mJ3C5lUGJOhMQxUvxwDm6De7x5lUgrx2fUrrwuwIAcZE350ENgsgT2cwWj4O/Z1BQIiCfu/vp9punAXLsxspake1VQ2GxDXXP7TyFQ6X8BbV1exakq9H/HSfA3xI4itQbZ+FXscr/NeT6pmGApX9tFSPeSlJUm328qntt43+wQQ/zaQEVX+1jTbD0hAWzZ7vXOyqiWibjAWBSepZ0bomM0adHZmB/bUBiWsUcA2cOi59sP3nqqG4jF+9PhDS6yQbMM+urSUbpEePkoWXjyVSikl7/GMjEfpvK630yeWSn32v8kwuC5gNRTX6kWu8EYxy3vff8SmVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9KQLx2ofPeXAmPWLTSRogFsDMR16IedcJxSkF1orlw=;
 b=44fYgQb9hl+4KNrPc6KVF1I3oUDcMRX3L5TalbH/ONtjO18R7ivbW1CUVa/aafLkQ2rUFuUGFIFz/kWoCJRG95uFOQA/tSAgugPfTq62TFzPrwfA0XsUmM6aVSyjiTTyAzYEAb+KNOxzL+9R5oBL8byMLqOz6y6QB9LCjtVAeok=
Received: from DM6PR11CA0055.namprd11.prod.outlook.com (2603:10b6:5:14c::32)
 by DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 21 Apr
 2022 12:34:56 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::2a) by DM6PR11CA0055.outlook.office365.com
 (2603:10b6:5:14c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Thu, 21 Apr 2022 12:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Thu, 21 Apr 2022 12:34:56 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 07:34:53 -0500
From: Yang Wang <KevinYang.Wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: use kvcalloc() instead of kvmalloc_array() in ttm_tt
Date: Thu, 21 Apr 2022 20:34:42 +0800
Message-ID: <20220421123442.1834102-1-KevinYang.Wang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f24fc678-67fd-4572-bc52-08da23935791
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1147BE13817C76C7E137D13E82F49@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: glsMhnIsDmMFJ+VRioLXLW25LDJYgkm1anbttVLdFsTZecYIzfxvMQeNYveJs/2McR6XWm/xRZUF7IPRpVPhYVkzE/TOnxOWx+M2spkz1LU8V3SOoO+DO3UlEvNDtLZReueTmaQaMgPsWAyuFkuzpOKt4mxTT2CkFbur/3nCTuLss1wnLRGxaIjuYriGfWd/YRSOtGf6/a5ZqGj373vZRBAjHTLtwy/yZzDQh9NUlSSa4s4HU0NgtV1khpWE8DB0ey/xskb4AsCxyYb7eHEt9XT1ltSEUfKe8qiUAIW4E5U8FQL2RwuokIQZmwy7EtXBbUB8TlyS3xdXzIs1HDGT4Lw15L24e9nsmqdNFOhbXdykLMfd0Sk0nhVOLxNw/K+ZGX1oVn8oEeZRb3l0Byb1xTu/cCeOLRknQE2UdLJLafaXnYf5/LkwxjtvxHixzODnAPJmPpVzW+Z3zfpZ3ms0sMzJwi2giNIdvrDxPuilQoGFlTVPj7K27Eip7rlX6kbYGfRrVSQMn6eg7YJCpKWKKD7O+93SUlHRCWuYVTFsVuzxAtUHvNkdU0zFQF4EiEBEyf1YSdHgxeuBtFGrrOepxbxi7Rf0fZFaco/HqkUuITVOjVoPQDnOvdCxgFcViID2qjGHiQ+N8YBib5DTShnimvxMcX8260uaL4od2ggdsBkVUMSdUzS1j4PdOzE8z0fZ74zgtn2IIc1ptypD8AVe2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(40460700003)(36860700001)(86362001)(81166007)(356005)(5660300002)(508600001)(8936002)(6666004)(2906002)(316002)(54906003)(110136005)(70586007)(450100002)(70206006)(4326008)(8676002)(16526019)(186003)(47076005)(426003)(336012)(83380400001)(7696005)(2616005)(1076003)(26005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 12:34:56.1586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f24fc678-67fd-4572-bc52-08da23935791
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
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
Cc: felix.kuehling@amd.com, lijo.lazar@amd.com, christian.koenig@amd.com,
 Yang Wang <KevinYang.Wang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

simplify programming with existing functions.

Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 79c870a3bef8..cbb3d1fb4caf 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -96,19 +96,20 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
  */
 static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
-	ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
-			GFP_KERNEL | __GFP_ZERO);
+	ttm->pages = kvcalloc(ttm->num_pages, sizeof(void*),
+			      GFP_KERNEL);
 	if (!ttm->pages)
 		return -ENOMEM;
+
 	return 0;
 }
 
 static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
-	ttm->pages = kvmalloc_array(ttm->num_pages,
-				    sizeof(*ttm->pages) +
-				    sizeof(*ttm->dma_address),
-				    GFP_KERNEL | __GFP_ZERO);
+	ttm->pages = kvcalloc(ttm->num_pages,
+			      sizeof(*ttm->pages) +
+			      sizeof(*ttm->dma_address),
+			      GFP_KERNEL);
 	if (!ttm->pages)
 		return -ENOMEM;
 
@@ -118,11 +119,13 @@ static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
 
 static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
-	ttm->dma_address = kvmalloc_array(ttm->num_pages,
-					  sizeof(*ttm->dma_address),
-					  GFP_KERNEL | __GFP_ZERO);
+	ttm->dma_address = kvcalloc(ttm->num_pages,
+				    sizeof(*ttm->dma_address),
+				    GFP_KERNEL);
 	if (!ttm->dma_address)
 		return -ENOMEM;
+
+
 	return 0;
 }
 
-- 
2.25.1

