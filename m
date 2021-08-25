Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7D3F6D43
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 04:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4744F6E101;
	Wed, 25 Aug 2021 02:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FDE6E0FD;
 Wed, 25 Aug 2021 02:00:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="197675161"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="197675161"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 19:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="685897572"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2021 19:00:20 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 19:00:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 19:00:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 19:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBhK/Hfym8QjZRT0LtfO0dr1frEFN8VvvxgmxgVc1Qb/SzF//yxRJ6fMgZBj/Q6ukbVQD+i6b1m64EvtVcXfCIyncyWTN1TxFzcJTuOJsU1HmEmNEjIi2vOeosn4vo7nWMhqgJhaVoOGaxilkSuDblvkBwKmjzhcH/W5yVZb1Z2gmF+mq3OIny/llFxgUgcRnWlcxHonFrrIROXJLNNRobx5HsRst/zvAr7Ywupy+lhihAx8LGlGbkGnnrYKKQhbI6Ov0kVG0LTdo7ZSDJEpCKSjyquPmNYGz1KImWSvxBCZ6GMrXK/S7jEvI8bhL6lLSpZbQGjqQ7R8b154sVif7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smDadkn4cVaAfPbgh3ULr4F9V+uIFsky4ux1pjEuBGU=;
 b=aBt6Pgn11GMwazXx+/9kVpz+kcFUJSEAFTS0kc/fue1S/PqXEY7NbBMXOQcQaYkXmO5trk44MlRFuuA4GQYteMJYPWz2joA/daFBB7/nDzwMoaD7oK6voyOlg8hv3jbK73zqpobaXOkSuKZ94gTfWa+WAVEMYpC34asX6dVQ1T/9+x5A4PkGW7KeUO6KWVX3Na6kL/E3qSI/1J8Mce7UFVW85fWjUl9O6kp89pI2oRqjtknIS2i/yZn6sUz2jCpZvFpliPK0w+wuY9U2o9OSQz48vjTNvwezKz9lNMFDRGsO2sfWiO+BZsuU6AOZgCu+YMDZIi0b75TvgXV+psvXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smDadkn4cVaAfPbgh3ULr4F9V+uIFsky4ux1pjEuBGU=;
 b=MOil8DcCnNFWdH67j2G0Xt3ptb/jnGymGhI2BcxN06+6KqKli2I2uakrf4MZ+cB0wyIKbCel2CySkChcDib99vv3BlE2DVXefa3WCl5BEl7rdfpn9xxg3GxLfE9yTpV2zoDMo1jlGEG3BaGmYNeLJozIaxMGtxYXny3LXtPYBpQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH2PR11MB4197.namprd11.prod.outlook.com (2603:10b6:610:42::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 02:00:14 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 02:00:14 +0000
Subject: Re: [PATCH 24/27] drm/i915/guc: Move fields protected by
 guc->contexts_lock into sub structure
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-25-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <fda0a494-1c85-d3d5-96fd-b40c48e0ca31@intel.com>
Date: Tue, 24 Aug 2021 19:00:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-25-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR18CA0049.namprd18.prod.outlook.com
 (2603:10b6:300:39::11) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR18CA0049.namprd18.prod.outlook.com (2603:10b6:300:39::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 02:00:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e52b025-f375-4c8d-77c2-08d9676c13e1
X-MS-TrafficTypeDiagnostic: CH2PR11MB4197:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR11MB4197E35D2E97C3AE86C598B7F4C69@CH2PR11MB4197.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9fSM7ZND80aX1d2TamOAvTZIh4EbLbY/zGSw4poOKSBv7EgedWEU6dTDvs3dhOXPUCx8CtAYICDpuOcLNK8tOReMvi07kxn75acjnAKLmS6krreOAuwhQ8sNSiUGtdk8ATUmYE3v3Pnyuu6eVvMdc5onaBloJHHjoWEe62Cs+IsDXCttYRs+rAj7lnTSC9ZvtWLII0dMXU61bIqrUwAx0HomAAexUBFCF1/NWubSG1zpWZO71zrG2uTQbvV9I/VddCDnx+YtNiC8TUOw1p2ts0HMjZXFYjrOuwgXonOOV83uHghs0LWs3NG8yNEolJ/pMkmo4JEYIgpWUx0ZK5lPDXrAqiCg3NGowEIgexQ+UnyE2VVmeVJ7b9Zk9CgawJwbpQ5zYSj82ZVcHAK+u+RdJqTXIPthRYsR5DC+BpjQneTgt1VEE9u0A1h58otoiQW9HXo2rqAkiapIrXBeG+nzZzFuJSVoDwjlzor9bvTrKQZ9e34Y8FaZjrqq0zSdTBHzMMplPt7Twe0LjxnPGvexICFGw/BZuQKJlKVv2xib2r6kBQ+XWlc0fl7crwV9l67kxdOUm5GcCRC1MOelimfmDWwo3iM3einksJWYaPe9Trr4Q0mgOID5HOAi3f5M7QvAN3OJVel3sygtI1vV5SN7lklX0egKpfROIOZPG437l+BelSL4f3rssYP8R9dgSAK3Dawmnf8Hl7uN14odmtXF/OCLQfkG67wYSDDabBsdpFSWnVKa/qzgfgTcrPiq0nX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(478600001)(31696002)(6486002)(86362001)(2906002)(26005)(316002)(186003)(53546011)(16576012)(66946007)(30864003)(8676002)(4326008)(38100700002)(5660300002)(2616005)(956004)(83380400001)(31686004)(36756003)(66476007)(8936002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlRCY1ZqblhVVzdYNGFYNmNZN1Z1K2tET1FoSlZSdjJhaTZKMml1K3JpN0Fo?=
 =?utf-8?B?TXJPTFp2UnpKandBYkdWZzVaNkU3ME5mMEtDeUdTeGJZRFJrZmNqV0MyeEk0?=
 =?utf-8?B?T2N3a0hmM2gxbUIvVVkrVXk3Mk5oYlQ1eWl5NzFDTFBQR2FabEh3bkEyU1VI?=
 =?utf-8?B?bnhlamZyalBEaXUvNU8yT0N2d2hZM0ZMczExYVd3Tkp0WnhHeXRvZS9Fc011?=
 =?utf-8?B?azFjU2pUOFZ0YUYwejN6bEc4bkkrSnlZbzY4VlB4NG5TQnhtTDhHNmpiSWxl?=
 =?utf-8?B?Y0hZemYxajBZSk83QWlycVl5d3oxdGZtc3pUZ1BORFI2Vjc1d1Z4RXBMMiti?=
 =?utf-8?B?Q2hDalE2M0lWTjQ0b3J2VXFmZVM0Vm1vOVBnbWR3NjJZNzZTQXhrMUJFUjdr?=
 =?utf-8?B?QTNvcHdWUG5zMjRkSjlwaUxiaDVLNCtaQlFoMUhkZDQyTngwVjdqS200OW1D?=
 =?utf-8?B?NG1XTU5xUXpFRnh6Wi9ydkJXd0JFQTNFNFVGSEFyR2FkRTNySlR6VlE3azVx?=
 =?utf-8?B?SnoxZGMvODdkN0FqK01YdFNJMlF1K0E0UTBkalk0Z01qWmc5c3ljY0dvTjBm?=
 =?utf-8?B?U2V4TWpORkRCWm5oQ1NhNW1DNXFvRzc2SlN3MGpxQlhYWDhnVjJKQkRVZ0cw?=
 =?utf-8?B?WTEzVm5nc25TaEQxdmVacXFNTzZ1TFZjUmJuRkJYbURSVWYrUWlRcEtOZ0U4?=
 =?utf-8?B?SUZpWXRjL0xyV1JEL0F2ZGdsV1hGK2FiZk9FakU2ci92RHdZNWd2NEhYeTV5?=
 =?utf-8?B?ZDArSWkrdnNQWGtHZEtDbWtWdWo4eStxYmdET01oZmpDTmRGbmR0bUxJV1Vm?=
 =?utf-8?B?azhvMlNPdi9jcDY4MTI2N1EyQ0o3N0t5SnY2MFRpNzdITHBJcHI2MG9xQXd6?=
 =?utf-8?B?SHdRU3FsOWtTUm9wWUg4K2xwUWwyT2dybzQxWDZ5ajIzaS8wY2hpcENkRC8y?=
 =?utf-8?B?RXdEUHNuOE1oSDVDUVlhV0ZVcWxsQU1rU2JVbEcxMTBJSnd2YXNDVDJqeFpL?=
 =?utf-8?B?WjlQaFQxa3dNN2ZxaVY1L1R1MEU0dFZxM1R6ZS9wcXhIUXVaa2FXQ05Xa0lB?=
 =?utf-8?B?c2kxVFJOSGVleWRiM1c4V3lFVEVOYzdpMEpDN1E5OXUzTEliWlVIQ2xhZmpU?=
 =?utf-8?B?bHBScXByZGtvcTVPd3Mwc2FZdGhJd0o4cEg3MGt0R04zTkpMK1N4MkplNG1Y?=
 =?utf-8?B?YmtxWDlxRVJZWkNuUytyQ3IwUGZBYnNaTW1ra1YxdmxiaUVGSUkyTXd6aGZF?=
 =?utf-8?B?cTUwNlA2RHFJK1VBZHlIOXNid2NHakwyQW05aXFsMWRyc29LeHl2RzhGU0cv?=
 =?utf-8?B?a0NEeEFtaFlDajBGVjBjRW1xYWNQM29BblkzR0pZZjZZbUlIR01TNVd1T2p3?=
 =?utf-8?B?ZlBDWVNmMlBIREFjMzhYNEU3c1BBVHlKWVM1cjd5VUdCMXM4UStzZWNJVE9R?=
 =?utf-8?B?czV1djFIU1JJRHh5Tjl6ZWQrK282Uk5TZ2dJa3VKL3NLYnBqT3FMRWJRclVh?=
 =?utf-8?B?S2t2bFliTmZISzFuZGtyMkFoOVNhdjdtYmlHaUsyR2o5ZmljRUFMQmlqUWV3?=
 =?utf-8?B?MkFsU0ZySUlXVXpLbU8zZUdxdVprbUtheitrNmd5YU1GUlhwQng2M0x5YzJI?=
 =?utf-8?B?TFpGVDRSUk90dkZudUNZQm9tRzNwWC9CUTgvV1podGdGN3ZJeW1uM2Qxb00v?=
 =?utf-8?B?U3NmNkRVSm1ZOG44ckRseVVnNVk0cmx5alVLN1RYMmRFMHpRMFdPbEJReDk5?=
 =?utf-8?Q?RF2LdPZtXDESCZl+AwvA5qpHz35Bks/dazfJWE2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e52b025-f375-4c8d-77c2-08d9676c13e1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 02:00:13.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDsUozYCDDnEk5Seh8D08SEz5E4tpDPQH6D481jVToL/ouzvOsI6iOcY+mMgiZ8vo2kQz0nPFXOFqipCBgS84yNK24usawM1yZTnZAfIpmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4197
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
> To make ownership of locking clear move fields (guc_id, guc_id_ref,
> guc_id_link) to sub structure guc_id in intel_context.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   4 +-
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  18 +--
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   6 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 106 +++++++++---------
>   drivers/gpu/drm/i915/i915_trace.h             |   4 +-
>   5 files changed, 70 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 0e48939ec85f..87b84c1d5393 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -398,8 +398,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	spin_lock_init(&ce->guc_active.lock);
>   	INIT_LIST_HEAD(&ce->guc_active.requests);
>   
> -	ce->guc_id = GUC_INVALID_LRC_ID;
> -	INIT_LIST_HEAD(&ce->guc_id_link);
> +	ce->guc_id.id = GUC_INVALID_LRC_ID;
> +	INIT_LIST_HEAD(&ce->guc_id.link);
>   
>   	/*
>   	 * Initialize fence to be complete as this is expected to be complete
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 9fb0480ccf3b..7a1d1537cf67 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -186,16 +186,18 @@ struct intel_context {
>   		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
>   	} guc_active;
>   
> -	/* GuC LRC descriptor ID */
> -	u16 guc_id;
> +	struct {
> +		/* GuC LRC descriptor ID */
> +		u16 id;
>   
> -	/* GuC LRC descriptor reference count */
> -	atomic_t guc_id_ref;
> +		/* GuC LRC descriptor reference count */
> +		atomic_t ref;
>   
> -	/*
> -	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
> -	 */
> -	struct list_head guc_id_link;
> +		/*
> +		 * GuC ID link - in list when unpinned but guc_id still valid in GuC
> +		 */
> +		struct list_head link;
> +	} guc_id;

Maybe add a

/* protected via guc->contexts_lock */

somewhere in the struct doc?

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 08f011f893b2..bf43bed905db 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -789,7 +789,7 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>   				if (err)
>   					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
>   					       engine->name, rq->fence.context,
> -					       rq->fence.seqno, rq->context->guc_id, err);
> +					       rq->fence.seqno, rq->context->guc_id.id, err);
>   			}
>   
>   skip:
> @@ -1098,7 +1098,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   				if (err)
>   					pr_err("[%s] Wait for request %lld:%lld [0x%04X] failed: %d!\n",
>   					       engine->name, rq->fence.context,
> -					       rq->fence.seqno, rq->context->guc_id, err);
> +					       rq->fence.seqno, rq->context->guc_id.id, err);
>   			}
>   
>   			count++;
> @@ -1108,7 +1108,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   					pr_err("i915_reset_engine(%s:%s): failed to reset request %lld:%lld [0x%04X]\n",
>   					       engine->name, test_name,
>   					       rq->fence.context,
> -					       rq->fence.seqno, rq->context->guc_id);
> +					       rq->fence.seqno, rq->context->guc_id.id);
>   					i915_request_put(rq);
>   
>   					GEM_TRACE_DUMP();
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index bb90bedb1305..c4c018348ac0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -269,12 +269,12 @@ static inline void decr_context_committed_requests(struct intel_context *ce)
>   
>   static inline bool context_guc_id_invalid(struct intel_context *ce)
>   {
> -	return ce->guc_id == GUC_INVALID_LRC_ID;
> +	return ce->guc_id.id == GUC_INVALID_LRC_ID;
>   }
>   
>   static inline void set_context_guc_id_invalid(struct intel_context *ce)
>   {
> -	ce->guc_id = GUC_INVALID_LRC_ID;
> +	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   }
>   
>   static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
> @@ -466,14 +466,14 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		return 0;
>   	}
>   
> -	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
> +	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
>   	/*
>   	 * Corner case where the GuC firmware was blown away and reloaded while
>   	 * this context was pinned.
>   	 */
> -	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
> +	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
>   		err = guc_lrc_desc_pin(ce, false);
>   		if (unlikely(err))
>   			return err;
> @@ -492,14 +492,14 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   
>   	if (!enabled) {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> -		action[len++] = ce->guc_id;
> +		action[len++] = ce->guc_id.id;
>   		action[len++] = GUC_CONTEXT_ENABLE;
>   		set_context_pending_enable(ce);
>   		intel_context_get(ce);
>   		g2h_len_dw = G2H_LEN_DW_SCHED_CONTEXT_MODE_SET;
>   	} else {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> -		action[len++] = ce->guc_id;
> +		action[len++] = ce->guc_id.id;
>   	}
>   
>   	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
> @@ -1150,12 +1150,12 @@ static int new_guc_id(struct intel_guc *guc)
>   static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	if (!context_guc_id_invalid(ce)) {
> -		ida_simple_remove(&guc->guc_ids, ce->guc_id);
> -		reset_lrc_desc(guc, ce->guc_id);
> +		ida_simple_remove(&guc->guc_ids, ce->guc_id.id);
> +		reset_lrc_desc(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
> -	if (!list_empty(&ce->guc_id_link))
> -		list_del_init(&ce->guc_id_link);
> +	if (!list_empty(&ce->guc_id.link))
> +		list_del_init(&ce->guc_id.link);
>   }
>   
>   static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> @@ -1177,13 +1177,13 @@ static int steal_guc_id(struct intel_guc *guc)
>   	if (!list_empty(&guc->guc_id_list)) {
>   		ce = list_first_entry(&guc->guc_id_list,
>   				      struct intel_context,
> -				      guc_id_link);
> +				      guc_id.link);
>   
> -		GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
> +		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>   		GEM_BUG_ON(context_guc_id_invalid(ce));
>   
> -		list_del_init(&ce->guc_id_link);
> -		guc_id = ce->guc_id;
> +		list_del_init(&ce->guc_id.link);
> +		guc_id = ce->guc_id.id;
>   
>   		spin_lock(&ce->guc_state.lock);
>   		clr_context_registered(ce);
> @@ -1219,7 +1219,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	int ret = 0;
>   	unsigned long flags, tries = PIN_GUC_ID_TRIES;
>   
> -	GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
> +	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>   
>   try_again:
>   	spin_lock_irqsave(&guc->contexts_lock, flags);
> @@ -1227,20 +1227,20 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	might_lock(&ce->guc_state.lock);
>   
>   	if (context_guc_id_invalid(ce)) {
> -		ret = assign_guc_id(guc, &ce->guc_id);
> +		ret = assign_guc_id(guc, &ce->guc_id.id);
>   		if (ret)
>   			goto out_unlock;
>   		ret = 1;	/* Indidcates newly assigned guc_id */
>   	}
> -	if (!list_empty(&ce->guc_id_link))
> -		list_del_init(&ce->guc_id_link);
> -	atomic_inc(&ce->guc_id_ref);
> +	if (!list_empty(&ce->guc_id.link))
> +		list_del_init(&ce->guc_id.link);
> +	atomic_inc(&ce->guc_id.ref);
>   
>   out_unlock:
>   	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>   
>   	/*
> -	 * -EAGAIN indicates no guc_ids are available, let's retire any
> +	 * -EAGAIN indicates no guc_id are available, let's retire any
>   	 * outstanding requests to see if that frees up a guc_id. If the first
>   	 * retire didn't help, insert a sleep with the timeslice duration before
>   	 * attempting to retire more requests. Double the sleep period each
> @@ -1268,15 +1268,15 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> -	GEM_BUG_ON(atomic_read(&ce->guc_id_ref) < 0);
> +	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
>   
>   	if (unlikely(context_guc_id_invalid(ce)))
>   		return;
>   
>   	spin_lock_irqsave(&guc->contexts_lock, flags);
> -	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id_link) &&
> -	    !atomic_read(&ce->guc_id_ref))
> -		list_add_tail(&ce->guc_id_link, &guc->guc_id_list);
> +	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id.link) &&
> +	    !atomic_read(&ce->guc_id.ref))
> +		list_add_tail(&ce->guc_id.link, &guc->guc_id_list);
>   	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>   }
>   
> @@ -1299,12 +1299,12 @@ static int register_context(struct intel_context *ce, bool loop)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
> -		ce->guc_id * sizeof(struct guc_lrc_desc);
> +		ce->guc_id.id * sizeof(struct guc_lrc_desc);
>   	int ret;
>   
>   	trace_intel_context_register(ce);
>   
> -	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
> +	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
>   	if (likely(!ret)) {
>   		unsigned long flags;
>   
> @@ -1374,7 +1374,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
> -	u32 desc_idx = ce->guc_id;
> +	u32 desc_idx = ce->guc_id.id;
>   	struct guc_lrc_desc *desc;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
> @@ -1437,7 +1437,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   		 * context whose guc_id was stolen.
>   		 */
>   		with_intel_runtime_pm(runtime_pm, wakeref)
> -			ret = deregister_context(ce, ce->guc_id, loop);
> +			ret = deregister_context(ce, ce->guc_id.id, loop);
>   		if (unlikely(ret == -ENODEV)) {
>   			ret = 0;	/* Will get registered later */
>   		}
> @@ -1509,7 +1509,7 @@ static void __guc_context_sched_enable(struct intel_guc *guc,
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
> -		ce->guc_id,
> +		ce->guc_id.id,
>   		GUC_CONTEXT_ENABLE
>   	};
>   
> @@ -1525,7 +1525,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
> -		guc_id,	/* ce->guc_id not stable */
> +		guc_id,	/* ce->guc_id.id not stable */
>   		GUC_CONTEXT_DISABLE
>   	};
>   
> @@ -1570,7 +1570,7 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
>   	guc_blocked_fence_reinit(ce);
>   	intel_context_get(ce);
>   
> -	return ce->guc_id;
> +	return ce->guc_id.id;
>   }
>   
>   static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> @@ -1625,7 +1625,7 @@ static void guc_context_unblock(struct intel_context *ce)
>   	if (unlikely(submission_disabled(guc) ||
>   		     intel_context_is_banned(ce) ||
>   		     context_guc_id_invalid(ce) ||
> -		     !lrc_desc_registered(guc, ce->guc_id) ||
> +		     !lrc_desc_registered(guc, ce->guc_id.id) ||
>   		     !intel_context_is_pinned(ce) ||
>   		     context_pending_disable(ce) ||
>   		     context_blocked(ce) > 1)) {
> @@ -1730,7 +1730,7 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>   		if (!context_guc_id_invalid(ce))
>   			with_intel_runtime_pm(runtime_pm, wakeref)
>   				__guc_context_set_preemption_timeout(guc,
> -								     ce->guc_id,
> +								     ce->guc_id.id,
>   								     1);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   	}
> @@ -1746,7 +1746,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	bool enabled;
>   
>   	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
> -	    !lrc_desc_registered(guc, ce->guc_id)) {
> +	    !lrc_desc_registered(guc, ce->guc_id.id)) {
>   		spin_lock_irqsave(&ce->guc_state.lock, flags);
>   		clr_context_enabled(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> @@ -1793,11 +1793,11 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> -	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
> -	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
> +	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
> +	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> -	deregister_context(ce, ce->guc_id, true);
> +	deregister_context(ce, ce->guc_id.id, true);
>   }
>   
>   static void __guc_context_destroy(struct intel_context *ce)
> @@ -1842,7 +1842,7 @@ static void guc_context_destroy(struct kref *kref)
>   		__guc_context_destroy(ce);
>   		return;
>   	} else if (submission_disabled(guc) ||
> -		   !lrc_desc_registered(guc, ce->guc_id)) {
> +		   !lrc_desc_registered(guc, ce->guc_id.id)) {
>   		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   		return;
> @@ -1851,10 +1851,10 @@ static void guc_context_destroy(struct kref *kref)
>   	/*
>   	 * We have to acquire the context spinlock and check guc_id again, if it
>   	 * is valid it hasn't been stolen and needs to be deregistered. We
> -	 * delete this context from the list of unpinned guc_ids available to
> +	 * delete this context from the list of unpinned guc_id available to
>   	 * steal to seal a race with guc_lrc_desc_pin(). When the G2H CTB
>   	 * returns indicating this context has been deregistered the guc_id is
> -	 * returned to the pool of available guc_ids.
> +	 * returned to the pool of available guc_id.
>   	 */
>   	spin_lock_irqsave(&guc->contexts_lock, flags);
>   	if (context_guc_id_invalid(ce)) {
> @@ -1863,8 +1863,8 @@ static void guc_context_destroy(struct kref *kref)
>   		return;
>   	}
>   
> -	if (!list_empty(&ce->guc_id_link))
> -		list_del_init(&ce->guc_id_link);
> +	if (!list_empty(&ce->guc_id.link))
> +		list_del_init(&ce->guc_id.link);
>   	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>   
>   	/* Seal race with Reset */
> @@ -1909,7 +1909,7 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   {
>   	u32 action[] = {
>   		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
> -		ce->guc_id,
> +		ce->guc_id.id,
>   		prio,
>   	};
>   
> @@ -2044,7 +2044,7 @@ static void remove_from_context(struct i915_request *rq)
>   	decr_context_committed_requests(ce);
>   	spin_unlock_irq(&ce->guc_state.lock);
>   
> -	atomic_dec(&ce->guc_id_ref);
> +	atomic_dec(&ce->guc_id.ref);
>   	i915_request_notify_execute_cb_imm(rq);
>   }
>   
> @@ -2111,7 +2111,7 @@ static void guc_signal_context_fence(struct intel_context *ce)
>   static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>   {
>   	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id)) &&
> +		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id)) &&
>   		!submission_disabled(ce_to_guc(ce));
>   }
>   
> @@ -2166,11 +2166,11 @@ static int guc_request_alloc(struct i915_request *rq)
>   	/*
>   	 * Call pin_guc_id here rather than in the pinning step as with
>   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> -	 * guc_ids and creating horrible race conditions. This is especially bad
> -	 * when guc_ids are being stolen due to over subscription. By the time
> +	 * guc_id and creating horrible race conditions. This is especially bad
> +	 * when guc_id are being stolen due to over subscription. By the time
>   	 * this function is reached, it is guaranteed that the guc_id will be
>   	 * persistent until the generated request is retired. Thus, sealing these
> -	 * race conditions. It is still safe to fail here if guc_ids are
> +	 * race conditions. It is still safe to fail here if guc_id are
>   	 * exhausted and return -EAGAIN to the user indicating that they can try
>   	 * again in the future.
>   	 *
> @@ -2180,7 +2180,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	 * decremented on each retire. When it is zero, a lock around the
>   	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
>   	 */
> -	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
> +	if (atomic_add_unless(&ce->guc_id.ref, 1, 0))
>   		goto out;
>   
>   	ret = pin_guc_id(guc, ce);	/* returns 1 if new guc_id assigned */
> @@ -2193,7 +2193,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   				disable_submission(guc);
>   				goto out;	/* GPU will be reset */
>   			}
> -			atomic_dec(&ce->guc_id_ref);
> +			atomic_dec(&ce->guc_id.ref);
>   			unpin_guc_id(guc, ce);
>   			return ret;
>   		}
> @@ -3028,7 +3028,7 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   
>   		priolist_for_each_request(rq, pl)
>   			drm_printf(p, "guc_id=%u, seqno=%llu\n",
> -				   rq->context->guc_id,
> +				   rq->context->guc_id.id,
>   				   rq->fence.seqno);
>   	}
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> @@ -3059,7 +3059,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   
>   	xa_lock_irqsave(&guc->context_lookup, flags);
>   	xa_for_each(&guc->context_lookup, index, ce) {
> -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> +		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
>   		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
>   		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
>   			   ce->ring->head,
> @@ -3070,7 +3070,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   		drm_printf(p, "\t\tContext Pin Count: %u\n",
>   			   atomic_read(&ce->pin_count));
>   		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> -			   atomic_read(&ce->guc_id_ref));
> +			   atomic_read(&ce->guc_id.ref));
>   		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
>   			   ce->guc_state.sched_state);
>   
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 6f882e72ed11..0574f5c7a985 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -805,7 +805,7 @@ DECLARE_EVENT_CLASS(i915_request,
>   			   __entry->dev = rq->engine->i915->drm.primary->index;
>   			   __entry->class = rq->engine->uabi_class;
>   			   __entry->instance = rq->engine->uabi_instance;
> -			   __entry->guc_id = rq->context->guc_id;
> +			   __entry->guc_id = rq->context->guc_id.id;
>   			   __entry->ctx = rq->fence.context;
>   			   __entry->seqno = rq->fence.seqno;
>   			   __entry->tail = rq->tail;
> @@ -907,7 +907,7 @@ DECLARE_EVENT_CLASS(intel_context,
>   			     ),
>   
>   		    TP_fast_assign(
> -			   __entry->guc_id = ce->guc_id;
> +			   __entry->guc_id = ce->guc_id.id;
>   			   __entry->pin_count = atomic_read(&ce->pin_count);
>   			   __entry->sched_state = ce->guc_state.sched_state;
>   			   __entry->guc_prio = ce->guc_active.prio;

