Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9048DD5E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 19:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6010E4E3;
	Thu, 13 Jan 2022 18:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DF710E275;
 Thu, 13 Jan 2022 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642096805; x=1673632805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ku/KWmdxP0/vHIF666A14vkrC1tRNwUWS7eAvEQXjrM=;
 b=mLO+Sup1fGQfj6dvnd3tn6w+n+osOpDRC/RBiFanDBh9SdjzINSm0MKh
 0OpyjkX6fF7gQjy0YYlM6zhFDeqRr1syCn0P1Za/fGiA2wu2A5o/CQgwv
 viUGYltYpp534gYCWnxzsdXrUOZfGOo0KHZQzW8B+EOgT3gApCs6Pe0tQ
 NazrdFzz/Ig+EqaIzDY16G1EgOOE/vTCv6IgwnkFCBThMF+TpruqBsGBR
 2rIFVzHI2sXXs3gGtEeITW/6/liqcu1ycir+SDE1zp/MwZhd5a1f9myoQ
 b/+WpdAllXENVQP6qzXubUkzymF52Pa3JYllNPlH80SsDNiNCw7R2xU4V A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="243873300"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="243873300"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="529765710"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2022 09:59:42 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 09:59:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 13 Jan 2022 09:59:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 13 Jan 2022 09:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKrtnRG36j6zXO0JZB6qqh7O7uxMz6I3/i0K8OOs3+7K1+fTOEWOkjk/8wGxQMa8eksGLJwHZ7nTqFJeXVTwfmdiMnyQ3tV4Fdk5iW1JVm3qL5hJcgHrAdl2NgzO8RAGxW4NnVxpDR+pA+zLpBAyvoLVg3JK/l/aha1d9gu2jUMRIejO/U452p5lM6Xte7rV4XwvG1eEKXjbLnwbOvX8wTPNU79KLaKw0Yvv6n9G6klUajQ1y4qbKPvruasNSmPDOXU2mOJ8t6mRbqi70+C9hLJOCvR3Mvd8PzFgeqF3EucCWOfZJzMOQm+C/Uc7wngJTggSay6BqecGakaRr9SuIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LsVQoIF38T3GKupTeHSeN8CXX4ZcmmEZxmJ6Cm2/g8=;
 b=d7TOZ96JgH5z1Tyqj3/aYnCmqc1EqqKPnRraXUbGf2vF7WrBnVdaEJo5RPxKO9zVbWhnte/Zd+YsB0O7qRQIxM3L31NIFFl7YovLCE3CrEwVgUzClV9xTZgCV45tSGS4/DYspuM0OMTrBilEZ6DyST/zDm2M41UKJmxGSyI0DbTwCihOyRjvkV0FlDR8xS/z35WWDCtvW6o65QyC3JI9jMdIAcpecCFD0qgP5g69Rw5I3vvfHvLIuYpkoxRLB5HSgpQjSejacdGnowO2wuZA81ceZtDvvSvDhOBI0ZusZQxzpEFdthc2ulJLjbDkwcguo08IL/UsrxuAAya7hWHKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN6PR11MB3039.namprd11.prod.outlook.com (2603:10b6:805:d3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 17:59:38 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:59:38 +0000
Message-ID: <bc06adfc-d676-a687-678b-97ff64886537@intel.com>
Date: Thu, 13 Jan 2022 09:59:35 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 1/2] drm/i915/selftests: Add a cancel request selftest
 that triggers a reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20220111231109.23244-1-matthew.brost@intel.com>
 <20220111231109.23244-2-matthew.brost@intel.com>
 <5b396396-46c2-30b4-09a6-1d23d474c978@intel.com>
 <20220113173408.GA20135@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220113173408.GA20135@jons-linux-dev-box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa96a42-e8cb-481f-dc2c-08d9d6be7755
