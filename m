Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C20672EE0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 03:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF8C10E892;
	Thu, 19 Jan 2023 02:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA0310E88C;
 Thu, 19 Jan 2023 02:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674094663; x=1705630663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/6vnuEwysJH9S7IrrW2Se110VFF1tgRNq8rbQrLCBvw=;
 b=ajrGopXWuJJQ9+xg+W6jhpMqEJaiLhV/qh9S6pe7idmDRUaokKK2SOTt
 4K9s/ERKU/RkxNLmYp3uubdEZfhRBBTg6zQOfbuQszJ7qJ1Nga3hg/K3y
 3invkZYgRwnFd2M8SPsekez6yvSzhBeqXFwnsSP0eBvx53+srzxT+uE8T
 33zy+PMXbZBCh7L6a4xBNqmIbqWmEhKgMuS+qzOV7QtldAnUCiJZIKrf3
 rEplenoIzH4dfcGcqzV/rnYHasdKDp5wsi17pVQADloJoHs/iQoBHcrtt
 1bvWNXFa1GRO+o4tqhf7fDnQsrQX7NjSZEYACt/l9wMD8CCCSJ5U2QQTH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="389666234"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="389666234"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 18:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661963696"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="661963696"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 18:17:42 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 18:17:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 18:17:41 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 18:17:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmcpC624k6WNcRDR40h+4nmRn8CMRIZwZj2D58bVcTC9XCdqcW/kTyT2+jMaLXavWWmk9YJKQlsMkrYBtTussXBKVGstKht13eHoz/2dhAP6XD8w54AqewpxdC14DHVH+5XPnCEDxWJi5k1zrexFpgvJ+mhr1htGH9vEOyj4TEUfqdgMmo+6wC/14EtMQoLSFkYCA9wL1hEPJZuHWu8vvko6q+ghJhnohC5WumvhbHq2mSjLb6+cXbApyfWqk9sYmQYOdkaf/UMSTmlYD7sQYR3FZ4f8wWW1G9JUvEyUx8fzx4a913KmpzY3wjEv4dFwEqeMMy8InJhvgCb0VJq1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLdjcZ1D/o6k3bTgJ5jmhrkcifOo9bp4S4Pkvdr/xvQ=;
 b=gVy6oq3ZcUJi9asV1w7xJkQFTt17vWJNpagw+BLuVjaIv8rwyEO137+eoc3Bt6aiPDfq0YDyV81eiYSDNmgEfqEAX/MruBG83ObRTsHExSTdB/ukxfdshesNAvPjsWirXNxn22DPX2/8wDoJ2CGVFAykGKud+VjEB8KCDqkoIJO8Z4cgkLsdIyXiEVueRGDWuL0hYYQYsMuetzskWW/qW2qoLt5aGqJOwQWMd+N8E6OrwH0xXlk/DOh3XBFIqEGocAr+/FdnJDDqi04/LoAHh+4lkK37oQPkc6LZa0zxVAtAEda/GnochbWsa+Bemiy09seIF9/+dzMgwzM28wZAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Thu, 19 Jan 2023 02:17:39 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 02:17:39 +0000
