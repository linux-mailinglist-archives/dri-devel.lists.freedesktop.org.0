Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1717EFBA5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 23:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0892510E778;
	Fri, 17 Nov 2023 22:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D87410E778;
 Fri, 17 Nov 2023 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700261699; x=1731797699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s7od0pmcR2GQeoG9hLyE326nIEo5sdgMFx+Y8n+Yw6Q=;
 b=iB6c6aC+NxAK+OIdV8A8wBtFopPVTymt5cijq+EaYoWtlUha8n7SjHCn
 0R/g2VCDTpkP1D7XVZ1fndNdZ0SEC9+poBW9CuBT7JV1zviFRsCfHoajo
 znspxnTxfoD6ycHTlEF/PjA7IkzdbcM0EVZoGP8SRZa1WbXx70hMdDlVg
 gfAkHgJFaWo8BYqg1vEiq5Qam7MaKwZs0Qan1CgHf+q/GHJ10duOYaenP
 BEd+rucnSNPumN57golLLUaBXNfDvl5BpD/x3vHDE1rfr08w3gFdnITCP
 Te+YvEKoz7A17EYbWDkTdaQUdrgOZmQ3XD0JydOIyVoGTq4botX7Yr76e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371558822"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371558822"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715670217"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="715670217"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 14:54:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 14:54:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 14:54:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 14:54:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTppMyFIQDohh9CCQGpBsdb5J6GeGlHyr/UxeDNMw+zmwARxWXKSftl6/oSmdhVFPTBbXLzvvn82zQWNIGIkQj6VQs3cBHYscQzR1NzVC2w7GADe7ZN8eU61qAUT8bvPXO9h2nIOI5m0A1KeGDRKrFGrszPmDyhhe/g82hI6P6V4l+3xzMUD8c4T9XnuLfCY6/gzZpc+qrq08OVupqk59LJB+z/1NDNeqhV3AAKM1Q+sgcg1hFyfM30dMwu3HTEzCXYzC/pJ1gwokik5nKePQqusoGN5n2xF+q/QA30ii7AijBXI4ffzMD8BW+kYDN2hiphmxMyL0cihxi/b5ilLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7t+sS1E0dt9O15+gsDOZKpq9OQ1FqbJPaIp4m0rR1U=;
 b=HIqnBVc3rg4tYMuV2ZeCrqOILDtHyxI2hIq8xBLJ2PSO6yQJ7PLEroSJKYdUKl2g2a1kYog1wfek/J2CY03QSuz1dTfUtgDgwRCfPrMqiMzamfAPY5SgXt9U+V3eCfppWv+cxdJEIqUz7HY3iNIBEcrq5enZzmT6jQyjERIXUWvwm1ad+5Bb0Egvih7guY+/W760fWKUZ7PGredWY6Z5ChlzNHNC1oYiRof0Yu6wb1aPuJQjnhLgNUOKyvg97zUdhTefc1kU7989PrOcVyBT5Ic7GJQQE7b/drnj9NuH5Ya/tyYlBEm5JL1iIrzns4VprtWiTxMR4cF5ulr9hvJXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 22:54:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 22:54:55 +0000
