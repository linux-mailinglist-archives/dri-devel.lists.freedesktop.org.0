Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADA4299DB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 01:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5063D6E97D;
	Mon, 11 Oct 2021 23:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9AC6E983;
 Mon, 11 Oct 2021 23:32:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="224411059"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="224411059"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 16:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="460148636"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 11 Oct 2021 16:32:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 16:32:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 16:32:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 16:32:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 16:32:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Deyr8LjNb4nTfe9XVQZ6Uxl9BzGIZbRzydhh+sGlziJu2end3BN3gDsgZDJZC6HP53z/63unkD8p3DQ9ABeog2ZsDu4n3rjJx8fc0eX5x1ivnc+qSLdvvPIg3J6mQBlmKtuaEiaYUDN7SXPYzIqnMjOhwFxOCJXx6Bw/4ISY0ZOH5wkZNam5XutD7+LGIQp+zIP13hba4tJ8xLKUJFKb6m+xo8e9wiXYNcKqaWyMnNR2HRk3HoBKoJsbhYanFWnjjtpkgtr/WIDNjMS8nbqA696gsjed8ffIDu3W9dX000PeLbST1HFgGylt3PT+XUNZAUfVGt2k1YwtlVUcjxFtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRxEFF3Q8GoyHkH3iTKWM04I7NMANRbl+a3xKjlIZAg=;
 b=DlocM2gYRvBm0gXzyBoi3MqnKoEtsNuhHj1WWqboaR6b+tZKZ6pa+LzDcraKh7WaNV2HvjZiye+IHqCH41tJGzffUsEYCe5afcB0LRCPIRo2TJtHZ7XFz9UFbAiPax7fSXdTPEUxTH3mAG/iAr63Y1QLlPKIykq0dY4w7QZCUrJNkmrq4qiMb9pyTkQA81qAtekrPwVoy4yjv1zgG/opmV04KYxuPxr2IPFtOvHexrPe/ThM1pxiCEkcBtc9lp+BD9pynFSyC6muhYs3xdCCR2KEsx+cRNqQsyk01IPI5NvhfOqU19R4Q89rnrcJ4WNY5k23nemJj6NuafLn8B1TlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRxEFF3Q8GoyHkH3iTKWM04I7NMANRbl+a3xKjlIZAg=;
 b=mBkzr3LNKXcfERaSekpBifsAIA5umBpYifCD0sOhG5K1Lfllg8SRO8sRXUszScGassYdnv012hjvySSrxprkHYzZcn1fFgGfsiQg3ysCzBVxmZC9yQcymA+LGRxX7JKWtnUZOA75YJCPhVGHUm0YqvPmaSu90V5/GR7Fmatia5Q=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 23:32:07 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 23:32:07 +0000
Subject: Re: [PATCH 20/26] drm/i915/guc: Implement no mid batch preemption for
 multi-lrc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-21-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a0fc2329-30c7-bf29-64b9-1ea766c3aeb1@intel.com>
