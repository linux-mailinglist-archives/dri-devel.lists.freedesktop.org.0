Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD64814C2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 16:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF7410E1E3;
	Wed, 29 Dec 2021 15:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABE810E1E3;
 Wed, 29 Dec 2021 15:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko4uozdlpVTxA9yR5UNyyMZbZBI00n8xksEpfcKRIRM59zI00XEuPtxvsoiwPeCmpNDzLLjvLvwSGE+RDm+K6NLrSP/4It/jiIgsNKUwHolZtjs4oalW8zSLe7cox25oAB5CdyEB+fMQtT9bE1UN1BmOiHFgWaGJTXpwv0ABSxnuMhvqxkn0R/D3kHE3mbgZ0HCNNYOvJcI7gIdCdnjbyxy0Z5DF6eO/j/uWi2XWrVWOfsMba8vOLdG7+Zek/RrwVp51CGG1zH9T8ZqdS5fW5oyjMQti2TtfWLYnHTZlyHBv9DBNmo4R+0jrvmJBit3kOdlxC/LdEu9KE/bFmid7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu4FI4TCwTZUendgVwHeygETmnmX3PCQ+uVFTWkZUto=;
 b=MBCF7HZMvjyJPevX2FMC+10WMTX5ns81tqSOaCEevQLnQEVPx5RlR5L3SmhP83JZYEob8MmyNzx+W3ZWOdSteOqN+wmotTGs0LFCaz6XYUrbiOVqQhIvrf7ST6eqyCKMy/qWSu4Y1WAHR99vBvanGg+wk/CaTIk1k3r/cvlMD+sCkH0k8r76awO3thCNE58uSgQpJCrXU6nN4XyhWIGaYDXa6GRKIWJCGjjKo7LHJinbqgUfIV3DVhI5cKtcg1eySZBLlj9w4TljPb+LHmgQXelBG48Kk4pudMEf90M0skO/eBcLwh6PNCD0pMvlY3o0VLWsAQOh/cIn7UNKszFDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu4FI4TCwTZUendgVwHeygETmnmX3PCQ+uVFTWkZUto=;
 b=eBdVOg5ud8RwptwQqg5bzmwagZSx0/um/Dv4zc01rl/YOxRmPqN4POFoQNTcJegGUzt5HlEREc6Lff/YWOX1Hu/AZpK5nbqGoOZ2hGz92HfYoImVSvIedR5mUsn+xdcRtSbvbWVx7/FJw3QDEG9x9W9qWyETSG2mICmnEMrhQEk=
