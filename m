Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83742AF7F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E445D6E9E9;
	Tue, 12 Oct 2021 22:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6161D6E9E9;
 Tue, 12 Oct 2021 22:08:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="226056554"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="226056554"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 15:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="442037138"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2021 15:08:10 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Oct 2021 15:08:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 12 Oct 2021 15:08:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 12 Oct 2021 15:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9fjuHgQ78VnZdSB5pkUyTeXAVaC9IETIYfTJ0MncDyAGWUja/vh+y0v5lE/VwmlBmGrN0jFLKSI9QCezvqdEQxMV9H9vcEDhiBGt9Pb+CK/9roTjx6KAS5nhiUh1YlPonPoXq6+l2b11WvQxDy3lxAqfvwQK3WomYohzHL0oC+4fhci5KnAYm9YHz9g4J0Onak8YV8811D6p3YcwiMySFIRUA4egWvduzB/vP/cCsWkGO+E6OwFa32pHA6wYidB4vY5s/yj7a9Tze1vnUf2Hy0lslryETDtBc8r6aBeOqoxkwIsxoVI+0oaxFX3Iz+KKzyQW1l0ZCgk0+jet7QLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uj5NQ64uCEwvM6zA+llZTRZsv9+Y0rs6gmELzEACu0=;
 b=FtGKHZ50IkTyVPK+s1MC3KBu4ncEGu5YLzH91sjvA4hWAfbRfYqAKZ0gITcqy0drdxeqpSEd2mkwNcq0be1F/Hw8yRRRRLBshyaHD+cXreTVZujhr4C5ak084DzToP2l8u5MRLhB9FEAuhaiefvX1KMiBN+YCQBCU6tkzSsH0MjknZKIygkPkLsLJhBSjG6sT33Ulr4wRdyWwA1OyXmqY5NCWTBd4196svwi7T5zD01gi/LDu1R/Sbadi//C+a+dIoJacx8UXDTgxE3xST7OC+UA2DHn0lKrnZJrpbiuwTCbBZOgt3nL1KHl4UtTE4nsLGcAwUoW5rQNR4xQdCtq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uj5NQ64uCEwvM6zA+llZTRZsv9+Y0rs6gmELzEACu0=;
 b=byOAp5UIIdDs01iARqKthcUAkFmZ7A5kZtyQTQJJ28VPEOiw9QLbA2yZCE1sC9wlHr1LlWXqdjH87GPq4A7MHl1PeSAimGTpbfCW5J1JD8ae6C8Txiaa8ieMcK1InPtqGG4a5wJ8Q03p5c5rwupXuteDMF0CCoAvBdUpCSylShA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 22:08:08 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 22:08:08 +0000
