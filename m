Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E3642CC6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBAA10E249;
	Mon,  5 Dec 2022 16:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A8410E0A2;
 Mon,  5 Dec 2022 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670257678; x=1701793678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X2ko6PWahmH2PzbekP6GoZ1TfBUS3JvqN08y0sUX6bo=;
 b=V6sxj0iPZfWVMoWZume+XiiA6jjpPXZG8f/rDS7253xEJ9O7viRxwyLC
 OcTOlJDN/fAzTL5KD1Vg3t7CUCGxUtX+CKeHph3E86qVt6etavKOETbyo
 k/3uNR2B/PamUTVLsfIcxanM4k7f9agLW1UY+vBJNA+AhgScwEUUg4xVU
 r3i10OUIuEuvbFNcxwQNJglww9DtMAu6AwOJbscWD7aZNFkrM2EEw7L+7
 KAb1EttQT3Sd9YX1bYpFtn6jSrIy706K3Swp0R/JbY5sOWun5dmc6ewnw
 h6RJyojuG/sqRXaZg9o5doozlY7+2JxFoOabvLdokL9zzbt20MxIuzH52 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="316418442"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="316418442"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 08:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="788135240"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; d="scan'208";a="788135240"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2022 08:27:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 08:27:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 08:27:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 08:27:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 08:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTyRqPpw9Sw2NRJJJo31PoLdPkJnUqT3JWBQk35qtsPK7AZ6oMXwxI9c9sbvTkiKOpXQD2HCzVpV/o9HqYV2mYzCu+jyLbDOucUgIMPTdMoOfzDPMlaKWxdBbAtuwKFllDDL24p6zrwZ2UXm/VIerQgxwQEkk80ObWfaKH9q5j6+V30N/8Ct9nRArDpievoHbq3O04NZ2Zr4ptV2RNe06Es3yCXFsoKRmRYwN3xpRQLuiJQg0725ez4irbN2pj/+nMkJCnIzLG4Hmnigi4jcjGWBvECBaVB2YYo4bm1QILgXzH5f8g2s6G8iDofULQlzo/adnj9zsE8/AYV997DacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7waYpoQ1GWnD/mhgyxZrKWl3ZhwheLu8sLAIMAzz1E=;
 b=BEZNhKyxRVzBIPJwmfovs36x4uHgeBH4LNgJqWxwOzX3H2c8foamIkjCTLTSbZ1RjFNF5leLUSouietAt73iv8t6AZuxqMK+Jf14ihsUNo4Oc+yf8q0Yp5y4HsdwxcOxm+tNy6znf44IgLy11XEWeTGqYJoxngAPeg9oB1aijNUPoN7VWvqtddkC8HC2Zl//80Run8V000IZ0w+/a0fdZWFVM1R4tZ0USdkVIwf3tWr5fpPsl6Cm76L3gw+66JJYVtbn1Z4DBOv+ehB8cJNa8Iuhnbje8i9bzfzrJSDqC+gqxG3rF8bA4vzhlA+JZh+N6TgQJ3QKQzMlsRqDWQxWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 16:27:41 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::48b8:5304:2638:3475%7]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 16:27:41 +0000
Date: Mon, 5 Dec 2022 08:27:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Check full IP version when
 applying hw steering semaphore
