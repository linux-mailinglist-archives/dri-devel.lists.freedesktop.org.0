Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915A79A6DF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5357110E215;
	Mon, 11 Sep 2023 09:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55410E192
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694425634; x=1725961634;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ob2YAnsNaLHhXeZ5NEr2n8wOD+anHsaJDL5rPOpTyic=;
 b=GpJn67YRYFsQhp58aQwjGdfBqvExPwMronOziV0a9+fqtv0Hc28Wu4aS
 Atqu+9doySn16SNAzkglyQlLG30cuaPlAzKm9JAgEjw+ORsPcqK7k/7oN
 Oh6xAkXh/oVzhuHDKdo9BwU/5OSXpjXCkjB6owwjNnGJ86p0ZaE+C5spK
 CD8uiSMg5xDC5ZrqhdYj354VXBV2EhmQjnMEKxnUJUoJQEwxOJdtiYwfB
 nLdwnmsjdH2OwK5CBdHhVHdRBrkXogNlR9D4Il015JOru9h3X036bAIKL
 y0wzCfA29+P/v1yHd4aNunlIOLi4Wlp+o9pggozvIa68+Kk1WLoNO2t7r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368281141"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="368281141"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 02:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="813303608"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="813303608"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 02:47:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 02:47:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 02:47:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 02:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neNg4yY6xGszP7i7wHFZsUBvFGiF/Mc8J2oEs0t6YPi0f/toNnNp+wIVxiRaqRGZ3obdLCglxCxTFQsODLAs3fSGZhS2K3MuyRbBKMtBf4+pMKIc0d+SNFKNCEU+KVDlqkHAd76gYMQCkvm1rxTL9GRsU3Az//Nt46ge/PzaiZhFtZR4uo6iyi02CE1/n/3hkTG8pb942VR/HAhH7OAKWZMIoLt6W6VpH8BlsXbyNikYkd7OU2RxP98qpBTRgb0xV5jEFuxuE7u6YElrAHcSwF+MzYU4VaaALJG0w5Cze3ef4u492i+W4xv+AkzGOg3TV1PauE4WyY5UDxcjNjzRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e4Drg5HJGSEyHxsUMpZiKOvt+Ko+oAxCeBoE8Ak1Xw=;
 b=kOFDWnG3Avfgs24baKziYhKNrZ3gl5sUxfr/b0V8ce2HJQXF/Xji//FauYx8+Wpl49rKLJyngMpf5nlQMjg2QAZmv5So3fYk0gT3LZiuRPo2maV6ZiZqp3JAi8n4RkrUfEWK+UFHo58WCfptzieXiFR5io/UsXU+SX8q0UWD90em8KR5yTaZvYdOqi07MT9BHtYrJ//6dgK559Bf4QTrZ+Q245921M1niwq1X1iK7+dBPnLmNznd8208XFgMkwJswJnz77vGS2Vd8/LgdpK+ptDqoG5EdDl3qpc6B6AIwihpdAmcQN6ClCJBItKQcin5CV0yHfqDvc5mxfLrQ2QSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Mon, 11 Sep
 2023 09:47:10 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 09:47:10 +0000
