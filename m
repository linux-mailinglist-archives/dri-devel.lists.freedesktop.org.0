Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813C6464FC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 00:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB15310E149;
	Wed,  7 Dec 2022 23:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E37510E149;
 Wed,  7 Dec 2022 23:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm/ctnXwn0xhqwo38QstQEvPWj3z1+lDFkBuBT5fmV4PVyNbRa4/i0rbfeI8MjHC59q7g9cPbukwK/WBTKfqw+m5hjsytyS7vIUQNu5wzoYj3S9SUflEKdJKeAN14L532YTI4Omy0Kp7Xx8KHQMvrBO3KbfVOZ3o9UPxcyBTUEZmpReE/mxtx/SaHDntE22Zhum0zJhk73+A6wF6GUIzQA5xeFPRQYijB6ngy+OkjV4Sl7AGVeQWLr624yI4GOYsQpeuHT/hBqcPC+fhpCXps22OISJ0P1ksgWEDaRz0zu0nG/eN6fcjzgHlDtiZmCdBUvXDs1e1JjzlvQoItRqrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ctFebFm0X0Dr8hDN7Qgz8nac+ON6DHNJktE7sbVDlI=;
 b=VK/70d7Sfpt63fznV4vDhWPxWaqcIDmrQnfEuLe1oj79pvimOa068IIr/k9pcq1U//8b/MetMmRrw8yt9jHsQm3CwPowBsZHKRAiiT84wIYHrlfwqxjQjTJJQ+8ToOKfpmfYgLZFM/ltSwDmWfW0zGRALKvrMoIlh/82T3qWjXn7JysFnsPLyG/JFZ9u1ddBuoGCssB/Ot4pTQrc6syE1tFytwA3mMUzsp1uV5X+USS7mDF6KLVCRd5pu1hhXxILlruXSanBDPLI9b+sptCxtlAz+jOyrHFHHNe5cknAvEATtLamkbBwN1d1FBKKcJ4gKzwUFatUTg9/NH9xtkQkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ctFebFm0X0Dr8hDN7Qgz8nac+ON6DHNJktE7sbVDlI=;
 b=j8hRNaQoaOyUkqoF08cK8gfPlXwyxXqU3AHjf0YzPY6NNJLVIbdD3h5CcvoVoF0ZavTimYfik9ZwdMGHz9HyhXA0rE6IaJIgl/Ow2/Cn3ya36fMuwMA7N1lSq15zG2tZvL3XnEMwZTeS7WPkPxV6qW3bIW3APyZ3SlC2OCKaDIg=
