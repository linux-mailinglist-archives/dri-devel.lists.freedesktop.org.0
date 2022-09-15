Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFC5BA1B2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FE310E21A;
	Thu, 15 Sep 2022 20:03:56 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D496710E21A;
 Thu, 15 Sep 2022 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663272231; x=1694808231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BfslVQmM/ukXYuJEsvXyZvcQifrUHAb28Sy4BrT3xHM=;
 b=EmBzcYGTsU/4jzAmB5lVtdW4/4zzbNswJoOjlzEkPmowli9ZpMOP6oYe
 +Y05CAY4FrbGOHIZHWooj2LgKTH8NE2pTCFs+ODdfZEMDuvcCcvzhTDOZ
 uWHTtcBArPUkGU8DQbuPAje2XL7X/MttEJ4CfQ2FL4AMni7+jhE6lWM2P
 PUvIvrig+943nWZl2ntXFmszs2WQb39yqAaKnyFMmM0/A0bYfN4H3x6QY
 X1w564e1HY0w03UpDdmSxG0th2aWeDuUNdUAG4kLj8fJc6Z9Gwf1Ol/lM
 5vGllUGvaV1eGSMHoWRGuVMB0ghpJ64QUi3FZ/umYuLnLmIlQ265iUR3z A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299650208"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299650208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="650616620"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 15 Sep 2022 13:03:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 13:03:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 15 Sep 2022 13:03:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 15 Sep 2022 13:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKd2PeLly2ysWkhH+9UaWLRvZv+5ZFIg/giOqEHCXdj7+mzgP8h0avHqTtkahIxh4HfYmISaR6nVNx2GvAlhv0b4Cbs6/qDR8LeZ6LpN5vVLOsxexvQEy61bX32lUcWnxpv5oo+wO0t1oZY0Z0j5jScE8JjTZT1kKWeqauq6RlOwW+lHxqJt5avIzXkSc1/7SujkZSz/mKSJnybGibVhiOUBja0l97Lk/0TSJjBCA4ApEnPLoHdiNIqe3RSmDULEjWFKl+zVP/yLgaq2gAd/NJmZNWF2jxJQ7YezhcIe0kLx6HfLV2aTZmXMbh5e419MzayprOY2z7o6JiwE4rK2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=641f0p+l27sMizAGnwpCDKaypMXm04moYvzhQhFxyVc=;
 b=WBNcqVEyhNho5aYo4oTPUkRu8y5uqyu8vzNqShDPBBl4aXLFQhKBeq43xSL4WnRVZk5F0OC+HP8kfNBFgBXwv6O6IBYXVgFhQjnvagsSot/kT/pK1Hov/0NrubCR97RQaJ6dqNBJG9IEHbbXVv/hVKIqpgbymzhqO5UaQkK2/13DAn8XTQzxeCcRoQ76oeMqWNS95YpURuIxPtJN2YvMifM1zZPNXbERZfKxccWZ1Tywlfy9Pm2RJHrq4hwsgqP5SDDQ5IKkfwZzCxKfb1vbXqznNX1NUPBcabRci8AZWwjObfZQobLfXsKAjzLfP/WiWix73aM0Jjtcg/P9LXmprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 20:03:48 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 20:03:48 +0000
