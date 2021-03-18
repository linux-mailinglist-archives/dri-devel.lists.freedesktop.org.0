Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81734095B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 16:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FBC6E8B0;
	Thu, 18 Mar 2021 15:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F7E6E8B0;
 Thu, 18 Mar 2021 15:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdvDLTp7LMm86eLsnjR65/laUFFcubR+5sKhwRMSs2FkedahOczipkVSAyc8WIrUbmRKfy0iEjw6x7vVLj3kF0eKagkPAp99DZ2RtxwnTS2p/VnoSlk9Ukk+McRGnT64faKj6GcRinNXbblpL8OCVuaR1XdKf4jonZjsKrGRWgiF7O9OgUTRXOfI7cELIN+xo3omQQkZfWYkedLA2Jje+bx/jYk5Vm4zifdg2OcUtEZwg1zdoaET5ucYb27WasPIUjF12lx0kTe/RRnBq4f0zHG7JIKipk5PewlgsxV1F8+ed3vl8wAJ3qgRhH+3BSYw3JfaRPP2YWBOLeK+A78HQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eananX5TuppdXetxQIrX/jC0GI30j5a+EJDHW6Bcss=;
 b=b2TRhw+xI8wvbf3y3QOybvCTnujbJcAO78hvAhLVh7GR65/rQxKtf0YLVmtp4IeZfsezoqJuMrbM6qDH7LJ35sBQWBEMoIol0ZBe5bCCBt2kng0z5t7fOAKbuLrYbYRvW9FW+1iq+FOg7e1iiWrSZNoP4tI7i4xTNPuOB3AaE18oz1gt21Z3mlji3LUoYtlzBgywmqFfr1l5mlPGo/FgHWQCYBXn0g9k2XlGBkoDwGZxXj6QqXPgYdhDMMqaCmUy7dJ7XSpcYuY7+YBE8ej+kq4SCQeN4FX5gLa3AvfRd+meQweuGOG5a8gODH84LQYj9HW7+8xKrxnXhgVx8X9odQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eananX5TuppdXetxQIrX/jC0GI30j5a+EJDHW6Bcss=;
 b=Rp9A5m+6t/LXWJDKdas7SpUifqHCFhiLxJK8BZTPpQR2BAsDkxZJeHb4Yax7ilbrCUJVZBjBLMP9z4VV7nZmjGufra60jTcyP2mD8DmEQ3d1dmJ7+z72d8erk///z+njnwyIqvdH4Q/+VBhC1rs3ALlbqzfE0DeU5VXiUk5Yeto=
