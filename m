Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8A534355
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD1910E106;
	Wed, 25 May 2022 18:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038D110E3C0;
 Wed, 25 May 2022 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653504638; x=1685040638;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gW9+k2dYIorPteMH2r+8BkZcmJjP7VykSCU75R52tms=;
 b=j04fpoHBLe2QL8zfAI4zu9bm+329q+JyZrlqbMK9hg5vMHqoWyRl7NUw
 RG2mgIunRa8bxQUNVqixlbu4jha6duTiGlXTIF0Yn3ollOCc5jnuA/IW3
 h+Tf501hY5FJUYFvT7B/afSELUyx8U7N0tbbRqTcJZH9zC+XuGsKMjVWm
 LC41jYYiP98Y9JcnYFxuG8Adj/0LUhhvan4ADgrLIC0wTpR3+0ag9TLTv
 YTiLDhlUEWNYjajNeJIqtz1AKDeRXCcHqemAczCeGvTt68nm1HPaVydFe
 8QnT2GfEoIEo7FFRneXue/2Qbb9rBwLZhyK+71b2FR37bDAmsqqBg+Hsv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="336958147"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="336958147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="630484290"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 25 May 2022 11:50:36 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 25 May 2022 11:50:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 25 May 2022 11:50:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 25 May 2022 11:50:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 25 May 2022 11:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THOJxRUgCU61C7uTz4Q3Bmlj7u75bh/ehA2w24JX3G+r4JXPfOkXbmQT4BMxIOFA865z/cB+jUD3SD7ygk3f7Q2T5Q2AAdfVq5m57amHXNTsvBXSxRHOAzCcLScf+RdcrKFPGZsGdOyo6p5RQIWycxRYJq+7SzdXUuYhzdg5/v9YzyJrbKZkeU8lVCqcCa5w0SOHjIZRxvu9NB3qBM08yvRDQKEANu6W2v0HTFtOh4cd0ZcGAsmVH/pp9jMDPTywjP1jNlxvkKx6hxBSRhAA7CLF7WhB32URpDYT0R0REHrxULKW3DJvmm38o/1x+Ni19zECgQl+6O3aoIM7vBGaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rriC20SSidE3spzOEHiLEOMBI5sKLMQp0XkPoWg5DHU=;
 b=XVn4BGvNLdL8xQTcDC6cm/D9dArqsn7lxz7x+nfhOStpIweYiNbSUCIPFUEr/VZ0wNZFfc1vbTLzDY9NjpUwpUqe3jCUFQ3eLwG32Z/Jr+kAMVuWcgUvif8qkdyxjBANk31iuva933f6Jq7WMdTodMfnxKBdQoqy/OTkBoQ2WvKSHN6OMAFyP+ZQNfoEl9shYyBpapeRTixj6mCpBgA2Fo4MYAxL1XORE1CWcJtryN6kmGOyuHd0zl/45lHXLHwWwZwUhJi9Gf6TNz19NHTLH0IHWFP8NKk1wevAROmywBIdHj3UHpxwaxJUw/HC7LcX412nKPxe2fwi7RsiCsxa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4400.namprd11.prod.outlook.com (2603:10b6:208:18c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Wed, 25 May
 2022 18:50:32 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ac18:95e3:c184:f976%6]) with mapi id 15.20.5273.017; Wed, 25 May 2022
 18:50:32 +0000
