Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73564EA8F3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A85610E77A;
	Tue, 29 Mar 2022 08:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6964510E77A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2iSX2Nb3To+rrbtcNX0oeF+Lk6DklJzPrEIPmJfhI7+JXlRmSTiH/KcTlYbeDPNcrFc5LPq9h7sW7xlyhMphkL28cQnFE+zFEV4Jbd1pS3a67Hta68XnZN1hoXbRIK/XCG5k75mtEh2WmS+V764KlR9c5fDNeuMMWR51cr8UOxoywT4ZcferVSKpc/ACju/gnno+ux9wAQfSdWruEz5lxVI2ZZmlOv9EO7uFIfsUo/piAF1+rnhNbrBOXKPTZvyfvRx2K/k+HE/m6AWguFFeKRGj8Mte53iU18k0PNcUfAjY8Cos3ZD28sm/VNglUnKAAyfwHsEc4rZgqQV4sx8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hgb8N6oRwRBi1T4TsmoHD0EbV9Q+BGydRohaHmOTk8=;
 b=PZmqIypA5UGjdPIq24kWDMVSALRBmH5wy1zfiYEKgq/48290r8RLpawkPukblLOldFeWZIURLERpfrtRZp70jeStG168GOvqo2Tw3RTqKDoZwqrV6zlyicfUjzN5TrwtPVEWex6AepdZUWuUhWHC99EKzELNEunAnOHMUhMDtAZj1+qvAvaCI9Mb9UcWbiMlK6d+Ekaxmb/lH+B8yk8e32VM5Hnw+Qr7HuJ5IntaSCvdd24n3+qU23xL/BkWIgiqRcaf8x0k+8jqTJvfOdb5eVawto3nYQP5KasT1UTRFEbWmWrPHCD+zDzG/uS2Xm214nlkdlsRVm0n4khGOni57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hgb8N6oRwRBi1T4TsmoHD0EbV9Q+BGydRohaHmOTk8=;
 b=BCBEOQ2WmiBautfrITEatFpNWtnaByNiAZ7cMJs30H4uNgRDW2gRhKTV6d9YumR1LtTWJ7vFReXEdSjhapws12h3M5+Y2hO5VnwIYUy5GG+/7N5IJdaL9WOFwGg1pcH7JwkfG2VjsMkVbT95XxJWFtbuSs3AyChDdBw8EfT5of0=
Received: from MW4PR04CA0376.namprd04.prod.outlook.com (2603:10b6:303:81::21)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 29 Mar
 2022 08:05:33 +0000
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::e5) by MW4PR04CA0376.outlook.office365.com
 (2603:10b6:303:81::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18 via Frontend
 Transport; Tue, 29 Mar 2022 08:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT017.mail.protection.outlook.com (10.13.175.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Tue, 29 Mar 2022 08:05:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 03:05:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 03:05:32 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Tue, 29 Mar 2022 03:05:30 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Lower down debug info level when receive NAK
Date: Tue, 29 Mar 2022 16:05:26 +0800
Message-ID: <20220329080526.1583458-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9609eba-f406-46d4-b5dc-08da115ae631
X-MS-TrafficTypeDiagnostic: SA0PR12MB4366:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4366B1A0348B6A5EAA3159C6FC1E9@SA0PR12MB4366.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JX4jl0XcMV/o2I/J/X8BIFTybKV9tn+vk6kA0quqZyBFOcp9E0yAaT4W/I7vDXjd2nqhTe2Jd5NMD+uQrXwFuOQSClwm1qDwuYzMlS1NgSNyeXdD3pRt9uYrz/jDRgfSEE7Jwzd1FZAyOnW1PiBQQ2p69EtJw44QL96GfRMN2+9zeha+4AJR4UAcC9tBzaRyuOFqALk9XtrFpqU4xotDZVcEvMUFeXkob3VgnWLGgjyxrMALPXqVRDINjTMCIJZxE5qqQaEKLWvQks72DeE2A4OyGtpObsWFT9vKw1O2TP7uY0dHsL1NxdpezrqMqGZDHvcHrDc+rJz8LB/mPil6T46hCdlfYRWoU69T9EltFlzspFn6hiZ+n5iy4MI7TG9K3VZ1tMmF5nzhZpWFC3nwTWmfUCNY45Cztbi1Eub9Z276sZXlrAYrOyKNuY90ot717AflTvao5410d759V9xfgGJnZD9FZ88BMG0rzEEBLmaY3OwaBDJNQERt/+fFY+gAq4z8GTBd1dKmhvtrSRzB5ANie1ZWFX7XgYyh378ODiDOKPbqOKVjeuW24RrU9WkoItaTJsBRMnBfrgHSqDsqHFjh2W/ynF2W7iGBEvH18npXEp4hEsbuurqISXLMlb/umktP9R9Aoot0/F8o1aiEo8ezE1sQOsfPY0I0eUthb3pLaimurC40fILijwGSuBDoaC2BT9AefM7wLbb+xZ86bQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(54906003)(186003)(26005)(82310400004)(70206006)(5660300002)(47076005)(508600001)(8936002)(2906002)(2616005)(1076003)(426003)(4326008)(8676002)(70586007)(36756003)(356005)(316002)(86362001)(83380400001)(81166007)(6916009)(40460700003)(36860700001)(6666004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:05:33.1217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9609eba-f406-46d4-b5dc-08da115ae631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
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
Cc: jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
It's reasonable that we receive NAK while doing DP_REMOTE_DPCD_READ.
Downstream device might reply NAK with the reason and source should
react accordingly.

e.g.
1. When downstream device can't handle corresponding message in time,
it then replies NAK as reason been set as DEFER.
2. When multi-function branch-sink device doesn't enumerate virtual
DP peer devices for those multi-function down facing ports. Without
virtual DPCD, branch device might reply NAK with reason as BAD_PARAM
indicating this port can't do aux DPCD read.

It's expected result. Not an error.

[How]
Use drm_dbg_kms() to replace drm_err() when receive NAK.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/dp/drm_dp_mst_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
index 11300b53d24f..764a6b59bc1e 100644
--- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
@@ -3557,9 +3557,8 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 	if (ret < 0)
 		goto fail_free;
 
-	/* DPCD read should never be NACKed */
 	if (txmsg->reply.reply_type == 1) {
-		drm_err(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
+		drm_dbg_kms(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%x for %d bytes NAKed\n",
 			mstb, port->port_num, offset, size);
 		ret = -EIO;
 		goto fail_free;
-- 
2.35.1

