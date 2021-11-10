Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F066A44CCA8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 23:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50C56E456;
	Wed, 10 Nov 2021 22:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0DE6E456;
 Wed, 10 Nov 2021 22:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1wW+GBL1oLWp+zoqEflXetw886fd3rxho7oy9efoMhYalpQmgLuklQJM7Bz1oYY6tiaH6m9oTP1mirBMDhg39/KHCHLqozRok1xeFLYqi3wRVksQ/GlSccRzsa8ZUJH6BU3qggrn/FudjQgHmsvEGllIWnVNEu1Cx43JMJmUxz8hSO6ehl2Z8nZvSm56ImuTEu9N472m8mvG1ayT67k432Cviinr8/1ZnVHtzNJGqRB9231PCtYvRTKQw8088c6jJiiP7Rwwl5c26xyNHQytjDq7NyuP2m1HNF/U2BDWpNWYt00UhHzo5HC1QKgm0bY7XoVXbd2PR8W1h3igFxHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBu3z4wpdY3FG2DkMO9+SxK54X0WTKtcburXizcpPC8=;
 b=STXqnrMzl/NALiPG40U7ILFrIGaX7TKw+pBcmuFUK1B4KfBq+t1Ttl7K60ZQxLDv/UM9F+nvlcVAx7IrmNzasD4PLUYqkn0eO1EF1wfo9o+hCU1egqzYBlvYpeBHxRVv0AxDgzAo91f8KMvDZAMrXcRoDUsn5nyeNrM7EHPHP1m1vjdX2E1nYSpwfrChVpg+LVBLj4hwfjNQ30sMo6CHeCxRxUAPbBEnipGdBDVgjNABalVGfG7za4sdeWWtheGg18g437TNrZUkGjRw0YhQE85fJc0Y2zn0yVohB6mW02JeUMYRY4g3SVEAeFFh+Jmps0vItpKwl7I8+3TaBOvmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBu3z4wpdY3FG2DkMO9+SxK54X0WTKtcburXizcpPC8=;
 b=CHdnKHQeoTM9uv3R+YNZDJMrIFw461G6UtvmqSRM+ZgXha+8KHv4/Er423J/VVlUvq/gIHeMffrUNzfc10h+BbnKiRPX68Ath1a2nTLNYFDXyMpsrWgtpJ9xVLVOdg08LlxZ5JuWZ8OCmMlucuZTbBfqQ1WEKfTOt/fNwfESa1g=
