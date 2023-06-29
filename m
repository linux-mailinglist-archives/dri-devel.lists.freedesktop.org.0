Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2B7423BB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37510E0D7;
	Thu, 29 Jun 2023 10:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECF210E0E2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688033405; x=1719569405;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=giBsB96LXy0N3J0I0bGCaNZ0ho1qs0t/bwXoMiTShM0=;
 b=Lowlb/H3nvJspp8lpV+GdYRf0GUp4JIBlECsM+ATkmKPoss0O3vieEor
 WHtKx/miEGdAWftqJawFSHgYcChMeHbReLPJERooNAugIypUrCYnp/WX9
 yn+L9YCpwG36rHfAuz44CsDetnaNe9prVaMZzr51EDfti7dJLb9lPdDBb
 SeOn01QWDV8FK775q17B75IusNMbFGPvUb0uGD5mZP+Fiuc9u3pAoD8Pw
 t1gtolAJVYDTi8n2VhW6NAYBa7jLkMogZHwqgZlfPmibUhNLoQNOctT8a
 mO8F0D9CNG4wr8xVwpXqe0bZV/yM2glh1XisqG7CLs+XHKfxn3JddHJKQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364620496"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="364620496"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="746975121"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="746975121"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 29 Jun 2023 03:10:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:10:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:10:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 03:10:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 03:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npO4JIrvYFK1LU2qPNJRRSyX8CeLikfqbef8MeOa9nZglkzdldj7UqUYtJNHTt6OHF8alCCPhqvia17NoAYbbvXQw6ctfiv6FR+/w9k5BjexOLPhAJbehwXzhkJ4gx1/9sciDIml6RtumiJSfbFOsdCEXlr35K0Z2O3OBDbIlcauW7hxnDjd+uViT56lc+zVOoKa7cX/oDMBy2SxSgGMQ1yvVp4AKtB5SIiD7wzt7BQb6WvJ/bTto+7oM84zkIxtkrlNUzb61x0vOHEGkCwzqN1ysEpxBS1o09QjzQstCu9XvqbnA+W1HlK5WnQZdjJcO2OqOVaXIC8EC7VKt8XtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kXvZ6s2KGHUKDDqpuiajDZhVRIb0+rOQbkIzIFCPrY=;
 b=bs1mg9TAhVR66QJwPbLBtmW6OsV3ygQoO2VVECxJUN1kjiEUdo2PsTGbS+5b02nabJcXhi6k+mAyOCThxD50QOTH2UyqwYaDbYf+lxP3fsIZJ6t8xYTaZgDQrOKYZ0n5IRfQH35rQ4rrWWrufMh8KbXVon6/3fRgEL798Y/rfqdRVH+hW46ue+SXxzKTj9OzaJGifOXhd2VnzU0bk9wLsq+mMGjZ54zSSf4uJ9XKqyYzbj0VqQbAiuMn+b44Y9YfcOOVHvQ6s1F+ePnXqIvHq83rTiNiCZyDfqhGW3aAGFiP5Wvp0DTfhXG0ibl+GKvkymgy9LF03l3rrTVjN6Yicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 10:09:58 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 10:09:58 +0000
