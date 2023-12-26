Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD281E8A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 18:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57AB10E0A5;
	Tue, 26 Dec 2023 17:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEB410E0A5;
 Tue, 26 Dec 2023 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703610360; x=1735146360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JtrrakCDNEqVuFAHcCdUOkXQg5JtVD+b82M6ItkmJFE=;
 b=keCi71XJFlFddCUximhcIzTyj3ZLYYxMvlALk7/Ew0qxffGKpKhXv75X
 nPcpmcinRykvPADePGY9XZ4f8AocP9GWGYLjtobYiWnlUvv1QsnNXjVa7
 xQBUXHPSCTSfG5EeekfTSN5V3tiPlnzzlRFsoxuFl+swhGkRhVM7R86Xz
 Z6R7K/lGPbwQsWfx4v0z5VJ0VPAgNRK6GQFpUO6gD8YhyePCAlrRnLYTT
 dOSc5sifcsGKnY/ATEYrtb1bgpMforoTxTLj0KTMv7WOR0VqOPsiMnnPI
 On3UfgH8f2c8gRYEjI5PB1GcxUtfxWureWuLoSwmlXZuhKJhVyFVkM+zg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="15038402"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="15038402"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Dec 2023 09:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="727789899"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; d="scan'208";a="727789899"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Dec 2023 09:05:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 09:05:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Dec 2023 09:05:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Dec 2023 09:05:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3NG0z4xXH+E/DZmD4+NvLoPF4Rg4teJSNHx+vsz9fH43ZWVGrmAqV2PoebRSLGhj1fwiLhCiztO3kT4pBaUU1svHS28qduCKoOGDdqx3zcEDOBVlnsMt2ZwTbm4yKoKPX7YSUysMHSwtBi4hSHUZpW+TV/3ozP+jV6GYI0/WaC0kdFP8MsXY1frgS13lR7W+hnqWMBL8H8KnHcZcAr7zT6YVDPNegQ9MqkOo4ErSS9XxGWmsfZe2cuI2euOaZPoWWAVzrXj8x6clQA+/IoIFz5f5D4hgiqneMXlT/zTVpXhMkZEdZ1wJ68fBmxiCF0AzMBj4AKtQlvwz7aeD4rSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymcBqirUl6nh7KurOPNjYfAZbtNBakgFu2iL+J4Pifo=;
 b=fM6qjZGocd2K1bSNLxE3qCns3fDZRh/IGKOvcbPJZG4jsTFwXtfDVFBRIYDB362Q3yoHw6D3PWEizHCpU72sPGtEUdXKjU0hT89b+Sf7/mdLM80wlUmUq3lVHa/aA136Wzd50ewUebL17SCEGFtomhD6vtYpWz6BRE0bM9NpSf8Op6n9JJjQMxjMl36qc0wpPJcn7EV6I1akGcEbomQszRozGl4r20uSG+C5nyQCS6vP/gKIGE0F9vIShCIDwJYgfeDiKaPApUtw/VcYoO/2uavfelnswwW79IKO5jvKyjXx5HwGPHPzfsaB+9Hkn1TLequ9BIHRB/lApYhsSDQhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 17:05:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 17:05:56 +0000
Date: Tue, 26 Dec 2023 12:05:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 4/4] drm/i915/perf: reconcile Excess struct member
 kernel-doc warnings
