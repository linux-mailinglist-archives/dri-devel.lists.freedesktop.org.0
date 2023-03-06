Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0136AD2B9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 00:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CC310E23B;
	Mon,  6 Mar 2023 23:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30E610E012;
 Mon,  6 Mar 2023 23:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678144588; x=1709680588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IJPf7JTjZpGjPmqh8QniLWjlJW2EDlpfmVD0M0rv9rk=;
 b=lyvxFuQ7HfqUcGm6B8YxAYRdcxobXZzAaRxDC1gK3nw8iuVPSo09bm4M
 v0kx0QKbjonAU1+Z1cUirfH2uypDtFpTOmnzCuljLAompxmB1yiLTIuPg
 XcrMg7NRW1x0h0zunZekUBRyadQy4dMHBO4CkRWqEsEosSoB216jg3sa+
 aEiNZJQP/eBEMy6DNC8eDYx9p83Ge9FEi3Jbz4fGWAqYhEfmTkRMe9S0t
 qwjltxiGWmXofhTJVy/+AjuAeD2Soju8utvfmkrXyTpVEUdnloBnMjq6R
 e4KJqF1NQZ2OHjiQ24y6M4FlTF3iQUzh2amK6jH4YMypBMJNjWdqP/7YC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316105688"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="316105688"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 15:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653755249"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="653755249"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 15:16:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 15:16:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 15:16:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 15:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzZc3phdEbJK95x64X4YC0TtgJGY3r8He5yHnzi76mo7kLwu1p3Ko5P84HOXY5L/FEdxtJ56AJb45QfDfHxa9HkbAYbwdpB1r66MdSwr+2P6USMvx8pSn7glRA6J1hxMGzqP73DdqaNLEXi6j/R2aTxdxY6VjtAZ0fvLhYdL5VGMHAOlUA4n8zf577KnyH5l82E+90KuUojI8IGcNgO79wl6LVNG4IfNpt0fVnh6uSZz0870Ed9zohM7nnziIf/hEqCRW3pDDk8bknAGc8w2pFL2RGk0BUaXY12Sm+zZDZUDGB1P/3/h3JMFS5TyJhLlaZ06is47BbaFvQbTnXe3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KkjXZvpaG1EZshQ0VKrRdM8twq2wtggIRmrsKe5GSM=;
 b=d7eW0pkUOBamqzNGuolTaSfyBtVswtun14zzMP7lbdaMog0h/hO1SgYW1aguLJRYzFqDvBthuipv63qerG38Yxmte4lx0mAOi44yJo2qshl19/IXjzxs+E+fWUR/51HLrESEY390NDhJMSzV4ja2rXXvrdYM8k90NR8h+2AiT7uRq+Pw5z/20P7Wz/oanxTWXx/sd3sOCKFyrg8UCWNbQbtonjIDa0OzDlVuuoOLxncwEnLJaKZOxt6fnZCF+IdFOfCNcvskGfXd8OEDQJM7sQidWNmIS8X9DsHGvuWjmCoTQDZ79g8i9C462jx7F30c+1XQr3Qb4yGgPs70VMy2pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 23:16:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 23:16:18 +0000
Date: Mon, 6 Mar 2023 15:16:14 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Move DG2 tuning to the right
 function
