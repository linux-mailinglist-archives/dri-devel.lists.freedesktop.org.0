Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265CE3D7E53
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 21:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4ED6E118;
	Tue, 27 Jul 2021 19:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE156E0FE;
 Tue, 27 Jul 2021 19:16:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="199735433"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="199735433"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 12:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="456225285"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 27 Jul 2021 12:16:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 12:16:05 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 12:16:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 12:16:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 12:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC3NgbOsgvTm0LibW3EAzTQIj9+OfL+HjaB+IULQ0/t4IxBV56dbpNCtY2KExf4GBs6DVY+FE6GrdTkB+JSowg+JmtxhoO4c4GEWiFLUO4xXmBbWI+iqDxv3cqOxczyCj6eSoMnK+YSQXAQweQbBGbGqvQLQjlmA119gkvtfkuwZJ05kSJ3hr6/ogqoGwr4Ve3vAnEp4ZRbuhDV7W7o0IdeGsZgYhlTZAc1d5bamyCtA1rEaiYwA6LcS1zYLMOi/Ze2+fh9aNKNRMk6c9fCVo8HVIdZhEjD0vPVwCSUqqoiaqtPwrJQ08t8bO/C75R02r3qEZ+3q6R7b2uKupM2f1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bik8f5rVsmHCfmChO8mO+o281qb5Urjz4t5/P8Zu55c=;
 b=m11CWicVF/IH8Up8Rw+OVI+dVWVJqabUR9kaAMd8TwUaxIfGrg9N9vA258d3yiaCtuWmjNt/YjowQoi8QNDlDIfftZosnqv5ofDNny6wru+C9GZ7Y9w4+qWUYBJxpksjzCxoGmo+5ORdGVSUPDf1VuEbn/TQJ0AlATOf2UqhoUbkh/ebozp15hLk/NQUTQbbFQRkFe0V+zroRZfWwRdMKZ1Pb1DkdI85tGKTGSPM80d5WVma1KdBhzJa//ZnLVfk4hhbEzWUQurBc8kcUF1h5UMS9Jn/PxPhBSosxTNhP3RSx/wPb9q4FnIZCpPyrz5KKqV638hJGYOV6+cqhFlXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bik8f5rVsmHCfmChO8mO+o281qb5Urjz4t5/P8Zu55c=;
 b=I9Sme1VRNM11P0NZ65PBedtMjhAOFK82b1zDGeoPDkbPlahRZhZe/QnUqudOsPCzsmvdNvt/8X0sPUGB2mXKRwKc/xVLsll0Jp+TBq6BA22PA/qblBGtr3mstu8aFJDddKzujtD6PUiGDSTXU4wiVH75THueVIZK3ptROkWxzlE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Tue, 27 Jul 2021 19:16:02 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 19:16:02 +0000