Received: from BN9PR03CA0288.namprd03.prod.outlook.com (2603:10b6:408:f5::23)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 22:25:52 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::4c) by BN9PR03CA0288.outlook.office365.com
 (2603:10b6:408:f5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 10 Nov 2021 22:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 22:25:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 10 Nov
 2021 16:25:48 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.16
Date: Wed, 10 Nov 2021 17:25:36 -0500
Message-ID: <20211110222536.7527-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fb72718-f358-4191-bfc3-08d9a4990dec
X-MS-TrafficTypeDiagnostic: BY5PR12MB4305:
X-Microsoft-Antispam-PRVS: <BY5PR12MB43052454178E2AD1C29283ADF7939@BY5PR12MB4305.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SbYx9Jh9SHh/Ds+0aZY1FOLbGvlkn4RhOyYZMtiVLgchP1z1IpTJf7xWC4F3AKmXLy3+In0heHpd5R8ID389HUK4zP16uoVWImfInEYl5W1Vpj70AC8FFmM8DTueHkZdAegKeSs8qaF9kmZnPiPq4W1Kc1PKt/sOHiXQI5NuzshoNuIszCG5/e9SZ9ZbsXnyH58H3vNu4WlZWFy01ROptRFv2NdRCQ6Acs7J6NoPOgFxDvqYKrqey9hR98C8pQSPbZRNVHYieKut7nn1/xAjJ3eQ2iqQ0/Oo2VSsG3rWSYJnjt2N/Ol0s8ccoOu5YpYjVsB0bQYmt7MN7LBVs9BrPpKI4mr++Ru9xquhGMh1yGArnRtQyC2d02X/ycuGW0qVYjUHJxH/s5xPoOgAm3jEbpYOTUckSDDBf00SFqEpcoG5gQKvg1+aQDrDnO3LiS2zb0/kZD8DB8Gm98q31xT6bjBLSEQe846luDqSUXajTlC5GaUyZoyZtB01dl6IwBpuVaYzbYt6HhBXT4sSa9f5CljE3vV1X8WFgrOM4auQS3BDr7wCLoQKXudf0BcW67faU+dqa2BfZwf5bJNiqPN0+XA+8/57c1Fc1CIXaRI03BZ9Vvg+k4v8/IEqIl7ZgQovwDrZw6pXfF6Y6hWri+O5jji1TVr/4qTPv4OkCjM5c/W/f6YRPmQeK5d3pqNnHETxunUyX+eHz90YZhvYAFgzJKSWNBVv+A1ptVutudDD0o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(336012)(7696005)(1076003)(356005)(186003)(70586007)(8676002)(70206006)(47076005)(26005)(2616005)(8936002)(426003)(36756003)(508600001)(110136005)(4326008)(81166007)(83380400001)(6666004)(82310400003)(2906002)(4001150100001)(16526019)(966005)(36860700001)(316002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 22:25:51.9757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb72718-f358-4191-bfc3-08d9a4990dec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305
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

Fixes for 5.16.

The following changes since commit 78469728809b8604dc37ae4e6b12ae12decac5be:

  drm/amd/display: 3.2.160 (2021-11-03 12:32:34 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-11-10

for you to fetch changes up to 4d395f938ae3515f61d8128a0569bf48ca7e0edf:

  drm/amdgpu: add missed support for UVD IP_VERSION(3, 0, 64) (2021-11-10 12:03:41 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-11-10:

amdgpu:
- Don't allow partial copy from user for DC debugfs
- SRIOV fixes
- GFX9 CSB pin count fix
- Various IP version check fixes
- DP 2.0 fixes
- Limit DCN1 MPO fix to DCN1

amdkfd:
- SVM fixes
- Reset fixes

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/powerplay: fix sysfs_emit/sysfs_emit_at handling
      drm/amdgpu: fix SI handling in amdgpu_device_asic_has_dc_support()

Alex Sierra (2):
      drm/amdkfd: avoid recursive lock in migrations back to RAM
      drm/amdkfd: lower the VAs base offset to 8KB

Anson Jacob (1):
      drm/amd/display: Add comment where CONFIG_DRM_AMD_DC_DCN macro ends

Evan Quan (2):
      drm/amdgpu: correctly toggle gfx on/off around RLC_SPM_* register access
      drm/amdgpu: fix uvd crash on Polaris12 during driver unloading

Felix Kuehling (2):
      drm/amdgpu: Fix dangling kfd_bo pointer for shared BOs
      drm/amdkfd: Fix retry fault drain race conditions

Guchun Chen (2):
      drm/amdgpu: drop jpeg IP initialization in SRIOV case
      drm/amdgpu: add missed support for UVD IP_VERSION(3, 0, 64)

Harry Wentland (1):
      drm/amd/display: Don't allow partial copy_from_user

Kent Russell (1):
      drm/amdgpu: Make sure to reserve BOs before adding or removing

Mario Limonciello (1):
      drm/amd/pm: Correct DPMS disable IP version check

Nicholas Kazlauskas (2):
      drm/amd/display: Don't lock connection_mutex for DMUB HPD
      drm/amd/display: Add callbacks for DMUB HPD IRQ notifications

Shirish S (2):
      drm/amd/display: fix exit from amdgpu_dm_atomic_check() abruptly
      drm/amd/display: reject both non-zero src_x and src_y only for DCN1x

Tao Zhou (1):
      drm/amdgpu: correct xgmi ras error count reset

YuBiao Wang (2):
      drm/amd/amdgpu: Avoid writing GMC registers under sriov in gmc9
      drm/amd/amdgpu: Fix csb.bo pin_count leak on gfx 9

shaoyunl (2):
      drm/amd/amdkfd: Don't sent command to HWS on kfd reset
      drm/amd/amdgpu: fix the kfd pre_reset sequence in sriov

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 25 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 17 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  5 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |  4 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  4 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  8 +++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |  4 ++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c              | 24 +++++-----
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  5 +++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |  2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  6 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               | 26 ++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 51 +++++++++++++---------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 10 ++---
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  6 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |  8 +++-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    | 10 +++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |  2 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h    | 13 ++++++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 12 +++--
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |  4 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  | 14 ++++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  2 +-
 32 files changed, 205 insertions(+), 79 deletions(-)
