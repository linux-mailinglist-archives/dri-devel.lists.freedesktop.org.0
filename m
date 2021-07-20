Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6561F3CF0BA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDA46E220;
	Tue, 20 Jul 2021 00:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF0C89BB3;
 Tue, 20 Jul 2021 00:24:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="211152211"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="211152211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 17:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="509562953"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2021 17:24:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 19 Jul 2021 17:24:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 17:24:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 17:24:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 17:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJYarYQAQVAdkqCY0LK+Zx0746RnDtSdYe8C8g/hipIFQ9/8EK8dwVD37NNFac7qElp6AmWgJ/9VuJa4UCryiFAZbMWLgPq3AQFgG50BijyI44KRb9sTkvJOfEBIkGjme929dChyvSWjQPXE9/kX1RGEwEML4aE4jJONPHtEkqqLSi5Sy/v72nkueZn8pQB0M1obaaMQBMomf14ZN4TRGEVy0wAYA+YlFolVnciqdE/qFedCvvtgkEPMnY2zq6MpzA60GDvtoofE+W9BdozDMrLTNW/QMeCrDRTWNVaVGeYQgnoLw1D5wSSMhqe9X2MRudHFRmdhPan64rD2cw6Huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsOCGocNKmJA6WvFVVvSyZxshUuIJu5tAnN/76sbfPo=;
 b=l1Lg6ngAspEK72RzCZsIYU8HwEd5/V2wQ34RX8peIbKP+t+hs4dzdZVrfXY0Q7TgAzzpTIfU1MncDWOV6rUhHcWzGEHkSzaNTVHDAekp34KkfrOVcn/Drhs/wDfckwfzSIT7z+HIA6u9J6bvYnaSxaWdklK3mgGIBMSQQ2y7BrBZ4AVAgx4mYnZfe5Z4ax7BTBfYk3RJ2L6VfPz/ZMf2RqcdbtHB+Oa/AmNefiSf05QVhNBBQ7F6MZIVsdsZtlHJu4fV0122EmJJChcfRNGfJH9Wp4ZBouqk3ZNxSPfYMtAyc0Bq6QvUpba7xeIbgbsqzdIMDtOrx1fAuROGCmeRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsOCGocNKmJA6WvFVVvSyZxshUuIJu5tAnN/76sbfPo=;
 b=zxwVp0GrV0yQ9gzZ7KNv+sZpotxtdi8HszSHAWaqLIzwxzCPegPbjQ/AIpQ4kxxM2dSkjrQkNwejW8omGGwbd66WIJbdfDicmD/RCqiuk/tYL94fcho0/9V1wNwP/lSQTcWND8XbNg7uyuLre04X8FQfa2QMreD1bAHkJS0+gTU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 00:23:58 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Tue, 20 Jul 2021
 00:23:58 +0000
