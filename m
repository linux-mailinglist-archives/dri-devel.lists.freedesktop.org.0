Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BA40A179
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03A6E2C0;
	Mon, 13 Sep 2021 23:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E746E2B8;
 Mon, 13 Sep 2021 23:19:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="219942535"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="219942535"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="481539770"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 13 Sep 2021 16:19:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 16:19:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 16:19:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 16:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxeybE56Ow5iLmOELy1PYz7vcsheKM5twy//x5TiIMhdkNGGA3HbiPA4UdRqATUbRry9HUvUxjzlJ/5zUPG42JoNiUkjvoKubpFq1CGLm5xEQHr2lNoosch32+9hL5dRfQMyVRXCuHfTIiVIJ2oB7ql14kRiR/rZrZ5dCgR8tcjjD73y0QZct/tJ837Y+i6XQ6QrX6L9VGMdOa/okUXultenjhBn7LrZXmJc7yxJRHvxfz65vKvaku4OmqGd2sjFG/IL4s+o7YDzzjd7KaTvsP/zual6pd6jZ4qhu8nrKBt9Ds/AvclKVuJkLVcza16HB4388Bn/tocM8fGU+ivrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Y0l9pjzhBGAhGJZP2+m2A4fBqvP9tcZKr6MzVckCtho=;
 b=GGLA7rWk8MHecWEDXnED8aU676oqCQI1nPJTdMlDsWmBLAm6uPT/4Ywv2kq1RKAtfP3lG6dtkh2ZIRvKFwj5RU/L7PCrySWPi2EdNgnMGjMyxQCJ68gIPJc0Mu6HGZj+gNs85Xp/uv+AlCSv62opTAFzaCI7tPXQcHwLwiVrUDg4gYnEkSukaA0hY9nny/yfKKb5Pgbs9992OikTxc3u7WjMTHU2PyjpxZXFf9z0nXZmeXV4KjJFuad+BJ+ZTBoIA7BKNKwif+hrDUEqE28yNy7UhbNDEbmdEUVcij66uXjGof9J8GaxH4zANINPP+xPIUBhn9IL/JfrCiYi/bPnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0l9pjzhBGAhGJZP2+m2A4fBqvP9tcZKr6MzVckCtho=;
 b=hlGSCzXayvw1iCqutOdyHMmmCG0dK0K70gx3scxp31L8Fga48Iyr+IG6ulxewmqgmQu6/JAaIk0UlUPKz7cuz6XSJdf7jg5zeTrisa/8JRuyiQvZf+v+a77PHUmquEqqwIERtbY8SsOJ/V+F5vl+GYpyjTLBIKpqOzxD1a9v5w8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Mon, 13 Sep
 2021 23:19:04 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 23:19:04 +0000