Message-ID: <e6940482-5d58-e792-4cf0-dd6954277cbf@intel.com>
Date: Mon, 11 Sep 2023 11:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo functions
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
References: <d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek@intel.com>
 <202309011935.bBpezbUQ-lkp@intel.com>
 <41345404-3440-00cc-745a-d2977b406c64@intel.com>
 <e1061b33-65ba-4049-871c-4e2b4d23177c@amd.com>
 <443e34f4-3554-e981-f11f-fc4bc459b046@intel.com>
 <97b1ab0f-9080-b009-be10-b098506fae28@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <97b1ab0f-9080-b009-be10-b098506fae28@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fce3196-fb1c-4ffb-1572-08dbb2ac1129
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2CDvExZrjNmsXDKAqEyzex3WlYRQk75oKrcI+MKwkzZEk+iX80if73BUilc3/NchJf0Cs+KAORzOy8rNONOabVx4mJRkBlt/YZbCX30PEWzeH/2iMRa0Mk/w1FYFOPwwfUkLTaKedFzRfl430RgtgOUJhLvMFaR2QTdgV986Ab716TpYpc3wESKVlA/cMnz5Lx/arBP6iKDvUwV7k2fCbl2idCaqAA4LVogYN2dfVVMQrM8pTlF8H+guhTzLt+lPaLMZIrmdB20CjMWmD1Q1twjBx2OVLxm1asqzjIb6TUGolZPUkwbWOS8uXH1Ap5u8qeSRk3Vuml9omMHP7anadFXMf8xKIKCUcM/P2zBFSnUCGrYtwK9xMoY1P5OaUr35m8PjLgykYTiLqZ38H3mxL7HRqAPCa3fvYiNUHtpnSYLGC5U5NFsbUrtoQUdfR5aolKOnex7b5bNwJKHBB/4BgmSPSu8LDrwgzPTuhs9W6htVXXZJu3kGfB30OrbEdmZd8fzlm7DWpa/fDC5g6O5LvzMHKR/jD3h0h5p6+mdiCZ9TLlh4OOK0VccxXg1eL42KeMXUnKiCkWyzk1ZSd8xXIFbcYRCCaFmnKejW3TeuxlFxL02n5h6NxGbO5Q/qB8pTEI74QizOWAs4F5w5CpPxiYreOcBmFboZ5WQkl9xsZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(186009)(451199024)(1800799009)(86362001)(5660300002)(44832011)(2906002)(4326008)(8676002)(8936002)(31696002)(30864003)(36756003)(83380400001)(6666004)(478600001)(66574015)(36916002)(6506007)(82960400001)(6486002)(966005)(53546011)(31686004)(2616005)(26005)(66556008)(66476007)(6636002)(66946007)(316002)(41300700001)(110136005)(6512007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2k4ODhsQ1dzNTdDWkN6TXQ5SGEyM3lTblZJd0pXbHcyWHJJUWZYTkM3azZ4?=
 =?utf-8?B?WG01RGFra1o2dDVqdUdVMmt2ZVN3dVc4T2pWcEtlQnU4dlRlNXlrcXVYaG5a?=
 =?utf-8?B?MWZDMG15MHcydkMva3NUUHRLSlZTaW4vYkEwWVErdExlUVp1TnZNVkFtUmt6?=
 =?utf-8?B?RUs1ajZjOUdWb05jVnZ4bjdvOXVMSDNIMjY5YUtqa3dodUFTdjlFdyt4UnZz?=
 =?utf-8?B?L1dVQk1CYWYzSHFGcHhDNjBSVy9TdjFHRWk3dkN4SFY3Q1ByMkxwRmgyNFA3?=
 =?utf-8?B?K1hnRTk1c3h2VFVYaVdQckN5MVptbHBIVnlnYjF2TWdXNXBNdFgrazhEOXll?=
 =?utf-8?B?cjQvbFB2NFdUMXFQZ0hDUCtZT2JHSjhOQWxUaFFlWjFaTGN5cXNZVWlWZ3Jz?=
 =?utf-8?B?aVJUaVFhZEJ3MEczRHhRcGVXZWtMbGsweElobm02akZwejEra2N2SFNlUy9Q?=
 =?utf-8?B?VmN6anM3cmY0Mjd5MU5Ka0Q5emEyYUI4MXh1aFRndURPb282S2JUMGNtN3Y4?=
 =?utf-8?B?Y3d1MktzOVU1TmN1cU8rdm1kOTBwTkpUaEE3c1cxQmR3VmFXRytCRkRBMVFY?=
 =?utf-8?B?MS9Gcnd2ajF0NjVqZmt4VENTL0xOL1JGS3BteUg3azZRK0lZemtLSU1qSXEz?=
 =?utf-8?B?bHNPQjFEQjZOVEZabkRjaTdHYXJZcGQvTU05aWtWRjYzRlc3SnZLR3ZDMkhS?=
 =?utf-8?B?VUNkUDl3a3BzVmM3dXRlMG1Fd09WN1lROGNrYnluaFpLT1VJaCs1cUx3emtZ?=
 =?utf-8?B?Vk43K3VzVjcyZjdpRzVCSTBBWGI3a2NrekRBOThUMlByZ1RFYzdTak50ZFlB?=
 =?utf-8?B?UWg3c01PZE1XMDlUZmswNjM5ZTVSTUhLQlYzK2lDL0VveWpLakpZMUJPQVRO?=
 =?utf-8?B?UzZKOWMxYVNlS0h0bkxJdmthZVYrc2FCR0pCYjZlYmlkaGdNeVRLR2dqWWlr?=
 =?utf-8?B?RG1XRXgwWUFKQ2JGNndpUFBMTng2UHNRSUdMZzIxNHVTdHlOanhiM0lmWisv?=
 =?utf-8?B?Sk5wbHZZSHVnSnRDaTlRKzN4VUtLb3NJdDd3YzlOUzdMU0xmVHIrVVFDdjI0?=
 =?utf-8?B?RFRDY3FadUNsaXU0K2tKV3pzNGljUDdWYWVUNlU0N1V5UG1UQzNMYTZ0QStB?=
 =?utf-8?B?OEhObDFpNVFlRmVvYTJBb3l3d1QyVTUyZFZ0ZVRucHBhUnRNY3NnTWhwbmFE?=
 =?utf-8?B?Sy92MDVlWndRZ3VDUUlrYXk2cjlXbnJqOGJCWlp5VGZKRGI0K2NFYjdHTW80?=
 =?utf-8?B?aThYZ05DVUVpY3pCcFVzNVV6cW1FWGhhQUFqdFdMOE0raEg5V3ZSWFNTdGxS?=
 =?utf-8?B?V0cyOExmTy92Mit2ZlVBV1hZV1RJVkt0T2N4MnR5UlhGY3RoeGNuU1RUOVZa?=
 =?utf-8?B?L2NyUkRmaGFobEZES25BQnlCMU16QUhjNm0xMGdkRGU5MUNkRHJJTXV4UHZk?=
 =?utf-8?B?VXhsV1hnbXhCRzAyNHUwOEpzOGsybFg4WnRoeFBBK2hsQlFGSDBPeEhVZ2pK?=
 =?utf-8?B?QkJaSDRKbzc2ZXVNTllTYVFZQjdtY0Q5c3MxamxPemdPR1R6OENUMHN2cFRS?=
 =?utf-8?B?MkVJZFhHandBeTgxRVFEYlpMcDYrcU5Tckl6YzZwdFpKVVhVQWE0Y3NRNU1j?=
 =?utf-8?B?S2RyclNGZGluZEpjZDNjdGxvNGQrbXJnMUdCcEM1MXJ1WVYrUGpNVTdUdTU2?=
 =?utf-8?B?T2M2Tjk5V3U4Uk5SNWpVWi9Lc1IyRmlsczFtNm50cHEwT09VYVo5Vko2YkNO?=
 =?utf-8?B?RTNTaDhsMVd2Tlh3VG9HZ1FsRlovTStnMFpzbWtEYnZzU3UrejU4emR1MllH?=
 =?utf-8?B?QlB0bm9ZWWlQbDdhaTc4UUhaMjVnU1h3U0hEemhLd3VuOVkrMm1XSmJFNDVZ?=
 =?utf-8?B?b0FFZ1pUZzVOdHpzbUFjMGE1TTJma1FsR3pRTThXR1pRR3h3OEliY3B3cHhF?=
 =?utf-8?B?T1BLSmphZFl0YWx4SXlOdUp5RXZMY2pmcDFUK3RaMXlmSStzVWozQ2V0dk9l?=
 =?utf-8?B?d0xYQ3Q1bkd0NGxhZkdXUnJ4anFPa2tEeGQyYzQ5Y0s3cjAvOWJPK1JjdUtu?=
 =?utf-8?B?NFY4R3g3U1YwSlFaRWhwUXd4c2pyMkJXTWtydVE4Z3NoVXRUdklibjRreDYv?=
 =?utf-8?B?cnJxQzhad2lZWFJMZDJXNDg0U0llMHkyMUhuK1JoZkNqemxBMkkyWEtCbkVj?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fce3196-fb1c-4ffb-1572-08dbb2ac1129
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:47:09.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP9HexLnzf8Tdfs/uwspIdutvKLQKYk0O3H30D48u8StD1iBbRVTZdELPg7NiWf93YyXZqo5s/Y6E1/J6Vca9Nk+5fyfzKVrAX8GUb+1SJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
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
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1.09.2023 15:50, Christian König wrote:
> Am 01.09.23 um 15:30 schrieb Karolina Stolarek:
>> On 1.09.2023 15:19, Christian König wrote:
>>> Am 01.09.23 um 14:37 schrieb Karolina Stolarek:
>>>> On 1.09.2023 14:04, kernel test robot wrote:
>>>>> Hi Karolina,
>>>>>
>>>>> kernel test robot noticed the following build errors:
>>>>
>>>> It's a problem of building TTM KUnit tests as a module, the issue is 
>>>> not tied to a specific arch -- the subtests use unexported 
>>>> definitions. While it would be possible to add EXPORT_SYMBOL to the 
>>>> TTM functions, we don't want to do it with do_send_sig_info.
>>>>
>>>> Christian, two questions here:
>>>>
>>>> 1) Shall we export ttm_resource_alloc, ttm_tt_create and 
>>>> ttm_tt_destroy? Or is there a reason why they are "hidden"?
>>>
>>> Yeah, those are not supposed to be touched by drivers directly.
>>
>> Right, makes sense
> 
> If you can't find a cleaner way exporting them conditionally on 
> CONFIG_DRM_TTM_KUNIT_TEST might be a way to go.

