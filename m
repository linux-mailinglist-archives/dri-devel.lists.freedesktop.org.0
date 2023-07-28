Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDE76607D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 02:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C5A10E04E;
	Fri, 28 Jul 2023 00:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEABE10E04E;
 Fri, 28 Jul 2023 00:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690502856; x=1722038856;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ispCRwktAk5lI9lybAJdb8/7SePHVoR7WV2OfkLZDCo=;
 b=D024arVbzlQOA3v+8vvA/AcQYuTGAcdK9ZqDqFAY4BUuFBpIZSsPFuU+
 dP0DHr+/daZNW79Tsdeg8rxEzALQeNFCIbKAOzNcFRiLg3etUzzIJrK3d
 puZnFFUAQpI0vo0ALrzkgpwmhU0ruY+KKqEz7TEvg9BkR/2Df4jQeA5fo
 iOk8fVrUMnPaZBZDWyNFgXpPSYsXnyYPBh5sJmKpNK2GDApC3DiEjVSlQ
 X+v4pIqNK8BQYeb2MytU11kxnjNgOD+AVahva/EM0h7Sl/p7eDJW1QZdi
 y/z0+d5H8EyIdTJRqT7u+0ojV7aNrAnKA5WUaJqYkDLg+APjIvwQ6J73M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371166140"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="371166140"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 17:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="850967122"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="850967122"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 27 Jul 2023 17:07:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 17:05:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 17:05:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 17:04:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igSPl20xqwJrV9/jG4IxlihcnVa3WcE1VI+PMFCnS/TPcl/kp7aDG29L79fn7z9mcdTlhKDzrae64uToCAQNtyJWc6lekdzMrgkRAvBuW8yRPQH2Ju6PWvFFp5gCwdH+JBBTk4L6Z1SnO8UykXuq70dQmTT5Nv5T9hTTwrfh1ZvIXOKFijn2dfWGIRLSmp6IhftPJswRPzL5XVf1g5UsmLb4/snPgXMjPnNUTwmt77Kq0GK4TpEJU6Nd/53Mp+FIhE90pVEFM/uOBJas/cA+/zOzc+CCvXWGdoGfL7MPYkOXI5KIzaJQ2RS947UIyZ0CvFjVQSsXwuOX3V3ZNRMQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITxs/8OURWpH9dQTO2PS0OSAEuT8e6IdB/97wFMOiek=;
 b=JAb9W4ep6d3mFpsSfCMmnmmDA9v6qBGYkSHu4BLai3A75T9HIn1BkT6jAqmYAXqqOdh9O2BliDmZ2qAblqAC9I2Qxli6fyIOFxumDmnl6CIsNgcsyxA4EsdseELtQGHBm8HK3neG3OspdJxZqlVxb0jD0P/t9sUDutjHmSUmxiHGb4KSAoWq38PpW8DxDHtqg+e+Yx4RoCJWZ4YoKzb8jl9rw3vR0CwH8tK8d7L3LbD9kfZVHKfhcx2OYCgixmQaIVQ5q9JYFb0FsK8q4uJbn+JNv48FCYfKpGvIcQiLSaN2JhnsTJDwvvL43ZWcSmGau5/VnJxl8QZe2GEHs/IaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 28 Jul
 2023 00:04:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:04:18 +0000
Date: Thu, 27 Jul 2023 17:04:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 5/8] drm/i915: Improve the vm_fault_gtt user PAT index
 restriction