Message-ID: <a3e202cf-bac5-0906-b87c-1b32f9427193@intel.com>
Date: Wed, 18 Jan 2023 18:17:37 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 8/9] drm/i915/pxp: On MTL, KCR enabling doesn't wait on
 tee component
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-9-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-9-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bcbf5a-53fa-44a6-1eaf-08daf9c35681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mObPDvI7bYm8j/K7lwhcvDX5sx0Bo7RZqj1Oz4SWxlbZ7YZLRbu6IU8yVJ/QBUAgSLe5p9KV9H1ggS2JxifhI+mbUaTI+TcsoS1ODgGE6zl3pd8KV+5x7uNBi/CHKvDFcve/Cou5L9SBEjDLzdNJGHTI8HRIzluZS9QsLof0VCQmFzRJBNq1Q/24FNQebdNxdBzGuhchK6QnXrYzQX9FatlLghmTPO5yuK6di5+OG1BwlikbBqgDlcgNH20mkIftuXAFsoxCNrFOevVAFD6ra89Um7u6zEsFcDSQsVxDyShOoDX4cct587d9NcaozpOLyqs9GVCt45Xq3PuP9d+NtdDhpL6actleFxKttDZrB5NQuMjO62lvxIPwOoTqPpyVOb4XIPiWEjbTxG9Sb+Zg4grtDRtuDX6PWfbfpHgdjPMsJmmuBrbZe7heCGi/4qGn+mS227Tir23gvxbtwmCllRex0FcLoQLvwLHqZRRkc4/j7D+kG+ALbzqbjjsRUdud1iCsNBY4yc+17Wscwb7cOlJpojXDc9Ib9eAdD46LE8qxNCmZa9h5wYRWPHjBlLiofHoSAsLfLzvF2Y7SzT6IyrNJAJQwgNd+Pzlev7r4gxtn4XLW4ga5KyqE/jxjqKpmhJ+0zF6P7U8N1CX9gW1qdFwr75hbYgBXWcLdobQG8OHuaAYmG7E2LR4/iDYVQ4Kpad9id4yS7qLeX64aTHlLZW5lO/xP1zDVB3W5wq9muoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(31686004)(86362001)(2906002)(66946007)(66556008)(8936002)(5660300002)(66476007)(82960400001)(31696002)(38100700002)(316002)(53546011)(6486002)(6506007)(478600001)(36756003)(8676002)(4326008)(41300700001)(26005)(186003)(83380400001)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHZHdmxNQ0NXM0F6cWZhNUQ3SzJycHR2YVAyZ2lCeWxmVEJqWmVLUXM1cVJM?=
 =?utf-8?B?cE9zMThjNXNzSDR4Q1ZUOEpOd0FaOXgvZWloMEtVaU5qa0FCRCswL0o4ZUJT?=
 =?utf-8?B?WkcxVE5TUFRjU3dYQWdqSjhML0hIZ3E1RnY3Qmt1OHlJdmdkYTRZNmFWUzMw?=
 =?utf-8?B?OTA3eGw0cGNKeHdjVG5JM3NuSkt1U01zY08xVENHTU93NWFHQ3JVVS9ueFZT?=
 =?utf-8?B?RExBY1pUWFRVNDVqN0VmdnJoYktqd0U2bnRnVFVXTjlsTWY1dG1LbzJMOG90?=
 =?utf-8?B?MnEzcFFURkRyNTNvYVAzY0JocVMvYmcvOG9GemFYNzhrNVhyMEtHY3pLZm5N?=
 =?utf-8?B?RFA0dWlXbW0rVG1vcU83ak5ISWczaXp0K0x3TE1ER0trSWRKZUZBbGk1QUMw?=
 =?utf-8?B?dDlWVUI2akhmaTBsWEZWU0QrNVZuNXlrbGJBTUhyYitFK1R5emdqNjhST2xq?=
 =?utf-8?B?NzR2ZmlkcS90dkphSlI1RWlRQXhjV2FnOXVCeWpHVStnUTlmcUJMZ29pUXIv?=
 =?utf-8?B?Skc4Zk13Sk1NcC9BalRha0tTdTRYdDRteXl0cEtJZ3B2b2RGeXVxalVGQVJ4?=
 =?utf-8?B?TGRUdFBZRnR3SG1SZXp1MTJZWllhL1Rrajl1bDhPWW1ZaDJVZnVHZDlUYUY5?=
 =?utf-8?B?YUNIYk9ubXh3d25sQjdPL2pzYlFxanN3dndTcStzcFk0UU9VczMwWXFzNVJC?=
 =?utf-8?B?SGNYZWJ3YTBLY1pKcU53Tld0bjZTNUhXNWZqRDVwMGJSMUVPTWhndEFPUTRS?=
 =?utf-8?B?RjdHQ2VRRnZhU2ZIRTdnMEdnV2JaK051bzNPQnRyYWpGUHBkMmFBd2FWV0k4?=
 =?utf-8?B?VVQrNVQ1eTB6c055eGx1Sk0vR3hTd0RObU53UDJ3ZXp0a1p6T3VyRGNlNEFa?=
 =?utf-8?B?VXV5QWl4UEV1SXpmRE1TU0JTb1BVb25obXlldTRUK0RaTVhNbGdXSUN5bDJ6?=
 =?utf-8?B?SVdBd2lweHdWUUxiUU82aVJhaDlXR1JvOFROR055QWhPSktIajF1RW52UFFj?=
 =?utf-8?B?NmNDZGlSSWRTb2FiRklFYTlwc2JyNU0yS0N1akN2WTFmV29VOTVSdnUvRFJn?=
 =?utf-8?B?MDJkMk8rdytpbitRbWY4MVZWUUtJRXBjMzNEek9BN0ZnUm93dDZQOFFWS09W?=
 =?utf-8?B?UFFldHVBa2NxWmdpOHlTYnN6eVNOTzBiaVhDNXFKemxlVG9Sa1kySnFqVVhF?=
 =?utf-8?B?dE1HOXFOUzV1YVd3WTROcWlTdUFwelhxbWFEWXdYcWFOWFN2VjJKNUhMMjlw?=
 =?utf-8?B?NnhSMkk3aG8rWXZDbGlTWW1nSEpLL2x5V3A2K3l6U0hacVRiakdlUHZ0OFAw?=
 =?utf-8?B?MWxEcmlvK2Z2YUp0T1M3d0ljakdEa25wQWhCWVIzOXg5eWtWV2p4dm8rMldM?=
 =?utf-8?B?blVMNFJWblJlVGtIeXIwYW5LUGdFWEZoNGp0WDZYTFpFMkh6RDFyeEJqVXpm?=
 =?utf-8?B?dnJhUmtVbEFLSjJtRFd6U2ZIWjkyYjVNK2NKbFRzUzZMSVZQZjhKM1dWT1JS?=
 =?utf-8?B?alV4YU16bUhQZThHcCtKRngzNU5rbHV6N2RmWUJOVlN2YWlFK3g5K0dBL3RT?=
 =?utf-8?B?K0E3QlhSTU9YNGQ3RHQySTRwUllTQUF2RnRRQ0xoNThCVFFFUEdhQ1U4ZFho?=
 =?utf-8?B?QURLRTRDak9HeC9iSGYzUm9CNUJSbm1DdkYvNEluSjB5WW0wczMwRmFRWVZ5?=
 =?utf-8?B?NTJ3Nyt5Q2svVThWWS9NYWViekpPRmVLNElPbzhZcERWY0FMWTJvRTZaVzlH?=
 =?utf-8?B?NVR5WjJmNXJnTy9CemYzaHVvaDlZRStoTCtXb3E0ZE5nMktmaGdXUEZKVFZh?=
 =?utf-8?B?Q1NtMWhOcFdpSmc5eklnd043ZTVFSEVhOTh5dFdsd25DNnFPaEQ1NjE5K3BK?=
 =?utf-8?B?Z3RaYTBWcUhPbndJL1d5ZDVRbEZZNFRJU0hkNFZuMWNnYmM1bHFEL1U3ekdV?=
 =?utf-8?B?UUQ1MjJEOEtONVBXaGg3OFFlNkx5UmJMYTJkWElOTnVBRUlXbGs5UC9RWTFY?=
 =?utf-8?B?dzl4THVybnVnb1lRNW5uUG9ub0g3N1ErTzJtWFM4WFh2OVA0c0srajE5cjM1?=
 =?utf-8?B?WU1aN1JOQjN0Q3hQZ01WN2hLdVdiajh0OTZQOEJzR1VLNlJpd2lvOExrRDUw?=
 =?utf-8?B?WUdXaEZyUTFqUVNOMmppazRyWnlWVWZXeE8xc0F6TXl6TWdzTWtJR0ZvU08v?=
 =?utf-8?Q?bU4C0nXCdGNTOCqo4kDT730=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bcbf5a-53fa-44a6-1eaf-08daf9c35681
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 02:17:39.3618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WWaAjNPruFGzYaBVY68o/KhQM9RsK52Vqoqd9lRYLh5QIzKqfbLV83skZd40rFS3U8MSe/HjO7+AA5UIU97Q3Q0+TiRyv5Sq3thwHZSlIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> On legacy platforms, KCR HW enabling is done at the time the mei
> component interface is bound. It's also disabled during unbind.
> However, for MTL onwards, we don't depend on the tee-component
> operation before we can start sending GSC-CS firmware messages.
>
> Thus, immediately enable KCR HW on PXP's init, fini and resume.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp.c     | 52 ++++++++++++++++++------
>   drivers/gpu/drm/i915/pxp/intel_pxp.h     |  4 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c  | 10 ++---
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 13 +-----
>   4 files changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 809b49f59594..90e739345924 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -143,10 +143,12 @@ static void pxp_init_full(struct intel_pxp *pxp)
>   	if (ret)
>   		return;
>   
> -	if (pxp->uses_gsccs)
> +	if (pxp->uses_gsccs) {
>   		ret = intel_pxp_gsccs_init(pxp);
> -	else
> +		intel_pxp_init_hw(pxp, true);
> +	} else {
>   		ret = intel_pxp_tee_component_init(pxp);
> +	}
>   	if (ret)
>   		goto out_context;
>   
> @@ -249,10 +251,12 @@ void intel_pxp_fini(struct drm_i915_private *i915)
>   
>   	i915->pxp->arb_is_valid = false;
>   
> -	if (i915->pxp->uses_gsccs)
> +	if (i915->pxp->uses_gsccs) {
> +		intel_pxp_fini_hw(i915->pxp, true);
>   		intel_pxp_gsccs_fini(i915->pxp);
> -	else
> +	} else {
>   		intel_pxp_tee_component_fini(i915->pxp);
> +	}
>   
>   	destroy_vcs_context(i915->pxp);
>   
> @@ -304,8 +308,9 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   	if (!intel_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
> -	if (wait_for(pxp_component_bound(pxp), 250))
> -		return -ENXIO;
> +	if (!pxp->uses_gsccs)
> +		if (wait_for(pxp_component_bound(pxp), 250))
> +			return -ENXIO;
>   
>   	mutex_lock(&pxp->arb_mutex);
>   
> @@ -331,16 +336,39 @@ int intel_pxp_start(struct intel_pxp *pxp)
>   	return ret;
>   }
>   
> -void intel_pxp_init_hw(struct intel_pxp *pxp)
> +static void
> +intel_pxp_hw_state_change(struct intel_pxp *pxp, bool enable,
> +			  bool skip_if_runtime_pm_off)

