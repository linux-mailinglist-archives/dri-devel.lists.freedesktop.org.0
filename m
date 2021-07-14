Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B73C9397
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 00:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326C26E4A7;
	Wed, 14 Jul 2021 22:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621CC6E4A6;
 Wed, 14 Jul 2021 22:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGNxgJU3yuwYEcuUtmktxvhm8fftVvg39Az7nn9z2ue162BWvf1TIlh1GoJ8CwuxeQstKS3kQhvxYLIuiesFXsfQAUgR3ksKm4rPZ6HnFDjzNN3IVg4Jrei2N1U586tt5bWhKC5gViPDLvJ7x1D2OTfrIFGzQDMasgeTWQ6TqbAD3JvFjHwBl2INVu6QBvgOUDgIjoF0dXFBxAwk7DG+XOnXMJVPJvINHUrs2EVLMeFZ7y7WXDKmI4Y7RxXRijipLPwSimzgqYf8iQLIi2hzN6ldgLbHsLpuz5KfV/8IiqVFi40HhfaAgKo3aSlNUTvogDoviBYf7LfP+kF5DhBECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnM580c0wRFiG/yuRg4dOUzzEfVqWHDiDDYdZ+17fMw=;
 b=mgbRy6GUlvfXCi5Vmg60VOhFrv2x3x8M6+Ur5caIXux/AEk+Zhuk2/dt4HWgIm3F7XRChuVkbEIcdEl/bBdnh5ja8UXlkqX/bMKhgyO96Nt9auFpO8m8L//AAWhKxrttdyi1xAIkWFCPSoIBOiNB5+msKlvUv1ZDRhpmpYyYe0jVTZM7r+QzyTsVS0lFCLu41ofipArAD15iPytToXPpb8MwdajaCXgoEoK2v++UVSvH6ECHFHvFavjS1+gHHuzK0xVRlP8ej9rtSSaaoyABXLRKm219tf6vMC/hd9pW2MdylsD+GzRxuwLFmQF6Frkp9l7TKw3TYo7a6s59IzHLOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnM580c0wRFiG/yuRg4dOUzzEfVqWHDiDDYdZ+17fMw=;
 b=4CK7jZveGRzPJOvBL0qhyfK3slg7LvefeG3kTfTLmKkfaFhFHIp+j8BJLnRT62DPgzu7wJlioVCiHvUg6ip+GZn5ZAkfntC+BpOabIeKM+WHj7eJYacYiIxYTaG4vnyVZ8imb7VXzQiWwYvlAwMTKK/WqMWFpSy0TTY5sCTDfPo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Wed, 14 Jul
 2021 22:09:12 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 22:09:12 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, amdkfd drm-fixes-5.14
