Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A8429741
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 21:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A345C6E948;
	Mon, 11 Oct 2021 19:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421806E940;
 Mon, 11 Oct 2021 19:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiRLVwD3JBloJhoyF3JR4oQmNudLs7f1RJdQxidaJb2lFPqWcf7xlW+dLRPW3uTaX6fN/wdEIKVznmoXY3kZb8zSOgPtPwko66HRYO4GBwwq66sbffIPJMtFCwTJtqQiUllmJlj9dwkP2redg34eTn0OveRSDErPaBk3C/eBBVi7yh1PrQZI5Dr1fnCvvfpwNtWtOtcTmXJh57GyHBZ3Iou4SQTAaYmfSGLnzLbTXZn9e1wQ6kBvfqFCg1zvk4CSjAotFw0bDbX5RnQHRbxSu+FsHuU/VwCRhTY6HneNZKjYCdOPPQ/HA4mdug0fjZ9ic940b/ds+evQVkCsYaef/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCkj7hWvUyuIIv0001J+TfyXLy7DNBuZn2BfCAF+FR8=;
 b=AB+jOZfynkYhJwlZt41Bu49p+10o25xbt0LnJwgLdV2ZYAonuFNIkVPsXisyW+ZHdnvfO3gGJQx00Bj2jHkmEmIJxOQbU9PstTJ387E+EG+bb/OYxkoQN426Y2Gpi7/XGICUnRHEQZAJlRUF8CymrE7TJigaJ8Tz2QX3yOQut8s1wC4/BF1fBL/h6ilTPO8p4V3pDrLYs5I8FIj9FYh32ZloEqJDTFC9Vif7jbNuc9gxt/S0y+0A7o4J+qwcnGv9lRzDBPUpNSxjIDTBGcIpD5706XT7XPRwMY4+l58xvIeyZE9g41wRCALL6eBh2Z2AShtNphxgmV5LXZy0sHzwIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCkj7hWvUyuIIv0001J+TfyXLy7DNBuZn2BfCAF+FR8=;
 b=srGgUF6BrwVp4fSxDtTQE3xr3rcOXShPE+fMZGhu7J12PN6fE3VOf20DaJKbnyn94sfF5gLGWdEPXpHDRsM9Uosi2cOTyYlpF+IbTWz4k8umtSyb2KJc6faUS2eGxvF0+4qDJ5IuNjYbSTE5Bc3LMGVB6CDhXBYonu/eJoBkSAg=
Received: from DM6PR03CA0037.namprd03.prod.outlook.com (2603:10b6:5:100::14)
 by DM6PR12MB3691.namprd12.prod.outlook.com (2603:10b6:5:1c5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 19:06:26 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::49) by DM6PR03CA0037.outlook.office365.com
 (2603:10b6:5:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 19:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 19:06:26 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 14:06:23 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/4] drm/ttm: do not set NULL to debugfs dentry
Date: Mon, 11 Oct 2021 21:06:05 +0200
Message-ID: <20211011190607.104618-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211011190607.104618-1-nirmoy.das@amd.com>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 883aa27c-d46e-4275-7a2c-08d98cea3987
X-MS-TrafficTypeDiagnostic: DM6PR12MB3691:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3691DB1F4F55EF74EEFA23AF8BB59@DM6PR12MB3691.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4Gx0/QIJrJifGVVbsa1pLXOqXPhXxT80cR+CIHbuOhCPjh5mtAUSyOaidH4JigamsApmLo+f5T6sEFUC5qGnNISKiS8DOCw1izRyMDLLcFam9f8Ggo9MPTT3UfwQNuXqTrTyRvmrCxnpf/C17OjDzxBEZmXw6PRm6IyJZTdvEDtddBisLoKkc47OQRtlo87j3rkG2tlS7Ya6beXaLaMoFJSVlLUM2vYgd2A6cN7ycrTCx8AVm93XtRdkJ64NiNOsMQEBX4J6E+GlTx/3gpZmCax5ZiYYrhlaloHRaOEfsCNW7PVi7vPBG/Vlmx85P6h02QG+RkqZcDvNJaPxWnJsVWQedzbf5La39iNA1JXRXuVLNYuMxTbGrzfLOrPD8fl9tneGp4IQaezhha+IYGSUpT9acQO5fYiBY09mRdtV1yWWS0SAMEAwM7na5gNuWoVuORvW+bc0VNRW+bbzMoRiXG4SqPZn7mIwyEFmuv586VtMJe24iInCAz5PhdCkd4lrA5oTnKQNlYyt/XH/HN0ghW9NeSSnug7f3bbnBLNrVLfYvS2I97jj9g6/2cY02YV2Lpq0ifxpCZqSlXV3ORtl0t5iWDAoq05bPnAIvMy7FWEyIGwmVn3uQZmcSvdDObYk4wUaebjPe5Jq5rpRp8kaahTtiyjQdw0zWbM2qS+WMSeF8eAM6UepW4kbLkDQIvtRXIbTUrOfC6CLCWsUw6Ky11YZ26echrUAWEU+Lpir2o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(2906002)(26005)(82310400003)(16526019)(6916009)(316002)(5660300002)(44832011)(186003)(356005)(8676002)(54906003)(426003)(36756003)(86362001)(36860700001)(81166007)(83380400001)(4326008)(8936002)(1076003)(70586007)(7696005)(336012)(2616005)(508600001)(70206006)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 19:06:26.4212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883aa27c-d46e-4275-7a2c-08d98cea3987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3691
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For debugfs directory, it is recommended to save the result
and pass over to next debugfs API for creating debugfs
files/directories. Error conditions are handled by debugfs APIs.

CC: Christian Koenig <christian.koenig@amd.com>
CC: Huang Rui <ray.huang@amd.com>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index be24bb6cefd0..225ae6b0b4c2 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -77,9 +77,6 @@ static int ttm_global_init(void)
 	si_meminfo(&si);

 	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
-	if (IS_ERR(ttm_debugfs_root)) {
-		ttm_debugfs_root = NULL;
-	}

 	/* Limit the number of pages in the pool to about 50% of the total
 	 * system memory.
@@ -108,8 +105,7 @@ static int ttm_global_init(void)
 	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
 				&glob->bo_count);
 out:
-	if (ret && ttm_debugfs_root)
-		debugfs_remove(ttm_debugfs_root);
+	debugfs_remove(ttm_debugfs_root);
 	if (ret)
 		--ttm_glob_use_count;
 	mutex_unlock(&ttm_global_mutex);
--
2.32.0

