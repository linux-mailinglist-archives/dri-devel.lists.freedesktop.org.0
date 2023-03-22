Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109B6C3EF7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 01:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2273B10E09C;
	Wed, 22 Mar 2023 00:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A646110E09C;
 Wed, 22 Mar 2023 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679443858; x=1710979858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CL+dX2D6QYncxkcLxf+cNCfx6OEvWcgdn9nQw+rbW14=;
 b=a5ziQKyovggQGZZ89JnER+o3BiV46h85EvHmMPnYErV7tJu5e+++6zwl
 AN/G2JFh9hdSfmL/X9rf9/ticHuju5/i4CyACFYTdquiG9+sj3w4r9zYV
 edSNPnR9pSve+2X/A+8lZ91iTEyS5U81t/Svop3Wz2y7ubDTJXXerAmMh
 tenmlDPhjSAaeChBg9pJzYCy/jYwkWT4kpRKoV/HVg86G67smn4q64B1P
 p5++mcNVi5xB/7ctsqtjw1fqeKDBHgJiKiJIj7qDihnvWYT4AcPtX3kP+
 EZaEFFbMIt1eor8x6yz3S3jgL/dNQcof2fKUCJedU1cOItZ9MdHCNPFW7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340625866"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="340625866"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 17:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="927631542"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="927631542"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 17:10:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 17:10:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 17:10:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 17:10:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 17:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2yR3tN0AzA9l+gtZ1OBG22N9A+H6ra4JIMM0ZS+RXWRPjw/vAl0TW2YFvPmhErRqF/ijhfXxbrQ7bXcv8n+zRqkcFoQz7Wv2Ek65MrzKH2wtCXG+i2lT6MAwjHyF1D+jrrXBqvfpuSIEgXupiQtFjfUo7U7aBRL2mO/Y/xDEJko4ntXZ0jqWR/B/L9dSKrIFo859GTr+nb9hCEfaZfQ84HVHyMc8AoZ+LZdKi9J9e7QrcK95f/EP4FSVhhUbzs5WSmgWzEvXyyiO7Rpb7sPEOROHkuB/+uVlRkAgWRw7IgM5iKb3ixoCfl91YHSSL7QT4IknTI5F7pw+DDDrzdRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDTk7tI62ZK8pwsjj7xWZ+wotwKCPJ311pnuPnEiBm8=;
 b=aEmGTzT5rDxqQikZ5PL6aTdYXu52lUYU3zcD/5bLNsduK8hPyoe3/lAMhgiSUsM2zcmoK/NRgDPjD579fek+7dJjkGVysiT7mge1GKm+yRmqg6kMFw6P8A0pPsVBPdHiTzLFfu7pMRT6cssCHh7+ZV1CoKHZotdA4vCyE1Cgl6+UtUKGm+yUC6kV25RDUoa2LKRwA0ry83h8Sq8fCqY4IMt0YkY7K6jeSpSkzxXXENOK/QrRwq/0GWLyQNNwTB7HZnCl3V3GyR6zSIWyS/et0fxpimKKa8efT3/q6LhK+3mGZKwUPXz0pIPiA9UtZbvgfQOrQ92cBbv0NSBk4xKIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 00:10:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 00:10:55 +0000