Date: Wed, 14 Jul 2021 18:08:58 -0400
Message-Id: <20210714220858.5553-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0151.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::6) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.246) by
 BL1PR13CA0151.namprd13.prod.outlook.com (2603:10b6:208:2bd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Wed, 14 Jul 2021 22:09:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58787314-6a37-454f-29f3-08d9471402a9
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB532020269593D1D018B2555AF7139@BL1PR12MB5320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRsikOfYiB6gOtWhi/JeSgJafY53EqFuBZrgHkHOOo4XbtCBu9+FBzVoHY+KZ+3GSgW9RHQ7FaCAMn+XWAs8JIxtkkCJ0x1UVSWBAFjtAPXQnIaGN8G4Uv0jLq1eeqwZ275+IeX26C7uOx5B8421HXUSLJWt04Zp+reACzgZlFYipdwAOyF14+ajhY9JN1NPEiJII7Y0XuD5nyAwnjO9YydZJTmI/fzZ0KHUAw1R9Q4UkJwcCzqzyceVkyPXGV8DcRhyZLCIyjjhKYaJr59LAftyyV+NxFe7iIh8Xhf7Kv52G+hwKHjv5y1cmO8iQsrFoX9yBthAi0Zp2JYYpuyRJylmz+HehV1IkWqi7TdNLRzH1E2hWZ4fyJhasTl4VlWFRnH5qw18xB2MGbuTaRtnm6mKRuLVcdTsAvQCWJ0df1k+Ac/IxZsmhhyVDTDPAdP0Szzn1BrgKp6hQI7HZtMbfAmB4jNnHpKxprL4P/4opPkPC/7TBj9uRF4Y1i5NmZO1LLKmdVLQw4/zjnGwtoDqabvmCW5tPhiNPZQ84HbezUOfiCcleYZVeGP4wY0zGuq4x9xq+kEREVVTypU0E3JNm+mLCl3bHzVl5lCPCWQ+wjYP0PziZT6/2jHQQEuRKyW4LN0KeiLFu9NkrUeYCrG1paKyGu0XwijybB5xYmNjDacX4zF9gqktbXsVb3xEXtXtdYh2hAuuC3hP+PsoRXyOeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(36756003)(4326008)(5660300002)(66946007)(8676002)(6512007)(6506007)(186003)(478600001)(26005)(2616005)(1076003)(8936002)(86362001)(956004)(83380400001)(52116002)(2906002)(66556008)(6486002)(6666004)(66476007)(38350700002)(966005)(38100700002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U1U3mRn9wzie5KYcSm4sw4ZVKgjrAp8xFmcYVr/I+DS84i3MvLAeN2es/7Pk?=
 =?us-ascii?Q?rDjBVP/82s/unAbOBfXYphc4XnJbeuTfTXKgmfJzf3TMbl266nTQCrjc0Rsm?=
 =?us-ascii?Q?ErmN10Bkj7uQovoyH6wdyBmCmP9pljdzCRau4ku9biVNCJYX6+EGINALS+4r?=
 =?us-ascii?Q?hm1Mmup78ZPA1Z7hr6MGy+IfzMwI/Dd1Ms/HkONq3DIQXMfmYTA2AdprDudQ?=
 =?us-ascii?Q?bvf9jHGoFVur7YCeDzSGFpS5KphAasWyHmkG63zLkY2X2IXkXoUP72CUA+hq?=
 =?us-ascii?Q?sq5JglnRVoYec/Rxmbx1qFNqCyo8lYHgOeL64X6LFCkjPPjCAv2PHv7JhhG2?=
 =?us-ascii?Q?pCcOTtRB2FNtckPf7xfIcUyMbpFjJ/LgXvdYLc/Ny7gj0OplG5ujPtyCU3IQ?=
 =?us-ascii?Q?7GBc2kdfEB6Hjw7YymgBHuxSuRg7bEppMigs09y1jfQwrXAOnPl6nUSlPCeQ?=
 =?us-ascii?Q?cx2d2zuAhtuas7G8V6YI0uiAYTxZsUs1WDAQmXZKqSbhq+0KE0r8QBImhIrC?=
 =?us-ascii?Q?maHWHTxcRC7x5TR7KJwglk35me6wrq1/0hW9v2huDREpuDvCTPaX6JcXsFcU?=
 =?us-ascii?Q?ffFfq9d1bqDha2pNAV+yfpzNaeSzLp7DQ55JzB98BPVcwxEO93Mpmcr7n8gF?=
 =?us-ascii?Q?EGns6KZ06WWB2GO4zpHlB+AgReeeh7qcpmuMO9Wdkj+VvlojEIEcMHGaVxHw?=
 =?us-ascii?Q?It6waaz7YiUlIdmP40d8x992MDis5Tn7Xw2/yQAVH/yeidhZW4k0X3RcwBS0?=
 =?us-ascii?Q?5EgRTSSfQat6lssCFX9Ehmxar3Xz4Ld/Ru/d6rqs3czAJk6KIuaM2tb5wFr3?=
 =?us-ascii?Q?6oUwhZNv+qevL7RzhAVAMc3IZiDrRwp/ohoFk2zfC11A1KCFBhUMPZGccuqf?=
 =?us-ascii?Q?EDjFxrz0f+m9a0bjsV3Xa6bY5dymOPl3ordjbUMEKpHBUqi5Yc2AhE35Btac?=
 =?us-ascii?Q?NlFiqvCO9Egx5y1xvbe/+BLyl0KwcCGygO30+hRYcDQAlezmVdKr9hu8WZ6D?=
 =?us-ascii?Q?/1uUagQWZ7wxGvj/Z4SJQF7m3kWe3LkMwfadOA+b913uJmRs2DjxueMLUH9h?=
 =?us-ascii?Q?Hp/MUuIJ9Y9IaIo0lG4KicI3scr0mb/ZZa6fK0f7yEnahLZOsf4YIfObH8Zs?=
 =?us-ascii?Q?8UjwSgitF6Z/8+3H75EUv+vYKgYJj2X2ge5F49m9LXKA0ipTakK4+nRIZDqU?=
 =?us-ascii?Q?T90j3vg4gEbN2I0aUkf+T/71ujW3OP49Ey40gm52+M/w0Ad0TmNo+RGvgUoA?=
 =?us-ascii?Q?uFbTSOXdovnBUwDB29+H9Y4d9AcsGjt+RtUAZUMNvg68d4kZAJEiL4DgFs8S?=
 =?us-ascii?Q?OHxhgzlwqyG1DiUP52rO9Jts?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58787314-6a37-454f-29f3-08d9471402a9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 22:09:12.0717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwq4wNn+Msbt0Dsbzr1s9DOZYTmfdGDjwcTUm3VGf577cw8g90wtGSs2l+qx7hYLMcqyHWtjccA9hjEV8a2KGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5320
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

Fixes for 5.14.  The big change here is unifying the SMU13 code.  This was
new code added in 5.14 to support Yellow Carp, but we've since cleaned it
up and removed a lot of duplication, so better to merge it now to facilitate
any bug fixes in the future that need to go back to this kernel via stable.
Only affects Yellow Carp which is new for 5.14 anyway so not much chance for
regressions.  The rest is just standard bug fixes.

The following changes since commit 1e7b5812f4890ad84058bbb6c4a5deddfb2c5b25:

  Merge tag 'drm-misc-fixes-2021-07-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2021-07-13 15:15:17 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.14-2021-07-14

for you to fetch changes up to 775da83005cb61d4c213c636df9337da05714ff1:

  drm/amdgpu: add another Renoir DID (2021-07-14 15:08:55 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.14-2021-07-14:

amdgpu:
- SR-IOV fixes
- RAS fixes
- eDP fixes
- SMU13 code unification to facilitate fixes in the future
- Add new renoir DID
- Yellow Carp fixes
- Beige Goby fixes
- Revert a bunch of TLB fixes that caused regressions
- Revert an LTTPR display regression

amdkfd
- Fix VRAM access regression
- SVM fixes

----------------------------------------------------------------
Aaron Liu (1):
      drm/amd/pm: Add waiting for response of mode-reset message for yellow carp

Chengming Gui (1):
      drm/amd/pm: Fix BACO state setting for Beige_Goby

Dmytro Laktyushkin (1):
      drm/amd/display: remove faulty assert

Emily Deng (1):
      drm/amdgpu: Correct the irq numbers for virtual crtc

Emily.Deng (1):
      drm/amdgpu: Restore msix after FLR

Eric Huang (5):
      Revert "drm/amdkfd: Add memory sync before TLB flush on unmap"
      Revert "drm/amdgpu: Fix warning of Function parameter or member not described"
      Revert "drm/amdkfd: Make TLB flush conditional on mapping"
      Revert "drm/amdgpu: Add table_freed parameter to amdgpu_vm_bo_update"
      Revert "drm/amdkfd: Add heavy-weight TLB flush after unmapping"

Felix Kuehling (1):
      drm/amdkfd: Allow CPU access for all VRAM BOs

Jingwen Chen (1):
      drm/amdgpu: SRIOV flr_work should take write_lock

Jinzhou Su (1):
      drm/amdgpu: add another Renoir DID

Luben Tuikov (1):
      drm/amdgpu: Return error if no RAS

Nicholas Kazlauskas (1):
      drm/amd/display: Fix updating infoframe for DCN3.1 eDP

Philip Yang (1):
      drm/amdkfd: handle fault counters on invalid address

Wesley Chalmers (1):
      Revert "drm/amd/display: Always write repeater mode regardless of LTTPR"

Xiaomeng Hou (2):
      drm/amd/pm: drop smu_v13_0_1.c|h files for yellow carp
      drm/amd/display: update header file name

Zhan Liu (1):
      drm/amdgpu/display - only update eDP's backlight level when necessary

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  45 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  30 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   8 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   2 +-
 .../drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h | 355 --------------
 .../amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h    | 531 ---------------------
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |   1 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h           |  57 ---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile        |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  24 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c   | 311 ------------
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |  49 +-
 29 files changed, 182 insertions(+), 1372 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h
 delete mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
 delete mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
