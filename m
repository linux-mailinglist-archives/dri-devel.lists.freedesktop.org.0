Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AAB7C53E7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4644110E798;
	Wed, 11 Oct 2023 12:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2F010E796;
 Wed, 11 Oct 2023 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027215; x=1728563215;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xqzi/d898Ye0D5F6SqyXOA2iWbQTyVt6qhE8RoctXi8=;
 b=DotZQqIx32Ukkjq3CsGWQ9EL0QjUh3SUp0/pgOPzjAzLDOK4m3VUNjgZ
 IITaZ35eR3qjir/PmOdviRbsEWCm7FxoM/RxFhyu8cSc6SCy2MG3/Aufn
 XKgTx/PA5/QBzcHfYlDIjRqLIm1Xy9/mAqaChJ88G+RiNHrMnwzOe1Ekg
 51g9WS+E0m++qE+plpqJLAdzhKuP8GuxQO79LzBmaN1e3gdavTz9LaymQ
 P4EP/Yk5RPi+Bmgjx+rnGi/kO2aK/cgPzqOvuJfucJKpLg0fbjzXG3wEK
 ncztorYFSsqYY5UhRXaKgVBcHEOZkebSk6Bq0bug+y4Erjud4/XggTKjg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381893048"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="381893048"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="819676566"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="819676566"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 05:26:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 05:26:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 05:26:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 05:26:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 05:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/ebelRmrsRZ3WRA2HYu7FGDWJZrRaoTWP7Ho7kavUVWj4zRwOk7YZsZm7bhUkfc6SFjpbM3nDPIEq2/UHO/11nswsJzaiFfqKQEaMNnEs7+c5PymPX8uSSN+5ZtHuM1yZIsDkXxB0nGuvpYPNAaNtWEWSzO89mnwqI7T00LodzMKUA5hM5xMd3F7lQiqCCpZOQHnuziz8jhbjpdkUlw72dgU2KJ1Tt5hVnbKJEukgjzKpW2lMN+fg4WBNn1zB/qLhRyzVtq9BroTXzPDhGTY4xnhgjgYGui6NP0lAa53scDpkwEr4oSmZ4I5EJR8mbJtXziot8E95ZH39wAUR8fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xqzi/d898Ye0D5F6SqyXOA2iWbQTyVt6qhE8RoctXi8=;
 b=KQRcjIgByXq7u6btaGhcQFF4KpI7OJEzoVn0MmR309aJQS1YLGeoTBuiRYWQdxQ2EgI+1xBfeDFZOuKz0hYNX0kwyf6L1xbBIeM6WYKH/wl94BqMTP6ntdavOf6wxmRdhxkH1v04LSdZJ3L/7PxGEYNuTzFL4FVSAllaK67zKlceqe4FZHDTsFP2CVl3KSKrq2RAmakgpaEFRajFNGMplPags5gj5ea0p0jD0hXwE2HC90zYyJX4gPEM+VTH/Nut3gvBgCVrzFTpT6mpfYHBKHllzsGxEvculTMSNhrGSGQDwPS898U0pAT8jQ047S0elxyBa+L68Ln/LZoJrrEMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Wed, 11 Oct
 2023 12:26:52 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::1d18:2488:73b2:e47d%7]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 12:26:52 +0000
