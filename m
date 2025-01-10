Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A7FA098FB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 18:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77B810F159;
	Fri, 10 Jan 2025 17:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edJqVZEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1037610F14C;
 Fri, 10 Jan 2025 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736531780; x=1768067780;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jZaepqB13VZFmKQQH3i+kLr6DTrhIhcRxPAYcVEzbOA=;
 b=edJqVZECjxuyD9wvkXtcaHPkCjyHS5xK92BMMo39zLQJ/zqBQHjUe0lC
 hPYSz7Te7TT5J0l36N9nuAdvT3/vGsH+Tp4dS6tbJs3MvbZ+AHzR5Jqek
 PEdrNtTwzdaCScKhb87+6WxYZmJ7mldvggFs+cKLPOb4aaHJoyENnisEx
 OezqYKVhsZT/4UhFaHMvhgPsFrHWx22Pc802vEMeiNfR243s09odg7gvZ
 ENx+sNy9NuVcL7uEzudcBky6i8DigUzKlMXrnYjUN0XYsR5WC0AU85x0X
 oVoVEyykxruAPiiI5PiP60egkcROQUvCyF29d06bErIPJRhsI1N9ZOIIq A==;
X-CSE-ConnectionGUID: ktN9f2/KTtmEsiH1TF1MVg==
X-CSE-MsgGUID: li1UJjmoQhGVYD77mFfmMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47408289"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="47408289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:56:20 -0800
X-CSE-ConnectionGUID: uG1phz2rT0OgwT8MFrgXFQ==
X-CSE-MsgGUID: 8Ffuj5NqQauLkjYjblh1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="134628282"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 09:56:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 09:56:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 09:56:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 09:56:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqE0lJSsrj4VaE2DZouC+4bDXsGLHgO7hmwd4kt5uqa9ulPd4HT/NkLdn8mPGO0zc3xkQIGYqVzAShnBXniYBvxXRpLcr2FaSgi2WNFghuPbHlSLTDSo7MuA8eqSoR22BUgZC1DdUSLw0A61KN1Ey9cIUqh07sTCAQ1uD0oJerqgghBSrx8D46khBkzHmTRNWXy2Y0KauaUpgzdS2BT4pP9PRRONLXzCpS2bt5JdYZZ1LQYMImUjFAACEhLKTALZJY8tpZWm+sqEHLGSlrC7WpzKd35R84wXpnziYWhhyFi4JxlptWr+0suwKtx/snQ1ibXYjo++xPnaMxbzjYiRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ybknqEVXt8VDo6mxwlue8UtHHqlxcl4akUASzIjDrI=;
 b=jR2/cLuSbcrAYqjRFTLR4oQCAs2EXqvM/yAElds8AWZALwIw/meClazs42PAGkedKMeTk9WfuQ5yV6h19S6j3wf97CBcokSqKDNJPrUTxoiLANsCt1/TdHKj+TkQ4NhrrgUTJ082dIhLdaX0Wxt5OGHlHEf/v5ETl2O93Hnh5U2GkV+LBY0xk+9Suo7pf2rQn2f4W5ZzuD4ADuUul8xCtDjepiqi/2/6/+LlRpzi1lr79z+23wZ4tZMxduS4wIN6HJj+Frk2pytl1t9H2Hzj/HOIC67l2hXO1Owwtwl5dsU76jw/6JGWeGpdvguYfmy+Ud5W04uePTEdF5ou5bJRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 17:56:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 17:56:15 +0000
