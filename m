Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16FE437C99
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 20:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6786C6EDC5;
	Fri, 22 Oct 2021 18:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE4C6E80B;
 Fri, 22 Oct 2021 18:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu7/L2ZjKJY9QHseR34xMKpwsIXjxwhE5BzJ9IbEawSXgS9Vd3ptg5y4Hg1CqJF+X2XO1ZG9xfz+PFgRjJLNLflMLOYKsa1Ift9al19VhDCMps4lbh4Jz+pb1xcYf8f0stUjkRakN5lDxIMggb28n3Za0lIrxsDfH1aIN6+QXlhYjwsWPd1nNUTWOjNJlDIrVNAxP4fqENfjeY+lCvU8T/9XhtXxx4IX13Lnr5lZpJ2E/ZpCLQTKNaCk+K+hUvqXBialrdeRWZ9Z8H0rD4orqi5pnPtmANSl1pPKQlfP+2JkFmEb/uVvlsmQ5bOZTfMMYGaWbi2e9rY2np1wBizCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50cpnIOPSC5wKkaVzSSRPd0wvrsewhFn+JixkUADpR0=;
 b=WPSok4sOx8CYTuS56nxIl0SPg0NG4DHcoIZM+m3bhM+UWt5r/PMigyMC/um2E4C2Bvs6CwHdLMAopbZ3vMJqsnVJL4+r8lp2RsbdO9DS2CZGB9g/Qs9+lqP6O0SSbrAv6CELSJkzZqcBIBIc7sH0M/CBRGANTMGQCNzwNFxIdn9zsY3uE42f9gjPrWBbgrLy9zX5MYGpbKc+5AoqfVGWM3RZdyvQcsmsGK7n346Ape8jsqusoaNDNDErnLbjLzVmxt1teyca3zTak/OTEcieWmH3UF0jc1ICGsxIuZHhhDg9CmYTlpWoFwjqZZfS7Fwk/X0T0AiR/b4oH5scG3+Dgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50cpnIOPSC5wKkaVzSSRPd0wvrsewhFn+JixkUADpR0=;
 b=a8dYjsj1K+HrFrdq7awS535QOTVAdZ9VvwR3ELo2D9Kup7mWDLLhUIp089gzSr8I4Z0OXTTUbO5Ss2lZkO/AxmVCfxc4/9Vz1FGi5IS9TasPExgjLu1K+uixg47CawGcDDReMgPLkIZzPYVatjp6LFI4EHTZU8L//PlF9Ph0la4=