Message-ID: <722b1da6-459b-dd35-8a3c-3056a75ee8a1@intel.com>
Date: Thu, 15 Sep 2022 13:03:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Update to latest GuC and use
 new-format GuC/HuC names
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220914234605.622342-1-John.C.Harrison@Intel.com>
 <20220914234605.622342-2-John.C.Harrison@Intel.com>
 <2bf26f8f-7f5f-4cfb-5117-a9119bf708fe@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2bf26f8f-7f5f-4cfb-5117-a9119bf708fe@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9b934c-c4e5-4d7e-e567-08da9755672d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oyo5up6SI/EbS/v6YIAsNZF5QdaYZSyA9H0kiGDE3t81sGotA4SZ7VBJcKSk3ZdxNFon5/qz2H16I2zVeLOkX3f3kNLqEcfKcmSNz4XVSZnK/yyEfsTtoIkNAVZzfQisMd6WHZoqfkVj8KRmI/LsOxmGEQBI7gkcTwAskZf3tCUg8JPAN0JX5tX6yxjRxwSz07RqCVOSS34mlaI/5gLYx6vuYhueASOM7WkSD6h76lC3z4V67vjGku5ym0cjmeTFTWBO6EPEP3FjZsIF1tW0FGhxEspx47kTVKD2d+FauTtmL7kX41OSNkNe593LfY5h7ucu3fTsC5EJ6Y4dKjW4pLt5sKGiyX/2Uo9bDzkyez3sudhykPx6EzqdSYH56I84SZqr5M/Z4OQC+BRBz5Dk4k33H+QDja0TGJIAyv6HJBAH+f7aL+VY2BpgbsA7+shoyc1xSTcjrx6tFMo2gACG0jTXtGr91/crNvh6Y5z7iFwJwgxrxXYbNlG1Y74UU8PmLi4C1m3brbj9Dm8qNLd50Bx+f/A1WlVESlTv2RqMNdRgDfuNTQPtrJhrJokkWw++83or6knb8gK8zynPP8EBE10KO70TXrCBSNgR7oAcFFgrPd0BUGZS2FerUBElcNF8bmBPWBsVODHfntILdJ+nvnEEdGzNEd52JNvvNBu8cpyXs/OHZXVTdmM3YTUlpze26NeGDaymmb9KOVawkwzYKdMWatGpg61yMc0vyEboGUtR40i1SWZ4+9eAYaFWd+zCFrZdolfd2X6Ee7P80f5exRd69hsmY87rhTJZxVyH4E4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(36756003)(86362001)(186003)(2616005)(83380400001)(38100700002)(31696002)(82960400001)(8936002)(8676002)(4326008)(66946007)(15650500001)(2906002)(66556008)(66476007)(41300700001)(6512007)(478600001)(26005)(6506007)(53546011)(316002)(5660300002)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVNzd1RTYTFUZERTZWMwWXNwdDV4V0Jva3d1VWIycFJqODg0RnZDdzhWU3Jq?=
 =?utf-8?B?MlZySlp2bzNvcjQ3NUtOR1RlQllhQ0hnL01DbUs1REVoV1pxc1JUWHpSRnAy?=
 =?utf-8?B?bUYwMTdSbFgwN25BRG5Sem9oaXdpeE5SUE9naDFMWFRibWE2RnVJZzI5ZFJD?=
 =?utf-8?B?VDJ3YSs2MzlSR0NiOGo0R0pnc1QyZXFPeEI2SDlRQUkzWGo2Rm05a3VSWE9x?=
 =?utf-8?B?UGpvWmFkTGZOeEp0Qk1wWjJEL1RDVnYrZ3BheWVqdFYzUC82cWczU1FWYWY1?=
 =?utf-8?B?NlJJc3kwZ09rSXVMK01ZOGJUbmRaUFpOVWRpVUtwaDJXdU5nVGdocGFibyt6?=
 =?utf-8?B?UFFSTEJzOXozMXQzc0VxZGdwVCsyUWZpbEd5bUJmTGdnU0g1M2NaQ2lvN3Yx?=
 =?utf-8?B?R2JhK2dzV0RodTczUStDV1RTSFdLS2Q3MGZjN1IreitkUWhJVUhBeXNueGR6?=
 =?utf-8?B?ZHBYcFBUYXBXVS9QdUx5VEtsa0hDQ3hGVXFqbUJrRGRWcGdrdEd0R0VQTFZI?=
 =?utf-8?B?TUxWUlZNN1JPSEJPOURsejBCODlWTFF0T0tWbnRlRXdTekg3V2hsWERUMGpJ?=
 =?utf-8?B?bGZGMWJlU2JSKzZ6MWorckd0RVhnRWg0a0t2SUdncFIyTCtzUTlwSG1kUDAv?=
 =?utf-8?B?MHRlQ3FSMmNBaXdCZmR4Sjd4TXhodEdzaTdHVXdPQnJ0YTAzc2svYk9xVUtS?=
 =?utf-8?B?SGJqL2NpYkxtK1pocHFhdnVEUHBFWU84cWl2RXdzVUhzRlI5cURFMEJyTWRY?=
 =?utf-8?B?cy9EOTNUNXZGbmJjd3hnZ2ZMYlVCN2YvVlUwWlFOWk1XbjNvcVBQMXczUnVt?=
 =?utf-8?B?eDREd2ZNUzZ1VmRTN2FGdEhWWjA1a1lLVS9CMEdIcU04K1VYUks0Y0NlcnA0?=
 =?utf-8?B?V0FQR2JBWk9STzlMUjg0Q1doREcrdExEdnRjR01sRVlqb1BYVUxWU2czdi9E?=
 =?utf-8?B?a0Jya3RnNmt4RFQwcVpHWmZKc2laalcyS042dzJxc2VDUXM1eU5lSDhGWUgz?=
 =?utf-8?B?cGM2NExuVytMWTQ0TUV2c1JsZFVJRmY0Z09JREprVHZxcWNLMFBRTi90ZnRV?=
 =?utf-8?B?MFcwZHR6N0FUekNDOG1mR0M3NWswcHRoUXAwTVlzSkl4OFBTejFVSVZkWkNR?=
 =?utf-8?B?U0J6L3k1VHN1V1lwTGdJbm02TkNDZWl5dlB6SVg0NVd5MFZFWDBEbVkwcXZN?=
 =?utf-8?B?anFJb0Y2QTRob0FWZ2VRRDE0S01sRVUrSHpxU09Yc0tGY2NTWE9NVUdNYmhn?=
 =?utf-8?B?T21XUVFjZ2FEbGpXWVpoMVJzbVhIdXB5eXllVy9oZm9NZEQ4NDcwSEtTWGtG?=
 =?utf-8?B?Z2NnOVN2RWxXenUrNmIxdmpqQkhETGNtdkJlbUl3R2VvL3pWbEQva1pGK0RB?=
 =?utf-8?B?VHR3dHIwbzR3QVV1THlGbkw0UHU1N1BJUnVKektpbjZQc0xIV045NndZZjdJ?=
 =?utf-8?B?eG41RExuaWs1a1l1YnRlOGRFcUgwMkVMY2VDWWlsTVF3czNreDlQYURPaW5T?=
 =?utf-8?B?TTB1Rm1BWG1NQTIzekM2NjJUVURrT3BvUkNvcmtWL3RRQWFZc2VoUEV2RVBF?=
 =?utf-8?B?ZUtUTHFpdmJpL3EzdzRsb0RQaTllK3ZCVHNsbUJGWXBXQ2ZUekhtVlNWZVdI?=
 =?utf-8?B?dUV6M1lNOEtEYW9qRS8zS3dFaHJmTHIwTEJ6R3hOUGJCWm14dExhNlFiQ3hB?=
 =?utf-8?B?dDJ4ci9saG1HaU1jNFhoU1Z6WFIyY1F6TzZ6ak1pamdpQUY3YmxmK0JrN0lI?=
 =?utf-8?B?YW5abldBcWJpZFVZWmd5b3pQMUVZb1lzYTRsY2NWZzkrNFo2c0dRKzlWcEF3?=
 =?utf-8?B?cTFiZE5yaXNLK242YTRlRVZ3b0pHM2xtMWRuSHhURzd1M1hKTjBkQzVld2dr?=
 =?utf-8?B?REx1VEcrbGtodllwSkE4L2g4RmpCcDNyeXB0bitoNHpIYmI2dnRXbE5JbitT?=
 =?utf-8?B?R0FGSFM5VnpFRExNM3UxNG1FeEwyelRNQVY2RkdmRlQwU09kczF5ZC9NaHhl?=
 =?utf-8?B?cndvc2xVenUrWXRhbVFEUHhGS2pDbG92Y0pjZ2R2cWZnWi9ITFBma1IrS1h4?=
 =?utf-8?B?dVg2VHFBUDNQUnRFNmxONnIwekt3YUdTc3ZaaEoyMUlzb1YrNGg1ekh5dkt0?=
 =?utf-8?B?Wll2cWdJUnUzWVZja1ZMVUdoZkxTYkJxNkQ1YktGaGo4Q1ZncFVNT051bHJ0?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9b934c-c4e5-4d7e-e567-08da9755672d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 20:03:48.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQzzrKxBsxvz1mNLgvhrRRU22/3taEYs/IDc/BNw9rCVSg5AykpO6KPyGfCRQEtuB3Z9fkul2SM4nWEkoO2PzXNxB69rttlS8XFHN5ulz+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/15/2022 01:59, Tvrtko Ursulin wrote:
