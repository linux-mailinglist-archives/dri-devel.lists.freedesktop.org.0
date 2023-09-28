Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3657B15B7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704FC10E5E2;
	Thu, 28 Sep 2023 08:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD17C10E5E2;
 Thu, 28 Sep 2023 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695888508; x=1727424508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c60bgchNCHs3GTQx2HFQEHC2upk9/AHHPyJ8yexOb0A=;
 b=Oq/xqzLGEVRHMV++QCTT+0UhjZUW7ay8ECRI+N4o6V38N+wzj8alUaRu
 V2VY8ympml2WHPp2y2r8EaDgCK6xxNAlIF2d9MrEQDHjHxUR32Hlrs6Ow
 NO3eAADzgFrJTrv8FeiR//oXAITKK46iYEWTjY0zCMHPbNFfTf34DgKQ7
 L+IBLnOi6eunMcAIH3/Y98WikxzWZrtaucO6YzrXHaOVyfpE9DY29Fzyy
 TSd/KpxzzJJLCFT9RZD5UIwxg5LRv7e4OdwsbtA80uDsj0gze/9UI2rse
 Ks4z9hIoyKZ4vqZsBQivNDljFWCSLDeJPDDO/swHtHycElX6eiFkZuK3D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="379282505"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="379282505"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 01:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="699188768"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="699188768"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 01:08:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:08:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 01:08:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 01:08:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 01:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaMc/0FEHR9y+q/U+CPxmM2jS1R0u+POGHsEqPfwYH9lz852It4Pt6FclS6IzXkG8bZ4XRt41RhyupuExWTnL9R9Ct1o6QMQWbxrGjcXC+kTGzdb/5V/d9qCn2KsVKT/U9oSJ6cSHImNp+aSYABixTYqkbyC5HO87merKJKRvpV2yIOm/9n8QVxcSwY4QmSrlulCq1Gacxdg3P7lSR9OaS95eWRfb2nNpJRf2raqYP65/hPQ8UUzERbHfPObckV8/bGEU2s+qA2QOg83JTEVUQr8zTChHa0PaSgzIYy7e+DMRUwPeCYTHb4mFuWbGeU372em5+kpKaKrf5xV+lqaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SszmrBLuwujUUydBMbyYJIVYSSNwZWpLWO92q7w4jYA=;
 b=VTErOl8Spln89dALQAGrgpcq9ck3SWEnZbh44omTZTSEUJeQssRtiBF4ZyjXknfMUkURKzU4+tmX/VkpBkhT/wVZJcdrSrZiiEWzKKvP2xwre2Ru0N4BZEQ5/tNlDruHCWSU4MJCKvt7CPlASCk7LfU2rUhKcqDohGXHHnR22GOQ0sZ+p6MgXoiaptLVXBX9BGtsCkebDTSIO27djKx9GPMafMRpBBtmTjJF8xchfrHAN4kd7+OfQ/ym1O6FjAEhBIWlvMfygkoSk9WRfFrTy/pyFpihZnXSGYIVGvA/qCw+RrbBZmnR8DHMr+TcEEtpxkD7OBpQzDRcZyzVRpFWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Thu, 28 Sep
 2023 08:08:25 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 08:08:24 +0000
