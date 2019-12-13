Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F211EBAA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5966ED64;
	Fri, 13 Dec 2019 20:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0216ED92;
 Fri, 13 Dec 2019 20:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2furdKpkC3mpxVckJ5ErEXwI4UizlKK11vRCMzOmaAr3VIKNWqMwGLbH2HscHlUbsfmUbS0+ndARGAvSQu+m/Nb14Uvf9dnKDa8+Tt7dQ2Oi6XdM4IHkuAO9PMNuUuG535taE4z81zffbdKD95uyOU63tbuQbM9VbCqzWqgRMd9hOxPI9ml4LBKmrmu+wZKg4hKpQXovMckzjzXAV6SlukbvVo5KrfPlt4R3Rl33NHSBFW5kRqqO2+Xuf+fdxRFmTPGCugpqzW9EGKuZYh4Uv3gUOj3SzRBP8Lhz1No8Hi7jOpePXfCBdkvqXLMLFNTmvG+Dhj9AwtiZhIZHl1vwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=237YAVetksgOCfOcazbabzAKUr5iNkYkpg4IzbWXFHE=;
 b=YoYBRrs5czbasxQ1qUyWHjEFooJ40mYY2v8JhqgLtAOxulz+5BOZnQ5IA673mjvvMii4PgUm0IxdA86u28BcKwmoSuwf2wgNEJjW+WXZngIEmJH9xxB02TVjnKbDs2JSxT++4XZIEBs7kISSuCm0XLvxlbSFJYg2nM8LMVz3QRioPODkF0yqPjR9u/mmQtg/R3IXpnOW1G/GjsDuwgbSDTW4mE5W8x2m2FN+/6T5QRlkWI6vruKoe+g86y/iWsPKfCMbU9euTRA2EKjFhmfcY3puQqPVyHg73eSf4zBlreFUV8AjE4wvqij5nJ6rTIJDr4B71t9D3EhEShweo6axbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=237YAVetksgOCfOcazbabzAKUr5iNkYkpg4IzbWXFHE=;
 b=ZvJPLPHq7W90zSYKQNsojqwv5KtmauDcwjAg89gaGi+MSHk3/GN1aNinuq0d1htwyqWpHXOnoWovuUmA3qLX/z64AjI6QzIxfeZQKBX1FsPp4rzTxdHClhoWteopaMrTFqWjxILefOqNZ09D4ZVAK5kEPQWCm6TdHvAedPJqdrY=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by BN6PR12MB1716.namprd12.prod.outlook.com (2603:10b6:404:104::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16; Fri, 13 Dec
 2019 20:09:07 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:07 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:07 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:03 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:03 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 12/18] drm/dp_mst: Add branch bandwidth validation to MST
 atomic check
