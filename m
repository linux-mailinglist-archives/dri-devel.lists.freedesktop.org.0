Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B46603F5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 17:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77DD10E2C0;
	Fri,  6 Jan 2023 16:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6AC10E2C0;
 Fri,  6 Jan 2023 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673021296; x=1704557296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yqWKEVL8NuyKf97HLq4iKuF+PS4XNACEyRPWYiCNGio=;
 b=YXTcXZoPmx/voa/yrw7vWyaLna4jSkcXUJOAYxY7PCIsesCv5SDv+iRk
 g4GPVpuzjCeTVHv0B9iRtHkLvoAOqmBFTTOxt70Y9i5nYf7FufluAAo1D
 R8P+soWyso5vt5zeynlTb7/7ytdODB46TPy6tbsL0Vme93J+ZBHNCFc5I
 W2rV3+xH3lhWuafeqI9wP/7KsCprt5Ef9/b+USW6RHQS0ssWAAMPVXQXN
 4YTI6DZUpnbUhspHI5kbq5iVT0mqybQ0PkR/06IWkpvRs+PgHMhn4Fl5d
 2KCnidyXWw2d+0iTxltHOno52FsaZ1Jjjm3ERnXQdOJs0fD27P6Nbuy2a Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="324516978"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="324516978"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 08:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="657925795"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; d="scan'208";a="657925795"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2023 08:08:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 08:08:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 08:08:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 6 Jan 2023 08:08:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKqcQTuBP/JuF0vCJ3cDtlY6GQTH+o56QZ/KB5ZJH8sDw5ISLBTcBObjmHTvuEDWAoHVZxVm0jfczg6IMWhHLmMuoebpWq5Vw3rLU1946u+h/x+Rnw2UpK2N4IbvqMgO1bGZ8/XoG3qJBgOOmFiq2Bo+mMkvxZgKfCp6LPWFMm4Ba717mEp3Qs+kHiWoiw52MhJl4wYQd2R4h6xv+NsnIOcdms+V3VfAtV2F/OHDxeRG6jMZSoRZ1u0zc1PG/eUYb2StjuC/J+XyNlcGxpNn7Csu7doOPvxxXV9wJeCXDtNYcx/YES2hm1b669NiwaYeu+UqXbtCZAi0S9IzZ/8aIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZlTPJbFx7+PXQIG3OoW/T1ZMlxY6F7iZo6mnjzK1IU=;
 b=AQzpUOOnRA8/ZV2eAytML1HaG0a0ws0ecnb6GrtuHP9WNUsSPPyErGcHYvPuY1J3skjDDzjRLJAh4D7152KvL9yko2/Fe2apZ7oKGDddUP/55qkUuO8KNMKRwwxVMZ7QAUNsyWx7rwXkHZYOFD9x1ni5CsJPbB8UU+TFwmVo4MwfZ00jktswUX0JyTFDwlg8e1iewJTEzo+Yf7WP7e7ECj+wrmi/CK9iwOo1fs6DNApxLVS9CpOh57xwPOnLh7o3ajUUx1j2PnT5yS1raUb+GcgIWXpv/DwyEBTEWW7HecDhZjYKU0rctSCt7DiNtQMlp/qZZDddkK9DtjOx4jjcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5828.namprd11.prod.outlook.com (2603:10b6:806:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 16:08:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%8]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 16:08:05 +0000
Date: Fri, 6 Jan 2023 08:08:02 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Do not cover all future platforms in TLB
 invalidation
