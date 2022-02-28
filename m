Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B294C78A8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 20:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8079910E1E9;
	Mon, 28 Feb 2022 19:19:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4681010E1E9;
 Mon, 28 Feb 2022 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646075973; x=1677611973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r49rZ75ubsovQGLCyXBF2gEam+SUw8O9feO83xNsvvo=;
 b=E53VmXfFuOhLakgmbQmVU+vhFnRUPHPE6X2GEQ610rH34Zr5Jli7pNCN
 EVOAvcdayI2oANx7rhnbscQvrCVUdxKzDvNvobqHPgawlQR/e6/tyHLUB
 DiDAMapagWIUo1O4cGdQ6n0AHmmAqLXtLbDisQutQQdfTvsIyMu4Iam97
 ZNPfG0BgvojjehuplemfKxgau+vuaCR0DQOBiAGswf3YqBGr57MnHoxx9
 gNw+t6phauSqZrmT7R1oPmBqw0XeKERrFqqGVs4e7aRr3FeW6xJX5bQ3Y
 EKAAxax44L4Q1WFsqw18fbFOFLOhyEuk5vXenqnkO0gwRqUItanZvADZM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="236473396"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="236473396"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 11:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="803119597"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2022 11:17:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 11:17:20 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 11:17:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 11:17:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 11:17:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd+Q3FN1joxNVWtyK7vXnVFYAW5GOdbg0e2T22KIxbCUpsUNQeOGM79n5rnn84jOmOcMvxEi2ZhkKnn4fllwE7UcwDJPdpGUpRpwQQaFaEyVl1G5mOXXgMU72oI32mlJW0smC9k5LkClUG1nf/qxStxAxi+QKLTF84GAkKctcmMHH4JYn549wpULgb8W5zRILSu+k595RREMYZnIpnP0zA8drlM3DmM5QVt29tqG998TUiDe26aYSvttqRIW50ktL1A1LEgPU9jd+PNyy1XykVkrVw/sh98viU8fARmVaFYlj5/Wm2xZzMLoNujL6vcsnUJXug3nv7CqbDkbalF3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDzsuZ4eA8ZTuKctoRMupO/729haNTBQoYGLDfen8x0=;
 b=k/xmRZ9h9F+XLjmnv6vkRq+i2fmYrCi5Lo48IJlZx2TGW8sEOkj9aGZU4o6l0vFrpbkA7TPuzrYjk33HUXYEwWwrvB5B5rZPjF/4wJgT5oHdBUlmfQplLm7Q0YTr0F8fHx4wer1poZugNQqx5cZM+QTF9NoM21wYBQtOFyORUXlgMt5ficdpkyLpIizE9B6GHTxLATd8wVu91JbNzI9jQgRnaDh3iW/oV+uIcMplIZk+eacim1AMcqCiFliKTtfb8cb5Ud7g961PnlJJQVTSlAg/4EOZVnT99kUv7/yOD0hsQUpQ3uyZJsuhp9j4AexaM/uLVz0B6OPmiyaa6dWo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 19:17:18 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:17:18 +0000
Message-ID: <77cbfff9-cf7b-2c23-d0e0-1b3b49987bf9@intel.com>
Date: Mon, 28 Feb 2022 11:17:14 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
 <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
 <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
 <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
 <bb8d25fa-4b6f-0c53-302a-623787760bcd@intel.com>
 <720fe7f8-a712-c755-9fbe-70ac2fa008f6@linux.intel.com>
 <72ebab5f-1023-b590-f5a7-f5db2333e925@intel.com>
 <34273e9e-8473-d95e-fdc0-47ca9e7ac8cb@linux.intel.com>
 <09969620-129e-f032-2f12-0d1adf537e6e@intel.com>
 <fe10779e-db98-4d84-3d12-d4260f28a3c8@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <fe10779e-db98-4d84-3d12-d4260f28a3c8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d027dcc3-cfdf-457c-196c-08d9faeeefc9