Subject: Re: [Intel-gfx] [PATCH 10/27] drm/i915/guc: Introduce context
 parent-child relationship
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-11-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <721d6ceb-eb16-a2dd-fa9f-517a3e389167@intel.com>
Date: Mon, 13 Sep 2021 16:19:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-11-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0077.namprd04.prod.outlook.com
 (2603:10b6:303:6b::22) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0077.namprd04.prod.outlook.com (2603:10b6:303:6b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 23:19:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2723e020-f9f9-4fe8-1deb-08d9770ce086
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB565749A5241DEF16187F374DBDD99@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLNYV3ZdTRcGbsG5pwwBCOeonygwwq1AlPpVYPHBKO7fAf/HIeumKihurdkkH/M9jkdms9wzi3zfAUie5GalnoXaNptFHjcuTzKKZR/1cI7o7AR3CWz0ZD+AQBJic+mOKvO4AdHUqLJoF8/YxahwPeGDFSSxdQdYJ17qAgriXXnp+L6WybexxZaIQVl2b2ANAnpai15Q+vDdlalLQnkaT8o1ByJ318PoXBghqEIwr8gXnmWfhYE4SdkPslo/jao8W7nxtxzTiGVUkPOLaltth5t4VlYIF9rPN4RXRLC5uConubwQIByyfHWBl0ZyCS5JiKronvAnx0pblFjubOsqxFeQRyXCxV7tu3LjHcFYwDUT1xKIsLQPRkRmW0vrPE14mScMNoVgogRl994eFuWeVk5pNn4UGa64E62usOvPv+kOkKilnj3K8IUaPZz+GSziBbCIobA4RjsdjCVVXpGGeDO5/2+fC2PDixLjONk7uynGvuy+C7cxEIsjViCVWT2a0lBgYaT+TCeen9dCPUtKVHmKzyVKcSHi1jsOFNgGrVWttXQmL1chp+NhyHSHgh+MTzTyj/jnEMnf01IX7ocf2Ptwd7qQOGgVbxGQJahkUTCn5eECWrBmhryNnxkWL8OBIMFAfJjc9q0t+u4IseSJ/LwRyeF+PlaOjuebMzjEJhsWN/0xFI8YSf9b5ANfGHSJSkFF0FFEGfK2uBT7fJogmXD3xefzRNNqYIC+jFcbJd71WK9Asiz979e97EgT/DxAMTleGmYKW6Z7tJ1gXH+6rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(26005)(31686004)(16576012)(316002)(66556008)(186003)(2906002)(107886003)(86362001)(5660300002)(66476007)(6486002)(8676002)(956004)(8936002)(83380400001)(31696002)(4326008)(66946007)(508600001)(36756003)(2616005)(53546011)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzd2RXRPazNkTDFENUN2OElsRlovWEdDenhTYW9OOEZQbWRxdEFHcGFMTEtX?=
 =?utf-8?B?cEkwaUowZ1dEbCtaTWNnMUJUTS9YSHJQZWNJaEpIeWN4Z1dUOHkrUHBZcWFn?=
 =?utf-8?B?NU1BMVUrSkR6LzJ1c1o2bG5MTVAzZFkra0hqZ1UyTXl3R2FoOGd3cktGcUw1?=
 =?utf-8?B?YmZqRzRZNnhMOW5uekwzN2NyWWxscGc5Q2wzV092TmdxSmJ3Sjd5cnNpNklT?=
 =?utf-8?B?UHEvdUNNTGJqUWdHV2xvTEwxRVVCSmhOdHFEbkM4aXVIaEdJRU5Nd0lELzBG?=
 =?utf-8?B?NkIxWVRiZUt4dzNaWUpPV3lzeGRjQ3JZYk9qNURGMzNhQ3BpaGQ5bnhvM2VO?=
 =?utf-8?B?VlFhdno5bTcyQTlJaFdDWmFycDAvY0M1eGdtQWc4TzZxYUliMEw2QmZkR3h5?=
 =?utf-8?B?NVNQRXdIN0hwZ3NYZHI2YXNzNVl3aVJuVFB2WWNXcmpKc0grUDB0Ymt5Q0lW?=
 =?utf-8?B?WGJpbzZKY1pSYUkzd2Y4N2VvS1pPRHRzUjdua0tyUUlxQ09DcnZjNTNzNlpa?=
 =?utf-8?B?U2RLZnNmWGUrZWpUUWo1RVVYaFBFZDdCVTZ5WXRXNTJTQmdLd0xSYlF0Vm1x?=
 =?utf-8?B?dVBMbk9zdzBmRDlEQWNyRjBIUitPdDdYODhnTWFHMmJXbE5sZG83MDIzZGlD?=
 =?utf-8?B?b2tiaFp2b255OENndGEwcW11UHp0aFp2NG12cFJ6NDFPQUl0RjJaYVMwMmMz?=
 =?utf-8?B?VmVuSEZUekUrYU5pcTBGeVN0RlhhL3pYYkVLTE1FelowTGhaTDY2QkhOZ0xD?=
 =?utf-8?B?WVdDRHJ0MEx1SGFEeHpib0hpL1d5cmVXd2F4eWxEWjJ6V01DRGNjRUpXSkJR?=
 =?utf-8?B?c0pLbnhlWWk0Q0ZNWHcvWTJDcnhadU40alhYclpaNWRvbVdDbExBN29sSitm?=
 =?utf-8?B?UlpFZHBJUlljMUFmYzdNUjBsRUh5dEc2d3FnSUhOeGpnVFRJT0xkek9BbURx?=
 =?utf-8?B?dEIxRDF4K2xsMFg0QkhBWHA4em5PR3d4Q3dmaU9GU0hFeWx3Nk5tV29WdEQ1?=
 =?utf-8?B?cnNRMVA2U2R6cS9xMFBqdUxySjhnK2h1Yk9qYUpKNEVNRlVBVGg3ek95OWF4?=
 =?utf-8?B?b2FwdURtRVNjNUp5dGRNZE54aUhNOEtaWXdYZ2tUakFrdndPQ3piZDRFVmpR?=
 =?utf-8?B?azZHcnRoRFlCRFZ5TmdCTDdJaHVXdXordkU3bU9LeG5RWUtyNmo1S0NBUFNU?=
 =?utf-8?B?bEYxQVd0R2pIeE54bFdJRGJlRUlDM0NpeFhPRUNsMExOSVg0TW1UZ0poRWVz?=
 =?utf-8?B?aTVPcjBWMmNPM0FJUVpqWTNRcW5XWjVnVVorMzNTeHlCRVA3TTFNbENzYlBp?=
 =?utf-8?B?aElJYkgwaFQzR2lKT1R3TjJkS0JvZjJpc1RMS1JXVExMMDI3amxoaDBOaUJy?=
 =?utf-8?B?T2FUbmNXaXdYT0p3UVUxUkhoTG9ETDAySVZXcWNOT2ZXOGJzeHdlUDU3YkJJ?=
 =?utf-8?B?ZWZ4dEJhVFQyeGFzZFE4QlZuM25kL0N4UTRFdHE5OWttY3dBSmE1MnFzNXo1?=
 =?utf-8?B?Q0toRVlqcXliMHlMejV4OTlPNXNleklUNzBMa3MwdnhDU1hZc2E5WnVuY3ht?=
 =?utf-8?B?YVNlYVVuVi9ZV3NkN0drOWtKYXBnRU1nV2V0TDVPMVNQbE9JUDNzaUtUbGg1?=
 =?utf-8?B?U1Y5MXJDdEFmcnVwWTUrSFJ4aSs3Qzhvb0RMbUM3MkVvTUIvbWtBNFN4THRh?=
 =?utf-8?B?Y21rcjAzVFAvTjR0RG5ZcDJDQzIzaWo0WjRLMlUxcHA2Z2ptbWFLZEYvVWh6?=
 =?utf-8?Q?uf38qZQQQel0E4mKlrRkN6HMbC0/bjjJa+BpXGC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2723e020-f9f9-4fe8-1deb-08d9770ce086
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 23:19:04.2263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEyBO9xrMFzolByu+fXw6NEwBf4yfpkcZgIN/w3MiQfBggXiluwQxjg1LCegZLihcBbIgnOBPmsTMoZhw467suNW0bsriLujv3iVwmbpFPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Introduce context parent-child relationship. Once this relationship is
> created all pinning / unpinning operations are directed to the parent
> context. The parent context is responsible for pinning all of its'
> children and itself.
>
> This is a precursor to the full GuC multi-lrc implementation but aligns
> to how GuC mutli-lrc interface is defined - a single H2G is used
> register / deregister all of the contexts simultaneously.
>
> Subsequent patches in the series will implement the pinning / unpinning
> operations for parent / child contexts.
>
> v2:
>   (Daniel Vetter)
>    - Add kernel doc, add wrapper to access parent to ensure safety
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 29 ++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_context.h       | 39 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_context_types.h | 23 +++++++++++
>   3 files changed, 91 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 508cfe5770c0..00d1aee6d199 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -404,6 +404,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   
>   	INIT_LIST_HEAD(&ce->destroyed_link);
>   
No need for this blank line?

> +	INIT_LIST_HEAD(&ce->guc_child_list);
> +
>   	/*
>   	 * Initialize fence to be complete as this is expected to be complete
>   	 * unless there is a pending schedule disable outstanding.
> @@ -418,10 +420,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   
>   void intel_context_fini(struct intel_context *ce)
>   {
> +	struct intel_context *child, *next;
> +
>   	if (ce->timeline)
>   		intel_timeline_put(ce->timeline);
>   	i915_vm_put(ce->vm);
>   
> +	/* Need to put the creation ref for the children */
> +	if (intel_context_is_parent(ce))
> +		for_each_child_safe(ce, child, next)
> +			intel_context_put(child);
> +
>   	mutex_destroy(&ce->pin_mutex);
>   	i915_active_fini(&ce->active);
>   }
> @@ -537,6 +546,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   	return active;
>   }
>   
> +void intel_context_bind_parent_child(struct intel_context *parent,
> +				     struct intel_context *child)
> +{
> +	/*
> +	 * Callers responsibility to validate that this function is used
> +	 * correctly but we use GEM_BUG_ON here ensure that they do.
> +	 */
> +	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
> +	GEM_BUG_ON(intel_context_is_pinned(parent));
> +	GEM_BUG_ON(intel_context_is_child(parent));
> +	GEM_BUG_ON(intel_context_is_pinned(child));
> +	GEM_BUG_ON(intel_context_is_child(child));
> +	GEM_BUG_ON(intel_context_is_parent(child));
> +
> +	parent->guc_number_children++;
> +	list_add_tail(&child->guc_child_link,
> +		      &parent->guc_child_list);
> +	child->parent = parent;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftest_context.c"
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index c41098950746..c2985822ab74 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -44,6 +44,45 @@ void intel_context_free(struct intel_context *ce);
>   int intel_context_reconfigure_sseu(struct intel_context *ce,
>   				   const struct intel_sseu sseu);
>   
> +static inline bool intel_context_is_child(struct intel_context *ce)
> +{
> +	return !!ce->parent;
> +}
> +
> +static inline bool intel_context_is_parent(struct intel_context *ce)
> +{
> +	return !!ce->guc_number_children;
> +}
> +
> +static inline bool intel_context_is_pinned(struct intel_context *ce);
No point declaring 'static inline' if there is no function body?

> +
> +static inline struct intel_context *
> +intel_context_to_parent(struct intel_context *ce)
> +{
> +        if (intel_context_is_child(ce)) {
> +		/*
> +		 * The parent holds ref count to the child so it is always safe
> +		 * for the parent to access the child, but the child has pointer
has pointer -> has a pointer

> +		 * to the parent without a ref. To ensure this is safe the child
> +		 * should only access the parent pointer while the parent is
> +		 * pinned.
> +		 */
> +                GEM_BUG_ON(!intel_context_is_pinned(ce->parent));
> +
> +                return ce->parent;
> +        } else {
> +                return ce;
> +        }
> +}
> +
> +void intel_context_bind_parent_child(struct intel_context *parent,
> +				     struct intel_context *child);
> +
> +#define for_each_child(parent, ce)\
> +	list_for_each_entry(ce, &(parent)->guc_child_list, guc_child_link)
> +#define for_each_child_safe(parent, ce, cn)\
> +	list_for_each_entry_safe(ce, cn, &(parent)->guc_child_list, guc_child_link)
Do these macros not need some kind of intel_context prefix? Or at least 
be 'for_each_guc_child' given the naming of the list/link fields? But 
maybe not if the guc_ is dropped from the variable names - see below.

> +
>   /**
>    * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
>    * @ce - the context
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index fd338a30617e..0fafc178cf2c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -213,6 +213,29 @@ struct intel_context {
>   	 */
>   	struct list_head destroyed_link;
>   
> +	/** anonymous struct for parent / children only members */
> +	struct {
> +		union {
> +			/**
> +			 * @guc_child_list: parent's list of of children
> +			 * contexts, no protection as immutable after context
> +			 * creation
> +			 */
> +			struct list_head guc_child_list;
> +			/**
> +			 * @guc_child_link: child's link into parent's list of
> +			 * children
> +			 */
> +			struct list_head guc_child_link;
> +		};
> +
> +		/** @parent: pointer to parent if child */
> +		struct intel_context *parent;
> +
> +		/** @guc_number_children: number of children if parent */
> +		u8 guc_number_children;
These are not really a GuC specific fields? The parent/child thing might 
only be necessary for GuC submission (although can you say it won't be 
required by any future backend, such as the DRM scheduler?) but it is a 
context level concept. None of the files changed in this patch are GuC 
specific. So no need for 'guc_' prefix? Alternatively, if it all really 
is completely GuC specific then the 'parent' field should also have the 
prefix? Or even just name the outer struct 'guc_family' or something and 
drop the prefixes from all the inner members.

John.

> +	};
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest

