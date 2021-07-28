Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028453D84EF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41676EB78;
	Wed, 28 Jul 2021 01:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA056EB75;
 Wed, 28 Jul 2021 01:01:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="234433855"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="234433855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 18:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="464483371"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 27 Jul 2021 18:01:25 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 18:01:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 18:01:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 18:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFibiGgmIMvZ6o1Tt6yf7cT/jtn8Y1cfROru2frR8dFGh7qGUPeGFMcFPeIgWOMYNA3TVM+OdtWEQs2Tv5vpYDkdxiywb4NVqo3WwqfSElEI1KPO/DqtcTUtFvNR6uaDFW8uwmRCqi3Y+2j0UzvTosfjQiz324p4VdgyP4tKFOcaZ1nhhirHV9Vlgj/rMgjLp06PZVnxzR+onjh+gpCfJMw/ZyBoWiCwS7AlYoG/Iv5Q/jb+ntdyEP27///CzlJdeoN+zwQhcvUX0x6x8pWVSKCkcxuQ7EMeOiG1OkSY6bS0X7RNWkwgWpXLbsjoByu8kxGxgvvJcrVDXmriSelOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/pRLGkYT+eyWUj79SJhexDKgCY3Kvmzl2MjgzbdQcA=;
 b=gMjJUIyVFXSPGsknJGTC9YzH3RREj+jTSr+gmKHD8Gw2F2RTahSwAgXOc6F5e7b8ahq5Qzxmc+13zpuR8ZNoRKTGgXTIWssDKvMVC7A8cVxhwSchR5fIk9XzbX9Z74VFOEukPh5eu37KX3SoGdWjOZaq3IOzX4I+HZFqyhc6G61L/lB+SKh75Ozk5nEgEG0aQ6y2pEmn5G09HqXMfrbujvB/62Mw/cmvXzFm78crKRlsQTJC1azLD9CWGeDAHlCc1Z8UHaqvWLEH9gdCUMT4vNCOylQHF8MDyTo2BAT1ch1ifhFTD1hZbWS5lBSZIaBOuq+3P/xOih+fJLm60a4b/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/pRLGkYT+eyWUj79SJhexDKgCY3Kvmzl2MjgzbdQcA=;
 b=K4eu0Zgt7fBzkKo1X2XwlQTm91Wce0zMn2WjeYNRiUQxw+BDUVDuSNgHrgYIoq5bT6keGn6WaxmW301r/KFeuxnnlMvUSQs7GclYUNf6hyX7jgjKiutHJr2pQCOf7yU7EcBbhcfEXXKNQFqInQdZYIqrKUa0tx62O2zCXnAhgdQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 01:01:23 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 01:01:23 +0000
Subject: Re: [PATCH 07/15] drm/i915/guc/slpc: Remove BUG_ON in
 guc_submission_disable
To: Matthew Brost <matthew.brost@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-8-vinay.belgaumkar@intel.com>
 <20210728002037.GA50251@DUT151-ICLU.fm.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <5c3a11b6-ca8c-cea0-7a94-e70e01ee9d2c@intel.com>
