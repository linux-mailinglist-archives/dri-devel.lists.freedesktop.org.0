Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21F60832E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 03:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F02410E6A5;
	Sat, 22 Oct 2022 01:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D4B10E6A0;
 Sat, 22 Oct 2022 01:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666402742; x=1697938742;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bktCH4FECIL7rAXUwaUWJIf4JD12rNqJIa/uhv0PQM8=;
 b=GCLi3CLXCWD/N3Ztp3+8eAjqXCTVtTonWmx+z2f9CJwfa0w2/FzhbYSA
 cCkE+OcCnj0fp7zq7PzevjYgCDAn6VeXPLgRzL9h+0TP7n/OO9YnbbbKP
 U3I4fNdrSqVkhfScAYeeZ4LBO1ECktAtZHppv/iuYi4+I2R/UPFpO9wQV
 peVCrho55bsC1N9hz1P4HRLxWAuO0/idUWdFtU+6g21TCZRLD7nyCGCqs
 u4T/T81eg2rGFiQBuuTsTmDAqwnypy0/AT//Cjh82XayUENczfCVWo7FF
 RRrJM3HV6g7vH5wUaAs711sgbXCHD1qjYFhffQjcAlUovFE24xeCEtx8k A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="287543854"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="287543854"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 18:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="735782890"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="735782890"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 21 Oct 2022 18:39:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 18:39:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 18:39:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 18:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SltwmC21D5LVVOrKTQaKXz5IgpjwMSRgU1349X3L7Zm6TST/C36OK4Gl8htKA8wtO8xGgPMrC7MrBbvjTXN+QyIfC4iUeNZHASExRpSRc6IIrAmnGUhW8yz8VdFj4xdf68EfxINonS7Wolspi6OYxpXILbbZmYNq1kQsK3M3cIxyD+APi6WajbvCCHm6eR4l7pvD6zwLGNgzP6EKd6a99b6+TRLgLPWaGNVnbb2LtShveWXjneywotPiFc5FYEcmOO7imhOHvwSpYxOD2PZrOF6Q7SJMnYmXJ72hNtkvAiyQuwb6t5PNLOlXpB6jenowJQTbYlLdKzm22G5c7p4QNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytxwhQcjgHN27Bl9a3tlfrJillEJO/q/KAs93iv8e1U=;
 b=fGC/w9nYDuKhnEm/l8n+6tHoOJ1f3zO6kzFpVwqcprkttBSmblJFufSmx/ZY7b9aXXOXFJ8CYHFqwFa/Q4V6be8Y9H35d2YL+4k719oRzTgx2AGSzrcthNgiSSydl8Aq7aA9WB6bo3NGPw4z8MokuV9ejZCYH22qWJKJDp2h8RVmGxkR8OeVENJXlaoOFnP5GHsgNnl6tFDXzTZ5/9NQuoLDc3pVJc7o28pNKWDy4cmKuwfv7wwJBtuJpBKnZktp+NN6G2EDhZC/WyfKzn5uK2QhLvJJ4qLOuQsR/GajJn0jGQD/Sne44dhs7PYHBZ5xRJ2c+eBcduPE7I4+Ku2k9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sat, 22 Oct
 2022 01:38:59 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5723.033; Sat, 22 Oct 2022
 01:38:59 +0000
