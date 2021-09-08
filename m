Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072DC4041D9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 01:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B966E3D8;
	Wed,  8 Sep 2021 23:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D2D6E3D8;
 Wed,  8 Sep 2021 23:38:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220660727"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="220660727"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 16:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="648668993"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 08 Sep 2021 16:38:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 16:38:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 16:38:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 16:38:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 8 Sep 2021 16:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY9ZLPYF+g7yThcCKVuYREYBgTGpTHtHkqOeHE2K/FBshHWGk+dHuyyhFLmqNkGdBAr35dE197zpZSiArB2b1z0vEWSQHmgb23YDC2owKnYrL2YwPj1v5RR6rjWPPuEJWhFwDgYJ3ln7ogfYX6xYXqu4i2mshtGIiJzEb2tPE5UvDwHtzEm/Du5reOyiwuqQa9m1aFS2nMOH539U/DFtnA6z/uDk6qyqadO1Bm/R+OtEBkHDYVV5PdMQ/Yg9aRtkkxGxoxXcTHQxrOei1w15MJEzKscRgpCstdCoQwpA4V9TngtN8NQ9HOnMU6MHHMm/jMZtiIHaR8bUSbTpCDiLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ig9Va+RTK4aLBUez5cAoijFBkD8ve6Y4ZB60PmnLULk=;
 b=WTJNl99pY/IWWj8z4C6+7NJ70zB109Pe4Vt67Tp4UxPUEoFfGHdsn088O6jPQaygphpGsGrwmopuoWaJngx3MGck8ma6Axp063tILTkqDOhqLboiHy+gRZeR4M3gI9HrDu+EJ0FMOeQgk0YG/y++DHQbPGH/S2qLGbS8EIBttgI4rFgK4ZQY4vD+EFGfXw5BiPr8NjxTUs8aSV3PnT7AoSyqEGjfqxHer4jpqPDE30tc0nQhnA34a3fbHZIHBAamqOT8mT7NhdON5XnX+OyxP4QZvdSLaCF4HfPDz1oEawmXHaQLBiyfyDoKsXQjFG2cFxykwONRYiTfJEda2WRSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ig9Va+RTK4aLBUez5cAoijFBkD8ve6Y4ZB60PmnLULk=;
 b=zP9zbKMehuPcGt1e2oKB5LBK3ne9tmOGaqbIxpFchARWDddXOzosNzsJfnqMObUQNhvsbzQXIRGMqyCHwvpXmodmhxFnNjDW7U55g43Ti7gslxD2bZ5NBLq69VtBv+OnJqhURzBOFVAPhyqoJp3WW0856nXRleIax+zP1RReu1I=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 23:38:52 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 23:38:52 +0000
Subject: Re: [PATCH v5 25/25] drm/i915/guc: Add GuC kernel doc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <matthew.brost@intel.com>
References: <20210902005022.711767-26-daniele.ceraolospurio@intel.com>
 <20210903195917.746244-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <64e245cd-9e27-36f4-d190-725c0bd419c5@intel.com>