Message-ID: <Y7hHYitZmYQDlEhD@mdroper-desk1.amr.corp.intel.com>
References: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c44290-dc86-4942-5c0a-08daf00031ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: th+Vydvt7INaIGqf37SQ38LxkuiJBGN9yJpt9EWFCC05pzMoMu1ZToX/DktwMMXFBdlbMW8/a5MGF/ZISHB1WuZaHUahsQZBrMmHCvwtwDJArCheW+6Pc4ceQd8bqy2QojGL+hWecmGGy2KrxUG4lZUpudW1t2kROuuD0bO0BxyCpjPZBpOkYL23OVg6t0mJcOH2wOL5ogzDmKqekMTk1CfL2LwVwOYtRRnc0LM23pfnpXLvdvejpeCJXOXXqjrmFTVO8vVpjwRuThLwxnwUreLVO5fN8pMfU935kXfBhroYRMKwfGBvoZNW8CHQQZ0vHEzZpdkrVOMdD8b08NfYN2bwUg44S9pOhK/TZWlGyzXepIDxnO0WE6VLPC63p5wvgic4eG5vm1b+dWSB1uQfKpUi7H5XdRYOLQzpwpVQI/Fs2hgKr4Ocz+2cxjSoGJHt2n4EP9b558Bx3ab1XCB7rcY3rYmL3W4sq+ZkkfAMVS4FxWXD4QSdIROemxC4D3ZiBS7WGsLM34g9VTZkBL/C7eJVYTUL17nQ4sn+E32cIizpPLnmeR9EmupErhMG6UwqZDRic7T/gL8Pr5lLsz+RhZiLQwwntYTO8668flIBohawkVuouXXQ4JiCL9TEIpdxTdfZOKQ0sfLKztV2PS1S4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(54906003)(478600001)(6506007)(6666004)(83380400001)(86362001)(38100700002)(82960400001)(186003)(26005)(6486002)(6512007)(5660300002)(66946007)(8676002)(66476007)(6916009)(8936002)(41300700001)(4326008)(66556008)(316002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tseVJ9v4+m1TLupxbKbn9gthUrwj966o/fwTuzuwvonPf3mRSKCNvqDh84wc?=
 =?us-ascii?Q?kDA8XEWhIv26gYu1s9nJvCSifH8KZUMcuyBxnMwC+GiX2ipuw7oYXqyGlGAP?=
 =?us-ascii?Q?aJLF1DAbuM57h4GXXgBevaraRg0aR9IWdM1MvR1mxJNMNEFTHUALhG2hI+3Y?=
 =?us-ascii?Q?cbhCQDgf++9WNmWGJSEzfuceKtpziI01GOoXa5fMt1s6ljZYd52O2z5/8u63?=
 =?us-ascii?Q?BSA5fwZCT0StEcY8loEaZ6DmCDL4tfM4YZEmXNRxwgnLbDa3pj3IA32lyJWc?=
 =?us-ascii?Q?AvwvBlAgrj+fFPo/DRjdaW+h4ns1J3CyAKa1yeuJ1SxWvsKimFbqnjCfWorp?=
 =?us-ascii?Q?wS77kvIUGrwxlsrJZb6mPdwJaQTL3VVBnyns09sVK7sn7v/EyaEahuXZnnBd?=
 =?us-ascii?Q?Xx63cbFGd8gKcp2HJy1OGbRbiBhrjNLp3Tq2YfQavW/aba9qtTqXMAO3aPj8?=
 =?us-ascii?Q?My7r5yHD2tT+wvzfORYpvYa6YweH4jbQ2R87TUtMg14rzBHHHKYAAnUuMhxQ?=
 =?us-ascii?Q?nIVWskbnPEsPzxmDHqM7dnMYVzv6yUXdwKckTHTsvfr8ND/mpeJrplX6CvTt?=
 =?us-ascii?Q?5XDABXnEg6AXRpSJ+qt+U8/TZ25Dksos+hePmBYxqqP9qjC26m76Qakc+CP8?=
 =?us-ascii?Q?1rK1QisIVQDzY1qH8Vj/+mpFf8gSBgWRfzJzRwmUeS5aTn3rRNmqOr8Q+jvr?=
 =?us-ascii?Q?KBNDTbxguWWTauRKhSIPnQrJlTQ2CQiWo2xbyH5pWTOUEEjNMniBl8+JdFfV?=
 =?us-ascii?Q?AMqMPXxOjHCf1fjWLQP5I1re0uhMwoJBxp5HBW2/vO6pJPum9jTsFvnhY8/T?=
 =?us-ascii?Q?MW9JLReg7NRJQ7mxo5Yn+ZssYN1WDXtB2EDi8gXU7MP1fXiQ/GQM5R0im2jq?=
 =?us-ascii?Q?UPecBh1HWehQDGBdhjrVt49+rxR1AFirW2djsb+3yfm/ZLZOmbbYBEeSZFLf?=
 =?us-ascii?Q?ZpbRlDyr2aELYnkDc48bIxnG/0Db0pCbdbN8pZ0R+OluhezC/e6otVuBAdax?=
 =?us-ascii?Q?R+S/0AFOA2ZzTkoQvXSiaWi7h6NU1OW4mu3tdc8XRm1APfwsIO0LS16/si8x?=
 =?us-ascii?Q?225bZJN+uY1MTDviHVtzXpjoarHhUPMrzH2dL5uSJq8Sq5JdupUpag/WXdGa?=
 =?us-ascii?Q?2NHa4RniC5zBz7ldaMsSfug1+0f3LcnE6O4VMIJhJ/nu5ikoMvHfr2MCe29U?=
 =?us-ascii?Q?JdhS/L7PoO5PhMeKi8j8YPosgHDz/dmEy0uy1Os4dUp+8U9jV5Vd8wfrE69b?=
 =?us-ascii?Q?dwJ9HyLnzmMgzL7siDDRlAkVmq5D0f8D9nE3uTsclTrPD7F0zRGtxUwjYyi1?=
 =?us-ascii?Q?dobNO3YaFufGvJz3ifIDq+zOvcFuGhtQvu3LNfIdnSUlPjSFkoy6qKJTAX/n?=
 =?us-ascii?Q?uThhtRAU544jjWgd6TV3+S5i8popWrNEzt95utEQwx/NtFxPXgPggMArdu5B?=
 =?us-ascii?Q?eRug0WvpIuk72JmYNBim32UOIB8JfTu7T8zLU+xKC06R/c7wUMNu0Ddmoqo2?=
 =?us-ascii?Q?F2l7fZAKbW+eZmQnF41AXBLs6KO91fIxHNSYPmzFPrj9XLsnFsMr7rPn5klW?=
 =?us-ascii?Q?oy8JGm+qAeOFGRjB5XmPUhcSLf7O4vlj56CYegWgM2bvoQQyrllg9e91Uu14?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c44290-dc86-4942-5c0a-08daf00031ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 16:08:05.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLW38OHV6KKLx/l+uX2Ho1CEyBeIWhdypBhPmkGcYFrd7FGpydnKh3xBXBFq2JlQQKBTILsIudQ+U2fn0FrvFI1c4ydJT0WyHQEylqQw6Mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5828
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 10:38:35AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Revert to the original explicit approach and document the reasoning
> behind it.
> 
> v2:
>  * DG2 needs to be covered too. (Matt)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> ---
> Matt, does DG1 need to be in the MCR branch or plain Gen12?

DG1 should use the same "gen12" branch as TGL/RKL/ADL.  Bspec page 66696
is the relevant MMIO table for DG1 and the range containing the TLB
invalidation registers is not a multicast/replicated range.  The types
of engines supported, and the register details for each engine are also
the same as TGL/RKL/ADL.

> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7eeee5a7cb33..b2556a3d8a3f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1070,7 +1070,19 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	unsigned int num = 0;
>  	unsigned long flags;
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> +	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
>  		regs = NULL;
>  		num = ARRAY_SIZE(xehp_regs);
>  	} else if (GRAPHICS_VER(i915) == 12) {

Did you want to switch this one to

        GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
        GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)

so that it won't automatically pick up future 12.xx platforms like PVC,
MTL, and whatever else might show up in that category in the future?


Matt

> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