Message-ID: <30cc2c72-38f6-7d30-91f0-709b55b472fd@intel.com>
Date: Fri, 21 Oct 2022 18:38:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/slpc: Use platform limits for
 min/max frequency
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221018183031.33704-1-vinay.belgaumkar@intel.com>
 <8735biqf22.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <8735biqf22.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
 To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: a94f6be7-54d5-4d5c-f6c9-08dab3ce30fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rMDSeCftGOB8bopeVnzcxrJtMZT0ZF+bVkEqMITR1QwbFEGO0KpEwGsDhl1eysxVix1VOTYYoSHPHqjd2kG0/DnufripAX4pHTGV4J43GMDV6dUnhPtQQitfNMRUcT1SsK38xAIpr8khwU4zwobdILL+Dqu2XotuLLfS+QMqllIyKPd95TLLatb5e6RbPOmTPYDMfjwqGOVYPEdJNDLbNhkfyOx2b9jXQaJ0QxUDo0GM9tGa7YFYpPnobazauiCq+MbRYHIAvBzA17y1seOz+jPP62K3ro9sAjIWt6VISFGTW3IZTtRsqNyZlZZCB0IOHy7YJ708FHfMY0RcBgVu5oT0oVDpJsN4yBNVndEh3w/L9wioBAj2eHULCrN3LtN+aNmQbOQ7u57FX45jD406RW2VxyylzUsUXmyEQuQeiSt1PGrZAGuBl71aazoINgVSMBDFLgzYnbFsPDN46amLXs7N4sRgQah/5GGHX31ekUrXYkXqVwyn5WMELYdNIo4DVfh/Jl3VVhWoIC+Fknjr39i7YB4UkVxlalVQOCtUcPQyIgOiLhua9t7c6Bo4Vmg2rLPtHVF7cglfAFA4Go0ly6gqOq23yfYFRnXApsX1W0Z0XSvjOSsErlyHwjLkz3dGy0hyfoobQutVAiSoO11WHN1IMC5ihJrAndbYiEu1XwvuAXAKAW/VoZalSZNRd/lAZ7e8OokOjLBFxWIibMxjgmrVE4d10mPixjJsKHLNY2r0plAaHkWBmQg3ZRUYDvIpfEZAAoINP+O5dzyagtJbCnOH4rZI0XsRQhB/l7cremw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(478600001)(6486002)(31686004)(37006003)(6636002)(316002)(450100002)(107886003)(6512007)(66476007)(6506007)(66556008)(4326008)(8676002)(5660300002)(66946007)(36756003)(53546011)(8936002)(41300700001)(26005)(6862004)(2906002)(31696002)(83380400001)(38100700002)(2616005)(186003)(82960400001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZ4Y2FLNk9IR0s5QVp2aEI1dS9UNGJQTkNOK3I1WHJBd3B5WEFscnEzVlM2?=
 =?utf-8?B?bHB4cjFZS2F2dlFrTmp3QVMvVTIyenNLeDFvY0NWbzNBSGthcVU0c1psSlpW?=
 =?utf-8?B?MVJxUkptdFBueFZ5TmxocUtvVXBldGhSbmYyd09MUkxTcEdnTTc1MjJ0YXAv?=
 =?utf-8?B?Wjhyck1yTmhuTjZEMkRsbnNCOWsxZnRNOWc4TkQ1dEh4UG10V2hWL0w0Q3Nj?=
 =?utf-8?B?aE5GU0w2MTFMWTlnZUNENVRHd2FqQ3VXYytFR0o2ZHVrcUNsZlZndEwzUWxu?=
 =?utf-8?B?UktndWFUSEdzdXlQRGNxTkhkU0Q4WU8vVTBJcFcyZ0RHMDNJTTQxUXRYekdE?=
 =?utf-8?B?SVVML3JraThFTlpaVWRlMXdTM1B1b2k4TE1FK1ZVM2VZaEMrUWJvMnZsNHJi?=
 =?utf-8?B?Sldsa0dWZkZLV0hZdVhsVm5VQ1JBVEU5c0xaM1JHM3JtU2hrOE9XaGF5THUx?=
 =?utf-8?B?emNTRWRxejJwZVdFUlFZWWVrSEFkTEdVTlZhM0hSalA0RFhiWXcxWEhUbFZL?=
 =?utf-8?B?QXlaOTVHRlFsbzNsd1B1WUU1dWIyVjcxNU1rUnBlMjdnSFFPQ3pleDExMWlM?=
 =?utf-8?B?YUpjK0hZZHlsV2t3Y3BaVGhnbkdNYitqcU5sZi9BWkVYVXZ0RmdaTzhkdEpH?=
 =?utf-8?B?OWdXc0dhZlhlRVZqZnd1NHpodHdLZUcyRExpMXI1cy9oR2YyVmZLTDkvL09x?=
 =?utf-8?B?cStLejFydTN5Mi83SW5jRnQ4TjhBQzMrM3AzRjZCd3VpMHdyNzBWVGhNOEts?=
 =?utf-8?B?QXdiSjBqcTVub3ViV05veWZBYU56ZjY4RzhON0hwRmw4NXBqaGEyRVJGTE5F?=
 =?utf-8?B?cXJoTmZTMkQwaG1jZ1Q5YkQyWDRyQjlrTEd1R0dZN2NGcE1CQjR5N1VqS3Ja?=
 =?utf-8?B?NGhLOEFGRmpiV2NSdnhuQTVaZVJML2dUeVo1U3lnb1hUendkbm4vZXFwdzFR?=
 =?utf-8?B?L1FEUGN5UFZSbVVtZ3ZCNlp2SG50TkxPTUI4M1c1eFI1U3FGUlNaWlZkZGUv?=
 =?utf-8?B?UDNhNm9XeWd2VGpGN29hck56d0V4a3BjMHhod2laMlIvZTd0eHNGTWFhdG50?=
 =?utf-8?B?S1JVV0w5L0FtOWpPNXI1NXlCcGpUZGFUYlIyczF4YzBpZ0ZIUDR5V01mZ3Vy?=
 =?utf-8?B?R0Y4OWNBU3U4QURwa25HN2loS3MrUmV0d2swUFdlSHpXVW44cG9FczZ6MC9C?=
 =?utf-8?B?NnNvTjJTcHNNUXcraXdMV09JWklrWUIyMlViUDNmc2tPbVV3MitkeTdtaFh2?=
 =?utf-8?B?blE3K1g2SGJpdFFEdk1VaVRIKzYrYjZOTTBJa2hXT3BUQVEwUXQ2bmJwWGcw?=
 =?utf-8?B?TjBYUk1iTzF4cUV5aXo5Y1IxS0dpU2tGZyswWFJ5R2NzQ2FoTEtHb2hrTTRC?=
 =?utf-8?B?QUE1OEdPOTQyd3RHQ2hJM1pETlV5c2RXYkFqMHJ4TFBYaytZK3RsUHNrQUIv?=
 =?utf-8?B?SmRvc0cydzZlL2pCeEk1cTMwcndkOGJyZENqTGFaUmdjVm4wUEdzd2tWZG05?=
 =?utf-8?B?SmNROTRodGhJMkRPWjhERlptd1NUKzR2L2RvVWNUSGtlU1NGTTBQWHd4dlVR?=
 =?utf-8?B?dzNMRU1FYkJRMUFXSDBhLzdhcUZyR3pqRWFMSklwTzRBTlF0RXZvaUp0TDdN?=
 =?utf-8?B?VUcrOWJrbE9CcW9BWEFTR0hVMVQ1bEpsYnhwZXNOQUdhbUk4WisxZ1hJNFJX?=
 =?utf-8?B?TzdLWkhGWmhaRjFqU1N3ZmZiQjdqbUNKZWxFUTRKY090OTNFSC8zQTAyam1i?=
 =?utf-8?B?c0tBbFQ5VFk3eWpSdmdpU3VSdS9WNEFWNm1DMy80bWlWemFwc3dkSk5WeUFp?=
 =?utf-8?B?WVVXYVlNOTNqQUlsZXlCNERnbVhCYk1wcnQ5S1ZFcmlhbGZIY1laRG80MW90?=
 =?utf-8?B?QWpla0Zhbmh1ZWVsOTNIT25EWW1VTUQxK3BOTWZ3bDNHWDdZVE9FREJHVjQy?=
 =?utf-8?B?dS9wU291L1hEMXpYVWlWNzNEb2tlS2JUQWswU3RwQ3ZzOGJiQ1FKRnR0eDMv?=
 =?utf-8?B?c01mNzVVZmdKcE9GSjdjVnpRYnlTWWNXNnV2ZHRVaDl6SG1lK0xkTEZxa1p1?=
 =?utf-8?B?VmNsV2s4N0x5SGxweWlRUlF2K0s0UzR4cDhiamRZUjQ3aFRUbk5MZ3VISkdh?=
 =?utf-8?B?ZUpvMUZuZEFYVFpsaDJtSmlpUXQ0R3ZmN09rckhIdnNFNVhwK3NoK0o1cm5G?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a94f6be7-54d5-4d5c-f6c9-08dab3ce30fb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 01:38:59.4519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGxwN5u0fSemJU0JjVAl0njQiDkTDLliklnu0EAATWUIrZXWmoIc/gJHeJDnNkewU64wE7iLR897RwUSoPxFrRtStT2OQr1/+rkDd3Y8QFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/20/2022 3:57 PM, Dixit, Ashutosh wrote:
> On Tue, 18 Oct 2022 11:30:31 -0700, Vinay Belgaumkar wrote:
> Hi Vinay,
>
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> index 4c6e9257e593..e42bc215e54d 100644
>> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -234,6 +234,7 @@ static int run_test(struct intel_gt *gt, int test_type)
>> 	enum intel_engine_id id;
>> 	struct igt_spinner spin;
>> 	u32 slpc_min_freq, slpc_max_freq;
>> +	u32 saved_min_freq;
>> 	int err = 0;
>>
>> 	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> @@ -252,20 +253,35 @@ static int run_test(struct intel_gt *gt, int test_type)
>> 		return -EIO;
>> 	}
>>
>> -	/*
>> -	 * FIXME: With efficient frequency enabled, GuC can request
>> -	 * frequencies higher than the SLPC max. While this is fixed
>> -	 * in GuC, we level set these tests with RPn as min.
>> -	 */
>> -	err = slpc_set_min_freq(slpc, slpc->min_freq);
>> -	if (err)
>> -		return err;
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		/* Server parts will have min/max clamped to RP0 */
>> +		if (slpc->min_is_rpmax) {
>> +			err = slpc_set_min_freq(slpc, slpc->min_freq);
>> +			if (err) {
>> +				pr_err("Unable to update min freq on server part");
>> +				return err;
>> +			}
>>
>> -	if (slpc->min_freq == slpc->rp0_freq) {
>> -		pr_err("Min/Max are fused to the same value\n");
>> -		return -EINVAL;
>> +		} else {
>> +			pr_err("Min/Max are fused to the same value\n");
>> +			return -EINVAL;
> Sorry but I am not following this else case here. Why are we saying min/max
> are fused to the same value? In this case we can't do
> "slpc_set_min_freq(slpc, slpc->min_freq)" ? That is, we can't change SLPC
> min freq?
This would be an error case due to a faulty part. We may come across a 
part where min/max is fused to the same value.
>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index fdd895f73f9f..b7cdeec44bd3 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -263,6 +263,7 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>>
>> 	slpc->max_freq_softlimit = 0;
>> 	slpc->min_freq_softlimit = 0;
>> +	slpc->min_is_rpmax = false;
>>
>> 	slpc->boost_freq = 0;
>> 	atomic_set(&slpc->num_waiters, 0);
>> @@ -588,6 +589,32 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>> 	return 0;
>>   }
>>
>> +static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
>> +{
>> +	int slpc_min_freq;
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq))
>> +		return false;
> I am wondering what happens if the above fails on server? Should we return
> true or false on server and what are the consequences of returning false on
> server?
>
> Any case I think we should at least put a drm_err or something here just in
> case this ever fails so we'll know something weird happened.