"skip_if_runtime_pm_off" is a bit confusing. maybe "needs_rpm" or 
something like that would be a better option?
I'm also not super convinced about this common function with a 
conditional rpm. wouldn't it be simpler to just add an 
with_intel_runtime_pm_if_in_use() before the pxp_init/fini_hw in 
pxp_init_full and pxp_fini? Not a blocker.

> +{
> +	intel_wakeref_t wakeref;
> +
> +	if (skip_if_runtime_pm_off) {
> +		/* if we are suspended, the HW will be re-initialized on resume */
> +		wakeref = intel_runtime_pm_get_if_in_use(&pxp->ctrl_gt->i915->runtime_pm);
> +		if (!wakeref)
> +			return;
> +	}
> +
> +	if (enable) {
> +		kcr_pxp_enable(pxp);
> +		intel_pxp_irq_enable(pxp);
> +	} else {
> +		kcr_pxp_disable(pxp);
> +		intel_pxp_irq_disable(pxp);
> +	}
> +
> +	if (skip_if_runtime_pm_off)
> +		intel_runtime_pm_put(&pxp->ctrl_gt->i915->runtime_pm, wakeref);
> +}
> +
> +void intel_pxp_init_hw(struct intel_pxp *pxp, bool skip_if_runtime_pm_off)
>   {
> -	kcr_pxp_enable(pxp);
> -	intel_pxp_irq_enable(pxp);
> +	intel_pxp_hw_state_change(pxp, true, skip_if_runtime_pm_off);
>   }
>   
> -void intel_pxp_fini_hw(struct intel_pxp *pxp)
> +void intel_pxp_fini_hw(struct intel_pxp *pxp, bool skip_if_runtime_pm_off)
>   {
> -	kcr_pxp_disable(pxp);
> -	intel_pxp_irq_disable(pxp);
> +	intel_pxp_hw_state_change(pxp, false, skip_if_runtime_pm_off);
>   }
>   
>   int intel_pxp_key_check(struct intel_pxp *pxp,
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 04440fada711..6c1fe3f0a20c 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -20,8 +20,8 @@ bool intel_pxp_is_active(const struct intel_pxp *pxp);
>   int intel_pxp_init(struct drm_i915_private *i915);
>   void intel_pxp_fini(struct drm_i915_private *i915);
>   
> -void intel_pxp_init_hw(struct intel_pxp *pxp);
> -void intel_pxp_fini_hw(struct intel_pxp *pxp);
> +void intel_pxp_init_hw(struct intel_pxp *pxp, bool skip_if_runtime_pm_off);
> +void intel_pxp_fini_hw(struct intel_pxp *pxp, bool skip_if_runtime_pm_off);
>   
>   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index 892d39cc61c1..94c1b2fe1eb2 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -29,7 +29,7 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
>   		return;
>   
>   	with_intel_runtime_pm(&pxp->ctrl_gt->i915->runtime_pm, wakeref) {
> -		intel_pxp_fini_hw(pxp);
> +		intel_pxp_fini_hw(pxp, false);

If you go with the runtime pm inside the intel_pxp_fini_hw, then drop it 
from here and have:

intel_pxp_fini_hw(pxp, true);

>   		pxp->hw_state_invalidated = false;
>   	}
>   }
> @@ -40,14 +40,14 @@ void intel_pxp_resume(struct intel_pxp *pxp)
>   		return;
>   
>   	/*
> -	 * The PXP component gets automatically unbound when we go into S3 and
> +	 * On Pre-MTL, PXP component gets automatically unbound when we go into S3 and
>   	 * re-bound after we come out, so in that scenario we can defer the
>   	 * hw init to the bind call.
>   	 */
> -	if (!pxp->pxp_component)
> +	if (!pxp->uses_gsccs & !pxp->pxp_component)

