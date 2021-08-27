Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB03FA1FE
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 02:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210196E9E4;
	Sat, 28 Aug 2021 00:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 960 seconds by postgrey-1.36 at gabe;
 Sat, 28 Aug 2021 00:01:27 UTC
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3596E9E4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 00:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/Bz4XTxLoXWRv413guNx65cscw1sNry4660sBbPTZiLgWKbP8zSBUqTgPkwvoKa3pvw+t20TVJM2/aIRYzxmQ57M5AzE1B/uPdIJCNugYzoksUSy1CCJ9fEdTyrvbO6p9EWVH/pvvWcGmf/NjNvmTqnK6AgjOA5lANj8lZVlZ8m4I3llsfTHsZdvxlODB8cWvFl+LUeATW4FCQA74Al1cLNGAtzj/pdm8nkHcZczqLf6gqtuqy4FNOyjJfrInQFHXaDhIPuB0yVPulbGWjrOtdtEsuaD373TNerfm2sUtx4H/7QmxIWZIUhirf1Im7m2AgufSRROvcoVJv6x2sJUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBP71/i+P66uYA6qwVe4KBgt6/leZ8MC1E5oSulsZ+M=;
 b=i4I7k2ZC8M4jBnIGF3wKs/slt34XHew3Tt7ZIxbQ4OZLWMqy7N7Ko592ryPv/p8A/gtHFPcM4Qv7a6PYjYBfRK/thBNnKuDnQxpp41xIQ9hPqkosp7U4EOE6Wdgu1PaTIXGvdVr0FAdy0DMvSsiJiz4ZbMOaFfb15tNm5beynroPTU16DlR/LUXKPRy1ec878dZ95xAfZeTNnWxupaHdcNGV2kPtyAO+X04vQ2aZlDdZXdnEXyDu6IUcIGw1Yx2wS/p8B+6YvlA2KvqFQ6dx3vUgwbJTvUz85f7JEF1rf84269OU5r+EvRt3peY7EYV3gx1dI94StpWCKTsl1P04cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBP71/i+P66uYA6qwVe4KBgt6/leZ8MC1E5oSulsZ+M=;
 b=lKVaU62rsvvKeFln/3Tk/UY6QV0FHPj/8OWApKICsFTI66dUFFTxHR6rUbiOaHWFz6LjLPYCyDEJ9OBBB6bwanzhHes+ucfzK0nk6lWLwuc/vqH5r9VKDHe3feCZfQvuaJGWNG4JKgYsqR9tggc30oyeaZNtV+6aOKlKe/bJUUA=
Received: from CO1PR15CA0098.namprd15.prod.outlook.com (2603:10b6:101:21::18)
 by BN6PR1201MB0211.namprd12.prod.outlook.com (2603:10b6:405:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Fri, 27 Aug
 2021 23:45:25 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::e2) by CO1PR15CA0098.outlook.office365.com
 (2603:10b6:101:21::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 23:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 23:45:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 18:45:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 16:45:23 -0700
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 27 Aug 2021 18:45:22 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <wayne.lin@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH 1/2] drm: Update MST First Link Slot Information Based on
 Encoding Format
