Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5587850D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324C510EE6E;
	Mon, 11 Mar 2024 16:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtVZgK5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEC010EE4D;
 Mon, 11 Mar 2024 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710174209; x=1741710209;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l0ZWkv35zsdJBTlYv2yBve3KWK2YfUtn0sbWu+r3hRg=;
 b=gtVZgK5TqDAAi8Ass2DbMeQ0DvYRwsUSZtKiA2/Q+9v65DGIPBZlHGyL
 mowHbGJcmE4icA55c4CncofA07NKbErgWkVaqS2OOZ/8+zqXHYg2Ast94
 EpkngrVdJi4yf4ZtU3+JU5JaNPfB0woIyOPiKmcI5myEsI4R7l4bH3h/y
 sGFLSkfLmkL09GUUgQVkxIG9rpHeLPc1ZY0YH+phmoxSXAEjr6grdy/RL
 sXzUPaOKGhMVoiO9RqLdeerIjCkAOHoN/8Rr76G5/+/aGSdJ0Tx6q4XIq
 4y4P/Mv/bcteIi25AyDglIWQhs99BpOIrLQSOmgcDmbmOKy5CMy4lMFvM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5028719"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="5028719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11659868"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:21:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:21:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:21:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:21:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGqZ19fxyDKGsv9ULh/0MYSLom9aZk6FKyCvGscHttN7FJtQaoaZl1U1wWuHfk3CVmLp+hSkyBvG7NN82X8vRmX7tTVASPBpOzljiPeVDpTInUYoo5uxWR4vh2x8Xc26pKdAgy4Kn/u/WeopUerqgjMBf1Qz0KlWgA54y3XLtpwxBO6breFQvDvZxdnMqYHb9ReBtFgIKMEgWsphG1dX7d3/ZzVg/ISqtlE1ZqclsU+1DOZOr7TVcqN9dlXleehKHqEqhoVu+JO5iRZgl3f+XI5DiIXJbjggQn2y5nP8qnrq44zYpPD9ZXXrX27PlUK4mIju5hZo72xFRPMgqn9w6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQxCNkVza4qIIEdy1Ed3zOAFk6QDwinmmeih/omuexA=;
 b=gE1VBDan8Bw07zdoKYG3xtVuQADYw2kb+8YVXCAJE9wHdGv/a7Z6ktjQPQo8e6wdFUtDK6CG+pIr4BAvTyW/VxQsgRNWWLaz+M+kWC4sTa89enRcLdlHc+vxy5R4ovwcb2rcN683nYogKN+jNeQJwHhSf7krVMeQENVCakoZUgSgTRgSxlX2SDFFwXfw4kwDghxkZrI+fRUO3cvsEtgk0ICRs0ocAfgcB6Jga/eEVkdCKdcsMf973V4mCaFeRYt4eNg7RDFjRVmxBHcqZtDMSjQCzz//L8yyP2anWcSWteLJNRetv7v6Hn2jRD1t9GuK1dHhv6FYnFIZKlKT0qj3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 16:21:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:21:46 +0000
