Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AA47D919
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2BB10E348;
	Wed, 22 Dec 2021 22:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83F110E348;
 Wed, 22 Dec 2021 22:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8uXVv9G9+osAhdC+3elyGcYGK8BnssPNSdfm9X7/2iallTid/Qga04lNel/o8+UB8x/fU6UNy3BqTG6gVcAA2OAXetqoTYyD8sfHw27us922X1fEBtXDwtlKTf1kRQ1ysNq6DkEqhCWmKzPb5EndhaEDZOClBEofRlydoMShC2ESldid5rjg075s5/EnUQKCr2B3dQ2qZ4D+axCCtqDEM6GX6pxbmh16jAWEtN8Yg53kyhJt8k9cqg4wy/YxrebiBpo7aI3UvcvjW0bKTgoh06kkPrgxr1KGjhN5wpk5dhafXhTzfCYbpYruHosWOhjeupBA+hAePncJkqnSTFmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDwMrjoAzM8SgeMxHMGi4mVIOZkR3SEP6sFa2CakMlo=;
 b=Ljg9rDt4e+jDgd7OCAyMuQmFuf7YxjBtT9JhKM1GWyLd8HJSyxlDFWHevfLttDDEUPQoZ7xcEJsIift7442CFVWgBaBK1tIjFATfmH5n3WpUd4iTUpoNzoQ4K5CohAaTkB1N42V13I8cvkQKJMKdCPCFoQatc6g6LLzcmNFrFh1eQeQ/Y5yPg3JXcoA8g+IJ2E1p00TttZ+CliHv1Yd9HH9vok9faIfv3sP50gMi1KraoqKCj9UBKK0alpynmivHWEEowqBelKSDf5HzvvxSnGNz8ndZ20U0FwZdq1CrCDfw35gy64JYHI6JeIHjRKXnBW1YSt7NkxhJ54+I06l0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDwMrjoAzM8SgeMxHMGi4mVIOZkR3SEP6sFa2CakMlo=;
 b=41ThyAucbd+BJtdifVfVHrF4IbLkOul6gToBdGeE2SCq4Hr7SHh/TJs6DVGygg3qti6m3NUQ7EQWc2ld2EFuQcfq9cZtRQJbumCD3im5v+wIT4GaUTpoN7aWQFgcJcxyP1LgJxVpqVHoTcXtDciQwwsoNY8+zplmzfa+b0BKo5U=
Received: from MW4PR04CA0076.namprd04.prod.outlook.com (2603:10b6:303:6b::21)
 by DM6PR12MB5517.namprd12.prod.outlook.com (2603:10b6:5:1be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 22 Dec
 2021 22:05:53 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::cc) by MW4PR04CA0076.outlook.office365.com
 (2603:10b6:303:6b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Wed, 22 Dec 2021 22:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:05:53 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:05:51 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 0/8] Define and use reset domain for GPU recovery in amdgpu
Date: Wed, 22 Dec 2021 17:04:58 -0500
Message-ID: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95dd72e5-04e1-4c22-21b1-08d9c59738ba
X-MS-TrafficTypeDiagnostic: DM6PR12MB5517:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5517DC5C072D9882DD211AB9EA7D9@DM6PR12MB5517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22Wtuy9YXKI+ahi5+RqF7MudOsB/2Iy516MZ3qtNZh4ju2DX8DZi+07SbIADj4OfoNbysTC1nBERrU5l+Wr8mE+HchZG0+IBOy6J+vl1woiZ7LOe5qOSGUTfZhREkt2AQvlhn0Xmp0zkERwgqk2k5cTaw/Zh6bKWmYcWGELCJi5eMCuZplWCeZOJ9aVvut/utLZRRLz4Ima1QIytuMa5V2gwGCO3muFZkh6ASMIZ8DclUEDOEk3lKJP3nytAS9tejOYjTW59t1rHa8xKIbW7N7Ky4JEThP+ZkHEF5mefXHlQ1zYsnYrGqVTb6/NgdIi9omJ0PYe5f4faH9mFgJrJxF8u3IW+BXaLPXQAc3xONfOAUxCVQ534dkEgibr7Jpa+vNTHhVup2vwlFCAz8T2GZM9tQOVoWLM3mNjQpBtskNCE1Lmg8GLiIkJcF7TdL/GzAThLxEnNISiDTQ/cB5WldKMT0Pz6NwX3/mxDALryOWsbwgs9QIHqNefrnA7BsF9JDjRmDeAynMTWT4smSUCY8ShpysYTnRoRzdt/uPaTPIqnMb6VTAHzVV6VNXHymu8RqMvrIlZa22QWPi+cBetCP3Hdp5L8vDet8RpFP2tdjzceCIX/DSlILvo/5EnB6dYIW7Ykon//7iw9Kb9fdJ5Hw0sD0zji7NaH+Wgn5WftpmFk0MkzFUqdOhDekQTuBf2thXDT2jOLeUFepMOTfR9ZxMCGIDbF4tnpaeMIgtv1f1fFHBgbDDNduVWImcSxTcZyfjGSh1VXnGUOMkLoqs+bpGZx8DPBR+8PZUBg1Xvaf2brjm2oBM+gpqh9lzU0ZzNnox8EbqPMpyGPCoruOONDTOoPir6SblZTAM/dU0ZDYJV0VAVlLqGNHvw6pn7TlkH+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(1076003)(5660300002)(44832011)(81166007)(508600001)(2616005)(4326008)(356005)(8936002)(8676002)(36756003)(26005)(83380400001)(7696005)(16526019)(426003)(336012)(186003)(70586007)(70206006)(54906003)(47076005)(316002)(36860700001)(86362001)(966005)(82310400004)(110136005)(2906002)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:05:53.0529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dd72e5-04e1-4c22-21b1-08d9c59738ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5517
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is based on earlier work by Boris[1] that allowed to have an
ordered workqueue at the driver level that will be used by the different
schedulers to queue their timeout work. On top of that I also serialized
any GPU reset we trigger from within amdgpu code to also go through the same
ordered wq and in this way simplify somewhat our GPU reset code so we don't need
to protect from concurrency by multiple GPU reset triggeres such as TDR on one
hand and sysfs trigger or RAS trigger on the other hand.

As advised by Christian and Daniel I defined a reset_domain struct such that
all the entities that go through reset together will be serialized one against
another. 

TDR triggered by multiple entities within the same domain due to the same reason will not
be triggered as the first such reset will cancel all the pending resets. This is
relevant only to TDR timers and not to triggered resets coming from RAS or SYSFS,
those will still happen after the in flight resets finishes.

v2:
Add handling on SRIOV configuration, the reset notify coming from host 
and driver already trigger a work queue to handle the reset so drop this
intermidiate wq and send directly to timeout wq. (Shaoyun)

[1] https://patchwork.kernel.org/project/dri-devel/patch/20210629073510.2764391-3-boris.brezillon@collabora.com/

P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.

Andrey Grodzovsky (8):
  drm/amdgpu: Introduce reset domain
  drm/amdgpu: Move scheduler init to after XGMI is ready
  drm/amdgpu: Fix crash on modprobe
  drm/amdgpu: Serialize non TDR gpu recovery with TDRs
  drm/amd/virt: For SRIOV send GPU reset directly to TDR queue.
  drm/amdgpu: Drop hive->in_reset
  drm/amdgpu: Drop concurrent GPU reset protection for device
  drm/amd/virt: Drop concurrent GPU reset protection for SRIOV

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 206 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  36 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |   3 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  18 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |   7 +-
 10 files changed, 147 insertions(+), 164 deletions(-)

-- 
2.25.1

