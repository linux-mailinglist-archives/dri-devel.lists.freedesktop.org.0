Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4D5B7BF0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1512A10E41A;
	Tue, 13 Sep 2022 20:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18DA10E455;
 Tue, 13 Sep 2022 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663099410; x=1694635410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2TOFI+GyMG2zv36qp+qKRMDYYLfiCfiwDeOcDBJTsls=;
 b=NRF4JcGmpEgxErZbh1QGssZiyUfo0qsYFLKhauzOV5OKcXifbIU8b9kO
 n4XFVymCqZQdyXED8aAh5lWNoK0oW6TFECZ2zUdQHMIP1VbJUPyGIaQTU
 lq47q22PPCU3vWHvFTYlozY2T76pw7DkcXyLWQMLN2rkTNjL3vdpBERDv
 RBTkJJiMUuitYAdi6+y4kcIuhnAaF/Sz9HrtiyAUH6I1j7nBCPZ58kTER
 QW4gClqZTlOutCn/uIuWn8+DxvwVZsXwPqK/Te5dDhc8/aQGUg/Ed1M7F
 e/MYnwONJlrEnzVzZEi5SoXd1Zoj3lGOmW9pNjHMERYU6wPoe9jj5zxBB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299579087"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="299579087"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 13:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="647077658"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 13 Sep 2022 13:03:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 13:03:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 13:03:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 13:03:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 13:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0fUPcLej5KsiDivEcamkbawyWO92XnopClyDzWRTpOmmjW/DmJVj0tbkMaR3ar06Ojs5XqBz9i8LNMIPG5SY1ZlSTL9IALFkhC1Q1RyTK+ygl6UbPjylnyzCjnfDb983txN4Luyoc8vzcRqmL2Q+f/GRsNukr0B1gRwolV7Xk1/u9k/4Y0y0LxW77fTxjC0MoUCuUB2EYHRxoS5NZS63yhGBbnRZhgQzugy/kzIKizYC+BkUDzka89fXjR19HOp1g5uUTywIosRxirR4kP3shk5n56iu7ki2ge2g9HcoWfsycdsemysa/5cDrtZmp9NYMU50RcZrwY8GloBdNAUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1I62B1POx8ZO3EwqU1c6s3oBRmMC18IlJ3vcNCIZXA=;
 b=girXly2Ez9VGVfeE33e3Kx24YGz2M6al5222gn6ouC3oJWhXRgWqHrgvJSeDw07Z/3ENvht09tT6oBk2hcDMbGGY8S2KStdZSbztHdgcn12c3NxgaWULjXmWk3LLLNgCTzjk8teLEIStCjowsOyI2LIcTZWXbz7QIZ/v2slNeNC/3nQbVBiolOK/y09gjFH3bu6sQAIkM8DK5m31STw9MaM5Ahy9E++epxh47aCP1a6cFdduH3fsGW7jC+Yr6KjH56t7+ecWnE6yPPH7e+dEnExyFy5BE2901AtF/Y/Y3F2WBwT8uGmf8D16wQcdw0u4DeFzxLYf/j6SBBIRGZKZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 20:03:22 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5612.022; Tue, 13 Sep
 2022 20:03:22 +0000
Date: Tue, 13 Sep 2022 13:03:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 3/5] drm/i915/mtl: Define engine context layouts
Message-ID: <YyDiB6gDVIX2awAV@mdroper-desk1.amr.corp.intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
 <20220913183341.908028-4-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220913183341.908028-4-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|DM4PR11MB5533:EE_
