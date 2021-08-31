Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A93FCD26
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 21:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBD3897FD;
	Tue, 31 Aug 2021 19:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9A18967F;
 Tue, 31 Aug 2021 19:04:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="282264432"
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="282264432"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 12:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="690134385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2021 12:04:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 Aug 2021 12:04:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 12:04:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 31 Aug 2021 12:04:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 12:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv8fhKdCJ0sF1NY08EchWXAY+ZBVVdOf0l+61GKDaruYPxRby2J0bLtBFsJbdCMRMQHL9sCzmHK6Xuy+rr1cIuqcvqRfj6v2Y1SldHcDEedbLy3kWp+T6gY4cJVAyq86QCwp+R0WFdQSpesG10Le6wV9ueu27EKU92rKGbhlCt9ZtUl134X9fOdzO47OKBQd33iLOaaRoMAcdAvDbEuiMI0sODdWs3t5LQsVLLWbOb677N8KTHMum16rogf2xEGbgDGACQ6D94bevM4Br2TFwmaQitAWNalUTRxKXA/EGPjdnKFUuHx3KUQwVzCclFkUXaQognaheV5QzGQBgHHerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWmO24HxDegTq9PapYmck19ps+xSS+rN48X4N3toXH4=;
 b=WuH5Z+c/rSUl7orYH3tEi1PGinFCIZeHTUKgk5Hm67kLVq0I+zqbXvd3drc1IIExFG2dY1vyCEG9gxO+GJpqhaZzVr0qCxbaVeu9utWCI53paKeIGhWBIcS9D6BjSvqwHDw0sVBQkQXTr0oEz569WXpzpeQEugpGyCaIBgZlnHkKGUSwF5kS3zEPu9Hp8o+EpgSR4NlSi8KgmIBNC4FLE15WAjwGWXhRP/TUJICtmoi7DUePMI33xoOy1AwIdHMDcxgz+taz7qCjrfzd044JzvCXA4vXGDbYpFveCLC7p8Uc+23If2OuzeyWvy6n9/YmKW6zAGu3ZhnvsU1ub88C7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWmO24HxDegTq9PapYmck19ps+xSS+rN48X4N3toXH4=;
 b=zWfuxpDKFmicjMKwhv/6vckRaFRIClmdEmaB0bw2WdHVn1G98JkXXPtCYZL72t9huo1/F9YgUEVISebnRRi08fQFzQCFcwD/HEb/lHIu3ohxCZkEg3+wHMDKW3SnJ/roujJORR24sG4uHZb6CKC+cXnR7NzhTPbnqeHFUzYbYl8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 19:04:05 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 19:04:05 +0000