Message-ID: <b7c3fc04-aa19-9855-5895-cf60bc1914cb@intel.com>
Date: Thu, 28 Sep 2023 10:08:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 3/4] drm/i915: Reset steer semaphore for media GT on
 resume
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230927210357.17461-1-nirmoy.das@intel.com>
 <20230927210357.17461-3-nirmoy.das@intel.com>
 <20230927223536.GZ233750@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230927223536.GZ233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB7PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:10:36::24) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 017c8140-a5b7-4e0d-385c-08dbbffa1646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SorqKk1h0akW6vXJ1oK4ZBTXqf1xJigYFY9xenGZ9iBY4B5oQHLcXFIKoFT5iHIIU4Lfyz1uWrKZT3JAhx4qNN3qjM9HrdkCpqUMVwtQrIwz6TFU2V9rTA90KawfB+bn5ONPapz0KMR0B4aKJOJbJsaMvqqVmtHjhBCWl/BbPBhBa4zl83HQtTR3cuTsXzh+5VHSr59tk4p+drYOF41h5m1wM75plhuPgh1zsLSBsYNbQ91h8Dq94LpCrFoC1szRk4VJQKr+fq0HghfQ5HNd7N+dfPxpqexdZrzFKm2AJ6IXbod71CbVGwgfXA2jo3JYCURwdebW6sq2AMrbNF/pcmBmfL+4Rwly97eVSkc1YmUhL2Ls4PGLzPZc+Vs11/Dy2MOYI2ZsTY0FuqM+Wia6rmLJxJJ3tqS2UB3Xwb4doIe8STYng1qzBoBgfuFjK55gDaGnfMW2KYFs2M4HNX7VvFkGNduP8q2YXNWSgRL3mO1EFH7a3bbWQBHEIYIjsU/nWrkfv7VvCRcG1eTVy8WC8MexYxz/VNWAjxx9T5KncGx17epThsorrgpq0kQS8EbEVhYFrg7nbLS4D1SWSnPdmWVrNoQydol7i1bTdQAZZujwGfEKIukW5Xz64BNtzT5OhPZiBh/nqCcMhgqfUAg2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(316002)(82960400001)(38100700002)(66476007)(4326008)(66946007)(6666004)(2616005)(6862004)(53546011)(26005)(6512007)(6506007)(6636002)(37006003)(41300700001)(2906002)(31696002)(8936002)(5660300002)(44832011)(83380400001)(86362001)(66556008)(8676002)(478600001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzBneVBoQUV5Ly9JZUJiSVFyRHg4c2l6RlJubjZmZlRRSU40UFduMTcvSGkx?=
 =?utf-8?B?TmJsN1NQSXBQNTZXOVowazZwZFVhK1VMQmVSQ1B1ckxkYzBQMUtDOXBKV09N?=
 =?utf-8?B?TWhDYk5Qam05OUxkR1grZFU0aWNoSXRWcm9NV2VQenVDUXNwcFpNZm9UYVJE?=
 =?utf-8?B?OUZJTlQzK21WNHJXeERUa2VycDJiQWxVa0xNaGRuckxOelkwMU1jMHdUdVhz?=
 =?utf-8?B?YnAyL2ZUNlo5TlZZUkFaNUxqNTNCS1djOTE2SHh5aEpGdDZwUVdyRnZqRTN4?=
 =?utf-8?B?dW5qbDhMWi9OMjRMTGNLdytzSi9pdFQwNXVPL09tTVZjVG5vWEVwVWRuNk1w?=
 =?utf-8?B?QlA2eGtTd2RZOTdtbHdWeDQ2Q1hQV0VFa3JRczVBcUl1cUFSV3Fhem5LMnYw?=
 =?utf-8?B?Ymg0ZGQ2MFJwWFc5Y2JKVUdEWGplaUZjVmQyVk00MVdobmp5TFE3WDlrTjI4?=
 =?utf-8?B?aEtYS1pXdUNvdGp5UFBiU2hRRk9SakVnUzM3blorSzhlaThGdjVQQkJ4ZXY2?=
 =?utf-8?B?Ri9TSFlCMVZySGFLd0JlRjZjNXpOZXZtR3p1T3hpS1BCeCsxNEd4NFFDUGRx?=
 =?utf-8?B?cUpqdTVGSW9xUEpHSjBvdnRVaG5wNXJwMFYyRVNCMmhEdUw2djBoY1BaeGV1?=
 =?utf-8?B?WGNQbytNY2QwbFh2YlMzNDhYdVlJWE9uRlp0NUN6d0ZuUlV4V2t0dUlITWJs?=
 =?utf-8?B?clRJOE1iMGxOSXJTNk1VWHNnUVJwU0ptdHowSGphdmZ1NEdDTXlzYzNqMStj?=
 =?utf-8?B?dnBIY28zWlVtd0xlNERPVklSL05iZFh3UlNkOUpCMVFsbmMyQVZpOW5MSCtD?=
 =?utf-8?B?aVk3Q0g5d3NqdXJseDlBakI2dkZiVm9XUXZ6dWdlYXoxNU1BZTF4Ync5dEx4?=
 =?utf-8?B?eFVvd1JFYUZXcjMvKzVrWllxQUNiNkxkaitwSElkTkxOdmhWd0Q0RXFmSXdR?=
 =?utf-8?B?NXNiaE9rS0hscXArRUdGZGR1VFM1Y3VzTGpUY2dPSGZUWDJ4Tk9abnR2dktD?=
 =?utf-8?B?VUtFMWt5dHJZdXJuYTlHcnZzYVRTbmxIdERPWE4wUEIzV3AxM3J3c2xZbm5K?=
 =?utf-8?B?UldiN0VscjAvZHVHT3dVY0c5Zi9iWW91aUV5RGZBdGVrTm1MOEhXcnlXL3NY?=
 =?utf-8?B?ajJiSVRPWndPTFJsR2x0UTRyaUJaTS9RSkJSVFNEUVArZ1dNRzRKOE9LN01H?=
 =?utf-8?B?Vi9ZZVlzWGtPL21ibWpHcGpNTnRPeitvdjg2R1dZWm8wUG1lSnZlZ1dWbTMy?=
 =?utf-8?B?bm55cFNodmRiVHM3S3BlMUdKbEZvY0pHd0ZkUlE4bGxzR09zeVRKN01hVGdO?=
 =?utf-8?B?TEFoZ3d4Sjg0U2J4Y05ETkh1bndQWXQ2dmVySDdZeDByVG4yRldjc0ZlUllB?=
 =?utf-8?B?M3RwUUwyamYxUjVQMnk3OFl2TkJ4aGxNWHVSU3RUcHh2aDlxR0MwdWx5U1lE?=
 =?utf-8?B?c1B2L0lJcUhyc1BUcDlJMzNRYzhDZ3hHK2pFaE15dEJrUXhGSFREVzE1NTZw?=
 =?utf-8?B?S0tFbWFnaE9VOVBERVYyWmZHT2xsUWtnc2tMbzdXeUtXU3NrSmJCdXpHcHFL?=
 =?utf-8?B?U0N6c21GZnkzV2FMNkl6N004T2daNEUrMFJiNGxWbXNtUUtuaDJwRFdUaUZ3?=
 =?utf-8?B?d2hqVTE3SGdnSHZ3ZExaR09JNWZGTmRvYkpYbFN2Ukg3Tk5KcTlRQWMzSEIv?=
 =?utf-8?B?UTl5MEZMd0t0YUpUTG12MVoxU2ZYbWsreW5jUUs4VTVGdzc2bWY4Vmo5U3J2?=
 =?utf-8?B?d2tCMVg3dWtuVVhNTjVuUHFLR2pLYXNvV2dTMzEvQnpsSlB6U0RZS3lha3hv?=
 =?utf-8?B?dVQ3U1VmNDFzYVhwY2dueUp6UlpsR2FzbTFhM05LcnJqVkYvRVQ3SlQxSTc1?=
 =?utf-8?B?MXUrSkZXa0l3S3g0dGUwQ0QxU1NUNGRydjM1ZWdma2UzcTJuVFhZMy9hSzR1?=
 =?utf-8?B?L0l1VmttYnl4eVlzeUlaWnVidW1WaFJVbmxPajdjN1NVbEo5ZGtjWjk0bHRK?=
 =?utf-8?B?THB3K0RKUm5NNXhVb3RsSUFQWVpFdDhIMVczS3BLWnQ5U0RhQlRleDBjMGk1?=
 =?utf-8?B?bFRjcnNCUjVIK0pvSk82THhFWGtsN3FhRWJ6aTNSUzdRQSswOGJnU0FmcFFh?=
 =?utf-8?Q?CCAOzQ45McdVdn2zOcQfXkagB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 017c8140-a5b7-4e0d-385c-08dbbffa1646
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 08:08:24.2512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drhkIPyNbWFVOQq30q4j0PpR4CjDqE2YhRqjQs7/6ALUr0ez9n8tu22GbcyJJtY84UQ+z9jkxPxk/Er0BCQHKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/28/2023 12:35 AM, Matt Roper wrote:
> On Wed, Sep 27, 2023 at 11:03:56PM +0200, Nirmoy Das wrote:
>> During resume, the steer semaphore on GT1 was observed to be held. The
>> hardware team has confirmed the safety of clearing the steer semaphore
>> during driver load/resume, as no lock acquisitions can occur in this
>> process by other agents.
> I guess the question is whether we just want to handle the one case
> where we've already seen a BIOS snapshot screw up (i.e., specifically on
> GT1 during resume), or do we want to make this a general sanitization
> that we do on both GTs at both load and resume, just to be safe?  Given
> that the hardware team has indicated no external agents would be
> expected to be using steering at the point the driver is
> loading/resuming, maybe it's best to always do the sanitization on
> platforms that have a hardware semaphore?

Agree, will make it got all GT.


Thanks,

Nirmoy

>
>
> Matt
>
>> v2: reset on resume not in intel_gt_init().
>> v3: do the reset on intel_gt_resume_early()
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index dab73980c9f1..59cebf205b72 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -13,6 +13,7 @@
>>   #include "intel_engine_pm.h"
>>   #include "intel_gt.h"
>>   #include "intel_gt_clock_utils.h"
>> +#include "intel_gt_mcr.h"
>>   #include "intel_gt_pm.h"
>>   #include "intel_gt_print.h"
>>   #include "intel_gt_requests.h"
>> @@ -218,6 +219,17 @@ void intel_gt_pm_fini(struct intel_gt *gt)
>>   
>>   void intel_gt_resume_early(struct intel_gt *gt)
>>   {
>> +	/*
>> +	 * Reset the steer semaphore on GT1, as we have observed it
>> +	 * remaining held after a suspend operation. Confirmation
>> +	 * from the hardware team ensures the safety of resetting
>> +	 * the steer semaphore during driver load/resume, as there
>> +	 * are no lock acquisitions during this process by other
>> +	 * agents.
>> +	 */
>> +	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
>> +		intel_gt_mcr_lock_reset(gt);
>> +
>>   	intel_uncore_resume_early(gt->uncore);
>>   	intel_gt_check_and_clear_faults(gt);
>>   }
>> -- 
>> 2.41.0
>>
