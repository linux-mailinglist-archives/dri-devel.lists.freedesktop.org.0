Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6611EBA1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87F6ED5D;
	Fri, 13 Dec 2019 20:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A818B6ED14;
 Fri, 13 Dec 2019 20:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gu5V24ZcR+ea81YzDTCnoT+1rrdBTZB4KoEwEgwAfGEmrTGqAHHODSGkLddMyTxQEgouI2MX+GnLq5cXzo+3rP5co08G9jwlfQSkf7AbpgUkPEswwHyGFmhIftOTDhe0qwxkM8Hj4DGr440T5iJ69y5XAvSp2rhWvI8KW65Y+da07jy/zM+233gGLKdfhqFwT0n2mHuU+qCa0wo8SXSohvGxhs/JLYxIFFPFOhzqq+KDiysG9FO5vG2FAd/X1wCqh5SpO7gtAAk6MuJYwS9AK513aJkOaut3Eff/oVdFiv8kPhUCLEuRl3DR+GYHkouPN41ZsBv9PN/Ufhe433AnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVRU6hGonLs8sSWXArRZUiAj62onUEryJ1+RYxT6bHY=;
 b=RfHvOjKRc2l7+sOF65THQzl0eCioIpqYCAHr4PP1YtX1SoaHSX8WLC7VVOMjU1NW8ZbdWnovT3MEmn2Pf0KuzH96TN4LMVpZxg1Z+aKmF/GPzec7lUyTH1PjYCIsstkWWHBV7s2mX/iN72MJi5bx3fFGI8mv7XD21alm8xpoY5QDuO1msgg2P80fMIGPJFd2u2IkYywYzqMb7ww0Z85fOOsO79fU97hho/dVATrCTmEEFzikhOMPYEKaGz7MkxrOj7SZCNRrIBvhDnI9ON+2+QTwkWzhE/ZQY+Xx4BYG9AAZoWsS0SHBmp/GIPwfeH3wDEwiDCvY/TxwZZjoHJwOTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVRU6hGonLs8sSWXArRZUiAj62onUEryJ1+RYxT6bHY=;
 b=JqMZr3sd+JaWwdtIYQR6kbVuvoUCjlW/Bl3ulP+jgYh0iM1pY5U0gdJkmzszXu+kFd1Te27C2zZaR/OWz0+yID748e0uWzfY8bakaqRcUP8kYz2PabdyZdK5EWd6clvLPPA9CVv71Kd1JbTuSF8/pXA7w+QWuB05uKhuSe7GoVY=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.16; Fri, 13 Dec
 2019 20:09:01 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:01 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:00 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:00 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:00 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 05/18] drm/dp_mst: Add helpers for MST DSC and virtual DPCD
 aux
Date: Fri, 13 Dec 2019 15:08:41 -0500
Message-ID: <20191213200854.31545-6-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(199004)(189003)(2906002)(478600001)(2616005)(2876002)(1076003)(54906003)(8936002)(81166006)(8676002)(356004)(6916009)(186003)(26005)(4326008)(6666004)(5660300002)(7696005)(426003)(86362001)(70586007)(70206006)(81156014)(36756003)(316002)(336012)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae2bce0e-cb5c-4029-4555-08d780084b65
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0056DB85C6177553669DFF8DE4540@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cev3t2VZjfVCCcqxjpypQYMJSRKZXOJC96ACJ8W/6RGgpitE/krVplW0uU1oF1IZyVZD0nLQcnQN+tFPFGh6ApC0/0aozNtc+Sb1yVnJf9yfRcDfZstwkIG/+tFsKjnuzkQwAJklRZAeoa0D3RUaindvTiNOpF4oILDT7X/8M8xFIn2J4UBEZUaXd9Oz/Q63GDrLCYhJecJalnS9TO/9FWshrgPCyGsJgORvDd97nuOAChZy8e9u1RtSpBp01sne1p6ulo7GR4snsM1OPwKy/MPBKp8mmpM4h6OCgxq8Mr7otPkxlfYF7g3/v+kFQCkgPLggtcH/dW/NfiaUhNfsVLLQGxC10lcFnyd/kqeD/QoRmEwKi3zBxLJHkOpPTb1XJnedPWPLd6hoIu1r6MGBHcES6uTzRdGeXv9eLsSw2QoQfzcGkr06YQKBqBYNsmWutqrPtGybM3OMF/zWGRVryYELBVjNEKThTpmN4QmrNvg5+kLPHDxcX7tbe48ChvvZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:00.8806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2bce0e-cb5c-4029-4555-08d780084b65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

Add drm_dp_mst_dsc_aux_for_port. To enable DSC, the DSC_ENABLED
register might have to be written on the leaf port's DPCD,
its parent's DPCD, or the MST manager's DPCD. This function
finds the correct aux for the job.

As part of this, add drm_dp_mst_is_virtual_dpcd. Virtual DPCD
is a DP feature new in DP v1.4, which exposes certain DPCD
registers on virtual ports.

