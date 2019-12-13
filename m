Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DB11EBB0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9556EDA4;
	Fri, 13 Dec 2019 20:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752D6ED98;
 Fri, 13 Dec 2019 20:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k399Zf421FYouL3y7y+iHsYKLKbKsMybJLQm+SCxDKLYUIY2pO7P+qfmk2JmEj0Q/08bpEdJAh2mHkRCVDA4ScyAGpXo2F17o5hEFPuGGXVQ97jJ7Y/6ckUUsWMh3TM+zKj4TSyn7pXpmLgGqsK9htDhl5y1YAcJcbJwXzG4ZEEbvb1rcu3Cb1psgmUyV2cwPALYKJ/e/uIk3KeDIaCWj0+iGefV7Z21Sj1BcfF+3smmpiMbgbiA31cL1fYxLmZoe8H3TGxp42EnVIXYTiLhfLd4C1g8CtYncIinhKzkChc4FNlThqeWaLE/4PTMtMPmOuqkKVg8OoM+9fV3xVRGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwSedbD4iXs1MLga725Fo9WtsfQ8v6sz9BmuTCN3IIE=;
 b=XKvOHnHmi3VtnTAvHs5BJaG2KHQdFw2NFHDmDOulCjktNJTrk/P25wu0Frhlm/17352wyfqeFWjKnZMjZOGOak5s5CzKi0Ool/R2YUvz63h/ZEtN3/J5ZxO+HRwD9zAKljEtYSXi1oK/BT1u2Xxcz67OVAAkGqn++K3fe6MbCvjf4LOqj24oN3PTKCZ/T/JpYF9uTZqMGQTwE5s5EGjBveQP/bCHFHR4kaJOfqIIMwk+HswQTe9TNBI4nkNbV1cqOaIFD79Qt2yBvYpy3pg0of5fghUwRKeSZRmEyEY7gTj7pdywSg+kP+S3a3Y8rlY2FtPkDLO+91hlPXmjD28s3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwSedbD4iXs1MLga725Fo9WtsfQ8v6sz9BmuTCN3IIE=;
 b=qchvpuB5FUhpyK3Ew6wt3IVBYLeFCmHWNX+vK+ZEkDGs6v7RNc6kRj/IhH5DT2vRG3kiA6/Fe4gGUN9s58nOxRoqnDqKi+VxjYxMpePmnXTrf0ddS/xRgJYQ0074ulCtXzkKpluuxlEXTBeZetvpj2eyu0fKKg9WpnAjQCLy0e0=
