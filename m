Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F493FA014
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 21:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABD66E9B7;
	Fri, 27 Aug 2021 19:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F26E9B6;
 Fri, 27 Aug 2021 19:38:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA1Ql9ZJVmpntxioSsCeM6qs3zrYh3sNSpd3BXUrbiHciPfpmi2xVjKBmEWfOcuT6b+knGOyOkBk9/CZ/h3ywpAEQf021dPPwmzL7ORWanh1PHZBASwle6FaYQvUusgGdgK5baF1O2JSQe1RFF12tcrlmIB4P0EGIlVsJgFYbMXu6LtoAe7M6xfzBsDOhVg6XRlduo4O50enX/Lb3dR8jNsMhCocGRCFmcFnvc3uSv/cWI1iwtfPZCgeMIidNq8tMyufGgJM3PKe6ybX7tKdUDpd2QSJHHGa6ksutHeBtHCPLD8hVDnI/8piG/iK/Lfgohp6T5x7ovXkHhQKjaac8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvehxHQzaFQT7w+NeI0Q50eD+qaTQz3DxT93ME8aKzA=;
 b=nVppSBt8Ws3XZluaX4YhP0KrlOygOj0oGEgclhB5bTNP4hzr84rEN1ItLGzxUnocZe03oL2GUfDfVi7AeG+rqnlt2wvYT8IDoZD3YYumx6sa9aioPJkInvLdt8GQHoZV3gWpj8CyVeuYtunYP+dwdByKkHYwRz5mmrvC448Z2Pj66IL8ejSH2nu2QbYGIscMH6bXYv6Gal/7oZ7YfPoK6eFw7AfyzmhFHt/AcJy9jAOA7NpjVhvIYZh/rPXLdn4cSSpCxgKVz6Z7eNX0t104MUUFujxh4f23wWsPHG/mRWGZNppHsQPi3T0u9JhemNGiFYXRGtH6AQ1vL4Pu5ymiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvehxHQzaFQT7w+NeI0Q50eD+qaTQz3DxT93ME8aKzA=;
 b=iAvjHmZ8daBWTp05nwIW/CslMpKGxxNwMsgPBe0lXruA4et6sd8sfWjGehp8204yrihZrvyN1t9RI3lqxwJqvYLXn+9zv6AlHjOGMpjav/PUDK4s2jTSHwOsMxQFQQEpw9r9Oux6F7M/eceGbw7lCVwDQkvKnRPm3CXaqRZyLGE=
