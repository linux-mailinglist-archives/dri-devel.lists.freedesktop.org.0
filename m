Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC73144BAD8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 05:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894166FD0A;
	Wed, 10 Nov 2021 04:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694A6FCC8;
 Wed, 10 Nov 2021 04:34:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmBdwpDB2pYD+Ew+2d8xxhHoRQxz8V76i3J/Ejd95TURqPwRQLwgu38PwT/Hpf+/ue0wnroUqOTz2efHKqJwzBPsdN8hEtTz3e0T13BdsPxM/QZs7qFn1Q5wNWP55m1OUJTVLkblpG56WUF8EqPEL3yWHnIFt5dkwQbfwiLPEkA4z4M+uKd9OlUyflj8waPfg7px55F5KoU+fGtj1FdFYprhT3dV+InBOgsJLg5NNVSG+EoocJfJBhiob/th35TRbYESIdGsd75bm+SDYcj84BaXtnFb6rJ+ELVBy7cfigjo7kTXJtAIhiDdMiFxwoBImybgat3A2uB8B5QRbKCjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYO3c4VkCJkbruJQtg4Rxyya8fbeq6Fr7b7l1BNtOBA=;
 b=Usb6w8z0k71+p4+wqXJw40KQNb7Ewq4B96eIvZ8imyaAknoEhrVXJGwqu5iJvr+Jw7lyVLNtOzUwMMPROnz55/MMjdHR/GdXfQiGhnvdZSIQT62GMlQJ+Jl9XnDP0OTeopC+4ltv+3BH/fw086fQRRLSG/Sn9j7FdTsH1onTtetmlWyzomAQO+e1ShLUW4Y7boHdAEbm3h4gtWhhfsz35By+I5vxk85zRUtKRC+PiA8ADE9HG7/bUdpRvg0/SxwkblbtrG6tuR3iyZ1tkWV2CV29VFsNVYSGHMBCX5CLeEcM+ehFoKTnrA3JLeKfq2u5u9SC7QW2DL13AyJ0Yc9arA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYO3c4VkCJkbruJQtg4Rxyya8fbeq6Fr7b7l1BNtOBA=;
 b=S/yWv/MltWBdsNDUpyHh0gB5oRccjUOTar6c1nDTE8OTl/XzpE+DChsldSOdJFAQKPoR0MwWK3+5A/IYyIYzFldw4TNtk3yLoLO/H3sMJPvL9EkLAdiIu+ABwBCATG5ux7tRGUNe1NezXC6bjH1DWC0hAnJj23+5RF1Elq0UP9I=
Received: from MW4PR03CA0316.namprd03.prod.outlook.com (2603:10b6:303:dd::21)
 by BN6PR12MB1555.namprd12.prod.outlook.com (2603:10b6:405:5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 04:34:06 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::af) by MW4PR03CA0316.outlook.office365.com
 (2603:10b6:303:dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16 via Frontend
 Transport; Wed, 10 Nov 2021 04:34:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 04:34:06 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 9 Nov
 2021 22:34:01 -0600
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/ttm: Double check mem_type of BO while eviction
Date: Wed, 10 Nov 2021 12:31:49 +0800
Message-ID: <20211110043149.57554-2-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110043149.57554-1-xinhui.pan@amd.com>
References: <20211110043149.57554-1-xinhui.pan@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b2e24d-10ef-47e9-191a-08d9a40354e0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1555:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1555453E52B6224EF37C4A7A87939@BN6PR12MB1555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56hkFLO8cN+4iTXY4DAA01lA/Lzww2dHRCMtGHP7XIdChFJX0v1k/IDbKI/URTiuBgegi1/oJVOJAcmkRvLTuZqCyYrWdI2ZEG14et3CoPIHkLWImBOJMfExMzzYyrZFmENFuTUguOwUBADh7Gg3pB2WVjV1/Fs5M3rRNFU/nkkgaYttx5rnzWOIddeFwKggLZMd4Qp95WZVf36U5PfTbGaUHuuUMTwA48i1ZeL9hbA/OYvPcOGNXQFzkv+Lc6r65I9vc6SL5soyfbzGfC6KtfRzh8egKrwNgMjq3R9fjPU9uRJD/ibQXYP4MHD5g8Gr8hi4kRTb+7DaamQNog53Q6cOGEWxCgkgzH9zl3SCaEsNxqYJrgJVCTktStje2GPPxCWiY0nJDVQ9/n4aZ9R8LSXi6ZPpgqCXze5Ve7BUgmwYCHAtEi93/Ay6i07EhF8piizVLgjR/WyvgNgfxbp2VWlyfFIIy1q13OAebgMU3KqUG8KfJ0gFrEGw5etprzTsaBXuNN8fsDLEwFVEPuwUunFWLgS0erJaKvwgVKnJrtcRmHRp1aewFqm3gl/AkfhFaW3hJTralBt14a7k9AruWxqO+vrZbvXKkVut4b0o4Kqz9KSBwZjEoD1jkgMzU/gUHBhGKJHIaw3li+HamELDPdPsTNKjLlskYGGaOgYORgSZkFa4k8YNwpAZS2OkIchPE19rzfDlV+Nz3Lfd/TWWVvhZt2JsUl7r+vwlbORBbF4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(83380400001)(4326008)(86362001)(7696005)(5660300002)(450100002)(36860700001)(81166007)(16526019)(26005)(66574015)(1076003)(47076005)(356005)(6666004)(82310400003)(36756003)(6916009)(186003)(70206006)(70586007)(8936002)(508600001)(2616005)(54906003)(316002)(2906002)(426003)(4744005)(336012)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 04:34:06.3126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b2e24d-10ef-47e9-191a-08d9a40354e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1555
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
Cc: xinhui pan <xinhui.pan@amd.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BO might sit in a wrong lru list as there is a small period of memory
moving and lru list updating.

Lets skip eviction if we hit such mismatch.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e307004f0b28..0137a302f261 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -594,7 +594,8 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 			*busy = !ret;
 	}
 
-	if (ret && place && !bo->bdev->funcs->eviction_valuable(bo, place)) {
+	if (ret && place && (bo->resource->mem_type != place->mem_type ||
+		!bo->bdev->funcs->eviction_valuable(bo, place))) {
 		ret = false;
 		if (*locked) {
 			dma_resv_unlock(bo->base.resv);
-- 
2.25.1

