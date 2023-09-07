Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35363797302
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9FA10E7ED;
	Thu,  7 Sep 2023 14:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DB810E7E8;
 Thu,  7 Sep 2023 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694096355; x=1725632355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YGKTEZdhAiOKnzZ9t2SJxKUveWFeAXs2rKuSP37Soto=;
 b=ijfAQ01b5Ahj7YEozJpE3VumTnIac1IVK84lU1rsMBC4juig3TqlQxTx
 tbdmo9T77q6/XDbWMlIDrx/jSeAdNbgyAqUMuKDu81TKZx75We6RKxAzK
 d7eJ7inrGFkS62wIqQcX7l04Lfu+B3zPNH0uM+0YYGfvoYyWEVlYGQLyp
 LRxn0WXreW0A03q4d9ONpnBsaMxPKVzus9t1M5lhlKy7Ew4oYyxncJ3B7
 oqdzUFHx9sy9cG2HwCPSIqZv09FRO2AUKoWRTDcaMUBK9ew7+YZwpfnQ9
 6P6JTNPPJYh7fYpWilNQ+dqNTnsBqgVQ05MDA2LEZvu39KO+ZcwqRG/IQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="443763694"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="443763694"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="812152679"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="812152679"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 06:49:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 06:49:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 06:49:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 06:49:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 06:49:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpOtECwvU8h4i8D3QVpOxM7A23UrplrRZPOphhHMaUMqP9oQ4z9aEPVFAaP1TlEgdanMj8G6jQ+x5FTuRorHgi4jldMxcXFAHXe6kgGYZdTq4xwjDAgeFWQkuOwRKOLFlG8wpvqDKR9sWD367iwhNFivv6SXu1qCWZDOhKd4VNMrR8yvgAr0moBwrxCGTzqO7d3lbUQFAwHT/68Naw9t83Ihs8WkcdHNxG6Xbr5u0Rl1CMyazCAMrisjonD973YS7TT+5XwQWBRiFdsDh6+nvDBoQbh9e2wZ/thOw6F9v22GaNZ4+PtDXOCjxxKqI87vT7sgUyAMKkUW3b/q5UAMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REZx+UKafz04eG64EZf7d4tR7XezErNaGF4jlQY7je0=;
 b=gxde73DXmRuQSZVKoZiq9xW4gbbtWIP1wciTldPxpyPd4T5R0p6rg+AvDX1jFaIZsf/LZl94hJoZm7CLF8kl12NhSZ0Ef6Z1TJDKUyksjCZFyEkdN8cszn2hjl2wMOqsM8NcWhBN36Jilia7pEMYuSJApQVbzM0zmKLynt5jezqZ0R0kBdkP/gadbB+VDDlKgmcDj1P8Exn+kz6jVnlMNqR82kMrJE+R/5ecfd7myiF7p3OAGeJCF0+nRaetPtHS4Ez9Ae6z0qhtXvXkgx0Z9PeWuWlS+xjM5lj7cUcwjyqTKS1ntQeGeZ4cKfbEqT3etr/KMmNXM3bA8w9U2AXmNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2976.namprd11.prod.outlook.com (2603:10b6:805:d5::22)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:49:48 +0000
Received: from SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::25de:7285:e0b7:a042]) by SN6PR11MB2976.namprd11.prod.outlook.com
 ([fe80::25de:7285:e0b7:a042%6]) with mapi id 15.20.6745.030; Thu, 7 Sep 2023
 13:49:48 +0000