X-MS-TrafficTypeDiagnostic: SN6PR11MB3039:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR11MB3039F418FDAA2EE4FB67D1E2BD539@SN6PR11MB3039.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/9STXh3yWOiV9JRNzqteno7w6YQUcuIbd+jddkUDHv4PWMGpvsFQT74S7EvDHgrIqVHF20V+PDbqLPCGNT+vQ69EA+Dn6+IJoRsPbP6uS61wytFXbk8pIneXo3BUmd6BIHoOKo9gAna2bjj1x1F9+SMTss6ZM0c5yuztIEtA9OPPXxofhYah4o0iI9dY6WHuxzfWrF1FB6dp0F/FF116yiQLFKMg7bJLQoRr3nkKni4LAyhxNJhKyJwTeIH8ROdYBAGtLDCJ/TiPkes52GpROSXXCv0Ia77pWKJx3D9hE+xJ4EybRmERuzZ6G39qyicGarbIQIvUQU6Byep7EgGKcyeiJ5t5lqHXYxT5TrxS03kmGxrg3Eg56xv7kC6a9YJYjuRKAqJ3IY/GVMvEHf2734bVcG4qXlwpkcAMCtcClMFlN2iO6h8uwWLV4x334afD4+AHGaElhCwhHdzktfEtTzbgra4DUFZ8RRgw4yDDTwKmshhApL5olVYuvS65BYarS29zTtjQotGYmXG62keHqqXWPxwEhx8KWecEA4koPnQJTLudmc6P+WbJHUnQj33eUO6qzoKb0K/XarPf3ub8pIKfc87aj7bnmm3KmurkTd0WP83XkkV6d0FII9aDI1J6Ir5wf7XOgKT0wuVZvzjQiVxqGub8WWViQ8xFFaW7d1ThyLVA8L0VU7yGTnoSdb6TRnAPllSPep+6qJPe4aORIT5/KycUb7BAEWuqpM2AeWSAa6luA0edJCAChWMlbwG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(36756003)(66476007)(66946007)(53546011)(6486002)(66556008)(186003)(31696002)(6862004)(6666004)(6512007)(6636002)(508600001)(37006003)(107886003)(316002)(2906002)(2616005)(6506007)(26005)(5660300002)(450100002)(4326008)(8676002)(86362001)(8936002)(31686004)(83380400001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlkzeE1vZHhIcmx6cTE2ajZISE9RL3VNc1BWOXA5ZUZ3Z241QmpiOGYyaVB0?=
 =?utf-8?B?bGQ1QkUzaWRoNmV6cTRWbTVKWlduRUtvM3NVMUcxV1FGenJRaldweE1HSG82?=
 =?utf-8?B?UW1Gc0M2QjZaR1VER0VZYUpyTzViQ1VWYnNMQ3V4dWl3OElKdkgxYUlvY3J1?=
 =?utf-8?B?T2tzU0hqTVFQTHpaakVybzc1bFlISkduSGsva3Zsa1Rrb2ZoQXFnVGNNbjkv?=
 =?utf-8?B?RGh1QUlPb1AvNFBPL0g2ak5aZlFYRlJsck9MNkRrTFJjY0g1eDlRQ0Q5ZmVH?=
 =?utf-8?B?OHZDMjNRSGNNMWVtVTB2anhhUDMzelM0WkFMenl3Um1hbks2UnNTbzJpWWhY?=
 =?utf-8?B?QTdSWldLNi9sYTh4RGV5dVBkZk9sQXZRS2Z2NVl1d3dQampibGQweXBFbk1s?=
 =?utf-8?B?MVR6ZGZPaWYyYU0ydjYwZkpTc0ZTZHNzQ3VIYU8xR3V6MjRYRUZWSUZxUE1m?=
 =?utf-8?B?VnI1aUsrYm9haG0rNE1jL2FPd1VBeXdvcVZQd3JPb0dmWGcrTVNqOHBKdGF3?=
 =?utf-8?B?cENDbTg0UFBXRURLUnkybEhJcE55aE44bVZETE85bDIvd29DOFNVdkxaanhM?=
 =?utf-8?B?NHlaa2Z2Uk1lSVZkdVhCZndOemw2RlZ1bDVMaGxVakxWTktKWjcrbjQ3Sk84?=
 =?utf-8?B?VVJXNzkrdldGMnFXWmtqUzkydmZwTVVzRk9WcVhsLy9KTzFmSGpwZ3NBQmR3?=
 =?utf-8?B?d3YxREtNMXNHdVgwWExXKzBXZndBcEl0SFJZenRDVFg4dnl5M1JRMDlNZmpN?=
 =?utf-8?B?RmFuNVdUdXAzSkpHRFN3UGR3K3Y5WXlEQ2RzQzBjNDBGamdLaWNsSzJoZXl5?=
 =?utf-8?B?bVgyZi9JT0pmUjRNeDE5ZjV1VUt2SWtHeHpuSkp1VXlOSFR3TldPL0Q3WmFS?=
 =?utf-8?B?TW1MTDRTejhQQTIxRzJzV0VnTmNleVRzRnVVbzhpZ3A3YmhNQmEvdVVlaC94?=
 =?utf-8?B?d1o0N0xYZmlId2ZqK2taRUNCYkRWaVhVeEF2dk1iUXlDVXRRY2dmdXU0VTRo?=
 =?utf-8?B?Nmhyd05hRStkSFBxVU90M1czS1BBVFZ0Mm9oZTR1dmh1aFdGVmNnVTFHM1Vh?=
 =?utf-8?B?RStteFRJTzVQcWQyZ2ZJOVBhd0o0MjNXK0J4WDlkTnB3NWFmbERpU041VWtv?=
 =?utf-8?B?bTB2dngzYW9ybjVvTFhLMGFGQkNRcTRFMC9GSng0SVAyeEhyZUJTcVc3MTRp?=
 =?utf-8?B?bWFUYk5nRzcwRHZKTkxzZ0pIdGlReUgwSHJodE9mcE1mcUFCR0RsN3ljSVRn?=
 =?utf-8?B?SjJndzFVSjJJQWlQbCtHaVR1RXgxUitMT1BjNVZHVVNJbUUxbytyZmsrcERS?=
 =?utf-8?B?L2FJazRwYkpXTlBRYkU3OWtOaHlnUjU4ZFFmWWVzR3V2aDNZMS93YTgzeGlI?=
 =?utf-8?B?NUZCM0M5WGV5eG9iY2lDa3JtVTU2TmJmdytpd0t1dS8vTEpqUHJtTnlsb2J0?=
 =?utf-8?B?UmJ6NTBwWjR5aHJoZnM3bWNDQzU2ekJkeVNFK0thR3MveXd1VjZjU0dLUVY4?=
 =?utf-8?B?M3RwRDcyWEUva05HK2FVTThzKytIU3A3T0h5SzNrVEpyRnA2MUh1ZU1DaHBs?=
 =?utf-8?B?bkZWYjNYYjQ2WHZSZXFRSkN1d283cHhCc0VCbkZKQ3Y0MklYQU1GQnV1S3U2?=
 =?utf-8?B?U2txb21GTWRwTW96Z2N5UjQ3SHFzdENhM0hWNUFaUGN6QzB3bU1KeDRpakRX?=
 =?utf-8?B?M0tlWHNhZklXL2QzZHNQRXBZRGlNR0h2V3pKNVNyandWWmJuaEp5TXVaOTAv?=
 =?utf-8?B?SHVTQ1V1QkR5c1pLYWUwTU5hUWJvTmhmRCtjV3h0TFdvbTI5bWV2dTN4VnRp?=
 =?utf-8?B?a1hZbTNrUzVmaEswM21Ma0RrSlVUdUkxZVdnNi85VGd4WE5kQUdIeFpGZjYv?=
 =?utf-8?B?cEx5R0Q4bnJCdC9rUlV3OHhueVFTYURidHRSa2ZLZ28ycjlKZ3hmc25IR3pR?=
 =?utf-8?B?enMva0k1MjFRek9sR0V3cjdFSytxZHVhSnVJSTZ5Z3lTSitWWHdmS3RPM3I3?=
 =?utf-8?B?bW80ckI1M2JKZ09FR3YyTEZ4eXFiNFRlMkZUK25ER2JWQ0tEVllTSmhrbm1Z?=
 =?utf-8?B?bjQySFhQLzRQdmZLS2plWk8wcUdIc0FMQTdjM2Y4OE9TUGxCQzIra21zWGFj?=
 =?utf-8?B?eVluVFQ1eEZzNHpGc0ZxdnNGMTZDeW4rQlF1S1duTW4xeTgwVTZDM0dmVHZE?=
 =?utf-8?B?WElXdUh3d1pHMUNiKzBEVldBS21GS3l4WndwU2RpKy9GeXc3MkdGekZTaEpV?=
 =?utf-8?Q?D8P1YoVfrWk91xDc2dk/807IjNmIq6HJZDujcAPgs4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa96a42-e8cb-481f-dc2c-08d9d6be7755
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 17:59:38.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CkXZ6I3nkvYYexxWlzHnEjMnYHgvABGqGiEJk/vWg6i7TLI1LUOXqy4uj1GNt/vEviLeBVrwzc01NHUpUs8/nT3bnbs7EN0/puu98aKn10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3039
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/2022 09:34, Matthew Brost wrote:
> On Thu, Jan 13, 2022 at 09:33:12AM -0800, John Harrison wrote:
>> On 1/11/2022 15:11, Matthew Brost wrote:
>>> Add a cancel request selftest that results in an engine reset to cancel
>>> the request as it is non-preemptable. Also insert a NOP request after
>>> the cancelled request and confirm that it completes successfully.
>>>
>>> v2:
>>>    (Tvrtko)
>>>     - Skip test if preemption timeout compiled out
>>>     - Skip test if engine reset isn't supported
>>>     - Update debug prints to be more descriptive
>>> v3:
>>>     - Add comment explaining test
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/selftests/i915_request.c | 117 ++++++++++++++++++
>>>    1 file changed, 117 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
>>> index 7f66f6d299b26..f78de99d5ae1e 100644
>>> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
>>> @@ -782,6 +782,115 @@ static int __cancel_completed(struct intel_engine_cs *engine)
>>>    	return err;
>>>    }
>>> +/*
>>> + * Test to prove a non-preemptable request can be cancelled and a subsequent
>>> + * request on the same context can successfully complete after cancallation.
>> cancellation
>>
> Yep.
>
>>> + *
>>> + * Testing methodology is to create non-preemptable request and submit it,
>> a non-preemptible
>>
> Yep.
>
>>> + * wait for spinner to start, create a NOP request and submit it, cancel the
>>> + * spinner, wait for spinner to complete and verify it failed with an error,
>>> + * finally wait for NOP request to complete verify it succeeded without an
>>> + * error. Preemption timeout also reduced / restored so test runs in a timely
>>> + * maner.
>>> + */
>>> +static int __cancel_reset(struct drm_i915_private *i915,
>>> +			  struct intel_engine_cs *engine)
>>> +{
>>> +	struct intel_context *ce;
>>> +	struct igt_spinner spin;
>>> +	struct i915_request *rq, *nop;
>>> +	unsigned long preempt_timeout_ms;
>>> +	int err = 0;
>>> +
>>> +	if (!CONFIG_DRM_I915_PREEMPT_TIMEOUT ||
>> Does this matter? The test is overriding the default anyway.
>>
> Yes. Execlists don't try to preempt anything if
> CONFIG_DRM_I915_PREEMPT_TIMEOUT is turned off. If we wan't to avoid the
> cancelation doing a full GT reset, CONFIG_DRM_I915_PREEMPT_TIMEOUT
> should be turned on.
>   
Hmm, I would read that as a bug. The description for the config 
parameter is:
           "This is adjustable via
           /sys/class/drm/card?/engine/*/preempt_timeout_ms

           May be 0 to disable the timeout.

           The compiled in default may get overridden at driver probe 
time on
           certain platforms and certain engines which will be reflected 
in the
           sysfs control."

I would take that as meaning that even if the compiled in default is 
zero, the user or even the i915 driver itself could override that at 
runtime and enable pre-emption again. So having any code use this as a 
flag is broken. Indeed, any code other than 
'engine->default_preempt_timeout = CONFIG_PREEMPT_TIMEOUT' is broken, IMHO.

But maybe that's for a different patch. If the driver is already 
behaving badly and doing the correct thing here will actually cause test 
failures then you can't really do much other than follow the existing 
bad behaviour.

John.


>>> +	    !intel_has_reset_engine(engine->gt))
>>> +		return 0;
>>> +
>>> +	preempt_timeout_ms = engine->props.preempt_timeout_ms;
>>> +	engine->props.preempt_timeout_ms = 100;
>>> +
>>> +	if (igt_spinner_init(&spin, engine->gt))
>>> +		goto out_restore;
>>> +
>>> +	ce = intel_context_create(engine);
>>> +	if (IS_ERR(ce)) {
>>> +		err = PTR_ERR(ce);
>>> +		goto out_spin;
>>> +	}
>>> +
>>> +	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
>>> +	if (IS_ERR(rq)) {
>>> +		err = PTR_ERR(rq);
>>> +		goto out_ce;
>>> +	}
>>> +
>>> +	pr_debug("%s: Cancelling active non-preemptable request\n",
>>> +		 engine->name);
>>> +	i915_request_get(rq);
>>> +	i915_request_add(rq);
>>> +	if (!igt_wait_for_spinner(&spin, rq)) {
>>> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
>>> +
>>> +		pr_err("Failed to start spinner on %s\n", engine->name);
>>> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
>>> +		err = -ETIME;
>>> +		goto out_rq;
>>> +	}
>>> +
>>> +	nop = intel_context_create_request(ce);
>>> +	if (IS_ERR(nop))
>>> +		goto out_nop;
>> Should be out_rq?
>>
> Yes, it should.
>
> Matt
>
>> John.
>>
>>
>>> +	i915_request_get(nop);
>>> +	i915_request_add(nop);
>>> +
>>> +	i915_request_cancel(rq, -EINTR);
>>> +
>>> +	if (i915_request_wait(rq, 0, HZ) < 0) {
>>> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
>>> +
>>> +		pr_err("%s: Failed to cancel hung request\n", engine->name);
>>> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
>>> +		err = -ETIME;
>>> +		goto out_nop;
>>> +	}
>>> +
>>> +	if (rq->fence.error != -EINTR) {
>>> +		pr_err("%s: fence not cancelled (%u)\n",
>>> +		       engine->name, rq->fence.error);
>>> +		err = -EINVAL;
>>> +		goto out_nop;
>>> +	}
>>> +
>>> +	if (i915_request_wait(nop, 0, HZ) < 0) {
>>> +		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
>>> +
>>> +		pr_err("%s: Failed to complete nop request\n", engine->name);
>>> +		intel_engine_dump(engine, &p, "%s\n", engine->name);
>>> +		err = -ETIME;
>>> +		goto out_nop;
>>> +	}
>>> +
>>> +	if (nop->fence.error != 0) {
>>> +		pr_err("%s: Nop request errored (%u)\n",
>>> +		       engine->name, nop->fence.error);
>>> +		err = -EINVAL;
>>> +	}
>>> +
>>> +out_nop:
>>> +	i915_request_put(nop);
>>> +out_rq:
>>> +	i915_request_put(rq);
>>> +out_ce:
>>> +	intel_context_put(ce);
>>> +out_spin:
>>> +	igt_spinner_fini(&spin);
>>> +out_restore:
>>> +	engine->props.preempt_timeout_ms = preempt_timeout_ms;
>>> +	if (err)
>>> +		pr_err("%s: %s error %d\n", __func__, engine->name, err);
>>> +	return err;
>>> +}
>>> +
>>>    static int live_cancel_request(void *arg)
>>>    {
>>>    	struct drm_i915_private *i915 = arg;
>>> @@ -814,6 +923,14 @@ static int live_cancel_request(void *arg)
>>>    			return err;
>>>    		if (err2)
>>>    			return err2;
>>> +
>>> +		/* Expects reset so call outside of igt_live_test_* */
>>> +		err = __cancel_reset(i915, engine);
>>> +		if (err)
>>> +			return err;
>>> +
>>> +		if (igt_flush_test(i915))
>>> +			return -EIO;
>>>    	}
>>>    	return 0;

