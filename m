Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3242DA2A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 15:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2924F6E51C;
	Thu, 14 Oct 2021 13:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A926E51C;
 Thu, 14 Oct 2021 13:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmOaHte+nVihAjIIixxLL6r2wXvoTuSmccty6CEBkc3SiI2neg3qk5kkZdjY1+HoeU/IQIbKDZdv/m1T9QP0nBmJqlxb95zMgWbtsdKV7nd/NRkkzd32DNYv+TH43PiHS8QL2dRXBJf2OQ2t5FzYFqE4RVv6H+Rk8Ymm9mmVf0YPFDiVq06WzrPHmokeD1sWLKKXnqoHlECIvGyWeAItTmjUHuAHZri6I+u26B06d7OEn0kTY/P0eAoSikA30JRLniA4sFIEKbdhqAbApwqtnsHnvApxbhDNzjAi6EPBjFEmwvXo64TMMnntDswIn6p3TJDGUQy5pVQ/pFwsHAHbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UTuxW8BoD/xoh7OdXbXGzxyDOZ6uTzHrJefwOqqiVE=;
 b=nBkH+dgirrc+a4MtJlX/hLPNHSeMOdGAV1maqlIPiJACWAMET4RIURci1yKzA/VQEknl/wAeS9/iDV0DZRjI9OEOHDDVe8a+ynt9TLSOjLqU8+3FzDmhilemjlCurFr59LGGSg3OsQjnHXdN+9k7ZR9T8qBGtN+3vjvlV5PzcTK2B7d3l0JFkP2Rxi7ba4MpCLdg05tBxv7TfPuAvO9wtJgdjWxvklmU4gUizG/+zK8qyovwm1RA8sBYs0HZsPi0F1lWpupLre4KPoqmxLfX1PlBX92yUnXybpKFrzvDxvxlbm1l1snT5WRobovjvOnxsf/UXmaOQJ7/8aD8wMJg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UTuxW8BoD/xoh7OdXbXGzxyDOZ6uTzHrJefwOqqiVE=;
 b=aQllsyTzT7Betnu06ueCM4E5pBuKv40XMYSMefwZFJHZ3/6trdioxxVxRVBngX2UUoiSF+A6IDtQ6Kq37lo10pkKKeimEt58+9wvwIYt1ag1amPdDY1PPColUWWYsACoCd49CcjHJPY/TtJgQG9HMIcnNaBWrUlAldUg/CdWZrg=
