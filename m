Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC84311EBB1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F426EDA9;
	Fri, 13 Dec 2019 20:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8B6ED33;
 Fri, 13 Dec 2019 20:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l30reOPTLaFjK2MXRSvg/W3ERXM6f8UVu9FR2Ib1Qcc5RibtSNMcJJGxBMiJsbKXTa6yJuAAFwSQz5RkCndAyxOSnZAWboxAvhHGhj8TsuamZ2rdlrrM/bFw43FzwinbYtT3PLgceMPJGfrWBvkq3Rv2PWH9x9IwqzKdxVcsVkWxDw383mWGxPI3zd+x0R/fUvzSlYhXEcrmlqwqAM74sxofNb/WCOJ+1AYAi3gst70nWbNXn4+XvaBCuj+IJ23X30JR2g7YuMXuYtAgDS+W2RbQ8gepVjnpzl+1mt8C5KB4PG2JtTHhg8yRfwK7hmH+JZaDQ9sUHBPCXADCR2WDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbvwPj5pGCz8TCaKrJ+CVGIOlLWyiGdTeH6hYshDla8=;
 b=RgnTg2Mmnq3f1EoqD2lqhELd1vNcsP56aAyKRYRXhSHDnLGPzva8vh6ZezUBSzvOU980PtKVidcmh1kDhy3rYzPmrmeVQrgzLeHMddyQyVCbTonKalWluMKil38TE0MIxUyb12pWbFbYDMyQEM0lT76A4fZ4VGzx2n/Z0mSfi6bc6W/0YV1J1TwNxy7KFJi79Yn1vZO9JUo7bV5CC0oU2OBOe+2726E9slPzpUpC8YOS7HDyoEyL2XiNO8Ha9KNrlGd96uRiWto3HoqNkntlkA6fS603mPmPYT9s7wn9BA9vA79px9UEk/FPVe3siKx/Z8+71AVQmZmwAh1UVefoXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbvwPj5pGCz8TCaKrJ+CVGIOlLWyiGdTeH6hYshDla8=;
 b=0DysahV0iT/MR9o8FbFf8Kj72dOvngH1UY7Zu5SSgMqKZehb/W0tFJ1+ltjlqP/W0QbMZLrayOE/GZdxsXuVu7l4HlEegOJFP0QKjHCNYOMoVLSfJkX5fSbCSmhY21Cs/W9ND0nCuV8Fx4tBmkXOZACK8vL8JD+ZxAtZT9SPWSE=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by MWHPR12MB1901.namprd12.prod.outlook.com (2603:10b6:300:113::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16; Fri, 13 Dec
 2019 20:09:07 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:06 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:06 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:03 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:02 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 11/18] drm/dp_mst: Add DSC enablement helpers to DRM
