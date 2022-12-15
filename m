Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA11664E26B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 21:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015F410E56C;
	Thu, 15 Dec 2022 20:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AAF10E568;
 Thu, 15 Dec 2022 20:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671136699; x=1702672699;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=3imu+xzqs1VUa+7z7/el/pwQADdrOrZ5ufbShxcDrj0=;
 b=bPMq9F+/8QjcRoX0Y9PV9sUNI6Cq0jdj7WQMSagcHRqOgNACEWqUKA4z
 f5JmdgRAPNSbsO9j089gwMnv3zNghPLydkHvf25iWEQK4hnZt6tTllDfq
 j2CsFX7QvbWV+gDjG5GxuFEsEUb/j5dwsYFp2g1VprUawp7MdeBdfjbLG
 YFF+RjVc0sGJ2IjKYUcfvAiYuXtTD7I8otUqV+7M5nx6+XH1ShXhj+bHq
 0mksVcFv5cpEpFwah0KmhPmQXReFir+V+5cjyqCh7PIGh40R43dXRrcMy
 uhRcwtw/fa9qKMeMM5xezKP2dgYbaQmXpkm3OlSFZxI0q3ouzJJCFB4vM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="319968044"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="319968044"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 12:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="718138610"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="718138610"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2022 12:36:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 12:36:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 15 Dec 2022 12:36:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 15 Dec 2022 12:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7Te7MSkWN9R/2ye3lBzebV9kbhcGieYpvqqnEpSPgUV54n8SED8alUTYoqhFHbUfwAnKTXZzWFrUQGf8di6jRFJegTdEQg6bjrO5KqV4L8ckYaAsiwHheDXCNqqoLhsvGXnN+TIlxyNPLHpo60HHQz9fb2KRhcBpd4SKapy0Q76Eg3aNvWx+zCEGlW6KYIonOlJUIDEx2MhuLJTXXPe/zUhY3uQM4vFN6mM67xEq1XrlyrytCG2rI+gCDbqWv00tmYmn8baS5n1MQuoYIHhrO1bT09YXv9NIQx+krFkupuS3M3EJf6dnB6MRj/j+Z6LkAqHBursNutJRsKXs6/vAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1lpvmPT+QYuZrNED/YfgWwmhr0OEcFmXrdznJ44xyo=;
 b=ZNCq9w3K+TMOWOd6RMIIHKjwgBifM1z8uMrQYHLcxjQbxoLxPdFm4BTBN/QGMIBeQDeSKSPzg8COoukiNx5CuMKDOMt07AUwS7wk9KkfhAF2jVbheCWN81QTtVFbdnnA+5JEd4BLaj//k4Yh130kmRvHt9W7gumH/7/1Jk1slyk81zWEinjXSEwnsAGxK/FHwAUybbLkqhz6gn4Bv8YKO2JPK0AybS13fHttv9RU1MAY0CfRuDet19N/3q5w/uRvMDd9mWInuqVQ49d1/n/oQDoGV6jHFgi/r4cBSqUSHeqThb5FZfPpOHIbyUIzNCXX/4FF41y0kxaYGdHw92caBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.12; Thu, 15 Dec 2022 20:36:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 20:36:54 +0000
