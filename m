Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8A138E42
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 10:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B85089C03;
	Mon, 13 Jan 2020 09:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995F089AEB;
 Mon, 13 Jan 2020 09:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMgvUSDnT3DXYnXKGVKv3heEvHCn57WdnjxnYjHjC18i/WiVOsBP4z8/HdIz5FE9Hv0bpC2L6F8TJJtBTttI9TCAgEnsTmPjvNINrsHRrD1RHVBhe/cUiJo2+/krRFgmknermVMhaFik4TPls48aczb4o8FcG5U3FgLoWdniQtug+ugatfF49sDb6P8HNANPQgqGrbXq0BBcssXViB0tdNXtxi7Vr3DJJDbB/OW0RUAJyPRs+4qf16LOaTpDisz8Zu6K8VWNxfuKyYJbYGw0FPvcxXI91hK/TAl43yxuPn+7Q0wa11zXel/nbjZ4yvCfCsstSaZzq9rfDyHYB2mLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmZftCqn69OQfdWczJzzFbutP0FES3TAqwVX6XDbdKY=;
 b=Rm5VdrNWRXbUYlNeYXo9n8PRw0IRIYaRmoyZKYNqJ8FG95icbtvihJJV5Ndbi4OZJJcNELLH6D31YhpXjya+dE1bA2r7apvs+yrmk6gEEiwqyadIR2X9CVC/zTcBYh8TeDXSZHEmSBI5nMDWTgTGKYGIU40lK6ZVCz+flbHxqHvkLqveEo7nd8yF9Q2Ml2Ug5M3ykvFmPKTS2H0ZhlfWrbQDN4FpKL76MIUT5XpzTL/eSeSrHA9zXk1GaRYvbt5xK5iC5BDx7wzIuer6vUj1Cmqs6ROXXtN8lWnpCI1zmbu6lBjsqcYbbjPQQBdUnsfnKkcPT6uMX/TpTT+1CpTEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmZftCqn69OQfdWczJzzFbutP0FES3TAqwVX6XDbdKY=;
 b=AMKduGLc4RY54e5O9+y2rUN7d5Q26NVWbwdafVAQy7GVp3Bd6CCnzLcsXOst697mm2BUx2GoBvhTylvE4ivwMBswpAptsuSxOAXGWkMEwxcBsB0dizjwLVTqWEZ1jlx88hbJh4GC1SOB6f1r8d+nfWaW7rTkZhk1n+yuLIDD7dg=
Received: from DM3PR12CA0122.namprd12.prod.outlook.com (2603:10b6:0:51::18) by
 BN6PR12MB1220.namprd12.prod.outlook.com (2603:10b6:404:1e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 09:37:42 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::208) by DM3PR12CA0122.outlook.office365.com
 (2603:10b6:0:51::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Mon, 13 Jan 2020 09:37:42 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 09:37:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 03:37:40 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 03:37:40 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 13 Jan 2020 03:37:38 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: Have DP_Tx send one msg at a time
Date: Mon, 13 Jan 2020 17:36:49 +0800
Message-ID: <20200113093649.11755-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(428003)(199004)(189003)(2906002)(26005)(426003)(336012)(70586007)(70206006)(1076003)(186003)(86362001)(5660300002)(2616005)(8936002)(36756003)(6666004)(356004)(7696005)(4326008)(81166006)(316002)(110136005)(81156014)(8676002)(478600001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1220; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c631947-1199-465a-1803-08d7980c3c98
X-MS-TrafficTypeDiagnostic: BN6PR12MB1220:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12207330C51B5C990D4E1B60FC350@BN6PR12MB1220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 028166BF91
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PcyOmk4heO7YRyU+wRNYZnf7MrdXaBVBI30CJkkKSW6Gxd14xlAj9+L1JS5+TGizHvwFgg1t+4hn/MggklcJ1eikJ5jdiz/DxM0bmNXPa3c1z11afKec2BMxWLAbBN2xSfgLuAkW5J+qaLcr2C2aKLfflb+tBVU3swf3IorOQDzkokIGZAtN3Qj5dzAlH+LLX34+RWS34Gv3aFZQ67nsmui4Drha+bZUFEzu+Y6XE5tD9K2vSLVHzUW3WoroE3gog+mCD2sK6clF6QVThzrQDCiQ35qw3viSRITGn+CmxC+3Fsy/ktg0VF6j69dMHOaBiK6OGXzZmPKF6ozebaLV67S2Y/uyPRIbLQehd7trMJDg393iC9DsZcgOGBzpcNh4Gdgh6+xfPf5lDxHRmiaCa5ULPko/lejsnIrQrhaJK2riHn3gcCFRNOC8sXm1lPAV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 09:37:41.8243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c631947-1199-465a-1803-08d7980c3c98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1220
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Noticed this while testing MST with the 4 ports MST hub from
StarTech.com. Sometimes can't light up monitors normally and get the
error message as 'sideband msg build failed'.

Look into aux transactions, found out that source sometimes will send
out another down request before receiving the down reply of the
previous down request. On the other hand, in drm_dp_get_one_sb_msg(),
current code doesn't handle the interleaved replies case. Hence, source
can't build up message completely and can't light up monitors.

[How]
For good compatibility, enforce source to send out one down request at a
time. Add a flag, is_waiting_for_dwn_reply, to determine if the source
can send out a down request immediately or not.

- Check the flag before calling process_single_down_tx_qlock to send out
a msg
- Set the flag when successfully send out a down request
- Clear the flag when successfully build up a down reply
- Clear the flag when find erros during sending out a down request
- Clear the flag when find errors during building up a down reply
- Clear the flag when timeout occurs during waiting for a down reply
- Use drm_dp_mst_kick_tx() to try to send another down request in queue
at the end of drm_dp_mst_wait_tx_reply() (attempt to send out messages
in queue when errors occur)

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 14 ++++++++++++--
 include/drm/drm_dp_mst_helper.h       |  6 ++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 4395d5cc0645..3542af15387a 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1195,6 +1195,8 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 		    txmsg->state == DRM_DP_SIDEBAND_TX_SENT) {
 			mstb->tx_slots[txmsg->seqno] = NULL;
 		}
+		mgr->is_waiting_for_dwn_reply = false;
+
 	}
 out:
 	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
