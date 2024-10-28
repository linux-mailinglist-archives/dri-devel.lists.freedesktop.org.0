Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19789B3AAC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 20:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C9710E54F;
	Mon, 28 Oct 2024 19:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMwJlj7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22CB10E547;
 Mon, 28 Oct 2024 19:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730144858; x=1761680858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nPpp5ml0039uwgPd39t7mHbZSKJuVo3so0HZzpw0CK4=;
 b=EMwJlj7/sA2LfW2hUxgmLil/riLWe4+p+a5IU1MBYqalRdmV71soUzNG
 tWZCpQRjW0oqiuB4Z5wR/hbaqfSwpkWShY+6XyKno0MN8dIXXkDmQjCFw
 1FyWWFV5gJSjp17j+FPXApGp+VdZAN1BQZij+Q5h+g3qJAlAoTSX9Af7Z
 mgfDnYAZeY3O2vNKAJdjVr4M7dde46n0h55DyMTW1JCreJ7s3Vlet0LDi
 qoAFIFdlNcWBGV2AxP9gbmhjoIcdaBkIaj4PpXMKYDGm36ilnQK4g82OR
 gI7qcibPCi4A6M+HNDAsIBGddM36toQWpqg33Geqkwp9D5qy+QhA5rm7S g==;
X-CSE-ConnectionGUID: qX9iThGKQx22UCk07DId2A==
X-CSE-MsgGUID: GMrh8GWgQIm2Taorh50gUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47221389"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47221389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 12:47:37 -0700
X-CSE-ConnectionGUID: vft32EKSSF28DvWE7Hqh1g==
X-CSE-MsgGUID: XyLWHd+0TIWlyNS45tsIuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81345165"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 12:47:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 12:47:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 12:47:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 12:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBMUHw/iKwewj0GFGYCs2p7+aHmWSp5T/438Rc6TQhpOlqfj29xRlxTvpgxn2PPxklkD5h3uE55HU4boYktJL9DYRYQ/O2KfhcpZFa7bj4cRfP56I+RSTOqDzJIH0zrB2R9mN7u42znS0R6OArncv9akUWlkgy4CIo/YnF8i0w36JnPqv6+B1DrefVgtBLMrjuF9jtGBJ0/y0eWsB8X/RWMUkK2Nfb7vm4BqkGVW23hlcRq4CwKzUU61UGYlBW9XXuyJLZdaC3rKqxdciUTLkFWvvLxdQf4+8mG/wsRPEL/PaiOVrebfwdvUnrmuhAizVG6fE1OIc92+FHYSw86Ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2MYjsNGHQYRjg4yegoWyGBuKULIR0RcxiewM8tTq8A=;
 b=tKRhaHPaXko51Av8owsVPZatSpxkHG4PMdSDAvSubXM/RHHbgWvwm7zijjXktir9tsoeOXFRWThBwZzN/DTV9Pj49fAe7PKATzeTM9DmWEV1EaAzogqPCkC0V9HswE4Eta8V/VvLPzjpKDEtVmIdb5N4g1K1W5CWN1H7IC/quZqucT0hY4lf8kbY1rV86PWD1nlXv4TRENQ/YrQPpI2ZSJ6nkWQaw2/sX0EbCtKzGCsxTux6B6YiTn/pWMHUlfwvmMIJoHtJx+AYnBLTbd3hM4QcnjzMIBfICBDILEw5+x6jDnTAcheVhf9EtHEkFdMS3cHUkt9R7jX+qhgmgQgdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 19:47:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 19:47:32 +0000
