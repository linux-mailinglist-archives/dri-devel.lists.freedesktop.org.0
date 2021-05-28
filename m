Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D03943A5
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7F46F5C3;
	Fri, 28 May 2021 13:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F686F5C3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgxuhRtE5IUsIDnFaQ0aSJ3dkj4VvBfMgfjejiYz/B13aLFAyXXg1mRi2O0NZgj10WeVsRk4EolmCoqDE49sTj4NpKGRUkbrjhGrSbGsZTn+EmMCpN/LYMpGmc2GFInM27WFl/WJN+4mVtDRBQHTh6M1UPDRa+990WWT7zQYLCDUpAxkvmeFqNmEf4kXxtrpXz2bYhPQ5tCBl4eiBGQFuBOGjZC6yuNyGCoxDhig11JnfX4zVJ+T0hWJzozfs6pc3wj3ym4Sxmh4cFS02+CX9Umg7gimVzfsa1KjeyEF2d+nxTaecCgVyRqYEjZlPptl9z19mADVlXbnCQwyjHymDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o37zc3r+32G/epFIaBt/S+sF2gOAKL8DExEeD28UpLo=;
 b=Kp3Fx0F6UkhNEzqZG6NXI+nWupYUy3XHfS9EfSffKRohbXZJIdaVYnxsO8xfxjL7DcTsPG74uEPEbDRUXMIs45zorKoCMqCfklgqwBKNdgpmlgAbRxl7AJzrn1EEVrXYDyjEqPh1ihBg8XhYcbhNWg9xuRfYX26PIvEjYwBsPzrO27BEmZVFn7cEdjLOUd94wcXJxD4npI1eCuVvbz9dSn0c3X/Aqp4uf7UOhXwOTsSFIYL59d8WhIbczBx+NWW9aRWZTItR4tH8+EE0I6WSFvsKF6ssZYZYGgWhQ9//b+xFufwHZN0JuXMQjUo8OeC0TRmDfQBeYnyJY6BBCQoqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o37zc3r+32G/epFIaBt/S+sF2gOAKL8DExEeD28UpLo=;
 b=TYhfmnIxwnPMVG+94lf3YN3Aj2J+IfqcTonAHPJBX0GLU97hwgBPk4q7oPuc1+3N5NijIa//8CG0JzH/O248SBXZFxTv+EpwOI6LvvuGvXjW9g9CzJurqfl0h8t7XHADggkcYBx+h1ka6venmx4U2ULUi+FuUob3A3VEdIPZ8qQ=
