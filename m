Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5960374DF9
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 05:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9596EC94;
	Thu,  6 May 2021 03:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB136E0BE;
 Thu,  6 May 2021 03:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxJLaj2sD6dPD7CI9DGI1UAIECnNQASsAJ5ngZzb5ppeiWnwUfi4Tu4+lrPMkNFz1L3m5L/WPVB78OsFNXWhKhDvXRcyjVgMJjjEsx2I9PWgF6ElR9I5JxvW575ZHD37l+pmyzjapzQ607w6Ux7Lt1rhk+sejIaxNEMF8AzYE6O7p8Fi2LV5/9JCH91NfyPYKg/1IrRCQpNptz+x5IZPbm+RZx+le8fjyJMD/BqZuIGggFzudQLQiayfdI3nQxz3/vSwK5dr6c0w633l7YSQcVPpnH6q8PAmigFQeiG8JMKXSq11tKw5m4VHPQ4PMhGVFLC+tsXu/YsSPuK9hS93hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjOk4seMZZwoGNJH0/Ojbrpzk3ewpvN5Zr8aQfd8dLM=;
 b=ewBhc3FzKjG0AomnuUUm6C+0cBGxlE1PR+J7cATlcThDj17tJf3Iq2XXhwXlBHedkC3bsQ2+23haqG7jZ35WCn8t4wm1/HI2DVATWCiq1eqdavEtqNWGuf4iW2bKkaZaqoEKRk+pFNV0z111qSOtRXkf5L5txBgeD2dPI2zwqATy1bkZhddCb+wh+Q5EWDYsYeXxzhLUZyjBrTTXIOY4x9Ig1C4UqMeIdmApNrb+hmIDOS/YAFLfYZpbFoH/4LEooN+9aNKk3j0i9Lz5PQk0cHwKvwm9haB7kEErVnDvWfZJBCvBK/ourymG3hoJyonIaPh6W+2hNGnV0EIP6po7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjOk4seMZZwoGNJH0/Ojbrpzk3ewpvN5Zr8aQfd8dLM=;
 b=1tH3BhsPOMTKCJEVOGd707isRYGVybD8v0nt7VObBY0YWozH6UnqxihEM1f5itLfNMslOGamGnPqSVbXDF1vuduCLCPCuyRqr4U8mPFp9p2ZvvHhUwVQHYqa87h/uFCb75mWeRFruIUavaANN/JmHLCNA4XMLEMEutip2xKtsVI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3853.namprd12.prod.outlook.com (2603:10b6:208:162::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 03:39:47 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4108.025; Thu, 6 May 2021
 03:39:47 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] radeon, amdgpu drm-fixes-5.13
Date: Wed,  5 May 2021 23:39:29 -0400
Message-Id: <20210506033929.3875-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.161.79.245]
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.245) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.9 via Frontend
 Transport; Thu, 6 May 2021 03:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3c8dabb-a50c-4cf5-5d43-08d910409860
