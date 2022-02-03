Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2004A80F9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A2410E9FD;
	Thu,  3 Feb 2022 09:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6838110E9F6;
 Thu,  3 Feb 2022 09:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkfNzibqPsyWgkHntM+IGv+ZvmN5bgzf3GKhMmEFmLG7D2qbA3AWtFI8+gTZ1GIGucaWO1Mc/vfmrdLhFEzeoQX7BkD77sd5foFxggr6WTTApfOgn/wGOtU65jTZLElcmEgT+yWzvwXGy/xip7ZQDquGDYyJtAPOEKrCymXkW2Rl74xG2Cf6MlktrjzVOk9kBnXdW/b40Pt3Tvg6lRAVC9IOIHjZ9Kz6qIZ7AHjAVFCrxvf/qJ9IW58GlctN05UWhLBoIWv4fEQ+7lcP8pyaoJwXxLVoSJ44B86+E+VwwJUFs5m3YHRgXphdYFMT8MbciMPftjmfCOeACJ6oZKUf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzPSa7pUHUNE+lBQY8DejctL89jWJmjJLNfjrmBDEpo=;
 b=SOXzlHKelBAGPw7DhQtwJO8omCzpiq9gXCf8bXG0lMCvqwShuYvAJudL4md1z/9cjRdmsN1M5QalG2j6dnF6eQrnWKUHrSTCe1DA0wIv9z+Moe0FfcTlEZ8egm2PD72NMC5aaJxh92DwqytCk/60yD9R+ZiEeJvM2xAKrWw/6ZYKj3tuCXYBstwqs7XXnvbN7QrJE5Q9Ss867xjrk/fOGjniLzemMKi+aopeY7+0Nk5EiCUT/qr6gFK8FjgKgdmbLhTvCjuWopG6ixT4Nknf967bnEoa1QcIaAKrYXpINgavrHso6CZTqLY5BaM2uf4qu4c9yol8skAfIPuHSk787w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzPSa7pUHUNE+lBQY8DejctL89jWJmjJLNfjrmBDEpo=;
 b=im1unR8St1anajzm3gL3aiB19YAy9CqjB7V9vyBSgsooa7nZCRdtKrss2aom0gzx9nb6vzWm5sKWQMdeTmzokRS2c921Uv8XTflUalZTEAtRJuL++VqbekWvPGbaMhvhXarn+OzIT28PFRWyO3PLsRE8r1QNDNWrIGakFsd43uo=
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by BL0PR12MB2452.namprd12.prod.outlook.com (2603:10b6:207:3f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Thu, 3 Feb
 2022 09:09:34 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::a) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:33 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:31 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 00/24] CHECKPOINT RESTORE WITH ROCm
