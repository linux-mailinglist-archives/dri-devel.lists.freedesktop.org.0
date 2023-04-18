Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70996E58AD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 07:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1613810E041;
	Tue, 18 Apr 2023 05:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A18410E041
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681796359; x=1713332359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G/juK7tVF+wMOv+mhRmkRntW8+4Cjn26LSpgm7qlaBY=;
 b=Z+qzK6a5HJRn2pJVg7cREe+EBbD9I8LLvzqG1H1YBHF8q69G7P56lIRV
 583dbRCcSW9HLXh2PnZzOB3sPCFlYe0Ha+PQ7b7KJCGeG2lFBuKsFIlDL
 mDngC+xkKSNUWlte/9XK+lrdph0JdIpjd2tZoQFMvHpRGnSau0CmTx368
 15Rj9+C/im1EZ+gNvm0KCCW+qiZp2Q1iZS2SWUoxDOmC6EU1ZCJtXSopY
 dRGx0Rwv1Yk+v0dSoxdKrDXRVuZ37qhFG76MN603387VushPNcnnmu5Lr
 6eTU1IuzPmI/gYAqBUTEu0DsQIB3jeRdOUyif4MuaYaMCN+YvaT+X9w1N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347829819"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="347829819"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 22:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="937115105"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="937115105"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 22:39:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 22:39:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 22:39:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 22:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deBVbIDXD1Qgr2KjPtq+PFGMjryJ9bHbIpnlb1UVPpWQ9VMLNFhTmn/aiiDT3TBUH/CWbqTgU4EonCaYA2eaa0pnHd+QwfV/hX86VHUh4FOsqNLxcxF3wtFePVfC9epoMeDdnZe2yy9MjPAtDE46Je560uUZ8tbI3J6EX0eL++ciGXgdGxuaEqcrYy3tL11FF55gezU7/1iRmORNbgH2/E6v07Utibe8LecrfgjliDRa9G1QTfw5HebCMgWDiPza7ZJaF0S76hVC+2rTFpFKHmV0pggmPBPxqeNT1MgxPWgHKbNw4PHiUuZsomioe4m4HwpecTPGF05EBOqTgQzrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yp+1MctwVDE/OWh01s0zXhs7gNTq4aUPoWiyrbkonw=;
 b=EoiQ9ex6V2skNtZ2RHCWvOMpoyKq746OjjGpAHDGViYppdIjGzgLBsUQYBqcksI9OmhL/R21lLe4PAXbGDqV08X1yc5d1chL9IyU6d0pY0p0slyoCeANeWweQXyFcPAJiy40suhJYcP61OP4UA26D6SqZxw7g5AWZWQ4ZhqQlQ98UAduvf9OkOKTNUt+971PzNvHvlIu3U+MAR3Dj5JvOhB7YFIs1BIlwocwwVCWwzEewhFQS4+R7+cP0L4HaYz1VC9NaEXD4W7m6UdPKLaGdcinaVwqQARt0Pg+cSHo4f24d0F0UNA7ZGQEX7N9FxT275Jy67h/mN6sx6J+NBwANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 05:38:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 05:38:56 +0000