X-MS-TrafficTypeDiagnostic: MN2PR12MB3853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3853AC8B023ED4B8A1BDC191F7589@MN2PR12MB3853.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvjRolAK3CUYvcav94oulygyp9Mdo8CFnorK7RYU0mdmHYdBjwYJ1iuR2QiomVzWm9IYkYBQsrlc2hRfht8YequD75TaRFn0dhYwQTCa9S0Yk/NT8cIkE9NdJaElNE2CoE5b9I3Jn0kG6y03lgDMsdd8NIk9/P7zA5yS227uie4irQ/GZwZ6zLLQ0fV2X5nGf5goEYYcMtmNbPSJUAFBkvPLAcyKy1gAXFISjvMTO8nrH1iqXnmo5j1ZCb1FinHbvu90CZM0KQL2YA1TEOcHW8d7gzkF2OWYBmf+FuxdT8GAghKGn/p8ICFU6hK8/qT1s8CL0gv/Pqxnz1dK173csMGHm58WnxmrDktXa2hwcScgOeP/f7R4WJB9CF3vDSJvqiNVZvzELtfEldQ5EYcxoGtAUZHQtlaLtyR0CNc8JAmq63vOp/XmvKE5nunaWAtGQCu+3PzMK3v/SvEHi9cYtpjM/rDWyzWNK4SCDpvWNnMeqbpco9Ul6FgxhnENHslh39KtIqseXpnrua2iEQ2U+kx2/Z+pPC3wNuLRMQeHAvWE5Mrxxr07NyUShV+Qgj7g6J3znGtGgGOdmMxRG7VPakt9SrEjfSfpubVH46GS5FutxIUZOOwsWxAbJga3s8Q/QT/7n/hfXS0JWrI/rZWs3xNwHFIN4+fx6hxJ2G/mpIRnR10ydkrU8eunb9sgq8VzXrY9Q84JVjHBwW6tQi60qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(956004)(6506007)(1076003)(66574015)(5660300002)(66946007)(2616005)(16526019)(86362001)(186003)(8676002)(83380400001)(316002)(36756003)(52116002)(8936002)(478600001)(38100700002)(38350700002)(6666004)(4326008)(6512007)(966005)(66476007)(2906002)(66556008)(6486002)(26005)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2xFcUtLS0FqczFVWHg0YlgwNDhhZ3p5RU92TU5BOS9ONGh3U0RFcTh1aWVr?=
 =?utf-8?B?RDRIWlJOUkhIZ2hMT3Qrd2ZacFp3SFVHZEMzdEFOZnRkbkZ3cmRNQ2pTL3o3?=
 =?utf-8?B?bTh4UHRjM3lHTTZSdW9VUy8rcUV1bEtJd21UWDNzNzhLb3o5ZzcvdDM2UEVN?=
 =?utf-8?B?elRZank0TW01NVc5SDAySWhhck9JZnU1VXFSVFczT2QwTkpnSkUrRFpYUnph?=
 =?utf-8?B?cVRpQ3hwQUY1SzVYL2FFaTlPS3NuVVFEVUNTUGF3bDFCS3JyVkpiaUhSWlB1?=
 =?utf-8?B?b2dkVE9UeDdBWDlER3ZjSEtiN20wSWFsNTVMdmt6VG9OaEVBQ2VkMzF2SVU0?=
 =?utf-8?B?ZUJ5M3JhVy9wclY3N29XenlmbTI2YVUzRkE4RlRlMWsyanp6U1NaT0xLYjJ4?=
 =?utf-8?B?cUpscnpzNVN1Mml4MFlja3VvNEdSd05ycnlpcVd0TWI3Ujk2OW5YRFV6N044?=
 =?utf-8?B?Q0k0YXYxOFM5U1dQUzRIT2tJMzZ5SHZITUhlV1RleFVsY2xSNlN0N0dkb01M?=
 =?utf-8?B?NlErWldsUkdpK0ZSM1l4bTNHTm9EVGpuV2loakwxRXA5anpkazQ4akFiWEdT?=
 =?utf-8?B?UXNLWXFCOG1tenlHR3Yvd05MUStUelVsK2dvU0Q5UXBmS280byt3VGJMUXRj?=
 =?utf-8?B?V2RkSlozNVg3cEZoZFVhYXlYbnY4MmlLVXZDSmNOMVdHVWtxWEplRWlka20x?=
 =?utf-8?B?eVBzbklJM3pJMmFtekFnMjFJSEttMk9LMlp5bWZJM3FweCtHcnJqTVpqVURy?=
 =?utf-8?B?d1pMc3lUQWdFN3pGa3MzZG5Zek43SXBlOWEwai8xQm5yYjQ3MElEWDRTeEoy?=
 =?utf-8?B?K0Zjb1VyeUpveGVDY29McERhUVR0K0M1UFVLWS9vUWtWaE9lUFA0TzRpZHgw?=
 =?utf-8?B?eUs0cHNlQlVXU2NPeHFocUpvTWpBdG44QVVpWXhHeGVrc3BVYUFVb3haK2tF?=
 =?utf-8?B?YVdTeTMvdVc0ZDRza0s4TmthYWZUQlpKbWpjNHV3a0JPMTg5enV3MmJRZ0px?=
 =?utf-8?B?QWVjRVV0cXhJbmExWnk2WldGNnVGQzV4ckJoRGdZMXppa3R1NjNHQTJmZ1J2?=
 =?utf-8?B?TDYvYkJIc3llTkc4dThkWGtMTmFjcWZWUVZnV1JvcXU3aVQxc1dOYmdEUitl?=
 =?utf-8?B?cVpVaS9lQlVNOTNWRGh2TXg3Unl1N05NVDVwWlEvcGM3K2V0NXUrLy9IRWxO?=
 =?utf-8?B?aUoxNHVUQjdPTk9HdUg5L3ZyZEtUVUJvN29DZlo0VlZFR2gzTk12cVdrZ0ZC?=
 =?utf-8?B?SzI0T1FaNHZ2VXIzME10OXBwYTdkbVVtYjJCcFZpa0cveXE1bS8yaU82SEs3?=
 =?utf-8?B?VlBHN3plaXpCT3BZWlNqTnBqdWkvODdQZEVIdXJMWFF6ZC9BeDhpYXRvSmpm?=
 =?utf-8?B?Mjg2UElEM2FDaFk5UzcvWmVhV01yUnVjbkJDS1VCWEZqRW9aNzZ5aXRLblAy?=
 =?utf-8?B?dnkvaUVBSXpnb0MwRlZmQUdQZVNOQ2xPd01Fck1uWENoQ3VnNFB2SUhuNFE3?=
 =?utf-8?B?QlM1Nlo4amZWdXQwd1h4U1BDOGF6LzZ6a3JpejdGa0RRWnpBQ21IZVJScS9M?=
 =?utf-8?B?T0xjNXp4UWlTelgrUWVaYzdTSGZYdlptNlVvOTdpT1l3Mm5SUUIzeFZjT1JL?=
 =?utf-8?B?WXUxNEd0bDFPTkdzczRDc3UxTTVpekx6bE9Fck5jdDJlRVhUM1M5WXQvRE5Y?=
 =?utf-8?B?b3pTSjB6ZmNiSXR6c1FBbEI4UWZNRmFnTForOTRyN3E1VS9rekZGeWJFRmxx?=
 =?utf-8?Q?l7/4VXI5M5MyTT/3YIV7Hl7j3djcFWWkZ/s68wm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c8dabb-a50c-4cf5-5d43-08d910409860
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 03:39:47.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSvnp/LOX+BmlCI5IZhqyHly0FYILGcNem6bMES5V8+fwq+/2WMgicSzdztIrQcgUP9Em7xKGc4MaZ8MQlHs0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
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

