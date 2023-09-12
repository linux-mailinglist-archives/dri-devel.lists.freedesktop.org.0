Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA479CC95
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 11:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8F810E071;
	Tue, 12 Sep 2023 09:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457A210E071
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 09:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8hk5yQLYyp+Befgcht5ZTa+rTI9b55zlg+6CskLbEHNTQA1/7eLwi5jFPel0oQuPA4jBdqjWCGytIOmdbjlROeZJZ6GwhGPes8wu1m1LBNnYKgpuEwt3mT/LnOop9vdJKoKY1g4dnp79z0Bk7o1OB2zrBLPb3FW6dohykpxQDAcDar8q4e5ZtXvA5hycG0l2P9BENRGwMRM15dR1sv+WqwBoUbRvt12seWZmM4a1XqjDD/V7S9qovQCuLPL5acqVGdUYv9Ye6dgHkxyNQFX9s+pGmtdTw7NcIwn/QEjX6CSh540Zi2ca/m3ZUcM+HYn+kjDRlfeIsdooRQaQI+ZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCUZNIZ2q04H61Ft2fIgS75NfRqQmj4K3wzApkca5Dw=;
 b=MjPV5heeAPRMzpsxat2fh9vS2fNOpt/sisc0PmF8keRsEDQYVxTE7Wl2fEWXj8uAut0+YI4iNLqpbLAa4UgvD9fZFr0HxaniAB5648Td61XZB5NiKhfi1Q+WQ5B//TBoBcwx1kwY+PhHuM6GLLbDIZX1w6s+O7T+2q9X0OGEH0PLy4Bi2NiWFAIwp+dD4AL2U0UNufBmotfyF2d+zHZMk76NCHPLRlBlrLbwu52yl4n5cpNOl5W7sP3EZrWxagpiD2gi5NUXIG993sMnSPKYFwAHEr8prZ0KJ0Zm+bUQLiItfNYbi+eZcZKorewuUQy9B+gDv7f9HBkE0+YZJ/4imQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCUZNIZ2q04H61Ft2fIgS75NfRqQmj4K3wzApkca5Dw=;
 b=Nd1DimJvZuR5dgUZs/fQoZvePVxUR3fkZhd6iMiNrhdCD3DIvk4ofhJ5tnGNvlXYtR0EooeYWblg+VXHKgUySM9Fejqj/JksmVw9qTe6AkpLMGD6+rrgitP3pm+5ViyJdKk1EhEnxpYcQJyNEomOmtP9RBd92x6HucaZBs1dIIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7791.namprd12.prod.outlook.com (2603:10b6:510:280::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Tue, 12 Sep
 2023 09:59:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 09:59:21 +0000
Message-ID: <ffa53708-6b09-8e5c-ad97-e0a763b271fc@amd.com>
Date: Tue, 12 Sep 2023 11:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
 <87fs3lf0ht.fsf@intel.com> <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
 <4080bd92-d10e-4cb3-fce4-a76892834baf@amd.com>
 <99ef9f6f-a84b-fa4c-8a33-a214b4b9695c@intel.com>
 <69110ad5-0c6e-ab90-90f6-78a133af183e@amd.com>
 <6f912ee2-4ea1-927b-f1f5-36b4620524bb@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6f912ee2-4ea1-927b-f1f5-36b4620524bb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: d039bfd5-eaf8-40a7-bce4-08dbb376efd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ajk3OhMeZWZPX6Wau4412fhdb1xnICUKAXdhCsq0lvdqmqcs2jwd5gaf6UH9IQvvZZ1KLHYhcHFV5MQXgv0QMwrpZwu68BTjujgDQhkdi/H03UlkZcE7VjEpp0emJxuApIxn3JCXr0Nq10GxrUVNcCH+Ilgw8HW+L2W75Nl4N58vjfsjgiRR56LN0v3tjUA+ewv/XqgqrASbcQHpqK0S2HHkUmicnqoPF5sRJ5gw2OLXT3/G6djlaTjqZ1+HCW8t6bSzlaIJCrgtRBdiHdRrWWldGeMatLFt0f0Rt1qMPWka1LZC51JdWTuaL8snyOsDmmm6ccZiKIx/GgJRa/rtW3X7lIcB+FqkSiKQUrOMd+bC224B0am3eyw70H4q/hyhxegOiT7gkE+2bRJXf31v5X0AZQPFumPr8OMrLPzwfYKYD1Ia4uCvvFABbimCz0n+2PG6IX8OTMhln/9YVyooDKePaw5O8kyme76ZRvv5dtAT0J7FVy9shBBhQwCNveZpeJocvMpJo+iAMwDwbIsYX896eJwYn0ZGWfem2RCR0aRoGYcmXP3Z9HOmiE0JH4l6m/BS1cZr1G4hin5SXRPAFSurZkMBLxm/O3wEVNhYMRYoAvbX1kAfMs3TF7i0XVEA58wkTKH7lcKlRKddmV19OEA0OU8xGwtJprUsUHUU4XOb/2kGr2jUhKwtBn+4Micv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(1800799009)(186009)(451199024)(6486002)(6666004)(6506007)(53546011)(6512007)(966005)(83380400001)(2616005)(66574015)(2906002)(26005)(66556008)(66476007)(66946007)(54906003)(5660300002)(15650500001)(478600001)(4326008)(316002)(8936002)(8676002)(31696002)(86362001)(36756003)(38100700002)(31686004)(41300700001)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVzbmRVYm1mVm5lUGZzQjlJaXFsRjZqckxZa2N0K3NxMCtmb1MyZ1FwaGUr?=
 =?utf-8?B?cmptUnRVMXg1YURCZGJ1cEpzTnV5TWhKcFdtUFdwUExsWWpLdlV2dVpaZlAz?=
 =?utf-8?B?S1IvemVyM1lvWnU5TEo5WjBtSmxkaHRmRE9xeHV2U0IrTkF0UkMrandDcmFu?=
 =?utf-8?B?OXVSYllWUnB3b2JvTHBuTUpXWHByZ1NhVEVwVEYxOGlLSGcwQy9SVy8zc3Ur?=
 =?utf-8?B?SE5ZL3kzOEc2ejlVQXFzb0RSR0gxcjBQUzQzUXAxemtiQm1JdVEwQUVETzBS?=
 =?utf-8?B?YlBlUzVRaVVTSW1NR2ZLY1NUYmtpMk5RNUJuYjBIR0NLTkpScG1oalNsOVlX?=
 =?utf-8?B?N3FSUVcrKzlvU1RxZHBTcUpXeHBIdDI1WndmODZQcEFtdnFJVkhTNDdEc2F5?=
 =?utf-8?B?cHBBZUZZL3NEczY5Mm85aTI4Z1h5WHlrRksyc0R6b1BzOVFOTElRb2NIblhV?=
 =?utf-8?B?TnJQTDB3bFcwVW9HeHVRNzBaSTBQejh6b3JsUjRsQ0VDSS9GSTU1QjhVUmNz?=
 =?utf-8?B?MjlueVF1eGhNcDdxQjhnVTV0Q0NYNzBVWnhPc0c4aFBIVWl2OUxHTGFWSnBD?=
 =?utf-8?B?aWZrTkVEYk9GZGo1bXFJajF2WlRKNE1YRkdsOUFuRnNYcllVbGFzcy9KcmhU?=
 =?utf-8?B?emp2S05oMFlVR1MzRVgwOEFYam9ESWM4blo2K3ptZ3ZaUVNOTWhva3RiVlZB?=
 =?utf-8?B?TktDS0YwTGU0Z0RFRUxoUGNVSXVqVVM5eGppZWtnS3IwODNlSTNDeHExLzkz?=
 =?utf-8?B?bmcxaW9KL0QwRXRkYzN2UmpZQTljbklic2J3ZTJxbzhmK0xLMzh6MDNra0Ev?=
 =?utf-8?B?SFhYTU9aTVhHRTVuZ00rdWVTR3FMRklOcEVTaXVmdXFWZzZZcFJ6TG1RWjlt?=
 =?utf-8?B?UFBxR1Btakp4RUh0R2F5MWZpK0NWNy9SRDIrcHlXN3U5R2FrUVBYcFVvVlFC?=
 =?utf-8?B?V3VIbzNNR3Y1aHpuVjlEL2ZXYXQ5L3J1WUxCd1p6MWF1TFJmOVdYT24zY3J2?=
 =?utf-8?B?ejN4Z1lWNGJZTHNlQW1lSmtTWWJxRzJNYzJCYmU5WWkwbzRSdllrV2RMeVI4?=
 =?utf-8?B?M2VDU3ptRGlIRk9zLzY4RExJNG1Bem9nd2orTDNFSmxLL2kxazZiV3B3NWRL?=
 =?utf-8?B?ejVCSTV0dWJMRHN0aVRnMjdPdi8yckRVb0F4Q2I3QVpVSzhzcE1ZMkFBeGk1?=
 =?utf-8?B?Tysra0VBZHdDa3pOL0t1OGk5b3kwUXpOeTVyLzZON1M5cGtHa0s1RkRKYTc4?=
 =?utf-8?B?N09MUkdJZWtjNzRTQmU2U0FuWWVBemxveTF6elhXTmdjRHlEcXV6b282dStK?=
 =?utf-8?B?eXpKaTNlbzVnYVR4WHJkR00xNlJ6QThVRU8wY2I1Z2lPdGNuaFJ4WmhiLzBk?=
 =?utf-8?B?aFhMSnZtUGdCN2E4cVV1N29UZWJQSlBnUjZBSlMzVUZ6c1lmSll1aXpOUFpl?=
 =?utf-8?B?STNsR3ZKSkdWd01KdFhKWGVyOHNRUTVjUGl1Rko2c1ZaMm9CclhzUEFyZFVU?=
 =?utf-8?B?UWV6ZDZ5b3BySk5Ock11L1Y0VTI2cjQ1UWdRS2NtLyszRWgvQ2N6Y2NEZ1B1?=
 =?utf-8?B?QTZncjdyaDVPRnhzbUVuWWxDNmlBM1FuelV0TU0xYzBPTXpldmJadVQydDM4?=
 =?utf-8?B?Q05mbTk2NGlRYUExLytIVW9JNXVIbGFMbjVCREdRTjkyRnFhOHJhNkhMUyt6?=
 =?utf-8?B?SmJBL1NpS1JjWGxmMmp5dHVYVHJzNnVSZytLcFBXdi9nMnRVMkZDYWYrdHY2?=
 =?utf-8?B?YUlXdUxQV3MyVzZTYmNFZWx3UUVLSENIaTUycGVoTzQ5R25rZnFta2xpdWhE?=
 =?utf-8?B?UlVWakU4Sm0yaDA2V2o1algvN1RBTEZ6UkZGWG4yZk9kNDI2WHVuRFkxYlR4?=
 =?utf-8?B?cFY0WDhRMWJwTThCc3hMdC95azBGMTR3cmVUWHQ3NlRJZUxWY1VISEZoMWR4?=
 =?utf-8?B?TzA5ejdXRnVZZ0RGN3Bkam5tVEpZVHNaYllxeEZmR3NZelFpR0J6U3VQK1dS?=
 =?utf-8?B?VDhUUE16VXZrZlJFOGFHOGg2T2wvM2pTV01PZHRwRlNKRGFDUWNmZVlraEdz?=
 =?utf-8?B?czRodktMNW5HVU1kQTFiVElhb0s4Q1gram9VdUJSb1lhWlVHODUzaTlSU0lD?=
 =?utf-8?Q?L9ufmMMi/lfbFcV+2XbZ8xkkg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d039bfd5-eaf8-40a7-bce4-08dbb376efd9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 09:59:21.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /K9WBYCjCTy9wJ74QYqQNAcXiHX1YQb6+OVWE5+jGa52PtEu1ZypnIKPd+tzf3Il
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7791
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
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.09.23 um 11:51 schrieb Karolina Stolarek:
> On 11.09.2023 15:42, Christian König wrote:
>>
>>
>> Am 11.09.23 um 15:33 schrieb Karolina Stolarek:
>>> On 11.09.2023 15:12, Christian König wrote:
>>>> Am 11.09.23 um 13:47 schrieb Karolina Stolarek:
>>>>> On 11.09.2023 12:49, Jani Nikula wrote:
>>>>>> On Mon, 11 Sep 2023, Karolina Stolarek 
>>>>>> <karolina.stolarek@intel.com> wrote:
>>>>>>> Update Makefile so it can produce a module that consists of TTM 
>>>>>>> tests.
>>>>>>> This will allow us to test non-exported functions when KUnit tests
>>>>>>> are built as a module. Remove the tests' Makefile.
>>>>>>
>>>>>> I'm asking questions instead of making assertions, because I'm 
>>>>>> not 100%
>>>>>> confident, but I don't feel like this Makefile could work right.
>>>>>
>>>>> Questions, assertions and comments are fine, I'm glad you're 
>>>>> taking a look at the patch :) I'm not 100% confident either, so I 
>>>>> welcome suggestions on how to improve it.
>>>>>
>>>>> The problem is that TTM tests try to test symbols that are not 
>>>>> exported, so I have to compile all the files together into one 
>>>>> module if I choose to build KUnit tests as a module. The other 
>>>>> option that I'm considering is to make the tests are builtin only. 
>>>>> I'm tempted to go with it (for the sake of simplicity), but I'm 
>>>>> trying to get the module option to work first.
>>>>
>>>> I have to admit that this looks pretty awkward, but I'm not an 
>>>> expert on the Linux build system in the first place.
>>>
>>> Neither am I, and it shows :)
>>>
>>>> Would it be an option to build the unit tests into the standard 
>>>> ttm.ko module and let them run whenever that module loads?
>>>
>>> You mean appending the list of tests to ttm-y, depending on 
>>> $(CONFIG_DRM_TTM_KUNIT_TEST)?
>>
>> Yes.
>>
>>> I _think_ I tried something similar, and couldn't get it to work, 
>>> got a bunch of "twice exported" warnings.
>>
>> You might need to adjust module_init, and things like MODULE_VERSION 
>> etc..., but I would give it a try.
>
> I just learnt about the existence of EXPORT_SYMBOL_FOR_TESTS_ONLY() 
> macro. It's defined as a part of drm_util.h and used by DRM selftests. 
> Thankfully, the TTM KUnit KConfig already selects 
> CONFIG_DRM_EXPORT_FOR_TESTS, so we could use that macro (almost) for 
> free. Only 2-3 line additions to ttm_tt and ttm_resource files, no 
> significant changes to the Makefile.
>
> What do you think?

