Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B594367F3AF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 02:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9695D10E2EB;
	Sat, 28 Jan 2023 01:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43C610E2F9;
 Sat, 28 Jan 2023 01:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674868977; x=1706404977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gg6lXKXW1DW24f/ukYPIMry1KgWrrWm3pNsj7/S4ewI=;
 b=am8oK1RrNQOwht9BSMVq96GdtNTzyQBngBEpHpr1su1D50WpNw8rj6kw
 SAgVI+DM+GFfPuuzX/hOga3shg1zDiltxocygB1nrxTPe9Ad4hItDM6tX
 aVj333HUtLs8nv8oXEX6DpHqv4gLS65ph5pf1LVDQqwQZtOYejOiu82qO
 +PCQpxkdrkSFONeUQlRE96oOW5jS2rStK7waczj8wNZZLx+5ZD6zsZE1g
 o7avfFxxe5PAKXHhwWEtLNuWFFlLqKDREnfn3GDXbXRtn7P6Y1ihUGbyP
 +/U4HY6m/j/jcG160ZCc9Y0wEegFNj454eXN6NBkCruuT1mbMT5n/pZsr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="307587569"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="307587569"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 17:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="695722808"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="695722808"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 27 Jan 2023 17:22:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:22:57 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 17:22:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 17:22:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 17:22:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhQ+KRSGya1id8RUl+VaeHaFwqMoNjpF4zlckARLyVk3zqe1SF5IpXmbi1Y+NyuGQTvuM9fMqehw7I//XMjXrRqfIV1lAPF9Neku+ZIM/8m5jXaWrdk6zb557RAV/S8hukx9NeMTsZEORNNHGjSsqXXDdTfOZffySNqKn+++89V21qAeVF3kWkMIYLexqre7H3uAC0vyGBD46KsiwjlWLGB2BRqq4IF7TB/Yyhitz1vaNJK+rZxypfZoS49+zb+4rG9zgoocWAN6NMVIdMGvaoXsPtHsaSRVZ7t2UA4CWosMq9YDoBoNcPvsaiQhipnBVaFeWAwDNMgQF0hqpujYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H4fb148MG4ZPoAsBL5sRnt8UYD3Kc4/OgRYktUpmIc=;
 b=ZQoEx0ZdaBLbEZh+Y0HklcTKpoHgyXU+HiyHXBg+GB9Dm5YvFaTZY7WZ3KdXWQHY9pinweiaEXS+dN84aDg+HDIARR+6HcFEcEl+XpOWo18qNtdAxdZ8ixaoC8NsAM4CHVEgLsEDKe3q75phseF66mOw+MnNgvgqmFA0R7QvJep+jou4GVHBr3TArgeul65ypWfZKCDzmp4LFUi5gQ+zOAFuoTHJC09Y4Ks5FpBAdgipmXzChmTKc7DnqrGWDlbMRb5LTkX60HlIWYBzLv24nW5Y0Tvj3PYN7D6B/LCE2RXIqWXqU0Sy/JShIyZ5gh39c8Bv5Ld+12jlQP7ArIae4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Sat, 28 Jan
 2023 01:22:53 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e1a3:6ad3:9f43:5f25%4]) with mapi id 15.20.6043.022; Sat, 28 Jan 2023
 01:22:53 +0000