Date: Mon, 11 Mar 2024 12:21:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/i915: Update IP_VER(12, 50)
Message-ID: <Ze8vlyiDbfJa-ZY0@intel.com>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-4-lucas.demarchi@intel.com>
 <Ze8gq_k3HeVqzo4N@intel.com>
 <zlewmyn7wl4rxsuaukyoqwgkvfnhwzv3zy6klelxiqu3pcxwap@tafrxqb3seqo>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zlewmyn7wl4rxsuaukyoqwgkvfnhwzv3zy6klelxiqu3pcxwap@tafrxqb3seqo>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbd55dc-99d0-4d98-05d8-08dc41e758f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XE4+skBV87e8W9O9otnwSrz/aOdpUjW9plBF0eqFH4wdJUmsbKUnt8eddADItrn9m7Btttd6YsNv86YJ9aht9mnBS8aJ3juTjJ6ZwKHjTqNCH3GVbOPrDjM8DbAp+kA0tJOzsl1Zwv8l3p6hOxB0NmAFO8eFn/9o6M+xYzBncTBI3zJAggTegqAIE1saDeIF8iU6okMyS69J7n5y1avl6LzOmXpX1pXmsbq86/oSCW/hNJAJaM5szgBY3O+cFqge/4ifvh029PVE2gC1QY/qQQwxokHFJWf+wBHwEp3Wui3Xsk1JE58b8k+g2E9apbOz48/z72bKFhPyQdJDpPYviaEpsz61FGP4ERZtr8ylFqhnDb16qXqAZBoDKXuwA6kugcKWUrMRnGTMM7PhGRrojRYwOHRRTt3EMBg5jMhFySHiQuMTUCxwvWe9yek2EuoWZFC9k3BV5NTMvwlAn7/18Q7021DzS8jrlZ0CspiK/B2YGswULL0zqvgrM8r/3y3aKdr/zYcj+S07H7vkqmwkKUvJROnSXl80a3S6VdzBeeAxf8YGpkmB25W54D4OzXvpROtNIGvRWu9sjXPMMR4lWigqm+N1bo3EOsBmwe1FfHhB1pmUsC+uxd7qnzgPADnD6Yd0w3/FFePhwDwxCkZBk4f2DUJ9ed6ecrVPhONao5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UF3ARxxRRmtqGIPR+joxe/8zGcqHubaGbMuaB+ak8DHCAE1zbLcKHg2Fwa46?=
 =?us-ascii?Q?Ag3jpIMrRxfD0SxCCi9awMQxVdtceIf6K9Tq5WiZdpYVxY0nzQFdapapnvPx?=
 =?us-ascii?Q?O1AIxL1g4LCNTzVSYGWTLrE/YhyoayV4iyuTikjRSMyfiEgu3sTAb+f7L/sk?=
 =?us-ascii?Q?TwKS+eG7icXgS2jjD39huoaQO6AXRvtTj+bHHrRUrhq1MLuD7xqCUSZebNu6?=
 =?us-ascii?Q?QfoAslikM/AMWi5f8oUhDKTLgiYROT6Gokkm/eQKd8OJc33DF7PRh+1YaRVM?=
 =?us-ascii?Q?nyQEAtM8VKLngV0Eeef6T858r7Lcx3F2nzRDJcYqu2SmVBSi6IOi/NO4jEoh?=
 =?us-ascii?Q?SDHPNf3A/xFmviBk4Zin0rJRzM2w7RmOkmkc5D/vLuy0G/nuCObQrD64Ffzw?=
 =?us-ascii?Q?Wud99SeSoXm7xzHm2NdYvby0WJW/VCI7sITF1sA5GATjNKOYXxG011zgLSxB?=
 =?us-ascii?Q?L2DFvNhFneh37NY2Zf+T7IEDF367O7gP389BVCv3e3wQa3h/m5Dc13tXUP2e?=
 =?us-ascii?Q?hN+I3tiisoZWnFAPJewBjIfz2PGQ43g5JmyOCuNyJTehrfQq1bc3RjhBudub?=
 =?us-ascii?Q?a8zINpEaydMafV0I3Od0G2WurDLO5LfVY4BLI0qTxpXhQqF59OZQuqL/9Vhm?=
 =?us-ascii?Q?LZru3JIs0B/TpJFFhrHIps5T9xzPzBPFT6adLDXFpgQBOi6QVxYw9/tdmNXL?=
 =?us-ascii?Q?KItbUZ7PNIDG8VQdySPK0h/wizdEDSbww2iIi5RoMXOqhv6AsEw+EpnOjw4G?=
 =?us-ascii?Q?Rsyd+UqV7fEobY6WYPM4ho3H1R92MR1vwMHhzE3J0INqvapTe7dI5mYDS+WL?=
 =?us-ascii?Q?wT7aZ3Ky0SdJ1EarMuqYgc3IRLdGPt8ViNXVanSX6kKRQkcxmwuG/8lnueA0?=
 =?us-ascii?Q?Pa5OPHSuXNGo2jAc2vSin8OvU7EfWWm/2d6WW+HlZytrG4FVaNZ8+YTCkQGE?=
 =?us-ascii?Q?lhJNsJ2tJf9FJe5eUMePSyavWG83hvHrWC+gbG5Oe/hw4lrPjRy/B0BWAqbv?=
 =?us-ascii?Q?5kNufk8Feb4Ov0xzVL8IDskcBb277s+rUPpMKRH5jsy/d5Owu2tni3XVL0oa?=
 =?us-ascii?Q?oFMaOKmx/RHUKx4ffgSxsqt4EB3oZj9lXS7l1SO1U81oGSY/h9AXuKeZsJV2?=
 =?us-ascii?Q?S1UltO0ph9HuardIGuWlMDmbtLl69fqPxTXOiHmMHOtw+pXWM4gwEEsN3SO/?=
 =?us-ascii?Q?4k2hpfABcjQWcF4rh8lTzlFEIBPLpTVPcF3T0akpuqE6e5y/abgMN52kEvh2?=
 =?us-ascii?Q?hNqefVrI4oCfFZ7BcYGrZl9MwiJrLWj1Uv1ffhWrHKu25oH8Kq6cauOpArXk?=
 =?us-ascii?Q?x8jFhWFNukLNQBEApI5kXNlqQGE3IzNICkDkTQF5/+XeofrDo4v33O1OaFkw?=
 =?us-ascii?Q?RUc/DbcDgn0IHw1wmK5kZkbSmpg1FjQk6PK/he1nuHFDieXEnxqDrbuhVzFz?=
 =?us-ascii?Q?G7pNwVXBMHuw1sJE6S96NCWDAar45y5PMpgZw4SA0lyBFwqc6VlQBPgl1hMA?=
 =?us-ascii?Q?TTKhFi8iQYrMjNEiPWfbS5Th70OINrtUMXYEYLp5+r1OOmf1GaJDvPr5xlgw?=
 =?us-ascii?Q?LDlUwdbeELWGVMrDnVCjB/o6ALzeNQfMcqX1kqAX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbd55dc-99d0-4d98-05d8-08dc41e758f1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:21:46.7776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlHxXPCjE4/VFG0cyP1qbX7mhgFX8XoyIZ2YzMwHx1G2P6FOYq4PRprrNi6q6lgQ3q2ZK4sb52C/7AssFgYxqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 11, 2024 at 10:29:45AM -0500, Lucas De Marchi wrote:
> On Mon, Mar 11, 2024 at 11:18:03AM -0400, Rodrigo Vivi wrote:
> > On Wed, Mar 06, 2024 at 11:36:41AM -0800, Lucas De Marchi wrote:
> > > With no platform declaring graphics/media IP_VER(12, 50),
> > 
> > this is not true.
> > We still have
> > 
> > #define XE_HPM_FEATURES \
> > 	.__runtime.media.ip.ver = 12, \
> >        .__runtime.media.ip.rel = 50
> 
> <snip>
> 
> > > -#define XE_HPM_FEATURES \
> > > -	.__runtime.media.ip.ver = 12, \
> > > -	.__runtime.media.ip.rel = 50
> > > -
> 
> ^ being removed here since all the users, like below, are overriding it.
> 
> > >  #define DG2_FEATURES \
> > >  	XE_HP_FEATURES, \
> > > -	XE_HPM_FEATURES, \
> > >  	DGFX_FEATURES, \
> > > +	.__runtime.graphics.ip.ver = 12, \
> > >  	.__runtime.graphics.ip.rel = 55, \
> > > +	.__runtime.media.ip.ver = 12, \
> > >  	.__runtime.media.ip.rel = 55, \
> 
> 				  ^^
> 
> After applying until this patch:
> 
> $ git grep -e "rel[[:space:]]*=" -- drivers/gpu/drm/i915/i915_pci.c
> drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 10,
> drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 55, \
> drivers/gpu/drm/i915/i915_pci.c:        .__runtime.media.ip.rel = 55, \
> drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 60,
> drivers/gpu/drm/i915/i915_pci.c:        .__runtime.media.ip.rel = 60,
> drivers/gpu/drm/i915/i915_pci.c:        .__runtime.graphics.ip.rel = 70,
> 
> should I reword anything in the commit message to make my intent
> clearer?

doh! sorry.. I read the first line of the commit message and stopped.

perhaps we could do that HPM removal in a separate patch before this one?

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on the final result, whatever you decide to split or to rephrase the msg.

> 
> thanks
> Lucas De Marchi
