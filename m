Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82C3943A8
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7656F5C4;
	Fri, 28 May 2021 13:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B16F5C4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWuzD5c3B45chb1zVMavemcvzXDaRVlNHyfe6KQhUtlPPL1JuOfSUkKujbT10Hxxg6Z/g1AAFU3ZrNVsf+VLzGz/ovnWOUO429tYtNKiCR/CuYizL8NUKPinn/RQo56U7Ex49pcj0zBtmdXrmz/b4ioJo2a5AYiM38QzzV5CQgdJQxdPv+jWm2EzEqJZbNVe4ANujBY4rxN3KulKeaga1n6pFL6B4iRedbDnfXgodm+kWLL19oq82Zm5bTWOI0eSgeAjDYcZ21FtgvJ/3kQFB28XFO8WTxMnA2V5sOUYbKRUB1e5yRNkwRWgqFGKCAVgAbQXwqNZh22d9znYMXs/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmTglNyhFttvppX64VZyR39pn/iTJ7glzVNXWytBwdY=;
 b=RvlMj2N4m8FhqENHxt/8/tAFJR8TGYMOanRVOPn4CAW4uhyyqYctYSjaNnjENTG97S/sy3kXm46kpFRi+Jr5MuoZL/9mE/sIp0VQM9etkS+sSeoZ9DTyRkw1jyv1GRPSO+Y6WDwy3C34B+CuhL1ttvGL1mP5a+j8tFTh3qPn035I3mVPAiaeEu/GxC5szWjGKRkltOYaYo2WozSW3UlYGh/SCGo+Yu90wvOfpl47NTfsq3TwCjgHhyBLbeE1vk3lrSf0lFh70rJjXsjc3OaiMRQolHEMBuLWBCQVlNWdf6P7D4rXhg9d/swgBFuMO5/1/OinpphB4wln5uaPUYSFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmTglNyhFttvppX64VZyR39pn/iTJ7glzVNXWytBwdY=;
 b=cd/xzw0Sz4v63/hdbKcQ5ZK7IeX3sFJC/u/mKbI+LqnqOKjnJaYkxi97zzg55kQMbExUN28fuiTpn/ZHbKlUAKpjHHEoun9h51Qv56ZBB4dWjWo3Kbwmm8ukFNmlfb0hMv/Mxq7msx+/tdtabtM4QvzV0NXiz9sHwHNdfprl1hM=
