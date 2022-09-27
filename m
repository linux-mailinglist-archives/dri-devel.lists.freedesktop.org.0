Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A964A5ED032
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 00:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348E810E162;
	Tue, 27 Sep 2022 22:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDD210E162;
 Tue, 27 Sep 2022 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664317332; x=1695853332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4FibX7YQa6F67bC8e/+rBoIR73jGLikoK/ajO8qQToY=;
 b=AHJLzN95CERbUpf4Dk92bNcMFOsLOplhEHNUq3QgL5NNBsIszMgkcEYx
 A0ftFr4xLQeWTp3wwfz1z/fjwQRHMmDSKdiZkFmiqaWsvozEeHRdlfGsx
 Rcch3f8kfkwS0S0lIunpZdyUV80dBOfC2seVFiJnpOJE7hAWu7zcC7rB8
 8+dVCp0iVAv25EEykA3Bi+02zT+SIN0D1/OUs523MvltJQ4I8od4FHtTM
 znELqje1GsxA/8xj4jGgSL4IPXtmeN4o6Ov1Fop9C6iZ/WVfDcR5pLHE3
 7/PirRGYnmh4nQGcTJb9zfayN2n6HSXJ9zf/VUcn+rQrFfznTl4McMX4o A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="284574244"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="284574244"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 15:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="616987877"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="616987877"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 27 Sep 2022 15:22:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:22:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:22:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 15:22:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 15:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLFWKYVcgPuRQ0hlZry1FgYaxVBjbaCtOc2vkahlF2EJjDae12HRytPuGT9UJh5bHiwWdLanuBgXGRHhJcJaYOfCGHJAOtzJg5Eey27ZCm+2sC64wqssiHM++K9zzaxSWPyNRP7VhakuoATHwro0Nvl1TJ8H8zkvoQfNKJuey+zy3qpzG7fwo3sqXATa3BcMnoTNqU774ys1e0GdvJmD+g0WLyrG4xrb/7aaElrIUX+EhkNw2ApQy+9mnHmXts0sbYuh1fSgk4z+I1gWlICdnYPP1Wrqy90Y4QeqX/w66tuBtzCGNFd1j67dRxAHYX363srOUa+ZvGu+nMbWBDZ6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4Pd4CuyErEek8+MOGHpd38statwdo474As4ljCuV1Y=;
 b=KwjSOqlG98e+W0Cgrt0eySVE350KX8otec29kLM8dHIMNxMU6mZ16uObyRWi0qkgDthNKITcR7NfUSL6sI+bmorbg21eIYYdwKaA8US0kcyIaLE6dzlR+qjXEW9eI0UWTF6bKLXrT1rHZ+XAS0jWyKFZ5ydn1/Rgx+fMCGy4WiMeF+eAskvrbgpZ9nJZ62ko1pTI2+gE3YG24IuB0sNm8yPVKS0zR8S7Dg3tm1D9YxdFPictDnxxaXlwEhien9dTUVcaxLS9V5t+S6FnWT+nQRi+YsU73VOmdVMMqt7EdtaBIDTMxVLAUOhZz7Jt4pOJO3RfBYBArLqx2y6yVoOuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 22:22:06 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 22:22:05 +0000
