Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A24E7A3D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 19:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752010E904;
	Fri, 25 Mar 2022 18:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8E10E904;
 Fri, 25 Mar 2022 18:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb3/pFMLoIj6M/wRjtwn1W4g/fhEaQExlqS9iZh8mc27Ev6ZtC6+3lTShgItNf/yYt1QBhEsf4SqtHOPzFtnlnbK2GVzury3imuUyqWcbCgn8Ri7hTLxCetJhzCNzpOei7oEC/bMB3syXpF7mf+WdYJyrvv1wSN6fO5y1+grflsqQF47QJH6dTr4XMKBFrGsGUdiZB67xCIIB5G9XpkCIPUpt/L2tTaY/PjQ07uvrXHryb4yMB0kV/plPMRBY+JTnv/4I7VznDV5sSy71qHfv6xecaKbE3/Im88qu+4OrfcnQBwGYfHbiyK/bMTBQgfJBiX/7QB4nwodCdEm02lMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JinJHxX+b4e0b5dRoNA5j8dBdTOiFDJbt0elBWFc9SY=;
 b=Wev19GzYSLB8hWN6xZEA/BwjF6itTBz162dPdv2RL6U0XxKd9l/fwdiD9so44tFVxpr8XEXGUfZQuT99KDc9KAIHrXwGFi14RaGm54Jev5XqxNI8HhEBirgRM5fsx0lvJSrVnHbSRiVvsAilN2vbZST/Pi0T/oByWDFrOiRpb9gN7P/MgG3xH4PAWUe5jQxEKPg9x6OA3gFE7BK8OFXT7A8R4UxvUVIpltjZMqx5lwoL2N97wlW8Vr47xj/qL3Y08kxJs/xRqn6NME2REvSNPZw+2V42a1tlLgasyrQSvFtUBZPdwxWxIndT61nj6YF67Pf1O8MYEBH5vf/Z4Q8Z3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JinJHxX+b4e0b5dRoNA5j8dBdTOiFDJbt0elBWFc9SY=;
 b=oadv5ScbtvETf2EppmnmiAVp5SKcT3qHScZvBR6ZVKH3hPNNCTFAvoRyQt1JgC18RRx3ZAodVVQoaEIFUFByrXTuMt9oIzoe1ttMNDUJ0L4OZdQuxqdX1wtEknHOUX+6yfTpQBI77CWg+tJD8JFu2hNybNegzsXfubgDZbVD6zo=
