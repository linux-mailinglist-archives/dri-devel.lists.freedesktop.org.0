Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2164E3FB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 23:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8226810E591;
	Thu, 15 Dec 2022 22:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0230210E591;
 Thu, 15 Dec 2022 22:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8VjCNBkVg00mtC/i+7seug/dGNBhvfBV/UMzFp9QteJLDjwkNsIU5BEOui4XbsHysa5oRjEAmeleZrBoPp2Hf7IdPlpQG9Ku4MceQRInfPUxMEcEfTUuZrxiWbCf6cdxm+p80UlF8aWUUnCNILmWk2ZCikjG/+lj18zL9aOHFu6MurT/Xowo8YGQ2gcF6dX0vrxzsaCow6Z2cj7iUJLWjellJ6j/nfKFabs8iSUGhYyTRuJX6WzdxEWsFErVpxY9UCMQFEp/l+IwLDEEh0e4PSZfIgFz5NKZJBiSkVxq/7N7cuymkKk6Qd18vls1K/WjZndtLle6D9H5qlpew8oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y6vF97aNNlB86Hjcc9zoO6NlMf5v7H8mPuxdDqDTrw=;
 b=FY4QA+gfc6Fmknfah2qVpFIsq3mnYBBJ1iatx0W0lPHBBwHpRKfa5Ij4T6T2ndjthUZ0dy6JQ5h1IgPtNlQTnwQgvZn44lTCNbiYoszm6yUSIjl1PYsQolgRT5H2xO7AxoF9ngAfoUncuQUOjhhI854foFF9QBOR5TwJqf1NKp8AJlln8PpfDhgd685zJ7tAqZ538OP1IAbf6b5wqoMR1CR/PUFtI95GFl0lalb1AO9uAklbMYiZcodVo8TDkdGWpuJzx34fKORcu2hAFfk6LGTT6D3KKspazRrWbJqeufJvY1jyvwOqVvUdLuy9AsjWIglRaTD1RitB1itm64M4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y6vF97aNNlB86Hjcc9zoO6NlMf5v7H8mPuxdDqDTrw=;
 b=iKopvXKuKVHdOGMusxpGEUb7892HMqUotw47FDejJKsuujUb81w2VjUzOFQ3DPxit6/toID2DLZ/JpZAE4nBCXVdCrBdmi9Pr/tUmK4z0iOttSF4IsNy77JxhTRw664wZWFG17Ds8XyqCXFl+JK5ncTwJuWAcXWjz7QK3ArjvkM=
