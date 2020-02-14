Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A5215DD04
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C596F9E4;
	Fri, 14 Feb 2020 15:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6956F9E4;
 Fri, 14 Feb 2020 15:57:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/bji6BmlmpxZQOC2y164GDFiFLkZoO4BSaT1azl98spjGnj32UKK+nf5pSBpWhgsJ08RQcdPckEMDBg1lNxKyOe4knAKy77vMjsp/6WRui+CiBl9EUsqEeKHMlfj3bio5BGCEyoKhXZzfbyV3W2rNs2lifdSZ6o0A+L4kIUI3f3TNC8RA4h5V20Z2u5Tnatjs9V0lBQxmNAA/0riMd1GSjleTHS99sbickSM4NVfZ353dHKrah0CSWBYH5KQ8v16Ag51IHlC+8ZQXNUlbzcOSVRwy/1Fh8znSyAZugoFlcFLm6xwquyhJz5ffLS1BsvfQF5XvDsjbc1jRIA5cK+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkKbliE1Xwyj39wA0DLVQi91teBVV31qqlmJRMFS6wg=;
 b=NhdV8hUKau5D2hV8kCK6ada6vt7wJ3hkLRngfHEpQPGUCQLmyxUZrYlFakFlI7WgKB0XJxI7GNcMXfFN/AUvIatfjsDrJ1IYxEktsffenAn0sat/Q8eB9z7MHAMPQkstkWk26UoSVS+e/WNy1absjDroHEl/+445JRLg2QbhVe9d3XVZrKuxfTUWZBoYCVC9H4chG9Pi1rDwq4eW6oNBlaNLsOL2dRJYUfXfNLB0he3+UtR5xdlPN39e2qKUYEhvsPqBGy/Z2j7QBgWGDaC0AZktUdVoNTVCHxPyy3/JKr9ULcRIU1zJtUo8RFUXyCvxnzGa9kqNHMKs+86YFhFIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkKbliE1Xwyj39wA0DLVQi91teBVV31qqlmJRMFS6wg=;
 b=0Z5VaNzOUY9PCGAIJTVpuTd+tvC+sOKMUNvvSxIqT4w48uFXvdVgWohXh4bsEV9MBUFomSl1vs789Is/xr0qHXa/4Fmjkl9sSy/PHDiMkZY2pA5bng9XMzvqnojH1nQzGWQe8BP5iMu4K60gtbsK8gqs50F7UgTG7qLgid3GnL4=
