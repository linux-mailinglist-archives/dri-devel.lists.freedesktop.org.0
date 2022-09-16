Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB35BACEB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 14:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B04310E218;
	Fri, 16 Sep 2022 12:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB9410E218;
 Fri, 16 Sep 2022 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663329816; x=1694865816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=368c7NLkg7sbZyPOZ6OJs5Amevwpg54OncqFRe2qe7U=;
 b=lh52/iwcnFEMkn0pAdRSKclh/uoJ/WQvKP655NO9P8J9fNaCudj0iVZE
 m+wRpxSp2/eUcfWy2VJou3Y9gU5zZ3nRMq8gqKPQ/5SMfNHK4ZVfbEbTP
 ccEqEJpFqqoUio/7PSOIeenI/K6WEvcycEnrWMOSkkXgDsp95OT8XTSJY
 QaCh7/pw4nrZFDAhER7OIUJrarT6+KiR7Eye1Y4HNyk9cE6ivIVh8jNw3
 /8Q44EsnoT6ybhsPh86Hu1aZaI166xj8BBWO3SDXrckDEf9A22iEm8B5F
 7Wa0TpmN/uR0Keq4UmRHa2IC3LaG8dtHIqJBUgS6oGIuf7irXDJnpalAi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="282004179"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="282004179"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="679941706"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2022 05:03:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:03:34 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 16 Sep 2022 05:03:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 16 Sep 2022 05:03:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 16 Sep 2022 05:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beGDhe5j4lXVHOSsA7vGV9bgcSTeK6gUzo9mIpOXviOVpgsFw1jF4sWHmr2TcAxv6koU6iHcl668mWgxmkxmLem7q1sQHqAEfH7sQbgo0czL+VUUiNC7wlUg5P63opAx+xPM+PwUjXS9A5bS+IH38WW/aLGNVzFvPvK7regI8sln6XvqXt/gcODiYOPS0Bix9wpQ1w4xrQ8fuJFhez/TtR6Nj98IMnjXReL4ht25zrTu8qrg8J0DVgmbfNKOVoUE5oKoE74pENvUsD9vJ8uywxP6aCXwWCvF0Q/6Rj8S3igmIdEfBmOdqpQ/PudpjsYeUA6zrDW2M28lKH9piz8gRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5u4Nde2w51enlZ8U1zyxrfac6Ksv3wEIHNER5nVOBE=;
 b=deaO6GrXPC6tlWPmq6c9lswg6KBjg9ShxDk/4TbkkjtJ1EGUoIpQsEutwrB0tbnJe3FlS654/SsjFdPuOvQuwtIF/lskL45EEYB94ly1QMGyiFw6D8syLj7vheNwsqFVE1/JRjIY/pyhEBAJ5fmvT/JR8TH4+36IkjgiSrPzIea08TiuG40QZQ6Cy+UGAsoy/zud225M22bb3xQQ6w8qzFukCQ+ZSpBNqq0lBVHXSEuf017qACaVrKyq7jF7WGVK1fHKP9x/gFSpggKqGh6qLIRmjwZ3JrZWQHdvfFhTca2DRMpyIowlB+nuetweqO7OY/Dg0b0VDKtThZGaY5+d8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 12:03:32 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%7]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 12:03:32 +0000
