Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F483B5CF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 01:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7071610EAB8;
	Thu, 25 Jan 2024 00:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0C10EAC4;
 Thu, 25 Jan 2024 00:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706141153; x=1737677153;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pEIlIcnAs5/aONGRUanhL1Fw738xGCKOsR/W3OZvIE0=;
 b=ZIKhUlzwZUJs2vPkuGRY1/nbFORdroyG0aJM+FryB9KiEV7vsm9Jvraj
 lMjPD67BbXTRASc86fUZBOwKqyMjrOMWs5k4FTTD5e/YQfy0LKgPJQ9XL
 aQKm1/lv5MgcglZ06VA8Nk2ctoqVJVcPNwtKVWdhylTIUKtUE44WRsFe2
 3O//JR3icmVtfTOft0epcoSxMP8c1Mrfi2WOKex3RzzNCh6aBRGRbwRUR
 ZWE9wX9sMO9NaTv4/KxsLFZVF5yz4mAyUXRUvBkawEzvbbN1A2w9n6Tbv
 MAmAVgz/hh6ZLTrc9xu3U8zdOaYxmbOvJHlPGFUtqrtHtZg+DBJBLcErY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23473546"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="23473546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 16:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20879515"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 16:05:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 16:05:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 16:05:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 16:05:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 16:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbI5mdTNNzlz22RM7nTiVb8KxXJwFz0YBwbVkRbWMV01mh/BLdqNRvIWYYExtyqTWSpTwzXbiBqK0j6WVTMBaJdzo3tL0R4E3zH6GPnUVbaRYMDwW7XpkTLixNp4SgG0V2Sp6lA5cAbCVCQ1RlDF0v0zW5yzNWxZWqWkqJwCL7bbzj8Bmz91aqcUZd2EaEJVApM7MHvdV3+yLdURAcjfUaTO30HnPBurJVuce9MhwlZHqcI0pYe6xn+QWVkMd+arZFEOb0BM38GmbwSaPt9w3/F703TMRErzDGNSKwMA0jjHguus4pxc700teZDDvd+lLv1r2ZUykIWUd2rMoDgLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmfTDSZPfwgwK7VfdG0CSjQKsk/IPGEdfmODFGqkSJA=;
 b=XK+4sDcdm2k/tBMYAq0d0UfO2SaZEImWvIru6tkgA8EIdQDALffUhTGGkHotXynzGUpRUCnjBwzB2SB+p7nyuXMjcpJ3Crdq57bBb/WUQuOJqRMYVc5+nSpW0EcPbOzAcnx4dliPNARfhUz0QJ15kYJO5gNHKTo9ZmALApMB0TXOda7WwHBMCq+f9ofO2xrob+2OfvtI+e9OznIp5N1RyyXPXNwy0EJUr8R5CxLxMkXu6M1GdQDES1E2wiLgfT15d/cVPYIXjM5Wcdhf1cE5v6NG0iNtPylKwlxzfRCJNVv6dMfL+NZDuUWAu2FDLMlacDbWnJyvO2Ph+VunKSXzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Thu, 25 Jan
 2024 00:05:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Thu, 25 Jan 2024
 00:05:42 +0000
Date: Thu, 25 Jan 2024 00:04:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drm/i915/guc: Remove usage of the deprecated
 ida_simple_xx() API
