Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62726697562
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 05:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A37E10EA11;
	Wed, 15 Feb 2023 04:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A169F10EA0E;
 Wed, 15 Feb 2023 04:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676435120; x=1707971120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Zj+XVmpdVCLfJIz88GxJmk4NTjgOMDHuTjvuUq3UV+0=;
 b=bZ0QS+X/RegdpJ3K2n/I59IGzZdWG6AXasCZIgkI9cvXznwP7UrvGoP9
 cZjc2UWPYKCqTfQeZWhpGYL3YrriWugkEHs7whcTXE0mG/zcUn0t08lSP
 8jQ56FuIAPDuBUMtf94AyPgGopa0o56vRIaVSIqPlI6JTsZ+KiczubNw6
 9Djb8QBr20Zu8eCazJqFRRqBDSWkcg0G2aiuEH+n3LIMjHMw2rwdK3iz7
 c/8fk+gBpl2mE371VSSaamJ/0CsGqrNvT8upHdIEvaWt1oadMWMqtvIVf
 hcp5YMLMNepFTjs39a5tX7y48yv11W128FkmSXxoU7Zt8122FSJGKz2UP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311708556"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="311708556"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 20:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="647020034"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="647020034"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2023 20:25:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 20:25:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 20:25:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 20:25:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 20:25:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKI3XhERPpYMOmuRjgP0ZvxxlmMmaxUDhrXGF57Rn6w0K2NiRpYJ5rDk1GUlH2OiI8qC8sx8oZzOIjoz0kGFcDh7ZJZp73OVD/dHlSQTR5917TzUBnBxebOaQH8iG/831xj7RRwgXgPFDwsdBA7eh1tRMdAs6+UnTyJTkkQC4IADmXkK8uIZSYSEwJmBYrJOwK6ZrYwTKWRnI9tpGPEf3sNnJyllh1D0/Fbjw+CprMo3Ck5h9FVBDllA4oQqIEvrTs9lKUflViW3+9oHOXId7pMEIIaOvU9YpyAoL/cP6lomhLQUOkz+RBaV1l8XODo/AdEZrtudZ816gNPiF+Ds0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzO93V6oYt07Q4koY0MUXwh8RFzWuTOjVEHe4jfK57k=;
 b=eTtScZCimQnVtsswv94cbpTPKh5tWWr5Opb37MRDue8IBD8busdXtjkTvxQAcNU3b/Gv4mn5t8sLxyrESxqLJEHnFF/oOwePhapPpcHI50gA6zszghTZLdou7BTCKrsXJjdMUz47LIoCCUoNub/uB8u6ygrY/dN+pONJ3yquL2rLs2BtXoYrlpW7g17bOcsmqoEAnT13f7YZw0Uaf6RkPxhP0T7OWHRtNF1H3fM53ObUuPee0D7G7tbePogqa9On785LCujbA4izs/uDtq9JYH+1Gthg+eHJTXK4bBHYOEshvZ8qsamosLY1ljFlBa/RBfnt7aGQBicAwUeI6mjreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 04:25:13 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::6851:3db2:1166:dda6]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::6851:3db2:1166:dda6%8]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 04:25:13 +0000
Date: Tue, 14 Feb 2023 20:25:08 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthew Auld
 <matthew.auld@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/9] drm/i915: Replace kmap_atomic() with kmap_local_page()
