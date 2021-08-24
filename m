Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306E63F6C2D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 01:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110BC6E0EC;
	Tue, 24 Aug 2021 23:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775CB6E0EC;
 Tue, 24 Aug 2021 23:24:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278430665"
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="278430665"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 16:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="464592681"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 24 Aug 2021 16:24:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 16:24:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 16:24:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 16:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBVfw6FLkxeBUA0GwzVzg7DobHGKci1P2UJOex6TSk8jf3Dlg0I0vsocTxl8b47nyh535usB5X39729wCDtJcUUdSiKP3Ss9gkUoRVTExzoXNQcSkpOHbVWx+G75ONcwnNgly36v5KihfWGLAJth1u6DFZoXqUnxZ/ZjjIoDdh5FLz7iXGEPcXILtFq7TDS61YpSp5IUI+ptCfqHXwA1ftoe2om7uBUjUiZt3wj1H/Uz3Bh+jT8n0IED0hdKGL6krUg+lULAgOMQShq4ZGf7Nz9So8DrCpgpewYHHI0GCjjCQsW3lBoS+Z1bfP2BJMT+Pbi18I1eXUXqsbI/Yw1cGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VNsywpHaea48fq1H3+CJZPLMKfRDetZU/cgl+nVpBM=;
 b=JAT0O7vQQe1ff28PVHjPRk4bkNQJ3NNEJgCjLZl25cV/zyjdoWI3OvGeQhbZfVdze3qR2GWKjbfIVmkpOEmsIvzt1yBd5GcsmmdGnp/4QJ28C7BwxAR9lNGPdfqhgYXMNmVkR9plNZa0P/7g4WCOQjGKLoZ0pTsBWfg6vzq73kU/b71Qlu3gBafLEWS9Co/m0HzmOjqpHDxhjmHagJQ99dSeBaPLb3MHRXAoolbvc5DcnAYB2ynbAUES74wTSsCsgO0UG9IXK23XqIPCVIN/mHJaSyO5L+T4jl2VV7so4iOhKqB1wEie9IrGiD8VRedmWt/2llOBpCyS0qhfeN1PdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VNsywpHaea48fq1H3+CJZPLMKfRDetZU/cgl+nVpBM=;
 b=VBurJuyD8DAZuE3ZdUhCra74/L+5AbcC4V55IsvT9f+8qDyoTqVbEuIHUvsKxNTx6tXJkpssLLyItoX7PgMJvfEiIAG4nZAIj01ZNivFNPvASDL59VryPrfIqm6HMjpFM1QvsGeSVl1sL5ZVWfTte3tC7UU0RERl5obWUyMUGY0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 23:24:32 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Tue, 24 Aug 2021
 23:24:32 +0000
