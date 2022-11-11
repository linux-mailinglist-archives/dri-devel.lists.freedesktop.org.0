Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A96262B3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 21:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCA510E8B2;
	Fri, 11 Nov 2022 20:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5FA10E8B2;
 Fri, 11 Nov 2022 20:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0tvQ5ljQ0f6HhW1C2EnfF7firhWFg9c8En1mHt8l3ndPnERYMhbn95Cz1wQltycq2LzoyuUhFPT6bE1z3IF0jzV9KivJQepIQj8PWw/f5hxEjgd0qxDGxBiP9nJFEotA2P81AOECP65/hDfWWr0dosrJjxHD2MIWe5ROjr5Ko6+0ZUF202aoZlvX3CzO2aR5FUz63PdQg5L+jn+6Nbu0ba2DzkO+zZrRHZPW9hbZYqrRCzCxAI0YieKdU+MPPX3Tgw4DhEmmKDkPgWD85odd7zLgXa8FriEjN6XbPKISZLAKPHmh/JHPbYQveOdfbo0+iDQ+Z/jjazWjluRqSCipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z90+4RdVcgsGjuk5ryun+TdRu1RuaqcK6Y0CrIgaSbo=;
 b=a27r/AJOC0vtn2VDaky3ihsJqTjSihld1D3/F6PJc0GthKGei8EAVLHYJ9s8PMMu3HwGiCPvKqYMFEwIfYra65A1c83j2zZ+/ywUkgiEDA76HP6DaXE7yfBiI2eyqpF93VYWxSFYqWHUmocAPgj5/vMAImpPQRR9CVeIpMpEXVvUEg60ZSkMiG2BJa1J1lB7loldD63xrxRHjCE6OUbTXdYCO+zaeXQZ3wLqZweoS66pyeDgzzMjTZahSGtf/NaIlnz5WU0/AAKL5NpMphFcUIQJTcAoV+ILdwO9179o3siTByEvnFds0shEKUukYiFcBSz+vXlkzRuS+NhNknLooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z90+4RdVcgsGjuk5ryun+TdRu1RuaqcK6Y0CrIgaSbo=;
 b=WuW8/szQiCNIjaeULjMCimV8a27HVelqdOxgZmrVTqLVALfEg5mgN7ozaR/CCYVT2+TNIpIRzs6YAqpOHygT/rAgmwEI1tn1osd6jiWUomoF1cG75ZeutVooqrhMs3SHdkIgpZvoWZRCwk9hXWA1RwoziTTDPp9WUa58R0bxAn8=
Received: from BN0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:408:142::28)
 by BL3PR12MB6641.namprd12.prod.outlook.com (2603:10b6:208:38d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 20:19:09 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::ab) by BN0PR08CA0026.outlook.office365.com
 (2603:10b6:408:142::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 20:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 20:19:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 14:19:07 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.2
Date: Fri, 11 Nov 2022 15:18:52 -0500
Message-ID: <20221111201852.6341-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT055:EE_|BL3PR12MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce60977-c623-408a-4a64-08dac421fd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bil39YHJM2bFnbl7HkKWJrGfM4b/LH/gQssWCCA9zGAln+QECSIX3G8vrgaXTPraMvvQDvj3TuAY0OqVFL9YH+Cjnp8TnENZFIaUjpxEhXotRvyMJzh2cOGrahh1yjqs5a4zJh4b2/qmMYCbY9xAR7el8ON9Bvo7pVsH9ay/7UlZXA7GeI5ahj1bWdMwVfnXhmkDbXXZ6hs4rgWWIVcUQ8lSa1A8sR8GyUY4Az34j6t+9RLTNqBsHTLjclJaaln0RVZx+Sp0kEj8g9YHZHHlS9t4ABWNQj/Voq75Xu96oBO57VkyDv+mYlkOZgDpGK18M2VtzUgsp22cj1x3fQCy4c8hxP4YhYFDSsISw05kvGEGYWQLs9JL/+59R6J+UcM9/sTAiMy1uPytAZDlfHzKD103AtDekpIraEy40FSeOwbkq3xP610MS4SatdprdblmgBVuEyr7caVPksGDDjfCkxPGM+gIfxnb63KVhT8Cs7TJ4oDEunz7+3CkzaR3zpNSedD2quytoz5ZdoBEmErWn/aRHB86AYyfkD3sBAfP5wLaGCRj6CDjFiwM1/g1R9EMdrwTxaZRHd4vxI3iulGRjH2bm1afZerTH8D7evSjjB9a2eI9YeARoyCAAAIDH1UC13o3s/AxLhI1JAZrsrU/u9v1sYlX6Wzd3v3UTgAr40Y3gUS0rV6gI/ECLBcsIIfeXwF87NrPlY0JhO62jvhnYpHRyDA3DHv0dbkwGJUsHCzX4PQBFsKoXH1Sq1qc70Sr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(4001150100001)(5660300002)(41300700001)(4326008)(2906002)(40480700001)(40460700003)(36756003)(82310400005)(8676002)(83380400001)(66574015)(16526019)(2616005)(47076005)(336012)(1076003)(426003)(186003)(86362001)(356005)(82740400003)(81166007)(36860700001)(110136005)(6666004)(316002)(70586007)(70206006)(7696005)(26005)(478600001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 20:19:08.9264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce60977-c623-408a-4a64-08dac421fd58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6641
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

More new stuff for 6.2.

The following changes since commit a143bc517bf31c4575191efbaac216a11ec016e0:

  Merge branch '00.06-gr-ampere' of https://gitlab.freedesktop.org/skeggsb/nouveau into drm-next (2022-11-09 11:18:56 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.2-2022-11-11

for you to fetch changes up to 2ebf61f2cfb9a11bc17db30df3e675a4cd7418d3:

  drm/amdgpu: Fix memory leak in amdgpu_cs_pass1 (2022-11-10 15:30:34 -0500)

----------------------------------------------------------------
amd-drm-next-6.2-2022-11-11:

amdgpu:
- SMU 13.x updates
- GPUVM TLB race fix
- DCN 3.1.4 updates
- DCN 3.2.x updates
- PSR fixes
- Kerneldoc fix
- Vega10 fan fix
- GPUVM locking fixes in error pathes
- BACO fix for Beige Goby
- EEPROM I2C address cleanup
- GFXOFF fix
- Fix DC memory leak in error pathes
- Flexible array updates
- Mtype fix for GPUVM PTEs
- Move Kconfig into amdgpu directory
- SR-IOV updates
- Fix possible memory leak in CS IOCTL error path

amdkfd:
- Fix possible memory overrun
- CRIU fixes

radeon:
- ACPI ref count fix
- HDA audio notifier support
- Move Kconfig into radeon directory

UAPI:
- Add new GEM_CREATE flags to help to transition more KFD functionality to the DRM UAPI.
  These are used internally in the driver to align location based memory coherency
  requirements from memory allocated in the KFD with how we manage GPUVM PTEs.  They
  are currently blocked in the GEM_CREATE IOCTL as we don't have a user right now.
  They are just used internally in the kernel driver for now for existing KFD memory
  allocations. So a change to the UAPI header, but no functional change in the UAPI.

----------------------------------------------------------------
Alvin Lee (4):
      drm/amd/display: Wait for VBLANK during pipe programming
      drm/amd/display: Use min transition for SubVP into MPO
      drm/amd/display: Disable phantom OTG after enable for plane disable
      drm/amd/display: Add margin for max vblank time for SubVP + DRR

Andrew Davis (1):
      drm: Move radeon and amdgpu Kconfig options into their directories

Aric Cyr (1):
      drm/amd/display: 3.2.211

Asher Song (1):
      Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly""

Aurabindo Pillai (1):
      drm/amd/display: Zeromem mypipe heap struct before using it

Chaitanya Dhere (1):
      drm/amd/display: Fix FCLK deviation and tool compile issues

Christian König (1):
      drm/amdgpu: workaround for TLB seq race

Dillon Varone (1):
      drm/amd/display: Enforce minimum prefetch time for low memclk on DCN32

Dong Chenchen (1):
      drm/amdgpu: Fix memory leak in amdgpu_cs_pass1

Felix Kuehling (3):
      drm/amdkfd: Fix error handling in kfd_criu_restore_events
      drm/amdkfd: Fix error handling in criu_checkpoint
      drm/amdgpu: Set MTYPE in PTE based on BO flags

Gavin Wan (1):
      drm/amdgpu: Ignore stop rlc on SRIOV environment.

George Shen (1):
      drm/amd/display: Populate DP2.0 output type for DML pipe

Guchun Chen (1):
      drm/amdgpu: disable BACO on special BEIGE_GOBY card

Hamza Mahfooz (1):
      drm/amd/display: only fill dirty rectangles when PSR is enabled

Hanjun Guo (1):
      drm/radeon: Add the missed acpi_put_table() to fix memory leak

Harsh Jain (1):
      drm/amdgpu: complete gfxoff allow signal during suspend without delay

Kenneth Feng (2):
      drm/amd/pm: enable mode1 reset on smu_v13_0_10
      drm/amd/pm: skip disabling all smu features on smu_v13_0_10 in suspend

Leo Ma (1):
      drm/amd/display: Adding HDMI SCDC DEVICE_ID define

Liu Jian (1):
      drm/amd/display: delete the duplicate .set_odm_bypass initialization in dcn314_tg_funcs

LongJun Tang (1):
      drm/amd/display: Have risk for memory exhaustion

Luben Tuikov (2):
      drm/amdgpu: Remove redundant I2C EEPROM address
      drm/amdgpu: Decouple RAS EEPROM addresses from chips

Ma Jun (2):
      drm/amdkfd: Fix the memory overrun
      drm/amdkfd: Make kfd_fill_cache_non_crat_info() as static

Max Tseng (1):
      drm/amd/display: Cursor update refactor: PSR-SU support condition

Michael Strauss (1):
      drm/amd/display: Only update link settings after successful MST link train

Mike Hsieh (1):
      drm/amd/display: Set correct EOTF and Gamut flag in VRR info

Mustapha Ghaddar (1):
      drm/amd/display: Fix fallback issues for DP LL 1.4a tests

Nawwar Ali (1):
      drm/amd/display: Update 709 gamma to 2.222 as stated in the standerd

Nicholas Kazlauskas (3):
      drm/amd/display: Update SR watermarks for DCN314
      drm/amd/display: Allow tuning DCN314 bounding box
      drm/amd/display: Fix reg timeout in enc314_enable_fifo

Paulo Miguel Almeida (2):
      drm/amdgpu: Replace 1-element array with flexible-array member
      drm/amdgpu: Replace one-element array with flex-array member

Philip Yang (2):
      drm/amdgpu: Unlock bo_list_mutex after error handling
      drm/amdgpu: Drop eviction lock when allocating PT BO

Rajneesh Bhardwaj (1):
      drm/amdgpu: Fix the kerneldoc description

Ryan Lin (1):
      drm/amd/display: Waiting for 1 frame to fix the flash issue on PSR1

Steve Su (1):
      drm/amd/display: Fix gpio port mapping issue

Takashi Iwai (1):
      drm/radeon: Add HD-audio component notifier support (v6)

Tao Zhou (1):
      drm/amdgpu: remove the check of init status in psp_ras_initialize

Tim Huang (1):
      drm/amd/pm: update SMU IP v13.0.4 msg interface header

Tong Liu01 (1):
      drm/amdgpu: add vram reservation based on vram_usagebyfirmware_v2_2

Ville Syrjälä (1):
      drm/amdgpu: Use drm_mode_init() for on-stack modes

Wenjing Liu (1):
      drm/amd/display: Consider dp cable id only when data is non zero

Wesley Chalmers (1):
      drm/amd/display: Disable DRR actions during state commit

Yifan Zhang (1):
      drm/amdgpu: force read discovery file if set discovery=2

 drivers/gpu/drm/Kconfig                            |  56 ----------
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |  29 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  59 ++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   | 104 ++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  43 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  56 +++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  26 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  41 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |   2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   7 ++
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   7 ++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  79 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  34 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  10 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   8 ++
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  28 +++--
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  32 +++---
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  55 ++++++----
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   4 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  51 +++++++--
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |  15 ++-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  60 ++++++++++-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   5 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   3 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   1 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   1 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   1 +
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |  24 +++--
 .../gpu/drm/amd/display/dc/dcn314/dcn314_optc.c    |   1 -
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   8 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   3 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   5 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  11 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   5 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.h |   3 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |  14 ++-
 .../dc/dml/dcn32/display_mode_vba_util_32.h        |   3 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |   2 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |   1 +
 .../amd/display/dc/gpio/dcn32/hw_factory_dcn32.c   |  14 +++
 drivers/gpu/drm/amd/display/dc/gpio/hw_ddc.c       |   9 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   6 +-
 .../drm/amd/display/modules/color/color_gamma.c    |   2 +-
 .../drm/amd/display/modules/freesync/freesync.c    |   8 +-
 drivers/gpu/drm/amd/include/atombios.h             |  24 ++---
 drivers/gpu/drm/amd/include/atomfirmware.h         |  63 +++++++++--
 .../drm/amd/pm/powerplay/hwmgr/vega10_thermal.c    |  25 +++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   4 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_4_ppsmc.h   |  15 ++-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  53 +++++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  18 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   3 +
 drivers/gpu/drm/radeon/Kconfig                     |  30 ++++++
 drivers/gpu/drm/radeon/radeon.h                    |   8 ++
 drivers/gpu/drm/radeon/radeon_audio.c              | 117 +++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_bios.c               |  18 ++--
 drivers/gpu/drm/radeon/radeon_device.c             |   4 +
 include/uapi/drm/amdgpu_drm.h                      |  14 +++
 82 files changed, 1041 insertions(+), 369 deletions(-)
