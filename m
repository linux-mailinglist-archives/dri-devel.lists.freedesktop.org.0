Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20208132B4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 15:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36D10E2F4;
	Thu, 14 Dec 2023 14:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B068210E2F4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563236; x=1734099236;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OosoBIj9SQfYuIbij6TzCzibeWiVRqFUoh2kxa3WQCw=;
 b=T5NZeoMj3JIxGXh4Ot6+5ps3+Nq03Vi+27ye9YwV5wsFPVbJFINz8kYf
 5PvNepKTX8JjQ5yvinlw50eXemmfs+Pwwsgp1TBwYyM8qWI6YaQ5ade3l
 oCJMgHEaNIgc5LI/kF7jYhA8XE9mQVyv9QtsviLc0gYmM50ZLJaYoicgJ
 QY6RZsXpsWTjN0p44B9uW8neLhfoVp0jMaJJnoCaGf0ItWOG8MAARvQYD
 fnHEh2gWaRK2THwSrDku6ufQae1YCC2oOMdEOq4SaPmMhdigBoBP3jgel
 xRXt9B0gntv5rVrxTzgEscRZGdMAN4aFnmTmcvDMsVzVENTtiq4YR2NF+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8520161"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="8520161"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="897758487"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="897758487"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 06:13:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:13:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 06:13:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 06:13:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 06:13:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB0rBeCcjXL0PUYhYp3BUP0lQuYgYTb9m3CslYg6gfT+r2PCDXhkoxVH+vPjGU2Ht0h5A77Xh7l+iLBYv4Z8usRkHh79FjdUtITU1NE92fplV10t+rzeHSBmg7bcEqocp+ga9DAwnmys//+dus8jhKvVvI8gMN9FOpvCG1glcL82UPlJGCXlNy5VZxOnLdtpMIjvvst20IVvBeNVfUVDSGb72qzQwbFMMDHMrOAza09Fj2D67RV3+WGxXQn8bFv0WzIikimfKIj6sA6LjzR3qQUUTa2DR8WDW1cAAh8Bx0Hhi+IaYRs8O7UbuXn8tmPXo1GIKXxg555GLwhfci1BJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj1GPZzOwhYj2B1CUSdYhALjyEwRckA5i5xBmcDvAiw=;
 b=GybkyxeblfXmAngj96UDUT1GsieUjghL6vaHD1WrQglT97DjmBgq+Hx8Q78Ja/m0dD+urUjRlqWC2JY8i4BJpxtdY4tChDcn0lOPoJ/H6CQh0k/Kd79wcSdq3Sb1kfXZpRg42TMut4G2arosU35yLtqA6OgRJM5cgyr16HxfXlKm5A9jnFuNcjWBVpAH22oY2CUKIhFousxn0yyUs4iZ9PrLAEjDbF2Ln9ZUALq7YJ7kpH6uCCxl9zhPI5Cb4VDm63hFltVIAnhSuFJOmVitStXzzb+IFEiYr1JO+zkYGWId5zDSj+ENoQ/HOYvhC+MoQ2w3w/RIvbqZ929kke0usg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 14:13:34 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692%6]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 14:13:34 +0000
