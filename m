Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C986369CE1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7246ECA5;
	Fri, 23 Apr 2021 22:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5E56ECA5;
 Fri, 23 Apr 2021 22:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kxu41z7jlhPukTZAiSItjVBqlGcDycB4EUUz1d7JQTA6MxOEFITx6qlAANuGwJM45fMoj/EnxMHz0JjvyS6sy23kdrtT5bpNEM93eyk0v5aXaOrttawiFKrJpDP76iktMQ2wEBdaK3rcF057PiW3Iu/rXzi9ajT3MkJvjSAdz1ZiX2vxesLD4lbo233/7o/PpAPXJvY3TqOLdRSG+pt2iN6I7oQ4BNkEx2FwZuJ9HNw1ZNsdUd73wlxK163mI6Q+9Onqb40ChH2/ZuKLObqJeJrUT1qMnga1DGKA0wOpPMaQqqcX4VQu8ODxESDO8wwU8zUuij08dWZZN3TcMUkg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQUi/35hZO64D9FaCkVjYeRGTIBjXXRE5RwhAb3wkss=;
 b=P/i2ckc6jzrHA305irYqQr4fUoCSfIsbMKJ0IW7m2iJ5H8CycUpW3y5DD1H9M/Gi9JsdtjHp/bDv+dyakk0MNMngVph+aQuEJDiDRLa9R0CraeFCiCrZJwFNjaCsZ/YPZmni7QJNoBxl7lkj+Tk6md/o53x+jTsLRAhlYaaltPba7uc9pMPYE6YE/tmWWem5ZWKL2RIsmO/G8jO1/6t3ef0gm+fqz6t1mPLSunprmtkl83eibFB4A7EL6eDZycbxeOwFGqkb1VXh0CHICEDNKYscv5eXX0wGrgfOf5fvTellfJ6JtwxMiWGPhMgdnXswC+3jk15aueKIpbzSyW5BJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQUi/35hZO64D9FaCkVjYeRGTIBjXXRE5RwhAb3wkss=;
 b=EzRiJ8JxVigaSywWckI/lT3PYTxX3QW8MP3CT0dxpphM83LpVnDBVkM8/dsbWw6EE8/onaMCcS1jkz7Q5pvoEtslS0PpHk/+uMrnjTh87ZxDxS9ABOpd9wSqgQoRZyFO6E2OiZnNtTY7X/u1BausqNlU2I+vhGjXUnSg7/dz2Po=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 22:39:37 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%7]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 22:39:36 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu, radeon drm-next-5.13