Subject: Re: [PATCH 23/26] drm/i915: Make request conflict tracking understand
 parallel submits
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-24-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <03661707-0416-93cd-94b5-1624f1a5e073@intel.com>
Date: Tue, 12 Oct 2021 15:08:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:303:6b::17) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0072.namprd04.prod.outlook.com (2603:10b6:303:6b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 22:08:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fceaf7f-ed1d-4d67-dda1-08d98dccc598
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55778B7D4B9597C43C22939DBDB69@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHZaMgWYMg163xWISYTr//0xNv1I8druoToLih0PJqSoAX46Hg9yaWkFKupBpshzuK1ioLiyStZF7c60S12AWsfbS81qav+yzJj/7Fk+xfaoAd6dEO4qVWDeXOLSCE+/QlExbXGSEZ6DMlouotZ63CVxEMfzrLKjEkjjgET6kUR95bxfIpm5HmTN4KIJ+mcYbJ/roFHvsvPf93Kg+YcENGqP5TAVRQH7wMJqLP42pUON812Rh8wlfWn0ItUePrBPU31VbioH/40uedEiw9B43itVin0YIIafEx37/98gPMPO2mNKShsVWTHs3PLg6pk5rOBHx+dsWjXKEn3b9EpQaACk61XB8jPStRrdJ/FL0v/v/Qr9RWEKgYR0XottfEPSen3LLnwqCCUfpLq1UOC6rTJ4yz5mVYLv4JY7O19sVnemcMr3MVFtV5MGugZ/efvw1P+q9Eva/DfS4V14ejm2hD8ebhEzr++VlL4wuURd+UO537sRT6nsGs3lQ5BA7g+IcSGUzFBPbmXt89Yjj5EPPhzZl9U5X8s9Rnfn8EJcsgoTsAaXpBLocRuFWKmex9z+TFCfghqp2cNFdTkTyI/nHFBo6YIPi5LdtgFoPAGZbfZbuP1PiDOKbDF49EMhuHsiHKT7Zj1exKlTQ0sllG7kU/biRjyet2opq3cecGYt0U5mLQPoHF0m6vJbGzBs+XXehTCURXPbgawfi6364m+C1SBF7dSvFz6X8vxI+XeeIMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(83380400001)(66946007)(31696002)(956004)(36756003)(66476007)(66556008)(8676002)(107886003)(2616005)(31686004)(186003)(508600001)(5660300002)(316002)(86362001)(450100002)(16576012)(38100700002)(53546011)(6486002)(26005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkE4ZCtJV0V4SjZUSnJzUmRjSnI2S0tXZFRuZnZuVGtSb1VrSGxaK3FYZ21U?=
 =?utf-8?B?S3dtUzZBcEtCc0hxUmJVbEZ1T041bDRHTnhNN1A3Z3FTeGVoYktWdTFTMFdX?=
 =?utf-8?B?SitwVFN5S1JBeWJDdDFtOGJDckFVcldWMENZT1c3ZHpZelVEeVg3MjUySzJZ?=
 =?utf-8?B?MFc0RGg5MGdPYllBdnpkTkJBeFRiMjdtTW1QTlFKbVR5bThTV0dmNWRERjRp?=
 =?utf-8?B?Lzh2SFUxa1JWYlorZC9YSTcrdzdiRVdnUlk2aFVMN1YwcktBc2w0OXFNaVRO?=
 =?utf-8?B?Uno4RmMwTEZxV0Z0cS9mOHNDRU1Pa0ZEd2hpMlJkWjludmVnWXE4ZDJLUU9r?=
 =?utf-8?B?eG5uK0dGS0VMcjA5bUJEaFpiVW9OQ0F4Y3JEUVErWk1XbEtDVFFtRGRuV1cv?=
 =?utf-8?B?RDdFbHUyMGs4Z21zck1ZUjdkZFZxdkNhSnNVQUxpL29DZHQwYkYxQlFJZzVs?=
 =?utf-8?B?S05GN2lTK3M2Wmw3aDJYQnJrQ2JPTFFlQnlTaGR0SXBaVGU4SnA4YkVWM0hI?=
 =?utf-8?B?cU43ZEliUTc3WnlyTm1JQWtWUGtCZ2xIZ1Z0TXZwRDRPR05QN1lvRGtvNkpB?=
 =?utf-8?B?S0t4K0pkUGxNOTdKSCtldE9HZW1nMnIxOHFzS3BBRFB2L1d2R3YxTDZkQnpu?=
 =?utf-8?B?OFIzWElhcmhtUG53dHZoVWRTQXEvbkVVa3IyYVRwUUw0VEwyMU14WTlndy91?=
 =?utf-8?B?VnVLV2w0RXNOUzRLVkJhN1Y2OW9xTmRid3ZDK2ZTb1FSQ21vM3hsRlVhRUtO?=
 =?utf-8?B?aGo3L1JoQ0lFVG41QVJ6MzAwb0gyYmdyQlFFYXZzL05rRzNhUnBFMU9IZFhy?=
 =?utf-8?B?YU9PMUl5Vi95b2VkeGhKTlJFOTVva1JHQi9UMytlWGM3bFdLaFZlOHczbGJS?=
 =?utf-8?B?TDBtU0dOUDd5Ti9EbWhQZFhhd0tia25LVE1GU0QyRUVtRXJiRWZha0prZXc4?=
 =?utf-8?B?SXFOaEJpbHhyeEJEYkpiWVdXV0FkbDJQSXA5VmZoOUl2RUpWamlPOEI3bHZ1?=
 =?utf-8?B?WTZhdWp1TVI1ZjlVQ2ViY1g1VUJCNHpUVHpjNUJqMlg3WnQ3bnVKZEFnN3VP?=
 =?utf-8?B?Wll0RTErWXZBemRZMC9PLzEzMjVxL3BHT1lyQVNWUks0NG5KVFMrQndxVGEx?=
 =?utf-8?B?OHM4RHVjL3J6UzRqN1h6bitob3MrL2dZdDFKeTFWbWtKN3BpWWpSM01rZW01?=
 =?utf-8?B?WmFPSUIzbmJ3NEFnazl4Ly9INThHVFlnTEpiYjVQTHBKK0tkUHpSVHB6UXR3?=
 =?utf-8?B?eUVyWDlZWnNFaXY4T2Q1YXRuQ0xyOWQzMlZscS9uOWZBSUtpRTc1WGZmdndP?=
 =?utf-8?B?SkViR3MwRWJzbGR4bnhCd1diUXBlNFYxckVrcEd1ZTcvYkFsajRsYkk2ZW1u?=
 =?utf-8?B?SHdJSExKaW1hMlBXS3krZFhRbzBKMWNweGRaS1cxQlBobGdUVlVaQXVOaTRB?=
 =?utf-8?B?S25YanlJcXFKQ0V4WE5Rc25zeHNoeGJqaVlpTEd1TVVOTnYxWVZsZnVYTEZX?=
 =?utf-8?B?L0xKYVVXSERaT2hlYy90dlp4SUxoUkdTYm41c2RsL0hEU05ocWczcDlxdjBK?=
 =?utf-8?B?MWp4T2pUOEE3aS9BQmlwSEV0TUhRNUtaTVpRejNiUXA1V1RCQmM2cEg4TkQx?=
 =?utf-8?B?d1czTUZjcnBqU0dGMlI1eDlvRlJ6QmNQa0NqbFZPdzZ0U3lDb0tWcEVacVNF?=
 =?utf-8?B?bmR5WVFYTk9Yc1JBOU12ZmI5MXpUMzgvZkFyN1FRczlCSS9KcGUrcEQrVVh6?=
 =?utf-8?Q?7EDQq9Fr/BZ5Sd55XHcpjaWkOgaOYhofOxGBlYi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fceaf7f-ed1d-4d67-dda1-08d98dccc598
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 22:08:07.8615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wQkrIO7Vja53rTYJ+6/L8o957vy6mzWj+jxh0PIOZawQcsw7mrDmYlIoRV1JrFtRcqd2KByi+v8XKL89OUEh8GOzI2i8FA7NZjqoJWxn+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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

On 10/4/2021 15:06, Matthew Brost wrote:
> If an object in the excl or shared slot is a composite fence from a
> parallel submit and the current request in the conflict tracking is from
> the same parallel context there is no need to enforce ordering as the
> ordering already implicit. Make the request conflict tracking understand
ordering already -> ordering is already

> this by comparing the parents parallel fence values and skipping the
parents -> parent's

> conflict insertion if the values match.
Presumably, this is to cope with the fact that the parallel submit 
fences do not look like regular submission fences. And hence the 
existing code that says 'new fence belongs to same context as old fence, 
so safe to ignore' does not work with parallel submission. However, this 
change does not appear to be adding parallel submit support to an 
existing 'same context' check. It seems to be a brand new check that 
does not exist for single submission. What makes parallel submit 
different? If we aren't skipping same context fences for single submits, 
why do we need it for parallel? Conversely, if we need it for parallel 
then why don't we need it for single?

And if the single submission version is simply somewhere else in the 
code, why do the parallel version here instead of at the same place?

John.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
>   1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index e9bfa32f9270..cf89624020ad 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1325,6 +1325,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>   	return err;
>   }
>   
> +static inline bool is_parallel_rq(struct i915_request *rq)
> +{
> +	return intel_context_is_parallel(rq->context);
> +}
> +
> +static inline struct intel_context *request_to_parent(struct i915_request *rq)
> +{
> +	return intel_context_to_parent(rq->context);
> +}
> +
> +static bool is_same_parallel_context(struct i915_request *to,
> +				     struct i915_request *from)
> +{
> +	if (is_parallel_rq(to))
Should this not say '&& is_parallel_rq(from)'?

> +		return request_to_parent(to) == request_to_parent(from);
> +
> +	return false;
> +}
> +
>   int
>   i915_request_await_execution(struct i915_request *rq,
>   			     struct dma_fence *fence)
> @@ -1356,11 +1375,14 @@ i915_request_await_execution(struct i915_request *rq,
>   		 * want to run our callback in all cases.
>   		 */
>   
> -		if (dma_fence_is_i915(fence))
> +		if (dma_fence_is_i915(fence)) {
> +			if (is_same_parallel_context(rq, to_request(fence)))
> +				continue;
>   			ret = __i915_request_await_execution(rq,
>   							     to_request(fence));
> -		else
> +		} else {
>   			ret = i915_request_await_external(rq, fence);
> +		}
>   		if (ret < 0)
>   			return ret;
>   	} while (--nchild);
> @@ -1461,10 +1483,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
>   						 fence))
>   			continue;
>   
> -		if (dma_fence_is_i915(fence))
> +		if (dma_fence_is_i915(fence)) {
> +			if (is_same_parallel_context(rq, to_request(fence)))
> +				continue;
>   			ret = i915_request_await_request(rq, to_request(fence));
> -		else
> +		} else {
>   			ret = i915_request_await_external(rq, fence);
> +		}
>   		if (ret < 0)
>   			return ret;
>   
> @@ -1539,16 +1564,6 @@ i915_request_await_object(struct i915_request *to,
>   	return ret;
>   }
>   
> -static inline bool is_parallel_rq(struct i915_request *rq)
> -{
> -	return intel_context_is_parallel(rq->context);
> -}
> -
> -static inline struct intel_context *request_to_parent(struct i915_request *rq)
> -{
> -	return intel_context_to_parent(rq->context);
> -}
> -
>   static struct i915_request *
>   __i915_request_ensure_parallel_ordering(struct i915_request *rq,
>   					struct intel_timeline *timeline)