Received: from BN8PR16CA0027.namprd16.prod.outlook.com (2603:10b6:408:4c::40)
 by DM5PR12MB1515.namprd12.prod.outlook.com (2603:10b6:4:6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Fri, 28 May 2021 13:57:19 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:4c:cafe::19) by BN8PR16CA0027.outlook.office365.com
 (2603:10b6:408:4c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Fri, 28 May 2021 13:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Fri, 28 May 2021 13:57:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 28 May
 2021 08:57:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 28 May
 2021 08:57:17 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 28 May 2021 08:57:15 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/dp_mst: Do not set proposed vcpi directly
Date: Fri, 28 May 2021 21:55:56 +0800
Message-ID: <20210528135557.23248-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528135557.23248-1-Wayne.Lin@amd.com>
References: <20210528135557.23248-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0e29608-602d-4a52-9aed-08d921e08219
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15156383B77175BAC5BDDC59FC229@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:31;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diYJ3l1yqW2aYm5C9dgm6vhKVMhTu1l0HJPwlqOjUzkYaqHSg/t2SCVIuxkFqr0ZGaer2fafUDpPym61phcVX6pkAACKIBldcjmxTTufJ8I1HMNY43rbbvWGC4PDv/6w+kONdxmlzfsB2ybwDNhc5vpeUPkghg6K5ENsu8EhfolKX3qBJeouM2MzwUmeXTvQbrRbrE8UNQ+/BlrH1/h1Ii8k8mreHEnY/eND0to5ltNz1nqUxR6TdXE2ZxEBDc379dSV/Ez4LkXJRIelGyZ15Wa8TNn4vLUeDJpk9096X7imTtHfUDsq2FodtgUTRJurRfC4WdqCyXuvzP9nrbnPsRLp0za/EkQ4Njf5q6kIIQ7YbN60i67iyyEhd2WgHh8Jc28y5xYHLovqc6JfL6SyDOMpYhp5TWSKmJz0EPmEk5b3e4yJ6NrRsRFTqiXqNBqZZcI7PTeFEQkJUCa7PeEDvPeKSa5oVHdmSWHSrkqa7qe7pdmhKje13v/mVWQJsooL0VgGQIYObDbqXRig17bcZtMzdzH/L75AVi4vxg6TkJV4mqI3+OR+ErHGCcAZhbRKR3jdmM8yTZKFKnBp8mItGMPB+gOK1KFf9f3uEYnD3UDTfsr5aYdvHxh2jbuDLCXM6VUw8pGyER8fljBBDrrNmEfAqOJQ2JYbCKKDV6KYX+joYPHppYod33VOlSbpe26t
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(47076005)(186003)(36756003)(7696005)(8676002)(6916009)(5660300002)(498600001)(86362001)(82310400003)(356005)(70206006)(2906002)(1076003)(70586007)(4326008)(8936002)(336012)(81166007)(83380400001)(6666004)(426003)(36860700001)(54906003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 13:57:18.8303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e29608-602d-4a52-9aed-08d921e08219
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
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
When we receive CSN message to notify one port is disconnected, we will
implicitly set its corresponding num_slots to 0. Later on, we will
eventually call drm_dp_update_payload_part1() to arrange down streams.

In drm_dp_update_payload_part1(), we iterate over all proposed_vcpis[]
to do the update. Not specific to a target sink only. For example, if we
light up 2 monitors, Monitor_A and Monitor_B, and then we unplug
Monitor_B. Later on, when we call drm_dp_update_payload_part1() to try
to update payload for Monitor_A, we'll also implicitly clean payload for
Monitor_B at the same time. And finally, when we try to call
drm_dp_update_payload_part1() to clean payload for Monitor_B, we will do
nothing at this time since payload for Monitor_B has been cleaned up
previously.

For StarTech 1to3 DP hub, it seems like if we didn't update DPCD payload
ID table then polling for "ACT Handled"(BIT_1 of DPCD 002C0h) will fail
and this polling will last for 3 seconds.

Therefore, guess the best way is we don't set the proposed_vcpi[]
diretly. Let user of these herlper functions to set the proposed_vcpi
directly.

[How]
1. Revert commit 7617e9621bf2 ("drm/dp_mst: clear time slots for ports
invalid")
2. Tackle the issue in previous commit by skipping those trasient
proposed VCPIs. These stale VCPIs shoulde be explicitly cleared by
user later on.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 36 ++++++++-------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 8f5a008501d9..5fc261014a20 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2497,7 +2497,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 {
 	struct drm_dp_mst_topology_mgr *mgr = mstb->mgr;
 	struct drm_dp_mst_port *port;
-	int old_ddps, old_input, ret, i;
+	int old_ddps, ret;
 	u8 new_pdt;
 	bool new_mcs;
 	bool dowork = false, create_connector = false;
@@ -2529,7 +2529,6 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 	}
 
 	old_ddps = port->ddps;
-	old_input = port->input;
 	port->input = conn_stat->input_port;
 	port->ldps = conn_stat->legacy_device_plug_status;
 	port->ddps = conn_stat->displayport_device_plug_status;
@@ -2552,28 +2551,6 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 		dowork = false;
 	}
 
-	if (!old_input && old_ddps != port->ddps && !port->ddps) {
-		for (i = 0; i < mgr->max_payloads; i++) {
-			struct drm_dp_vcpi *vcpi = mgr->proposed_vcpis[i];
-			struct drm_dp_mst_port *port_validated;
-
-			if (!vcpi)
-				continue;
-
-			port_validated =
-				container_of(vcpi, struct drm_dp_mst_port, vcpi);
-			port_validated =
-				drm_dp_mst_topology_get_port_validated(mgr, port_validated);
-			if (!port_validated) {
-				mutex_lock(&mgr->payload_lock);
-				vcpi->num_slots = 0;
-				mutex_unlock(&mgr->payload_lock);
-			} else {
-				drm_dp_mst_topology_put_port(port_validated);
-			}
-		}
-	}
-
 	if (port->connector)
 		drm_modeset_unlock(&mgr->base.lock);
 	else if (create_connector)
@@ -3404,8 +3381,15 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 				port = drm_dp_mst_topology_get_port_validated(
 				    mgr, port);
 				if (!port) {
-					mutex_unlock(&mgr->payload_lock);
-					return -EINVAL;
+					if (vcpi->num_slots == payload->num_slots) {
+						cur_slots += vcpi->num_slots;
+						payload->start_slot = req_payload.start_slot;
+						continue;
+					} else {
+						DRM_DEBUG_KMS("Fail:set payload to invalid sink");
+						mutex_unlock(&mgr->payload_lock);
+						return -EINVAL;
+					}
 				}
 				put_port = true;
 			}
-- 
2.17.1

