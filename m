Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B76384271CC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 22:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850396E0EB;
	Fri,  8 Oct 2021 20:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5556E0DD;
 Fri,  8 Oct 2021 20:04:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2bsOnpLiEVEpItDrOi9ZpjFb+RVUmwdtMYDC0CLlNzjiVa9UkBnDL2/IlqTe4y5tF4IIiSC5G9ORtXIUnlwnj0WhFFUDealxhLEc8EBqu4ULSSr2JY9FMEcyVpNnz9jNB8tuscdF4/VPGOh4eVLSSaifBgGZNXa/u6lCjoOTCvV8p//xE7a0gmmpCKruyEBErQ+fTbmp4CmMJ6kMWl9vcP5fACvo7XNnjJYNYVFYHckDQRvqMXfsbtqJz7KxK8NQ/KCKxyIyyi9YJ749LrKoR6PiUN0udeFHnimYKB0dPveCEq+Hv++F+WsfRKTC9CJsEENitlzoKffXe7EQ15uLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlUEr46DtGp2NWWpvnwHpQOX6/eVgamWpQs/rLbYo7g=;
 b=WPeMFBR/Bdwsq9Ep8Gd4mVssQu41/G0RXmh0HjQPRCZn3Cm58+qDMaDZLHwQ5mJQlLX2jIpHmmUct5B3t1VgI3E4a7f0vUQytG8cloygOUMPIRTGZGq+Uz+v2kIBgiPyPN+VAcAi96jyHbpupzuAgv+tdkCHj9m+whyQWqXVdgRLr16rV6y0K91T0GbgvlI+cvvCmwqvyOgSXVmk4m/3m46RCHDGJMeN5ARr2FIpu5I71KGi/zE7VcEGVe+ay3U8WTr5KOd0uKmfhCTs49vJSU8VpIz4FOPcwEOpTfTv6g5wOowQtb95uGhcjdMvUeEbFB+IZ8T7x9x6fUABDlTthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlUEr46DtGp2NWWpvnwHpQOX6/eVgamWpQs/rLbYo7g=;
 b=cbkCuBSeC+zLILCspmoRfE5pke3uhQpGcsQmmKqVusWWUwAS8AyyewZWvWdzqSCwEiK55L1kRuP7utNJ4ZRnmN6B5IxOqxI78nDZa7Iaf/xOvR47fzIGrI/8kfp188CPBFbUnfDFGk+Km8T/1uHoFq8RYaH+CMDHrY3+eaMlmKk=
