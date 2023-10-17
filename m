Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782D7CC262
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 14:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B810E2CA;
	Tue, 17 Oct 2023 12:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0D10E2CA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697544408; x=1729080408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=57v7HTJ+CjBJMklzvecLtZT4YUBGZuCqr7OYwAozLMg=;
 b=Ie5XiXzsAJvldszleYzBVBgA3Zh4bgf+lwHaps7F7OfCID38zlao3QYg
 ytIbOLb6v1H56nat23+fFWXBRDS0Wvi/UBW7TTe48RcWCVq6q7H2ZJMmn
 7MWj+3uD4JhpAWRZMTX2UMD3AYkmBFsKpUae+8pf/78UWpDeZS8rT9S6H
 p4IdPPMu8aMWbdqThIhyfEq4/5luQ++y69LsIbdbPO0l3S9/lVa7Et2g9
 y0DNI0Ig9Atw5IKtYnrR+3RdACg/1tSKB9NaLYmKpIVzTKucmR2lxjU23
 AOwtFKxlh+v8AT/OEjiyqpnT/j55EbcZ7uQwWpe0HtQ9+LIYo3JBjvveQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="366022812"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="366022812"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 05:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929766592"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="929766592"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 05:06:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 05:06:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 05:06:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 05:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eprdn5TyM31dE+OZ2VZvTCqL4LYMqyAc8sbckp+rO1Vswnak2ag+PmhTyxUmRjhdHQDKzMGYANdExyozjMvtPgx2nxQLhOeLSJl1vNftVtQRtUqXqTYRr47/wsujX1ZrooDFDcYIndAPpluZj95FBtQa4Y0ngtq6vXogH6WvaFYZ8AaWCc9aIiTfKwTTmYFH9Ka+DlMEigjqDt3wq8b+IqchH9YS3iLqcK+0xDi7RdiNVRrF9UC8p+9sIdnUKHonsHOt1Ttrn5rLkl43h5BOVtMf/aX+PF3XNP4jocf8yV3fS5sNIePKPPn6u1EH9+4oXYh+2NuuVhvFhtyOA9XZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCZiKthIGzgMuoWbNSZhgkV6DyGprZXVKU4OMdvSsLI=;
 b=BUC7BEE0JGfHTHLHV0nyppX8a+7pMKChUgSvAmUgxi6uR4/TZjSVXYVm5xm5hvYUvMqnv+Hlg6CHLionmpif8LGZCgkGFBZywIOhRdBARsZbuof2y3NTvHc0VzQOjWnb9B/9aJS32MU3ctSG+3Q83jEUYDchsZwi8KmU6aPGM/uEUgf5sBoAe8Rci/YppyP5ODUQ8VxM+5g2RRN3TC5yiGV4aZ0sgE0pIauNBgWRkzYfBNPwxj4BkFwgceD1j4EpsQxhnb4XRn07N9IDbxMyENkySOh6rgOreh3absh7whnRhnOFLNYcWFrKkcm6AbYfhTxHjCqxlJ//5HQChmECSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 12:06:37 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 12:06:37 +0000
