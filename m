Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731F3F6D30
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DEB6E0F5;
	Wed, 25 Aug 2021 01:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468AA6E0F5;
 Wed, 25 Aug 2021 01:44:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204564046"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="204564046"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 18:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="575212146"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 24 Aug 2021 18:44:46 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 18:44:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 18:44:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 18:44:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 18:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOYzQkw125gKIJXnqsfC6FnLPBubSsBaIplFHYFRcyUrShVsSKLIpoCTkXfyXXXMkc8z+4LUVVz2KcV1E3AuheEcWTOT8bWEzze3MhgCVg9rKZ6IWCinCyxfmW9cePqCYzLFpNxkZcoabM+UDnpYPPLWT0QNAYcZo4J+8co6QfBPw8xA21qtpVMlPen/3ij+MNeOMtpoUPLBltnJ3iG2OOkfzbD2eQKALH0bnpswtRzQ7M1puv4rXBdLkmZtv/NfTF1JNDH61GThII0OputoGa5exHcEo5vyTfsalqsMPKkxs+3/1rqy6TyEEkAnaol8qr54ixD5DfAY1MY7PPBGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S1PDxWWjwCb0gdc4oqBhR57Y00slw5FFNbQmdfMA/0=;
 b=E6H9bxuY9r4pApUMu3MONAdg3MXLae6wdm3aiaB8pYlJcF9A+Hnrizm0/ey9Q0LLZ8EQ1L03Ep8L5u8c2frFzbZ84VjfiIAw4XCpOSEEn5GF1ANyG/98pozgOJ5FNcvfMIh/fJbDuGtXRXejeVDeSLbYzXI9Jegy11eVrhyxtBIvG3qhX4T/6Ea6ziwOOYJEyMVnICvi+7KkA+aS4fYRdp8in5qMxcMGX5HMWq2ZjoMj3hmekjw0+DN4iUlZPYYzh3bRlYs9NHCb15iK45niHCqnEEu+CmWj23uR4xsd3Uk5yCfzMT//OuMdVmHfPfUPr4RhgPgECeJtLae0MOua6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S1PDxWWjwCb0gdc4oqBhR57Y00slw5FFNbQmdfMA/0=;
 b=lrqc3INrNtyBTL6n8zSbt1gr7QpKHDo6XQWA+diqXUFFaqIZ8ccTrhbRdrDAZqIII4L8wqX35bVDZa127QKS1soKlEfiAr+UBNk/ZreEdGo0C3PSwuQNhqwGIfZFAyt+iaS9gp0Na0Int+KpPm1bKQkgZAt7E5Dzeq2/0mIiHaQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 01:44:44 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 01:44:44 +0000