Fixes for 5.13.

The following changes since commit a1a1ca70deb3ec600eeabb21de7f3f48aaae5695:

  Merge tag 'drm-misc-next-fixes-2021-04-22' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2021-04-23 13:53:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.13-2021-05-05

for you to fetch changes up to 234055fd9728e6726787bc63b24b6450034876cf:

  drm/amdgpu: Use device specific BO size & stride check. (2021-05-05 23:09:54 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.13-2021-05-05:

amdgpu:
- MPO hang workaround
- Fix for concurrent VM flushes on vega/navi
- dcefclk is not adjustable on navi1x and newer
- MST HPD debugfs fix
- Suspend/resumes fixes
- Register VGA clients late in case driver fails to load
- Fix GEM leak in user framebuffer create
- Add support for polaris12 with 32 bit memory interface
- Fix duplicate cursor issue when using overlay
- Fix corruption with tiled surfaces on VCN3
- Add BO size and stride check to fix BO size verification

radeon:
- Fix off-by-one in power state parsing
- Fix possible memory leak in power state parsing

----------------------------------------------------------------
Bas Nieuwenhuizen (2):
      drm/amdgpu: Init GFX10_ADDR_CONFIG for VCN v3 in DPG mode.
      drm/amdgpu: Use device specific BO size & stride check.

Christian König (1):
      drm/amdgpu: fix concurrent VM flushes on Vega/Navi v2

Darren Powell (2):
      amdgpu/pm: Prevent force of DCEFCLK on NAVI10 and SIENNA_CICHLID
      amdgpu/pm: set pp_dpm_dcefclk to readonly on NAVI10 and newer gpus

Evan Quan (1):
      drm/amdgpu: add new MC firmware for Polaris12 32bit ASIC

Harry Wentland (1):
      drm/amd/display: Reject non-zero src_y and src_x for video planes

Kai-Heng Feng (1):
      drm/amdgpu: Register VGA clients after init can no longer fail

Kees Cook (2):
      drm/radeon: Fix off-by-one power_state index heap overwrite
      drm/radeon: Avoid power table parsing memory leaks

Mikita Lipski (1):
      drm/amd/display: fix wrong statement in mst hpd debugfs

Pavan Kumar Ramayanam (1):
      drm/amdgpu: Handling of amdgpu_device_resume return value for graceful teardown

Rodrigo Siqueira (1):
      drm/amd/display: Fix two cursor duplication when using overlay

Simon Ser (1):
      amdgpu: fix GEM obj leak in amdgpu_display_user_framebuffer_create

Tom Rix (1):
      drm/amd/pm: initialize variable

Victor Zhao (1):
      drm/amdgpu: fix r initial values

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  28 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        | 184 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  13 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   4 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  68 ++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  10 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   5 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   4 +-
 drivers/gpu/drm/radeon/radeon_atombios.c           |  26 ++-
 14 files changed, 328 insertions(+), 45 deletions(-)