Date: Fri, 27 Aug 2021 19:43:21 -0400
Message-ID: <20210827234322.2740301-2-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
References: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a127a7c7-b6a2-47b8-0a07-08d969b4bded
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0211:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB021178626477A0199D8F7105E5C89@BN6PR1201MB0211.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dqid7rNQiwgcruCWuVbTqgEinJYmKmA6+tGAuVUOmmSOmfF/Xc+Av3XFnQkxp8QtpIhJ6crHogy6daFKn5hsO7vmaXlu1SxWhMiNk0lhu4LTLvc1WyeI5BsbbuvJnBphidrnOuuI6iI27qURVa1YK5VYpfihOLr4eWV5RKdjjQ9MNkr/M8Rcuxna9SiTdRpMDiThJ/+YJIyQvYOccN99HdYhZRKixoN1TYTPNyIuDWT0NVhddzwa5tLBNPzfXo1m24tXPceQzs5dwrEUDF4bs/ETTnZ0Uk+xHrwDVDfNeFx8FXHKnaOf9n2EoxhBXu/V5/lhEfBbyNAZx0eoSC+v+xVTTvEYRhAVvWxKK/OwU3C3S0IxOA1iAZeGMNQx56GFuxDBB741jb0yWgXBmIbGsYZWqSsN+uUVRSR9KW2cl0D4j8V7AHLReihBDHQQDNqtvcwwRNZGRv3I0ig4p548BlGYXCYXojQvn7KEitxBbeQTyExF7E4rCUTfvUGGJktcj3OM/BlhX1v4cXgcGoO4EHwkg7EB5gfhRcUGmp06sqloIhYYBO5LLTxTmKURvueEm2FC2GOmwasxnJFsLxnzFnATjhIReFYcf1fwDX9nGb0ZXu7VAzKYRW9iGWWwDDKFAGunyWbMJ7j5v7Qh80qYTU9gVOylzf3jjMiX70TDBVBvXYL1hFbv+4Tlw0xM3uqZxmXi59NVZ6B4xhbsNef0Gd2w5Fl5mgCy0XSaXEpP+aE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(36840700001)(186003)(2616005)(336012)(70206006)(7696005)(478600001)(47076005)(70586007)(426003)(86362001)(82310400003)(6916009)(36756003)(83380400001)(54906003)(316002)(5660300002)(26005)(4326008)(81166007)(356005)(1076003)(36860700001)(82740400003)(8676002)(2906002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 23:45:24.9394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a127a7c7-b6a2-47b8-0a07-08d969b4bded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0211
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

8b/10b encoding format requires to reserve the first slot for
recording metadata. Real data transmission starts from the second slot,
with a total of available 63 slots available.

In 128b/132b encoding format, metadata is transmitted separately
in LLCP packet before MTP. Real data transmission starts from
the first slot, with a total of 64 slots available.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 27 ++++++++++++++++++++-------
 include/drm/drm_dp_mst_helper.h       |  9 +++++++++
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 86d13d6bc463..30544801d2b8 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3370,7 +3370,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_payload req_payload;
 	struct drm_dp_mst_port *port;
 	int i, j;
-	int cur_slots = 1;
+	int cur_slots = mgr->start_slot;
 	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
@@ -4323,7 +4323,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
 	num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
 
 	/* max. time slots - one slot for MTP header */
-	if (num_slots > 63)
+	if (num_slots > mgr->total_avail_slots)
 		return -ENOSPC;
 	return num_slots;
 }
@@ -4335,7 +4335,7 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 	int ret;
 
 	/* max. time slots - one slot for MTP header */
-	if (slots > 63)
+	if (slots > mgr->total_avail_slots)
 		return -ENOSPC;
 
 	vcpi->pbn = pbn;
@@ -4509,6 +4509,17 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
 
+void drm_dp_mst_update_encoding_cap(struct drm_dp_mst_topology_mgr *mgr, uint8_t link_encoding_cap)
+{
+	if (link_encoding_cap == DP_CAP_ANSI_128B132B) {
+		mgr->total_avail_slots = 64;
+		mgr->start_slot = 0;
+	}
+	DRM_DEBUG_KMS("%s encoding format determined\n",
+		      (link_encoding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b" : "8b/10b");
+}
+EXPORT_SYMBOL(drm_dp_mst_update_encoding_cap);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -4540,8 +4551,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63 ret=%d\n",
-			    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
+		drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d ret=%d\n",
+			    DIV_ROUND_UP(pbn, mgr->pbn_div), mgr->total_avail_slots, ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
 	}
@@ -5228,7 +5239,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
-	int avail_slots = 63, payload_count = 0;
+	int avail_slots = mgr->total_avail_slots, payload_count = 0;
 
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
@@ -5257,7 +5268,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 		}
 	}
 	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
-		       mgr, mst_state, avail_slots, 63 - avail_slots);
+		       mgr, mst_state, avail_slots, mgr->total_avail_slots - avail_slots);
 
 	return 0;
 }
@@ -5529,6 +5540,8 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	if (!mgr->proposed_vcpis)
 		return -ENOMEM;
 	set_bit(0, &mgr->payload_mask);
+	mgr->total_avail_slots = 63;
+	mgr->start_slot = 1;
 
 	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
 	if (mst_state == NULL)
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index ddb9231d0309..eac5ce48f214 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -661,6 +661,15 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	int pbn_div;
 
+	/**
+	 * @total_avail_slots: available slots for data transmission
+	 */
+	u8 total_avail_slots;
+	/**
+	 * @start_slot: first slot index for data transmission
+	 */
+	u8 start_slot;
+
 	/**
 	 * @funcs: Atomic helper callbacks
 	 */
-- 
2.25.1

