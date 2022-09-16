Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4515BB0DD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C8510E4C0;
	Fri, 16 Sep 2022 16:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092A10E4B3;
 Fri, 16 Sep 2022 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663344400; x=1694880400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NUNuPwBU0rEEOYl0r7N8NJV/jReRsBxWsRJBQintf+Y=;
 b=m2fXC2VwZIbmgozLlDd5JGJI2c59XpXKfNPASsOFxPsbF7WIQeNLhx+u
 3Gx9a1S/zFiQ8v7Fluh3sZ4TBJPOQCJkB4mDTUxXANqujNxD6t0Mj1gEj
 uwV8u5Fw2uPuL4bcaVwU0RRf7oQm4ROI3KT9y2IM6T8BlLrTetvOUDFDi
 Y1lk/GJssFAkJYKVTLD47PNasqdL1+NMF0CUFdqY+wGbyg9KnA6I+FzFA
 KqxFQUIgNmUdftHlLTVbT7lPRKdv/2JWC1TZCI0u9ur632iHP/bGapJeH
 Vl2JCorQx6jOuVap210TcDMlISIu9CRGhN4OnW9hk369cweAC88Txf/E1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="286062180"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="286062180"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 09:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="617717994"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 16 Sep 2022 09:06:39 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 09:06:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 09:06:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 09:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOsMJhLCPF6Ldjvy+/rTZ24I0meB9RQxDzJw3UevjZunb4VlcKVrfNBouOo2/zo+fzMAOeWgSjWEI/YZdoaVZ5wbPP5fzf/AE49JZTAdv7FM+w3lk3iKycof9Jl9k0jeQ9d8ACpIvW7XFJKRyyhUciqNg8aQc521gHw9s+fCNH8v6WbhMB0vlokrmOs8yVb7S3f+jHldoanu4mgjcfNQF6Z78R0TOgBEZygp9cct0LNirqOvHxoeT5QEb+Hkivy1ib7xGowvkMoclrdWqJYjF+q+DosgJPpWn3RdnF+oHvJspGrLY0D09Ws09ONwFxd+bqCCYoKtjWXrPvvxQjeFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gWcjj68zLMzKLedxEwkjaFOND8jAKX8SSnEd3xo6dQ=;
 b=FfeUmBA2QtnHOJOVvT2UZJ8+3gcxWVuqTul1oyPb8Jghmdbp+cbvPbMMX7tRUbusiXtWluVcuGAdvItb9vLZF9boRCchUqJlN+d8CBNlbOj+b0YwGxPzng/Ewk8UKssyGwKDX6WJN+t0tv3czmyPYIqFUIHSiv69eDEmv+XC7ugWh2IdAT87N6M4nekAYwdtm8T+ZNPwWY9t4bxBnCKq17F/tL+dMWeAOgaTC9eDYIGnwounsl0dbq1ZDfO0kJkIGdL7cmPT+V/a1Wl7SztJlLoW3LDBW17JjihNdk1V8l/mPXUYaBtXJW+4VlIfLt+nsICrvBvoCX4KI46+9rl1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 16:06:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b80a:cf49:9118:24e7%6]) with mapi id 15.20.5612.022; Fri, 16 Sep 2022
 16:06:33 +0000