Message-ID: <0ce9f767-7854-41dc-b228-f8af445f8b27@intel.com>
Date: Thu, 14 Dec 2023 15:13:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] Improve test coverage of TTM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
 <cf7472e8-d2b9-41cd-90cc-b7a467bf08a0@intel.com>
 <15e33301-3438-454e-b0c8-7f402fd25e93@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <15e33301-3438-454e-b0c8-7f402fd25e93@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0104.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::17) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: f53a3b66-9504-4235-e043-08dbfcaedb90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vLjQDOOB/ve0X4fKSSqIUk8oWgASNBqaapIAYHuNMVnxfIcpcYiQyl03tUWjVsbl9sIQ2bsb7QUhZZMUXikfpzaa+GS6be5RGbLDkA9R2afj4J9jq6eM68w55cQeUQyZGOV9je/8TnngXsmANgVZR0Qm9QoSOTYO7CSvrA6WE+i2wM1x1+nXLo1uccOeAMLocRuxRR3n55FMIB4CgLsqYrt6/uGtHFyyKU+EBVYOyBI214bnEwgYR1+eaiZ5sfGsXYGFU+NFn5Ag0hr00WefNnVbGxZmz2eSG64FuO43hHCYr30vp57v9W29zl2VVwNwqtDjfIGsw7qOqs0MAiX2xRWAUCkWehxDBksyQeUmbnILahNSufjuJ8W/IIP2C5YJ9c63dVrO9Y7TsOpS/7UhVKLEpQZgNVPaCe2fson7f66LAIQiPW2y425iQPMjEy0S3n5aLT+CIbGPCJ7Mv+itgX/3c9YRJWK74XaI5p4l186DGTKSt5cQ7uCv4ii0c7QEP5j+rFS0le4am5C+tpo4Z6mkss3wzs1nGiLvaTr5L8MYk+VpKgz5TZ++UJpN9LgAc2ZJTmwqqFpA32oSwKwDVjJMYodjUhw2yORsBw+Qyx67iNqTJwoc9G0bXx5zS1LKQQ+ay0UdBbrgcf6av27Fuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8936002)(4326008)(44832011)(5660300002)(2906002)(6486002)(6666004)(6512007)(478600001)(36916002)(6506007)(53546011)(8676002)(66556008)(66946007)(66476007)(316002)(6916009)(41300700001)(38100700002)(31686004)(86362001)(36756003)(31696002)(82960400001)(2616005)(26005)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU1GY2p1Y09IeHlOaWZIL1prU3NBNFNvZmJONWloQkVobE1PUVRIakprQi9Q?=
 =?utf-8?B?dEpaOHZURDdoMll4VmdoUjlrclgyWlNBeERVcWFHWTM2ZHNxdVBtcy96MmdT?=
 =?utf-8?B?ZEZORGpmdkkyYVlLQ1R1UWlNMFp1RTh1WXRJT0YxdGJSd0NoTW1rRUNDRHc1?=
 =?utf-8?B?ZjZPUURDOXZzbk5sek9qdnNFN0wxWjZUSDg5eVdqbkxBRk1OQldMa1NqZEI2?=
 =?utf-8?B?Vlplb1dZNE5lMnBYV2wxdExzdTF5MjJsckRSbkN3bEcyTVpwaEtnTGhSTng0?=
 =?utf-8?B?V2k3YmtNUkZYYm1NTTE4NTVDajBMbkFLNW9UU3dDM2JkUkh3djJMVitpeFVP?=
 =?utf-8?B?WngyUHdlTzZVbm1LcTNidGYxeFBoQWZKWExsUU5EZ0dFdTN4RDhrRlBKMHd4?=
 =?utf-8?B?djN0UkpKbEtDMzlFV3FjbC85ZW84ZFlMRzc1ZTFYQzJvcGZyVFFzM1JJSkxt?=
 =?utf-8?B?YTltTk1xdmd1bVBmMldBWGdrUkc5YkJtcFkyL05haVNNSDZMM3hyemlFRUpj?=
 =?utf-8?B?clNubHZ0OVZrQjJGZ2ZLNHZaSXl2bWtrbEFiZmxrdHB3S2xKRVc1NVJFd1Vp?=
 =?utf-8?B?d1FOU2R1amx0L0FCZGlQTE40YVJTS2JhQ0RaWjVoVHFmQjNJL0I4Tnp6Znll?=
 =?utf-8?B?MDlFM3Q1cDIxSHdmRENrQ0hZdlB2U2lvTm1QQzVDY3BpOElacTBxM3libG5q?=
 =?utf-8?B?MVpEVExQQmxtaVRHSzJCNUh2WXArQ21YMmtQenZBdXQ3WXQ2SnowTTBMZjYx?=
 =?utf-8?B?dGtRaTRWZnZncnhKNTZQNjAwdldBK1dPL0podGZqZU43SFI4dlFxaitaa1Mw?=
 =?utf-8?B?SWl2ZHhzR3ZkQS9kT3F1V3Y4Ky9wQU1lUlIrRDBqRHVqYkJHN2RaUnB4TlVh?=
 =?utf-8?B?cWV5N1JvR0JZSll6bVVqOCtCcGtUR01qREsvakd6dGNJb0V1VGdsckdpTjJs?=
 =?utf-8?B?WFpZYXRxbmk3TTl2S0lUZTBaUVNuL0Q0cmNnT0RiU05NRksrYmJOZjNxZkw4?=
 =?utf-8?B?Ui81U0JoUnJTdzZBL0xLS2ZiVHJrN0VpVzNhbXFlTEpSa3U4MVk1RHpQUjdq?=
 =?utf-8?B?UkhNOWg5THdhZllqRW9ML0tlZmtxdFN3ZmJNZEZZUU12ZStScjJCbG9CdElF?=
 =?utf-8?B?bm5CS0ZQcW5zdWFUalBvUUl3dlIxOHNVQWVWTnFLOWJBYnFWSW04L0xsa3RB?=
 =?utf-8?B?R3BYaW95R3l5bmZRY2hhb2ZUdlRrUjRneUJKUUVOSlNTRjdFbVZndmJnc3JW?=
 =?utf-8?B?WEFHTlpweXp2Q2Y4MnAzaXNCblAxQktHYlpOb1U1SFAwYnFRUzJ2OVlpZEFo?=
 =?utf-8?B?b0t5RDVHdFJUb20rM09yMWRFTHBIWmtHdEpxT2xnVDNVUS8rWHpkTnp0eEt5?=
 =?utf-8?B?NmNKZHM3T1VDTU40VnFsYW5uMUpQVW43M1ZKTkM4aHZBZGFEeFNOZHRPd1Rw?=
 =?utf-8?B?Y0JOOGw5QWkxMkw3R0RFVlZ6WFhrZG9LQVhiamZNeWl2emN5YUpUbi9heEx5?=
 =?utf-8?B?SkJ3MGNuN0ZLN1dJczR3YjNHYXBlT0Y2MFlMR1VjdEVDM2FSM0hjZlQzWUht?=
 =?utf-8?B?dDJTMTdmV0s4dVM1QlRsV1VWeDF3UkwzQXlxUm52aDRNdXBQcElmUFpUZ3ZM?=
 =?utf-8?B?eGd4dDVLWGVVTHd0VzlrNUhEZVZnK3lNb01uL0EzSERoalhzWVpoVEk5d0ha?=
 =?utf-8?B?MEpGSEwxOVZKZkpGdWZSb21UL1VWVUQ3NEFSeDBqTlJ6NFhEYlNJaS9XbDFp?=
 =?utf-8?B?YkZubUZUcXZVN0h4dXpYOWl3SWZyMU0vcUJITEtEanAyTWpsWDZtZjhrRVR6?=
 =?utf-8?B?QmR4UXRaMlpmYWgvNW9ydUxRcjNyZ1JUU2hLaERCVnEvRENmc3VoN0pjd1FQ?=
 =?utf-8?B?U1pYVTZxQm9sNjV5NVVwVDZ6aGhscldTNWo4V0kreDRIL0kwdW9FZDA2RGZM?=
 =?utf-8?B?NmV2ZnFpN2VKVXhuZ3YwTWlTUTdkY0UwRTMycGlHcHhqMTFVNWMreTNndEJV?=
 =?utf-8?B?amF4OGZsTGZTREkvS29pRnFITCtqazdjNFVPMTMzejZyeG0zUkMya3ZLaWRG?=
 =?utf-8?B?ZnlxdW1vK2pReWxCaFBnU2pVT2tPQSthQzRWRmN5UjlUSUtXM3JPK2FWRnZU?=
 =?utf-8?B?bGcxOW4wZWVyR1B2SzVlUWNGZ204bW50U3ZXVDJjRUIwcHdmQ051QnliTUVs?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f53a3b66-9504-4235-e043-08dbfcaedb90
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 14:13:34.4427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCsap8U3YWasna9C9gnqpuVP26M+9RIpOrG8Thde0/xxtXP0rAGvY9JRwZfm47GjmWWENKC0085ucsKs7+RronaoJ1Elxyp1XtvSupUSm3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.12.2023 11:22, Christian König wrote:
> 
> 
> Am 14.12.23 um 09:20 schrieb Karolina Stolarek:
>>
>> Hi Christian,
>>
>> On 29.11.2023 13:02, Karolina Stolarek wrote:
>>> Karolina Stolarek (8):
>>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>>    drm/ttm/tests: Add tests for ttm_tt
>>>    drm/ttm/tests: Add tests for ttm_bo functions
>> >    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>
>> Would it be possible to get these patches merged? They already have
>> r-b's. There are a couple more, but these don't depend on any other
>> patch that is pending review, and should be easy to get in.
> 
> Sure, just pushed those three to drm-misc-next.

Awesome, thanks a lot. I see they went into drm-tip already, so I 
rebased my series on the top of that.

>> I'm asking for this because I have three final patches ready for
>> submission (eviction, ttm_tt_populate, TODO file) and wondered if I
>> should submit them as v9, or if I could create a new series. I'd prefer
>> creating a new one, this patchset is already big and intimidating :)
>> Having said that, thank you for taking your time to review the tests, I
>> really appreciate it.
> 
> No problem, you are actually helping getting stuff from my way to long 
> TODO list.

By producing 4k+ lines of code for you to look at? ;-)

All the best,
Karolina

> 
> Regards,
> Christian.