Message-ID: <09724727-b5a8-2e67-0ce6-cc301d95e4dc@intel.com>
Date: Tue, 17 Oct 2023 14:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 0/4] Improve test coverage of TTM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <cover.1697445193.git.karolina.stolarek@intel.com>
 <9854008f-6755-4c09-9f23-90fa62911222@amd.com>
 <c9d088c2-341a-b315-a15b-8b8c0d487548@intel.com>
 <eb349ffd-eda1-0f15-3803-2cfe5c01f2a0@amd.com>
 <c2fd2bb8-7c98-4012-bc63-2e143abf4f65@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c2fd2bb8-7c98-4012-bc63-2e143abf4f65@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc03122-d69e-41ea-3e2e-08dbcf098317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSALB2vTeoXgRqDigpRJSED8Pwr8H7ApfeYj6Yx1ZVhVtzH537zDhRX3Nhispq+RDT+i+k8Cd/sRluPEsH8Rl6HrvOaZbhvnlItXQyk36aW743kTKqvcWNfxo0p4iMe58Zj4ehkknh8y28RvsFgyPESYr9IlGfzrBZEGBUysu1kE9Dl6PjWGhAn3zgkUXrQHJmZO2HC9KaPYkyfXHEHjl/j787aEI8p7nMxpDSqCIx6A5JrAy9c4DV7tR8U3+2iaKzrwsBG3SJdlvyep0GE6xf9kD8hVhiX8BbiKrJ3fd3QIfotIzxgr0UuA6wmWuChGoJUiJNV4EYjAUKTYQRWXejVH8h+7/NxmCxbMujCHt3gaH1sakRXcPjB2etAMBEFwoytwhUXmwX/9hM7y2B+FOLz/rD5LapFoNmseyrJoXmnFmfvChVgvwQL1Sk0mwh7W2fM5kJEaQWdAOHUyk+64xVTiYw9aOFjvR/ES6wUSX7/VlV3+GOp4j43Cnnq0OmBvHKoOwXoeXjBhWFLlpE0IwoN413ShuS5JHf8Ga3VHEecUgX9PoXu28iH+LhtfBla2570CffAaUMw/oBHqIVbZYMBBkuG4jdlCNDLQaRbBXwpIhA8lx60tXSs8mwyQk5A2IgHxsPbEQLvH2qjMxHvQOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(4326008)(8676002)(8936002)(31696002)(44832011)(5660300002)(41300700001)(36756003)(31686004)(38100700002)(82960400001)(86362001)(66574015)(66476007)(478600001)(66556008)(66946007)(6486002)(83380400001)(54906003)(2616005)(6666004)(6916009)(316002)(6506007)(6512007)(2906002)(26005)(53546011)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDI4K2ZGYUhTZnVtVmc4Q2RCN0JqTnBBQXdyZG5CaUlCcHpXcWpEMlhrWVV4?=
 =?utf-8?B?bWpxV1poTjNkSjZZK3ZDZFJRNVp4a1NyVG5DQy9aM3piSmNKUUo4azlnekQ5?=
 =?utf-8?B?VmFYSWpFODBpOWsrMFl0bm9LekEwTzM2RVBDZnFLNHFZakFRWGo4cTdsellP?=
 =?utf-8?B?anhRdCtwMnJjR2FJU0RpVUxZSFdDMlRLckRRbnM3NTJ1bGRDZE1zK3c0SEN6?=
 =?utf-8?B?VjdPNVd2enJCOWRXaWZwMTE4aEZDeStFZ0RqSm1WbTY2WDdyQ1d3cGQzeXJs?=
 =?utf-8?B?UFAzb0VGYlhmeDVyRHRyYytxdDdKQnA0bUl2dGlaSDFhcE4ybGsrcXlZdVZQ?=
 =?utf-8?B?NnNMUGVJVGNNN2p5VVVndFRvb3FZQlc3ZHRDNXMyVXZIbnhzMzd4WHpYaEhv?=
 =?utf-8?B?VGtvZGtBUjROajBuNS9Nb3B0WEVEVzFCbGlNM01YM09JNkpWeWRJZW56dU1p?=
 =?utf-8?B?WFJvS1B3RFE2K1c1N2ttbzNwcjFqSjdRdS9aRzhaOUtiWU5nSklaMm1wYXBH?=
 =?utf-8?B?L29ycWgzYURkRm1jS2xNSWtSOUZwTkhlOFdueG1Mai96RWYwQWFYdFpXVkNq?=
 =?utf-8?B?dWhPa3ZQZHliZ2Fsek00K0RYaDVhTVFQMStSTndTTXdQRmhzcFh6S05nbGdO?=
 =?utf-8?B?OVd2Skl5ek1kQW95aVZGMWFMZ2NDOGRMdTNieUNWN0Z4ZGxCUEdMbUc0WXFD?=
 =?utf-8?B?cnZQeVlaZ0JncDBpYjFSbkludW5KMXVwMXJhTGNRNE93dWoza0I3aDdEZTho?=
 =?utf-8?B?LzRnL2xYUm1DbVBKS3pXaDhsMW0wSDl4MFg1T3R0aHVzUTBQeDZsd0ZPM2g5?=
 =?utf-8?B?SVAyWG5XSzlkL1hzdFVQOER5Q1pnZDc5Sjdaa21YV3EvT2FtRUd0Wm9lY0tN?=
 =?utf-8?B?VUZQdXpZWkFMUVNSb01FdFJ3R1VvOStiMHhjanVlWVpIUm5kMDJPQktTNXoz?=
 =?utf-8?B?WE13eGQyNWZyWUlPTUZWdDdtZ2JlNHlzNzVWK3lVWFhVTVlDR3pSU2V0amFs?=
 =?utf-8?B?Sk0zeFRyL3ZBU2FXS3NXNkwzN054TE1VbURVUG1LUmxtV1lNckc3K2NIYkc2?=
 =?utf-8?B?VFZpOE15UVU2bWdBa1dEZnJXUHhKbzFUWGVwZE81SVNKNlBCSGhlb2F5NlY1?=
 =?utf-8?B?QjZtVE5qclBkdXpWNFJHVXgvVUJpNm5wVFRodG1vVlk0anVQelh2dTRsVEtQ?=
 =?utf-8?B?SFhoMG5pb2d0RXFvSjFYdEl1Z01DMGRqbEdaeDFZTk1wSDZwczZ4ZDdzK0ho?=
 =?utf-8?B?T2FSTmNBUU56S0JkcDMxVG9WUG5tNjRmV3A5MmlsV3AvUUllUGpaWlp0TXVC?=
 =?utf-8?B?L1g0TGtMZGl5ZlJZQ1ZoWXhWK0pPRmVTVzk4R1Y4cWRtNWpsUUlsR3puV0NW?=
 =?utf-8?B?cWZtUDVIQVJONmFDTXg5MVhIM2tRZWZxZTBINVpiL2pIZ0RUUzF2Y2h5a0tj?=
 =?utf-8?B?cEJXZG9lZGs2dkNqNHRCYzYxN3RZWVVzZ1JnTW9KYStXUGpXbTNLVUdJZ01p?=
 =?utf-8?B?OUt2dHFFbnAzNDA0Rm5VOVNkdFZwVHhVMGkzQlFxL2R2T3IvV00zNVNUbmlH?=
 =?utf-8?B?WmJoMDlIdzB4VmUrdzBTUlRMbUFvM0VIOGpSajNlRmh1N0xxUEg3akpmcXN0?=
 =?utf-8?B?eFlHaGZWTWd2WkwvbmIyL2x6TGptcUYwOG13dTJsN0VJU1VQMkJYdlpGRS9m?=
 =?utf-8?B?ZmRwNDBidCtSMzhBSjlKZmJkWDNZRGJvOUdnUWVOTkhMMFZxWWI2YXp6dlMz?=
 =?utf-8?B?WGIvdXZaOEpoOWkzOVdEUndSUXdZWVEzMi9ocWtUTVkxakZjUVF6a20wcGdY?=
 =?utf-8?B?aEtGN1Q2bStQc1hjUWJPNE5lL2NaT1VXYVJOWXFlWldwUk50LzlIRkdUVytm?=
 =?utf-8?B?VFJ0VXBOVlhuMWlJQXZyd3BpWmh3Qjl1dUlKWnFjMlcxRkc4aXhxQnIxNC9n?=
 =?utf-8?B?empLQ3RTYUYwWTRySUUwMTBJeVBQZCtiWHNjbTNUVG04UWJIWFJ1UEtFUmxx?=
 =?utf-8?B?OW9YL3lvUUlMOTdBcW9Uci9mUm5GTDJZckRZbTJhR1RrNEFPdmV6YzVTNEo1?=
 =?utf-8?B?NkR2T3AwOXRyekkxNStyVjIxVUU2QmdpYlAyWnZoaWJ6WE1uVjdJM2lEUk5m?=
 =?utf-8?B?NWpXQkJrK3ZkYTdSd3Q5YXZLNFVrZklCR21nZUd0SEQzNkxzYmd6OHRIOXdq?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc03122-d69e-41ea-3e2e-08dbcf098317
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 12:06:36.6640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyt+RwbQ0xmEfXtb+0CEiDjahsw+YZ9YHyU56qh7NTU/R5MivnJK0y1PpSHw9LLbtdQTjaVf4oj208Ag381iwZtt8YN5y0RSaCedtsGA1JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, "Somalapuram, Amaranath" <asomalap@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.10.2023 13:57, Christian König wrote:
> 
> 
> Am 17.10.23 um 13:22 schrieb Somalapuram, Amaranath:
>>
>> On 10/17/2023 4:35 PM, Karolina Stolarek wrote:
>>> Hi Amaranath,
>>>
>>> On 16.10.2023 15:08, Somalapuram, Amaranath wrote:
>>>>
>>>> On 10/16/2023 2:22 PM, Karolina Stolarek wrote:
>>>>> Add tests for building blocks of the TTM subsystem, such as 
>>>>> ttm_resource,
>>>>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
>>>>> basic functions such as initialization, allocation and clean-up of 
>>>>> each
>>>>> struct. Testing of ttm_buffer_object also includes locking and 
>>>>> unlocking
>>>>> the object for validation, with special scenarios such as an 
>>>>> interrupted
>>>>> wait or deadlock.
>>>>>
>>>>> Some of the test cases check the bulk move mechanism and how it 
>>>>> interacts
>>>>> with pinned buffers. This is to be seen if we want to add dedicated 
>>>>> testing
>>>>> for bulk move or not. The resource allocation subtests use 
>>>>> ttm_sys_manager
>>>>> for now. Resources that don't use system memory will be indirectly 
>>>>> tested
>>>>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>>>>> resource manager.
>>>>>
>>>>> Use kunit_tool script to manually run all the tests:
>>>>>
>>>>> $ ./tools/testing/kunit/kunit.py run 
>>>>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>>>>
>>>>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
>>>>> then CONFIG_DRM_TTM_KUNIT_TEST.
>>>> Tested [PATCH v4 0/4] Improve test coverage of TTM patches on AMD 
>>>> platform, looks good.
>>>
>>> Many thanks for taking a look.
>>>
>>> Do I understand correctly that your Tested-by would apply to all the 
>>> patches here?
>>>
>> Yes, I have tested all the 4 patches together.
> 
> No time for an in deep review, but I'm going to pick this up and push it 
> to drm-misc-next.