Date: Tue, 27 Sep 2022 15:22:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH v3] drm/i915/mtl: enable local stolen memory
Message-ID: <YzN3injZnHyO8NMV@mdroper-desk1.amr.corp.intel.com>
References: <20220926184424.23772-1-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220926184424.23772-1-aravind.iddamsetty@intel.com>
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MN2PR11MB4534:EE_
X-MS-Office365-Filtering-Correlation-Id: c87024e3-7b68-46bb-57cc-08daa0d6b51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdGo/R9f20sChqrmmUQTUb1Xfm50sG6qcrhCfdK7j6crcYJ4CDlpOcmX1B9P6JbUMqOZEIZdFd+iaXAIUE+eSy2VqOfazoA7dXf53angrixu8Gr8OqTdI+smSFCDzuSuSxvEXW7gwqKMYoeq5j08gYep3D73j/rJ2dRurAbHuhu3NW6R2Q+4VbJ7m8gmELTEJLV+mYz5IkSBGeyhdcY40+lklVRoNl6d+sF8P+uMvrEHeTY/SxM7gaWIyDeKjWracIC5hFgDomMoFi2aFRjIuIvT3wQwevTDFmLxbUw+9PqZDlz45qLv1EMS1f/9IuDvJ5kOy3XBml6FviAg5I5/Cmwyyx2HhL+nu7hjUddFE908xzbo8Q9hfnzwlDA2H+5aqOWcDNJOBEkvZE6zFq3MwIYF/YBuGkUhnANHYRgmjjVYMbrfXd+hk/g5XPy83b8kJZPn3p1DV88TK9MM6GSAvgkOF+tshwEWs+nO6wWM3H+0CFuAZBWG/rPvTQtyhvbFb3vRAn0Tgkg40zMpZ+rRPBZg8dLUcGYtE644BonIxoyekwv3b2Ct6p8LbIwqLBXUk7g3mwie8sGWsn4rf48x8+GBBkCGJ0aMTxQV7NCR2tFydXX+88KOHUiljHdJbwj5uU/U+CrLSQgGQrdUTHiPwWYpESR9hwmo1ftLUnjf03Acge4tEIRL9wPnlr08eZWEdYUxuJdkx6ml4qq7Nurrfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(66476007)(66946007)(66556008)(6486002)(316002)(478600001)(6636002)(5660300002)(26005)(6862004)(8936002)(41300700001)(6512007)(186003)(2906002)(83380400001)(6666004)(4326008)(8676002)(6506007)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFGb8JjLHRxDT6VBUasbdGRDrzjgHz8NidCxupiTz7WL45xB5hy3F5yrcpqo?=
 =?us-ascii?Q?BcRXB+6OUKA+F9bWOwPowEMm/CvpRygeuznenRAGYxDv8fqr5Hgl0CVhbMhw?=
 =?us-ascii?Q?b1EwavXydKRjGcekxO9bsHMqw/bznNw7uYtF0pCHv7JMwwQ2DkSka3Z6Fhwn?=
 =?us-ascii?Q?GJ3ZPO8H6P1F5n7nSDMLRywImy6GEmcX6QBbsZ9CogN22ZclVv1E+s5o10Ty?=
 =?us-ascii?Q?2Cs5fZ0YLHNb3eEwXiNq8o0tJlsVN8CaTzVB02G7UCc4ZLrsSxbzzPur0HUF?=
 =?us-ascii?Q?ifyh9aLDvnZIoGYORrS7BsMTnwVhoDydvQ0L6DR6zGF3kGcnqZC1OVrgtmCp?=
 =?us-ascii?Q?q+MjakU2UjAXFkQn7pikh8k5MWbOyrtIuad5E9OxE9FH6dvdruroa+4Lo2GT?=
 =?us-ascii?Q?RVJrD1BoJ54Lr+9E71LReBn2XDNfFbJuiGCDqRtOrSptVQWGXHXB3biOoeiZ?=
 =?us-ascii?Q?FRxP6Q+fMQX3qAoEIdWdeeksZpAnvgHDYU+jd7tO0fmGjqQYMTSLmjmXrop4?=
 =?us-ascii?Q?lzLg1dhfkBhxJiM2EglEek6aw35CHH2rueE2308gNFG/yBbeDtAE/CxGy2kL?=
 =?us-ascii?Q?E+gxtRxvnXMxn5YGqrN+W7YvtoCkhqp1/tW086Yt+M3+dPb/hHsLBkQmdNRi?=
 =?us-ascii?Q?k55RFC7d/QL1Sbz7jpMq1TQh3rddWiAfRn6dGLAuNq5S8AvyD9vz8rRr3SsJ?=
 =?us-ascii?Q?t+mIKpg0qA6lgt2A+bcaSzKVwwWGIw3WrCV9yOByAL3vnQUsHXga+TaEUbAu?=
 =?us-ascii?Q?lbU7c4y6U+1fbQ58ul1OYOM7WilEh8DK6AaD8HcKnX0IwFbHtI1WMutUTmg/?=
 =?us-ascii?Q?gLutE8VADhdMLnZ4X5tw8Sk9CBkYpaTDL7RUDp3k9iCEwXAKZEigXoAGvsnC?=
 =?us-ascii?Q?I84s0HbXEM2dHo5VSJXDwm23xhhkgts3bLM3+/glXOCyihZwDEoSJh+DLTlt?=
 =?us-ascii?Q?YNyHbQccMncs/r6HQ/PZsQ17CDenRmdyN1MTACMGxOEnJtmBNFmc8BeemJJe?=
 =?us-ascii?Q?A0WOeIPKMVRoaKU+m+PqWPn0KZ03dUyDWCpFK+IItOwxWZJjdSqxMC3q5wic?=
 =?us-ascii?Q?KIltbP5/Bhzgvq43XhjtlK9igAnsfhupw5XsqVdHbl1GruRm7QmJ133ledkV?=
 =?us-ascii?Q?qR+wN470HaZDbYYhtJ5bfkzYZz7f7XVrmv74cn8YhUua22JLRidUHiz/+UKw?=
 =?us-ascii?Q?ueh5mXigEDY1HrriQ2wH0wKF90t5Sz/A4BTZFF3xIzyUcHWvV4GIWwJX8myw?=
 =?us-ascii?Q?szRNszfzx4EZ3V9xCNalzcYaJoTRjGbICNZ87KQ00/2xtRhQjKgbn89TmgL+?=
 =?us-ascii?Q?HW383++W/iNzxLBUkiswGp7I8i95kDJDv96/cNfArhu69TsEtECOljguLlHJ?=
 =?us-ascii?Q?cY2C6WeLxU7KIlZpwyaS4Hh+LP/vd/7AJD6hL8M+RgRgGhcGQpb5Zg44kGQ0?=
 =?us-ascii?Q?mFfB1BqfeoLhU9EgDVQx51DOY7xkR/dSmf7vW8510oy/0d8gw1jH0z9Jcp6z?=
 =?us-ascii?Q?w1NwJJk/ycjYNnKKd6s1rU3FlJO66iBlTT3gDvdG7uHyIs3WC00EcUYuIq4q?=
 =?us-ascii?Q?G14Vn3js+mytcLd5FrY4jFLYwqK/pMlC4Nbu81BJhp6RsVOX/WgCY9/ykYMu?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c87024e3-7b68-46bb-57cc-08daa0d6b51b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 22:22:05.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3n2pOGHLUEeA9MLxdH8fV/45O6qX5+oUyg8pn3yI4gURDNRi10IXfltKy3QXs5hXGkX5wjqfqdZfwJcZbpE/0IqN/To30a4Zb7yzoRkrJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
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
Cc: intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 12:14:24AM +0530, Aravind Iddamsetty wrote:
> As an integrated GPU, MTL does not have local memory and
> HAS_LMEM() returns false.  However the platform's stolen memory
> is presented via BAR2 (i.e., the BAR we traditionally consider
> to be the LMEM BAR) and should be managed by the driver the same
> way that local memory is on dgpu platforms (which includes
> setting the "lmem" bit on page table entries).  We use the term
> "local stolen memory" to refer to this model.
> 
> v2:
> 1. dropped is_dsm_invalid, updated valid_stolen_size check from Lucas
> (Jani, Lucas)
> 2. drop lmembar_is_igpu_stolen
> 3. revert to referring GFXMEM_BAR as GEN12_LMEM_BAR (Lucas)
> 
> v3:(Jani)
> 1. rename get_mtl_gms_size to mtl_get_gms_size
> 2. define register for MMIO address
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> 

