Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95866A170
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 19:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF0F10EA80;
	Fri, 13 Jan 2023 18:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A46D10E1F7;
 Fri, 13 Jan 2023 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673632976; x=1705168976;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J6YoTbRyEqis/2aJjEu3YgOWt49t3ONfPHJVeBZ1cuQ=;
 b=WJXHgW9u98gtX4H2qw0i/MZgnLpiUfRSkg2owcNdgYtodxJdMQdGGhk2
 lVjll9Ec8aEed8P8DpOm/2A0L762z1rCTBzebfROVAyGOumPbGIX7Vc6H
 I2q9cLZ0x96FDCY1LG1pC7V58CdkkYG/ZUq5/ckf+XK1chB69guXM/la5
 zneZHOFf4ciecYBsD5IMvgPLOAV5ALml5H+52E4gzsFx9fmwf9vidkby+
 kId1FGFeK+K91AL/TOyQWASE5+Sa5Pwyf1TuSi0g/peuRy7hxaybwnMqy
 6CkycQEZ7pjvVmK+OoQkHaRE6wSgjn6kI03kmyQwoJ9lttv3o28L/085j Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="326115853"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="326115853"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 10:02:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="726791814"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="726791814"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2023 10:02:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 10:02:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 10:02:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 13 Jan 2023 10:02:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnleTGZzwRtJP25BEWGWrJrLgsiS8rpSmViXbFol/3x3f8Wkv3WPYvGzIm6fFGGNB4CjaXb5U00FexORA+jEDQMz32/AHp7YsAd+UbTistzp/brE8qV1r4rODR3inqJrtpAinGusFlWWDDJmsfp00y/gCu/u9BBvItU5dKdxP8Gq7KVQpKNU7mU/tucxj6xiqEB9hlqUGoErtDQndw8lS39RpZtDbxV9IuS0UkuqZfJpSHSZLZ9zjemcxvCtaZws/uui0GDSvUaJ0yzN1duofDTdV6N8z3a47OaEgEyGQ1vc3TDsc9NJR79XwFlQzkL2RXFbw7ZUvFH/nhS/zXh16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LySdO2c3K2SyyriFqbEZaB2lxLNT0fMS3LQbvDUn7hs=;
 b=iiGCpmdehk1y+eWNai7NlbuTJX3+nwDMNmyiiToLC09+26RinmBDarusmW10p4Xy/OSrSykL2RMdZdcBxSJNr8WVJT+k9TOL1LTsz6mucqzmXQ6VCUVJKwXUHeAcnl345qSXhaCn4YCQ2Ouy8B3mGLJU6+716/EFYAMp1NmT/tHGDODBeYh0VPs6xX70snRKIhkrPY3NW2t5vXKRpR6DPPsB77ZNaolizORhsnZj6S1lKG/7GqjVaHC/bYRiuzHVeDVT9HhipCxLh4+A2v5c7F7bJbCr6ajBssXCtVoK2DNnHJgjs8xNW2sjIaTK2pOYkkfs+rSDvo58dceeWdhWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW3PR11MB4635.namprd11.prod.outlook.com (2603:10b6:303:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 18:02:45 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::8d82:960d:f964:f337%9]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 18:02:45 +0000