Message-ID: <0d115c7e-28cf-b478-7885-c428314fab73@intel.com>
Date: Wed, 25 May 2022 11:50:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/i915/hwconfig: Future-proof platform checks
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220524235906.529771-1-matthew.d.roper@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220524235906.529771-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55d19402-174b-48e4-6599-08da3e7f722d
X-MS-TrafficTypeDiagnostic: MN2PR11MB4400:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB4400A57EFA4AAF0FC31B7F34BDD69@MN2PR11MB4400.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZeieC9Mh2KVhEZaTBKODtGt7h64pHbz7dNUfPwZLJW1ZUSHKraJfJ9dZW0+V/V5v8f/a2C0wGbDSPbe2frTGoAi30Sfo3qOnqmYc8YkU3A8RQnEGXFucKKr745HFXSVeXUoHCFF6O1MY34LOG0UHfMhb8b+Z2EYvLq/61+ZNH6kU06Uv1/XfDpBOfvGYUm3KpVjRcY3sGGza5o8jQsSsf8Y8gzATxk0QX4ObBUDSuzBOsrVRk4OYr7/PlwQJPFpwqmJNsQOVUCXLbQ4dBZsyc7adyx6uDjcd62i34vz1Jl7wVo5rEnTNaEWqD2/kthpOzsesqCqBIJnzdRVBsn5P7N66xHvxGPWCqSRd6faZYSknTjDwXs5r06abcgj6zCOQUq+eXeqEmKZACljXAbDj5D6KqfPAe59YRaMs2cseIHI7vRZWSgZfj0QrqPcV4r5UKxqOcIjZn9L72Hryt2cv/sKffhms57iom5JGJlbD0twbwIkfL7vFXQHoHu97HsoFQsiyb4PpDJMiCJVn5P9NwgAjk+Kuxgw52fx/cqhMPc7r3rHhAs9L9G8ivwcHxlNkwQ06otj6Qd37P2qrAxNYUxXqztmnACSh0fNTDbagWC6Q5AWFgUwQ6d1uj2ZDcnCiOw9kDHqfPBNKO1ZDAS8R5TmkRqkLb2A3zBMAo1g+z0NIOqqi3Hfzkx2aRXt7ZbrjbmswXcax5K/0KQMCqdITyMO3Z0+3zhf2+vgq7w/QEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(186003)(53546011)(8676002)(6506007)(6666004)(82960400001)(2616005)(8936002)(5660300002)(508600001)(6486002)(26005)(316002)(6512007)(31686004)(107886003)(83380400001)(31696002)(38100700002)(36756003)(66946007)(2906002)(66476007)(450100002)(66556008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVYyV0hyR0ZaQUlOTXpQZjE0YTdxdFFPYk1JVjl5dW9iSzRYblN3dzJmNlhK?=
 =?utf-8?B?ZEc1K3FUN0xTQlFZd1V1Q095bGJvQ3ZjaytDdW91WE15RldLRTNmT296cncy?=
 =?utf-8?B?M1BrWi8vS1BSWHpqc05lQkVXRW03Ri8yL1ZIVVJYWjhUaE5HYVl0ZkYyWHM5?=
 =?utf-8?B?TU1yTnUxd3Jzc2VJZExrTERuSFIrMDA0M1pqWTB1SjFsV0lJNm9tYmdyZ0Fu?=
 =?utf-8?B?WVpOaTREYVV0U1Yza2M4M3hPaXVqUmkzV2hETkVIdmRJWFEreE9tVVArMlZJ?=
 =?utf-8?B?WTZ0eURwSThBamlncHZnMkhEbjVoWkdTQ2lCQng2N05LT3pPM0V6emp0T1BC?=
 =?utf-8?B?SDFqdEw3dTRyRFVRaXhEa1d4c0xKTGVTckJoOWJmNzFGTzJLcWlLa0ZtYTVT?=
 =?utf-8?B?QlVVVW1qRFpPK2lFSVpqblUyY01jSnBFVEpxenpkMjQ1d0R0OWZzTW5qTU5R?=
 =?utf-8?B?UmM0VWRDWG53ZnUwbFEwV3NMMVhiUDB6RTVCSGFWOWpzUm5qRHpHWm9BemVY?=
 =?utf-8?B?VUFRTWJPeFRKdWxjZG1CdXk0WUNHN2NBYjRBak1CNUFJQnpzYUlDZU43VCs1?=
 =?utf-8?B?c3A3UDhTVDZSN2xKVjROYWphd1BjUUFzM2VOSll3bnlNS3hOQW9VamdYN0Yx?=
 =?utf-8?B?ZjhSVGdXc3MzbFQyUlNIQ3BWYkVia05RdlJLdWNkNE9sYkg1OFpXZHdsTEdr?=
 =?utf-8?B?dnAzN0JrUjVkNFh4ODk4QlJKTWQyeXpZdVQvTjlaNnNyaDNBaHY4cEg4QzRT?=
 =?utf-8?B?NnlLem5HN0JxMGc1TTFEUVN0MFh4V1NBeFlwSWhnYm5UTlVBK2tPUEVLMzNi?=
 =?utf-8?B?TGhnY0dnU1dGT2I0Yklsd2F6Q2lWbzl6N3hvWWVBQjhXejVNUW1hYy9vcngv?=
 =?utf-8?B?cjRkdkwxZ2ttTEZEK3Q0dmRJNXdnbWYvckErVnlvcDUxU1QzVlZXQ1ltamph?=
 =?utf-8?B?UWlMYm0yOFQ4amVkMU5BM2RBR1pEc2lYVFN2MjZFTmFvc2hkU000QWJlLzlR?=
 =?utf-8?B?NVl3cEl6V1dMMnBLUUdUYjdZZDNNYXFWaXIwblF1dU1jUmcrZS9ZdG9wM0FR?=
 =?utf-8?B?NmVnOHVCcVJyVENPU1pNeSt1UTVNWUV1Q2dYZU1nTmhtN2MvTmpQam40bmdr?=
 =?utf-8?B?a1JVRVYrMktQRmFFODh2OTh5QjNxSWlaM1BTNlRzTW9FMVorSkYxaDJnMTBH?=
 =?utf-8?B?SXlab2tibmhTWVVyWFNsRndVVEt2WFp3ZS9UczYyMTdLV1dYZ3FSUmtDTDR3?=
 =?utf-8?B?QlZHK2hpQTRLcFE5eEs5K1lNWHZaakxYODZkTUxtcytrSEF6Vm1hQTBUMTlG?=
 =?utf-8?B?MjF2WGNRQnkxUnBWK1FZdnpiaCtTaS8vYkhoNUhaOGNGanlPcDVnRVJyYnds?=
 =?utf-8?B?am1NV2cxWWdKeVZxTWZXa0dHaTI1ZjEwNkNaVlVDTU9IS3UyMk8xZm5RbVcy?=
 =?utf-8?B?b0JVNmxIcGRPWkJXYXZqVnROZzYyVjRreEQrbm1iYnplODBaMUZNM2hDa2lO?=
 =?utf-8?B?dGNWUXNJSlhjYkhqZS9xcU9KSm9wK3FzQlgvY3F6YkNCQzlRNW41WWVjNHJh?=
 =?utf-8?B?YWFoYUY3TUtsNU9pMEoyUXhvZnM5aG43L041UlpxL1Era2tiV2JiYlNEVDNl?=
 =?utf-8?B?RTkwS2NmTkFZRmlCcDh4RFMzMFdla2U1NlhUZFd3RmZwVWVwM1hYNWFvUS9D?=
 =?utf-8?B?dk13MjMrSzNnWFZnZVRacjB5U1psTEczK2ZWTU80MEpjSWZxUzFNMGhOeGZK?=
 =?utf-8?B?WVVLb1ZDY0VIWU01SC9hNThQQzYya09RMW8yTjZ4M2N1UmRxUFpTZ21yOGk4?=
 =?utf-8?B?M3ZKK3FQZi9pTEIwM0cwcDdtbDg0MFV3cFJNVlpPSFA3UWxyVEQxSjFnSEpB?=
 =?utf-8?B?NTVjMTEzOG1XVmlVVTRNSUFtdWpzeEFrZ3lEcmkzbzQzcDRhSlNZbVZUVXEz?=
 =?utf-8?B?VXBsV2VNMHF2cWJVQ1lyMko2NkxBSmljbVk2VmpBNzZiRlh4ZjJUZUFKL01F?=
 =?utf-8?B?NXF2ZnlranRmR0ltZWlCRTZBWEpyR1hjUStBMVhzKzEwczhabkprYTh2L1Ri?=
 =?utf-8?B?bXFPMmYrTVRRZmR0cThUYlk5L3Z3cEVlbjVka2M4TkhmdmFzNlVXQnJ0a1ZG?=
 =?utf-8?B?cWQ3a2kvTkxYSGtZaTdXNEVZUk9tMlcxN1NmalFDSWREVHVCbDI0ck1qM2c4?=
 =?utf-8?B?MjdzdDJVS0xNTkJYbVVqZlhPYUhabjlwV2pDRXhBRHovMWc5ZE5hWUJHRU5r?=
 =?utf-8?B?NEEwdmtrb3ZBaVFDcWZybW1MS3JiblZuREIrNG5vdVQ5VmIxc2duUzlldjZQ?=
 =?utf-8?B?NlFOeGZjUERBUEZBbU15YWl0VjUvdjJIRDN0YXVYMGc5ZHpZNVBKQVdta0l1?=
 =?utf-8?Q?JtQR2zxAuXaid8fo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d19402-174b-48e4-6599-08da3e7f722d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 18:50:32.4942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNJ0/aFm8+qS915TWWW2VEmq5ynsHUEk/pNe6/Td/sLYRStq/cG8DNKsj5L07mWYI8jdOcvckxsnRgE3StXOd4ZLxawqlbxNz9kzODcjReo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4400
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/24/2022 16:59, Matt Roper wrote:
> PVC also has a hwconfig table.  Actually the current expectation is that
> all future platforms will have hwconfig, so let's just change the
> condition to an IP version check so that we don't need to keep updating
> this for each new platform that shows up.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index 5aaa3948de74..4781fccc2687 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -96,7 +96,7 @@ static bool has_table(struct drm_i915_private *i915)
>   {
>   	if (IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915))
>   		return true;
> -	if (IS_DG2(i915))
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55))
>   		return true;
>   
>   	return false;