Date: Fri, 16 Sep 2022 09:06:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH v1 3/4] drm/i915: Split i915_gem_init_stolen()
Message-ID: <20220916160631.v47rfpplufcwee4j@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
 <20220915-stolen-v1-3-117c5f295bb2@intel.com>
 <dd4bec0f-9d8d-83c2-a0a4-722c4678dcce@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <dd4bec0f-9d8d-83c2-a0a4-722c4678dcce@intel.com>
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c6b014-19ed-4506-0911-08da97fd6c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OJfCkSRP7HyQlQGeKqEP5fHq+BJCga0gjGO5UzsSyhst6uSFRExVa+d/Ml/Rku1C+O3gYz1QPycjBJWvA0UffOarhL/WpooRQyt0k5DBiLOpHEZhLwUBPLl7t45bydcrg8Ovit3hIozz4BwIaL6ON3J1Gp/OdcWwnEfXsrfRrAxSeQczZ6wQDioapmD3MkSRcXw9oRMQHjSlQLlFp/PAdbL2hruWxG9bpbbfiM9NyFNzSzsK9g2qMJACuJFLYJP1RJSVJQkACrUvfz62f9cdgOH52YG8/AaYRpvFYM4H7IvykXCgmQMmPzMEKRo1fWt0PcBntnQvffeBWXHlnYMH6RucH/k/7rgLi5iEsfHS8GYUOjJ959FVL67SEF/N7N8cjIgOB0r/Lzj//4OPrLCZDfsJ435O18AcFqxXcTQ69EJCG23r+IJnG5DoRJsVRMys0Vs2QNpjH5Uj4qPNTC7yq3oT5f7EhXaDeQKuDMuoa7SmfDHx+rXYN6Gr/JnJvJ/o5/lo6Ru8TL4s6YRWK+rQ1H5EC3iRyfhtUmJbl028aLVhub5YxHsMVQYFZD/2wVQBiUmtb9qORR7pFdlhVonyVzavti2jpx0NnGu5SUTMf7ocH+m9kzGxzE5F6WAiwM97kc2VGb6gyAFk3CEzy7vetK9WorQ/i9EfbU0OaSaYsNgSZi3PAanT7p1ATPNxrUrdOUPMayg43hlj6+/4qxmVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199015)(83380400001)(82960400001)(1076003)(186003)(6512007)(26005)(9686003)(478600001)(41300700001)(107886003)(6486002)(6506007)(38100700002)(6636002)(5660300002)(8676002)(316002)(8936002)(6862004)(2906002)(66556008)(4326008)(450100002)(66476007)(36756003)(86362001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHWkQ/85IcjaN7DnJGkZZYPGtPUIgAujQiZdRUeQMW387vsrG1VTCl6oHY9U?=
 =?us-ascii?Q?H6iOtAh3HaZE96kwqSM5FDWkNQ2K6+KI3vJ/2sndYTkAstEeDxgs3ZKN0mv5?=
 =?us-ascii?Q?txFUl0UdKHZX+h52ShWEZF4scrOVoBNMweO92Heq15l868WBAMnaGhYVDmrh?=
 =?us-ascii?Q?eUppp2LMGdvBceZF8DO6TNr2t8heP9s4beCrq4V1Nl0WI/JZP7r57D6ou6Wf?=
 =?us-ascii?Q?GmXOwIRI4vGlgr0kfs4BWKWQ04Fg4f88Zw1y2ZAMtsC4ie3uDmjVjgbRBurV?=
 =?us-ascii?Q?0QAKLKn6Q88HGXB+BoovyY9fHlGTcvENt0fFDQuWFbv810RWhll5T7/kLl4l?=
 =?us-ascii?Q?vd2q37cCd+/GruPstSxiNKcE5hWeOEZjDJAj+v9vhPT8bnsKKQW/BVQeELge?=
 =?us-ascii?Q?RhlzJ/AH+bwPPPkJ+SpZqyf8Tp//MUgfVZPetGomixd/+oMFZnfCzCyVZ8Y3?=
 =?us-ascii?Q?goxIjdi81iiFTuwAKNVkAKJgKJWnC5vQSuM/uwVX0t3d5TDG6SgDlSdTtz5w?=
 =?us-ascii?Q?WoifZkxDY6lopLiJhEk0D84GZ1riry27DE7mO2JcKjSCx4P14zbf7/uRiIRx?=
 =?us-ascii?Q?sZ2O3XuzFBeFIPg/84QNdpUxXf/UesDdVuwixEK0fWpNIgx9qHgPMajts6v2?=
 =?us-ascii?Q?ywaQYKPM2prV4tKKvv94N6dkBPiU4HDt64IT48PjWMkukkySHktUkTL2jq+C?=
 =?us-ascii?Q?dJ2/fLkCH7uaRNc4hLoZiTbSrvFJ9bhbXBUU58MXd6OtOgnoR+6hgLqy4Rrg?=
 =?us-ascii?Q?Km42mkliDvz0bI/O8Bv39VT04Oq6DI2HxmB9s0vXUtmNJCyuNpIX9DMgbMRf?=
 =?us-ascii?Q?WhtWynMq2CnR+6KD6jIGy8Ddo4C9YofMltkzmHF2UHeWBE/BiWLBgiuo9KnX?=
 =?us-ascii?Q?cKpTFaWeQpVK8+lOW4TIniNayuX8hs5yhRJkU2fFlPRWW4ODc5xdsnlAem5K?=
 =?us-ascii?Q?2JG5902vIRGhAA/1FfPTzL5JoC5TpWE6wv3oAMzWcIp0BRRczz8huCtMMqFH?=
 =?us-ascii?Q?Qm+oWVw0C+LPxHNghi3N/0YxMvvyQWjy1mI0qWNy4FsCMv4dV94P4d53lrkg?=
 =?us-ascii?Q?PQookfA5/K1bxG0p8apnHFMJkKEle6ENt97PTqOGlCG/UGVfVX6OVNXT5wBZ?=
 =?us-ascii?Q?n1mGNafzkewy8pZwyfMP8YpKbad7c7DBBOsQzZGbTJssLoFZmfYHnxVJs+iX?=
 =?us-ascii?Q?YD269Qwv3s2vkFLrrxB3ULdRg5ufaWsRPmmeu+jNxuAOsIs1S6EERB4HQRCb?=
 =?us-ascii?Q?A2ogO6psEtpjtVcbymKnCjCyoxyEkGPxeELMYR9iRQ9QnS9jyRgsUEyztrle?=
 =?us-ascii?Q?T+FuxaN8gP2e759qMeo+pl3wNSXzqhdtU9AUa93BG4MzHzZEwjV9x9qq6EfJ?=
 =?us-ascii?Q?ApSV8bsX1JlwicMBuqGRTH2hbkQd1GmoO+ePO3IRbQlTq4vFkO7h07quGD0t?=
 =?us-ascii?Q?iT6HwnroFb9DrE8DjoY4wk0S7r+ck+NJoUFNiR78mGeIvvbdOVG5MIip3+oF?=
 =?us-ascii?Q?7WvHOIHL8LI9Aq3MBHE3/I3T4CiEltiqtR/NkzMf5H0t1VSSoZ3RXJs9IsTU?=
 =?us-ascii?Q?r5SOWBoDtTD5B2vRoXtlh9JF0KaVFBnTBct3XEgaXWLb213RRAeUp2jZ84L1?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c6b014-19ed-4506-0911-08da97fd6c93
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 16:06:33.1704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lwV5geg+xCsECNUgm4P66Fj6h57IRh/+LwUtKT1EWO3QsQT+izXfqlk2+9mImNrPeRQ8DKQ4hUOt8yIH10vxyMzAsqUj/IlegDPZ9/2Kn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6917
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
Cc: intel-gfx@lists.freedesktop.org, tejas.upadhyay@intel.com,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 16, 2022 at 05:50:33PM +0530, Iddamsetty, Aravind wrote:
>
>
>On 16-09-2022 02:09, Lucas De Marchi wrote:
>> Add some helpers: adjust_stolen(), request_smem_stolen_() and
>> init_reserved_stolen() that are now called by i915_gem_init_stolen() to
>> initialize each part of the Data Stolen Memory region. Main goal is to
>> split the reserved part, also known as WOPCM, as its calculation changes
>> often per platform.
>>
>> This also fixes a bug in graphics version < 5 (in theory, not tested,
>> due to no machine available): it would bail out on stolen creation due
>> to "Stolen reserved area outside stolen memory". Other than that, no
>> change in behavior.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> index c34065fe2ecc..0e57a6d81534 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>> @@ -77,22 +77,26 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>>  	mutex_unlock(&i915->mm.stolen_lock);
>>  }
>>
>> -static int i915_adjust_stolen(struct drm_i915_private *i915,
>> -			      struct resource *dsm)
>> +static bool valid_stolen_size(struct resource *dsm)
>> +{
>> +	return dsm->start != 0 && dsm->end > dsm->start;
>> +}
>> +
>> +static int adjust_stolen(struct drm_i915_private *i915,
>> +			 struct resource *dsm)
>>  {
>>  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>> -	struct resource *r;
>>
>> -	if (dsm->start == 0 || dsm->end <= dsm->start)
>> +	if (!valid_stolen_size(dsm))
>>  		return -EINVAL;
>>
>>  	/*
>> +	 * Make sure we don't clobber the GTT if it's within stolen memory
>> +	 *
>>  	 * TODO: We have yet too encounter the case where the GTT wasn't at the
>>  	 * end of stolen. With that assumption we could simplify this.
>>  	 */
>> -
>> -	/* Make sure we don't clobber the GTT if it's within stolen memory */
>>  	if (GRAPHICS_VER(i915) <= 4 &&
>>  	    !IS_G33(i915) && !IS_PINEVIEW(i915) && !IS_G4X(i915)) {
>>  		struct resource stolen[2] = {*dsm, *dsm};
>> @@ -131,10 +135,20 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>>  		}
>>  	}
>>
>> +	if (!valid_stolen_size(dsm))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +static int request_smem_stolen(struct drm_i915_private *i915,
>> +			       struct resource *dsm)
>> +{
>> +	struct resource *r;
>> +
>>  	/*
>> -	 * With stolen lmem, we don't need to check if the address range
>> -	 * overlaps with the non-stolen system memory range, since lmem is local
>> -	 * to the gpu.
>> +	 * With stolen lmem, we don't need to request if the address range
>replace /if/for
>> +	 * since lmem is local to the gpu.

humn.. it seems I skip some words here.

With stolen lmem, we don't need to request system memory since the
stolen region is local to the gpu.


>>  	 */
>>  	if (HAS_LMEM(i915))
>>  		return 0;
>> @@ -392,39 +406,22 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>>  	}
>>  }
>>
>> -static int i915_gem_init_stolen(struct intel_memory_region *mem)
>> +/*
>> + * Initialize i915->dsm_reserved to contain the reserved space within the Data
>> + * Stolen Memory. This is a range on the top of DSM that is reserved, not to
>> + * be used by driver, so must be excluded from the region passed to the
>> + * allocator later. In the spec this is also called as WOPCM.
>> + *
>> + * Our expectation is that the reserved space is at the top of the stolen
>> + * region, as it has been the case for every platform, and *never* at the
>> + * bottom, so the calculation here can be simplified.
>> + */
>> +static int init_reserved_stolen(struct drm_i915_private *i915)
>>  {
>> -	struct drm_i915_private *i915 = mem->i915;
>>  	struct intel_uncore *uncore = &i915->uncore;
>>  	resource_size_t reserved_base, stolen_top;
>> -	resource_size_t reserved_total, reserved_size;
>> -
>> -	mutex_init(&i915->mm.stolen_lock);
>> -
>> -	if (intel_vgpu_active(i915)) {
>> -		drm_notice(&i915->drm,
>> -			   "%s, disabling use of stolen memory\n",
>> -			   "iGVT-g active");
>> -		return 0;
>> -	}
>> -
>> -	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
>> -		drm_notice(&i915->drm,
>> -			   "%s, disabling use of stolen memory\n",
>> -			   "DMAR active");
>> -		return 0;
>> -	}
>> -
>> -	if (resource_size(&mem->region) == 0)
>> -		return 0;
>> -
>> -	if (i915_adjust_stolen(i915, &mem->region))
>> -		return 0;
>> -
>> -	GEM_BUG_ON(i915->dsm.start == 0);
>> -	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
>> -
>> -	i915->dsm = mem->region;
>> +	resource_size_t reserved_size;
>> +	int ret = 0;
>>
>>  	stolen_top = i915->dsm.end + 1;
>>  	reserved_base = stolen_top;
>> @@ -453,19 +450,17 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>  	} else if (GRAPHICS_VER(i915) >= 5 || IS_G4X(i915)) {
>>  		g4x_get_stolen_reserved(i915, uncore,
>>  					&reserved_base, &reserved_size);
>> +	} else {
>> +		/* No reserved region */
>> +		goto bail_out;
>
>better to have a WARN_ON here about STOLEN region wrongly passed on the
>region list.

see the follow up I sent on this patch. The bail out here should be outside
this else and is a normal condition. This is about the reserved space
within stolen (aka wopcm), and having it 0 is normal even for the
platforms above that have a function to read the stolen reserved region.

a WARN_ON based on the regions in device_info would be wrong as having
stolen doesn't mean there is a wopcm. Btw I think a great source of
confusion is using "reserved stolen" for this part because we then think
it's about reserving the stolen memory when in fact this is about a
region inside the stolen.

>
>>  	}
>>
>> -	/*
>> -	 * Our expectation is that the reserved space is at the top of the
>> -	 * stolen region and *never* at the bottom. If we see !reserved_base,
>> -	 * it likely means we failed to read the registers correctly.
>> -	 */
>> -	if (!reserved_base) {
>> +	if (!reserved_base || reserved_base == stolen_top) {
>>  		drm_err(&i915->drm,
>>  			"inconsistent reservation %pa + %pa; ignoring\n",
>>  			&reserved_base, &reserved_size);
>> -		reserved_base = stolen_top;
>> -		reserved_size = 0;
>> +		ret = -EINVAL;
>> +		goto bail_out;
>>  	}
>>
>>  	i915->dsm_reserved =
>> @@ -475,19 +470,55 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>  		drm_err(&i915->drm,
>>  			"Stolen reserved area %pR outside stolen memory %pR\n",
>>  			&i915->dsm_reserved, &i915->dsm);
>> +		ret = -EINVAL;
>> +		goto bail_out;
>> +	}
>> +
>> +	return 0;
>> +
>> +bail_out:
>> +	i915->dsm_reserved =
>> +		(struct resource)DEFINE_RES_MEM(reserved_base, 0);
>> +
>> +	return ret;
>> +}
>> +
>> +static int i915_gem_init_stolen(struct intel_memory_region *mem)
>> +{
>> +	struct drm_i915_private *i915 = mem->i915;
>> +
>> +	mutex_init(&i915->mm.stolen_lock);
>> +
>> +	if (intel_vgpu_active(i915)) {
>> +		drm_notice(&i915->drm,
>> +			   "%s, disabling use of stolen memory\n",
>> +			   "iGVT-g active");
>> +		return 0;
>> +	}
>> +
>> +	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
>> +		drm_notice(&i915->drm,
>> +			   "%s, disabling use of stolen memory\n",
>> +			   "DMAR active");
>>  		return 0;
>>  	}
>>
>> +	if (adjust_stolen(i915, &mem->region))
>> +		return 0;
>> +
>> +	if (request_smem_stolen(i915, &mem->region))
>> +		return 0;
>
>why do we want to subside the errors returned in adjust_stolen and
>request_smem_stolen?