Date: Thu, 15 Dec 2022 15:36:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Y5uFYOJ/1jgf2eSE@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abaa11f-f592-4e5b-ffbc-08dadedc1a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmwmNeFUByuTsD4LUwz5Hb+/7CQjlGZVBK4UGLm36hQRWB9/uZB9LLZRWxmQTHKQQj6X98dM/65j5VKZP5HCib4S7fr2mGshN5gCXII7bjXBaCix5sguP4UYO0ajAzSEFj+hOZWmHQRSkfK3tLBSqj+jzvLvJjhK9wfkuKRlOUjta5LjfkihRx3AFf3uf4/F+TMyexbPitkFIw5j/pEnltYjh4DADHgXXx9jjG5yJxyIE2yqTrSx8gC7IbLWK0nRoPlWpj8JtcFXaCHmJwlSQXl9+4aDvgmmDFSOZvCoiza4AD4frSySmuD39qc6sSHwLm9w7PO4WHs7MOS5TX5VvE90njg6dmq8THcluG9QoIDmguwVcrW6EmVqA/MjilcY/TXRqNUVOwJnRRQj9JQ35AXDM8LzPdTdjVPB1hygtWZu/VywftP1EQnh+hN22VowwCU8BCgVEa+iJoEDtE+PomyxmmMesnCfv/bIZoaxzy54RETr+pydaxJLcIdi8xkUdouIPUjBq8yeFhrNdZvNMWYDNsjqrNuXqXK2a204E3BZNrZXQXb6WCnIc6HUiOQdtXeBVsUEsmRKgOQg4XNixNsOucNo7FBNrxc0OYcxiiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(86362001)(36756003)(66476007)(4326008)(66946007)(8676002)(66556008)(316002)(6512007)(54906003)(2616005)(38100700002)(82960400001)(66574015)(4001150100001)(83380400001)(2906002)(966005)(110136005)(26005)(186003)(6486002)(41300700001)(6506007)(478600001)(6666004)(7416002)(5660300002)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KGV+/Y5bLWvOAHJc87YAv3rE4pWCuyIuvz3lLM3ughKzrigAVaKxsL/EoW?=
 =?iso-8859-1?Q?LN8YmbD7LjCLGDYggKmnYulaI1ikCcsbTy8IQVkPlnazI4riPlF5bT9s/x?=
 =?iso-8859-1?Q?tW4lGlyuMShE3PE7NJBiaQE42S2SCSlKp9kWXt+bJ0esSDFAUeaoBRGhqN?=
 =?iso-8859-1?Q?OjeqpjFo+TSf51US/gTzAftm8Bq4A93PYwiVLreydnrJjGCev6GDjuYeYs?=
 =?iso-8859-1?Q?fpbF+BhcHo3hKsPYZd7MY2BxgWdz5x6BUlnzl5DAF5tPDLELi8oprOcSeL?=
 =?iso-8859-1?Q?JNFkYOMHeaaLnV9XhwBu0FYPSo40WioOSzWlVVfCx1XT8oW+sr4k16nqZ3?=
 =?iso-8859-1?Q?VyNHKsTR9oNMkLuO+vLk+y00APiumMVQ52oAoolCSoCnpcOQMPLcoiIXKX?=
 =?iso-8859-1?Q?OWttQI2ibj5EV3wmLqRgSgFjGOSvFtgxuon3QLGPdCKyHBML0ZtNI7SeZb?=
 =?iso-8859-1?Q?DHTGHsRq4mRvnqzwUidQ+Ym+qRrHRVvwmIpMTLYrJClTVA8AP+e1T7cMAK?=
 =?iso-8859-1?Q?SYqfwwzOtGlIRCFG/lt8jZbq3fOpO/fRY/BiAEOLDxuwhSJXC7otHuQfEK?=
 =?iso-8859-1?Q?HuUsVz6D7PLGoO8attYbUlgFEZNA+evbzRIoFc9dGgHE9SWqMtWx/VFM0N?=
 =?iso-8859-1?Q?2FSWyHk2GYMPsGNGuocqwvY5++zer+qUdaxNfLtPfh7/W+ElmvHTuzo9pr?=
 =?iso-8859-1?Q?xwdA5OqcuH7D2zR4Kt2wICLyxu1qvrRsbgRxuRkTOqDqMVsOcBWPiYLGgZ?=
 =?iso-8859-1?Q?YbU70Y2il2lIN9+zw5D/m2tHEPHxdWmrOeJb9DeDITGPTtNsi4iTfkiGow?=
 =?iso-8859-1?Q?ykLT1bICZmIfI4WH/U0hyqmxkS0X54+xk55u/RhDkitiY6eX8R8hjW/R1u?=
 =?iso-8859-1?Q?q5qBGVbofBohezKVoyuzxT4BXnOproWKeKzZKW3tZkjQ3SIPv/E+JXxoAV?=
 =?iso-8859-1?Q?gV/BJKLTuahpDTsI8gHptRJ1lqoHQNUvchBXYiWbb3Q2zolFL83veNZtQD?=
 =?iso-8859-1?Q?hVcCzkGZ6xax/sbp/YDzm+OtuY/ehnav1DoxT4DuAidPjG6p3pcT5VGzEY?=
 =?iso-8859-1?Q?wckqGe+G2XIFLAS0QVf7il2RRDI8S5I8zO+XcMvDDcb3DHwXsAQt2lFxuC?=
 =?iso-8859-1?Q?vVxpPMtrKaFfr6dap4IFHrMx7jKodWq4qMRzuvHyO4nSCfLh0FgaynZ3Qn?=
 =?iso-8859-1?Q?f0mX2En1sjA6FnpyQroW5QQgGo6dAOLHQN/V4GO6P7IUlCVxJRwHSjPMs2?=
 =?iso-8859-1?Q?ie9/pxy2rWLWeBlGBadmEJT6ldc9SghRgPFXoAVk0DLp6PVGsNAzP5pdLn?=
 =?iso-8859-1?Q?KswDERB7TGR7djZEJHLuYP6c4yRz9ahjrw6hZj9YNhHg+45cYseXoxVAw/?=
 =?iso-8859-1?Q?NTn9fKTSL4Chj742d2rxryMe+Wv8i8yd88AT5okZppjksWkX7S9mRX+K7g?=
 =?iso-8859-1?Q?a9iBorGNoXJYlgsquOeLTIppbaenGgrwJtEI7USA3qVoL607XlZWTbofU3?=
 =?iso-8859-1?Q?uUqOmk14CG9ggCOB249jZX7m1qIEx5JJ7VEa93N+DYjOoM3BLonDIfPgAR?=
 =?iso-8859-1?Q?75Y/VK2LDyiHj4D0Y0yVE/XAlVZ3UBKpBDgjDgpgy+jBRqxT3jOwMmbu9U?=
 =?iso-8859-1?Q?3ADscXSzwHDq1BRUHpOb5PxrRzl7EDd+qG6I1PR8jA6hjR84WP3QrE3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abaa11f-f592-4e5b-ffbc-08dadedc1a82
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 20:36:54.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CztfH7TUMjyIw9rh+9EKpSc4onsuQRLbAWPkMn8RiOme5xapIhWlRpKxMEDdnoNAXYdSJIR5T9yunJXb7/mDIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