Message-ID: <63ec5ea4d162d_18bf5929443@iweiny-mobl.notmuch>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbb5879-34f2-4188-a19f-08db0f0ca19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZaJlLzGCUtW4a4hWoGX9RsnnkTSXPZv7CPSKgJxGXk8eoHPxcRAVLI44HC/Xl8M3Hxc6WxavJYsJvJmD5JPtUffoOGsep9pPIftUq2aMsBo6XT4WbS4qLQRxe7RHiXc4R1Mqvp+ETXjJgJJcoA6FgNnIe9fuMv/nJDHTwI7LqOXSTdo4ni/4wJHNm/unRssLHZbGQHg12FK1Qaaavt0ddDiK9aMVL/11CjGYOXxssxejE5/wOlsCSFHpbE+bwUzyt7xgAJiyxjbmYTY5fZ2mvTQY5RUxcLTeHPE+vhco9wjsLZkG8JahM50jhCMD+0sfcb/HGX12KuQYb5hiXABuhBafF9gri+5RqKNED1/TZ2cwpmbILk3eog8zkK/z2stz6fCAzZ8v3e6YtFQsvt4X7//BtrErWH9x9xwDDBUbLgpu+WNKO2vBnoyU3Mxl3f/Kp/Gt3pMmtVXgd1tuZ7YNP7z8Y2btZdPoBH5Q2DDU0Ul6mqEIJi8vUwYCHxshfbouS2IoZv7nkcxyfV3EsxcGiIAOnfwP9ckyimmibvBznUdqFP+qKO2lCwKggIeePghmQDPyBWnefCADZYhKjNW++KStxULaOHLM7ETrMV3Ip8gbpg0E3csgnIZlLmsetAlR8HDqD+gq+kXxrMIllw2tAQnUiWiAOKvK+yYe4v+KgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199018)(921005)(110136005)(316002)(86362001)(4326008)(8676002)(66556008)(66946007)(41300700001)(7416002)(44832011)(8936002)(5660300002)(66476007)(966005)(54906003)(6486002)(2906002)(83380400001)(38100700002)(82960400001)(9686003)(6666004)(26005)(186003)(6506007)(6512007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fw7SdPYFXXBLC0XRpLbbL8EiTk3XlkAu9m+Zz6mBoXzUhMQha8ijDfVbgvX/?=
 =?us-ascii?Q?4v/dg/vXFMoX9C59YCZW32xu8jcqxXo5HuBo0rhT2D1TVjcKOmIdJ9dXkd4P?=
 =?us-ascii?Q?o24OO18KqGJ+Bhtrsnj6WmuCweFtrsqKoIDdV+k2zFtOAuGl+EpFWIBufga2?=
 =?us-ascii?Q?6ehzcCgsxnccai0+aYHwds2DKgbS0Sl+wkOXSl03xHAZQv8+OtXfcUuV3xK5?=
 =?us-ascii?Q?pjKspMM2RMnFULdnTawTnIx/wciCn0uBUtg8JyWRXChGrN628eogth3LcDuH?=
 =?us-ascii?Q?eLVKGDJ3HpisswL8EyKHnTPRlIllYS+BcaBsARfNB3GCCM+GzmjQZdYWZvMT?=
 =?us-ascii?Q?QRmR+IamnDjcu8w9Rov9FPe6StSzBL+30jwQhb2esvtBmbBbBmdVyTh8myqc?=
 =?us-ascii?Q?WHKhOd1QUZ9DZ1NLf/zq3/94SO84yBgzR8t6/CGMpg2njc0IvFT9+eFpC0p5?=
 =?us-ascii?Q?zuyjXrsUSIOUxVGHFlTDUMzdL+9fS/lg3VzL+KlDjQq4bdn1bRn4sXEilyvt?=
 =?us-ascii?Q?hyoZ9vGJvsD+0NH85eu4EsYUafDmKOoZTnS05w0mVReVXN7/eJ7h/ClOM/kq?=
 =?us-ascii?Q?FDAG0whOdgjLglX4MceUCvnZDu0ag1x3ZJLFJW3GbDHz2vwNWCXs1sNu90hz?=
 =?us-ascii?Q?Vgc1V9VYgiJkKlQBOeLFcv3O9JL4aEdkZL5NJQBcN+ned31tzmThnj+5pPMG?=
 =?us-ascii?Q?IK1wkHnJcA+cMrGd/550s5JU3YUCf/n0trE3vBm6lhMmxkyz/TQ3lGfJ9yQV?=
 =?us-ascii?Q?eJXnIHIEczo2aX4nsjKKHnso09J/Yfewvgir1B6ErGK6NBPfV4L7BuMQSNuQ?=
 =?us-ascii?Q?+pZ4iNfmOSHL+58d+shmMXNYq1xD8IYIzo3ukJupFl4pCn+vUEvBl+VssKOI?=
 =?us-ascii?Q?V5HLfwuRSfF7bkrNBZWZodNcXWqadXRt5JiVPoJVydJXn/5XHs3X9eXSbNCm?=
 =?us-ascii?Q?ccUV0Kf8259q4EKw1hVXG+Y2XEXTBWConNAM6DEBH1hjcUFGm/hBXLFQGTPk?=
 =?us-ascii?Q?iGePcamH1vK6RiVhKy/mE+8C988FMAL6CbQpb2n50iiMrMyZTlEl5s971lnt?=
 =?us-ascii?Q?o22d1w093OJpwoPJrTQXRHtgPzTwSebpPaux4hyW8CS8zYD2taU9TCOusyU/?=
 =?us-ascii?Q?1ThqNQXodIP89f5SOfk7DNrEGYq9rQZS0e46XcevFc/Qm0HZsflPtTQxsGVD?=
 =?us-ascii?Q?qmpm+xAo43/pPAd3fO4IMtwqGeMjdR20L0ZR5T6uRTxxj8JM3/aNnaZvRwrh?=
 =?us-ascii?Q?PL77K8a3Bqg7JcjR6hwc49Ua5PybEyZitfHeuPz8ingFKFnLsl4LN9HuEnsN?=
 =?us-ascii?Q?miIpRwssWE+W5DqKcVAQehA2X5V+L9vlqc8k21wYFoaqjvYSRHiwmRER+r7H?=
 =?us-ascii?Q?shFtQ6BJ+K/cfIm6yOgp4cD6Kjzk8nPgIOob8C9VeLKAogJcS7s2ggXtUyCp?=
 =?us-ascii?Q?vXCxNHgLou56V8+WuisOHlTJRN/FPiFva0sDFjTWnDJGDWHLje7KzoZtz5iE?=
 =?us-ascii?Q?yCshaXJ6y5ejSrc41DVirYVxeP5Vwq9lqOaPnztFsqOx6+hmYbd1NpcKlJ+P?=
 =?us-ascii?Q?bUAjCaSkWTxsJR7oA/kcOseTvldcbQvtWFeoyNow?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbb5879-34f2-4188-a19f-08db0f0ca19b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 04:25:13.1537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3dHvuBDhL6tj3Nc/9JZtM0RsV4l80Jdb0HR5YLHLhxoYHnkQIGuWKxLXA3O69VSrd1HeXw19wHYbecQYrdGGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> The use of kmap_atomic() is being deprecated in favor of
> kmap_local_page()[1].

Zhao,

Was there ever a v2 of this series?  I'm not finding it on Lore.

Thanks,
Ira

> 
> In the following patches, we can convert the calls of kmap_atomic() /
> kunmap_atomic() to kmap_local_page() / kunmap_local(), which can
> instead do the mapping / unmapping regardless of the context.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible.
> 
> [1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
> ---
> Zhao Liu (9):
>   drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
>   drm/i915: Use kmap_local_page() in gem/i915_gem_pyhs.c
>   drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
>   drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
>   drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
>   drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
>   drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
>   drm/i915: Use kmap_local_page() in i915_cmd_parser.c
>   drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c
> 
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c       | 10 +++++-----
>  drivers/gpu/drm/i915/gem/i915_gem_object.c           |  8 +++-----
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c             |  8 ++++----
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  6 ++++--
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c      |  6 +++---
>  .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  8 ++++----
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             |  5 +----
>  drivers/gpu/drm/i915/i915_cmd_parser.c               |  4 ++--
>  9 files changed, 30 insertions(+), 37 deletions(-)
> 
> -- 
> 2.34.1
> 


