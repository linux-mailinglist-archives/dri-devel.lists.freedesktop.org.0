Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF6433E03
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5326E1B4;
	Tue, 19 Oct 2021 18:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3B26E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+Ec9qqa/CDUCigZ9hTFImACcdu+C3jqkyMRNcnlehx+G1PwjPTU/u4Nh8W51g2MRvDIU+RRH6HNcR+hZnNab2l4cwoILmwmS2YbznUhLtni1zbKmycCpgGhJybteCKtIFZidOew75pfKk88TENqdP76tc8V824x442tsyMjG4B4CcXMCP8DiztNcTMMJSw1EnncRgMOf/IORqnLyBPSaK4hS6gCil2lez3frnWvlIW7FpUYkh2e9+Y76f/+FpdPVMc/puSD5prxJjDeNdg3POdomWm2tGr+2YGjnoqlJQiigJbdp6QgYB+bbVNDDqflmQK4OJoqx8MPOF7jo8CGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyTja/k7qUVtDq/5vY29r8M/tFRau84rVP2Wvk+cKzc=;
 b=Ho3cr/oi0lyrepP2ZNpu/OhdQtfzdi2EzjwhYsKGBQUATyTcE5fpggZ6hb7YEWixmWnMZ/i7P5BUsESn7gLH2JLPMt3qk8Paqae5zU1Vf/hOxDXcCrgsUdhXT1NSqnS+sxwonOw6WAnwmFhWWfQV2+Qf0oSMJLb+ccnh1wn9vBA/M6Guv20UYi7QL/h/LDVe4mJKdTOUXFA6HDyV6wli5b723a1pyaGCUiyPkRJfmw7KWsC1FdFQ0bNUa2erPmSvaYMpvhFKcH4AyPtYLQ+dNNZnFk3655V1gaFpk661/EDZMmZIiByxRKuFyKLjt5Aiis+RHMPpwg4PtiSILvF9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyTja/k7qUVtDq/5vY29r8M/tFRau84rVP2Wvk+cKzc=;
 b=EWmaO2wJ0X/coOlP+h4Y9ItzgWIejyjRP3ruejrRApJPmQ85heY1APsIglS7md6YM/6PhRGPJ0vMMa/1o0j2V6T0vykA2kABH36UzDC+qc1ZT7fTzIxKIjV9+g6VAPLUcwubFDgiPMhqlwupNVVEWLet9ROYmypkNxTzN+kzrkg=
Received: from BN1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:408:e2::15)
 by SJ0PR12MB5469.namprd12.prod.outlook.com (2603:10b6:a03:37f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 18:04:19 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::5b) by BN1PR13CA0010.outlook.office365.com
 (2603:10b6:408:e2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 18:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 18:04:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 13:04:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 11:04:18 -0700
Received: from blakha.ht.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 13:04:17 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <Jerry.Zuo@amd.com>, <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
CC: <Harry.Wentland@amd.com>, <Wayne.Lin@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <Mikita.Lipski@amd.com>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH 1/4] drm: Remove slot checks in dp mst topology during commit
Date: Tue, 19 Oct 2021 14:04:10 -0400
Message-ID: <20211019180410.169969-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98e8692c-b9a9-41ac-7196-08d9932adf25
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5469:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5469C97A19623220560FB28BF9BD9@SJ0PR12MB5469.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:195;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kSQ7L859PXwJDl4ty2iwVgut9OH+LRVwbqhXspVIzB3+Yfol2e8H4j710IOd8KWR0/ym1w7DFg5RO5QQ0NVEsmctK3BpxViNURyaxOe0BsPOT8PobkAV7qU8CjesNM4GTmgEVWnQKcaJeZDayk8Q/EpxOJgYd7qqevkIGimbupIxmuZXfIowUULx+RxlTEccVZ1OECa0cFDK181hs+OQk2Pgnzj0ROqNAtiXvYMCxp6XotGBmi0MM+Vxy+/uVZDg3erPqdjmOSMkZZCSleIReyOIMC9ALeuMqyM8tSpjSiplVFCBmW25ELJY5IhwAqEodzK2K3TqtkyIYvtW1VYJZSJ1VywLThxMN2Ls79GUlG0RnJaCKyGEi7LMgpz/kb33o/BZk7Ofmfd48RjTsBeQ4VqngcOHzVc+cSkQHi3SsQ88hIuvtCntMoQI5hTgecFLtS0P6a/Pv9vY6lPfTnnUECV6TvVVgxq/lVFqHTfapZQXicfXQSG/fXUmW6NlYyN7k2VeEYW8DCwaXk14N5RRIYYyOBp7k/NRpEqKsudjlqN/C5pO3kmxZdjPRQ5EikOJtZzVBZSKbcY1VTFoMXCRHSmGyGgIHDt+neFI6dpAXwxs+I6TIwvunbgiOYgZ1JC8n7rWBLL/LZyFbPZ02evWvkZVH76FKOibCM8Iz5vaDHiEeLlyFYzwyfaX8mN2vVWc26PQJJ/iXchrmy6wxK0WHomyzuo/esPDSp4AIB+41g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(81166007)(83380400001)(54906003)(426003)(316002)(8676002)(47076005)(36860700001)(336012)(2906002)(356005)(2616005)(110136005)(5660300002)(70586007)(186003)(6666004)(70206006)(82310400003)(86362001)(4326008)(26005)(8936002)(36756003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:04:19.0888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e8692c-b9a9-41ac-7196-08d9932adf25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5469
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

This code path is used during commit, and we dont expect things to fail
during the commit stage, so remove this.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ad0795afc21c..5ab3b3a46e89 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4332,10 +4332,6 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 {
 	int ret;
 
-	/* max. time slots - one slot for MTP header */
-	if (slots > 63)
-		return -ENOSPC;
-
 	vcpi->pbn = pbn;
 	vcpi->aligned_pbn = slots * mgr->pbn_div;
 	vcpi->num_slots = slots;
@@ -4538,7 +4534,7 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
+		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d ret=%d\n",
 			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
-- 
2.25.1

