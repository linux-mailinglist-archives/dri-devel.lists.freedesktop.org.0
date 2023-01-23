Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72A678B99
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C910E5C2;
	Mon, 23 Jan 2023 23:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0186210E5BF;
 Mon, 23 Jan 2023 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674514907; x=1706050907;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gKH7uKPO8VrmQPYKniiNlxh7eiZeFBuXBlZkXItPhA4=;
 b=czQ+f/NNop8eBfdTtNqq0EYHrIhLs8K+sGv+1yKNtIQ7AWUOkKcpaLvi
 MUFvDY7PSOAD9bx/0HaR4JAyWT53fqai2b8a5bxY0nPhYfqKfQy+hAu1H
 wv5XE0TxGH822ZWPf05OV1KS77P0dyfCxopyM0//m3oBQdJwohl+O/AHq
 a3U8SBQ81eK/AhuGFnFk6pA7+DZue0ukinHjNkRNvlZ4bqzAbEbKe2biY
 vqtz0XxSukCY6MjoGT64tdWH5epguHeJvuPxu5OonPl1p59o0MzjXaAhn
 WXOXorW4vDcMtDuVXBOb7yGSy245t2XvrZTG4E/7uYRyZgvMI9n+UdrXh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324854655"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="324854655"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 15:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655200215"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="655200215"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 15:01:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 15:01:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 15:01:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 23 Jan 2023 15:01:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 23 Jan 2023 15:01:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0Pb1Dawh82h+/Cxo96tWeksx1DYk3eJLpe2b/cx0I09lcCGPic15LWbNSgG80vhEZBDsU+mjnm2B/sp8vlJSGR0PqmzZBNz6aiw+V9c7PuciV82l1Sm3IfCPoKAdpzT0n4KxOfqBK1V4jnT3PTFPX8jkg1TD/BGKkcNUVnVeeQGmVGX3SriDkrAZcC2qjoWKkP0FtL1kkeYG2CvZxakXeyEPfZj4xMg7KyQn/HISc8lTpwGGe0UginDIj6yLleKmPgePxAHZr7/FM1eTRM7hx3h7byQO5lyxcSganaSVdUFiUj6Apy3m0LNA6aQR0zMvOUJg60JnNrznUo+6Kqs5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4mtnfUeqSRoCqmDH3SxzvgjXHH4wYisZa2KyEBHolM=;
 b=VV89j/nHnng7CJWfi2Y+AuQEN9J7z8YRyNbKUws8P4VgW4FvZ314UdIbcdZaAN7r9XS35SDzo7BmTXlaszi8RTslhVxd0ZWWz4coa3grb4K2B71yiNqAA4rYgaZuAuCqathfLsQuFhMnQ9lyxTCsBFyFpLPTYsdlT6S/UVaqUlWQFv7iAH6hmKtkv3Xi25mJkn1bWkAi1fErcUwB+ucC4ANeEDvzuT9yjYOFKIHzT36Wt0i6qk2qbeofGGGoNER1alr1G6z0mvnLPYDYzpStuCSDAPXyMIlO3e/yhwLM5keIqm3O9dR8B1fw6rXIFBrmW6X8KtuRV2mWTUJWZY4gIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB6815.namprd11.prod.outlook.com (2603:10b6:a03:484::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:01:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:01:39 +0000
Message-ID: <acc7f369-0bf3-52c1-a0ff-e050d0fbd882@intel.com>
Date: Mon, 23 Jan 2023 15:01:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 6/8] drm/i915/guc: Update GuC messages in intel_guc_log.c
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-7-michal.wajdeczko@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230120164050.1765-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fffb91c-c149-44bb-38e4-08dafd95c91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdbHtapYhkbJOzIj1gLvwppKElPZJ45il5s2BcBV3QeYsX8tajYNNwqaurCxpfq1nHhaxkhhFDJS27gKEif6te9OvZVtI6E9Tp5T0aAGxheiCIO90msqFoW8XIe/LR+VlrQ2SamWtEmAIQGBbfPbbzteytHcuOh/ncCGMGGPQniQgaKJALd57FtPd1ut+UvhCfMDgB9CEumf/cJ4fVAOPD6la2jku0r2mKOsycVnSavR3tCBwJvnCgzHRgOfZwtgKfD2xqW0vhQCKv1VRb5imHChYAI7kxm0Kn/hLCD9WXrN9lrF6S3yetwIXcPf1EAn6k92fLQ76DIm1gbNMPwpjmPkHPR/rOJZAlKmzXidPdQMZQ4w6i4ZDHlJeAKRswsEBr3XgAmrnlB4E79b0183t/3ChMzavNsFPbdGilLMIV9cj2RfOhpautRWA0DG6l+kmDTdWGimVWjILWLz3B5HuXsEQBbXbw50sfNU3ks3MWujc1PenwiQKgympmte49E0vLYkT6iD0/Hxw+N2mRV+/yqSq8ZIvss/VyNphH/lsEGBnvUpdBG5h5BphPk23OCx9EPRbYQKwyyEFSviuWdEmkMTzOMnDv1l2sV1RorDEm8M/+BZ4cfxozGpOPoTB4na+6/sXktGBzi96sbGM9QDiq9syfM1vYPXzePnQshkb6uRKzgC9HH7ifzvDpci1lCl3LIc6UPRfxqv2dQsIZJNAiEkuWfRQBB1t4n3YBXJ680=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199015)(31696002)(86362001)(6512007)(186003)(53546011)(6486002)(6506007)(6666004)(478600001)(2616005)(450100002)(26005)(316002)(66946007)(8676002)(66476007)(41300700001)(15650500001)(66556008)(38100700002)(82960400001)(5660300002)(83380400001)(8936002)(2906002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1nUmVBSHR4KzZmWENJajRHektqSnhva3cvMTBEVGttaCtlbnlWMTdoMStV?=
 =?utf-8?B?RkxOZ3FoOXd0SzdoMUtLb2YrUmFuUXZDRXNPcnJ2aXB4MTMrYmxudGladExt?=
 =?utf-8?B?V3pVd091YXpxakRVVkkyUXEvZDFlUGFPZWtYN083aVNycC85Yng3aFpNVm5T?=
 =?utf-8?B?dFBUNWFPc0pZaHo2Y2xTQ3dTeUx2Y2FDbXBFVnZWaVQvMnlnTzlhT3A3MWxC?=
 =?utf-8?B?WGhkSDRoL0ZBaWtqUkZwKzNVN2R3M1pmNDg2RWtsdmZKWklxdHNTVUlpTHFS?=
 =?utf-8?B?WVlNR1dpaWM0cy91SDJQOGNWcldJS0ptME9VM3dqUmdySGNFbHp2VXZLQmIy?=
 =?utf-8?B?VEl2UWVCVHQ3aU10N1hKRjlrUThKejNEUFIyOTV6QVhqWmtqTjA1VTFadks5?=
 =?utf-8?B?c3RQZzlkajBBeVFOa0lwMWxOUEsrT3hTdWVLQWt2TlVZYlJGSFdrZE1tbVJ3?=
 =?utf-8?B?WVhIeXNybWhqNTFzM3ZoR3Jvc3gzdytiL1JkOEhZTyt5ejZnRytKdzhTUkZw?=
 =?utf-8?B?dnR3SDJYZC9WVDF2eVZGWFJONkp1bjlTM0VvRUpDL1N0aEVYYUJUSUNjRVlp?=
 =?utf-8?B?M0pLRUR0OXdJcjI5MmJHb08xb0RCZ3FTVjB6UGlGR0liSmYybjFjZTRLZG5z?=
 =?utf-8?B?Q3ZtRXJIRFB3eE00c1dDNEIyYWR3SFF5a3NjVVg3VThEL1B1MVN0M3doTGtv?=
 =?utf-8?B?Y0pIQ3dSMi82b2hLSFVXMUt1WXNnc1pjV0NiUDZLM0dYQVQzdjR4NWp2dDhT?=
 =?utf-8?B?SVJvNlZMQVZXZjAzY2tJWkFNUm5kdktDQ25FQzBtd054L2lPcmRwNTYrY1NR?=
 =?utf-8?B?S2NQUjkrVnpFMFZKdXQzREpIRTNNZUFhSHdObVFLZWdXM2dZV2lEVXpZckFh?=
 =?utf-8?B?OGQ5MVR1M0REZEdRZG92WFZ2TGIvNm1ZZUdmeU5QNEoyeklPbmVDUWdKcXdv?=
 =?utf-8?B?YlFkSTd3dDhBVnNCMUc1eXFSOUFlSG9xRitCcjVBMXcwQlFFRXJrZW0zYytR?=
 =?utf-8?B?eStsd1hhQy9BTDR5TDZpajd1d0J3bGFRMloyeUJSRlJKa0xOY3hTNFVuRGx5?=
 =?utf-8?B?L2tiRVV2YUpPYWFCdjc2RUs4b0FzU3pqTlBGeG9VVVhjOFZVSTJHOUFwRTNG?=
 =?utf-8?B?UG93MU9EdXlYaG40bW5zOGE1Z0NHbFdpaUgxcDBydldhOUZqMFd0OXRyQkJO?=
 =?utf-8?B?TXFUcTRYZzJUQmpBYW1UUTlqSEVqeDU0VGJtZU45dTRpU1puUWNsaVlRaDJp?=
 =?utf-8?B?YVFOb01PZ2NWa0hzRUN3L09nVWI4d1djKy9DTUxXMVhzZ3ZRTUk5bDJwNkVY?=
 =?utf-8?B?bUNCUXlTOFh0V1owbDVGM2VLNlE5aTQzdGdTelUyKzFRcHdORUs0VU80ZjUw?=
 =?utf-8?B?djRvMWxubGZzaUpndXE4dkNuZlVoMWpIb05rL1lvc1hyZFRpb2dtcjI4cUNI?=
 =?utf-8?B?TG4yR0JKUEtBcUxaU2Q4RUpDMVRWRWlQaU1haVBKb1YzNTd4eEFVdWVRalNp?=
 =?utf-8?B?N2wvN3hvRE1MQk9WYm1wTVk1VGtoNXBPSDZ4aWlLNTV2OFFCMjBWU0ZCUGUw?=
 =?utf-8?B?QnpQbER6WGFHWElkbnFLZzlHa2hlWHdmKzBKNnVHUUJKM2NPZk5JMkNWS1lh?=
 =?utf-8?B?TEhBcHA0NFNhWWhBRzlsbXlXZkxDMmFJQ0lWNVoxRWtPcTI5UlViYlh3MkVo?=
 =?utf-8?B?ckpIcEpQc3ZUSTVReXp2MTZ3enBvU0xjRmlJU0FMR1BVUTY3N0pRQW04RERh?=
 =?utf-8?B?YlJnZ012NlJmVnJ3bTBiWC8xLy8vNjQ0bysydkxEWTgxL1JSZlh3ZjduUkxm?=
 =?utf-8?B?T1B1MkJXMjZaMC9yb0Z1WlZGYXE5ZE1nQmRlUFZMSzQ2TGVXUlEzYWN6NE8y?=
 =?utf-8?B?OU5KT1FpOUkrV1VxdHJDUkZaMjVkUmxCaWtyUTd1M2tuUTFRdzBzbmV2RjRG?=
 =?utf-8?B?ejZVUUtGSmI5WHpJSHY4VmRXRENNVklUMlJ2OGNicmQvYjRKdVZOVVNhd3Vu?=
 =?utf-8?B?K0hSRDRQNkFoN0NyY1M0TFU3ajJkWnZJY0RIWHFUaTFmMGVrNzBqWWxad3VF?=
 =?utf-8?B?dDNndTVRbVltSVgxbEExNC9aRmZSY0pQODZkYmpSRzQyMERweEwzcFdrL2Qr?=
 =?utf-8?B?WlR0T2dOb1NLbGZ5T1lrK05hRkpMR1EwcnMxbUJjNFBUNDZQQytLQTVEVmdG?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fffb91c-c149-44bb-38e4-08dafd95c91f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 23:01:39.4442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08Q/kSwnHHjSoAD+njB8/FXx1oICsLrnL5MwzuKsEpY+TuoY8aw9fFxk9hijdOQFrJV8P3rCfLZ6fPbI32jWqsCqKghEwXIReshnUHvTRmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6815
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

On 1/20/2023 08:40, Michal Wajdeczko wrote:
> Use new macros to have common prefix that also include GT#.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 35 +++++++++++-----------
>   1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 68331c538b0a..1d76497b783c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -12,6 +12,7 @@
>   #include "i915_memcpy.h"
>   #include "intel_guc_capture.h"
>   #include "intel_guc_log.h"
> +#include "intel_guc_print.h"
>   
>   #if defined(CONFIG_DRM_I915_DEBUG_GUC)
>   #define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	SZ_2M
> @@ -39,7 +40,6 @@ struct guc_log_section {
>   static void _guc_log_init_sizes(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>   	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
>   		{
>   			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
> @@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   		}
>   
>   		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
> -			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
> +			guc_err(guc, "Mis-aligned log %s size: 0x%X vs 0x%X!",
>   				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
>   		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
>   
>   		if (!log->sizes[i].count) {
> -			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
> +			guc_err(guc, "Zero log %s size!", sections[i].name);
>   		} else {
>   			/* Size is +1 unit */
>   			log->sizes[i].count--;
> @@ -95,14 +95,14 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
>   
>   		/* Clip to field size */
>   		if (log->sizes[i].count > sections[i].max) {
> -			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
> +			guc_err(guc, "log %s size too large: %d vs %d!",
>   				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
>   			log->sizes[i].count = sections[i].max;
>   		}
>   	}
>   
>   	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
> -		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
> +		guc_err(guc, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
-> "for log, crash and debug sections"

>   			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>   			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>   		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
> @@ -374,6 +374,7 @@ size_t intel_guc_get_log_buffer_offset(struct intel_guc_log *log,
>   
>   static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   {
> +	struct intel_guc *guc = log_to_guc(log);
>   	unsigned int buffer_size, read_offset, write_offset, bytes_to_copy, full_cnt;
>   	struct guc_log_buffer_state *log_buf_state, *log_buf_snapshot_state;
>   	struct guc_log_buffer_state log_buf_state_local;
> @@ -383,7 +384,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   
>   	mutex_lock(&log->relay.lock);
>   
> -	if (WARN_ON(!intel_guc_log_relay_created(log)))
> +	if (guc_WARN_ON(guc, !intel_guc_log_relay_created(log)))
>   		goto out_unlock;
>   
>   	/* Get the pointer to shared GuC log buffer */
> @@ -398,7 +399,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   		 * Used rate limited to avoid deluge of messages, logs might be
>   		 * getting consumed by User at a slow rate.
>   		 */
> -		DRM_ERROR_RATELIMITED("no sub-buffer to copy general logs\n");
> +		guc_err_ratelimited(guc, "no sub-buffer to copy general logs\n");
>   		log->relay.full_count++;
>   
>   		goto out_unlock;
> @@ -451,7 +452,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   			write_offset = buffer_size;
>   		} else if (unlikely((read_offset > buffer_size) ||
>   				    (write_offset > buffer_size))) {
> -			DRM_ERROR("invalid log buffer state\n");
> +			guc_err(guc, "invalid log buffer state\n");
>   			/* copy whole buffer as offsets are unreliable */
>   			read_offset = 0;
>   			write_offset = buffer_size;
> @@ -547,7 +548,7 @@ static int guc_log_relay_create(struct intel_guc_log *log)
>   					subbuf_size, n_subbufs,
>   					&relay_callbacks, dev_priv);
>   	if (!guc_log_relay_chan) {
> -		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
> +		guc_err(guc, "Couldn't create relay channel for GuC logging\n");
Again, no need for 'GuC' string.

>   
>   		ret = -ENOMEM;
>   		return ret;
> @@ -596,7 +597,7 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
>   	}
>   
>   	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
> -		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
> +		guc_warn(guc, "Incompatible option detected: %s=%d, %s!\n",
>   			 "guc_log_level", i915->params.guc_log_level,
>   			 "verbosity too high");
>   		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
> @@ -641,15 +642,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
>   	log->buf_addr = vaddr;
>   
>   	log->level = __get_default_log_level(log);
> -	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
> -			 log->level, str_enabled_disabled(log->level),
> -			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
> -			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
> +	guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
> +		log->level, str_enabled_disabled(log->level),
> +		str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
> +		GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>   
>   	return 0;
>   
>   err:
> -	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
> +	guc_err(guc, "Failed to allocate or map GuC log buffer %pe\n", ERR_PTR(ret));
Redundant 'GuC' again.

>   	return ret;
>   }
>   
> @@ -687,7 +688,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>   					     GUC_LOG_LEVEL_IS_ENABLED(level),
>   					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
>   	if (ret) {
> -		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
> +		guc_dbg(guc, "guc_log_control action failed %pe\n", ERR_PTR(ret));
>   		goto out_unlock;
>   	}
>   
> @@ -905,7 +906,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>   
>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>   	if (IS_ERR(map)) {
> -		DRM_DEBUG("Failed to pin object\n");
> +		guc_dbg(guc, "Failed to pin object\n");
Would be useful to say which object! Maybe change to "Failed to pin log 
object"?

John.

>   		drm_puts(p, "(log data unaccessible)\n");
>   		free_page((unsigned long)page);
>   		return PTR_ERR(map);

