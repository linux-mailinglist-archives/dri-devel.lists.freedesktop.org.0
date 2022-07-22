Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3957E7E0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 22:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F4188112629;
	Fri, 22 Jul 2022 20:05:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87E211AC36;
 Fri, 22 Jul 2022 20:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658520342; x=1690056342;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xuq45xPYcdGdsy5cvhGQGdzseN+cjBdMiUoZSykv6ug=;
 b=crc7lqkNsdU/Jl8zpBZ/iz4Sa4PRSGyG6VoCPT6ccJ5KYapf3hm/RfAB
 jcqIGdfRSTZY0UKsdQRBdwtP0+fE5qsGsAiVO2xsmy75MxG+8FOV8dNOj
 WGvHPD168rQYsfriKwSTgJMlKfr1IZ8SEopYRaPsOYfvSj1NDWPZ2Jfji
 6ZWjOGfcewwLmZfPD7ba+3h/NGizBIECeQPgFl8zmwasRSQCcTgRIDKSC
 6T4ksXWtEEYDsdu7HXCSOujTGsyfukttP+MpzFdzeAPKZlGyRlbDWbdcg
 5uHB85Q78qtjSLxOfs8hx+kZlm650EnTwsW7WQ/bfs1hdfFrijO4Fr5EU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="373702369"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="373702369"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 13:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="775341937"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 22 Jul 2022 13:05:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 13:05:41 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 13:05:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 22 Jul 2022 13:05:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 22 Jul 2022 13:05:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6oHCVR5X6RvTLPe1SCID020lXetS1aL//SIQEgzxWFfE4wLLFc1u5ai/1tfISEk1pfyT28tabsjy4Ma0t+bfQMqKl2DXhlpg7R6UaCwFeqQ5rBQZefEFiG5CPsQRMc5UASCl8hhBvDMUxNIatIuVwXvoJJ4mkb6m5XZDNEfMRvDIc8IYj+veGigsSqe/DOApZpQiiUSLfdROt1FQS3TpSoB7mpLwh8Vu5Lt5TnL/saNmp6nCIbzqQItk36AXgF+XVs4JHzOUqwyR3kVUMuQUheesbymOlDHmSaLbxQdNL7Lckr6xEB129fTQhTYa2jXlW0lItRUl/55u/1ZO0JKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BULmg353qGReEC8ZrVfaJO5lCX1718JyR7Q3buE6iTc=;
 b=oaM005IppJyw/t3VpODZADGysqrerLtVBf4Y9NwZYovMR3D0fHmKumz3aOj6z6LAH3UNOqtCK8tLYCtxh0RkZngwcfUGFWkuGS1aWHE/h8Lp1YYvL1KB9nptgB6onFxxPGM018cNTaVTZKN6Mx+w25U87m6lWtouF8t1X+NMuHUOl62FmVbNSalvGkC/bizdSMjHpEEvk/YcORBIAkxC8b5nUMm986aDLdrsizbdG/VFX3Nlv6xvYnwn1BF830nG8ZcmIb7N2BhWQHI0lnLTCP0on+QmMurXQ1iBWAWbF/Xf3DtTTbmA67Q+UW4cigIyYOq3Hwkx9CqVJmagQ22aVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5492.namprd11.prod.outlook.com (2603:10b6:610:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 20:05:38 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Fri, 22 Jul 2022
 20:05:38 +0000
Message-ID: <4608d0d3-58d8-2a63-46b9-2e4d7b00c546@intel.com>
Date: Fri, 22 Jul 2022 13:05:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 06/12] drm/i915/guc: Use streaming loads to
 speed up dumping the guc log
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-7-John.C.Harrison@Intel.com>
In-Reply-To: <20220712233136.1044951-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:a03:100::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0decef-74a5-4668-9f77-08da6c1d8ba1
X-MS-TrafficTypeDiagnostic: CH0PR11MB5492:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bShJ1mxZQTt5Bb0IP+a2VyVey8ghfnxYzyS7TBB6manzB57nDrRYQK8IhT48pmbjPKHIJILEgORi/7k00+INLRf32ypnQmMo+2ml5IeMrgbcQovnBCBX1dVFDOWO0ncaGuAYjKcOvHTMbsPq1+2dvyJKaRI2u66qCDu+GEjXqSoMnhg1V9ew/YPgXlBeyLAAi0P4ZfKqeb+O+XrcEZHHuHoHY1xCycY+LCvW0lOmInqV5jvHxL5nGh52XZ2klQGWcHBQP6hL4wTss/3vjOZ67dX5syV278apKfQ2Puqrd84Q/xmqQFZolJHWCaNQzRk2FEIV/iA0mSml0OigkvJbhhSyg25JpWpqEDw2SvHjwDgXmChh5u4CC5DseX878HZaR4Di3RoavkUELoS400qP66UBO+dZSef8tt+X3KiF4P6UF6mGDbrrPI5aIR+xyLYWY1S2oZynrY5SHmo0fv4cgi2DsEZj/HLPUv/vqVUHlpDXh7WiFkUdmCEN8q4Y5J8xvRXDa1HIG+AzFykabqCLoVuDvhqmsa+N+GRDBTr8D62TIgLPHZMdz8e1Mj+ku8y8z9mibrI6plxgetMP5tH6qJQtocaCj/i/isCIMRn57tm7G/67bM9SALf3FojartzKuFODGSkiTkuXCNI4K5KyNi3kDReYYYJJ8OQCYBi71hDHCvTh8mw7SCKoW3J094x6pMKKCqtpFBAv5XOT/fGdQ6qnCCv2cw25eVVc7IxTvgdeehg2/I4VsVTnG9kwFkYc5h/crW0zQkTllsCwZRQ33DB26gwdKXTOfpbxHW5HiqkIzcbH4BcSat/SJ3d+p0yIUxHoygNfvsZY5avj6f82sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(39860400002)(366004)(396003)(8936002)(66946007)(66556008)(66476007)(8676002)(5660300002)(4326008)(450100002)(2906002)(38100700002)(36756003)(31686004)(31696002)(6486002)(86362001)(478600001)(82960400001)(41300700001)(6506007)(6916009)(316002)(6666004)(186003)(83380400001)(53546011)(26005)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFc3NXU5c3ZBVmM5ZXVmMDlIRUkwQllVOHpSeStqOFVLZHJPNU9lSEJpQVdD?=
 =?utf-8?B?MTVpOGlmT3RJVVRYdUg0MVBYcEdFaXVDaTZVS1JJZEZRMU1nU0F0SWpTTTdj?=
 =?utf-8?B?KysyNWpSSDdWL042MC9sVTFjdkhDVlo2eXFSRk5RcjFxdkxnVDBVcUI5dGpE?=
 =?utf-8?B?VlU1ck50Q3d2ZUxQQWR3MkVLamQvMFhoSTZFSGd2dzNBRjJtTFpIRys2am9K?=
 =?utf-8?B?VHFYRUFSRFY4R1EycUcremFiTnBpRmVoMy8zY2tOUis4eS9NN0pDcDZIYmtl?=
 =?utf-8?B?U1ZKdjYwMUIyU09HdDIwd0laVDV6UnZPOVhGWmJ6SjJxWFVhWlNPa0FqSXo2?=
 =?utf-8?B?MW9YRnp5U2E0dVJ2YTVRVVFpRTlOZ0szSHFvKzZYRjI2ai9GSFdQbzdrblVH?=
 =?utf-8?B?cXRGTHZwTGQyQ2I3VVFvTjVwZFBHUGtuTlducE1iVUhzRkFpMWV1c1NyaGRN?=
 =?utf-8?B?YVcvYjJqeHRENlJIUkhuM2wyQjlEaUxWSzZlSVRkdFAxYzFKQmZrZTc1cW84?=
 =?utf-8?B?OFZvdmN2MlVyN0pBN3NNL2UvNEc0dHc2cHdXSWtab1UxZnNpY1ZFMDV4c0Uy?=
 =?utf-8?B?NlpheHdudDNaZUp3aW4vZ0taeXU1SEZzd0QyZXErWm0xVjFaWUtjOTBmcEFW?=
 =?utf-8?B?M1M1TUM1OTJTOUdGRm1mTUV5bXhhSVFWZzFqVnk0djUyY2NMYkVxQi8vcDcr?=
 =?utf-8?B?c29YeGtLQ1VXOHZBY3JBOTdSV1VhcXN3YkgyeE1QSjJPQkNQVE1LMTZBUkpG?=
 =?utf-8?B?bjl6S1hYRDNacXMzTkJVZXllck5ZVS8yOGJBSE8vNEVsdytIOXA2ZjkvUC82?=
 =?utf-8?B?M2tId0FKanBIUEt6OTFTS1d2blZrK0FYaWVzcThUWGhLWGxJUFBweFhGS3BC?=
 =?utf-8?B?NkdQMWxYZTZNeXFaNzA5bjJwMHNpNXJ6NHF3ZXVDbXFGbktJRTRVTEtLcDNM?=
 =?utf-8?B?aWZVOEF3SFZQUUJDUkFzTURNbDc4ZWNocC9KOUtTYnFjTUNiOGtpeVRyaFBT?=
 =?utf-8?B?SlZLSUFUYS9nR2pVS1h1bk50ZG0vVHhpOHB5ak1NTHo5K2hBUnhSV202OE5T?=
 =?utf-8?B?WUJrM2xYY0YxeUlKajFSemYvSUJLcmdqTDRiVkJmOHk2bi9sSDJCRFBKVHdQ?=
 =?utf-8?B?WVZkQkpwT0NVamZRNE11UlArYWxVaStLcVlEZFAyT08vRmt5KytvZnh0TVVa?=
 =?utf-8?B?YnVQQjRHSkljc3NaMnVxU2NMMmJSSEZhT0dYaEFCYVo4QkgvTHNlL2k4cCtD?=
 =?utf-8?B?MnBzMFAvR3JjRGlQQ1IwMUR2VGZJM0NicDNWT2M0VzlJRGpaNzdyYk4zQU5P?=
 =?utf-8?B?cUx6aFRWSTNjODB6Qldsd1VRMlgyUzFMeEwzY0sveGd2V0tmWWVicTd5a2Ur?=
 =?utf-8?B?Y1lHdmhKUHY1WHEyRFM3N3BndkdhVWJYVGp2SWxFYmIySkNkdjlDb0pSeXRs?=
 =?utf-8?B?bU94UTlHT21IYzUvZEdMd2p4WjJ5MGVEak1hWGpkMXB3SG9FMWZ2YmZTSUlh?=
 =?utf-8?B?R1d3cXorVDdJc3Fjd3dyZjh0djhKOE1XZ245MHZwSnlRMXpvNHU0Vzc1MEdQ?=
 =?utf-8?B?c3ZGZGRjMUJTRmVBNW9QR0M1dW9qVXZiZVZNeWQyTFc1LzU0bmtLc1Rzb2dj?=
 =?utf-8?B?RjEzYmhYc3Q5L0FVOS9RalcvcCtlNnJmcXptWVV5VUFPYXJNcS92bUhoZ3Q4?=
 =?utf-8?B?TVZOL3dZRG45UVBJWWdhd2VlTUZkU3pkeStRdW1XV1R1M2xzZWhLcDlrUFY4?=
 =?utf-8?B?M2I2Ym56aG5yaGlGLytPZ0ZMbGhGTW5JQzJjZHk1bDhUbytSTmlGMUs2Nm1k?=
 =?utf-8?B?T0lJa3NobS85anBqdFJoWkUzR2ozbVZJWDM4YjJPWnpXVzZrY0ViWTI5MkFp?=
 =?utf-8?B?WjljZEh0RTRubENYYjArMHJ3cTMrSWxlUEtDZVlBcm90elF3NlhpWlBldHZ2?=
 =?utf-8?B?b2VZS0NBVWhNdU5Id251T1VNV0g5dVNyMm5OVjJQVEpJV0pIUURCU0MrSmND?=
 =?utf-8?B?NXhYZ2c2bUJhaHRFakhEZDZVdE85Z3VaQlNMWS8xSDhOU0xNckl6WTNvdHNW?=
 =?utf-8?B?MGx5UHkvaHgrclpNajl5WmRiT0JPRUtxQW94VGpJTis4OTZDc0RHVExuQkJo?=
 =?utf-8?B?K3ZJMURDQlRwem05eHlDNldpTjg0RFBubWpXQk02QkwxcTlWVkxjbHh5V1ht?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0decef-74a5-4668-9f77-08da6c1d8ba1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 20:05:38.0854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A7OQkUzkr/pMD19smyTqkbEFbWB135Ok47TT2BY7cwtvyiwFFjvxNQXTWhMZL70iUaXyo2sYQSvkNiXy9MwvtlgNUXcEUVK6kVJECOlDng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5492
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
Cc: DRI-Devel@Lists.FreeDesktop.Org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/2022 16:31, John.C.Harrison@Intel.com wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> Use a temporary page and mempy_from_wc to reduce the time it takes to
> dump the guc log to debugfs.
>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 24 ++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 45f62cdabe356..ff091adb56096 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -749,8 +749,9 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>   	struct intel_guc *guc = log_to_guc(log);
>   	struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
>   	struct drm_i915_gem_object *obj = NULL;
> -	u32 *map;
> -	int i = 0;
> +	void *map;
> +	u32 *page;
> +	int i, j;
>   
>   	if (!intel_guc_is_supported(guc))
>   		return -ENODEV;
> @@ -763,23 +764,34 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
>   	if (!obj)
>   		return 0;
>   
> +	page = (u32 *)__get_free_page(GFP_KERNEL);
> +	if (!page)
> +		return -ENOMEM;
> +
>   	intel_guc_dump_time_info(guc, p);
>   
>   	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>   	if (IS_ERR(map)) {
>   		DRM_DEBUG("Failed to pin object\n");
>   		drm_puts(p, "(log data unaccessible)\n");
> +		free_page((unsigned long)page);
>   		return PTR_ERR(map);
>   	}
>   
> -	for (i = 0; i < obj->base.size / sizeof(u32); i += 4)
> -		drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
> -			   *(map + i), *(map + i + 1),
> -			   *(map + i + 2), *(map + i + 3));
> +	for (i = 0; i < obj->base.size; i += PAGE_SIZE) {
> +		if (!i915_memcpy_from_wc(page, map + i, PAGE_SIZE))
> +			memcpy(page, map + i, PAGE_SIZE);
> +
> +		for (j = 0; j < PAGE_SIZE / sizeof(u32); j += 4)
> +			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
> +				   *(page + j + 0), *(page + j + 1),
> +				   *(page + j + 2), *(page + j + 3));
> +	}
>   
>   	drm_puts(p, "\n");
>   
>   	i915_gem_object_unpin_map(obj);
> +	free_page((unsigned long)page);
>   
>   	return 0;
>   }

