Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21854444D5F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 03:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20D37B2F0;
	Thu,  4 Nov 2021 02:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E797B2F0;
 Thu,  4 Nov 2021 02:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J19Jdyo9OHVzS14wjkpVvanvmVegZFj5Aw6b+Tn+1jA00lsIEy/Pa1oINA0Co7Mw2oIKsmBwSIrUTa7LkpA/Jo/yVi5nCxWAGJykoz+iri7hoaU1uIn7Y2hzgl6k5FebAGld71PGaI67JyNQM135v6IoG7Qj5Qm5UpZACnkFpda97t+A7Sv7jX1qY6VNT0XVYMGFWwWF032a7LZ6T/KTZB7B33dQ42c3JSiGEHj08HLniyeUL0opzuXtNCdVrvHzA1zf5ZNNjwI8/lN0VuMfq+DXqvZHPCJMWndACthED8+Ly+TIlJsqOGkKJOWAC7T089JphbtkJulHfS+LeCe58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8uo+Zy0k4lIoka8jssNf+IjDTUHMS6y0ddq2Z+xbZA=;
 b=SlLXELm+L582RZznIDN9/IMLB8ZqC/mD1wUlNr/9wdYAdurT8JzPCKXmgXAfVpLiaCfvHppg6ioVd1MnI/wW0K7UrvZSmEq0cJ+giON/Wga5RtO8pCeghnE2RUJGVppvr1W+sfvGMOl1QnLesqt+pRzQKE2lLwvIvbglMjOCd0ZYt2vXePoPtb3FfSx8PPBMDUDhj9lbsKUEcYOVGFWV0vS05qWdcI5lCDVWJbSkkN8ULFn6M/2HC11dC9lb1V12wKJKjIvEI836U49YmrsYy+sehjiFTiRCpuroLIcjVk25dXU5NcCQk1XZHfRO/2XsMVzeqShQB3wg3iRYsKr6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8uo+Zy0k4lIoka8jssNf+IjDTUHMS6y0ddq2Z+xbZA=;
 b=2hd6exv1BtLu5nR/dwGDVw50cVEy7GPrToGDEYCjgT/amDyY4FcWP3PnPZO7yfvXTPjs3PgTVG4N7fIE4GWXNY6ZMRhWZtffkRZBsgrB6Hja+WNdGcrzcHjFee5BZnl9bpQhLrGvUrDnXW5iGhe+ehdQVzTDTYl+yJPzlZJ9cQM=
