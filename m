Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31A5243D3
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 06:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D351710F5C5;
	Thu, 12 May 2022 04:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DBB10F5C5;
 Thu, 12 May 2022 04:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpvjqm8caXQhZB+iNMJh52oc//PnJ8bqfB05SjB84LTGUy0hHJlzDUtqZYLyRY+Kgj1PSRYlm1B4VDDKs2nHXTJY03yvElIjGtq6aym6BZ3sb7scpYAc1y/8HtWS00aN5Ah0zMTcjmn+/u9neaimjxqgZigqvf7TpOtqYRakz8ii29kwcOO8UWeUFVNPlI27yFbEJPQJ0+YEWKnWGpAZf0k19hO5RZtkurqrWsyf+A9YCMfL2w7k71CoWcWYwHtuAUbzsc8/AHIMDYZMEx44FflX/6U9RlF7+P1IgV1F9Xb1Mlf3UtA9WX9YfGpow1sXaIVSBQgz5H1JbuYWM74FvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO+f/EOWAqCeAOb4n/iuEN91eqYUB9kVjVbqtTF9NIM=;
 b=EkoxMH3Axc80kBEPfU+uIIm8pcuL4FfkEJOREz9KlUAhmRT3ux/so5eu8AmIqBEkoyBKMpvMiDXL0Y9vn7UFz3BLmk2Sx4BB9IPr9D+gMhPWSGMCxYfNsfzDPtylv/qdDZHs/QoIGA+S7OZf+vO9FlrWwCnZYFBP+8OgQwK2Ki99AgnnbLavqtBLoK2paiA52kXRBWHjvzl2D/ErLPAAD/b2jvT23UxwIglPNjuDKR9YgWHuAKkIqGYAZRzQpdVUbbmdWDddJ2xiwJMGXbnfdC4QL4wj8L9IgYSuFP54SxmOSD6sRSDgYZWyScnLDc7hP5p3APqmYfshZNzsW3zLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO+f/EOWAqCeAOb4n/iuEN91eqYUB9kVjVbqtTF9NIM=;
 b=g0iid+1Y5ubMAG7ihxDyIdnZW/i9DdIK+L/kquVia4gCEtNl/Yw0kLRU99laPvp6FnGTZep4zeN/XnwglChX/CzqXqUyFyHcQOjA7Gkbbhs1wE7jJbMO4ZesZEJ+HlUT/jhq38HFvwQpsdTnFGn7eN/i4KHOeuLQQQ2KwKcZgJU=
