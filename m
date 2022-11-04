Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36261A065
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 19:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2FA10E0BB;
	Fri,  4 Nov 2022 18:58:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085B10E0BB;
 Fri,  4 Nov 2022 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667588311; x=1699124311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ADOlbB8mr7mleficG1u5O1fBWA9p5rDXvWVF8BWEoXc=;
 b=YT7GO7bRvlhDY4XiLR2ZbSbmiX7legmPTXR3MrtcejzJGjl1IIOpsKGt
 fVwFTbSr1gKCvVJu8Cdn7JaSRciVQQ4fJvIY+FCgx6te90o4eDFBoxl/9
 N69bPssdnk3as/4mS9aWvs0Kkvt59A9nT8pmT9o1IcioRxRMaQnlVAXqs
 dOg3xhuRtKuL68zNUBWCimmM2gzoukmKwrbK/Uzd8f2ZwoafQMBSP1QAk
 QAesU7J08eAFihNudwqghT6pgJjYLFyp1/Cadh76d9/+v93ZElJQpcdH4
 a8zd5yOtYra+kHkctFCClR697TkGAtoqV00RIPoQxAUBmELviQiVn5C36 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="308755897"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="308755897"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 11:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="635192797"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="635192797"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 04 Nov 2022 11:58:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 11:58:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 11:58:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 11:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCOtBzWGSB62SKxrEQbSATb5AiYxmHLeoel78JKKt14VH9wM2MQTMmW0TPYjcL4RHj/gJw1bGaPwC6NE9RfN6tyiY45gArmJfLnFPO8rUlf30EE1MMKQfpqFQRaOLrlzgkFqtLgCEE9ycN3N/o/D7qqB+OVsm87CQdVvudKB71sIW2qQmaZ2IGg2/2DIUdrp56jtSE19MFlmyYSt0EkgLZ0KWRPH39ITwyCMFuF8UIVAs7J0opGy1FkfXurVYUHIw71OOQEsRoX9A9GRrUqbtTAVdw5i38zHI/lMo6rloNOCyDCdAQ+oGR3zEqlzR6/efKNQ8quZOjtYxtuSBBp82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrdLQRdSLsSgmbODdWMTSMVuggDb8Aaj7qPtRXTXsvw=;
 b=DoFX7KjPBg3oRpVcy30eg5V0rwkbBBwz3QOdKrzwx+81CBdTSevT418Lz2mZAlwKYOMsbSMf2N8uQQF1jJXnjRdzj/6IfXYxeQGowkZ1HSgr/oH40sWpqQQzZubWwYZl4gtMoS7o0oxsMWMaq0iKRocnDZpOHrTMhz+0yhFrFXxZQj+kYKZhJPWi+L5JU8ZFroaQnZbSTggzB/xBHBpiH+WQu/qvJVZJC6lXlVD0RFXiTsmx1//gCwck/aXQ/HLdnyb8DIldQIgIwMsNWhe/pg355W4IBeFjdupFojnPVqZAAD2MtTUS6VBPFOD4Pxmmvy6i+DZSGyi4QvnB+gr/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 18:58:28 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 18:58:28 +0000