Since this stuff is somewhat hard to find documentation on, you might
want to include a bspec page number or two here.

Bspec: 63830

seems like a useful one for reference at least.

> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Original-author: CQ Tang
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 88 ++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       |  2 +-
>  drivers/gpu/drm/i915/i915_drv.h            |  3 +
>  drivers/gpu/drm/i915/i915_reg.h            |  5 ++
>  4 files changed, 81 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index c5a4035c99cd..0eb66c55bbf3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -77,9 +77,9 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>  	mutex_unlock(&i915->mm.stolen_lock);
>  }
>  
> -static bool valid_stolen_size(struct resource *dsm)
> +static bool valid_stolen_size(struct drm_i915_private *i915, struct resource *dsm)
>  {
> -	return dsm->start != 0 && dsm->end > dsm->start;
> +	return (dsm->start != 0 || HAS_BAR2_SMEM_STOLEN(i915)) && dsm->end > dsm->start;
>  }
>  
>  static int adjust_stolen(struct drm_i915_private *i915,
> @@ -88,7 +88,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>  	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>  
>  	/*
> @@ -135,7 +135,7 @@ static int adjust_stolen(struct drm_i915_private *i915,
>  		}
>  	}
>  
> -	if (!valid_stolen_size(dsm))
> +	if (!valid_stolen_size(i915, dsm))
>  		return -EINVAL;
>  
>  	return 0;
> @@ -148,9 +148,10 @@ static int request_smem_stolen(struct drm_i915_private *i915,
>  
>  	/*
>  	 * With stolen lmem, we don't need to request system memory for the
> -	 * address range since it's local to the gpu.
> +	 * address range since it's local to the gpu and in some IGFX devices
> +	 * BAR2 is exposed as stolen

Minor nitpick:  this sentence is a bit hard to read/understand.  I'd
leave the original sentence as is and add a separate sentence explaining
the situation for igpu platforms with stolen memory exposed through
BAR2.

>  	 */
> -	if (HAS_LMEM(i915))
> +	if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>  		return 0;
>  
>  	/*
> @@ -385,8 +386,6 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  
>  	drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>  
> -	*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
> -
>  	switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>  	case GEN8_STOLEN_RESERVED_1M:
>  		*size = 1024 * 1024;
> @@ -404,6 +403,12 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>  		*size = 8 * 1024 * 1024;
>  		MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>  	}
> +
> +	if (HAS_BAR2_SMEM_STOLEN(i915))
> +		/* the base is initialized to stolen top so subtract size to get base */
> +		*base -= *size;
> +	else
> +		*base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>  }
>  
>  /*
> @@ -833,6 +838,34 @@ static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
>  	.init_object = _i915_gem_object_stolen_init,
>  };
>  
> +static int mtl_get_gms_size(struct intel_uncore *uncore)
> +{
> +	u16 ggc, gms;
> +
> +	ggc = intel_uncore_read16(uncore, GGC);
> +
> +	/* check GGMS, should be fixed 0x3 (8MB) */
> +	if ((ggc & GGMS_MASK) != GGMS_MASK)
> +		return -EIO;
> +
> +	/* return valid GMS value, -EIO if invalid */
> +	gms = (ggc & GMS_MASK) >> GMS_SHIFT;