Date: Tue, 21 Mar 2023 17:10:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <20230322001051.GU4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230321232009.541585-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230321232009.541585-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb3bdf7-aec3-471d-767e-08db2a69e779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crx3rDSEecQvn7hE2QK1ZNdpRsAJkic9NxT0sERw29EZC53R6uM0npFuG+BMi/fgDilFoxTB9TKhmw6ESacN7AHsb+JUm+G4E/0NC5W/VZ4M11PlR+AqVK/ZE49yXpx1QbSiLE61XfzJTrIpkWhqKPB24d2uK7PkfUOWCCkyV1QA1K3t5e6ZGYgjrMwXiQTAy9awTNV8TKw7q73J02nB3C6AVUzD469i++gLU+xThkeYAg/SXh8o26wWdLz5TarasGoz2lG0Dl7cPjXPs2e2552YCF0608OUKYmYVu8eAM+TvQNqyV05Ypm+53B8Dk2OgELMu52uTeoEpYSGN+m6pEVegdOX7G8KiSFu6W4VNQNjA1EYCKEu6U3pfiK+JU468qDm2nZ38H+kd2xxAfhg/kTmb+dbnX3ggaqxd/qci1nl0951M54/XNcI5YKI06VQEBkijt1a+acIBUsgMzUFMVATIy/oEhaPRd2jrt+/rlE5h/aqDdSD1Qo4epsTBFx2Qg7t2bFD06YkFPC6Z9fX6rnet5PIV5+Z/sl9TP1uLGCCKXHCzj3K8qSP5kMEHSlrPTZ5HzYz8CMAO72FEgZ8fkrRFfC08bWVdKXrXTbJzh6UuQ87L2Vsr5NkcilUfqpb4uAEq8fToqvI8d0WmAWkzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199018)(83380400001)(6512007)(54906003)(316002)(1076003)(6506007)(26005)(33656002)(186003)(6666004)(478600001)(66556008)(6486002)(86362001)(38100700002)(66946007)(2906002)(5660300002)(4326008)(8936002)(6916009)(41300700001)(8676002)(82960400001)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Do/Es3MsOnNrFWt1HlWIuiH3LYG52Kc1QUGUTvbfh1IL5qC92xw8WMYmg3fm?=
 =?us-ascii?Q?KpMaVGvhs5gWpq0KVhCrS3GBGzgxqdd8W31TQF5K87ylUfKUdLbz9NoSQXV6?=
 =?us-ascii?Q?HQQiUYd8YNVanNHWBHguB2TfOTZGeCnWR8yn6Flk4DF12BEwyIALDbGYjU4W?=
 =?us-ascii?Q?7xmW0ie2QXmu+c16grW7Zk8Ay3MVUx25SEHJssJLh8OKwZ8xTCLaOJ9+3ogG?=
 =?us-ascii?Q?7/aUawj90obhqY41ymMhbh5T1XmCMXcFf5A7l15Uo0c1i6kgK9iasFwbsAHy?=
 =?us-ascii?Q?6lXI6HLndKVhJG4IC7WLHUvIgpmG/KGtfRjlWfm9PiZH3Fe2KIWxhfR4yxAY?=
 =?us-ascii?Q?kF2ikBXzQEL5VR8HQRU1ExqitgWe3pTf2V8Q+VBYb2lZ9OaNW10vXi4U9Uds?=
 =?us-ascii?Q?83CoQA1zVOudUiEE53Mk8gX5psKZheWxWfMiJ3rNnbtLwVGqELGnECV50oQM?=
 =?us-ascii?Q?QfRQn93lz1O778bPnWCnw8j/52p1lm+xF10UEM58W4ZI1KBN1ClYoCm7N3py?=
 =?us-ascii?Q?ikZvf9a3aoPgyVKXTLgISTgSG57ZBBfUj+mCvgkDbKTz0NbwVw60rYrGXU85?=
 =?us-ascii?Q?h7rejEkbBRsFNrsGQg3WwzJMBxehRgukP7urQuIvRZuD583o4l3woUlk+gLU?=
 =?us-ascii?Q?XregLb4qJQo7SopcLrbWedunyE2oTSBDLZ4EDl+z+0JArzAWnnG6iHJzRWB4?=
 =?us-ascii?Q?R3qhZ09nJu8CDmDg1kcnHi97zdZPtaLNnwIPl3bd6oMF49tCuhV4Uzke9OfA?=
 =?us-ascii?Q?G8RaT8vdUk1mWnBGM+kV8w1rG3i4OPf+PKUoeiYUVRyo90CyW68fQ5djH/OV?=
 =?us-ascii?Q?ptPJTsRXHNH1i9XUw6p3NiGNF15v4GTvLybAe1k8u+uAwgNcddxATVvcqZty?=
 =?us-ascii?Q?v6Y+FkDNtop3fGP3gKX9VGfL1OPBJZEeAqRFvra+zh5pO7tzeQbL7DtarLED?=
 =?us-ascii?Q?E5jBgnAdkABV8IUMf2z0fBGoRIJfs3DAetvvEgKQnG5xvmjKMKq9xzjqKcVa?=
 =?us-ascii?Q?48+7hbUgt6xambEXG6ZZaQl7RkDmHDFCMBrTPXmh9fcxzarE8VKonnnOBj6x?=
 =?us-ascii?Q?+S0gpeN+U2vbq+x182tk7BRuP7wnwrwJow94IAjlzF3lwMiBFOhvjYijHsvz?=
 =?us-ascii?Q?OKs9gF0UYPlk8RZARluUXJwuAnWeRhp0apZus17ZkyHy3e+3/KJ1sLbtHw4x?=
 =?us-ascii?Q?a1EqaB2cDqLGLTJL+mGB1Hi1S2KmDEAGMRo/7H1GIVEfyWviMs/qa9wIROly?=
 =?us-ascii?Q?UYNfFCKn3TvKGB8Us2RBVB1uAyLE2NTnb0ZUfS/vR3kNfcbAxP7h6atnBiJE?=
 =?us-ascii?Q?ve96FkR7suk2ZPRxn4V4whgBFaoIZDXqHfmaSA5W2cCds91eQGcjB5zn6TMu?=
 =?us-ascii?Q?ulYJ9ZHqFSTGPdCdIoa+YlD7jLa4xOKdbvaVQDwCsdNhq3uPpLKe5u1Brk5z?=
 =?us-ascii?Q?B40jxq8mOhI0CIqbhxVLunjen3K/vVn9rDZR42ItP/aAExFBInpcKbN69r+e?=
 =?us-ascii?Q?L0rIXZgUOOXpQ7qJ/nkUX9Z4VBa8zMnKZA/oyrw6yagFGvzGJaanOTuriNYq?=
 =?us-ascii?Q?JNraEbXVbwFden7MW1+lm9x28dOUsXwq9+3sLaI/YqKnQrONFgOsqnuR67xc?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb3bdf7-aec3-471d-767e-08db2a69e779
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 00:10:54.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmVkJpx9uA6GAwQnkRiDg+StxV1p8fGdyVf3XLA5l6M1qd58tF4aGhtEoNb8hedgmqhSrLSIXP7BffcJkkiX925p2nXRlqZghIUlGC+4A3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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
Cc: intel-gfx@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 12:20:09AM +0100, Andi Shyti wrote:
> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> 
> In multitile systems IRQ need to be reset and enabled per GT.