Subject: Re: [Intel-gfx] [PATCH 26/27] drm/i915/guc: Add GuC kernel doc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-27-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <63b6950f-6c37-90f4-7f21-0be17cb09398@intel.com>
Date: Tue, 31 Aug 2021 12:04:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-27-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR19CA0077.namprd19.prod.outlook.com
 (2603:10b6:320:1f::15) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR19CA0077.namprd19.prod.outlook.com (2603:10b6:320:1f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 19:04:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bd6e88d-0812-4f52-74a4-08d96cb21a4b
X-MS-TrafficTypeDiagnostic: PH0PR11MB5641:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5641B93FA3114737B488D5BCBDCC9@PH0PR11MB5641.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0kVBFwfW9W+dtvAVRxEfmXD9m8g9Ga8yorF7vMnJDx46k8E9KfhT+ruxgddKRITDBvz9yDnFBNWhQbW//gHcMi0WRXI19pdMQbIzayzQ/lPWgczXE11y9dtktbBL2wCxWO+s2cezSsxWIjqlXNJvW8I6381TdajxW5UhCyTHWoI1EbxqquOQsXFAN6l4IqEVn/Z2gW7eJevUHQnwcfQnaTYuVzQAQgOv0LAROmTcdZYjn2R+REUnW93zgAwpDcDAigPuWj46kkQ+pB8tADRyzvKIzavnezJxqN//K3EvouHDVXm2RJ20J5n35sVITjyytwGas5ttY9stV3z4Lcc5OONiuAPGnuxZ6rwzZ2ISIp5id98JpkYROEQXKRb5gQzmJODcL/ZiwJ8PTfAnRKnPWC42dNPaI3vqT9Xvt49mgge6unWi4zl+x70gGkzrGDaKoS9srOSpcZzi4tl1yOVHSCpx8S3R5tcKiMAUEUagNTd7FMvjqWKFA9w6xF/gsO4CGdcW/VxiGoRls5oSmCBhKCxKOhFSEg9dcgoK3BUjN2mpwcUbCTFHS4rCuTvqBXo2L2K5230HJj+x9s7iN+FiBCY/byr0/zWR7F0YzOGJrehsYZJ6Nvk8WWzdhjEVEoFIidR8PRbxEXFJgeeHjhi/sRxQzUTeh6DbRFtm8eha19XoAE9UxCpccBZN8qsTZ/+2n3hTEI2Z0mLWM//evTzuMdrrrOuQpiMTqNLfy/S+nYj1IRoXpsVby47aSPSg6BGI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(956004)(83380400001)(38100700002)(4326008)(36756003)(31686004)(186003)(107886003)(450100002)(26005)(86362001)(478600001)(2616005)(8936002)(66946007)(66476007)(66556008)(16576012)(8676002)(2906002)(6486002)(316002)(31696002)(5660300002)(53546011)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHBPWVczcnNaUER2UTNPSytPdi8rTVpXMlQ0SUpIT0lTYjMvalREdGVoMFor?=
 =?utf-8?B?TWJ4bi9mQ1Q1eEVNYTNocE9lc0cwSlZnelJobVVjNzVuU0JybVhDU2JHbjFL?=
 =?utf-8?B?Y2VNaklXSExlSmFXZVAxL2hncG5TRS9UWFhYc2FPUXgvemduOGlyVzNEbFN6?=
 =?utf-8?B?aGluczVJZUI2U3I5UHdlUVdIc3NzMnVCWVZNODhZQ1Y1bkpNZERzQmh4Y3Mw?=
 =?utf-8?B?UW1ya0gzZW5PV1IwanJ3dmlrelJvdG94TkNxdEhtSEtrMGVUWnpZNVdncElF?=
 =?utf-8?B?c0JuV3Zmc1dUQ2JkSnI0OE5hdG9EZjJaSm05VDVsYkN3a3orSlVpdmlFZFBu?=
 =?utf-8?B?Rm1wUDlxdUZzSGplMldYL1o5Uzdrbk5reFBkR3ZqV1RoMWVzekpJNkF4Z2pI?=
 =?utf-8?B?ejFoZXJOczZJWDY0Z3U5U3MvWUhuV29BZzZNd01Pc24ycUgvamJpQnZuTytx?=
 =?utf-8?B?ZVJMT0U2L204UnJPRUdndDh2V2xzbU5idzlnOStDVHgrRHdDaWtpWnFCNzNF?=
 =?utf-8?B?dWRHWDhYK0xCQmtFTDlteUtmd0RpMTFWdGFCbmtRWVdLbVVaWk1ISDBuem5I?=
 =?utf-8?B?cVlLVmE4L2I5dWQvamc4SS9zUy9NSmxXTUZnMDUyeU5QZHp5aklmcEs4M2h6?=
 =?utf-8?B?K3BlME9uRzFvRTR6RmR2T3NkQjF5ZXYzZXltWThlSnZFYTh0ZWM2Mmx4c2ZY?=
 =?utf-8?B?QzV2ajgwS2l3SDlOMkpvM2lVQUc1RkZkQ2psUDJLL2R4K0QwMTAzTmNMS2Ix?=
 =?utf-8?B?azFWb0EwMkFXK2hHbHpzSkd0eExOR0h4MW9EZXJRLzgyeGpwRklSRHVLazIw?=
 =?utf-8?B?eHdCRTAxdEpOd3B3QkxDbDd5bnJpaWlzNGIzTG5CbjBkQUNGdFNOeXBKaVVr?=
 =?utf-8?B?VkJUbGtWbWEvWEVuWE8zdmREZ3RIQmR4Z2o5ZkxhVkVydytsL01nWHlzMjRz?=
 =?utf-8?B?ZndMbGxTVTF1eUhtcG4vY2JhZ1VXRHdPYzZhNEgrTnNrVEVNODA3cWJiR3RO?=
 =?utf-8?B?ZjJ3UDdOaWxyOEtZTWd1T0JyNTE4RDY3Rjlod3JXSFE4VlkvSFB2RXhBVnJS?=
 =?utf-8?B?cEZDelcwWHFnQnhPMTlSV1VHckNWekE2ckxVYVY4UFM2RjB3VFU1WE1nQlJV?=
 =?utf-8?B?cjhRRTRHYlA4S000RHFTMk5MMm5SeWtjZythdnprTlZHZXI5TWhUNlFZYXlX?=
 =?utf-8?B?N0VLODVKRFVBdEtlSTB4QzNuREpvNTdqcFNGQnZFTG90R2padEpUaXpFQXJj?=
 =?utf-8?B?N0JvVkZKc1JTaktJYWxGZGp6MXppa003TFUzRkJiUzVHL0VJeW9sVngrWmEy?=
 =?utf-8?B?dUxycTR4NitqamlZMWM3Vm9VSStXOG5za3VNWHgxbWxhSG52MFg2b0xqbDkr?=
 =?utf-8?B?WWdZb1dXdGRJMExZL0ZBazRSaStHNjAxYklneTExRHlCajJIMXo0dUxjWWlu?=
 =?utf-8?B?SDU2ekJ1a0pxcDFsUFlBSll0bmtQL2prcnVHUCtwWlFKZVB2MzdlaDZSdHhX?=
 =?utf-8?B?VUs3WlJOd2xmZk1vV0kwbXBZYlJHM0phTFRGRXh2RURqamlHMEdHaU1YZTMy?=
 =?utf-8?B?VGhiUHJRTWVhNGtQaUhvMUhTSk56dkoxY2FaamgwRXZUeE8yRGFnQ1B0cHFB?=
 =?utf-8?B?cFZsMm1XOW51bC9tRmovdFROa3BSMnZOckVZVytOdzd3UXJkNkV3Y1oyTWNl?=
 =?utf-8?B?MXFIbGlZcTFWVGtHTXI1YkJzU0xvQ1NCOGJKMnFkaGNJeGJ0N2oxQzhiTFZB?=
 =?utf-8?Q?i8HSTdwE4FXp3tWdubu6LSI03LetGskuFIIBx9A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd6e88d-0812-4f52-74a4-08d96cb21a4b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 19:04:05.3435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orE2F+g1YHTDp9uRB1stQLfnJ/JLlrZmF3Age6O1cbBJ8pNyU5/jw6oFQ2SaXNtz2hS3q2LjrsZHKrQipIzvwrXZWRFg63n17noNrcm9Io4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
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

On 8/25/2021 20:23, Matthew Brost wrote:
> Add GuC kernel doc for all structures added thus far for GuC submission
> and update the main GuC submission section with the new interface
> details.
>
> v2:
>   - Drop guc_active.lock DOC
> v3:
>   (Daniele)
>   - Fixup a few kernel doc comments
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  44 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  19 +++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 101 ++++++++++++++----
>   drivers/gpu/drm/i915/i915_request.h           |  18 ++--
>   4 files changed, 132 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 5285d660eacf..920ed92f4382 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -156,40 +156,52 @@ struct intel_context {
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
> +		 * @fences: maintains a list of requests are currently being
requests *that* are

> +		 * fenced until a GuC operation completes
>   		 */
>   		struct list_head fences;
> -		/* GuC context blocked fence */
> +		/**
> +		 * @blocked: fence used to signal when the blocking of a
> +		 * contexts submissions is complete.
context's

'submissions are' or 'submission is'?

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
> +		/** @prio: the contexts current guc priority */
context's

>   		u8 prio;
> +		/**
> +		 * @prio_count: a counter of the number requests inflight in
in flight

> +		 * each priority bucket
> +		 */
>   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
>   	} guc_state;
>   
>   	struct {
> -		/* GuC LRC descriptor ID */
> +		/**
> +		 * @id: unique handle which is used to communicate information
> +		 * with the GuC about this context, protected by
"used to communicate information" seems an odd way to say it. Maybe:
   @id: handle which is used to uniquely identify this context with the 
GuC, protected by...

> +		 * guc->contexts_lock
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
> index 2e27fe59786b..112dd29a63fe 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -41,6 +41,10 @@ struct intel_guc {
>   	spinlock_t irq_lock;
>   	unsigned int msg_enabled_mask;
>   
> +	/**
> +	 * @outstanding_submission_g2h: number of outstanding G2H related to GuC
"G2H responses"?

Maybe even "GuC to Host responses"? Do we explain anywhere at a higher 
level what G2H (or H2G) means?


> +	 * submission, used to determine if the GT is idle
> +	 */
>   	atomic_t outstanding_submission_g2h;
>   
>   	struct {
> @@ -49,12 +53,16 @@ struct intel_guc {
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
> +	/** @guc_ids: used to allocate new guc_ids */
>   	struct ida guc_ids;
This is very confusing naming - 'guc_ids is used to allocate guc_ids'?! 
Should at least say 'used to allocate new ce->guc_id.id values' or some 
such.


> +	/**
> +	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> +	 */
>   	struct list_head guc_id_list;
Feels like this should be called 'idle_guc_id_list' or similar. 
Otherwise it sounds like it is a list of all ce->guc_id entities and is 
therefore basically just a duplicate of the guc_ids ida above.

>   
>   	bool submission_supported;
> @@ -70,7 +78,10 @@ struct intel_guc {
>   	struct i915_vma *lrc_desc_pool;
>   	void *lrc_desc_pool_vaddr;
>   
> -	/* guc_id to intel_context lookup */
> +	/**
> +	 * @context_lookup: used to resolve intel_context from guc_id, if a
> +	 * context is present in this structure it is registered with the GuC
> +	 */
>   	struct xarray context_lookup;
>   
>   	/* Control params for fw initialization */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index eb884b48f4b8..3fe45eca95ff 100644
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
> @@ -51,14 +36,86 @@
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
> + * Covered in detail in other sections but CTBs (host-to-guc, H2G, guc-to-host
The comma implies 'host-to-guc' and 'H2G' are two separate things. Maybe 
say '(host to GuC - H2G, GuC to host - G2H)'.

> + * G2H) are a message interface between the i915 and GuC used to controls
> + * submissions.
controls -> control

Also, they are used for more than just controlling submission. I would 
just stop at 'between the i915 and GuC'.

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
> + * enable H2G, while follow upsubmissions are done via the context submit H2G,
upsubmissions -> up submissions

> + * which informs the GuC that a previously enabled context has new work
> + * available.
> + *
> + * Context unpin:
> + * To unpin a context a H2G is used to disable scheduling and when the
scheduling and when -> scheduling. When
Otherwise that is an unnecessarily long sentence.

> + * corresponding G2H returns indicating the scheduling disable operation has
> + * completed it is safe to unpin the context. While a disable is in flight it
> + * isn't safe to resubmit the context so a fence is used to stall all future
> + * requests until the G2H is returned.
all future requests of only that context or of everything?

> + *
> + * Context deregistration:
> + * Before a context can be destroyed or if we steal its guc_id we must
> + * deregister the context with the GuC via H2G. If stealing the guc_id it isn't
> + * safe to submit anything to this guc_id until the deregister completes so a
> + * fence is used to stall all requests associated with this guc_ids until the
guc_ids -> guc_id

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
> + * This is the submission lock for all contexts that share a i915 schedule
'a i915' -> 'an i915'

> + * engine (sched_engine), thus only 1 context which share a sched_engine can be
only 1 context which share -> only one of the contexts which share

> + * submitting at a time. Currently only 1 sched_engine used for all of GuC
used -> is used

> + * submission but that could change in the future.
> + *
> + * guc->contexts_lock
> + * Protects guc_id allocation. Global lock i.e. Only 1 context that uses GuC
> + * submission can hold this at a time.
Technically, it is per GuC. So if there are multiple GuCs (e.g. DGPU + 
IGPU or even two DGPU boards are plugged in) there can be two locks held 
concurrently by different contexts. Maybe say:

guc->contexts_lock
Protects guc_id allocation for the given GuC. I.e. only one context can 
be doing guc_id allocation operations at a time for each GuC in the system.


> + *
> + * ce->guc_state.lock
> + * Protects everything under ce->guc_state. Ensures that a context is in the
> + * correct state before issuing a H2G. e.g. We don't issue a schedule disable
> + * on disabled context (bad idea), we don't issue schedule enable when a
on disabled -> on a disabled
issue schedule -> issue a schedule

> + * schedule disable is inflight, etc... Also protects list of inflight requests
> + * on the context and the priority management state. Lock individual to each
Lock individual -> Lock is individual

> + * context.
> + *
> + * Lock ordering rules:
> + * sched_engine->lock -> ce->guc_state.lock
> + * guc->contexts_lock -> ce->guc_state.lock
>    *
> + * Reset races:
> + * When a GPU full reset is triggered it is assumed that some G2H responses to
Should be 'a full GT reset'. Full GPU reset is an ambiguous term. E.g. 
it can mean an FLR reset done at the PCI level (outside i915). There is 
also quite a lot of the GPU that isn't touched by the GT reset, but that 
is the biggest hammer i915 has access to at the moment.

> + * a H2G can be lost as the GuC is likely toast. Losing these G2H can prove to
a H2G -> H2Gs

'is likely toast' -> 'is also reset'. The current implementation of GT 
reset involves an explicit reset of the GuC, so 'likely toast' seems the 
wrong description. Sure, GuC itself may or may not have died and caused 
the reset to happen, but either way it is being killed off and that may 
or may not happen before it has a chance to send the G2Hs.

> + * fatal as we do certain operations upon receiving a G2H (e.g. destroy
> + * contexts, release guc_ids, etc...). Luckly when this occurs we can scrub
Luckly -> Luckily. Although, I would drop it completely and just say 
'When this...'. Software design should not involve luck!

> + * context state and cleanup appropriately, however this is quite racey. To
> + * avoid races the rules are check for submission being disabled (i.e. check for
> + * mid reset) with the appropriate lock being held. If submission is disabled
> + * don't send the H2G or update the context state. The reset code must disable
> + * submission and grab all these locks before scrubbing for the missing G2H.
Feels like this could be better worded. 'the rules are' implies you are 
about to list a set of numbered rules rather than just give a general 
description. 'check for mid reset' is a confusing way to say it, I 
assume it means 'do a check part way through the reset for submission 
being disabled'? Also, where did "don't send the H2G" come from? Who is 
sending H2Gs and why? The earlier comment about races was only talking 
about cleaning up lost G2Hs. And 'grab all these locks' - which locks? 
The earlier sentence just says 'with the appropriate lock'. Now it says 
'all these locks' without specifying what was appropriate before and 
what extra is needed now.

>    */
>   
>   /* GuC Virtual Engine */
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index d818cfbfc41d..177eaf55adff 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -290,18 +290,20 @@ struct i915_request {
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
> +	 * @guc_prio: Priority level while the request is inflight. Differs from
inflight -> in flight

> +	 * i915 scheduler priority. See comment above
> +	 * I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP for details. Protected by
> +	 * ce->guc_active.lock.
>   	 */
>   #define	GUC_PRIO_INIT	0xff
>   #define	GUC_PRIO_FINI	0xfe
Does it matter that these defines are between the kerneldoc description 
of guc_prio and the variable declaration itself? And should the defines 
be described in the kerneldoc as well?

John.