Perfect, that's exactly what's needed here.

Thanks,
Christian.

>
> Many thanks,
> Karolina
>
>>
>> Thanks for looking into this,
>> Christian.
>>
>>>
>>>> On the other hand if this solution here works, why not?
>>>
>>> Because it's complicated and, well, awkward. I'm still thinking 
>>> about a use case where we would prefer to have KUnit tests defined 
>>> as a module. IIRC, in CI we enable KUnit tests as bultins and run 
>>> them during the boot. kunit.py helper also defines the tests as 
>>> builtins.
>>>
>>> All the best,
>>> Karolina
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>> Closes: 
>>>>>>> https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
>>>>>>> Closes: 
>>>>>>> https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
>>>>>>> Closes: 
>>>>>>> https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>>>>>>>   drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>>>>>>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>>>>>>   delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>>>>>> b/drivers/gpu/drm/ttm/Makefile
>>>>>>> index dad298127226..6322a33e65ed 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/Makefile
>>>>>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>>>>>> @@ -2,10 +2,18 @@
>>>>>>>   #
>>>>>>>   # Makefile for the drm device driver.  This driver provides 
>>>>>>> support for the
>>>>>>>   -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o 
>>>>>>> ttm_module.o \
>>>>>>> -    ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>>>>> ttm_pool.o \
>>>>>>> -    ttm_device.o ttm_sys_manager.o
>>>>>>> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>>>>>>> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o 
>>>>>>> ttm_pool.o \
>>>>>>> +       ttm_device.o ttm_sys_manager.o
>>>>>>> +obj-$(CONFIG_DRM_TTM) += $(ttm)
>>>>>>
>>>>>> Does that not lead to each object in $(ttm) becoming its own module?
>>>>>
>>>>> Huh, yes, that is what would happen here. Not good...
>>>>>
>>>>>>
>>>>>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>>>>
>>>>>> Does this not create a ttm.o with just one object, depending on
>>>>>> CONFIG_AGP?
>>>>>
>>>>> I just left it as it was before my changes.
>>>>>
>>>>>>
>>>>>>>   -obj-$(CONFIG_DRM_TTM) += ttm.o
>>>>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>>>>>> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
>>>>>>> +             tests/ttm_pool_test.o
>>>>>>
>>>>>> I'd preserve the one object per line syntax. It's nicer for the 
>>>>>> diffs in
>>>>>> subsequent updates.
>>>>>
>>>>> OK, will update it in the next version (if such comes). I just 
>>>>> followed the style of "ttm-y".
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
>>>>>>> +    ttm-test-objs := $(ttm) $(ttm-tests)
>>>>>>
>>>>>> Isn't the -objs syntax for host/userspace programs? And if not, 
>>>>>> doesn't
>>>>>> it lead to objects with exported symbols being present in two 
>>>>>> places?
>>>>>
>>>>> I saw it in use in other Makefiles, so I followed it. As for the 
>>>>> exported symbols, I tested both builtin and module configs, and it 
>>>>> was fine, but it's possible I missed something. I suspect that the 
>>>>> variables are first expanded, and then processed by the Makefile.
>>>>>
>>>>> Many thanks,
>>>>> Karolina
>>>>>
>>>>>>
>>>>>> Confused.
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>>>
>>>>>>> +    obj-m := ttm-test.o
>>>>>>> +else
>>>>>>> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
>>>>>>> +endif
>>>>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>>>>> deleted file mode 100644
>>>>>>> index ec87c4fc1ad5..000000000000
>>>>>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>>>>>> +++ /dev/null
>>>>>>> @@ -1,6 +0,0 @@
>>>>>>> -# SPDX-License-Identifier: GPL-2.0 AND MIT
>>>>>>> -
>>>>>>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>>>>> -        ttm_device_test.o \
>>>>>>> -        ttm_pool_test.o \
>>>>>>> -        ttm_kunit_helpers.o
>>>>>>
>>>>
>>

