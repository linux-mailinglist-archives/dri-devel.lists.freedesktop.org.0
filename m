Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB177A8A9A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3028C10E527;
	Wed, 20 Sep 2023 17:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2087E10E527;
 Wed, 20 Sep 2023 17:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695230903; x=1726766903;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QLfbJMzfEW923AVE/5cA3PClkh/kwTCMfn2afGMt3ys=;
 b=BOcVEzS6dPzIjPK0NvIpw++WKNVR/cuP+p01rS9nrppmCd/l8DY1vOFF
 019o9r2QHWHMLn4E94KZEqlQ8LLFaP4aZtY9+9wMUwmw7dsOoAbGsrlq4
 zm7q7jXVE2xJzJcH1WiQJAnXceSJvCL9cXRrg5v3q1oywvgR7i7ilKypU
 7BxIXjGymVaPYAAtVuFzn6ZodGmBQTBpja79orYfRfQBQNC81S/Am+sJK
 vIya3unjmixZT7Q7cwWE/YdodhdOaR9jpSON8OlvKMsLMldeiMQj8VQhe
 nUp1+0nSiomWdhv9Ct736d8ujmY4Sqv7OcbsDy7f4TpsHfQNImMy24EJb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="446762627"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="446762627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 10:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781799564"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="781799564"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 10:28:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 10:28:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 10:28:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 10:28:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 10:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjhcO+rcUaBZGkCuY6/2mUvtRdL6bo+Amn6TXvMvfQ2mfsAdOqHefWPEaRDL34NIrTjGOzXPktVTigaekfc451zxDV7SA/XKNubI/Es+Ht5HF4hDBWHlTZFXz/3aSCJWQF58Ly8B0gi1ZAOEd4Xm3QkISOpcaxk6Z7MPPgWK+KXKpLu1OLHvBprYElMDQrjtlHitYvpV1Cx0hJVI/uI6zfbKX5LW4r6Jy7Fhi1to9GGsQom2CFV5DPHcfJXTb7GK4CtBapeyWBz2PyRbKYqkvJFdnovUdBqW7Dg241EdSNIadF7VcQjP+0wED5B+ANYIRn6th56bjl/GpB+4+G/F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpG02xW8/GgSmqs6fE4Cglh8uTofWw6bTWZFcY2kX/I=;
 b=dip0g2iv789WfblLQVlbS68JHWX398/G8TVYYf0m4ir68hhIHnbIj7J3phatOobmxwgjaMcDaKdkE8MvxOQkwR1wOSp6AFdypdP9wkcx8S8SEaUvV8BQv4vfprii/x1tvH4uRQAhcVHnMHMaYhCSsUXlQJxOqcibzUR46mdIiEh2sZ5s9d4MvsIYDhixexExyAOb4qzFfnaSlm7WiiKL8ggla6IGF4x7tm9PtmyCGB+RDvJgZuPUdoWeDZkjUtS+uTghvf6BjtPtbTnty/UeqjCZUNfAuuzILhvgZZb7IJatM0+UDgG/y5fhz1V1yDBcU7olCeQDaVf758FSrYqUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 17:28:17 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 20 Sep 2023
 17:28:16 +0000
Date: Wed, 20 Sep 2023 10:28:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Remove unnecessary memory quiescing for aux
 inval
