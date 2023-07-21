Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058E675D3FE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 21:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8D10E6F6;
	Fri, 21 Jul 2023 19:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3078C10E6F6;
 Fri, 21 Jul 2023 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689966993; x=1721502993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zJOXHbnaEEkQOSpPlmpZEdWukegI35a7OY3lf49wSZk=;
 b=eerjPIwwH12ZMDo7NbxzGN5H3ChRz80XL11XL/aR5BWz1Jn13u5olHO4
 KraZACBQOebjff127ZrE157aNuOVlJSzhom/YgSyLRp3fD2t1uDKoWq6p
 x/AOmNnJIFRnuz6Q/gwl11L1fMMLEIY1a4ZgHyT/f4hfqYShbH+judWka
 B4Kj9qnDcmyIqg0QKmwJMfTVvGkI7Fyu+r6+8vxpzi4j2HWJQwNcWazNg
 BPZ5zphR9FWai1S/Rm7I4IsBu6pWMt8rBFcvHT/UHBNsZZsK/SU7lFF+C
 IrTYZ3/9mxplUQXfCrqyiD5dRbxqgsZaqJAwiNOb171afC757FreDq7/2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351985004"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351985004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 12:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="702135702"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="702135702"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 21 Jul 2023 12:16:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 12:16:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 12:16:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 12:16:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 12:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aITxlKznh5FefhPUQBH/+vsA0TF9L+WUBCCkodLFluqtZ3NbAQLsl+/S36hzWEeuiaC3X9QcbTFy+/qXMJZpZUDJ1ENc3UTPoTx9svtTs4ygY80oPB9lCUpltGJMZR2XTy9a32PR22wuYGqX8NxaBIsrS+ZXDprMQI8G6Ttxzwb+KqDWmNS40O9AUJPNELg355/TrdhUpSMdve6rtB8O+ZSviGrFKshwe5qdX6pCVLIqp9ePzZ7FBs5w2kpjO1P6S8CHYMD07KfMEM1FQ8p72xTDHUlgqfV5ypDAdf716ag25lL9qJeHZydnEunFj6CdaKVYgAAf02qxMJt6hb6Bdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HdfaWSgS7eqXhJPtlHLR8kmolZpGVpMiUuCqmsLH+c=;
 b=Ssb1sPswjkY775hedzcq8gweug16Sn1JAl5dQ9EWtc8UZfuNE1He1L91yLbD2kVXn6s8rJ9dlgZo0zjN2N5NoeR1/FZaP22A9XlUGbPFITogDWzv6I8ElvQJwfpVt3e/ERcYf4MhhQYw70oJJRSrvNXK95ElMwdlQLre8uTttScFUeJTi5Gri4FCUCTZVumaKTHn6p2+ja6OaKzpE/OeBI9wZ/DrD2/QcHEdg1xu6qPbPX9qdJ+mG+PKP9ZJTvu/50xj8oQoIK92Z/TDbGOnJub43zu5vRyWOYAit530DxD91oFgG39x01DjA1i7YxDKXYs/1qYW6meF2tQgdMT67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 19:16:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 19:16:23 +0000
