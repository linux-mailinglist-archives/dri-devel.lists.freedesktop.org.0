Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED257E76E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 21:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAE28D334;
	Fri, 22 Jul 2022 19:32:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD218BD6B;
 Fri, 22 Jul 2022 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658518336; x=1690054336;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RuyBiW1r8OwLCqfl95U3mViAbjHwBFmKRG09SwmxOwA=;
 b=DwCGD3XWDaJUBkPvWSLkjNvO0aWln876MyBegJO5B3J80G+og+4Im7Sn
 LdHcJMePj2ROuo0VsgCd3hN9MIdz3vfLEztLaOryevxtmjfXQ6vfwYYjf
 ZeyO/MHnGcdOChAs4IGL1gxLuyz/CIB5PsVJuTGR1ev5bEXsRtBs+xdrx
 UvQZR8CIr0UoSOcdXDqwzYuL2yLSkLNAnKZRC2j7EqMITBfAfoyB6qFKz
 UKzPGeoK9abledgfHcSugW2x2mGwHkuJtfVwsEOJe2/OaamQWqON6MLIF
 rW9r9E3g4OgjBQTP8kb9Qh22jNqXw8yu9zkRA/bI15LEQ+EH7VPLS4CHm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="287404967"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="287404967"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 12:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="626682158"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 22 Jul 2022 12:32:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 12:32:14 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 12:32:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 22 Jul 2022 12:32:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 22 Jul 2022 12:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMecyUy5gnaHndEmx124AwJCHilm8+NRLjLvKOMrwZAkU4XwR3TCT7lQYn+w25bSzzJ+PBiLXsTLjeh3DX6TL8cvFAVp4jPBl+LnxI0fEum4eUxkrx1nQm9vyhhK3G/oWsZl/bnfbTbbXZO9cdj56Jda5/3PSBQ9H8HQXG/JnMytkV4msEjPo2mWMj6BowXin9GUIYfSUFQDyXyolF4LXZXzwHita2VylsM7Xt8MCjYL0RM4Kyxm6amedk+7+2405pI6UECFr+55DCt0jUd0EWCCZZZcFBcmncJMAt4w3TNJehVaHatLHtpw+Idvc5vK62DmPJNfD7ktet5cl6Rtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLK8/mgkbVRCCJ7oGNMje3gqQWW/wkESce13dDu5Nok=;
 b=iTC0OcYxR1OrfiYWZ4UfSx9sT4P0qBO9AB0q6oLHLqVy0QOh9GSnFFdfsZaE4LYRYnQ9kBCFSV3hphAc9CyVtyEj/iMVjJKpou1Gpk6qzD7h+3E7knSPA3++PkN6La68fxc9je8VTK5yMdfb/l+Ux9vRM258E/g/mS/T4OEa8tw9J1+ogzr5sfs5/NITdkFfZtjcICugy8CCNbZ6tzXf8K5+PcvRRzVW4uAta7bxauL87EW9w0H0/kQEl+E/QDh+wdV0UwjkJxuR4cQ3ldimK8oZaZGwM7QHkJeKigbDgdqfFULyy/jv+G6j97PROAd0kR0YyBJLnpFnevx1h9HGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 19:32:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Fri, 22 Jul 2022
 19:32:12 +0000
Message-ID: <25f0f1b0-2eb0-4a52-a105-17a82354284c@intel.com>
Date: Fri, 22 Jul 2022 12:32:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915/guc: Support larger contexts
 on newer hardware
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-11-John.C.Harrison@Intel.com>
 <3c8e8b71-1c74-c50d-7b29-29430a11eb10@linux.intel.com>
 <e7673834-a795-8364-96d9-7075bd407ee6@intel.com>
 <1f306c55-8443-72b3-a419-40f3cb85b76c@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1f306c55-8443-72b3-a419-40f3cb85b76c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 094c7c60-3191-40ec-8a25-08da6c18e05c