Date: Tue, 27 Jul 2021 18:01:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210728002037.GA50251@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:301:2::16) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR12CA0030.namprd12.prod.outlook.com (2603:10b6:301:2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Wed, 28 Jul 2021 01:01:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7389413-1995-49df-82a7-08d9516337d4
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5651875A9F6C761E3DF78B4285EA9@CO6PR11MB5651.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPSYex9DXjVnczZCAUYSZEmixMNy3RQTTdzJBHL7Mnpa02od16A87QuqnUtJLp1d6Pbsy86ZOIphHyDudDRdAozgz6vKgpGQmuUDef2m5tD+g+w6lGdI7UPaiFRf7zOGDOtFi7IptxAwz8/xll3xspoQ9iCOZavbaEmn54jdCg7EQCfLhNQEbnDo+d8BBCu0L1Dy1hCjO+pZAab9qU1PMNdwxsnFV+o1LwUzKsrDbvMxR31D/pT9l86rmVT/FfMQocu7NL4/R37579eX9P040Mzezq4NJyPRZSFmVePrwJ98sMNRUK8sfLADb7UvZfft4+I++tHjgWFNRxOLw/NegBmrSMuwH6/aRWcyuDnYytvuTaok81ONoAH2USeN0x8Vj0Edr4Iq6dlsFfUKqbalgaxJ7wa+GIiSnMQ9S5YqqEBE48cPvKazq9lkwL10lVdJzpDsYeyfSNoOb2qcNdtPxuGZShULip6vMIevu0wGo4fZvbTXORzgLgNhMT7xJ531OxCWYYSf3ZYBRsG8a7yzmCorhVf9+7eSvCefbt3DumcEfEQ979A78qGm2Qgd2zKuyxkBQa1EMOQzDBbcEVAYhiP0KXpxpQb3Hrz/ow3RRCOxp+Ou014dUxzzRRWWKDgewQeHjOcu4h+vmYqOZIt+oXm22QhvrSiy4hLuDpEqwSZ3ywaq0fmHXO3uhpvJvYV0k+omOQ9EfKozyth2u7GsAV5cWQclc2TPVAvhxZrPWNcLJKeJK+jqXT0eXKPuQDdg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(450100002)(31686004)(8676002)(6486002)(83380400001)(6862004)(37006003)(6666004)(2906002)(16576012)(316002)(36756003)(5660300002)(66556008)(66946007)(86362001)(956004)(6636002)(31696002)(4326008)(53546011)(66476007)(2616005)(478600001)(8936002)(38100700002)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmhpWDZZYVY4MW4wNG1RVmR2RkFTWFpBOW5VN0RZOGVhZzYwVEJ5UzRzSnhT?=
 =?utf-8?B?Q2ROMUk5QzZiNTRCeER0OWtoZkpobnkxZzJhR1hTU2NMN0JqdTJMKzNaK0Js?=
 =?utf-8?B?YUhZcDFGVjdMVXhWd1Iyc3dZY3V3ZE9YVEtWNnpYRVBjVFZuWGtLNG9mcjM4?=
 =?utf-8?B?eVNrN2Q3bUdVdU56YklwQ05PZSsxMkF3NFloMmZ4cnBYQ0hEMHZXL1NzbUxI?=
 =?utf-8?B?NERPZ0UwajQ1ck02K2kyb0JadzdEL01EWUpic1NGZjBnQkpyWmpraHR1Zmk1?=
 =?utf-8?B?MlF5UlJVZmw5V1lkQ0tyR0dNWFVRNDFFamowWjV0cHhPSW9aWEtzdk8ybWtr?=
 =?utf-8?B?YWxoYTJrTzlQeUppUzJ3WGdyZjZFaERCUXMwUFk4ejdUNGJ2RFhjLy9zZ0hH?=
 =?utf-8?B?ZnhsdDB5N0FCVERiTFpwalgvT0xDaCtFeUxrQjEzbVRkN0ZmMWFHeUJnNnlS?=
 =?utf-8?B?NkZSc3R1V3N4dmd0WTFVendzRUhOTW5vMTYySlhVeUg1c0ZvMEpSRHZtaE4r?=
 =?utf-8?B?Q1NsLzB2UWhUWDYwWE5LUFVoY2grWUp5ejVYRXIzcTE0R0hJWndCWFJ2Qmh4?=
 =?utf-8?B?emdXRHpQL241WXBMTXhzUVplbUlBbjUyeE1qOEFxNzY1ZEwzNHVNaGt0bnpR?=
 =?utf-8?B?emhrMkVnNktaVHl3N2hqNWh4TnVGQnhqRXA5bTdGaHVkNHVUMEl5RjlBR1Bp?=
 =?utf-8?B?SGNNT2dSaXpvcVpaaTBrcnFDTzZMcXFKMkY0RW1XcjhhWVlpK3BxWkV4M0dL?=
 =?utf-8?B?OTNiaVRYNm10cTJpRkF6OENyUTNtYklpWXg2czdnZjl6SzVWcnBrcDU4RzFT?=
 =?utf-8?B?ekpoNy96TEFkODc3WjZFR2w4MGd5b2p6cUhxU3VMMExIbVJPT1RUSGU3Y3N6?=
 =?utf-8?B?d2pSRmc1Y244dFlKZzJ2M3AxMWxmRmpOU05IVlV2NHIxN0ZwVFlZZFZLWTVq?=
 =?utf-8?B?cUlZSFN3dzBzbkVaUjNJRFZrVERXZzlnL1hjdkRVcFBiOHFDTXBQUVJWeEUr?=
 =?utf-8?B?WDBqNFJpWWhxdndOVW5Ea2hVUFdhTHhIY0V1TmdNdnZEY1YwbXZRN0NRV1By?=
 =?utf-8?B?YWZ3YkN3b3BveU91NHhDTkJ2YTc5S3hoWEhYODFZNkFBaGw2U09oNmc4V0RM?=
 =?utf-8?B?Yjd3RktZZUxKNWVwU213QXpsOTE5UXNBY1FTYnBuQ3pOMi9rSHZuZUc5d3Rq?=
 =?utf-8?B?YnZaTXBSaXZTbHdRL3YwZmxNRVpPdE1mWjJQYldtYk5EcGVORnpsQW1TZDNW?=
 =?utf-8?B?b0JTa2RUY01zNE1Vb1ZRODJRTmF5dVNVU0FqcHZ3Y1dUZ1dxemNNMjdYRmhy?=
 =?utf-8?B?ay91S2NocGRTZVU2aTJnQjBHMXptZ2FVeHRzV1YvSmdDYmtFMEx6SDFhdlBH?=
 =?utf-8?B?bnk0K2FiNno1cjBPL1hqY0l5d094TTgrOFluNHd2cEVMWmZhRXIwSEYzUnRn?=
 =?utf-8?B?K2RLTWd5aUNMTkRkY2p5azBSOS9teCttUDFOY1JNd0REUUxCUXoybWthVVRY?=
 =?utf-8?B?Tzh2aUVNZmQ3SG5mZG5yS3NPZm9Lb3Evd3RNUGoraitZdlROejFZdHI0Sk1I?=
 =?utf-8?B?ZHdDcDNoZXVGVThKN0FTRWdJMjRDMDNEZXduRVRxWGY5Zi9UckJ6Wm55MjRN?=
 =?utf-8?B?dUFxc1RuOWlvUy9xY3lXbWpySGhORHlSVk9meS90bU1XMTBtMmduRFdDQlRT?=
 =?utf-8?B?YitVbnl4ZUlUc2hLRzFOTG43SVkvOXowYkdoSjBFY2I1ckJBbmN0bzJ2L0I5?=
 =?utf-8?Q?9VgyHOzltirk75JCI0d5dW0QfYkkgyXmjnGNWjn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7389413-1995-49df-82a7-08d9516337d4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 01:01:23.0997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pedou6UeT7tXStWcHZkwLdSypRCkALljNbS+iMYY/LakZxcJVGYbE6wbQN3muhzxZvuMEXxW9kecLFJ14p/Wslpoy/bSVJnK+W7DK/nDneE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 5:20 PM, Matthew Brost wrote:
> On Mon, Jul 26, 2021 at 12:07:52PM -0700, Vinay Belgaumkar wrote:
>> The assumption when it was added was there would be no wakerefs
>> held. However, if we fail to enable SLPC, we will still be
>> holding a wakeref.
>>
> 
> So this is if intel_guc_slpc_enable() fails, right? Not seeing where the
> wakeref is taken. It also seems wrong not to drop the wakeref before
> calling intel_guc_submission_disable, hence the GEM_BUG_ON in this
> function.
> 
> Can you explain this bit more?

I should change the desc a little. The BUG_ON assumed GT would not be 
awake i.e at shutdown, and there would be 0 GT_PM references. However, 
this slpc_enable is in gt_resume path (gt_init_hw calls uc_init_hw). 
Here, gt_pm_get reference is held, so it will result in BUG_ON when 
submission_disable is called.

Thanks,
Vinay.
> 
> Matt
> 
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b6338742a594..48cbd800ca54 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2523,10 +2523,6 @@ void intel_guc_submission_enable(struct intel_guc *guc)
>>   
>>   void intel_guc_submission_disable(struct intel_guc *guc)
>>   {
>> -	struct intel_gt *gt = guc_to_gt(guc);
>> -
>> -	GEM_BUG_ON(gt->awake); /* GT should be parked first */
>> -
>>   	/* Note: By the time we're here, GuC may have already been reset */
>>   }
>>   
>> -- 
>> 2.25.0
>>