At the moment we're not enabling multi-tile support on any platforms
yet.  Xe_HP SDV has pretty much already served its purpose as an early
Xe_HP test platform, and most PVC effort is refocusing on the Xe KMD
right now.

Note that we don't want/need changes like this on non-tile multi-gt
platforms like MTL.  The interrupt registers you're accessing here are
sgunit registers so there's only ever a single copy of the register on
such platforms; looping around and processing the same register two
times in a row doesn't accomplish anything that just processing them a
single time doesn't.


Matt

> 
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 31271c30a8cf4..ee4530ec14de3 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2762,14 +2762,19 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_gt *gt = to_gt(dev_priv);
>  	struct intel_uncore *uncore = gt->uncore;
> +	unsigned int i;
>  
>  	dg1_master_intr_disable(dev_priv->uncore.regs);
>  
> -	gen11_gt_irq_reset(gt);
> -	gen11_display_irq_reset(dev_priv);
> +	for_each_gt(gt, dev_priv, i) {
> +		gen11_gt_irq_reset(gt);
>  
> -	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
> -	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
> +		uncore = gt->uncore;
> +		GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
> +		GEN3_IRQ_RESET(uncore, GEN8_PCU_);
> +	}
> +
> +	gen11_display_irq_reset(dev_priv);
>  }
>  
>  void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
> @@ -3423,13 +3428,16 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
>  
>  static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
>  {
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_uncore *uncore = gt->uncore;
>  	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
> +	struct intel_gt *gt;
> +	unsigned int i;
>  
> -	gen11_gt_irq_postinstall(gt);
> +	for_each_gt(gt, dev_priv, i) {
> +		gen11_gt_irq_postinstall(gt);
>  
> -	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
> +		GEN3_IRQ_INIT(gt->uncore, GEN11_GU_MISC_, ~gu_misc_masked,
> +			      gu_misc_masked);
> +	}
>  
>  	if (HAS_DISPLAY(dev_priv)) {
>  		icp_irq_postinstall(dev_priv);
> @@ -3438,8 +3446,8 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
>  				   GEN11_DISPLAY_IRQ_ENABLE);
>  	}
>  
> -	dg1_master_intr_enable(uncore->regs);
> -	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
> +	dg1_master_intr_enable(to_gt(dev_priv)->uncore->regs);
> +	intel_uncore_posting_read(to_gt(dev_priv)->uncore, DG1_MSTR_TILE_INTR);
>  }
>  
>  static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