Received: from BN0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:408:e6::26)
 by CY4PR12MB1349.namprd12.prod.outlook.com (2603:10b6:903:40::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 13:57:26 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::ea) by BN0PR03CA0021.outlook.office365.com
 (2603:10b6:408:e6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Fri, 28 May 2021 13:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Fri, 28 May 2021 13:57:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 28 May
 2021 08:57:19 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 28 May 2021 08:57:18 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/dp_mst: Avoid to mess up payload table by ports in
 stale topology
Date: Fri, 28 May 2021 21:55:57 +0800
Message-ID: <20210528135557.23248-3-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528135557.23248-1-Wayne.Lin@amd.com>
References: <20210528135557.23248-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05cc7d6d-df28-4841-0512-08d921e0866f
X-MS-TrafficTypeDiagnostic: CY4PR12MB1349:
X-Microsoft-Antispam-PRVS: <CY4PR12MB13496B79E8BFF9AE0331EA56FC229@CY4PR12MB1349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jx3EdRY4MyFXXz/ikETKkgktftBS0lKt5D3/g9gsXajaOfBwUR99cVFxNVlF5aeYFi0eYpYYZj9xqwE6xt3Ja21HzI7gXfSIzXbVqcZJxrcgfRu09Ix/2QG6VA+IJSBGNdaryRCXnuZ8w9M24bDRHIHlIXMyWPcys62ie2mYiYHr0q3dGj8YZabXaO96DZrTUid25cDN7k4KdfXTpHRZN9MOBU7OCITxALN90lzXEG4coG/70jOi15/7AWpkH/pqgc1NO5T4APH/W2wTyLFjLCkKyLE91nQsXWu73ws1Oe+HerB0mPDt+xU+1dpcqkOcD4s1abSA/lsHMXMO3ie3S9vQECs3xmq8q8RPoKQ8LFpQhnArJjMrVl87NwDbcPsZnAzQJgxaZh2qSngtxfwtI6iSWBs17F0RdNdq/t44VRYfoF2B8BO7EqxBYUgdzar7kHa3ip8YI7vnzb5wSZbFa1vOBeEgNq9dcbDJbl/6uwgjoMeJc/9Wg78/BwLlhyDddixMnYuQA7NCFjDpMJbOosr4MOadlf3R3Rz0lTLtwd/GR04Wc+J3FHuYpsdqzqDoDmKofKjRcxFhA8mNwmQhOiU5WQrSkwbTikMZxg84MrFdqsQXLllj6VgVtj53E6d51682amVNQlLVIdsKxzikp/wvPTUMbzNDOCISpTxbWQpfNjxPioqcTu0tIH0qiQ1B
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(1076003)(7696005)(82740400003)(83380400001)(356005)(81166007)(8676002)(5660300002)(82310400003)(86362001)(36860700001)(47076005)(426003)(336012)(316002)(70206006)(2616005)(70586007)(54906003)(6666004)(186003)(8936002)(36756003)(6916009)(26005)(478600001)(4326008)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 13:57:26.1009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cc7d6d-df28-4841-0512-08d921e0866f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1349
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
Cc: jerry.zuo@amd.com, aurabindo.pillai@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
After unplug/hotplug hub from the system, userspace might start to
clear stale payloads gradually. If we call drm_dp_mst_deallocate_vcpi()
to release stale VCPI of those ports which are not relating to current
topology, we have chane to wrongly clear active payload table entry for
current topology.

E.g.
We have allocated VCPI 1 in current payload table and we call
drm_dp_mst_deallocate_vcpi() to clean VCPI 1 in stale topology. In
drm_dp_mst_deallocate_vcpi(), it will call drm_dp_mst_put_payload_id()
tp put VCPI 1 and which means ID 1 is available again. Thereafter, if we
want to allocate a new payload stream, it will find ID 1 is available by
drm_dp_mst_assign_payload_id(). However, ID 1 is being used

[How]
Check target sink is relating to current topology or not before doing
any payload table update.
Searching upward to find the target sink's relevant root branch device.
If the found root branch device is not the same root of current
topology, don't update payload table.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 5fc261014a20..3d988d54df89 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -94,6 +94,9 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port);
 static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_mst_port *port);
 static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr);
 
+static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
+						 struct drm_dp_mst_branch *branch);
+
 #define DBG_PREFIX "[dp_mst]"
 
 #define DP_STR(x) [DP_ ## x] = #x
@@ -3360,6 +3363,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_mst_port *port;
 	int i, j;
 	int cur_slots = 1;
+	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
 	for (i = 0; i < mgr->max_payloads; i++) {
@@ -3374,6 +3378,14 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 			port = container_of(vcpi, struct drm_dp_mst_port,
 					    vcpi);
 
+			mutex_lock(&mgr->lock);
+			skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
+			mutex_unlock(&mgr->lock);
+
+			if (skip) {
+				DRM_DEBUG_KMS("Virtual channel %d is not in current topology\n", i);
+				continue;
+			}
 			/* Validated ports don't matter if we're releasing
 			 * VCPI
 			 */
@@ -3473,6 +3485,7 @@ int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_mst_port *port;
 	int i;
 	int ret = 0;
+	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
 	for (i = 0; i < mgr->max_payloads; i++) {
@@ -3482,6 +3495,13 @@ int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
 
 		port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
 
+		mutex_lock(&mgr->lock);
+		skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
+		mutex_unlock(&mgr->lock);
+
+		if (skip)
+			continue;
+
 		DRM_DEBUG_KMS("payload %d %d\n", i, mgr->payloads[i].payload_state);
 		if (mgr->payloads[i].payload_state == DP_PAYLOAD_LOCAL) {
 			ret = drm_dp_create_payload_step2(mgr, port, mgr->proposed_vcpis[i]->vcpi, &mgr->payloads[i]);
@@ -4562,9 +4582,18 @@ EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port)
 {
+	bool skip;
+
 	if (!port->vcpi.vcpi)
 		return;
 
+	mutex_lock(&mgr->lock);
+	skip = !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary);
+	mutex_unlock(&mgr->lock);
+
+	if (skip)
+		return;
+
 	drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
 	port->vcpi.num_slots = 0;
 	port->vcpi.pbn = 0;
-- 
2.17.1