It's better to write this as

        gms = REG_FIELD_GET(GMS_MASK, ggc);

You can also eliminate the definition of GMS_SHIFT with that.

> +	switch (gms) {
> +	case 0x0 ... 0x10:

Shouldn't this just be 0x0 ... 0x4?

> +		return gms * 32;
> +	case 0x20:
> +		return 1024;
> +	case 0x30:
> +		return 1536;
> +	case 0x40:
> +		return 2048;

I don't see 0x20, 0x30, or 0x40 listed as valid values in the bspec
anymore.


> +	case 0xf0 ... 0xfe:
> +		return (gms - 0xf0 + 1) * 4;
> +	default:

You might want to add a MISSING_CASE(gms) since this isn't supposed to
be able to happen, but if it does, we'd like to see which invalid value
we actually received.

> +		return -EIO;
> +	}
> +}
> +
>  struct intel_memory_region *
>  i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  			   u16 instance)
> @@ -843,6 +876,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	struct intel_memory_region *mem;
>  	resource_size_t io_start, io_size;
>  	resource_size_t min_page_size;
> +	int ret;
>  
>  	if (WARN_ON_ONCE(instance))
>  		return ERR_PTR(-ENODEV);
> @@ -850,12 +884,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>  		return ERR_PTR(-ENXIO);
>  
> -	/* Use DSM base address instead for stolen memory */
> -	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
> -	if (IS_DG1(uncore->i915)) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915) || IS_DG1(i915)) {
>  		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
> -		if (WARN_ON(lmem_size < dsm_base))
> -			return ERR_PTR(-ENODEV);
>  	} else {
>  		resource_size_t lmem_range;
>  
> @@ -864,13 +894,39 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>  		lmem_size *= SZ_1G;
>  	}
>  
> -	dsm_size = lmem_size - dsm_base;
> -	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
> +	if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		/*
> +		 * MTL dsm size is in GGC register, not the bar size.
> +		 * also MTL uses offset to DSMBASE in ptes, so i915
> +		 * uses dsm_base = 0 to setup stolen region.
> +		 */
> +		ret = mtl_get_gms_size(uncore);
> +		if (ret < 0) {
> +			drm_err(&i915->drm, "invalid MTL GGC register setting\n");
> +			return ERR_PTR(ret);
> +		}
> +
> +		dsm_base = 0;
> +		dsm_size = (resource_size_t)(ret * SZ_1M);
> +
> +		GEM_BUG_ON(pci_resource_len(pdev, GEN12_LMEM_BAR) != 256 * SZ_1M);