Received: from DM3PR14CA0140.namprd14.prod.outlook.com (2603:10b6:0:53::24) by
 MWHPR1201MB0112.namprd12.prod.outlook.com (2603:10b6:301:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 29 Dec
 2021 15:51:45 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::74) by DM3PR14CA0140.outlook.office365.com
 (2603:10b6:0:53::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13 via Frontend
 Transport; Wed, 29 Dec 2021 15:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4844.14 via Frontend Transport; Wed, 29 Dec 2021 15:51:44 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 09:51:43 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.16
Date: Wed, 29 Dec 2021 10:51:29 -0500
Message-ID: <20211229155129.5789-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5810497-4adf-4949-6430-08d9cae31d22
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0112:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB011245B9C1BDDE000A0A733FF7449@MWHPR1201MB0112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ssMI5vxm4dpR65tll9yTOh012V3meDBwyFG0Y6URoyVIxX0kdJ+3SoajCA1m76ZZWILBFL9XJDv/sFWA0BrgS/CFHd3IosKBUCsy9xHxYden6hLiGw18Y+GyNAUaVcm8h39oawMEed5lBnSsRpqsjqCIeSOiwuvRybaqpN2eJEPOm8lvUYz7t+RYi7+wxDHnqcz7VWpvc0M10M6z8CxVEvBeAwLbKWwwelaOJetS7iAn4kXbz8dpltNNa18OCWHZPlJBvXM9xQSPtQXey61t8to9sQgBEX8g2L3HfNr8xIdwPrxOpumq3IhiWo6GVaz/DlHv0ynXrPSv3BO9BSikNf7B34S6Iww6uW9OzTrayE2anMe1Ey3U1fYpGS6iTMkXmosy6sEV+bkGsitb7e7SzRew21wfJpvNrT26rlXZE8lIIhjfRYXItkLJE4WM/bUu9NA95021Mj1un0b4W0pe/t0aI2dBP0WqI3Lqx5rv0cdtFTYLbMsjpsoD/CHSlja1weseQDohcpTLKpg00X21ETZbEK0fLAtsveDLip3B0ogXc2O/0moe2Hfn1EGILtcvqDFTUTTmwxhd+FLvwklWYXuWADy1oqL/i4GZw30OAFt0OH3pcmzPoy91B++Ty59nC0dkYGvKcfjW+priYK4RHG5iEkAKr0zV8odLiSJUC8W+9xWQ3+R4d7GY+mln8PhcJ4JVy7t/afzQ7XMi9A0TjToZrra41sCXFa0VuQBR/0XzOxDAVHBF20Ni/eiRc/jEF14r1qbpvrk2kIvde9dbqrVUsn/6Hv1nWEVYiSvcwndGeaOqCmcBNMXdmBNehrFHsChAtIlkWPr9OujFphSwCgDINBRFCRKXbhyjE+34S43SkFStUwmzFnIb0TksHqde38zXrL5K1HCToQgtkD0bUhKhFskKl6MPdGVkeeDZEXw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(966005)(110136005)(86362001)(83380400001)(70586007)(70206006)(8676002)(82310400004)(1076003)(40460700001)(356005)(4326008)(81166007)(7696005)(2616005)(8936002)(2906002)(508600001)(36756003)(316002)(36860700001)(47076005)(336012)(26005)(4001150100001)(186003)(16526019)(6666004)(426003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 15:51:44.3722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5810497-4adf-4949-6430-08d9cae31d22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0112
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

Fixes for 5.16.  A little bigger than usual since it's two weeks worth of
fixes.  We have a fix for the runtime pm regression with efifb, but we
are currently testing some less invasive changes.  See:
https://gitlab.freedesktop.org/drm/amd/-/issues/1840
https://bugzilla.kernel.org/show_bug.cgi?id=215203
Look out for another PR in the next few days with a fix for that.  The
current fix involves a change to fbmem.c.  It would be nice to get an
A-b or R-b on that if the newer fix doesn't work out.
https://patchwork.kernel.org/project/dri-devel/list/?series=601558

The following changes since commit a2fbfd517117157e99160ff1b39b171872dcba07:

  Merge tag 'amd-drm-fixes-5.16-2021-12-15' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2021-12-17 15:01:01 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-12-29

for you to fetch changes up to ee2698cf79cc759a397c61086c758d4cc85938bf:

  drm/amd/display: Changed pipe split policy to allow for multi-display pipe split (2021-12-28 17:02:31 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-12-29:

amdgpu:
- Fencing fix
- XGMI fix
- VCN regression fix
- IP discovery regression fixes
- Fix runpm documentation
- Suspend/resume fixes
- Yellow Carp display fixes
- MCLK power management fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: add support for IP discovery gc_info table v2
      drm/amdgpu: fix runpm documentation
      drm/amdgpu: always reset the asic in suspend (v2)
      drm/amdgpu: no DC support for headless chips

Angus Wang (1):
      drm/amd/display: Changed pipe split policy to allow for multi-display pipe split

Charlene Liu (1):
      drm/amd/display: fix B0 TMDS deepcolor no dislay issue

Evan Quan (1):
      drm/amdgpu: put SMU into proper state on runpm suspending for BOCO capable platform

Huang Rui (1):
      drm/amdgpu: introduce new amdgpu_fence object to indicate the job embedded fence

Lai, Derek (1):
      drm/amd/display: Added power down for DCN10

Lijo Lazar (1):
      drm/amd/pm: Fix xgmi link control on aldebaran

Nicholas Kazlauskas (3):
      drm/amd/display: Send s0i2_rdy in stream_count == 0 optimization
      drm/amd/display: Set optimize_pwr_state for DCN31
      drm/amd/display: Fix USB4 null pointer dereference in update_psp_stream_config

Prike Liang (1):
      drm/amd/pm: skip setting gfx cgpg in the s0ix suspend-resume

chen gong (1):
      drm/amdgpu: When the VCN(1.0) block is suspended, powergating is explicitly enabled

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  17 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  76 +++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  27 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 126 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   7 ++
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   2 +-
 .../drm/amd/display/dc/dcn201/dcn201_resource.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |   2 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   2 +-
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  27 ++++-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |  31 +++++
 drivers/gpu/drm/amd/include/discovery.h            |  49 ++++++++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   2 +-
 23 files changed, 300 insertions(+), 98 deletions(-)
