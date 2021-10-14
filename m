Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86842E003
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5FF6E0C2;
	Thu, 14 Oct 2021 17:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49BC6E0C2;
 Thu, 14 Oct 2021 17:24:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="207851563"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="207851563"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 09:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="461258556"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 14 Oct 2021 09:56:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 09:56:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 09:56:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 09:56:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hesnqhG8jtRov9VIgEOLvrnVj7HigQz7saPa+7h5ubWw23wFyvcSdue+kNFrElnFv2Dh4FWPD1yC4FZXzHFyL45mHVboIcS2FiUZlUe3q6GsPIgVyYAJUVjcn733T+ElusEd8mOlm/kig4QY+FNEQexJ88YH+YdU4Q1a02F1JfWuIGilzUaRGY9Oj5nOM82blRXLdbji44XaHQ+vtG49089Ph4I3JRe4UXbk1ESgK1Md4kcjrC1p8Sz6guX7IpbruhD0fjS2laXCcbb8Ee6bvyecRzG7mb9Ror8d/3lAFeXsuVToOcmbi37hBVOvg4vlZiAD5FLOr1X2Vct9l58GuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dZuD8swQr2eAnbdxygaFk8hXu0CZJE/yob+PUrwS4o=;
 b=c6pwro1Y4qDpg8JtW8oNA9HGgjaGC+7vMndzqXN42wBPUwnk+5PEXUrQ+1x5weeMXao5HRuEavfMqpsuAaDnqG4WbH3T83agI0pz8BZLalTjWy+0iUCJxuWB6/7yK3qATf4cTezAhHWt55zH0qTuVVagHWGLSBZ+k815Esg77FQoooRVUX7pu/82cdiPgav7OUO2vcISXS34WJDXBE+3s4cK3eCGgTzedL/N+xa+AUYdwiRiSNQxrrOqRjBrieRF33OWVi8eRtFXTatDWwicwtB0aMM59qlfwXpUBrmA3YWrw94VtTuSV3O4Y+dzTGXzvDdRbvT5QzBT34BtnV7yrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dZuD8swQr2eAnbdxygaFk8hXu0CZJE/yob+PUrwS4o=;
 b=T1r5OBFJ0d6l9HnaHdYdJT8VBZqld6BZxjy8Nalr72EImo0JkQY7GZB3YXIDHKGYG5kQiJAjAiQ0lZn4ckJLaoP8ZyM9RsAVHo1gdBc+vXdmSCU+RVT3iaisub4SvQQ91DR7ioVSAbjmBYbj1OmI8a1deisoZU4D0Mj+nTfYye0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5579.namprd11.prod.outlook.com (2603:10b6:510:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 16:56:20 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 16:56:20 +0000
Subject: Re: [PATCH 11/25] drm/i915/guc: Implement parallel context pin /
 unpin functions
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-12-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <6fcd4009-8c74-da3c-cdb9-e6b8301fb596@intel.com>
Date: Thu, 14 Oct 2021 09:56:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:301:1::28) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR11CA0018.namprd11.prod.outlook.com (2603:10b6:301:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 16:56:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c77bac2a-d052-47b2-f73e-08d98f338c00
X-MS-TrafficTypeDiagnostic: PH0PR11MB5579:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5579CCF9967E53FCABAFD015BDB89@PH0PR11MB5579.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GK9BU+HdKM3o1DSIVH1FC6Ttz9WLAWRN0RSSxEamehuTmEgSvzYevkuWXIRC0jdV+YUUmXI3hRIJbGYXjxQCL2gk1laAhYBh21VJdKYf+jv/2d/aD8UqUVC6wRC9JqnuJte2ZsuFgl+CYGMHHcENfBx5keqkiY2cfX/bfijDCtowSc0ExLqk3aH3ekUjfTVqdyUC6a8tW5AJZiab8bT7dvlklZLrmZF0LMmNIYxFlbC37i2jSLQr8jnfUn/pFpkefJ5ZqOBXa3ACPawGwGSkkEqzl4TQnbijzHCELc2DqQZTzIngnQxHkEB6jmsyM3Y6WftT/Q3AI+jo+/FDXK1bzDnGlwz5tskNQzp2h8GY+WKVB8SF0Fapq/B6ZHHp/mfCHkKTIyAb83C2pvO2i6UiXmTeSUV+2E62sHvm5KylBQKSuWdceTYH3xJhQz9ZqOpZyhZNdew7LH1VsSXvJbDaZ/Rql3Jna7947AfNYN0GC0GJV+q/YUEUfKJXvyrtmLB+no5ERYEreL4oUntyQ2PfUIamfkf+u/M/VWTXazd9QQ8KOKIUOb04HxhxPzAMVg5aR/jviN8bF6JXSjXCWibMrYsBLJR6qrTb3jaPl/zvooM64eks9vR8KwqNWp2FbSl2maX4bbyF3zE+uaejwaI9INVf7r418dmHwFpoUhin6dwwI1tEBZ/4v/wEHUa/AxtlTkzprQEnNZRccxpHzZ1n18e2fCuSxEVmV+R26uC8Tyt2ZywRV6FCb8VVxFt/rEZ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(5660300002)(31696002)(8676002)(86362001)(956004)(316002)(16576012)(450100002)(6486002)(8936002)(66556008)(82960400001)(66476007)(26005)(53546011)(66946007)(38100700002)(2906002)(186003)(36756003)(508600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZPWVN3L3R2bkJjaUo2eFA1NmZkVmV1eDNXY3laVmo4YVUyOHlwakYyUGFt?=
 =?utf-8?B?d1F3VnpCVms2OHRNN215UG1ZTGljN25sY0FJNjNuclYrVFFEY0pBczEvTUh6?=
 =?utf-8?B?TnNOcDl0NHJKZnN1b2NGSm1DT3JvbSthNlBsQkNUZUUybEpreVkxRk15b2I2?=
 =?utf-8?B?bENtTFZZMklRbEtLdTB6T1lJc3hWVjFDQi9PNGdtY0xCSkJ1clIveHhUVXJC?=
 =?utf-8?B?MGtYRksvaWlrK3JhSUFLWUMxS1lDWXJRMktqdVJ5cU9oLytzLzlZNFprUVV6?=
 =?utf-8?B?Z2RQRENIZXhPdWtFeXZoMjAzdWNEMEVlZEdhL3lOcldpcktUYTh2SnBYZkd5?=
 =?utf-8?B?MlZRRDFIRURWYm5sZXFtbU5KQ0pSWkRtdGswcjJZT1ZPeGhuRUZDc0tUR29x?=
 =?utf-8?B?SjU3ZmYvSzJJRUE3QlZsR2RYU2tMVUk3ZkJ2SUt2cUtoMGZmU2g2M3N2TXo1?=
 =?utf-8?B?Wjk4YmVEdEx2NkkxYVdhU2xvWHNEY00waFBjWFpLb0F6elU3MnhDcTJuZjhP?=
 =?utf-8?B?V2s1UDRxRkFuSTJrcFUwaVRNNS91OEJucFdzejV6bVhlbjY5ZzZYSXA0NDQ2?=
 =?utf-8?B?dG5HYWVnR0VWVU1jdmR2enQxNWVxYmw4alhKZm9DQVpwVUx4TWtaMDVlYktH?=
 =?utf-8?B?dlR1ckhhU0drcTMveGRwcWc1dVV3UnkvYWRwdGhtckpkTjhzMnhYRy85YlE5?=
 =?utf-8?B?bVdEVmQ0TEVUbHNodldVMFBaM3ViOG5BK1lDaWRHS3NiZDBjd29aUDJYOXpM?=
 =?utf-8?B?T2NLQ3BhSUtDWURiUmhPK2dzYTBaMGRDaUdSR2ExQmhIc1V5dllrTTNyb0ZC?=
 =?utf-8?B?cHVNVUVkYUFzMjV1STh4ZHBFNytuaFhMalFDN2lGTWUzV2JmS2xWRWtKRDRY?=
 =?utf-8?B?dW1nUzdIOFdJSVh1RHZYUUkzZUMwcWs5RHhyaHZUYkdCaEkvT2pXU29YdzRL?=
 =?utf-8?B?bks4VkZ3OUt6SjJvUmNYRXRhVjlGSXJvWWxNY1p0ZU1IdzFKSG14UXFkWkVC?=
 =?utf-8?B?SkExdi90ajY4bUFCNkkyeTFLdUZma0ZmZVh5TTJuRmlZT0wzaDdkRUJYVlF3?=
 =?utf-8?B?a21JdEFaQkF3TldBc2JIYlZiTDFPb1FQWFBoYkpkTnRlbVM3aTdkaEp3WWdp?=
 =?utf-8?B?bHdpNjdqSXY5aE9yb2F4azdackQ3YUNSMnRiZTJ4Rk1BQmZ4U3JydU1hOTVS?=
 =?utf-8?B?aUxCRmNway9LZG1MZ2VuaHZOa1k0d1JZc3R0c2hpeG16WjJya1JBN3J6TlFH?=
 =?utf-8?B?Z0Q5ZW42OFFxbDd6QUI1UldMbVpIa1FjSkJ0czg5Unc4cVFyQVhXVlNBNkpw?=
 =?utf-8?B?aUY4RlozUHdUa0VFUVRZR2c3TE5SVWVkZzdNYjZNT05rTDVHaGp4NjBCNW5C?=
 =?utf-8?B?aCt3eHVsQ3lCUlBpTWdkR0RxbS81cllsK0ozbE5pQkNIdjM0Wmo4VnpscS81?=
 =?utf-8?B?NldkMitjQ1JOWjhwWUZMMSswbjhEMW1odlFQcC9SNCtsSEN1OTBnVW4zeFly?=
 =?utf-8?B?VWgwSjlGRlhtMU42VG4zaDRXQlBqYzZZZGFyOUhibFE3MVZIYmQvQnZyc1Jy?=
 =?utf-8?B?aHIzTVNHcjh6NXFJZDI5TjRuWlo1emF6Tjd3TVdFU3pnNkpXTmxvQUhPaWNw?=
 =?utf-8?B?UVdUbTh5U1FlUzdKKzVwRFFsSDZUdVZWOE5iS0dIaTM4TUZaOG1hWGRMYjB1?=
 =?utf-8?B?c00wc21CUWo3c1NGRlpoQmg2TEZjT2U3ZUtOd01YRFA5VnUxcTlBK0lOd2VP?=
 =?utf-8?Q?WVT3zf8XqXjeGF7P0DR0fgGos9QlWZpwKvGIQ0f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c77bac2a-d052-47b2-f73e-08d98f338c00
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 16:56:20.6535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np0+DD53Yg0g2ab9jiFLyHBHKMEa4AKATJN0GjJZj41+TA/VulP47sSpMxCCYOU7MyJ/wXIIjoMUfCGX4T6QRdx3n4oplAmPh91yDutMjy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5579
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

On 10/13/2021 13:42, Matthew Brost wrote:
> Parallel contexts are perma-pinned by the upper layers which makes the
> backend implementation rather simple. The parent pins the guc_id and
> children increment the parent's pin count on pin to ensure all the
> contexts are unpinned before we disable scheduling with the GuC / or
> deregister the context.
>
> v2:
>   (Daniel Vetter)
>    - Perma-pin parallel contexts
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 70 +++++++++++++++++++
>   1 file changed, 70 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index c4d7a5c3b558..9fc40e3c1794 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2585,6 +2585,76 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.get_sibling = guc_virtual_get_sibling,
>   };
>   
> +/* Future patches will use this function */
> +__maybe_unused
> +static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	int ret;
> +
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> +
> +	ret = pin_guc_id(guc, ce);
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	return __guc_context_pin(ce, engine, vaddr);
> +}
> +
> +/* Future patches will use this function */
> +__maybe_unused
> +static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
> +{
> +	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> +
> +	__intel_context_pin(ce->parallel.parent);
> +	return __guc_context_pin(ce, engine, vaddr);
> +}
> +
> +/* Future patches will use this function */
> +__maybe_unused
> +static void guc_parent_context_unpin(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_barrier(ce));
> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> +	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> +
> +	unpin_guc_id(guc, ce);
> +	lrc_unpin(ce);
> +}
> +
> +/* Future patches will use this function */
> +__maybe_unused
> +static void guc_child_context_unpin(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_barrier(ce));
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> +
> +	lrc_unpin(ce);
> +}
> +
> +/* Future patches will use this function */
> +__maybe_unused
> +static void guc_child_context_post_unpin(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!intel_context_is_child(ce));
> +	GEM_BUG_ON(!intel_context_is_pinned(ce->parallel.parent));
> +	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> +
> +	lrc_post_unpin(ce);
> +	intel_context_unpin(ce->parallel.parent);
> +}
> +
>   static bool
>   guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
>   {