Received: from CH2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:610:57::35)
 by BN8PR12MB2932.namprd12.prod.outlook.com (2603:10b6:408:96::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Fri, 14 Feb
 2020 15:57:07 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::206) by CH2PR12CA0025.outlook.office365.com
 (2603:10b6:610:57::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Fri, 14 Feb 2020 15:57:07 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 15:57:07 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 14 Feb
 2020 09:57:06 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 14 Feb 2020 09:57:05 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>, <nirmoy.das@amd.com>,
 <damon.mcdougall@amd.com>, <juan.zuniga-anaya@amd.com>
Subject: [PATCH 00/11] new cgroup controller for gpu/drm subsystem
Date: Fri, 14 Feb 2020 10:56:39 -0500
Message-ID: <20200214155650.21203-1-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(428003)(199004)(189003)(1076003)(86362001)(4326008)(36756003)(6666004)(70586007)(356004)(70206006)(6636002)(81156014)(2906002)(336012)(110136005)(2616005)(5660300002)(478600001)(81166006)(186003)(426003)(8676002)(7696005)(316002)(8936002)(26005)(966005)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2932; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94e465f8-ec25-4784-f1f2-08d7b1668b25
X-MS-TrafficTypeDiagnostic: BN8PR12MB2932:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2932A3DC91F9FF4FCC5223F683150@BN8PR12MB2932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03137AC81E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsHT9zYVJCnCFxN+4o++Vxkz4OB+TSkN08JGCcwAh58wOQ0aM+jM+1W6ISnfOni7kWbkbu7ZXpxZ8x0PdYOxOnBMOrneD3HE/mUIaSXAYITz5CgxCx4wyYyO7ygAYWQNfYH9vTwM2IvnqBk9blTjkk48qcyUbuAnGIWAuc3Gz6I6RobuJKEieyKbv/+3VzQIjEINtlpD7ey+Zwr68r+m/zzC+xsdr42t1spHfN1ZrMFaNt7It42TNu0WO4Gek3oo4tTCj3NyI0FX1d7yZDsKJfg87M5z6PldbieqQPUEyhL/6vq0iPv8ufmoYpVUnXpi+9mCtQSSFk36R/pNKF45B3rb37pQiMf3q//6sfke4MokYjFn6diNMl6/ohsJ5nVsem0LvHy8RRE1NOvrKmsbFD7IjUHNm6sRNvjCJCBv+7AGppgc3YNoEg0TVBNDLewUrNEyNgEQjRvWmuyeMcigEJAJFTEpa6og2gSMT9YVOT6vjVGyXNZNRp4RZuiFsSENaauN1pt6bsXzRfmCF0AMzEt1zbik0HbPHDEK+scTNoJXrOjjtoM7pj9UJwezk7X73XyEcrbfwmfhoFi0xhgjfF4mg8OLX0Y++sH5ht+/zm4zmZRJIEC0YXKyLEgzRSXwWjicnPXIabf7xE/rAy+Wx0ADH6mpusnXoo8iueb641dICY8jw9X2gtMVdCcRIQJYORWd1mV/oIQZ9YIj4ESCCg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 15:57:07.5094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e465f8-ec25-4784-f1f2-08d7b1668b25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2932
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a submission for the introduction of a new cgroup controller for the drm subsystem follow a series of RFCs [v1, v2, v3, v4]

Changes from the RFC base on the feedbacks:
* drop all drm.memory.* related implementation and focus only on buffer and lgpu
* add weight resource type for logical gpu (lgpu)
* uncoupled drmcg device iteration from drm_minor

I'd also like to highlight the fact that these patches are currently released under MIT/X11 license aligning with the norm of the drm subsystem, but I am working to have the cgroup parts release under GPLv2 to align with the norm of the cgroup subsystem.

[v1]: https://lists.freedesktop.org/archives/dri-devel/2018-November/197106.html
[v2]: https://www.spinics.net/lists/cgroups/msg22074.html
[v3]: https://lists.freedesktop.org/archives/amd-gfx/2019-June/036026.html
[v4]: https://patchwork.kernel.org/cover/11120371/

Changes since the start of RFC are as follows:

v4:
Unchanged (no review needed)
* drm.memory.*/ttm resources (Patch 9-13, I am still working on memory bandwidth
and shrinker)
Base on feedbacks on v3:
* update nominclature to drmcg
* embed per device drmcg properties into drm_device
* split GEM buffer related commits into stats and limit
* rename function name to align with convention
* combined buffer accounting and check into a try_charge function
* support buffer stats without limit enforcement
* removed GEM buffer sharing limitation
* updated documentations
New features:
* introducing logical GPU concept
* example implementation with AMD KFD

v3:
Base on feedbacks on v2:
* removed .help type file from v2
* conform to cgroup convention for default and max handling
* conform to cgroup convention for addressing device specific limits (with major:minor)
New function:
* adopted memparse for memory size related attributes
* added macro to marshall drmcgrp cftype private ?(DRMCG_CTF_PRIV, etc.)
* added ttm buffer usage stats (per cgroup, for system, tt, vram.)
* added ttm buffer usage limit (per cgroup, for vram.)
* added per cgroup bandwidth stats and limiting (burst and average bandwidth)

v2:
* Removed the vendoring concepts
* Add limit to total buffer allocation
* Add limit to the maximum size of a buffer allocation

v1: cover letter

The purpose of this patch series is to start a discussion for a generic cgroup
controller for the drm subsystem.  The design proposed here is a very early 
one.  We are hoping to engage the community as we develop the idea.

Backgrounds
===========
Control Groups/cgroup provide a mechanism for aggregating/partitioning sets of
tasks, and all their future children, into hierarchical groups with specialized
behaviour, such as accounting/limiting the resources which processes in a 
cgroup can access[1].  Weights, limits, protections, allocations are the main 
resource distribution models.  Existing cgroup controllers includes cpu, 
memory, io, rdma, and more.  cgroup is one of the foundational technologies 
that enables the popular container application deployment and management method.

Direct Rendering Manager/drm contains code intended to support the needs of
complex graphics devices. Graphics drivers in the kernel may make use of DRM
functions to make tasks like memory management, interrupt handling and DMA
easier, and provide a uniform interface to applications.  The DRM has also
developed beyond traditional graphics applications to support compute/GPGPU
applications.

Motivations
===========
As GPU grow beyond the realm of desktop/workstation graphics into areas like
data center clusters and IoT, there are increasing needs to monitor and 
regulate GPU as a resource like cpu, memory and io.

Matt Roper from Intel began working on similar idea in early 2018 [2] for the
purpose of managing GPU priority using the cgroup hierarchy.  While that
particular use case may not warrant a standalone drm cgroup controller, there
are other use cases where having one can be useful [3].  Monitoring GPU
resources such as VRAM and buffers, CU (compute unit [AMD's nomenclature])/EU
(execution unit [Intel's nomenclature]), GPU job scheduling [4] can help
sysadmins get a better understanding of the applications usage profile. 
Further usage regulations of the aforementioned resources can also help sysadmins optimize workload deployment on limited GPU resources.

With the increased importance of machine learning, data science and other
cloud-based applications, GPUs are already in production use in data centers
today [5,6,7].  Existing GPU resource management is very course grain, however,
as sysadmins are only able to distribute workload on a per-GPU basis [8].  An
alternative is to use GPU virtualization (with or without SRIOV) but it
generally acts on the entire GPU instead of the specific resources in a GPU.
With a drm cgroup controller, we can enable alternate, fine-grain, sub-GPU
resource management (in addition to what may be available via GPU
virtualization.)

In addition to production use, the DRM cgroup can also help with testing
graphics application robustness by providing a mean to artificially limit DRM
resources availble to the applications.


Challenges
==========
While there are common infrastructure in DRM that is shared across many vendors
(the scheduler [4] for example), there are also aspects of DRM that are vendor
specific.  To accommodate this, we borrowed the mechanism used by the cgroup to
handle different kinds of cgroup controller.

Resources for DRM are also often device (GPU) specific instead of system
specific and a system may contain more than one GPU.  For this, we borrowed
some of the ideas from RDMA cgroup controller.

Approach
========
To experiment with the idea of a DRM cgroup, we would like to start with basic
accounting and statistics, then continue to iterate and add regulating
mechanisms into the driver.

[1] https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt
[2] https://lists.freedesktop.org/archives/intel-gfx/2018-January/153156.html
[3] https://www.spinics.net/lists/cgroups/msg20720.html
[4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler
[5] https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/
[6] https://blog.openshift.com/gpu-accelerated-sql-queries-with-postgresql-pg-strom-in-openshift-3-10/
[7] https://github.com/RadeonOpenCompute/k8s-device-plugin
[8] https://github.com/kubernetes/kubernetes/issues/52757

Kenny Ho (11):
  cgroup: Introduce cgroup for drm subsystem
  drm, cgroup: Bind drm and cgroup subsystem
  drm, cgroup: Initialize drmcg properties
  drm, cgroup: Add total GEM buffer allocation stats
  drm, cgroup: Add peak GEM buffer allocation stats
  drm, cgroup: Add GEM buffer allocation count stats
  drm, cgroup: Add total GEM buffer allocation limit
  drm, cgroup: Add peak GEM buffer allocation limit
  drm, cgroup: Introduce lgpu as DRM cgroup resource
  drm, cgroup: add update trigger after limit change
  drm/amdgpu: Integrate with DRM cgroup

 Documentation/admin-guide/cgroup-v2.rst       |  197 ++-
 Documentation/cgroup-v1/drm.rst               |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   48 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |    6 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |    3 +
 .../amd/amdkfd/kfd_process_queue_manager.c    |  153 +++
 drivers/gpu/drm/drm_drv.c                     |   12 +
 drivers/gpu/drm/drm_gem.c                     |   16 +-
 include/drm/drm_cgroup.h                      |   81 ++
 include/drm/drm_device.h                      |    7 +
 include/drm/drm_drv.h                         |   19 +
 include/drm/drm_gem.h                         |   12 +-
 include/linux/cgroup_drm.h                    |  144 +++
 include/linux/cgroup_subsys.h                 |    4 +
 init/Kconfig                                  |    5 +
 kernel/cgroup/Makefile                        |    1 +
 kernel/cgroup/drm.c                           | 1059 +++++++++++++++++
 19 files changed, 1773 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/cgroup-v1/drm.rst
 create mode 100644 include/drm/drm_cgroup.h
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