Message-ID: <c8970ba4-38a9-a918-c4d6-a50f6a441e0e@intel.com>
Date: Wed, 11 Oct 2023 14:26:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/i915: Prevent potential UAF in engine_init_common
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231011115451.12521-1-nirmoy.das@intel.com>
 <ZSaTj8aUqhOiTcmm@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZSaTj8aUqhOiTcmm@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::11) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|DS0PR11MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f3bb65-3aa7-4e5b-16c4-08dbca55592b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LCMWubn7r76FSpGQrqwIjaoxAUrcT4DZWDgwi4nsFkQwPQ6InszsVBc5UJRhPqobGVa1t+Z/Z52k4+3Jy6OR8EofKdUodrhQukgTV0+80U8kPtcqPEtP0wJeG4E0OvqOHGxrfvNC+LA9k4/AWIBc2GqNTu1kFnFFIyHfB0ipeDIXMFr9T7MUV+pWcpbsKE2y2J71tDQ5gr4gIPLEw20VSilEc3sND/CAnutX5V7caBJw6h35tIoPYG8XcWz945ir6YA0IZlpTZ7ZhH/X2mI2z2aXjaKIv7vB4JW338Otx44nFwyF7MjInLPzNNR181e/3078QAgYKWVkvJ7My+hM6u1g4PVW2bmU+TbU40vCD1UNlrJznu0EwfPOjMKpQ9q+liJKSraLfvhe+e9TzqbOHqDQ8E/7elyE2EVpxchQk7v4246nWBKFT1GlfGs7C68ZRA9mB177b5jg18qYlH8sbq4ZRn3qe0rOrhXrVrENErE3Ez1pIeeCT/nhIbTSSYX3XjjV7CvfiHgL8DQ5GGSgXXfMQXZ6KsPsq6aJ3y287V2c0hPQEMBe01BPdeuVKvI3ds44or6eEjDgm6mxSDg65H6bKwjhV7izOFv8Vx2zhb+A8JorKRWJSJtROK7dqhbhtHjm+z2M1GS9BxylQeHG8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6486002)(478600001)(6666004)(66556008)(66476007)(6916009)(316002)(66946007)(4744005)(82960400001)(31696002)(2906002)(8676002)(8936002)(36756003)(4326008)(5660300002)(41300700001)(38100700002)(44832011)(86362001)(26005)(6512007)(2616005)(83380400001)(31686004)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFZpOEVGYWRvN3NKbzBLYjBaWjBjVzZ4cDdBRjY1Q3RITlFzeTBJODd5Z1Ra?=
 =?utf-8?B?Ym4wN0dvRXJXa01WeFdRZ0FIblNRRlJ0WlhhZy8wT1gzSU8xL1ZNZzhnRlpv?=
 =?utf-8?B?Q2Z3TlhDR0duZSt1eFlyUUVMcTB6NDVjRDJUNlVzVjNZTXVMLzUrdHBNQ2Nk?=
 =?utf-8?B?TVltMlRaRW42T25zMlhTWUUrUFRhdUdwKy9ZRVFISGJ4UzJvK1BFdzNlcTlr?=
 =?utf-8?B?T2JERlBzM2d3dHdXWXhWcktybyttcGhsR25mOU9mdGFHa0pOb2FCWWg0TGcy?=
 =?utf-8?B?Y2ZzcFlCc1lnaXN1ZTZReWd1NWJOay9qZ2R1bmJ0RUczTnYyTlNlaDVTRXBO?=
 =?utf-8?B?bzFsVlFaNWl4U3cvaXRSOHBnM0hBOXFmNkQxNnpWWGlCWGxqUSs3UGh3YlV1?=
 =?utf-8?B?ZEJINnZiVFloNzBsNVVGdDdPZ05aMHMzTndFc3lIUk9zNnlTbFFvTmhGUTBo?=
 =?utf-8?B?Z1d0ZVovKzFmSTlBS2dzUmxPWm9oaHVxUkdOa3RmeE40MDYvajR6SjJLSkhD?=
 =?utf-8?B?R0RYOW52RVZENDY3eTFzd0toSGZzbE9DNnhiZnJab0lobWxHMWpJUERTd1NT?=
 =?utf-8?B?MGdrQmprMEtpTGdWbEdFOWYxTEIvZnVtWGI3d1JqRlhYeFd4bXZQZi95OG1D?=
 =?utf-8?B?UHF0V0RpcnB5TlJqbVpaQmhzYlB6SHFnZWZSMGVIWVBLUXNHeVJXZmVnVWRn?=
 =?utf-8?B?cEtuWGZyV3l1Y3pRNVR0TlY4YmxETmoxOXNod2FUUkROdGYrNWN4bnRtMWZM?=
 =?utf-8?B?QVg3KzZtckh2WW8yT2ZWT00xWGs3VnFCZzJxREcwRTVLazVycUdQRW5CNUs5?=
 =?utf-8?B?OE1yRzh2ckVjc21ZOHBKemZEcUNtUnM5TFpzT1BDV0JuTlBiUUhidGQzRitL?=
 =?utf-8?B?SzhjSGVUK1NUZkVUeGVMM1F5SkNYK1NNTlJLcW1ucnhFSmRZV3kxUHgyeGo2?=
 =?utf-8?B?R0F6R1B2L3lETk4rUVZDQ3R1akVSd1BacVFiOU1sckN6Tkt5ZCtGOU12YmxV?=
 =?utf-8?B?ZUY0YytDNDR4Y1NNdmdYbGxIUE5tbDVEZVBTQzI5Z2VRaEhlNEdsVUlmNlFR?=
 =?utf-8?B?S2M3ZDk4MHZ5Z3BZaEdCMTBZWGR1Z0JiRGw2ZUY3eXUyWC9oZlFuZEhYNGhE?=
 =?utf-8?B?N0FKMlRreHc5V2lUTG9IVS9DQlJTbzVyVkpDMWkvTTdVby94cEVsYWdaUVU5?=
 =?utf-8?B?c0NROFFHdFQvNGt3SEF2Mmd5b3BYaXdzeDhpSWtYTHh3c3hXb3d6NHJtK0lq?=
 =?utf-8?B?WWVDazRSbHkwSHFFbytuWnlaTnpZVWF4cTczTUZ1V25zeGVZbzMwdmdJK1F1?=
 =?utf-8?B?V0Y5Y1BKc3RBeVNMRkNSbk1IQWJiL2tZQjFJZDY5anRCa0FXSVhLNW5rV0lz?=
 =?utf-8?B?QnZVQ294d0xvU3V5dU5mZ0VtMURyR2NuUHhIM3h1UFF4TzVEWmNQNXlTelZh?=
 =?utf-8?B?Y3hDQzhzd1JVT0h5dXJPR3hiMW5EUVo5bmM2Y0lRNHl1MmNtRGY2WDR1ZFha?=
 =?utf-8?B?b3dONUhYMFRwRis3Q0w1WTlwZEZ5MllYS0FUL3V0OGh0ejk2dkFlc1NzNW10?=
 =?utf-8?B?Ny83YWtVVkk0dk1kNXRLNXdrcjI4WnA2T2E0UTNLQVI0R3dnK1BKUGZnMGZG?=
 =?utf-8?B?dGRNU2hIYm9LelRsTnA3ejc3SkdINnpUM3JQVW1WUm9tM1Q1aitDaXNoS0VC?=
 =?utf-8?B?TnFMQy9lRmhhbXkyNk9ZRFd2cFhiV2JXWGtjZEJmVjQvYWNTYVlaaWMwc2NS?=
 =?utf-8?B?Z1RxcmpuNnNrWDdNSjdRU0s2aEJpU2laditPMjR1aHk3YnNqdW0xYytTeU00?=
 =?utf-8?B?dHMya3VkSUZwSmR5RG5EdmlDbGJHM2xPS0FUS2ZBU3RiSGg4NTZxVmduZHVq?=
 =?utf-8?B?Ymd4djgyM3NLMktteUwwWmxFY2RyUkUrQzhYaytsaGgyc3ZteXlUY0hxL1pD?=
 =?utf-8?B?NitRRE1hNlJCMEJUSEdpbDEwMzQ1aC9JNzFZaitpaENCSjVTWXF2ZlI0TndU?=
 =?utf-8?B?SnJMbnFjem5oK0hBRVA5N1R4NGpNL1JuTXpvVXpZcWgwNFBvcS95YmVCUXVI?=
 =?utf-8?B?UHdROEJxa01PSnJvRHUxQk1EWmRpNGwraEx4Qk1uc0tDd1Q4ZWRSZS9JbEMy?=
 =?utf-8?Q?cI8B9xcj1GxUG7URNxjtHosjw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f3bb65-3aa7-4e5b-16c4-08dbca55592b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 12:26:52.2529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8O1CiWjlyK6e4vR9CbVW3GeeAp81M8Ws9a05bBs3pCpaFFm7qHQvhAib5GW2nAzoWtgL140af/Dn1RYMXFq4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
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
Cc: intel-gfx@lists.freedesktop.org, Oak
 Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 10/11/2023 2:22 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Wed, Oct 11, 2023 at 01:54:51PM +0200, Nirmoy Das wrote:
>> If measure_breadcrumb_dw() returns an error and bce isn't created,
>> this commit ensures that intel_engine_destroy_pinned_context()
>> is not called with a NULL bce.
>>
>> Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Resent with a fixed subject. Please check again.


Thanks,

Nirmoy

>
> Andi
