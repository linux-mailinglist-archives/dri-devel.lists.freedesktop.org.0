Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE01CC3C4
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 20:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1B06E0D5;
	Sat,  9 May 2020 18:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE846E0AD;
 Sat,  9 May 2020 18:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R864ti6LqPVS1B3wTZX9CCvf0uN00YhmOtkhOubZkGDmRlyBR35/GYmM1iWoPxm3f6iQp/fTCbDkC/i8Uc7/IoIhcmVquFIrPoK9N0EAEL4P0vpfAncaWsVnrtwPxMiI/ulLdQcXWV9Nk2iZJW8JzNuNnr+6Sylm2GNC9klWzKjep6HSaK9vWgNGccwLj/rYkfOO6y3523iBATq9OrHnE+efy+hGQUhXSvazGfEklxyTan0U8qC60KJdj/XokadkNhja5O+VECgA7Mx6Nnckcw0EJZDQ4ASxOX70E24Y5J0pCTFxeOqoI1Ic4FgWHqoWDqaYKXBtEXlapSkB787plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddLhqsdBYVQtYUlz2eYTBDUfGpkYvsnvy1s7sgvSqP0=;
 b=ctiPrpWy9QzXBFBQcymxzEN4A57iS2+4RIWfQEx0bdqgUji3Fv8fpZAmcu3VjNQ5KR3MK1ZmBn9gUUbr5W1KlhIbXAiuxgkMs5EkF6eac2PxOS/4P+ARm3p5ttjT71izKEU9HJCjrPoYdNjLYO5URVzT/dl2jU6vPjgZEmwdYt+cu8Ajro6QvRsQGFEtwO+0XuP/F21lXEvzrccghz9JazbnFbKwCtfbl4y1mPk2QgAs/VnH5SbvYz/nHGGUzB0c0w+40HZaPD5BaLrbnd+pgZGTVkD/hbpQOFL984kKrO+QEURu9nRbfnxvgtTu5dSU6xFQTIDbDhvDX7bF/V4QHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddLhqsdBYVQtYUlz2eYTBDUfGpkYvsnvy1s7sgvSqP0=;
 b=xNvWorOz6CD3q5lvVFYk03AXb8ZX2mVri9TSWP+B2VLxICTINvNNTWh4Nm9BSlzjn/wTzpls8BEUyhG3TW/vpei/165fpdyvD93feToscJ/GxnTvH5lMZbtN7kMCSQPWJsifxMACjfQe0zETr+uFRi1VEYDqllVn/ew8yqI3jHg=