You have a bitwise & instead of &&.

Also, I'd go instead with:

if (pxp->pxp_component_added && !pxp->pxp_component)

so we focus on the component availability.

Daniele

>   		return;
>   
> -	intel_pxp_init_hw(pxp);
> +	intel_pxp_init_hw(pxp, false);
>   }
>   
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
> @@ -57,7 +57,7 @@ void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
>   
>   	pxp->arb_is_valid = false;
>   
> -	intel_pxp_fini_hw(pxp);
> +	intel_pxp_fini_hw(pxp, false);
>   
>   	pxp->hw_state_invalidated = false;
>   }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index d50354bfb993..9b34f2056b19 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -141,16 +141,9 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
>   		}
>   	}
>   
> -	/* if we are suspended, the HW will be re-initialized on resume */
> -	wakeref = intel_runtime_pm_get_if_in_use(&i915->runtime_pm);
> -	if (!wakeref)
> -		return 0;
> -
>   	/* the component is required to fully start the PXP HW */
>   	if (intel_pxp_is_enabled(pxp))
> -		intel_pxp_init_hw(pxp);
> -
> -	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +		intel_pxp_init_hw(pxp, true);
>   
>   	return ret;
>   }
> @@ -160,11 +153,9 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
>   {
>   	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
>   	struct intel_pxp *pxp = i915->pxp;
> -	intel_wakeref_t wakeref;
>   
>   	if (intel_pxp_is_enabled(pxp))
> -		with_intel_runtime_pm_if_in_use(&i915->runtime_pm, wakeref)
> -			intel_pxp_fini_hw(pxp);
> +		intel_pxp_fini_hw(pxp, true);
>   
>   	mutex_lock(&pxp->tee_mutex);
>   	pxp->pxp_component = NULL;