Oh! Could you at least take a look at ttm_bo_reserve_deadlock and/or 
interrupted subtests? I'm not 100% sure if my solution is right.

Many thanks,
Karolina

> 
> Thanks,
> Christian.
> 
>>
>> Regards,
>> S.Amarnath
>>> All the best,
>>> Karolina
>>>
>>>>
>>>> Regards,
>>>> S.Amarnath
>>>>> Many thanks,
>>>>> Karolina
>>>>>
>>>>> v5:
>>>>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>>>>
>>>>> v4:
>>>>>    - First unreserve the object before calling ww_acquire_fini() in
>>>>>      ttm_bo_reserve_double_resv subtest
>>>>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>>>>> suggestions
>>>>>      how to fix it in a different way)
>>>>>    - Use a genuine GEM object in ttm_buffer_object instead of an 
>>>>> empty one
>>>>>
>>>>> v3:
>>>>>    - Instead of modifying the main TTM Makefile, use
>>>>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are 
>>>>> tested but
>>>>>      not widely exported. Thanks to this change, TTM tests can be 
>>>>> built
>>>>>      as modules, even when non-exported functions are used
>>>>>    - Change the description of a patch that fixes 
>>>>> ttm_pool_pre_populated()
>>>>>
>>>>> v2:
>>>>>    - Remove Makefile for KUnit tests and move the definitions to the
>>>>>      TTM's one
>>>>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
>>>>>      are built as one. This allows building the tests as a module, 
>>>>> even
>>>>>      if it uses functions that are not exported
>>>>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>>>>      ttm_tt_kunit_init() function
>>>>>
>>>>> Karolina Stolarek (4):
>>>>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>>>>    drm/ttm/tests: Add tests for ttm_tt
>>>>>    drm/ttm/tests: Add tests for ttm_bo functions
>>>>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>>>>
>>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   3 +
>>>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 
>>>>> ++++++++++++++++++
>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  51 +-
>>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>>>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++
>>>>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 +++++++++
>>>>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>>>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>>>>   9 files changed, 1313 insertions(+), 3 deletions(-)
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>>>>
> 