X-MS-TrafficTypeDiagnostic: PH0PR11MB4997:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB4997B09F9AEBBC60C6115E45BD019@PH0PR11MB4997.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buNxUksqZoATB/Ct0bRfjvsn4nR0Ic9z8BGKZbxQJypUQbhODv90vBBjhODa7FegApONpBkh9LecPqhQZGdbg1aCVT5BGJI8xIScCg0WJGBruMMpFwo/nJF27M1EK4sHdZPU/3ERBTQL/IfRVjLwsATt21JUo4BT4uqoBsAHBWuKF751uhRBZhpdTOaTreky5kMEVSUhk2zgTEIDVkFz5XI8tbZD0LzJKr/eh4fWFDEJP6pY0Esn2axMQlAqLgZZhzUFrlh3+lUaxMPZ/dUpEPIKVFTGcFD80xA6hK8gA0d+249fIEWAG64NtzJ23tCljOngC9pjpmSQtee62QXwfaEuE23k6n/03t/Ba+GCa4ls0+GXzyvdgVhZLu+840CmQ4UUOcEgYUJVnWoFEr0ZFRWEyvtDUyE7PrBzSgqVv1kw60jpheBjuu3WXBvyn1NSjK4yP/tROaaGzoML3G2KCrJV6qDEFEvuMJkvq5uf5q/GaJgq59o9yKNR5FVDKT+iHcQ+jO0MV04DPwTGdB62ouN7v3+ypLN+Ir5HiyA1tRgaSJKiXWHoIlHoL+Oz8Plu9q00Y2ziirP+BnA079RnFGLtDT6wT7Js/yVYgpwQsd/vQFNzUHzJmLkEB6E3ezQbDNSuMf476FelAZ8YZPQjX8GXdc6FteWwjvLo90Gzsi9SYokiuHVRuNYqT3ZTcebzcG1Su3DWBZjQY5PFh05gUbtuhKWHtxl4okjr5DsIuEmvxwxJNkGHZ8oNeNsdoMk4CdFtPScRv4BXtRND9w+F3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(30864003)(8936002)(86362001)(31686004)(316002)(53546011)(2616005)(6506007)(26005)(6512007)(6666004)(186003)(83380400001)(38100700002)(66556008)(4326008)(66476007)(8676002)(31696002)(2906002)(508600001)(82960400001)(5660300002)(6486002)(66946007)(36756003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFLTCtNUTRhcGJuZk50Qlp3dEp5bktyalJWRTZQYk1kbWFBSDRSdVVkRGpt?=
 =?utf-8?B?OXNhVSs4eDE4RDgxQnhvb3FjbWlOdXY4V0tEZC9sV3NaNnROT2xtQXd5SUJ1?=
 =?utf-8?B?QXJGNkxrckk4ZU8zVWV0czZBK1NENXhVWTlMQXQ0NHhhMHozRzEwYzhyQVNI?=
 =?utf-8?B?TXBKNWtKWXNoQVBUL3k4b3ZSc1ZBMG9zUzZucUgrd1dPNFFZNHdZdzBua1U1?=
 =?utf-8?B?Rk5ZRE1JY3lod1ZsUlhlaUVJZ3pNSkxhRnhPNkJYc0w1ekJLRFYrbVRBTkNQ?=
 =?utf-8?B?b3JDVG4vU0dYb0RzM05RMmEzdnhOWWljOVZWeTNJektmV21xZVVBQ29vNkRn?=
 =?utf-8?B?OEdwK1IzZVpNcUJrenlBUXdzZnEzVk1EMFFFWmYwbXdTUWg5WVMzakRVNG9q?=
 =?utf-8?B?d0pMbDVQdHJaMWQ4UitQT09Fb0M2ZHJXMExFVzV3a0d0N3pORlJQd3djeWh2?=
 =?utf-8?B?MWJrK05KVXpTMjVHQzhBQnE1Z1ZNbHRqSmZkRWdBaHdNRjdUdFFCb0FvTFMv?=
 =?utf-8?B?ekRpM24xNkpxZEg2bEpPYmRWT0FPYUhqd3FlK2F0SHFXTE1lSDM5MFBCTVlH?=
 =?utf-8?B?VnVQeFZrZ1BrRDRady8vRk15S2o0eFpvaHl1dGplN0RxNGpDZXh2QkNmRUw3?=
 =?utf-8?B?bmRhbGNBTlpzcGtvc0p2RUNpaHZVQm9OakN0c00zKy9uZy91RVZIRnJRWTFp?=
 =?utf-8?B?aEFzc09zS0FmM3lMMHpUUTJONDFKMVU4R3g4Qmk5UWNDbXZGLzA3cDBSWXhw?=
 =?utf-8?B?V1lqbFVBRDljMk9QK0tPdmNpclg4TjZ6cjlleXBtd1RpQzdaL1l1MkJQdXFG?=
 =?utf-8?B?SFczdnM1K08xTk5rQmJmbWttcmE1N29XcWpMM216dzlkNFdEL0hqc1RUczJX?=
 =?utf-8?B?SG1LVE1RT3NZMVIxUDZoeFY4eGxJa2EyNVVNU2JZY2FiOWZCUkx5VFNxcisy?=
 =?utf-8?B?UTBTSVl2cmovWUVmV0hUR3gwZm1FTlE1RElkNWxIaytjbmttMFE2NUJCRHJK?=
 =?utf-8?B?YU4vc245UktVc1hQZlpyTVk3b3VIL1IvUG1OSkNuQ0FIb29EK21YLzVURUF5?=
 =?utf-8?B?V3Q2ZTA5cGl5OUVjdE8ycm1QTktqVGMwNUJBWE52SkZXNUFYcHVhZXdxY2Zk?=
 =?utf-8?B?M3dMWlZGNjVxUHBQemFqUW9KZksyVUpvcy9HQWpOTU5TOWxrcyszU2VjQ0lO?=
 =?utf-8?B?SXpBR29kbVEwQm42Mzh5WUt2bndLRW45TTZuYmpMVlpZbzlmK0RvcnozN0Q4?=
 =?utf-8?B?NjRNaVRZTUpaSTk2U2N4ZVVLVHJoM21EOXlXZGNLZ1ZQTTJxdTcxbWhiNU5y?=
 =?utf-8?B?dFhKM3plajNTVGJBdHM2elUrRkpSY2x2Uy9waSs1MEFvV1pObnQ1TjhhbjRF?=
 =?utf-8?B?S21obkJCbTdQOHhMVGZUNm8remk2SkRVTjd1VVkrdHR4TkJmRnVzYldYcnlG?=
 =?utf-8?B?aVc5bGdOWmtTajJLVUwrejJKU3JiQ2N3RDZ5eTR4SmlZS2F2Q3N0cUVhRUpK?=
 =?utf-8?B?Q3BhdW95akdLeCtydHRIdldXTXlwM1BhcW1xT0FnbE9aTHdaUWtGbzFmRUox?=
 =?utf-8?B?VEJIeXJZT1VwRjFpYWdyekhycGxPU1JGNlpWRUFpTUZPWmltTEhHZi9nSHNC?=
 =?utf-8?B?S2pOTitGR1ZqSms5SUxPTktheFovZWV3VHNCeUNwTkFXWjN6MkxlMnZqWFU2?=
 =?utf-8?B?MlZ0M284eDZvWTBPQ3NpUjdMcW9scVgrRHJDWWpxdmt0RHdSVm9leFFodTds?=
 =?utf-8?B?eHhiZEVSa3p4ZTZLeTIxay9NM2lrcS93SXoyUy9BMlEvUGhySmhZaTJwUUJo?=
 =?utf-8?B?cmNNZUJVN3ZzeFlDWmp0aDA5azViU2pSYkJKaFZaUVdzK2VFbkwxalgwMEpz?=
 =?utf-8?B?VGpjZHhON0xHNEcwS3lpYUwwa3phZHlUbDRpMk51UzhmMlhYUTZjVCtqRE9o?=
 =?utf-8?B?blBvdVQyYllVTWd6dGlaeUlOdE9sb05mbDl6ajJCZWxLaERhUHBVZWZjejNP?=
 =?utf-8?B?TkcrRkxlSkpaa3Rnb3NYNXZLTVorbzEzYnR0a3VpM2QzeVFxOEkvV1BoQUJh?=
 =?utf-8?B?MVplZHIydFMreGNVZ1dFeUpyWVdDTzJFYWx2WW84TGM4U2paemxQTXprWmNn?=
 =?utf-8?B?bWtwVkhsSUxZWGgvVHMycEpNM0lFMW0zWGoycU1iZ3BVd2pzaElLWUdJUEVw?=
 =?utf-8?B?Q0V6SVRFZ3JoSzNFeXRiRzZydFdXVDBGVjY4eVZPU1NuRk0zV3ZlK3hJanU5?=
 =?utf-8?Q?G9g+11dZU436/ad9ROHtedbCzXeB98gJnUH4bkkWuU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d027dcc3-cfdf-457c-196c-08d9faeeefc9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 19:17:18.2823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25TlMIKvwjzGh3g8fcU1UQOlSUlrV5+Zmc1u70A9PqWhj4kLy0ZtYYy4OEG/aesE8hZIu57L8B74Jex9bAYXMRLyfLv+CL5CaozaHeIQg0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

On 2/28/2022 07:32, Tvrtko Ursulin wrote:
> On 25/02/2022 19:03, John Harrison wrote:
>> On 2/25/2022 10:29, Tvrtko Ursulin wrote:
>>> On 25/02/2022 18:01, John Harrison wrote:
>>>> On 2/25/2022 09:39, Tvrtko Ursulin wrote:
>>>>> On 25/02/2022 17:11, John Harrison wrote:
>>>>>> On 2/25/2022 08:36, Tvrtko Ursulin wrote:
>>>>>>> On 24/02/2022 20:02, John Harrison wrote:
>>>>>>>> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>>>>>>>>> On 23/02/2022 02:22, John Harrison wrote:
>>>>>>>>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>>>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Compute workloads are inherently not pre-emptible on 
>>>>>>>>>>>> current hardware.
>>>>>>>>>>>> Thus the pre-emption timeout was disabled as a workaround 
>>>>>>>>>>>> to prevent
>>>>>>>>>>>> unwanted resets. Instead, the hang detection was left to 
>>>>>>>>>>>> the heartbeat
>>>>>>>>>>>> and its (longer) timeout. This is undesirable with GuC 
>>>>>>>>>>>> submission as
>>>>>>>>>>>> the heartbeat is a full GT reset rather than a per engine 
>>>>>>>>>>>> reset and so
>>>>>>>>>>>> is much more destructive. Instead, just bump the 
>>>>>>>>>>>> pre-emption timeout
>>>>>>>>>>>
>>>>>>>>>>> Can we have a feature request to allow asking GuC for an 
>>>>>>>>>>> engine reset?
>>>>>>>>>> For what purpose?
>>>>>>>>>
>>>>>>>>> To allow "stopped heartbeat" to reset the engine, however..
>>>>>>>>>
>>>>>>>>>> GuC manages the scheduling of contexts across engines. With 
>>>>>>>>>> virtual engines, the KMD has no knowledge of which engine a 
>>>>>>>>>> context might be executing on. Even without virtual engines, 
>>>>>>>>>> the KMD still has no knowledge of which context is currently 
>>>>>>>>>> executing on any given engine at any given time.
>>>>>>>>>>
>>>>>>>>>> There is a reason why hang detection should be left to the 
>>>>>>>>>> entity that is doing the scheduling. Any other entity is 
>>>>>>>>>> second guessing at best.
>>>>>>>>>>
>>>>>>>>>> The reason for keeping the heartbeat around even when GuC 
>>>>>>>>>> submission is enabled is for the case where the KMD/GuC have 
>>>>>>>>>> got out of sync with either other somehow or GuC itself has 
>>>>>>>>>> just crashed. I.e. when no submission at all is working and 
>>>>>>>>>> we need to reset the GuC itself and start over.
>>>>>>>>>
>>>>>>>>> .. I wasn't really up to speed to know/remember heartbeats are 
>>>>>>>>> nerfed already in GuC mode.
>>>>>>>> Not sure what you mean by that claim. Engine resets are handled 
>>>>>>>> by GuC because GuC handles the scheduling. You can't do the 
>>>>>>>> former if you aren't doing the latter. However, the heartbeat 
>>>>>>>> is still present and is still the watchdog by which engine 
>>>>>>>> resets are triggered. As per the rest of the submission 
>>>>>>>> process, the hang detection and recovery is split between i915 
>>>>>>>> and GuC.
>>>>>>>
>>>>>>> I meant that "stopped heartbeat on engine XXX" can only do a 
>>>>>>> full GPU reset on GuC.
>>>>>> I mean that there is no 'stopped heartbeat on engine XXX' when 
>>>>>> i915 is not handling the recovery part of the process.
>>>>>
>>>>> Hmmmm?
>>>>>
>>>>> static void
>>>>> reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
>>>>> {
>>>>>     if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>>>>>         show_heartbeat(rq, engine);
>>>>>
>>>>>     if (intel_engine_uses_guc(engine))
>>>>>         /*
>>>>>          * GuC itself is toast or GuC's hang detection
>>>>>          * is disabled. Either way, need to find the
>>>>>          * hang culprit manually.
>>>>>          */
>>>>>         intel_guc_find_hung_context(engine);
>>>>>
>>>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>>>                   I915_ERROR_CAPTURE,
>>>>>                   "stopped heartbeat on %s",
>>>>>                   engine->name);
>>>>> }
>>>>>
>>>>> How there is no "stopped hearbeat" in guc mode? From this code it 
>>>>> certainly looks there is.
>>>> Only when the GuC is toast and it is no longer an engine reset but 
>>>> a full GT reset that is required. So technically, it is not a 
>>>> 'stopped heartbeat on engine XXX' it is 'stopped heartbeat on GT#'.
>>>>
>>>>>
>>>>> You say below heartbeats are going in GuC mode. Now I totally 
>>>>> don't understand how they are going but there is allegedly no 
>>>>> "stopped hearbeat".
>>>> Because if GuC is handling the detection and recovery then i915 
>>>> will not reach that point. GuC will do the engine reset and start 
>>>> scheduling the next context before the heartbeat period expires. So 
>>>> the notification will be a G2H about a specific context being reset 
>>>> rather than the i915 notification about a stopped heartbeat.
>>>>
>>>>>
>>>>>>>
>>>>>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>>>>>                   I915_ERROR_CAPTURE,
>>>>>>>                   "stopped heartbeat on %s",
>>>>>>>                   engine->name);
>>>>>>>
>>>>>>> intel_gt_handle_error:
>>>>>>>
>>>>>>>     /*
>>>>>>>      * Try engine reset when available. We fall back to full 
>>>>>>> reset if
>>>>>>>      * single reset fails.
>>>>>>>      */
>>>>>>>     if (!intel_uc_uses_guc_submission(&gt->uc) &&
>>>>>>>         intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>>>>>>>         local_bh_disable();
>>>>>>>         for_each_engine_masked(engine, gt, engine_mask, tmp) {
>>>>>>>
>>>>>>> You said "However, the heartbeat is still present and is still 
>>>>>>> the watchdog by which engine resets are triggered", now I don't 
>>>>>>> know what you meant by this. It actually triggers a single 
>>>>>>> engine reset in GuC mode? Where in code does that happen if this 
>>>>>>> block above shows it not taking the engine reset path?
>>>>>> i915 sends down the per engine pulse.
>>>>>> GuC schedules the pulse
>>>>>> GuC attempts to pre-empt the currently active context
>>>>>> GuC detects the pre-emption timeout
>>>>>> GuC resets the engine
>>>>>>
>>>>>> The fundamental process is exactly the same as in execlist mode. 
>>>>>> It's just that the above blocks of code (calls to 
>>>>>> intel_gt_handle_error and such) are now inside the GuC not i915.
>>>>>>
>>>>>> Without the heartbeat going ping, there would be no context 
>>>>>> switching and thus no pre-emption, no pre-emption timeout and so 
>>>>>> no hang and reset recovery. And GuC cannot sent pulses by itself 
>>>>>> - it has no ability to generate context workloads. So we need 
>>>>>> i915 to send the pings and to gradually raise their priority. But 
>>>>>> the back half of the heartbeat code is now inside the GuC. It 
>>>>>> will simply never reach the i915 side timeout if GuC is doing the 
>>>>>> recovery (unless the heartbeat's final period is too short). We 
>>>>>> should only reach the i915 side timeout if GuC itself is toast. 
>>>>>> At which point we need the full GT reset to recover the GuC.
>>>>>
>>>>> If workload is not preempting and reset does not work, like engine 
>>>>> is truly stuck, does the current code hit "stopped heartbeat" or 
>>>>> not in GuC mode?
>>>> Hang on, where did 'reset does not work' come into this?
>>>>
>>>> If GuC is alive and the hardware is not broken then no, it won't. 
>>>> That's the whole point. GuC does the detection and recovery. The 
>>>> KMD will never reach 'stopped heartbeat'.
>>>>
>>>> If the hardware is broken and the reset does not work then GuC will 
>>>> send a 'failed reset' notification to the KMD. The KMD treats that 
>>>> as a major error and immediately does a full GT reset. So there is 
>>>> still no 'stopped heartbeat'.
>>>>
>>>> If GuC has died (or a KMD bug has caused sufficient confusion to 
>>>> make it think the GuC has died) then yes, you will reach that code. 
>>>> But in that case it is not an engine reset that is required, it is 
>>>> a full GT reset including a reset of the GuC.
>>>
>>> Got it, so what is actually wrong is calling intel_gt_handle_error 
>>> with an engine->mask in GuC mode. 
>>> intel_engine_hearbeat.c/reset_engine should fork into two (in some 
>>> way), depending on backend, so in the case of GuC it can call a 
>>> variant of intel_gt_handle_error which would be explicitly about a 
>>> full GPU reset only, instead of a sprinkle of 
>>> intel_uc_uses_guc_submission in that function. Possibly even off 
>>> load the reset to a single per gt worker, so that if multiple active 
>>> engines trigger the reset roughly simultaneously, there is only one 
>>> full GPU reset. And it gets correctly labeled as "dead GuC" or 
>>> something.
>>>
>> Sure. Feel free to re-write the reset code yet again. That's another 
>> exceedingly fragile area of the driver.
>
>> However, that is unrelated to this patch set.
>
> It's still okay to talk about improving things in my opinion. 
> Especially since I think it is the same issue I raised late 2019 
> during internal review.
>
> And I don't think it is fair to say that I should go and rewrite it, 
> since I do not own the GuC backend area. Especially given the above.
>
> If there is no motivation to improve it now then please at least track 
> this, if it isn't already, in that internal Jira which was tracking 
> all the areas of the GuC backend which could be improved.
>
> I am also pretty sure if the design was cleaner it would have been 
> more obvious to me, or anyone who happens to stumble there, what the 
> purpose of intel_engine_heartbeat.c/reset_engine() is in GuC mode. So 
> we wouldn't have to spend this long explaining things.
My point is that redesigning it to be cleaner is not just a GuC task. It 
means redesigning the entire reset sequence to more compatible with 
externally handled resets. That's a big task. Sure it can be added to 
the todo list but it is totally not in the scope of this patch set.

This is purely about enabling per engine resets again so that end users 
have a better experience when GPU hangs occur. Or at least, don't have a 
greatly worse experience on our newest platforms than they did on all 
the previous ones because we have totally hacked that feature out. And 
actually getting that feature enabled before we ship too many products 
and the maintainers/architects decide we are no longer allowed to turn 
it on because it is now a behaviour change that end users are not 
expecting. So forever more ADL-P/DG2 are stuck on full GT only resets.

John.


>
> Regards,
>
> Tvrtko