@@ -1204,6 +1206,7 @@ static int drm_dp_mst_wait_tx_reply(struct drm_dp_mst_branch *mstb,
 	}
 	mutex_unlock(&mgr->qlock);
 
+	drm_dp_mst_kick_tx(mgr);
 	return ret;
 }
 
@@ -2770,9 +2773,11 @@ static void process_single_down_tx_qlock(struct drm_dp_mst_topology_mgr *mgr)
 	ret = process_single_tx_qlock(mgr, txmsg, false);
 	if (ret == 1) {
 		/* txmsg is sent it should be in the slots now */
+		mgr->is_waiting_for_dwn_reply = true;
 		list_del(&txmsg->next);
 	} else if (ret) {
 		DRM_DEBUG_KMS("failed to send msg in q %d\n", ret);
+		mgr->is_waiting_for_dwn_reply = false;
 		list_del(&txmsg->next);
 		if (txmsg->seqno != -1)
 			txmsg->dst->tx_slots[txmsg->seqno] = NULL;
@@ -2812,7 +2817,8 @@ static void drm_dp_queue_down_tx(struct drm_dp_mst_topology_mgr *mgr,
 		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
 	}
 
-	if (list_is_singular(&mgr->tx_msg_downq))
+	if (list_is_singular(&mgr->tx_msg_downq) &&
+	    !mgr->is_waiting_for_dwn_reply)
 		process_single_down_tx_qlock(mgr);
 	mutex_unlock(&mgr->qlock);
 }
@@ -3743,6 +3749,7 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	mutex_lock(&mgr->qlock);
 	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
 	mstb->tx_slots[slot] = NULL;
+	mgr->is_waiting_for_dwn_reply = false;
 	mutex_unlock(&mgr->qlock);
 
 	wake_up_all(&mgr->tx_waitq);
@@ -3752,6 +3759,9 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 no_msg:
 	drm_dp_mst_topology_put_mstb(mstb);
 clear_down_rep_recv:
+	mutex_lock(&mgr->qlock);
+	mgr->is_waiting_for_dwn_reply = false;
+	mutex_unlock(&mgr->qlock);
 	memset(&mgr->down_rep_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
 
 	return 0;
@@ -4591,7 +4601,7 @@ static void drm_dp_tx_work(struct work_struct *work)
 	struct drm_dp_mst_topology_mgr *mgr = container_of(work, struct drm_dp_mst_topology_mgr, tx_work);
 
 	mutex_lock(&mgr->qlock);
-	if (!list_empty(&mgr->tx_msg_downq))
+	if (!list_empty(&mgr->tx_msg_downq) && !mgr->is_waiting_for_dwn_reply)
 		process_single_down_tx_qlock(mgr);
 	mutex_unlock(&mgr->qlock);
 }
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 942575de86a0..d0b45468135a 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -610,6 +610,12 @@ struct drm_dp_mst_topology_mgr {
 	 * &drm_dp_sideband_msg_tx.state once they are queued
 	 */
 	struct mutex qlock;
+
+	/**
+	 * @is_waiting_for_dwn_reply: indicate whether is waiting for down reply
+	 */
+	bool is_waiting_for_dwn_reply;
+
 	/**
 	 * @tx_msg_downq: List of pending down replies.
 	 */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
