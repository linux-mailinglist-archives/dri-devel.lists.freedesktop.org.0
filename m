Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6211EB95
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49D66ED17;
	Fri, 13 Dec 2019 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857DA6ED0F;
 Fri, 13 Dec 2019 20:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LytsxIvtnVNwqwoKfZgEEGwvcXMy8kf2N0Un0PoXBUcFxF7WWbSjUN8pU6LUhqZq0mFYzY/Pw6YpCAeYYAI8FCEK8k46I7GXZgLaqOvZmHxZ8kmTkkgbeIdlvC5+/ZkuvEBhueddBArkoAaCqOKvRek0mwe47DiAqYBQqSTyQAo9vKCBQtw7wu8wUbBnCoNXAAZMmELo7qDA2dgFXNKpPnT2nLSGCSdWyT0XWsPKZptU17Z1SNN5qnxjeo7K3RarxLBEBGSxb3aOh66N46wztZFW7x2/oqao9o/ugh7JvvovbEcs86FVMfDi/LBtrnWYRi1KcIyZgj+j6F9/J0cUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCxgvf7Qt+wQO7yeXpmMmiL629J0JOYa5ABTDu4ET/4=;
 b=llvM86WLYCM53eZnewdLK15KbsgyWM9dLyAtF04QkoHMTkEjf5AKEN5/zrudJgdSEi/CBHzpC8PKNnrUvszg0cG4UmvBhzdkfqLUrSpcpRkS1CKShuneAcsspkp7i8y/reMjLn3K6l4b7v63l/bA2cbXMYrSg8AC8wEQJndLNYOPPlPeJTwf8mJvkv9JgWHO8TwpouBltQiYjSIpDtYIv3KDY1AI++lYe/ZpM8sdD6lqVBeoqUf6kd+YZqbKlVAQwYGwan43nSq23RsMaK80ysAwkC313pjiCo4QZTrLJsjZCAiUXfyUburzQRnnDdIjArQ6b/OrBmJkSW+DfXZ/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCxgvf7Qt+wQO7yeXpmMmiL629J0JOYa5ABTDu4ET/4=;
 b=g23DvpYC/ygXt+x49HoAQ3jn2PvuE0Nu4hN/JUHY7mGXb0TsM+K8XVqw9i+WlUCfXUpxLBEPf0nhaTllEfGYSqkqaRF3+G+jT/smoRTbQ1BC8KXx59kUpKff9lbMxqvMcAjC6EDnsNzYjWXz5oho2l2bUTI1jyfiXbjv7n11z0I=
Received: from SN1PR12CA0069.namprd12.prod.outlook.com (2603:10b6:802:20::40)
 by CH2PR12MB4231.namprd12.prod.outlook.com (2603:10b6:610:7d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16; Fri, 13 Dec
 2019 20:09:01 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by SN1PR12CA0069.outlook.office365.com
 (2603:10b6:802:20::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:00 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:00 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:59 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:08:59 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 04/18] drm/dp_mst: Fill branch->num_ports
Date: Fri, 13 Dec 2019 15:08:40 -0500
Message-ID: <20191213200854.31545-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(428003)(189003)(199004)(450100002)(4326008)(316002)(70586007)(54906003)(336012)(8936002)(81166006)(8676002)(70206006)(186003)(81156014)(2876002)(2906002)(26005)(478600001)(86362001)(7696005)(5660300002)(356004)(1076003)(36756003)(426003)(6666004)(6916009)(2616005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4231; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82d4b599-6dd2-4c1b-4de0-08d780084b49
X-MS-TrafficTypeDiagnostic: CH2PR12MB4231:
X-Microsoft-Antispam-PRVS: <CH2PR12MB423194CD1FAE3F5ED35782D5E4540@CH2PR12MB4231.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjtKEMjLWRmrhGe9GQUcsDeoedJSLc1m4/GvHc3IhPpmfL9mlFB5NN2LXiKkRGqfZI6PYfvu51p2qLlvOU+JYEwlBpt6wjpqV/EIURo1AX4Ygg9qjHksC0CbK0v6EDwW+P7XVukc4qYUpSX1v65TRM4UJoCnoj63p32rzov73/sDCw470oZJ0h3A9khmOBp1JYq40h4ihytnNcT0c3lR6iftk9DCgZzUjq1nJhO0CI4Yd+ZD+bONGgzK3jnI+hIYceWFWuYFa/kHCxEhztbK0RVMKQtbHs25gfn8y64bgsbAtx0OffNJoMQcgshICH2dTz/M+CgsxcSuLrgECouCIQjqikksc0RHgQ1EzWikqsnMwPQxKq8YO6Sdu4vPZDZbVeS7L531z7ueSHBZ0bNc539dMc1wm6KNHBDrW/ttSkTZiCdTZu2OUX4FVo4juqP+jeFC3BNERWajt7S1avtVrkW9lzqYwDhs8rU6E/9rfmwX9z35n23kdZWtY+yYG9/E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:00.6552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d4b599-6dd2-4c1b-4de0-08d780084b49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
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

This field on drm_dp_mst_branch was never filled

It is initialized to zero when the port is kzallocced.
When a port is added to the list, increment num_ports,
and when a port is removed from the list, decrement num_ports.

v2: remember to decrement on port removal
v3: don't explicitly init to 0
v4: move decrement of num_ports to unlink_port function

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ba5328cdc853..5a4c2db15c35 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2157,6 +2157,7 @@ drm_dp_mst_topology_unlink_port(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port)
 {
 	mutex_lock(&mgr->lock);
+	port->parent->num_ports--;
 	list_del(&port->next);
 	mutex_unlock(&mgr->lock);
 	drm_dp_mst_topology_put_port(port);
@@ -2256,6 +2257,7 @@ drm_dp_mst_handle_link_address_port(struct drm_dp_mst_branch *mstb,
 		mutex_lock(&mgr->lock);
 		drm_dp_mst_topology_get_port(port);
 		list_add(&port->next, &mstb->ports);
+		mstb->num_ports++;
 		mutex_unlock(&mgr->lock);
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