X-MS-TrafficTypeDiagnostic: MW3PR11MB4748:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYZSIIQ20k9oBK6XJOAot0U1jkq895ddY9nBVDoJXMwC7eyHk7VzzyC1RqDf14rqIFH8sbkKmtIF5V0JUGhAP84J0BZNqssrC2ZhR9oe69YAaqcM/48iq8ElNsliykrUrLQwHg6Lmuw8/dWWn+KdrQNSCLpTSwNaEDMLs7ScUn/TpLc3/InchDYXiitJSm1yj5p7a5efQAIGZwBaMYDURtgpY92k6j5rWRzVfBDcVjCPDkxVnIbsXUF0jgQpR4QCw0fAohKdihmMQeYIKDHZMaK9D75K1AvH/sCxA1s0QPbELdJxI6+Uk8iAjEXI4tjVwzrwbadDrsE0a4jDxij/pd8ZgYj7aHmDj3MQc8qmr0h0GgorvYHJ42akro8PUCvQM2o6PAFgQuzYjsNu7/6mhobyospjF+lCrgMC6rasffn273EuS30LI8c3a28UIMByQ5iOVXrlJ8fVMxe6y1xG1WDmsb0KMqXytM/GpmgHsTKWVRf5ekIunI20VAhVG9I4MZ4p3nqrQO6oSj15OJihPtZa9UF7MLP/COQ9Z2xADpKRzGqCVEiz+qxMoPGZnMuGpY8LLKgm44Mx+KSCRPIKcdVAoxqPvvGu6jauh/F4LM1tkANkFtaSyjE6q5WmqLMGmXPNTvP4vCFbSJ89i24YoZOo32ND+lDgslYx+f/lKP8HBTHyRD0lZ0Z7o403NPzpVON5VedFwjETfol6qZ3kS18DNUfrVD9BVYsk91TXkavXI/DpGNovjKKbrhNnUeLAnd8Qb8ayk5+OmTJruz7jcJ5NQTbByzSQGgDLIvsfpzJadIxdPixa0xaDYNtHqRifIPcNQ8lNnxNokUArGxCbOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39860400002)(83380400001)(66946007)(8676002)(4326008)(6506007)(53546011)(26005)(6512007)(66476007)(66556008)(8936002)(36756003)(2906002)(2616005)(316002)(41300700001)(31696002)(31686004)(186003)(6666004)(86362001)(5660300002)(6486002)(478600001)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlQ1WkFuN3Z2dVJpWktoU2VpWGF1ZktXd0ZFNVlPQ2VaTzlFVTBLS0g1Y0tm?=
 =?utf-8?B?NEI5MThyMUJCcmtnclFNTlNZcVFmZEt5K240YjY5YnlwdEZoa1hZUHRrSFFw?=
 =?utf-8?B?ajU3elI2VlZ2YWJ5VXFCMkQyWVdMay9uSWx4V1FGNDEyNVRaa2lWSitrZEgy?=
 =?utf-8?B?bXRVTmZ3T0FSdDNBNWFtbXRCUlpUT21TOThHeVNJU0VIR1gwOVA1bXAzc0Vi?=
 =?utf-8?B?cXNVSENSN2hhR2luclY3ODVPenlqaURoRDA1MkpKSmg0bngxUFU2eVRUYWVL?=
 =?utf-8?B?UUFYWk1SMUoyMGx5TGI3VGd1YzEzcjExOTZMTzdzVXppam9td0dYZ3R2dmRv?=
 =?utf-8?B?UEhHMEJrektOdzNFSUVJYnRwWm44dlN0cE1jdFEzZG5aNi94R1c3anl2ME0v?=
 =?utf-8?B?T0VqdGx2NEw3SFVHbTFLZDhhelRRdE9HSmRlNmRrWnhQS0dyaGtMZmp1NVBX?=
 =?utf-8?B?b2lreE94b1ZFeHQ2dGtwSjZmaVltMUFueS9JdDlOTU8rVmVMSmdnWHFxbzND?=
 =?utf-8?B?WmYreS8ydlFTcVN1M1l5ZEdidkV4a3FXc1lnZEtnV2pDNDVoZmRwNHAwOHpa?=
 =?utf-8?B?OHZVbllyZXFBbG1JNWM3QWl3Q1kwcWhjUURNazBaaXlhVDlMTFNxbTBLekZ1?=
 =?utf-8?B?S3Npam1kenl6N1U1MlE3VTJUQk05QVBRajlOR0NjL3hQMmN2TzdYbHJUMTNF?=
 =?utf-8?B?SGdSR3Z6akpOUldYMEVKemNGN2thcmFXSURBdkU5OC8ycXIvNFBLVHQwVGhi?=
 =?utf-8?B?NTZFN3JSYlRzY3krQ2x3dVBaWGdEZU84TmhrN09QZWwvaDVKVUVvZWl1RGhQ?=
 =?utf-8?B?NkFCSnJ0N3hpTUhRS2lteXc1MnpXWlBwY3I4YjU1WVFLUXZHOGlMNi9weEdE?=
 =?utf-8?B?a3hGL1FIeFVPM0luUnZjZ3EwRC90QktDODBjbUxPd2paeVBOZ1A5TXdPVEhj?=
 =?utf-8?B?RjUwaEQ0dG5tdUt6d0NRLzF6d1o2TjNOL2xjS1JjOE11dUxzenloWjlUNnBi?=
 =?utf-8?B?YXlqQmw2QThTcU5PRlZsV0xQYjhQVDc3OVlyU1FWYVYycWRJc0ttZkVOMUo1?=
 =?utf-8?B?L3pOS0tMNzI5ZEhtWE9CbTgyYVFGYlpMU1NvR3J4L1RxTWJqQit0c0M2TXVD?=
 =?utf-8?B?MjN3WHFjWlR6cnRqUE9PeVFoQjRGY2c1Rk01b3NaWW5jM3Vjd1oyMWhvbFRq?=
 =?utf-8?B?VGx2SW5sYklzc0VnNk1nN0Q5UWw3WmUwcVh2dEdXeWl6K01Bbld5bHpFdjI1?=
 =?utf-8?B?MmZHenZUdjVsaVlFUXE2VXVQVDZjb0FwRHVpeDF1aEkxYzlMWHI0cVJUbUo5?=
 =?utf-8?B?MWt3NUo4U1o3Z3Y4YXd5cExEU0l5ZHRsazFzNHhFVkUybXhKcjd0SmNJdnB3?=
 =?utf-8?B?RFNwOEVKOGUxZG5waVhmTUVESkxabHlTNzY1a20ya25JZGY4bmlYUGtVUmN5?=
 =?utf-8?B?bkZRSkNocEttekQ4TXozOUlpMm5BUCsvWGZvek1hWkZ6YzYrMVh4YmcxdDEv?=
 =?utf-8?B?Qk45b2UzZkgrNzB3eGNURkJGNGpSWHhRK0d2U2hZSFRWdzFRdHlYRWZQU1lY?=
 =?utf-8?B?eTUyZTloNGxwWGxrRjFQcHdLck10aDZZTWhoNG1VNzRFNitiTkFEeTg4WGRY?=
 =?utf-8?B?SU5WWngxZWZ1WmgyT3NnUjVyTWdjUnIzc2pzNjRmWmFIM1lBaERjbk5nbExQ?=
 =?utf-8?B?TXQxc1pzTW5BeGYxelJreVR1K25DRXk0SUtEOXRObGpkdTMwbzFyc3JxNkxZ?=
 =?utf-8?B?WFF0c3liUS9VTlV3UDNhem1Najhxam5IYVVTaUVOK21zZVJEVUVQQzNCVkJq?=
 =?utf-8?B?Nm9vQUFGc3l6R3QraE1oZW56TG5ESWJQZzNOcWRhTG5CaHNQQ1dCUnE5TEhR?=
 =?utf-8?B?QkdmMkRHZFhmZDV4blRaazdFbUtONk5JZ2RzUnJPREswaXErVk9oQTgwaFM0?=
 =?utf-8?B?U3duYjZkTW00K0E2WlRkZHl2VzhpSjZiMVB5Qyt0eENDWHoxVHVrcytIS0hh?=
 =?utf-8?B?Wjc5anoxZUNtTjRIVHJhbFRrdzhYUHFqWXdTSmo4WkVJSTdoSURaRlNKb3Ew?=
 =?utf-8?B?SnNtbUhsVG5ERGNkY2ZiL3hXZmhCb0dDV3lZSjFSSzNwU3FJb1RxcWdscjUw?=
 =?utf-8?B?ZEl6R1NzUVZNZVVsdXJ5d0RTRStYRlVhN2MwSnp6dTk2aW9OQm1oRnQ2Ym45?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 094c7c60-3191-40ec-8a25-08da6c18e05c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 19:32:12.7241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTHZbQ+Tkf4afQHEYOQOO+H41MBdixzTmo8dP4PkFe/jzg4KeCWEo0oIC9rTA3d+jWbaqdMDRT0NuAJf+7MQrNliRTM8EEMzpSgUzeceZis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
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