Date: Mon, 28 Oct 2024 14:47:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gyeyoung Baek <gye976@gmail.com>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Fix build error for XE_IOCTL_DBG macro
Message-ID: <53slkiaabzxkr4npxjgc32igwnspzyohvswwhooc4nfzdjw547@q3nnf3wblgfd>
References: <20241027045752.10530-1-gye976@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241027045752.10530-1-gye976@gmail.com>
X-ClientProxiedBy: MW4PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:303:6b::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: faa4ec32-7b06-4384-0e3a-08dcf7895d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EvLX5fwtFUsLX7CKeKeuUnUU/6KquUh3We+OthtgkrpUbdX2qqam/ZZhyRsA?=
 =?us-ascii?Q?ivfpB24CvWWF543MSBwurX1KJX4RSofaS4V2h/ed5Kmgipc6nO+0NzbYUBlO?=
 =?us-ascii?Q?Rx5QUtMESVAOYThLpcWOynQ8HXRg3lvsyC/GGI+xOaqb2+pnUBKxiWy8xmeI?=
 =?us-ascii?Q?i3AiZe5MZvOCtH+JxejQ8IfnzdQVKGcbC5UJfBY2DfeyVh1L5AlvU8cnHyOv?=
 =?us-ascii?Q?gdVtnmu0s8UZHq5bSC0POvbLbuoVS5fdnlppe8v3IiIoosu603M7c9Mpr+W6?=
 =?us-ascii?Q?fUyzxbZDdXH8J2wwhYKss2N6B5eZYFac5UIWd6eGQ1+B+uYicIdJA7MB+TaA?=
 =?us-ascii?Q?jdxWcLxqrhPBzlNiEugDqCtIJciEpXnwNzihH64J40qoyIXjijaGknP60Qlk?=
 =?us-ascii?Q?aQjJkJrFCx/O1iC9+tyvig0VZm8UozGm0923f8x9XU6D4SGlqnmj3hKMKT2C?=
 =?us-ascii?Q?f2RaS5g5gqET8Q2W5Jl2o2jiAts4wW+rVjCrl7ExY9bQqCbCOr8g+ULu7KwS?=
 =?us-ascii?Q?qqmjHVtSVV5BfXyWV+ZRyx5nH8Qv+Suc1FT8LAWLmg71LPOodt8j3OuHbcKA?=
 =?us-ascii?Q?U7K1ZLdk4/uY1/Zn8E8mvizkk1sGYp/8xfR0yd0gkwqFCaQXWFPJ1fmxvVzG?=
 =?us-ascii?Q?Srq8XRBd0z5z4m0TSFP8s62wbUH6gUV2121/0h6JB3HDlmTWfiXEUOyKX8kf?=
 =?us-ascii?Q?hHbkZn/d7ngapnwIizEPy3a1U3r377zr3SR3YleqD3Bb8t4qE1B1/zEzTgEI?=
 =?us-ascii?Q?RC0G+/0gyqF0w8n9qIO3eYlAgvsT+1hAAap4m4iB29P+BCFHq9pA6fHozcap?=
 =?us-ascii?Q?3oDeVcWXyrEgY6ewiqyfDSErmEnSQpTBmAgSJCcz/eAo8T2ySieDsbf/H4id?=
 =?us-ascii?Q?3pebfzli7wmvY/G7a639e5DmJfN+r1GogLbQeqwRdFaZL560fY/B1T0FsL7q?=
 =?us-ascii?Q?3vQtiyEzMa1cRFHr/oQFD9N0vKsHNkwcs5gTQ6RSHcNOBV3Pz5w2cRjU4dDg?=
 =?us-ascii?Q?ZbWQTf5pQxpWJ9kofSyd75x3YlBHZALgwSzzppDJDT3ylo8cYWfMGI792l2G?=
 =?us-ascii?Q?miXNjdFv318lkfQGpCjGvGv1JbnFrxm2fWoga4hS4rsGlZ5Db2QwWuFIDWFT?=
 =?us-ascii?Q?e73llqKBcBuqFBOHWnSzner8gcMuC/tAbaDyk6s89CO1rHdaJGNuoGZdVgxs?=
 =?us-ascii?Q?thM9mTu3nX8OdagjL1jn8EqN4qitngljkcJfj97p/c1i4u/Ij2WfUqT2nyoN?=
 =?us-ascii?Q?al58l9G8JlKMJ9qhKwVwbkIIX7mKB6LtoG00xFyh0W6qux7aCa+wHOo1RoUc?=
 =?us-ascii?Q?37ulvs3z0kQF8m1L590R8ZML?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hjX5K+snOnzpT3cf/cgwNii1He96dXP3vUYXtQdG3CRrJgvZEn6dfFd4jDm/?=
 =?us-ascii?Q?/bp+mWEr+/o/jpSKhR/T9NA8qapYgfoOX2P7N8VBQxp/alf6eiqEWXI/wDPI?=
 =?us-ascii?Q?24GzdxpbrxMr6C1/ScYd9qp4vaSJJZGILmuZnHqVOU9tdQVvwOYq3o+n/Jqp?=
 =?us-ascii?Q?X2nVxOAkQoYp8zUuPhv/XPP7Zh9XBpkdjIzEJQlczN+8fg4Z+lRAvMPHOu/b?=
 =?us-ascii?Q?d3nJUCXEOm5HP9oAjDKAS/Lh69r54N5A78B+WvctTfL/gonTPgoY3k1S3fwE?=
 =?us-ascii?Q?Ma9LZ9xcvrFIi2VlNGi7QyUcz2H3KOBALlNHap+S6tuxnEqUD3nl+GlkzVmR?=
 =?us-ascii?Q?7tR/7NMW1ttmRrYl1QotxnsZNPIhS9IT7Bj/2JshiYDzTc/J1SPsirLCAY7d?=
 =?us-ascii?Q?9afLyoHTR/ZI2QEPvPnbQdXkQHJBolhaEWSQh9tCyvQJGwqyKXv6huI6sFKX?=
 =?us-ascii?Q?VIpbHulyyFnSdUC7wa9utx5tSZQG+A6jigLVD3HBZkWtzAwB9yZku2eK7B5M?=
 =?us-ascii?Q?wp8p9QDvIAGr+UNmQxJVsG23QtnGWwlDlAD+/B9FKfLZdCzvhzACrVkHpqN6?=
 =?us-ascii?Q?QmXQf6m3o1pVvbEPmwYa+HximWgTbl9t6FtBpIF7FLjqT7EjzGe2sTEEawZr?=
 =?us-ascii?Q?ILC+3pZ3py49SRyRKThcvbVZkZ/epsJFYgVrpIKc9TU/suZAcoS6kYTXqzZT?=
 =?us-ascii?Q?HWv6KA9zkHxDc7T7JbikuaLipGA7sZ+PWLZneSdUwI6tBTF2UfqYTMVo0+xE?=
 =?us-ascii?Q?G2XFv5ZctjdQYhqd3DRIQwot0ygOuO0uErp0zOz/e4rO+6ebWB/RDgm6slom?=
 =?us-ascii?Q?gUEz3lacyntSwZgdKaFSxkeSVulWNGeZY9XGZDjBegY1hTIWXWaNMrnqeuXA?=
 =?us-ascii?Q?zG1DSjjDCH5mCgCga3/fvIqW5EjdRHVfxRPKnHgLnrkpdVuIrfnxrEEpjZ46?=
 =?us-ascii?Q?MA1nM4SL061tHkzci3srFqZzcaYIJS35NdWx7q9NnJravNoSQ+dHGz2yzNRx?=
 =?us-ascii?Q?HHL7iZikjJVjbpxOTu5VZLyAA/Kqzh7Gjsmx2WwmjTx2TKWc0e2rD8cWaZV7?=
 =?us-ascii?Q?KavA6jSd2xP2AOm4WDgPvvkP896yo6o2gpXIZqELLBm2xENT26UYBMOwsFzP?=
 =?us-ascii?Q?YSNafQwabRFcJWeplGqTjOcvTZiFFup0PYlwSJWEN/L8fo+jTL+/wqrJ0eYq?=
 =?us-ascii?Q?hpkY0xu+Z9fRjqJ0zRZYS3Ok1vqZEwtTFOaUa95cuI+uctfAIi0eE1Wmqh95?=
 =?us-ascii?Q?KmyL2qXOGFRsi1BfxHCFWdYNsHp7nqUmNe6Bv+6l7vwf1BkweGfHl0U+eM5C?=
 =?us-ascii?Q?tcrEH6+QsrjmtSX4DfEhtQgf9jvkMyWKDhxBPrDTXiGu4W5pYRywXl/Ft1Aq?=
 =?us-ascii?Q?9iKd3Mykl10w2cjoXpHih+CniAnwaN2l+WKXvnT/J9nfEdvhI0cUsp9aTii8?=
 =?us-ascii?Q?kZ45k806nM6U5CdInwUiULfGlc+h6XWCRp53/LFa2uAKscF2srNSHlgBMb2K?=
 =?us-ascii?Q?Zi20wzbXKx5DMx8z6vI9ojxYOJfnG+T7P3c1txlk3RrRM0RMGJ9nhQXJOCZw?=
 =?us-ascii?Q?R+ddlSuJ8xBJUeEZsr1CDk3hS+PeHlMrYQQkd5bCCeOF0pCTr850ndZBySjL?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faa4ec32-7b06-4384-0e3a-08dcf7895d1a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:47:32.7170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwNSql3QJeaxrW/iRipBULq0ed8mOcT32tcttlwmzZT3abiX5wiThlM4tpJR2PNKBzzT+N0OY6sN61sa/VRKVfX/0eiv3pcom17DP9o9jwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
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

