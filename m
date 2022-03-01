Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DB44C93E1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 20:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAEE10E1A8;
	Tue,  1 Mar 2022 19:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B22010E1A8;
 Tue,  1 Mar 2022 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646161466; x=1677697466;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hYwKixAIVW6SCYJrcgrpJgR2Ifxq9rCcGQ8zwvw2rZU=;
 b=Kar4Q+ursGJO53QNIOtWGYimcQVSHwaWeNSbsMdw4ZzNijUZshWZ1dwi
 FJicjdp0N3IaDS8NuZMkanmUmEsFJDthMdYolO7j//8zej0C63LWwRJQ0
 h86Vg5jZ5DBQUtlGYbvqS8x9RSG+1kXr5quXOshyD3C1ASugGqRhPLxou
 qnNMHosM7lyA1czVWFD2yEVVqbUbF4PGY4aVTCvoqSJex8DA8bkKWnQFQ
 bB9zO94E4qXTe5t5J960NAhSKwoK47/RgJUeTpPWD6I2OMN0SVgiPZou8
 OeFk/iH0QTnklJ65bJ/OUZo6KLCE3GxXzJTNDUaEZWl+E7A/CwTN1BdE9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="277883499"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="277883499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="545204410"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2022 11:04:25 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 11:04:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 11:04:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 11:04:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICn/Zy6gZxPFkiCCN4mpvqtYbVUs3VOPE3TzcpNXybSveK94V5C8EqdCR3IPi13/4im3XJZWDaacdgw5na6xzZpIUWyjYOCgZ+KBXCQCLs4oU/NRrIuaKIGttAab7bAFnM0TW7ZnOmmUBwKatqwGFH7/+KaHM7wVheAxlCB5+K4w86B8tr38GDRQms8SLlrXiRrSj1i9cW3EZ7/vuf9L+lF8j+uqs7utdbfq6ZPNTLwhmKPnDZ8xf1MMjcGEj891GBSYdEa3aCoiOwNoL1RiKAtUxgiAfilhyUnS7k2lMAbhwx1eYR450LRyMwgLs8s7gbVqgj7l4zUXy4Z3uOH0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoZ6QCYddKw/afovDIFCsYfmnxkiMuIPjhnuT7icKUw=;
 b=bobRxbbazBogVFrBT1XhpJ6XceBKE1mniudTPoE3O4FxFSqvYBBG0UJ7Oqv/kNqxn0lGqIMnpUovO0AToYOxYC8vZd+x2SQf+OnM9MNz3XtQXOL5Nt0zSoB/9wo3YUufEfFQ++VdwQckDDkGcO9GIFiyfxZU/QowKpqF6ujTuLc+/edIzbP9m5XCQ4myzULoGSl2UWXMuU8hmNPdU/DJUbgHZ+wiSEiYISJeMtmFjXzD+UVfyY6vKAsJe80sQuR3C4K/+Ft2DHH3V+JZfxpCOQZ24hq7kGutVSzewwXcGBuPYop84QFBtFE1ZJaI1myJt1/8V++TqpfPEh69+Wlx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SN6PR11MB3311.namprd11.prod.outlook.com (2603:10b6:805:c1::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Tue, 1 Mar 2022 19:04:22 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 19:04:22 +0000
Message-ID: <8b612a83-39f0-df28-bc39-d727c9b9c483@intel.com>
Date: Tue, 1 Mar 2022 11:04:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 10/13] drm/i915/xehp: Don't support parallel submission
 on compute / render
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
 <20220228174245.1569581-11-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220228174245.1569581-11-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 530cf2da-e5bc-4261-c718-08d9fbb64bab