Message-ID: <Y44b+z88C3HXHR7e@mdroper-desk1.amr.corp.intel.com>
References: <20221202223528.714491-1-matthew.d.roper@intel.com>
 <Y4qA760HHNU2b7RJ@intel.com>
 <9d3d31bb-039b-651f-9788-100252f53a00@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9d3d31bb-039b-651f-9788-100252f53a00@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: a075edbc-2993-44cf-2004-08dad6dda19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UvltdQ2byX/Q3pDL0+QDD4q32g6UuyRdOQeiFt9GU87FAzobSVfIrNPDgwu1IsGmdGtrzvHtJteS9eHomHC7aoljZ2UxA1OsiYUIlXJeZxK45rEsyI35DSnFMJP2vt4uVuiDZyMQsBrbbY0QRxYB4BbkP5g8x2DqEIyl3lEWdbf4AFCReOahlyEuY6EKZiOWkLUFLwXd8IcIN3ykDU+QBCr7jsVbQhjZIfP0rLKfcWuQs02Dtc59cecqnCQHv3P4ApNW3z09oJw9t9Na6NVw6RYpTQSXEFdytjCfOp0PD0jHX8I6w1BigvV8l1kVoW+nFzcdsYQAbmAAqBuD0QvwWuvM5opWV6SA1o7xqPfizQhipXjx28W8pOMFHhxXk5IkA3eQNMZAYIwOeCIce0pxxHA/5J2oxNWyTjz2TaXMf3piM4ISY3Uer7RMvj+vPenM20ad+0GSLUZ6MLNo7rxqpahWYDR8HEwLLXDxo60puFD8fcmn3/vQPpcxwZTvN0UxrGwau2/vaFDa0KQ0LzTu/xBICw4yxj9ZWZ799uKbq7uzPVfpmy1hem9WYPwIbo3bwlacdNux4THUFnFh6DVAL9n8l0bcw5M2SwteAzy+os9tsyiIZpGHxrQm2ZnfS1kyu520T1V9ZWzJmi04vioQPkWmwUutCSesIC/pwoc3+gzRTaSc+rFSW3vxJIfwMc+w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199015)(6512007)(8936002)(26005)(5660300002)(186003)(83380400001)(54906003)(6916009)(86362001)(478600001)(316002)(6486002)(41300700001)(2906002)(8676002)(4326008)(6506007)(66476007)(66556008)(66946007)(38100700002)(82960400001)(53546011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxf2rqjB/WTY7w4Bg3VhEJh62YJAWcE8I4XaQRzq0gVwgaNut12WgxcQOSvc?=
 =?us-ascii?Q?W5AXuiEMubhjYTHV23qA1IXXI4Qn/nBvuqLytoVhcdMSgH8X1jvig9vRTRXo?=
 =?us-ascii?Q?kOdODf0Sw8ncL8JfSPuqvC0fpD3KSdeSJUyMiFweEThuzSvU7cTq39g1fj1c?=
 =?us-ascii?Q?P497zj4urnOdCLDJ/u9NsPZHs1ONsQuo/+g2poX8d8r3EM2Bv1z7suGcr/Xy?=
 =?us-ascii?Q?tZXP+Gl4gVvh4YtpZfSiuq2ArJteL7wdg7WS7Knedhwi8AyH8DMt3b4TIdCO?=
 =?us-ascii?Q?9BLBccGkQ8TUnvIxizueydl1VvZlOX0oJ5gkp/vO/PSy+NoY+2lMc4Re0+Kw?=
 =?us-ascii?Q?AK3KsahFn3DLlkCWmDA4V4OaXIJrhxxeqYo+ZqZf7t42sWHBGQLSX/d4DoLR?=
 =?us-ascii?Q?omxZya/z1MtiyWz+cHAJK8pBzEuwDr4R0UmKYwMTU5kHN8OssQE92zbLqN2H?=
 =?us-ascii?Q?duM0aqNe8DNLYQxL0RRoHU//Fok+iPc4zdhXMhQnRGJ1h8VGBD79cbfP4h15?=
 =?us-ascii?Q?OH2GOW4lOFNtPG4bmg/LJkWj9983vJc/l/mVpkssX1pv2sPrL3XdG5Bw1MDs?=
 =?us-ascii?Q?7HfMtObiIWBvX5Tw/EvUYbGu2YGlLq60P3yjEqSGiyCbu9UN2yppaIhBNyU3?=
 =?us-ascii?Q?CAvi/EsduT6CX2hdN83Aw6sBpbcUnI7HgoLkRAp8//LiQ41fx93vwNUjuuaV?=
 =?us-ascii?Q?cK/GgSWCNPksXYi7XlxfCxNrf4CkvsK/Y/+KBeYBSswQZSqXdC1rifLQ8C/F?=
 =?us-ascii?Q?dzs2Soj5AjWHtrfoQSXcDvqTVbIOwP8o25HI/4bL7jb0P4skAMfxF6im9tit?=
 =?us-ascii?Q?R7SaEIikAK7bDaUFqniT1MIGdWn0+/ghlCQK8fgMoNyyZ2/Ew/42bh258IZ5?=
 =?us-ascii?Q?94JY33d36MxS/RMQihVZBH7w/ttQLTidOHidAacmY23/cHeUQImkME/VZl6V?=
 =?us-ascii?Q?04nki3oc9MgDM2padVIfla0i0ijngfeU654/imoIMDZL2J61WzfpKlukWmaK?=
 =?us-ascii?Q?7basLMlnApwRPzMkgFbsr/fXvj5IPUNwuJJFF0pB8WnEi4ujMdmfCTycX/g8?=
 =?us-ascii?Q?b4kWHePs17DxWpXNJlzOFRWqSVQBhjDVnDrr/GYEnNrrHEc94xZlSfxp/d+P?=
 =?us-ascii?Q?G8LofJYSyf6Ai+m1ScINLUcw8eb8YB2fUfn5SSXdrLQn0KBH7d4lUN2l/+zL?=
 =?us-ascii?Q?VGPnLDsec6D3uWkXsxCSNDsWJWwGrke+c8G/OyGM7Hiyt36s4e1SyZztnPqx?=
 =?us-ascii?Q?OlwAjlkgAkYMynvlWn8Z4P9ux7kD73owuv50Cii5UB9c+KXRWtOP1adyzvP5?=
 =?us-ascii?Q?YTgt8iGmkg76ao5m4QrsRVSEMU01XZ/hzlUJP4uSBJeQRKtLQ9UmcjJupbBM?=
 =?us-ascii?Q?45yju7jpLyNK+wavSsE4XMthCNAgFq3c+dMuIaI2h3m+2bdb6sveesTFTsA+?=
 =?us-ascii?Q?jmzlydhl0/pDLT7InM3m0QE8R9L9Tx5zzzlBe1yuQXzmBGKbFeXQsWm0YoCk?=
 =?us-ascii?Q?CMdcgaFkZYOcGMhNwbLApIVUyilAeEggte9XvhhARUU+bDEZEW6Wntir/+g9?=
 =?us-ascii?Q?/OMo1xk33m8G3C3LmpqKzD3q5o49+8vHEieBUiIl/4fkJFrjR7RXCO0QINDu?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a075edbc-2993-44cf-2004-08dad6dda19d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 16:27:41.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mayJP6s1NjHL6BqXoKAN/YUnzNbypS6z7Ck6Z73wkyBg2z8sWfq0fsjmPkLgciYo0K/bKIuun5dFmCCuIqdA3gJOwHpyBTF2isOMdQPlNMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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
Cc: intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 05, 2022 at 12:50:40PM +0000, Tvrtko Ursulin wrote:
> 
> On 02/12/2022 22:49, Rodrigo Vivi wrote:
> > On Fri, Dec 02, 2022 at 02:35:28PM -0800, Matt Roper wrote:
> > > When determining whether the platform has a hardware-level steering
> > > semaphore (i.e., MTL and beyond), we need to use GRAPHICS_VER_FULL() to
> > > compare the full version rather than just the major version number
> > > returned by GRAPHICS_VER().
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Fixes: 3100240bf846 ("drm/i915/mtl: Add hardware-level lock for steering")
> > > Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > index 087e4ac5b68d..41a237509dcf 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > @@ -367,7 +367,7 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
> > >   	 * driver threads, but also with hardware/firmware agents.  A dedicated
> > >   	 * locking register is used.
> > >   	 */
> > > -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> > > +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> 
> Ouch, tricky class of bugs... Anyone has an idea how to maybe coerce the compiler into spotting them for us, cheaply?

I believe clang can already notice these problems with
Wtautological-constant-out-of-range-compare (which is how the kernel
test robot finds them):

	>> drivers/gpu/drm/i915/gt/intel_gt_mcr.c:370:29: warning: result of comparison of constant 3142 with expression of type 'u8' (aka 'unsigned char')
	+is always false [-Wtautological-constant-out-of-range-compare]
		   if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
		       ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
	   drivers/gpu/drm/i915/gt/intel_gt_mcr.c:410:29: warning: result of comparison of constant 3142 with expression of type 'u8' (aka 'unsigned char')
	+is always false [-Wtautological-constant-out-of-range-compare]
		   if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
		       ~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
	   2 warnings generated.

Unfortunately gcc doesn't seem to have anything equivalent as far as I
can see.

> 
> This one is undefined behaviour I think so not good:
> 
> -#define IP_VER(ver, rel)               ((ver) << 8 | (rel))
> +typedef void * i915_full_ver_t;
> +
> +#define IP_VER(ver, rel) (i915_full_ver_t)(unsigned long)((ver) << 8 | (rel))

Hmm, so by casting it into a pointer, you're hoping to trigger a
"comparison of pointer and integer without cast" warning on misuse?
That's a good idea, but as you noted, the C99 spec says comparison of
pointers is only guaranteed to work if both are pointers into the same
structure/array, otherwise the results are technically undefined.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > >   		err = wait_for(intel_uncore_read_fw(gt->uncore,
> > >   						    MTL_STEER_SEMAPHORE) == 0x1, 100);
> > > @@ -407,7 +407,7 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
> > >   {
> > >   	spin_unlock_irqrestore(&gt->mcr_lock, flags);
> > > -	if (GRAPHICS_VER(gt->i915) >= IP_VER(12, 70))
> > > +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> > >   		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
> > >   }
> > > -- 
> > > 2.38.1
> > > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
