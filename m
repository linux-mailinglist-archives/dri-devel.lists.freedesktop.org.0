Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22152389B5D
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 04:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68ED6E30D;
	Thu, 20 May 2021 02:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF76E30D;
 Thu, 20 May 2021 02:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loOqdCiyTMsq9eb0PVmdV875xcjH6KmRID38xUakoPVM9Nd4IpIyIjvOuuM0Rb0WXe8uFLmxoiBQ8WAu7xxDNx+RxyJWfg01n/QZFWMpIeWRtSxm83xpLZg9TPrRZbGQGzydCoLN8Q6Mqbo6/shMIkSA/kfo/TleqelLHMUxGydY83iiTdoReaF8i6RW5ED0h7GGZygJIPcG+yGxZ8ytXIVJeNxGDoVWRyUyRBRrjWrvbSfGKeUQUUON7r4kPLAjNKvAEFP5TYuK2PgjGcnoMmQF/zoBMdyCOt54ZwRpBAzRMbZH3wnkxzhqZQlBn+xhZB6laboFv8z5Y5da/H3IsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pretYnA2TcDa4rNdFN5DSrL/XzsT0O1NMAlBtRmVEEI=;
 b=G8SASKpKbvMfTfDmKd/ZcM2dI37eP/g1Xo+8W77oVgb9Cf0s8JuMfzwps0tn6VnuJ8xgqPm7YnX263nFrSrATX5EZhwdHuTrXwp6F3rhcCat1K0XS9DTYyMBIO+3zGLtwe46By+1XsIqbq+iVm2aa+o7DGMUpjztlEq/znOucPEYMPkyvo0utqntXI4GQ2BepWfyLo9OKyiw4K/amakwxyhEyY44jqgoBWlfUDd4aOnBHqIvVCgePhv4kGDlOLn1puRiofR54xFnSqTilRe+pLotc0ARxZx8CqeakroZmECycmiDelVYTWEMq6IEQuSXBCUXz2odwZaAKwlQW9cqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pretYnA2TcDa4rNdFN5DSrL/XzsT0O1NMAlBtRmVEEI=;
 b=I3fqGARnbHwLWAlJxqIhP1wih5AoP31cLT3vOcNO2BrS8qPzqC6fO24r9axQO8L+wGkpq1GwrRJfvu6V37x8ujo2XETGTdgdPnsHLCoDmYgJXQON7Is4VJZMGc6uq3PZK3JUkiME7k1ZaFtjCgzukAyZLakdpkR0o/BVHXRK5SU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB3870.namprd12.prod.outlook.com (2603:10b6:208:166::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 02:25:45 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 02:25:45 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] radeon, amdgpu drm-fixes-5.13
