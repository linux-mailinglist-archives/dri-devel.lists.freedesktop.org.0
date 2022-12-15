Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51964D569
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 04:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A5610E4E5;
	Thu, 15 Dec 2022 03:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA74410E4E2;
 Thu, 15 Dec 2022 03:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjvdOive1yXsnP3HcdJN8Y4SkgZsS3F+UJBC+H5oEHIQMqH9j7v9LDQQujM7kUCCLcCHKbRutrIrRqRYhLclhfsfOJFTh54NqdacpRElXcUdH9Pbx7JPq5jAn2jR6CS9LCdA5KHb18qftf6RCy+6Nya27M+dqqyoVR/hKBnpkbYYykh7j/Ozs5fjw+ibcfYQdOEmkzAWOcNNoEWP5yvhJkArsj30xT+6DZsoqkln/Nmi6ymI3F2IwMzJExZIICiqOXeYeWFmLGZCNdavvgYqJa25FShceOVtF10q2kRz/I85RrdwqCqBxfDX3wVHdG3TBEQ71k656cPOrf5f/Uw7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlyRAEDXpTA6omtt17Y0RY0gn2v2KwxhejVniC3qMi0=;
 b=oCeCXm2/M0/737YYBKZe05ildiAQdv5+QqNY4LpYavd1rexvZVlwd9/T43x8nl8Idd/uA30f7MaRSyqJpbx0K9bCgafgl3pOHD98kjdus3iPNacDwwPHQWK+ZqVW+UULgWEpu6FnH7Q4dvUoUHIBXclWdNy0qKln3Q92RegxjErp/yRKh5eOO0UiemA7GR7FtFar2ZSdbbNx7VRn9WS/3rRcBy0kguKpM4DgTfuLCMZ3IHUaU3H6eVm+zxLXJE+xD51TDjhRVxmAxGQBfegRHB7M4YFMFY4sDW3Vy1D1HPD165nreKBWXDs+QwnJ90SLREff/sq1P6qj4LDY3YRpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlyRAEDXpTA6omtt17Y0RY0gn2v2KwxhejVniC3qMi0=;
 b=KFkq4230N+CDbKYTJGunRw0lCICJNtkLjluwwo3uM+Ynvxm4k/U5dq47mxIWYXtDfSpqCvkXtOgeoVyvd5XN6M3YOuzzqPCrMsob0r5HDc0KGu1tPVZ+SxPf0cx0yA3gqEy7OoXcRLmYYkORCkV5bSpJZZ+Y226xPej+clb+fMI=
Received: from BN9PR03CA0603.namprd03.prod.outlook.com (2603:10b6:408:106::8)
 by SN7PR12MB7348.namprd12.prod.outlook.com (2603:10b6:806:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 03:02:26 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::b4) by BN9PR03CA0603.outlook.office365.com
 (2603:10b6:408:106::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Thu, 15 Dec 2022 03:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 03:02:25 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 14 Dec
 2022 21:02:24 -0600
From: Ma Jun <majun@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>
Subject: [RESEND PATCH] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
Date: Thu, 15 Dec 2022 11:01:46 +0800
Message-ID: <20221215030146.1142523-1-majun@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|SN7PR12MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: b2850a3b-9f72-4084-5a21-08dade48cb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4bQ/1HK9tpNxaEkiX6ZKPJtrJrT2HDmNlHPFBQ7KmhYFcvnt3DsSED7ileCRil7y7HCMFOVnEvlY37+JWRPV+tf+biIAxfTTpNjmKdAgeNxw6Rl/WidpPfTIyHHws6ei17XWPzFXMHVZtZa9Cwn0tE/f8k3qaOWYAF77UHX6uq6FCkm+wX2ZibWgTWGFbrRkF/dcDrrrLO8GKGzNWGpd3Qm+jrx5WyZZGy0G5uB0G/Tzh6li0C8SUgsq9joltTSxx8cDqGJE3PhYajNSqeLz8L04kXEYLOFwxSc7ebpr8WPIY6G9Zm+zaw5LQeyUopbcGaHEgXN2joe2jB8TcOM2dPvWYPeKRkFaKi3+ATnyXQxqvBVLIFPLegKTIIznOp/fiZ33VszzpBbhT4m+NjBxA0vcYHZGCS1oBoiRX8Y4wi9MTT/zyHJgiOhuTXj87QzkCp5PRLmjBAQsAYwV+WNBltn9a4Dbv8iuzARyjKB02yBhzkD7+CdFq1gGXy10eiNa//wR2EKBkY/bX6ibHA6pcUjXwtKXD/tZ9E4GK/CTEWG5zkfKRfDhK6tDSfCULIo1JvIfQwgsLwLgPna6+pDEXa8jI8Z+DG67r7MTYJnkX8GDYMUnkGz3IFHr7RxCsuP0FAHerGBqLyHLqSIkhzzVpoexYGxFb8o2M633Vmbf4gw3b9ZTO4x0Fo7x44mRu8LCneX8atLDzDBIWkhfIssE8gndnWH3ZDxd1/klTjUtJN8J5J2HRqwe7WeXpSGRcAl
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(478600001)(16526019)(41300700001)(5660300002)(8676002)(4326008)(6666004)(316002)(2906002)(110136005)(47076005)(81166007)(82310400005)(1076003)(4744005)(8936002)(70586007)(26005)(2616005)(40460700003)(70206006)(40480700001)(7696005)(356005)(426003)(336012)(82740400003)(36756003)(186003)(83380400001)(36860700001)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 03:02:25.7921 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2850a3b-9f72-4084-5a21-08dade48cb6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7348
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing declaration of struct drm_atomic_state to fix the
compile error below:

error: 'struct drm_atomic_state' declared inside parameter
list will not be visible outside of this definition or declaration [-Werror]

Signed-off-by: Ma Jun <majun@amd.com>
---
 include/drm/drm_plane_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index b00ad36cf5b6..530f88176db4 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -30,6 +30,7 @@ struct drm_crtc;
 struct drm_framebuffer;
 struct drm_modeset_acquire_ctx;
 struct drm_plane;
+struct drm_atomic_state;
 
 int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
 				    struct drm_framebuffer *fb,
-- 
2.25.1