Subject: Re: [PATCH 25/33] drm/i915/guc: Support request cancellation
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-26-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <2a417f11-050a-2445-d5e9-38fe354402f2@intel.com>
Date: Tue, 27 Jul 2021 12:15:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210727002348.97202-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BY3PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:39a::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Tue, 27 Jul 2021 19:16:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40fcd66c-425d-4122-a4c0-08d95132f94c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2890:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB2890A85084652D26C3CE4B5DF4E99@DM6PR11MB2890.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:407;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t1CWeidULLjmvs2Pgz8u2JzVlHeqprsJFcHAcZlJOATIKL39NGxzfsFScQ03Pbv56VM6INEkmTgU2YphwiGpFVyZTMzI96qbKeHMUTW0eiIb8LZdeyif2+btSaL9eRzXGlA9sRxkJCD+s54DFtM2trEvVDZuG2D4ji6Pa8XuXGDWeOSEnX5Nq1jdJK8mSBUcFl58Vu3pqAdxhppIHvPNw7paGFuPoP+vDSLfPqN+AMGq08FP7VR5BnlRHjUo9eDKjvKgZADAh83gA1USWlacgpP1I1kiheZc3JbFQO4X0lA5in9eElPC/wRj+c/aowzFAMkMm7Ppl+QwUY2cFnmkjoCGLlkBs9A8o1gQ5SDq+SLy7P+ZM2iL+cIGwIS5tYNHXtDB8sOaDwopOwPKDSFakyvBXqH/XRv9dzaMWdp2ya5bh0/c4eNe4PmYCQiD86KmBTZICG2gKy5Xg63j5Hgjt0sZUFAmTVf1ry8/DORYXJNwzbY+/hx6lrC9NpyFpY6qt106v6JoqlheK9LeSYTCXEFYhxngPNJJuLLVxQtPLU9fi8gbcG/+Shu7l3Or5RXL2uDD1+0aX/EKBacsLnUdxjIJG+l/LRczMXVwFIX1gCu6H3VxtDCQP8bttD7lLyf/YG5rfLKBuW8EnzwgnH4IlYIakePIhlNyVSwQd1Xq8q05sjvIt1nrjY/OOqh2Fi+qaMnQNXLGWGtweSrQq57okSoLkxcPPl/J7BWE2bohZOZiZvxlNlYPWvv33yFuO2sx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(186003)(16576012)(31686004)(316002)(66946007)(107886003)(956004)(66556008)(66476007)(6486002)(2616005)(450100002)(36756003)(30864003)(86362001)(8676002)(478600001)(83380400001)(2906002)(38100700002)(8936002)(26005)(5660300002)(53546011)(4326008)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThjSG5XSE50bW9xbEdYVWpya28wcThvNzFuckFsVk04eXdQeE9zRmZNRXZJ?=
 =?utf-8?B?bk5hOVdGRnYzQXBMd1pnb29td2ROZk5OMTZVUWJwQkV6Z1BiNmVjRHVGZU5o?=
 =?utf-8?B?RmVFQ2JVb1ppY3ZiL0Yxc0tPazRIMlVlSDE0dEdReE5oRVZyQlRYdEZ1Uk5G?=
 =?utf-8?B?ZmlNTnNPQlBtSXNScmJqRVNVNnZvZURjeUZBUWZJNVppM0NxdCtTNW9pODUw?=
 =?utf-8?B?RnViOGJoTkxBc1hxUzJsOHlqNTRYZ1NiRHllVWVhaThQaTNmeHUyandFYU1w?=
 =?utf-8?B?MTlmbDhEbmMxbzA2RUtjOFVDWUk1K1ZFdzR6bVBRZWRqNVJuRFdpWTlmaFNw?=
 =?utf-8?B?REJnOE14NVIrK0VuWEc4elRwOEo3ZWtoVS9GRE9ySEVTRG9nbkJPOEZWV3Bs?=
 =?utf-8?B?ODRQWXkydytmc3hydWZHNGprdzIrSXl6azFrUTJTUzhicVhUN2FyQUIxejdI?=
 =?utf-8?B?VmRsdTV3OU9FWjBBWVNqQUU0Q1FFbXJWQW9SVG5qZmxsaUhkdEc1NGQ3T3I5?=
 =?utf-8?B?TjlCOUs4Z2w0dmhVNUhObFV3TWxxdjlnZmJ6aDduUjVrSFJyOVNFN3pINzJ2?=
 =?utf-8?B?MUthK3NJL24rOWozeTA2L3c4eXhXMGt1YzdRTGZOY2JJc2R5TDJ4ZlE2b2pm?=
 =?utf-8?B?VHVJK0pwU0JhL2ZyWXlMTGg0ZXFRZG1TUTc0NXhPT2JCRUdTYXN5MWIyeHd2?=
 =?utf-8?B?SkxPYndBbXBkZE5HTTE3UjA5TVU3SXBLN2syMHg0N3dOKzcrWnM3eXBLaFBW?=
 =?utf-8?B?bWdZZXdIa1lYZTk4UERja2RLd0FsalhPVTY1ZnNEaHdpaUhoODFRdWRGMUJP?=
 =?utf-8?B?WnZveXFoNnJWMDlybmJyZ1oyRmRRNjRsT0liazdNMXppMzVDTnRBNWQ4OW1q?=
 =?utf-8?B?Z2g4WkJscUhWejQ2UlYzZnp1dkVIYm50ejBCZytDeEFmYzBsZzVNWEVaZkNR?=
 =?utf-8?B?OVN1Qk1qejhnZ0xlQmRvSGhoN3RHb25MRm4vYmo0U1JDN2ZncDNjcGpNZmJX?=
 =?utf-8?B?WXdSZlcvZisyQ1Z1Z2p2bEZUOTM0ZUFzOHJveWkvdW55MDV5RnZETFE1dkMr?=
 =?utf-8?B?Zml2TDgzY1BGK2FWekJVRnNRUk5TVjI3VmF3K2hrQzRTOGZSY1JHVFZPdHh1?=
 =?utf-8?B?TVExYlpBVlpIeXBTczVHR1Azbk5nRCtZekJYTStLeVBwaGxCYytEQnpOTm9C?=
 =?utf-8?B?SWV0eU4vTGdpeStqRmcxd0g2QkkvZTFkSWhnMEY5MFVRa2RPRE1PM01ldktS?=
 =?utf-8?B?VDliOENZZDRoeXBMNjJpRW5jK3NBakFORDdpVzFvU212QmVrVzZmN2UrMCtv?=
 =?utf-8?B?RjdjSm9xcTBrenFnRjVtK0ZySW9YZUVJMFFTTURTTzNwSitpZXBaYXE0QmlV?=
 =?utf-8?B?cnIrcVppaGFaYmY5Y05TLzRicjI1Zkpid091VlAzbEdsNE1KVmkwUXpTUEpZ?=
 =?utf-8?B?UG1mbDVEVUVHNEsvTFUwVk5EQnIwajVMSCt1eFhRd0RHNVA3UENkZlRxZEVC?=
 =?utf-8?B?U1VjQXVFSTQ3N2t4anBqdjJXREwzeDJycmwxWEszWENvVkNBYmFlNkVPcnVJ?=
 =?utf-8?B?anNnYU5qazhpRzJ5Ym0vNHliUDhRVjBJL2crNStYMXhBVEhLYTBRL1hxY0RR?=
 =?utf-8?B?VGlCS3prdXZDYU1kbExQY0pUbmZyOGo2OXh4bytKK2F2R25paFp4M1VZNDNp?=
 =?utf-8?B?TnBPM3RWeERMMHp6OUN3SWZLcWFTb3l5YU9IeitmeVhNdzJDOElRRXdTZ0dq?=
 =?utf-8?Q?K1GpovRUv1dlw2D6jiECQgK84fQixOnF2SufyAH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fcd66c-425d-4122-a4c0-08d95132f94c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 19:16:02.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+Jmr36rlxezoKK3zmzGOZBn6Ict8ifGCmja0//mK1g4gxIjXvwS2SsiDPWeh96ajSGhJXgAhl8Js4TSDMr91iCdi6UTtE7EGCyeCtY3DJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2890
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/26/2021 5:23 PM, Matthew Brost wrote:
> This adds GuC backend support for i915_request_cancel(), which in turn
> makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.
>
> This implementation makes use of fence while there are likely simplier
> options. A fence was chosen because of another feature coming soon
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
> v3:
>   (Checkpatch)
>    - Fix typos in commit message
>   (Daniel)
>    - Rework to simplier locking structure in guc_context_block / unblock
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  13 ++
>   drivers/gpu/drm/i915/gt/intel_context.h       |   7 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |  18 ++
>   .../gpu/drm/i915/gt/intel_ring_submission.c   |  16 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 188 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_request.c           |  14 +-
>   7 files changed, 251 insertions(+), 14 deletions(-)
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
> index 57c19ee3e313..a5bc876face7 100644
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
> @@ -156,7 +160,7 @@ struct intel_context {
>   		 * sched_state: scheduling state of this context using GuC
>   		 * submission
>   		 */
> -		u8 sched_state;
> +		u16 sched_state;
>   		/*
>   		 * fences: maintains of list of requests that have a submit
>   		 * fence related to GuC submission
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
> index b4a876736074..de5f9c86b9a4 100644
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
> @@ -3608,6 +3624,8 @@ static const struct intel_context_ops virtual_context_ops = {
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
> index ad9a38a861df..ee4f1f996efa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -126,6 +126,9 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
>   #define SCHED_STATE_DESTROYED				BIT(1)
>   #define SCHED_STATE_PENDING_DISABLE			BIT(2)
>   #define SCHED_STATE_BANNED				BIT(3)
> +#define SCHED_STATE_BLOCKED_SHIFT			4
> +#define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
> +#define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
>   static inline void init_sched_state(struct intel_context *ce)
>   {
>   	/* Only should be called from guc_lrc_desc_pin() */
> @@ -203,6 +206,32 @@ static inline void clr_context_banned(struct intel_context *ce)
>   	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
>   }
>   
> +static inline u32 context_blocked(struct intel_context *ce)
> +{
> +	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
> +		SCHED_STATE_BLOCKED_SHIFT;
> +}
> +
> +static inline void incr_context_blocked(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->engine->sched_engine->lock);
> +	lockdep_assert_held(&ce->guc_state.lock);
> +
> +	ce->guc_state.sched_state += SCHED_STATE_BLOCKED;
> +
> +	GEM_BUG_ON(!context_blocked(ce));	/* Overflow check */
> +}
> +
> +static inline void decr_context_blocked(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->engine->sched_engine->lock);
> +	lockdep_assert_held(&ce->guc_state.lock);
> +
> +	GEM_BUG_ON(!context_blocked(ce));	/* Underflow check */
> +
> +	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
> +}
> +
>   static inline bool context_guc_id_invalid(struct intel_context *ce)
>   {
>   	return ce->guc_id == GUC_INVALID_LRC_ID;
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
> @@ -1354,6 +1396,21 @@ static void guc_context_post_unpin(struct intel_context *ce)
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
> @@ -1372,17 +1429,143 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
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
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +
> +	/*
> +	 * Sync with submission path, increment before below changes to context
> +	 * state.
> +	 */
> +	spin_lock(&sched_engine->lock);
> +	incr_context_blocked(ce);
> +	spin_unlock(&sched_engine->lock);
> +
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
> +
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
> +	bool enable;
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +
> +	if (unlikely(submission_disabled(guc) ||
> +		     !intel_context_is_pinned(ce) ||
> +		     context_pending_disable(ce) ||
> +		     context_blocked(ce) > 1)) {
> +		enable = false;
> +	} else {
> +		enable = true;
> +		set_context_pending_enable(ce);
> +		set_context_enabled(ce);
> +		intel_context_get(ce);
> +	}
> +
> +	/*
> +	 * Sync with submission path, decrement after above changes to context
> +	 * state.
> +	 */
> +	spin_lock(&sched_engine->lock);
> +	decr_context_blocked(ce);
> +	spin_unlock(&sched_engine->lock);
> +
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	if (enable) {
> +		with_intel_runtime_pm(runtime_pm, wakeref)
> +			__guc_context_sched_enable(guc, ce);
> +	}
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
> @@ -1642,6 +1825,8 @@ static const struct intel_context_ops guc_context_ops = {
>   
>   	.ban = guc_context_ban,
>   
> +	.cancel_request = guc_context_cancel_request,
> +
>   	.enter = intel_context_enter_engine,
>   	.exit = intel_context_exit_engine,
>   
> @@ -1837,6 +2022,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   
>   	.ban = guc_context_ban,
>   
> +	.cancel_request = guc_context_cancel_request,
> +
>   	.enter = guc_virtual_context_enter,
>   	.exit = guc_virtual_context_exit,
>   
> @@ -2295,6 +2482,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
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