Date: Fri, 10 Jan 2025 09:57:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v15 3/9] drm/ttm/pool: Restructure the pool allocation code
Message-ID: <Z4FfcTW0YRXnHnp7@lstrano-desk.jf.intel.com>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
 <20241217145852.37342-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217145852.37342-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:303:8d::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: b231e979-57b9-4809-4fcd-08dd31a013b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oh8j5eUwaquLDzVm1LPmMXW2UdQCnKFYTmebcxhrZg/vK0JNNhAQhJ/bVD?=
 =?iso-8859-1?Q?mn/26iQszLoAqNJMpBuRmIbPMASO5k7J97+swuhKM0/VAVKyey14JGQpF+?=
 =?iso-8859-1?Q?22b3rf2eGQf+xi6i/D7+n+kBwjMKj/aRxXVU1mA7VsmRAIYO/0zsGyDbKG?=
 =?iso-8859-1?Q?MKTkKJ4SO8PVhTmpQL9Qxt/RARnwnCfUtAyWZnXeASyvp3+Aon0LXanc3x?=
 =?iso-8859-1?Q?dV3QX+clFC7QMRd/TO56MRCVcY0Kd7oQj3TqWYoB6tbcrTwaxUV+vTtDb+?=
 =?iso-8859-1?Q?+21RLxHf34L0ENXEv4lJbSJSwdPiEyAIbdLQtwfQ2j86vx7Rb6rXU5TOWN?=
 =?iso-8859-1?Q?e97etv63InYmoFv4hRr8DnZzZ/2k1LWwYhpCOcRzJ72yGo+eDBCxcmZHNE?=
 =?iso-8859-1?Q?Yu89yy/e83k3u+vuof8I83xVu5ls2N9wpVeuhgXuKLU9HISkQnxj8+IVg2?=
 =?iso-8859-1?Q?VlSqlpt1gF2sVBIkfnDfx0H7XO0Qgqaoj0CEycbIfU1kpasd1+6n5GbNSF?=
 =?iso-8859-1?Q?5hodW8KOoxFBI5vpZAZTv0+ZO65I9jorgdHzkXC4dGzxdzKWlUI+ucpkJS?=
 =?iso-8859-1?Q?WcsvV92yDbsqySzfHgSN7GYG1UZ/5Wl0XEDABmdNKJrNCb6q+EGOTzxlef?=
 =?iso-8859-1?Q?/0ml9zu93RkL+I1dKnTMwD51iPS2bLJQb99mcx0ffoq0Cvm1XIVtwQp/5e?=
 =?iso-8859-1?Q?Hwe8Pbu9fjs4BbQYw4OHZ6PBm1MxcUW9tWLnXN62PkJdQWlfi3obH/CWom?=
 =?iso-8859-1?Q?yzW88D+4vOdJNHsdAfbzbR1qvW2bKHQsE6alEfR0vhbU1KxSN6Bo4VxFef?=
 =?iso-8859-1?Q?M0phAldGxWrtgidpOy7Cp7tAWDpV2kUFo9pgSt0LtfSJQltb86/MxHUcZ0?=
 =?iso-8859-1?Q?ZJRXGrvPz7fo2UEWc3GkXf6hPfow785ic8tsXCbgYHtdFswQbUR/pS20RB?=
 =?iso-8859-1?Q?W5WqXl99XZMIiEDfY7BpQLjXAYtNofOIzuwyxklYXuODAU48G7gpR6CyRp?=
 =?iso-8859-1?Q?VDcxuMyAEq2QJb+LEEKfe+8L3UXrcmjSDEY06IFXcjUQJYaMBk4PKt7Czu?=
 =?iso-8859-1?Q?iDCXmVVMpppzBNXvGOVlJrBMuX5YRfDl6/fwappFOQMlgwU8hr8VaviuGp?=
 =?iso-8859-1?Q?c/DFIIfHPT9XqcUYJMb+0DBxdyqZzoEuBotC3gfmkM4ynzOuQz6tR1J6Li?=
 =?iso-8859-1?Q?PnIL9k0KHbcLEqCxrVpi8/Yf7eRLKuEAQ8HTF2Gq1GN5Jcwh2XTyye0k72?=
 =?iso-8859-1?Q?HQFH5FnLWlNmINdvSCRF6pFNNcnBXOrMgu4N0RSsR0N+rDAi4dwMPbSpg1?=
 =?iso-8859-1?Q?nNyNuNkbYgUMSDWDwi694Yh0XkbKujh7bsEXc09bQmW4vWhetjqV69pkDN?=
 =?iso-8859-1?Q?6vvaKcDE2vktHUbq0V+G+FkhmMgYHIYH/+uWRPVQDcwx3b0NL5HPPqzgR3?=
 =?iso-8859-1?Q?MI4ALVT07l72JekF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ycJMKjc9/co7igUXpchnVbmR7dvFEBdQBkJrvazxZybij7fRyXKxmVIdNZ?=
 =?iso-8859-1?Q?x9jsWoTmIMuLX1EKeSsh896SSOMZAgLx6e2ODulySAxG7Cn9sZqU2dzeFE?=
 =?iso-8859-1?Q?XMiWa0hlABVj7AW/MVo2ytEjfZAe3v27kPH8RzdEKUsFsebF5W4HarHyXw?=
 =?iso-8859-1?Q?lLPdcUDarEik1H8g/RwPDpPy1jky/6luBS83CJkENgxuYyHZ+jtJ1ML2xQ?=
 =?iso-8859-1?Q?5O51JF82ZVhkPqldIKPkaRLL19ErRwSbZol/qa0rq0xXWxXaqEVRqkoBKV?=
 =?iso-8859-1?Q?lhQhBM+XmLzZO2NAIsUhAEMLMNy5y9wYPmZPzgYDfv9A15Mj5t6qxA7L2h?=
 =?iso-8859-1?Q?NArJnMCh0oJHPFHD1VuHTlxpRhnrF9dSSs1LNybWrIN0cFWEcLOn1wWvmv?=
 =?iso-8859-1?Q?in5YfpGbYfmxH4ejcrLwpUOuoIo/2xsdCvjLBW4K05h1+5D2/mzq/ayxzD?=
 =?iso-8859-1?Q?BeQdNTqCsU1dtlaY1BCO+5211VaENI/xBfCAImBHusq0mBp5IGrT8Zn4ck?=
 =?iso-8859-1?Q?CIzo0RJndzEosyBCDKfBztCph6d1BcURGH9kamluxzMD3X5kZEYBA8HLe/?=
 =?iso-8859-1?Q?9tnrAWBLVsnB/dp5y6WScRJFwoVYOHerMHFXRNtByZA6SScgPA8SlGNyw1?=
 =?iso-8859-1?Q?D4SqIB9t1hVTTgHOlE4xrtIgCmfHTpe654L4uLEQ87H53r5DbAGM8VfrOo?=
 =?iso-8859-1?Q?hBh9MMDhrcqKHN8A6Q5TKdZRrYz2SQY0PZz1Ke1eGxFrCXFw2o1xVqssH+?=
 =?iso-8859-1?Q?l9R4O/uvoKvaZF8ff25nRL+6IYNi7w18sRdVKCPl0vnYiaMV3mrAl1zMHs?=
 =?iso-8859-1?Q?1DEHNNTrcmfvnD2GrJ1h5etLKO7JIJlBVaaS7daG0tgxZLSy8FlklHb+sQ?=
 =?iso-8859-1?Q?e4Z1YFzU604ZVNxw2uehjy/ptiJNpLjwDKbauiuFFiBFc1xiiJeOcU/Ogp?=
 =?iso-8859-1?Q?y5yINsCAhPBPrGo0EeThDc4zJ2/CXR8TjviCMU+x+smf1brvAjw8GE7OLK?=
 =?iso-8859-1?Q?f/IQYvwSpY/Bj6cLzflKe2XHwpdCNlw98S/9fz9nyB4nJmoWGjLioXVMKc?=
 =?iso-8859-1?Q?d9vxtA4pZHxFZ9sE36IS/KMav/0M9W/1/aeYamlpPyA7aa7iN2VSq3AQRQ?=
 =?iso-8859-1?Q?7VVime5fMgO0uEzVcSpt4nNRa1q3Rxm1jEXYHogIInJdsUZG9yEuKTpHj7?=
 =?iso-8859-1?Q?WiFMxQIu3t9g9PuJKL3uxntHFcfSVjF7Rpnjk50Yc12Y3NH5u8F3LK4eY4?=
 =?iso-8859-1?Q?duhnLqcEA7uH/d7mq6RycvjdfwgVI8fYNPi3LeQfzqJSI+KmrX/M2khGG9?=
 =?iso-8859-1?Q?iW3bMzIegYjb3vb0aJwU7vraYXgfWpeOK47saEXobUHezMd5QvA6nXA3n1?=
 =?iso-8859-1?Q?M0PNzRmneavfQYdSdvmW93GekaLq56G/E2KkXlXv8h3RVNJYnlhKG3xxwr?=
 =?iso-8859-1?Q?Eaaf8ftdVmG7ALSqpWgxQe/vcpNDX+U0ZNAzUKj0OqdpLB8J7nCJMjFzNV?=
 =?iso-8859-1?Q?6qzkPw4hDTIychLS4dfhI8fUvSIPYIEQ7ShkYRfNqVDQmNvvwItfq6SOMP?=
 =?iso-8859-1?Q?n+64am9i5E9Ly64H27K3EWJ6URZtM5c8fJ1UFxC+Vuy7qHjd9TLVn+84Vw?=
 =?iso-8859-1?Q?y+LDCVdYeXwXqzPLBEVy0Id7wQ2DNDT3YycjqabLASh63htYi3Kmk5eg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b231e979-57b9-4809-4fcd-08dd31a013b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 17:56:15.3324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3ZobpicgVDOuiWYwSGQOhVmu05uId6TOr02PRza4BqIWLKTm7udNOV90tjkKSCQMv0Eplsd2tKEtAqK1wLWaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
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

