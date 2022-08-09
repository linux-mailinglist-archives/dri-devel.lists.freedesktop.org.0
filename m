Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62158D737
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD1ECE1A0;
	Tue,  9 Aug 2022 10:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C518ACE17C;
 Tue,  9 Aug 2022 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660039937; x=1691575937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W1dCdRa9i5IGxEl6YuB3pkY8PivI1PitIypXqQgXY6g=;
 b=E9Vt2UTDbOq4sxG4KA0cR8LJPEiWzojCio6XHDiWBw7TTgHUGOWwazh6
 +G9gbueZIXFzweFw+dmhTqQ4DwUPY7ynPa39/DhJRbVS1p/ajOJCpfKR9
 +xTMwin8R52Dn7uqmrGZFHlzGIGc0tSIDOSWduYsEhjTbbDInNQvOdKjP
 joGydBn5OWicqAg1uYZU0ddIq3RuqZzd33SWbh9j/5osDONXqIno8+oEL
 q4w911bk7m5lgcW6W/0YUjPwlok2wJZuBH/8aDiRaXJ214VUQe9h/j3eP
 4ppg7AG73jYz9hclvdzSx1N4sEsGmN9FHcKuyDb3RPiy7jEG9hQu40QLN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="352530962"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="352530962"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 03:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="608163823"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2022 03:12:14 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:12:13 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 03:12:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 03:12:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 03:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bw7qnHoFrItMxs5XOC02pdQsRExDtgsO0em237brNuIH3+YmRbLO03iX8Pfsq/CtSPvoC51SdP2yAUq3DG9D/2MjvN5+b1q5zeWoawVIyK3HGYRnKBhUV/v0GCUfUL0tjubNlK72rC5KNUqUR7JCNUIHpjtxml32nz7da+Tsj6iYNKMd5GRBmi0gwwN1vSDbiEGo5MAPXTvpZZMmkTQ6Msr1pUqeuAKUegdhKFey9YWBBLE7OtCue+pEcmBAwoUxpto/rHcxC94snhhTNqKJuKIn14Nhy2WsiLcP5uHsm326U2wWMvOtKxQReSm6rucYZyo2Dtb6rBFz7Rac8ZZOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWN+290TYyB9Yney/EqL51r2ULfxK3dgNvqdOAMGJrM=;
 b=c2Adpaf2HXIHvQ5CQmdUfZb/cHpWEgFIckiTMRHUQCNrwm+t3PCI9xlKzjzP0NXRwAgZsM7JGX8+oKOqn2PwQ4eJ/mvJDDdAVIqwu3yYQZMFe+1CjeMV28dQsSNKYW2BxNnqsulZro5hRd41jEOfk88DxEtYWrMKED6UfbsnttJWgPCDXK2MQai564chIiHlfaXyx410c6j1XRjWOcveKCc/dbBLAIwosqmrQNujNMfKMu8CNXTa+FlCr3Gq07lPup6xoXeU0nal5W6x/JzUkSgKXrUaj73we4uz9H3AnvN+8fyy/3OnaKDYOnb+83rkyBCS8tmhavsS8wyIuin2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN6PR11MB4052.namprd11.prod.outlook.com (2603:10b6:405:7a::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 10:12:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 10:12:11 +0000
Date: Tue, 9 Aug 2022 06:12:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 38/39] drm/i915: add descriptions for some
 RPM macros at intel_gt_pm.h