Message-ID: <ZbGlqD6zyyp4DsmH@DUT025-TGLU.fm.intel.com>
References: <7108c1871c6cb08d403c4fa6534bc7e6de4cb23d.1705245316.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7108c1871c6cb08d403c4fa6534bc7e6de4cb23d.1705245316.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: abfc9c64-f38b-4b20-3e05-08dc1d395ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MuFEAWVdtIuRzaADNEWGBvlHQJrZcQ2aWRqwnG6eLTodANXaOpF+g1nWvdjjMRckGco3yqNSzn8lHGeOud4gwLAg0PoAcHK1t9Wunwc+01YjfqVXpOLKH8CZbNwTNf0JmsclcSP8ydiyzwTboxnaqPN3c7KB9HfiDBpRCNAHGgqu7PS+Ft5isMc7C9tsT5qPYtuPNReTMVO6gJhMK4reBq8Yz38CDsZTWq/ZoNMNpl1J5DRwY8B7392Ym4NPIVD9zuakai7HDvbk1/WfhFCt9kdv6PnquTYHfG54ldCBGzc1XWbm4PpZ9U+kdkLS8j7IF2HQZFhoPaMn9ouqkeoI3EOp80JEiHGOtueXi6okhD7/3ch1OQ/cRFx2tdjlUrVJLtm5y99bTec7ZXdIzMBK4wXgP0dNBh9B0+PIQA0lpfYsI25pL/0kkYdBNgi+2oXjPeytOUwOz3BYuSXiQhAKLHwZSevQ1uxe0v4Nwz/JKte6s3fSj7W2z/8YOYWLPAtDsQRDKPtSwD6G4DzcL7o951b+i3NhuEoJ6bj5DOBBVZz9o0H1RVT4etqbYpiMfcAI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(8936002)(66946007)(5660300002)(86362001)(2906002)(44832011)(7416002)(54906003)(316002)(8676002)(6916009)(66556008)(4326008)(66476007)(478600001)(6486002)(6512007)(82960400001)(38100700002)(26005)(83380400001)(41300700001)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXxPdjGh/TcigKPw/fB8w+2xqnvm3EmbwUFSybdltINdD/pGaVjeZcgKBl1q?=
 =?us-ascii?Q?A1iqHAehBtbhTo3hOj488bvkBUQyib9hhlPURNe2f+sNkup+Yiluz0e76roz?=
 =?us-ascii?Q?R+UJyAWHHuJ8TLRcxJGLU2TekAS57RKUf4c3jLZXnNc1ewkB1lBe22Rmg+N7?=
 =?us-ascii?Q?psaVXZmz0bKLKpltfABBTMrb+LGe0i1b4LwxTbM3ZT2VRtUnqLHvvLFBT0zU?=
 =?us-ascii?Q?TfZm2KCiEeJjjwzM++XhzZoV28pKCnWIpKSgwH4RRJqlNv7ZlNm23WOzRwGt?=
 =?us-ascii?Q?426XbGTFzDloq0DPYnAUp0vCIsT73LaXWA1j93yAfFJCmbBt1ejcJGFG0pRH?=
 =?us-ascii?Q?rsox4agQZOH+FUKZy7IW90li/nvxYEnUSM4URxnMUvplaRrgwYneQBKJlAKt?=
 =?us-ascii?Q?qdD6kyus6JxVmFPQ29lyec+NLccDXeeuLvruoTbC+VeB1sK7yP4STMdYHLg+?=
 =?us-ascii?Q?pttu/5kmpnJ9mpPEDvOc5A6WMnaBFGkNeF0xyMogAX8E+ygQ6GiuqsDUGLVx?=
 =?us-ascii?Q?DYHJRL19FTPZDFDZNlafainvYTWTMIYyDwtBDYR1L5iVKL12p669pO5FXHuC?=
 =?us-ascii?Q?faVcCliskxeEm/Gh+bRTxhwDWvyRXxUMNzZDHjA6ftVSNjHyRxqioz20OMwa?=
 =?us-ascii?Q?HQrQ2Uc1ADUL4zJhVgH/GKKatQ7dLRkhWNB6YdOBVN0ErT2jufNzOokHhN75?=
 =?us-ascii?Q?f+9eabsDwzNrnskKCHjGIZSeCRkExfYxwdCUPYfztxZ0rpJ1zdwGTkLOGrK6?=
 =?us-ascii?Q?zQAS5z6XAdoaTwxa/pP+f4Tjyg3Qt1K8ISmx0flm/zRO2ryFZVZ9HXzmDuWA?=
 =?us-ascii?Q?iFHHQI4EzxbyseNfR1t8V7ap2RKzqDJgVFlEDePc/+LUup8ZOA6EYV0+zRWY?=
 =?us-ascii?Q?jAYOMlr56JNolm9dQnju9/hfx1VePGuvzE/VgCz2+yuJcC6edDpr5zsvGCBW?=
 =?us-ascii?Q?OObgThAvZEtScAAFgiYmjo55qI/EVadpFEJYPbY1IBxFWqkHI+tqZvu6XKww?=
 =?us-ascii?Q?ObDIu2XlI33efh3mto9ROwH2j22I47aBJqikiV0UKnZOF5X8/L3tHMDsLXQh?=
 =?us-ascii?Q?InsVttOIY8PTiJ2zowyaOZOhg2VRMoy5H4kMzhTQ7Z/W8/Ap5Nns5PiI+OBs?=
 =?us-ascii?Q?iNkT5KybRgMKHyEuzITZyLKRF+9iIutIrNwwLJMbcIsYsnunPkvXRI2lNJPc?=
 =?us-ascii?Q?g1AJMCFf+AESZO+uoT1A61Zqcu9JY7SjL3++N+6JUNwiVFwTG+XYsvpa1Ff9?=
 =?us-ascii?Q?VOTRqKUPKDv3RgNR1ebkx/Oi8fvHClbVik5/WPmKk0jbBPy6c2BO3c3X6mcm?=
 =?us-ascii?Q?/pXvCjljd4Kq4rukqfBee4pSgCli35qu5a1jkLtqYuGqyvQmiZfFt3dOON+E?=
 =?us-ascii?Q?a2js/wkOkgOmCuV3nTp8oTuIVq+TJspbX/VKfo5HymDh/hiWsYBzDnMXVhbS?=
 =?us-ascii?Q?imDy+sfTgA+E8wvQZbi8gsleGKNFvB+LA5OlFXPNLCGRKCGelGVxPJjBd8MB?=
 =?us-ascii?Q?AxBpFAbMDA89rJ1P6L8Kkv349cvhVXo5KwrC34ABdJBOwZPaASiRZUGpHXQl?=
 =?us-ascii?Q?wAzctrmayPh/u4k1EoDiZLGkqFDoNVMHX9GCz/3deH5Yy/Yck+mLID7gQzQX?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abfc9c64-f38b-4b20-3e05-08dc1d395ea9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 00:05:42.0127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYxfe6licZEuBjP+0v3GvXpW60KmDiNtSpSf4dT3J/EFNKb5Gf2IUEhOtS9aV9ybUoM3vHM5spip6v9RhrUV5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 14, 2024 at 04:15:34PM +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> Note that the upper limit of ida_simple_get() is exclusive, but the one of
> ida_alloc_range() is inclusive. So a -1 has been added when needed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a259f1118c5a..73ce21ddf682 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2156,11 +2156,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  					      order_base_2(ce->parallel.number_children
>  							   + 1));
>  	else
> -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> -				     guc->submission_state.num_guc_ids,
> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> -				     __GFP_NOWARN);
> +		ret = ida_alloc_range(&guc->submission_state.guc_ids,
> +				      NUMBER_MULTI_LRC_GUC_ID(guc),
> +				      guc->submission_state.num_guc_ids - 1,
> +				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>  	if (unlikely(ret < 0))
>  		return ret;
>  
> @@ -2183,8 +2182,8 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>  							   + 1));
>  		} else {
>  			--guc->submission_state.guc_ids_in_use;
> -			ida_simple_remove(&guc->submission_state.guc_ids,
> -					  ce->guc_id.id);
> +			ida_free(&guc->submission_state.guc_ids,
> +				 ce->guc_id.id);
>  		}
>  		clr_ctx_id_mapping(guc, ce->guc_id.id);
>  		set_context_guc_id_invalid(ce);
> -- 
> 2.43.0
> 