Message-ID: <ZYsH757tT6sdSjDI@intel.com>
References: <20231221032029.30942-1-rdunlap@infradead.org>
 <20231221032029.30942-4-rdunlap@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231221032029.30942-4-rdunlap@infradead.org>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f5ae2c-fb94-4b01-c8b0-08dc0634ec3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvW/l/NpiE97NFjK01ktvAyAQ35IjUlCYFsVlYm/frUuSM8Y4djjnt6fgTJORbDEOhxgcVPiB/FCc/vOZgLH+pvT88tgngOikaTjfMDrcI3nvzaEdzKAJtAilUxPTgQ0j6HYAfgXik2pwL2lkC47moMFr1Z5wmZ0rtcTyOS/5+l+fwz+2PJagzNfdKpeETvkNVaBfijNj00CRVNxifd/Q+5wwLLWJGxTBO2R0Nf2Qqk3hetZ1l6/5QPtdaPF2cvQXwC4WzdGMLGORuBGJHJ/WiL/eoXvTCmXAx3kwpZDNztY3mzj7lvfgPITEKnMAAcUD63lnnvS6jkSXLiUiq1zNAUxLWlowPV7vre+ruj94L8rkrlKnNdnofEqECkkDHHjy5+8WS/FaMVvyfC7/s0iiYBnERddhvjumsmpQawcoE0OYXbn45iEzq8zyZpqNAh7g947LybuodcHGu3b5dD5QF9ky+o02MiDMwXnabE0g4wauYR2DnVGQrcVT0wsZr1SpvMc2x7Uo+vgLv1R+6ambDvFlelqoCDxoT7iGaFehpCIXXa2rYloJMk9BNQttNjzJKbaEBkNYg1X5cEx2LtwCkCRAJW1BeB7X7S+jxDeFF0Piv28BRBEW+GmVZNq//Q6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(396003)(376002)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6506007)(26005)(2616005)(6666004)(6512007)(83380400001)(5660300002)(44832011)(4326008)(8676002)(6486002)(41300700001)(2906002)(8936002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(86362001)(36756003)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMdy5sGhpzE2LyRdwS1hzBS0nfw8l+2A7L2lbmqJuwekEz19ZPgOnGH94Gxg?=
 =?us-ascii?Q?ifsmvj1uMpfP/eQx5j4Ycq99yB01Duo1+OVBI+mD+KpDFIVFV8ht7NJUyn/+?=
 =?us-ascii?Q?HgZ0eSAaiA7KYNhJNyqW0Ov3acGl+L5vO/zOtFFkH6saVWn97jYwRPc66aaU?=
 =?us-ascii?Q?RxPk9g5iObz9QcfCnlLbkyjjtOXzps4ODMz+5gIyzHB/svEb5Dc2kTI+o6SP?=
 =?us-ascii?Q?3VYfMADESnAsiBhiuNBSXN//gH9k9uqiByx08FVKSuUrex3K7R8PSWcM0xq4?=
 =?us-ascii?Q?i6saafBjwhPQHPyb5K17sEU1Y+KlOGkdAPYMoibBO1CJmIlL6exx+RAbe/tE?=
 =?us-ascii?Q?p/4QnIIJIvdJtqSLfCih39R8eqAQXOyMD85FJNt8g4Zz+ONevW2FKH8bjjOg?=
 =?us-ascii?Q?Zi+X3JBA/7pAtRhvarit2fKF2FJ/o9KHgH9kqaiuvKHwYAbXQq/Vr467FbrP?=
 =?us-ascii?Q?WBbjQMJhkfpF9BatQm9fQxavHwThU2CSL8agFMqBBZTM7AeOCkKid57L0qdE?=
 =?us-ascii?Q?i89nZq07GklKU+dmayBR3TvQOdl/OFrOyrTFkwugkJ1h/QsOrLrcETrX/UrP?=
 =?us-ascii?Q?r45lnylv6CHqIYYz1QscYBSxHey/sqSkTGURj5K45bx44xEsBR7dTe+hKjuo?=
 =?us-ascii?Q?S8OJ+DXoXjbj4Bd2UPOMimT/bhTrmwlt98oYTDIdmsDggUvfybUTL2BndVVy?=
 =?us-ascii?Q?xYznd90mGKyFOyI31MY+kFfnvoz5R7KQOdKvofhZxOWvgYCFT0yQaeOcqow+?=
 =?us-ascii?Q?rL1/1+EDiiB0RoR8uNImkRyULas6+qyQuVrfEet4Bx7Ef2TNBXwuq2LL+umk?=
 =?us-ascii?Q?EHdX22MpIGcpE1Wp/jhvMEoBxh45w4LRKhaoVGfFNsG6915GSBrM+4MoEQrg?=
 =?us-ascii?Q?2hDir3oEAw5llbAXC23rwwwx6wbg8ThzxUgi2PzZuXZZvBvaksRTj5ZBKbuV?=
 =?us-ascii?Q?u6eWlyWSnS47GhSzDmN+QkRibD+Ljb0YHW8w7aUeNktl/1IxWmJo4ZPbpV2O?=
 =?us-ascii?Q?q4G564vRrarNNg2Ij1aiz3IWZ50rfrKvCaA8osAzOytcBH1NHZMzqmePIysL?=
 =?us-ascii?Q?XWLq83dPCsWvj74gmto0t0JCJ3MvIzUt7VC+CACVHNCoXzOU+iqly/h3gKpI?=
 =?us-ascii?Q?Y5M932Rjao+QVJbKE3VsclMMw+mOS9YK2rfS8r++EXPWuY+Jl4osm9Ch0DMA?=
 =?us-ascii?Q?+see15eMd6F99p/baV+PpqDu0Q9wOKd3sxJbCDFvIBfhMKALOCGZrSN7/meg?=
 =?us-ascii?Q?WFulnZS0uSrKyi4EBuyIRBs0lRGRdWd4b9g812x/6zsPUtlmS6/onsmZVgdj?=
 =?us-ascii?Q?uyoOxA/RgMf8EAtnS9MDEfXCn83I5R9+6oU9H11r/LvfFF1cyjpBtUBG4lhw?=
 =?us-ascii?Q?aSTvSk82RmNmgov2cvQdftA4OSYLi1cWIQm5vcZzjcFKlTuq7sk4bppJsdA8?=
 =?us-ascii?Q?0b+PePHVS+xBrAlmqsRmOh4SkB37MspQ1XPO9hC+Z+rhoRO+5jym7t1Q7klt?=
 =?us-ascii?Q?805z3siF2FH0LYJvpRe4eZZvQccYfky/SspCxGftKil/drwwC2/Jz8BMWcDI?=
 =?us-ascii?Q?m4IHzVzAbFMiy1NSyjJCn2wZnR0O3eE1MDXd+vWm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f5ae2c-fb94-4b01-c8b0-08dc0634ec3e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 17:05:55.3791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx9kqowg7nI0yFLB+WUduft5cqJApC77fA3cTjsNNBp++aGUfzYr+bTDhgMYzXszKG/UhhhwYFKtNKCsanjDlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 07:20:29PM -0800, Randy Dunlap wrote:
> Document nested struct members with full names as described in
> Documentation/doc-guide/kernel-doc.rst.
> 
> i915_perf_types.h:341: warning: Excess struct member 'ptr_lock' description in 'i915_perf_stream'
> i915_perf_types.h:341: warning: Excess struct member 'head' description in 'i915_perf_stream'
> i915_perf_types.h:341: warning: Excess struct member 'tail' description in 'i915_perf_stream'
> 3 warnings as Errors
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org


for the series:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I'm afraid patchwork was down when you sent this out.
Could you please rebase and resend? Just to ensure
our CI doesn't complain and then we push it.

Thanks,
Rodrigo.

> ---
>  drivers/gpu/drm/i915/i915_perf_types.h |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff -- a/drivers/gpu/drm/i915/i915_perf_types.h b/drivers/gpu/drm/i915/i915_perf_types.h
> --- a/drivers/gpu/drm/i915/i915_perf_types.h
> +++ b/drivers/gpu/drm/i915/i915_perf_types.h
> @@ -291,7 +291,8 @@ struct i915_perf_stream {
>  		int size_exponent;
>  
>  		/**
> -		 * @ptr_lock: Locks reads and writes to all head/tail state
> +		 * @oa_buffer.ptr_lock: Locks reads and writes to all
> +		 * head/tail state
>  		 *
>  		 * Consider: the head and tail pointer state needs to be read
>  		 * consistently from a hrtimer callback (atomic context) and
> @@ -313,7 +314,8 @@ struct i915_perf_stream {
>  		spinlock_t ptr_lock;
>  
>  		/**
> -		 * @head: Although we can always read back the head pointer register,
> +		 * @oa_buffer.head: Although we can always read back
> +		 * the head pointer register,
>  		 * we prefer to avoid trusting the HW state, just to avoid any
>  		 * risk that some hardware condition could * somehow bump the
>  		 * head pointer unpredictably and cause us to forward the wrong
> @@ -322,7 +324,8 @@ struct i915_perf_stream {
>  		u32 head;
>  
>  		/**
> -		 * @tail: The last verified tail that can be read by userspace.
> +		 * @oa_buffer.tail: The last verified tail that can be
> +		 * read by userspace.
>  		 */
>  		u32 tail;
>  	} oa_buffer;
