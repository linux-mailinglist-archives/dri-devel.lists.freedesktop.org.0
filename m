Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE026973F8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 02:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F0A10E087;
	Wed, 15 Feb 2023 01:57:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FD210E087;
 Wed, 15 Feb 2023 01:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676426218; x=1707962218;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=siE8s1uSRsJkHWEpY+8BzchRFZ0w9N+178Ju6tNTDDA=;
 b=CraCXaghffNV0VLrloNxyumxrzoGJABLyz8Zw7lml1nkAxfqw5FSsPUd
 KyUFpvIPd3fZjuyETp4mPoIelSfb+gkgvHPf9WCb9wPKWZVwtFjQKBZT7
 TJQQlGa4OpGOGKfndHMVNi7ytLEP08EoS7USOSkZiZYnvp+mLuPqpCOZB
 CrDg4xVUyp3fIa4AqzofNMC6Qpq8yd9NHgdDyA0hbH8xyAM0Gq6p0lvJn
 c9cPedYB78cS4vkiMiclPxoK2LhKIppRuBHlNIgidxL0oOByQgWDCko9H
 G9Y480GTWAtCnxl6meJxO1v+nyHkXLCw8zG7/N6+uw4+qWARhogJp/AI9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="332631928"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="332631928"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 17:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758222200"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; d="scan'208";a="758222200"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 17:56:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 17:56:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 17:56:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 17:56:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfjJHTTTRLneZAsRq5GkeT4jBLcjgTZZjp/gPljoBZVFHfYEx5TgxT01M7frM7qcbYzwoNCC0DpbZG6NdYy6gPVVu/uHCHMXmvXHmN3UBWgTCM3LtAgZ4BvvDwVoNnH5CC5pkRwrWQ/xCCDrUbqVH8JOd3PQaRvaCK3U/rZYxyLobbX9PY668SVTUc7gN0ApA9QVt8SPAHPDZGKiEjmG+AEzVXc8WRfKwTpNHHBhUbEthNLkObaVVAZ4fHVUwvWjcZXdUC6qWCCfjeW0HLB2c7dPjjTh+U6RJRkAPtc1Zcnw7LO5SyTlLSDW5uwPTPNnnYJhR+WN9pvFvgz7Vb1SXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqXvJRqi/RsS/MC4ZTJEdp7vSV8sLBRaH/wZ/4Q46JI=;
 b=ai8Lnf6WgTVrt7JAK3zjgSTegSZ+WX0BVzgVwu/vfxQajdpPuV2xmDFzQm/5UdpI3CKpGHgKvEfoXP90vSYYtNgzG3XV1mt1p1+CJgyLQIgXRvVX1DepDjGQQr/2JK54y5sm4RCC5nA9Vs8q64XTSd35TRjpQNUkpAB6uSBab/m7mzYqk290GTylep382QUQMA1G37HjvmRpoHxD0lrRSk/oGSlNvRQFhUz54+HqioXWm1XHqBjx9qOTrrllBWDPljZmPK6vStxQF/tLwpS/yjOrEs2YjLSEkbX+Lt71HsIdxrYbj9UWVOdJ3u9h/pnCLUw8lG/3H8D4fdmFjXh19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 01:56:50 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 01:56:50 +0000