Message-ID: <b097de87-ab68-2d3d-e0bf-420549eb10d4@intel.com>
Date: Fri, 16 Sep 2022 15:03:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915/gem: Flush contexts on driver
 release
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220916092403.201355-1-janusz.krzysztofik@linux.intel.com>
 <20220916092403.201355-2-janusz.krzysztofik@linux.intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220916092403.201355-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0719.eurprd06.prod.outlook.com
 (2603:10a6:20b:49f::23) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|PH8PR11MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 51bad018-1201-4eea-8959-08da97db7983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9swyL5qsPxOJUmBxfw27rzdOTl6xgX73QIX8I22tnszMBLR0G2wjJ2G1xYTWT0hSfhr6y2yeEDTEXmk4wMoqazHi9DqgX4QKtSJrCPpSAyaWE+wjA8haPMoZgjycsIlUuFYxS/kJ9U5fzWjoQckam9Zf3pzOF7wzeldcIBi58fRu9cu7+MrIpfRTeUaLp6ZZ/Sv2vRaW8ctS2lrCmPC3pGAVNRQWMS11PwhO0zxIFgpysCmFjmndMg45O0tdcJmF+6OYliNaMyk1IKs9/XbPaau528wUELehG6pRP3QA60ZHPvlInlJ251jLPx5n7Gbyp6BMHCDMavddIIdjafVft11DGIM8YefuR36ARIV+S/PTkZOwQJ4MUGqsKnvvPg30ZzmMUF4h4s+vtqzjHAZYAyIT1mxG6qdi9qyhYA/xPMmrJgn+t6NydqOb3uTLKKgcJjj4MUl/dU0dzB77FEpr2ybpoSunwOf0uGBOiWJBXNOS5cuhasHcTcjvuTl28I9YjnjNBYsRoWqbuYE13+hG87TIb4O/p+T33PWkNESnsgwavR+pe9sfrWSW0rFD6sDptuvlIrmzwu3sWGuDK75KEz1BIOR0c8ruO2j/3sHaIF3ZM1f9tMoMHOXBHIgYXtQidkFoPS2yPIym0YjR94DgJUiIVueGj3CBWwZPlouOJEer3BfTy6D0KO/UsMgGj8UEPn1GdXH/hxeW22Yd89KwawKcIxTt9I39OqxFgI6GGpRDP1JKZxSfnS6uvxAOIqhxUYNDK9w2Xq//vb/0O9ZQ9QH3Q0uYmjUO9jNGUn25eE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(41300700001)(8936002)(2906002)(86362001)(66946007)(36756003)(4326008)(66476007)(66556008)(8676002)(31686004)(83380400001)(6506007)(26005)(6512007)(31696002)(316002)(54906003)(6666004)(5660300002)(82960400001)(186003)(53546011)(2616005)(478600001)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJBUk92eklSdTkxVWNLR1JwRkk4WTduUWFhNUlIVkJ4UEV5MnNhL0VPSmlM?=
 =?utf-8?B?SzU3d1B5YVJjUElWVDZFdmFtb0pMVjFMLzhZOEtGL2xIL3p2MjFnc1dVajBa?=
 =?utf-8?B?RGo0V0UyRmNUSVBYbGJZYnFFazk0dVFDK1ZoNXdMdkRmZnc4T3NpYVFjMVZ5?=
 =?utf-8?B?enVxRlNCUFBnUVkxK1RqUEpIT2NHak9FNVZKM2dib0xQTFlwWHFxRGZObkVq?=
 =?utf-8?B?R3FwTWdnTzNJZjNOeVJMNHpqU2lNNEFQNUJrRDVGSWpkbGh3bnRjWE9zVllr?=
 =?utf-8?B?NjQySVlEa3FVVWFrMlJ4aU9ENTJOOW5yK2tzcjl6MW1xUzNPNU0wM3F1MHNs?=
 =?utf-8?B?Q2tBbSs1MlNLMHRkMGVXbVBlSXNma2Y2dHFBSmpCUnJ2bmF0Zk5ualYvaXdG?=
 =?utf-8?B?ODd1aGRzbmxWbEJ1S3BkYkZhMjFmUEJ3M09qMzlJQlZsSmZOQWM0dWxEUjQz?=
 =?utf-8?B?TVR2VUYvdGM1MlR2VmdzMmJ6djZna2tmZWoxSk1TeElVQnhGQzhFamVxZXdn?=
 =?utf-8?B?S2UwS2JSdlJ5NmloR1hGait1eHpvamFkK2JkRWlRVzUra1NNZHdZL3R4a1M2?=
 =?utf-8?B?ajFEcmVYNjZ3NFd0RTV3N1BsMHNIY08vME0rSFpneGNnRW1mV1A1d2xGMkha?=
 =?utf-8?B?Slk4K0txOWpqWlNxWEY5KzJHVlBZcGRybFRYSHFCZUh6cEtxZnpWS1NFTmF3?=
 =?utf-8?B?YVJUSXhURytIZytiVlZWQS9icHZNZXhJbThXUCtiL29XMitVa0tzZUdlYXRm?=
 =?utf-8?B?UE52bCtyVEZyM3hMVjZQc0E5RDFVZGhobXZRL2FZZXpPbjRSdnZXM0JVdVFk?=
 =?utf-8?B?bUE2b1dXYUdFR0lzVTdWTm5EZmlpdGZlTzczT0tONGx6VXE0bWxBTFk0UFJh?=
 =?utf-8?B?MXozSmhNU0FLY2dUeFRvbGMzSjVaaHBzcGRwZWZCUnFUNG9PVllidXFlRTNF?=
 =?utf-8?B?OFkrTml6bEdmYnVHa0N0YzFTaGdxUjFPVTF4VzExbVFLc0c4RHhFZ3JwS2I3?=
 =?utf-8?B?NDRnWUc5NHhHaGdoamNaT1pQWnJ3bFdoKzZ2YUxXYzFEd0ZGRldQRE9heEkr?=
 =?utf-8?B?OGMxTXVNemJmbUoxSm9UazVFQW5mZXVhUHZZWXVzaGhSTVhHV0w2c2c3YzV6?=
 =?utf-8?B?QVMvdzB6enVBeldXdVNYOEF3amVDTUYxdmdubEZjODNuQzJwa1g0d2h2ckRu?=
 =?utf-8?B?bU5rK05jWEIvS1VtQUpKZTlUcm41TWc0dGZnUjEyRDdUQk5MZTBWMGRkRmxR?=
 =?utf-8?B?aGMyUGxSNmZuMGk5ZFJkOE0rQXNJSWxCZGJYcTVMaXovM0FoMmg2VDJUT1dr?=
 =?utf-8?B?TUwwbzlQU1Q3NlI0bVRJUzVBODgyUmdMN1JIVUtVaUlTNlIxYlM3U3NCSUQ0?=
 =?utf-8?B?UWpiOHFxS2pGcVA4UmgvU0ZaTE45MCs4UnZKQnZQNnJDQ3JkN042QTdRQXp1?=
 =?utf-8?B?anpoUHdReDM1QWRUbkQ5d0lOcHBoMU5RY29QOTI0R1ltS1drOUtoNXBmTXZE?=
 =?utf-8?B?Y283a0ZqUVIvS1lrck9VMGxHSGtITmZqYWtIaTNOc0NCUmpsUFJTaVMrbUp1?=
 =?utf-8?B?WUFrdjVub0JZTlQ4c3ZodXBmRTZSQWUrS0oyalMvOGgzTFhrNnd5TTFnRkJw?=
 =?utf-8?B?NnkvREQrZU5HUXU0dytHYlpBVzRSakNUY1NpRllIdTR1bDB5T2l1UkFFM2U0?=
 =?utf-8?B?Rndoem9RNmpJVkNNd3MwYmR6TFhHVGgyRFRDRDkxbTJ5dFFSbVZIcnJERWow?=
 =?utf-8?B?M01JZDhvV1UzWVQ2SVU3cjNXUThTN1h1OUlRQ2d0SjlFc1hOWVNGeUZmMHpx?=
 =?utf-8?B?YVUyWFo0aEEwNm5XRWFRM2dMZEQ4bkYvK3dSTTBZUmM4ZDNwS3MwV0pSb2lu?=
 =?utf-8?B?WnczWG5CM2ZESStmWko3NjZoMEp2V09pdjUyT3NUZ3I1b3pZSnExSG9oV2tT?=
 =?utf-8?B?ZjJqemFnMFZ6eE94azJuTElqWTZuTGxITEVxL1FyN3pVT0VzcFBkdU1QSGJL?=
 =?utf-8?B?WnpHRU1CQi9ISURIU1BVVmR4VDFxc21henliLzVDRVk0RHVYeUNNVE9ZZ2gv?=
 =?utf-8?B?bllmUWptandjbzk0Z1U5b213VU93aFU5WTdxcHM1U1FKRkowczlXblZWbnVQ?=
 =?utf-8?B?VitOK0hqNjI3QXYrT1p0K0kyaE4rNUxNengwU0ZXQXZUTERMK1FzTnJFVjQx?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bad018-1201-4eea-8959-08da97db7983
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 12:03:32.2234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Get7cfxg0Fjp5mFd0/Ej1ymPxaztRXE9uoaRgj+oLD0aQp7GUmLTJUjCgppuF3FopH8B8dU+uSAWDcxTzXe6aQmoU2rJ8qX0fMZDlA3T2PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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
Cc: dri-devel@lists.freedesktop.org, Chris
 Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 9/16/22 12:24 PM, Janusz Krzysztofik wrote:
