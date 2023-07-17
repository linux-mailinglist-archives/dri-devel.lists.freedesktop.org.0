Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2124756B1C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0EB10E296;
	Mon, 17 Jul 2023 17:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FA010E296;
 Mon, 17 Jul 2023 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689616788; x=1721152788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1mmwB0lDnIOCwmR0rMczceIWxIiYKVjXCqjBPHTSo+4=;
 b=X7+NjDXha1RBGcBkwZMZ/AVcS8MBgzJEUpdOodsPU057Y30hIuF8sT7e
 fS8yao5SuxzShi94bWwf18lO3IWWnlkW/4S6GOkysKIhqhj+Qf/QIUjEm
 eEyjA0uKQqBFvcfZ1CM8LnRSnUVsu6U3X6ou4NrSdECHu1VtXpPiJVWXO
 g4TUOlAiS39ZuS/PjFMNEnNMeLwQFuWuWn0G6/KRoby1sEgYqiHfIBuD3
 2hZW5Sg6krgX00iDuxdT+CFIlW7c5JjgevYzk6mvmskkCeTo4C6R2YgEa
 9CALkK0JJUT2SQ7YWGCUvIAkbm7mECVJmoZymsXJG9IbVV5EpxyksTaOE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="346301420"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="346301420"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717319197"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="717319197"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 17 Jul 2023 10:59:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 10:59:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 10:59:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 10:59:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 10:59:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnYQTSL1h8lhdC03DhDauM8txDj+64NGKX1EoteQZYlySjaOKkjHWvXLHv7bmJoSFeHbZirycywnW/P0lzA6ZEXKlDHM7Dm9Dj4cRCptLUEf6o40ndFZcu2U+1caJ4zDlp8+EKKvicsFfXUoDN7MkWJbkjOT+h2daSkTT01IcI7fyfqXPKf3I2vPc4Xq6aUAjFUyX3flKAka+H2y00D8DwrohtJ1bvIzGevjLjRDZF2CWe3eF43OAFcHaT8PUji9c/2Wlk6bESPDtGxaRgDyAK1XwwM2JIdB+W8BeMu04FAuz92xL5mmV7iytpg8Swx/IULgAeu/jHeOevg5LXQ8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fCZNOrYp41mHLIZz2tZK4OE8zZvVfQnkqAqbYYH/as=;
 b=itWipwSS+wplLVNQVZ15WvMWTN09TYZ9JQw3X6q1kd6pL5C48z9otCsQtAJdNL3C7SG72ct5fs2EghD/KqLtUmuz3wE2C+TdFKTbc8THUn4epxY6y0mtgCF83kqIpzTlycaCD+ccbQyc+xTDOuFsx3ntz2I7M6aBQpmBb7a0OCnlaiUTUXJ0zXn+CHgdyu0irIiAKh6cR2wSq3NSExkNAjO3PIZlhXvIgXbupvvoVPSO7akwBZRJC/gdaAaaDlvf+loR7JTMgTJHt43bWK1Bsp7o5R+iZ0QdgqcN54cpBTS4CPkPlsvyCegg+ZwRMCG0E6PL/K66ZntDik4zeObDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 17:59:44 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 17:59:44 +0000
Date: Mon, 17 Jul 2023 10:59:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 3/6] drm/i915/gt: Rename flags with bit_group_X
 according to the datasheet
