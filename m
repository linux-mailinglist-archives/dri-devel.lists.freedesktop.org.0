Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0596E35F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 21:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EF810E940;
	Thu,  5 Sep 2024 19:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPuIT82j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314B10E93D;
 Thu,  5 Sep 2024 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725565459; x=1757101459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K+nnR9vOQx8S+FyXniZGWymA21ewCHd7ZFwkvRGi2Ks=;
 b=VPuIT82jMs3AKs7+d7V/KKzO6atvGRryD2HD/spSZhOkKHMvobl70PqY
 bHJYIafzXf/Bdl3jVpC9INnUEmQjumGJLb9Tkbjui5jBcZfvBYpJ+8b+6
 /9TtigzBKNqn69VGZqNLq8ezH1U2IaWfBMp/LTWc0/ba0HrZy6oz06GkO
 r0GG7QfgsRW8zDsYla5n5NjnnK+QAWi1bEe2fYLkUI4M9SGlZHCpP5ohP
 T3Gp6nvuWW/xy/T3DvN4VEZBKWfcRCp54w5FLxJ0iS7aoi5IC390BvEoY
 mhsAPcON9Bfw+aBXW28qo7nHNRWFJX9thxd06gWWUYcSMOMh6oDbifX1M g==;
X-CSE-ConnectionGUID: XKE88fTGSraJ89vdH+6Syw==
X-CSE-MsgGUID: vg5kW3elSTG+4Jn2+iAecw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="13394377"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="13394377"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 12:44:19 -0700
X-CSE-ConnectionGUID: uiS45rV9T0GN/vg8tklhpg==
X-CSE-MsgGUID: /AgY3bFwSXq5AHvkaNRx2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70656712"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 12:44:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:44:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 12:44:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 12:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0ccFG+aqZCu44+yh1O1tXEbfwdiZMlHVZGYPjt5o5/E6+yYJL65sAnWuJ4RlpNwIbZCfGraneLCDQd977amXUOLYML2jcFExT/dfOza0WOKQOT9IVw4ODZWks9MHx53jO1jbzEpK9hsiEdBDmotsjv3Ne/OPaC1ds1B8y+q9+AYTtltWoIegNwNIA72FY+iBN3BcHSeZeQgoEGbTpS0Qn4nBsE7PPpTiWpUX8hWT8BqUh+xYWl8D8QTBFEWOX4tUQe3sOwtoFoQmOpRlb2N8xyhjExhhW7jxsKDTXWyv7XqpuGNnc3KzrdnpC9GU8bad26bf1aymazUpkc0vznpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcHAGtB76dIz9QZt/nFlvUi8rq11w7eyZCZ3sM7qK3g=;
 b=qAahuUMFjIoJeIAsEghkp6wsNOHSUUJqt0UnVArsFUQ+bK5tDQovD9lZ+fHY2w5fcJpGz1xaMG57G9yoiT2bTo1Cd7MA50cRlxe9IKo/EPcsPj/i8Tca20ZQpxvPB+v/rMqHjW3VR1PcemLH4m6ZynmtxICIN0/G5SkgaPyVvcuRl/xMuujuibNtCuTXJ90Kr9B9h4+HB7fxUsDWt2r7fpIzCxCa3x/nPx33QsWXzQi8ENWxgFZN2MC0wCDTxvySkRRLlj27m513/IY2v6MdNCNqMWvn5+pg8yViR6007P16K0MlLM4Q02X34UIkUPcLl7EaGE8NxpF9wF0EC3YrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 19:44:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 19:44:11 +0000