This was already there: i915_gem_init_stolen() was only returning 0.
This patch only makes it clearer since it's now a smaller function.

Basically this was the function doing the "log when
appropriate, but consider it non-fatal". On the next patch I move this
decision to the caller.


Lucas De Marchi

>
>> +
>> +	i915->dsm = mem->region;
>> +
>> +	if (init_reserved_stolen(i915))
>similarly here.
>
>Thanks,
>Aravind.
>> +		return 0;
>> +
>>  	/* Exclude the reserved region from driver use */
>> -	mem->region.end = reserved_base - 1;
>> +	mem->region.end = i915->dsm_reserved.start - 1;
>>  	mem->io_size = min(mem->io_size, resource_size(&mem->region));
>>
>> -	/* It is possible for the reserved area to end before the end of stolen
>> -	 * memory, so just consider the start. */
>> -	reserved_total = stolen_top - reserved_base;
>> -
>> -	i915->stolen_usable_size =
>> -		resource_size(&i915->dsm) - reserved_total;
>> +	i915->stolen_usable_size = resource_size(&mem->region);
>>
>>  	drm_dbg(&i915->drm,
>>  		"Memory reserved for graphics device: %lluK, usable: %lluK\n",
>> @@ -759,11 +790,6 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
>>  	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
>>  		return -ENODEV;
>>
>> -	/*
>> -	 * TODO: For stolen lmem we mostly just care about populating the dsm
>> -	 * related bits and setting up the drm_mm allocator for the range.
>> -	 * Perhaps split up i915_gem_init_stolen() for this.
>> -	 */
>>  	err = i915_gem_init_stolen(mem);
>>  	if (err)
>>  		return err;
>>