Message-ID: <20230717175941.GC138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717173059.422892-4-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cd050c-4de5-48cd-26f8-08db86ef9a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7w+ry66dgECj8ZtSVKfoxmz2wEkwYVDKm5hIyDcu4kcoKo5MDVfzD2movhkJnGcC/UzHJDRjUpWHPDT3767bm4WvvKsnjiK3YGQPUS5f8ykjEqKpUa5DXnPwAXfCb5ifEgFsj5jtwXFWnaLeOw/FAR9TJxwmRFvYeH/jrUBN4Xb6nbCpG7TrpljAo7mdGA5l/uB9OuJaD7Hrt27PBWlWd8noSzpOTEZuIz88ICc84wCoqmLeSDQwXPtRd8Dkfzp0TE5MJFWsw4py3BRtCTiw+sBRQTfTSLXGPS6dgaEDWOtJvCI/Q+tuOHm5hfGL8rV/j5CMQlMf5sY9eEMJNdXqudIMnIbbnpE9AeVIM4RDFbt8kp9Fi0GBi1CtziHQcIxkF238EjYQz2cqxx1uIk18LzW1Mu4gUjfqoi6M2bJQH99OrgXggQP/Lgtz3WdmDnaBubdUXcuPRec+sq4oLSghwUd4bWZX0QDJArEVF69OPl+96Z1fFKYfIsgtPb3wcd/sWPOoZR7rccGBxzH8/5Rxto7rRNyWSJ1Q/qtLhDG0XSXMkUOULvuTGjYeOAs4e/Sl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(2906002)(54906003)(478600001)(6666004)(6486002)(8676002)(4326008)(41300700001)(316002)(6916009)(66556008)(66476007)(8936002)(66946007)(82960400001)(83380400001)(38100700002)(6512007)(5660300002)(86362001)(33656002)(26005)(1076003)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H5RNfZi6wzqtS+DnNzO/QlhLayxBKTqJnnoqF9LG4c0OCgvpR0uKhywCz3Ff?=
 =?us-ascii?Q?Y7inaYUdAmLrTC60t+lnhX8YLFCrO0TOxraBSF2gOQq1URmmaSrNzI1ddjmC?=
 =?us-ascii?Q?A5CycAU1e6j33GZDWWIA1bIicT2l0tKPxIbKXGeei6eyht2wu6/TJiemZMfL?=
 =?us-ascii?Q?0RQGcoo7YespPfxbgnVNrzn93d3Ksm/l5u6f4EFGRS8SosHmojg78hqCfYOP?=
 =?us-ascii?Q?cKnJsJhi+eLPIpR45+ci4ViqtIqHMILQYb2uCb3Pern8XldCMEpQ1YuoSEYn?=
 =?us-ascii?Q?g+n5PGqF+TAtkYzFPzQGB37JnLPjCZooO8WOApNMLrK0vPRTMwA+yzY+5rQ3?=
 =?us-ascii?Q?op4zWzCYyyZkCE7EmcSmcBmTB2LCKNF0dO2MdCltPRPV+G51w1kBgfNMEcWz?=
 =?us-ascii?Q?3aosQXQenbrEN2Bcj2ii2Yqj0mA4pgrzU9mac7gd+291IwWMJtMdCJmeNr93?=
 =?us-ascii?Q?rwsx6xYxsT0g4djwYNaTsrpfIxQmw9aaQJKni40ZRvsOlJqokdifkeFmebx6?=
 =?us-ascii?Q?geLvSNBNEOkfmWTrNGTevGvBkEpHeqxGWrT3zQRQo0AApG0X9+7QREQ8P0sB?=
 =?us-ascii?Q?VVAzQcH3f72J6TSwajr/r2wW1ETbACf8K332sOgffP9rQ3RwBbzfIldolczW?=
 =?us-ascii?Q?7YdnI5xI/12fS9AR1C5jwlMZtfRhYwVyl8FLR1vBtgjy/Mf9l1K46dcVyfHV?=
 =?us-ascii?Q?jnn7h0Gq8egrDZw/eFR1wobZYAVUbd1CmgCwuQlsPk6MsZ/WRyk/yOw+IoJQ?=
 =?us-ascii?Q?HLNny5rj6oO+lxQDlFRy1Ko0jv/9nwsp8Lp1PClAP3lYZOe7irHE23YOGPEt?=
 =?us-ascii?Q?6YX/opVnzqEUNb1s3xctfmY0h1n5HV8Ah0dBurRZDDz4ihhpiFtH4CZ9LbxL?=
 =?us-ascii?Q?97LeeJjrhw3ylz0Qy5LFcjz8UUF0ty927S6ug9E2P+zNasFckXckX5ltiTFf?=
 =?us-ascii?Q?IX21NB/XfNLdFwHnxqhWp1PNIb3kzVWMVcDpSiMvBnSH+xXiv5HexU2R4ksV?=
 =?us-ascii?Q?SSV3mwAFHtW5qP5z7VbsRn+o/qvdTmFCpUXdYU7+XCuvaJ/uGiyXzPHAn3xW?=
 =?us-ascii?Q?+3ssOLeO4F+/vj8TSDhpbFD5hRY/yBwvxfSVLuWx1kykAYqD6gvrzmV4oSw+?=
 =?us-ascii?Q?vG0JGx1MNRBxN3uojLwujgB1sTC8stm9SiXUi7cMstQd5yPx4TnVv+rfj38a?=
 =?us-ascii?Q?vLhpaEF+Wf6DyMbyvuQqDEMw28teMuePQuBOyVUBD3+fcjAcgg9SQmctdFjA?=
 =?us-ascii?Q?1kb62jBcHwysZCnNdCQPQE2ewntmRiRlIjdNONGFiBvAxi3MAnztJRIttjjw?=
 =?us-ascii?Q?PFRTeabHkUR7HALOLVKXp8FuQxIb04JOIm/O20jmCpB0Qp8yG/kX7hU7xKPS?=
 =?us-ascii?Q?JzGatR+2B/KpRkY9CJNnyXgIJR6yYvInoQd3pMALgGKY6upLtlSVdNdNpIMK?=
 =?us-ascii?Q?xOw46WRmWNERjAhnVKA/+6YUbQiVmQKonJbLQg2B2jkzmN0gZEAKeggV46cw?=
 =?us-ascii?Q?CabtyADejkOrxgFQSNawrH4cixd5/DU6JEeTJvnoWgsz3i0y53Me155126YK?=
 =?us-ascii?Q?EWn+cuPAtfcUQi7+7v8sxy7H5z9yffzxoTOdFeG0IG0BPel3cfgo9wH8/Ae1?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cd050c-4de5-48cd-26f8-08db86ef9a42
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 17:59:44.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZqBE/6cyrmfU3xt4yvdDt0Cw+CLFyN+pH4KPusoFDem5jSmLAnoEXo9oMhIIArcass7cACL9di2ZMGgmATSsc4bc1M12A7JucASDjiI3qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 07:30:56PM +0200, Andi Shyti wrote:
> In preparation of the next patch allign with the datasheet (BSPEC

s/allign/align/

Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 47112) with the naming of the pipe control set of flag values.
> The variable "flags" in gen12_emit_flush_rcs() is applied as a
> set of flags called Bit Group 1.
> 
> Define also the Bit Group 0 as bit_group_0 where currently only
> PIPE_CONTROL0_HDC_PIPELINE_FLUSH bit is set.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 34 +++++++++++++-----------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index bee3b7dc595cf..3c935d6b68bf0 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -210,7 +210,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		mode |= EMIT_FLUSH;
>  
>  	if (mode & EMIT_FLUSH) {
> -		u32 flags = 0;
> +		u32 bit_group_0 = 0;
> +		u32 bit_group_1 = 0;
>  		int err;
>  		u32 *cs;
>  
> @@ -218,32 +219,33 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		if (err)
>  			return err;
>  
> -		flags |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> -		flags |= PIPE_CONTROL_FLUSH_L3;
> -		flags |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> -		flags |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
> +		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +
> +		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
> +		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
> +		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> +		bit_group_1 |= PIPE_CONTROL_DEPTH_CACHE_FLUSH;
>  		/* Wa_1409600907:tgl,adl-p */
> -		flags |= PIPE_CONTROL_DEPTH_STALL;
> -		flags |= PIPE_CONTROL_DC_FLUSH_ENABLE;
> -		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> +		bit_group_1 |= PIPE_CONTROL_DEPTH_STALL;
> +		bit_group_1 |= PIPE_CONTROL_DC_FLUSH_ENABLE;
> +		bit_group_1 |= PIPE_CONTROL_FLUSH_ENABLE;
>  
> -		flags |= PIPE_CONTROL_STORE_DATA_INDEX;
> -		flags |= PIPE_CONTROL_QW_WRITE;
> +		bit_group_1 |= PIPE_CONTROL_STORE_DATA_INDEX;
> +		bit_group_1 |= PIPE_CONTROL_QW_WRITE;
>  
> -		flags |= PIPE_CONTROL_CS_STALL;
> +		bit_group_1 |= PIPE_CONTROL_CS_STALL;
>  
>  		if (!HAS_3D_PIPELINE(engine->i915))
> -			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +			bit_group_1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>  		else if (engine->class == COMPUTE_CLASS)
> -			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  		cs = intel_ring_begin(rq, 6);
>  		if (IS_ERR(cs))
>  			return PTR_ERR(cs);
>  
> -		cs = gen12_emit_pipe_control(cs,
> -					     PIPE_CONTROL0_HDC_PIPELINE_FLUSH,
> -					     flags, LRC_PPHWSP_SCRATCH_ADDR);
> +		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
> +					     LRC_PPHWSP_SCRATCH_ADDR);
>  		intel_ring_advance(rq, cs);
>  	}
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