Received: from BN9PR03CA0680.namprd03.prod.outlook.com (2603:10b6:408:10e::25)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 22:49:55 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::5b) by BN9PR03CA0680.outlook.office365.com
 (2603:10b6:408:10e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 22:49:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Thu, 15 Dec 2022 22:49:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 16:49:53 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.2
Date: Thu, 15 Dec 2022 17:49:36 -0500
Message-ID: <20221215224936.6438-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT014:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 7680f3f3-2ee2-4736-dea0-08dadeeeaf1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rx5BC3bILENnExz6WBYcOaeDxLcwbF+T9ZzXeQJzcM4g0Qov8VDEzXwQ1SApkfC64TOdfvclaQOG5PBaxWHyp2zxiyu4aSAszOViiXgmNZhbeuPsWjdaxh6qkh+sX0lyFkjAJo0CSYl8fsV8bSGXsNAVWU6CySRar30lfFNQdZ9jS5d3yZ2Q+E0kuf6F3RsN2XWNMzx76kV+0izXkB/7DaOLw98kpbQWd7q7129LBf6wDVdF1+mBNC5sablHYZBV/2E4tL/+qG1hRnigi8+mxqp4p8YM8upxp/qar73E3neeIoyGUo+HzkDn9jupTRRnR8iKgd6XnSlttvM1DYIUitTJgkbMSL0EoJIzNvmo+FKC1R2MpCjcQCw1upHCcUjvt/f24unV9nyXanKrYkVgLezXinPgYM7ZFWGE2ZTbCY22rirpJSeu8o9Jg2DGF0TFEGFHYct79zhBTz1C/7+t0fi6ZHCr0LXFnm3Bjy5Uj9D4Oz1oOkUcz0pXZmMY6CBNU7JW1isBtN+rejLLUBvRzRM7h5gZW/eYyMG9z5yxUWO7Q38Xm2ePES/7zuO8PnAchNxmkuPrLljgmlX+SvCXOmWqNF4rIG8zRphR0Yiae5AgDlVrtPvvr2o9AbqX2T/KGZZeycCXSwsOpfHdCjapc5QFH1HcpvdEIxWzc3KSIL5KO9mfBoLNwuS2yrivek5T
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(86362001)(478600001)(47076005)(7696005)(40480700001)(2616005)(4326008)(40460700003)(966005)(8676002)(70586007)(4001150100001)(8936002)(110136005)(70206006)(316002)(2906002)(82310400005)(5660300002)(41300700001)(66574015)(6666004)(186003)(26005)(82740400003)(336012)(1076003)(426003)(36756003)(356005)(36860700001)(81166007)(16526019)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 22:49:54.7430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7680f3f3-2ee2-4736-dea0-08dadeeeaf1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.2.

The following changes since commit 66efff515a6500d4b4976fbab3bee8b92a1137fb:

  Merge tag 'amd-drm-next-6.2-2022-12-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-12-09 12:08:33 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2022-12-15

for you to fetch changes up to 7a18e089eff02f17eaee49fc18641f5d16a8284b:

  drm/amd/pm: update SMU13.0.0 reported maximum shader clock (2022-12-15 12:18:08 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2022-12-15:

amdgpu:
- Spelling fix
- BO pin fix
- Properly handle polaris 10/11 overlap asics
- GMC9 fix
- SR-IOV suspend fix
- DCN 3.1.4 fix
- KFD userptr locking fix
- SMU13.x fixes
- GDS/GWS/OA handling fix
- Reserved VMID handling fixes
- FRU EEPROM fix
- BO validation fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: make display pinning more flexible (v2)
      drm/amdgpu: handle polaris10/11 overlap asics (v2)

Christian König (7):
      drm/amdgpu: fixx NULL pointer deref in gmc_v9_0_get_vm_pte
      drm/amdgpu: WARN when freeing kernel memory during suspend
      drm/amdgpu: fix GDS/GWS/OA switch handling
      drm/amdgpu: cleanup SPM support a bit
      drm/amdgpu: stop waiting for the VM during unreserve
      drm/amdgpu: rework reserved VMID handling
      drm/amdgpu: revert "generally allow over-commit during BO allocation"

Colin Ian King (1):
      drm/amd/display: Fix spelling mistake: "dram_clk_chanage" -> "dram_clk_change"

Evan Quan (6):
      drm/amd/pm: add missing SMU13.0.0 mm_dpm feature mapping
      drm/amd/pm: add missing SMU13.0.7 mm_dpm feature mapping
      drm/amd/pm: enable GPO dynamic control support for SMU13.0.0
      drm/amd/pm: enable GPO dynamic control support for SMU13.0.7
      drm/amd/pm: correct SMU13.0.0 pstate profiling clock settings
      drm/amd/pm: update SMU13.0.0 reported maximum shader clock

Felix Kuehling (1):
      drm/amdgpu: Add notifier lock for KFD userptrs

Luben Tuikov (3):
      drm/amdgpu: Check if fru_addr is not NULL (v2)
      drm/amdgpu: Fix size validation for non-exclusive domains (v4)
      drm/amdgpu: Remove unnecessary domain argument

Shikang Fan (1):
      drm/amdgpu: Add an extra evict_resource call during device_suspend.

Yifan Zhang (1):
      drm/amd/display: Add DCN314 display SG Support

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 212 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  88 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  40 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  24 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  79 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |   8 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   3 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  15 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  96 +++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   4 +
 32 files changed, 449 insertions(+), 248 deletions(-)