In the end, I hacked TTM's Makefile to switch on 
CONFIG_DRM_TTM_KUNIT_TEST=m. I'm not sure if it's a clean approach, but 
thanks to that change I don't need to modify core TTM files. The only 
ifdef I had to add was the one for ttm_bo_reserve_interrupted subtest, 
but I think that's an acceptable compromise. Let's hope the kernel test 
bot agrees :)

Will send the series soon. I'm still sorting things out after coming 
from a sick leave.

All the best,
Karolina

> 
>>
>>>
>>>>
>>>> 2) If we decide to keep ttm_bo_reserve_interrupted subtest as it is, 
>>>> should I make CONFIG_DRM_TTM_KUNIT_TEST a boolean, instead of a 
>>>> tristate? DRM KUnit tests are tristate, but I think they don't use 
>>>> non-exported functions.
>>>
>>> Another option would be to build them together with TTM into one 
>>> module, but I'm not sure if the KUNIT tests can do this.
>>
>> While I can imagine doing it with TTM, I'm not so sure about coupling 
>> it with signal.o. Still, I'll take a look.
> 
> I have a high level understanding what you are trying to to, but that is 
> absolutely not my field of expertise :)
> 
> Regards,
> Christian.
> 
>>
>> All the best,
>> Karolina
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Many thanks,
>>>> Karolina
>>>>
>>>>>
>>>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>>>> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next 
>>>>> drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230831]
>>>>> [cannot apply to drm-intel/for-linux-next-fixes v6.5]
>>>>> [If your patch is applied to the wrong git tree, kindly drop us a 
>>>>> note.
>>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>>
>>>>> url: 
>>>>> https://github.com/intel-lab-lkp/linux/commits/Karolina-Stolarek/drm-ttm-tests-Add-tests-for-ttm_resource-and-ttm_sys_man/20230831-185954
>>>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>>>> patch link: 
>>>>> https://lore.kernel.org/r/d914169aee773ee20c0b730b38d42a1fd7613bb6.1693479161.git.karolina.stolarek%40intel.com
>>>>> patch subject: [PATCH 3/3] drm/ttm/tests: Add tests for ttm_bo 
>>>>> functions
>>>>> config: openrisc-allmodconfig 
>>>>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/config)
>>>>> compiler: or1k-linux-gcc (GCC) 13.2.0
>>>>> reproduce (this is a W=1 build): 
>>>>> (https://download.01.org/0day-ci/archive/20230901/202309011935.bBpezbUQ-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a 
>>>>> new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes: 
>>>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>>>
>>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>>
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_wlc.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_fo.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_ovf.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_lblc.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_lblcr.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_dh.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_sh.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_sed.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_nq.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_twos.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_ftp.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/netfilter/ipvs/ip_vs_pe_sip.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv4/netfilter/nf_defrag_ipv4.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv4/netfilter/nf_reject_ipv4.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv4/netfilter/iptable_nat.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv4/netfilter/iptable_raw.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv4/udp_tunnel.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv4/xfrm4_tunnel.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/unix/unix_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv6/netfilter/ip6table_raw.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv6/netfilter/ip6table_nat.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv6/netfilter/nf_defrag_ipv6.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv6/netfilter/nf_reject_ipv6.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv6/xfrm6_tunnel.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ipv6/ip6_udp_tunnel.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_hellcreek.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_lan9303.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_ocelot_8021q.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_rzn1_a5psw.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_sja1105.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_trailer.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/dsa/tag_xrs700x.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/xdp/xsk_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/mptcp/mptcp_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/mptcp/mptcp_crypto_test.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/mptcp/mptcp_token_test.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/packet/af_packet.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/packet/af_packet_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/bridge/netfilter/nf_conntrack_bridge.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/bridge/netfilter/ebtables.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/bridge/netfilter/ebtable_broute.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/bridge/netfilter/ebtable_filter.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/bridge/netfilter/ebtable_nat.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/sunrpc/auth_gss/auth_rpcgss.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/sunrpc/auth_gss/rpcsec_gss_krb5.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/kcm/kcm.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/tipc/diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/caif/caif_socket.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/6lowpan/6lowpan.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ieee802154/6lowpan/ieee802154_6lowpan.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/ieee802154/ieee802154_socket.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/nfc/nci/nci_spi.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/nfc/nfc_digital.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>>>>> net/vmw_vsock/vsock_diag.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
>>>>> ERROR: modpost: "ttm_resource_alloc" 
>>>>> [drivers/gpu/drm/ttm/tests/ttm_resource_test.ko] undefined!
>>>>> ERROR: modpost: "ttm_tt_create" 
>>>>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>>>> ERROR: modpost: "ttm_tt_destroy" 
>>>>> [drivers/gpu/drm/ttm/tests/ttm_tt_test.ko] undefined!
>>>>>>> ERROR: modpost: "ttm_resource_alloc" 
>>>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>>>> ERROR: modpost: "ttm_tt_create" 
>>>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>>>> ERROR: modpost: "do_send_sig_info" 
>>>>>>> [drivers/gpu/drm/ttm/tests/ttm_bo_test.ko] undefined!
>>>>>
>>>
> 