Date: Mon, 11 Oct 2021 16:32:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-21-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:300:4b::13) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR02CA0003.namprd02.prod.outlook.com (2603:10b6:300:4b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 23:32:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70a6037e-f0cb-4642-a3c8-08d98d0f5706
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56580BD15A2E269B17505306BDB59@PH0PR11MB5658.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N3DAL0jL5D3mFPHVwrvJt+rk2GrQKeSltQ3WMhmxkuK9ThUPt4LUHLG6sKR4ZCoUQs3afiI6DYNG53CLwC79K+X0kVuJX43T+6Lmmi5V9oy7UiitG0pTfbYPcADMd5SVb8bAzDPMwpC+9u7FF/VXVDgVxgLsMsvoiuWD3Kx/XBVFR5OO/3JyVf3KSZe9TryS2HY3UqVyaLI2M534XZ7vOrtTsltevpp1tXL75Z4fxCVrp968lrZRzL1EKAWcmO7G6e1S3CON5v3u3UDZ6CZgIgAFfzgec6/0iYyymafAHu7z8qrRbKhPiWcT313EgCW0dO/rkgpwnd95xKbr91WFhvW02vZ/QVTkp89dXwkd0Eaks6r3N/zTI+QWqBHOJ3AiZixzufCAsl/iwLE4/IrKbuAilxo/YodPRNBEuX50dTNbeX+Gl1NqDZcZpQXiPMeTwDobPqAYsDeX4V9TfyqR/0mKPrVNeWsRVh+7CDa5mq8xJ3/SYHwxvYnm4IN4o1cQixsApJdMIK+4Lw9ksKQyIM9DncTQHL+SspQ+95HsEtkX1+CSpV44FG1T3mlNiqr6AyQAWonNp5eUSkHP7pbipJ2N8nc+wNPPFqcDsMnWGUk0+FzdqB/IEYGJrU5qY9ajOh/7Zy1hn1wmOri+Gajbch+zmHj7bQEBjbeqNCNpiSMli2mNdFeyIUhRsteppA4P9BhYBtZWGwBk/0CUZgDPTFZgFilFWbzEMNdaR+SuPIF7a43RReHoyjOVr0Y328Ga
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(30864003)(66476007)(186003)(508600001)(53546011)(5660300002)(66946007)(2906002)(31696002)(107886003)(66556008)(31686004)(8936002)(316002)(6486002)(16576012)(83380400001)(4326008)(450100002)(36756003)(2616005)(26005)(38100700002)(8676002)(956004)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3QrRzFGaUVzaWdhWVBLUGNCNGZhUS9BZ29Rc2RTZ3RuOG1QWUJ3aFJRREs1?=
 =?utf-8?B?TGFVWUh0aVRHaUtuckpTYkFxcjFKU09XZWhYcWFlNUVLdVh6dU9wKzI4eEVl?=
 =?utf-8?B?d1I1YTljeDVwV1RuMkxwb2JjazB1WnRUbGNKODYrN0ZaVTJBSGpQdlV5N0JY?=
 =?utf-8?B?dlh1N2tVNWVodmUwZFVNaVlXb3VaNm15ZkRqL096SnJVd2QzRSs2cENtalVx?=
 =?utf-8?B?YVovcG9zWDVIQTF0aVB0L3JnN0tiNVZRNXFGREI1cG9vQjcwa3N2UVZ0MGlX?=
 =?utf-8?B?a2k1ZFUzYmJWS09iQjRzYUtDYTJGR1lWc3BEby9JRk5xUkhKdXFUZ01MWGFR?=
 =?utf-8?B?UXpkQmhvanlGTHJMeEJ3OVZkRjZBUFVmOEJsbXBmczNvNlNGY3djcFN3bTdv?=
 =?utf-8?B?aTd2alNpMTdKWUsrekZVcU54NHNJSWVUWE4xdVk5MG40T3pKb09wN1pBUGYr?=
 =?utf-8?B?bThuc21KUHo3WjJobEdMb0lVZ1p1NGR5UklCTzhYZmxHeGpVdFFvTVNBOGxW?=
 =?utf-8?B?dHJIVEN2enIrRUViUy9PRS9ITmlaYmZpUjgxSDlKOEJoQ3BWY21pNVM0OUJB?=
 =?utf-8?B?bmo4eDdZSGVVKzRWRjNwZi9RNmJCc01QdG44YlVwWVZiSE92TldJV3JrU3lB?=
 =?utf-8?B?ekpNaDNYS3Vwc0swNXhGbTNZSzVBTU4wRGs2RU9CQ2lENjhCNTBUc0dDLzdv?=
 =?utf-8?B?U1VWUHlyaUZZRm1YQkIrYkZUZ2FBK0ZPVkZQSkVDWm54T01YMWRRWitOdlpq?=
 =?utf-8?B?VWhQL0NuWVZJWnhaaEI0bW9oOTJQNlo1S1NEakFQV0hvMjBOeUFGNmVVekNq?=
 =?utf-8?B?eEp3UWJoRFFoRTZsSjVHUWlMYS9NbkFtcllMM0EvSnlNZnkxQzJodmI1WUJv?=
 =?utf-8?B?aVdiSlFJc1Y3U0xWbmVWVHBnbkhTOGUxaHZtclBQUjRBS2hnRlpScFM3QWlu?=
 =?utf-8?B?WDA3ejYyZTRTRUp5azVIbWg3eEkzdndWc1lvWVhJTk53RjNnZkQyNVRCaHhy?=
 =?utf-8?B?aGd2TndBMUE2Znc1dG5CSWN2Vi9RTm5WVmN4Z0JrU29oZHl2SlhQa1dFejVr?=
 =?utf-8?B?bTZCdHlsWGVXT2ZLUEVVTXA5WWdWWE1VemJFaWhCWjlvRmxVSjNoVjV3YnBU?=
 =?utf-8?B?Qm9QcTlvNFhDdVFJRkV1WjVreWl5Y1psaksvZmVWZDNTTGh3OEdyV0VQOEtB?=
 =?utf-8?B?Zk5BamRKVTE3WVF5YVZIZnF4Rm1CREh1Sjd0R0toa2ZMTnVoODZWU0J4TlhL?=
 =?utf-8?B?MWRUcDRsUXNkNGNZbU1VM0UzQ1lRSS9kMFc4UkpoTWhIVHQ1NHA4RVphZldY?=
 =?utf-8?B?dEZKMWZFeU13aENxbGN2U0s1Q3VIcTF3YXJTZjd3SjVGekxpTlg4WE1Xaks3?=
 =?utf-8?B?RWtibDBTUkZkOEpQV1llcUFKc1ZrcWsrRjl2SlJ1KzA5RGlpWVl6WTMzUERN?=
 =?utf-8?B?V29oNUt4K2IzZUhzc2pjSDlZYTZzYnp0S3BFdUFiRC9ScTAzYXpyc3ZUUHVX?=
 =?utf-8?B?TWZPeldveURJdGU0dHpHekhhV2IzTFc2Y2R6TGFhZGFDdGEycm05RUE2RXZw?=
 =?utf-8?B?M0RZalNzblJFNmhsUVowZDY5MEpJUFJkUzFnTGFFVmpsTFZuNzBjSnZXdDJL?=
 =?utf-8?B?RjZqcHlRM0xQbGIwOGJDVjN1Q3NnU2JQT2hBbTZScU5uT1VtZHA5ZCtqY0hN?=
 =?utf-8?B?bEdrZjFFN3lOeVkwVE5UempISjJuRWZFaEVqN2RVS014L1FtNlhLaFZFK0NG?=
 =?utf-8?Q?bPKqRHwpGguFWCYaAgL0p3gusjCHoXrgm4IMtRT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a6037e-f0cb-4642-a3c8-08d98d0f5706
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 23:32:07.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+H9C4Zo1xKI0QEh31ITNk08yTpJ1u4vOcB1xhhuvJkZYrqQH175GcWSbShc+g/YRJcoPhVyKfPsim5lNwER8mniV9aDmgU9upAz9tEnGwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5658
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

On 10/4/2021 15:06, Matthew Brost wrote:
> For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
> mid BB. To safely enable preemption at the BB boundary, a handshake
> between to parent and child is needed. This is implemented via custom
between to parent -> between parent
> emit_bb_start & emit_fini_breadcrumb functions and enabled via by
via by -> by

I'm also not seeing any mention of the forced re-group behavioural 
change in either the comments or commit description.

> default if a context is configured by set parallel extension.
>
> v2:
>   (John Harrison)
>    - Fix a few comments wording
>    - Add struture for parent page layout
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 330 +++++++++++++++++-
>   4 files changed, 324 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 3b340eb59ada..ee84259959d0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -569,7 +569,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>   	GEM_BUG_ON(intel_context_is_child(child));
>   	GEM_BUG_ON(intel_context_is_parent(child));
>   
> -	parent->parallel.number_children++;
> +	parent->parallel.child_index = parent->parallel.number_children++;
>   	list_add_tail(&child->parallel.child_link,
>   		      &parent->parallel.child_list);
>   	child->parallel.parent = parent;
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 1d880303a7e4..95a5b94b4ece 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -250,6 +250,8 @@ struct intel_context {
>   		struct i915_request *last_rq;
>   		/** @number_children: number of children if parent */
>   		u8 number_children;
> +		/** @child_index: index into child_list if child */
> +		u8 child_index;
>   		/** @guc: GuC specific members for parallel submission */
>   		struct {
>   			/** @wqi_head: head pointer in work queue */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index a00eeddc1449..663950d3badc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -181,7 +181,7 @@ struct guc_process_desc {
>   	u32 wq_status;
>   	u32 engine_presence;
>   	u32 priority;
> -	u32 reserved[30];
> +	u32 reserved[36];
Not seeing the promised explanation of this bug fix.

>   } __packed;
>   
>   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 12ee8ca76249..f28e36aa77c2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -11,6 +11,7 @@
>   #include "gt/intel_context.h"
>   #include "gt/intel_engine_pm.h"
>   #include "gt/intel_engine_heartbeat.h"
> +#include "gt/intel_gpu_commands.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_pm.h"
> @@ -368,10 +369,16 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   
>   /*
>    * When using multi-lrc submission an extra page in the context state is
> - * reserved for the process descriptor and work queue.
> + * reserved for the process descriptor, work queue, and handshake between the
> + * parent + childlren contexts to insert safe preemption points between each set
> + * of BBs.
>    *
>    * The layout of this page is below:
>    * 0						guc_process_desc
> + * + sizeof(struct guc_process_desc)		child go
> + * + CACHELINE_BYTES				child join[0]
> + * ...
> + * + CACHELINE_BYTES				child join[n - 1]
>    * ...						unused
>    * PAGE_SIZE / 2				work queue start
>    * ...						work queue
> @@ -379,7 +386,25 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>    */
>   #define WQ_SIZE			(PAGE_SIZE / 2)
>   #define WQ_OFFSET		(PAGE_SIZE - WQ_SIZE)
> -static u32 __get_process_desc_offset(struct intel_context *ce)
> +
> +struct parent_page {
> +	struct guc_process_desc pdesc;
> +
> +	u32 child_go_memory;
> +	u8 unused0[CACHELINE_BYTES - sizeof(u32)];
> +
> +	struct {
> +		u32 child_join_memory;
> +		u8 unused1[CACHELINE_BYTES - sizeof(u32)];
> +	} join[MAX_ENGINE_INSTANCE + 1];
Could have a common structure for these. Call the u32 'semaphore_memory' 
or something then just have:
   struct sync_semaphore go;
   struct sync_semaphore go[MAX + 1];

> +
> +	u8 unused2[(WQ_OFFSET - sizeof(struct guc_process_desc) -
> +		    CACHELINE_BYTES * (MAX_ENGINE_INSTANCE + 2))];
And this bit could be 'sizeof(struct sync_semaphore) * MAX + 2' to be 
clearer what it refers to.

And to be totally paranoid about it, could also add 
'BUILD_BUG_ON(sizeof(struct sync_semaphore) != CACHELINE_BYTES'.

And BUILD_BUG_ON(sizeof(parent_page) == PARENT_PAGE_SIZE)'.

> +
> +	u32 wq[WQ_SIZE / sizeof(u32)];
> +};
> +
> +static u32 __get_parent_page_offset(struct intel_context *ce)
>   {
>   	GEM_BUG_ON(!ce->parallel.guc.parent_page);
>   
> @@ -388,23 +413,35 @@ static u32 __get_process_desc_offset(struct intel_context *ce)
>   
>   static u32 __get_wq_offset(struct intel_context *ce)
>   {
> -	return __get_process_desc_offset(ce) + WQ_OFFSET;
> +	BUILD_BUG_ON(offsetof(struct parent_page, wq) != WQ_OFFSET);
> +
> +	return __get_parent_page_offset(ce) + WQ_OFFSET;
>   }
>   
> -static struct guc_process_desc *
> -__get_process_desc(struct intel_context *ce)
> +static struct parent_page *
> +__get_parent_page(struct intel_context *ce)
>   {
> +	BUILD_BUG_ON(sizeof(struct parent_page) != PAGE_SIZE);
> +
>   	/*
>   	 * Need to subtract LRC_STATE_OFFSET here as the
>   	 * parallel.guc.parent_page is the offset into ce->state while
>   	 * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
>   	 */
> -	return (struct guc_process_desc *)
> +	return (struct parent_page *)
>   		(ce->lrc_reg_state +
> -		 ((__get_process_desc_offset(ce) -
> +		 ((__get_parent_page_offset(ce) -
>   		   LRC_STATE_OFFSET) / sizeof(u32)));
>   }
>   
> +static struct guc_process_desc *
> +__get_process_desc(struct intel_context *ce)
> +{
> +	struct parent_page *pp = __get_parent_page(ce);
> +
> +	return &pp->pdesc;
> +}
> +
>   static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   			   struct intel_context *ce,
>   			   u32 wqi_size)
> @@ -424,8 +461,7 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
>   	}
>   #undef AVAILABLE_SPACE
>   
> -	return ((u32 *)__get_process_desc(ce)) +
> -		((WQ_OFFSET + ce->parallel.guc.wqi_tail) / sizeof(u32));
> +	return &__get_parent_page(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
>   }
>   
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> @@ -1829,6 +1865,26 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   	return __guc_action_deregister_context(guc, guc_id);
>   }
>   
> +static inline void clear_children_join_go_memory(struct intel_context *ce)
> +{
> +	u32 *mem = (u32 *)(&__get_parent_page(ce)->child_go_memory);
> +	u8 i;
> +
> +	for (i = 0; i < ce->parallel.number_children + 1; ++i)
> +		mem[i * (CACHELINE_BYTES / sizeof(u32))] = 0;
Can't this be written as:
   pp->child_go_memory = 0;
   for(i = 0 to number_children)
     pp->child_join_memory = 0;

Seems like that would be much clearer than this magic casting and 
offsetting. I mean, that was the whole point of creating the parent_page 
structure.


> +}
> +
> +static inline u32 get_children_go_value(struct intel_context *ce)
> +{
> +	return __get_parent_page(ce)->child_go_memory;
> +}
> +
> +static inline u32 get_children_join_value(struct intel_context *ce,
> +					  u8 child_index)
> +{
> +	return __get_parent_page(ce)->join[child_index].child_join_memory;
> +}
> +
>   static void guc_context_policy_init(struct intel_engine_cs *engine,
>   				    struct guc_lrc_desc *desc)
>   {
> @@ -1888,7 +1944,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		ce->parallel.guc.wqi_head = 0;
>   
>   		desc->process_desc = i915_ggtt_offset(ce->state) +
> -			__get_process_desc_offset(ce);
> +			__get_parent_page_offset(ce);
>   		desc->wq_addr = i915_ggtt_offset(ce->state) +
>   			__get_wq_offset(ce);
>   		desc->wq_size = WQ_SIZE;
> @@ -1910,6 +1966,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   			guc_context_policy_init(engine, desc);
>   		}
> +
> +		clear_children_join_go_memory(ce);
>   	}
>   
>   	/*
> @@ -2976,6 +3034,31 @@ static const struct intel_context_ops virtual_child_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> +/*
> + * The below override of the breadcrumbs is enabled when the user configures a
> + * context for parallel submission (multi-lrc, parent-child).
> + *
> + * The overridden breadcrumbs implements an algorithm which allows the GuC to
> + * safely preempt all the hw contexts configured for parallel submission
> + * between each BB. The contract between the i915 and GuC is if the parent
> + * context can be preempted, all the children can be preempted, and the GuC will
> + * always try to preempt the parent before the children. A handshake between the
> + * parent / children breadcrumbs ensures the i915 holds up its end of the deal
> + * creating a window to preempt between each set of BBs.
> + */
> +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						     u64 offset, u32 len,
> +						     const unsigned int flags);
> +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> +						    u64 offset, u32 len,
> +						    const unsigned int flags);
> +static u32 *
> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						 u32 *cs);
> +static u32 *
> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> +						u32 *cs);
> +
>   static struct intel_context *
>   guc_create_parallel(struct intel_engine_cs **engines,
>   		    unsigned int num_siblings,
> @@ -3011,6 +3094,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
>   		}
>   	}
>   
> +	parent->engine->emit_bb_start =
> +		emit_bb_start_parent_no_preempt_mid_batch;
> +	parent->engine->emit_fini_breadcrumb =
> +		emit_fini_breadcrumb_parent_no_preempt_mid_batch;
> +	parent->engine->emit_fini_breadcrumb_dw =
> +		12 + 4 * parent->parallel.number_children;
> +	for_each_child(parent, ce) {
> +		ce->engine->emit_bb_start =
> +			emit_bb_start_child_no_preempt_mid_batch;
> +		ce->engine->emit_fini_breadcrumb =
> +			emit_fini_breadcrumb_child_no_preempt_mid_batch;
> +		ce->engine->emit_fini_breadcrumb_dw = 16;
> +	}
> +
>   	kfree(siblings);
>   	return parent;
>   
> @@ -3840,6 +3937,17 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   			drm_printf(p, "\t\tWQI Status: %u\n\n",
>   				   READ_ONCE(desc->wq_status));
>   
> +			if (ce->engine->emit_bb_start ==
> +			    emit_bb_start_parent_no_preempt_mid_batch) {
> +				u8 i;
> +
> +				drm_printf(p, "\t\tChildren Go: %u\n\n",
> +					   get_children_go_value(ce));
> +				for (i = 0; i < ce->parallel.number_children; ++i)
> +					drm_printf(p, "\t\tChildren Join: %u\n",
> +						   get_children_join_value(ce, i));
> +			}
> +
>   			for_each_child(ce, child)
>   				guc_log_context(p, child);
>   		}
> @@ -3847,6 +3955,208 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);
>   }
>   
> +static inline u32 get_children_go_addr(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +	BUILD_BUG_ON(offsetof(struct parent_page, child_go_memory) !=
> +		     sizeof(struct guc_process_desc));
> +
> +	return i915_ggtt_offset(ce->state) +
> +		__get_parent_page_offset(ce) +
> +		sizeof(struct guc_process_desc);
Rather than relying on the BUILD_BUG to make sure that the magic 
calculation matches the structure definition, can't this just say 
"ggtt_offset + pp_offset + offsetof(pp, child_go)"?

> +}
> +
> +static inline u32 get_children_join_addr(struct intel_context *ce,
> +					 u8 child_index)
> +{
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	return get_children_go_addr(ce) + (child_index + 1) * CACHELINE_BYTES;
"ggtt_offset + pp_offset + offsetof(pp, child_join[i])"?


> +}
> +
> +#define PARENT_GO_BB			1
> +#define PARENT_GO_FINI_BREADCRUMB	0
> +#define CHILD_GO_BB			1
> +#define CHILD_GO_FINI_BREADCRUMB	0
> +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						     u64 offset, u32 len,
> +						     const unsigned int flags)
> +{
> +	struct intel_context *ce = rq->context;
> +	u32 *cs;
> +	u8 i;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	cs = intel_ring_begin(rq, 10 + 4 * ce->parallel.number_children);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	/* Wait on children */
> +	for (i = 0; i < ce->parallel.number_children; ++i) {
> +		*cs++ = (MI_SEMAPHORE_WAIT |
> +			 MI_SEMAPHORE_GLOBAL_GTT |
> +			 MI_SEMAPHORE_POLL |
> +			 MI_SEMAPHORE_SAD_EQ_SDD);
> +		*cs++ = PARENT_GO_BB;
> +		*cs++ = get_children_join_addr(ce, i);
> +		*cs++ = 0;
> +	}
> +
> +	/* Turn off preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +	*cs++ = MI_NOOP;
> +
> +	/* Tell children go */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  CHILD_GO_BB,
> +				  get_children_go_addr(ce),
> +				  0);
> +
> +	/* Jump to batch */
> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> +	*cs++ = lower_32_bits(offset);
> +	*cs++ = upper_32_bits(offset);
> +	*cs++ = MI_NOOP;
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
> +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> +						    u64 offset, u32 len,
> +						    const unsigned int flags)
> +{
> +	struct intel_context *ce = rq->context;
> +	struct intel_context *parent = intel_context_to_parent(ce);
> +	u32 *cs;
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +
> +	cs = intel_ring_begin(rq, 12);
> +	if (IS_ERR(cs))
> +		return PTR_ERR(cs);
> +
> +	/* Signal parent */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  PARENT_GO_BB,
> +				  get_children_join_addr(parent,
> +							 ce->parallel.child_index),
> +				  0);
> +
> +	/* Wait on parent for go */
> +	*cs++ = (MI_SEMAPHORE_WAIT |
> +		 MI_SEMAPHORE_GLOBAL_GTT |
> +		 MI_SEMAPHORE_POLL |
> +		 MI_SEMAPHORE_SAD_EQ_SDD);
> +	*cs++ = CHILD_GO_BB;
> +	*cs++ = get_children_go_addr(parent);
> +	*cs++ = 0;
> +
> +	/* Turn off preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +
> +	/* Jump to batch */
> +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> +	*cs++ = lower_32_bits(offset);
> +	*cs++ = upper_32_bits(offset);
> +
> +	intel_ring_advance(rq, cs);
> +
> +	return 0;
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> +						 u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +	u8 i;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +
> +	/* Wait on children */
> +	for (i = 0; i < ce->parallel.number_children; ++i) {
> +		*cs++ = (MI_SEMAPHORE_WAIT |
> +			 MI_SEMAPHORE_GLOBAL_GTT |
> +			 MI_SEMAPHORE_POLL |
> +			 MI_SEMAPHORE_SAD_EQ_SDD);
> +		*cs++ = PARENT_GO_FINI_BREADCRUMB;
> +		*cs++ = get_children_join_addr(ce, i);
> +		*cs++ = 0;
> +	}
> +
> +	/* Turn on preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> +	*cs++ = MI_NOOP;
> +
You mentioned possibly needing to add an MI_ARB_CHECK in here but I'm 
not seeing it. Did the testing happen? I don't see that it should be 
necessary. Once you execute the MI_ARB_ENABLE, the CS can preempt 
anywhere, I thought? Even if it can't there should be an MI_ARB_CHECK 
added at the next level up after the breadcrumb code. Or do we not have 
those in between batches any more?

John.


> +	/* Tell children go */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  CHILD_GO_FINI_BREADCRUMB,
> +				  get_children_go_addr(ce),
> +				  0);
> +
> +	/* Emit fini breadcrumb */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  rq->fence.seqno,
> +				  i915_request_active_timeline(rq)->hwsp_offset,
> +				  0);
> +
> +	/* User interrupt */
> +	*cs++ = MI_USER_INTERRUPT;
> +	*cs++ = MI_NOOP;
> +
> +	rq->tail = intel_ring_offset(rq, cs);
> +
> +	return cs;
> +}
> +
> +static u32 *
> +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> +{
> +	struct intel_context *ce = rq->context;
> +	struct intel_context *parent = intel_context_to_parent(ce);
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +
> +	/* Turn on preemption */
> +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> +	*cs++ = MI_NOOP;
> +
> +	/* Signal parent */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  PARENT_GO_FINI_BREADCRUMB,
> +				  get_children_join_addr(parent,
> +							 ce->parallel.child_index),
> +				  0);
> +
> +	/* Wait parent on for go */
> +	*cs++ = (MI_SEMAPHORE_WAIT |
> +		 MI_SEMAPHORE_GLOBAL_GTT |
> +		 MI_SEMAPHORE_POLL |
> +		 MI_SEMAPHORE_SAD_EQ_SDD);
> +	*cs++ = CHILD_GO_FINI_BREADCRUMB;
> +	*cs++ = get_children_go_addr(parent);
> +	*cs++ = 0;
> +
> +	/* Emit fini breadcrumb */
> +	cs = gen8_emit_ggtt_write(cs,
> +				  rq->fence.seqno,
> +				  i915_request_active_timeline(rq)->hwsp_offset,
> +				  0);
> +
> +	/* User interrupt */
> +	*cs++ = MI_USER_INTERRUPT;
> +	*cs++ = MI_NOOP;
> +
> +	rq->tail = intel_ring_offset(rq, cs);
> +
> +	return cs;
> +}
> +
>   static struct intel_context *
>   guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>   		   unsigned long flags)