Subject: Re: [PATCH 06/51] drm/i915/guc: Implement GuC context operations for
 new inteface
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-7-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <ab297892-56c2-7460-0d9b-41f2b1c44edb@intel.com>
Date: Mon, 19 Jul 2021 17:23:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:303:87::25) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0230.namprd04.prod.outlook.com (2603:10b6:303:87::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 00:23:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6a2eff4-13c3-478e-8201-08d94b14aa56
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5628EE60B6428E67AE866AC1BDE29@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpjVFdqSP0TXaJu48jc/SLUZzTmifvcQqCituRZR9x/gGBY2PUMUHbPpv4AsAzEjxE7TOIlDg/VtojRJYgTRXf+o1raZYZdgMqKu/qqDjup54RPgG8gTigu5G1X5BR7FirngVMpaB9HxVmPM5vu7DLdMZwc8p+flh3hrnMAQKnHjdEZbG9ZqRraewqn/r5jlmBCF4qQVux78QZRZt7kRfaM+1I33Q1q8Ss7pWI1xx0uSZwTLQ43+FGOXrhSJGnUAfTKOM0pE2h2gzAlAM6rHFPnxAZoFyWpDMlBwf9+DRjcTG55Yi3inPhayxWumvNDUUWbSnzTh7L0Cdrq4qPnis4ZLsBwL8YdCBkb90V9tQR+Jy0KvsMBMFd5P+77crN4uCzKZnzjsLuOAlMB1hMq2aeU7X317fEqX3zclXWtgO+Xp5aOVfgjEun7YS9fHEPbX6oqMvdd623yFoGAxpvIiuDMyA+++/jNdFKRP7CKgVb2TLGsVSzHOgSEcJ9R3i4xXHosiNSqT6zRiNCQeA6eNsasPkBxps+eoxaJ6H9MksxltKnGt/XWFDjfPVO34hmEUq3e8sPjyUqdXca/C8IR8GkxJbH5F5q+GBkkGsMIz2VkpdB3SztStHEVNaD5wa2PQEcm9ebYgF7e0cBAlLVaiuwMBOCZwZQe4CfW2DJeD1Jjcn96QQF9SblGLaoDIG/DoiMrZNBa05cnQ0wUr+2AD+ABebeq+SX0OAHMgzLBFmQcfBXimu+0wiLmuGrAgBSAq/zLQ9F3MUSnqEhQNu7cUr5d8uE6uP0SJyxK1/c1yQEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(83380400001)(66556008)(38100700002)(450100002)(66946007)(956004)(478600001)(2616005)(31696002)(31686004)(66476007)(186003)(8676002)(36756003)(8936002)(5660300002)(86362001)(107886003)(26005)(30864003)(4326008)(2906002)(316002)(6486002)(53546011)(16576012)(21314003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1h4eUx6WTdld1QwaFlTeEdhQm90NGxHWXpWNDVWL2kybUF6Vmo5aXRJbVd1?=
 =?utf-8?B?VFR5a0U2akZ4RXYwamJFeDNhSVFWdGg5dXRyQ2crOTM3RmFzeFRSK0JPcVp0?=
 =?utf-8?B?Nnd6VWw4eEY5SHRUZGZwaEdxeGpIQUJYUlZuVWl4RW5MYXNlOUsxeVQ4VERY?=
 =?utf-8?B?bUkwMEtDekZ1OG1wa1diK3VLaldHZTIwNnBwMURzdnNvTW1RUXNaUnFZc09p?=
 =?utf-8?B?VVlnVCtXd0s5MzZhamFWeGdoMk9lM25lWHhGRFZlSHBERXExZVpsNjU1ejlq?=
 =?utf-8?B?K2xpU1F5N2xKM0h4TTFRQnBXMzBKTFNLSUhpVllsNmZhdUt4bVNmMnNnNnlm?=
 =?utf-8?B?czlsZ3Z2cE12b1dKQytkdTZQWWRPVDJodjFwWGNrYWY4SVJQQXdOWStxZzVk?=
 =?utf-8?B?QVNmcTdLZVRPRXhadEJrRXNlNjgrZnc3amh4L0hXMW50Y1orbmNrL2EvRWZZ?=
 =?utf-8?B?ZE5XYll6LzZuTzZqdFZVY0J1NnJqMUpFWlIySHY0NDQxV0htTXpZZmxBTm12?=
 =?utf-8?B?RXhhZGxEY2pLaUNCd2pRMEJKNzlhR3ZONWx5aUF0UU94eXhlZjBpb2tJa0g2?=
 =?utf-8?B?V2p2V1hjSWluVllsMm9KVkFrTEdOaVRJMVJWZ1hyYy8wOW9FRHArMWV6VDUy?=
 =?utf-8?B?Y2p5OHBwNDY1UElNaFdnZ1lFVEZTUlMyMkRmekxVRGt2TXBqL1JoUFFuVFM3?=
 =?utf-8?B?a2RIWlZqVGY0VGlYajJoMXRrcDhCdy9iOWRQYjdhQzBhd2FYVHVJbVo0M0hU?=
 =?utf-8?B?RnY5MGI4WDhlQmpjZWc4RlR5MEo4dFlmM2NiVzRXZGN5cUc2UjhDV1FNcHoz?=
 =?utf-8?B?N1p5enJxbktCMGRFeElRN2trektuYm9OcU4vaHVKblBuRU4wdFJhemg4blFz?=
 =?utf-8?B?ZTN6WWd4OWNBbHBZeWNrY2xVcjBqOXhES1dNYUZZWHVvV1hiUnBpREhnRS81?=
 =?utf-8?B?aEFLWUt3b2NySjIwaWNpamZEL2RDN1J1QWlxOEczeHI2SlozK2ZCTktTS0x0?=
 =?utf-8?B?eUJuRFUzSGRRNEs3N3JuUEZxZXJiS2d5VUFVVURmZ1pVcFozbGNxT3QxcGo0?=
 =?utf-8?B?dEl3dGtBYWs0UUFVcnJqMy9NY1lnR09OMGN4MVFaRTlyWEQ4WWNKdjMwMFBQ?=
 =?utf-8?B?cW9BTm51ZnJHR0xvSmhQUXhJcFA0YndGUUdRT1ZTQU1PaTJERlVmUEFOMW1u?=
 =?utf-8?B?VEpqWDdnZTRnSjB6MFExam55WEZXb1ZFdEFLOUVpOVZnYWd4ZGc4U3R3MDgr?=
 =?utf-8?B?OEo1RXp4aVIrMW9KSUhzblkvTXVUVnBGdDV0bkY5elNuVzVueHQwemdxeTB1?=
 =?utf-8?B?Rkp1NjRJMjVPSWR4V3FqMjJqaTAzUmJQMHVzL1FSSzliR3ZQY2JPSE9MMDRW?=
 =?utf-8?B?cTJXdzJ5QUFWZHhJTnllNjhLRXF4eE5XcG5tK0xGL3lCTmdFdURTSVZESTM1?=
 =?utf-8?B?Y09wN1ZlV0dkUFBvTldmY0labG51RUpXVWhlRVF0ME54alROaTQ0Yk9GbndY?=
 =?utf-8?B?ZWRZN01SdjZkQmVFZThZekdndW80bVZLUXp0U0dVY0ZhOUFSL0h5dDFhQm80?=
 =?utf-8?B?UXBWc0U1RTRpVG1rSWtnbWJyY1M0dkVhU0Y4bndLZkVtQ04yZFh0Wk5mNEU3?=
 =?utf-8?B?QmdoQ3ljTndQNzJ4YmlqVmgvVEdpQVV2Z0dqVTVBaVBLdXo3dkVEUWorRmRk?=
 =?utf-8?B?clcyczYycHE1KzNvUklKM2JlYUlJUy8xS2h1cS9vQTduUTBLWDU2bzh3RHdH?=
 =?utf-8?Q?vzCtj2QYxYg/VxAhKfu9y26V7iEjjiwiUONsp14?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a2eff4-13c3-478e-8201-08d94b14aa56
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:23:58.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFzu/4hIKb6vvkYTY1wVA0Wavgj7OyliOnRVw1y92SQ9IzdLui+MY6Hbjpr6V234iNoW1lXXqcdg0vX+5nuOfXxe2CMU/7kYA6mzvAkBYhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> Implement GuC context operations which includes GuC specific operations
> alloc, pin, unpin, and destroy.
>
> v2:
>   (Daniel Vetter)
>    - Use msleep_interruptible rather than cond_resched in busy loop
>   (Michal)
>    - Remove C++ style comment
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   5 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  22 +-
>   drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |   1 -
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  40 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   4 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 666 ++++++++++++++++--
>   drivers/gpu/drm/i915/i915_reg.h               |   1 +
>   drivers/gpu/drm/i915/i915_request.c           |   1 +
>   8 files changed, 685 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index bd63813c8a80..32fd6647154b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -384,6 +384,11 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   
>   	mutex_init(&ce->pin_mutex);
>   
> +	spin_lock_init(&ce->guc_state.lock);
> +
> +	ce->guc_id = GUC_INVALID_LRC_ID;
> +	INIT_LIST_HEAD(&ce->guc_id_link);
> +
>   	i915_active_init(&ce->active,
>   			 __intel_context_active, __intel_context_retire, 0);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 6d99631d19b9..606c480aec26 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -96,6 +96,7 @@ struct intel_context {
>   #define CONTEXT_BANNED			6
>   #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
>   #define CONTEXT_NOPREEMPT		8
> +#define CONTEXT_LRCA_DIRTY		9
>   
>   	struct {
>   		u64 timeout_us;
> @@ -138,14 +139,29 @@ struct intel_context {
>   
>   	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
>   
> +	struct {
> +		/** lock: protects everything in guc_state */
> +		spinlock_t lock;
> +		/**
> +		 * sched_state: scheduling state of this context using GuC
> +		 * submission
> +		 */
> +		u8 sched_state;
> +	} guc_state;
> +
>   	/* GuC scheduling state flags that do not require a lock. */
>   	atomic_t guc_sched_state_no_lock;
>   
> +	/* GuC LRC descriptor ID */
> +	u16 guc_id;
> +
> +	/* GuC LRC descriptor reference count */
> +	atomic_t guc_id_ref;
> +
>   	/*
> -	 * GuC LRC descriptor ID - Not assigned in this patch but future patches
> -	 * in the series will.
> +	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
>   	 */
> -	u16 guc_id;
> +	struct list_head guc_id_link;
>   };
>   
>   #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
> index 41e5350a7a05..49d4857ad9b7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc_reg.h
> @@ -87,7 +87,6 @@
>   #define GEN11_CSB_WRITE_PTR_MASK	(GEN11_CSB_PTR_MASK << 0)
>   
>   #define MAX_CONTEXT_HW_ID	(1 << 21) /* exclusive */
> -#define MAX_GUC_CONTEXT_HW_ID	(1 << 20) /* exclusive */
>   #define GEN11_MAX_CONTEXT_HW_ID	(1 << 11) /* exclusive */
>   /* in Gen12 ID 0x7FF is reserved to indicate idle */
>   #define GEN12_MAX_CONTEXT_HW_ID	(GEN11_MAX_CONTEXT_HW_ID - 1)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 8c7b92f699f1..30773cd699f5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -7,6 +7,7 @@
>   #define _INTEL_GUC_H_
>   
>   #include <linux/xarray.h>
> +#include <linux/delay.h>
>   
>   #include "intel_uncore.h"
>   #include "intel_guc_fw.h"
> @@ -44,6 +45,14 @@ struct intel_guc {
>   		void (*disable)(struct intel_guc *guc);
>   	} interrupts;
>   
> +	/*
> +	 * contexts_lock protects the pool of free guc ids and a linked list of
> +	 * guc ids available to be stolen
> +	 */
> +	spinlock_t contexts_lock;
> +	struct ida guc_ids;
> +	struct list_head guc_id_list;
> +
>   	bool submission_selected;
>   
>   	struct i915_vma *ads_vma;
> @@ -101,6 +110,34 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
>   				 response_buf, response_buf_size, 0);
>   }
>   
> +static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
> +					   const u32 *action,
> +					   u32 len,
> +					   bool loop)
> +{
> +	int err;
> +	unsigned int sleep_period_ms = 1;
> +	bool not_atomic = !in_atomic() && !irqs_disabled();
> +
> +	/* No sleeping with spin locks, just busy loop */
> +	might_sleep_if(loop && not_atomic);
> +
> +retry:
> +	err = intel_guc_send_nb(guc, action, len);
> +	if (unlikely(err == -EBUSY && loop)) {
> +		if (likely(not_atomic)) {
> +			if (msleep_interruptible(sleep_period_ms))
> +				return -EINTR;
> +			sleep_period_ms = sleep_period_ms << 1;
> +		} else {
> +			cpu_relax();
> +		}
> +		goto retry;
> +	}
> +
> +	return err;
> +}
> +
>   static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>   {
>   	intel_guc_ct_event_handler(&guc->ct);
> @@ -202,6 +239,9 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
>   int intel_guc_reset_engine(struct intel_guc *guc,
>   			   struct intel_engine_cs *engine);
>   
> +int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> +					  const u32 *msg, u32 len);
> +
>   void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 83ec60ea3f89..28ff82c5be45 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -928,6 +928,10 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
>   	case INTEL_GUC_ACTION_DEFAULT:
>   		ret = intel_guc_to_host_process_recv_msg(guc, payload, len);
>   		break;
> +	case INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> +		ret = intel_guc_deregister_done_process_msg(guc, payload,
> +							    len);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 53b4a5eb4a85..a47b3813b4d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -13,7 +13,9 @@
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_irq.h"
>   #include "gt/intel_gt_pm.h"
> +#include "gt/intel_gt_requests.h"
>   #include "gt/intel_lrc.h"
> +#include "gt/intel_lrc_reg.h"
>   #include "gt/intel_mocs.h"
>   #include "gt/intel_ring.h"
>   
> @@ -85,6 +87,73 @@ static inline void clr_context_enabled(struct intel_context *ce)
>   		   &ce->guc_sched_state_no_lock);
>   }
>   
> +/*
> + * Below is a set of functions which control the GuC scheduling state which
> + * require a lock, aside from the special case where the functions are called
> + * from guc_lrc_desc_pin(). In that case it isn't possible for any other code
> + * path to be executing on the context.
> + */
> +#define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
> +#define SCHED_STATE_DESTROYED				BIT(1)
> +static inline void init_sched_state(struct intel_context *ce)
> +{
> +	/* Only should be called from guc_lrc_desc_pin() */
> +	atomic_set(&ce->guc_sched_state_no_lock, 0);
> +	ce->guc_state.sched_state = 0;
> +}
> +
> +static inline bool
> +context_wait_for_deregister_to_register(struct intel_context *ce)
> +{
> +	return (ce->guc_state.sched_state &
> +		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER);
> +}
> +
> +static inline void
> +set_context_wait_for_deregister_to_register(struct intel_context *ce)
> +{
> +	/* Only should be called from guc_lrc_desc_pin() */
> +	ce->guc_state.sched_state |=
> +		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
> +}
> +
> +static inline void
> +clr_context_wait_for_deregister_to_register(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state =
> +		(ce->guc_state.sched_state &
> +		 ~SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER);
> +}
> +
> +static inline bool
> +context_destroyed(struct intel_context *ce)
> +{
> +	return (ce->guc_state.sched_state & SCHED_STATE_DESTROYED);
> +}
> +
> +static inline void
> +set_context_destroyed(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
> +}
> +
> +static inline bool context_guc_id_invalid(struct intel_context *ce)
> +{
> +	return (ce->guc_id == GUC_INVALID_LRC_ID);
> +}
> +
> +static inline void set_context_guc_id_invalid(struct intel_context *ce)
> +{
> +	ce->guc_id = GUC_INVALID_LRC_ID;
> +}
> +
> +static inline struct intel_guc *ce_to_guc(struct intel_context *ce)
> +{
> +	return &ce->engine->gt->uc.guc;
> +}
> +
>   static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   {
>   	return rb_entry(rb, struct i915_priolist, node);
> @@ -155,6 +224,9 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	int len = 0;
>   	bool enabled = context_enabled(ce);
>   
> +	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
> +	GEM_BUG_ON(context_guc_id_invalid(ce));
> +
>   	if (!enabled) {
>   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>   		action[len++] = ce->guc_id;
> @@ -417,6 +489,10 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   
>   	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>   
> +	spin_lock_init(&guc->contexts_lock);
> +	INIT_LIST_HEAD(&guc->guc_id_list);
> +	ida_init(&guc->guc_ids);
> +
>   	return 0;
>   }
>   
> @@ -429,9 +505,303 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	i915_sched_engine_put(guc->sched_engine);
>   }
>   
> -static int guc_context_alloc(struct intel_context *ce)
> +static inline void queue_request(struct i915_sched_engine *sched_engine,
> +				 struct i915_request *rq,
> +				 int prio)
>   {
> -	return lrc_alloc(ce, ce->engine);
> +	GEM_BUG_ON(!list_empty(&rq->sched.link));
> +	list_add_tail(&rq->sched.link,
> +		      i915_sched_lookup_priolist(sched_engine, prio));
> +	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> +}
> +
> +static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> +				     struct i915_request *rq)
> +{
> +	int ret;
> +
> +	__i915_request_submit(rq);
> +
> +	trace_i915_request_in(rq, 0);
> +
> +	guc_set_lrc_tail(rq);
> +	ret = guc_add_request(guc, rq);
> +	if (ret == -EBUSY)
> +		guc->stalled_request = rq;
> +
> +	return ret;
> +}
> +
> +static void guc_submit_request(struct i915_request *rq)
> +{
> +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> +	struct intel_guc *guc = &rq->engine->gt->uc.guc;
> +	unsigned long flags;
> +
> +	/* Will be called from irq-context when using foreign fences. */
> +	spin_lock_irqsave(&sched_engine->lock, flags);
> +
> +	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
> +		queue_request(sched_engine, rq, rq_prio(rq));
> +	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
> +		tasklet_hi_schedule(&sched_engine->tasklet);
> +
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +}
> +
> +#define GUC_ID_START	64	/* First 64 guc_ids reserved */
Reserved for what?