In case you end up sending more stuff towards 6.2-rc1,
please consider sending these fixes below.

The migrate related fixes seems to be the most important
ones, but also I don't believe it looks so critical that
it couldn't wait for the -rc2.

Here goes drm-intel-next-fixes-2022-12-15:
- Documentation fixe (Matt, Miaoqian)
- OA-perf related fix (Umesh)
- VLV/CHV HDMI/DP audio fix (Ville)
- Display DDI/Transcoder fix (Khaled)
- Migrate fixes (Chris, Matt)

Thanks,
Rodrigo.

The following changes since commit 66efff515a6500d4b4976fbab3bee8b92a1137fb:

  Merge tag 'amd-drm-next-6.2-2022-12-07' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-12-09 12:08:33 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-12-15

for you to fetch changes up to ad0fca2dceeab8fdd8e1135f4b4ef2dc46c2ead9:

  drm/i915/ttm: consider CCS for backup objects (2022-12-14 12:56:58 -0500)

----------------------------------------------------------------
- Documentation fixe (Matt, Miaoqian)
- OA-perf related fix (Umesh)
- VLV/CHV HDMI/DP audio fix (Ville)
- Display DDI/Transcoder fix (Khaled)
- Migrate fixes (Chris, Matt)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/migrate: Account for the reserved_space

Khaled Almahallawy (1):
      drm/i915/display: Don't disable DDI/Transcoder when setting phy test pattern

Matt Roper (1):
      drm/i915/gt: Correct kerneldoc for intel_gt_mcr_wait_for_reg()

Matthew Auld (2):
      drm/i915/migrate: fix corner case in CCS aux copying
      drm/i915/ttm: consider CCS for backup objects

Miaoqian Lin (1):
      drm/i915: Fix documentation for intel_uncore_forcewake_put__locked

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Do not parse context image for HSW

Ville Syrjälä (1):
      drm/i915: Fix VLV/CHV HDMI/DP audio enable

 drivers/gpu/drm/i915/display/g4x_dp.c            |  4 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c          | 25 +++++++---
 drivers/gpu/drm/i915/display/intel_dp.c          | 59 ------------------------
 drivers/gpu/drm/i915/gem/i915_gem_object.c       |  3 ++
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 10 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c       | 18 +++++++-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c          | 53 ++++++++++++++++-----
 drivers/gpu/drm/i915/i915_perf.c                 |  6 ++-
 drivers/gpu/drm/i915/intel_uncore.c              |  4 +-
 10 files changed, 96 insertions(+), 88 deletions(-)