v2: Remember to unlock mutex on all paths
v3: Refactor to match coding style and increase brevity
v4: - Check DSC capable MST sink connected directly to the device.
    - Check branch's port_parent to be set

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 143 ++++++++++++++++++++++++++
 include/drm/drm_dp_mst_helper.h       |   2 +
 2 files changed, 145 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 5a4c2db15c35..d58adcde8d72 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5003,3 +5003,146 @@ static void drm_dp_mst_unregister_i2c_bus(struct drm_dp_aux *aux)
 {
 	i2c_del_adapter(&aux->ddc);
 }
+
+/**
+ * drm_dp_mst_is_virtual_dpcd() - Is the given port a virtual DP Peer Device
+ * @port: The port to check
+ *
+ * A single physical MST hub object can be represented in the topology
+ * by multiple branches, with virtual ports between those branches.
+ *
+ * As of DP1.4, An MST hub with internal (virtual) ports must expose
+ * certain DPCD registers over those ports. See sections 2.6.1.1.1
+ * and 2.6.1.1.2 of Display Port specification v1.4 for details.
+ *
+ * May acquire mgr->lock
+ *
+ * Returns:
+ * true if the port is a virtual DP peer device, false otherwise
+ */
+static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
+{
+	struct drm_dp_mst_port *downstream_port;
+
+	if (!port || port->dpcd_rev < DP_DPCD_REV_14)
+		return false;
+
+	/* Virtual DP Sink (Internal Display Panel) */
+	if (port->port_num >= 8)
+		return true;
+
+	/* DP-to-HDMI Protocol Converter */
+	if (port->pdt == DP_PEER_DEVICE_DP_LEGACY_CONV &&
+	    !port->mcs &&
+	    port->ldps)
+		return true;
+
+	/* DP-to-DP */
+	mutex_lock(&port->mgr->lock);
+	if (port->pdt == DP_PEER_DEVICE_MST_BRANCHING &&
+	    port->mstb &&
+	    port->mstb->num_ports == 2) {
+		list_for_each_entry(downstream_port, &port->mstb->ports, next) {
+			if (downstream_port->pdt == DP_PEER_DEVICE_SST_SINK &&
+			    !downstream_port->input) {
+				mutex_unlock(&port->mgr->lock);
+				return true;
+			}
+		}
+	}
+	mutex_unlock(&port->mgr->lock);
+
+	return false;
+}
+
+/**
+ * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
+ * @port: The port to check. A leaf of the MST tree with an attached display.
+ *
+ * Depending on the situation, DSC may be enabled via the endpoint aux,
+ * the immediately upstream aux, or the connector's physical aux.
+ *
+ * This is both the correct aux to read DSC_CAPABILITY and the
+ * correct aux to write DSC_ENABLED.
+ *
+ * This operation can be expensive (up to four aux reads), so
+ * the caller should cache the return.
+ *
+ * Returns:
+ * NULL if DSC cannot be enabled on this port, otherwise the aux device
+ */
+struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
+{
+	struct drm_dp_mst_port *immediate_upstream_port;
+	struct drm_dp_mst_port *fec_port;
+	u8 endpoint_fec;
+	u8 endpoint_dsc;
+
+	if (!port)
+		return NULL;
+
+	if (port->parent->port_parent)
+		immediate_upstream_port = port->parent->port_parent;
+	else
+		immediate_upstream_port = NULL;
+
+	fec_port = immediate_upstream_port;
+	while (fec_port) {
+		/*
+		 * Each physical link (i.e. not a virtual port) between the
+		 * output and the primary device must support FEC
+		 */
+		if (!drm_dp_mst_is_virtual_dpcd(fec_port) &&
+		    !fec_port->fec_capable)
+			return NULL;
+
+		fec_port = fec_port->parent->port_parent;
+	}
+
+	/* DP-to-DP peer device */
+	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
+		u8 upstream_dsc;
+
+		if (drm_dp_dpcd_read(&port->aux,
+				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+			return NULL;
+		if (drm_dp_dpcd_read(&port->aux,
+				     DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+			return NULL;
+		if (drm_dp_dpcd_read(&immediate_upstream_port->aux,
+				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+			return NULL;
+
+		/* Enpoint decompression with DP-to-DP peer device */
+		if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
+		    (endpoint_fec & DP_FEC_CAPABLE) &&
+		    (upstream_dsc & 0x2) /* DSC passthrough */)
+			return &port->aux;
+
+		/* Virtual DPCD decompression with DP-to-DP peer device */
+		return &immediate_upstream_port->aux;
+	}
+
+	/* Virtual DPCD decompression with DP-to-HDMI or Virtual DP Sink */
+	if (drm_dp_mst_is_virtual_dpcd(port))
+		return &port->aux;
+
+	/*
+	 * The check below verifies if the MST sink
+	 * connected to the GPU is capable of DSC -
+	 * therefore the endpoint needs to be
+	 * both DSC and FEC capable.
+	 */
+	if (drm_dp_dpcd_read(&port->aux,
+	   DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+		return NULL;
+	if (drm_dp_dpcd_read(&port->aux,
+	   DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+		return NULL;
+	if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
+	   (endpoint_fec & DP_FEC_CAPABLE))
+		return &port->aux;
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_dp_mst_dsc_aux_for_port);
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 0cada01e8139..32e60b9d7098 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -783,6 +783,8 @@ int __must_check drm_dp_mst_atomic_check(struct drm_atomic_state *state);
 void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
 void drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port);
 
+struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
+
 extern const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs;
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
