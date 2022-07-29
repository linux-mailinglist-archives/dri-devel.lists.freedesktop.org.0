Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0AC585619
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 22:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387B110E474;
	Fri, 29 Jul 2022 20:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87A10E406;
 Fri, 29 Jul 2022 20:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI7ETHxGKNlFMxeLvpkRDyxeIdAGtEwoqCfA2w8/mJNRF1UdB/gLcSgznoMgK/WaVhpkJvMw17NA7uotRkJ8Y0AhUUM9MR5CSOuGcxotwR7KuxFPoS5w+TxENE+MXsKSijVwhZNBvh+Sn+a2A2lgvPiAKXoDZSsjRcngnW9lD7yT09+mL2/6nPgAvVbzdwM7MDZkj3Hw8IK2wmQvre3YfkhKfuGBb7RmVQCpvdu+2arwTgKyvqb6MyqCE9Cfig6TH8WVsCR4X9EmBgc5Us24pZzXiWv8fHStqb7e2NX9MBPE3WK9kHXS3Yk6vOWeKSMl4Z9a7GJcz5Z6uN+iTDdZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzPUjNOULgQ7bE058nGm+U1/t0Sc3i3x6j1Ut9Qjkgo=;
 b=dmCYSCRz04/+P744JSerYFdJog0fZPzY7E9ojbfiQoVtzp8jyf4n62pZzfiKivKRYiItkR073xsiCMSa1y768yI+kIDqEVP8VLg+oUl3MKufaRjTZ9nvp7elpQyJSNcqexYnGKkTSGlrSCMoz3OMksmjq3SqRf1OFAtfHiX9hTDqQzIlRijcoB0FS3bnlKAID7H79yTpdFAAFh/dk6kySm5wBePm6aEb7gqn7y0wrkFEr3coJ09raqh0r8760n/NdoWAbLh6eZqB8OOqx6Rv3FfIZwlvoPfSnOF3obwhH/FWVQZE2Nrg9FkWk59qj9QfD+cLRJSb2lQ8d7PHhEnJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzPUjNOULgQ7bE058nGm+U1/t0Sc3i3x6j1Ut9Qjkgo=;
 b=fXaE2IYMr7Cp4ol5gG3e3NI10rV2HcRejcIqe4kiDmxcHo9Qyx667n5khXnXwwdgvx10JtiTE2DmXazgcbjxeFVhRwQ/B6DMzxzxMuKIIam8qxyiyM+2UUMgwEU54AazU9HvMerDv+KA17PF5pDekuYcHQS0cFGtDRsHaLkidik=
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 20:28:05 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::5f) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Fri, 29 Jul 2022 20:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Fri, 29 Jul 2022 20:28:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 29 Jul
 2022 15:27:55 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.20
