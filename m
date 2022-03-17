Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3154DBB9E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7EE10EABD;
	Thu, 17 Mar 2022 00:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590C910EAB4;
 Thu, 17 Mar 2022 00:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L24rdzv5ah2Bsm402pLD+4ljZRQCYb9ZrsJUP8jHogb8rBri4SHrx9nMFT7gBD1RrptYZfB/lxwfSdVOT4pOMStFRPjCd9ME1L7/JPHiX4iEHSo0mvggSOorHe5c4SB1EQKgWTGimb1w2Q6h+uOZa210uo/E9mOjq10EAeGr7ApPz8oiWDqNR3ImPYS+KvKGieoCS14e8GBU/kA87+JB3U2An8CUMxjmTU1Evd5T553DRLWaFTGPw+nw6iA/PbOiY/Pd3kmMSvlhyZtGSFMkrJXEJBRZlMaV3lajj0MlyLRKOyM2f5wAswlg5o9hNMWYZhG7MBnQac8FdCJwYEAYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFyHZHOxp7o5a3Ii2ssEbsKjFyjktPhZvsUV7nnOd8E=;
 b=QtBN9/LfVJdn9CuBzwGUk1u2sS1icB0cMe9YzgpJvOLRY9V99YNz5kiSRTQYULcCBLuCzftgCINIrcs5Pwqjmd4IcRIo8Oeik6bd5RWcncUT0+1kZkFuAMZtjnM0Lm+4Y3jDDIRElVgNQlfugeT5I2ImuEKtXH9HW4IBJZe0DL+ULav31kRUGBFSEmGG/j8NY+MEbschns36Xibajh21jt0rieEaGYI3TXuHYahzOXXM4AlDM7BGzdiGHswnTbH/kFqetLt79qaaeJalRklZecd1c6wwVeiSV/OW3NyB324CeY8wAr/Y3uUph2GB53oZdcpk8+Nd5arYeAhAnyoTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFyHZHOxp7o5a3Ii2ssEbsKjFyjktPhZvsUV7nnOd8E=;
 b=iBknt7SdFiMxjBmES/lqU0Oy4iSIKOivMRObAiFnBSewT3q5zJGvCZbWTDIyKVSl4ys5kBQV4TmLg7igkCxeVCVFiGQVzIBM0452vV8jvyQwvnKwGqBr0CuerjOlXr57N0GR11PbeE9LKN62EEjIjXZvu2UyV9tw4lP2SVtpUFI=
Received: from BN9PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:fb::27)
 by CY4PR1201MB2549.namprd12.prod.outlook.com (2603:10b6:903:da::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 00:20:40 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::a3) by BN9PR03CA0052.outlook.office365.com
 (2603:10b6:408:fb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Thu, 17 Mar 2022 00:20:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:20:40 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:20:39 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 0/4] Enable render node VA mapping API for KFD BOs
Date: Wed, 16 Mar 2022 20:20:02 -0400
Message-ID: <20220317002006.342457-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50583192-f9ab-47fa-d5f8-08da07abf7ba
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2549:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25494A3EFEE43585ED13FBB292129@CY4PR1201MB2549.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KvGOK6zqcghFKzJ+tJWQG313yoASEHFHzV926oP7ZvQfigv+xLza6b4d9nvs29wgyrSmgz+i6xYIayOVZOe8PoenFdgn+UsNP7trnJk/qpNlF/pHIkmMsBPZ9jcchyzSvCzkT13ExK+hKqSOsVXpk8u1croFlSNBBspGTaq4h6O5gUbshfIWICnX38Z/a7R42APxm1slrZjrt2XUnB3E0foE17KFbhyf4TeZe5nxfDr/I1b7Z6d5ETvLmORNu/G9jynTMegWFwIMJrA8mHhq1J6lSpFeTo2jcNhzkv+QjSJZmxc+4HjkeDXWmjmLu/0T4jSoWbyMRUX5rZQyCjkpxtFu+t4SpN4lifV5vtO3/d7RSiKCD8Ufol7213qJ2UgceB8apYha+qZFZ6+P0HAFe1PhCrJ8XKo2UaiUR0Oenp2Bi2S/5k+LxmLj8W920xUN5T46HugXoubGvh1cKJ3FNxO4eA8Ih6P0fiYl/DVPh/sidYtp8lQASOqDgStY+GHYmhdn84y4kUIlhRY3zMuTjYqUmPXD0qa3eEEFigp2/VIe6910LV5bk4yHaespd3ih6cpM2a3dF5PnoPizTX/nMFndflzDbTWTAzKcdXN3OvOnr8uBRLwoyk5LtkKTlBzTxxjWi3y5i9J3m5kI0ogSJv8V8Cwgj28tK1snqAnAg2xmvzOG9fZSQyTJPQpJiZwQHBQMafNGuKxR/eMr372QVzcYzReJbF9pCPKoPuar8nsZhYAVfBzjijxF7cMO3/zf58NALETRO0aUYHtEI+N2tPtpISwf2kiePZR5/msLXhU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(2616005)(1076003)(316002)(8676002)(26005)(83380400001)(186003)(4326008)(16526019)(356005)(82310400004)(81166007)(6916009)(54906003)(40460700003)(86362001)(966005)(6666004)(426003)(70586007)(2906002)(5660300002)(336012)(450100002)(7696005)(47076005)(508600001)(36756003)(70206006)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:20:40.2584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50583192-f9ab-47fa-d5f8-08da07abf7ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2549
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The KFD API is quite inflexible in that it allows only mapping entire BOs
at the same virtual address on all GPUs. This is incompatible with newer
CUDA memory management APIs.
(see https://docs.nvidia.com/cuda/cuda-driver-api/group__CUDA__VA.html)

Instead of inventing more KFD APIs to fix this, the goal of this patch
series is to enable ROCr to use the DRM render node API for more flexible
VA mappings. It builds on the DMABuf export API that is being proposed
for RDMA. DMABuf handles exported by KFD can be imported by libdrm-amdgpu
and then used with amdgpu_bo_va_op.

This is a first proof of concept and request for comment.

A complete solution will likely need minor tweaks to the KFD API to allow
memory allocation and import without a pre-determined virtual address.

Other options that were considered but rejected:
- Using GEM API to create BO in KFD VMs. This would require significant
  plumbing to get those BOs registered with the KFD eviction fence
  mechanism and "no overcommitment" memory limits
- Variation of the above using AMDGPU_GEM_CREATE_VM_ALWAYS_VALID to
  simplify validation. Doesn't work because it doesn't allow DMABuf
  exports
- Creating KFD BOs with GEM handles. Doesn't help because there is no
  way to import GEM handles into libdrm-amdgpu

Felix Kuehling (4):
  drm/amdkfd: Improve amdgpu_vm_handle_moved
  drm/amdgpu: Attach eviction fence on alloc
  drm/amdgpu: update mappings not managed by KFD
  drm/amdgpu: Do bo_va ref counting for KFD BOs

 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 99 ++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 18 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  3 +-
 5 files changed, 86 insertions(+), 42 deletions(-)

-- 
2.32.0