Received: from MWHPR14CA0065.namprd14.prod.outlook.com (2603:10b6:300:81::27)
 by BL0PR12MB4706.namprd12.prod.outlook.com (2603:10b6:208:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 19:23:49 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::1a) by MWHPR14CA0065.outlook.office365.com
 (2603:10b6:300:81::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 19:23:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 19:23:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 14:23:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-5.15
Date: Fri, 27 Aug 2021 15:23:36 -0400
Message-ID: <20210827192336.4649-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe280681-ca70-4170-255b-08d96990326d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4706:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4706BC02AF39E3B8718D4DECF7C89@BL0PR12MB4706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ya929svkZTU1O/ExNSHaCJvF5PwBxltS6XEPbjD+03p2pNBMQEN3Kk6vRgGGQeLoDtrZB95LyNJvw5hszxtZE3oj1qvXWKcf8FKSly4fjCioWaHu6V7xPQPmBBamvnO7rDOqTv5wFgeM8N0iBYe0/9xYw6pcnSRHSKr7AGd3VMNC/xcoqA3BVoRXF05ZH3tfZ3bWNTf49Oh+ENDJHvN5Yxx7/lJylGRzYi1NpkaOS0iVDw22B2KbYCVBZeg1W9ooChsUK+yj0iAH4WhLur3qpr0S4osA4pJbZNPfTfS8dubNpwn9nxwersbxdC1npNA9JFs3NVYUHG3Qc6anCUdPLJhD41r6z4z3YVs78QGUQNoxG1tiah/T4lxZ9JQAnTP7y+7+IJuIFJ/e9aTE3OQzRhZqfUEYX4CxyMm7wYSrXOrz1q+kLT1qhWImNqigPzIXczWljNllnAGMc3mA+RS3bcHa/bXDGBFJVD7F1Dban7o+PvD15Np0/2cq12xHEGQ3fQIaSU7TvCoS+gqLy86xSebNfpHlBRaWRpvhZ6uyfMVF6vzNxTvRmh2qqvl5oHlbQz+VQlMK2aDTsZ/MnL38Nfjx2P9h7zhOyg+UA1ImYVSKtnrhRS5ieGz4N1Nm8YvuU+bC4U464hVOupu1YjFPQWiQVGKcqMQTLxEX1Ylu0iyZpk7wnAqdYcXlTbVfVyh/qW28MKQSkt4wFRmj6KDoPjYyeVQrL4Ai4D8UjJDUw0U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(426003)(508600001)(70586007)(36860700001)(83380400001)(316002)(81166007)(47076005)(2906002)(110136005)(6666004)(8676002)(8936002)(4326008)(7696005)(82310400003)(336012)(26005)(36756003)(966005)(86362001)(16526019)(186003)(1076003)(356005)(70206006)(5660300002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 19:23:49.0287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe280681-ca70-4170-255b-08d96990326d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4706
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

Fixes for 5.15.

The following changes since commit 90a9266269eb9f71af1f323c33e1dca53527bd22:

  drm/amdgpu: Cancel delayed work when GFXOFF is disabled (2021-08-20 12:09:44 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.15-2021-08-27

for you to fetch changes up to 61d861cf478576d85d6032f864360a34b26084b1:

  drm/amd/display: Move AllowDRAMSelfRefreshOrDRAMClockChangeInVblank to bounding box (2021-08-26 13:57:33 -0400)

----------------------------------------------------------------
amd-drm-next-5.15-2021-08-27:

amdgpu:
- PLL fix for SI
- Misc code cleanups
- RAS fixes
- PSP cleanups
- Polaris UVD/VCE suspend fixes
- aldebaran fixes
- DCN3.x mclk fixes

amdkfd:
- CWSR fixes for arcturus and aldebaran
- SVM fixes

----------------------------------------------------------------
Aurabindo Pillai (2):
      drm/amd/display: Update number of DCN3 clock states
      drm/amd/display: Remove duplicate dml init

Borislav Petkov (1):
      drm/amdgpu: Fix build with missing pm_suspend_target_state module export

Candice Li (2):
      drm/amd/amdgpu: add name field back to ras_common_if
      drm/amd/amdgpu: consolidate PSP TA init shared buf functions

Christophe JAILLET (2):
      drm/amdgpu: switch from 'pci_' to 'dma_' API
      drm/radeon: switch from 'pci_' to 'dma_' API

Eric Yang (1):
      drm/amd/display: refactor riommu invalidation wa

Evan Quan (3):
      drm/amdgpu: add missing cleanups for Polaris12 UVD/VCE on suspend
      drm/amdgpu: add missing cleanups for more ASICs on UVD/VCE suspend
      drm/amdgpu: drop redundant cancel_delayed_work_sync call

Hawking Zhang (1):
      drm/amdgpu: disable GFX CGCG in aldebaran

Jerry (Fangzhi) Zuo (1):
      drm/amd/display: Update bounding box states (v2)

John Clements (4):
      drm/amdgpu: Add driver infrastructure for MCA RAS
      drm/amdgpu: Update RAS XGMI Error Query
      drm/amdgpu: Add support for RAS XGMI err query
      drm/amdgpu: Clear RAS interrupt status on aldebaran

Mukul Joshi (1):
      drm/amdkfd: CWSR with sw scheduler on Aldebaran and Arcturus

Nicholas Kazlauskas (1):
      drm/amd/display: Move AllowDRAMSelfRefreshOrDRAMClockChangeInVblank to bounding box

Philip Yang (2):
      drm/amdkfd: check access permisson to restore retry fault
      drm/amdkfd: map SVM range with correct access permission

Praful Swarnakar (1):
      drm/amd/display: Add Logging for HDMI color depth information

Sean Keely (1):
      drm/amdkfd: Account for SH/SE count when setting up cu masks.

Shashank Sharma (1):
      drm/amdgpu/OLAND: clip the ref divider max value

Yifan Zhang (1):
      drm/amdgpu: rename amdgpu_bo_get_preferred_pin_domain

 drivers/gpu/drm/amd/amdgpu/Makefile                |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  21 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            | 117 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |  72 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c            |  20 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            | 142 ++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  69 ++++++++-
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  19 ++-
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              | 125 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.h              |  26 ++++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |  34 ++++-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   2 -
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |  24 +++
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c              |  24 +++
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c              |  25 +++-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              |  24 +++
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  24 +++
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c              |  25 ++++
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |  23 +++
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |  23 +++
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  84 ++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 163 ++++++++++++++-------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   5 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |  11 ++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  49 +++++--
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  17 ---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   1 -
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   7 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |   4 +-
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |   1 -
 drivers/gpu/drm/radeon/radeon_device.c             |   6 +-
 53 files changed, 997 insertions(+), 258 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mca_v3_0.h