Message-ID: <f8b2bc88-4b71-178b-7e8d-7032e3446ad7@intel.com>
Date: Thu, 29 Jun 2023 12:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 2/3] drm/ttm/tests: Add tests for ttm_device
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <6e0703484cec48f56fb8056b7afefa019ed3d5d3.1687779215.git.karolina.stolarek@intel.com>
 <9d3eecae-eaf9-ce70-c253-1ae14619c9d6@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <9d3eecae-eaf9-ce70-c253-1ae14619c9d6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS7PR11MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d990ca-543e-4039-7fcd-08db7888fe1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hwkokux9ytQkj5xqYKaFOeyPgp6PVaU3M0ZoVBZdgdO/hmsFJvzbT8tJSeS2UzJtRugTTNtznLmpnkaoYSPIQvPrcUv3fG5E3R0MX8AzwXiAU9a6mu34iAmBJQnh2Ri1ybFNToN5ep1FoYiHTgvL9jhpnxGaT5lb9AnLCiMVWTzWguVVrLQQYC5n48sWJf9Jf4l6IRZuFnWEOyLWO7Rr8EfqVUS6m4MrjDCsJZhXh8gRfMstF5DF2tfgGIusIUuyyFV3INDyXB6ZYIdJe/I53l9LjAbsfKJUuTDq77lpWrxWurAh+jdYxm/kSSkWsrGIABfjD9io8YgS5DdXQSe3urECWiNsJymVdA0UQvzDcvyuvlcLIcbcUC76hWPdMVgR6ECkNFampsrDr5mlCkKoeK3uHZia85BKvs6sW8uT7Uk/rqw4/EwAvAEomKpxrmGtdES/A+6joaTBvNESK2Eq9mJTpL/oOzlbqMRb7a6LOsn/vU9ACMF16a/hjUZYhqPhBhdhXN+pyNMs4YG9wJAmx6VQbrIBiKAtlzI/psF8Ro8/vhn7HTE6xYmfkUM5DKvNi/1HnyzWMH3SksDcXjMtLR02RjAXYMUrlxTTa7D3bjXGn+3ZoMQcfSsWPYGtrUMPIiwA8zdvHBgh1ZvxtEMw1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(82960400001)(38100700002)(83380400001)(66574015)(31696002)(36756003)(31686004)(86362001)(54906003)(2616005)(6486002)(36916002)(6666004)(41300700001)(66946007)(316002)(53546011)(66556008)(8936002)(8676002)(26005)(4326008)(6512007)(6506007)(186003)(66476007)(2906002)(44832011)(478600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3VZZTh0QkdZQ1RkeUY2TGZ0RkFaTmlibGtYTEFHcStvVUZuNVZuaWtrN1Fq?=
 =?utf-8?B?K28rSUFYM2xSaFV1MERLUndnYm91bXl1NU02NFJSNm9JcFBPWUFPTWpFK0M2?=
 =?utf-8?B?OW1CTG15eHlQK0EzeWhpUEp2Y2RzZ1VqR3htS2FFTDNzRm15RUJFcUNLd0J0?=
 =?utf-8?B?cDBSaWh1WWozNEtwcmZsNnNpS0t1aWJYYi85TTMzZDhxMkRoemdTdUVvcFps?=
 =?utf-8?B?azBQYlFKTlczdVVJRmZnR0lheXU2V1REdjJJcDhQU014TzlXa281cy81SWZY?=
 =?utf-8?B?eERnTnFmZEllSG1jSFFCV1V0SndHb2JoQlZYNEF6bTlrT3huUHd3Vmw3Tm9u?=
 =?utf-8?B?RWltdGR3QXdLMmFhemZIT1dKTjdHYUtWcHlxR1dBTGtmOW5MUTZ5eCtwTFFG?=
 =?utf-8?B?SjFFMWp0RCs3UnFyb3NKNDRtZlFVWW1CbmlJN0krcUNYWnd0NHNud2x5azhC?=
 =?utf-8?B?RjRSZUJlM3BHUGM4MXpPbDA3NGZqWlBBV0ZzSm9yT3ZWemgvVUNxYks2dkFa?=
 =?utf-8?B?RU4xb1FSMittUFM0WnlyQWFyNzY4dkpQZ2VUV2h4b2h4ejhGMVpGT2gzM1Jr?=
 =?utf-8?B?b2NLTWQyK2tFaGc4SU1jZklGZHFoODU0Y285aERaYStpNWFxOU5ZTjFwQjI1?=
 =?utf-8?B?UnNIM2JITnNoRXdNVFB0ZUtqWllEVDYyZkJDN01Ea2JNVFJYb3RLYW9VRkFv?=
 =?utf-8?B?SDBVeE1vcDJPQVFLY2J3bklORVlSY2NYckJjdzc0RkgyNXc5OG04S0JVWU1R?=
 =?utf-8?B?WENFdnRzZjZ3VitsUjBCTVpJZHp2UXNsU2ZRQWl1RlRYZUwxbHRPSmQxWGVM?=
 =?utf-8?B?SVhYMDdVMmlHc3hidjZrNGh4ZzlDTWpDVm9tYWNTaUVWWDErdWZCaVhtZWhw?=
 =?utf-8?B?Skk5OExCVDRjcEw3QmVjeUt4bmxDSmJGUCtGTDNDdzNMdHJQTWVObXAyTzIw?=
 =?utf-8?B?TjVwbjlwQmY2V2JWRGVmV1gyRHk1bFF6a1htYjM3YjRYRnVRbjFvcnJURFI0?=
 =?utf-8?B?L0I2U0hZdDBTMkxrMFZqMXd6d0N3TG44eVdEaS8xYTQzN1A4RmxDNmtvbUNC?=
 =?utf-8?B?aFNVNjdzaHhBNUxvaVpvQ3Y2MWpDQWIzZE9nTU5CZmlId3JFMGI4MjY2SDFM?=
 =?utf-8?B?bEVzbncrU1IrVFdVVDg3Umg0TkZUUUpkcUk4WHFtS3dwV0xFT2YvRnk1R3lr?=
 =?utf-8?B?czNTWThKYVA1VHg5dnRrMWFCTG5kZy9FWnQ0eDlmK3RUU3BUdDdxUWVZVFY1?=
 =?utf-8?B?UzE1aUl3TzVZSmtDK2VhNG9xQ0NiZDRSSnZyOUJNWEk5dDNmLzlMazc0SWJF?=
 =?utf-8?B?WUkrVnhPTG5ObkNUSFBDNkExN0ZVSDVBc3hlcXpzU0diYVErVi9NL3B4c1Nm?=
 =?utf-8?B?OE9aQndVQm5TQVBoZXNXdUlsY0NCZklNSUM2Y2RDNllIUlF1UWNqRzZLNGt2?=
 =?utf-8?B?ZHkxWlJFR3hKR3VQa1JURlFtRm5sVzZUMXRBR0JoMkZZd3NtNzYrdHR2WGtx?=
 =?utf-8?B?YkxBclRxMmFwcElQa1UzbEV2eDY4RCt1VEtJRlZuUG1QdkZuNXZCMXJ0c3Zn?=
 =?utf-8?B?WkxJK3JuV1JZUmdQaWlhRzdwRVdYbGl3akdPT0FrcmQxS2ZISzdiMUlmY0l5?=
 =?utf-8?B?dm9ubjR1MFVzQjBraEVTUk9ac0xVK0tQY09nNmszRkFYS0Q3eFVPVm5QcjVO?=
 =?utf-8?B?T2dvUHF6dnBwVUxITDN0QmdrNnM5UzROa1Aya1Z3TnJxM291WjdCZFg1RDlk?=
 =?utf-8?B?cFgxa0NBQlc4ZjJtcy9oNy80MytDWUFGdlFXN0htZGdwdGw3dlRhVHVxbHk2?=
 =?utf-8?B?S2xaS0J4QTUrM2I3a1QxRHNwc3poNzhUSE53RnpJY01CUE5MTVlpdjBWMEh4?=
 =?utf-8?B?aG8xeTZHN0IxZXFPdkhtMUQ3b2dVZEJxNlZWVUNTcXpnYUhkTEVrNFNCK2t4?=
 =?utf-8?B?ZWNsd0R2bW4rYURPb2ZGYk1iSDdqYXVraFlrRmw1RSt6ZVRzY0xjbG5tbE42?=
 =?utf-8?B?bEcycEViN1ZkSVJiMXc0QW5wb01PWVVNZEZqWmN0eEg1T2xEZjRnYkF4cWkr?=
 =?utf-8?B?Tms2WTBYSDZPalVrV1ZnU0tYd2o3aTYrZjJUMVV1c0ltdUJOb1NIWUE2bW5i?=
 =?utf-8?B?dkJWRHQwMjN4QWEzQW5oM01ncjhBUlZGZFBqR1IwUEJwb3lLSldYOEJ0SE1O?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d990ca-543e-4039-7fcd-08db7888fe1e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 10:09:58.0649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmPqrK8C1gWasSx+tt4w4Uhn7lnatOVkldCwg7uQdoxMAUOchKxpul1MqaKNnDlfrkEdd5LlzbbS/D2BC00UZspGYVKYbU1eIQ31LOgpp1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.2023 11:14, Christian König wrote:
> 
> 
> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>> Test initialization and cleanup of the ttm_device struct, including
>> some error paths. Verify the creation of page pools if use_dma_alloc
>> param is true.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c | 159 ++++++++++++++++++++
>>   1 file changed, 159 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> index 08d7314b1e35..67f7ec347a61 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>> @@ -8,6 +8,13 @@
>>   #include "ttm_kunit_helpers.h"
>> +struct ttm_device_test_case {
>> +    const char *description;
>> +    bool use_dma_alloc;
>> +    bool use_dma32;
>> +    bool pools_init_expected;
>> +};
>> +
>>   static void ttm_device_init_basic(struct kunit *test)
>>   {
>>       struct ttm_test_devices_priv *priv = test->priv;
>> @@ -37,8 +44,160 @@ static void ttm_device_init_basic(struct kunit *test)
>>       ttm_device_fini(ttm_dev);
>>   }
>> +static void ttm_device_init_multiple(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct ttm_device *ttm_devs;
>> +    unsigned int i, num_dev = 3;
>> +    int err;
>> +
>> +    ttm_devs = kunit_kcalloc(test, num_dev, sizeof(*ttm_devs), 
>> GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
>> +
>> +    for (i = 0; i < num_dev; i++) {
>> +        err = ttm_kunit_helper_alloc_device(test, &ttm_devs[i],
>> +                            false, false);
>> +        KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +        KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
>> +                    priv->drm->anon_inode->i_mapping);
>> +        KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].wq);
>> +        KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].funcs, &ttm_dev_funcs);
>> +        KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].man_drv[TTM_PL_SYSTEM]);
>> +    }
>> +
>> +    KUNIT_ASSERT_EQ(test, list_count_nodes(&ttm_devs[0].device_list), 
>> num_dev);
>> +
>> +    for (i = 0; i < num_dev; i++)
>> +        ttm_device_fini(&ttm_devs[i]);
>> +}
>> +
>> +static void ttm_device_fini_basic(struct kunit *test)
>> +{
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_resource_manager *man;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>> +
>> +    ttm_device_fini(ttm_dev);
>> +
>> +    KUNIT_ASSERT_FALSE(test, man->use_type);
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[0]));
>> +    KUNIT_ASSERT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
>> +}
>> +
>> +static void ttm_device_init_no_vma_man(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct drm_device *drm = priv->drm;
>> +    struct ttm_device *ttm_dev;
>> +    struct drm_vma_offset_manager *vma_man;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    /* Let's pretend there's no VMA manager allocated */
>> +    vma_man = drm->vma_offset_manager;
>> +    drm->vma_offset_manager = NULL;
>> +
>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
>> +    KUNIT_EXPECT_EQ(test, err, -EINVAL);
>> +
>> +    /* Bring the manager back for a graceful cleanup */
>> +    drm->vma_offset_manager = vma_man;
>> +}
>> +
>> +static const struct ttm_device_test_case ttm_device_cases[] = {
>> +    {
>> +        .description = "No DMA allocations, no DMA32 required",
>> +        .use_dma_alloc = false,
>> +        .use_dma32 = false,
>> +        .pools_init_expected = false,
>> +    },
>> +    {
>> +        .description = "DMA allocations, DMA32 required",
>> +        .use_dma_alloc = true,
>> +        .use_dma32 = true,
>> +        .pools_init_expected = true,
>> +    },
>> +    {
>> +        .description = "No DMA allocations, DMA32 required",
>> +        .use_dma_alloc = false,
>> +        .use_dma32 = true,
>> +        .pools_init_expected = false,
>> +    },
>> +    {
>> +        .description = "DMA allocations, no DMA32 required",
>> +        .use_dma_alloc = true,
>> +        .use_dma32 = false,
>> +        .pools_init_expected = true,
>> +    },
>> +};
>> +
>> +static void ttm_device_case_desc(const struct ttm_device_test_case 
>> *t, char *desc)
>> +{
>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(ttm_device, ttm_device_cases, ttm_device_case_desc);
>> +
>> +static void ttm_device_init_pools(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    const struct ttm_device_test_case *params = test->param_value;
>> +    struct ttm_device *ttm_dev;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type pt;
>> +    int err;
>> +
>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>> +
>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev,
>> +                        params->use_dma_alloc,
>> +                        params->use_dma32);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    pool = &ttm_dev->pool;
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +    KUNIT_EXPECT_PTR_EQ(test, pool->dev, priv->dev);
>> +    KUNIT_EXPECT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
>> +    KUNIT_EXPECT_EQ(test, pool->use_dma32, params->use_dma32);
>> +
>> +    if (params->pools_init_expected) {
>> +        for (int i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>> +            for (int j = 0; j <= MAX_ORDER; ++j) {
>> +                pt = pool->caching[i].orders[j];
>> +                KUNIT_EXPECT_PTR_EQ(test, pt.pool, pool);
>> +                KUNIT_EXPECT_EQ(test, pt.caching, i);
>> +                KUNIT_EXPECT_EQ(test, pt.order, j);
>> +
>> +                if (params->use_dma_alloc) {
>> +                    KUNIT_ASSERT_FALSE(test,
>> +                               list_empty(&pt.pages));
>> +                }
> 
> That belongs more into the pools check I think, but not a blocker to 
> have it here.

My reasoning was that the pool initialization happens in a specific path 
of ttm_device_init() and it should be tested. I'd like to keep it here, 
if you don't mind, but I can move it if you wish so.

> I'm not familiar with some of the KUNIT stuff, but the TTM side looks 
> good. Feel free to add Acked-by: Christian König 
> <christian.koenig@amd.com>.

Thanks a lot.

All the best,
Karolina

> 
> Christian.
> 
>> +            }
>> +        }
>> +    }
>> +
>> +    ttm_device_fini(ttm_dev);
>> +}
>> +
>>   static struct kunit_case ttm_device_test_cases[] = {
>>       KUNIT_CASE(ttm_device_init_basic),
>> +    KUNIT_CASE(ttm_device_init_multiple),
>> +    KUNIT_CASE(ttm_device_fini_basic),
>> +    KUNIT_CASE(ttm_device_init_no_vma_man),
>> +    KUNIT_CASE_PARAM(ttm_device_init_pools, ttm_device_gen_params),
>>       {}
>>   };
> 
