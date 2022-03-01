Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8410F4C8EFF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 16:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067D310E1B0;
	Tue,  1 Mar 2022 15:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9ABF10E1B0;
 Tue,  1 Mar 2022 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646148328; x=1677684328;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gd0f0KiM3v1qNG55g6F0U542zRbWyN/gRxWMnA9wjm8=;
 b=YwkO6rwaamQVZBrB8/wbFf/Oxqz4vt54ufZ003lpF97NNvo3TaUTnLXd
 PCICicboJaDdmABogYUVb0QZQxRDYr9/TKYNhw0uNeXG9hY3ifBbRMTHq
 1nHYbde9Yjp0NWJUB2/ANrWh3SmmTxZXRUhKINoxO5wljKDb0jmA/6NXq
 WgDNa1NVFTyXZGDv4TjFlMja8wNVom8Knw1DIe1X7sD3x+qpEQk5nJToE
 zritTIwcehlxzcTZTk27FtRxF6Ds1ctjFtmBp2cvTbG7raNSnlqFwSoFN
 M19PcHOLB8IiFhAFPh7OKEXOFpOxt16Vey9ymAhIDgNwmJkoMzmUjfNLk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253081116"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="253081116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 07:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="493141355"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 01 Mar 2022 07:25:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 07:25:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 07:25:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 1 Mar 2022 07:25:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 1 Mar 2022 07:25:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpe8wjAUPKwdRJAYni1o2PloYmsOBuVipONLog7SM22xzpwejeBDrv29rWcA6Et+8dIVF14jf/MAqEQhmdoogFgcLUXmBEgEpzmUscgSwbq//B30y9s9NSyOGBe2Ac5koYQMjS9OoVro5+Ls1wo0uiGBiD3CCf0N6W4w0kUaKmR2LVAB6+cfaMovEbswdvbQ/dKw/D55Ow5frBSz2/rPLVXPPtrdF8pbCc2hSH5KPrnjJXrEOyNfvi149bReWcpvKfE/3zFGsFdkwm23z0+Hd6VZmr2M6tBxzP8R0IlxM80XB/7CfUy/LIyBb7m/7LwraqnYyq03K5whJYfy1VtYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht3Dg2T14fS5M/Wsw4ijCEQlyHySOLG550gPeMv+9KA=;
 b=k6QxNLQBq+tZrkOJoVnrjjvGmdfBeBoBl/0NZF3WrJcOiNW+bkidaHh89dr5NMIg8XPe2B5nR4u5Z1o4YsxwJG6yZMdOlcJqt4zBMP0lZG9eIwtPgSz4jfQWofzzxdRBJRBV1Wq4jMMrFt1TGSKi7bgiGbx8TQdesiDIEWsifoxR/e6SUF3zgm546bCmfcrqGqeD7LnUPIAHKHe9ZPbU/4w0HAf+yFdQzD5yYrVd1OcRlFyyvkvVFvmRCATfYAyNLDytogbpjVTW+die9y5QRVbTqX3zAH/YVXMki7nG3vJLVS/u1qjSXfWwreNOfqy3+iq5X5HSCilasDHkf5I1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BN6PR11MB1251.namprd11.prod.outlook.com (2603:10b6:404:48::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Tue, 1 Mar 2022 15:25:25 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.014; Tue, 1 Mar 2022
 15:25:25 +0000
Message-ID: <9bf5b3df-dca9-285e-761f-572c6f9a37a7@intel.com>
Date: Tue, 1 Mar 2022 16:25:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v5 3/7] drm/i915/gt: add gt_is_root() helper
Content-Language: en-US
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-4-andi.shyti@linux.intel.com>
 <5cf0034a-fa60-0d80-b538-f070a166614c@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5cf0034a-fa60-0d80-b538-f070a166614c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21e62e65-80ea-4c8e-78de-08d9fb97b569