Message-ID: <a08b7c7b-bfa4-9ed2-e48b-b311f696c6e5@intel.com>
Date: Fri, 4 Nov 2022 11:58:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] drm/i915/guc: Properly initialise kernel contexts
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221102192109.2492625-1-John.C.Harrison@Intel.com>
 <20221102192109.2492625-2-John.C.Harrison@Intel.com>
 <307671a5-08c9-8ef3-9774-e40338968dc0@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <307671a5-08c9-8ef3-9774-e40338968dc0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: cef8ca2d-9861-4540-2bc9-08dabe968f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fhra22SFOV0PPUDpCdJ27uSFH/bt+3Uvync4MRJFFQTshcfQa84nVyHbb8JsUpdANoaCXfkd5UiEDTFIAvVIcL1jGdtmpNN0lIf6ryMBE6H1odxahKeXLr7U5IEiuqnxUyt/r30LEHZTS776O/Uz/67STannnRSmcjPUdpdWPPa+kI06YaQWgfjRIGAMY1ZB/XvCY6HsA2/PMLtray43KDKru6uOmJZqACQ89vkYS6Xbz+IuQJTqwAH3ihGdM0nxAusWm5y06P9LHgsEE6XjTo8SJpzr/JkOIOTgQYqktTMM9F24LZSb10U/DBRdxCxuzCTtQEmzb2rtU8jo6tGwZLsbkVVxa6c0FNDE7v2/Img085ZMW7a9XlY6fvbcTNtWzO8QjmS+kocnjzOX4AzGslI/iyJm+9yOBoSBnosZqSGjQP3RK6yX2EYx0A7ZYl9haL9CylUSlsIyTfsnce0hUNl3B92ALKqEv4cmwjicCxx0EcZzQfWAHWRj19nno474gd0Nntvvy4CwhKwP34hrEQtrtFbaYXUQ3KD9EnqhfcxDh5qSsWb11228zKoKq4tYbtlpfxJVqj8TEDkq/a10dUMAnQ15OK1+KxEpw8d6ePa4Ufhz6mgLeO2A5tshW5yMrndMQtD0Xc54fU6vs9qtTM5C87OYp/pUyrIHn0NYF4H4WnYJNa7zeX2HNiEZKCHtRIN/gd6FKeUgZvX5/pTIg6w/IR6lr8Ovr+KKCG63jK0FzNe1+a5qpk/9gZimvLczsh9s3J71fUbuP92ChWmLj50PTbRBS2IcGmV1SmiAtC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199015)(83380400001)(186003)(6512007)(26005)(2616005)(82960400001)(38100700002)(2906002)(5660300002)(8936002)(6506007)(6486002)(478600001)(6666004)(53546011)(8676002)(4326008)(66476007)(66556008)(41300700001)(316002)(450100002)(66946007)(31686004)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmE4YWowY1NnY3RZTCt6eDhIUys0WVNmQ3pUTE5iZkFzalc5TVZvSlIwUzJQ?=
 =?utf-8?B?TE9UdmhzVVZhMzZVYTBGWGJJQnVGbU50OUF1eWxYQkxtMjFrTVBodUd6YmtW?=
 =?utf-8?B?NTcrbHUxdUpvSFVQemRsd1lKVEhKQkYyQXYrZXFYK0tZZTJibmpBRE9WRkRX?=
 =?utf-8?B?Wm1URkt1dm00YlRSUi9XRDRLVmpJK0MrWTRWRTdvbzNQTTUvNmRhb3hwQmZt?=
 =?utf-8?B?enNXRE5wbWpTeFgwU1hucmRGaGF3UmRkRTJEV1lQamJpRkNuSHp3bFVEWVZr?=
 =?utf-8?B?ZCtmWmU3d05sSGxsMUV6QnRrVktaOUdXczBkTm1mM0RtZGRQVmRLRTcxWitY?=
 =?utf-8?B?WCtRKzc3M2NvVXFSVVZHaVZRUGhEYktXL0lxc09qeG5hNjVFdEQvdTFhcExF?=
 =?utf-8?B?WEk5T3ljNkErSTVER0xsZ2hVOWtWQjN6NE5EWkIyNmM1NHRuUlBJNUYrQkRM?=
 =?utf-8?B?a0JCMnl2V0IwcnJRR1lUNHBQK1o1SUhMQlcwczBPWDdMVXpidWhOVHlCMHBO?=
 =?utf-8?B?K2VyVElJSlRzdUYrZUhqYkIrVmViRitLSXlvL0dYTS8zb0I4eVU1UWprYS8z?=
 =?utf-8?B?QmN3b3MveERRWGxHQWxSQ3oydUdHR21XRThOLzFiQU5CSXR6Z3pJdHJRRktX?=
 =?utf-8?B?Q3AvWUJWenNuOHdwWTFhL05uZVZndVV1QW1DT1pkTzBkc3lHL1R4c0ZjVXhX?=
 =?utf-8?B?ei9xaGJnSFgxYUZIMTB4SWVsaWc4cFRhNXdWelQvYklPNUZ0WUJETHJCVEtr?=
 =?utf-8?B?M1BBcjZ4UGkrS05sOFZ6bkp3cHBWVUxqS1pKbmd1SjJCa2xIM05ER09nUi9o?=
 =?utf-8?B?dENwTHVXUHlNUlI5WUJDZ3RVOE9IQW1yNVJlTGxTMStKYkVBMEpUeDFleERt?=
 =?utf-8?B?aDgwK3hoQkw4cFJlQ3JRRHNpK0xQNW1lWVFjZys2VFBrRFM5V05MTlhsZHU5?=
 =?utf-8?B?RXQxb0d5dVpRSEgxQ2RlVTNScTJJZlFTZngrOWEvcXRxMi8zdzQrNzRUSDR3?=
 =?utf-8?B?VCtLQ2JhaEd5WmFkOGtuMUsvOEoxcFlxUWhFZDhmUGlMTzhiN1NJSG1nenpP?=
 =?utf-8?B?VmZCb0lwQ2VuSUUxUE14cHNxQnJ0UzJCZi90dWd0V0l6ME1yblN5a2dkazdH?=
 =?utf-8?B?U0tudHN5eXBuM3ZGanZmN0sxdmdtZVlidE5iRW5XVTdDRTlsQ1hVaU1hV3Fm?=
 =?utf-8?B?dUNHKzM0K054RHZqSW1IeEVzV2JRVTRHQTN5dVpsNWJaeXpxY3lraGJQdzZC?=
 =?utf-8?B?WmR0YlZXa3AzUUo5UTFmMys0enVpdUlWT3NwNHZMUEk0Qy9TUEYrUFdPbGZh?=
 =?utf-8?B?ZVh1SitRWDA3QmxIZXhYNk1YVXBwT09ob2Zaa0dBbWRUanIyZkFmT0Vwd1hE?=
 =?utf-8?B?RGxvWUo5M05YaGkxMStnejZNUFYvcXBuNDdpSzhPODJNeUdTTnJaS2dVWDVY?=
 =?utf-8?B?RTVibzN2cXp6T1N5V05QU0dqRzlML3gyQVczemszNjhIKy9pR1R1QUxOUkZM?=
 =?utf-8?B?NUNVNlZCbXVleTkrY0F4M3MzVkd1eGpoRmpYNXVjZzkvc3Bud1dReWI0b2k1?=
 =?utf-8?B?MUlLaXZ3UjBzczlQRDM1YVZ0aExaai8vTE9XaEdpekErc1U2Q0drbS9yTGkv?=
 =?utf-8?B?czVpbGJBNVY5aGdxcmtxMnVMVWVETHkvVnJETG5OTjNIRDROSkh6Zk1WKzRn?=
 =?utf-8?B?cWRYU0ZGNUtuQnduaGNMREJTK1o0dUdldXZUYk1rWXhEblpKTGk5WWUxdDZs?=
 =?utf-8?B?bXVhRGlCeW5aOHNqUWdEOVdFQ2I3b0g5alAxRTZnUldWbHFDVTlYL3hSUkVv?=
 =?utf-8?B?Vm1xTHVmME1EaG5kMzFmWnVEQ3FrWDh0SHR5NUZNL2R4VDd4d2xJUWYzUWVI?=
 =?utf-8?B?blp0THJER0JGckFVbUduTlM3Rzk4Qk5QbkV6VmM1U3kyOFJ2UWltMjU3dXg0?=
 =?utf-8?B?OXYrSm83SmxNME1Bak5nS3JQTkxtZWxFUlljL1lNMWREYTIvZGZTVThFcS9O?=
 =?utf-8?B?RWJiK3BEVGRYWVBUTk9BSk5FeUlXR0ZEUjlMKzUwNnl6UDB2N1lWbkg5Z1p1?=
 =?utf-8?B?UmRrVTlHaFdnMnE3bmVhSGJ5SWhqcEpDaHZwLyt3ODN2Z3dpMEwyRkdrWWFO?=
 =?utf-8?B?M0w0aGRxRmdjK2dTdG1UZ1hTa3BYUWVMUit6SG1NSUltQkNmWmNoZTJqeHNp?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cef8ca2d-9861-4540-2bc9-08dabe968f1e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 18:58:28.3243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F7YTeJFnBPriR73+EBx5TXBqoPgtD/Fc6Pq+MaMuESr0a9vTWhMBI7N904oeClT0veskoKQx/mUwjLwJgAkKTvvtTPXiEfUhZh2/5W3ymo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/2022 11:53, Ceraolo Spurio, Daniele wrote:
> On 11/2/2022 12:21 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> If a context has already been registered prior to first submission
>> then context init code was not being called. The noticeable effect of
>> that was the scheduling priority was left at zero (meaning super high
>> priority) instead of being set to normal. This would occur with
>> kernel contexts at start of day as they are manually pinned up front
>> rather than on first submission. So add a call to initialise those
>> when they are pinned.
>
> Does this need a fixes tag? on one side, we were leaving the priority 
> to the wrong value, but on the other there were no actual consequences.
>
I think that's the point. There was no actual issue, it's just a 
theoretical problem. So there is nothing to be gained by pushing this as 
a fix. It it seems like it would be a lot of unnecessary effort to push 
it all the way back to 5.17.

John.


> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Daniele
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 4ccb29f9ac55c..941613be3b9dd 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4111,6 +4111,9 @@ static inline void 
>> guc_kernel_context_pin(struct intel_guc *guc,
>>       if (context_guc_id_invalid(ce))
>>           pin_guc_id(guc, ce);
>>   +    if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
>> +        guc_context_init(ce);
>> +
>>       try_context_registration(ce, true);
>>   }
>

