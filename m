Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ADB2BBD27
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA466E964;
	Sat, 21 Nov 2020 05:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAC66E964;
 Sat, 21 Nov 2020 05:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyEKsPga/ozkF2YCFt8QemjMvjRLK9SgrvivuPVEPM1wDE1mki2TpJDtQ6FgjYtyjOU8VqYqWCuSPZKPEMNPeUnQhP4dchwxcBnmUVvcGFS+Tv68R13CDkF6mkiqxeHLg5p7xK6HCESzq2BBZLp9YcpZxTeFs/cNYcq1sSfj2EsvyaoFRJr3fzZrdranmakf0fPV9OS0BhNgncC0a5p6yCcNjz0mZ1y9rwKs+HDaimRsobCuWH6eM8L+py7NGVW7EyIDWAr/yilQuu2+YDIgzSpd0rvJErbo4Hyr4oQD5efh+OgIAtgHJfIuh6RSJDVzwZZ896lEOzECAmY6oDxMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/1MtwsMgRWenf4GZV6nn14RI7xKiQWqyqVvEAmOno=;
 b=k4GGJK+AxiuaMnI2oAOWHjEwQl4bRIipmTRqGYJyjjigy1VXsbChtSYBxiLM4OzWQm4qL6gJFFVvGxKz2sZchp4XDihnwQyt4gwd4Y7nOBGGsIkb73iUpRZ318Vh5OG6EN9f2xlKsJU33MQzRg2xGqrHzxYs8hbMJIZVyYDxTFnz862cwtj/0I1G0JnUyVEnbK9vKbLPWovlLGemQ5WWvPOvcFPy5hKHlUHuLds78ePTKGM68e86BGP57CdgMhfaJqLKdG9P9ytWjuehmUPZ1i9gok8NEN5IMzWRtDdKBwXeURrD/OH7Pq7bqt1XdUvALLtcUl9IucbfjAD/ONhZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I/1MtwsMgRWenf4GZV6nn14RI7xKiQWqyqVvEAmOno=;
 b=ou2WrkT3SwgI5TnyrEe8MGj0UAiU20LJ4WLHuWrn6kKt8daNh2WEWbpkmtAM4aKyOwEa2Vg0PAvMySHyJxxw+lrqK5GdnRt8s3eXl4MIu4kmndP84hczktHVDzqDCqGbvL8Imc7K4mnsn6zVQUGNjJRoLjKASMboL9qoURHoL78=
Received: from BN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:408:e6::22)
 by BYAPR12MB3558.namprd12.prod.outlook.com (2603:10b6:a03:aa::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Sat, 21 Nov
 2020 05:21:29 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::af) by BN0PR03CA0017.outlook.office365.com
 (2603:10b6:408:e6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:28 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:28 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:27 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 00/12] RFC Support hot device unplug in amdgpu