X-MS-TrafficTypeDiagnostic: BN6PR11MB1251:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB12516EA0F0B7EB0055127541EB029@BN6PR11MB1251.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceEsDEXLqmhY+rLm+g5JsW1bjLFE02ElBRq8Q9UvBVni1KzhG7eVuuJkUssvltdZ/eLQ3zEVkw4iWi9x4RXVnZI5kUkoMm9/GIGo3QsiAN2UqqMBKyv3EacsYlNVOMjRsFCS48CFU0rAnt+JOhYe66VBUqTwClo+S4mXtkPMSr2ybeveXqX0tn95ocHaWVesJWG3nnHOe7cEVg+UvPQ2Fn8yJglasHw136s+JxfLqUlu71iugMwJpgBkNbL94GUO2JI+qeUbJv4FDSua33S2yTKZnZGJMfiCU/ngzpLvUg1G0yBoiRuGPZelk0l8jKRouolG8jFF+L+1bWY16byXRLMbiEA+1gE41jeNYdKo3/kbrthiq7DB6FhS1ysVesXC0Q52zlutiA1lZnUdgxS1P0bP2DVOoYLua1qFHctsZDjs4scGeE6pOpzdvh6sRvMmU1AHsoNeZrIuLwWHxwEZqmy/RzMyfKrL4HXQxe3FjXV4rOB0bOWEIMBR/hXV2tsMM8bAO2lfj+EVbMtEjQ3tEDfqpCKl+RAJSEhlGg7LlDVcvTB0hrpY+RB5XCYxqPD845CWTaT+/3uuGT5aoSJchotuH8LrJZThnM7vqATy4rL5x3KH5i/UGVwPgCYZvDNvvT89dHK5EbPBakSBczuaFZrrQcCJR9QyP4HW56TzJXdvNYQa+tWjIv+XUWtvngHyTZEbqPEzmYRQDFXKnsSh3Ac8fA1lFjVh1/oCyo4KoUpXle4R8EzyiN6+ZfOdppuE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(6506007)(53546011)(82960400001)(6666004)(186003)(2616005)(26005)(54906003)(6512007)(44832011)(36756003)(86362001)(31686004)(66476007)(66946007)(66556008)(8936002)(8676002)(4326008)(5660300002)(38100700002)(110136005)(316002)(31696002)(2906002)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allUc2NSakZ0T2dVKzZlbHVQaVNVVDV6cUM1THAwanN3R2dvTlZJOFFkZ0N2?=
 =?utf-8?B?NkhIVE9yL1JZdzVZalo2M1FOU1NTSTUyQUFtZUZhb1Z5bkZMU0pXTDhrVmF2?=
 =?utf-8?B?THRueHFBR205VEFoUjBqYWljQ1J2N3RJRVJSSDZ2TVhsMnl0VVFScXlQbWNs?=
 =?utf-8?B?SkpYMEsvb1B1TDZhS3BnVGRPbHRibjdWaFBNL3ZtY3g2YlJYOUJEVHZ0a2hC?=
 =?utf-8?B?UkRjSWRaUmpUU05PRjVQSkt3RmI0WFpUbGIxMkduaVFubjUrN3AxTk5nUnFM?=
 =?utf-8?B?SUs0U2Mwc2o1ZTIxZE42NlVoZ1lZZUVGZGlORjFLbHNoZHExTWYrVklFSWNJ?=
 =?utf-8?B?czRVbkdUUktaUEhTMmZSako2QjB6ZERrYmR0UGZ5TmVqWlJmckZvaDlaeVJp?=
 =?utf-8?B?QmJmVmNFdnVvUmJ3WVFyc1Q1K1ZVMFJQMVlSbU1SZDlFck4wdStwZU1Jbnl0?=
 =?utf-8?B?K2JFbHp1YnZwbWk4Z3BvZ1dVVTN0WkJkNlRZK1dMT1B0REMxYnZoSkRNclhM?=
 =?utf-8?B?MWxSbjBnTGF4K1ZnTU1xWFc5STJva0hKV0VwQjBWWkxnZGRNc0tqeDhxSEZD?=
 =?utf-8?B?TTV2OU5selVKc2ZwMWpXVTJpR0NYNDAyU0tRdGx5eHU1NklESEl3S2NKdmRh?=
 =?utf-8?B?WFVKUW53NHVPZkRybVFPcStETFk0RXdtaEVhV1d6V3JtSkJXVEsvS3VJdGdp?=
 =?utf-8?B?VjYvSFBzUWsxKzhQRVBDWkpXZ2NLdlkvRzZUT1lNdzRMY0dQUmxMa3EwYVBl?=
 =?utf-8?B?dGI3MTIrK05sZVMwanJYMDVDaVVmNDd4clJoQi90bkRoYThFVG5xd2JFbUpR?=
 =?utf-8?B?MzEvdVZSN1FVRzlxRTRGcFRrQmdIWFBLUW5oaWtXQ3Y5ZW5wMXVGYml4cUdV?=
 =?utf-8?B?Tlp0dTdBUjdwQTgwUHBKdUtGVVhhbXo2dmlQRkN6dmZvcC9Rb21IdkkyWHZY?=
 =?utf-8?B?bkFPU2xORjVYMkRvZU13b0R2OXYrWlEzSFNiaWNlbS9nZ1ViSmRMMDREUDBX?=
 =?utf-8?B?QWk4QkNUNzIwUWthMUh0eDE4VjNQczRqTGtuVjIwV21hT1NZd010SXMrRE1L?=
 =?utf-8?B?dnU0T2VwaTFETGhXbHRTdlF6K081MU90b1RyN2ZlMnJmcVltY0dTM2FTWlhW?=
 =?utf-8?B?WW5jRmVpbkUrckVkYThzemJKY3JoMVVhOTZYWklFZ1RuTEdTVEo3TXlZbDZ4?=
 =?utf-8?B?Y2JwN2RocDJTczg3amtXNHFoczA0WFVJNnlvRTZzNWZ3alUyMHBzRDk4ZmxI?=
 =?utf-8?B?dHUwaFZMbEJOVEl5Y3Rkc3FZQ1puUHhHb3dKSU8rWlE3YmpGRUhUOXdpRVdN?=
 =?utf-8?B?VzQzVFUxMWtlN1EyT2R6VkdFeGpuOFFiU1cvdEN2b2R5WHhYRWhpNlloTFFN?=
 =?utf-8?B?TVh0cjhFbmhsRnR4MXdZZXp3VjlVM0I1Q3l0dmg2b2dnQjh6bTlhZTdGWVZ1?=
 =?utf-8?B?ODlZU0V1dnF6TzBBRkdxWFRYQ25IVEV5TXB6NmtBdjc3U1BIWTBQRFF2c25i?=
 =?utf-8?B?b3lXSkxUODBqODNRRGtrd0F2cUZWQnlqNHFKd0ZzSFkwenRyT0EyS21Ea3NR?=
 =?utf-8?B?UXhFOTRMV3czM1lFSW95UGVxQWNtRnZKeWFYK3JRZ1pNQVZWNW5wMjdhcXh1?=
 =?utf-8?B?WGdBTWFoUmplcUdJTTRjUXZ6Tk9uaW9wWVdqc09uZjhQSTlCUE96YWNmU0s4?=
 =?utf-8?B?Z1FMTGthWjc4ZXhTNFZVOXl6WWg1V0c3TEFlQWw5cU9oWmZuamU1MXJsMEtR?=
 =?utf-8?B?YytyNVVjakdLUHlxN2F5NnhTNVpUWHdNaVEwS1F0NWFGYnZ0ZU5JUmJSZzZ0?=
 =?utf-8?B?cE5EZlVnVS8wQnJyWXdXTWxnTE0yR1E5TnpXUWJoS2ZEWHcvMWVMMnQ4ZC9B?=
 =?utf-8?B?Q3Y3VFpFdkxHenY0a1I4dENoeG9JN1NlazhIaFZVQ3VpOTZrbW83M21haUdZ?=
 =?utf-8?B?VXZiMUlzeUVFYURxT21HVWQvQkExSjdLa2FwZ0U3aUxhSll3OXRKR3cwcjg2?=
 =?utf-8?B?amE2Y2FDTDU1dWdFRHo0MU1iQSs2NS9UZ0E4d1hWNWtpd0JMMGt0anR3NHZK?=
 =?utf-8?B?TVpKWXhxUEVKWHV5WXZGM0g5R0gveGpLYUd5OHlFVTliaDJXUi9acU03amNr?=
 =?utf-8?B?c0h3SGFiVjl5VHJCejJOckdTMVBibHpwSEgrS0tISGV2NmU2d0ZMQ0o2cnpQ?=
 =?utf-8?Q?/PGwT3u5x6mILGcNu/k4xrE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e62e65-80ea-4c8e-78de-08d9fb97b569
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 15:25:25.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmT8BCL1Ugin5bTcd/igqi03UYLzghUdnFVyLfm8KQNroGeSE22A3OcgfhcE66+ctw4Oxuc41RqAtUVKyc74SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1251
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28.02.2022 21:02, Michal Wajdeczko wrote:
>
> On 17.02.2022 15:41, Andi Shyti wrote:
>> The "gt_is_root(struct intel_gt *gt)" helper return true if the
>> gt is the root gt, which means that its id is 0. Return false
>> otherwise.
>>
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index 915d6192079b..f17f51e2d394 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -19,6 +19,11 @@ struct drm_printer;
>>   		  ##__VA_ARGS__);					\
>>   } while (0)
>>   
>> +static inline bool gt_is_root(struct intel_gt *gt)
>> +{
>> +	return !gt->info.id;
>> +}
>> +
> we could squash this patch with prev one, where it can be used in:
>
>   intel_gt_tile_cleanup(struct intel_gt *gt)
>   {
>   	intel_uncore_cleanup_mmio(gt->uncore);
>
> -	if (gt->info.id) {
> +	if (!gt_is_root(gt)) {
>   		kfree(gt->uncore);
>   		kfree(gt);
>   	}
>   }

It can be used in intel_gt_tile_setup as well, and then you can remove 
id var.

>
> or just use it this way in this patch, with that:
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Accordingly:

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>
>>   static inline struct intel_gt *uc_to_gt(struct intel_uc *uc)
>>   {
>>   	return container_of(uc, struct intel_gt, uc);

