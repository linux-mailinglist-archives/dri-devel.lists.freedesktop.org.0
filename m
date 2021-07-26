Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FD3D6606
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966256E9B1;
	Mon, 26 Jul 2021 17:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F826E9B1;
 Mon, 26 Jul 2021 17:49:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="234148661"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="234148661"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 10:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="566260019"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2021 10:49:41 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 26 Jul 2021 10:49:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 26 Jul 2021 10:49:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 26 Jul 2021 10:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPi9RqJsUVIBBu4DYQdTcHwOX45oBe7IiM9/VJtVglO44UNvpUC5jV5uwTIEXPfx1/9ckwrKN+i8Q7R2TCGOKqo5oTpz7yoVf/i6hfYW2PVvtd3HBqNqf6mFz/RdQuYmlo+LrKZTowvdKQiTcK+/X68PADORXo6H1WrT7XwmurhbYu5It/smRjWdwmESEoF2nZsemkG6JR/5I5vKB96LTC4ojV9RdkfxeLb1FQ+9cR8YKUryNwW2RD5YpApZVPSQKqc7hB+8THGB3WwNC4cxT9tpF1AuOdORsOOoioYpoYExXvwWK+UzgWWpO6Q6SPqVaq/yH+7QnZ0fK+y4pZJusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pQbGg38h8DwMyQj3qlLzBdv2WwbM1Ktxb4Zo74wq6M=;
 b=jBDYZijkh0Q3JCtAsSIiEzS5/gvY0MvhUkANgelowtgJPtPzAlATNMQgHGT1gJnMyLIrbQxtV2IOEWkRNNMNvREJsvus5lDOtZHLGsHpZ1Osm4CPItMZw7m39Wm++EoDeS1c4BId01KK/15fLaPx/SK+qLkyXnkrYdrfdS90dBm7J5+Ckv0WMGKXDLnSbrPzOgL2JJnMrHlsjep1LZC6pFvtGXFUDwj5RQ6FsS1oDcvIWlXQMrTYZVQOsNfFVJHOQXkJHLfY159giaoQalqx0XC4z0vDrNP8VRovts2Iz21Lsynd8N1QsqmsAlN+lFgZy4SGS4+lYJM4uLe18y90EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pQbGg38h8DwMyQj3qlLzBdv2WwbM1Ktxb4Zo74wq6M=;
 b=i9Y6wo4K+MAEp3VJk8SQ/pPVATFiDwuTaIRLfkjgrWEJNVI4VggR88sycRwHCWMstBudzB4nLdcAPBWvZ1c6tUKcKl1vpZVG0P0v8O4UPw83jEL7jB3gtbBBydb2OmaWkyMpO4MPCUUBMGNHSZ6qoB5bvVaPXUMgA9vDaFXJthI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR1101MB2235.namprd11.prod.outlook.com (2603:10b6:4:52::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.29; Mon, 26 Jul 2021 17:49:40 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 17:49:40 +0000
Subject: Re: [PATCH 25/33] drm/i915/guc: Support request cancellation
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210722235426.31831-1-matthew.brost@intel.com>
 <20210722235426.31831-26-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <94fd8610-644b-2df3-92fd-1731db5cf30c@intel.com>
Date: Mon, 26 Jul 2021 10:49:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210722235426.31831-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:303:dc::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR03CA0359.namprd03.prod.outlook.com (2603:10b6:303:dc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 17:49:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 325e6d54-99c3-4e73-4107-08d9505dbde4
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2235:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1101MB22350762D03C5A9CFCB94113F4E89@DM5PR1101MB2235.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQyjduFloRv+Dr/v0G0eleNIAxcCyEG0a7GBvqkf7uSY9CB4h8mkI+kDI0RfWLC15zgi9OSsAlcynl7JDCKK0LkY6yi9VlNC6ST3i2xXHu28nMJthFh80PP2AWF50tjjJt8LpCFdUsozwBWpfRHX0DnvJQhBBK3EsptM3NwixUn9tLkpv1ue8IZCwsKvjglK1eSkQQVg+mjMeqgPOA+aKl7KxQ9ThOnH1AghezuUWniJOExKbY0B7evax8kS5aAuUACA8fuv5HAKF3LKmTEilmm0XISDIBYZg5ryAff2UhUAenXX4VSLzJqRd1KPg8A+U3rdNgWHObZs7VuN3dtbuFOLzzt9ZXhCPUuhuGv1HfzjNBgM3Ls0b3+ooQQIWvrhRsA9DZAefMBqw18esmyz+pN9Yy4bo/OJFc04ShueXQeMqQagEwBMLmtE0o6pI3Xblu88ePhAnKFBy1n0guHlFEm4Zoi89yn6PCnyXKqHas2DjbPhPQGht0HtQQariDnEnEatnZVRHu4zHfldwHzGCH9vwXk1PYEZGZAU52koNhqlq0RzUQOajYulZPrDy2Yw1SHk2tjF8etk29m2WDbs0nV1N+jAwpJ4pX22c2ua7KK5Bq1VDG1rq8DMwfjTnASJupMmnRs4qxjYn/Kom2Bj1TFbP4i3j/9Rkb+jTZLDs0dk2X5IYmioaR3aNcUGmPr5wRWtSUPylq7dMbZ32EIi0MBBF4SquNxEbBVWw56cwpHne6/jAHzcF35L2g0wmIrZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(53546011)(66476007)(6486002)(450100002)(5660300002)(478600001)(956004)(31696002)(38100700002)(66556008)(316002)(66946007)(2906002)(186003)(26005)(30864003)(36756003)(2616005)(16576012)(83380400001)(86362001)(8676002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0VKdXJJQitBUUVWbUZvVW9iNzBQWHRWZUN3MnM5ZTd2c1QwZUtVWkxZeDNJ?=
 =?utf-8?B?bmFTamZ4R2xZZEl0TmJ5YU1qMkY4c3JpREJrSks4ZHg3RTJCZDRXQTRFVEtU?=
 =?utf-8?B?N2llbzlwaTN0eWRIZ0k2SnZBWGpnRWJUUmRJRHUzcS93eUJJL09ZREM4NzNo?=
 =?utf-8?B?aTMvZE0zWDBYTFc5RnFQOWxaOUQzR0M0cVJXdHpWOTN4M3hhelRlRXI2QTN3?=
 =?utf-8?B?emhxUjVDZ1RtM1ZLZ281cGRicElUakVrR0Q5ckd0c0crdW8vNUJvcGQvL09w?=
 =?utf-8?B?YWJvczNpUVVaSkFyeUFWMkM1Ym9TTU54MHd2c28vTHFkaGhTQWR3TVZOZVpw?=
 =?utf-8?B?SGowanRmaVRlMGg5cUEwSUpPUExlT3F1OVdSV1A0R0RrNUw3MEk2bm9rRFZ1?=
 =?utf-8?B?S2EwRzh1aDd0UFMxS3g2SDhIbmRQa0plUGowQ3MzS0J0cGxuNTh4UHZoOFh0?=
 =?utf-8?B?SXRtYmp4WHhVR1JHTzVibDRjQmhhd1ZYb0NTNlN4dnFVUk5TbytqaDU3MTFu?=
 =?utf-8?B?eFVPT0t1eWNNM29BTEkwVkxPVlJQM1ZXVUlzTWVqRDNRdW1PbTNmZlhsWDBI?=
 =?utf-8?B?bUhnT2NTUjYvbEpuZE1waURsZUtkWDk2M1BocmFKcTl6ZlI4SllPa2xkM283?=
 =?utf-8?B?eUtvcXVEN1ZTK2dCNUdVK2JLUHNaZFFkRFUyY3pkenIzdEJDbVB1ZkpvVjZR?=
 =?utf-8?B?RjNvZ3F1amFaMWJQYmRCNzNhei85WGQweFZGTkdaVlVYd0xmeHNZYmh0TXFX?=
 =?utf-8?B?eURZWndvUS9YN2NKWUNSQ0RUTWpOM0ZscndDRnhFRmlnbWVCNTN6NmpTbzlD?=
 =?utf-8?B?YkpzUkZBTzc5Lyt4TjQ4N3JzdTBjcTdHOW4ybkVRL1dCZklaSTNXYm9adkQy?=
 =?utf-8?B?YW5RU3Q4em1XV3c1N0xuZUJWaG5JZCtmRm8wMUhxR0NubVhNbVliSGtTaytk?=
 =?utf-8?B?UDNLMDc5N0hiNk9KYlFMV3pHRDJaeStwRDJzeUFjWGpDTTBtZk05SUhNRmpH?=
 =?utf-8?B?NnhjVitpZDRqejBxdWg1Z0VUL1IxU05GbWQyWkdzaW96N0J3VWNURkZ4Vkk1?=
 =?utf-8?B?WEY4cmw5UnEvbmJ1R0Qyb08xazFtMEEzcVFPSTNyNjhFY2s1WmRLRlBQSnEy?=
 =?utf-8?B?eVI4TnFCZC9rb01DRm0wb0pocmVZcU5sK0puZSs0SDl0NU0va2diVWN0Zmly?=
 =?utf-8?B?cWJEaVhvUWpsZHFDNWZjOUJ5Zm9lUG9DanV3ZUU0VlQzeVAwdTVEUXp0TmJC?=
 =?utf-8?B?cXhQWTY0OUxiVjRHM0xid1RSMk43QTFqTWIrR2dlbFZtSy9DbUd5UlduOTRx?=
 =?utf-8?B?dStHUkJtRmNvSUNFbTZUcFdLNGJTcEVadmZPeEQwcDEyeCsrQkFJekJ2TkZK?=
 =?utf-8?B?T0IyMFp5VTFiak10Zld0U2g3VUdlNmZsbnJaeXB0c2dGWHVNS0lCdnNDVWdu?=
 =?utf-8?B?clJWK05UTGdmYUw2WnJqaWl6THV6RUpyMDVLdkJVOFQ5RE0vekkvbkcwalhh?=
 =?utf-8?B?c1gyci8zaUhsV2hZUVZYN281ZFl2c3o5di8vUytkNXVOR2g0VVJGenBLS0Fy?=
 =?utf-8?B?NEJiVko2Q29saThhOVU2V2xxNVpUMy9TY01TVllEb0pUbjZndmhNeW5JOTAx?=
 =?utf-8?B?ZG5ndzNDMUFacTcvaEFpdDVvZWFPOW1pdmhzcGZkUGcrYnZQUUJCQVkwbVBL?=
 =?utf-8?B?cHhOZis3ZkRPRWRYVTFMV1dnY0V5TkNlbm4xU1VjVWtlYk1DcEtDYkFlb3pi?=
 =?utf-8?Q?N/00tCZzhOgzgYFqdeMGkQje0drw9zSDCvUgRyw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 325e6d54-99c3-4e73-4107-08d9505dbde4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 17:49:39.9600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVQ2daFj/9vgEJ0IDYxRoFSN9+B5VgPwYfkKJhJPLUwg9nJXDYLBAWAY76QRFWO6kCva3g5RiKCSxeAprKVRd6Hi9WLv6Yv3Pt9PJD4/yzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2235
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



On 7/22/2021 4:54 PM, Matthew Brost wrote:
> This adds GuC backend support for i915_request_cancel(), which in turn
> makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.
>
> This implemenation makes use of fence while there is likely simplier
> options. A fence was choosen because of another feature coming soon
> which requires a user to block on a context until scheduling is
> disabled. In that case we return the fence to the user and the user can
> wait on that fence.
>
> v2:
>   (Daniele)
>    - A comment about locking the blocked incr / decr
>    - A comments about the use of the fence
>    - Update commit message explaining why fence
>    - Delete redundant check blocked count in unblock function
>    - Ring buffer implementation
>    - Comment about blocked in submission path
>    - Shorter rpm path
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  13 ++
>   drivers/gpu/drm/i915/gt/intel_context.h       |   7 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
>   .../drm/i915/gt/intel_execlists_submission.c  |  18 ++
>   .../gpu/drm/i915/gt/intel_ring_submission.c   |  16 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 175 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_request.c           |  14 +-
>   7 files changed, 237 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 237b70e98744..477c42d7d693 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -366,6 +366,12 @@ static int __intel_context_active(struct i915_active *active)
>   	return 0;
>   }
>   
> +static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
> +				 enum i915_sw_fence_notify state)
> +{
> +	return NOTIFY_DONE;
> +}
> +
>   void
>   intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   {
> @@ -399,6 +405,13 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->guc_id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id_link);
>   
> +	/*
> +	 * Initialize fence to be complete as this is expected to be complete
> +	 * unless there is a pending schedule disable outstanding.
> +	 */
> +	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
> +	i915_sw_fence_commit(&ce->guc_blocked);
> +
>   	i915_active_init(&ce->active,
>   			 __intel_context_active, __intel_context_retire, 0);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 814d9277096a..876bdb08303c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -70,6 +70,13 @@ intel_context_is_pinned(struct intel_context *ce)
>   	return atomic_read(&ce->pin_count);
>   }
>   
> +static inline void intel_context_cancel_request(struct intel_context *ce,
> +						struct i915_request *rq)
> +{
> +	GEM_BUG_ON(!ce->ops->cancel_request);
> +	return ce->ops->cancel_request(ce, rq);
> +}
> +
>   /**
>    * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
>    * @ce - the context
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 57c19ee3e313..005a64f2afa7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -13,6 +13,7 @@
>   #include <linux/types.h>
>   
>   #include "i915_active_types.h"
> +#include "i915_sw_fence.h"
>   #include "i915_utils.h"
>   #include "intel_engine_types.h"
>   #include "intel_sseu.h"
> @@ -42,6 +43,9 @@ struct intel_context_ops {
>   	void (*unpin)(struct intel_context *ce);
>   	void (*post_unpin)(struct intel_context *ce);
>   
> +	void (*cancel_request)(struct intel_context *ce,
> +			       struct i915_request *rq);
> +
>   	void (*enter)(struct intel_context *ce);
>   	void (*exit)(struct intel_context *ce);
>   
> @@ -184,6 +188,9 @@ struct intel_context {
>   	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
>   	 */
>   	struct list_head guc_id_link;
> +
> +	/* GuC context blocked fence */
> +	struct i915_sw_fence guc_blocked;
>   };
>   
>   #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 60427b106bad..e7b42222b71d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -114,6 +114,7 @@
>   #include "gen8_engine_cs.h"
>   #include "intel_breadcrumbs.h"
>   #include "intel_context.h"
> +#include "intel_engine_heartbeat.h"
>   #include "intel_engine_pm.h"
>   #include "intel_engine_stats.h"
>   #include "intel_execlists_submission.h"
> @@ -2587,11 +2588,26 @@ static int execlists_context_alloc(struct intel_context *ce)
>   	return lrc_alloc(ce, ce->engine);
>   }
>   
> +static void execlists_context_cancel_request(struct intel_context *ce,
> +					     struct i915_request *rq)
> +{
> +	struct intel_engine_cs *engine = NULL;
> +
> +	i915_request_active_engine(rq, &engine);
> +
> +	if (engine && intel_engine_pulse(engine))
> +		intel_gt_handle_error(engine->gt, engine->mask, 0,
> +				      "request cancellation by %s",
> +				      current->comm);
> +}
> +
>   static const struct intel_context_ops execlists_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
>   	.alloc = execlists_context_alloc,
>   
> +	.cancel_request = execlists_context_cancel_request,
> +
>   	.pre_pin = execlists_context_pre_pin,
>   	.pin = execlists_context_pin,
>   	.unpin = lrc_unpin,
> @@ -3604,6 +3620,8 @@ static const struct intel_context_ops virtual_context_ops = {
>   
>   	.alloc = virtual_context_alloc,
>   
> +	.cancel_request = execlists_context_cancel_request,
> +
>   	.pre_pin = virtual_context_pre_pin,
>   	.pin = virtual_context_pin,
>   	.unpin = lrc_unpin,
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 05bb9f449df1..2958e2fae380 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -16,6 +16,7 @@
>   #include "intel_reset.h"
>   #include "intel_ring.h"
>   #include "shmem_utils.h"
> +#include "intel_engine_heartbeat.h"
>   
>   /* Rough estimate of the typical request size, performing a flush,
>    * set-context and then emitting the batch.
> @@ -604,9 +605,24 @@ static void ring_context_ban(struct intel_context *ce,
>   		}
>   }
>   
> +static void ring_context_cancel_request(struct intel_context *ce,
> +					struct i915_request *rq)
> +{
> +	struct intel_engine_cs *engine = NULL;
> +
> +	i915_request_active_engine(rq, &engine);
> +
> +	if (engine && intel_engine_pulse(engine))
> +		intel_gt_handle_error(engine->gt, engine->mask, 0,
> +				      "request cancellation by %s",
> +				      current->comm);
> +}
> +
>   static const struct intel_context_ops ring_context_ops = {
>   	.alloc = ring_context_alloc,
>   
> +	.cancel_request = ring_context_cancel_request,
> +
>   	.ban = ring_context_ban,
>   
>   	.pre_pin = ring_context_pre_pin,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3b9ba3bdd425..a26754b9b940 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -81,6 +81,11 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>    */
>   #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
>   #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
> +#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		2
> +#define SCHED_STATE_NO_LOCK_BLOCKED \
> +	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
> +#define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
> +	(0xffff << SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
>   static inline bool context_enabled(struct intel_context *ce)
>   {
>   	return (atomic_read(&ce->guc_sched_state_no_lock) &
> @@ -116,6 +121,30 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
>   		   &ce->guc_sched_state_no_lock);
>   }
>   
> +static inline u32 context_blocked(struct intel_context *ce)
> +{
> +	return (atomic_read(&ce->guc_sched_state_no_lock) &
> +		SCHED_STATE_NO_LOCK_BLOCKED_MASK) >>
> +		SCHED_STATE_NO_LOCK_BLOCKED_SHIFT;
> +}
> +
> +static inline void incr_context_blocked(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->engine->sched_engine->lock);
> +	atomic_add(SCHED_STATE_NO_LOCK_BLOCKED,
> +		   &ce->guc_sched_state_no_lock);
> +	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
> +}
> +
> +static inline void decr_context_blocked(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->engine->sched_engine->lock);
> +	GEM_BUG_ON(!context_blocked(ce));
> +
> +	atomic_sub(SCHED_STATE_NO_LOCK_BLOCKED,
> +		   &ce->guc_sched_state_no_lock);
> +}
> +
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
>    * require a lock, aside from the special case where the functions are called
> @@ -404,6 +433,14 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		if (unlikely(err))
>   			goto out;
>   	}
> +
> +	/*
> +	 * The request / context will be run on the hardware when scheduling
> +	 * gets enabled in the unblock.
> +	 */
> +	if (unlikely(context_blocked(ce)))
> +		goto out;
> +
>   	enabled = context_enabled(ce);
>   
>   	if (!enabled) {
> @@ -532,6 +569,7 @@ static void __guc_context_destroy(struct intel_context *ce);
>   static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
>   static void guc_signal_context_fence(struct intel_context *ce);
>   static void guc_cancel_context_requests(struct intel_context *ce);
> +static void guc_blocked_fence_complete(struct intel_context *ce);
>   
>   static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   {
> @@ -579,6 +617,10 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   			}
>   			intel_context_sched_disable_unpin(ce);
>   			atomic_dec(&guc->outstanding_submission_g2h);
> +			spin_lock_irqsave(&ce->guc_state.lock, flags);
> +			guc_blocked_fence_complete(ce);
> +			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
>   			intel_context_put(ce);
>   		}
>   	}
> @@ -1353,6 +1395,21 @@ static void guc_context_post_unpin(struct intel_context *ce)
>   	lrc_post_unpin(ce);
>   }
>   
> +static void __guc_context_sched_enable(struct intel_guc *guc,
> +				       struct intel_context *ce)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
> +		ce->guc_id,
> +		GUC_CONTEXT_ENABLE
> +	};
> +
> +	trace_intel_context_sched_enable(ce);
> +
> +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> +}
> +
>   static void __guc_context_sched_disable(struct intel_guc *guc,
>   					struct intel_context *ce,
>   					u16 guc_id)
> @@ -1371,17 +1428,130 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>   }
>   
> +static void guc_blocked_fence_complete(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +
> +	if (!i915_sw_fence_done(&ce->guc_blocked))
> +		i915_sw_fence_complete(&ce->guc_blocked);
> +}
> +
> +static void guc_blocked_fence_reinit(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
> +
> +	/*
> +	 * This fence is always complete unless a pending schedule disable is
> +	 * outstanding. We arm the fence here and complete it when we receive
> +	 * the pending schedule disable complete message.
> +	 */
> +	i915_sw_fence_fini(&ce->guc_blocked);
> +	i915_sw_fence_reinit(&ce->guc_blocked);
> +	i915_sw_fence_await(&ce->guc_blocked);
> +	i915_sw_fence_commit(&ce->guc_blocked);
> +}
> +
>   static u16 prep_context_pending_disable(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
>   	set_context_pending_disable(ce);
>   	clr_context_enabled(ce);
> +	guc_blocked_fence_reinit(ce);
>   	intel_context_get(ce);
>   
>   	return ce->guc_id;
>   }
>   
> +static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> +	unsigned long flags;
> +	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
> +	intel_wakeref_t wakeref;
> +	u16 guc_id;
> +	bool enabled;
> +
> +	/* Sync with submission path and unblock */
> +	spin_lock_irqsave(&sched_engine->lock, flags);
> +	incr_context_blocked(ce);
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	enabled = context_enabled(ce);
> +	if (unlikely(!enabled || submission_disabled(guc))) {
> +		if (enabled)
> +			clr_context_enabled(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		return &ce->guc_blocked;
> +	}
> +
> +	/*
> +	 * We add +2 here as the schedule disable complete CTB handler calls
> +	 * intel_context_sched_disable_unpin (-2 to pin_count).
> +	 */
> +	atomic_add(2, &ce->pin_count);
> +
> +	guc_id = prep_context_pending_disable(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	with_intel_runtime_pm(runtime_pm, wakeref)
> +		__guc_context_sched_disable(guc, ce, guc_id);
> +
> +	return &ce->guc_blocked;
> +}
> +
> +static void guc_context_unblock(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> +	unsigned long flags;
> +	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
> +	intel_wakeref_t wakeref;
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (unlikely(submission_disabled(guc) ||
> +		     !intel_context_is_pinned(ce) ||
> +		     context_pending_disable(ce) ||
> +		     context_blocked(ce) > 1)) {
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		goto out;
> +	}
> +
> +	set_context_pending_enable(ce);
> +	set_context_enabled(ce);
> +	intel_context_get(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	with_intel_runtime_pm(runtime_pm, wakeref)
> +		__guc_context_sched_enable(guc, ce);
> +
> +out:
> +	spin_lock_irqsave(&sched_engine->lock, flags);
> +	decr_context_blocked(ce);
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);.

As we discussed offline, it might be better to cover the whole 
block/unblock logic with ce->guc_state.lock. That way we can make sure 
we're not racing the incr/decr calls with the swapping locks.
Apart from this, the patch LGTM.

Daniele

> +}
> +
> +static void guc_context_cancel_request(struct intel_context *ce,
> +				       struct i915_request *rq)
> +{
> +	if (i915_sw_fence_signaled(&rq->submit)) {
> +		struct i915_sw_fence *fence = guc_context_block(ce);
> +
> +		i915_sw_fence_wait(fence);
> +		if (!i915_request_completed(rq)) {
> +			__i915_request_skip(rq);
> +			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
> +					true);
> +		}
> +		guc_context_unblock(ce);
> +	}
> +}
> +
>   static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
> @@ -1641,6 +1811,8 @@ static const struct intel_context_ops guc_context_ops = {
>   
>   	.ban = guc_context_ban,
>   
> +	.cancel_request = guc_context_cancel_request,
> +
>   	.enter = intel_context_enter_engine,
>   	.exit = intel_context_exit_engine,
>   
> @@ -1836,6 +2008,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   
>   	.ban = guc_context_ban,
>   
> +	.cancel_request = guc_context_cancel_request,
> +
>   	.enter = guc_virtual_context_enter,
>   	.exit = guc_virtual_context_exit,
>   
> @@ -2294,6 +2468,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		clr_context_banned(ce);
>   		clr_context_pending_disable(ce);
>   		__guc_signal_context_fence(ce);
> +		guc_blocked_fence_complete(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   		if (banned) {
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 28f38b02a5d2..541a20371502 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -710,18 +710,6 @@ void i915_request_unsubmit(struct i915_request *request)
>   	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>   }
>   
> -static void __cancel_request(struct i915_request *rq)
> -{
> -	struct intel_engine_cs *engine = NULL;
> -
> -	i915_request_active_engine(rq, &engine);
> -
> -	if (engine && intel_engine_pulse(engine))
> -		intel_gt_handle_error(engine->gt, engine->mask, 0,
> -				      "request cancellation by %s",
> -				      current->comm);
> -}
> -
>   void i915_request_cancel(struct i915_request *rq, int error)
>   {
>   	if (!i915_request_set_error_once(rq, error))
> @@ -729,7 +717,7 @@ void i915_request_cancel(struct i915_request *rq, int error)
>   
>   	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
>   
> -	__cancel_request(rq);
> +	intel_context_cancel_request(rq->context, rq);
>   }
>   
>   static int __i915_sw_fence_call

