Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C043FF203
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 19:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CEE6E7D9;
	Thu,  2 Sep 2021 17:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DF46E7D5;
 Thu,  2 Sep 2021 17:02:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="282895602"
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="282895602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 10:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="521252704"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2021 10:02:04 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Sep 2021 10:02:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Sep 2021 10:02:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 2 Sep 2021 10:02:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 2 Sep 2021 10:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFEpoh8OmfZFB4vgndfKR0RWTZhC88htZ6zlUfjfrSkn4k6idtKo+4SV95pCpciK700HCdRJXbw/xeZTGcTgJvYRTPGUp4GzfuIiOArQ+uMX442PMN8c0XAazPWURui7KZLUzCywiiOc2NTIIsWnba1j3Acpy3GQXHM8q5Xb/kiwmmnYebCeq/A3WJE2jnvW9bIRagvMeKCrZkmASiFI9NmboAvPgfAkUcnhDrRS5dbC8d40ZVxq64P3AvWA640ZlLWOkMBvJXAH2mEdexvuFDSiUl1y8a8HJx19zXPytBnxD0so9cI8Ohj38hWoCjGYRI1stvOTyq7kcRdbSmLJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eGrHPtm/oCga1jNTXoSqoYe/9FJy+c5NhCqctM+6iI=;
 b=LEMuCk5XyIjmYUrZSGHAD8pRX5xPICiZycywAZp0d4cuiks2s9iib/rjLejG+RFS5bzqL7NgyLhLOYl37PJyR/Cp7Cqw/zJuYggwSHZLDS20Jyc2vtJxz7hmuXoAQaDMCmjFmlmrNj3L4jokyeX0N8jcN/BTn3PcjeRRuMzMoi5Nx/W0BN/O1J0M0IkXmw2eNUJ0swzLt2AqVodL7y0UWIMFAykerQHuU90P+PZgP9ANb0ZHuk5QAOV4N8qQ5mZat+MTzy2ttlkpiksJOHxi9V5vBv5ESVv6k6vnI9oKEHGskqPTfr9ZCOrywhCg0vHM4WKRtOvMZlJE7qpjTxURiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eGrHPtm/oCga1jNTXoSqoYe/9FJy+c5NhCqctM+6iI=;
 b=JdnDG3QdFz+04VqTj0jZzF5ZM2jGWHC+69nG9dWHTr/tEQ3nWOVpuQ34QyGWjkoodlDXPXL/UcRXU4E3nzblpEqGZA34OSTgic0B6Ak7D4H4WHqdIE1rtX/STsVzngsOoRxqEZUpOarsRWv3DTU8CR2y9sQnkAWZeaAcImAk3E0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5659.namprd11.prod.outlook.com (2603:10b6:510:ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 17:02:01 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 17:02:01 +0000
Subject: Re: [PATCH v5 25/25] drm/i915/guc: Add GuC kernel doc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <matthew.brost@intel.com>
References: <20210902005022.711767-1-daniele.ceraolospurio@intel.com>
 <20210902005022.711767-26-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <2f4367c3-4c1c-9128-25f4-77cfaaa605c1@intel.com>
Date: Thu, 2 Sep 2021 10:01:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210902005022.711767-26-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW2PR2101CA0002.namprd21.prod.outlook.com
 (2603:10b6:302:1::15) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW2PR2101CA0002.namprd21.prod.outlook.com (2603:10b6:302:1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.1 via Frontend
 Transport; Thu, 2 Sep 2021 17:02:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20502dbc-3519-4694-ae39-08d96e3361d1
X-MS-TrafficTypeDiagnostic: PH0PR11MB5659:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5659B1B1C3481DF23B8274F5BDCE9@PH0PR11MB5659.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cCJkTfGPZf7dCPHFA8aDm1getamKbwo64ree0FuCXCCEyMAG2OVgmZ/W26JQGQ8Tx/H29KMthOGj2LfvzG6G+vs3QmFKjM4nQpM5ZiMKTcXu8qJg+lijOg3Xj4njxn3bq8ZINYB4W16R4WPU2q2heIqb7/TMeHXj8qvlcnwXiI9eIbGHH7wHrcEIrwY5ifC7YuTLT3EN7XfI/IU602fgridKQndMG5PsUHk9qfu1A8F6p2Zkau1xK2Bpaapsazg4MZOs+oD2sFvNwtu9P47SvslPPnsPqun/8sC/j73C2dlyTPrQwI/4yKhcKKSz37iIjpl7KzWe62nw6LfuxQsGKki4k3qujQUgmdo6gfO6fCv6WhMUz/LJx/UMLyRNtzhkorkoZUwQ+U+sHAdMxlB64zW3uJjbzQAuWEVS9e1pJ/leHSg8YxLa2shc6cyY5hAhNDSEMK5nIAEM1VgRUEjhZ673h8tlUNEI7vkfGlyBRGh96+Pu+PgXB2ThxcSlXjxpIpw5HoLqjVzb5Gvcyt8WZ2oqT2F8e06CPQjwOdjWjWfjG22IPF9YxPh05vu7uswvdGsPSxI78wqb4sb3HAfYYQataHxIw/ACN0JAjjEWl1q+uOR8teRjIkijRdGGENI5tvlTqzkx9qB++uBNwgyvcJUgzP0vg1orOpnGnv48J8RIMnyuBy9gBg8n1/BLnYlMywv4ANySgHKNCJbTwgjxWcQz1K5HvsUw1NUGArivpTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(8676002)(508600001)(4326008)(5660300002)(26005)(450100002)(2906002)(31686004)(6486002)(83380400001)(8936002)(107886003)(30864003)(38100700002)(6666004)(16576012)(2616005)(86362001)(66476007)(53546011)(316002)(31696002)(36756003)(186003)(66556008)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE9rTEtkNVQvQm5UOEs3MzNFU1pGVDRyTmpENS9zYjZ6b2w4M0FkLzNGM2d5?=
 =?utf-8?B?QUtGOXRITkV3S0MxTGFxaEZ1THJQeDlLNXFDVlp6RzZPOFlFSVhkM2ZRWFZs?=
 =?utf-8?B?QzFlbGZzTGdJbFYyOEN2RGFQZGd3S3JaOU00VXVsY0luUElDbnRGd2NMYm9Z?=
 =?utf-8?B?b2NaZWY4clUzdVJFazdZaVFKTlhFNWZ6RG9GTHMzSUdVQWdDMmMva3VjeDVz?=
 =?utf-8?B?YnlRNG1zbUJpMWRQRDZ3b2Q3dmhDZjFCL1FlWk5qblF3NGthSlY0d00wWmVn?=
 =?utf-8?B?bGI4c1Y4T0hZQWVZZnd5SHFzNCtMUjc5WVRadit0elJXUXdDZWtXRzQ5bDU4?=
 =?utf-8?B?S0tnZEdNZ3grSURkNzY5Q21YWEs1Y2I3ZVVLNWo1UjVNQnZVRU5SWFIwUDZD?=
 =?utf-8?B?U0QxRFM5cmxGZE1zbWRYMzR4YVVPQ0tRTVRPRVVzSEx1WGNvaCt0ckhqa0cz?=
 =?utf-8?B?NGZvdEFlNHpUNmpER1JKd0ZiMWR4R2VYZnR3NVN5UHFGc2U3SGErdlFPMFlH?=
 =?utf-8?B?OE9EVjUyTDFJRTdoZHVKdUdiNTZ2bzRrQTM2MWRINFQ4enZWb2tKajhtdTQv?=
 =?utf-8?B?Nlpka2VlQy9FajRQL3R6MjRFbjcrUjZPZ2g4NHRNTXNkbXVHUFo4eG5iUERh?=
 =?utf-8?B?dXZYd09PaGdHZWc5S1dSdm5FVm1UcXVDZUt3NW1Oa3llWHZCMXA5VzBkQWUz?=
 =?utf-8?B?bHk5RnJ0SkVPY1JiM2s0d1gvemc2aHROanV0L1c2bGhhUkx3YzM1OUhGb1Fj?=
 =?utf-8?B?WUR6cXhLNFVDRnVDRURnV3RzUDRPanFsTTlpTHhIUXFRUHAxOXBVYkJUQ0Jq?=
 =?utf-8?B?SitZdGFIM3BVMnRsUDRRSEU2ME4vMit5Z0ZMM0VOVitpQ05rc0E0YzlESXM2?=
 =?utf-8?B?eFdKbnh4T1JsazFRSHlSU3ZkbElSbE9CTS84SGM2MlhGM1czNXBFMWJyRmxL?=
 =?utf-8?B?dlRhN2VSMkJDWmt4Z1lYdk9qUzNHZzIzYTlRTHFXdFY4aC9zb3Z4OUNTSFZh?=
 =?utf-8?B?YkRtaVR0Q1BOQUtRQjZSU0VXc2pZSFR5dldtcDFldzluTFRZYXBvT0RMTXNy?=
 =?utf-8?B?M0VxT1h0L3ZzRXNXK3ZSa2VEcE1uWW1CRWZQUmx2dzZUYXBjbU1VTXA4N0ZB?=
 =?utf-8?B?Qkt3NzhTcEUrdTIwNFc1WGF2b0tBdFpyaHFLdHR1dWtidHdubGo5YlFCaURU?=
 =?utf-8?B?OGtleDdEN29yTno4THlSOXZSaFEvRUhBMm0zZ2tiMFloeUE4WFJ5a3dJa0Vv?=
 =?utf-8?B?emwzN0g4TFJZazNDeUpFT05RNEQyMkhPOTZuQ1RMSkxwNm9oVXpvZkpNS3lx?=
 =?utf-8?B?VFIvd3RHc0J2ZkxLVkE2Q1JZcVROeVVOd1ljaWNpd0RuQjgrUWlmOWNFMEN4?=
 =?utf-8?B?eUpsZG1MLys3b1ZpUWNrSjR6djgyQktWQmp5elBtY1JkYVNjZXNJRGUxRkQ2?=
 =?utf-8?B?OWs1MnZEd2VIZ045V3JSM0RBVS9mb0ZQRWlaMzdhblJpbmIzK1dtVTNQQmh2?=
 =?utf-8?B?NjhRY2E4WXBSSmpabk50WndRNktPU2RKNEpyclV5bnBIbXpXZGhEcmgySE92?=
 =?utf-8?B?bmcvdE56bi9yaDk3K2tOOVRoYUpyTlplZWRNcnd4bG05SFFoa0R1R2dXSXFt?=
 =?utf-8?B?SG5Ddy94WnFwQjlVTlJkd0ZiK0FDa2FvTlF3Z3VGaW4yeFFNNk5yL2NwVThj?=
 =?utf-8?B?NnFuc0xZeEI2V1BHNy9sY2RHZmpYYUF5U01YcXI2ZXB1SndMdnBHOTVsRkx1?=
 =?utf-8?Q?jkmVsnqtlxtMHWXcr9Bb9/zoIbIhxQOha7i4kul?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20502dbc-3519-4694-ae39-08d96e3361d1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 17:02:01.4727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT+31zCeUoszMpEZqwMFL32Sdg+IPGAP+FvwvarfpZYXcloaungp+MQ2oTY/GxkuXmQkDffnTAScGRLzVa26CmqG7CN2uBkw0J1kdWT+Kk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5659
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

On 9/1/2021 17:50, Daniele Ceraolo Spurio wrote:
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
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   Documentation/gpu/i915.rst                    |   2 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  43 +++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  68 +++++++++---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 100 ++++++++++++++----
>   drivers/gpu/drm/i915/i915_request.h           |  21 ++--
>   5 files changed, 174 insertions(+), 60 deletions(-)
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
Not part of this patch, but shouldn't guc_id be inside guc_state?

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 2e27fe59786b..8427cd590087 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -22,74 +22,114 @@
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
> + * i915_sched_engine to replace the legacy ExecList submission.
Not sure if this is referring to how the GuC code used to be or if it is 
just meaning that the execlist backend as a whole is 'legacy'? Either 
way, seems like it would be simpler to just say 'manages client pool, 
owns an i915_sched_engine for submission.'

>    */
>   struct intel_guc {
> +	/** @fw: the GuC firmware */
>   	struct intel_uc_fw fw;
> +	/** @log: sub-structure containing GuC log-related data and objects */
'log-related' doesn't need to be hyphenated?

>   	struct intel_guc_log log;
> +	/** @ct: the command transport communication channel */
>   	struct intel_guc_ct ct;
> +	/** @slpc: sub-structure containing SLPC-related data and objects */
Likewise 'SLPC-related'.

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
> +	/** @msg_enabled_mask: mask of G2H notifications enabled in ACTION_DEFAULT */
What is 'ACTION_DEFAULT'? Can that be a link to wherever it is explained 
in the docs?

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
> +	/** @lrc_desc_pool: object allocated to hold the GuC lrc descriptor pool */
LRC is an abbreviation so should be in capitals. Same below.

>   	struct i915_vma *lrc_desc_pool;
> +	/** @lrc_desc_pool_vaddr: contents of the GuC lrc descriptor pool */
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
> +	/** @send_regs: GuC's FW specific registers used in MMIO send */
'used for sending MMIO H2Gs'?

I think it would be good to specify what kind of 'MMIO send' this is 
used for.

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
> +	/** @mmio_msg: Store msg (e.g. log flush) that we see while CTBs are disabled */
Not sure what this means? It is a temporary storage for when CTBs are 
briefly disabled and we need to hold off sending a message? Or the 
regular receive buffer for incoming MMIO based G2H messages? Or 
something else entirely?

>   	u32 mmio_msg;
>   
> -	/* To serialize the intel_guc_send actions */
> +	/** @send_mutex: used to serialize the intel_guc_send actions */
>   	struct mutex send_mutex;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 6a894c3b7925..7345b6a98f56 100644
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
> + * doing guc_id allocation operation at a time for each GuC in the system.
operation -> operations

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
> + * H2Gs can be lost as the GuC is also reset. Losing these G2H can prove to
to fatal -> to be fatal

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
> index d818cfbfc41d..2583c6ae2821 100644
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
> +	 * GUC_PRIO_FINI) outside the GuC priority range range are used to
range range

John.

> +	 * indicate if the priority has not been initialized yet or if no more
> +	 * updates are possible because the request has completed.
>   	 */
>   #define	GUC_PRIO_INIT	0xff
>   #define	GUC_PRIO_FINI	0xfe