On 7/19/2022 02:56, Tvrtko Ursulin wrote:
> On 19/07/2022 01:13, John Harrison wrote:
>> On 7/18/2022 05:35, Tvrtko Ursulin wrote:
>>>
>>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> The GuC needs a copy of a golden context for implementing watchdog
>>>> resets (aka media resets). This context is larger on newer platforms.
>>>> So adjust the size being allocated/copied accordingly.
>>>
>>> What were the consequences of this being too small? Media watchdog 
>>> reset broken impacting userspace? Platforms? Do we have an IGT 
>>> testcase? Do we need a Fixes: tag? Copy stable?
>> Yes. Not sure if we have an IGT for the media watchdog. I recall 
>> writing something a long time back but I don't think it ever got 
>> merged due to push back that I don't recall right now. And no because 
>> it only affects DG2 onwards which is still forceprobed.
>
> Right, hm, I don't know if the MBD SKU promise for DG2 relies on force 
> probe removal or not. My impression certainly was that a bunch of uapi 
> we recently merged made people happy in that respect - that we 
> satisfied the commit to deliver that support with 5.19. Maybe I am 
> wrong, or perhaps to err on the side of safety you could add the right 
> Fixes: tag regardless? Pick some patch which enables GuC for DG2 if 
> there isn't anything better I guess. Or you could check with James.
Adding "Fixes: random patch that is actually irrelevant" seems like the 
wrong thing to do. This is not a bug fix. It is new platform support. 
And it is not the only thing required to support that new platform that 
is not currently in 5.19. E.g. DG2 requires at least GuC v70.4.2 to 
support some hardware w/a's. The guidance for that was to not add Fixes 
tags but to send a manual pull request once everything is ready.