Received: from BN0PR04CA0003.namprd04.prod.outlook.com (2603:10b6:408:ee::8)
 by MN2PR12MB3151.namprd12.prod.outlook.com (2603:10b6:208:d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 04:05:46 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::ac) by BN0PR04CA0003.outlook.office365.com
 (2603:10b6:408:ee::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Thu, 12 May 2022 04:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 04:05:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 23:05:43 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.19
Date: Thu, 12 May 2022 00:05:30 -0400
Message-ID: <20220512040530.5634-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d98cd605-dc1b-49cc-6c3d-08da33ccb06d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3151:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3151F0BFE79A89E921E23C52F7CB9@MN2PR12MB3151.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpwLr1LpQXlS4CHwZyfDFGgZ0qr5qV0DnmXETm0yWpMkarBBvcjTvYE6y19UcwYf3G3JEy/Kf3RtowsQqMZnBzRk9bwUudIxy7voh2QRaonZshvUkL9d+S+707CnZwViOsc8VtZtu4XkEV853I5MGQJUWoCfi84J6LvRyPv3edP7lGy09uAvrgq8uZvuapoybqjP96Pij+IcRnJ6EwAHZyXp5oYwnoLg0CwYWCPm3j0+l3KFf75jWDGulbyANB9/gDq5AHcAkbk89u88dYICMqIuiuFDudDix4v0tdmQw8kOz8hQ+sQ3CVTPobmYqq5zW79xDRru1I29WZmleW6g5YDcpXev3UgTuVMgg+DwmHCS5wf4S6CVPgX1Ifs6lh3dPHq02aVpaAO+ZZdyEhRU7UfrUZ+FoitHkTK7i5IcZa5JeGLiK+hV1c6NcySHR1PGFLhUzneRKRXENG/pgbzO9vpdR+nJjvx4RhlPj1MaVPLa7f1Jzdxw33+0A61wiPE9cqMBeMBF636UlZtak8YJ3qHgRQ6ACuqh9qQdHXy49reHrCmNjUG+KbCCUTNHH+P5/emKA0BaUgpHB4m9AiyvrbJcFwkVjRxk0Oo0T/jB54QOD0LT4vWwyHT83qcQrA6AzGZAj4fVwwE4ioagzCVyK4KgkXyX1f30AOqHyT6KvA9X3OGhRCIlH+UbAvAQ51rNpqAwqePzWeHFn01B4wPcyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(66574015)(2616005)(26005)(1076003)(40460700003)(36860700001)(70586007)(36756003)(70206006)(426003)(47076005)(16526019)(186003)(336012)(82310400005)(8676002)(110136005)(4326008)(316002)(8936002)(86362001)(6666004)(2906002)(5660300002)(966005)(508600001)(81166007)(83380400001)(356005)(7696005)(30864003)(36900700001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 04:05:45.1871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98cd605-dc1b-49cc-6c3d-08da33ccb06d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3151
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

New stuff for 5.19.  Mostly new IP block support.

The following changes since commit 3da2c38231a4c62dafdbd762a199cfacaccd0533:

  drm/amdgpu: Free user pages if amdgpu_cs_parser_bos failed (2022-04-28 17:49:04 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-05-11

for you to fetch changes up to 81c5495910e81c2cadcb9118ca0c8803ab3bde61:

  drm/amdgpu: Remove duplicated argument in vcn_v4_0 (2022-05-10 17:53:13 -0400)

----------------------------------------------------------------
amd-drm-next-5.19-2022-05-11:

amdgpu:
- OPTC updates
- NBIO 4.3 support
- IH 6.0 support
- GPUVM TLB flush fix
- HDP 6.0 support
- LTTPR fixes
- HDP 5.2 support
- NBIO 7.7 support
- SMUIO 13.x updates
- DP2 fixes
- GMC 11.0 support
- PSP 13.x updates
- SMU 13.x updates
- VCN RAS support
- GC 11.0 support
- SDMA 6.0 support
- VCN 4.0 support
- Misc code cleanups
- DCN CONFIG cleanup
- RAS fixes

amdkfd:
- GC 11.0 support

----------------------------------------------------------------
Alan Liu (1):
      drm/amd/display: do not disable an invalid irq source in hdp finish

Alex Deucher (15):
      drm/amdgpu/psp: move PSP memory alloc from hw_init to sw_init
      drm/amdgpu/psp: drop load/unload/init_shared_buf wrappers
      drm/amdgpu/psp: fix memory leak in terminate functions
      drm/amdgpu/psp: move shared buffer frees into single function
      drm/amdgpu/discovery: handle AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO in SMU
      drm/amdkfd: add helper to generate cache info from gfx config
      drm/amdgpu/discovery: add MES11 support
      drm/amdgpu/gfx11: remove some register fields that no longer exist
      Revert "drm/amdgpu: disable runpm if we are the primary adapter"
      Revert "fbdev: fbmem: add a helper to determine if an aperture is used by a fw fb"
      drm/amdgpu/discovery: set flag for GC 11.0.1
      drm/amdgpu: simplify nv and soc21 read_register functions
      drm/amdgpu: make smu_v13_0_7_check_fw_status() static
      drm/amdgpu/mes: fix format specifier for size_t
      Revert "drm/amd/pm: keep the BACO feature enabled for suspend"

Alex Hung (7):
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in dc
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in dce
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in gpio
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in irq
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN for z10
      drm/amd/display: remove redundant CONFIG_DRM_AMD_DC_DCN in amdgpu_dm
      drm/amd/display: remove unnecessary else by CONFIG_DRM_AMD_DC_DCN

Alice Wong (3):
      drm/amdgpu/psp: deallocate memory when psp_load_fw failed
      drm/amdgpu/ucode: Remove firmware load type check in amdgpu_ucode_free_bo
      drm/amdgpu/psp: Return failure when firmware failed to load in SRIOV

Andrey Grodzovsky (2):
      drm/amd/psp: Add C2P registers to mp_13_0_2 header
      drm/amdgpu/psp: Add VBIOS flash handler

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.115.0

Aric Cyr (3):
      drm/amd/display: Clean up pixel format types
      drm/amd/display: 3.2.184
      drm/amd/display: 3.2.185

Chengming Gui (8):
      drm/amd/amdgpu: adjust the fw load type list
      drm/amd/amdgpu: add more fw load type to fit new ASICs
      drm/amdgpu/discovery: add SMUIO_13_0_8 func support
      drm/amdgpu/psp13: add support for MP0 13.0.7
      drm/amdgpu/discovery: add psp13 support for PSP 13.0.7
      drm/amd/pm: add SMU_13_0_7 PMFW headers
      drm/amdgpu/swsmu: add smu 13.0.7 firmware
      drm/amd/pm: add SMU_13_0_7 ppt_funcs for SMU_13_0_7

Christian König (1):
      drm/amdgpu: nuke dynamic gfx scratch reg allocation

Dan Carpenter (1):
      drm/amdgpu/gfx11: unlock on error in gfx_v11_0_kiq_resume()

Danijel Slivka (1):
      amdgpu/pm: Disallow managing power profiles on SRIOV for Sienna Cichlid

Elena Sakhnovitch (2):
      drm/amdgpu: Remove trailing space
      drm/amd/pm: Disable fan control if not supported

Eric Bernstein (1):
      drm/amd/display: Add new DSC interface to disconnect from pipe

Eric Huang (2):
      drm/amdkfd: add asic support for SDMA 6.0.2
      drm/amdkfd: add asic support for GC 11.0.2

Evan Quan (38):
      drm/amd/pm: enable pp_dpm_vclk/dclk sysfs interface support for SMU 13.0.0
      drm/amd/pm: move bootup values retrieving to ->sw_init
      drm/amd/pm: correct the way for retrieving bootup clocks
      drm/amd/pm: update the hw initialization sequence around pptable setup
      drm/amdgpu: enable pptable ucode loading
      drm/amd/pm: enable SCPM support for SMU
      drm/amd/pm: correct SMU OverridePcieParameters related settings
      drm/amd/pm: enable the support for retrieving combo pptable
      drm/amd/smu: Update SMU13 support for SMU 13.0.0
      drm/amdgpu/soc21: enable ATHUB and MMHUB PG
      drm/amdgpu: add FGCG support
      drm/amdgpu: enable GFX CGCG/CGLS for GC11.0.0
      drm/amdgpu: enable fgcg for soc21
      drm/amd/pm: enable power limit retrieving and setting for SMU 13.0.0
      drm/amd/pm: enable ac/dc switching for SMU 13.0.0
      drm/amd/pm: enable power profile setting for SMU 13.0.0
      drm/amd/pm: enable RunDcBtc support for SMU 13.0.0
      drm/amd/pm: enable ppfeature mask setting for SMU 13.0.0
      drm/amd/pm: enable PMLOG support for SMU 13.0.0
      drm/amd/pm: enable df cstate feature for SMU 13.0.0
      drm/amdgpu: enable more GFX clockgating features for GC 11.0.0
      drm/amd/pm: support more DPM features for SMU 13.0.0
      drm/amd/pm: enable deep sleep features control for SMU 13.0.0
      drm/amd/pm: enable gfx ulv feature control for SMU 13.0.0
      drm/amd/pm: enable more dpm features to pair with PMFW 78.31.0
      drm/amdgpu: enable MGCG and LS for ATHUB 3.0
      drm/amdgpu: enable MGCG and LS for MMHUB 3.0
      drm/amdgpu: enable clock gating for IH 6.0
      drm/amdgpu: enable clock gating for HDP 6.0
      drm/amd/pm: enable lclk dpm/ds and BACO features for SMU 13.0.0
      drm/amd/pm: enable BACO support for SMU 13.0.0
      drm/amd/pm: enable UCLK DPM for SMU 13.0.0
      drm/amd/pm: correct the check for current link status
      drm/amd/pm: correct the way for retrieving current uclk frequency
      drm/amd/pm: correct the way for retrieving current fclk frequency
      drm/amd/pm: enable FCLK DPM support for SMU 13.0.0
      drm/amd/pm: disable the gfxoff feature temporarily for SMU 13.0.0
      drm/amd/pm: suppress compile warning about possible unaligned accesses

Evgenii Krasnikov (2):
      Revert "drm/amd/display: Reset cached PSR parameters after hibernate"
      drm/amd/display: Reset cached PSR parameters after hibernate

Flora Cui (18):
      drm/amdgpu: add soc21 support for GC 11.0.2
      drm/amdgpu/discovery: add soc21 support for GC 11.0.2
      drm/amdgpu: add support for ATHUB 3.0.2
      drm/amdgpu/discovery: add ih6 support for IH 6.0.2
      drm/amdgpu/discovery: add smu13 support for MP1 13.0.7
      drm/amdgpu/discovery: add nbio 4.3 support for NBIO 4.3.1
      drm/amdgpu/discovery: add hdp6 support for HDP 6.0.1
      drm/amdgpu: add UMC 8.11.0 support
      drm/amdgpu: add GMC11 support for GC 11.0.2
      drm/amdgpu/discovery: add gmc11 support for GC 11.0.2
      drm/amdgpu: add sdma 6.0.2 firware support
      drm/amdgpu/discovery: add sdma6 support for SDMA 6.0.2
      drm/amdgpu: add mes 11 firmware for mes 11.0.2
      drm/amdgpu/discovery: add mes11 support for GC 11.0.2
      drm/amdgpu: add gc v11_0_2 imu firmware
      drm/amdgpu: add initial GC 11.0.2 support
      drm/amdgpu/discovery: add gfx11 support for GC 11.0.2
      drm/amdgpu/discovery: set family for GC 11.0.2

Graham Sider (3):
      drm/amdgpu: Disable SDMA WPTR_POLL_ENABLE for sdma_v6_0
      drm/amdkfd: Update event_interrupt_isr_v11 return
      drm/amdgpu: Implement get_vmid_pasid_mapping for gfx11

Harry Wentland (1):
      drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUNT

Hawking Zhang (22):
      drm/amdgpu: add nbio v4_3_0 ip headers v6
      drm/amdgpu: add osssys v6_0_0 ip headers v4
      drm/amdgpu: add hdp v6_0_0 ip headers v4
      drm/amdgpu: add smuio v13_0_6 ip headers v4
      drm/amdgpu: add smuio v13_0_6 support
      drm/amdgpu: init smuio v13_0_6 callbacks
      drm/amdgpu: support print psp v2_0 hdr debug information
      drm/amdgpu: add athub v3_0_0 ip headers v6
      drm/amdgpu: add mmhub v3_0_0 ip headers v6
      drm/amdgpu: add updated smu_info structures
      drm/amdgpu: query core refclk from bios for smu v13
      drm/amdgpu: add GC v11_0_0 family id
      drm/amdgpu: add soc21 chip enum header v8
      drm/amdgpu: add gfx11 clearstate header
      drm/amdgpu: add gfx11 mqd structures
      drm/amdgpu: add init support for GFX11 (v2)
      drm/amdgpu: enable GENERIC0_INT for gfx/compute pipes
      drm/amdgpu: add sdma v6_0_0 pkt header v3
      drm/amdgpu: add mmhub v3_0_2 ip headers
      drm/amdgpu: add mmhub v3_0_2 ip callback functions
      drm/amdgpu: split mmhub v3_0_2 callbacks from mmhub v3_0
      drm/amdgpu: add lsdma v6_0_0 ip headers

Huang Rui (18):
      drm/amdgpu: add nbio v7_7_0 ip headers
      drm/amdgpu: add hdp v5_2_1 ip headers
      drm/amdgpu: add mmhub support for MMHUB 3.0.1
      drm/amdgpu: add soc21 common ip block support for GC 11.0.1
      drm/amdgpu/discovery: enable soc21 common for GC 11.0.1
      drm/amdgpu: add gmc v11 support for GC 11.0.1
      drm/amdgpu/discovery: enable gmc v11 for GC 11.0.1
      drm/amdgpu/discovery: enable ih v6 for OSS 6.0.1
      drm/amdgpu: add sdma support for sdma 6.0.1
      drm/amdgpu/discovery: enable sdma v6 for SDMA 6.0.1
      drm/amdgpu: add GC 11.0.1 family id
      drm/amdgpu: set GC 11.0.1 family
      drm/amdgpu: add gfx support for GC 11.0.1
      drm/amdgpu: add GC v11.0.1 into mes v11
      drm/amdkfd: add GC 11.0.1 KFD support
      drm/amdgpu: enable imu firmware for GC 11.0.1
      drm/amdgpu/discovery: enable gfx v11 for GC 11.0.1
      drm/amdgpu/discovery: enable mes support for GC v11.0.1

Jack Xiao (77):
      drm/amdgpu: save the setting of VM_CONTEXT_CNTL
      drm/amdgpu: define MQD abstract layer for hw ip
      drm/amdgpu: add helper function to initialize mqd from ring v4
      drm/amdgpu: add the per-context meta data v3
      drm/amdgpu: add mes ctx data in amdgpu_ring
      drm/amdgpu: define ring structure to access rptr/wptr/fence
      drm/amdgpu: use ring structure to access rptr/wptr v2
      drm/amdgpu: initialize/finalize the ring for mes queue
      drm/amdgpu: assign the cpu/gpu address of fence from ring
      drm/amdgpu/gfx10: implement mqd functions of gfx/compute eng v2
      drm/amdgpu/gfx10: use per ctx CSA for ce metadata
      drm/amdgpu/gfx10: use per ctx CSA for de metadata
      drm/amdgpu/gfx10: associate mes queue id with fence v2
      drm/amdgpu/gfx10: inherit vmid from mqd
      drm/amdgpu/gfx10: use INVALIDATE_TLBS to invalidate TLBs v2
      drm/amdgpu/gmc10: skip emitting pasid mapping packet
      drm/amdgpu: use the whole doorbell space for mes
      drm/amdgpu: update mes process/gang/queue definitions
      drm/amdgpu: add mes_kiq module parameter v2
      drm/amdgpu: allocate doorbell index for mes kiq
      drm/amdgpu/mes: extend mes framework to support multiple mes pipes
      drm/amdgpu/gfx10: add mes queue fence handling
      drm/amdgpu/gfx10: add mes support for gfx ib test
      drm/amdgpu: don't use kiq to flush gpu tlb if mes enabled
      drm/amdgpu/sdma: use per-ctx sdma csa address for mes sdma queue
      drm/amdgpu/sdma5.2: initialize sdma mqd
      drm/amdgpu/sdma5.2: associate mes queue id with fence
      drm/amdgpu/sdma5.2: add mes queue fence handling
      drm/amdgpu/sdma5.2: add mes support for sdma ring test
      drm/amdgpu/sdma5.2: add mes support for sdma ib test
      drm/amdgpu/sdma5: initialize sdma mqd
      drm/amdgpu/sdma5: associate mes queue id with fence
      drm/amdgpu/sdma5: add mes queue fence handling
      drm/amdgpu/sdma5: add mes support for sdma ring test
      drm/amdgpu/sdma5: add mes support for sdma ib test
      drm/amdgpu/mes: add mes kiq callback
      drm/amdgpu: add mes kiq frontdoor loading support
      drm/amdgpu: enable mes kiq N-1 test on sienna cichlid
      drm/amdgpu/mes: manage mes doorbell allocation
      drm/amdgpu: add mes queue id mask v2
      drm/amdgpu/mes: initialize/finalize common mes structure v2
      drm/amdgpu/mes: relocate status_fence slot allocation
      drm/amdgpu/mes10.1: call general mes initialization
      drm/amdgpu/mes10.1: add delay after mes engine enable
      drm/amdgpu/mes10.1: implement the suspend/resume routine
      drm/amdgpu/mes: implement creating mes process v2
      drm/amdgpu/mes: implement destroying mes process
      drm/amdgpu/mes: implement adding mes gang
      drm/amdgpu/mes: implement removing mes gang
      drm/amdgpu/mes: implement suspending all gangs
      drm/amdgpu/mes: implement resuming all gangs
      drm/amdgpu/mes: initialize mqd from queue properties
      drm/amdgpu/mes: implement adding mes queue
      drm/amdgpu/mes: implement removing mes queue
      drm/amdgpu/mes: add helper function to convert ring to queue property
      drm/amdgpu/mes: add helper function to get the ctx meta data offset
      drm/amdgpu/mes: use ring for kernel queue submission
      drm/amdgpu/mes: implement removing mes ring
      drm/amdgpu/mes: add helper functions to alloc/free ctx metadata
      drm/amdgpu: skip kfd routines when mes enabled
      drm/amdgpu: skip some checking for mes queue ib submission
      drm/amdgpu: skip kiq ib tests if mes enabled
      drm/amdgpu: skip gds switch for mes queue
      drm/amdgpu: kiq takes charge of all queues
      drm/amdgpu/mes: map ctx metadata for mes self test
      drm/amdgpu/mes: create gang and queues for mes self test
      drm/amdgpu/mes: add ring/ib test for mes self test
      drm/amdgpu/mes: implement mes self test
      drm/amdgpu/mes10.1: add mes self test in late init
      drm/amdgpu/mes: fix vm csa update issue
      drm/amdgpu/mes: disable mes sdma queue test
      drm/amdgpu: add new CP_MES ucode ids
      drm/amdgpu: correct cp doorbell range
      drm/amdgpu: add mes unmap legacy queue routine
      drm/amdgpu/mes11: initiate mes v11 support
      drm/amdgpu/gfx10: enable kiq to map mes ring
      drm/amdgpu/gfx11: enable kiq to map mes ring

James Zhu (18):
      drm/amdgpu: move out asic specific definition from common header
      drm/amdgpu: add irq sources for vcn v4_0
      drm/amdgpu/jpeg: add jpeg support for VCN4_0_0
      drm/amdgpu/jpeg: enable JPEG PG and CG for VCN4_0_0
      drm/amdgpu/vcn: enable vcn4 dpg mode
      drm/amdgpu: add vcn_4_0_0 video codec query
      drm/amdgpu/discovery: add VCN 4.0 Support
      drm/amdgpu: add VCN4_0_4 firmware
      drm/amdgpu/jpeg: enable JPEG CG for VCN4_0_4
      drm/amdgpu/jpeg: enable JPEG PG for VCN4_0_4
      drm/amdgpu/vcn: enable VCN CG for VCN4_0_4
      drm/amdgpu/vcn: enable VCN PG for VCN4_0_4
      drm/amdgpu/vcn: enable VCN DPG mode for VCN4_0_4
      drm/amdgpu/discovery: enable vcn/jpeg v4_0_4
      drm/amdgpu/vcn: add common vcn sofware ring decode
      drm/amdgpu/vcn3: replace ip based software ring decode with common vcn software ring decode
      drm/amdgpu/vcn4: replace ip based software ring decode with common vcn software ring decode
      drm/amdgpu/vcn: include header for vcn_dec_sw_ring_emit_fence

Jimmy Kizito (1):
      drm/amd/display: Add Connection Manager boot option.

Josip Pavic (2):
      drm/amd/display: move definition of dc_flip_addrs struct
      drm/amd/display: do not wait for vblank during pipe programming

Kenneth Feng (23):
      drm/amd/pm: support power on/off vcn/jpeg in smu v13_0_7
      drm/amd/pm: add features to smu_v13_0_7
      drm/amd/pm: add mvdd and vddio scaling in smu_v13_0_7
      drm/amd/pm: enable link dpm and link ds on smu_v13_0_7
      drm/amd/pm: enable mp0,vcn,dcn dpm on smu_v13_0_7
      drm/amd/pm: enable fclk,vcn ds and df cstate for smu_v13_0_7
      drm/amd/pm: enable platform features for smu_v13_0_7
      drm/amd/pm: add SCPM support in smu v13_0_7
      drm/amd/pm: update the features for smu_v13_0_7
      drm/amd/pm: pp_dpm_* interface for smu_v13_0_7
      drm/amd/pm:add UMD Pstate clock settings for smu_v13_0_7
      drm/amd/pm: enable pp_dpm_vclk/dclk interface for smu_v13_0_7
      drm/amd/pm: port the fan interface to smu_v13_0_7
      drm/amd/pm: add the pg_flag for athub and mmhub pg on smu_v13_0_7
      drm/amd/soc21: enable mmhub and athub power gating
      drm/amd/pm: enable gfx ds for smu_v13_0_7
      drm/amd/pm: enable gfx pcc and soc cg on smu_v13_0_7
      drm/amd/pm: pp_dpm_sclk change for smu_v13_0_7
      drm/amd/pm: enable workload type change on smu_v13_0_7
      drm/amd/pm: change the soft pptable id for smu_v13_0_7
      drm/amd/pm: report preDS gfxclk on smu_v13_0_7
      drm/amd/pm: disable ac/dc on smu_v13_0_7
      drm/amd/pm: enable gfxoff control on smu_v13_0_7

Lee, Alvin (1):
      drm/amd/display: Make OPTC3 function accessible to other DCN

Leo Liu (4):
      drm/amdgpu: add vcn 4_0_0 header files v7
      drm/amdgpu: make software ring functions reuseable for newer VCN
      drm/amdgpu: add VCN4 ip block support
      drm/amdgpu: enable VCN4 PG and CG for VCN4_0_0

Likun Gao (47):
      drm/amdgpu/discovery: add soc21 common Support
      drm/amdgpu/discovery: add NBIO 4.3 Support
      drm/amd/smu: Increace dpm level count only for smu v13.0.2
      drm/amdgpu/discovery: add IH v6
      drm/amdgpu: add hdp version 6 functions
      drm/amdgpu/discovery: add HDP v6
      drm/amdgpu: extend PSP GFX FW type
      drm/amdgpu: add support for spl fw load on psp v13
      drm/amdgpu: support psp v13_0_0 microcode init
      drm/amdgpu: rework psp firmware name
      drm/amdgpu: add tracking for the enablement of SCPM
      drm/amdgpu/discovery: Enable PSP for PSP 13.0.0
      drm/amdgpu/discovery: add GMC 11.0 Support
      drm/amd/pm: fix NULL pointer issue of amdgpu_smu_stb_debug_fs_init
      drm/amd/smu: add smu v13_0 header files
      drm/amdgpu/discovery: Enable SMU for SMU 13.0.0
      drm/amdgpu/discovery: Set GC family for GC 11.0 IP
      drm/amdgpu: add gfx firmware header v2_0
      drm/amdgpu: support rlc v2_3 ucode struct
      drm/amdgpu: add rlc TOC header file for soc21 (v2)
      drm/amdgpu: add imu fw structure
      drm/amdgpu: add mes kiq PSP GFX FW type
      drm/amdgpu: support RLCP firmware front door load
      drm/amdgpu: support RLCV firmware front door load
      drm/amdgpu: support for new SDMA front door load
      drm/amdgpu: support IMU front door load
      drm/amdgpu: add convert for new gfx type
      drm/amdgpu: init SDMA v6 microcode with PSP load type
      drm/amdgpu: extend the show ucode name function
      drm/amdgpu/gfx: refine fw hdr check fuction
      drm/amdgpu: fix the fw size for sdma
      drm/amdgpu: renovate sdma fw struct
      drm/amdgpu: support RS64 CP fw front door load
      drm/amdgpu: support imu for gfx11
      drm/amdgpu/discovery: add GFX 11.0 Support
      drm/amdgpu: update rlc ram for gc v11_0_2
      drm/amdgpu: enable cgcg and cgls for GC 11_0_2
      drm/amd/pm: add get enable mask function for smu v13_0_7
      drm/amdgpu/psp: Add vbflash sysfs interface support
      drm/amdgpu: add sysfs to shows psp vbflash status
      drm/amdgpu: add lsdma block
      drm/amdgpu: support mem copy for LSDMA
      drm/amdgpu: support fill mem for LSDMA
      drm/amdgpu: add LSDMA block for LSDMA v6.0.0
      drm/amdgpu: add LSDMA block for LSDMA v6.0.2
      drm/amdgpu: support memory power gating for lsdma
      drm/amdgpu: support memory power gating for lsdma 6.0.2

Michael Strauss (1):
      drm/amd/display: Refactor LTTPR cap retrieval

Mike Lothian (3):
      drm/amdgpu/gfx11: Add missing break
      drm/amdgpu/gfx10: Avoid uninitialised variable 'index'
      drm/amdgpu/gfx11: Avoid uninitialised variable 'index'

Minghao Chi (4):
      drm/amdgpu: simplify the return expression of iceland_ih_hw_init
      drm/amdgpu: simplify the return expression of navi10_ih_hw_init()
      drm/amdgpu: simplify the return expression
      drm/amdgpu: simplify the return expression of vega10_ih_hw_init()

Mohammad Zafar Ziya (2):
      drm/amdgpu/jpeg: add jpeg ras poison consumption handling
      drm/amdgpu/vcn: Add vcn ras poison consumption event handling

Mukul Joshi (3):
      drm/amdgpu: Enable KFD with MES enabled
      drm/amdgpu/mes: Update the doorbell function signatures
      drm/amdkfd: Add KFD support for soc21 v3

Philip Yang (2):
      drm/amdgpu: Free user pages if kvmalloc_array fails
      drm/amdgpu: vm flush needed after updating PDEs

Richard Gong (1):
      drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems

Sonny Jiang (1):
      drm/amdgpu: Enable vcn v4_0_4 sram

Stanley Yang (3):
      drm/amdgpu: add soc21 ih clientid definition
      drm/amdgpu: add initial support for sdma v6.0
      drm/amdgpu/discovery: add SDMA v6_0 ip block

Stanley.Yang (2):
      drm/amdgpu: add nbio v4_3_0 ip block v2
      drm/amdgpu: add ih v6_0 ip block v2

Stylon Wang (1):
      Revert "drm/amd/display: Fix DCN3 B0 DP Alt Mapping"

Sung Joon Kim (1):
      drm/amd/display: Fix null pointer exception while load amdgpu

Tao Zhou (2):
      drm/amdgpu: enable RAS IH for poison consumption
      drm/amdgpu: refine RAS poison consumption handler

Tianci.Yin (4):
      drm/amdgpu: add athub v3_0 ip block
      drm/amdgpu: add gfxhub v3_0 ip block
      drm/amdgpu: add mmhub v3_0 ip block
      drm/amdgpu: add gmc v11_0 ip block (v3)

Tse, Kaitlyn (1):
      drm/amd/display: Remove outdated register for dcn3+

Wan Jiabing (1):
      drm/amdgpu: Remove duplicated argument in vcn_v4_0

Wenhui Sheng (1):
      drm/amdgpu: add irq src id for GFX11

Wenjing Liu (1):
      drm/amd/display: do not calculate DP2.0 SST payload when link is off

Xiaojian Du (8):
      drm/amdgpu: handle asics with 1 SDMA instance
      drm/amdgpu: skip the new gc doorbell function for some asics
      drm/amdgpu: add pcie port function helpers for SOC21
      drm/amdgpu: add the files of NBIO v7.7 block
      drm/admgpu/discovery: add NBIO v7.7 into the IP discovery list
      drm/amdgpu: add the files of HDP v5.2 block
      drm/amdgpu/discovery: add HDP v5.2.1 into the IP discovery list
      drm/amdgpu/discovery: add PSP v13.0.4 into the IP discovery list

Yang Li (2):
      drm/amdgpu/gfx11: remove unneeded semicolon
      drm/amdkfd: Return true/false (not 1/0) from bool functions

Yang Wang (1):
      drm/amd/pm: enable pmlog support for smu_v13_0_7

Yiqing Yao (1):
      drm/amdgpu: flush delete wq after wait fence

pengfuyuan (1):
      gpu/drm/radeon: Fix spelling typo in comments

 drivers/gpu/drm/amd/amdgpu/Makefile                |     35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |    625 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |      6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |     61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    115 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h            |     51 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |     18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |      6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.c          |     91 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.h          |     46 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   1227 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |    252 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes_ctx.h        |    121 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    631 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |     30 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |     47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    193 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |     22 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     45 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |    226 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |     45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |     23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |      6 +-
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c            |     98 +
 drivers/gpu/drm/amd/amdgpu/athub_v3_0.h            |     30 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |      8 +-
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h      |    988 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    448 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   6437 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |     62 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     80 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |     44 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |     51 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |      2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |      2 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |    511 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.h           |     29 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |      6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    973 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |     45 +
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.h              |     31 +
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |    142 +
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.h              |     31 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c            |      7 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    745 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.h               |     28 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    367 +
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |     20 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |      4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    609 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.c            |    121 +
 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.h            |     31 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c             |    630 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   1182 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |      2 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |      2 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c            |    661 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.h            |     28 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c          |    571 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.h          |     28 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |      7 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |    368 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h             |     32 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |    241 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.h             |     33 +
 drivers/gpu/drm/amd/amdgpu/nv.c                    |     13 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |     30 +
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |    114 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |      8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |     16 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |     28 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    169 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    171 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   1689 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h  |   5664 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |      4 +-
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.c         |     41 +
 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.h         |     30 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    111 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.c           |     86 +
 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.h           |     44 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |     15 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |     24 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |     96 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   1874 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h              |     29 +
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c             |      7 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |     17 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |      3 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |     82 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     38 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |    299 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |      5 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v11.c  |     81 +
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |     56 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |    384 +
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |     10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |    508 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |     13 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     19 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |     21 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |      3 +-
 drivers/gpu/drm/amd/amdkfd/soc15_int.h             |      3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |     46 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |      6 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |      6 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |      2 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |      6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |      2 -
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |      3 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |      4 -
 drivers/gpu/drm/amd/display/dc/Makefile            |      2 -
 .../amd/display/dc/bios/command_table_helper2.c    |      3 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |     41 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |      2 -
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |     15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |    181 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |      2 -
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     31 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     12 -
 drivers/gpu/drm/amd/display/dc/dc.h                |     51 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     19 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |      2 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |     15 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |     12 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c      |     10 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |     21 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |      2 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |     11 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |      1 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |      5 -
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h  |      2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |      6 -
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |      3 +-
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.c   |      2 -
 .../amd/display/dc/gpio/dcn30/hw_factory_dcn30.h   |      2 -
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.c |      2 -
 .../amd/display/dc/gpio/dcn30/hw_translate_dcn30.h |      2 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      4 -
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      4 -
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     17 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |      3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |      1 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |      3 +-
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.c   |      3 -
 .../amd/display/dc/irq/dcn30/irq_service_dcn30.h   |      3 -
 drivers/gpu/drm/amd/display/dc/irq/irq_service.c   |      5 -
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |      1 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |     36 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |      1 +
 .../drm/amd/display/include/link_service_types.h   |      6 +
 drivers/gpu/drm/amd/include/amd_shared.h           |      3 +
 .../include/asic_reg/athub/athub_3_0_0_offset.h    |    259 +
 .../include/asic_reg/athub/athub_3_0_0_sh_mask.h   |   1246 +
 .../amd/include/asic_reg/hdp/hdp_5_2_1_offset.h    |    217 +
 .../amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h   |    684 +
 .../amd/include/asic_reg/hdp/hdp_6_0_0_offset.h    |    209 +
 .../amd/include/asic_reg/hdp/hdp_6_0_0_sh_mask.h   |    646 +
 .../include/asic_reg/lsdma/lsdma_6_0_0_offset.h    |    391 +
 .../include/asic_reg/lsdma/lsdma_6_0_0_sh_mask.h   |   1439 +
 .../include/asic_reg/mmhub/mmhub_3_0_0_offset.h    |   1529 +
 .../include/asic_reg/mmhub/mmhub_3_0_0_sh_mask.h   |   7478 +
 .../include/asic_reg/mmhub/mmhub_3_0_2_offset.h    |   1425 +
 .../include/asic_reg/mmhub/mmhub_3_0_2_sh_mask.h   |   7228 +
 .../drm/amd/include/asic_reg/mp/mp_13_0_2_offset.h |     48 +
 .../amd/include/asic_reg/mp/mp_13_0_2_sh_mask.h    |     72 +
 .../amd/include/asic_reg/nbio/nbio_4_3_0_offset.h  |  17379 ++
 .../amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h |  82049 ++++++++++
 .../amd/include/asic_reg/nbio/nbio_7_7_0_offset.h  |  29654 ++++
 .../amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h | 154403 ++++++++++++++++++
 .../amd/include/asic_reg/oss/osssys_6_0_0_offset.h |    263 +
 .../include/asic_reg/oss/osssys_6_0_0_sh_mask.h    |    969 +
 .../include/asic_reg/smuio/smuio_13_0_6_offset.h   |    517 +
 .../include/asic_reg/smuio/smuio_13_0_6_sh_mask.h  |   1178 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_offset.h    |   1610 +
 .../amd/include/asic_reg/vcn/vcn_4_0_0_sh_mask.h   |   8055 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |    124 +
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h   |     77 +
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_2_0.h  |      4 +
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_4_0.h  |     41 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |      1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |      1 +
 .../gpu/drm/amd/{amdgpu => include}/mes_api_def.h  |    167 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    579 +
 drivers/gpu/drm/amd/include/soc15_hw_ip.h          |      1 +
 drivers/gpu/drm/amd/include/soc15_ih_clientid.h    |     27 +
 drivers/gpu/drm/amd/include/soc21_enum.h           |  22477 +++
 drivers/gpu/drm/amd/include/v11_structs.h          |   1189 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |     24 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h   |    203 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    128 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     18 +-
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   1544 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h |   1562 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h   |    141 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h   |    134 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |      2 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |     49 +-
 .../gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h |    200 +
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |     17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |      2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h |      8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |    590 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   1617 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h   |     28 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   1514 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h   |     28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     24 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |      2 +
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |      1 +
 drivers/gpu/drm/radeon/atombios.h                  |      6 +-
 drivers/video/fbdev/core/fbmem.c                   |     47 -
 include/linux/fb.h                                 |      1 -
 include/uapi/drm/amdgpu_drm.h                      |      2 +
 240 files changed, 382132 insertions(+), 1990 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_imu.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_lsdma.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mes_ctx.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/athub_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/clearstate_gfx11.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/ih_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/lsdma_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_2.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/smuio_v13_0_6.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_3_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/athub/athub_3_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_5_2_1_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_6_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/hdp/hdp_6_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_6_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/lsdma/lsdma_6_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_3_0_2_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_7_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_7_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_6_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/smuio/smuio_13_0_6_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/vcn/vcn_4_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_4_0.h
 rename drivers/gpu/drm/amd/{amdgpu => include}/mes_api_def.h (68%)
 create mode 100644 drivers/gpu/drm/amd/include/mes_v11_api_def.h
 create mode 100644 drivers/gpu/drm/amd/include/soc21_enum.h
 create mode 100644 drivers/gpu/drm/amd/include/v11_structs.h
 create mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_0_pptable.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0_7_pptable.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.h