Date: Fri, 13 Dec 2019 15:08:48 -0500
Message-ID: <20191213200854.31545-13-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(428003)(199004)(189003)(8676002)(4326008)(26005)(81166006)(54906003)(426003)(316002)(36756003)(81156014)(2876002)(450100002)(8936002)(86362001)(6916009)(2906002)(2616005)(7696005)(70586007)(478600001)(5660300002)(336012)(6666004)(70206006)(356004)(186003)(1076003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1716; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebc529a0-b764-4b6b-bf51-08d780084f39
X-MS-TrafficTypeDiagnostic: BN6PR12MB1716:
X-Microsoft-Antispam-PRVS: <BN6PR12MB17162E7ACA2159E0501B6EC3E4540@BN6PR12MB1716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:116;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWsF4e+fU9+mEj89HiFAMF0TWgO5lkKhIDli7RFsRU7CZlbWSa9/I8Tg9YMexEX7Y9lsp41XFYc8Jp7YEgnSQRAHq5GKAtsfMIeBlZtpHDhfPsxSphCZ4P2vjGIJGXLZyYndSPs0Wtd+E/tfTGlChJxBmLslQjF7G0dqciP4Itokc4jcZp9ZWzy0Un1Vxn5DoibI4Q7Q2WvxDU+CQyKiqwlQ6Bt1iezWLAlJ0Q+v1Pc1IFR0yOAOpcmDE/u83OD2+dlgQhXfWZTK9F4+9xzqEG/uHzBmsFw7gevROpG5KfZgKzeITtvCg1W4RMEnhZMb/D6sRqToWHTYumNkI/J9YhN9UQEtQF6fk4G0dyAPRWgzFMhNC8RCC4+b84Ok8QisC45/z697MTr2/oXIwpbvLivnuoK7HM7pZLobimT8ce05b9atxNQxlboeSmTOngQJXKDM67/3SINUHwF8ugtcqDHIJLpgRTSVl5x+UbQLVclLfWNJzMqvm9XdORv7YhnP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:07.3062 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc529a0-b764-4b6b-bf51-08d780084f39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1716
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
Adding PBN attribute to drm_dp_vcpi_allocation structure to
keep track of how much bandwidth each Port requires.
Adding drm_dp_mst_atomic_check_bw_limit to verify that
state's bandwidth needs doesn't exceed available bandwidth.
The funtion is called in drm_dp_mst_atomic_check after
drm_dp_mst_atomic_check_topology_state to fully verify that
the proposed topology is supported.

v2: Fixing some typos and indentations

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 66 ++++++++++++++++++++++++++-
 include/drm/drm_dp_mst_helper.h       |  1 +
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 7cd505e771ff..f8b72ac79c66 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4052,7 +4052,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 {
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_vcpi_allocation *pos, *vcpi = NULL;
-	int prev_slots, req_slots;
+	int prev_slots, prev_bw, req_slots;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
@@ -4063,6 +4063,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 		if (pos->port == port) {
 			vcpi = pos;
 			prev_slots = vcpi->vcpi;
+			prev_bw = vcpi->pbn;
 
 			/*
 			 * This should never happen, unless the driver tries
@@ -4078,8 +4079,10 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 			break;
 		}
 	}
-	if (!vcpi)
+	if (!vcpi) {
 		prev_slots = 0;
+		prev_bw = 0;
+	}
 
 	if (pbn_div <= 0)
 		pbn_div = mgr->pbn_div;
@@ -4089,6 +4092,9 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] VCPI %d -> %d\n",
 			 port->connector->base.id, port->connector->name,
 			 port, prev_slots, req_slots);
+	DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] [MST PORT:%p] PBN %d -> %d\n",
+			 port->connector->base.id, port->connector->name,
+			 port, prev_bw, pbn);
 
 	/* Add the new allocation to the state */
 	if (!vcpi) {
@@ -4101,6 +4107,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 		list_add(&vcpi->next, &topology_state->vcpis);
 	}
 	vcpi->vcpi = req_slots;
+	vcpi->pbn = pbn;
 
 	return req_slots;
 }
@@ -4677,6 +4684,58 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 	kfree(mst_state);
 }
 
+static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
+						 struct drm_dp_mst_branch *branch)
+{
+	while (port->parent) {
+		if (port->parent == branch)
+			return true;
+
+		if (port->parent->port_parent)
+			port = port->parent->port_parent;
+		else
+			break;
+	}
+	return false;
+}
+
+static inline
+int drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
+				     struct drm_dp_mst_topology_state *mst_state)
+{
+	struct drm_dp_mst_port *port;
+	struct drm_dp_vcpi_allocation *vcpi;
+	int pbn_limit = 0, pbn_used = 0;
+
+	list_for_each_entry(port, &branch->ports, next) {
+		if (port->mstb)
+			if (drm_dp_mst_atomic_check_bw_limit(port->mstb, mst_state))
+				return -EINVAL;
+
+		if (port->available_pbn > 0)
+			pbn_limit = port->available_pbn;
+	}
+	DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch has %d PBN available\n",
+			 branch, pbn_limit);
+
+	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
+		if (!vcpi->pbn)
+			continue;
+
+		if (drm_dp_mst_port_downstream_of_branch(vcpi->port, branch))
+			pbn_used += vcpi->pbn;
+	}
+	DRM_DEBUG_ATOMIC("[MST BRANCH:%p] branch used %d PBN\n",
+			 branch, pbn_used);
+
+	if (pbn_used > pbn_limit) {
+		DRM_DEBUG_ATOMIC("[MST BRANCH:%p] No available bandwidth\n",
+				 branch);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static inline int
 drm_dp_mst_atomic_check_topology_state(struct drm_dp_mst_topology_mgr *mgr,
 				       struct drm_dp_mst_topology_state *mst_state)
@@ -4808,6 +4867,9 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 		ret = drm_dp_mst_atomic_check_topology_state(mgr, mst_state);
 		if (ret)
 			break;
+		ret = drm_dp_mst_atomic_check_bw_limit(mgr->mst_primary, mst_state);
+		if (ret)
+			break;
 	}
 
 	return ret;
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 830c94b7f45d..2919d9776af3 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -502,6 +502,7 @@ struct drm_dp_payload {
 struct drm_dp_vcpi_allocation {
 	struct drm_dp_mst_port *port;
 	int vcpi;
+	int pbn;
 	bool dsc_enabled;
 	struct list_head next;
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