> +static int new_guc_id(struct intel_guc *guc)
> +{
> +	return ida_simple_get(&guc->guc_ids, GUC_ID_START,
> +			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
> +			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +}
> +
> +static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	if (!context_guc_id_invalid(ce)) {
> +		ida_simple_remove(&guc->guc_ids, ce->guc_id);
> +		reset_lrc_desc(guc, ce->guc_id);
> +		set_context_guc_id_invalid(ce);
> +	}
> +	if (!list_empty(&ce->guc_id_link))
> +		list_del_init(&ce->guc_id_link);
> +}
> +
> +static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	__release_guc_id(guc, ce);
> +	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +}
> +
> +static int steal_guc_id(struct intel_guc *guc)
> +{
> +	struct intel_context *ce;
> +	int guc_id;
> +
> +	if (!list_empty(&guc->guc_id_list)) {
> +		ce = list_first_entry(&guc->guc_id_list,
> +				      struct intel_context,
> +				      guc_id_link);
> +
> +		GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
> +		GEM_BUG_ON(context_guc_id_invalid(ce));
> +
> +		list_del_init(&ce->guc_id_link);
> +		guc_id = ce->guc_id;
> +		set_context_guc_id_invalid(ce);
> +		return guc_id;
> +	} else {
> +		return -EAGAIN;
> +	}
> +}
> +
> +static int assign_guc_id(struct intel_guc *guc, u16 *out)
> +{
> +	int ret;
> +
> +	ret = new_guc_id(guc);
> +	if (unlikely(ret < 0)) {
> +		ret = steal_guc_id(guc);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	*out = ret;
> +	return 0;
> +}
> +
> +#define PIN_GUC_ID_TRIES	4
> +static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	int ret = 0;
> +	unsigned long flags, tries = PIN_GUC_ID_TRIES;
> +
> +	GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
> +
> +try_again:
> +	spin_lock_irqsave(&guc->contexts_lock, flags);
> +
> +	if (context_guc_id_invalid(ce)) {
> +		ret = assign_guc_id(guc, &ce->guc_id);
> +		if (ret)
> +			goto out_unlock;
> +		ret = 1;	/* Indidcates newly assigned guc_id */
> +	}
> +	if (!list_empty(&ce->guc_id_link))
> +		list_del_init(&ce->guc_id_link);
> +	atomic_inc(&ce->guc_id_ref);
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +
> +	/*
> +	 * -EAGAIN indicates no guc_ids are available, let's retire any
> +	 * outstanding requests to see if that frees up a guc_id. If the first
> +	 * retire didn't help, insert a sleep with the timeslice duration before
> +	 * attempting to retire more requests. Double the sleep period each
> +	 * subsequent pass before finally giving up. The sleep period has max of
> +	 * 100ms and minimum of 1ms.
> +	 */
> +	if (ret == -EAGAIN && --tries) {
> +		if (PIN_GUC_ID_TRIES - tries > 1) {
> +			unsigned int timeslice_shifted =
> +				ce->engine->props.timeslice_duration_ms <<
> +				(PIN_GUC_ID_TRIES - tries - 2);
> +			unsigned int max = min_t(unsigned int, 100,
> +						 timeslice_shifted);
> +
> +			msleep(max_t(unsigned int, max, 1));
> +		}
> +		intel_gt_retire_requests(guc_to_gt(guc));
> +		goto try_again;
> +	}
> +
> +	return ret;
> +}
> +
> +static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> +{
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(atomic_read(&ce->guc_id_ref) < 0);
> +
> +	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id_link) &&
> +	    !atomic_read(&ce->guc_id_ref))
> +		list_add_tail(&ce->guc_id_link, &guc->guc_id_list);
> +	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +}
> +
> +static int __guc_action_register_context(struct intel_guc *guc,
> +					 u32 guc_id,
> +					 u32 offset)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> +		guc_id,
> +		offset,
> +	};
> +
> +	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), true);
> +}
> +
> +static int register_context(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
> +		ce->guc_id * sizeof(struct guc_lrc_desc);
> +
> +	return __guc_action_register_context(guc, ce->guc_id, offset);
> +}
> +
> +static int __guc_action_deregister_context(struct intel_guc *guc,
> +					   u32 guc_id)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_DEREGISTER_CONTEXT,
> +		guc_id,
> +	};
> +
> +	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), true);
> +}
> +
> +static int deregister_context(struct intel_context *ce, u32 guc_id)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	return __guc_action_deregister_context(guc, guc_id);
> +}
> +
> +static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
> +{
> +	switch (class) {
> +	case RENDER_CLASS:
> +		return mask >> RCS0;
> +	case VIDEO_ENHANCEMENT_CLASS:
> +		return mask >> VECS0;
> +	case VIDEO_DECODE_CLASS:
> +		return mask >> VCS0;
> +	case COPY_ENGINE_CLASS:
> +		return mask >> BCS0;
> +	default:
> +		GEM_BUG_ON("Invalid Class");
> +		return 0;
> +	}
> +}
> +
> +static void guc_context_policy_init(struct intel_engine_cs *engine,
> +				    struct guc_lrc_desc *desc)
> +{
> +	desc->policy_flags = 0;
> +
> +	desc->execution_quantum = CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US;
> +	desc->preemption_timeout = CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US;
> +}
> +
> +static int guc_lrc_desc_pin(struct intel_context *ce)
> +{
> +	struct intel_runtime_pm *runtime_pm =
> +		&ce->engine->gt->i915->runtime_pm;
> +	struct intel_engine_cs *engine = ce->engine;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	u32 desc_idx = ce->guc_id;
> +	struct guc_lrc_desc *desc;
> +	bool context_registered;
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	GEM_BUG_ON(!engine->mask);
> +
> +	/*
> +	 * Ensure LRC + CT vmas are is same region as write barrier is done
> +	 * based on CT vma region.
> +	 */
> +	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
> +		   i915_gem_object_is_lmem(ce->ring->vma->obj));
> +
> +	context_registered = lrc_desc_registered(guc, desc_idx);
> +
> +	reset_lrc_desc(guc, desc_idx);
> +	set_lrc_desc_registered(guc, desc_idx, ce);
> +
> +	desc = __get_lrc_desc(guc, desc_idx);
> +	desc->engine_class = engine_class_to_guc_class(engine->class);
> +	desc->engine_submit_mask = adjust_engine_mask(engine->class,
> +						      engine->mask);
> +	desc->hw_context_desc = ce->lrc.lrca;
> +	desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
> +	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +	guc_context_policy_init(engine, desc);
> +	init_sched_state(ce);
> +
> +	/*
> +	 * The context_lookup xarray is used to determine if the hardware
> +	 * context is currently registered. There are two cases in which it
> +	 * could be regisgered either the guc_id has been stole from from
'regisgered' and 'stole' should be 'stolen'

> +	 * another context or the lrc descriptor address of this context has
> +	 * changed. In either case the context needs to be deregistered with the
> +	 * GuC before registering this context.
> +	 */
> +	if (context_registered) {
> +		set_context_wait_for_deregister_to_register(ce);
> +		intel_context_get(ce);
> +
> +		/*
> +		 * If stealing the guc_id, this ce has the same guc_id as the
> +		 * context whos guc_id was stole.
whose guc_id was stolen

> +		 */
> +		with_intel_runtime_pm(runtime_pm, wakeref)
> +			ret = deregister_context(ce, ce->guc_id);
> +	} else {
> +		with_intel_runtime_pm(runtime_pm, wakeref)
> +			ret = register_context(ce);
> +	}
> +
> +	return ret;
>   }
>   
>   static int guc_context_pre_pin(struct intel_context *ce,
> @@ -443,36 +813,139 @@ static int guc_context_pre_pin(struct intel_context *ce,
>   
>   static int guc_context_pin(struct intel_context *ce, void *vaddr)
>   {
> +	if (i915_ggtt_offset(ce->state) !=
> +	    (ce->lrc.lrca & CTX_GTT_ADDRESS_MASK))
> +		set_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
> +
>   	return lrc_pin(ce, ce->engine, vaddr);
>   }
>   
> +static void guc_context_unpin(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	unpin_guc_id(guc, ce);
> +	lrc_unpin(ce);
> +}
> +
> +static void guc_context_post_unpin(struct intel_context *ce)
> +{
> +	lrc_post_unpin(ce);
> +}
> +
> +static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> +{
> +	struct intel_engine_cs *engine = ce->engine;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
Use ce_to_guc?

> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
> +	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	set_context_destroyed(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	deregister_context(ce, ce->guc_id);
> +}
> +
> +static void guc_context_destroy(struct kref *kref)
> +{
> +	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> +	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
> +	struct intel_guc *guc = &ce->engine->gt->uc.guc;
Also ce_to_guc?

> +	intel_wakeref_t wakeref;
> +	unsigned long flags;
> +
> +	/*
> +	 * If the guc_id is invalid this context has been stolen and we can free
> +	 * it immediately. Also can be freed immediately if the context is not
> +	 * registered with the GuC.
> +	 */
> +	if (context_guc_id_invalid(ce) ||
> +	    !lrc_desc_registered(guc, ce->guc_id)) {
> +		release_guc_id(guc, ce);
> +		lrc_destroy(kref);
> +		return;
> +	}
> +
> +	/*
> +	 * We have to acquire the context spinlock and check guc_id again, if it
> +	 * is valid it hasn't been stolen and needs to be deregistered. We
> +	 * delete this context from the list of unpinned guc_ids available to
> +	 * stole to seal a race with guc_lrc_desc_pin(). When the G2H CTB
stole -> steal

> +	 * returns indicating this context has been deregistered the guc_id is
> +	 * returned to the pool of available guc_ids.
> +	 */
> +	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	if (context_guc_id_invalid(ce)) {
> +		__release_guc_id(guc, ce);
> +		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +		lrc_destroy(kref);
> +		return;
> +	}
> +
> +	if (!list_empty(&ce->guc_id_link))
> +		list_del_init(&ce->guc_id_link);
> +	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +
> +	/*
> +	 * We defer GuC context deregistration until the context is destroyed
> +	 * in order to save on CTBs. With this optimization ideally we only need
> +	 * 1 CTB to register the context during the first pin and 1 CTB to
> +	 * deregister the context when the context is destroyed. Without this
> +	 * optimization, a CTB would be needed every pin & unpin.
> +	 *
> +	 * XXX: Need to acqiure the runtime wakeref as this can be triggered
FIXME rather than XXX?

> +	 * from context_free_worker when not runtime wakeref is held.
when runtime wakeref is not held

> +	 * guc_lrc_desc_unpin requires the runtime as a GuC register is written
> +	 * in H2G CTB to deregister the context. A future patch may defer this
> +	 * H2G CTB if the runtime wakeref is zero.
> +	 */
> +	with_intel_runtime_pm(runtime_pm, wakeref)
> +		guc_lrc_desc_unpin(ce);
> +}
> +
> +static int guc_context_alloc(struct intel_context *ce)
> +{
> +	return lrc_alloc(ce, ce->engine);
> +}
> +
>   static const struct intel_context_ops guc_context_ops = {
>   	.alloc = guc_context_alloc,
>   
>   	.pre_pin = guc_context_pre_pin,
>   	.pin = guc_context_pin,
> -	.unpin = lrc_unpin,
> -	.post_unpin = lrc_post_unpin,
> +	.unpin = guc_context_unpin,
> +	.post_unpin = guc_context_post_unpin,
>   
>   	.enter = intel_context_enter_engine,
>   	.exit = intel_context_exit_engine,
>   
>   	.reset = lrc_reset,
> -	.destroy = lrc_destroy,
> +	.destroy = guc_context_destroy,
>   };
>   
> -static int guc_request_alloc(struct i915_request *request)
> +static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>   {
> +	return new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> +		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id);
> +}
> +
> +static int guc_request_alloc(struct i915_request *rq)
> +{
> +	struct intel_context *ce = rq->context;
> +	struct intel_guc *guc = ce_to_guc(ce);
>   	int ret;
>   
> -	GEM_BUG_ON(!intel_context_is_pinned(request->context));
> +	GEM_BUG_ON(!intel_context_is_pinned(rq->context));
>   
>   	/*
>   	 * Flush enough space to reduce the likelihood of waiting after
>   	 * we start building the request - in which case we will just
>   	 * have to repeat work.
>   	 */
> -	request->reserved_space += GUC_REQUEST_SIZE;
> +	rq->reserved_space += GUC_REQUEST_SIZE;
>   
>   	/*
>   	 * Note that after this point, we have committed to using
> @@ -483,56 +956,47 @@ static int guc_request_alloc(struct i915_request *request)
>   	 */
>   
>   	/* Unconditionally invalidate GPU caches and TLBs. */
> -	ret = request->engine->emit_flush(request, EMIT_INVALIDATE);
> +	ret = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>   	if (ret)
>   		return ret;
>   
> -	request->reserved_space -= GUC_REQUEST_SIZE;
> -	return 0;
> -}
> +	rq->reserved_space -= GUC_REQUEST_SIZE;
>   
> -static inline void queue_request(struct i915_sched_engine *sched_engine,
> -				 struct i915_request *rq,
> -				 int prio)
> -{
> -	GEM_BUG_ON(!list_empty(&rq->sched.link));
> -	list_add_tail(&rq->sched.link,
> -		      i915_sched_lookup_priolist(sched_engine, prio));
> -	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> -}
> -
> -static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> -				     struct i915_request *rq)
> -{
> -	int ret;
> -
> -	__i915_request_submit(rq);
> -
> -	trace_i915_request_in(rq, 0);
> -
> -	guc_set_lrc_tail(rq);
> -	ret = guc_add_request(guc, rq);
> -	if (ret == -EBUSY)
> -		guc->stalled_request = rq;
> -
> -	return ret;
> -}
> -
> -static void guc_submit_request(struct i915_request *rq)
> -{
> -	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> -	struct intel_guc *guc = &rq->engine->gt->uc.guc;
> -	unsigned long flags;
> +	/*
> +	 * Call pin_guc_id here rather than in the pinning step as with
> +	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> +	 * guc_ids and creating horrible race conditions. This is especially bad
> +	 * when guc_ids are being stolen due to over subscription. By the time
> +	 * this function is reached, it is guaranteed that the guc_id will be
> +	 * persistent until the generated request is retired. Thus, sealing these
> +	 * race conditions. It is still safe to fail here if guc_ids are
> +	 * exhausted and return -EAGAIN to the user indicating that they can try
> +	 * again in the future.
> +	 *
> +	 * There is no need for a lock here as the timeline mutex ensures at
> +	 * most one context can be executing this code path at once. The
> +	 * guc_id_ref is incremented once for every request in flight and
> +	 * decremented on each retire. When it is zero, a lock around the
> +	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
> +	 */
> +	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
> +		return 0;
>   
> -	/* Will be called from irq-context when using foreign fences. */
> -	spin_lock_irqsave(&sched_engine->lock, flags);
> +	ret = pin_guc_id(guc, ce);	/* returns 1 if new guc_id assigned */
> +	if (unlikely(ret < 0))
> +		return ret;;
;;

> +	if (context_needs_register(ce, !!ret)) {
> +		ret = guc_lrc_desc_pin(ce);
> +		if (unlikely(ret)) {	/* unwind */
> +			atomic_dec(&ce->guc_id_ref);
> +			unpin_guc_id(guc, ce);
> +			return ret;
> +		}
> +	}
>   
> -	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
> -		queue_request(sched_engine, rq, rq_prio(rq));
> -	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
> -		tasklet_hi_schedule(&sched_engine->tasklet);
> +	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
>   
> -	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +	return 0;
>   }
>   
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
> @@ -606,6 +1070,46 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
>   	engine->submit_request = guc_submit_request;
>   }
>   
> +static inline void guc_kernel_context_pin(struct intel_guc *guc,
> +					  struct intel_context *ce)
> +{
> +	if (context_guc_id_invalid(ce))
> +		pin_guc_id(guc, ce);
> +	guc_lrc_desc_pin(ce);
> +}
> +
> +static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +
> +	/* make sure all descriptors are clean... */
> +	xa_destroy(&guc->context_lookup);
> +
> +	/*
> +	 * Some contexts might have been pinned before we enabled GuC
> +	 * submission, so we need to add them to the GuC bookeeping.
> +	 * Also, after a reset the GuC we want to make sure that the information
reset of the GuC

> +	 * shared with GuC is properly reset. The kernel lrcs are not attached
LRCs

> +	 * to the gem_context, so they need to be added separately.
> +	 *
> +	 * Note: we purposely do not check the error return of
check the return of gldp for errors
> +	 * guc_lrc_desc_pin, because that function can only fail in two cases.
> +	 * One, if there aren't enough free IDs, but we're guaranteed to have
> +	 * enough here (we're either only pinning a handful of lrc on first boot
LRCs and same on line below

> +	 * or we're re-pinning lrcs that were already pinned before the reset).
> +	 * Two, if the GuC has died and CTBs can't make forward progress.
> +	 * Presumably, the GuC should be alive as this function is called on
> +	 * driver load or after a reset. Even if it is dead, another full GPU
GPU -> GT

> +	 * reset will be triggered and this function would be called again.
> +	 */
> +
> +	for_each_engine(engine, gt, id)
> +		if (engine->kernel_context)
> +			guc_kernel_context_pin(guc, engine->kernel_context);
> +}
> +
>   static void guc_release(struct intel_engine_cs *engine)
>   {
>   	engine->sanitize = NULL; /* no longer in control, nothing to sanitize */
> @@ -718,6 +1222,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   
>   void intel_guc_submission_enable(struct intel_guc *guc)
>   {
> +	guc_init_lrc_mapping(guc);
>   }
>   
>   void intel_guc_submission_disable(struct intel_guc *guc)
> @@ -743,3 +1248,62 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> +
> +static inline struct intel_context *
> +g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> +{
> +	struct intel_context *ce;
> +
> +	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
> +		drm_dbg(&guc_to_gt(guc)->i915->drm,
> +			"Invalid desc_idx %u", desc_idx);
Agree these should not be BUG_ONs or similar, but a drm_err seems 
appropriate. If either this or the error below occurs the something has 
gone quite wrong and it should be reported.

> +		return NULL;
> +	}
> +
> +	ce = __get_context(guc, desc_idx);
> +	if (unlikely(!ce)) {
> +		drm_dbg(&guc_to_gt(guc)->i915->drm,
> +			"Context is NULL, desc_idx %u", desc_idx);
> +		return NULL;
> +	}
> +
> +	return ce;
> +}
> +
> +int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> +					  const u32 *msg,
> +					  u32 len)
> +{
> +	struct intel_context *ce;
> +	u32 desc_idx = msg[0];
> +
> +	if (unlikely(len < 1)) {
> +		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
As above, should be a drm_err I would say.

> +		return -EPROTO;
> +	}
> +
> +	ce = g2h_context_lookup(guc, desc_idx);
> +	if (unlikely(!ce))
> +		return -EPROTO;
> +
> +	if (context_wait_for_deregister_to_register(ce)) {
> +		struct intel_runtime_pm *runtime_pm =
> +			&ce->engine->gt->i915->runtime_pm;
> +		intel_wakeref_t wakeref;
> +
> +		/*
> +		 * Previous owner of this guc_id has been deregistered, now safe
> +		 * register this context.
> +		 */
> +		with_intel_runtime_pm(runtime_pm, wakeref)
> +			register_context(ce);
> +		clr_context_wait_for_deregister_to_register(ce);
> +		intel_context_put(ce);
> +	} else if (context_destroyed(ce)) {
> +		/* Context has been destroyed */
> +		release_guc_id(guc, ce);
> +		lrc_destroy(&ce->ref);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 943fe485c662..204c95c39353 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -4142,6 +4142,7 @@ enum {
>   	FAULT_AND_CONTINUE /* Unsupported */
>   };
>   
> +#define CTX_GTT_ADDRESS_MASK GENMASK(31, 12)
>   #define GEN8_CTX_VALID (1 << 0)
>   #define GEN8_CTX_FORCE_PD_RESTORE (1 << 1)
>   #define GEN8_CTX_FORCE_RESTORE (1 << 2)
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 86b4c9f2613d..b48c4905d3fc 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -407,6 +407,7 @@ bool i915_request_retire(struct i915_request *rq)
>   	 */
>   	if (!list_empty(&rq->sched.link))
>   		remove_from_engine(rq);
> +	atomic_dec(&rq->context->guc_id_ref);
>   	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
>   
>   	__list_del_entry(&rq->link); /* poison neither prev/next (RCU walks) */