X-MS-TrafficTypeDiagnostic: SN6PR11MB3311:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB33119DAA8C608E9DEDECBCC2F4029@SN6PR11MB3311.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nl4MRX7Kifsiv8/5i25MYuR1+RkZYewBSUvXUbz2lA02sQpgwigGYTYz5CO1IqOYXrsTakB+IrG0AWHSCwLjw51kQyahNgPiUyCQyerll7XJt6ZO7CBkr3N4qAkMYQDGhS6psxrkiDGyBqv7gwjvhZAzJetLy+UCzWSdPuNKSwRRz3arj9BUcgLAwOTslbk+dvhVZwZOBIK/fah+CC8olA/dzGsD0czwi2c8X2GnApGNoTWh0dFL0hRUPTtxETM4fWKroBAUZtJ2z3+PWonVJugoLiX4ipoP0ILxqMklyNJ5s4xHmyCoRL9xmHHweNZXqokRXwLWePntY4heq4/HhURA9G5b7LM18Y7JvDYVujaHCEbfH2k32MhwiDjE/Wps11E+CCzpJ/ydspJJ0XHQBJh+tjwO9R69janVUKflqobZmDkdCb+z8kwJcxebgIhK96ub7XhF3D7laQTDf8mrdfovssnG6uAQdzsMiVNIKpskEPOfUTGTiOv7yAsDSJL+qY6i1G+y9knQrONwhDldFCguW8+GXOAgy66h+dQW1FAQTV5rWKorXaplqgOG6eLBi69JO0jmQshtyySLOJxbIDVlA9qc/GEF0Gc+rmvJ8DVQdkL4EsPXaJuzmELG1VWM1NP7kZ/HfEzjBhQZR5DaQssElXHR+KrUPIMo6X8EvvrE4Wpv2bMIzuhTqTYCaUnM5+SzEtDb/6smEgLYBXaR9UmfL4lXtAi3cvTscv5vZ144gRYZ7Uq6WnHyuaLm8sex
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(4326008)(6666004)(31696002)(82960400001)(36756003)(6512007)(31686004)(6486002)(508600001)(86362001)(38100700002)(316002)(8936002)(2616005)(5660300002)(53546011)(2906002)(26005)(186003)(66476007)(66946007)(66556008)(450100002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnV0SDJVbmRHc3VNVUJHKzVJbUZUU0NHRmx3VG12N2E2bytrV1lERkowMUZZ?=
 =?utf-8?B?MHFtaWhKWDhlQXBuc2RnOVBnOGRlSEZJUDRLZEFYSXkwZ3ZkQ0Vjbi9YTDc3?=
 =?utf-8?B?QldRZkxpT2RxbGpMcElRMHQ0aVI1YmhPRVVZNmJxeWcrK0t3Q0JvNzJTWURO?=
 =?utf-8?B?Y1NoM3FSTytQK3pQME95UTF3WGVxNm85REM3bXM4MWxyTVdHMFJ5aUdsZVlZ?=
 =?utf-8?B?dVNoMlQvQS9uQk5nY3ZHUGZyRXBlc3FrMlFvMnNQZTJFMzdFWUw4V2VHbnFt?=
 =?utf-8?B?Z3c5OVRuNktCRDZJQzVqbS93eWR0cGtZVXhmMnFuRGVVdkZrKzRPemdWS0xY?=
 =?utf-8?B?dzJRUGlncGZvcmlYZkJBSVZPZFBzeUFSekJPdUQzUEFSUC9sSkRsSGU3ejFQ?=
 =?utf-8?B?T2FTdDRwczNYSmdvSXZpc2k1MWgxdUdnMVgrdUlwOUVscVhFQmd6K1FYeXRn?=
 =?utf-8?B?UkMxZDZSRThEZlliekZRSENSTzNXcHJxd3ZiR2lDRXRPUUNidkEwcWNGdUQ3?=
 =?utf-8?B?NjcyMmcxU0VsS3FlVFNaNUZtOExNZ1pyTldiNGR4M3pUMllES0ZVUHFYaE8r?=
 =?utf-8?B?dGUyTENDczNJaVNzVW1TcXJHK3l2R0JWQ1BCQXpnUWkvTlRWc0ZtdUdLZGtP?=
 =?utf-8?B?TzBPZStkaytYMmg3MzA3eFpXdVBaQVN3NktqWkhCWkZnN2RCR2MvTG1pajV2?=
 =?utf-8?B?eGJ0SUcxQ0huczNNaWZKQ2lyS2o3NHBCUE13QWRKMFBZcVo3YTlJVUdvK3Mw?=
 =?utf-8?B?MklWVVhPUUFaQWIwQmZ6ZFN3Z3l0bGNIRlEvaGRaeUlXRGpiTnludW9TTzJv?=
 =?utf-8?B?OGg0eEovRHhSYUxRWUw2QUZUa3M1VE5LOUJaS1FDM1FQaDVpMEtjREFGRCtw?=
 =?utf-8?B?SDUwZStzTVhlS202ZnBiTEo2NENheHNwTXBPbDJHRk5oYlAxdjZKVzhWVmEr?=
 =?utf-8?B?T1ZUQ0NRRU04ZTBHMnZRSC9tb3JXWkN3Z2hKQTFUVTZNWFVENTBRQWp0UXZh?=
 =?utf-8?B?VVZrZ2pRdGxtbktWNW5DbGlTV0ZlQ3psVTRDMythT081N0pRdjUxRVJWa25l?=
 =?utf-8?B?KzVKRlRXVUhLMlRrSSswc0NXRzBITjJSOXI0YW9Mak9kQ1JCSHVERmtjNkxF?=
 =?utf-8?B?dWxUSnRzVEx4QlllSTBVbmFMeVhwZWZWOXFtamFURkJKWjhVdEk4MG42eTFn?=
 =?utf-8?B?a21DZUU5RHA4MHZ1a0FRczIyUEVKTWNBdHNvK0JuWnovbEcyMmd6NHRMZTJj?=
 =?utf-8?B?enJLMnp5RTFrVlJjUUw5WGw4dEJJQXY2V1ZtZkRhaXlHYzNsbTJJcWF5UThu?=
 =?utf-8?B?TGhnQStrY1VhRXVtUmx3UVhjMy90S01YMlBQWXlzK0dkbStTQ0lyeC90S2d3?=
 =?utf-8?B?TDUwYnAxTE0vc0JZZFhSYytLWmREWVNPWFFRaW9sQnRCRmIwdU1aRkNEb2pS?=
 =?utf-8?B?UVdRZG14SEwrbzViNndUR0hCenVzSENINFZXci9talNHRGs5MFNKckZRaklW?=
 =?utf-8?B?UWxyQ1FvSzh6QTMxZ3pNeU93ZHp6L0RETERVR1NaeHJ3TXNqbFk1NDhlZUE5?=
 =?utf-8?B?REh1VGFaWUh5UStMWllQeHFEd0pBbVBZbVFpSWk0aEN6b0V1cytpR0pKQXZr?=
 =?utf-8?B?b3J6ZFgyQ2hhckdoTmVOZDR3dlZCeE1UN1hOZEF5V1RLL0JITE9kbUw3SmVM?=
 =?utf-8?B?c0xyNkdBbXFaRjZkRitvcHVWeUxtSENJSTBLQ3hlREVZQm9zL292RVZWSUZk?=
 =?utf-8?B?MGNqM2J6MTlZbXo5Ni9rc3RCVURlY1BSN2lNMm10MlpjZVVzS0ZoS2k2ZDB3?=
 =?utf-8?B?eHQ0WXdCRlVnVVVLMTViT0I1TWYrK2I0cDVPQ3ZISllvYW9uL1RXMXBTMDlL?=
 =?utf-8?B?amNwWUtybFIvT1UyQXJZK3J3ZHQ4T2lSVmVOL05rUTJxUEdjWVVhY1QzRktD?=
 =?utf-8?B?aTdpWmdXNXBWRVl1VVBiSENacmluQUhPdnVWVUdCL3Z0a2paTk8vMUFGZXZj?=
 =?utf-8?B?eXdHV2Q2OHZnNWJnSmxLNm52Vm85MFozT1p0ZG4xelI2c1VMMDdiRWk3L0RR?=
 =?utf-8?B?L2xqcUwzVVBOWGhyaDFLQ25VdFRvZDI5RmVrdDdBa3BRMTRDaVJYb05iQzh0?=
 =?utf-8?B?SWFBN3NIQ3hSVm95V3JyandZS2pRU29lekQwREZJbGkwd1krc1VFL0k5ZjN2?=
 =?utf-8?B?WnRvMmswWmVLNG1mMkt0VnlhSlEwcGtBaGZyd1I4VVh0ZlZXWXBRNGlEM0xv?=
 =?utf-8?B?azAxVW9YK1Q2dGJYclcvYlNzdjNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 530cf2da-e5bc-4261-c718-08d9fbb64bab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 19:04:22.5865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYj4PrXEbauO5//b1FtmS+eb8x1vb7Th4PrXe2mM8GGMt8K8h22fdAJv6F2Vth6UBjXG2Dun+0X5X4XyBEKvpDiQOX4IjL9DKBJQQdCadvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3311
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/28/2022 9:42 AM, Matt Roper wrote:
> From: Matthew Brost <matthew.brost@intel.com>
>
> A different emit breadcrumbs ring programming is required for compute /
> render and we don't have UMD user so just reject parallel submission for
> these engine classes.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Excluding the RCS is not really required given that there is only 1 
instance and therefore can't be used for parallel submission (which is 
why we didn't need this check before the compute engines were added), 
but I agree that for coherency and future-proofing it makes sense to 
explicitly exclude all the unsupported classes.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c         | 10 ++++++++++
>   drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c |  4 ++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index bc6d59df064d..9ae294eb7fb4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -670,6 +670,16 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   				goto out_err;
>   			}
>   
> +			/*
> +			 * We don't support breadcrumb handshake on these
> +			 * classes
> +			 */
> +			if (siblings[n]->class == RENDER_CLASS ||
> +			    siblings[n]->class == COMPUTE_CLASS) {
> +				err = -EINVAL;
> +				goto out_err;
> +			}
> +
>   			if (n) {
>   				if (prev_engine.engine_class !=
>   				    ci.engine_class) {
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> index 1297ddbf7f88..f9218a37d170 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
> @@ -154,6 +154,10 @@ static int intel_guc_multi_lrc_basic(void *arg)
>   	int ret;
>   
>   	for (class = 0; class < MAX_ENGINE_CLASS + 1; ++class) {
> +		/* We don't support breadcrumb handshake on these classes */
> +		if (class == COMPUTE_CLASS || class == RENDER_CLASS)
> +		       continue;
> +
>   		ret = __intel_guc_multi_lrc_basic(gt, class);
>   		if (ret)
>   			return ret;