On Sun, Oct 27, 2024 at 01:57:52PM +0900, Gyeyoung Baek wrote:
>In the previous code, there is build error.
>if CONFIG_DRM_USE_DYNAMIC_DEBUG is set,
>'drm_dbg' function is replaced with '__dynamic_func_call_cls',
>which is replaced with a do while statement.
>
>The problem is that,
>XE_IOCTL_DBG uses this function for conditional expression.
>
>so I fix the expression to be compatible with the do while statement,
>by referring to "https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html".
>
>Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
>---
> drivers/gpu/drm/xe/xe_macros.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
>index daf56c846d03..58a9d1e33502 100644
>--- a/drivers/gpu/drm/xe/xe_macros.h
>+++ b/drivers/gpu/drm/xe/xe_macros.h
>@@ -11,8 +11,8 @@
> #define XE_WARN_ON WARN_ON
>
> #define XE_IOCTL_DBG(xe, cond) \
>-	((cond) && (drm_dbg(&(xe)->drm, \
>-			    "Ioctl argument check failed at %s:%d: %s", \
>-			    __FILE__, __LINE__, #cond), 1))
>+	({drm_dbg(&(xe)->drm, \
>+		"Ioctl argument check failed at %s:%d: %s", \
>+		__FILE__, __LINE__, #cond); (cond); })

but this would print the debug message regardless of the cond being
true. Previously this would enter the condition if cond && 1 (due to the
comma operator use), but printing the message was shortcut when cond was
false.

It looks like keeping cond outside and the statement expr to cover only
the call to drm_dbg would work.

Lucas De Marchi

> #endif
>-- 
>2.34.1
>