Date: Thu, 3 Feb 2022 04:08:54 -0500
Message-ID: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 641d9d9f-ce96-4c07-f858-08d9e6f4e513
X-MS-TrafficTypeDiagnostic: BL0PR12MB2452:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB24523AF5680DBAD0D06479ADFE289@BL0PR12MB2452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JsCOzwn+bcKcmswQzAXsXuQpEVzKXGpDVXzdR3/7NiMR2WTBhzm9Wy0HN8GDcb+gZSBurkoIx5QB4+oBkWpVsoZPPHUxB3zkrIqMSp9riKk8IFKX2mgdaew1qkw2GYyjfMu/tsaX07snuoVLFZoSkgcgiyl57S4L1Q7f6boJhyc+XxktUqtrmf9GTZphucrHnaSChMmG1XNf5fQOiXpx0CtS6caIl7Mop1diye4ozBftlgJRjdCF1gDE2LwobFGcfF+vJIwheERyCdieFTCzX6hAPo8lriSCpN30HkO7nlpiSD/jPv2qbJePXVg+kGmUKrepxYmRKOlVQ9ySoQjrIoOac9jjuaXwpj/0I2ak84isLJwr1IDXz9EQ8f/pAtBBwlLD07gv2kLfcN9ZnB4SJfEwE/RH5uUsI5zh21M/i+U0GYrc2TSB0fQrzmbFdanRW8J5MNFToffZ89i34MpUocDE6taBA+jUzCru5bygcpw+vxjP51ljjp5+FMkcqSLR3s9PWoXesZ14SBBHSLCwOMZP3UYcwt6M8qq1Eyo5O5XIZcHcnVVSMRGrhHtBQEdRXJVBGf7Z7+KjctI7QhxC0MbIlaXBIXW6ycpi5pvKbh91ydAom0kk6j3Fe3vRDMkIpUeYKbtbTdEPKCYX6I/i5NDGlkid+VzI/A6J2U/102RqU4h7ztXo9jO5Jb3Edxc+sW9yV6tGsD9jiOjBsdASTu+5eTEl2klWY9G9t3Xj6RObMQfBa61ezeWgBWrylvBDiQECM2Mb9oyUNt9v33Iq81k02Ns+ql+6mGzUhfLyE3w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4326008)(8676002)(26005)(7696005)(16526019)(2906002)(82310400004)(450100002)(8936002)(70206006)(186003)(1076003)(336012)(6666004)(83380400001)(70586007)(426003)(36860700001)(5660300002)(2616005)(508600001)(86362001)(47076005)(44832011)(40460700003)(54906003)(81166007)(36756003)(356005)(6916009)(966005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:33.8554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641d9d9f-ce96-4c07-f858-08d9e6f4e513
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2452
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V5: Proposed IOCTL APIs for CRIU with consolidated feedback

CRIU is a user space tool which is very popular for container live
migration in datacentres. It can checkpoint a running application, save
its complete state, memory contents and all system resources to images
on disk which can be migrated to another m achine and restored later.
More information on CRIU can be found at https://criu.org/Main_Page

CRIU currently does not support Checkpoint / Restore with applications
that have devices files open so it cannot perform checkpoint and restore
on GPU devices which are very complex and have their own VRAM managed
privately. CRIU, however can support external devices by using a plugin
architecture. We feel that we are getting close to finalizing our IOCTL
APIs which were again changed since V3 for an improved modular design.

Our changes to CRIU user space  are can be obtained from here:
https://github.com/RadeonOpenCompute/criu/tree/amdgpu_rfc-211222

We have tested the following scenarios:
 - Checkpoint / Restore of a Pytorch (BERT) workload
 - kfdtests with queues and events
 - Gfx9 and Gfx10 based multi GPU test systems 
 - On baremetal and inside a docker container
 - Restoring on a different system

V1: Initial
V2: Addressed review comments
V3: Rebased on latest amd-staging-drm-next (5.15 based)
v4: New API design and basic support for SVM, however there is an
outstanding issue with SVM restore which is currently under debug and
hopefully that won't impact the ioctl APIs as SVMs are treated as
private data hidden from user space like queues and events with the new
approch.
V5: Fix the SVM related issues and finalize the APIs. 

David Yat Sin (9):
  drm/amdkfd: CRIU Implement KFD unpause operation
  drm/amdkfd: CRIU add queues support
  drm/amdkfd: CRIU restore queue ids
  drm/amdkfd: CRIU restore sdma id for queues
  drm/amdkfd: CRIU restore queue doorbell id
  drm/amdkfd: CRIU checkpoint and restore queue mqds
  drm/amdkfd: CRIU checkpoint and restore queue control stack
  drm/amdkfd: CRIU checkpoint and restore events
  drm/amdkfd: CRIU implement gpu_id remapping

Rajneesh Bhardwaj (15):
  x86/configs: CRIU update debug rock defconfig
  drm/amdkfd: CRIU Introduce Checkpoint-Restore APIs
  drm/amdkfd: CRIU Implement KFD process_info ioctl
  drm/amdkfd: CRIU Implement KFD checkpoint ioctl
  drm/amdkfd: CRIU Implement KFD restore ioctl
  drm/amdkfd: CRIU Implement KFD resume ioctl
  drm/amdkfd: CRIU export BOs as prime dmabuf objects
  drm/amdkfd: CRIU checkpoint and restore xnack mode
  drm/amdkfd: CRIU allow external mm for svm ranges
  drm/amdkfd: use user_gpu_id for svm ranges
  drm/amdkfd: CRIU Discover svm ranges
  drm/amdkfd: CRIU Save Shared Virtual Memory ranges
  drm/amdkfd: CRIU prepare for svm resume
  drm/amdkfd: CRIU resume shared virtual memory ranges
  drm/amdkfd: Bump up KFD API version for CRIU

 arch/x86/configs/rock-dbg_defconfig           |   53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    7 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   64 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   20 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 1471 ++++++++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |    2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  185 ++-
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  313 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   14 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |   75 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |   77 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |   92 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |   84 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  160 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   72 +-
 .../amd/amdkfd/kfd_process_queue_manager.c    |  372 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  331 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h          |   39 +
 include/uapi/linux/kfd_ioctl.h                |   84 +-
 21 files changed, 3193 insertions(+), 340 deletions(-)

-- 
2.17.1