X-MS-Office365-Filtering-Correlation-Id: b2997a44-1fbd-453a-60d6-08da95c3029a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuc4ZPIKBtvZV7UH2dM4NDt+qFshVukuKe9LZnzRgrUPh7aru0XF3cUlPJzbJFYuhlCGoiQitwu6iZ9vA8ZbZO9EoVncCr7p9H19MZG7QZo/KG762HuWEHokj0ppvhyHKdGk5fmO+BJey9i+2GiBD56YKfJki929VYWsCYy/20FIJiOpDtbhWLCXh1ZL9Y405/h4YHkb2Zs8eCkDsiOyI+ZC6PIDVhw74IAiGvuP0fyMacIC0+tHd/5R6DzPOdrNrnLvyB+mSnzYKV9X8+YMGl73hJh9CPgft3QXxrqIhEyyh1RNBeVqEJYdmkTMa0MnQvmY3J27OlWl5AJtJ1BqxIETXE4Nr3L24Wjf2cP/Rsyg8sLI2hzrb22JAi4DMi1Lmh9ke/ati9c9ui9TmRDmXRUv5a09DYC92DQoEu9WUamLnpCXilrTNXLWZ5DkG6Swmr5raRnuvwChvSLUSjIdFBt/OpR+foQxSObJCZ5OMDu2B6ODLHsGVqisloj7YJddH6d/4Euf/g4m5U/xpewYqXwC+G5TjF1xvG5FpVo1Kq3Mwj5g9iTL/uN5dEEYvueRzTQ3d9dYLIobqzYiiU5h8BX3eFgGIcFN1V8ldQOH2zp2E/GoL0xhrEcQ/NWPMF84r/CKwA+30FZuZ78OfQ93EL3+2wPmhJ73YjbeBeaiXGmoIgzb2/AEILc0ehAwAPyuUZN6BVJFFvpR+oTlOr619Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(6486002)(66946007)(450100002)(6512007)(6666004)(2906002)(316002)(478600001)(8936002)(82960400001)(5660300002)(6506007)(4326008)(6636002)(6862004)(41300700001)(66476007)(83380400001)(26005)(8676002)(186003)(86362001)(38100700002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLkkDIsy50EWcB3tAmorjTADBCr7ZkTUVx30p0k17iAHdA+Pn7mzw125CyZW?=
 =?us-ascii?Q?Pv+Tvi/rWZr+sQqFhmpR9iHSl4/ptaMjYHNE+dFZyxJb6qUOKtCjweEivBfv?=
 =?us-ascii?Q?9dkaGWjMlqfaDUzLtxLda0DdNRdPTeBvpLLow6MBAkXO6MQGAC+TAep6MDr7?=
 =?us-ascii?Q?m2WV47YuMewCU6DrKtdPcieNXwkeMm7YkyhViqTipgAu5y2pgCkF0uVEUiBW?=
 =?us-ascii?Q?7bdoS2f+hRdSqIgBthwXPs5Rg5V/XmWkcOnVZ8CLn1jGzl+9VEEeLE3ERXFQ?=
 =?us-ascii?Q?qCKEEIbKtdq1tpVNiqElfAUNzxMplNHkr9xkEbq8sMqgqiUG/h8myVGpLtU1?=
 =?us-ascii?Q?o30KmnvuYM09aMxcX4A267rSTQEolY8KNJvJU5AAzxF4tI3MT59nMb5XLvgT?=
 =?us-ascii?Q?Z+v3p5WakF869u5M+mQ85y3NDZW53rXsDidPF6Tiw4PFcitZChutMeTcSRgN?=
 =?us-ascii?Q?KGivjvKOU0XorSj6r32wxz/Ew9VN2T1ddkKA//uDcYVvP+B/VuYlcS02xhoB?=
 =?us-ascii?Q?CDXPd+mFCBW8kmBfNEPzkVitTYc8OecGc8cIAtOzm1S7n0EjGBvtu6R5YOqn?=
 =?us-ascii?Q?kOui/pWvH7mEF5bgd/X9kdTAEh1Q5xLe8QlRbiPqSqWUUB36cDhqrHOVfk8a?=
 =?us-ascii?Q?DgI7zA2WEUJMX7bf2hSVATVI66smNWtcBTVWUUOfrdITkjEDkeJ+dxhnCWa6?=
 =?us-ascii?Q?hmq4NwzF8Jha5PNUJdbXatr2VMGbmxQeKLZMyXgtx3XpROQ3y5ZHcDKuSqlG?=
 =?us-ascii?Q?1smY6TnQtJWV0SQpFLuWoeXx2mGa9Tf0dhgFOzfiWTNk02qcFWC4wEsdUXP5?=
 =?us-ascii?Q?gxTiS8fSInuysRtS5x+RAmA58wQagLNJYKHFHAGPD9d0oMzkC3HyC6DlBkbd?=
 =?us-ascii?Q?u8qdBWUOlld18cA47vMA0GLZw1zl10PtSFhOxbIvNOIHW4e3LLQI7SRvuZH8?=
 =?us-ascii?Q?R0rPm59EC2h9WBCRX86OJLRAVh5yLFxQo5xQZ3aPPZoZ6+KL1AeLtQrNIXY6?=
 =?us-ascii?Q?h7wM4iHlpPmiGE3pH+6Fb/LC7PNEo13E0aBAiFYyuIsWz08nKZiCURP9Bi7W?=
 =?us-ascii?Q?c3iquvclQJDam71X70VyfakDpVzSPantn1iVosz6ROgB+DjCgrboqhCoxUD9?=
 =?us-ascii?Q?xTpj09Pb6//T4uV/fh3pkRfHsSVgeyl4HiF/pJQIdyqrAmhNKyUurPSuE2KI?=
 =?us-ascii?Q?KysdEjMq9xRpgv1ZRNZbEDwTtQ5gfC5ge9tfB9cIOvVQ22LBxpzo4U0rr8Hr?=
 =?us-ascii?Q?w8wz8VotZmuczwg04bcU9/U3RKsovVlj2QePLB4q9hi0hiRp6Pu4ylKu2Sw3?=
 =?us-ascii?Q?hvPpnZkzAAVu4pJ8tQ68SHcDv80d9GKMLf8QE3R2NSFIJHChlQkQfT9VgfPc?=
 =?us-ascii?Q?+bhmpDwg4D9Hzzc/vg6OoP9ec4fSEPpoqdR08xR6p3XVbRYKm9TzX4EC6HsC?=
 =?us-ascii?Q?nVLPYGNSBqLWS94cmvutCWCBEce3biZuVWu21usK3deQFFTe9D5kjXOei+3k?=
 =?us-ascii?Q?XaHqrhdgIVfwAcPGS+kQJca5TinOvuNyAH70m46ZfooGRWQIk0f5t7iT3Kfp?=
 =?us-ascii?Q?7DI/ZBq+q9CugDUjqFcdg0tsUTIqP42zfW8TKgSOWgORCoWK8ipEJBqdpWue?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2997a44-1fbd-453a-60d6-08da95c3029a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 20:03:22.2898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEzeL26zJA66S4AOnIFlDGmKsWaMES7iiskcWN1K1E3vlVKiRnAwat8VEzaVN9GyX8Pqo6eZ5iNwz6HG49gzQoEGj0Kyg15qvSCtRnrv5B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5533
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

On Tue, Sep 13, 2022 at 11:33:39AM -0700, Radhakrishna Sripada wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The part of the media and blitter engine contexts that we care about for
> setting up an initial state are the same on MTL as they were on DG2
> (and PVC), so we need to update the driver conditions to re-use the DG2
> context table.
> 
> For render/compute engines, the part of the context images are nearly
> the same, although the layout had a very slight change --- one POSH
> register was removed and the placement of some LRI/noops adjusted
> slightly to compensate.
> 
> v2:
>  - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
>  - Drop unused registers in mtl rcs offsets.(Bala)
>  - Add missing nop in xcs offsets(Bala)
> v3:
>  - Fix the spacing for nop in xcs offset(MattR)
> 
> Bspec: 46261, 46260, 45585
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 82 ++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 08214683e130..8fe6aa01c7bd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -264,6 +264,39 @@ static const u8 dg2_xcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_xcs_offsets[] = {
> +	NOP(1),
> +	LRI(13, POSTED),
> +	REG16(0x244),
> +	REG(0x034),
> +	REG(0x030),
> +	REG(0x038),
> +	REG(0x03c),
> +	REG(0x168),
> +	REG(0x140),
> +	REG(0x110),
> +	REG(0x1c0),
> +	REG(0x1c4),
> +	REG(0x1c8),
> +	REG(0x180),
> +	REG16(0x2b4),
> +	NOP(4),
> +
> +	NOP(1),
> +	LRI(9, POSTED),
> +	REG16(0x3a8),
> +	REG16(0x28c),
> +	REG16(0x288),
> +	REG16(0x284),
> +	REG16(0x280),
> +	REG16(0x27c),
> +	REG16(0x278),
> +	REG16(0x274),
> +	REG16(0x270),
> +
> +	END
> +};
> +
>  static const u8 gen8_rcs_offsets[] = {
>  	NOP(1),
>  	LRI(14, POSTED),
> @@ -606,6 +639,47 @@ static const u8 dg2_rcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_rcs_offsets[] = {
> +       NOP(1),
> +       LRI(13, POSTED),
> +       REG16(0x244),
> +       REG(0x034),
> +       REG(0x030),
> +       REG(0x038),
> +       REG(0x03c),
> +       REG(0x168),
> +       REG(0x140),
> +       REG(0x110),
> +       REG(0x1c0),
> +       REG(0x1c4),
> +       REG(0x1c8),
> +       REG(0x180),
> +       REG16(0x2b4),

The xcs looks correct now, but it looks like rcs still has a mistake
here.  We should have 0x120 and 0x124 listed here too.


Matt

> +
> +       NOP(1),
> +       LRI(9, POSTED),
> +       REG16(0x3a8),
> +       REG16(0x28c),
> +       REG16(0x288),
> +       REG16(0x284),
> +       REG16(0x280),
> +       REG16(0x27c),
> +       REG16(0x278),
> +       REG16(0x274),
> +       REG16(0x270),
> +
> +       NOP(2),
> +       LRI(2, POSTED),
> +       REG16(0x5a8),
> +       REG16(0x5ac),
> +
> +       NOP(6),
> +       LRI(1, 0),
> +       REG(0x0c8),
> +
> +       END
> +};
> +
>  #undef END
>  #undef REG16
>  #undef REG
> @@ -624,7 +698,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
>  		   !intel_engine_has_relative_mmio(engine));
>  
>  	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
> -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> +			return mtl_rcs_offsets;
> +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>  			return dg2_rcs_offsets;
>  		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
>  			return xehp_rcs_offsets;
> @@ -637,7 +713,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
>  		else
>  			return gen8_rcs_offsets;
>  	} else {
> -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> +			return mtl_xcs_offsets;
> +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>  			return dg2_xcs_offsets;
>  		else if (GRAPHICS_VER(engine->i915) >= 12)
>  			return gen12_xcs_offsets;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