Subject: Re: [Intel-gfx] [PATCH 18/27] drm/i915/guc: Release submit fence from
 an irq_work
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-19-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ac6a4d32-fb1e-0681-f839-4682faf63721@intel.com>
Date: Tue, 24 Aug 2021 18:44:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-19-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR07CA0014.namprd07.prod.outlook.com (2603:10b6:a02:bc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 01:44:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eded234-8de7-4e36-9327-08d96769e9e5
X-MS-TrafficTypeDiagnostic: CH0PR11MB5250:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR11MB525069B4DED6968F653F2394F4C69@CH0PR11MB5250.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GpUZJadKkPTtF2h3UZ+oQzSBxoDbXWp6r6T8ZLaddXiqtL/kSVB7S2UV4A8bs4Fl/xB4S+R3ECNLnmfN7B3r70mLtCtCf/xvBy9ayiRw1rUswpIOEzJuN/H0jLxhmR1ElW0rOg18nZ4eZ4qtQVbPikR2fBZb0LlYuLeOHXMacbnEeCMLuAKVJfWsKZdTywbnH7zc5Xm2KVc2+4sPQY2TLbHAUaHdgHLvrtLqVVFdCJLnPl9/gHZ48S/bRvdTKhZMtqkBHqOBU+FlA8Pgi244KfJUZxo7r4XJREH+GbyFlgdMyd+9oEaDga6AuX0viLJUcjcFESv1Qrx1r7/uYtAYBZWoXLfdAlQeh4fBww+wYvPv9fjvGzKUoRpORH2ixRf0b05w8UB4xmAexKKq8NbFvCDubpAAjPIktKS3jHh/H9FnqvC8/gamNbZ1yFvvlPpNZZFErMjpdxoa3KYhKxOMr+ZK4A5Ji9Uxl8AwUaDZbYifWvc2RStheQuM1vhTpGF6NL6cr4Y9dP2rom9+U6hhT/V3BHtIhpu5qrxE6K4pnyOaXnuR7apd/RWMn+xnLGepw7u8pROpOkkbwtAXGJEt99Ng/NRxCvUE01HBNqCjyH1NSAc09RnQVYXMECzKxxFVUg17+ZCysS+be9pWxl58kVtXVfiUDtS5xUIhEhjL/UFpaFTH+Ajas65ZihqeDxRTUBtOmJcmlFHK29uT395Qj35+9m9zSc0th4UNcipp+qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(956004)(8676002)(2616005)(4326008)(36756003)(86362001)(31696002)(83380400001)(38100700002)(478600001)(8936002)(31686004)(66556008)(66476007)(26005)(316002)(5660300002)(16576012)(2906002)(6486002)(186003)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHZhT1l6SlJYYTZTb1FCYUc5UkpZS05vQXV4VFlWSkk4bkVrb0FKclk0ZDBl?=
 =?utf-8?B?SVBLUnVqbUpRS0V0eVhrZVEwek5vNnZDTDZGQks5VkRwMnYvemNQRERhcnk1?=
 =?utf-8?B?K21QQk1EbHpkaFFya2hRcXlKUFpTYlhMU3BQU0oxRCt2YmU1MktJK3hEdzFj?=
 =?utf-8?B?eHBEMzJzSkxjNmlCVlQyYzBrTTgvZ3lxaWpmUkZBVVZJdHJYYXYvaktJNC9H?=
 =?utf-8?B?Z2pvWTc2eDN3U2NFR2ZwcjlHbzQzRDU3TjhYS0NvSWVsOGZBV0xIQTNvb1pq?=
 =?utf-8?B?OVdYRGQ1aXhaa2pFeWsxNUJpbEJGZlRlNE03VGFBTTYyTTY1cWNIaFBXdVlV?=
 =?utf-8?B?VGVYTDRZYmlHcktPZDFZU3lITEtVQ0srblpUeHI3Y0VCUWlKbW9TNkw4TFRh?=
 =?utf-8?B?M0tabGpyZzVtMG8zRHNSaC9DZUtLWU1tMkxiL2xNWTV6QmRpSlg4a21GTDl1?=
 =?utf-8?B?VGtabVZldUxYWUlBS1RyYS9TWU56NVVscTR6UXNPWDYwajFRcWVzNVFiUVNJ?=
 =?utf-8?B?aDdGQ05pMUJaUEVmbm0wZjhtZXRhRkNuYVZpcmdpbjgyZXVGdWRMOVZVa0pY?=
 =?utf-8?B?MXRjVXZML2Q4aVNic3hUeVBwWGRTeFkvNnNKZjg3NGJTTVJURWtxdFZBb25m?=
 =?utf-8?B?RkFyTzkvVS9hQStraTZtMHB0ZkNZamJWSEF2WnBMSEZjQUx4cDRpVllUQk42?=
 =?utf-8?B?WGJrTHZiblA5VFMvakhTMXpqQ2s5Wm1HR29VMSs5TVJLdjBqcGl1NnI1QUFo?=
 =?utf-8?B?SlgyeDBOeWo3V0dkWGpwZmNIS3hVaXU1cm03b2xBVk9yZDNtVjNFSVVFZDU0?=
 =?utf-8?B?NnZTZE5iRzZSNnpaaVhMQkw5R3pQL1ZHQlAzUk5sODErUlllR0dJMUU1TlhM?=
 =?utf-8?B?M1ZtRW01TVNHMDRwY0Zsa0pjemlqQzdGWkhGNFRIZ1NmRTdzc1crM1htVUtI?=
 =?utf-8?B?SVI2TmQyMnBhVkVDY2NlcUpCamdRTldLMlVXbW5aNVp0OUxTZThPdmlqcGp4?=
 =?utf-8?B?TTFza0lhS21jY0ExRkVMaVUwb3ZRRldnVlRIZ1NLb3FCVU1DNDJBUXRsL3pr?=
 =?utf-8?B?Zy9CUlR1Y0ZVSm5FR0RUeDF3WDBrN1RaRWMyRlBGc3lOMENDd0lPSTBXTFFT?=
 =?utf-8?B?azNNSGVZVUt6bWtKTjJLY1k1TmowNmIzT3FqNmcvVkRFaFc0NzFhbERnQjBR?=
 =?utf-8?B?YnErNkRvMVpMaFEzU1dGZHNsWmNteTBMUzdCMDlCaGNyYVQ0VGVLaW4wY0hJ?=
 =?utf-8?B?b2hGZGtyME90cERsbVliZU5aaWFOWVBEVEZrdE5DQ2lKU3B3MDBZRzd2Z0pw?=
 =?utf-8?B?elNXUmJhSG5kaTdndmJpajVWTndtNlI3UUFEaUYzUlA3SUVybEwyQUpTZXpW?=
 =?utf-8?B?Q0lHd1NtYStmaWphVGVveFBaZTdkdXZJbDhZdVVjUG9jb1gydHo0bEhPR0ZU?=
 =?utf-8?B?Y0l1aWY2SXFYQ2pDMVlmZFdHK2FCUlNlWjRkcnRKT0xGQUIxa3NMWUFXeUU2?=
 =?utf-8?B?OXRXd2hjN3hYQ29aY3cybm41VzEzUTRaTkMza2YwNEdVQy80dFVndys3aHFD?=
 =?utf-8?B?TE0vWW0rNFM0MjhLWFNOU3ZBT3ExSlB6c0lleEFWZnZKOGZtd3pkVVFtUkh2?=
 =?utf-8?B?bUl6TWw4TlhuUSsrK2hNcWE0NXpYd3BRMTRIR3lmSHBPbTVkSWFlR0pvbFJy?=
 =?utf-8?B?ZEFuYUEzL0VMQ2NaYkhVSVBFU0l0NzVNSmZCY24wcUw2dmRMRlRRazVhcCsz?=
 =?utf-8?Q?KR+RCQ6osFTRwvBHaZOU1Rlqp0btaUUkAqp9NhB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eded234-8de7-4e36-9327-08d96769e9e5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 01:44:44.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kjueIj1a3ObRGHQpc1TzN7qDVw4iLs4EE6r8P/JeprHDUlTvpwnfiOfDJ6R/DaqLZRxH504mKbUCKF0xxkLl5OG/L1SxWZtZi8QJur1Nq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> A subsequent patch will flip the locking hierarchy from
> ce->guc_state.lock -> sched_engine->lock to sched_engine->lock ->
> ce->guc_state.lock. As such we need to release the submit fence for a
> request from an IRQ to break a lock inversion - i.e. the fence must be
> release went holding ce->guc_state.lock and the releasing of the can
> acquire sched_engine->lock.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
>   drivers/gpu/drm/i915/i915_request.h               |  5 +++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9a53bae367b1..deb2e821e441 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2025,6 +2025,14 @@ static const struct intel_context_ops guc_context_ops = {
>   	.create_virtual = guc_create_virtual,
>   };
>   
> +static void submit_work_cb(struct irq_work *wrk)
> +{
> +	struct i915_request *rq = container_of(wrk, typeof(*rq), submit_work);
> +
> +	might_lock(&rq->engine->sched_engine->lock);
> +	i915_sw_fence_complete(&rq->submit);
> +}
> +
>   static void __guc_signal_context_fence(struct intel_context *ce)
>   {
>   	struct i915_request *rq;
> @@ -2034,8 +2042,12 @@ static void __guc_signal_context_fence(struct intel_context *ce)
>   	if (!list_empty(&ce->guc_state.fences))
>   		trace_intel_context_fence_release(ce);
>   
> +	/*
> +	 * Use an IRQ to ensure locking order of sched_engine->lock ->
> +	 * ce->guc_state.lock is preserved.
> +	 */
>   	list_for_each_entry(rq, &ce->guc_state.fences, guc_fence_link)
> -		i915_sw_fence_complete(&rq->submit);
> +		irq_work_queue(&rq->submit_work);

I think we should clear rq->guc_fence_link before queueing the work, 
just to make sure the work can't interfere back to this list (I know we 
don't now, it's just for future proofing paranoia). with that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   
>   	INIT_LIST_HEAD(&ce->guc_state.fences);
>   }
> @@ -2145,6 +2157,7 @@ static int guc_request_alloc(struct i915_request *rq)
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	if (context_wait_for_deregister_to_register(ce) ||
>   	    context_pending_disable(ce)) {
> +		init_irq_work(&rq->submit_work, submit_work_cb);
>   		i915_sw_fence_await(&rq->submit);
>   
>   		list_add_tail(&rq->guc_fence_link, &ce->guc_state.fences);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 1bc1349ba3c2..d818cfbfc41d 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -218,6 +218,11 @@ struct i915_request {
>   	};
>   	struct llist_head execute_cb;
>   	struct i915_sw_fence semaphore;
> +	/**
> +	 * @submit_work: complete submit fence from an IRQ if needed for
> +	 * locking hierarchy reasons.
> +	 */
> +	struct irq_work submit_work;
>   
>   	/*
>   	 * A list of everyone we wait upon, and everyone who waits upon us.