Message-ID: <cc1ff6ac-45f8-9e4b-5d83-feb692e0608e@intel.com>
Date: Fri, 27 Jan 2023 17:22:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 7/8] drm/i915/guc: Update GuC messages in
 intel_guc_submission.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
 <20230124170522.1808-8-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230124170522.1808-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: bd24eff8-cd5d-4f3f-cec1-08db00ce2dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwRHT/QZvLvAhybegarRWMIH5SsVMqsUX8YrhcpHIOS41eYMDvQ8ssu0LcCdiLhd7B+teZIAyjDGcB0lwGcSWR4a4vPsXTsmVz5prnVCfa0tyjE8LQhUKjIX3+heVKfyt5Uc82HuQ+7pI2IcudFOvmHHCzZqVboWYU7XckbpuX+GjW2gLGHE1SQapP1/vV0mCI/oK6tYnFCTYOZOKrUj0fXi63oOwzuShq7aZCr4NcOou5vCtH9vn8aiOV9alsnaJeuiWVphe8nL9d5Ut7QxgWPNwG52i+XqLPYplQQUMqwKq5f3EeVLVhUuCI/w8t+7Rl2bKtaXwlACcytx6UkWi6t++KlUeFWTTqTc45Q//Wt1UvRFUKGxt3v0y6ZLbfkd7jDlfsXwjLiKrLQfr1lZlIhSBAypLbIFbj5mDqQ97REs0OfRWMqC44DMuUo/jiXO4TU/bAIlZZASK/x8PPOxx8H8Gdo2lpygqjZg2UibAx5QjvgQBA8UbwxAPq5f8OJU3ziYLxXZTaUNvus3IAaQWjybsR3TaiOGwnAkxhPvwa9+ednM3rg1YZyQqmXGrwtotqmIpZ+Z5I6JNvauVjaSSjLXcvnoSwC8ELXIO9zCFkNt7dybmHWaE4GuLmsuht5z6UoIMfJSjtYse4JvrFNGvWdQ0CjJHi/GjaHI+vpw5ANKccYjKJ9tZhmU3eyhrmqeRhRD0SVxl5JYSFB0tzs0fkrynPBdrkw4XyznZQ9IOBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199018)(83380400001)(31686004)(36756003)(82960400001)(15650500001)(316002)(5660300002)(2616005)(38100700002)(31696002)(86362001)(26005)(186003)(6512007)(6486002)(2906002)(478600001)(8676002)(4326008)(66476007)(66946007)(8936002)(450100002)(66556008)(53546011)(6506007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVlQalIwVC9jZmY5RHBhcllQdjJTWWorNXdoc284TWZjdEtCSGE3UVFWQXFO?=
 =?utf-8?B?b2ZQWEI3a2FQWmVWUm15RHlNSXlEelpyeGYrQWdRckZubHcrNENlYlhqRXVa?=
 =?utf-8?B?emJLcm9UZFBROU52UlZVTzZxQ25IZ1JTS1lJcUU1enRwRjN5UEdNdVFMNGRL?=
 =?utf-8?B?OWhNK1NXY2ZUM3F5L2djeWxvMURHVXk4NXZtNGlRbWo3TzEvdXZzcSs2TUJD?=
 =?utf-8?B?ZEEra2QxQ1ZHQkxSMWc2MXo0d0dWMGRVL04rUVhFblVLcjhMOS9uc3JhbG0v?=
 =?utf-8?B?YlpqQy85cmRGUVpjVDZ1aUUwR3VtWm44NDdRS2dzeDhhRmI0SHVpaVBxeUt1?=
 =?utf-8?B?dXBhNVQ5MEhhMXd1ZDhzUFp0N1pjU3BWQmxsWFdKNGErK2RoTmdWbkNvQUJ2?=
 =?utf-8?B?ajI0bVJLYWVCRXNOWVNwY2JNSWNJTFFUTGppUWlKQ2h0YlZCTEVqOSs0MjVk?=
 =?utf-8?B?N0ZKTWxvMDlhazRObklsWmUzbXFsK2JNRk5Ca0ZTdUtwN1FwWHl0cHZiR2Rs?=
 =?utf-8?B?ZTVSV1RLZERKcjA3QVBSNDN1NnhBWlJsN0NVUGZFTkJwQmpPVjEydmVvcmJP?=
 =?utf-8?B?WWlocVlCV2ZQaWZqdkRXOVNGckdZMFJyZUtoNXp1TDljc3Q5a3A3MWFKbWI0?=
 =?utf-8?B?dDhkZHZWTnV5cGpxNWswaUtRQm55MjhCck5USEdnaDduUU9OMXVRZUpZWDZJ?=
 =?utf-8?B?U1hzWFRMdGYvSHlpeXdQcHh3ekwxM3RXN1JYMGFSbmFIK25pMHNUVk4vQ1Zn?=
 =?utf-8?B?VnR4VnlZRUhmVEkwZzV2SHVtcmU3SUlMSWZwcW52bVV6UlNMQjVYbVJpbS85?=
 =?utf-8?B?ZjhnTkJVWGl3dzZ1YURLQVo5cjRTL0hrR0czeWJLYTd4M0tKdzRJcDc1Vjdr?=
 =?utf-8?B?eWNVbVprZzhYUWNJQWtwOWVoQVM3aGxveUk5U2ZCMHpPQXRkekNrMnpHckpG?=
 =?utf-8?B?VzVxcFpWMXpZWFlDclAxSWFJdUVEOGpabmV1dGZmQXBtQkRnZlJNVlVCNWJj?=
 =?utf-8?B?VWFEa1ptU3g1VGlFeUt3QXViSmh5Z3hZeEpVbHkxZEh1UG42dmZwak5OVm1m?=
 =?utf-8?B?ZndDOGJVMnlkREZPVENKVXVENUNWVkkrbCtkU0s3U0RvWDNJVWRTVWFFYWt0?=
 =?utf-8?B?U0pZNnNUOG1lcHIwOWhsMU1hUk5GMC9BUTlwLzNIMU5BUGEyRHF2MW5TN09Y?=
 =?utf-8?B?MGc5cGZKU0VDZGx5WEszeHpZam5Nd3FCLzU0UXBoYU9Ccy93cTFWbzNzVmhQ?=
 =?utf-8?B?dUF0WFErMy9CQ1N3YkRkNXEyMVltdzRLMFZuV3BOeEZ5UDB0ZmZqcEFITnZO?=
 =?utf-8?B?U0JqMXpXdEpQQkpnSXNWSSsrMTZPakloZTYwaU40WHg5U1FXUjZIYlBFUzJp?=
 =?utf-8?B?Zmdyd2J1QzRkdGl5SlZ3MnFsMys1K2V6bnFWbWR5TTh1SEd3OFFGUE1ETDBj?=
 =?utf-8?B?bzZTUnFOZDJ5dHpMMTJhWnJEWmowKzRRcU1nRVJWRDRaME5JMEJjZEc1RXpQ?=
 =?utf-8?B?K1g4bmFoU3l3ZHNiRXlvK1NnR29tUGYvazRQbWxmbjJtbVpubE14RkYzS3dx?=
 =?utf-8?B?KzFKQ3BHaWdIdGRmNjRRUmdUTkRiL2pxYmNiRlIyUEZ1V2JQeW9kS3AwMjVu?=
 =?utf-8?B?NDNkSFNtZm9VUzBTa1JkeGQ3RU4xb1JGVFNLeFZJTkFGdHJqRnhwa1lZQ3hT?=
 =?utf-8?B?ZjBRUXM5VW9rZjNCQ21PN1EvZHhpa2EzM2RWWjJDbFA5dEl1KzRoazRIa2NT?=
 =?utf-8?B?aFhkVFVGNEtYOWJxdWlCU1dGL3ZrTjU0QjFiYkxvdzBYZ3Y5QTlGUTk4eEZq?=
 =?utf-8?B?R1Q1WHBqYlpHamlxWWh2VEgrR0F5NHVXeFdGU2FBOXUvL0V6bzVFRUNia2hT?=
 =?utf-8?B?dG1WbURXQnZtSmdNcm5YcWFtMndxVGdvcGxvU0RaNXk4MXN3LzhTei9CdGta?=
 =?utf-8?B?VjJSdVZYQmRSOWlMOXp3WlVGd04wYTJGZFRjdmovMlFhZEI0cDQ3OHVuYytF?=
 =?utf-8?B?M1FhTGN1TGdSK0V2bFpFbnhKbkFxeXp4MUZoZjhwbWNsWHY2NGZtazY4UE1R?=
 =?utf-8?B?UEEzMjhITU9pdzRyN3d4a3c1YlBFMUQ2ZmhjZTVtNTBBaDBkVmpLV2ZhODFD?=
 =?utf-8?B?Z2xPQTE3Z3N6SWVwOGY0QXpNcFlYNVpJZXR3ZkZTQXBkc1AxVjFhdnhVMSth?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd24eff8-cd5d-4f3f-cec1-08db00ce2dc0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 01:22:53.4868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /a8n2tbA89AVNACl5mPD8jL1D7ozmj4t7IZx3wN9PYFQ0sVQhpTz2tEj2TeZVSFM/YKYGyey8PqsHPp1fkpCl17oFC6r0lihJUjjY2o4jDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/2023 09:05, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> v2: improve few existing messages
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++++-----------
>   1 file changed, 26 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e4..b2250181f31b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -27,6 +27,7 @@
>   
>   #include "intel_guc_ads.h"
>   #include "intel_guc_capture.h"
> +#include "intel_guc_print.h"
>   #include "intel_guc_submission.h"
>   
>   #include "i915_drv.h"
> @@ -1443,8 +1444,7 @@ static void guc_init_engine_stats(struct intel_guc *guc)
>   		int ret = guc_action_enable_usage_stats(guc);
>   
>   		if (ret)
> -			drm_err(&gt->i915->drm,
> -				"Failed to enable usage stats: %d!\n", ret);
> +			guc_err(guc, "Failed to enable usage stats: %pe\n", ERR_PTR(ret));
>   	}
>   }
>   
> @@ -3585,8 +3585,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   		intel_context_sched_disable_unpin(ce);
>   	else if (intel_context_is_closed(ce))
>   		if (wait_for(context_close_done(ce), 1500))
> -			drm_warn(&guc_to_gt(guc)->i915->drm,
> -				 "timed out waiting on context sched close before realloc\n");
> +			guc_warn(guc, "timed out waiting on context sched close before realloc\n");
>   	/*
>   	 * Call pin_guc_id here rather than in the pinning step as with
>   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> @@ -4349,11 +4348,14 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
>   
>   	ret = intel_guc_send(guc, (u32 *)&policy->h2g,
>   			     __guc_scheduling_policy_action_size(policy));
> -	if (ret < 0)
> +	if (ret < 0) {
> +		guc_probe_error(guc, "Failed to configure global scheduling policies: %pe!\n",
> +				ERR_PTR(ret));
>   		return ret;
> +	}
>   
>   	if (ret != policy->count) {
> -		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
> +		guc_warn(guc, "global scheduler policy processed %d of %d KLVs!",
>   			 ret, policy->count);
>   		if (ret > policy->count)
>   			return -EPROTO;
> @@ -4367,7 +4369,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	struct scheduling_policy policy;
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	intel_wakeref_t wakeref;
> -	int ret = 0;
> +	int ret;
>   
>   	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
>   		return 0;
> @@ -4385,10 +4387,6 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   						yield, ARRAY_SIZE(yield));
>   
>   		ret = __guc_action_set_scheduling_policies(guc, &policy);
> -		if (ret)
> -			i915_probe_error(gt->i915,
> -					 "Failed to configure global scheduling policies: %pe!\n",
> -					 ERR_PTR(ret));
>   	}
>   
>   	return ret;
> @@ -4487,21 +4485,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
>   	struct intel_context *ce;
>   
>   	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid ctx_id %u\n", ctx_id);
> +		guc_err(guc, "Invalid ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
>   	ce = __get_context(guc, ctx_id);
>   	if (unlikely(!ce)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Context is NULL, ctx_id %u\n", ctx_id);
> +		guc_err(guc, "Context is NULL, ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
>   	if (unlikely(intel_context_is_child(ce))) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Context is child, ctx_id %u\n", ctx_id);
> +		guc_err(guc, "Context is child, ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
> @@ -4516,7 +4511,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   	u32 ctx_id;
>   
>   	if (unlikely(len < 1)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
> +		guc_err(guc, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
>   	ctx_id = msg[0];
> @@ -4568,7 +4563,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	u32 ctx_id;
>   
>   	if (unlikely(len < 2)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
> +		guc_err(guc, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
>   	ctx_id = msg[0];
> @@ -4580,8 +4575,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	if (unlikely(context_destroyed(ce) ||
>   		     (!context_pending_enable(ce) &&
>   		     !context_pending_disable(ce)))) {
> -		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Bad context sched_state 0x%x, ctx_id %u\n",
> +		guc_err(guc, "Bad context sched_state 0x%x, ctx_id %u\n",
>   			ce->guc_state.sched_state, ctx_id);
>   		return -EPROTO;
>   	}
> @@ -4669,8 +4663,7 @@ static void guc_handle_context_reset(struct intel_guc *guc,
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
>   	} else {
> -		drm_info(&guc_to_gt(guc)->i915->drm,
> -			 "Ignoring context reset notification of exiting context 0x%04X on %s",
> +		guc_info(guc, "Ignoring context reset notification of exiting context 0x%04X on %s",
>   			 ce->guc_id.id, ce->engine->name);
>   	}
>   }
> @@ -4683,7 +4676,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>   	int ctx_id;
>   
>   	if (unlikely(len != 1)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		guc_err(guc, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
> @@ -4716,13 +4709,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
>   	u32 status;
>   
>   	if (unlikely(len != 1)) {
> -		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		guc_dbg(guc, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
>   	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
>   	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
> -		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
> +		guc_warn(guc, "No space for error capture");
>   
>   	intel_guc_capture_process(guc);
>   
> @@ -4765,13 +4758,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   					 const u32 *msg, u32 len)
>   {
>   	struct intel_engine_cs *engine;
> -	struct intel_gt *gt = guc_to_gt(guc);
>   	u8 guc_class, instance;
>   	u32 reason;
>   	unsigned long flags;
>   
>   	if (unlikely(len != 3)) {
> -		drm_err(&gt->i915->drm, "Invalid length %u", len);
> +		guc_err(guc, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
> @@ -4781,8 +4773,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   
>   	engine = intel_guc_lookup_engine(guc, guc_class, instance);
>   	if (unlikely(!engine)) {
> -		drm_err(&gt->i915->drm,
> -			"Invalid engine %d:%d", guc_class, instance);
> +		guc_err(guc, "Invalid engine %d:%d", guc_class, instance);
>   		return -EPROTO;
>   	}
>   
> @@ -4790,7 +4781,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>   	 * This is an unexpected failure of a hardware feature. So, log a real
>   	 * error message not just the informational that comes with the reset.
>   	 */
> -	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
> +	guc_err(guc, "Engine reset failed on %d:%d (%s) because 0x%08X",
>   		guc_class, instance, engine->name, reason);
>   
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> @@ -5342,8 +5333,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   
>   		GEM_BUG_ON(!is_power_of_2(sibling->mask));
>   		if (sibling->mask & ve->base.mask) {
> -			DRM_DEBUG("duplicate %s entry in load balancer\n",
> -				  sibling->name);
> +			guc_dbg(guc, "duplicate %s entry in load balancer\n",
> +				sibling->name);
>   			err = -EINVAL;
>   			goto err_put;
>   		}
> @@ -5352,8 +5343,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   		ve->base.logical_mask |= sibling->logical_mask;
>   
>   		if (n != 0 && ve->base.class != sibling->class) {
> -			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
> -				  sibling->class, ve->base.class);
> +			guc_dbg(guc, "invalid mixing of engine class, sibling %d, already %d\n",
> +				sibling->class, ve->base.class);
>   			err = -EINVAL;
>   			goto err_put;
>   		} else if (n == 0) {