Received: from MWHPR22CA0018.namprd22.prod.outlook.com (2603:10b6:300:ef::28)
 by CY4PR12MB1766.namprd12.prod.outlook.com (2603:10b6:903:122::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Sat, 9 May
 2020 18:52:13 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::e6) by MWHPR22CA0018.outlook.office365.com
 (2603:10b6:300:ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Sat, 9 May 2020 18:52:13 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 18:52:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:11 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 9 May 2020
 13:52:11 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 9 May 2020 13:52:10 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Date: Sat, 9 May 2020 14:51:44 -0400
Message-ID: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(33430700001)(81166007)(2906002)(82310400002)(966005)(2616005)(36756003)(4326008)(26005)(426003)(336012)(33440700001)(86362001)(186003)(44832011)(7696005)(478600001)(5660300002)(6666004)(54906003)(8936002)(82740400003)(47076004)(8676002)(356005)(70586007)(70206006)(110136005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae27a34-671f-4fc9-2bb0-08d7f44a15c0
X-MS-TrafficTypeDiagnostic: CY4PR12MB1766:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1766495508E000D6E17F8924EAA30@CY4PR12MB1766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EiMvav51yb0cHhv+WZftKF3pB2ITGjfaFN+OLSGQGapSNJGyFfCIx7edbG+afqLn31M7H4hZdBp1tg3N5MSk7NOvEtKU2wMB9gL/X3PtwWkb6F/KzXj5YbzZFkkYlE7nzpZ8Lvebx0VSK7b3NF1yTQ5xp1lBAB+Q72WjFa0lC9doqaxsOQ5ey4B2mz1w2K31PvknstcbCWR5+olqVkmOHy9dSbLStvDI/Et9/4PLljHW6N33YVXAv5wroHOzKQoyOcp++ZsnTfBSJVYi+z6HWtJeinTwjN9fvCX+oGSFjXwCzZjh5fLYDXnMMh9+a/kZegdX3H/9V6Fw3n5FtZ1ibCui5WPDHV4oteC2E0rHTdh8/kOGZarTydt+CyzlWzQ6XH5MUBYMiqERKd9L9i0wS7LZlwx+OCIJ61pt38UoESplF0uIYpH9s7S7Exhl2vZzCz+Fp43XaipgqnMBY/yfOL279lNZm7xjPI+/BYjpA3guPiJNkTxT7xbeSoPLkpa+RJoAL9QcwXHKTF0NJl4U+sGtByLuCr6obig2CMqIeaCMwA+/HL+rnUY0/zH35g4zlezcSHmyQVbeEhTb7MUe7cBLSPFoVCtZN6zWqDc+kCs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 18:52:12.4158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae27a34-671f-4fc9-2bb0-08d7f44a15c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1766
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This RFC is a more of a proof of concept then a fully working solution as there are a few unresolved issues we are hopping to get advise on from people on the mailing list.
Until now extracting a card either by physical extraction (e.g. eGPU with thunderbold connection or by emulation through syfs -> /sys/bus/pci/devices/device_id/remove) 
would cause random crashes in user apps. The random crashes in apps were mostly due to the app having mapped a device backed BO into it's adress space was still 
trying to access the BO while the backing device was gone. 
To answer this first problem Christian suggested to fix the handling of mapped memory in the clients when the device goes away by forcibly unmap all buffers 
the user processes has by clearing their respective VMAs mapping the device BOs. Then when the VMAs try to fill in the page tables again we check in the fault handler 
if the device is removed and if so, return an error. This will generate a SIGBUS to the application which can then cleanly terminate. 
This indeed was done but this in turn created a problem of kernel OOPs were the OOPSes were due to the fact that while the app was terminating because of the SIGBUS 
it would trigger use after free in the driver by calling to accesses device structures that were already released from the pci remove sequence. 
This we handled by introducing a 'flush' seqence during device removal were we wait for drm file reference to drop to 0 meaning all user clients directly using this device terminated. 
With this I was able to cleanly emulate device unplug with X and glxgears running and later emulate device plug back and restart of X and glxgears.

But this use case is only partial and as I see it all the use cases are as follwing and the questions it raises.

1) Application accesses a BO by opening drm file
	1.1) BO is mapped into applications address space (BO is CPU visible) - this one we have a solution for by invaldating BO's CPU mapping casuing SIGBUS 
	     and termination and waiting for drm file refcound to drop to 0 before releasing the device
	1.2) BO is not mapped into applcation address space (BO is CPU invisible) - no solution yet because how we force the application to terminate in this case ?

2) Application accesses a BO by importing a DMA-BUF
	2.1)  BO is mapped into applications address space (BO is CPU visible) - solution is same as 1.1 but instead of waiting for drm file release we wait for the 
	      imported dma-buf's file release
	2.2)  BO is not mapped into applcation address space (BO is CPU invisible) - our solution is to invalidate GPUVM page tables and destroy backing storage for 
              all exported BOs which will in turn casue VM faults in the importing device and then when the importing driver will try to re-attach the imported BO to 
	      update mappings we return -ENODEV in the import hook which hopeffuly will cause the user app to terminate.

3) Applcation opens a drm file or imports a dma-bud and holds a reference but never access any BO or does access but never more after device was unplug - how would we 
   force this applcation to termiante before proceeding with device removal code ? Otherwise the wait in pci remove just hangs for ever.

The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully tested and I am still testing the others but I will be happy for any advise on all the 
described use cases and maybe some alternative and better (more generic) approach to this like maybe obtaining PIDs of relevant processes through some revere 
mapping from device file and exported dma-buf files and send them SIGKILL - would this make more sense or any other method ? 

Patches 1-3 address 1.1
Patch 4 addresses 2.1
Pathces 5-6 address 2.2

Reference: https://gitlab.freedesktop.org/drm/amd/-/issues/1081

Andrey Grodzovsky (6):
  drm/ttm: Add unampping of the entire device address space
  drm/amdgpu: Force unmap all user VMAs on device removal.
  drm/amdgpu: Wait for all user clients
  drm/amdgpu: Wait for all clients importing out dma-bufs.
  drm/ttm: Add destroy flag in TTM BO eviction interface
  drm/amdgpu: Use TTM MMs destroy interface

 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
 drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                | 63 +++++++++++++++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
 include/drm/ttm/ttm_bo_api.h                |  2 +-
 include/drm/ttm/ttm_bo_driver.h             |  2 +
 16 files changed, 139 insertions(+), 34 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