Date: Thu, 5 Sep 2024 15:44:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH -next] drm/i915: Remove extra unlikely helper
Message-ID: <ZtoKBhhPgZLbrz_y@intel.com>
References: <20240831094655.4153520-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240831094655.4153520-1-lihongbo22@huawei.com>
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 96cb8d49-afa5-462c-0f6e-08dccde31ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5tiQ9fFt2+jMGjxdYxGJQaeLKVKMx6Y04L+0s4g9O2Cr3sfBzeK4zONYiV/t?=
 =?us-ascii?Q?NG1zDUVfA8UhWSFFfBDXRakLIl3TRFLFXblVPDC7k2RmSWAj1va8pKOL/y3e?=
 =?us-ascii?Q?T2Z640P5dbfYxAUg+vobge81MN+sXZUNyYKm++rzsHPn4+JDe9VA2P9xPLxY?=
 =?us-ascii?Q?Tmk/dOT9l8X+l7QSsWAvg29RGB8IIMZ+uLNNWXNf/soZdPP+pUFGfj/1jqd0?=
 =?us-ascii?Q?oht+v49RDad599IAgRimDKHdhJmdhytUDL1ImL/2vcWa1Eyp4HNzRdlM7WQP?=
 =?us-ascii?Q?gIZC7mGT78B4ALFZUqj9fN/XokaaUWZKwGOz0Le9v4jvvZ9oFHZ83gMxPiHR?=
 =?us-ascii?Q?gxpcUBJObJ6gQHgg7AVpdF/KZc/UJ1RsOd3MYtMht3Azafn65q54lmNHIESK?=
 =?us-ascii?Q?Q1cHYlwCv2y96Cb5da8pubJOWngOa6WVxYeZzKCd8LwIDaEFaPnjQenOay68?=
 =?us-ascii?Q?dXOm0zzQF7EE+RySk1dMOhdgrRYXx2txE1/OW0dPBWYtsty9fEq9koVaV0J9?=
 =?us-ascii?Q?Y1ZhgqrmFTag4ZhLYA35rDQNUrrslsJF4fXLhFNqE41RYK8xxgue2nsiojQF?=
 =?us-ascii?Q?Oqdayx6hGxVFvQ+IAytIhSnCJKvS3vSs22yweRj4HrArUR8IORcBWAw9ZKB4?=
 =?us-ascii?Q?y5/A/CMDLOMJxyjFv7DeO2yKJoKZblkOEPr1Hl+NWpOhuDqLSksOfBBkILyL?=
 =?us-ascii?Q?ZA9LxwaXrSTO6cZrgGvWvT7I2St6Zan7WF+gXj2gm6PGBVV+78OVum13tdSU?=
 =?us-ascii?Q?aWnuV6PMkcuOBuuji6RrxgWeMZQQwHZCXYrofCM5x/7YPUHnt0glsC2aCapM?=
 =?us-ascii?Q?jHRLRLlN57cXZP3Rtmg4Becnm/DJDITMrMF3E+5QT08pV/ZsiL70yw+7Vdyg?=
 =?us-ascii?Q?WY6uz+fNYiYUZ6ZHMdVR80odyxpDdMiaWcWAEyhawrp+OI3jmug6G5F6tt3h?=
 =?us-ascii?Q?ApCHnpH6vOq7LP/wi9TbAuPKFuJB+BpeHsD4YhodyQ6VmsUVQxxfVHzFkSNk?=
 =?us-ascii?Q?YLolQ24EumfXoh8tAWygWhQd8zWZuKQVfXCqZjcHNj5hvB1tJf8YltNtooqH?=
 =?us-ascii?Q?Cu4Y7kklelNWsqpoZ4OEbs47WEl5DGQKGyeAFZGQf+b9XmsKEXZ6f8LpbBmc?=
 =?us-ascii?Q?ihrdYbD6Vkh1avp7Xrot+f6C4Ocq4Dl6yPrp2I1UtWuJQC01ZVsC7nXhwxLt?=
 =?us-ascii?Q?tspfGtnVn2POJwKYd2tQqI0OhlmpTAnwL3shMz8RpHRZOhkBX7AJCD2Z+KWN?=
 =?us-ascii?Q?uBQLKrRPsFAVvM//2JawlFH8TV27bkBJldH8uSwie7aqZMd0DvyFbOeCxMFD?=
 =?us-ascii?Q?obwo9fVEAPEA1QPjCr+1FvXSmVg15/fLVOLqefTxeLb3kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmKB6cnDbGsV0nIH9MkQQmfe0m8qHVNMWEUxZvleavMPSDqei4Ie2/x4u+ef?=
 =?us-ascii?Q?w30kCYHqCxPUXrpHAAv/snEL2FVzFbU9MOwhSK9juuv9Pqxkn453My3W6bDG?=
 =?us-ascii?Q?5X/Sfei4JuMCJzjZiWIN+4u8Uft7liDYcL84qX7ss1TOHyhKVKkDVvYZffWT?=
 =?us-ascii?Q?RHcEDmYrHvZfoCbBK3EgaZygzPK+zGgrrZfkCPO/CmWGTIb95sV0vrcpOSEI?=
 =?us-ascii?Q?Z+5am0Jpf6g9kuUEHwL2Ook2M7086pv6i/9pic7BnUJg46Yv8qqzarWY4kfT?=
 =?us-ascii?Q?eYWm8h0xL3ne9eUal8w5aFzheZulSaoTbt/npX3lt+bLgRStPjwT0bv953tw?=
 =?us-ascii?Q?C59ngRyQlN/oYx6qMssJB+QS1NuKZsySmhD7uX6bmgMfJDNBMcAckVeZxJpg?=
 =?us-ascii?Q?otrgdwSETH/3cXxVz1tdfvTHT+3QROuOnmzuS+EbGUSijWYs//2ghSu2xEC0?=
 =?us-ascii?Q?bF7H9roIopH4yr38IJ/nkLgE2LwEr781jzwcfBMnB3C28f64fWGSPysgMO4H?=
 =?us-ascii?Q?o+Wigr4HileRjcF+iyapp+KClybiITuFsE5L9JBx3xXrIBn+xWADZY0BHlUR?=
 =?us-ascii?Q?4JnIhohVoEbHqtGvOHsHTBAsfKHu9qf+w0/0ROFifU/pho/+pu38kLtxQ/Xj?=
 =?us-ascii?Q?MgPq0tGKOTiPC4NfXvwwwuYjhzObqSoHFx201NFNaMCk/r3LqPcpXLqkAIs3?=
 =?us-ascii?Q?HpCSze5vAXF4/ZCkw6AXdr0XQeGczqqe59+aVy0iQv/TIrObEw/jfE7o+2Rd?=
 =?us-ascii?Q?rbSpK49+jyLbuz/haGN3oH5t8DhFOlneS6eJ/FHBU988sxNIX5UQtRI9BVOe?=
 =?us-ascii?Q?+cuUvYNhs/vKXYh/avFOOd1PA376lkKwe+lgtat7/xVbiC2jkQJgd6fN/Xk1?=
 =?us-ascii?Q?V+/Nnt5M8QbDaJccVXoorpvStORlrMGIfFPd8Y+laM4PhnkiVwEhC9Vbespb?=
 =?us-ascii?Q?Z0sqRaqf+Vg4Dwv+nkJ7BvixrwbGTGPQ/eJhaQxJrB/Gxq5lr+kULQxcPwN9?=
 =?us-ascii?Q?aBf6iML+fzcXlyLr7/+L/gzFeRuPcjkp/kTwnEVv7LoVkyTuY5MXN4nsCu0H?=
 =?us-ascii?Q?HXlId4FgqTS/GL7dWEgiOAOgk6xz4djd+H23zBCBj4WqiIYP+FQayntyaPbl?=
 =?us-ascii?Q?c23yWqfqp/+lOqy0lMcfsYxxGW8Qh18BtuHdTfKT9MdMJKSH7AniSBefutXe?=
 =?us-ascii?Q?+TgEtzc9twsmwkTsrhZT4J4pBf8MKxkMjpei722HVl5uCRsr9M7J3Is4ELpW?=
 =?us-ascii?Q?WRJLa0pyo7242r9XJH/heTFrehno4y5AYonWU41jysrDrmAC+ZjkxpNnFpMu?=
 =?us-ascii?Q?KQS+ZyPRDaQHkQHmUBTttSoFFb0lrQUfENcyj44X2bqFR9Vx+/LPgjr5cfsj?=
 =?us-ascii?Q?brBHSiXtoi3GdKuJBKKXNFmsuidKK6b7gR2ElCQwvPNebrmNXetLmIOyKu+L?=
 =?us-ascii?Q?nw/tzmBdmohfewEGYjIOgTrUxOgqBQDboX1Lau6PMH6I9aJwD1To7laaPxHH?=
 =?us-ascii?Q?3K0Rv0TEP0fBd2rdVp3jUNzU7/0J5m+VkVYEaHHBXBuOdQOZGJ96hNTdBDtt?=
 =?us-ascii?Q?eNBwKnA2UD3obArlEB9e9rzNQko4aOtu2NFgu4LslPkg+m/ruJVTjueJ5kb0?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cb8d49-afa5-462c-0f6e-08dccde31ced
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:44:11.0483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6btM7hK6ezIX6Ugmq9MZuQSGq5DEVHNHMxOYp7dEc8lPpu6MGnU41xLiGxqEc06DvP7iUUvB5otgoW0FyGD8xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

On Sat, Aug 31, 2024 at 05:46:55PM +0800, Hongbo Li wrote:
> In IS_ERR, the unlikely is used for the input parameter,
> so these is no need to use it again outside.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing now...

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 01b7587dd1f8..a3b83cfe1726 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -825,7 +825,7 @@ static int eb_select_context(struct i915_execbuffer *eb)
>  	struct i915_gem_context *ctx;
>  
>  	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->rsvd1);
> -	if (unlikely(IS_ERR(ctx)))
> +	if (IS_ERR(ctx))
>  		return PTR_ERR(ctx);
>  
>  	eb->gem_context = ctx;
> -- 
> 2.34.1
> 