Date: Fri, 13 Jan 2023 10:02:38 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v9 10/23] drm/i915/vm_bind: Add out fence support
Message-ID: <Y8GcvszJJrv4gp36@nvishwa1-DESK>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
 <20221212231527.2384-11-niranjana.vishwanathapura@intel.com>
 <60d72e6ff745392c6681617b2299df04738c2565.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60d72e6ff745392c6681617b2299df04738c2565.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW3PR11MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: f84d0f0b-9e3d-42c6-1f16-08daf5905f83
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iYYwtlgq6EXVZD82QP3pMFwxslr4HILBqKWQop5yyprQQYmtB4dgpXYKyz5oOqqlhrm15AEYcu5z9VLebzSJT1oL2Bc2x4rs797V3zjeuBZkXR1A5XexdlEXbuMGivo/Hq3aULjH0I1izl60Wfn2Gbha/lzSNxHN5462Io9sPz2YCDO6qto2FJM59mjGPxI90NdAdl7eq0j6L5khZk89n5nZHyFTnr3yFDT8ShG00+6N2tK9MuAt+yuc8lLdHN4Q8eLuSz3qDiHcJAssBflY2aC2Cr2lYBs6nEbpTIjt8zwfbgRL9tv6/FQ1ZvsN0OV9Ph4we70MGyf1iAuzzD2G3JGFsUIfit4qEVEvsrZW16PAvnykAJnwdIvONEmV0dgo9lbI/xcEW21E4dWFzKqDMT1s6d4TnQaSu9mBiYEgJ54JiivhjX4c5fXnIn7t41z0MYB+wt91idFca1EqtFMOUgAFcZNnvs0Ebh0HybBTRj0Ebmw+yVTtiIiIQaRvCBX0eNJBP9+e0TmiNagyWb8oQSIJBnd76FPE2WC+jTXNikJ9l/gV0+qcypSansVLTFcFxvP6yjI+69PAEGtDUww2V3yCvyWOG3h+RkeTotuaohiEwgMFR0w3EGr2pl2RExbeeiTq9q6lDDTvqe9gO1It8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199015)(33716001)(8936002)(26005)(2906002)(4001150100001)(5660300002)(41300700001)(66556008)(4326008)(316002)(8676002)(66476007)(66946007)(30864003)(6862004)(54906003)(6636002)(6512007)(38100700002)(86362001)(9686003)(44832011)(186003)(82960400001)(83380400001)(6506007)(478600001)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GHejYLLuIzt4NjTIOrcPAtjDDf0T8rvGxElKbmbYLVzk25VmZX2Kj+LQWe?=
 =?iso-8859-1?Q?OH4enBZvLzs6K+GKIuzhPFU4sR8fMO9FYUM4QuYfKerRCBpRY4YLNOjKD9?=
 =?iso-8859-1?Q?EYqoM9QLwLHbA5k4SZHddhl2WkhE4f5SGCHrmWRhkVzsNyLIBQFVu6RE56?=
 =?iso-8859-1?Q?Fnahcg3ARWO/7a5kBhswYKsmJtBBBGcj0/mQMvnV5RBx0pQQLuKXSgp2Vd?=
 =?iso-8859-1?Q?ZmJsZtd4a0lEykBMAp/Bfbr4UPKuJFPgUQ8HG7kWq3VBZ4d50Lya59CjHI?=
 =?iso-8859-1?Q?szyNH0nTK3HNrd1199zJExPY/tuGiDdmXg1DtOD5hmgSJHHZwsKS90khPL?=
 =?iso-8859-1?Q?SLgMJGKnAB+51h1Lrl+3Fig693y7EMZ/Aux6d0ftuFT1cY8VmR5Uj+jOzO?=
 =?iso-8859-1?Q?d3NqlnM9Xv1hIjrTLgSJltVzpAyJFSc4zud8F8AL1/sVL3m0DmS4Ln6RC6?=
 =?iso-8859-1?Q?3fC8bcrILjEkZMK/Qf3iW+XRcXGNM8FKpDeQodZ4bKppiHMSau+OlHDdU/?=
 =?iso-8859-1?Q?A+tZzgVRdYXr6izhgDnYmTrVDU3Ei+xEtojVQ0jUUraTpCD/6ZrHrHrAeo?=
 =?iso-8859-1?Q?vS76y13LMflmfQNchxl755tIezUntew+EDRj4WZNAYroCaHLbiBzgIJlxH?=
 =?iso-8859-1?Q?b18s/V3r2Q2/8rACAs8NLpl74S/wRlpmLqhPvuENx9T/zZqELb5XFLtjaj?=
 =?iso-8859-1?Q?OItZkX7ybJGMD/oOy4U+/Eh+gDecCuVlBBh0HUbjAo82nx5SsG4zeSAa4H?=
 =?iso-8859-1?Q?JxL/e9cuFO3kOEJcqD3Y452bo+n+RZSXqkYDIiRVfhjtiPdzpQucl84nsY?=
 =?iso-8859-1?Q?/WnvIXrxMjYZ7C8mdPOxu/Axpx2622toKlm8LLfDoS30LJs+Huwpi5Vx6Q?=
 =?iso-8859-1?Q?NR2RLLaEBQdLjfvooD+b8CMYd224erVLZCUOxZCXq4xrHzsH9MlKJrPdhx?=
 =?iso-8859-1?Q?KoiO5ygtOLzM+LtJzqTOmrs1TBZ9snQaD6ztzsOqT+ZTM2ZEmgN+nmJfLv?=
 =?iso-8859-1?Q?07hKoqjuxP1FvUpw/VDPbsEzPgTgEZWWlVEWOWtXbMWTxOSEHx3T8FfSAp?=
 =?iso-8859-1?Q?f4R6YjSdY1XnYqmWxiBN9HYwOvj/LCfB79noxHn/mMX/wZuHLnZrrthPWu?=
 =?iso-8859-1?Q?Vqx6I5LHCTPqYBs1tabjPYpB/KVY00YfjYlz5VbtEK6+YTmzV1+G0qDCaz?=
 =?iso-8859-1?Q?LQoo+bWVJMCl+ybWTH4Fzrm3+Zgy6KuoHGPW0Gy6/0PirX9NQkPFblHMDO?=
 =?iso-8859-1?Q?9+1zVHafjuqXvVNydi3IX8F/y6c86OSwq93VVuKfMxgzAiP2MS0cWDGaSK?=
 =?iso-8859-1?Q?6gFaTzIIpujh6oLwTI6s6x/YT7FQTpCcvXx1bQFSVlqQuA/i36QYFNfHdB?=
 =?iso-8859-1?Q?V7NlpXlUnQUo5/jzzI0x4DevDa0CO+KJIeHzontbobXSHEmlxuR6gESlVH?=
 =?iso-8859-1?Q?rz9BX9O0d7WZ/wTdASPeH58KOFmhB1rYnlShQWAWhraQ5U5JvMIEIwHjNF?=
 =?iso-8859-1?Q?1uJDCbuSwZZdTCQCpWt9pWHgb8hrnsc3LlS4eYpECZvQvuhdWPfIJyr8f8?=
 =?iso-8859-1?Q?PpzmNXesmHTLFgcX72N+zgvl/GudboKCr4iGd1Ge7InlDwodlT6EtoKjvG?=
 =?iso-8859-1?Q?rXU0tz3NJVbH48bhCju1McAh9qHl4H9hV7M0pFZE3hzN/TvYXRG0F6SQ9M?=
 =?iso-8859-1?Q?fVLCXbq1q8hYKozR2C8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f84d0f0b-9e3d-42c6-1f16-08daf5905f83
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 18:02:45.5039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19sw+mDrnfJRbsK2cu918CUThbGTBrPlXtz5zBY+nOtARuQR4zBXNjSo1n1tlqDUMKiFU0LlKC0Jt3rfXFw46SvCuI3es7QqJQFqWYL+FO+DNW3xNVNjLVQ1YuReXVcx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 05:48:45PM -0800, Zanoni, Paulo R wrote:
>On Mon, 2022-12-12 at 15:15 -0800, Niranjana Vishwanathapura wrote:
>> Add support for handling out fence for vm_bind call.
>>
>> v2: Reset vma->vm_bind_fence.syncobj to NULL at the end
>>     of vm_bind call.
>> v3: Remove vm_unbind out fence uapi which is not supported yet.
>> v4: Return error if I915_TIMELINE_FENCE_WAIT fence flag is set.
>>     Wait for bind to complete iff I915_TIMELINE_FENCE_SIGNAL is
>>     not specified.
>> v5: Ensure __I915_TIMELINE_FENCE_UNKNOWN_FLAGS are not set.
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 98 ++++++++++++++++++-
>>  drivers/gpu/drm/i915/i915_vma.c               |  7 +-
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
>>  include/uapi/drm/i915_drm.h                   | 58 ++++++++++-
>>  5 files changed, 165 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> index 36262a6357b5..b70e900e35ab 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>> @@ -8,6 +8,7 @@
>>  
>>
>>
>>
>>  #include <linux/types.h>
>>  
>>
>>
>>
>> +struct dma_fence;
>>  struct drm_device;
>>  struct drm_file;
>>  struct i915_address_space;
>> @@ -23,4 +24,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
>>  
>>
>>
>>
>>  void i915_gem_vm_unbind_all(struct i915_address_space *vm);
>>  
>>
>>
>>
>> +void i915_vm_bind_signal_fence(struct i915_vma *vma,
>> +			       struct dma_fence * const fence);
>> +
>>  #endif /* __I915_GEM_VM_BIND_H */
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> index dc738677466b..fd1d82ce99e6 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>> @@ -7,6 +7,8 @@
>>  
>>
>>
>>
>>  #include <linux/interval_tree_generic.h>
>>  
>>
>>
>>
>> +#include <drm/drm_syncobj.h>
>> +
>>  #include "gem/i915_gem_context.h"
>>  #include "gem/i915_gem_vm_bind.h"
>>  
>>
>>
>>
>> @@ -101,6 +103,77 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
>>  		i915_gem_object_put(vma->obj);
>>  }
>>  
>>
>>
>>
>> +static int i915_vm_bind_add_fence(struct drm_file *file, struct i915_vma *vma,
>> +				  u32 handle, u64 point)
>> +{
>> +	struct drm_syncobj *syncobj;
>> +
>> +	syncobj = drm_syncobj_find(file, handle);
>> +	if (!syncobj) {
>> +		drm_dbg(&vma->vm->i915->drm,
>> +			"Invalid syncobj handle provided\n");
>> +		return -ENOENT;
>> +	}
>> +
>> +	/*
>> +	 * For timeline syncobjs we need to preallocate chains for
>> +	 * later signaling.
>> +	 */
>> +	if (point) {
>> +		vma->vm_bind_fence.chain_fence = dma_fence_chain_alloc();
>> +		if (!vma->vm_bind_fence.chain_fence) {
>> +			drm_syncobj_put(syncobj);
>> +			return -ENOMEM;
>> +		}
>> +	} else {
>> +		vma->vm_bind_fence.chain_fence = NULL;
>> +	}
>> +	vma->vm_bind_fence.syncobj = syncobj;
>> +	vma->vm_bind_fence.value = point;
>> +
>> +	return 0;
>> +}
>> +
>> +static void i915_vm_bind_put_fence(struct i915_vma *vma)
>> +{
>> +	if (!vma->vm_bind_fence.syncobj)
>> +		return;
>> +
>> +	drm_syncobj_put(vma->vm_bind_fence.syncobj);
>> +	dma_fence_chain_free(vma->vm_bind_fence.chain_fence);
>> +	vma->vm_bind_fence.syncobj = NULL;
>> +}
>> +
>> +/**
>> + * i915_vm_bind_signal_fence() - Add fence to vm_bind syncobj
>> + * @vma: vma mapping requiring signaling
>> + * @fence: fence to be added
>> + *
>> + * Associate specified @fence with the @vma's syncobj to be
>> + * signaled after the @fence work completes.
>> + */
>> +void i915_vm_bind_signal_fence(struct i915_vma *vma,
>> +			       struct dma_fence * const fence)
>> +{
>> +	struct drm_syncobj *syncobj = vma->vm_bind_fence.syncobj;
>> +
>> +	if (!syncobj)
>> +		return;
>> +
>> +	if (vma->vm_bind_fence.chain_fence) {
>> +		drm_syncobj_add_point(syncobj,
>> +				      vma->vm_bind_fence.chain_fence,
>> +				      fence, vma->vm_bind_fence.value);
>> +		/*
>> +		 * The chain's ownership is transferred to the
>> +		 * timeline.
>> +		 */
>> +		vma->vm_bind_fence.chain_fence = NULL;
>> +	} else {
>> +		drm_syncobj_replace_fence(syncobj, fence);
>> +	}
>> +}
>> +
>>  static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
>>  				  struct drm_i915_gem_vm_unbind *va)
>>  {
>> @@ -206,6 +279,11 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  	if (!va->length || !IS_ALIGNED(va->start, I915_GTT_PAGE_SIZE))
>>  		ret = -EINVAL;
>>  
>>
>>
>>
>> +	/* In fences are not supported */
>> +	if ((va->fence.flags & I915_TIMELINE_FENCE_WAIT) ||
>> +	    (va->fence.flags & __I915_TIMELINE_FENCE_UNKNOWN_FLAGS))
>> +		ret = -EINVAL;
>> +
>>  	obj = i915_gem_object_lookup(file, va->handle);
>>  	if (!obj)
>>  		return -ENOENT;
>> @@ -238,6 +316,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		goto unlock_vm;
>>  	}
>>  
>>
>>
>>
>> +	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
>> +		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
>> +					     va->fence.value);
>> +		if (ret)
>> +			goto put_vma;
>> +	}
>> +
>>  	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER |
>>  		    PIN_VALIDATE | PIN_NOEVICT;
>>  
>>
>>
>>
>> @@ -250,10 +335,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		if (ret)
>>  			continue;
>>  
>>
>>
>>
>> -		/* Wait for bind to complete */
>> -		ret = i915_vma_wait_for_bind(vma);
>> -		if (ret)
>> -			continue;
>> +		/* If out fence is not requested, wait for bind to complete */
>> +		if (!(va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
>> +			ret = i915_vma_wait_for_bind(vma);
>> +			if (ret)
>> +				continue;
>> +		}
>>  
>>
>>
>>
>>  		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>  		i915_vm_bind_it_insert(vma, &vm->va);
>> @@ -265,6 +352,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
>>  		i915_gem_object_get(vma->obj);
>>  	}
>>  
>>
>>
>>
>> +	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
>> +		i915_vm_bind_put_fence(vma);
>> +put_vma:
>>  	if (ret)
>>  		i915_vma_destroy(vma);
>>  unlock_vm:
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index c9527f1fdab9..6970e1022fee 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -29,6 +29,7 @@
>>  #include "display/intel_frontbuffer.h"
>>  #include "gem/i915_gem_lmem.h"
>>  #include "gem/i915_gem_tiling.h"
>> +#include "gem/i915_gem_vm_bind.h"
>>  #include "gt/intel_engine.h"
>>  #include "gt/intel_engine_heartbeat.h"
>>  #include "gt/intel_gt.h"
>> @@ -1599,8 +1600,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>>  err_vma_res:
>>  	i915_vma_resource_free(vma_res);
>>  err_fence:
>> -	if (work)
>> +	if (work) {
>> +		if (i915_vma_is_persistent(vma))
>> +			i915_vm_bind_signal_fence(vma, &work->base.dma);
>> +
>>  		dma_fence_work_commit_imm(&work->base);
>> +	}
>>  err_rpm:
>>  	if (wakeref)
>>  		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
>> index 6b1cce537846..4c386473923a 100644
>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>> @@ -309,6 +309,13 @@ struct i915_vma {
>>  	/** @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
>>  	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
>>  
>>
>>
>>
>> +	/** Timeline fence for vm_bind completion notification */
>> +	struct {
>> +		struct dma_fence_chain *chain_fence;
>> +		struct drm_syncobj *syncobj;
>> +		u64 value;
>> +	} vm_bind_fence;
>> +
>>  	/** Interval tree structures for persistent vma */
>>  
>>
>>
>>
>>  	/** @rb: node for the interval tree of vm for persistent vmas */
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 683da7099311..f35a9bb35ab3 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -1533,6 +1533,41 @@ struct drm_i915_gem_execbuffer2 {
>>  #define i915_execbuffer2_get_context_id(eb2) \
>>  	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
>>  
>>
>>
>>
>> +/**
>> + * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
>> + *
>> + * The operation will wait for input fence to signal.
>> + *
>> + * The returned output fence will be signaled after the completion of the
>> + * operation.
>> + */
>> +struct drm_i915_gem_timeline_fence {
>> +	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
>> +	__u32 handle;
>> +
>> +	/**
>> +	 * @flags: Supported flags are:
>> +	 *
>> +	 * I915_TIMELINE_FENCE_WAIT:
>> +	 * Wait for the input fence before the operation.
>> +	 *
>> +	 * I915_TIMELINE_FENCE_SIGNAL:
>> +	 * Return operation completion fence as output.
>> +	 */
>> +	__u32 flags;
>> +#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
>> +#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
>> +#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
>> +
>> +	/**
>> +	 * @value: A point in the timeline.
>> +	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
>> +	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
>> +	 * binary one.
>> +	 */
>> +	__u64 value;
>> +};
>
>Is there any specific reason why we didn't go with the same approach of
>drm_i915_gem_execbuffer_ext_timeline_fences where we keep using
>drm_i915_gem_exec_fence but then add an extra array of values?
>
>I'm doing the Anv implementation and it feels unnecessary to have to
>maintain separate code paths to keep the same information in different
>formats between execbuf2 and and execbuf3.
>

The newer drm_i915_gem_timeline_fence is used both by eb3 and vm_bind.
The eb3 will have an array of timeline fences, but vm_bind will have
only one timeline fence. Having separate handles ptr and values ptr
doesn't look good for vm_bind case. Also, I think it will be slightly
performant if we have copy_from_user once instead of twice.
Probably on eb2, values were added as a separate pointer so that we
can reuse existing binary fence structure drm_i915_gem_exec_fence, and
we don't have to carry this legacy bag into eb3 which is totally new.

Niranjana

>> +
>>  struct drm_i915_gem_pin {
>>  	/** Handle of the buffer to be pinned. */
>>  	__u32 handle;
>> @@ -3785,7 +3820,8 @@ struct drm_i915_gem_create_ext_vm_private {
>>   * -ENOSPC will be returned if the VA range specified can't be reserved.
>>   *
>>   * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
>> - * are not ordered.
>> + * are not ordered. Furthermore, parts of the VM_BIND operation can be done
>> + * asynchronously, if valid @fence is specified.
>>   */
>>  struct drm_i915_gem_vm_bind {
>>  	/** @vm_id: VM (address space) id to bind */
>> @@ -3803,15 +3839,29 @@ struct drm_i915_gem_vm_bind {
>>  	/** @length: Length of mapping to bind */
>>  	__u64 length;
>>  
>>
>>
>>
>> -	/** @flags: Currently reserved, MBZ. */
>> +	/**
>> +	 * @flags: Currently reserved, MBZ.
>> +	 *
>> +	 * Note that @fence carries its own flags.
>> +	 */
>>  	__u64 flags;
>>  #define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
>>  
>>
>>
>>
>>  	/** @rsvd: Reserved, MBZ */
>>  	__u64 rsvd[2];
>>  
>>
>>
>>
>> -	/** @rsvd2: Reserved for timeline fence */
>> -	__u64 rsvd2[2];
>> +	/**
>> +	 * @fence: Timeline fence for bind completion signaling.
>> +	 *
>> +	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
>> +	 *
>> +	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
>> +	 * is invalid, and an error will be returned.
>> +	 *
>> +	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
>> +	 * is not requested and binding is completed synchronously.
>> +	 */
>> +	struct drm_i915_gem_timeline_fence fence;
>>  
>>
>>
>>
>>  	/**
>>  	 * @extensions: Zero-terminated chain of extensions.
>