Date: Fri, 13 Dec 2019 15:08:47 -0500
Message-ID: <20191213200854.31545-12-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(189003)(199004)(26005)(86362001)(70586007)(1076003)(8936002)(5660300002)(186003)(426003)(54906003)(2616005)(8676002)(316002)(81156014)(81166006)(2876002)(7696005)(70206006)(478600001)(36756003)(336012)(2906002)(6666004)(6916009)(4326008)(356004)(450100002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1901; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59feb248-0dea-45cf-0905-08d780084ed6
X-MS-TrafficTypeDiagnostic: MWHPR12MB1901:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1901038546840927646AE483E4540@MWHPR12MB1901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fV5OcFm78Xw9VU4aCKRT0raRf8eNsBrY5llVnADGbN+fdj15I5C/vFSHsz91kfqCeMlCXNlf0LEOqvHpfyX+HuPbsLX4XB5sFdu+rMPQ7abFrbVR0G0nhYb4cqyK3pN+TjmIZ+YX5vkmHufq0TSEmD7fXuB0aMoiJMZrfDD5XQQhtMTrcKilwn3nYpPbsSkCdgwDHw5fWSbj0nVeaJCEHdRWku1YBaiTcU2GmnbWvnOIyEPanDdFOYIc1jnPBHnlh9T5iSN+5GohyXqPHenIEuY3VAWlNjufuTZJkXuqLYcIT3AGc4Y5VDRiSypDdTAzEAOuVNgkjGBzUoXf057zQoq9fDuqaEgoTOvXqS5dVrFk9vAb7B8objpkd48T/ECvO8pYAiSOTO94CpwELeMOct/yc71r0GbGnQ2sDseEmkZ8yQHWKe+nJmUlGVYW9TfTPvxok7nuA8V5ciwimmPyrZeanvjbVrXuCoiSMjsxrtF342YpJpLH5cG3DUi+nU4t
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:06.6527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59feb248-0dea-45cf-0905-08d780084ed6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1901
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

Adding a helper function to be called by
drivers outside of DRM to enable DSC on
the MST ports.

Function is called to recalculate VCPI allocation
if DSC is enabled and raise the DSC flag to enable.
In case of disabling DSC the flag is set to false
and recalculation of VCPI slots is expected to be done
in encoder's atomic_check.

v2: squash separate functions into one and call it per
port
v3: Fix comment typos

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 61 +++++++++++++++++++++++++++
 include/drm/drm_dp_mst_helper.h       |  5 +++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index bb0844dfb3d2..7cd505e771ff 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4716,6 +4716,67 @@ drm_dp_mst_atomic_check_topology_state(struct drm_dp_mst_topology_mgr *mgr,
 	return 0;
 }
 
+/**
+ * drm_dp_mst_atomic_enable_dsc - Set DSC Enable Flag to On/Off
+ * @state: Pointer to the new drm_atomic_state
+ * @port: Pointer to the affected MST Port
+ * @pbn: Newly recalculated bw required for link with DSC enabled
+ * @pbn_div: Divider to calculate correct number of pbn per slot
+ * @enable: Boolean flag to enable or disable DSC on the port
+ *
+ * This function enables DSC on the given Port
+ * by recalculating its vcpi from pbn provided
+ * and sets dsc_enable flag to keep track of which
+ * ports have DSC enabled
+ *
+ */
+int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
+				 struct drm_dp_mst_port *port,
+				 int pbn, int pbn_div,
+				 bool enable)
+{
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_vcpi_allocation *pos;
+	bool found = false;
+	int vcpi = 0;
+
+	mst_state = drm_atomic_get_mst_topology_state(state, port->mgr);
+
+	if (IS_ERR(mst_state))
+		return PTR_ERR(mst_state);
+
+	list_for_each_entry(pos, &mst_state->vcpis, next) {
+		if (pos->port == port) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		DRM_DEBUG_ATOMIC("[MST PORT:%p] Couldn't find VCPI allocation in mst state %p\n",
+				 port, mst_state);
+		return -EINVAL;
+	}
+
+	if (pos->dsc_enabled == enable) {
+		DRM_DEBUG_ATOMIC("[MST PORT:%p] DSC flag is already set to %d, returning %d VCPI slots\n",
+				 port, enable, pos->vcpi);
+		vcpi = pos->vcpi;
+	}
+
+	if (enable) {
+		vcpi = drm_dp_atomic_find_vcpi_slots(state, port->mgr, port, pbn, pbn_div);
+		DRM_DEBUG_ATOMIC("[MST PORT:%p] Enabling DSC flag, reallocating %d VCPI slots on the port\n",
+				 port, vcpi);
+		if (vcpi < 0)
+			return -EINVAL;
+	}
+
+	pos->dsc_enabled = enable;
+
+	return vcpi;
+}
+EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
 /**
  * drm_dp_mst_atomic_check - Check that the new state of an MST topology in an
  * atomic update is valid
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 0f813d6346aa..830c94b7f45d 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -502,6 +502,7 @@ struct drm_dp_payload {
 struct drm_dp_vcpi_allocation {
 	struct drm_dp_mst_port *port;
 	int vcpi;
+	bool dsc_enabled;
 	struct list_head next;
 };
 
@@ -773,6 +774,10 @@ drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 			      struct drm_dp_mst_topology_mgr *mgr,
 			      struct drm_dp_mst_port *port, int pbn,
 			      int pbn_div);
+int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
+				 struct drm_dp_mst_port *port,
+				 int pbn, int pbn_div,
+				 bool enable);
 int __must_check
 drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 				 struct drm_dp_mst_topology_mgr *mgr,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