Date: Wed, 19 May 2021 22:25:00 -0400
Message-Id: <20210520022500.4023-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [204.111.139.213]
X-ClientProxiedBy: BL1PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::15) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.111.139.213) by
 BL1PR13CA0130.namprd13.prod.outlook.com (2603:10b6:208:2bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend
 Transport; Thu, 20 May 2021 02:25:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a24ddf1-6ca2-4aae-4735-08d91b36926e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3870C5F824145527E45F3E1BF72A9@MN2PR12MB3870.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AdL70kpkQrNXyyWjuUZgQwY56lJ/pxLnF73omwzZ8MoZ0q+2CeYuv04iYcmbMrN/KPz16dd5PY2CBy7WkYhGQ7EUxQqbdJRP0IxAOyy4mQlgJt7EhdMFilU2MUVvn2laWZpy2ZvDX29u/ceZBjK1ckOy/VgDodhpdW/VtM5ZJ4nih/RJJPrnXvKRff+pfbJLJ7p/nrv5p2yRfGrh+U5z6drtqpDP812Kqw9Ool4Ff2hY4xhtZMmAaLMNw+dk5t43i7+HeO8FfHw3szqGrNxot5naDLrj5G0DE7pi3IgZ+Pepnq4UmH6OTdvoWgd/HILw5N0YjYirL2j5l42del1BHiKOEZcPC4DBB4YVT7muiIVt3LuUPPcddvoN0WMscBFyNHOPsOqRq7O3/ICzQ+lo/06ELGUkAAik6u/NKcpgJxRUHo+dwG2guf+Ic2PRvlM79omcBy5i4f1lEu1SH2lVqTkj+VEzbl4Jwya361UioI+zI2x7+5wXUPHiNNEPGEXbIgtnC1VkY2fQ7BQ3/nsmI41ysGAb2/OsG62zPtp/Me9m3BogmhgHyEuMowyDJr4go5GBHxUX2vwIZIPa2wsJbh7qcW/PsaJFUOy8hR14cJC225ZmWCFl9vr1cuIekULQJcif34zthpJajEWLvqld4pyqWCL3NuaKoFOfRDJUnS8trKgS48ltBMfyf2ba3eYo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(316002)(2616005)(956004)(478600001)(8936002)(66574015)(36756003)(6486002)(6512007)(5660300002)(83380400001)(4326008)(186003)(8676002)(52116002)(26005)(6666004)(16526019)(38350700002)(6506007)(38100700002)(966005)(66556008)(66476007)(1076003)(2906002)(66946007)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFdzamFscFd1dTVZNE5yaDJ1UFhISUQ3OXllbWNrWWg4NUlETUVHM1FhNWp3?=
 =?utf-8?B?Q0grNDRhdUU5YWx5MjNCK0xTbnh6V3hFWGR1UVVEVGFxYlZRK2RFQStZbi91?=
 =?utf-8?B?eEtYS3NSOXRwd0YwZnhYUmlqRDQzQVZxK0M1aXd5UUd6YjdRZlFPeFhYcUk2?=
 =?utf-8?B?UDBGRUNHR2pFbHF3am4zdGtGQ3J6T001SG84MzJYcTZZdE00bFZSU2lvallL?=
 =?utf-8?B?dzJkbWVMTTU5MFowL01yQ0VpenlVdzVKSlo4emNpV2cwVXNWZmNmdmszZVky?=
 =?utf-8?B?OFVHcXRIaXdiYWRXdFZGVFR0OGxSSm52alN5ZEZISjI4V3NnRzR0QWlmQnIr?=
 =?utf-8?B?Q2lGaTMvaUJscXBwTHVSZURGZGpLL2plL2c0L0RzdHI0RFo0YzYrTGVpWEUy?=
 =?utf-8?B?SzllekVBTXVMTWhzcU43L1E1RG5yZ1Avcm8vU1F1aUhBVUFPTWNRdEloTVdP?=
 =?utf-8?B?dmdwZ3hzOE1YUmFxZm9qTmp3UXBVMThROXZudFF1TU1sVksyT2NNell3WWlU?=
 =?utf-8?B?eWhXYkhsUHZjd1JpbmtPYmMzalRieGh6L21PTTRyYXdjbksvdFpsV3FIdTFZ?=
 =?utf-8?B?SGUyYk9OZzNob1BydVdiZjI3MEFmSzFBYzVLc2xYdUdqcllvUXVSTXVNd1VK?=
 =?utf-8?B?dzYvSXIyQ2ovWFV5S3l6cXZqbDdpYkVWN2g3RG9waS9OaFQrUVpBamxHdk9W?=
 =?utf-8?B?NmxrRnczRldGYS9VaVZCRmZzUUdwRjlHMC8yS05odWdsVUdwUHYwalpUKzU3?=
 =?utf-8?B?WUFtd0drRTBHOVVWSFh0U3lMZDZvaEtNL3FSWXd2T0phMWIrTlB1T1crWm1s?=
 =?utf-8?B?cFZlejVtOHd6T1JvdHJ0ZUVVeGU3YmZSbnkrSFBGZkJ1eTFmcVlFUTU0SzFu?=
 =?utf-8?B?WDVib0xaeE5sUUxoNWtSVSs2R3dPRURFTnZOM080dERBVFZpdnJ4eE0zRWRo?=
 =?utf-8?B?SnR5UmFYeFovTVVvZzRrY1Y1cnd5ZnMwZ1lyanBnSkExYXFOenlrK2g1TThk?=
 =?utf-8?B?TzhIcnhjN2ptVFF3NzFSckxHK1lhVkVpOEVkdWN3WXN0YUxneFpUWHVmNGlQ?=
 =?utf-8?B?Ny9PY0Q3cW1OYkE5YWpZcC93d2RQeVo1amxvZGhqRjh5Z3RxQ2pHdGFBSXUx?=
 =?utf-8?B?NHBjbjF3R3BlLzZaTzcyTi84NU5DdWNvaEV3T284UWx4UkdEL2JWVkhFbHJS?=
 =?utf-8?B?TDc1YTdCRW14ZFVlbEErcFpFczBzUWpUbUwybWdLU29tN0hlZTU5QzZhaXZ3?=
 =?utf-8?B?bUozcEdUYWlwVEpySFR5WE8zMWVXS0Focno0T005enkvMWk4MXAzWmRPaHJq?=
 =?utf-8?B?a0pjRTl1K0F4L2YwdDUyUWZqR25HalVQZUdkU0dTOTgxQkFNVk5ucDE4Z01O?=
 =?utf-8?B?SlRGSVIrVFRmTnRvOUJtYVM3NGhmWmxkSUNvSC85YTR0d0IzSXhBWi9ibS9K?=
 =?utf-8?B?bjJabVVTODJ6WjJCNlFVLzYvZ3RPcHBka0tZMTVIVGF2WG5XQXhnWW9BVFZu?=
 =?utf-8?B?VzhxUzBxVFAwR2NNbG8rY0lGa3JFNkNpSTNUdzhqOGhFQ1JuYXNJV3BUdGpV?=
 =?utf-8?B?WW5ac2dPbkZyYStDUm9yTytGdFJWaTRTeWNmMFRYMlpNeTlKZWc0KzNJNEls?=
 =?utf-8?B?VTJLcTRDWG5qbGJlck9ielRIWmdsem9aYnZqcFZXZ3VOVFIyTDVYcm1VV05P?=
 =?utf-8?B?R2g1ajRkajdURlQvbFdSek1Xa0Z0K09FRC9KNEFucVhsalQ0cjE3dVZJUGRL?=
 =?utf-8?Q?ICtcy/dAGlDJLYJS9K5XalZ3ox9LcPLP1QhQXAq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a24ddf1-6ca2-4aae-4735-08d91b36926e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 02:25:44.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzU6SfnOKJJXUhyYtKDOVHES6kan7UbtPIYcdf6kFnfq6DCDWau3Q4gnDscBzyUZydlhDaD3jBDm1U4Oi4Fmqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3870
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

The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.13-2021-05-19

for you to fetch changes up to a2b4785f01280a4291edb9fda69032fc2e4bfd3f:

  drm/amdgpu: stop touching sched.ready in the backend (2021-05-19 18:07:43 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.13-2021-05-19:

amdgpu:
- Fix downscaling ratio on DCN3.x
- Fix for non-4K pages
- PCO/RV compute hang fix
- Dongle fix
- Aldebaran codec query support
- Refcount leak fix
- Use after free fix
- Navi12 golden settings updates
- GPU reset fixes

radeon:
- Fix for imported BO handling

----------------------------------------------------------------
Changfeng (1):
      drm/amdgpu: disable 3DCGCG on picasso/raven1 to avoid compute hang

Chris Park (1):
      drm/amd/display: Disconnect non-DP with no EDID

Christian König (2):
      drm/radeon: use the dummy page for GART if needed
      drm/amdgpu: stop touching sched.ready in the backend

Guchun Chen (2):
      drm/amdgpu: update gc golden setting for Navi12
      drm/amdgpu: update sdma golden setting for Navi12

James Zhu (1):
      drm/amdgpu: add video_codecs query support for aldebaran

Jingwen Chen (1):
      drm/amd/amdgpu: fix refcount leak

Lang Yu (1):
      drm/amd/amdgpu: fix a potential deadlock in gpu reset

Nikola Cornij (1):
      drm/amd/display: Use the correct max downscaling value for DCN3.x family

Yi Li (1):
      drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE > AMDGPU_PAGE_SIZE

xinhui pan (1):
      drm/amdgpu: Fix a use-after-free

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c                 |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c                |  3 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c                 |  6 ++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c                  | 10 +++++++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c                 |  2 --
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c                 |  2 --
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c                 |  4 ++++
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c                 |  5 -----
 drivers/gpu/drm/amd/amdgpu/soc15.c                     |  3 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c                  |  8 +-------
 drivers/gpu/drm/amd/display/dc/core/dc_link.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  7 ++++---
 .../gpu/drm/amd/display/dc/dcn301/dcn301_resource.c    |  7 ++++---
 .../gpu/drm/amd/display/dc/dcn302/dcn302_resource.c    |  7 ++++---
 drivers/gpu/drm/radeon/radeon_gart.c                   |  3 ++-
 16 files changed, 54 insertions(+), 35 deletions(-)