>
> Hi,
>
> On 15/09/2022 00:46, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Going forwards, the intention is for GuC firmware files to be named
>> for their major version only and HuC firmware files to have no version
>> number in the name at all. This patch adds those entries for all
>> platforms that are officially GuC/HuC enabled.
>>
>> Also, update the expected GuC version numbers to the latest firmware
>> release for those platforms.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 1169e2a09da24..b91ad4aede1f7 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -72,12 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>    * security fixes, etc. to be enabled.
>>    */
>>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>> -    fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
>> +    fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
>
> Just glancing over out of curiosity. Part which confused me is that if 
> only major is supposed to be used then what is the '5' in guc_maj(dg2, 
> 70, 5) ?
See the earlier patch that added support for version reduced filenames. 
The minor number is still specified because want to be able to warn the 
user if their firmware is out of date and causing them to miss features, 
security fixes, etc. The driver will still load any old firmware with 
the right name and work with it, but user's need to know that there are 
updates available.

>
> I also couldn't find guc_maj with grep so I guess it's some sort of a 
> magic concatenation macro or what?
'guc_maj' is a macro parameter as per the definition of the macro three 
lines above. According to where INTEL_GUC_FIRMWARE_DEFS is used, it 
becomes either a mechanism for creating just a 'MODULE_FIRMWARE' 
definition for the firmware file or a table entry giving all the version 
information as well as the filename.

John.


>
> Regards,
>
> Tvrtko
>
>> +    fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
>>       fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>>       fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
>> +    fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
>>       fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
>> -    fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
>> +    fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
>>       fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>>       fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
>> @@ -92,9 +94,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw 
>> *uc_fw,
>>       fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>>     #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
>> +    fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
>>       fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
>> +    fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
>>       fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
>> -    fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
>> +    fw_def(DG1,          0, huc_raw(dg1)) \
>>       fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>>       fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
>>       fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \

