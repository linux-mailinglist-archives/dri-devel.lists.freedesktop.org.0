Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3BF5FC941
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 18:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8FD10E34D;
	Wed, 12 Oct 2022 16:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8771210E343;
 Wed, 12 Oct 2022 16:27:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvtbrDI8+DP5TrQZTk4refDG9kDZFHe3Uk3oIonkaZfj3eGl8Gp4ylcRP/7eCuBbxKsPs0oj6lt1+SjUDqXP3pusloZgxvsouIsjVAjhP5ahHZNcKuiSxtCXv5kZf/XGrVJmES4bDq4ASUS+TlLtfzwhlho4T+nftWmw5FW6H5/1TWfHkK41yH1I5czKh8Olr+DYKs4COAFDB0bjP5mGJS5DkkpEb8DUth1XRQUtocIchUQhG/83zPBzbPP/JprlFJaxmSW9+WUNKXRxypvGMuBl781OFAtbKQF1Er6hWEt62CpahcU9T1GPA2Gaf0U/z10BG1XqeGzmVHLsdl6K2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAzaZfU2diPAdTK1NMinDGcZkXRS9sB6S5iwPobvHYw=;
 b=Hw/2gU1xhKhKttzGcOp+AHsSb7dmbxciS/x96wM8Zq3JNn3HZivogxNHYEQh3Y5tV8t9D5lCHTLU0tp8LlLtW1gnP8kT47kPod93cvGf5vLPHiSUof6eHLuzITuQ88djpZjuG3cEbXCR8Mqt83I4GZLuP8jB8xXvcofWSoRkZUXtUhWXmv9+fmFrLiYp5QQ68Urwj4Ge8wYyBVwAOWCx5TaaYwLi4kfSTSftsRp+YGtsL8pneTFYGwJxdn7Sp0Je0ez2PJP/xuuruqvIlyhCLrO/hrrvOYy7Oqz8rprb1zA41KwRykx4PYwCxPwuQBfjRQMq3en83l75Qi8eoi36MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAzaZfU2diPAdTK1NMinDGcZkXRS9sB6S5iwPobvHYw=;
 b=1m2txMLcfCRAOMBgPYno+oQqfEAi2jLewGyCaVpf9mUzHDWB11x/KI09lLGxGzwgQPYp4862F8JH7Wbek3XqD86imOTCxiSnVnEI/HT/f/HKKcCZmkOAjp0zYXruklQLjjkfI4L3YzImMUIPu748KZ/pBDxwdkKEYC/429MPjDU=
Received: from DS7PR06CA0002.namprd06.prod.outlook.com (2603:10b6:8:2a::16) by
 MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 16:27:29 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::61) by DS7PR06CA0002.outlook.office365.com
 (2603:10b6:8:2a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22 via Frontend
 Transport; Wed, 12 Oct 2022 16:27:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Wed, 12 Oct 2022 16:27:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 12 Oct
 2022 11:27:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.1
Date: Wed, 12 Oct 2022 12:26:50 -0400
Message-ID: <20221012162650.8810-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: a14cf341-c968-4687-9c96-08daac6ea7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SaskHXnZ8XEsul4CcotY7pN8z3eM1kPdK5r6iK+AnSrxZk7Suga5h93mgvNwImpXB+GP2FeHw/+WJVvvRdlkrnsQH+2yFTHA66fA5ia/vJTKaTwkqyoq9r94muHsnr3pfeGYm8TdtM1yVIEqiH0sXXn+PmI7goq9pXnrhmlLGgY1FBy/UOFZjoaWQ/z888I/hqTV4ZfAnWSvoa2bNrU066hlrXuSuD00aJcEzw/MMy2wJUoOKMWdGRaD/T62lbLPPdulhIP/2xdJZP3iwU4jXpU2TBpvxGkq9wGBsymkus8JY8f/6VlwVqOxK1Va0fvBFso0MSwHp+ECgfBOKRoGlUA++J4RyZ8a+LRQqcHeXQIR5WBa8/jbuqRt3faHQUHafnNa7tP+NPuD4uYBDRAYX0601Sq6DBRTpt+Y5ZuZhwpspTLAt/LpTEJ+8rVufbIJSiyV9U8fy28YekUINDwf+bsJ1osR+ymPPenK34f8e+7QwEvkF4JyOKmk7ljmWrW7a1kmcRpoA2SHk3d55svmGY0SKyWpDpvGbvsk9UXb4UZOUDuNtH9DXDUravLrI6eXYJMonOoru7aF9v+j7fipwQuS7VLQnmJpxHqbnt5Jv1z/Ku3Y51aJ+EwZLtGERCxuPvIy+qQ3KXbWOQ1w7EqvIm4ab8yZcx7ll3ZpkFMVSyNMJ2e3NPA5APT5Ka/vnblsfCUCB4tZ3YLWhlwWflekPeCgzp83WXhtNidMVykGZN0Wd9DvwxX+jUgT/iYVad0g
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(82310400005)(40460700003)(86362001)(66899015)(4001150100001)(30864003)(2906002)(5660300002)(4326008)(8676002)(70586007)(41300700001)(316002)(110136005)(70206006)(8936002)(356005)(82740400003)(81166007)(478600001)(36860700001)(966005)(6666004)(40480700001)(7696005)(26005)(83380400001)(47076005)(426003)(2616005)(16526019)(336012)(186003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:27:28.7568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a14cf341-c968-4687-9c96-08daac6ea7d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295
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

Fixes for 6.1.

The following changes since commit 65898687cf7392c372ea8d04a88617e2cb794465:

  Merge tag 'amd-drm-next-6.1-2022-09-30' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-10-04 09:42:24 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-10-12

for you to fetch changes up to 0811b9e4530d7c46542a8993ce6b725d042c6154:

  drm/amd/display: Add HUBP surface flip interrupt handler (2022-10-12 11:27:41 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-10-12:

amdgpu:
- DC mutex fix
- DC SubVP fixes
- DCN 3.2.x fixes
- DCN 3.1.x fixes
- SDMA 6.x fixes
- Enable DPIA for 3.1.4
- VRR fixes
- VRAM BO swapping fix
- Revert dirty fb helper change
- SR-IOV suspend/resume fixes
- Work around GCC array bounds check fail warning
- UMC 8.10 fixes
- Misc fixes and cleanups

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu: switch sdma buffer function tear down to a helper
      drm/amdgpu: fix SDMA suspend/resume on SR-IOV
      drm/amd/display: make dcn32_split_stream_for_mpc_or_odm static
      drm/amd/display: fix indentation in dc.c
      drm/amd/display: make virtual_disable_link_output static
      drm/amd/display: add a license to cursor_reg_cache.h
      drm/amd/display: fix transfer function passed to build_coefficients()

Alexey Kodanev (2):
      drm/amd/pm: vega10_hwmgr: fix potential off-by-one overflow in 'performance_levels'
      drm/amd/pm: smu7_hwmgr: fix potential off-by-one overflow in 'performance_levels'

Alvin Lee (5):
      drm/amd/display: Only commit SubVP state after pipe programming
      drm/amd/display: Block SubVP if rotation being used
      drm/amd/display: Disable GSL when enabling phantom pipe
      drm/amd/display: For SubVP pipe split case use min transition into MPO
      drm/amd/display: Fix watermark calculation

Aric Cyr (4):
      Revert "drm/amd/display: correct hostvm flag"
      drm/amd/display: Fix vupdate and vline position calculation
      drm/amd/display: 3.2.206
      drm/amd/display: 3.2.207

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix VRAM BO swap issue

Aurabindo Pillai (2):
      drm/amd/display: Do not trigger timing sync for phantom pipes
      drm/amd/display: Add HUBP surface flip interrupt handler

Bokun Zhang (1):
      drm/amdgpu: Fix SDMA engine resume issue under SRIOV

Candice Li (2):
      drm/amdgpu: Update umc v8_10_0 headers
      drm/amdgpu: Add poison mode query for umc v8_10_0

Charlene Liu (1):
      drm/amd/display: prevent S4 test from failing

Daniel Gomez (1):
      drm/amd/display: Fix mutex lock in dcn10

Dillon Varone (8):
      drm/amd/display: Program SubVP in dc_commit_state_no_check
      drm/amd/display: Reorder FCLK P-state switch sequence for DCN32
      drm/amd/display: Increase compbuf size prior to updating clocks
      drm/amd/display: Fix merging dynamic ODM+MPO configs on DCN32
      Revert "drm/amd/display: skip commit minimal transition state"
      drm/amd/display: Use correct pixel clock to program DTBCLK DTO's
      drm/amd/display: Acquire FCLK DPM levels on DCN32
      drm/amd/display: Fix bug preventing FCLK Pstate allow message being sent

Dmytro Laktyushkin (3):
      drm/amd/display: fix dcn315 dml detile overestimation
      drm/amd/display: add dummy pstate workaround to dcn315
      drm/amd/display: always allow pstate change when no dpps are active on dcn315

Dong Chenchen (1):
      drm/amd/display: Removed unused variable 'sdp_stream_enable'

Eric Bernstein (1):
      drm/amd/display: Fix disable DSC logic in the DIO code

Fangzhi Zuo (1):
      drm/amd/display: Validate DSC After Enable All New CRTCs

George Shen (1):
      drm/amd/display: Add missing SDP registers to DCN32 reglist

Guenter Roeck (1):
      drm/amd/display: fix array-bounds error in dc_stream_remove_writeback() [take 2]

Hamza Mahfooz (1):
      Revert "drm/amdgpu: use dirty framebuffer helper"

Ian Chen (1):
      drm/amd/display: Refactor edp ILR caps codes

Iswara Nagulendran (1):
      drm/amd/display: Allow PSR exit when panel is disconnected

Josip Pavic (1):
      drm/amd/display: do not compare integers of different widths

Jun Lei (1):
      drm/amd/display: Add a helper to map ODM/MPC/Multi-Plane resources

Leo (Hanghong) Ma (1):
      drm/amd/display: AUX tracing cleanup

Leo Chen (1):
      drm/amd/display: Add log for LTTPR

Lewis Huang (1):
      drm/amd/display: Keep OTG on when Z10 is disable

Li Zhong (1):
      drivers/amd/pm: check the return value of amdgpu_bo_kmap

Martin Leung (3):
      drm/amd/display: block odd h_total timings from halving pixel rate
      drm/amd/display: unblock mcm_luts
      drm/amd/display: zeromem mypipe heap struct before using it

Max Tseng (1):
      drm/amd/display: Use the same cursor info across features

Meenakshikumar Somasundaram (1):
      drm/amd/display: Display does not light up after S4 resume

Nicholas Kazlauskas (1):
      drm/amd/display: Update PMFW z-state interface for DCN314

Philip Yang (2):
      drm/amdgpu: Set vmbo destroy after pt bo is created
      drm/amdgpu: Correct amdgpu_amdkfd_total_mem_size calculation

Randy Dunlap (1):
      drm/amd/display: clean up dcn32_fpu.c kernel-doc

Rodrigo Siqueira (14):
      drm/amd/display: Drop unused code for DCN32/321
      drm/amd/display: Update DCN321 hook that deals with pipe aquire
      drm/amd/display: Fix SubVP control flow in the MPO context
      drm/amd/display: Remove OPTC lock check
      drm/amd/display: Adding missing HDMI ACP SEND register
      drm/amd/display: Add PState change high hook for DCN32
      drm/amd/display: Enable 2 to 1 ODM policy if supported
      drm/amd/display: Disconnect DSC for unused pipes during ODM transition
      drm/amd/display: update DSC for DCN32
      drm/amd/display: Minor code style change
      drm/amd/display: Add a missing hook to DCN20
      drm/amd/display: Use set_vtotal_min_max to configure OTG VTOTAL
      drm/amd/display: Drop uncessary OTG lock check
      drm/amd/display: Clean some DCN32 macros

Roman Li (1):
      drm/amd/display: Enable dpia support for dcn314

Ruili Ji (1):
      drm/amdgpu: Enable F32_WPTR_POLL_ENABLE in mqd

Shirish S (1):
      drm/amd/display: explicitly disable psr_feature_enable appropriately

Sonny Jiang (1):
      drm/amdgpu: Enable VCN PG on GC11_0_1

Tao Zhou (4):
      drm/amdgpu: remove check for CE in RAS error address query
      drm/amdgpu: define RAS convert_error_address API
      drm/amdgpu: define convert_error_address for umc v8.7
      drm/amdgpu: fix coding style issue for mca notifier

Vladimir Stempen (2):
      drm/amd/display: properly configure DCFCLK when enable/disable Freesync
      drm/amd/display: increase hardware status wait time

Wenjing Liu (3):
      drm/amd/display: fix integer overflow during MSA V_Freq calculation
      drm/amd/display: write all 4 bytes of FFE_PRESET dpcd value
      drm/amd/display: Add missing mask sh for SYM32_TP_SQ_PULSE register

Yang Li (3):
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: clean up one inconsistent indenting
      drm/amd/display: Simplify bool conversion

Yang Yingliang (3):
      drm/amd/display: change to enc314_stream_encoder_dp_blank static
      drm/amdgpu/sdma: add missing release_firmware() in amdgpu_sdma_init_microcode()
      drm/amd/display: fix build error on arm64

Yuan Can (1):
      drm/amd/display: Remove unused struct i2c_id_config_access

Yunxiang Li (1):
      drm/amd/display: Fix vblank refcount in vrr transition

Zhikai Zhai (1):
      drm/amd/display: skip commit minimal transition state

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  29 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   7 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  29 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |   5 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   1 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              | 165 ++++++--------
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             |  78 ++++---
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c              |  63 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  71 +++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   8 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   7 -
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   4 +-
 .../drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c |  11 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  85 +++++---
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 105 ++++++++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  70 +++---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  53 ++++-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   8 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 147 ++++++++++++-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c   |   1 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  | 239 +++++----------------
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |  40 +---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h  |   1 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |  66 +++++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  30 +++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  25 +--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c    |   8 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   3 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   4 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   2 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |  20 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   2 -
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  15 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |   2 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  16 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |  15 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |  13 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |   7 -
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.h  |   4 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |  57 +++--
 .../display/dc/dcn32/dcn32_dio_stream_encoder.h    |  14 +-
 .../display/dc/dcn32/dcn32_hpo_dp_link_encoder.h   |   1 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  42 ++--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |  31 +++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |  22 ++
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |  88 ++++++++
 .../display/dc/dcn321/dcn321_dio_link_encoder.c    |   1 -
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   6 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   | 118 +++++-----
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |  96 +++------
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h   |   1 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |  15 ++
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   | 131 ++++++-----
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |  21 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |   1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |   1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   6 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |  19 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  15 +-
 .../drm/amd/display/dc/inc/hw/cursor_reg_cache.h   |  99 +++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |   4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   5 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 -
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   6 +
 .../gpu/drm/amd/display/dc/link/link_hwss_hpo_dp.c |   2 +-
 .../drm/amd/display/dc/virtual/virtual_link_hwss.c |   2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 140 ++++++++++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |   1 +
 .../drm/amd/display/modules/color/color_gamma.c    |   2 +-
 .../amd/include/asic_reg/umc/umc_8_10_0_offset.h   |   2 +
 .../amd/include/asic_reg/umc/umc_8_10_0_sh_mask.h  |   3 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   5 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   2 +-
 100 files changed, 1617 insertions(+), 995 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/cursor_reg_cache.h