Message-ID: <YvIy9o2dHkB1gAr6@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <37e3b9aac85f1d08c0a53bae86680d504308bf67.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <37e3b9aac85f1d08c0a53bae86680d504308bf67.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c3c8fe-3196-4364-f2cd-08da79ef9fee
X-MS-TrafficTypeDiagnostic: BN6PR11MB4052:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dR75t9JU0rrQV+9hWsDnmUvcFqJTeaTUo4/KowUDQ2AZfkq7PuGiIJqwTMYOwl9/a/3y7dXcLBg6VsGEi811Tl/UYaCIpgKQRDh7iLbeNhk9c3SRNoEFOZl/4o7WpR2oak4z20EO37vkT6uqvy6Z/itbFXzz9RFXzMDzZWlhK7z0ZfwotbtRhEsabKDA/bT1fRaVWijefEJdtPsUBAWFllzndVG0r8mErEAIpI79ajB4OYAyCLuncjZ/aQMCVZ3GZrR7bXhBCvmY2FePTssnGrsodkMPqLDKjmlB/aPj60l+wJp3ywMs9PPJS7/Lr+BfW3XqBdYJGyZzaUf+nzyALh41pkFHjSrQiyAFjQJn/kHHBOileUwMAT7SIWfcUGHSON/uhEZkw14S9MZQaYxUBofx5Hy58MQ7qr+wx8NKlecvHrpGfVwldhqxtQHG/o/Hdl14S+AmS0dzZYxGUf3lYDZEB1gx4bwshMuUF/YKk+jTWQ24jBJonzPj4eVSue29FGCIfB+QYfniYYIraaewnFuTlSFLayim10TAdndiLPGtiJ9tsy23+nWBP0V3nUJYAP4xvZlOowC0fXUorHiNKJyaJNy54ahU59Qw7Acscci08kW/ais+7Zuj2mzbWyR6/Qgc2Lr8LYusYSm1a9KCvj8tlg7kOTKyHtec/NSdCbERGe+BCMv8i380aQWRS/ChsMo0S2qttRyJQZPqgf9P3fG9X8/2bp5DQYYyco/u8EIC1R2WL2GJ2fD9b6m3bB//Og+HRNRd8ddpu00HiqoHEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(366004)(136003)(396003)(41300700001)(6666004)(6506007)(2906002)(2616005)(26005)(6512007)(82960400001)(86362001)(83380400001)(66476007)(8936002)(4326008)(966005)(66556008)(66946007)(6486002)(186003)(8676002)(38100700002)(5660300002)(54906003)(6916009)(36756003)(478600001)(44832011)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6UpbGqZ9w2sLL35n8Whvh4Qt3C2sE0VRJGEdDDV0ODzLd4AEm2z7AhJsQ4hN?=
 =?us-ascii?Q?C7+GjJyRHbunPJIgaJiS5QZzoZgCroGgW+LYZiipelp6q52g2hTC5TkXXHRq?=
 =?us-ascii?Q?xB6/ZpCs+6fxRMpus3mI/9BhKt0gcCpn73Ky81BAXxMJCQh+FZXh2Y2V+DT/?=
 =?us-ascii?Q?ZcrJ1t4Ac/apbNTUahitGiaSfZ7uIsXauuuvPy0HPOfYzw11ZozPCVVDo7Sm?=
 =?us-ascii?Q?qk+yC/Uhu3CpYSBx5J+3gGOEneYnf9qRf+FnfPnVz6EOMMWjj52BleEkDPaW?=
 =?us-ascii?Q?fQnV7FbYn8crXgWm/M1stv0clnbg8FC4rErn4hAJjZQVov9iZPfhiSBBhCy3?=
 =?us-ascii?Q?CcZf/uw/rSILHZBfDe0sOVESbMh+MuhCniLBGdw6GHbCYC1QZL7z+GFk3yke?=
 =?us-ascii?Q?7DlGzTE8NkG9IgCal40gQhGgl1MrOjuaHh3UBP2AnkIo5U+oLU07iphtpRVL?=
 =?us-ascii?Q?+DeLU3zdTu7yy0i4WJ9zeZzU4f3qxgxhmSYzKg+XQYqSCYQ7uXDA0XQ1MQYQ?=
 =?us-ascii?Q?phTMna6nsBgVOiK6t4Bucxm305ZjvWA7p20deDMnUi7UaXC2CPiSkVa6lvom?=
 =?us-ascii?Q?+dpBz+D1080tW/TBkmHJXXmqvdLKtFskLpoGRlueBDU/Zs4wu/bUNlGwMB2N?=
 =?us-ascii?Q?yqcqkokMyWLerZt7xj+ntMWFMdi6kEETO3e9x7k/uQYzqOxmkgi9KxdBgjxU?=
 =?us-ascii?Q?UTFAjMmB+zYcJ0kjLpQtLmr8eLiD4vFESMRitstrXvxLGCTLjyRpPD8/UjfA?=
 =?us-ascii?Q?VGLTBT10dZbQNUIpylwbbb30dC5m2s2wOOm5yrUejAUsqJx2YNisjPE20nMl?=
 =?us-ascii?Q?jgdbrzDuU1oaZHzcpzDvjnh9aYOqC3NNIUcQiadz1NNyTE6yy5TLLy+7lsq3?=
 =?us-ascii?Q?+JKDTObUqgA7a8YHv3rqy4ohI2PlvmqEUQB8kB0aoyF08ZP3l62qMmwdSy9S?=
 =?us-ascii?Q?/pBNsIpa2zp/m9SA8MS6IzllgQWbvF5XdU+ERIzYz8jFVfrIDWExoL4EKUqS?=
 =?us-ascii?Q?h+f8yvaO2ozDL9L/pD/LDE1LuuVMT95zMNs6VjJFZKG3Xju1q6/YYjpP4Ml/?=
 =?us-ascii?Q?GbLfKvqFKQ4Pyz/u85izh/ymapu+z6bPRWsnHkMM/PoxFxPCaXJGzxT4adkd?=
 =?us-ascii?Q?Ia/vOdqDkw+LHbM9D6/kGjkvRfqsU9WQIyEVxU6FkvO4j+kQguf9WZqIBut4?=
 =?us-ascii?Q?//i2dniJMVNNBQXefbA2uQG1Wi2whrUJaVY6+r1K4vZzOKOVincnCG8+xfuv?=
 =?us-ascii?Q?Hby83J0i4qTrH09OphjTPfX47iA0CK8kSDtjpb431cNGYyALLVM4kbejIgFG?=
 =?us-ascii?Q?fLGDcS3K5EelZD9fTk3mj6DnY/ou9LuasnwSfeOYapD3NEkRSFAITvD8Fem2?=
 =?us-ascii?Q?f1IywJSS6K0H7bkDdg26aL7uj6GACuKEmLP7gb7HD8fAh9g+2Wfi7Bvt7Nuk?=
 =?us-ascii?Q?jNlVFW+eWucaOg9MZRTkXThm9L0nZrowgE3iHY9wz0jR5LQzTK0LsE65nofX?=
 =?us-ascii?Q?J3lqPh8NwJ7lE5w2DxA3hR386zrPLc71hO0r1zd5dmL9Idj/sgNvQTx7wYFz?=
 =?us-ascii?Q?WWsf/kQX+WBiwv5jMhSHqlG73xRzQj2kyGdSvkKQJxdj94hfOLU0RatSOffB?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c3c8fe-3196-4364-f2cd-08da79ef9fee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:12:11.6084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRrpRxiJ2WU4ZJ/jmtZLWaFZFiyXYN6pN9uEj6UgZ2cOcuZTOzLum6jVkZ14/x7CxpptNGDUL35OHY2h6oOJNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4052
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:12:26AM +0100, Mauro Carvalho Chehab wrote:
> The intel_gt_pm.h file contains some convenient macros to be used
> in GT code in order to get/put runtime PM references and for
> checking them.
> 
> Add descriptions based on the ones at intel_wakeref.h and
> intel_runtime_pm.c.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  Documentation/gpu/i915.rst            |  2 +
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h | 62 +++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 6bb50edc6d79..9862d504df4d 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -709,6 +709,8 @@ Table Manager (TTM)
>  
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>  
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_pm.h

