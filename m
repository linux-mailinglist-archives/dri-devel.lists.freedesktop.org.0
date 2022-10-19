Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6C604A92
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11E010F25E;
	Wed, 19 Oct 2022 15:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AF810F25B;
 Wed, 19 Oct 2022 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666191996; x=1697727996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2iSDRpcjZYLT5JUDmcBARJvxkOs+/lRFEyaHkUsRNCI=;
 b=HjclA5rcAVsTyPr6iVVHgI4Egv4qT6pIac9OnH07dcjmR9Mwy1+awY3Q
 wQmhG5srBrf1HSoIKNK5krHY3RomBb1RRkyL2v3eyKaSaD3LxH+Pw5d0y
 pmT7Ptm/jDpWvRU3Ip44R5G4fiS2qfGcKzE3uWKYlUUijntTmWmO6qfbL
 oc17armDHRtpAUP2nDxqe+dow3SxzwLoZqc1Is7Il2gAn7GNjjcx3IHmi
 AbUSwnGcKWmNr3gaQyiltHm3OTXI6RYECcfxoTw//JCZ4LmQ/oGxtVIhx
 WDCmVWgf+d28kO7gHij3758tlEDn1hf062VCyUPbx/4tOhULkuFhgd2Pm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="332995396"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="332995396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="580379707"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="580379707"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 19 Oct 2022 08:06:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 08:06:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 08:06:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 08:06:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 08:06:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM23bN9hS+G1LjQVfeUBSi/3c+UzKU9lpi8OkYIhY+/UiRmxrBChqH3GHXae3FmNBhb9hYDs0xihNVb5xsV51i+RruCg63PpC12YaEdSOjGG6BlJ9DilK9fXseJADcOwu1ywbL3LbR3N2+xiqVdlHNKULywauJ2unBbAHQ+oO1l3rttgbGLodOm5nNTmJKyVv41CtIi1pa8Oj7eg7IzErGT5PSdXSCVWNW2Xp7yMAJueIP0AjBNWyBSoLh509LUTPogReKGWXzoCatXPnWtZ/ywN+bj6RG5BVoP4V6nru4qnEUlPFHQeundwY84GD1VVZM1xavBOaZAp4Fnqj1eNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud9KqZOYvVIWfsLYdScy68qtehaL4eqQQU+VfHOZkjw=;
 b=D7MZxgZYTrzYBVjkYHYzh+kxDX5VaehzBcyTfLwXR1UAwCanHQ3CPO1U7O6ghLRuZwmGUleXFwXHqBMXlDA6FbosJEFbFVFcbjfnzG2TV1W0HhpFH6dkUIcTqmYdlWV+8NwfvIpYSWDdXGWvzUYmMRNAZEfuAt557Jz+TiOLU+X65X5phkFNgK2maYqQdBXeMJGWQTvYN7Q53CiPas9tiBiH2nEt6hHJSiuS+i784G0ou08zlw4cgMKVR//rp8xqbAVGcS9gIQRgpHnQmdmTCbYiJUk4EShRJmQpx5TeI2ZtFFc+C2PwAA2TTvLXuKr9xKdP+wRb77DXvRTgdbPmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 15:06:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Wed, 19 Oct 2022
 15:06:30 +0000