Received: from MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::23)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 18:31:26 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::75) by MW4P223CA0018.outlook.office365.com
 (2603:10b6:303:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Fri, 22 Oct 2021 18:31:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Fri, 22 Oct 2021 18:31:25 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 13:31:23 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.16
Date: Fri, 22 Oct 2021 14:31:12 -0400
Message-ID: <20211022183112.4574-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff77244a-c79b-41ac-6e79-08d9958a27d6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4157BFC8A2FBDAE276B1FD58F7809@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5oxR5eK87Q9DjEXWmlOP91IUpWdrBCyiJX0jkSxk4TKxnDAUstlPWh8UrVWxPI6PVq7rF+mXtE0TwYHi2Ylqndu0h1CHEYlQ9Sv6IkyE3MjAleRlmLbNFUX3K8n30kz15XEjyaOOll5hYHEqvTPq/+Mm1Ya8PypK2R0+4AyxOCQlXMwQKoNUFCXp/JdTOMSp9V0bETpagNZ7ZJelLtHAOsQryVy3+XLhv6kt2+8TIaiGAvzPKIznD0rZwJPtiO5TX+h8jPr+BvBe2kP/JsnkO55o7pZuZAqzMjynZ+Tk3WNh2VmvsYvtnvjvUC3mxotlpo+5nSa3i89s48MeA5yzwEtABJ2E/zBJzvtY/gRJXFSuEkpfzq+6aVcFaEyg8Bs+gPR19Q2nmIYMmJos82TM0sW8JW450VrwIebPOR3+rEmNBDrvovpvzgEVLxIKHZfOfeDZ3/i1h4hpO1Z9W+iOdjPJhaDeuFzrFjD5BMegwelAAe8hP1tKe6i2TawzSnNeAMWT6oR9roi2XHakQKZ9O5WreRSfCpOXecvvyKnUF/b7Pw5yECBa7JPp2Khu7z92Jrl68g5NLaKsOyDcRfuh1X2GzD7aQNzzHX6Ax8lhfOQUsQAm+wYsv76v4Xd/hpHO0f+KfUCo9lHeqzfGXY+oj3E9yb1gJuD5YXDoU4I2jrc9B6TgRSiqF09knBGdNk7hlTXKkRsTAxQF10Txd9k5rLhn/fLivfD+b1r0S76UvQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(110136005)(1076003)(82310400003)(70586007)(70206006)(86362001)(336012)(8936002)(426003)(26005)(16526019)(4326008)(7696005)(186003)(5660300002)(36756003)(356005)(8676002)(36860700001)(2616005)(316002)(81166007)(83380400001)(6666004)(4001150100001)(47076005)(966005)(508600001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 18:31:25.2547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff77244a-c79b-41ac-6e79-08d9958a27d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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

Hi Dave, Daniel,

Fixes for 5.16.

The following changes since commit 48737ac4d70faffeb516e2a9847e24f9a7eee05f:

  drm/amdgpu/psp: add some missing cases to psp_check_pmfw_centralized_cstate_management (2021-10-13 22:51:41 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.16-2021-10-22

for you to fetch changes up to 41ad36623fabe7d02c9f89aff077dd4c8ba5d602:

  amd/display: remove ChromeOS workaround (2021-10-22 10:11:52 -0400)

----------------------------------------------------------------
amd-drm-next-5.16-2021-10-22:

amdgpu:
- PSP fix for resume
- XGMI fixes
- Interrupt fix in device tear down
- Renoir USB-C DP alt mode fix for resume
- DP 2.0 fixes
- Yellow Carp display fixes
- Misc display fixes
- RAS fixes
- IP Discovery enumeration fixes
- VGH fixes
- SR-IOV fixes
- Revert ChromeOS workaround in display code
- Cyan Skillfish fixes

amdkfd:
- Fix error handling in gpu memory allocation
- Fix build warnings with some configs
- SVM fixes

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: support B0&B1 external revision id for yellow carp

Agustin Gutierrez (2):
      Revert "drm/amd/display: Fix error in dmesg at boot"
      Revert "drm/amd/display: Add helper for blanking all dp displays"

Alex Deucher (15):
      drm/amdgpu/pm: properly handle sclk for profiling modes on vangogh
      drm/amdgpu/gfx10: fix typo in gfx_v10_0_update_gfx_clock_gating()
      drm/amdkfd: protect hawaii_device_info with CONFIG_DRM_AMDGPU_CIK
      drm/amdkfd: protect raven_device_info with KFD_SUPPORT_IOMMU_V2
      drm/amdgpu: drop soc15_set_ip_blocks()
      drm/amdgpu: drop nv_set_ip_blocks()
      drm/amdgpu: drop navi reg init functions
      drm/amdgpu/vcn3.0: handle harvesting in firmware setup
      drm/amdgpu: Consolidate VCN firmware setup code
      drm/amdgpu/vcn2.0: remove intermediate variable
      drm/amdgpu/vcn3.0: remove intermediate variable
      drm/amdgpu: Workaround harvesting info for some navy flounder boards
      drm/amdgpu/swsmu: handle VCN harvesting for VCN SMU setup
      drm/amdgpu/smu11.0: add missing IP version check
      drm/amdgpu/nbio7.4: use original HDP_FLUSH bits

Anthony Koo (2):
      drm/amd/display: Change initializer to single brace
      drm/amd/display: [FW Promotion] Release 0.0.88

Aric Cyr (2):
      drm/amd/display: Validate plane rects before use
      drm/amd/display: 3.2.157

Eric Yang (1):
      drm/amd/display: increase Z9 latency to workaround underflow in Z9

Guchun Chen (1):
      drm/amdgpu/discovery: parse hw_id_name for SDMA instance 2 and 3

Hansen (1):
      drm/amd/display: Fix DP2 SE and LE SYMCLK selection for B0 PHY

Huang Rui (1):
      drm/amdgpu: remove grbm cam index/data operations for gfx v10

Jake Wang (6):
      drm/amd/display: Disable dpp root clock when not being used
      drm/amd/display: Disable dsc root clock when not being used
      drm/amd/display: Disable dpstreamclk, symclk32_se, and symclk32_le
      drm/amd/display: Removed z10 save after dsc disable
      drm/amd/display: Moved dccg init to after bios golden init
      drm/amd/display: Disable hdmistream and hdmichar clocks

Jimmy Kizito (2):
      drm/amd/display: Clear encoder assignment for copied streams
      drm/amd/display: Do not skip link training on DP quick hot plug

Jingwen Chen (1):
      drm/amd/amdgpu: add dummy_page_addr to sriov msg

Jonathan Kim (1):
      drm/amdkfd: map gpu hive id to xgmi connected cpu

Josip Pavic (1):
      drm/amd/display: do not compare integers of different widths

Kent Russell (1):
      drm/amdgpu: Clarify error when hitting bad page threshold

Lai, Derek (1):
      drm/amd/display: Removed power down on boot from DCN31

Lang Yu (1):
      drm/amdkfd: Fix an inappropriate error handling in allloc memory of gpu

Lijo Lazar (1):
      drm/amd/pm: Disable fan control if not supported

Michael Strauss (1):
      drm/amd/display: Clean Up VPG Low Mem Power

Mikita Lipski (1):
      drm/amd/display: Add missing PSR state

Nevenko Stupar (1):
      drm/amd/display: Add bios parser support for latest firmware_info

Nicholas Kazlauskas (2):
      drm/amd/display: Fix prefetch bandwidth calculation for DCN3.1
      drm/amd/display: Require immediate flip support for DCN3.1 planes

Nikola Cornij (2):
      drm/amd/display: Limit display scaling to up to true 4k for DCN 3.1
      drm/amd/display: Increase watermark latencies for DCN3.1

Philip Yang (2):
      drm/amdkfd: clarify the origin of cpages returned by migration functions
      drm/amdkfd: debug message to count successfully migrated pages

Qing Wang (1):
      drm/amdgpu: replace snprintf in show functions with sysfs_emit

Roman Li (1):
      drm/amd/display: Fully switch to dmub for all dcn21 asics

Simon Ser (1):
      amd/display: remove ChromeOS workaround

Tao Zhou (3):
      drm/amdgpu: load PSP RL in resume path
      drm/amdgpu: centralize checking for RAS TA status
      drm/amdgpu: output warning for unsupported ras error inject (v2)

Vignesh Chander (1):
      drm/amd/pm: Enable GPU metrics for One VF mode

Wenjing Liu (2):
      drm/amd/display: add DP2.0 debug option to set MST_EN for SST stream
      drm/amd/display: correct apg audio channel enable golden value

YuBiao Wang (1):
      drm/amd/amdgpu: Do irq_fini_hw after ip_fini_early

 drivers/gpu/drm/amd/amdgpu/Makefile                |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  34 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  27 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   3 +-
 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c   |  54 ----
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |  51 ----
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  27 +-
 drivers/gpu/drm/amd/amdgpu/navi10_reg_init.c       |  55 ----
 drivers/gpu/drm/amd/amdgpu/navi12_reg_init.c       |  52 ----
 drivers/gpu/drm/amd/amdgpu/navi14_reg_init.c       |  53 ----
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  15 ++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 295 +--------------------
 drivers/gpu/drm/amd/amdgpu/nv.h                    |  10 -
 .../gpu/drm/amd/amdgpu/sienna_cichlid_reg_init.c   |  54 ----
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 179 -------------
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |   1 -
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   7 +-
 drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c      |  50 ----
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  15 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  28 +-
 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c  |  51 ----
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  64 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  19 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  54 +---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |  90 ++++++-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |  21 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  10 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  63 +----
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  32 +--
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   5 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   4 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   1 -
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  24 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  49 +++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |  34 ++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |  39 ++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  | 237 ++++++++++++++++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h  |  34 ++-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c | 115 ++++----
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  17 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   9 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |   2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   4 +-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |   2 +-
 .../amd/include/asic_reg/dcn/dcn_3_1_2_offset.h    |   2 +
 .../amd/include/asic_reg/dcn/dcn_3_1_2_sh_mask.h   |   8 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  14 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  14 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  95 ++-----
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  89 ++-----
 70 files changed, 897 insertions(+), 1407 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/beige_goby_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/navi10_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/navi12_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/navi14_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/sienna_cichlid_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/vangogh_reg_init.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/yellow_carp_reg_init.c