Received: from DM5PR07CA0123.namprd07.prod.outlook.com (2603:10b6:3:13e::13)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Fri, 8 Oct
 2021 20:04:00 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13e:cafe::10) by DM5PR07CA0123.outlook.office365.com
 (2603:10b6:3:13e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 20:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 20:03:59 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 8 Oct 2021
 15:03:58 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.16
Date: Fri, 8 Oct 2021 16:03:45 -0400
Message-ID: <20211008200345.4689-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54c30cda-1119-47b1-fc42-08d98a96c4b0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2751D604D0A3A02DDCB1C51BF7B29@SN6PR12MB2751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /wk8i52U55pF0/0YSrJb5FmwwmNbQD5zas4jIsVLcsh4WFo6Ny78sdVuYyKK3z49d4IuiWqk6zfiGbxVM6p9txQJ0Wdj7hKgvDT4LMJ/omFpogdTO5W+H2hlfu2RlXLeCiVn2wHa44AfsGayq7KfCxOVlk2EcFUA7lTERLDsAM2dYdO4r8Vwk6pD3sfbCIylE1aUNhlQyWjrma8lyjMyr9BoinaH2aL41FaLnFNVj5Vdg0GnXVUY7kIhs0QqgQOXOgGD5WnScWdik7SA+31HsMWGcpZtoiu37POBQ+xZz0iJStusAOBLGKbWvWN26IwZcJnvMEvL8ZtogqW5IDBD+l19s0BommsVGN71MLLEPGLSX7iXG0bQOKMvgnUkGQzUaehgbNrmttUL3/HzOplHRok/2eMHWNKwe4GxzCz0sJxSgXDjkXZklW/NajYLgNKOzRydwLuCEv4NvxoPqKd+SuHDZUfxUSiMDIQPYOmFjM6lC14hEesdQ7I8j4N7lCIPah+JMCb5wLvS0MNb6BfV67bwdCvODJ6bffrkd/yJgEEDA9NthxUngiyhDHPPaOPxOlfM41ViKwcVS7Dn+7dH36hN3s4Qt3dLbr8Fg4SqdUVbfkg3Bl5WPVW2J69XFki2QM42/HtgECFUS5VwBy6Ds/SIam+3APom0idPu6SMJ7FTQzrKBvuOXJ/qAWaTc07PQi5kHaQFUsmbjWO+k9Gq9jRJ+90Fby7g2FMNeIXPwvI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(26005)(82310400003)(8936002)(83380400001)(16526019)(36756003)(4326008)(186003)(8676002)(70206006)(70586007)(1076003)(110136005)(81166007)(47076005)(7696005)(2616005)(2906002)(426003)(508600001)(356005)(6666004)(336012)(316002)(66574015)(30864003)(5660300002)(966005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 20:03:59.8423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c30cda-1119-47b1-fc42-08d98a96c4b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
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

More new stuff for 5.16.  MCE change has an ack from Boris to merge
through the amdgpu tree.

The following changes since commit 1e3944578b749449bd7fa6bf0bae4c3d3f5f1733:

  Merge tag 'amd-drm-next-5.16-2021-09-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-09-28 17:08:26 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.16-2021-10-08

for you to fetch changes up to 40348baedfbc6500e7a090c7da1d55b6c94c334f:

  drm/amd/display: fix duplicated inclusion (2021-10-08 13:22:52 -0400)

----------------------------------------------------------------
amd-drm-next-5.16-2021-10-08:

amdgpu:
- gart BO pin count fix
- RAS fixes
- Misc display fixes
- Misc code cleanups
- Validate IP discovery table
- IOMMU handling fixes for hotplug
- Cyan Skillfish display support
- DP 2.0 fixes
- Covert vega and navi to IP discovery based asic enumeration
- JPEG fixes
- More FP cleanup for display
- DCC fixes for DCN3.x
- Initial USB4 DP tunnelling support
- Aldebaran MCE support

amdkfd:
- Misc bug fixes
- Misc code cleanups
- RAS fixes

x86/MCE:
- Export symbol for use by GPU driver

----------------------------------------------------------------
Alex Deucher (69):
      drm/amdgpu: move headless sku check into harvest function
      drm/amdgpu: add debugfs access to the IP discovery table
      drm/amdgpu: store HW IP versions in the driver structure
      drm/amdgpu: fill in IP versions from IP discovery table
      drm/amdgpu: add XGMI HWIP
      drm/amdgpu/nv: export common IP functions
      drm/amdgpu: add initial IP enumeration via IP discovery table
      drm/amdgpu/sdma5.0: convert to IP version checking
      drm/amdgpu/sdma5.2: convert to IP version checking
      drm/amdgpu/gfx10: convert to IP version checking
      drm/amdgpu: filter out radeon PCI device IDs
      drm/amdgpu: bind to any 0x1002 PCI diplay class device
      drm/amdgpu/gmc10.0: convert to IP version checking
      drm/amdgpu: Use IP discovery to drive setting IP blocks by default
      drm/amdgpu: drive nav10 from the IP discovery table
      drm/amdgpu/gfxhub2.1: convert to IP version checking
      drm/amdgpu/mmhub2.0: convert to IP version checking
      drm/amdgpu/mmhub2.1: convert to IP version checking
      drm/amdgpu/vcn3.0: convert to IP version checking
      drm/amdgpu/athub2.0: convert to IP version checking
      drm/amdgpu/athub2.1: convert to IP version checking
      drm/amdgpu/navi10_ih: convert to IP version checking
      drm/amdgpu/amdgpu_smu: convert to IP version checking
      drm/amdgpu/smu11.0: convert to IP version checking
      drm/amdgpu/navi10_ppt: convert to IP version checking
      drm/amdgpu/sienna_cichlid_ppt: convert to IP version checking
      drm/amdgpu/nv: convert to IP version checking
      drm/amdgpu: drive all navi asics from the IP discovery table
      drm/amdgpu/display/dm: convert to IP version checking
      drm/amdgpu: add DCI HWIP
      drm/amdgpu/soc15: export common IP functions
      drm/amdgpu: add initial IP discovery support for vega based parts
      drm/amdgpu/soc15: get rev_id in soc15_common_early_init
      drm/amdgpu: drive all vega asics from the IP discovery table
      drm/amdgpu: default to true in amdgpu_device_asic_has_dc_support
      drm/amdgpu/display/dm: convert RAVEN to IP version checking
      drm/amdgpu/sdma4.0: convert to IP version checking
      drm/amdgpu/hdp4.0: convert to IP version checking
      drm/amdgpu/gfx9.0: convert to IP version checking
      drm/amdgpu/amdgpu_psp: convert to IP version checking
      drm/amdgpu/psp_v11.0: convert to IP version checking
      drm/amdgpu/psp_v13.0: convert to IP version checking
      drm/amdgpu/pm/smu_v11.0: update IP version checking
      drm/amdgpu/pm/smu_v13.0: convert IP version checking
      drm/amdgpu/pm/amdgpu_smu: convert more IP version checking
      drm/amdgpu/amdgpu_vcn: convert to IP version checking
      drm/amdgpu/vcn2.5: convert to IP version checking
      drm/amdgpu/soc15: convert to IP version checking
      drm/amdgpu: add VCN1 hardware IP
      drm/amdgpu: get VCN and SDMA instances from IP discovery table
      drm/amdgpu/sdma: remove manual instance setting
      drm/amdgpu/vcn: remove manual instance setting
      drm/amdgpu: get VCN harvest information from IP discovery table
      drm/amdgpu/ucode: add default behavior
      drm/amdgpu: add new asic_type for IP discovery
      drm/amdgpu: set CHIP_IP_DISCOVERY as the asic type by default
      drm/amdgpu: convert IP version array to include instances
      drm/amdgpu: clean up set IP function
      drm/amdgpu: add support for SRIOV in IP discovery path
      drm/amdkfd: clean up parameters in kgd2kfd_probe
      drm/amdkfd: convert kfd_device.c to use GC IP version
      drm/amdgpu: add an option to override IP discovery table from a file
      drm/amdgpu: consolidate case statements
      Documentation/gpu: remove spurious "+" in amdgpu.rst
      drm/amdgpu/display: fold DRM_AMD_DC_DCN201 into DRM_AMD_DC_DCN
      drm/amdgpu/gmc9: convert to IP version checking
      drm/amdgpu/display: fix dependencies for DRM_AMD_DC_SI
      drm/amdgpu/discovery: add missing case for SMU 11.0.5
      drm/amdgpu: add missing case for HDP for renoir

Alex Sierra (1):
      drm/amdkfd: rm BO resv on validation to avoid deadlock

Andrey Grodzovsky (2):
      drm/amdgpu: drm/amdgpu: Handle IOMMU enabled case
      drm/amdgpu: Add a UAPI flag for hot plug/unplug

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.85
      drm/amd/display: [FW Promotion] Release 0.0.86
      drm/amd/display: [FW Promotion] Release 0.0.87

Aric Cyr (2):
      drm/amd/display: 3.2.155
      drm/amd/display: 3.2.156

Arnd Bergmann (2):
      drm/amdgpu: fix warning for overflow check
      gpu: amd: replace open-coded offsetof() with builtin

Candice Li (1):
      drm/amdgpu: Update PSP TA Invoke to use common TA context as input

Charlene Liu (1):
      drm/amd/display: Pass PCI deviceid into DC

Christian König (2):
      drm/amdgpu: revert "Add autodump debugfs node for gpu reset v8"
      drm/amdgpu: print warning and taint kernel if lockup timeout is disabled

Colin Ian King (1):
      drm/amd/display: Remove redundant initialization of variable result

David Galiffi (1):
      drm/amd/display: Add debug support to override the Minimum DRAM Clock

Eric Yang (1):
      drm/amd/display: add vsync notify to dmub for abm pause

Ernst Sjöstrand (1):
      drm/amd/amdgpu: Validate ip discovery blob

George Shen (3):
      drm/amd/display: Handle Y carry-over in VCP X.Y calculation
      drm/amd/display: Update VCP X.Y logging to improve usefulness
      drm/amd/display: Skip override for preferred link settings during link training

Guchun Chen (4):
      drm/amd/display: fix error case handling
      drm/amdgpu: add HWID of SDMA instance 2 and 3
      drm/amdgpu: handle the case of pci_channel_io_frozen only in amdgpu_pci_resume
      drm/amdgpu: use adev_to_drm for consistency when accessing drm_device

Guo Zhengkui (1):
      drm/amdgpu: remove some repeated includings

Hansen (1):
      drm/amd/display: Fix detection of 4 lane for DPALT

Harry Wentland (1):
      drm/amd/display: Only define DP 2.0 symbols if not already defined

Hawking Zhang (1):
      drm/amdgpu: correct initial cp_hqd_quantum for gfx9

Ilya (1):
      drm/amd/display: Add PPS immediate update flag for DCN2

Jake Wang (1):
      drm/amd/display: Added root clock optimization flags

James Zhu (2):
      drm/amdgpu/jpeg2: move jpeg2 shared macro to header file
      drm/amdgpu/jpeg: add jpeg2.6 start/end

Jimmy Kizito (16):
      drm/amd/display: Fix MST link encoder availability check.
      drm/amd/display: Fix concurrent dynamic encoder assignment.
      drm/amd/display: Update link encoder object creation.
      drm/amd/display: Set DPIA link endpoint type
      drm/amd/display: Stub out DPIA link training call
      drm/amd/display: Add stub to get DPIA tunneling device data
      drm/amd/display: Skip DPCD read for DPTX-to-DPIA hop
      drm/amd/display: Train DPIA links with fallback
      drm/amd/display: Implement DPIA training loop
      drm/amd/display: Implement DPIA link configuration
      drm/amd/display: Implement DPIA clock recovery phase
      drm/amd/display: Implement DPIA equalisation phase
      drm/amd/display: Implement end of training for hop in DPIA display path
      drm/amd/display: Read USB4 DP tunneling data from DPCD.
      drm/amd/display: Fix DIG_HPD_SELECT for USB4 display endpoints.
      drm/amd/display: Add debug flags for USB4 DP link training.

John Clements (1):
      drm/amdgpu: resolve RAS query bug

Josip Pavic (1):
      drm/amd/display: initialize backlight_ramping_override to false

Jude Shih (4):
      drm/amd/display: Support for SET_CONFIG processing with DMUB
      drm/amd/display: Deadlock/HPD Status/Crash Bug Fix
      drm/amd/display: Fix USB4 Aux via DMUB terminate unexpectedly
      drm/amd/display: USB4 bring up set correct address

Lang Yu (1):
      drm/amdkfd: fix a potential ttm->sg memory leak

Leo (Hanghong) Ma (2):
      drm/amd/display: Add helper for blanking all dp displays
      drm/amd/display: Fix error in dmesg at boot

Leslie Shi (1):
      drm/amdgpu: fix gart.bo pin_count leak

Lijo Lazar (1):
      drm/amdgpu: During s0ix don't wait to signal GFXOFF

Lv Ruyi (1):
      drm/amd/display: remove duplicate include in dcn201_clk_mgr.c

Marek Olšák (1):
      drm/amd/display: fix DCC settings for DCN3

Meenakshikumar Somasundaram (6):
      drm/amd/display: Fix for link encoder access for MST.
      drm/amd/display: USB4 DPIA enumeration and AUX Tunneling
      drm/amd/display: Support for DMUB HPD and HPD RX interrupt handling
      drm/amd/display: Support for SET_CONFIG processing with DMUB
      drm/amd/display: Add dpia debug options
      drm/amd/display: Fix for access for ddc pin and aux engine.

Michael Strauss (2):
      drm/amd/display: Don't enable AFMT for DP audio stream
      drm/amd/display: Defer LUT memory powerdown until LUT bypass latches

Mukul Joshi (2):
      x86/MCE/AMD: Export smca_get_bank_type symbol
      drm/amdgpu: Register MCE notifier for Aldebaran RAS

Nikola Cornij (1):
      drm/amd/display: Limit display scaling to up to 4k for DCN 3.1

Nirmoy Das (2):
      drm/amdgpu: return early if debugfs is not initialized
      drm/amdgpu: unify BO evicting method in amdgpu_ttm

Oliver Logush (1):
      drm/amd/display: Add an extra check for dcn10 OPTC data format

Praful Swarnakar (1):
      drm/amd/display: Fix Display Flicker on embedded panels

Prike Liang (1):
      drm/amdgpu: force exit gfxoff on sdma resume for rmb s0ix

Qingqing Zhuo (2):
      drm/amd/display: Replace referral of dal with dc
      drm/amd/display: Re-arrange FPU code structure for dcn2x

Simon Ser (1):
      drm/amdgpu: check tiling flags when creating FB on GFX8-

Solomon Chiu (1):
      drm/amd/display: Add 120Hz support for freesync video mode

Tao Zhou (5):
      drm/amdgpu: add poison mode query for DF (v2)
      drm/amdgpu: add poison mode query for UMC
      drm/amdgpu: set poison supported flag for RAS (v2)
      drm/amdgpu: skip umc ras irq handling in poison mode (v2)
      amd/amdkfd: add ras page retirement handling for sq/sdma (v3)

Tom St Denis (1):
      drm/amd/amdgpu: Add missing mp_11_0_8_sh_mask.h header

Wayne Lin (1):
      drm/amd/display: Fix Werror when building

Wenjing Liu (4):
      drm/amd/display: use correct vpg instance for 128b/132b encoding
      drm/amd/display: update cur_lane_setting to an array one for each lane
      drm/amd/display: add function to convert hw to dpcd lane settings
      drm/amd/display: make verified link cap not exceeding max link cap

Wyatt Wood (1):
      drm/amd/display: Prevent using DMUB rptr that is out-of-bounds

Yang Li (1):
      drm/amdkfd: fix resource_size.cocci warnings

Yifan Zhang (2):
      drm/amdkfd: remove redundant iommu cleanup code
      drm/amdgpu: init iommu after amdkfd device init

Zhan Liu (2):
      drm/amdgpu: add cyan_skillfish asic header files
      drm/amd/display: add cyan_skillfish display support

kernel test robot (1):
      drm/amd/display: fix duplicated inclusion

 Documentation/gpu/amdgpu.rst                       |     4 +-
 arch/x86/include/asm/mce.h                         |     2 +-
 arch/x86/kernel/cpu/mce/amd.c                      |     3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h        |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |    96 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h        |     5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    99 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   843 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |    31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   659 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |     4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    23 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |     1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   125 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   210 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     6 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_0.c            |     7 +-
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c            |     9 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |    31 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   380 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   229 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |     6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    94 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   139 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    15 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    20 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |    20 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    40 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |    73 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |    13 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    95 +-
 drivers/gpu/drm/amd/amdgpu/nv.h                    |     2 +
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    53 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    14 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   100 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    32 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    59 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   163 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |     2 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |    34 +
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |     4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |     1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     3 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   267 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |     4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |     3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |     7 +-
 drivers/gpu/drm/amd/display/Kconfig                |     2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   396 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |     8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    17 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c     |     2 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     3 +-
 .../gpu/drm/amd/display/dc/bios/command_table2.c   |     4 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     9 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     5 +
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |     2 +-
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   258 +
 .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.h |    34 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |     2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   254 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   199 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |     9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   219 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   953 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    23 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |     3 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     8 +
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |     8 +
 drivers/gpu/drm/amd/display/dc/dc.h                |    45 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |    85 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |     3 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |     3 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h     |    39 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |    21 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |    24 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    41 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_ipp.h   |    33 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c  |     2 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    11 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |     5 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |     9 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |     9 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |    36 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c    |    84 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_dccg.h    |    37 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c |   316 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.h |    83 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.c  |   107 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.h  |    45 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c    |   150 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hubp.h    |   132 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c   |   630 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.h   |    46 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.c    |   131 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_init.h    |    33 +
 .../amd/display/dc/dcn201/dcn201_link_encoder.c    |   209 +
 .../amd/display/dc/dcn201/dcn201_link_encoder.h    |    59 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c |   125 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.h |    86 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c |    72 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.h |    74 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_optc.c    |   203 +
 .../gpu/drm/amd/display/dc/dcn201/dcn201_optc.h    |    74 +
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |  1307 ++
 .../drm/amd/display/dc/dcn201/dcn201_resource.h    |    50 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |     2 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |     2 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |    59 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |    39 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   159 +-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  |     3 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    45 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    11 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |     5 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |     4 +-
 .../dc/dml/{dcn2x/dcn2x.c => dcn20/dcn20_fpu.c}    |     2 +-
 .../dc/dml/{dcn2x/dcn2x.h => dcn20/dcn20_fpu.h}    |     6 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |     1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     1 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     3 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_ddc.h   |     1 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |     5 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |    99 +
 drivers/gpu/drm/amd/display/dc/inc/hw/abm.h        |     1 +
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    13 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    12 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dwb.h        |     5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |     1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |     4 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     1 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |    10 +
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.c   |     2 +-
 .../amd/display/dc/irq/dcn20/irq_service_dcn20.h   |     2 +-
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.c |   374 +
 .../amd/display/dc/irq/dcn201/irq_service_dcn201.h |    34 +
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.c   |     2 +-
 .../amd/display/dc/irq/dcn21/irq_service_dcn21.h   |     2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h          |     2 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     4 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   171 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |     1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    10 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |    16 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     3 +-
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 .../amd/include/asic_reg/clk/clk_11_0_1_offset.h   |    32 +
 .../amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h  |    37 +
 .../amd/include/asic_reg/dcn/dcn_2_0_3_offset.h    |  6193 ++++++
 .../amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h   | 22091 +++++++++++++++++++
 .../drm/amd/include/asic_reg/df/df_3_6_offset.h    |     5 +
 .../drm/amd/include/asic_reg/df/df_3_6_sh_mask.h   |   132 +
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h  |   151 +
 .../amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h |   952 +
 .../amd/include/asic_reg/mp/mp_11_0_8_sh_mask.h    |   355 +
 drivers/gpu/drm/amd/include/atombios.h             |     2 +-
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |     2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h  |     4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   126 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    50 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    24 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    96 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    22 +-
 drivers/gpu/drm/radeon/atombios.h                  |     2 +-
 include/drm/amd_asic_type.h                        |     1 +
 193 files changed, 40630 insertions(+), 1867 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.h
 rename drivers/gpu/drm/amd/display/dc/dml/{dcn2x/dcn2x.c => dcn20/dcn20_fpu.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/dml/{dcn2x/dcn2x.h => dcn20/dcn20_fpu.h} (94%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_offset.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/clk/clk_11_0_1_sh_mask.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_offset.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_offset.h
 create mode 100755 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_2_0_3_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_11_0_8_sh_mask.h