Received: from BN9PR03CA0154.namprd03.prod.outlook.com (2603:10b6:408:f4::9)
 by SN6PR12MB2800.namprd12.prod.outlook.com (2603:10b6:805:6c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Thu, 14 Oct
 2021 13:20:58 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::21) by BN9PR03CA0154.outlook.office365.com
 (2603:10b6:408:f4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 13:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 13:20:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 08:20:56 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.16
Date: Thu, 14 Oct 2021 09:20:36 -0400
Message-ID: <20211014132036.4846-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e676ca76-02a1-463d-954c-08d98f157582
X-MS-TrafficTypeDiagnostic: SN6PR12MB2800:
X-Microsoft-Antispam-PRVS: <SN6PR12MB280023A2F34099F90A03AB28F7B89@SN6PR12MB2800.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: swyrE3rnFUDaxs8c0kPLdG3NJ32ephgYLWGW8M5/03foRC38RTQqxdrFVe6RSxgJuJMizwvhGl3564q6l4UdpShNxLKkcsCv8AQqzy7afSxEVxyqrJsGaP1VFBeeXcUIp8+Xi5JV8rx2iIrcZLlsNH49Cu2voh1iGbBhGcw8Uvksx+KLpUln7iaLbHI5UxGqgrefa7RBBkjQXO1A/WqvqSDVfIAoe5cdaOxSWFSZUVtFdfHD/QxBwF0TgQKGWKnkjQBFv6RTb1fSVuqNfHn1dYb4v8u1fwK4Mt4P1vAZMJOdjf1BSDQt3Tlq1O2xk+FnVsthVaRQPMBlDWFe0vx9FatiUpxkv4hOPKL5lH4VvD5GOLSr8D0ZjhUlko9dxoB1xrLv/6henYK1h4sH3Wv5Y7R4HOq/5JZpVpEZVEDnBVLQcHtyQd7k9u8QPMq5S/2Wxd6AtvSNSdY7j105xBVOc9QN84zoMoHZmh7VRUy7UoQ1YlTxkxWueQirMFMbmJgakqdGpc8hsD3ih6quVQWc/QZxGNMwHGCd223r6sqLlpKbQNT2PEWk0ZvLQChgj54Fg3vIBNJVh/Rm6ZqLqCY9CnAkW1NDRI26VJdHHfGOCviHl76EhR9iXVSYsv4i4zPbj5/LBeBHUh9z4rWu9kIxqaBqvgJdkK/oLwVSXOubDPhSSg61S5wzPG2bz9RLFB0mIG2gwVVjB8zWCtM/5HYMi2uMZCN1pP0jc2A32XbDsec=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(4001150100001)(2616005)(8676002)(508600001)(36860700001)(81166007)(70586007)(70206006)(356005)(1076003)(36756003)(6666004)(186003)(16526019)(83380400001)(8936002)(5660300002)(966005)(426003)(26005)(7696005)(336012)(2906002)(4326008)(47076005)(110136005)(82310400003)(86362001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:20:57.7793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e676ca76-02a1-463d-954c-08d98f157582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2800
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

Bug fixes for 5.16.

The following changes since commit 1176d15f0f6e556d54ced510ac4a91694960332b:

  Merge tag 'drm-intel-gt-next-2021-10-08' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-10-11 18:09:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.16-2021-10-14

for you to fetch changes up to 48737ac4d70faffeb516e2a9847e24f9a7eee05f:

  drm/amdgpu/psp: add some missing cases to psp_check_pmfw_centralized_cstate_management (2021-10-13 22:51:41 -0400)

----------------------------------------------------------------
amd-drm-next-5.16-2021-10-14:

amdgpu:
- Cyan Skillfish fixes
- HDP flush fixes for asics with more than 2 SDMA instances
- IP discovery enumeration fixes
- Display fixes
- RAS fixes for Aldebaran
- Power limit fixes
- IOMMU fixes for Raven
- Fix potential out of bounds write in debugfs

amdkfd:
- SVM fixes

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu/nbio7.4: don't use GPU_HDP_FLUSH bit 12
      drm/amdgpu/nbio2.3: don't use GPU_HDP_FLUSH bit 12
      drm/amdgpu/smu11: fix firmware version check for vangogh
      drm/amdgpu/swsmu: fix is_support_sw_smu() for VEGA20
      drm/amdgpu/psp: add some missing cases to psp_check_pmfw_centralized_cstate_management

Alex Sierra (2):
      drm/amdkfd: avoid conflicting address mappings
      amd/amdkfd: remove svms declaration to avoid werror

Aurabindo Pillai (1):
      drm/amd/display: fix null pointer deref when plugging in display

Darren Powell (2):
      amdgpu/pm: (v2) add limit_type to (pptable_funcs)->set_power_limit signature
      drm/amd/pm: Fix incorrect power limit readback in smu11 if POWER_SOURCE_DC

Harry Wentland (1):
      MAINTAINERS: Add Siqueira for AMD DC

Lang Yu (2):
      drm/amdgpu: query default sclk from smu for cyan_skillfish
      drm/amdgpu: enable display for cyan skillfish

Mukul Joshi (2):
      drm/amdgpu: Enable RAS error injection after mode2 reset on Aldebaran
      drm/amdgpu: Fix RAS page retirement with mode2 reset on Aldebaran

Nicholas Kazlauskas (2):
      drm/amd/display: Enable PSR by default on newer DCN
      drm/amd/display: Fix surface optimization regression on Carrizo

Philip Yang (3):
      drm/amdkfd: ratelimited svm debug messages
      drm/amdkfd: handle svm partial migration cpages 0
      drm/amdkfd: unregistered svm range not overlap with TTM range

Simon Ser (1):
      amd/display: check cursor plane matches underlying plane

Thelford Williams (1):
      drm/amdgpu: fix out of bounds write

Yifan Zhang (4):
      drm/amdkfd: export svm_range_list_lock_and_flush_work
      drm/amdkfd: fix KFDSVMRangeTest.PartialUnmapSysMemTest fails
      drm/amdkfd: fix boot failure when iommu is disabled in Picasso.
      drm/amdkfd: fix resume error when iommu disabled in Picasso

 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  33 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |  31 ++++
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  21 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  17 ++
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           | 120 +++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 185 ++++++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  66 ++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  15 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   3 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   5 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   4 +-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   4 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   9 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  20 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  11 +-
 30 files changed, 458 insertions(+), 152 deletions(-)