Date: Fri, 23 Apr 2021 18:39:20 -0400
Message-Id: <20210423223920.3786-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [192.161.79.245]
X-ClientProxiedBy: BL1PR13CA0245.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::10) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.245) by
 BL1PR13CA0245.namprd13.prod.outlook.com (2603:10b6:208:2ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.15 via Frontend
 Transport; Fri, 23 Apr 2021 22:39:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd0cc0da-4edd-43af-d4ad-08d906a8ac55
X-MS-TrafficTypeDiagnostic: MN2PR12MB4128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB412809FED56DD48185D96867F7459@MN2PR12MB4128.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXrNF06To3INpZFggGPkHjBlQtg1Jgd7GgyBfXKpTPI3jRCGEXk4tblC+5X1b/q/XIGpK0whwBnTR2wwDWPe0sMe9D/crx2+xHn28XKRf647HITuTfcBtRl0kokigARpJW8oGiwrbyYLQbxxwi6eGIVtoNvUfC1dypChIaCqfpv9RZVagUTWiPWManZX6vrTZOzRSCl0JOYGUoI6it/Dee1G5lrVv3nOYqS6NWPdeP5Nxv+eOd7TbTYuiHVd4B2U3buItJc10ECT3JcKhLjpRzhSE6fnEk5zv5J/Z3vYUKlFrmhggG5qiy1NNqA2KcndFDdhucypCLccAuVq8RVvqZHmNX6Xkzn7hQn4Pu0lvDGqA50MdX4AYEkdzkSCVrwt9xiWihToew+YHyw17/YpQiGrLx8KF5YcOC/C1oVT4S+N75hk4LnZD12bOe8FH+vQUp2C4+zfbp2AF9d4/Wm0KpHUCP7o0eoVCt7otAC8uizRec/tey9dQ2sSTYts8vqF+XXqx/E7UUPozm4vbzHChDNCsryZ6P5RYcEK+SJUeTbR4568tkp7+OFLFaxWNhQM5TaRnJk8fzvODtY8nem3GAVOj3szxl6flSJq6L2PWT8t+VBqxRp8jnog+xUBlGEeYdj5KQz/DeMMxjYeA8xbcDNoWDv2V4HRfpZlo6YhshomyCql01Gc7GsDZiXXupSodNhfFUt03FJqR+GhCEvQQK0ubrADtPK/0srb+kFd7C2E3gNKhYrBf+8vfb+t/K2Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(6666004)(16526019)(186003)(26005)(4326008)(83380400001)(6512007)(316002)(86362001)(2906002)(38350700002)(38100700002)(478600001)(36756003)(1076003)(8676002)(966005)(8936002)(2616005)(956004)(6486002)(6506007)(66556008)(5660300002)(66946007)(66476007)(52116002)(30864003)(69590400013)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xcvQHEQHxuOKh0Kk08plUeOfgVB7xT2UfSgizK6OCqcOHATPQX3Z74iOOcHK?=
 =?us-ascii?Q?0EctyojIcaUkBwaWYl0Nl0zaIx0K4IWvq30cwypJgFAiJYW3WKPnHhTP/mE3?=
 =?us-ascii?Q?mRFlV5ufiOYvqRRCOB6xllGKZHhrTCBU0GBBnjzWjr+ugSdDW28E4IgEGpEu?=
 =?us-ascii?Q?4KdwyMC0u9jhj1jnnCBqyEkg0auT9/WgbUuGbkNj9AlWXCC9LQpc8X7Q1+SQ?=
 =?us-ascii?Q?Ywd/ePSoKfnsseiEv3vtnpsfNPOrPmLbpJfaZkfO31C6WtcamuGxJjIkZ6ac?=
 =?us-ascii?Q?S1uxljV1hnh334vMGXEJ1XzXU4Ym8Em6XuibN7BeXGqXc4JePf6C6Pj3PUEq?=
 =?us-ascii?Q?0etapMsNFfZHPxXILFDW2XuTD36uy/qaAm5+IuhdBnJ7McComydoiNOiyAsh?=
 =?us-ascii?Q?ng7RK8QQQ1n8xT8Pvd3kTZsLcmzjLVx2kyajiAZGJK9tT+5N6///abRe+4FF?=
 =?us-ascii?Q?sbMMJbu0VrTFuqRdvpTe1P8MLZapYnk011EYURDh/BkyTdsH5CLE2ssQC5kB?=
 =?us-ascii?Q?gM97INcPG6LprUmzE2JuMk3ovxQOhn+WB5lWLkYB1OG4LG76tD2eCoyYYwsR?=
 =?us-ascii?Q?IztPv0faR6mBVGnHy6LD42PLBoi5+BeF10vYlqHIPpQtOPXFGZa0GqO3zEFT?=
 =?us-ascii?Q?OLdlnmTBokpo1XckVkglbrt6zVi9ZqIq4oEHmRQ3nWfv+dRl19t/icwU7FmH?=
 =?us-ascii?Q?q7IEUSXbXYb/ETBDMXYuhA5Q3Qn0aC669g2Yd7p6SNIaVxZSIimjRt9lGgDr?=
 =?us-ascii?Q?4P/AAbJ03F1nQvtyXNbWoC+UJqYpV3lJNvf84GIPCCzKVxlUkNh4lFoJ4mva?=
 =?us-ascii?Q?V4oXVRqrcRe6kQV7ZifyAV8dqQoPaaSL9aCyju5JqXsLkF6eF24mZPBvbm9g?=
 =?us-ascii?Q?vvDF8Y+oVhVm9da6WpzsL3gVf856r5gctjSTnnwjipUezmBkshvS3scpijJA?=
 =?us-ascii?Q?ccVbWY7mYVhJlkyhIhqb6OXcrWzYl032h6guKLOillO7AzX5Q/agtSwQWcZD?=
 =?us-ascii?Q?flanpB5nDbfUUfnDX32mP70qLEGEHwSIXvAJeq2h0fDR4qzR6MLrUoNzyoD1?=
 =?us-ascii?Q?hhCehMJrmplY8X6iU0RcRYtgk+SwiiS6URsivSSaNNVmOfmv/2B+KmP76Zpu?=
 =?us-ascii?Q?E370KSDk+L3TkiqT5n/dId9dM2EPNjUs+qJ2zqxF/sZd/MBis0JgGgAyM/Kf?=
 =?us-ascii?Q?gv095GUQ7MoeIbVY1t0PGc1p2m46x7dm6VjlezVI49SnJUMI74dEnd+wPlk9?=
 =?us-ascii?Q?gYwC5Q2ToJAJEPCPDWgCabxp/K97fUNpdYNeAITsN/MGu2quqSXGyZArBUmw?=
 =?us-ascii?Q?rp6bBmuez/nEP1mXcki5j86T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0cc0da-4edd-43af-d4ad-08d906a8ac55
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 22:39:36.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jl7HGhZc3Cr7VZd1l/pDD7GhAvEbxR6HJ8D7fn2JK3beoSrV3i2P2Q5OwmVFTxUngfr4+nGuH6avXZEytQbBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.13.

The following changes since commit af8352f1ff54c4fecf84e36315fd1928809a580b:

  Merge tag 'drm-msm-next-2021-04-11' of https://gitlab.freedesktop.org/drm/msm into drm-next (2021-04-13 23:35:54 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.13-2021-04-23

for you to fetch changes up to 7845d80dda1fd998a34bb1a15ff9aba260a58f32:

  drm/amdgpu/gmc9: remove dummy read workaround for newer chips (2021-04-20 21:45:36 -0400)

----------------------------------------------------------------
amd-drm-next-5.13-2021-04-23:

amdgpu:
- Fixes for Aldebaran
- Display LTTPR fixes
- eDP fixes
- Fixes for Vangogh
- RAS fixes
- ASPM support
- Renoir SMU fixes
- Modifier fixes
- Misc code cleanups
- Freesync fixes

radeon:
- Misc code cleanups

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/gmc9: remove dummy read workaround for newer chips

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.60
      drm/amd/display: [FW Promotion] Release 0.0.61
      drm/amd/display: [FW Promotion] Release 0.0.62

Anthony Wang (3):
      drm/amd/display: Force vsync flip when reconfiguring MPCC
      drm/amd/display: Add DSC check to seamless boot validation
      drm/amd/display: disable seamless boot for external DP

Aric Cyr (3):
      drm/amd/display: 3.2.131
      drm/amd/display: Fix FreeSync when RGB MPO in use
      drm/amd/display: 3.2.132

Bing Guo (1):
      drm/amd/display: add helper for enabling mst stream features

Dan Carpenter (2):
      drm/amdgpu: fix an error code in init_pmu_entry_by_type_and_add()
      drm/amd/pm: fix error code in smu_set_power_limit()

David Galiffi (1):
      drm/amd/display: Fixed typo in function name.

Dennis Li (2):
      drm/amdkfd: add edc error interrupt handle for poison propogate mode
      drm/amdgpu: fix a error injection failed issue

Dillon Varone (2):
      drm/amd/display: Fix call to pass bpp in 16ths of a bit
      drm/amd/display: Report Proper Quantization Range in AVI Infoframe

Dingchen (David) Zhang (2):
      drm/amd/display: update hdcp display using correct CP type.
      drm/amd/display: add handling for hdcp2 rx id list validation

Eric Huang (1):
      drm/amdkfd: change MTYPEs for Aldebaran's HW requirement

Felix Kuehling (1):
      drm/amdkfd: Remove legacy code not acquiring VMs

Harry Wentland (1):
      drm/amd/display: Add debugfs to repress HPD and HPR_RX IRQs

Hawking Zhang (3):
      drm/amdgpu: correct default gfx wdt timeout setting
      drm/amdgpu: only harvest gcea/mmea error status in arcturus
      drm/amdgpu: only harvest gcea/mmea error status in aldebaran

Huang Rui (1):
      drm/amdgpu: enable tmz on renoir asics

Hugo Hu (1):
      drm/amd/display: treat memory as a single-channel for asymmetric memory v2

Jack Zhang (1):
      drm/amd/sriov no need to config GECC for sriov

Jake Wang (1):
      drm/amd/display: Added support for multiple eDP BL control

Jiansong Chen (1):
      drm/amdgpu: fix GCR_GENERAL_CNTL offset for dimgrey_cavefish

Jinzhou Su (2):
      drm/amdgpu: Add graphics cache rinse packet for sdma
      drm/amdgpu: Add mem sync flag for IB allocated by SA

John Clements (3):
      drm/amdgpu: update mmhub 1.7 ras error reporting
      drm/amdgpu: update gfx 9.4.2 ras error reporting
      drm/amdgpu: resolve erroneous gfx_v9_4_2 prints

Joseph Greathouse (1):
      drm/amdgpu: Copy MEC FW version to MEC2 if we skipped loading MEC2

Kenneth Feng (3):
      drm/amd/amdgpu: enable ASPM on navi1x
      drm/amd/amdgpu: enable ASPM on vega
      drm/amd/amdgpu: add ASPM support on polaris

Kent Russell (1):
      drm/amdgpu: Ensure dcefclk isn't created on Aldebaran

Lewis Huang (1):
      drm/amd/display: wait vblank when stream enabled and update dpp clock

Lijo Lazar (2):
      drm/amd/pm: Use VBIOS PPTable for aldebaran
      drm/amd/pm: Show updated clocks on aldebaran

Luben Tuikov (5):
      drm/amdgpu: Fix a bug for input with double sscanf
      drm/amdgpu: Fix a bug in checking the result of reserve page
      drm/amdgpu: Add bad_page_cnt_threshold to debugfs
      drm/amdgpu: Fix kernel-doc for the RAS sysfs interface
      drm/amdgpu: Add double-sscanf but invert

Michael Strauss (4):
      drm/amd/display: Add debug flag to enable eDP ILR by default
      drm/amd/display: Disable boot optimizations if ILR optimzation is required
      drm/amd/display: Remove static property from decide_edp_link_settings
      drm/amd/display: Add link rate optimization logs for ILR

Mike Hsieh (1):
      drm/amd/display: Fix DSC enable sequence

Mikita Lipski (2):
      drm/amd/display: Remove unused flag from stream state
      drm/amd/display: Connect clock optimization function to dcn301

Mukul Joshi (2):
      drm/amdgpu: Reset RAS error count and status regs
      drm/amdgpu: Fix SDMA RAS error reporting on Aldebaran

Nicholas Kazlauskas (2):
      drm/amd/display: Fix DML validation of simple vs native 422 modes
      drm/amd/display: Always poll for rxstatus in authenticate

Oak Zeng (4):
      drm/amdgpu: Introduce functions for vram physical addr calculation
      drm/amdgpu: Calling address translation functions to simplify codes
      drm/amdgpu: Introduce new SETUP_TMR interface
      Revert "drm/amdgpu: workaround the TMR MC address issue (v2)"

Qingqing Zhuo (2):
      drm/amd/display: Update modifier list for gfx10_3
      Revert "Revert "drm/amdgpu: Ensure that the modifier requested is supported by plane.""

Ramesh Errabolu (1):
      drm/amdgpu: Use iterator methods exposed by amdgpu_res_cursor.h in building SG_TABLE's for a VRAM BO

Robin Singh (2):
      drm/amd/display: fixed divide by zero kernel crash during dsc enablement
      drm/amd/display: removed unused function dc_link_reallocate_mst_payload.

Roman Li (1):
      drm/amd/display: Fix hangs with psr enabled on dcn3.xx

Shashank Sharma (1):
      drm/amdgpu/dm: Fix NULL pointer crash during DP MST hotplug

Simon Ser (1):
      amd/display: allow non-linear multi-planar formats

Tian Tao (1):
      drm/radeon/cik: remove set but not used variables

Wesley Chalmers (2):
      drm/amd/display: Set LTTPR mode to non-LTTPR if no repeaters found
      drm/amd/display: Unconditionally clear training pattern set after lt

Xiaojian Du (6):
      drm/amd/pm: update the driver interface header for vangogh
      drm/amd/pm: add support for new smu metrics table for vangogh
      drm/amd: update the atomfirmware header for smu12
      drm/amd/pm: add the callback to get the bootup values for renoir
      drm/amd/pm: remove the "set" function of pp_dpm_mclk for vangogh
      drm/amd/pm: revise two names of sensor values for vangogh

Yang Li (1):
      drm/radeon/si: Fix inconsistent indenting

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  63 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  41 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  82 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  34 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   3 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c              |  16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |  32 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |  24 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c           |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   9 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c            |  24 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             | 128 +++++++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             | 125 +++++++
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  10 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |  11 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4.c             |  35 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  28 ++
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   7 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    | 193 ++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    | 129 ++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  27 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  38 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  35 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  25 ++
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   9 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |  58 +++-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  37 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  87 ++---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  63 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  33 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  13 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   1 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   1 -
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   2 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  10 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  15 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c |   2 +
 .../gpu/drm/amd/display/dc/dcn301/dcn301_init.c    |   2 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   2 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   8 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  31 +-
 .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   2 -
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   2 -
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   2 +
 .../drm/amd/include/asic_reg/gc/gc_9_4_1_sh_mask.h |  16 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |  41 +++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 .../gpu/drm/amd/pm/inc/smu11_driver_if_vangogh.h   |  40 ++-
 drivers/gpu/drm/amd/pm/inc/smu_v11_0.h             |   2 +-
 drivers/gpu/drm/amd/pm/inc/smu_v12_0.h             |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 378 +++++++++++++++++++--
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     | 123 +++++++
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  55 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   2 -
 drivers/gpu/drm/radeon/cik.c                       |   4 -
 drivers/gpu/drm/radeon/si.c                        |   2 +-
 80 files changed, 1854 insertions(+), 445 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