Message-ID: <20230306231614.GJ1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
 <20230306204954.753739-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230306204954.753739-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 9292826e-f61c-4475-b7a4-08db1e98ca1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JBfvt79gWqGjAHm3XrBdLpxxs50UmfUGv0yjpqtU+bGZzYd4TqZtp0oQiVCk4gmsqGQhAgZLdRoS9/thssyLj8PTiKkzR68Kdz7I8hFmMrqQv5EZj+9KqZz38CTOxcGcVkrqooqGCTTFsmp/2ZoDpu1Cf2VAPnmlz6RkRCvLLbBvE52A18xx3GPr2atY90IBTDgVoLj4jSX9RnyVA4GbjqctHPohDSvYzz8T8Ylsv89tDlF5UmdoP/8j2k0/9q0fs3crPcXd4Qw7V71vV3211gcxmQ+SQd90wGdknJ937VpzYNoKYPrDPVB50Du7fIcpLnzFLdtI22rSxRhsWiBtZhM9z9suFqw8gwcdm0vLLA9v9ktjg++37364HWupKpNePdsHjQ2Itht2kTRjcD0oFBxSMudwAPMW7tRsrr3P7/OZSvzFvC5oP6BHn4WgBt/A0PzsirVYEDpoPc3wdqGcHPhRAJ7areiS9dObPV7956tGzU/yrDWrpCyqga1iwNlxVndR2YcyDE76Woi8jU6C4OkxuSqW58Q/iY2Ur2VU1HGPzhsZWV1Ck3E2MhnyPbvEQRuC7VmeCPuUa4aD1QPgLt4KiFw0HmVAKY4D44YJcYp2x55GsIoG/jj2B08dyrThU5LQ7bUt9SYJqGA4/lEMjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(450100002)(6666004)(66946007)(66556008)(8676002)(6506007)(6512007)(1076003)(186003)(26005)(316002)(4326008)(66476007)(82960400001)(86362001)(38100700002)(33656002)(5660300002)(83380400001)(41300700001)(8936002)(6862004)(6636002)(6486002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sG6T71wmFzdxtZukOM2u9NIffhfHT1pV3EiUwr9CLdQl+guD28Y5bT/gzVa1?=
 =?us-ascii?Q?hbc2tcnthOkz2CYtP2jUfqEkMmsLl+2PZWlYadWE0xIef9sluCaDrJaIHmod?=
 =?us-ascii?Q?gLVN+nh0tA9vQCDfXzExOLU9Qg1M2DiqMwn1tyMCjeQuzmmzJ2vi/X9jYZEE?=
 =?us-ascii?Q?HwQPNLbGXcu+oDPnhgJqvi9c0Tv7Ii/V9v+VhZC6lAH6VMNt0rZE/z3svLNC?=
 =?us-ascii?Q?71PP3bkbZ9EPXuX23pClak+oq0oRvDZ2lmZe/fVT1+EB5LPLT2qKQkNUex7m?=
 =?us-ascii?Q?A81RONeRep1NuIXt9MV8cRFm2vPeybLIbdcQ9iOZupQbj5sAWFuB5u8vRUCv?=
 =?us-ascii?Q?pDBoQ09PKOKS1tfa+pkNWocKs78mmv9Kf6UN9BykYEyTarrMt6jz4Q0SpQjG?=
 =?us-ascii?Q?c0O+1Ynd77O+RHIbQSpGAD5tZ0iY8Zasq/QxQEfAyl9f9kF7ZZFJ/wL1Rzrt?=
 =?us-ascii?Q?i9+ccWf5oqAyVZ/PolJ4ZBboCcdz4ZSyi5yqIqzpkvVT0AD8iuC4AVt1HU+n?=
 =?us-ascii?Q?unrJZiYZJsI0jRoIxHZ0HQEquWA76GiXj64z9q5X0xpaDTURZBkYt2AeSG5B?=
 =?us-ascii?Q?/ABZjPxLPCePGcdowE3jg3j6i9hNWD4KfCZlm6y0AVdUu7CnLQ+D8WFQc+R+?=
 =?us-ascii?Q?FjeOAq7BrCJzFQaVjJO+rggbfu8L7jIDrBJuhr6TCIVLq9fPF9RXgcxblM1r?=
 =?us-ascii?Q?e9v55iAYsHu5Hgds/4ZkcsNRFN+uY40/0dIiq+cJklhW8Sz8FH69yXm8WmtR?=
 =?us-ascii?Q?xnuCkMevGM8NqGVEqAX9JZWcrdaNC9B28bjW9nyiHHAU87+7eqqsGC+iSSvI?=
 =?us-ascii?Q?VI6XFhlKbfvJbrlZpQIms7n7twt1fRhW5yp1nYCbHnsyb5kZjvW/E88LBVwS?=
 =?us-ascii?Q?BtRyI0hm4vln+grrqyv44WRZiWXgmT6XDCN0SPkprxKgGWR1ZHh/nCT7r/B1?=
 =?us-ascii?Q?0HxnXgaypRAfuHA++hcWviForK5dS2YMw7QZ7GfTN0bnnGjeYX0y3ASz6naI?=
 =?us-ascii?Q?1yQ3uiVnBpnNEp5Uu221+SqKNvIFpG5nROHEIkyBm7OSwpL1DnCNmWjT5SEF?=
 =?us-ascii?Q?RzkLcaiRVTGFjP4I2vy6iJC37/Z41+0x1t1+KiSs8CcxZXR/ejM1dgIvyMT0?=
 =?us-ascii?Q?02TZOEbddg0hvGZsQCeq7o4O5gtqCHj9UKIAafcUunMF4tR9kN3OpOdCi6HQ?=
 =?us-ascii?Q?QAkkeY8hKemuyd6gggE0wPZwsJwDr1GFye04pRj5h5DdKzPXTFZWDBpcMzKr?=
 =?us-ascii?Q?ZWPvhPt2JrW8Fx7nkM6wSDyDsxxSXnvUK1uzt7e1/2d+jIfkQZ0reiFy1S17?=
 =?us-ascii?Q?Mq7tqq9riQQzRfeHDNomVzXUHTZD4ztf7gskqBBcbi4hZkmAY/5XwXw1uZy2?=
 =?us-ascii?Q?2FI1UcjXf2FwkURxnYaQZyCw2iW7OYEec6iEdAL87Vzh4P4/aXbi+zJnbn7o?=
 =?us-ascii?Q?guay2ztQknY7uWi6no9abDxh8SzbKi8cNS9WzzwyFig3x9u3z3Dfc+sLZRF6?=
 =?us-ascii?Q?uLpxtUnNzPnJeXoOTQOVa0Ify+Bqji1+4t3kZ/VwPsYuz1OMvr2eqAkf7hYI?=
 =?us-ascii?Q?SX82AtvuCoy+fkQqeG2j+dzrTpCaRFyB5RjOIkkzKU2NS2cJt8Pq1uTUF1vK?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9292826e-f61c-4475-b7a4-08db1e98ca1b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 23:16:17.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j8DXgZIKnXM5hkIsUAUC68RuQ6npKbXtjeVhwSnqlQx3vpNG2pwE+xbkZ0PXfZO0VOUlEMx4re6DPd8/KwiactTh93Zd5SrM3flpo9dDOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 12:49:53PM -0800, Lucas De Marchi wrote:
> Use gt_tuning_settings() for the recommended tunings rather than the one
> for workarounds.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index eb6cc4867d67..389bfcd299af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1653,13 +1653,6 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	/* Wa_14014830051:dg2 */
>  	wa_mcr_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
>  
> -	/*
> -	 * The following are not actually "workarounds" but rather
> -	 * recommended tuning settings documented in the bspec's
> -	 * performance guide section.
> -	 */
> -	wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
> -
>  	/* Wa_14015795083 */
>  	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  
> @@ -1752,8 +1745,10 @@ static void gt_tuning_settings(struct intel_gt *gt, struct i915_wa_list *wal)
>  		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
>  	}
>  
> -	if (IS_DG2(gt->i915))
> +	if (IS_DG2(gt->i915)) {
>  		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
> +		wa_mcr_write_or(wal, XEHP_SQCM, EN_32B_ACCESS);
> +	}
>  }
>  
>  static void
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