Date: Tue, 18 Apr 2023 01:38:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/docs: Fix usage stats typos
Message-ID: <ZD4s6/6hUlA2UXgU@intel.com>
References: <20230417200657.447606-1-robdclark@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230417200657.447606-1-robdclark@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0207.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: a1dac454-4b9e-4839-2fa5-08db3fcf33b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMM+ZuG4UfFtR4V5GJYY2ZRNRAj+Cbhr7eE3fG++t75Mx7kld91cOQK9uCN+FtxYdNNF0+hgMcuqr8AovYeAZ4XV2oMn/PkRhOQrXpR6fznpKdI0lTFQlcz38hpMX6xVqMYzC0RtdcU7Jfm3FjsUWHewU/qX7rl+wwczgp0MqKDh54BwHhQWSERV29mOeffxrp+7/n3ERfSCCm5luNe9zxUTfrRMI58jUjQfzVnzSXBLf0xgbiWeB26CZBXsT3+ttuHypJcLLJPXN89z5DlxN+RBd1JbEWedqKfV9vdRaKH16jxApBZ0UxnBCBLekOQxOtVSTGbw7u1FhSFLH6qJzLF0Y11ihDW/hPlZcLd+kV87Go5DKUzkWm4DpPBM/o8ttwI/gz+SozA+rPouREWXJazJhmJOcPNp8R/vNdPY1r9lxMh9ee+0tI6DgcLnLUJvc/wNFqEKq+JrznHXooamrN/zRJXtanPCDTQ9mufPK823cdvqyFlnN5LNDqGJV2VUjnvImlzYPEi1fFCWUnHrqR5nnOCwsQYBPP8Z0e9dqXGkzrJGJn/oSFC8kwWByHXt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(36756003)(44832011)(38100700002)(5660300002)(2906002)(8676002)(8936002)(41300700001)(86362001)(6916009)(478600001)(54906003)(2616005)(26005)(6506007)(6512007)(186003)(6666004)(6486002)(4326008)(66556008)(66476007)(66946007)(316002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vk+oH0XL4QndzENOrBHBQpDEgu00//PklBfeniDGiZFYkOTWq17oyrlzhPd9?=
 =?us-ascii?Q?MAb+2KM/XadnJxAICfNni6LIh9302pYls6yra6xFG2vH3zEb+9NB23lL824+?=
 =?us-ascii?Q?lJKOeHvmGyoti/HzqSRinMQ8MEsKGRWQpsh09ELHchnvde2mi5COY8dSZGXD?=
 =?us-ascii?Q?5oBsCxstRa78YqN1W5A7T92l/goMFHzbPJTQR0He/wW25h2AbR04qZRQBbhB?=
 =?us-ascii?Q?cU+TwEC4cpHu5rKUR30IRqo1kbbKFuE9LcKLO7j8bbgQ8k1oKHLfuiuN8RqQ?=
 =?us-ascii?Q?aVDbE8QyxgV3sAOIeYjlXWyTuglVcuzKWBUKNoT09eN91d1SrjcVAEach8wJ?=
 =?us-ascii?Q?YPK2cfikuLFwQJ8GnBUzkUkyDkHRwFnuLcwxHvSsYPl0/+UN2B7U3+BqD9SR?=
 =?us-ascii?Q?u2YDcfj50kPLHyvpotsbgYNI3sulu4plv17KrRSC46B8GlKdwsb1REiHKyfV?=
 =?us-ascii?Q?qKR/jbLZ0ooUJvgX1XBOfkVfhOw4/bsz0Zh4NxEQz+zlMpAiJhkkscNmsx0v?=
 =?us-ascii?Q?i6HISsgzXIJK4jS1YIfwn8cZ1dgCabDT9y3fkknCzPxsaGvjo2InBzRwbOMH?=
 =?us-ascii?Q?odipLUPblkwUaZvkKEjbVG0IuPcrrBbOCvqZVvt/u1gMYfey96N4Yc3MSH8D?=
 =?us-ascii?Q?PUd+RBDSN8btSsKthyjTMj4VEl5kg4u8V+ovfNZRk+qNbIIGiSk5a5MjDbx7?=
 =?us-ascii?Q?SXYhtncSUt5DKBg8zxOjJBl1rIt6FgepkI18aSP84bMEKWTMRFuA/LSGrWL4?=
 =?us-ascii?Q?MrF5Sx9u3wIMoaS7dbE/vPnJOZk0hV2eF3DS01mROn7cUUu8bsC21yjsq0J5?=
 =?us-ascii?Q?kayDZipA5ce+IxcAAYZC8F5J/Fg665gC2Ua9oUnht9AALlrtm/pOj+0XZroT?=
 =?us-ascii?Q?isn/ao8nNwRbZESHdRPvt6wpea4F3NwEWlh19u54J8TD3igaE1txuCmwBF3c?=
 =?us-ascii?Q?bDKVC+S+7/Cb2y/BdE/qB63X/Kk9TdnVQSD6aiI9fklPt1UMK58uen4JFOCN?=
 =?us-ascii?Q?f67bZ44uePyLl3MurGWGYEctmtV8V4zVyTkz15ahVe/vpmgFbCZUh2vwwIXE?=
 =?us-ascii?Q?GpnTXVYGOxQQcsVs07GMcQMyNQdCr+wkvrjopY0w3q3HD0fJwVBEeVeAP9he?=
 =?us-ascii?Q?hJ2sN3WHVClqWG1c06nb2v1sPoJ/JmCGhQMT+1BRh5+6vpZOyIiUp5Mpdvg8?=
 =?us-ascii?Q?DpsUfm2AGexSrx3KwY5wcUMkdQQNXYhXe/bqZkDjKLnhdUG7S6e2It62QRTe?=
 =?us-ascii?Q?2YVJaP/kWiD9+4ru3/EUs0FkJvJpLKLPtnKjRhAR18HlBp5TZG4BBlhFqlB+?=
 =?us-ascii?Q?ayTxJgg5mbUS/tqAetttJpOBfnfXZXh+BbTkQftrE4zapKc4GT07K94s0Q4d?=
 =?us-ascii?Q?iPHuvBp5/+akaX+agA16+85FgklrP3B2PjZCdZSKGe7kEeJJn47258ycjYAt?=
 =?us-ascii?Q?QGusjdEQgRG+6wNjHQ60NnB93F6P0A+hfDXc0f54wfgMYvF9jBBjXV/HyMvB?=
 =?us-ascii?Q?BkkjFrU+dEPGl3gxbdkzpTqL7Jo7TQeQOrL3DdBLiCVBmqj18EmyKWYVGOvb?=
 =?us-ascii?Q?ROZGb3iAhSUTQxE35NgbBGwLgfORCoLcMzAPnZHlOBZWnpQfh96MfNG07LNm?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dac454-4b9e-4839-2fa5-08db3fcf33b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 05:38:56.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHLJW/0SDCiWZ6YnvRLq9N0YHhxmSGitS0p7Hg5hA++jJOb6XUOU/gOJ920fRy9Vxd0kohECjuPyFW5nc4C3Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 01:06:56PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fix a couple missing ':'s.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/drm-usage-stats.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index b46327356e80..72d069e5dacb 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -105,7 +105,7 @@ object belong to this client, in the respective memory region.
>  Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>  indicating kibi- or mebi-bytes.
>  
> -- drm-cycles-<str> <uint>
> +- drm-cycles-<str>: <uint>
>  
>  Engine identifier string must be the same as the one specified in the
>  drm-engine-<str> tag and shall contain the number of busy cycles for the given
> @@ -117,7 +117,7 @@ larger value within a reasonable period. Upon observing a value lower than what
>  was previously read, userspace is expected to stay with that larger previous
>  value until a monotonic update is seen.
>  
> -- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]
> +- drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
>  
>  Engine identifier string must be the same as the one specified in the
>  drm-engine-<str> tag and shall contain the maximum frequency for the given
> -- 
> 2.39.2
> 