Date: Sat, 21 Nov 2020 00:21:10 -0500
Message-ID: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89680b63-4ab5-4a1c-e924-08d88ddd4cdb
X-MS-TrafficTypeDiagnostic: BYAPR12MB3558:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3558663B4386F8EA8E547526EAFE0@BYAPR12MB3558.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qy5X1k4O0ld03vrJ8AWPffBQ3UPLK0euMB7qlc8XmmuVXC11bM/XVKsOUB5YofPbWwMLFrnRTRU7JhtRL3yJ/0HBipdiHPl/T57wwTe+41JqZeaoBy1P/vjhCY+y0CxeRzB6WcLhaFM7rDu235DNMSBe2JB/dFeGJs1j3pN9gNoyK7eD4EhjRyYexvmBdpoJZcmBZpw9qdpYECID5YAzk5He6xE2+Yp29Ve3dYyGlG2Z7iJn+0QpiwFtwoG5HvlRUdTXfPjA9cCcX7tzfYBim+/N4ipUSFWyA+bJZ5SaKbLPB4fycYeta0jWxliTDVby+rLT/ZTiYweyE+/9tMzzWx+fBsUqsNLIvRq0pAkz9wwisEX+eWHNVITnmMeyV/N1po3u9R8yb+rc4kwN/0NHWabfbFLHIbYCUW7fFVLbS4oyXbktm1Xy/FBELn4013om5n8y5XInfXtISI+DGMz9VlZWy6NUMM8qVLQaNWmi11TXg6U4ZvWfOrD2+ID1842h
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(8676002)(336012)(70206006)(83380400001)(70586007)(86362001)(44832011)(8936002)(2616005)(316002)(186003)(6666004)(7416002)(26005)(356005)(110136005)(47076004)(7696005)(4326008)(426003)(478600001)(966005)(82740400003)(54906003)(81166007)(82310400003)(5660300002)(36756003)(2906002)(127564004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:28.8914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89680b63-4ab5-4a1c-e924-08d88ddd4cdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3558
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now extracting a card either by physical extraction (e.g. eGPU with 
thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove) 
would cause random crashes in user apps. The random crashes in apps were 
mostly due to the app having mapped a device backed BO into its address 
space was still trying to access the BO while the backing device was gone.
To answer this first problem Christian suggested to fix the handling of mapped 
memory in the clients when the device goes away by forcibly unmap all buffers the 
user processes has by clearing their respective VMAs mapping the device BOs. 
Then when the VMAs try to fill in the page tables again we check in the fault 
handlerif the device is removed and if so, return an error. This will generate a 
SIGBUS to the application which can then cleanly terminate.This indeed was done 
but this in turn created a problem of kernel OOPs were the OOPSes were due to the 
fact that while the app was terminating because of the SIGBUSit would trigger use 
after free in the driver by calling to accesses device structures that were already 
released from the pci remove sequence.This was handled by introducing a 'flush' 
sequence during device removal were we wait for drm file reference to drop to 0 
meaning all user clients directly using this device terminated.

v2:
Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document 
produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and 
waiting for all user clients having CPU mapping of device BOs to die was dropped. 
Instead as per the document suggestion the device structures are kept alive until 
the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs 
belonging to the device directly or by dma-buf import are rerouted to per user 
process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2] 
since i am trying to get the minimal set of requirements that still give useful solution 
to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my 
test case is removing a secondary device, which is render only and is not involved 
in KMS.

v3:
More updates following comments from v2 such as removing loop to find DRM file when rerouting 
page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving 
prevention of GPU recovery post device unplug from amdgpu to scheduler layer. 
On top of that added unplug support for the IOMMU enabled system.

With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears 
is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working 
with the primary card or soft reset the device without hangs or oopses

TODOs for followup work:
Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
Rework AMDGPU sysfs handling using default groups attributes (Greg)
Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.

[1] - Discussions during v2 of the patchset https://lists.freedesktop.org/archives/amd-gfx/2020-June/050806.html
[2] - drm/doc: device hot-unplug for userspace https://www.spinics.net/lists/dri-devel/msg259755.html
[3] - Related gitlab ticket https://gitlab.freedesktop.org/drm/amd/-/issues/1081


Andrey Grodzovsky (12):
  drm: Add dummy page per device or GEM object
  drm: Unamp the entire device address space on device unplug
  drm/ttm: Remap all page faults to per process dummy page.
  drm/ttm: Set dma addr to null after freee
  drm/ttm: Expose ttm_tt_unpopulate for driver use
  drm/sched: Cancel and flush all oustatdning jobs before finish.
  drm/sched: Prevent any job recoveries after device is unplugged.
  drm/amdgpu: Split amdgpu_device_fini into early and late
  drm/amdgpu: Add early fini callback
  drm/amdgpu: Avoid sysfs dirs removal post device unplug
  drm/amdgpu: Register IOMMU topology notifier per device.
  drm/amdgpu: Fix a bunch of sdma code crash post device unplug

 drivers/gpu/drm/amd/amdgpu/amdgpu.h               | 11 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 82 +++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         | 17 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           | 24 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           | 12 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        | 10 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |  8 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++-
 drivers/gpu/drm/amd/include/amd_shared.h          |  2 +
 drivers/gpu/drm/drm_drv.c                         |  3 +
 drivers/gpu/drm/drm_file.c                        |  8 +++
 drivers/gpu/drm/drm_prime.c                       | 10 +++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  3 +-
 drivers/gpu/drm/lima/lima_sched.c                 |  3 +-
 drivers/gpu/drm/panfrost/panfrost_job.c           |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c            | 18 ++++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                   | 54 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_page_alloc.c              |  2 +
 drivers/gpu/drm/ttm/ttm_tt.c                      |  1 +
 drivers/gpu/drm/v3d/v3d_sched.c                   | 15 +++--
 include/drm/drm_file.h                            |  2 +
 include/drm/drm_gem.h                             |  2 +
 include/drm/gpu_scheduler.h                       |  6 +-
 31 files changed, 287 insertions(+), 47 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
