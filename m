Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF111EBAE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8A86ED98;
	Fri, 13 Dec 2019 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B663F6ED40;
 Fri, 13 Dec 2019 20:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNYhyKLVG/pJIgpgNvadjFYvrgDwVeUduHb0fa2nVqYYWLVC1GEdyuOXWjUC/vsGYvw69W7fzfdHs+L34ePDdNso/pElJUTRUiwj2ZF0A6w27bKhp6CYkDkln0d14jrzPsxIakvnkzN2RjTW6VhqzWI62fc09FSDAtACnezl0N3YH/L9VizQrGYz+QgO8/zUlfBXG5WRTugfEMkMznBxp5RS2rBxJW+qYWJq8L5eXyzC7W5oXZM/A1FTnTDeyL5ePwiRtqGQIxnDzwr/psGhCNM1HGXxM16vLFjXKo+dypbjOcfoXyN37SxlTw3QtixVLBi/S+O8B4rjbw0YH9FubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkv+3Q0HQNXtBv9pjRnc+jmJ1d4Qx5pG7DSFEMoKmkA=;
 b=JcYdOPMGa5xym7mSyrftpi5oHZuJ8JipZFwoxss2g8eR21WY33H8SJHeMmiI/PHjgHb7nMIXoFpGTOHWII94zp/PBC7IvW1RuYWvl7iXaDa1qZKIj6jKIVSBVrHXJwiUhbTtx15ML5eKTOErvoWU4+2aRZ8EZNo57UIduVacoZqiT3uVx+pCB4xsgk+LYRrnJmq/C1WwUR910UVken9vxCm33OQkFOw9iJCqKmxT6wfKzhnwPQ3ix/QDv951uGUL14++9jYQa5KV9QkmjT/soiJ6fjQIK9loAMcUx6ncPpNdDH/XwBQ5DRUuof7enEp/We+/LnQnG3OcMUSNQ2SviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkv+3Q0HQNXtBv9pjRnc+jmJ1d4Qx5pG7DSFEMoKmkA=;
 b=kbRcGG8dno+C7YVg+xU4RSbf1Db71uIqlZxqusYiJMN+G5f8Qku82XQWWobjNLekarXVYvGL2HU93WVnlrKoEgnZ15BtxylJ4WoJHqPjtDXv6psGIupkVU9CY+Btmx669+5dHuZREONRDuOYCtF82tyMc2nvVkXlSXWEHno2/AA=
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Fri, 13 Dec
 2019 20:09:08 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::206) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
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
Subject: [PATCH v9 13/18] drm/dp_mst: Rename
 drm_dp_mst_atomic_check_topology_state
Date: Fri, 13 Dec 2019 15:08:49 -0500
Message-ID: <20191213200854.31545-14-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(428003)(189003)(199004)(8936002)(7696005)(2616005)(6666004)(186003)(356004)(81156014)(2876002)(86362001)(2906002)(6916009)(478600001)(1076003)(26005)(426003)(336012)(70586007)(70206006)(8676002)(36756003)(316002)(81166006)(5660300002)(4326008)(54906003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4221; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b9c6eb5-b78a-4c2a-77c0-08d780084f95
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4221BA5843E1D4AB9958770CE4540@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFQktxw7JXGdWGsOMR4XZ4Me+h6ZzkyiusbM1HKtHPvnZBquT2RWyJHr9Oz7rHby9YACJNPYyevbkzlMWwEZAYw8Mf3+2YhefuloE0rofJSGc+FtoTHk/cV+5zi7ZlhMi0aMvPytYeK3qI9y+pNEbfkJFtpyzS1CA4ZHHvVXOmQOYNwGt6uYSXHiPNvDJKoqZrOPZpy3serwnS3L/a6N66QDgpoL+I/OQP5ZQpRW3nNVfv2Em3BogaKZumB0KSeGDPClNGdUcVsACC4+3o1wtUjTyDsDuLhkV37apBSrgFJbe8B4Btt7PLgA2x5lSxXhyuk5tGPBF5ze6O2g7QVpLfbMEaqHnoZ1nneLBwvY8BpHJQSZqogYWSiWCP13xL5w4rcqKjO9217KthbLo4teYNIMnDPFVaLkIojrZjnP9DfC5Rpaj8ttpfsdHS55TaESAQn34ENJrYEK8u5O1KumUeK9Qln3vbikFxPS9qTUXvE7kVrHCFyxTAUZqfyZWwN4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:07.9073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9c6eb5-b78a-4c2a-77c0-08d780084f95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
drm_dp_mst_atomic_check_topology_state() should be renamed
to reflect more specific type of check. Since it is verifying
payload allocation limit it should be renamed into
drm_dp_mst_atomic_check_vcpi_alloc_limit()

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index f8b72ac79c66..ce21662f6144 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4737,8 +4737,8 @@ int drm_dp_mst_atomic_check_bw_limit(struct drm_dp_mst_branch *branch,
 }
 
 static inline int
-drm_dp_mst_atomic_check_topology_state(struct drm_dp_mst_topology_mgr *mgr,
-				       struct drm_dp_mst_topology_state *mst_state)
+drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
+					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
 	int avail_slots = 63, payload_count = 0;
@@ -4864,7 +4864,7 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 	int i, ret = 0;
 
 	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
-		ret = drm_dp_mst_atomic_check_topology_state(mgr, mst_state);
+		ret = drm_dp_mst_atomic_check_vcpi_alloc_limit(mgr, mst_state);
 		if (ret)
 			break;
 		ret = drm_dp_mst_atomic_check_bw_limit(mgr->mst_primary, mst_state);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