Makes sense.

Thanks,

Vinay.

>
>> +
>> +	if (slpc_min_freq == SLPC_MAX_FREQ_MHZ)
>> +		return true;
>> +	else
>> +		return false;
>> +}
>> +
>> +static void update_server_min_softlimit(struct intel_guc_slpc *slpc)
>> +{
>> +	/* For server parts, SLPC min will be at RPMax.
>> +	 * Use min softlimit to clamp it to RP0 instead.
>> +	 */
>> +	if (is_slpc_min_freq_rpmax(slpc) &&
>> +	    !slpc->min_freq_softlimit) {
>> +		slpc->min_is_rpmax = true;
>> +		slpc->min_freq_softlimit = slpc->rp0_freq;
>> +		(slpc_to_gt(slpc))->defaults.min_freq = slpc->min_freq_softlimit;
>> +	}
>> +}
>> +
>>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>   {
>> 	/* Force SLPC to used platform rp0 */
>> @@ -647,6 +674,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>
>> 	slpc_get_rp_values(slpc);
>>
>> +	/* Handle the case where min=max=RPmax */
>> +	update_server_min_softlimit(slpc);
>> +
>> 	/* Set SLPC max limit to RP0 */
>> 	ret = slpc_use_fused_rp0(slpc);
>> 	if (unlikely(ret)) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index 82a98f78f96c..11975a31c9d0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -9,6 +9,8 @@
>>   #include "intel_guc_submission.h"
>>   #include "intel_guc_slpc_types.h"
>>
>> +#define SLPC_MAX_FREQ_MHZ 4250
> This seems to be really a value (255 converted to freq) so seems ok to
> intepret in MHz.
>
> Thanks.
> --
> Ashutosh