Message-ID: <20230728000415.GE138014@mdroper-desk1.amr.corp.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
 <20230727145504.1919316-6-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727145504.1919316-6-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b253975-4d8d-4f8e-b212-08db8efe3041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qg4laW5WLbxkFfb0OUthfpWJuAtpkBspo2UhPxbIp9qtvMPytpvivkYqzy1Io4aWgNum1kbTRmnCBONEUn55xUOZ9YyHRUDzVXrjUEDxSrHbyC7OCH61zZKQIAuIr+RQNW5RvvUrxOPRyVhMBpWoq+QXtCNR0QdzujIIoohrTMIf/AVLh2X00JS4LmBUCcHIHEO1bRyYrPh2Wsy3pIC5vkUUzMJyCqfOaQxPoDAGwNder/zMKSMXjDHNzFvdxJtjoFLlZG9k2s9h8wMcFjGT56G5mTpSZzSZ/R8SXWpyxlUU/2qQQo6XWCGFzVGuZMWKzI6rv9QjANo0Kmq1wVss7SgnuCiVnn7BOMOlV73NGrDm15YOHfdQXhR52gkJG0Jh73Y3uahDrVa2hRDKDoCni7yAb1t0n4sonsgLT0p+pnXZhxJqHFW+C1v9U66wZhPFqjfdn+5rBq3hvPCGKFfXPW6ajXFaUA3dN9jnLHp30JDFStOYAE+bhV3NJ0S4LxDnukP/GVldrWAW5bfQC5qWr5pFFObXB708QGyfORXSGrchONV5Y7sGqzgD7JV5Kph
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(83380400001)(66946007)(66476007)(82960400001)(4326008)(66556008)(316002)(6916009)(2906002)(186003)(38100700002)(54906003)(6486002)(26005)(6506007)(6666004)(6512007)(1076003)(33656002)(86362001)(41300700001)(8936002)(478600001)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0Z4ee+lLdxz8ndZ1vSeHpZ6culoqm5EP4fMTq3tR/U56EAmRy9DiOCzZU+B?=
 =?us-ascii?Q?osCOYgahjhpkCwaj27OfTm7KcRb9NA4VYKwX6s5PAkjYEIC5ShLyKypsEyV4?=
 =?us-ascii?Q?7dYqDZVh4DpZBh60b14zsdWXBeRRgm0CpBy2Ile0isY2f5qO6Kdlof9RONco?=
 =?us-ascii?Q?tVQ5ax5zHYXAdwYAFCPi6DNGXV/kPvClQ/YZbcD72tYuEvMbwMX/S3FzWG+C?=
 =?us-ascii?Q?HyClmf8SBwlVjaU4/gl+1yBGR5OBSXcL9BUfSOmJbXF0RF2opKVk0P+ynmb0?=
 =?us-ascii?Q?S+kjzdcU5qJuO+g07Ppl7SI+fDbsTN8wKJcwQRxJ6xGTtPDyAU5Th/ocrFiB?=
 =?us-ascii?Q?TV9upOzw5nJSL9MJ+rd639myqCp5oFN7YCeWaXvZ9f0zNeczYIveaMrrEaon?=
 =?us-ascii?Q?6zdDKYYlGqwwyA0HsZrgz0PKO1F2Qo9MpibNymzJ13kD1FP/htDf2hhsGXUO?=
 =?us-ascii?Q?nPcQg1+l7PW4S3YdZviKy68r4nYSTB2dNjd0pEKrRJg5HUn8ruSZeK3ztCTv?=
 =?us-ascii?Q?1dZyfVg/IpoiNO2vJueGn8dX8zh6YrpQIaiMp/ojq3/ybgzzcZormqxbha/8?=
 =?us-ascii?Q?2bYkjGanYosn2f7uPqaX/CRhiC8lNIvRbS1r8a4B7ePV14WAUMLU2WzQmhDk?=
 =?us-ascii?Q?zErzSB27wQ4uPLRcAM1G8OmXlrtnnbYj9t/+DB66A6QjAFco6EK4nKewzGzO?=
 =?us-ascii?Q?eH52fPcjExO9Li8cglwetVcrXoNdsD+P7a1MDrxOGEcVZudTegnrBDzgP509?=
 =?us-ascii?Q?/rG0ZLbYM2raN7X3Ggeb6xpDApcl4IkwIiDlRYJPMLaEblsu/4Sl8Mu+cNmW?=
 =?us-ascii?Q?NHQfHQD420KSLYVJsvIGIc5+JyeUE1KaosWhhHhIiNKkBu0FI9SdD4crLGNy?=
 =?us-ascii?Q?4gJ+pUdYDhuoTV3SnuoKblNPpYroYZUwAOB0dOAVOCCvPHiKxyuI7nGOax7g?=
 =?us-ascii?Q?xa7xzHc5nXJKG7KGsAX0jNFUDg5AZnfzzNXcLlfrJVj6ggMZb9iRZq8LHe2H?=
 =?us-ascii?Q?8akJmoMi5yIQS/LyMT/ecr0JP/yMEX8+3uPldbPuTm/amQr1Atf/WXNuIyFr?=
 =?us-ascii?Q?9+gFoNrqlHzbr7nYF8h0v31YSoMrk0yzE7UWTULyPRFPuMgJ4IKPcWvYIocW?=
 =?us-ascii?Q?3eD3q2VaAlXxVXK/tWELFts93yfV7u3PAdbgMy9+ScvdfJmZVMzhh6N5ZitU?=
 =?us-ascii?Q?GF0MyfDtKqheP+uTXWB6n6iTJIOcqNO8svM8pZI4obPpxRg1rnyPg2A974lu?=
 =?us-ascii?Q?goDgfeLPLOWHKutPjypdVxE5UlOx9SRPVdey5zuo4RVHnPsZFIdDukR8pB9X?=
 =?us-ascii?Q?C2IVHEuw8Ahnr630PPZH7JjL8T6aII9Ia4A4jDNTdE1aKU9E2c4e9Ns0IRYQ?=
 =?us-ascii?Q?nFlZfg5GmdwPkWcI9dmefvR23WWkWaSS6dMqb/apLJ6ompO1TA8a1X6YW/pl?=
 =?us-ascii?Q?C0zHdfmrCtbQn4J0oTbX+J4yq68OlbX3CKPcGgfelpgIgUkEYV6wr/Tfs5mL?=
 =?us-ascii?Q?FiFoaWWLamrXzjhfygkQsiKosgXWTxCbwkSbzH1uq5rcVL8fCZPGkklprwGQ?=
 =?us-ascii?Q?5WnexFnsYv8ECmg95XE5IN10Y7dOMEZeRM14Ra+ci6emGQxTbAhVm+uhjncM?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b253975-4d8d-4f8e-b212-08db8efe3041
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 00:04:18.7409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXOxfFNSKb4m2jZpXylKKa1CMQrlrdPeRtw7IibyUwS5/n9eK2x6OoucuBDJeH6ZjNvxQlRbzRUpEI8VcVsBjFcAP98so+aoddRzn/hBkYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
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
Cc: Intel-gfx@lists.freedesktop.org, Fei Yang <fei.yang@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 03:55:01PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Now that i915 understands the caching modes behind PAT indices, we can
> refine the check in vm_fault_gtt() to not reject the uncached PAT if it
> was set by userspace on a snoopable platform.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index cd7f8ded0d6f..9aa6ecf68432 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -382,17 +382,9 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>  		goto err_reset;
>  	}
>  
> -	/*
> -	 * For objects created by userspace through GEM_CREATE with pat_index
> -	 * set by set_pat extension, coherency is managed by userspace, make
> -	 * sure we don't fail handling the vm fault by calling
> -	 * i915_gem_object_has_cache_level() which always return true for such
> -	 * objects. Otherwise this helper function would fall back to checking
> -	 * whether the object is un-cached.
> -	 */
> -	if (!((obj->pat_set_by_user ||
> -	       i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)) ||
> -	      HAS_LLC(i915))) {
> +	/* Access to snoopable pages through the GTT is incoherent. */

This comment was removed in the previous patch, but now it came back
here.  Should we have just left it be in the previous patch?

I'm not really clear on what it means either.  Are we using "GTT" as
shorthand to refer to the aperture here?


Matt

> +	if (!i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) &&
> +	    !HAS_LLC(i915)) {
>  		ret = -EFAULT;
>  		goto err_unpin;
>  	}
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