You could simplify to just SZ_256M here.  Also SZ_8M for some of the
other spots below.


Matt

> +		GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
> +	} else {
> +		/* Use DSM base address instead for stolen memory */
> +		dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +		if (WARN_ON(lmem_size < dsm_base))
> +			return ERR_PTR(-ENODEV);
> +		dsm_size = lmem_size - dsm_base;
> +	}
> +
> +	io_size = dsm_size;
> +	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < dsm_size) {
>  		io_start = 0;
>  		io_size = 0;
> +	} else if (HAS_BAR2_SMEM_STOLEN(i915)) {
> +		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + 8 * SZ_1M;
>  	} else {
>  		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
> -		io_size = dsm_size;
>  	}
>  
>  	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 30cf5c3369d9..b31fe0fb013f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>  	unsigned int size;
>  	u16 snb_gmch_ctl;
>  
> -	if (!HAS_LMEM(i915)) {
> +	if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>  		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>  			return -ENXIO;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d830d52ded5d..b33ba0d49bbd 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -975,6 +975,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  
>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>  
> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
> +				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +
>  /* intel_device_info.c */
>  static inline struct intel_device_info *
>  mkwrite_device_info(struct drm_i915_private *dev_priv)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 5003a5ffbc6a..3ace2d6b4961 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7967,6 +7967,11 @@ enum skl_power_gate {
>  							   _ICL_PIPE_DSS_CTL2_PB, \
>  							   _ICL_PIPE_DSS_CTL2_PC)
>  
> +#define GGC				_MMIO(0x108040)
> +#define   GMS_MASK			REG_GENMASK(15, 8)
> +#define   GMS_SHIFT			8
> +#define   GGMS_MASK			REG_GENMASK(7, 6)
> +
>  #define GEN12_GSMBASE			_MMIO(0x108100)
>  #define GEN12_DSMBASE			_MMIO(0x1080C0)
>  #define   GEN12_BDSM_MASK		REG_GENMASK64(63, 20)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