Received: from MW4PR03CA0167.namprd03.prod.outlook.com (2603:10b6:303:8d::22)
 by CY4PR12MB1813.namprd12.prod.outlook.com (2603:10b6:903:124::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Fri, 25 Mar
 2022 18:36:22 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::da) by MW4PR03CA0167.outlook.office365.com
 (2603:10b6:303:8d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16 via Frontend
 Transport; Fri, 25 Mar 2022 18:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 18:36:21 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 13:36:19 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.18
Date: Fri, 25 Mar 2022 14:36:02 -0400
Message-ID: <20220325183602.5718-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 306aeff0-b1a6-47b2-6db6-08da0e8e5be2
X-MS-TrafficTypeDiagnostic: CY4PR12MB1813:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1813CAA2CEE0BE868C4DBFC2F71A9@CY4PR12MB1813.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEbI2Aw4XFlyIbYFWh8VkQyHiILIAl0FoUxOtWtQ9pwFUd4Zp33yCOsu1Xmk+49LsYJ11PV4q2vA5xaQ72EsKS53mDTIXiEj03ZO7evM1LXYRoaVUGqWgU6BdYphTmw6rb8m1LHQv7zoy238Rqn3jY0IU07Oa7PMieMsVdjS7RcMaLoBhaX1nKGGUaH1y9lyH+Fa2tsOyxyjYWPoKcunHqn7CJiDySSGieUdLKformjgGHKB6pm1hKvzq8tQIADS2I3I5U9AyGkW6OIkmV0URjetKCClWZjEKsfE55vtrpuFcfXc+KjTnuwwPzOrUMcvTVSb7/q6/H3nPwTJe5Y9yVV+ESuwCeOZWw2OWV4uBvKqjbSzA87gFTnsqcsW5G8FFtw4olAjFL6bbtyw2v5uoLvd1cEOzQv2CxcoXEq1Tbt0m+d0SFSvujVqOUs6vd6/c32ZJRZBu2F/0j3tk1jIMaADPIckQEgfGIIvvbPQi31GAF75II1t9Ju11gFVVM0FDCv1D7WDYBPkZgcJTJ//IGDK4BGi8ePAGEUem261DUi73zyNYqJ3s92qNo407D0bZNRBxdEIDaFq2Bj4g8RXEIwWoA66EiB0v+5E1hwF7gSzOWaTZcsZ5KUUM4ijmKaOcGQ/MdxMNwFfBcFke1Sg+p3xk+IBU1nVakAl3KG2Y18Ath/sMAmJQ3O64wQiLYT5ArHUKVx+EEj419C9PUSxUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(70206006)(8676002)(47076005)(110136005)(2906002)(508600001)(316002)(81166007)(966005)(36860700001)(356005)(16526019)(36756003)(426003)(86362001)(336012)(186003)(4326008)(82310400004)(7696005)(70586007)(83380400001)(6666004)(8936002)(5660300002)(2616005)(1076003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 18:36:21.4182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306aeff0-b1a6-47b2-6db6-08da0e8e5be2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1813
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

Fixes for 5.18.

The following changes since commit c6e90a1c660874736bd09c1fec6312b4b4c2ff7b:

  Merge tag 'amd-drm-next-5.18-2022-03-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-21 13:48:20 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-03-25

for you to fetch changes up to 15f9cd4334c83716fa32647652a609e3ba6c998d:

  drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function (2022-03-25 12:40:25 -0400)

----------------------------------------------------------------
amd-drm-next-5.18-2022-03-25:

amdgpu:
- GFX 10.3.7 fixes
- noretry updates
- VCN fixes
- TMDS fix
- zstate fix for freesync video
- DCN 3.1.5 fix
- Display stack size fix
- Audio fix
- DCN 3.1 pstate fix
- TMZ VCN fix
- APU passthrough fix
- Misc other fixes

amdkfd:
- Error handling fix
- xgmi p2p fix
- HWS VMIDs fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/gmc: use PCI BARs for APUs in passthrough
      drm/amdgpu: add more cases to noretry=1

Aurabindo Pillai (1):
      drm/amd: Add USBC connector ID

Charlene Liu (2):
      drm/amd/display: fix audio format not updated after edid updated
      drm/amd/display: remove destructive verify link for TMDS

Chiawen Huang (1):
      drm/amd/display: FEC check in timing validation

Dan Carpenter (1):
      drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()

Divya Shikre (1):
      drm/amdkfd: Check use_xgmi_p2p before reporting hive_id

Emily Deng (1):
      drm/amdgpu/vcn: Fix the register setting for vcn1

Felix Kuehling (1):
      drm/amdgpu: set noretry=1 for GFX 10.3.4

Gabe Teeger (1):
      drm/amd/display: Add support for zstate during extended vblank

Guchun Chen (2):
      drm/amdgpu: prevent memory wipe in suspend/shutdown stage
      drm/amdgpu: conduct a proper cleanup of PDB bo

Lang Yu (1):
      drm/amdgpu: add workarounds for VCN TMZ issue on CHIP_RAVEN

Leo (Hanghong) Ma (1):
      drm/amd/display: Update VTEM Infopacket definition

Nicholas Kazlauskas (1):
      drm/amd/display: Fix p-state allow debug index on dcn31

Oliver Logush (1):
      drm/amd/display: Add fSMC_MSG_SetDtbClk support

Prike Liang (2):
      drm/amdgpu: set noretry for gfx 10.3.7
      drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function

QintaoShen (1):
      drm/amdkfd: Check for potential null return of kmalloc_array()

Rodrigo Siqueira (1):
      drm/amd/display: Reduce stack size

Stanley.Yang (1):
      drm/amdgpu/pm: add asic smu support check

Tianci Yin (1):
      drm/amdgpu/vcn: improve vcn dpg stop procedure

Tushar Patel (1):
      drm/amdkfd: Fix Incorrect VMIDs passed to HWS

Yifan Zhang (2):
      drm/amdgpu/pm: fix the Stable pstate Test in amdgpu_test
      drm/amdgpu: set noretry=1 for gc 10.3.6

 drivers/gpu/drm/amd/amdgpu/ObjectID.h              |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  6 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  5 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              | 71 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  7 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            | 14 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  2 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c | 19 ++++--
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h |  4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 23 +++++++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  4 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  6 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  2 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  8 ++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 12 ++++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |  2 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c  |  8 +++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  1 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 18 +++++-
 .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  | 13 ++++
 .../drm/amd/display/dc/dml/display_mode_structs.h  |  2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |  3 +
 .../amd/display/modules/info_packet/info_packet.c  |  5 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  6 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |  2 +-
 34 files changed, 229 insertions(+), 39 deletions(-)
