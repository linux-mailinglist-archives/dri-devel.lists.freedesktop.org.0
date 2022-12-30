Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E965970C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 11:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F5B10E08A;
	Fri, 30 Dec 2022 09:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE1810E08A;
 Fri, 30 Dec 2022 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672394389; x=1703930389;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qy5hP91lEIv/CLYhofCf4SbEIqfYuhcIksUTjeKWAKA=;
 b=nfWAhBrBvvBj/1ojLjpvQys7oCIqjOa6SBsbd+bFpAM4rmcNT06fX4Jq
 XG87ww4mDdt+WN6yhiqQOU7iJL6xhKIdIXj/GXR2SyaVrTRKHlkaPhXbc
 z467eqPYtyAHaqNGe9buWPXVnOsN+i3nJUr3872aaINkWal2UV3wGDKPr
 HAbT50gPyhsitDrDTCL/QhGFQdwnpO35x8Pe+PDgs9dVgmTR/gXg1sFqf
 p10U1DBU398XN63nN3icGtkEfHofePs+6FCZoqVLnPSiQPupryHCeqJPq
 1uani8mROWzeWd2DnjIy6x26QExW+mfxq+QXDhftsb6akfxmx4oFWkou8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="304689201"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="304689201"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 01:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="722302459"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="722302459"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 30 Dec 2022 01:59:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 30 Dec 2022 01:59:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 30 Dec 2022 01:59:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 30 Dec 2022 01:59:47 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 30 Dec 2022 01:59:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELsPLNmKqCS+13hcmIlLl3s523RdK12nAbp23HqITVpQCXymfhgMMRWuX2vWrB8KyLyfq0dmu9SKfuptnm7PvJyqC7ORLQiMQaULiqW1mXWm9RUTDP1yx6KTDFYmh5h8hLk/vbrtyBkpPUAHVNO8Hi9QAMjanVjYnQQd1dj4EfPNUMtwII6g9X7nVCOt9FhzXCmAtvzjigLrt1VktbIHRp/rozJ+hVUgEnDRW0dGbMYrFAWfpDjZp0yNpIX9/POVaX/MtfgR5xEXNPaR2RBsczvIMkkhpM+eizgHHAiOqpPTu5cVCJUsI7mWs1aoGEq6/uORyKDkL6UIVQEvDElgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnXHvtKOmytK+j39pV4TA4Ib1oClUiuxIPphsbOq294=;
 b=bxnNAeZbYgO6ibHi8ecJVsFtPltvfkrdBri5TfBLy1Xuid4r3WBpCLwNV20JTomUYYZ0Msr/qeCuuo7qKIrfFcw356K8Gsj++OZZxXLwAt9mb1OHiehppyAesZPAO/DXDN2BHc6wZW6+KvJXDUsiW8lYmWP3Cs/CLpKhRyS2zyTNH7Vs5hEyiGHkkW7gFUhSdgIlD3Mo0d4aYPICS94geP3m/UIFb9PW2cMp0A52JSzhih0+T5/M5BC1HQDhx994EiSZXwmV6+Xtk3guv5ffiGEklCru+uz1NOHtpLtAtHdjBwVQbfj2rlePTmX2Z0xAG2oRClWNX4DBsy+uL+PXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6174.namprd11.prod.outlook.com (2603:10b6:8:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 09:59:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 09:59:44 +0000
Date: Fri, 30 Dec 2022 04:59:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y662ijDHrZCjTFla@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: da0a1dbc-112a-4979-025d-08daea4c9362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fuS8hkyJoWaTn7km5jmN8eiyNcX95PoTmjTjJhmTihQzNB/j9MaBjPiZBLYRO8WKCoRwRISvfxmZFmZePZXivGEImPsZeX+lJ9mwZEJ+rYbyNW6I4LOG3hxtlHo7kJQUfctPWKMoBnIDMtv3zywVQ8l2/sx+wHs7u+QTw7yTCuEdpxe4lRPiL257PknwyBnPBPIqrwUnbTbc0aUY68RpRjBJsmNfHdRIVWVYMxIIMtQNYWRtRJQy+/GX6Obpizqp5XwWoMdnN4wtI/Zv2qMw10+Jr+0UVkuAsN78qNNCVwCVGj7X5uuPbnrNxvI78T3bH61HgZsRlhyt3BZgqxFAJ4w1OdGYYHfXxIu1A/zM2yazMtEfq8+NZo+qMGKuIwMphgfqFO43RncGL3bssVpP4Qg6Zhit6OlKy/XxRvLV/ZTUnR4DFeTOei2WU12AP7Lt2v+ucjN8zGCd/KX/j0dhga6dxEKx5+B9hfdrvBhiL4ZfHoHyUVXjv1gFq7sGvZ6UFLVpGWhYLYbgpB2V+A7g6aeC/P6xxtf7Yu8M458FiwAGB2cmKGaVx96zE/AM5bVZ789kUxNXsEHfumhaJzFDFu/tKt4tTwqQg2D0KJhbZ6O849JmzstPF+nl4MUQ24KG1ZuNZswy6PNPrexzS5I42Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(66556008)(66946007)(8676002)(4326008)(66476007)(86362001)(41300700001)(8936002)(5660300002)(36756003)(44832011)(316002)(54906003)(83380400001)(110136005)(2906002)(4001150100001)(7416002)(6486002)(478600001)(2616005)(6666004)(186003)(26005)(82960400001)(6512007)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NAnyBqf4G2AbCZVD76tBZltZmhJ4apdKtlyr/8ke57C91T1NG7obcbjQf3BO?=
 =?us-ascii?Q?PXjfrgx4m2VuFoAT6JZJGXFtJVL4PJs7RA5c1V0J851xiGZmsHsWpR6Bx+hX?=
 =?us-ascii?Q?HKleyJ7AlpdT9rCEe/otRXIsh1p3kIV7vXczcdKbxYYKIA79SxCCdVcO/JNA?=
 =?us-ascii?Q?klBfEtM/owCgtP2dL6WsQblJt6sR8yZSlUFDP8TnxtmsMYT0DWeR/K7CWO+m?=
 =?us-ascii?Q?U2SagVDJG3mRajsSKEmv7RSZHCTWfK+w71cLJmD6G3b4Si1CodyICqHiblx4?=
 =?us-ascii?Q?R1Wcd8HxAGdeCxWxzhzY0a6A35N3DX/u1UTpWF42MN6OHhqIAQXTK87jbCID?=
 =?us-ascii?Q?wDct2LxMna9AjtVgt8MKCGLrgqZjC0GDByC7D8qSkCTiAzoU4uvc8Ay2OnV7?=
 =?us-ascii?Q?/6nELX9mcGU5SZF11jsoEjttN1aooG7UQ4GDNhYtHX9Pp+2GB1ZSMOWvCR8/?=
 =?us-ascii?Q?WjinJtXHGzI4zfCUK2ZkacZIT9pZasA+uAkFKEi8RGn4gr9+3Hvs06gxH3UB?=
 =?us-ascii?Q?aNVa/n3u18ikhEpk3CcPmC3m3BzCpf9JlWIxEhlllAslev+O/wD0e5l2vrWe?=
 =?us-ascii?Q?eyrlKFUXCBwiMs6WT3HNGe5p3PakCwNFlGadRjva8LuK7giTyOYz4uSrc8HC?=
 =?us-ascii?Q?aqNDFGSsFS+IBmTqqvgU5eDUCEXLzrd0BUgeeoPW0WNoTEEG2f+yLFKvgIWc?=
 =?us-ascii?Q?TqSnCQQpjMZSZ266/WkTgb0/LLLDpa59ttxsRrOGFcuiy7vR6gI3WXnFdaYP?=
 =?us-ascii?Q?hjQz7+8hscpkCYTFHH+rzOERVsWPmsGNb0mYKJmXDFTr4ZvaBBdeRSdFR1kq?=
 =?us-ascii?Q?CeSgsIBPxL/oK0currJi0fR9QQ9S7D+MTR45NK6cIYOt4/3dx1q4qrBKPc9D?=
 =?us-ascii?Q?TKox2n53vcyGTCumwaXjXiP70q49g48QjiehIUwUQ8JCp5ZCMLFIuqtPwvtN?=
 =?us-ascii?Q?ldPkda6Miqrd0XR0/S61Zt5MD0CVkcQ0zsFiTorhity9oXoqypq7QqYKAWy6?=
 =?us-ascii?Q?VSAvJU7May7N235/3tUd1XPQuK6H7dFOvBolVWgJS008XowUmVKldvMpMcLQ?=
 =?us-ascii?Q?TeEJY9vV7H1vDORA48ctVesIaO8uYOz/pADZzNoG7p4JzOXUyoC4xTxhHQz0?=
 =?us-ascii?Q?tm8NbhshATeXa4aZeI7D9Qf7TbNzTzRF+82fRnHqFK+DIxQckjdWeFeFVeaJ?=
 =?us-ascii?Q?9l/y3YTsXEC1Tan75mibro0Jd2RDMTh08EjWT8uEfzx48eXaZslbtweMKEzm?=
 =?us-ascii?Q?gnQoR31eCyamBAPSapTN98hfI0jVYiey313OipE/j8K3cTGzZLYep1QfEhKm?=
 =?us-ascii?Q?YqlbTw9REWrglRrSbpLDzPEh2z3Yk8fr/5+5Cn6AaHBM9oGwrAnBjhtJwmRm?=
 =?us-ascii?Q?YbFmNYJvAu50wvg9arrBGyV1i+1XhvYa/R5WcNb7WCN2gGtGcD1i7CA/OiXk?=
 =?us-ascii?Q?Khe5TD5D6DqjJyp+TF74ClS6qUcKDrX9HrAGmBX7AzeP7PajRpHXudPnIGk+?=
 =?us-ascii?Q?XJlWMmFYRh6SeX9lh+wpG3btVyXaLJEs8bHKbcRgeFbtaK+fuF0iRNM3wJxE?=
 =?us-ascii?Q?FpRp90vumyZmY/QnDTGTvjE/kmRSX/3nOXhMCO4u/DTosClw7Py2Tn8tR5k7?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da0a1dbc-112a-4979-025d-08daea4c9362
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 09:59:43.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Byf4VH76vvEkFqlLy53odZ6sbHezPK6NOhXmMp0P6SB9wmouy08k/R8g3wW/V/v9FJpyLLytKHpgj3BktB3KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6174
X-OriginatorOrg: intel.com
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes the initial fixes for 6.2.

The most critical ones seems to be the evict fix from Matt and
the MIPI DSI from Jani. Both targeting stable trees.

I'm sorry for sending this on a Friday and not on a Thursday as
usual. Where did this week go? Worst case this wait one week
and I get it rebased and resent earlier next week.

Where did 2022 go? Happy New Year!

Cheers,
Rodrigo.


drm-intel-fixes-2022-12-30:
- fix TLB invalidation for DG2 and newer platforms. (Andrzej)
- Remove __maybe_unused from mtl_info (Lucas)
- improve the catch-all evict to handle lock contention (Matt Auld)
- Fix two issues with over-size (GuC/HuC) firmware files (John)
- Fix DSI resume issues on ICL+ (Jani)

Thanks,
Rodrigo.

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-12-30

for you to fetch changes up to 6217e9f05a74df48c77ee68993d587cdfdb1feb7:

  drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index (2022-12-30 04:28:46 -0500)

----------------------------------------------------------------
- fix TLB invalidation for DG2 and newer platforms. (Andrzej)
- Remove __maybe_unused from mtl_info (Lucas)
- improve the catch-all evict to handle lock contention (Matt Auld)
- Fix two issues with over-size (GuC/HuC) firmware files (John)
- Fix DSI resume issues on ICL+ (Jani)

----------------------------------------------------------------
Andrzej Hajda (1):
      drm/i915: fix TLB invalidation for Gen12.50 video and compute engines

Jani Nikula (2):
      drm/i915/dsi: add support for ICL+ native MIPI GPIO sequence
      drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index

John Harrison (1):
      drm/i915/uc: Fix two issues with over-size firmware files

Lucas De Marchi (1):
      drm/i915: Remove __maybe_unused from mtl_info

Matthew Auld (1):
      drm/i915: improve the catch-all evict to handle lock contention

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c    | 94 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c  | 59 +++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c              |  8 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c        | 42 +++++++----
 drivers/gpu/drm/i915/i915_gem_evict.c           | 37 +++++++---
 drivers/gpu/drm/i915/i915_gem_evict.h           |  4 +-
 drivers/gpu/drm/i915/i915_irq.c                 |  3 +
 drivers/gpu/drm/i915/i915_pci.c                 |  1 -
 drivers/gpu/drm/i915/i915_reg.h                 |  1 +
 drivers/gpu/drm/i915/i915_vma.c                 |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_evict.c |  4 +-
 12 files changed, 212 insertions(+), 45 deletions(-)