> Due to i915_perf assuming that it can use the i915_gem_context reference
> to protect its i915->gem.contexts.list iteration, we need to defer removal
> of the context from the list until last reference to the context is put.
> However, there is a risk of triggering kernel warning on contexts list not
> empty at driver release time if we deleagate that task to a worker for
> i915_gem_context_release_work(), unless that work is flushed first.
> Unfortunately, it is not flushed on driver release.  Fix it.
> 
> Instead of additionally calling flush_workqueue(), either directly or via
> a new dedicated wrapper around it, replace last call to
> i915_gem_drain_freed_objects() with existing i915_gem_drain_workqueue()
> that performs both tasks.
> 
> Fixes: 75eefd82581f ("drm/i915: Release i915_gem_context from a worker")
> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@kernel.org # v5.16+
> ---
>   drivers/gpu/drm/i915/i915_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index c8e14ed9c2a96..172c29a15f118 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1195,7 +1195,8 @@ void i915_gem_driver_release(struct drm_i915_private *dev_priv)
>   
>   	intel_uc_cleanup_firmwares(&to_gt(dev_priv)->uc);
>   
> -	i915_gem_drain_freed_objects(dev_priv);
> +	/* Flush any outstanding work, including i915_gem_context.release_work. */
> +	i915_gem_drain_workqueue(dev_priv);
>   
>   	drm_WARN_ON(&dev_priv->drm, !list_empty(&dev_priv->gem.contexts.list));
>   }
