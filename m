Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEFF5907AA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 23:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728FB14AC82;
	Thu, 11 Aug 2022 21:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EB214A6CD;
 Thu, 11 Aug 2022 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660251813; x=1691787813;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=aADs5469C5gqIhavTrj5wSs3729WQV14Qavs9Y5Bxjc=;
 b=aUT8x3UcRsFeZa2sliFFPhyjxlrZlVztx8tqKxlTYR617lDzEOcSa52P
 wLZ371WcAr/L0LiL04Rvg5gQL/z4AyDk08fVxRQpoa8eV7PH3BXaGcrYA
 KXK19wYCpcHQmmZk5cnmMc/TOs9zlIKlVGt2ePky8oF9d7l7iQuhnjvPP
 MXNXsV4c6nsgd60vwYMuuHHGqobR+QyrE08M49oqv+4CTkx193iaEnsR+
 gPHLl877wFSrP8BAXUa/MkX7XlG8jGLr1n0NxiN+AA+FvBQhyyysh8dUR
 soC0nt2QAIFKQVFjv1tKszI1WFTx2HFGvh6P4QXCzGeuaBgbzjMA9+zEd g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="353202578"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="353202578"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 14:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="609062739"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2022 14:03:32 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 14:03:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 14:03:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 14:03:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 11 Aug 2022 14:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPfuFmxbJRDfuRnJd8iHXqhY2+5pLf5p1NvjOXDyd1vp0b00+6E/zprd10aMzP+OFUgEvP2j/1QJQsDE07G7H3XaiwDe/ff/wXfYkuqcUSaXJ8ItjqeyizPrChwnqPyvl/kwdO+nj1B2wRMZgKA/53C2mR4t2nqHNYypYg3h47i4vXw7ZpIHV8tOqWMlsv57hA9yiD+n92j+TmIO+mLPfjuv78XfW6mO4R8Y14Gut1qWQnSmd3dNHgFqLWV91FDPB16F5w+nv2UpdTMi9YOqSRaDTzbxrTASkgRgcvK8hA8iLjbusX5EN8PNfvKLd4nCu4dX0SPrX+aO0T9cJ5JywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl9kdwCnKZrCcE2WgzeS7+7jsXtbBxtwc2adLs7vWkg=;
 b=G9MnMXtExGaRPN71MTpOLvX+qU3eToRGr+dYvJ3DmjGvDbJVbbPQ8tyi2dfrqC2glW9VD67EyulgV+LYwixacWJAWr8GzDl7Ow/t8fFqTvPjKywrs2MamFK3jyLejp39h7iSlBEyxk+YFnFXGqbPTBhYyUM2czE54tYu8OaNQngdZ+ysaFUyh4ShiukkgBXLAR/P1CADLAThCDk8KvpaqSZl59WUXqi7Wa1oT1b6rydBVWxvZOUvUJ5lgnd0Dx+Gh4I5H2SoubKrwXjEYKMo887UDYFaSwwDKr6MHeozu5jaESm1FhCl2KwM4oNLzpfwP8QlkbDZOPY5V401ccNC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.22; Thu, 11 Aug
 2022 21:03:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Thu, 11 Aug 2022
 21:03:27 +0000
Date: Thu, 11 Aug 2022 17:03:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <YvVumNCga+90fYN0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16aa13f0-6bb6-45fa-d9e5-08da7bdcefab
X-MS-TrafficTypeDiagnostic: CY4PR11MB1432:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +f1UAH8EvyBjdffuBFwpGk25wTvZz805iHZopcNDVBOr6TddMxM+JVp5ueNVJR1zOIhYXI+pGpM/6JVF7XHmaJ2hy6BNxVXRkOxDHcypoEpfaeggeuHCLsGFV8dy2KaNiH4xn8r3Ju87E8coWX4jPiDmxbw1kdw88pwW9a+UkVwkgLbd/IRUWnk6aeigZ02Ve2cmiCEGkZSrtZfeCj6abHVevWYQnCQdLcNtPFbizptza/wAlA+fWCalsAuQOl0mR5+4fUp33wPbmnHm3vX2doWLZtCVS4gtxSScNJOItRQwBiin+ptUkbgjrdEjiUEQ8tpRHqB/7Tgdg4oCxpKYyB5k8Ewy4YutUkHGQ2fBiL6seOQn0nQyxV/MiinSswJqb1fY9wJmi/vIOuPLz/xJsEQIlJoFUEAapn2jwpWo85v+wawnl67InpGP/KEzLJlYJ7hxN44lwhBmMDTCLF/vb++9yklOZNNQU34HYwho3DdY1T+SH4gimnC35Kotyo0HslYtjjWjLrdAzSI33q6q76UBbP2NLvLMb77ya2E5Viu6gJixwKd2nXLcUJ0YuRpD8fGBgjW41Hr7QX+h8seaPTCXlorF1SkObGzz1Amtn8pwaWog36gYj0fGkCC75x5vsorLYSxGNPcDRJTuLOWPqWwt7eWNm9R80T48HacOLx/fL/i6sio6Ihfo1Yh/ZjvS9V0W6qS/Cy1NE3nVTDkpazvTKD6HfXFmO4ISj/tcMPS50uVwWvioGUAVXdYEA7kV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(396003)(366004)(346002)(2616005)(478600001)(66946007)(44832011)(66556008)(66476007)(8676002)(4326008)(6486002)(7416002)(5660300002)(966005)(8936002)(41300700001)(316002)(54906003)(110136005)(36756003)(82960400001)(6512007)(26005)(86362001)(186003)(2906002)(6666004)(83380400001)(6506007)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aoSIElHjPcEfwSVo0RK880HF715hJAEvwF52Rdg91uBPmXM+p8+b7t8Ix/3N?=
 =?us-ascii?Q?pvXVmx+ajHBE3/g/Zihepi1E0vsE8J9RE/7V8j8c96C6YRxGaVGiVP4E/0OO?=
 =?us-ascii?Q?fjU3RmiKcQCwe76hzrJuTYV6bdMnu+BB09Bm5W60sGGJKtAWu9kA+LYimcy+?=
 =?us-ascii?Q?aqUwQ4tKJBQR7d4gNbdaO0GxFo/SURWvpEyiu+JA8Y0c7MUUEFel6IX+B/aN?=
 =?us-ascii?Q?j6T+A+ugC98Y4esQV/qa9HlWAwF1toZ5anEAgXBnb9c5Nx+0ZnmQCYrayfQK?=
 =?us-ascii?Q?vOjjqs0lKcX/wtRxLAM67kzmXjYCcxrgc2jH6Vt3oK7bStq+GT1kE7xfuUiW?=
 =?us-ascii?Q?BNF3Yh/LD04GSI/XOivf4udzuyMBCUpogDlAaUhi5UJGxzC+Io4mRC3fMUTI?=
 =?us-ascii?Q?4/7HOnF6LSQvcimUo3RFeiZKLzeMNHFjV2qNhXQvxwYf2TG4d6jySTchdeKj?=
 =?us-ascii?Q?shLrhBajqpN3EtkgHGwmE2TPK02OC7bY+9vwSsTJ8Rb28rGPUJXXPXXf3HQe?=
 =?us-ascii?Q?VUb0+N+OldVrtvEaFlIVAbqmfhr96Ri8sGrLkb3BpHeXZ+Loiu3iGlRH0KPI?=
 =?us-ascii?Q?57/ACcAlTGSU5lz/vvcAMFOg8VZrpnoKrCy1LVaGREdt8z5MZNnBtF6LQ0ph?=
 =?us-ascii?Q?r1Tu3fwYGIXlkldvtbc/JRdnZo2Zw0K5L62CV9Cf9YCe9+KSPakfzLvBfZ61?=
 =?us-ascii?Q?idpfanIqueG+VxAOqvCXJMlanwKXParb1gL3TJY7m+nWMGVcc32k1voxLOGm?=
 =?us-ascii?Q?eDIYmBLpSR9kuWmG05lg4osR3HzeIzLd0S4+1drJ1yDGltxFyAhZmFHTfnHS?=
 =?us-ascii?Q?0b/UAR+vv6woEpkRLC+dUUpzBSmSJ/qrzUBD8VmpHzkNPSxctaQcN9wt2Ghw?=
 =?us-ascii?Q?2hMjcasVunv/BJMdlQZF6kYuuUid+WYnIrQLE4+gogSNHgHIi5i8UY953pqx?=
 =?us-ascii?Q?kE48Fyoad2rDMxAD4ByY5XD5vnnBFUHTfLSrR4NEvkDgRKi7WFlSV7asEEAT?=
 =?us-ascii?Q?QXf3n7HDMkJV1SiJ2alv0AGvxctekXlEpm3tMNikSZ1A8SaBLRnpXcQ719Qk?=
 =?us-ascii?Q?HdWrnPnDpeKoub9mEC/Xb8tzqs3PU8JGAG0IYnDvoHQnRZQelbJo5DUON+y5?=
 =?us-ascii?Q?NTGI6hvOmAinBLkEp4IjLFd334qj4d8ronIWuHD4wMq7N10MqKSzIPH17oCE?=
 =?us-ascii?Q?YwLiqPJ404VZ5GePpqOtOQR/1tRua+v9fJgf4k4Kkm0C6cdGV9pQdz6hJPB8?=
 =?us-ascii?Q?JZh2ZJ6teXRDEn5FthYIO0U6qHilgIOHdcpp/HiK0FXZOS4yRjvShrVhF8sV?=
 =?us-ascii?Q?n48Hwc7E9eQ16CVcgDMni7rCXDkma1257DTAPtS4+uqSg+nvqMUdvMGP79OY?=
 =?us-ascii?Q?iIPpwjYGEl6gjrVNoraOUsId8HwZ3ZW147uy6hkbXkyfQLMdIPiu6LhgSpZo?=
 =?us-ascii?Q?k2zyGDxMrJmZgEBHQlMkKwEES29EEBvIwDWAHw156BPCessr7zezXTjBs3qk?=
 =?us-ascii?Q?RdLlZaDKQLAaantkTti5wJDyD1CYEmjJv2V1Dj4/J3l+r9+q8YYr586dIi3G?=
 =?us-ascii?Q?fMpqJMkPggC84JFq2zF0wpvmMOFEGhph5yD6pe6p6koicwoUJSe3nOeWlMFq?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16aa13f0-6bb6-45fa-d9e5-08da7bdcefab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 21:03:27.2728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MkNZqlEbesJGmYMqyX/ssBlkEk3ksoZzH3Fs26eXj7XAnQvM3A2bYy3xs+3RF9yJRy24icht/OMD5RoM2GHag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1432
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

And here is the right one. And now including all the
fixes.

Here goes drm-intel-next-fixes-2022-08-11:

- disable pci resize on 32-bit systems (Nirmoy)
- don't leak the ccs state (Matt)
- TLB invalidation fixes (Chris)
[now with all fixes of fixes]

Thanks,
Rodrigo.

The following changes since commit 5493ee1919eae4f49d62276cf5986b7f7c7aa8f6:

  Merge tag 'amd-drm-next-5.20-2022-07-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-08-03 14:00:19 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-08-11

for you to fetch changes up to 9d50bff40e3e366886ec37299fc317edf84be0c9:

  drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb() (2022-08-08 14:54:20 -0400)

----------------------------------------------------------------
- disable pci resize on 32-bit systems (Nirmoy)
- don't leak the ccs state (Matt)
- TLB invalidation fixes (Chris)
[now with all fixes of fixes]

----------------------------------------------------------------
Chris Wilson (5):
      drm/i915/gt: Ignore TLB invalidations on idle engines
      drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
      drm/i915/gt: Skip TLB invalidations once wedged
      drm/i915/gt: Batch TLB invalidations
      drm/i915/gem: Remove shared locking on freeing objects

Matthew Auld (1):
      drm/i915/ttm: don't leak the ccs state

Mauro Carvalho Chehab (1):
      drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb()

Nirmoy Das (1):
      drm/i915: disable pci resize on 32-bit machine

 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 16 ++---
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c        | 25 +++++---
 drivers/gpu/drm/i915/gt/intel_gt.c               | 77 ++++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt.h               | 12 +++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h            |  3 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h         | 18 +++++-
 drivers/gpu/drm/i915/gt/intel_migrate.c          | 23 ++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c            |  8 ++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c      |  4 ++
 drivers/gpu/drm/i915/i915_drv.h                  |  4 +-
 drivers/gpu/drm/i915/i915_vma.c                  | 33 +++++++---
 drivers/gpu/drm/i915/i915_vma.h                  |  1 +
 drivers/gpu/drm/i915/i915_vma_resource.c         |  5 +-
 drivers/gpu/drm/i915/i915_vma_resource.h         |  6 +-
 15 files changed, 183 insertions(+), 55 deletions(-)