Message-ID: <20230920172813.GQ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230920111131.2696-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920111131.2696-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: f512ddac-e85a-4096-9b2f-08dbb9fef98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TVd1HJ58G9fGDNI2X9ao4IJjuc1/LMReqBxfMfVRchXwIdTNGXeD3mMb3mfw6w/+5AzfHfJhJ3vudhmOi1Hl5SWObYCpr0qSLjnUDkA8RstqaS0TYSBCqbXhId6+DDN8BLosDOqqdOc1JCUHtgVRRPATLYuAtMWeDix30KStKwwar9eZ4Jf0GVQdh7n3rNJvhK44RCS/vERmUP1/1aaqOCZp8K+RzNrgt3AvA12LEhKYabJYNBoLYQN14RPPeaBMa7t55SfY1ZmkxEoDzRU89KOESMDcXcamqAdbQJ/rOFZAdf5+FOIlCDDM1FMuwutyQ+8I/1BKjhw/ja532g71eDAQ+L6dHKnUHiznbjWIVJi84fOlU7MN/EMp4CVv+8ITkYB2H/TyTYrKmmrvh5Th5dBfePehdR33V41TgWbUkX+TL7m4rkqY6wVLLVMnSmerGdhu05geF/evABOEBZm07e9M9AnxBju/whQgu5bv3WpLyJ8vXKfLgNAF7FcssR+Hn29F0vB7TbKvo9ABKJGw+6grg/bpwyI0Q/+cZ/pUjEaD9kSAe7xROHQ6W2bGksOd+moYsjGf/xXxMqsy0FR/u4xGY23GwjSGfzrQ0EV8mwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(38100700002)(82960400001)(33656002)(86362001)(478600001)(54906003)(6636002)(66556008)(66476007)(6666004)(66946007)(2906002)(316002)(6512007)(6506007)(8676002)(6486002)(5660300002)(8936002)(4326008)(6862004)(41300700001)(1076003)(66574015)(26005)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iqKIitoZzkGK6QOVKK2Scb48SizcBFQ4T7lxQ57ndfpS5lhgh1e196ekOS?=
 =?iso-8859-1?Q?O7vHeP0Hb53ew1L6dF+ZmByRc5+t449s0dcIYoI9ncr2Ghg5Z7pmz9PEgi?=
 =?iso-8859-1?Q?PzbT6jnGX78q4Qi4WIrPmQrkx95vD1Qfl5LdehU084lkIOyekOgMyF88Zc?=
 =?iso-8859-1?Q?eeldmnIMfuZ1fhXd1pXSSXQ5oFonfaUoCAoiH2rFrksFuxBAl0PwLmz30o?=
 =?iso-8859-1?Q?li72NjYcJiVZjfOzp7nG6oGtHN1zwzjdZUJsygVGVzkTG4xSC6KZU4uPeL?=
 =?iso-8859-1?Q?9Hch1pctJtce8mYrHIeKk2OlUb1OxJI4/D2Q4CkXSkVLrjhJEgJvssPpOS?=
 =?iso-8859-1?Q?6ueHCSYzhhMqVpad23FRJ3KFMfKUTlYQLePuufoLzDpZCbTj3z7H5wT5gu?=
 =?iso-8859-1?Q?3FgpDT7Ve1joXcCEjRObZt1uFtmtELIyZfilUKHEbC057r5Qhrt7EqxTjn?=
 =?iso-8859-1?Q?4YNDvhub94+OIIS0LpjpHZCqT6sUt9lfxU73a0b9X3jJV/+UAkgmkMG3+y?=
 =?iso-8859-1?Q?4bohzkOWifRBSjos9RWZqQoiGhKLjTItxf/+9e3Qr+clPKHZdITYPuE7Tz?=
 =?iso-8859-1?Q?uyhGQgp79srNsNWeKVdxa3Z7oW+QiT7TnqTeVKCCRJVirBuh1p2i4NUTRX?=
 =?iso-8859-1?Q?WHwdxP5tvpC6cY2vjMkVMD9NLAmU+nVMwHDVtsFPGTcUvd6L/Dej5PVBUl?=
 =?iso-8859-1?Q?qt8NREO21XcGNZAQJlkZIksxoy+OX2fupRSNtslJ5H7aWMgVOnNaG/Q+6I?=
 =?iso-8859-1?Q?zhrR9XkUPSRxKzHbnj+aAF2LAuXVHfHQQdpKDYMryvmCdqVq1pSSM9n+Bs?=
 =?iso-8859-1?Q?1OVth8UjpJTtiTcx+mzmJ8UUxtjuAatlY4ISCQFKuT8mpk6FGOARnOvgY0?=
 =?iso-8859-1?Q?U7medXqyOU/gHMTh6E/3kOMUZj55DD257EEmgDp91t8WQ4iNR2erl9ZoAa?=
 =?iso-8859-1?Q?sBrfpIWjAtwiSzKKEovnc67qgnuszvIoqOoO+g4kRf3KJAN76qtiO9xLd+?=
 =?iso-8859-1?Q?FsaTfuaOdg6CN7g2xPPbpA/WuVaVbeBfCvIXxpGwZAAMQTi2xYXiIrX4WS?=
 =?iso-8859-1?Q?gUSnoMgzLZbGXyv3aHTVMgPVMqfbHAeIl8g9blBffjwPkcrmZkTWRMeNd7?=
 =?iso-8859-1?Q?7pfoBtNdS1/jhdliSbIaScznUjfflMtPc8P6CAn+U/1tB9HuMX2sb0dVSR?=
 =?iso-8859-1?Q?eYJ+XERllbS94KZxhA5nqkt2I0N7HJyvFkZfqXvGK8Ge+PJ2M8BNd2GOgq?=
 =?iso-8859-1?Q?QY+ZN51zKP/4gT9XdsV7qYQ0UlVWN0AWdQj26/KhtiN5J3ILltHnizLW4d?=
 =?iso-8859-1?Q?DnrVZhvZtIVs0TqnNyn5uZejf6TTsOvA0bfQVsrcdaW8ci0XX82tHQnWMc?=
 =?iso-8859-1?Q?kAUeEbGbaKeQ5vJWWzNYi692Brzzj8iZpq9Qa+d8RnsM4n+H6fOtN4J4fW?=
 =?iso-8859-1?Q?42r4D2jTdcS2+iRp9U96DommUjHkuD2AkbfoD2rGLO0ZjwRRWDx3guRUU+?=
 =?iso-8859-1?Q?pM/Jj049GJVomiTvNLldRZdH10fYFYs7yf5P0weQZXRLILZhmiVfyv2rdc?=
 =?iso-8859-1?Q?e5gfsV4wPpTx3FYQv7FvHoOohvAi4YoDsZ6rlm/QDnqhk45oML/OyQXpcU?=
 =?iso-8859-1?Q?lrORJ7datNASmiFhFWHnSaXAVwvFamA5f2e4Iu90Rw4Bahr7lxi1pcyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f512ddac-e85a-4096-9b2f-08dbb9fef98c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 17:28:16.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6k1Kb1WeCvcJhC1Hw4V5cUwPRQ1oil9Jf7C7Gk3uNcgw9hY1fooC4f9xa3UFfYoXjisoWO82tUW9gjij2s9ka0TKAL1H9L7fZG7HeObRbLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 01:11:31PM +0200, Nirmoy Das wrote:
> i915 already does memory quiesce before signaling
> breadcrumb so remove extra memory quiescing for aux
> invalidation which can cause unnecessary side effects.

This explanation seems confusing to me.  If we've already performed the
necessary flushing and quiesced all cache<->memory traffic, then
performing another flush should just be a noop, right?  If we're seeing
side effects, then doesn't that imply that there was still something in
the cache that hadn't made its way to memory yet?

Is the breadcrumb code flushing all the necessary bits?  What about
PIPE_CONTROL_CCS_FLUSH?


Matt

> 
> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Tapani Pälli <tapani.palli@intel.com>
> Cc: Mark Janes <mark.janes@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 50 ++++++++++++------------
>  1 file changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 0143445dba83..5001670046a0 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -248,11 +248,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  {
>  	struct intel_engine_cs *engine = rq->engine;
>  
> -	/*
> -	 * On Aux CCS platforms the invalidation of the Aux
> -	 * table requires quiescing memory traffic beforehand
> -	 */
> -	if (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
> +	if (mode & EMIT_FLUSH) {
>  		u32 bit_group_0 = 0;
>  		u32 bit_group_1 = 0;
>  		int err;
> @@ -264,13 +260,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  
> -		/*
> -		 * When required, in MTL and beyond platforms we
> -		 * need to set the CCS_FLUSH bit in the pipe control
> -		 */
> -		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> -			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> -
>  		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>  		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>  		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> @@ -800,14 +789,15 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>  {
>  	struct drm_i915_private *i915 = rq->i915;
>  	struct intel_gt *gt = rq->engine->gt;
> -	u32 flags = (PIPE_CONTROL_CS_STALL |
> -		     PIPE_CONTROL_TLB_INVALIDATE |
> -		     PIPE_CONTROL_TILE_CACHE_FLUSH |
> -		     PIPE_CONTROL_FLUSH_L3 |
> -		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> -		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
> -		     PIPE_CONTROL_DC_FLUSH_ENABLE |
> -		     PIPE_CONTROL_FLUSH_ENABLE);
> +	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +	u32 bit_group_1 = (PIPE_CONTROL_CS_STALL |
> +			   PIPE_CONTROL_TLB_INVALIDATE |
> +			   PIPE_CONTROL_TILE_CACHE_FLUSH |
> +			   PIPE_CONTROL_FLUSH_L3 |
> +			   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> +			   PIPE_CONTROL_DEPTH_CACHE_FLUSH |
> +			   PIPE_CONTROL_DC_FLUSH_ENABLE |
> +			   PIPE_CONTROL_FLUSH_ENABLE);
>  
>  	/* Wa_14016712196 */
>  	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
> @@ -817,14 +807,26 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>  
>  	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
>  		/* Wa_1409600907 */
> -		flags |= PIPE_CONTROL_DEPTH_STALL;
> +		bit_group_1 |= PIPE_CONTROL_DEPTH_STALL;
>  
>  	if (!HAS_3D_PIPELINE(rq->i915))
> -		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +		bit_group_1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>  	else if (rq->engine->class == COMPUTE_CLASS)
> -		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +		bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +
> +	/*
> +	 * On Aux CCS platforms the invalidation of the Aux
> +	 * table requires quiescing memory traffic beforehand.
> +	 * gen12_emit_fini_breadcrumb_rcs() does this for us as
> +	 * all memory traffic has to be completed before we signal
> +	 * the breadcrumb. In MTL and beyond platforms, we need to also
> +	 * add CCS_FLUSH bit in the pipe control for that purpose.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +		bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
>  
> -	cs = gen12_emit_pipe_control(cs, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0);
> +	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1, 0);
>  
>  	/*XXX: Look at gen8_emit_fini_breadcrumb_rcs */
>  	cs = gen12_emit_ggtt_write_rcs(cs,
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