Date: Fri, 29 Jul 2022 16:27:42 -0400
Message-ID: <20220729202742.6636-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d86bc7ae-a295-42af-de7b-08da71a0d6d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2WRhcnQYORE4ORT+6OjMJXop2z8MPu4tKKoD5KaRyMP6kMJBCUMqE53yJmPYOum/39xTT7DADWh4WNToagdxCgKj637e1zEVVjOLhX4hmLTx0P4XgKfHNmRmaNLP0PDvamRTERQSJ/zDuYeBlAcm9IliDlCkCpF9uo+Rn/t7mxB8Gt+cPrby+EZ0TpYddfrhCvFaEiey/V/6qTH3wwrKIFODtvZoPCyc8kV1O02JPikWViRKM2I38m6q9o/Nd3BibGKqogeFlPYpgktIbM+7xbAaTWvFPqL3gHNyUI0stWo1WQiFZEdsQtqxP8/RsHAgypFzF+fC3gZhlC7YKT73bk0pue4gXfngMEBKP2mZU8wpyFUDMUg6XXXB0Rrqt99yRr/j32BHm5mJ3sA4Fs7+699+F8TxXxxIemrBfwC2031orVie9ZdjGMTrWUmEgfVU5np/3fBB1dsPSKt9Ds6+tgJYeMPwS1kegqfq7N/AKK2Eap1BS5wtol7zOs4V58pq2ZtXxyyXlIgSDfDVsZUzZafJgUhPmVQSi0i5KFxOUzb86R/OSyY1FfmfRC1FZhHwUJtv1SbUW5kF5jkw6TFeSaIsL59jwNnHC9IJKPNKM0cIy8kIkco1NQcWvsb4mDOhIS6P/VoJQSLY+03MkFCDTcNy8r5/a5qa9RG3Q6AGFI3SIg5kdVrpm0TR/oIvkG4C+fKxcGwciN4EYREjxCvEth+321wRcHU+GYUtB6GkKby5hX1FHF2hWks6zJFmvmBPLS0eEm6/j/92To5CsA2yE1C01Ebnwn2D2TOKh5/3MI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(478600001)(5660300002)(8936002)(4326008)(40480700001)(2906002)(82310400005)(8676002)(186003)(70586007)(40460700003)(36860700001)(70206006)(83380400001)(356005)(36756003)(86362001)(81166007)(316002)(966005)(82740400003)(16526019)(1076003)(110136005)(426003)(2616005)(336012)(26005)(47076005)(66574015)(7696005)(41300700001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 20:28:03.7492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d86bc7ae-a295-42af-de7b-08da71a0d6d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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

Fixes for 5.20.  Mainly for new IPs.

The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:

  Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.20-2022-07-29

for you to fetch changes up to 64f991590ff4410041a70ee7ec2db079bc953929:

  drm/amd/display: Fix a compilation failure on PowerPC caused by FPU code (2022-07-29 15:24:38 -0400)

----------------------------------------------------------------
amd-drm-next-5.20-2022-07-29:

amdgpu:
- Misc spelling and grammar fixes
- DC whitespace cleanups
- ACP smatch fix
- GFX 11.0 updates
- PSP 13.0 updates
- VCN 4.0 updates
- DC FP fix for PPC64
- Misc bug fixes

amdkfd:
- SVM fixes

----------------------------------------------------------------
Alex Sierra (2):
      drm/amdkfd: track unified memory reservation with xnack off
      drm/amdgpu: add debugfs for kfd system and ttm mem used

Chengming Gui (2):
      drm/amd/amdgpu: add additional page fault settings for gfx11
      drm/amd/amdgpu: add memory training support for PSP_V13

Dan Carpenter (1):
      drm/amd/display: fix signedness bug in execute_synaptics_rc_command()

Evan Quan (3):
      drm/amdgpu: drop non-necessary call trace dump
      drm/amd/pm: update driver if header for SMU 13.0.0
      drm/amd/pm: enable GFX ULV feature support for SMU13.0.0

Guchun Chen (1):
      drm/amdgpu: use adev_to_drm for consistency

Jack Xiao (1):
      drm/amdgpu: move mes self test after drm sched re-started

Jiapeng Chong (20):
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting
      drm/amd/display: Clean up some inconsistent indenting

Jonathan Kim (1):
      drm/amdgpu: fix hive reference leak when reflecting psp topology info

Lang Yu (2):
      drm/amdkfd: fix kgd_mem memory leak when importing dmabuf
      drm/amdkfd: remove an unnecessary amdgpu_bo_ref

Maíra Canal (1):
      drm/amd/display: Remove unused struct freesync_context

Philip Yang (3):
      drm/amdgpu: Allow TTM to evict svm bo from same process
      drm/amdkfd: Set svm range max pages
      drm/amdkfd: Split giant svm range

Rodrigo Siqueira (1):
      drm/amd/display: Fix a compilation failure on PowerPC caused by FPU code

Roy Sun (1):
      drm/amdgpu: Fix the incomplete product number

Shikai Guo (1):
      drm/amd/pm: Add get_gfx_off_status interface for yellow carp

Sonny Jiang (5):
      drm/amdgpu: fix a vcn4 boot poll bug in emulation mode
      drm/amdgpu: add VCN function in NBIO v7.7
      drm/amdgpu: add VCN_4_0_2 firmware support
      drm/amdgpu: vcn_4_0_2 video codec query
      drm/amdgpu: enable VCN cg and JPEG cg/pg

Vijendar Mukunda (1):
      drm/amdgpu: fix i2s_pdata out of bound array access

Xiaojian Du (4):
      drm/amdgpu: send msg to IMU for the front-door loading
      drm/amdgpu: add header files for MP 13.0.4
      drm/amdgpu: add files for PSP 13.0.4
      drm/amdgpu: enable support for psp 13.0.4 block

Yang Li (1):
      drm/amd/display: remove unneeded semicolon

Yifan Zhang (1):
      drm/amdgpu: correct RLC_RLCS_BOOTLOAD_STATUS offset and index

Yu Zhe (1):
      drm/amdkfd: use time_is_before_jiffies(a + b) to replace "jiffies - a > b"

wangjianli (1):
      drm/amdgpu/dc/dce: fix repeated words in comments

 drivers/gpu/drm/amd/amdgpu/Makefile                |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c            |   8 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   8 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |  32 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |  21 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             | 159 ++++++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c           | 387 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.h           |  30 ++
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c         |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 122 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  72 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   4 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   3 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |   3 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   3 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   8 -
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c    |  68 +--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  16 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c   |  36 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |  77 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |  25 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  70 +--
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |  15 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |   3 -
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |  36 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   1 -
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |  18 +-
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |  15 +-
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |   8 +-
 .../display/dc/dml/dcn32/display_rq_dlg_calc_32.c  |  81 ++-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   2 -
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |   3 +
 .../amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h    |  25 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_4_offset.h | 402 ++++++++++++++
 .../amd/include/asic_reg/mp/mp_13_0_4_sh_mask.h    | 595 +++++++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   9 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  31 ++
 62 files changed, 2181 insertions(+), 377 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_4_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_4_sh_mask.h
