Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B873142E103
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDA86EB7B;
	Thu, 14 Oct 2021 18:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5796EB7B;
 Thu, 14 Oct 2021 18:18:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="288628732"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="288628732"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 11:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="548843108"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2021 11:18:40 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 11:18:40 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 11:18:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 11:18:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 11:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gG94LtaP28uLcitC35aa8kZtpOVelh6GceXBdAGU5bbsnC0Hh9n78uhbtRlPcteyBUUUwt+peCpBfeueZ8qwXdI9NrQ2UFr0DgZgrZialecNCbX1BYtG4k5MsX/0hzZElPCq1nIn3qu2TaBydUMbg6l0YGLbDPfggLowSGD5PYhEYkzrXc/4VWRhhvdyWA4GsOOUyPhDiMhTwimYmdKBvb6poS7lsSsS6R0Ddonrup1A63nX3fxMgr57HQDiNYKSK0ErmiFwacbGmxXg1Q1IqdLMiK377jsPTQpuVeYYwBuxkeCKA0xA4zU6LIisUJRoKG/RBRHsT8D2SAC+9YQN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpy2XqeFJOfUhBdUwDX3Ont6iOOhG0mI4tjNJFPLJTg=;
 b=nf0351fos+e9n+7swGw1khtLmP7hJNb1mOaREB5WhbnlQmCESMKa5pt2SxjU3yZlX1hcxx2w3zOajjinIg2/2fbIHinebp3v2ZbFW0UbaE8Av5ZJQuC1neyOSLJtfrXCkIC+doCJCFqqBFXnzrlA0yz+0GMUuhLXKDvW7uJKq0bAZfwW9Pdb9MDq+/r61rg6q1+oFnyaTDSd027owyE6M5NugVxpr9nNn20/egI9PsJ/JtsRRJGUw1a+9G+sIlgQfqipkCMdfxAo2sScuf8vcyANzWMYPboeTHG2tH2A919ILHnVl3kO6Mh1f1x+696TljYcUZGz17AL0hS0VMnN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpy2XqeFJOfUhBdUwDX3Ont6iOOhG0mI4tjNJFPLJTg=;
 b=pauKv+zs66w+p+PHPjXJ9lkW7+EPiGwO/U1C89+kWMbBt0Rp72a8dLvp3RNIOPPWZozY7AGsDz0oK7/p1UN4+JCCzvXPPdeup12Lq2rQdhMj1/XQC+O0L+nS9mvyKXekZn8EZqke132nz0pNiFmovEPGDExPnmPL7OAqyGQmMYY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 18:18:38 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 18:18:38 +0000
Subject: Re: [PATCH 08/25] drm/i915/guc: Add multi-lrc context registration
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211014172005.27155-1-matthew.brost@intel.com>
 <20211014172005.27155-9-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1ad6fcda-2ef5-b9fd-ecdd-644e00247de1@intel.com>