John.


>
> Regards,
>
> Tvrtko
>
>> John.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>>> index ba7541f3ca610..74cbe8eaf5318 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>>>> @@ -464,7 +464,11 @@ static void fill_engine_enable_masks(struct 
>>>> intel_gt *gt,
>>>>   }
>>>>     #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
>>>> -#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + 
>>>> LR_HW_CONTEXT_SIZE)
>>>> +#define XEHP_LR_HW_CONTEXT_SIZE (96 * sizeof(u32))
>>>> +#define LR_HW_CONTEXT_SZ(i915) (GRAPHICS_VER_FULL(i915) >= 
>>>> IP_VER(12, 50) ? \
>>>> +                    XEHP_LR_HW_CONTEXT_SIZE : \
>>>> +                    LR_HW_CONTEXT_SIZE)
>>>> +#define LRC_SKIP_SIZE(i915) (LRC_PPHWSP_SZ * PAGE_SIZE + 
>>>> LR_HW_CONTEXT_SZ(i915))
>>>>   static int guc_prep_golden_context(struct intel_guc *guc)
>>>>   {
>>>>       struct intel_gt *gt = guc_to_gt(guc);
>>>> @@ -525,7 +529,7 @@ static int guc_prep_golden_context(struct 
>>>> intel_guc *guc)
>>>>            * on all engines).
>>>>            */
>>>>           ads_blob_write(guc, ads.eng_state_size[guc_class],
>>>> -                   real_size - LRC_SKIP_SIZE);
>>>> +                   real_size - LRC_SKIP_SIZE(gt->i915));
>>>>           ads_blob_write(guc, ads.golden_context_lrca[guc_class],
>>>>                      addr_ggtt);
>>>>   @@ -599,7 +603,7 @@ static void guc_init_golden_context(struct 
>>>> intel_guc *guc)
>>>>           }
>>>>             GEM_BUG_ON(ads_blob_read(guc, 
>>>> ads.eng_state_size[guc_class]) !=
>>>> -               real_size - LRC_SKIP_SIZE);
>>>> +               real_size - LRC_SKIP_SIZE(gt->i915));
>>>>           GEM_BUG_ON(ads_blob_read(guc, 
>>>> ads.golden_context_lrca[guc_class]) != addr_ggtt);
>>>>             addr_ggtt += alloc_size;
>>