Subject: Re: [PATCH 01/27] drm/i915/guc: Fix blocked context accounting
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-2-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <684edc4b-90e4-d0ee-0f3a-9381e9a05463@intel.com>
Date: Tue, 24 Aug 2021 16:24:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR03CA0072.namprd03.prod.outlook.com (2603:10b6:303:b6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 23:24:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a04f7ce-a9ac-4e1f-3a33-08d9675653e7
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB5332D6DB4EEDF9DE7E236951F4C59@CH0PR11MB5332.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86DjO4Ty/clrZQO+kYJy1nNBcdzSjZ1/f352UPGtAswTFKmIp7oLKOVfWr9SEm2GKeufVXyNqtBwsy3gpY8Qw7mKVegj3BQ3yAWb1O89qDZG216bgl+/muIaZWIx2cthaMRsmjbqaXbXpy4LIZVZCrtEc7Kqq+VB14dA6g5glIta2e+ke+/s7inEeGQ40XGzZTZq7AQ6L5WmLPIEZheoKtm1ql+BFM012LWy2RaYRniZD0eHGleD406/QLkIBN9gBBGRV0kPLBvNNNt6gs3lj8KHhCYMM6C9UZFvShOkaQJ6bK5hvt0QYEb3CjRJdqnBlrEvGB5qUlAXfqcm6K8atjY+/n+aMPTTVGOxDTdWL3K969/RskR/HVqIWLlk71pQFFC5dLddfUKGlU/JHrvCjSbXtZN7no5kKAJfGjEXbd/hVFGFwi62umonz+avu/x1tFtbHuKofxf9vzHL0CsP3Cp8gH4iZbAUd+Hg1VoqTlNFcEkfIjS8ehep0QtU0yq/NZhta9Dq7FrINR/bp3yAADm++hALsZEc+LTKahYPSgbZfDCSx01DAm/S2zbSNIKMWRUNB7k7Z0e21jW4wGZOFoQv2tTsb4Q0QTJA2Uk5QacHWcOnDywtLS7GilFjtxSSLSOSoMQTFIi+tNU0c/YmvkOHNjR/PWl7aZNo60j0xRL20spnxUJgFxLsfbWNXnMA4BnzAKHB/jSzU1+SN1Q/+rTdcizwsI2GhPbvDxr6GoYFhfg316az912o36gpk7N3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(36756003)(8936002)(38100700002)(31686004)(26005)(186003)(6486002)(53546011)(8676002)(66476007)(66556008)(6666004)(66946007)(15650500001)(16576012)(5660300002)(4326008)(2616005)(956004)(83380400001)(2906002)(86362001)(31696002)(316002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2VHZHNWSVVxNWlEZ1g4b25WbXBkaVlucXp5bTBHcm9hVURLeXA0M09MWm9k?=
 =?utf-8?B?SzhHcVdoN0NCemw2OTgvbUdPdUNiMzgvNTlkSWMxOWdybStmZ1gzVnNIQXNP?=
 =?utf-8?B?Z0t4WUlYdFRRU1NvODJHYytrRVAyM3ltT01PR2dZeEZpM2FJeUNEWTFPemxF?=
 =?utf-8?B?YjFSNnJJM01SaGQ1alpqMERkS01kSzQ5OFlISmxYT2UwbFdJdzlUbVMrMDBk?=
 =?utf-8?B?NXA3cEhkeVhiMGJYVGJFLy9JZDlWZUZ4Uy9KaDE2dHFFUXZhNnlvVE1zWHZ2?=
 =?utf-8?B?N1VSRXlDUVlKalFlRFB2aWh2WUVUK1JPNkcxdTVYVE5DcWtJdytnam1yQmZa?=
 =?utf-8?B?ek5rRjJTOTZZemVaQlF3UWs0SEV5ZEg5VDBEMTRKVVpzWXpYQlp5VHMzR3g3?=
 =?utf-8?B?MmdOcHNXNElvV0FUaVFEVHI1djNrcld1M2V2S0tPRHl2OHNtU0ZVcXVGeHdN?=
 =?utf-8?B?Q3NZcS9ndmdlTVo4d1FNSVFuYzFMUFpGZkJuUmQxbThMOXlkRE1pOTFUaVNa?=
 =?utf-8?B?TXYvWDlRR0E4dXhIYll2bzZSZzRMSFppMDloKzNiUjZDQ0ZmakJKSzBMdlpC?=
 =?utf-8?B?eUt3YnhvZG5COTI0S2J0dllwM3p5YklIakpCSzZEYzEvajRpV2drODF2OU1G?=
 =?utf-8?B?WWtTYzZYa3MwWUwrUkJaL3dNR05USHNjbExSSFJ1UHhybXVLeXZ5VGJmVWpn?=
 =?utf-8?B?M0lZOUh3Uk9tSFdxVlpjbW5vNHNDTDVvK0I0czQxS0NpVWhYaGZmR1p2aWQ1?=
 =?utf-8?B?cXAzeEZGS1BXampIcm9zem5UbEEvYWRSMTFxNitPVUthMmZKSnNvVkVuSjh4?=
 =?utf-8?B?OTNuK1BhN3A3NWUwemd3V1VrVDF0TGwvVXljWWZ4ZXE1RVhnUGhqSWIyYnRv?=
 =?utf-8?B?dngvajN6M0xOK3BiaTJXekNCV3pUSmdjU3VLY0p0enh2YmozckJ0MmVFQlJQ?=
 =?utf-8?B?V1E3UnYyZDFteE0wYWNpMWJDRzJJYlhPVmxpZ2Q5SUxzTG9XclJrQTFSd29K?=
 =?utf-8?B?VzgyaThja0EzRSsrdW90Tm1SVjVhcWpvbWg5UWdQZVRsZk5CNk9keTY0ZVJp?=
 =?utf-8?B?NVdBVFlIb0NtYkVIRW1aNHJ2a2k2bWNlNU95cWNMTURuZWFxN3NkQitpQlcx?=
 =?utf-8?B?Ymk0ZFVUalBqdlB6YXVuNmdTVzZyR1RrUlA3eVB1c1F4NGZQRkNWYUo2eG5L?=
 =?utf-8?B?RE1mUnlmTGNSUno5UC9VVW1zam0vSDlBdTlTUXQySU1oRzFuOXI2dnRic1pp?=
 =?utf-8?B?cmMxT0NacHgvMDNzNE4vT0trT2RMRkRXeGlSTjc1RU80U0ZZZjAzOW9tYlFz?=
 =?utf-8?B?cDEvTllsOEg2OFA2QzRiVGpPQjdwM3pJSk5JWWorc1lqbzJnK1A4WHB3azFk?=
 =?utf-8?B?Z29Ucmo5M1lDdy9wYndNREtGTHpFTVViNzJSb1lQQWxOTmM3TXRWeWpvVFJ1?=
 =?utf-8?B?ZVQ5bytpN2lCRytRYzZJWngxUXZnK1l5Ymx1L01KUDdQcG0zNmVscy9LWjd1?=
 =?utf-8?B?UE5PNEZ2cUdQZlFXRFdOT3hVWkRZaUpwK3VETC83TnZrN2ZqY1Jhb2V3R25H?=
 =?utf-8?B?SmVtQndPODd0WjNXeHdWaEpMUDFHTzA2bkk1ZGg2bFBBQyt2djR0Z0VBYjFo?=
 =?utf-8?B?Q2VqdGRGV2NQbVJKZDBDemFNMEc1L2FJdU1hRUkwbW9qVC9DcmpidWJsQ3RY?=
 =?utf-8?B?ZWlSUExoVHBCZEtFUlIzSWNHQkdrdW5SOStkcU5XWWFSdEtveWJ4YXdKZkph?=
 =?utf-8?Q?IVhUy0F7uekiOCC2hKj6BJcPic2bIONTGDo6Hpf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a04f7ce-a9ac-4e1f-3a33-08d9675653e7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 23:24:32.4098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6c5skDjqhrgOtLzlFCGTzIQrivi+DA91Jgpy++cyZh2lYmkWyqY3m7B/r7tdg04yTTv46Un4h5qwVcFH5IiD4VIZ29Wv35fQe5UIfnE1gKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5332
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Prior to this patch the blocked context counter was cleared on
> init_sched_state (used during registering a context & resets) which is
> incorrect. This state needs to be persistent or the counter can read the
> incorrect value resulting in scheduling never getting enabled again.

Can you elaborate a bit more here on the conditions in which we hit this 
issue?
After a GT reset the GuC state is cleared so we need to re-enable 
everything no matter what the old enable status was, so I don't think we 
can hit the described error there, unless your aim is to keep the 
context blocked across the reset (in which case the commit message needs 
rewording). On the registration side, if a context is not registered, it 
will be enabled on the submission that is causing the registration, so 
again we should be covered.

Daniele

> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: <stable@vger.kernel.org>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 87d8dc8f51b9..69faa39da178 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -152,7 +152,7 @@ static inline void init_sched_state(struct intel_context *ce)
>   {
>   	/* Only should be called from guc_lrc_desc_pin() */
>   	atomic_set(&ce->guc_sched_state_no_lock, 0);
> -	ce->guc_state.sched_state = 0;
> +	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
>   }
>   
>   static inline bool