Received: from MW4PR04CA0296.namprd04.prod.outlook.com (2603:10b6:303:89::31)
 by CH2PR12MB3878.namprd12.prod.outlook.com (2603:10b6:610:2a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 15:55:49 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::98) by MW4PR04CA0296.outlook.office365.com
 (2603:10b6:303:89::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 15:55:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB01.amd.com;
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 15:55:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 18 Mar
 2021 10:55:48 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Thu, 18 Mar 2021 10:55:47 -0500
From: Eryk Brol <eryk.brol@amd.com>
To: <lyude@redhat.com>, <manasi.d.navare@intel.com>, <daniel@ffwll.ch>,
 <Harry.Wentland@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <nicholas.kazlauskas@amd.com>, <jerry.zuo@amd.com>, <wayne.lin@amd.com>,
 <eryk.brol@amd.com>
Subject: [PATCH] drm/dp_mst: Enhance DP MST topology logging
Date: Thu, 18 Mar 2021 11:55:16 -0400
Message-ID: <20210318155516.12737-1-eryk.brol@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d234cb-fd4a-45b7-76c9-08d8ea264d25
X-MS-TrafficTypeDiagnostic: CH2PR12MB3878:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3878ED8D2B1AFF0634CDE0F1E5699@CH2PR12MB3878.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dz+pTtgTWVLxcaP+zwFtSq/GwMECdtlodjNXwrDPnt1ouQbJwf17ZK9WHvgt467rTeo9DPKX6V8l5SUYabpgKR7WjSG8qFScUzLH/KaziHEwzavMkggYN6eyOEudA3qtxfFGbC0XZcO+3VU1SCfbCUb8PFt1d8+NEq9rRwTvNC8p9nkeYcBVuwrKapvHPLLOth3db3hqGqN9gMNLeTXuasibRLBsL642PiGty1b2gMQqZMqqbEJN3lYttPf/+Fi5Y3g92vhzZGg7s6kq9PPqESZnAsbPZLtlJfQS3+D3+hNF5s/9hHuLrZB0hLRYFYU2UweAHr5/EsFmyTqn5SS+SegiSmJ1NIgZXw50oyTVT/C7DIN/Txx5Lpq/ISse3P0ABBkKqUiYzYd9lhTblR/XH4XodPKuVVzwr/WI+/nz9QC5Ah8u5s+w3u4BZF6quAnQ0xbsZFapZ+mvOqUwtXhQESKKCAq5qAJcwRK32ZjUq/usgvhZJ6nnlBKJudpiQVgXJVhIFcdSrELdyW4P1gecC8xeOkFOOAKvCCvmpKbs2dcMMnl5n7tmtIIbwbalBoaAQ8E6irvb6vmefIk/Mnzbmuy21INpZBFykNeMnNbDyT+4JLrJxMHKteJ3IurziY+0GpFGg4nvp1giLiPAhdDmSlCBMCgggBrIj/2TNXev6XyklxdvQcYxcTGD4Xgmbbg3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(8936002)(2616005)(110136005)(70586007)(36756003)(70206006)(82740400003)(336012)(81166007)(86362001)(82310400003)(8676002)(426003)(1076003)(4326008)(44832011)(26005)(478600001)(5660300002)(316002)(54906003)(2906002)(36860700001)(83380400001)(7049001)(186003)(6666004)(47076005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 15:55:49.5123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d234cb-fd4a-45b7-76c9-08d8ea264d25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3878
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
MST topology print was missing fec logging and pdt printed
as an int wasn't clear. vcpi and payload info were also logged as an
arbitrary series of ints which require the user to know the ordering
of the prints, making the logs difficult to use.

[how]
-add fec logging
-add pdt parsing into strings
-format vcpi and payload info into tables with headings
-clean up topology prints

Signed-off-by: Eryk Brol <eryk.brol@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 67 ++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 932c4641ec3e..3afeaa59cbaa 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4720,6 +4720,24 @@ static void drm_dp_mst_kick_tx(struct drm_dp_mst_topology_mgr *mgr)
 	queue_work(system_long_wq, &mgr->tx_work);
 }
 
+static char *pdt_to_string(u8 pdt)
+{
+	switch (pdt) {
+	case DP_PEER_DEVICE_NONE:
+		return "NONE";
+	case DP_PEER_DEVICE_SOURCE_OR_SST:
+		return "SOURCE OR SST";
+	case DP_PEER_DEVICE_MST_BRANCHING:
+		return "MST BRANCHING";
+	case DP_PEER_DEVICE_SST_SINK:
+		return "SST SINK";
+	case DP_PEER_DEVICE_DP_LEGACY_CONV:
+		return "DP LEGACY CONV";
+	default:
+		return "ERR";
+	}
+}
+
 static void drm_dp_mst_dump_mstb(struct seq_file *m,
 				 struct drm_dp_mst_branch *mstb)
 {
@@ -4732,9 +4750,20 @@ static void drm_dp_mst_dump_mstb(struct seq_file *m,
 		prefix[i] = '\t';
 	prefix[i] = '\0';
 
-	seq_printf(m, "%smst: %p, %d\n", prefix, mstb, mstb->num_ports);
+	seq_printf(m, "%smstb - [%p]: num_ports: %d\n", prefix, mstb, mstb->num_ports);
 	list_for_each_entry(port, &mstb->ports, next) {
-		seq_printf(m, "%sport: %d: input: %d: pdt: %d, ddps: %d ldps: %d, sdp: %d/%d, %p, conn: %p\n", prefix, port->port_num, port->input, port->pdt, port->ddps, port->ldps, port->num_sdp_streams, port->num_sdp_stream_sinks, port, port->connector);
+		seq_printf(m, "%sport %d - [%p] (%s - %s): ddps: %d, ldps: %d, sdp: %d/%d, fec: %s, conn: %p\n",
+				prefix,
+				port->port_num,
+				port,
+				port->input ? "input" : "output",
+				pdt_to_string(port->pdt),
+				port->ddps,
+				port->ldps,
+				port->num_sdp_streams,
+				port->num_sdp_stream_sinks,
+				port->fec_capable ? "true" : "false",
+				port->connector);
 		if (port->mstb)
 			drm_dp_mst_dump_mstb(m, port->mstb);
 	}
@@ -4787,33 +4816,39 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 	mutex_unlock(&mgr->lock);
 
 	mutex_lock(&mgr->payload_lock);
-	seq_printf(m, "vcpi: %lx %lx %d\n", mgr->payload_mask, mgr->vcpi_mask,
-		mgr->max_payloads);
+	seq_printf(m, "\n *** VCPI Info ***\npayload_mask: %lx, vcpi_mask: %lx, max_payloads: %d\n",
+			mgr->payload_mask,
+			mgr->vcpi_mask,
+			mgr->max_payloads);
 
+	seq_printf(m, "\n|   idx   |  port # |  vcp_id | # slots |     sink name     |\n");
 	for (i = 0; i < mgr->max_payloads; i++) {
 		if (mgr->proposed_vcpis[i]) {
 			char name[14];
 
 			port = container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_port, vcpi);
 			fetch_monitor_name(mgr, port, name, sizeof(name));
-			seq_printf(m, "vcpi %d: %d %d %d sink name: %s\n", i,
-				   port->port_num, port->vcpi.vcpi,
-				   port->vcpi.num_slots,
-				   (*name != 0) ? name :  "Unknown");
+			seq_printf(m, "%10d%10d%10d%10d%20s\n",
+					i,
+					port->port_num,
+					port->vcpi.vcpi,
+					port->vcpi.num_slots,
+					(*name != 0) ? name :  "Unknown");
 		} else
-			seq_printf(m, "vcpi %d:unused\n", i);
+			seq_printf(m, "%6d - Unused\n", i);
 	}
+	seq_printf(m, "\n *** Payload Info ***\n");
+	seq_printf(m, "|   idx   |  state  |  start slot  | # slots |\n");
 	for (i = 0; i < mgr->max_payloads; i++) {
-		seq_printf(m, "payload %d: %d, %d, %d\n",
-			   i,
-			   mgr->payloads[i].payload_state,
-			   mgr->payloads[i].start_slot,
-			   mgr->payloads[i].num_slots);
-
-
+		seq_printf(m, "%10d%10d%15d%10d\n",
+				i,
+				mgr->payloads[i].payload_state,
+				mgr->payloads[i].start_slot,
+				mgr->payloads[i].num_slots);
 	}
 	mutex_unlock(&mgr->payload_lock);
 
+	seq_printf(m, "\n *** DPCD Info ***\n");
 	mutex_lock(&mgr->lock);
 	if (mgr->mst_primary) {
 		u8 buf[DP_PAYLOAD_TABLE_SIZE];
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