Message-ID: <f1e5c1ca-b1ad-4081-9167-e79be624fe1f@intel.com>
Date: Fri, 17 Nov 2023 14:54:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/gsc: Mark internal GSC engine with reserved
 uabi class
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20231116084456.291533-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231116084456.291533-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2e864f-810d-497c-a5b9-08dbe7c037b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhXY08bG5CNYN/X78BfuyQc/8iV2LMGYZaNBQ1F9q2PL98TOkh2sCH/edkYlBWxzxQit3JY2CG7MyGUUICAleaFwZNpblUd/g7+vaW5pDV7NHlkMi/HjYegTu5kgvZamw0u5ChMqzIcifVhPa/dZoSngtl1rUkQDXe5T7WlW8yRF66gSjVa4/MlfcrVC3Mk4ZONmxpXiXgbgvz2ISfEEY8l3teSBQOSXvoNjU0BKw6276fZa561ZurbsqvXlIuawctb2FVRyVhe5iWpzmQatDWXhFpNJIQDxprt+LY6/UBHru/aOreOtTW/y7+VQAgoifK6x3i1Huk6ef93DQEK1cB/5YyDRyl54PyQpaZDbdXj94mDincIkdrd93+AgOTbMj/Ed0BuUMhxJfMZVC4CT/6zZ73bAH6exZdxE/lZPqwdhl66wZ1xAhSjWmVTfTTUOLh+QPX0u9i07dB6kKt+W7rbi4JIPzf24Rq/lPtNOU5n8QIfsuIrvnI5EVPEJEUpsLpwWSS7jD1bocb8hk1RFNMkOKI+k5NNJAW1iAI3egXweuLA9Yqse5DT3zMX6/7EmFYPmQ9qQ0lR9BRb0i/ZCZ25gakhicMz6fx7jhTFyrP2QSaWV8N4ymS7Fo9qK1onCwWGfHrLIJvSrgiowd/N9Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(83380400001)(82960400001)(6486002)(478600001)(26005)(6512007)(53546011)(2616005)(6506007)(8936002)(8676002)(316002)(4326008)(54906003)(66556008)(66476007)(66946007)(38100700002)(31686004)(2906002)(5660300002)(86362001)(41300700001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGFtT1dSZEhoWkVTSjlPNlR5T0dITm5GaTZWSzBmRGE4YWpENEhFbDF4VE53?=
 =?utf-8?B?ZzZEdWsxYkVKejhRdkZWMXNIbHhqQ0xLM2YvQk1RemlQRjRvdkpTcGpQRWQ2?=
 =?utf-8?B?TUJoWW5saHJ1elpqbmRFMVRRcnBIOUc4UUpMOG1BeVlZeWVDSlkra1JwTG5S?=
 =?utf-8?B?NUlST2s0VGhiYkRKZGVHaG1xTWUrdkx2QzFrWldHeGF6TUN6VjlJcHM1MFMz?=
 =?utf-8?B?ditJMXpiZ1BuMWc0c2dNQkpWWDdQak5wRWJvUXRNTFk0N252VEExNmVUTFZE?=
 =?utf-8?B?S3RObzJuTHhWQnlEYkhGRVdSTHJQV0dGOC84aHhlTTBPOVdhNDZnblV3TzE0?=
 =?utf-8?B?M2JZazdFa2prcENydnRibFE2eE9PQ0NXRnR6bUVpdUlRMkNod3J2OXp2YzZP?=
 =?utf-8?B?RDFBcFg2MUF2WlVyTWdiYXlBSDkva1VUK3pkMGdIdnlPNWFhd1JsYjduQU9s?=
 =?utf-8?B?b0ZxNTk2MUNQTzNBWDBNcE1OMHMwWXhBMnBrS21vc01uWWx6Qy9adzlQcEJP?=
 =?utf-8?B?VVlJMW4rcWVsVWliZFZHTktxQTFpN1k4NXJnOVFMMU4wTHh4dlZ1RUhPU0NB?=
 =?utf-8?B?V1hGME4xR1hXbFJ1cWdQUlBTcmJnZ05idlJkUmJtL0RXL1N6SnlWa3RCZFhN?=
 =?utf-8?B?ZHVUV1YzUzZIdE0wSk1EMWN0dkZlVzVaKy9zMUlkckxBWVl2T1JSV1FydXVP?=
 =?utf-8?B?eUc2dkpyVCswSk02U0RPcm5ldEVkUEJBbHgzenI5ZnBoRElyM0dkMFdDTWx6?=
 =?utf-8?B?SEJZelduUDFQWlp6N1hGZWo4c2QwRXJnRFhidnl4NkxnNVFTZzJWUVdoUll3?=
 =?utf-8?B?TjNNNGk4aG9qbkZTYk9EaDRiamswRzRENFJyVHZsYldudFBicEpUV1lzSXdm?=
 =?utf-8?B?cTZ2SVl4MWpEYzRqc0Z5Ym8yYVhvR2MrQkJ0bWM1YTdZNXptY2g2MnRaMzJw?=
 =?utf-8?B?eE4yZzVQQVpQT3JSenc2dTlzaWVkRzhyOHJnaGJMaXd6a00xQXNna3RZdC9J?=
 =?utf-8?B?VzFtSHMvNHd0ejQ5LzZkemt3WkdRVFU2L2xUVG9QZUVEcm9WUjNzcTgva2hN?=
 =?utf-8?B?VlZZUFhJQ014S0pRNlFlZDF5M0h6OUhzbktZQmxEa1ZCemtnN0FOSjBEcHdt?=
 =?utf-8?B?alQ4RC9Cc3p0REs2Q3Z1UGFOWmtaVXYxSW8xRkhKZjVTVHpPYTVBQy9DMEIw?=
 =?utf-8?B?V0dhZXEwaXdySVVmMXFNT01wK3Q4c3VFUnYrSEJETkxCd2tia004Q2IyVkND?=
 =?utf-8?B?Vjh6Y3pOTDZLV01CTXB3UFJKTzVoUkQ5WHhtY1hTQXVxWFlpL01EY1R5T3pq?=
 =?utf-8?B?c2lXcEhnemV2dG1LOE41T2kyZ3YxMWZCL3d2Z1hFbU5FcXNTZWNMSmR4TnZ5?=
 =?utf-8?B?UDBpYmtRNHJyNlJ4VyszbEtQUWQvNldHYnVxOGYrSlNmV2I5QmtMUGZUN1JZ?=
 =?utf-8?B?TTgyeWM4cXgvRDBFeDMvdlVTNUw0TU51MFhuZ044SC9McGI2d0dnV1pCbEtZ?=
 =?utf-8?B?L2Z1cWFQL1lyN0IyYVJxNzdicE5jMUdPbkZvN3I5eU9ab1RmZG9ybEkzQVhN?=
 =?utf-8?B?WU9VZnQweW1wZWxhZ0Y4dVRkZ0hjYlZLZkJwT01sMUhWOFBtT2l6MVZmZGhi?=
 =?utf-8?B?dnc4dzlHK09RT0lBMVlKOTVCNHN4NVhzOG5Vd0RSSVAyQ1JDQXpDMDc1c0Iz?=
 =?utf-8?B?d0JHRVlKNDVIVmkzQW5Fd1g3RFkrYjNQMEtFZGM5WFRCNHJreVNIS0pJZzZO?=
 =?utf-8?B?ZDJJYWloVzRsWXBRb3pWdGZnanFQdDVyN0xFT0pXMzl4Z1Y4L0RGc1greGpQ?=
 =?utf-8?B?V3kzOWVjcmRuc2pFQlhuR3A3RVJnNmRDR2lqTHlURUhGWXVaK01OWmh1ZEM4?=
 =?utf-8?B?N3NvYU1oR2dYakhOT29aZ2UzMkpQY0tjV1R5emIyOE5YTXJ5Q2lEcjg2Lzl4?=
 =?utf-8?B?QU5DRTFhSi9sMmJyZm9sbFpvTWZZWjBodG1KaklhZEp0YkdDMWtDNExjTHFQ?=
 =?utf-8?B?NGV1alJ1azZUeWhRTTBYYlI5Zmxzcm4wU0RPUkM0akd2UW5TRnB1VVkzLzQx?=
 =?utf-8?B?RlY5bitEMW1MT2M4ZWdRUHIxd2ZrNGRhQVNRMmxuV2tETTRYek1YNkYyUmhK?=
 =?utf-8?B?L3FGbTJOS2tYaW10YkRNTk5hUGZXODRNbDVTelFzSWpNdW1TS0JiWm95dCt2?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2e864f-810d-497c-a5b9-08dbe7c037b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 22:54:55.8910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yns5VpeKlbXLUxHZhtxw9fD1WZ4uMf5GeiJ+sviA0R/8oaVyESvUfxLJPcxFpBu4r/CjQ9FuCXqi+Hae5yykCyDDwoFsu6ctHpc7QRcQkJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2023 12:44 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> The GSC CS is not exposed to the user, so we skipped assigning a uabi
> class number for it. However, the trace logs use the uabi class and
> instance to identify the engine, so leaving uabi class unset makes the
> GSC CS show up as the RCS in those logs.
>
> Given that the engine is not exposed to the user, we can't add a new
> case in the uabi enum, so we insted internally define a kernel
> internal class as -1.
>
> At the same time remove special handling for the name and complete
> the uabi_classes array so internal class is automatically correctly
> assigned.
>
> Engine will show as 65535:0 other0 in the logs/traces which should
> be unique enough.
>
> v2:
>   * Fix uabi class u8 vs u16 type confusion.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 194babe26bdc ("drm/i915/mtl: don't expose GSC command streamer to the user")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> # v1

My r-b stands.

Thanks,
Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 39 ++++++++++++---------
>   1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 118164ddbb2e..833987015b8b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -41,12 +41,15 @@ void intel_engine_add_user(struct intel_engine_cs *engine)
>   	llist_add(&engine->uabi_llist, &engine->i915->uabi_engines_llist);
>   }
>   
> -static const u8 uabi_classes[] = {
> +#define I915_NO_UABI_CLASS ((u16)(-1))
> +
> +static const u16 uabi_classes[] = {
>   	[RENDER_CLASS] = I915_ENGINE_CLASS_RENDER,
>   	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
>   	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
>   	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
>   	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
> +	[OTHER_CLASS] = I915_NO_UABI_CLASS, /* Not exposed to users, no uabi class. */
>   };
>   
>   static int engine_cmp(void *priv, const struct list_head *A,
> @@ -200,6 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
>   
>   void intel_engines_driver_register(struct drm_i915_private *i915)
>   {
> +	u16 name_instance, other_instance = 0;
>   	struct legacy_ring ring = {};
>   	struct list_head *it, *next;
>   	struct rb_node **p, *prev;
> @@ -216,27 +220,28 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>   		if (intel_gt_has_unrecoverable_error(engine->gt))
>   			continue; /* ignore incomplete engines */
>   
> -		/*
> -		 * We don't want to expose the GSC engine to the users, but we
> -		 * still rename it so it is easier to identify in the debug logs
> -		 */
> -		if (engine->id == GSC0) {
> -			engine_rename(engine, "gsc", 0);
> -			continue;
> -		}
> -
>   		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>   		engine->uabi_class = uabi_classes[engine->class];
> +		if (engine->uabi_class == I915_NO_UABI_CLASS) {
> +			name_instance = other_instance++;
> +		} else {
> +			GEM_BUG_ON(engine->uabi_class >=
> +				   ARRAY_SIZE(i915->engine_uabi_class_count));
> +			name_instance =
> +				i915->engine_uabi_class_count[engine->uabi_class]++;
> +		}
> +		engine->uabi_instance = name_instance;
>   
> -		GEM_BUG_ON(engine->uabi_class >=
> -			   ARRAY_SIZE(i915->engine_uabi_class_count));
> -		engine->uabi_instance =
> -			i915->engine_uabi_class_count[engine->uabi_class]++;
> -
> -		/* Replace the internal name with the final user facing name */
> +		/*
> +		 * Replace the internal name with the final user and log facing
> +		 * name.
> +		 */
>   		engine_rename(engine,
>   			      intel_engine_class_repr(engine->class),
> -			      engine->uabi_instance);
> +			      name_instance);
> +
> +		if (engine->uabi_class == I915_NO_UABI_CLASS)
> +			continue;
>   
>   		rb_link_node(&engine->uabi_node, prev, p);
>   		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);