Date: Wed, 8 Sep 2021 16:38:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210903195917.746244-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:102:2::52) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR05CA0084.namprd05.prod.outlook.com (2603:10b6:102:2::52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Wed, 8 Sep 2021 23:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3815e545-459e-486b-3fca-08d97321d086
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB559583B799DD2D98AFBA3A42BDD49@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHSCNXQNcuwRECIgLtHVRuWMGirI1PSGZmVnnyBMbajpNfZe6sCjWfw3jLUoY3DGNFrjVpgT0CMLRRIVBVVMZOt9mRbvo70z8erSY7TXYQPYbv9bgpWOtR6JbBc6ZyYpSNFXkipoeaG9t7C4EiMVVToY64bmCX9cPA/2ZLkQk0UbJduyf5rtt9wdgSQDqA+O4O2M6p0ROSwBlOvs0QvbihadiCmnglb9K4eXi4TWcw8j2+PXQrx1/BOjmgFvxiWyH/iJ61/XaOk/lje7RTW9N6amc9WbPNMI1N99UtCdDKj5uGJ3Q4pONto3Wp/fR43B5ZK/qqM0rr/Yf+RWhY8/Aqjyg/uagqDaeXekYlZiQrsLR+JVbv4NK1apz0k9WMfDoRTZ8URFR5xgOYP7n/9fDtwneHy/JII4cdLMK44+GDJO4JAKAbwaWy3Gs9Ze+MO74S1unc3JHV22YXAT6pXLlSVvY0i8P2NH90edGN9hQmuW8gWr2m4s/KKr9qNBZ5wDAUhYaQzCwj1X0LR/TahxB9qr4tMV1NRCKIf5Bhy8R61ZwuLrJrlg2fhdwOzcYXpi+Tx88CLU63eL3gcCeWxqIMlGv2WoZ1RibW9YH3yUFELpTwOh1+zaE8GWQ/lPytBIGxsRySm6MYME2rXyhHqwtS2X0hMOrFX8XWjZZQ0IUYno9bJdlhk0burhMaoDB7xwQkc7ebcH9gyaXFt2QjiG+rZau+2qe2YF2QMu9G0UrQh/F5DJXaV9aCrWs2sfdTnG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(16576012)(66946007)(4326008)(6486002)(2906002)(86362001)(316002)(83380400001)(66476007)(66556008)(36756003)(31686004)(8936002)(26005)(186003)(53546011)(38100700002)(450100002)(5660300002)(478600001)(30864003)(8676002)(31696002)(2616005)(956004)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZlNjBiQ05lSlpYcExGUkdYSlZHMmdjN3dhYWRmQnpDRjJBUG9LWGFNeis5?=
 =?utf-8?B?c0JOUEcramM2RWc2eVBQS1YySUxYY25OS1FxYkF5YU82TFdPOFNMSU1kQ2M4?=
 =?utf-8?B?RkNIMVlXbU9TUEZqMThSTExrR2xxNTEyR3hYZFdoSXA0SHJ3a3VOSTdKbWQy?=
 =?utf-8?B?Vk15WmxXdUJOY0ZJTHhScXllVUJqN3lOSkduN2ZaY05kOTJuNWx0YkZVV3ZQ?=
 =?utf-8?B?RC81elU2Q25TOEVyVGhxMXMzNlV5bFQxaWxJNkJBVjBXeDh4K21EVEpsdXdD?=
 =?utf-8?B?QzB4bWhacUFDQ3hhSHpQcUpWRThXTFZ2SnFaV2NKb3JlNWhrTVVhbU5ra3kx?=
 =?utf-8?B?K0tDbkNJdEhITldDMGhIRGxDOXh3bUorTHhqR2F5MWpjS1Yvb29XQloremwy?=
 =?utf-8?B?bVIzS3FRWHBleWROUXNORjJKNGZjczlOTk5RQjY1UUxNSnI1aWk1WHdSbmRC?=
 =?utf-8?B?UkZjaE4yUEpBRUhKN2dBa2NzRHdVM3d2RS9iYjZnVjdDRjNjcFdMUVc2c1JK?=
 =?utf-8?B?MGs3cEJTWWNCL0NIeWlYVUlRQXNhMkltZHVzdDd0OEdYeDRYQitqR1BwVjRQ?=
 =?utf-8?B?VG9US0xETE1tZGY2VlI2dFZzZEg2b3ZReTgyaVNDMHZUakJVY3RqWGRPdUdL?=
 =?utf-8?B?L09pUHhDL1o0TDlpek5zNmU0QUlUWjZ0Zy9iQmZNcWFaR0Z4K0FONHlwZWtX?=
 =?utf-8?B?RjZFb2I1NWQ0TGJsaHNsQ3Q1QjF0VWFNTTU2dXBvaW1KaHBBTlBrdlVrVEdM?=
 =?utf-8?B?anFESFNxakxOU0lqNSsycnUwQVp2OVFydnFoaVhOUU04WS9KRHpDYkR1V0Ev?=
 =?utf-8?B?MnpjTTlPem0vaFdTOU96NU04aGtVRUhRZFd2WTBYSGpnVlJIY3VjMWRXTzJT?=
 =?utf-8?B?RmVoUytvVTNPc1IxdVJPaDFLNzRKQVdEamc1Ym9ubFZ1YWwxRHZCU21sbWow?=
 =?utf-8?B?aGh1SnZ4YkFvemMxQW0waVE1SHVwU0VFNDU1SG5KM2FuZExhNEtKOC8yMEdq?=
 =?utf-8?B?MEJISnJtN2N1aTQ5U2FYdFB2Y25nQjFUZ2Z1N2hUTmV6c0ZXdW5WbldIWmFr?=
 =?utf-8?B?TzB3Rzh6MnNrdHhKbzFSY09EZ1pNQkpYQjlnOWc0bFdXN2xYVy9qUDhscWpP?=
 =?utf-8?B?QVdreXVFYVVWWm9Gd2gyVVlFeVA5NHZFQjI4MW1vd2Z3a1M2by9aaUxMZTZv?=
 =?utf-8?B?YUdMWU1aUncvbmYvc0xibm1KTExBeWVibUM3VWpLeEx5dXE2RzlGN1lBUURy?=
 =?utf-8?B?anFxQTNseURFZ0xHRWNWa3h5UlY2TUZMeFJFZXpVYS9CK3pUQjZXMXFIMGc1?=
 =?utf-8?B?cU1LNmcrUkZtSjVqUW9MVkhxcjV6ZHhEUCs2dm9mWDJZc0k1eEdBR2tIK0hG?=
 =?utf-8?B?TUJOSVFZdE03a2plTlRLTFBZVlJyUzZQK2c0ZDBzMWJoSmdOdVFWQ1JnNTdr?=
 =?utf-8?B?VDZpQ01adk9rcmdreEdNazViU282L2FOaWVzdEdNTDJCL05URndmTThmOGpU?=
 =?utf-8?B?QnpvcEFOZzRnTE9CRmc2WWVPMXFTZUpjV2ZDREFPNnhUeTRkcFVtLyswTGZ4?=
 =?utf-8?B?WTZGRlAvM0VrV0oySVFpbVJyaFRBeGZyR21DeFBXRUY4ekV6ck1Za24vZWZv?=
 =?utf-8?B?OFhTajVROHZlV2VudHMxRHJHbU1oYlpyT0NONkxQYTF5RFhraGxuQnVQam1D?=
 =?utf-8?B?Nkp5RzFVQUtKRkxzZXpaNmlNV1ZJbTZrVmNIY05ZblYvKzNWTkdzVXJYYlRF?=
 =?utf-8?Q?TCwTwuJ+HLAg9xAzJebyQX9F3wV876APvvWf9PS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3815e545-459e-486b-3fca-08d97321d086
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 23:38:52.1509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VmMfS3AkyCrPo/7XDnTM/+L6PlnKEeth/gnkRJYWTwLL/EYYybEgvAbTYnq3o69os9AKe6/My7UCBavTUOFG63wquG5h7vdSs84SYXf3cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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

On 9/3/2021 12:59, Daniele Ceraolo Spurio wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> Add GuC kernel doc for all structures added thus far for GuC submission
> and update the main GuC submission section with the new interface
> details.
>
> v2:
>   - Drop guc_active.lock DOC
> v3:
>   - Fixup a few kernel doc comments (Daniele)
> v4 (Daniele):
>   - Implement doc suggestions from John
>   - Add kerneldoc for all members of the GuC structure and pull the file
>     in i915.rst
> v5 (Daniele):
>   - Implement new doc suggestions from John
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   Documentation/gpu/i915.rst                    |   2 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  43 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  75 ++++++++++---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 100 ++++++++++++++----
>   drivers/gpu/drm/i915/i915_request.h           |  21 ++--
>   5 files changed, 181 insertions(+), 60 deletions(-)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 101dde3eb1ea..311e10400708 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -495,6 +495,8 @@ GuC
>   .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.c
>      :doc: GuC
>   
> +.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +
>   GuC Firmware Layout
>   ~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 5285d660eacf..930569a1a01f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -156,40 +156,51 @@ struct intel_context {
>   	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
>   
>   	struct {
> -		/** lock: protects everything in guc_state */
> +		/** @lock: protects everything in guc_state */
>   		spinlock_t lock;
>   		/**
> -		 * sched_state: scheduling state of this context using GuC
> +		 * @sched_state: scheduling state of this context using GuC
>   		 * submission
>   		 */
>   		u32 sched_state;
>   		/*
> -		 * fences: maintains of list of requests that have a submit
> -		 * fence related to GuC submission
> +		 * @fences: maintains a list of requests that are currently
> +		 * being fenced until a GuC operation completes
>   		 */
>   		struct list_head fences;
> -		/* GuC context blocked fence */
> +		/**
> +		 * @blocked: fence used to signal when the blocking of a
> +		 * context's submissions is complete.
> +		 */
>   		struct i915_sw_fence blocked;
> -		/* GuC committed requests */
> +		/** @number_committed_requests: number of committed requests */
>   		int number_committed_requests;
> -		/** requests: active requests on this context */
> +		/** @requests: list of active requests on this context */
>   		struct list_head requests;
> -		/*
> -		 * GuC priority management
> -		 */
> +		/** @prio: the context's current guc priority */
>   		u8 prio;
> +		/**
> +		 * @prio_count: a counter of the number requests in flight in
> +		 * each priority bucket
> +		 */
>   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
>   	} guc_state;
>   
>   	struct {
> -		/* GuC LRC descriptor ID */
> +		/**
> +		 * @id: handle which is used to uniquely identify this context
> +		 * with the GuC, protected by guc->contexts_lock
> +		 */
>   		u16 id;
> -
> -		/* GuC LRC descriptor reference count */
> +		/**
> +		 * @ref: the number of references to the guc_id, when
> +		 * transitioning in and out of zero protected by
> +		 * guc->contexts_lock
> +		 */
>   		atomic_t ref;
> -
> -		/*
> -		 * GuC ID link - in list when unpinned but guc_id still valid in GuC
> +		/**
> +		 * @link: in guc->guc_id_list when the guc_id has no refs but is
> +		 * still valid, protected by guc->contexts_lock
>   		 */
>   		struct list_head link;
>   	} guc_id;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 2e27fe59786b..5dd174babf7a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -22,74 +22,121 @@
>   
>   struct __guc_ads_blob;
>   
> -/*
> - * Top level structure of GuC. It handles firmware loading and manages client
> - * pool. intel_guc owns a intel_guc_client to replace the legacy ExecList
> - * submission.
> +/**
> + * struct intel_guc - Top level structure of GuC.
> + *
> + * It handles firmware loading and manages client pool. intel_guc owns an
> + * i915_sched_engine for submission.
>    */
>   struct intel_guc {
> +	/** @fw: the GuC firmware */
>   	struct intel_uc_fw fw;
> +	/** @log: sub-structure containing GuC log related data and objects */
>   	struct intel_guc_log log;
> +	/** @ct: the command transport communication channel */
>   	struct intel_guc_ct ct;
> +	/** @slpc: sub-structure containing SLPC related data and objects */
>   	struct intel_guc_slpc slpc;
>   
> -	/* Global engine used to submit requests to GuC */
> +	/** @sched_engine: Global engine used to submit requests to GuC */
>   	struct i915_sched_engine *sched_engine;
> +	/**
> +	 * @stalled_request: if GuC can't process a request for any reason, we
> +	 * save it until GuC restarts processing. No other request can be
> +	 * submitted until the stalled request is processed.
> +	 */
>   	struct i915_request *stalled_request;
>   
>   	/* intel_guc_recv interrupt related state */
> +	/** @irq_lock: protects GuC irq state */
>   	spinlock_t irq_lock;
> +	/**
> +	 * @msg_enabled_mask: mask of events that are processed when receiving
> +	 * an INTEL_GUC_ACTION_DEFAULT G2H message.
> +	 */
>   	unsigned int msg_enabled_mask;
>   
> +	/**
> +	 * @outstanding_submission_g2h: number of outstanding GuC to Host
> +	 * responses related to GuC submission, used to determine if the GT is
> +	 * idle
> +	 */
>   	atomic_t outstanding_submission_g2h;
>   
> +	/** @interrupts: pointers to GuC interrupt-managing functions. */
>   	struct {
>   		void (*reset)(struct intel_guc *guc);
>   		void (*enable)(struct intel_guc *guc);
>   		void (*disable)(struct intel_guc *guc);
>   	} interrupts;
>   
> -	/*
> -	 * contexts_lock protects the pool of free guc ids and a linked list of
> -	 * guc ids available to be stolen
> +	/**
> +	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
> +	 * ce->guc_id.ref when transitioning in and out of zero
>   	 */
>   	spinlock_t contexts_lock;
> +	/** @guc_ids: used to allocate unique ce->guc_id.id values */
>   	struct ida guc_ids;
> +	/**
> +	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> +	 */
>   	struct list_head guc_id_list;
>   
> +	/**
> +	 * @submission_supported: tracks whether we support GuC submission on
> +	 * the current platform
> +	 */
>   	bool submission_supported;
> +	/** @submission_selected: tracks whether the user enabled GuC submission */
>   	bool submission_selected;
> +	/**
> +	 * @rc_supported: tracks whether we support GuC rc on the current platform
> +	 */
>   	bool rc_supported;
> +	/** @rc_selected: tracks whether the user enabled GuC rc */
>   	bool rc_selected;
>   
> +	/** @ads_vma: object allocated to hold the GuC ADS */
>   	struct i915_vma *ads_vma;
> +	/** @ads_blob: contents of the GuC ADS */
>   	struct __guc_ads_blob *ads_blob;
> +	/** @ads_regset_size: size of the save/restore regsets in the ADS */
>   	u32 ads_regset_size;
> +	/** @ads_golden_ctxt_size: size of the golden contexts in the ADS */
>   	u32 ads_golden_ctxt_size;
>   
> +	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
>   	struct i915_vma *lrc_desc_pool;
> +	/** @lrc_desc_pool_vaddr: contents of the GuC LRC descriptor pool */
>   	void *lrc_desc_pool_vaddr;
>   
> -	/* guc_id to intel_context lookup */
> +	/**
> +	 * @context_lookup: used to resolve intel_context from guc_id, if a
> +	 * context is present in this structure it is registered with the GuC
> +	 */
>   	struct xarray context_lookup;
>   
> -	/* Control params for fw initialization */
> +	/** @params: Control params for fw initialization */
>   	u32 params[GUC_CTL_MAX_DWORDS];
>   
> -	/* GuC's FW specific registers used in MMIO send */
> +	/** @send_regs: GuC's FW specific registers used for sending MMIO H2G */
>   	struct {
>   		u32 base;
>   		unsigned int count;
>   		enum forcewake_domains fw_domains;
>   	} send_regs;
>   
> -	/* register used to send interrupts to the GuC FW */
> +	/** @notify_reg: register used to send interrupts to the GuC FW */
>   	i915_reg_t notify_reg;
>   
> -	/* Store msg (e.g. log flush) that we see while CTBs are disabled */
> +	/**
> +	 * @mmio_msg: notification bitmask that the GuC writes in one of its
> +	 * registers when the CT channel is disabled, to be processed when the
> +	 * channel is back up.
> +	 */
>   	u32 mmio_msg;
>   
> -	/* To serialize the intel_guc_send actions */
> +	/** @send_mutex: used to serialize the intel_guc_send actions */
>   	struct mutex send_mutex;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 6a894c3b7925..6997078ae1ac 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -28,21 +28,6 @@
>   /**
>    * DOC: GuC-based command submission
>    *
> - * IMPORTANT NOTE: GuC submission is currently not supported in i915. The GuC
> - * firmware is moving to an updated submission interface and we plan to
> - * turn submission back on when that lands. The below documentation (and related
> - * code) matches the old submission model and will be updated as part of the
> - * upgrade to the new flow.
> - *
> - * GuC stage descriptor:
> - * During initialization, the driver allocates a static pool of 1024 such
> - * descriptors, and shares them with the GuC. Currently, we only use one
> - * descriptor. This stage descriptor lets the GuC know about the workqueue and
> - * process descriptor. Theoretically, it also lets the GuC know about our HW
> - * contexts (context ID, etc...), but we actually employ a kind of submission
> - * where the GuC uses the LRCA sent via the work item instead. This is called
> - * a "proxy" submission.
> - *
>    * The Scratch registers:
>    * There are 16 MMIO-based registers start from 0xC180. The kernel driver writes
>    * a value to the action register (SOFT_SCRATCH_0) along with any data. It then
> @@ -51,14 +36,85 @@
>    * processes the request. The kernel driver polls waiting for this update and
>    * then proceeds.
>    *
> - * Work Items:
> - * There are several types of work items that the host may place into a
> - * workqueue, each with its own requirements and limitations. Currently only
> - * WQ_TYPE_INORDER is needed to support legacy submission via GuC, which
> - * represents in-order queue. The kernel driver packs ring tail pointer and an
> - * ELSP context descriptor dword into Work Item.
> - * See guc_add_request()
> + * Command Transport buffers (CTBs):
> + * Covered in detail in other sections but CTBs (Host to GuC - H2G, GuC to Host
> + * - G2H) are a message interface between the i915 and GuC.
> + *
> + * Context registration:
> + * Before a context can be submitted it must be registered with the GuC via a
> + * H2G. A unique guc_id is associated with each context. The context is either
> + * registered at request creation time (normal operation) or at submission time
> + * (abnormal operation, e.g. after a reset).
> + *
> + * Context submission:
> + * The i915 updates the LRC tail value in memory. The i915 must enable the
> + * scheduling of the context within the GuC for the GuC to actually consider it.
> + * Therefore, the first time a disabled context is submitted we use a schedule
> + * enable H2G, while follow up submissions are done via the context submit H2G,
> + * which informs the GuC that a previously enabled context has new work
> + * available.
> + *
> + * Context unpin:
> + * To unpin a context a H2G is used to disable scheduling. When the
> + * corresponding G2H returns indicating the scheduling disable operation has
> + * completed it is safe to unpin the context. While a disable is in flight it
> + * isn't safe to resubmit the context so a fence is used to stall all future
> + * requests of that context until the G2H is returned.
> + *
> + * Context deregistration:
> + * Before a context can be destroyed or if we steal its guc_id we must
> + * deregister the context with the GuC via H2G. If stealing the guc_id it isn't
> + * safe to submit anything to this guc_id until the deregister completes so a
> + * fence is used to stall all requests associated with this guc_id until the
> + * corresponding G2H returns indicating the guc_id has been deregistered.
> + *
> + * guc_ids:
> + * Unique number associated with private GuC context data passed in during
> + * context registration / submission / deregistration. 64k available. Simple ida
> + * is used for allocation.
> + *
> + * Stealing guc_ids:
> + * If no guc_ids are available they can be stolen from another context at
> + * request creation time if that context is unpinned. If a guc_id can't be found
> + * we punt this problem to the user as we believe this is near impossible to hit
> + * during normal use cases.
> + *
> + * Locking:
> + * In the GuC submission code we have 3 basic spin locks which protect
> + * everything. Details about each below.
> + *
> + * sched_engine->lock
> + * This is the submission lock for all contexts that share an i915 schedule
> + * engine (sched_engine), thus only one of the contexts which share a
> + * sched_engine can be submitting at a time. Currently only one sched_engine is
> + * used for all of GuC submission but that could change in the future.
> + *
> + * guc->contexts_lock
> + * Protects guc_id allocation for the given GuC, i.e. only one context can be
> + * doing guc_id allocation operations at a time for each GuC in the system.
> + *
> + * ce->guc_state.lock
> + * Protects everything under ce->guc_state. Ensures that a context is in the
> + * correct state before issuing a H2G. e.g. We don't issue a schedule disable
> + * on a disabled context (bad idea), we don't issue a schedule enable when a
> + * schedule disable is in flight, etc... Also protects list of inflight requests
> + * on the context and the priority management state. Lock is individual to each
> + * context.
> + *
> + * Lock ordering rules:
> + * sched_engine->lock -> ce->guc_state.lock
> + * guc->contexts_lock -> ce->guc_state.lock
>    *
> + * Reset races:
> + * When a full GT reset is triggered it is assumed that some G2H responses to
> + * H2Gs can be lost as the GuC is also reset. Losing these G2H can prove to be
> + * fatal as we do certain operations upon receiving a G2H (e.g. destroy
> + * contexts, release guc_ids, etc...). When this occurs we can scrub the
> + * context state and cleanup appropriately, however this is quite racey.
> + * To avoid races, the reset code must disable submission before scrubbing for
> + * the missing G2H, while the submission code must check for submission being
> + * disabled and skip sending H2Gs and updating context states when it is. Both
> + * sides must also make sure to hold the relevant locks.
>    */
>   
>   /* GuC Virtual Engine */
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index d818cfbfc41d..7bd9ed20623e 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -290,18 +290,23 @@ struct i915_request {
>   		struct hrtimer timer;
>   	} watchdog;
>   
> -	/*
> -	 * Requests may need to be stalled when using GuC submission waiting for
> -	 * certain GuC operations to complete. If that is the case, stalled
> -	 * requests are added to a per context list of stalled requests. The
> -	 * below list_head is the link in that list.
> +	/**
> +	 * @guc_fence_link: Requests may need to be stalled when using GuC
> +	 * submission waiting for certain GuC operations to complete. If that is
> +	 * the case, stalled requests are added to a per context list of stalled
> +	 * requests. The below list_head is the link in that list. Protected by
> +	 * ce->guc_state.lock.
>   	 */
>   	struct list_head guc_fence_link;
>   
>   	/**
> -	 * Priority level while the request is inflight. Differs from i915
> -	 * scheduler priority. See comment above
> -	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details.
> +	 * @guc_prio: Priority level while the request is in flight. Differs
> +	 * from i915 scheduler priority. See comment above
> +	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details. Protected by
> +	 * ce->guc_active.lock. Two special values (GUC_PRIO_INIT and
> +	 * GUC_PRIO_FINI) outside the GuC priority range are used to indicate
> +	 * if the priority has not been initialized yet or if no more updates
> +	 * are possible because the request has completed.
>   	 */
>   #define	GUC_PRIO_INIT	0xff
>   #define	GUC_PRIO_FINI	0xfe