Received: from BN9P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::9)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 23:24:58 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::60) by BN9P223CA0004.outlook.office365.com
 (2603:10b6:408:10b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 23:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.16 via Frontend Transport; Wed, 7 Dec 2022 23:24:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 17:24:56 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-next-6.2
Date: Wed, 7 Dec 2022 18:24:39 -0500
Message-ID: <20221207232439.5908-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT061:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7f17e5-215e-4834-8cba-08dad8aa4127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIx0FiFAmMUOP39ae0lhegHg+LYIzyhs4mbP6Zz/2Hd0aUiHaIu97VRb5HdU7vmaJtCtKdCjDH8RkkE+bUaSNfbBkAsl/gSM8+mmj6clnboadN5aXPEWKqLYgS7u8gzfc1LqfPIrCX0QhiiKBmLO72QNzgIIKQTDGU0oV4dm0IbynFUqUQEqdzu4nzWr5Nx4N1ES1GWx+5Pyee+M7vbu/oUagiRz410PIuum0BklYB19+TOC/WL54idtVhZHgoL6wHh4cpGSL4JR/pV8CIDG3ZOev7/dF+hT/AZyRKCooe8SNUKSlR0aIdSd0GXjI9KDOHaAsypIhmJDRcpNYVepDmG/0xs8JhZZ8mxMXM4ZGy8D9A9H3ynldO8zgACWR4kyL/G8pKnxWby09cbhbrqUuAo4Wbi/Fxa7RZwJpIqlU2qlI95lYF/KVWwi5n8th3/Tjd6z/1cWEPhK1iSgv7iBCM4dXVhJgHk6lNNG7izU1OLhZ9gOWPSFfyyBjmtkRpa+2rEfaZtL4KSEYYQoN7GH6zpR1cTI8NnSCgL+V0E3V4AVJNtMDtKQjE6PLYQxgOr3SJ2g7LfKNm/Kznxxz/+nDTUJygwlzXODijgadR5jTbInXvY2pbRiLpI3Hb2n9+gYDnGvb1XpxuIwbEaA1EmQqOw/+9dCVzC9nOflhAWvJ3IrZw6E+/NJz5NyMOS+xOSE
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(36860700001)(16526019)(82740400003)(70206006)(4326008)(8676002)(186003)(70586007)(1076003)(336012)(2616005)(426003)(83380400001)(26005)(40460700003)(6666004)(7696005)(316002)(478600001)(966005)(86362001)(110136005)(82310400005)(47076005)(66574015)(2906002)(40480700001)(356005)(81166007)(41300700001)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 23:24:57.5184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7f17e5-215e-4834-8cba-08dad8aa4127
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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

The following changes since commit 4670ac706ff9b3d0adb766ef9e93cc36d9dda474:

  drm/amdgpu: expand on GPUVM documentation (2022-12-02 10:06:00 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-2022-12-07

for you to fetch changes up to 347fafe0eb46df941965c355c77ce480e4d49f1f:

  drm/amdgpu: fix mmhub register base coding error (2022-12-06 10:18:18 -0500)

----------------------------------------------------------------
amd-drm-next-6.2-2022-12-07:

amdgpu:
- DSC fixes for DCN 2.1
- HDMI PCON fixes
- PSR fixes
- DC DML fixes
- Properly throttle on BO allocation
- GFX 11.0.4 fixes
- MMHUB fix
- Make some functions static

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Ensure commit_streams returns the DC return code

Aric Cyr (1):
      drm/amd/display: 3.2.215

Aurabindo Pillai (2):
      drm/amd/display: trigger timing sync only if TG is running
      drm/amd/display: fix array index out of bound error in DCN32 DML

Charlene Liu (1):
      drm/amd/display: correct static_screen_event_mask

Chris Park (1):
      drm/amd/display: Remove DTB DTO on CLK update

Christian König (1):
      drm/amdgpu: generally allow over-commit during BO allocation

David Galiffi (1):
      drm/amd/display: Enable dp_hdmi21_pcon support

Dillon Varone (3):
      drm/amd/display: Disable uclk pstate for subvp pipes
      drm/amd/display: Bypass DET swath fill check for max clocks
      drm/amd/display: set optimized required for comp buf changes

Dmytro Laktyushkin (1):
      drm/amd/display: prevent seamless boot on displays that don't have the preferred dig

Jiadong Zhu (1):
      drm/amdgpu: Make amdgpu_ring_mux functions as static

Michael Strauss (1):
      drm/amd/display: Fix DCN2.1 default DSC clocks

Nicholas Kazlauskas (1):
      drm/amd/display: Add debug option to skip PSR CRTC disable

Paul Hsieh (1):
      drm/amd/display: read invalid ddc pin status cause engine busy

Tim Huang (4):
      drm/amdgpu: enable GFX IP v11.0.4 CG support
      drm/amdgpu: enable GFX Power Gating for GC IP v11.0.4
      drm/amdgpu: enable GFX Clock Gating control for GC IP v11.0.4
      drm/amdgpu: add tmz support for GC IP v11.0.4

Yang Wang (1):
      drm/amdgpu: fix mmhub register base coding error

Zhongwei (1):
      drm/amd/display: correct DML calc error of UrgentLatency

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 16 ++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  6 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  8 ++---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  3 ++
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 | 18 +++++++++-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 37 --------------------
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  5 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  6 ++++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  7 ++--
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |  2 ++
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |  2 ++
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  2 ++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c | 40 ++++++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h |  4 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |  4 +--
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  | 29 +++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h  |  5 ++-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_init.c    |  4 +--
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |  2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 10 +++---
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |  6 ++--
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |  2 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  2 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |  2 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  3 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  2 +-
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |  4 +--
 37 files changed, 156 insertions(+), 94 deletions(-)
