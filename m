Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C0441358
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 07:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4ADB89BFC;
	Mon,  1 Nov 2021 06:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FC889BFC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 06:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC0ONc+SJm3crqU48hcgpxw6+MsTG9bfsw1nZAmBCk0GgpNhIbIx8xBo7PqmszZ7FS/hNrAc9OOSfAfMZt6vJQhdY/0do+ht284JwLWTOBvWpgacLUWOdcyYDqRE91u3j5Zxgffy1zFX4OiBP/ROujv7MxWq+PWn+KlVH6F+JpDyfcCNHnq3vw+Uv0gzY2N3DyKNjXnJwQO1QgHVgPyIgaVgSesEA5W8M120XAIrPznOiYgTHMJXWqhlceAzVN0P40c2DNmVci1rwO7VBAlsYQNaiuekS5v4Py1B4v9U6R23YS9QQNAuOB9WuXR7+YuWVmLSBd/FvJmVPBrXhCX66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOXfWFVO2hup5zE3zl50c/fwD7g3YpBwR6DdXb7mEeA=;
 b=VmPLvRtlHPnvtHlsHmwZCw9MIc7l2JzKZlmsvnH5rojHsPjXuSAlWYhvfiBStK8WwrTnbvoavY9eHvKSjh9VeafSwG/gmQ+ivT7s4eDtJHgQ3G7h6yfEhFMDtfZvEmYpg33pk9e5owV5AZvO3K0xWFieSkXwe7buxlKkj7FeflGFmNLHvUAn2kHsukU/ObUHuWmJM8Ecja/FJ2O55TYzU9HfcF0CnCrczjpnZcP5HuV0mQOtN2O06IgUxMcV2Xkj4fiKSwWm7y2FxNmdakfgW+wLZCApcMYqVZ1V1/aYZ9ZDkk+jyIN+xuSe0gsoDRnS38+YirL2By8w971eSpwm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOXfWFVO2hup5zE3zl50c/fwD7g3YpBwR6DdXb7mEeA=;
 b=1+tUqsOLo4zRzTX48BQQK/LUsZiv3OOim+fLbhBve2h9PML6qT+RgaQCSOcWRBSqmP2iNVkVq/VSOikcWYrOvS3ymK66EOR0r89iy/JlR9YGlisMa77lJo+mR6QYnCWtbDfIt6Jnb5YWLQFxO/zTO7SNQmbEWaIU1Z0Sah3qfXI=
Received: from MWHPR20CA0027.namprd20.prod.outlook.com (2603:10b6:300:ed::13)
 by BL0PR12MB4724.namprd12.prod.outlook.com (2603:10b6:208:87::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 06:03:04 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ed:cafe::4d) by MWHPR20CA0027.outlook.office365.com
 (2603:10b6:300:ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Mon, 1 Nov 2021 06:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 06:03:03 +0000
Received: from pyuan-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 1 Nov
 2021 01:02:59 -0500
From: Perry Yuan <Perry.Yuan@amd.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Date: Mon, 1 Nov 2021 02:02:49 -0400
Message-ID: <20211101060249.35041-1-Perry.Yuan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca9585c-a3dc-4c13-7cf7-08d99cfd4488
X-MS-TrafficTypeDiagnostic: BL0PR12MB4724:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4724D0B073B56A3AD738C3169C8A9@BL0PR12MB4724.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEh8lK1oq3xu1qosByZor+GNNJDY13YG8GiHDEJSYveWwDhLxCb6MXM7qxTA9wL43zMJ5L/s/WbgJQZwbiyGyxwcnnU9nH4GS1cUSOdiXufEi/S+yfiStwTi9FqjA14pWd9jMTIDos9b6MM9SqhPTBmsJ7N1I5Xr2YCgqCz8xY2La4ppvM+4KePzThWwqKUPQ8H7lYlFAwbeGmlZqgI8ctYVM9NQ+cJPZtsXURboGFLWYK8jMs3bUtxvSJNVIDymuIOCBeI4MrzmM3tzJ8Uk2jQU+SHjoKNY/B7zVNQR5cOvU29kbL/vM06TY9dKSRdNGTh2VX6vIKGe/YjV5iyZEfLJXTda3eP66mTPJNiVCza7enXm11XtcAL9Pjt2vNdEVMLlbHbfhr/CCnEQlhfJNYgn9Lkb3q3qDESHIfwDEo5mhmeoa3Lqy7rzjOZHzMjLRX5OpX3v4u/j4euBy5eUlh6onr3XHHVvHPUJvw/yHqwKccbUVqMmiJPXMoTg3UYQMaMjGDSb2mQd3PVEu63i+1RiBDPoPU1QfhYDgCztu5P1jGY94Cr41pALOJvThKWCTZrg9UucD0iRYXo8DgPHtYmjzaiLLuogmd3yGgMwqZ1Wcyah/8mrA5hTObriZiOufIIasqkS5ddZ3urw1KFq7Mki6/fa/zl5igh2t7PFvwWZPo0tiQNxq0AXDkHGOijNv9XvdYPnmo61Fpff0a6Evu2ExDSIu+FAtfc0WVRfr6w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70586007)(70206006)(54906003)(110136005)(2616005)(86362001)(82310400003)(36860700001)(47076005)(426003)(336012)(2906002)(6666004)(36756003)(26005)(186003)(1076003)(16526019)(8676002)(4326008)(356005)(83380400001)(508600001)(7696005)(81166007)(5660300002)(316002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 06:03:03.8361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eca9585c-a3dc-4c13-7cf7-08d99cfd4488
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4724
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
Cc: Xinmei.Huang@amd.com, linux-kernel@vger.kernel.org, Perry.Yuan@amd.com,
 Ray.Huang@amd.com, Mario.Limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix below crash by adding a check in the drm_dp_dpcd_access which
ensures that aux->transfer was actually initialized earlier.

BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 0 P4D 0
Oops: 0010 [#1] SMP NOPTI
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffffa8d64225bb5e
RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI: ffff931511a1a9d8
RBP: ffffa8d64225bb10 R08: 0000000000000001 R09: ffffa8d64225ba60
R10: 0000000000000002 R11: 000000000000000d R12: 0000000000000001
R13: 0000000000000000 R14: ffffa8d64225bb5e R15: ffff931511a1a9d8
FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4: 0000000000750ee0
PKRU: 55555554
Call Trace:
drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
crtc_crc_open+0x174/0x220 [drm]
full_proxy_open+0x168/0x1f0
? open_proxy_open+0x100/0x100
do_dentry_open+0x156/0x370
vfs_open+0x2d/0x30

v2: fix some typo

Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 6d0f2c447f3b..76b28396001a 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 	msg.buffer = buffer;
 	msg.size = size;
 
+	/* No transfer function is set, so not an available DP connector */
+	if (!aux->transfer)
+		return -EINVAL;
+
 	mutex_lock(&aux->hw_mutex);
 
 	/*
-- 
2.25.1