Date: Fri, 21 Jul 2023 12:16:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v8 5/9] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Message-ID: <20230721191620.GC138014@mdroper-desk1.amr.corp.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-6-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230721161514.818895-6-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a2964c-ac55-4e71-860b-08db8a1ef908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s61W4uQqKVGRHtjLFA+/3a3ltReHdEjmbEVJWY9/OMaf5r+1gFHT7CfmvDn1SE51nrqxGsfBYincHFMZ0e9j8ksEN3zkFjsKLdJwjvH7qP2QnAApgs9iRYr0oQAaB7nUjycU6NU1NjbfTGjAKwtJUR5wGm+KfKHJK81mBJw7+FqeabSuyPyU3EPwEGMxsgURKvcQPURZBsillz81jrDmMrdgVdkxjWPfFb2vig2DzTnvsrf1mr7taos8/n3WK3fK0teZo9h5c6McNbKjC5jJG3iViD/STWDv55gsk0LXHg1mBqUSLewYRWb45WrtJiehYQ8LvYF6skYs/EWMFebvEwRj7dmzAlIKAQGPR5sN2HBYQif5NexFRavyWzo+fmCgIcHpJG9XxKQvECzAIVwd4ecdsDJ7Fv60LsU4y38x8bUG9rKVwnKdusezBniYkwmqq2pYNHXjPu1JwkzUTO5LUFIA7zgsE5CrejqY7+8KYMiwi8vbEtV+d+V3UruWlYPEgc/U1J32UOIO3mhlg2vPAyrBB7Nqvl3wEULX+ZxZQn8q/5EGJQTQbzn/oVQfy8B1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(2906002)(83380400001)(82960400001)(33656002)(86362001)(38100700002)(4326008)(6916009)(66476007)(66556008)(66946007)(1076003)(186003)(26005)(6506007)(41300700001)(316002)(478600001)(6486002)(6512007)(54906003)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?st4rmYHy/YWTSeVuQZfFhhtnmw3pPnbkfsFbLYpVmaqljDxmDFiFLL4EMm2C?=
 =?us-ascii?Q?FNELLvWIYfiRE8c59TIBg47DialwzIHhYpyf/XM/Bdla7fKxMK1gGZVwXF7P?=
 =?us-ascii?Q?S4NcifmXou1RpVyjgNx+fgTjXNUymcqJgEbV28gNCz0gpbgaOYGGD+RQfLLg?=
 =?us-ascii?Q?4GtAN53qhkznG5fckCQtuEYKNmPJ67z08VyHS6t0jaPTJtaR7/0P2aGVRHHg?=
 =?us-ascii?Q?koAYkq4ND0a2kPXviTG8Uivw4OcEpGvT7sScoJEFocS/ySon94CScK8FaOBL?=
 =?us-ascii?Q?ukIavbqBYVP3dBcceQZEVF38ENToEd5w0loHZZNAeUQKrXNI4QzBReNcn8Wm?=
 =?us-ascii?Q?Tz3/JtKE6UH5Yc8NY0K0JJYt0KfqFGoNrYWoCIcRUlw0U2usOn3NoNBbnz3h?=
 =?us-ascii?Q?xpBeSJCvdB74i4cnsz1JwPRPAwfzmE2NSJAtDF1Zc33YsA5rtvvBZLGR2KyX?=
 =?us-ascii?Q?gwW7H0LekYtgMqhFsk0EQDBn2QLiuvSQl4ddaGaW4QYAJc5AmRiTaspbvQuj?=
 =?us-ascii?Q?QrN0BDHjEzxdfP6qPcOk/ALJ6vXnhsHbOXWoi5hAxlUfZMZPvyFZTjPx7nyE?=
 =?us-ascii?Q?mAQeTvjmaaiR8R6SDqgyPgTdiyNtPTQASfxiRlDddD7uVEU3URc0yc5ooyOd?=
 =?us-ascii?Q?QzzIYGWBmFApkiOF49Ax0jlAzoOZgEMbiJPkhiI1Oj2oesHcKWk7IIztpa6/?=
 =?us-ascii?Q?wUT6UzAEciP8uTVu/I+c95H74HTNtfq/a/oS2su+i9QXbZJc33ZDneDGFqQw?=
 =?us-ascii?Q?iBJR+1GpstOqir8ABeBlsjVpvWLjYNJKdPTKxG/rH0/YRPjmz02pASXqEpts?=
 =?us-ascii?Q?uhTTQ12OAwfQvGXNA0Obp17H43yuYqsy0gL4/inCieOkXGQI9XJaS8WfEUpr?=
 =?us-ascii?Q?zYZfUmlOO4tFieBy3MzK0ejre0fd9BP+UDMTYHydlmt7qoTFOzLm/JMfFmeP?=
 =?us-ascii?Q?I4HkENfitn92GPibLBKx6ue8pqgcDpb7f7yYb/f3E3N+YXFVY6K/JVbejQKX?=
 =?us-ascii?Q?6BbDteUp0XAIDXOI/M4clJFBiHgT1Mcrqhap8iP+vZKn2+jG2E9EY4G829qT?=
 =?us-ascii?Q?Re66zY1dzgG2vW8UBHwTEeWUJe9v9X+RaWAWAaK6kYUHFzy8F/0WB1QUgXgH?=
 =?us-ascii?Q?ecK6aVk0DPobkcfrQYPkMphGFEWu+Tf11DriBSS9xyIoUaM9k/TG9qM90nfT?=
 =?us-ascii?Q?YZi+eZmeBhgjLX7C8+rmRekxmEyEcEOPzICR37seCQ0MErcVcuYkKCmTaU6O?=
 =?us-ascii?Q?z0Df+63oYIv6Q6zaeMxTVwywd6K7/qv9EuIBj31SVKt9pKJzY5K+WY91wmBb?=
 =?us-ascii?Q?aptKsX6eTBUy5rWH+RbFuiX882E6PAhTxYrp2ShL54syb4lvYVaMIXKjhR4C?=
 =?us-ascii?Q?pwwPKPgA6PPYYU6aLvNlqgshZUytvGw01q3VXNA8xBgFfBtEnApldt7Ynyx/?=
 =?us-ascii?Q?h2luwpaDtCOWwKtsqL0bmJE+QAkSYCIEWMNdf6QbXfqTD84Z8slIltynDeOs?=
 =?us-ascii?Q?UCPHgM5Wm28Dp0wbYcug3AA7s6+1FStPb/zLGDHa0Jp0v4sqfDBcOIvRMBi6?=
 =?us-ascii?Q?AyjBTETh5AkTx/Xobj3B2d8CCEM14v8QiGrIuzB4QyqGFDcopMawf4SLQzuK?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a2964c-ac55-4e71-860b-08db8a1ef908
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 19:16:23.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLLqzCuuLuXFPIxy1R4nVvU4558xbnYu0e/UtjyOSYqX42014IStXvoxJXRS/wjNCufVLtXWNWj1hJNvByoczdji+bYgI0YezMkp65Cg6uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-stable <stable@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 06:15:10PM +0200, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 7 +++++++
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 5d2175e918dd2..139a7e69f5c4d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -230,6 +230,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  
> +		/*
> +		 * When required, in MTL and beyond platforms we
> +		 * need to set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>  		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>  		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>  		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>  #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>  #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