Received: from MWHPR14CA0064.namprd14.prod.outlook.com (2603:10b6:300:81::26)
 by MN2PR12MB3871.namprd12.prod.outlook.com (2603:10b6:208:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Thu, 4 Nov
 2021 02:45:03 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::d0) by MWHPR14CA0064.outlook.office365.com
 (2603:10b6:300:81::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 02:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 02:45:02 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 21:45:00 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.16
Date: Wed, 3 Nov 2021 22:44:47 -0400
Message-ID: <20211104024447.4535-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1636b141-b3fa-4f15-3489-08d99f3d1a11
X-MS-TrafficTypeDiagnostic: MN2PR12MB3871:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38713B0DB33F7BA7EA86E22BF78D9@MN2PR12MB3871.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IQw0n23Kef/05A4xJKlB6+qnIgo3sNdDcBXpkTVkdrGFyDuJf7VVBz7I/foOAk2Nk/LbMRbc42xvCU8z2Ww/lF9sfJXiRjAuLK9lAB9cGHpv4BTElcp5WEquxR0z+lq2xo++IM4kOgfLV3HGCCaejhkwqUE3C5S7qTkyQNe3km0YE8xtA9Sa9s9CD19HZ+EyZIvY2yuGaF18W+8j1IsHwcLie9X8uratfWOPj4t5oCdsX2jkG8N2fCdek9gJTFED82Qjf/So0hM+C+Ta81aqjIMQlMY4WqbR3buikxCfKCFJlmp3m3hJIT7UOY9VGPbdAwfbDM4xt04snXvR8R/nzuxL4MP6r/EwVfjfaM7ft8m5xX/yL1HZVbkVVTwiqaJbWX4f577L8tiIHNp+do8724LgHXdARV6B5kfYVzaFA5FWZ4BuPhRO1oyv6jUE2TuIX5DfVcwRmlnVyEAyGC8TgHZ41Tf/xIy7B2/YuEIrWXa6YFsTCO/7aw4pdY54sPtf0dc2lr0nlR4wHHnu5FVForaF9CzA6DBFArtvA4xbVX0tpA6cUkYJrc6nZTMGxorzjkzCjdlNrxQi93HxloOkbOduoLt0MBC5rEAIsCdOCtmA18UDUEK5F8vFYjT1wqZcitkl8e2ZEwInhds9vVujoD04j+acJ19ewPzwA6owY0iL2ClvTafhsroS2C05uFpcBg3Cp33s95YU3ZnSIVFL8bfzmNBf7qOqEPHZ0vPZCvw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(1076003)(86362001)(82310400003)(356005)(966005)(6666004)(8936002)(110136005)(8676002)(36860700001)(2616005)(36756003)(426003)(5660300002)(81166007)(83380400001)(7696005)(4001150100001)(16526019)(26005)(186003)(2906002)(316002)(70586007)(70206006)(508600001)(336012)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 02:45:02.7073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1636b141-b3fa-4f15-3489-08d99f3d1a11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
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

Fixes for 5.16.

The following changes since commit d9bd054177fbd2c4762546aec40fc3071bfe4cc0:

  Merge tag 'amd-drm-next-5.16-2021-10-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-11-02 12:40:58 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-11-03

for you to fetch changes up to 78469728809b8604dc37ae4e6b12ae12decac5be:

  drm/amd/display: 3.2.160 (2021-11-03 12:32:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-11-03:

amdgpu:
- GPU reset fix
- Aldebaran fix
- Yellow Carp fixes
- DCN2.1 DMCUB fix
- IOMMU regression fix for Picasso
- DSC display fixes
- BPC display calculation fixes
- Other misc display fixes

amdkfd:
- SVM fixes
- Fix gfx version for renoir

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: update RLC_PG_DELAY_3 Value to 200us for yellow carp

Anson Jacob (1):
      drm/amd/display: Fix dcn10_log_hubp_states printf format string

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.91

Aric Cyr (1):
      drm/amd/display: 3.2.160

Aurabindo Pillai (1):
      drm/amd/display: add condition check for dmub notification

Bing Guo (1):
      drm/amd/display: Fix bpc calculation for specific encodings

Felipe Clark (1):
      drm/amd/display: Fix dummy p-state hang on monitors with extreme timing

Felix Kuehling (3):
      drm/amdkfd: Fix SVM_ATTR_PREFERRED_LOC
      drm/amdkfd: Avoid thrashing of stack and heap
      drm/amdkfd: Handle incomplete migration to system memory

Graham Sider (1):
      drm/amdkfd: update gfx target version for Renoir

Hersen Wu (1):
      drm/amd/display: dsc engine not disabled after unplug dsc mst hub

Jake Wang (3):
      drm/amd/display: Added HPO HW control shutdown support
      drm/amd/display: Add MPC meory shutdown support
      drm/amd/display: Added new DMUB boot option for power optimization

James Zhu (1):
      drm/amdgpu: remove duplicated kfd_resume_iommu

Jimmy Kizito (1):
      drm/amd/display: Clear encoder assignments when state cleared.

Jingwen Chen (1):
      drm/amd/amdgpu: fix bad job hw_fence use after free in advance tdr

Mario Limonciello (6):
      drm/amdgpu: Convert SMU version to decimal in debugfs
      drm/amdgpu/pm: drop pp_power_profile_mode support for yellow carp
      drm/amd/pm: Add missing mutex for pp_get_power_profile_mode
      drm/amd/pm: Adjust returns when power_profile_mode is not supported
      drm/amdgpu/pm: Don't show pp_power_profile_mode for unsupported devices
      drm/amd/display: Look at firmware version to determine using dmub on dcn21

Oak Zeng (1):
      drm/amdgpu: use correct register mask to extract field

Roman Li (1):
      drm/amd/display: Force disable planes on any pipe split change

Wenjing Liu (1):
      drm/amd/display: fix register write sequence for LINK_SQUARE_PATTERN

Yu-ting Shen (1):
      drm/amd/display: avoid link loss short pulse stuck the system

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c           |  18 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  45 +++++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  44 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  41 ++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 150 ++++++++++++++++-----
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   8 ++
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |  22 +++
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   3 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |   4 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   6 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |   7 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  78 +++++++----
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |   1 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   6 +-
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  13 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  14 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   1 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1_ppsmc.h     |   4 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |  26 ++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  11 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  87 ------------
 37 files changed, 398 insertions(+), 252 deletions(-)