Received: from BN6PR12CA0047.namprd12.prod.outlook.com (2603:10b6:405:70::33)
 by BN8PR12MB3313.namprd12.prod.outlook.com (2603:10b6:408:65::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Fri, 13 Dec
 2019 20:09:08 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by BN6PR12CA0047.outlook.office365.com
 (2603:10b6:405:70::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:08 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:05 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:05 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 17/18] drm/dp_mst: Add helper to trigger modeset on
 affected DSC MST CRTCs
Date: Fri, 13 Dec 2019 15:08:53 -0500
Message-ID: <20191213200854.31545-18-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(428003)(189003)(199004)(81156014)(7696005)(36756003)(2616005)(336012)(8936002)(70586007)(316002)(2876002)(8676002)(478600001)(81166006)(26005)(70206006)(186003)(2906002)(450100002)(426003)(54906003)(86362001)(6916009)(4326008)(1076003)(6666004)(356004)(5660300002)(17423001)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3313; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89040924-f190-471b-e7b5-08d780085029
X-MS-TrafficTypeDiagnostic: BN8PR12MB3313:
X-Microsoft-Antispam-PRVS: <BN8PR12MB33137242F681C0E1EE9F32C4E4540@BN8PR12MB3313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hc0m7bgXldxLOKBWLvBHKL7ZB05Azipy4GLGUad1qYwIemk6Shjt1WF7/4OWsfxDIj3GJ5/W244nZpiO2ziez1xJ9/vsGYHZzXQoLoGbQ2J1HG5YalZ2JKXzrT3bBMwhFFm31SUjwXmknSOhUWHPnPsf/6p5g6dSnPmRQj6rjkwh8KZiSF/B3zcwXC8cZYnSaf/OtsOQ0XMysHlMt4/BSVa58gPdD8bmr3tMqYAsG54Ukt2KlxmRkBN0CEVEGRGCZHR28ethMmdeWm22i6ZOAv/MUIZV29amYDjafMT8xwY5WIQZTlQMargdXFjScPxmJY05pTUhisVA3SHKbEsH2KtCidQBxEb6YI85auChxVIMbVH2AE53LyH5rfki6hPQwZikbRmifD6vULi95+9Xhn4wJ40dBWHILCoSiJGsR3xy2eJ2olDNFqb4C2ufU35ZWBnlZ8yJ9rndula+90XKq9eKEgtEcqUv8ptHO/aYkUs3wnBui3+T6QcWZSBUv9olGDoTvQmGjmu88/msZEOe/A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:08.8801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89040924-f190-471b-e7b5-08d780085029
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3313
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
Whenever a connector on an MST network is changed or
undergoes a modeset, the DSC configs for each stream on that
topology will be recalculated. This can change their required
bandwidth, requiring a full reprogramming, as though a modeset
was performed, even if that stream did not change timing.

[how]
Adding helper to trigger modesets on MST DSC connectors
by setting mode_changed flag on CRTCs in the same topology
as affected connector

v2: use drm_dp_mst_dsc_aux_for_port function to verify
if the port is DSC capable

v3: - added _must_check attribute
    - removed topology manager check
    - fix typos and indentations

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 61 +++++++++++++++++++++++++++
 include/drm/drm_dp_mst_helper.h       |  3 ++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ce21662f6144..ec90323949fc 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4775,6 +4775,67 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 	return 0;
 }
 
+/**
+ * drm_dp_mst_add_affected_dsc_crtcs
+ * @state: Pointer to the new struct drm_dp_mst_topology_state
+ * @port: Port pointer of connector with new state
+ *
+ * Whenever there is a change in mst topology
+ * DSC configuration would have to be recalculated
+ * therefore we need to trigger modeset on all affected
+ * CRTCs in that topology
+ *
+ * See also:
+ * drm_dp_mst_atomic_enable_dsc()
+ */
+int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_vcpi_allocation *pos;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+
+	mst_state = drm_atomic_get_mst_topology_state(state, mgr);
+
+	if (IS_ERR(mst_state))
+		return -EINVAL;
+
+	list_for_each_entry(pos, &mst_state->vcpis, next) {
+
+		connector = pos->port->connector;
+
+		if (!connector)
+			return -EINVAL;
+
+		conn_state = drm_atomic_get_connector_state(state, connector);
+
+		if (IS_ERR(conn_state))
+			return PTR_ERR(conn_state);
+
+		crtc = conn_state->crtc;
+
+		if (WARN_ON(!crtc))
+			return -EINVAL;
+
+		if (!drm_dp_mst_dsc_aux_for_port(pos->port))
+			continue;
+
+		crtc_state = drm_atomic_get_crtc_state(mst_state->base.state, crtc);
+
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		DRM_DEBUG_ATOMIC("[MST MGR:%p] Setting mode_changed flag on CRTC %p\n",
+				 mgr, crtc);
+
+		crtc_state->mode_changed = true;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_mst_add_affected_dsc_crtcs);
+
 /**
  * drm_dp_mst_atomic_enable_dsc - Set DSC Enable Flag to On/Off
  * @state: Pointer to the new drm_atomic_state
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 2919d9776af3..942575de86a0 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -780,6 +780,9 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 				 int pbn, int pbn_div,
 				 bool enable);
 int __must_check
+drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state,
+				  struct drm_dp_mst_topology_mgr *mgr);
+int __must_check
 drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 				 struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