Date: Thu, 14 Oct 2021 11:18:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211014172005.27155-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR22CA0031.namprd22.prod.outlook.com
 (2603:10b6:300:69::17) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR22CA0031.namprd22.prod.outlook.com (2603:10b6:300:69::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 18:18:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8821d8fc-97e1-4a4a-35e5-08d98f3f0b11
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB559597D8B21842509438A845BDB89@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: STThjfYjJXWaxxEFgayiiynTEm802F2XqY/XcE0xOdWTZexwzmOMVJYJZm3xGNB/y3QjQ0fwcB2ivJg+BC3waClOcXBqqOOjO61YNUWvxkD+moQ/lqVbmviQhaZwv0rOli9VcP5eULB+IwTRKsMGka3OGl7CH9b5CgrwGgzXL3WN/kkb+tgAL9MKwyr8C4cKdcnVQR3bBljLFpaHVF1bu4uTcsul+208CLw8Mz/qYgQ+LWes52wOv4meziQ04ibJWnPvOI1AjelRIB9AK1okGNyh6N3qyPzeoOUfzeZi16Ia5dGSSoKrig1xRdw5OcJGrp2k6ivBKWw5FXYjqtd7E3dZybTn2Cwmo7miQ2hCp726MSj6ty9FydW3cx+wUS/Fjq/WJDQ5He3S8WmGA8c7Y+aPSr5efZ0Q+E/tedPqGsVNlBHlDXjrGmVI9HmH1zyo9/OXN0znfpC77aGteRIs0ZbvcoQ9gq31PMOPTncvatev2Bw7QD1QheqAfr8Lc/+4gYiv5OZi82v1hmOfwsSThkhpPEG/Yt/vNxqghLfKbAsaST++AWDOiMk/r2H9HOqUnSceUisqyD5HLhHRzy3WcEbWj+N3WPhhRIcaOapxkLV5PrnsyVf2PfApdqnN+LXyUH/N9HoZwJHij0XIOp8EtaX7hFs2SOWuGx1/uIQ1BM6NNQovBVaJ+XnQxr+JTpSa8lAjXauXI6cL6TKFMhSCyNZq0uazVv36zE0QgfZ5Tec/MdKo3lJuBj3aIDXMMmQvln+GC8cXJTP5cx/dWmiDbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(5660300002)(26005)(31696002)(2616005)(53546011)(956004)(186003)(8676002)(38100700002)(316002)(508600001)(8936002)(450100002)(83380400001)(6666004)(36756003)(66556008)(16576012)(66946007)(86362001)(82960400001)(31686004)(66476007)(6486002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDczUVBtZUo1dE1FdzZtbkkzYUJKSWE2VGtFTEZhRGlXUUhmZW5MKythY1R0?=
 =?utf-8?B?WjBQc1ZGU0xlQmpVSFBKSFg4SDBPaXllbnFyK2RVWTFNcytNeEt3NXNqNTZk?=
 =?utf-8?B?MUhiNEtrbHpnbllkUy9EY2RqVlhhbG11N01pR0R5UW5zT3hsVVlrNGpmZUtO?=
 =?utf-8?B?QUEvUzhTVHpkNS9WMnMxSTR4c2IrejRGVTFmTnF0cGRDazdLSm1Yc3FwQ1RE?=
 =?utf-8?B?aG4wR2JZM0xEMmswTmVQaDNHZkk2WDJaMm5PSUdROExXTExCUW5yR3BoSVUv?=
 =?utf-8?B?eVV6bm5kZFBySFBRVGRkbmJsSno0Nm81SmEzUURKSGlYaVlTQnZobHZ0bk4w?=
 =?utf-8?B?SXNjSnhYL3RxQTRBYmZUQzk4UTYxdjZBcUFXR25MZ3lzM3J2bGhUNzVqb1oy?=
 =?utf-8?B?Y1hpa3pjU3V6aXl6RWhiMGRXNENpUHpsUGhkNE1QM3RkZjdaOTZQVlhESE9o?=
 =?utf-8?B?bEJmeDNMa0xpWElFQ1g1OG1qamtFOUhCL3hCekY4VVkzRWlzb0p4U01ZUkRs?=
 =?utf-8?B?UmQ3VjRSTWJvZFAwVVFYN3MyZ2srUFg1YXBmbW1KL0tqTUYvclRVODBVdXc1?=
 =?utf-8?B?VXNpRzN6OEZLMUhFdVJ0YkxhTUQ4ZDVld0EraThSVzh2WS9sRjZzYkhUdStO?=
 =?utf-8?B?a2NtWVI1NTgxS0xSV3lWOHRrT1BSZlFCTW1EMU5Ca0E3WUZURVhzK2VML2xp?=
 =?utf-8?B?QjV2bm1jV1M0SXJKU2d5SHFCaVN1ck1RL0VOclJDV0pxL2RieGpONERlbDRa?=
 =?utf-8?B?b3FhaGt3cnlnMXRyZUdjUlprRzd6ZmZyb0x0WWVXWlJnN3FCSU1KcFhVaitR?=
 =?utf-8?B?UE9ZYlpFSU9hRmJqd004TWFEZzBmWTNwbGttMGx1OURCS20ybmpRZFZuMHRx?=
 =?utf-8?B?c000OGg4Z2ovZDA3ZVh1LzdXQ0ZYVWI0ZWc2R1NwTkJtcVhKMUVzVC83NVV5?=
 =?utf-8?B?VkRJR01CYUZ2d0RYTldscmR1ejhlUmo0VnpqZkhNOUNRSXhRN2hZQjBPR3Fx?=
 =?utf-8?B?Ny8zcmNDVFNnWjM1OWxQQ2YyUjRMRkxWR01tZ0R0RUlzbS9WT0JjcWt2QnBF?=
 =?utf-8?B?YXdMWCtTZ1lRWDlJc1BIMDdQOHZackFOZTVVSm1kbjFGOWU0enBTWjY5TEJU?=
 =?utf-8?B?OXlIOFQ5VEEyRkcrVUFvdlp3TzgyY1dGSjBibmFCczVnVnpmMVltVGg5dzZO?=
 =?utf-8?B?Y2I5Vk8yUmtpVG9Va25xSjd3b1hUcUJBbUZQZ25zWG13T3FNT09VanBFNUQr?=
 =?utf-8?B?Z1pUWXVFVUNQQzB4d0R4SFlDaUtDcCtSaDcyYmdjUGlPd1FKOENSVVEvMWNj?=
 =?utf-8?B?VVYvSXU3NEZnbGRIejZjcjAwOWZxVE9YL0NKRjN2UnlKZURYME50ZTY4d25q?=
 =?utf-8?B?SFl6aDJZVWVxdElwQlBMTUxWaHVwTmE2bFVzMm9MVkNwcDJaR3BWYW9WZHBC?=
 =?utf-8?B?K2k3eEZqdFRjeU84eUlBdGdQZmcwYU0vRFJZMVlYVU1Va2xjZTJjMlhXWkJV?=
 =?utf-8?B?QTFhSW5GOHVUNnkvMnBsOTRib2hCTzB5SEcvRWhqdmJiUlFsVlM1SlN6TTVZ?=
 =?utf-8?B?UVpWZkFrT2pnZC9hWnc4UlNZLzdwTDluamxKc1M0ZDNaY1JsMXlkeWhGNnRV?=
 =?utf-8?B?YW10QzJJaXVkK0dFbzVOTlJKckZFNVBDeFlVWG84dTJWNmI5aGcxblhTVlNG?=
 =?utf-8?B?eFFuNUJGbmNvZGRzeUhPMUhJakhETktYcEptTGc4cWs2SEVJeDMrT3cwVnZi?=
 =?utf-8?Q?0XJM9yR029qJYb2T3cZePM0AZ2Wbnrgc7TPFA4l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8821d8fc-97e1-4a4a-35e5-08d98f3f0b11
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:18:38.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBCzoSP/UgegBImJ8r2nUSve5U6zJRyOs+9TwGS2DH0jqk+dQQzisNN55sw+yduvUo2+fGcttnP2kZkv9d4dZhpOO61fUmzErKrWe7vE2M8=
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

On 10/14/2021 10:19, Matthew Brost wrote:
> Add multi-lrc context registration H2G. In addition a workqueue and
> process descriptor are setup during multi-lrc context registration as
> these data structures are needed for multi-lrc submission.
>
> v2:
>   (John Harrison)
>    - Move GuC specific fields into sub-struct
>    - Clean up WQ defines
>    - Add comment explaining math to derive WQ / PD address
> v3:
>   (John Harrison)
>    - Add PARENT_SCRATCH_SIZE define
>    - Update comment explaining multi-lrc register
> v4:
>   (John Harrison)
>    - Move PARENT_SCRATCH_SIZE to common file
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.h       |   2 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 -
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 115 +++++++++++++++++-
>   6 files changed, 134 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index b63c10a144af..9f0995150a7a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -44,6 +44,8 @@ void intel_context_free(struct intel_context *ce);
>   int intel_context_reconfigure_sseu(struct intel_context *ce,
>   				   const struct intel_sseu sseu);
>   
> +#define PARENT_SCRATCH_SIZE	PAGE_SIZE
Would have been nice to have a comment. At least something like 'For 
multi-LRC submission, see uc/intel_guc_submission.c for details'. But 
the description is there in the other file for those who want to look. 
So either way:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> +
>   static inline bool intel_context_is_child(struct intel_context *ce)
>   {
>   	return !!ce->parallel.parent;
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 76dfca57cb45..48decb5ee954 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -239,6 +239,18 @@ struct intel_context {
>   		struct intel_context *parent;
>   		/** @number_children: number of children if parent */
>   		u8 number_children;
> +		/** @guc: GuC specific members for parallel submission */
> +		struct {
> +			/** @wqi_head: head pointer in work queue */
> +			u16 wqi_head;
> +			/** @wqi_tail: tail pointer in work queue */
> +			u16 wqi_tail;
> +			/**
> +			 * @parent_page: page in context state (ce->state) used
> +			 * by parent for work queue, process descriptor
> +			 */
> +			u8 parent_page;
> +		} guc;
>   	} parallel;
>   
>   #ifdef CONFIG_DRM_I915_SELFTEST
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 3ef9eaf8c50e..56156cf18c41 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -942,6 +942,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>   		context_size += PAGE_SIZE;
>   	}
>   
> +	if (intel_context_is_parent(ce) && intel_engine_uses_guc(engine)) {
> +		ce->parallel.guc.parent_page = context_size / PAGE_SIZE;
> +		context_size += PARENT_SCRATCH_SIZE;
> +	}
> +
>   	obj = i915_gem_object_create_lmem(engine->i915, context_size,
>   					  I915_BO_ALLOC_PM_VOLATILE);
>   	if (IS_ERR(obj))
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 8ff582222aff..ba10bd374cee 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -142,6 +142,7 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>   	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
> +	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>   	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
>   	INTEL_GUC_ACTION_LIMIT
>   };
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index fa4be13c8854..0eeb2a9feeed 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -52,8 +52,6 @@
>   
>   #define GUC_DOORBELL_INVALID		256
>   
> -#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
> -
>   /* Work queue item header definitions */
>   #define WQ_STATUS_ACTIVE		1
>   #define WQ_STATUS_SUSPENDED		2
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index fd6594bc1b96..d9f5be00e586 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -344,6 +344,46 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   	return rb_entry(rb, struct i915_priolist, node);
>   }
>   
> +/*
> + * When using multi-lrc submission a scratch memory area is reserved in the
> + * parent's context state for the process descriptor and work queue. Currently
> + * the scratch area is sized to a page.
> + *
> + * The layout of this scratch area is below:
> + * 0						guc_process_desc
> + * ...						unused
> + * PARENT_SCRATCH_SIZE / 2			work queue start
> + * ...						work queue
> + * PARENT_SCRATCH_SIZE - 1			work queue end
> + */
> +#define WQ_SIZE			(PARENT_SCRATCH_SIZE / 2)
> +#define WQ_OFFSET		(PARENT_SCRATCH_SIZE - WQ_SIZE)
> +static u32 __get_process_desc_offset(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!ce->parallel.guc.parent_page);
> +
> +	return ce->parallel.guc.parent_page * PAGE_SIZE;
> +}
> +
> +static u32 __get_wq_offset(struct intel_context *ce)
> +{
> +	return __get_process_desc_offset(ce) + WQ_OFFSET;
> +}
> +
> +static struct guc_process_desc *
> +__get_process_desc(struct intel_context *ce)
> +{
> +	/*
> +	 * Need to subtract LRC_STATE_OFFSET here as the
> +	 * parallel.guc.parent_page is the offset into ce->state while
> +	 * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
> +	 */
> +	return (struct guc_process_desc *)
> +		(ce->lrc_reg_state +
> +		 ((__get_process_desc_offset(ce) -
> +		   LRC_STATE_OFFSET) / sizeof(u32)));
> +}
> +
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -1365,6 +1405,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
> +static int __guc_action_register_multi_lrc(struct intel_guc *guc,
> +					   struct intel_context *ce,
> +					   u32 guc_id,
> +					   u32 offset,
> +					   bool loop)
> +{
> +	struct intel_context *child;
> +	u32 action[4 + MAX_ENGINE_INSTANCE];
> +	int len = 0;
> +
> +	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
> +
> +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> +	action[len++] = guc_id;
> +	action[len++] = ce->parallel.number_children + 1;
> +	action[len++] = offset;
> +	for_each_child(ce, child) {
> +		offset += sizeof(struct guc_lrc_desc);
> +		action[len++] = offset;
> +	}
> +
> +	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> +}
> +
>   static int __guc_action_register_context(struct intel_guc *guc,
>   					 u32 guc_id,
>   					 u32 offset,
> @@ -1387,9 +1451,15 @@ static int register_context(struct intel_context *ce, bool loop)
>   		ce->guc_id.id * sizeof(struct guc_lrc_desc);
>   	int ret;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
> +	if (intel_context_is_parent(ce))
> +		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
> +						      offset, loop);
> +	else
> +		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
> +						    loop);
>   	if (likely(!ret)) {
>   		unsigned long flags;
>   
> @@ -1418,6 +1488,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_deregister(ce);
>   
>   	return __guc_action_deregister_context(guc, guc_id);
> @@ -1445,6 +1516,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct guc_lrc_desc *desc;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
> +	struct intel_context *child;
>   	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
> @@ -1470,6 +1542,41 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> +	/*
> +	 * If context is a parent, we need to register a process descriptor
> +	 * describing a work queue and register all child contexts.
> +	 */
> +	if (intel_context_is_parent(ce)) {
> +		struct guc_process_desc *pdesc;
> +
> +		ce->parallel.guc.wqi_tail = 0;
> +		ce->parallel.guc.wqi_head = 0;
> +
> +		desc->process_desc = i915_ggtt_offset(ce->state) +
> +			__get_process_desc_offset(ce);
> +		desc->wq_addr = i915_ggtt_offset(ce->state) +
> +			__get_wq_offset(ce);
> +		desc->wq_size = WQ_SIZE;
> +
> +		pdesc = __get_process_desc(ce);
> +		memset(pdesc, 0, sizeof(*(pdesc)));
> +		pdesc->stage_id = ce->guc_id.id;
> +		pdesc->wq_base_addr = desc->wq_addr;
> +		pdesc->wq_size_bytes = desc->wq_size;
> +		pdesc->wq_status = WQ_STATUS_ACTIVE;
> +
> +		for_each_child(ce, child) {
> +			desc = __get_lrc_desc(guc, child->guc_id.id);
> +
> +			desc->engine_class =
> +				engine_class_to_guc_class(engine->class);
> +			desc->hw_context_desc = child->lrc.lrca;
> +			desc->priority = ce->guc_state.prio;
> +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +			guc_context_policy_init(engine, desc);
> +		}
> +	}
> +
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
>   	 * context is currently registered. There are two cases in which it
> @@ -2804,6 +2911,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   		return NULL;
>   	}
>   
> +	if (unlikely(intel_context_is_child(ce))) {
> +		drm_err(&guc_to_gt(guc)->i915->drm,
> +			"Context is child, desc_idx %u", desc_idx);
> +		return NULL;
> +	}
> +
>   	return ce;
>   }
>   