Message-ID: <f82aa589-4e0a-e502-d5f3-babe824df017@intel.com>
Date: Thu, 7 Sep 2023 15:49:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3] drm/i915: Run relevant bits of debugfs drop_caches per
 GT
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
References: <20230907125808.186088-1-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230907125808.186088-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To SN6PR11MB2976.namprd11.prod.outlook.com
 (2603:10b6:805:d5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2976:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4220446f-2bb7-41a8-8f8e-08dbafa94cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VS0FrdYcZmXZv+4//Nvhb/lY2KgvJz7+yvdJpbQGXz6heyXVSiRR1XKdKl67V3kbpqoPoV8Em1KfULCxfNk5C45BzaB5poQfGkdC7nlYtIdvJVCLNXI2EZZv9jd4WVe0Dlfr1lmNrQaZ9dJ1X7eoaAdUrqjr4Hgs0GoNaAv9sceWj5HteUy0yTnF4KClRl3MdxUaJYOv9tejR6zklkZPLrK8J178zkWo50ylXZn51QismH+KzWIPqDOnZ1ph8WMOvkPvP/4ONV1LUX43iBGjrxQFdMeKOsQsRlNcGlVPiLIfwrbIFL56QvaubD8gTmmFSr1miXRWMKv6TZp2mtw45OluVsoUiVJMsQDxipa9uxShG4BRTvR41onMGgNqIvq0I2zVtIoNRfYfBmGySEt4IANI0P7AH5Iq4qX/pMNeKJl9X9lcIP4zoBL2TEFXNXOlk1H8PzNRAFcaWrm6pkYb4zrkCRkJICY0JNwkodMXPYFj0WJRGYVipPSMMjbeLfp07DDEAAjr332ZRp670Ey2ziC8Bsz4ceKfqpVd3Ltu0T995Xnd25nQtvWwZFhSgzMUgyxQRD0PSoUtT43bDcPoixZ0LT/p/Kv2m11NBHeWwREGxySx6BD1eD+Hhu8c9BpX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2976.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(186009)(451199024)(1800799009)(83380400001)(26005)(2616005)(66476007)(66946007)(66556008)(110136005)(4326008)(8936002)(41300700001)(5660300002)(8676002)(6506007)(478600001)(53546011)(6666004)(6486002)(2906002)(966005)(44832011)(6512007)(86362001)(36756003)(31696002)(82960400001)(38100700002)(316002)(54906003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGU5UUZCZ2hVZjZEeEVTYTE1a2JvM2phakhwNFFWWjRZNnJOVlZwNURyZDJ5?=
 =?utf-8?B?S1J1TklQalN4Rm16dzdJamNxQUhMT0tPMzlpVzIvTm1KenlBVittS2R1a0sx?=
 =?utf-8?B?dGxXUlkrM0xaRGJ1U1ExY3FYY2l6LzlYcndJczhzWUZxZi9EMktvaTI3QkdN?=
 =?utf-8?B?NysrU2xoZHNsYUd6Q0ZyZmROTDNTN1dnT0JQeUIrZWYwTXNwajYwdUtJYTQy?=
 =?utf-8?B?c3JDTUI4QW9PWWZHTEQza0dUbFIvWEVRdy9ZQ0VYYURSVk9wTmdpT1VkRHEy?=
 =?utf-8?B?MHR5VERKZVdRbXN2dXl0OVBkQmZJNjdUWjNqVktEaGZ1V0RzeEV2dnZaNm5Z?=
 =?utf-8?B?NTBsUTVIbE4wU2tSMXhHWDg1WTNRdDNXY2xoR25NVjdsMzk3cnJIMXJCRlhJ?=
 =?utf-8?B?K3BPSW8zWFFHMUlLc21MS1ZPS2xyN3BJTWp4MkNvYjFBV2R0NldoVW10aVRm?=
 =?utf-8?B?TVNIckhpYXZKaHhkd0FVOWt6YUE0TDdpUHJrWkdrOXZnc0RpUjFDcHJyclFj?=
 =?utf-8?B?UHZLL3dNV0NTbXBLeEsyZ2g3eUZLUS9DWjFqN1MyOWlhcmJ3V3I1RXMxeGxs?=
 =?utf-8?B?NkNtUElEaFhLOGNtUXd2RFY3NDdpRUYxTUNqUnFtOFNiOFhEL3JDb0dwTDNZ?=
 =?utf-8?B?bUtmanNtSVlvQmM1dm5jbUtJV3ZOakhiN0FxQzBtSWdadzNJbEVqWGhzOFNF?=
 =?utf-8?B?dnVBT3dqU00weDNwSmQyQ2R0NWk2RG1aeGUvZjFDNjA0c2FWVjZKVVMyVnJ3?=
 =?utf-8?B?SlExazVFMmZqWko5NnlINXJsbEVERkRhOGRQVHR5dHVGajEvZFVZcFhwSFRN?=
 =?utf-8?B?SzA5TFh6dllMbngyQlpKK3lGTi9PSVBHYWROTUpFQ3hVRXcvSThQR0pFRVR5?=
 =?utf-8?B?aVZJa0V3U3JMZ2NiS3hlZ2VIMkRCczkvRnRXamJYeFEzYytuYVhsRy93TTNV?=
 =?utf-8?B?aVRicmhvL2Zleko3T0xab3Y3ZmNRbXVOQkNLbE1rV1laMWxTV3F5cXVUNzdQ?=
 =?utf-8?B?ZDFIUU1iOUlRV3BLSjJaYnEyci9WckY2NWlXSS92bmg0dmdMY1dQTzd1bXhS?=
 =?utf-8?B?ODhxczNyMS84UzIwRkJuUTFFd3JuRE41ME1EekkraXMwMmpTU0ZUUmVreVNl?=
 =?utf-8?B?SW1rL3MvbHc5Ti9EUVNyM29DakduWmFkMzZTM29hbE9XNS9QcXMvc1R5SDZo?=
 =?utf-8?B?MnZSNU9pTVJqdUJHTzVUcEQ3WjVjTWtMQjFuNHE0V2txaHRscklrUm9rL2sx?=
 =?utf-8?B?bW1TODRnZkN6SGMwUDhHanZYZ3NMa3FoVGRSQzhLNi9TZUZidU1IMzkwR0xZ?=
 =?utf-8?B?WkpSZStVUU5LeTZqZ09KaUh6eEFxR0I5Y0RKQnpnc1ZYYnJrTEpDODIxajAz?=
 =?utf-8?B?czRSaWJXWVdaMnE5bWdZeVJOSnZnREZtTXVTRlF4ZWVkTUxZcWx0dTFGVDlC?=
 =?utf-8?B?YmdFcFYyRFJvZW5hNU5SaXM1aTM2d0JTcThSRStwNDdSMXZXYWdFYnFWWlhq?=
 =?utf-8?B?RmpkWm1JQVgvT1dhcXhxTUE5MU96UE5NYXIyWnpuMkpCS3BQY3hCNGw4Z2VM?=
 =?utf-8?B?d21USndGOE84L3dCYjVnUHY4bE5tTUF1NmlYeWVvYUQ2NWpWMDlCblBxSWZO?=
 =?utf-8?B?Ukp4RnhlTWJDMi84YzFpMlNZb3VjaEltMWxkR0VyQVpLMzV2R3d6SEtoOU1L?=
 =?utf-8?B?MVBaZ24zQmpuR0lKZXRDTVNLdlB1Y1hZZlZMb0w4SmlaMVRYWEZaWmx6cmg1?=
 =?utf-8?B?Qjc5YzZBZ0lncmNVdXRzc0wwaG4zaDBhdHlFa2tESHNWQjRnUFNYbkJ3R2hv?=
 =?utf-8?B?a0xHMVNwWk1BbTV4eXBjTUI1NWVTa0RHdEdYZXJQdkNiRm05WkdSMU95a25S?=
 =?utf-8?B?Zi9XZVRBTUE2cjA0WG85a25UL01vcTlIUzcrUEJWRWRKWVVvaUtlRGFqRTJO?=
 =?utf-8?B?bW55YXQwNGVWNUJTZEVVTlo2bGpOVHZ5Y2x1U3hTUkJaY3dXMmY4cHlBVDZj?=
 =?utf-8?B?Si90Y3o0M1A5cnlyak9Zci9CYnp5TEdackZSNUsyak4xejN2NU5xaTJnb3Fj?=
 =?utf-8?B?NEhkV1k2dkZ5K3hNNnpsYWZ3Ym1GWVJaMC9wbXhZVm1CcGUvK3R2cmhiZGdU?=
 =?utf-8?Q?F0GY6LvutEFp8CozB5MQ9/8UJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4220446f-2bb7-41a8-8f8e-08dbafa94cef
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2976.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:49:48.0442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: End2PIlrZtnlshLdtELsE51XJp7FVmSxG2CMio2DwvQNlKFB/06ucBuampfGdgagJIkxVTTRH/F/WNno645JWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/7/2023 2:58 PM, Andi Shyti wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Walk all GTs when doing the respective bits of drop_caches work.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> Hi,
>
> I'm proposing this new version of the series I sent here[*].
> Patch 1 from that series is not necessary so taht I'm going to
> propose the original version proposed by Tvrtko when we were
> young.
>
> Andi
>
> Changelog
> =========
> v2 -> v3:
>   - fix the "for_each_gt()" parameter order.
> v1 -> v2:
>   - drop the gt idling and the cache flushing decoupling and stick
>     to the original version.
>
> [*] https://patchwork.freedesktop.org/series/123301/
>
>   drivers/gpu/drm/i915/i915_debugfs.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 7a90a2e32c9f1..e9b79c2c37d84 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -740,15 +740,19 @@ static int
>   i915_drop_caches_set(void *data, u64 val)
>   {
>   	struct drm_i915_private *i915 = data;
> +	struct intel_gt *gt;
>   	unsigned int flags;
> +	unsigned int i;
>   	int ret;
>   
>   	drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
>   		val, val & DROP_ALL);
>   
> -	ret = gt_drop_caches(to_gt(i915), val);
> -	if (ret)
> -		return ret;
> +	for_each_gt(gt, i915, i) {
> +		ret = gt_drop_caches(gt, val);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	fs_reclaim_acquire(GFP_KERNEL);
>   	flags = memalloc_noreclaim_save();