I don't believe this is the right placement for this.

the rest lgtm

> +
>  Graphics Execution Manager (GEM)
>  --------------------------------
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index bc898df7a48c..a8ea6846980a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -11,21 +11,57 @@
>  #include "intel_gt_types.h"
>  #include "intel_wakeref.h"
>  
> +/**
> + * intel_gt_pm_is_awake: Query whether the runtime PM is awake held
> + *
> + * @gt: pointer to the graphics engine
> + *
> + * Returns: true if a runtime pm reference is currently held and the GT is
> + * awake.
> + */
>  static inline bool intel_gt_pm_is_awake(const struct intel_gt *gt)
>  {
>  	return intel_wakeref_is_active(&gt->wakeref);
>  }
>  
> +/**
> + * intel_gt_pm_get: grab a runtime PM reference ensuring that GT is powered up
> + * @gt: pointer to the graphics engine
> + *
> + * Any runtime pm reference obtained by this function must have a symmetric
> + * call to intel_gt_pm_put() to release the reference again.
> + *
> + * Note that this is allowed to fail, in which case the runtime-pm wakeref
> + * will be released and the acquisition unwound.
> + */
>  static inline void intel_gt_pm_get(struct intel_gt *gt)
>  {
>  	intel_wakeref_get(&gt->wakeref);
>  }
>  
> +/**
> + * __intel_gt_pm_get: Acquire the runtime PM reference again
> + * @gt: pointer to the graphics engine which contains the wakeref
> + *
> + * Increment the PM reference counter, only valid if it is already held by
> + * the caller.
> + *
> + * See intel_gt_pm_get().
> + */
>  static inline void __intel_gt_pm_get(struct intel_gt *gt)
>  {
>  	__intel_wakeref_get(&gt->wakeref);
>  }
>  
> +/**
> + * intel_gt_pm_get_if_awake: Acquire the runtime PM reference if active
> + * @gt: pointer to the graphics engine which contains the PM reference
> + *
> + * Acquire a hold on the PM reference, but only if the GT is already
> + * active.
> + *
> + * Returns: true if the wakeref was acquired, false otherwise.
> + */
>  static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
>  {
>  	return intel_wakeref_get_if_active(&gt->wakeref);
> @@ -36,6 +72,14 @@ static inline void intel_gt_pm_might_get(struct intel_gt *gt)
>  	intel_wakeref_might_get(&gt->wakeref);
>  }
>  
> +/**
> + * intel_gt_pm_put: Release the runtime PM reference
> + * @gt: pointer to the graphics engine which contains the PM reference
> + *
> + * Release our hold on the runtime PM for GT.
> + *
> + * It might power down the GT right away if this is the last reference.
> + */
>  static inline void intel_gt_pm_put(struct intel_gt *gt)
>  {
>  	intel_wakeref_put(&gt->wakeref);
> @@ -51,10 +95,28 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
>  	intel_wakeref_might_put(&gt->wakeref);
>  }
>  
> +/**
> + * with_intel_gt_pm - get a GT reference ensuring that GT is powered up,
> + *	run some code and then put the reference away.
> + *
> + * @gt: pointer to the gt
> + * @tmp: pointer to a temporary wakeref.
> + */
>  #define with_intel_gt_pm(gt, tmp) \
>  	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>  	     intel_gt_pm_put(gt), tmp = 0)
>  
> +/**
> + * intel_gt_pm_wait_for_idle: Wait until the runtime PM reference is idle
> + * @gt: pointer to the graphics engine which contains the PM reference
> + *
> + * Wait for the earlier asynchronous release of the runtime PM reference. Note
> + * this will wait for any third party as well, so make sure you only wait
> + * when you have control over the GT runtime PM and trust no one else is
> + * acquiring it.
> + *
> + * Return: 0 on success, error code if killed.
> + */
>  static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>  {
>  	return intel_wakeref_wait_for_idle(&gt->wakeref);
> -- 
> 2.36.1
> 