Date: Wed, 19 Oct 2022 11:06:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/4] drm/i915: Use GEN12_RPSTAT register for GT freq
Message-ID: <Y1AScuZGIHeBHmsE@intel.com>
References: <20221019052043.3193842-1-ashutosh.dixit@intel.com>
 <20221019052043.3193842-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019052043.3193842-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 639d618e-b60e-4a3a-107c-08dab1e380f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whbWkzPV0jiChbdQXNHTrFvn4Y9a1Re9fzDItoG0vPQaJPjjvjbyDgf9wAWbtmwC97RRwp6svJK9zg1HmLuXKBrYSJrFOWS5RAYqlSZN9SmtKNr+rLCBYjMuXyTQPynz/LKbH5Kkknkmn3mMAQrz3a1iRQHLTAvdvxaf9QA1QLyEAT03HajuVBhtjrnSJENK8nZ+bb6tu33gu40B/A8JT4ulrX8cSdKgfGLSIu2uar3sA8+k6Uta3pNkt335z09XR5QiHUinc/sSsep5EjuhnZUvYTAQsX7THeVjWPX6+Oz5mLxrgIWrAtc00Fd7Vf3log9lsuKiUnbYU9099z7iDMDPziSyU2CykXmAwH9E9KFnm/6nfNTZj8D58tX3UVVuXBYrAGGOZunxJZ7T4Z0grpYJJiVll/jyT/uhmso2UeMUjNXOSY0lbw8+VoNXFsaqqHFbIGJhyVuXiyXRSSAJucTpAQOVwtaVU9RtfKiA7mCYZakSrrerWM+F/5Lkwk0HFKL8Ifdvo4HslKlsrvQ1wTCQ4wUgu1DHb0AzlOYKrfkfjJ3qohheNUHKvW5sXvU2Ho7T5JWBmbWLmaP78aGa9xA3nEab3adSzAG5Z76HqtfujSf40ks3RDo86skwtS9pp+cxmoyZcgvBGwaXjh333ictmgk1o+UpM94qHFKUkxFCn+9jJ5F0cvq5YwoVF2MdC1MWSwlwqpnPG8TB8mu0QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(26005)(44832011)(8676002)(37006003)(54906003)(6636002)(86362001)(4326008)(66946007)(66476007)(66556008)(83380400001)(41300700001)(36756003)(6506007)(6512007)(5660300002)(316002)(8936002)(6862004)(6666004)(38100700002)(6486002)(82960400001)(186003)(2906002)(478600001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/okkwcGxAQ8+y0ugYemKBB/q+XVmoNY81EJIvV3IR6XNvRhJEgcydgfLNM2X?=
 =?us-ascii?Q?npOkaim4z0GeUKZAEzIh30YYM4kqvhtC24dDkbxuzSwyMvXmglIj/EJXWmDm?=
 =?us-ascii?Q?E+Ry3BWwoUb24He+DDKwApmiDaUCryQBOpdaX2lYL874TkpeXhjxsrZrlG87?=
 =?us-ascii?Q?DzrylGkIIm1yjAoLHzM+10OwunMCjyNXJ6jdLZw0g//+/eI/vS9voBcvQtaJ?=
 =?us-ascii?Q?Ls3jGaDLpY5bU5PM86CcCrkhb1nSeTbMUCxuhXYM1q89jcQxFLTjF+Krp48X?=
 =?us-ascii?Q?y1r7dPsc3wR/4Js9dcfl2ba5OL/eKleEDdS7qtu8UdXvB5Og5nYzHko+osmU?=
 =?us-ascii?Q?zen+IpKLNrPOoiNLMJfCUCvVpe5NQr5yv7gpEcbu+4mkZ7HrOm/rjMRcj3qe?=
 =?us-ascii?Q?lBUQXoSPt8QQLzd4Ley0Ei+bi8Q8KrhVhNQNxGwLUfL1DJfvhisQE9WkzpVZ?=
 =?us-ascii?Q?C0rkjKmkTlWGUT1Y3xiOpl1H7NHns8BtOt7Vm/yI7sMsb4VeNauXr2AJDz8a?=
 =?us-ascii?Q?rJFfAp4P4yfgVIWyrVxl9uyRDWxjtb7EH1iQHhrmfrerxsbKxTgAQygB/4ou?=
 =?us-ascii?Q?5vrDrUBPTog1YMiu4ufhoa2wyvV1cE6cqD+HI5j1OImR0dLi+tR291MgXJnK?=
 =?us-ascii?Q?dOBW9tKHWq8bid7lDsuUuW6q/nlEpNH/ESQKdDw6R6LB9msNx2dwI67UtrZG?=
 =?us-ascii?Q?28bzficmX8BKcMep5KdtgxntZIdfUqxXb38TnPxiScYPKvsY6/3Cnht550I3?=
 =?us-ascii?Q?msQzdI9Bm4qJjwIVm6yCjsjv3Sf2Qb8GurLtvLzDMBnwqBALDrRBPAJASOHo?=
 =?us-ascii?Q?eIsdJT2dDAKXQaTwgQK38hMRlDB8Nw99/t37OUGS+eqC+1ZWlRUqXHDEb48B?=
 =?us-ascii?Q?uCvobn4cXl8hkRKWEwW2lSw6xeug3iu8oUZotfQoSvv2fLPlex/3SveK+Z3Y?=
 =?us-ascii?Q?WMIIZdnV/f0PM5GbaLPVEoy8mO0L5kEZCPJmlAkrEmMyn+S/W6ibvERJnd+x?=
 =?us-ascii?Q?JAp0MFYuOHhWjfv0kwwtuREHpUbFDMgtvfsIhdbIdq/cjA5dHPLaC1aTvYsO?=
 =?us-ascii?Q?x0ciwgPvjOhmcs/EkdjLXcJBTOKxO0grAg9fh634f31i4iuex9DqPzzHuuAK?=
 =?us-ascii?Q?Cew5bkp4aKqdPdwxL963aJeMU7yQ/csEM14T+5yRIQrYTG+I7vn8nPgNab2I?=
 =?us-ascii?Q?Q3VWxuTObL7B/09vt7Utka/jzFSS4J68BsKNzHllb2D8zJGh/FeVCjjaQgAy?=
 =?us-ascii?Q?2Nq+GjY6XAxY6+xsu0LowgI1A0PUANNOhoQACWPlLyM5pWRtbxunG4Aj8sRM?=
 =?us-ascii?Q?iF5WfmNR46tBKMLFzXeBYcU+9Tsido2I/JAhKgI3uDFPN1NLLR2o68zZ/Dyh?=
 =?us-ascii?Q?Ef3LSOS+Ut5YzlvIpdpblKV4w9VyMdY+IxX3WoGhqXmoBWX95VH98eiNGilp?=
 =?us-ascii?Q?7i4t5Kso0Fk3ZRKLKu9fOwLZkz4ZB4teqQwwagDJxQ332QHO/OXnjEe5ejC5?=
 =?us-ascii?Q?XPg00/8EZeYBqeqMD5AOFxjM5OMD160RrdVYa+fwotkcFQzFV2DVNUEysxK+?=
 =?us-ascii?Q?ANlu60GwVqGey92avdrMPPbnDhcCc2Bzmchf5slb5TzveMBZ9F0fzOgS8jjk?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 639d618e-b60e-4a3a-107c-08dab1e380f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:06:30.8408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mx7q5G1W3h9LMoIPHUJFVsMEhBfeay/pZu6whboHp5aK4staYAZbrVRVdJr9VrOKziMrsgz22RUmNTUVjAEYdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 10:20:40PM -0700, Ashutosh Dixit wrote:
> From: Don Hiatt <don.hiatt@intel.com>
> 
> On GEN12+ use GEN12_RPSTAT register to get actual resolved GT
> freq. GEN12_RPSTAT does not require a forcewake and will return 0 freq if
> GT is in RC6.
> 
> v2:
>   - Fixed review comments(Ashutosh)
>   - Added function intel_rps_read_rpstat_fw to read RPSTAT without
>     forcewake, required especially for GEN6_RPSTAT1 (Ashutosh, Tvrtko)
> v3:
>   - Updated commit title and message for more clarity (Ashutosh)
>   - Replaced intel_rps_read_rpstat with direct read to GEN12_RPSTAT1 in
>     read_cagf (Ashutosh)
> 
> Cc: Don Hiatt <donhiatt@gmail.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Don Hiatt <don.hiatt@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>  drivers/gpu/drm/i915/gt/intel_rps.c     | 32 +++++++++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_rps.h     |  2 ++
>  drivers/gpu/drm/i915/i915_pmu.c         |  3 +--
>  4 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 36d95b79022c0..a7a0129d0e3fc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1543,6 +1543,8 @@
>  
>  #define GEN12_RPSTAT1				_MMIO(0x1381b4)
>  #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> +#define   GEN12_CAGF_SHIFT			11

we don't need to define the shift if we use the REG_FIELD_GET

> +#define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)

ah, cool, this is already right and in place
(ignore my comment about this in the other patch)

>  
>  #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>  #define   GEN11_CSME				(31)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fc23c562d9b2a..df21258976d86 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2068,12 +2068,34 @@ void intel_rps_sanitize(struct intel_rps *rps)
>  		rps_disable_interrupts(rps);
>  }
>  
> +u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
> +{
> +	struct drm_i915_private *i915 = rps_to_i915(rps);
> +	i915_reg_t rpstat;
> +
> +	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
> +
> +	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
> +}
> +
> +u32 intel_rps_read_rpstat(struct intel_rps *rps)
> +{
> +	struct drm_i915_private *i915 = rps_to_i915(rps);
> +	i915_reg_t rpstat;
> +
> +	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
> +
> +	return intel_uncore_read(rps_to_gt(rps)->uncore, rpstat);
> +}
> +
>  u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>  {
>  	struct drm_i915_private *i915 = rps_to_i915(rps);
>  	u32 cagf;
>  
> -	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> +	if (GRAPHICS_VER(i915) >= 12)
> +		cagf = (rpstat & GEN12_CAGF_MASK) >> GEN12_CAGF_SHIFT;

  		cagf = REG_FIELD_GET(GEN12_CAGF_MASK, rpstat);

> +	else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
>  		cagf = (rpstat >> 8) & 0xff;
>  	else if (GRAPHICS_VER(i915) >= 9)
>  		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
> @@ -2094,7 +2116,9 @@ static u32 read_cagf(struct intel_rps *rps)
>  	struct intel_uncore *uncore = rps_to_uncore(rps);
>  	u32 freq;
>  
> -	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
> +	if (GRAPHICS_VER(i915) >= 12) {
> +		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
> +	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>  		vlv_punit_get(i915);
>  		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
>  		vlv_punit_put(i915);
> @@ -2260,7 +2284,7 @@ static void rps_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  	rpinclimit = intel_uncore_read(uncore, GEN6_RP_UP_THRESHOLD);
>  	rpdeclimit = intel_uncore_read(uncore, GEN6_RP_DOWN_THRESHOLD);
>  
> -	rpstat = intel_uncore_read(uncore, GEN6_RPSTAT1);
> +	rpstat = intel_rps_read_rpstat(rps);
>  	rpcurupei = intel_uncore_read(uncore, GEN6_RP_CUR_UP_EI) & GEN6_CURICONT_MASK;
>  	rpcurup = intel_uncore_read(uncore, GEN6_RP_CUR_UP) & GEN6_CURBSYTAVG_MASK;
>  	rpprevup = intel_uncore_read(uncore, GEN6_RP_PREV_UP) & GEN6_CURBSYTAVG_MASK;
> @@ -2395,7 +2419,7 @@ static void slpc_frequency_dump(struct intel_rps *rps, struct drm_printer *p)
>  	drm_printf(p, "PM MASK=0x%08x\n", pm_mask);
>  	drm_printf(p, "pm_intrmsk_mbz: 0x%08x\n",
>  		   rps->pm_intrmsk_mbz);
> -	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_uncore_read(uncore, GEN6_RPSTAT1));
> +	drm_printf(p, "RPSTAT1: 0x%08x\n", intel_rps_read_rpstat(rps));
>  	drm_printf(p, "RPNSWREQ: %dMHz\n", intel_rps_get_requested_frequency(rps));
>  	drm_printf(p, "Lowest (RPN) frequency: %dMHz\n",
>  		   intel_gpu_freq(rps, caps.min_freq));
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index 110300dfd4383..9e1cad9ba0e9c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -48,6 +48,8 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
>  u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
>  u32 intel_rps_read_punit_req(struct intel_rps *rps);
>  u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
> +u32 intel_rps_read_rpstat(struct intel_rps *rps);
> +u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
>  void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
>  void intel_rps_raise_unslice(struct intel_rps *rps);
>  void intel_rps_lower_unslice(struct intel_rps *rps);
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 958b37123bf12..67140a87182f8 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -371,7 +371,6 @@ static void
>  frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> -	struct intel_uncore *uncore = gt->uncore;
>  	struct i915_pmu *pmu = &i915->pmu;
>  	struct intel_rps *rps = &gt->rps;
>  
> @@ -394,7 +393,7 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>  		 * case we assume the system is running at the intended
>  		 * frequency. Fortunately, the read should rarely fail!
>  		 */
> -		val = intel_uncore_read_fw(uncore, GEN6_RPSTAT1);
> +		val = intel_rps_read_rpstat_fw(rps);
>  		if (val)
>  			val = intel_rps_get_cagf(rps, val);
>  		else
> -- 
> 2.38.0
> 
