Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D66E424C3E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 05:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D6C6E825;
	Thu,  7 Oct 2021 03:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B916E820;
 Thu,  7 Oct 2021 03:37:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="289657045"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="289657045"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 20:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="715023916"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2021 20:37:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:37:07 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 20:37:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 6 Oct 2021 20:37:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 6 Oct 2021 20:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVRO4a+gs8Uv1qFrzaLXGlMl6y4y9N3lNDh3rU5Hu99gUTfG3puoeTsHjdOdDws5NtCONpXhlxQKndA9bQ5NLhkGxEnz/GkN7uM1IM/7HqzFXlEBckkDkgb2UXAVOh89ibOymK9zdgWJwouoG8kxYkKdu4lzetItvTuLJ+fpNpQLpQkdxEtv+q8PWHl5IGKSsHceFpYDOBrAWnSBp4DOXFduYoKsmsJY4oq/6ox+ooeQEqEpq6pgj05LsSB/LoplTVfhcHQyLeKtuCDfCJ9KxcvnWc1HnhAeVQJdCq++FC/7wANTEnlZRF8eme8csXAU8OhZ0dK56PxZWLFLUsxh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bRcp3iN15cuS4VB8s9tf5DbUMAg9BfqYvPWqTgvYRc=;
 b=CNSmRx9EZyaVMtPXC6u/bT7w+oVUZaVxDfiRnHkVDujEtGysaxvboBHDEeatinc5iINtIWgPskoxmdKq7EJnxJ4Sr+DvW5TcZy4l/w7h6s5OabRBeiekrTGZWtU7wQg46db8gRwCpGLgN3AEV+nXvIlvZq6geHJG84Gq7Vj2Q0CYzj7oOT9wM2SpS6zGW55nyT3w0Pbe2fhbT6DDTxsYZP7UMTX3SmmUBn5F8LNDQaIN/9iKqwG0iSazd143He9LFo9x3MfRyfumRZITASoV81pDjuTSwSXwnuKjJbFTQGyxi76Vhy3vr0neQSBpVC+yY3i9VBxoXbMgEpHFIgKgDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bRcp3iN15cuS4VB8s9tf5DbUMAg9BfqYvPWqTgvYRc=;
 b=FZPyqiqTDG2H39xyPycLq9v4ti5jpP0QXWulhgiNX1yx6P3D0O+zkKTGwD2qUOEMadk4vHpYm1wOdwgPolCWY1XnWFQaFTbErs5pm5BJhODRbs4wlvxK/5mwUnZxx2kwIAdjPOxXxBI9d9SCwTKSC2mXS93N87T+WXfqXtKgGyU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16)
 by CO6PR11MB5572.namprd11.prod.outlook.com (2603:10b6:303:13c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 03:37:06 +0000
Received: from CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4]) by CO6PR11MB5633.namprd11.prod.outlook.com
 ([fe80::e577:c555:e1c:23e4%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 03:37:05 +0000
Subject: Re: [PATCH 02/26] drm/i915/guc: Take GT PM ref when deregistering
 context
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <c2d4b2f9-741e-3454-baae-6cc1d2845b5e@intel.com>
Date: Wed, 6 Oct 2021 20:37:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR2001CA0021.namprd20.prod.outlook.com
 (2603:10b6:301:15::31) To CO6PR11MB5633.namprd11.prod.outlook.com
 (2603:10b6:303:13c::16)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR2001CA0021.namprd20.prod.outlook.com (2603:10b6:301:15::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Thu, 7 Oct 2021 03:37:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae22f7ea-1ddf-4c18-fa62-08d98943bbcd
X-MS-TrafficTypeDiagnostic: CO6PR11MB5572:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5572541F8BF9A695DF340AD6BDB19@CO6PR11MB5572.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7S78ddj8ZfYKOhkCMcz4l7M1+V14zF/2vJrc0bVMKbO6fMIJUbyxvipkhuuY1parPWgNxwMzktNuPrlUy9z8Z3e0ljo19IMfC87t+ImBEKlNPKqNxWVdd8QNF2/vaEv5rBpjYh/v0IKARCM0KmwCBxxud4riHA78/Tb9WXktHbP7p2g53LtjRRumvCnRv+zxfAzMhuMjW2KnEkOrjI+RnSM7vGYJd84472uFlqUoGiqIFGMBAV6a3pZmomi4r4SMuBwXwpYyawI4D8Yn0TqUz2zP/29n2tQJ6Nc0fCIi4xc9ZrHMe+hVEu7xcqYU2pn9tM/vVkwb3/ZGdsrc4wmexxnYUtNNyOND62xpSUoWVqdEMmGJSPw/uVgjS0kEEFMoDyArUvzO8q5ih5bAaBGwkUVFpeywLv4nPPWL1XqW7CMkVVRnklWp6YLfBLL8cr078irNRWI3i4vcCssbuM8MU9xWlqgha1+nRKhT5olKQQGPB4DPYHqBHpz+a+OHO3/M4Vs7M80cSkf9q8Eb7WAtKo0SB576C9oy9nxqvZY5be+t6Jn6mODCv4mXzq3IgMZiYSWAEEtXqUeM5rzKiM5Kjjjk6iCH7X+HkfW0nKhCoMnilxEsso72wN5CUB476496cFZThNWNqfuN0OciG5NsKUddWuQPELER+r6gPtuv5oI/rNbRV34HaCUtfholDkEOvnD6ax2Lxgb7ZGaS3qFjJIfjyQbG5kTRAkhK7qd7hQXLsLVStCrciUmwTsuhrlWugsF2f9c6LLUXg5IqzCGDGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5633.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(450100002)(31686004)(107886003)(8676002)(66556008)(26005)(66476007)(186003)(6486002)(4326008)(31696002)(8936002)(86362001)(66946007)(956004)(2906002)(53546011)(508600001)(83380400001)(16576012)(316002)(5660300002)(36756003)(30864003)(38100700002)(2616005)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykk1cVpucTdyZXlldmtFOWw5RmtwejBTMGZNdHR4VUhsZUdLU3dnQ1VRN3cw?=
 =?utf-8?B?dDJIb2hRbWlPZkJab0t0Y2ptd2hBL1lvMlBhQThaa2ZKNWdXaENKdGU1a3Vn?=
 =?utf-8?B?TzFQNERYQ09NSnFLTjB6M01zYU5FZ0VQRlJKWVZ1am9lR0Z5RDNUMVhGZWlq?=
 =?utf-8?B?NHduWXNZdUZ1OGVkaTQzcGlpQ3RjMHhpNWNlMm5YdHd2WWgwYXVnKzF2VXdQ?=
 =?utf-8?B?Y1M5OTBZNGpPQUFuZVl6anFBN2Q5UEFqYXQ4TzFoZVliSnlLa2hyR0VmZkFH?=
 =?utf-8?B?UXNaSVdzbExzMy82OW9BWGowVTVPZ1YvV2VldCtQK0l4Q210RldyZTZqcEhC?=
 =?utf-8?B?SnhoSjRzODFUd2xMMHNtUCtjWlIyVkp1MDZiTkVjMjNWQzlVUXdqck9YSTlN?=
 =?utf-8?B?cGI4ZmkvOUZRRDhVanVqYW13LzY3WC9XNnc0NWNBbjNrZzVkRlBVUElEckxF?=
 =?utf-8?B?bFN4dE9KaXBGcFVvOXo2UjhJc1h6NkRjaGIvcHAyaUY0L29jWHNMeTl2OUY1?=
 =?utf-8?B?YWdvcU1OUFNWY1RPWkY1cFlsUTViejNMekVRN01zaXpFUGRobFVoWTMyeFYy?=
 =?utf-8?B?eGNyWEZUY1UralFGczc4bDZHa2ZZWlovWWFwbVlvWVhCYVV0NkZYbC90ZDJh?=
 =?utf-8?B?bm5WN1VlYzhHWGtjNUtIeG5yQVJEbFhJdTBtT2ZteDdTeWtzMTZUTDd2bmM2?=
 =?utf-8?B?emszRjBBbWdBRE9abmVocFJxQTF0R3p0YysxQ2p4QmxteHdrU3hINmZlenVH?=
 =?utf-8?B?VCtRZVVQYXhoQ1EwTmc1WXJwY2xxUUdOZzJuMlFwWW1hTC9xU0x0d1pqaEly?=
 =?utf-8?B?VHF6YmlCWTk4RVFMNnROUUxjdXVMK2JUbzZZajZwWTJ2M005alhuYVJsOEFF?=
 =?utf-8?B?NUtSUDhQRXR6NzRvM0UxOE12cDRxT21Fa1FqaDd5eXh0N1FhYnR3c1FEZWVX?=
 =?utf-8?B?K2hmc2dLQlFaNDdVQlVYQ1luWTJwVkRIWGxSRGFsc1dBWC9KYjRXOXNWeVlG?=
 =?utf-8?B?T1Z1WTZUYnhIaEFYZUpIUEFjSkpVVFFpNGVJUnNPUndHdzBrMGlmRmk5WTcr?=
 =?utf-8?B?UW55UU9YeTNoanlHUDhZNXpISkZMV1N1T0ZZc29QcmVjcW1MNkd5Rkp6K0dk?=
 =?utf-8?B?N0hCbHNQNDdTZWcreFV1YkNOYXZpM3dNemtaMTh1L0V6amdSdUJHcG9TZ05Y?=
 =?utf-8?B?VlFTcEJJOTgyUytyUWNkV0llNFhjeUJ6OTFwTGh3dFd0UStTVVB2N0IzWUZs?=
 =?utf-8?B?RUEzLyttbW52TkJyRlBaeEdrbG5NVURwV2RuMElMVmZGd05ORWxKNGpNVzZB?=
 =?utf-8?B?M3prdHZPMWpLelNiNDhFSXM5Q2NtamQ4RE1hdE5wOTB4Vi9OZE1WR2g5QkFK?=
 =?utf-8?B?Z1NIN1NZaDEwbkZqWFFVdnlVVXVXdSswMUkrSUhkOThyN1ViMk5aQmcvS1Y3?=
 =?utf-8?B?OVBhVHFBbVU4RFhSdFMzMHljSkdUcTBjRElYRmdlWUVXcVJ6UTh3TGhEV1RO?=
 =?utf-8?B?TFMrRG1nMXlQWmFvZXpDNWpHR0RyOUhib3JRTUpHNDJYV1VaVFhLaDJYaTFX?=
 =?utf-8?B?UEZJMkdpa20yK2VTQUowZE9xOWpvN1N3N0Y0NTU0WXh1a0tTS2V1Y1VzTlJi?=
 =?utf-8?B?cksxOTIvaVlKb2pyWkR3bHVRT2JNRWFUcnh5NmJUczJVc2VjSU51NkFVaFJF?=
 =?utf-8?B?MnVtTlc1V20za3pkT3QrSmlyR1Y0V2VHRHJJWHlOa0pTNllmMUNnUWVjY0wy?=
 =?utf-8?Q?J5OP2AdmsirfeBP3U8S+UbVbpCvGSmvbI/8EMF1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae22f7ea-1ddf-4c18-fa62-08d98943bbcd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 03:37:05.7264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mm+CX/hRksdUP7xt0+hk7FUAU4O1kXOfDbPmVLvATeI1vjQ8gopdXUkGMpqTQQ2BQLMGN3vPOd17J0os7GMl4z8GM2+ONO/q+TeGlH3vUBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5572
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
> Taking a PM reference to prevent intel_gt_wait_for_idle from short
> circuiting while a deregister context H2G is in flight. To do this must
> issue the deregister H2G from a worker as context can be destroyed from
> an atomic context and taking GT PM ref blows up. Previously we took a
> runtime PM from this atomic context which worked but will stop working
> once runtime pm autosuspend in enabled.
>
> So this patch is two fold, stop intel_gt_wait_for_idle from short
> circuting and fix runtime pm autosuspend.
>
> v2:
>   (John Harrison)
>    - Split structure changes out in different patch
>   (Tvrtko)
>    - Don't drop lock in deregister_destroyed_contexts
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
>   drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   5 +
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 146 +++++++++++-------
>   6 files changed, 121 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index e9a0cad5c34d..1076066f41e0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -399,6 +399,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id.link);
>   
> +	INIT_LIST_HEAD(&ce->destroyed_link);
> +
>   	/*
>   	 * Initialize fence to be complete as this is expected to be complete
>   	 * unless there is a pending schedule disable outstanding.
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e7e3984aab78..4613d027cbc3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -213,6 +213,13 @@ struct intel_context {
>   		struct list_head link;
>   	} guc_id;
>   
> +	/**
> +	 * @destroyed_link: link in guc->submission_state.destroyed_contexts, in
> +	 * list when context is pending to be destroyed (deregistered with the
> +	 * GuC), protected by guc->submission_state.lock
> +	 */
> +	struct list_head destroyed_link;
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 8520c595f5e1..6fdeae668e6e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -16,6 +16,11 @@ intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
>   	return intel_wakeref_is_active(&engine->wakeref);
>   }
>   
> +static inline void __intel_engine_pm_get(struct intel_engine_cs *engine)
> +{
> +	__intel_wakeref_get(&engine->wakeref);
> +}
> +
>   static inline void intel_engine_pm_get(struct intel_engine_cs *engine)
>   {
>   	intel_wakeref_get(&engine->wakeref);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index d0588d8aaa44..05de6c1af25b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -41,6 +41,10 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>   	intel_wakeref_put_async(&gt->wakeref);
>   }
>   
> +#define with_intel_gt_pm(gt, tmp) \
> +	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
> +	     intel_gt_pm_put(gt), tmp = 0)
> +
>   static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>   {
>   	return intel_wakeref_wait_for_idle(&gt->wakeref);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 65b5e8eeef96..25a598e2b6e8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -84,6 +84,17 @@ struct intel_guc {
>   		 * refs
>   		 */
>   		struct list_head guc_id_list;
> +		/**
> +		 * @destroyed_contexts: list of contexts waiting to be destroyed
> +		 * (deregistered with the GuC)
> +		 */
> +		struct list_head destroyed_contexts;
> +		/**
> +		 * @destroyed_worker: worker to deregister contexts, need as we
> +		 * need to take a GT PM reference and can't from destroy
> +		 * function as it might be in an atomic context (no sleeping)
> +		 */
> +		struct work_struct destroyed_worker;
>   	} submission_state;
>   
>   	/**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ad5c18119d92..17da2fea1bff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -90,8 +90,8 @@
>    * used for all of GuC submission but that could change in the future.
>    *
>    * guc->submission_state.lock
> - * Protects guc_id allocation for the given GuC, i.e. only one context can be
> - * doing guc_id allocation operations at a time for each GuC in the system.
> + * Global lock for GuC submission state. Protects guc_ids and destroyed contexts
> + * list.
Feels like this should not be removing explanations, only adding to 
them. The patch itself is only adding new features not removing them. 
Either the details about id allocation are not worth mentioning and 
should not have been added in the previous patch. Or they are and should 
be kept rather than removed in this patch. Either way works for me. The 
comment was valid information but does maybe count as obvious from the 
guc_id member (and friends) are within a per GuC instance structure.

>    *
>    * ce->guc_state.lock
>    * Protects everything under ce->guc_state. Ensures that a context is in the
> @@ -719,6 +719,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   			if (deregister)
>   				guc_signal_context_fence(ce);
>   			if (destroyed) {
> +				intel_gt_pm_put_async(guc_to_gt(guc));
>   				release_guc_id(guc, ce);
>   				__guc_context_destroy(ce);
>   			}
> @@ -797,6 +798,8 @@ static void guc_flush_submissions(struct intel_guc *guc)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> +static void guc_flush_destroyed_contexts(struct intel_guc *guc);
> +
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   {
>   	int i;
> @@ -815,6 +818,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
>   
>   	guc_flush_submissions(guc);
> +	guc_flush_destroyed_contexts(guc);
>   
>   	/*
>   	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> @@ -1126,6 +1130,8 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   	intel_gt_unpark_heartbeats(guc_to_gt(guc));
>   }
>   
> +static void destroyed_worker_func(struct work_struct *w);
> +
>   /*
>    * Set up the memory resources to be shared with the GuC (via the GGTT)
>    * at firmware loading time.
> @@ -1151,6 +1157,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	spin_lock_init(&guc->submission_state.lock);
>   	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>   	ida_init(&guc->submission_state.guc_ids);
> +	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> +	INIT_WORK(&guc->submission_state.destroyed_worker,
> +		  destroyed_worker_func);
>   
>   	return 0;
>   }
> @@ -1161,6 +1170,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   		return;
>   
>   	guc_lrc_desc_pool_destroy(guc);
> +	guc_flush_destroyed_contexts(guc);
Seems like these lines should be reversed. We should destroy the higher 
level constructs before the lower level ones that they could be built on.

>   	i915_sched_engine_put(guc->sched_engine);
>   }
>   
> @@ -1859,11 +1869,30 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	unsigned long flags;
> +	bool disabled;
>   
> +	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>   	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> +	/* Seal race with Reset */
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	disabled = submission_disabled(guc);
> +	if (likely(!disabled)) {
> +		__intel_gt_pm_get(gt);
> +		set_context_destroyed(ce);
> +		clr_context_registered(ce);
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	if (unlikely(disabled)) {
> +		release_guc_id(guc, ce);
> +		__guc_context_destroy(ce);
> +		return;
> +	}
> +
>   	deregister_context(ce, ce->guc_id.id);
>   }
>   
> @@ -1891,78 +1920,86 @@ static void __guc_context_destroy(struct intel_context *ce)
>   	}
>   }
>   
> +static void guc_flush_destroyed_contexts(struct intel_guc *guc)
> +{
> +	struct intel_context *ce, *cn;
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!submission_disabled(guc) &&
> +		   guc_submission_initialized(guc));
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	list_for_each_entry_safe(ce, cn,
> +				 &guc->submission_state.destroyed_contexts,
> +				 destroyed_link) {
> +		list_del_init(&ce->destroyed_link);
> +		__release_guc_id(guc, ce);
> +		__guc_context_destroy(ce);
> +	}
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +}
> +
> +static void deregister_destroyed_contexts(struct intel_guc *guc)
> +{
> +	struct intel_context *ce, *cn;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	list_for_each_entry_safe(ce, cn,
> +				 &guc->submission_state.destroyed_contexts,
> +				 destroyed_link) {
> +		list_del_init(&ce->destroyed_link);
> +		guc_lrc_desc_unpin(ce);
> +	}
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +}
> +
> +static void destroyed_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc,
> +					     submission_state.destroyed_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	int tmp;
> +
> +	with_intel_gt_pm(gt, tmp)
> +		deregister_destroyed_contexts(guc);
> +}
> +
>   static void guc_context_destroy(struct kref *kref)
>   {
>   	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> -	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	intel_wakeref_t wakeref;
>   	unsigned long flags;
> -	bool disabled;
> +	bool destroy;
>   
>   	/*
>   	 * If the guc_id is invalid this context has been stolen and we can free
>   	 * it immediately. Also can be freed immediately if the context is not
>   	 * registered with the GuC or the GuC is in the middle of a reset.
>   	 */
> -	if (context_guc_id_invalid(ce)) {
> -		__guc_context_destroy(ce);
> -		return;
> -	} else if (submission_disabled(guc) ||
> -		   !lrc_desc_registered(guc, ce->guc_id.id)) {
> -		release_guc_id(guc, ce);
> -		__guc_context_destroy(ce);
> -		return;
> -	}
> -
> -	/*
> -	 * We have to acquire the context spinlock and check guc_id again, if it
> -	 * is valid it hasn't been stolen and needs to be deregistered. We
> -	 * delete this context from the list of unpinned guc_id available to
> -	 * steal to seal a race with guc_lrc_desc_pin(). When the G2H CTB
> -	 * returns indicating this context has been deregistered the guc_id is
> -	 * returned to the pool of available guc_id.
> -	 */
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> -	if (context_guc_id_invalid(ce)) {
> -		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> -		__guc_context_destroy(ce);
> -		return;
> +	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
> +		!lrc_desc_registered(guc, ce->guc_id.id);
> +	if (likely(!destroy)) {
> +		if (!list_empty(&ce->guc_id.link))
> +			list_del_init(&ce->guc_id.link);
> +		list_add_tail(&ce->destroyed_link,
> +			      &guc->submission_state.destroyed_contexts);
> +	} else {
> +		__release_guc_id(guc, ce);
'destroy' can be true if the guc_id is invalid. Is it good to call 
release on an invalid id?

John.

>   	}
> -
> -	if (!list_empty(&ce->guc_id.link))
> -		list_del_init(&ce->guc_id.link);
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> -
> -	/* Seal race with Reset */
> -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	disabled = submission_disabled(guc);
> -	if (likely(!disabled)) {
> -		set_context_destroyed(ce);
> -		clr_context_registered(ce);
> -	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -	if (unlikely(disabled)) {
> -		release_guc_id(guc, ce);
> +	if (unlikely(destroy)) {
>   		__guc_context_destroy(ce);
>   		return;
>   	}
>   
>   	/*
> -	 * We defer GuC context deregistration until the context is destroyed
> -	 * in order to save on CTBs. With this optimization ideally we only need
> -	 * 1 CTB to register the context during the first pin and 1 CTB to
> -	 * deregister the context when the context is destroyed. Without this
> -	 * optimization, a CTB would be needed every pin & unpin.
> -	 *
> -	 * XXX: Need to acqiure the runtime wakeref as this can be triggered
> -	 * from context_free_worker when runtime wakeref is not held.
> -	 * guc_lrc_desc_unpin requires the runtime as a GuC register is written
> -	 * in H2G CTB to deregister the context. A future patch may defer this
> -	 * H2G CTB if the runtime wakeref is zero.
> +	 * We use a worker to issue the H2G to deregister the context as we can
> +	 * take the GT PM for the first time which isn't allowed from an atomic
> +	 * context.
>   	 */
> -	with_intel_runtime_pm(runtime_pm, wakeref)
> -		guc_lrc_desc_unpin(ce);
> +	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
>   }
>   
>   static int guc_context_alloc(struct intel_context *ce)
> @@ -2798,6 +2835,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   		intel_context_put(ce);
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
> +		intel_gt_pm_put_async(guc_to_gt(guc));
>   		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   	}