On Tue, Dec 17, 2024 at 03:58:46PM +0100, Thomas Hellström wrote:
> Simplify the pool allocation code somewhat by merging loop arguments
> used by multiple functions together in a struct and simplifying the
> loop. Also add documentation.
> This hopefully makes the behaviour of the allocation loop
> simplier to understand, but above all paves the way for upcoming
> restore-while-allocating functionality.
> 
> There are no functional changes, but the "allow_pools" bool
> introduced to keep current functionality could be removed as a
> follow up, which would enable using write-back cached pools when
> allocating memory for other caching modes, rather than to resort
> to allocating from the system directly.
> 
> v15:
> - Introduce this patch to simplify the upcoming patch that introduces
>   restore while allocating.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 183 +++++++++++++++++++--------------
>  1 file changed, 108 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8504dbe19c1a..c9eba76d5143 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -58,6 +58,23 @@ struct ttm_pool_dma {
>  	unsigned long vaddr;
>  };
>  
> +/**
> + * struct ttm_pool_alloc_state - Current state of the tt page allocation process
> + * @pages: Pointer to the next tt page pointer to populate.
> + * @caching_divide: Pointer to the first page pointer whose page has a staged but
> + * not committed caching transition from write-back to @tt_caching.
> + * @dma_addr: Pointer to the next tt dma_address entry to populate if any.
> + * @remaining_pages: Remaining pages to populate.
> + * @tt_caching: The requested cpu-caching for the pages allocated.
> + */
> +struct ttm_pool_alloc_state {
> +	struct page **pages;
> +	struct page **caching_divide;
> +	dma_addr_t *dma_addr;
> +	pgoff_t remaining_pages;
> +	enum ttm_caching tt_caching;
> +};
> +
>  static unsigned long page_pool_size;
>  
>  MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> @@ -160,25 +177,25 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  	kfree(dma);
>  }
>  
> -/* Apply a new caching to an array of pages */
> -static int ttm_pool_apply_caching(struct page **first, struct page **last,
> -				  enum ttm_caching caching)
> +/* Apply any cpu-caching deferred during page allocation */
> +static int ttm_pool_apply_caching(struct ttm_pool_alloc_state *alloc)
>  {
>  #ifdef CONFIG_X86
> -	unsigned int num_pages = last - first;
> +	unsigned int num_pages = alloc->pages - alloc->caching_divide;
>  
>  	if (!num_pages)
>  		return 0;
>  
> -	switch (caching) {
> +	switch (alloc->tt_caching) {
>  	case ttm_cached:
>  		break;
>  	case ttm_write_combined:
> -		return set_pages_array_wc(first, num_pages);
> +		return set_pages_array_wc(alloc->caching_divide, num_pages);
>  	case ttm_uncached:
> -		return set_pages_array_uc(first, num_pages);
> +		return set_pages_array_uc(alloc->caching_divide, num_pages);
>  	}
>  #endif
> +	alloc->caching_divide = alloc->pages;
>  	return 0;
>  }
>  
> @@ -354,24 +371,41 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  	return p->private;
>  }
>  
> -/* Called when we got a page, either from a pool or newly allocated */
> +/*
> + * Called when we got a page, either from a pool or newly allocated.
> + * if needed, dma map the page and populate the dma address array.
> + * Populate the page address array.
> + * If the caching is consistent, update any deferred caching. Otherwise
> + * stage this page for an upcoming deferred caching update.
> + */
>  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
> -				   struct page *p, dma_addr_t **dma_addr,
> -				   unsigned long *num_pages,
> -				   struct page ***pages)
> +				   struct page *p, enum ttm_caching page_caching,
> +				   struct ttm_pool_alloc_state *alloc)
>  {
> -	unsigned int i;
> -	int r;
> +	pgoff_t i, nr = 1UL << order;
> +	bool caching_consistent;
> +	int r = 0;
> +
> +	caching_consistent = (page_caching == alloc->tt_caching) || PageHighMem(p);
> +
> +	if (caching_consistent) {
> +		r = ttm_pool_apply_caching(alloc);
> +		if (r)
> +			return r;
> +	}
>  
> -	if (*dma_addr) {
> -		r = ttm_pool_map(pool, order, p, dma_addr);
> +	if (alloc->dma_addr) {
> +		r = ttm_pool_map(pool, order, p, &alloc->dma_addr);
>  		if (r)
>  			return r;
>  	}
>  
> -	*num_pages -= 1 << order;
> -	for (i = 1 << order; i; --i, ++(*pages), ++p)
> -		**pages = p;
> +	alloc->remaining_pages -= nr;
> +	for (i = 0; i < nr; ++i)
> +		*alloc->pages++ = p++;
> +
> +	if (caching_consistent)
> +		alloc->caching_divide = alloc->pages;
>  
>  	return 0;
>  }
> @@ -413,6 +447,26 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  	}
>  }
>  
> +static void ttm_pool_alloc_state_init(const struct ttm_tt *tt,
> +				      struct ttm_pool_alloc_state *alloc)
> +{
> +	alloc->pages = tt->pages;
> +	alloc->caching_divide = tt->pages;
> +	alloc->dma_addr = tt->dma_address;
> +	alloc->remaining_pages = tt->num_pages;
> +	alloc->tt_caching = tt->caching;
> +}
> +
> +/*
> + * Find a suitable allocation order based on highest desired order
> + * and number of remaining pages
> + */
> +static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
> +					      const struct ttm_pool_alloc_state *alloc)
> +{
> +	return min_t(unsigned int, highest, __fls(alloc->remaining_pages));
> +}
> +
>  /**
>   * ttm_pool_alloc - Fill a ttm_tt object
>   *
> @@ -428,19 +482,19 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		   struct ttm_operation_ctx *ctx)
>  {
> -	pgoff_t num_pages = tt->num_pages;
> -	dma_addr_t *dma_addr = tt->dma_address;
> -	struct page **caching = tt->pages;
> -	struct page **pages = tt->pages;
> +	struct ttm_pool_alloc_state alloc;
>  	enum ttm_caching page_caching;
>  	gfp_t gfp_flags = GFP_USER;
>  	pgoff_t caching_divide;
>  	unsigned int order;
> +	bool allow_pools;
>  	struct page *p;
>  	int r;
>  
> -	WARN_ON(!num_pages || ttm_tt_is_populated(tt));
> -	WARN_ON(dma_addr && !pool->dev);
> +	ttm_pool_alloc_state_init(tt, &alloc);
> +
> +	WARN_ON(!alloc.remaining_pages || ttm_tt_is_populated(tt));
> +	WARN_ON(alloc.dma_addr && !pool->dev);
>  
>  	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
>  		gfp_flags |= __GFP_ZERO;
> @@ -453,67 +507,46 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	else
>  		gfp_flags |= GFP_HIGHUSER;
>  
> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> -	     num_pages;
> -	     order = min_t(unsigned int, order, __fls(num_pages))) {
> +	page_caching = tt->caching;
> +	allow_pools = true;
> +	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, &alloc);
> +	     alloc.remaining_pages;
> +	     order = ttm_pool_alloc_find_order(order, &alloc)) {
>  		struct ttm_pool_type *pt;
>  
> -		page_caching = tt->caching;
> -		pt = ttm_pool_select_type(pool, tt->caching, order);
> -		p = pt ? ttm_pool_type_take(pt) : NULL;
> -		if (p) {
> -			r = ttm_pool_apply_caching(caching, pages,
> -						   tt->caching);
> -			if (r)
> -				goto error_free_page;
> -
> -			caching = pages;
> -			do {
> -				r = ttm_pool_page_allocated(pool, order, p,
> -							    &dma_addr,
> -							    &num_pages,
> -							    &pages);
> -				if (r)
> -					goto error_free_page;
> -
> -				caching = pages;
> -				if (num_pages < (1 << order))
> -					break;
> -
> -				p = ttm_pool_type_take(pt);
> -			} while (p);
> -		}
> -
> -		page_caching = ttm_cached;
> -		while (num_pages >= (1 << order) &&
> -		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
> -
> -			if (PageHighMem(p)) {
> -				r = ttm_pool_apply_caching(caching, pages,
> -							   tt->caching);
> -				if (r)
> -					goto error_free_page;
> -				caching = pages;
> -			}
> -			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
> -						    &num_pages, &pages);
> -			if (r)
> -				goto error_free_page;
> -			if (PageHighMem(p))
> -				caching = pages;
> +		/* First, try to allocate a page from a pool if one exists. */
> +		p = NULL;
> +		pt = ttm_pool_select_type(pool, page_caching, order);
> +		if (pt && allow_pools)
> +			p = ttm_pool_type_take(pt);
> +		/*
> +		 * If that fails or previously failed, allocate from system.
> +		 * Note that this also disallows additional pool allocations using
> +		 * write-back cached pools of the same order. Consider removing
> +		 * that behaviour.
> +		 */
> +		if (!p) {
> +			page_caching = ttm_cached;
> +			allow_pools = false;
> +			p = ttm_pool_alloc_page(pool, gfp_flags, order);
>  		}
> -
> +		/* If that fails, lower the order if possible and retry. */
>  		if (!p) {
>  			if (order) {
>  				--order;
> +				page_caching = tt->caching;
> +				allow_pools = true;
>  				continue;
>  			}
>  			r = -ENOMEM;
>  			goto error_free_all;
>  		}
> +		r = ttm_pool_page_allocated(pool, order, p, page_caching, &alloc);
> +		if (r)
> +			goto error_free_page;
>  	}
>  
> -	r = ttm_pool_apply_caching(caching, pages, tt->caching);
> +	r = ttm_pool_apply_caching(&alloc);
>  	if (r)
>  		goto error_free_all;
>  
> @@ -523,10 +556,10 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	ttm_pool_free_page(pool, page_caching, order, p);
>  
>  error_free_all:
> -	num_pages = tt->num_pages - num_pages;
> -	caching_divide = caching - tt->pages;
> +	caching_divide = alloc.caching_divide - tt->pages;
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
> -	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide, num_pages);
> +	ttm_pool_free_range(pool, tt, ttm_cached, caching_divide,
> +			    tt->num_pages - alloc.remaining_pages);
>  
>  	return r;
>  }
> -- 
> 2.47.1
> 