Message-ID: <e07ec6ca-dbd7-2f17-a99f-7b91a530d359@intel.com>
Date: Tue, 14 Feb 2023 17:56:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't use stolen memory for ring
 buffers
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230214234856.744573-1-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230214234856.744573-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CH0PR11MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e208475-3a8b-4a42-0e62-08db0ef7e6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4qtR6HtKCp/8lU2R6gu13JM82VZQ+XZxU3iOP7f+tLyPKIDRlL9pCDA7i7sVJvUgGxvYHlpL0X4shjm5SZO8D3RSVtKx0NLjn5Ws5BUxnXFtNVxu0JtVMk3U1GVaAWaVqpmCgvdAXeEHklPYAFTccEM1XiQLTmZpYPDpKW3DmDpUnXbqZ1WZimVx8j6n3M0tYc+tYPtWXVe9oFnc9w1RW0TCL3e/v7qzsSZWdIJWmKy2zL4H9iAfwPj+1xeha+OVZ400KQL+UoTByjpenoVL7Dag7zciM6qNSKelzCacxRhdafdG/53ECTIew/ySYX7vqPx56DKGuBC0Vw/J1hIyw5Pz8RhGp9BcvHKaobnRATqaJgefngIlqP9wayj0Y7GqQNTK3lGKxkKpK5nO2MBWJ1DcUewCwO0AEnEhmCbvelLF/E1ANh+g+zvMkn2Ewe7niX/+ENalWTTbk41GC+X7olSRC9I2O+r6IIVsNhU+QA6spgrq08m8VAUoPxLLfPpoAg2OxZHblMFEUpE6pL/8+BuwzgzPkouDxL5oBeFOpA3E7bwlvBhwUwP6qjGN9tTzXQzE4HRCi8OOBXU/5XLqkGiXeGoed0FNTPTSbYN/n9DQXxdKKi2iHK7zyn8x7yRcwKg3prHN5geMmX/g9jmlhOwIaSkJLKXxd+prMdKbkNYVU3VYMfBN9KBKOb+b1YX5Zerrypi5WaT+nUEdnDhoD4ugLKwZsaCc8nAv18MX3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199018)(82960400001)(478600001)(41300700001)(8936002)(6486002)(5660300002)(450100002)(31696002)(4326008)(66556008)(316002)(8676002)(86362001)(66476007)(66946007)(83380400001)(53546011)(6512007)(26005)(186003)(6666004)(6506007)(36756003)(2906002)(2616005)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnRtU2hGOUdxWjNxcVF2WEd0QVMwN2c3VEQ4bjhLVkFJRk5NOUJHUGEyL2FB?=
 =?utf-8?B?enhIdzc2dWpNeXBoN0JvTDNvSzdaR1VMeDl3L0VQbUFZTUtiMkpSLzV3OS92?=
 =?utf-8?B?ZGg0UXllY3JFc24xdDMvOXc3Q2tDY3lKS1JMZGNvTUE0clB4bVFSM05GK1F5?=
 =?utf-8?B?Qmxqc0lDS1hseVBiRTBKSFQzVCs4VytzdkVRelBXaE5VV2VkWjVWaHV2YjlR?=
 =?utf-8?B?N0dMUU9MZWxEcEQvZjZHNnlRQTBZVDg4M2MxK2pJT1hNTWFQNExjaWxidXdy?=
 =?utf-8?B?aEgyRC9yQUFoUFlQNmVNLzJmL3BEMTh6aUlrclZpL2hrN2lBd0gybW9YRDM0?=
 =?utf-8?B?ekRJemU3L3pMaGxIUWhnblBseEx1ckNhZzNtSVZPajNXTmY4Nm9ubFo2Ykhl?=
 =?utf-8?B?RkFaRkt4Tk9EZEFqaHgwTmhNMDBVZEVmaXNiYVF5eWdJblRSVE9RUDNTZXBN?=
 =?utf-8?B?NHFnVjFZaENVa2JWMVY0elkweXJNRlp3U1pUUlJKdDUwemNpN3lMQmNKTDZh?=
 =?utf-8?B?VXJleHRPTE1EUVk4ek45UEFyWEYxc0pMR3g0WDgxaDVxcFdEdjNObHIrMDJW?=
 =?utf-8?B?VDBXZFozMnZ5NHpDa3cvODJIa0oxTDdMMHlTaTZuM1Zpai9Hc2dlV05GWE1t?=
 =?utf-8?B?WHJyRGVEdWE5aWdTVUREZm1OdFZ5YnpXZ0ZZc3NVazZBQmhFd0tRQndWWHgr?=
 =?utf-8?B?RjAwTnV3bmlZZzZoeGRPR21jb0JrRnJPdVNLT1h4cFVWMllhOTVaUXc5Vmds?=
 =?utf-8?B?WDV5TjNZMG5IM3Avcmk5Yzd6MjB4bnorWWR6T0VBVkNzZnBYYWhvZktRU09x?=
 =?utf-8?B?ZkxLTUlheklaeVc5MkY0Y1JpN0NJdzBteU03dldHb2ZYMWdNbjlsOEdHd1dU?=
 =?utf-8?B?OFg1R3JlbkNzaGMyZzBOWkJsdlhXNjRmMVFJUzd1NHRncHBPNGRxeXgxUlQ0?=
 =?utf-8?B?TjRQNWJqVUxaS3pqcmJKWURNNUlVbnBUK0s0OUljMTlFVUVVdWljRzNoZmNy?=
 =?utf-8?B?aUFtcVdkdnhPeEpHaHNYQUt3OUJqT3ZWMHJLZk9OVWNic3U5b3B5ck9wOHlm?=
 =?utf-8?B?N3RSUzEyOVJxM2ZRTlVJaWY0eWxVWVhHSHRob1BKZGVJWDY5MFlGM0hYblM0?=
 =?utf-8?B?YmhQR0x2MDlUZjFGeGR6UXNsYTQ5OFQ1eTYrR0ZWTWw0SGpvMjhiU252VGQ2?=
 =?utf-8?B?M0dETjUwaGJmeHZOS1IzWDZGWDhNUmNtS3dIaGZiSkF0OUFBVHpPaENSSkRv?=
 =?utf-8?B?cWdwRlJXUTFYcWlRVDA4RDFibzUyL3h2R2hhNGs2L0hESUdPbjNaRDQ5dnRW?=
 =?utf-8?B?NTZZMTRFZWkyejRscnlMeXl0KzJ0aCtSZXFvaEJwZUVJM1hTeUVYbnI0V3N5?=
 =?utf-8?B?NElyRTJ2bis5VEF3VXBQVnJwTldyQTR4OXduK2tZemlOM1VCMDRWc1ZJcGRo?=
 =?utf-8?B?cW43elIxMDQ1bGoyR2d6VVQ5SmVZMWp4UGx4TlZRbU5ZMVg5TktleXpZaXlv?=
 =?utf-8?B?cEYwWkZKMGZOY0dVOWMwTlRvK3pPYUhUd2xZS0wySklWR25SQkZmRFQxUFl1?=
 =?utf-8?B?OEh4bkNsUmk5MVE1MERSbmdFSkdLZmdXbW9LcVVQaTJINldIdFBZb1dqdlpn?=
 =?utf-8?B?UU5ZWk9BdWM5akpDTjJNd0FCTXAwNnA5R3VtcHdqdEFDOEJSY25DbjhxaG54?=
 =?utf-8?B?N0RWckpUNzR2dEdlclBuamJLR3lYeklyL04zTFU3OEF6K3M2b21VNlBLSjlY?=
 =?utf-8?B?SW0yWUdVYmxjRW8vV3E5MUlWUmdmeHRmb0NGbGJMSnZhWHR3YTV3YkdPM1oy?=
 =?utf-8?B?YUJ6anQwZGZXMk5PZ01RcnpiMEFzamlFWmVqVkhRd3BCQWdGYTJDQ3dqT28x?=
 =?utf-8?B?VjhsTFlYZkJtYmRVc2RKWkg1cG10eEx5NnlsM2hxd2tGTlA4akpNcFVIcXFa?=
 =?utf-8?B?RlVqSUUvKzVvQUZNd2RWSEtXWGUzc3JyNTNzMmUvaTVTWktSd3FtSVZpS2Jl?=
 =?utf-8?B?YTZtWjExSXhUKzBtY1o1dkN3WHVXaEMxd1JEYU9DVW95UjFLd2s1ZVZJQ2gr?=
 =?utf-8?B?Y3NFOW5hc0wvNVBUYXRLeHpKeUxMaW1nMVlEbnFsQTgvekpHaE5nM2xkUUlI?=
 =?utf-8?B?a0J6Z05FdUFnOUtza3FXdFJIUnZ0NVpsY1BtNHM4c3RZRVg4a1RSYURaeGpH?=
 =?utf-8?Q?59m070mJfAixtlc4kxAbjHg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e208475-3a8b-4a42-0e62-08db0ef7e6f6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 01:56:49.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQgv3zt5aHYOc+i8UxuGt2fOFMcJ76nsBVZR3L3UiG+N6aiBTz3b8u06YWJhfAgKZvETmZqgdIyjJ7eZPoL9eHAWQ17ajTE+PZbj3FAJT+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5409
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/14/2023 3:48 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Direction from hardware is that stolen memory should never be used for
> ring buffer allocations. There are too many caching pitfalls due to the
> way stolen memory accesses are routed. So it is safest to just not use
> it.

I'm wondering if this applies to machines in ringbuffer mode as well, as 
some of the caching stuff that according to the HW team may not work 
properly with stolen mem accesses from the CS (mocs, ppat) came with 
gen8/gen9.
Maybe limit this change to gen8+, to avoid changing the behavior for 
very old platforms?

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ring.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
> index 15ec64d881c44..d1a47e1ae6452 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
> @@ -116,8 +116,6 @@ static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
>   
>   	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE |
>   					  I915_BO_ALLOC_PM_VOLATILE);
> -	if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt))
> -		obj = i915_gem_object_create_stolen(i915, size);

There is code in ring_pin/unpin() that only applies to rings in stolen 
memory, so you need to remove that as well if you drop stolen for rings 
on all platforms.

Daniele

>   	if (IS_ERR(obj))
>   		obj = i915_gem_object_create_internal(i915, size);
>   	if (IS_ERR(obj))

