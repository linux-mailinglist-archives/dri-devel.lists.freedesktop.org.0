Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A4800BA2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 14:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524410E85A;
	Fri,  1 Dec 2023 13:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFCD10E85A;
 Fri,  1 Dec 2023 13:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEzBCfhKpHTkPnvxczXiv7rpejnuVwxNOHlAKPSJycAIbQ/6RpoI/32qqgYDLd9kDje0dms3EN3jN4O60ScZj3s7XcPxIfahyfsF+D2RptBh9oVFvWa9j8K+YOPjtS9QZTNbh56QjShrdfHFtIsLWRfP14aTDj2BvOayjob9zPbU04Wq1Y+wG1vPsKLR/H8avQhJ9opLrwxoM0tNnn2keqAuKIgk7U2FFBKE3dX+otQm/VJEUDLpSOGUAfVEzAV5zP9eEkuwuPpRvEYQFnL1ummoDI+4UQWuUwfRUso5DAMb5yUfgKM32D1KfslOS7AGCEC6E/98IqG8xER6DKM9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyK+23mPD966rc/lX5pbMpYRNQAL9jFuwGC2WOxY7eo=;
 b=bQgxzSQF2NwKjrKh5e+esdkJlth6Cgri8c6QtsIUjph1EZwxU38zbC8dR87VcuN8GAV0K3Z4FQ2KrrMb/9DldaaMkA1m5jH0JL5k0Nvil2Rl+fHEJTb7I0qZQh/cunhr87GmQ/NH/bAZJbZS6pTadXDqEhc902+gn3DwfCDrHxv5ybbEeEmBNG7wQP32QWGvNq9TSCHFL9tX/1DSu5cvYLGcRsIRcuA5QYluaBtPUTeeWADVIJPj4G9v4UW8oBH61PDmTwaoD2DSiNIgwdfJL6DjK2wNLuJLVmXvDyIuk001JJn5eEI8jBIqiT9/stEaZXUS2Lkwz1bONnPnStmOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyK+23mPD966rc/lX5pbMpYRNQAL9jFuwGC2WOxY7eo=;
 b=BOzLvoBQuFr6UzilQKXn3bBTTPNjEas74IVeIY88DRG286WhuiUAMmdl6b6wjpPzercNspDjeh8NuTv9G99OTmdt1wojzobjGjt0cSDtiQr4DdZrUGHoTOVuLQe1pi/Szufq5sFtuEekv1nCwAXmX7gg8hc/W0HaGxcEaGNM3Es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 13:16:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.028; Fri, 1 Dec 2023
 13:16:40 +0000
Content-Type: multipart/alternative;
 boundary="------------dgLeyw0jf57U0fDoB74PxMLW"
Message-ID: <6d6a9084-c385-4df0-848b-2425c306b32e@amd.com>
Date: Fri, 1 Dec 2023 14:16:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, zhuweixi <weixi.zhu@huawei.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <56ec69e0-fee1-4edf-8839-62ba6a2f0183@amd.com>
 <SA1PR11MB69918A97B03BC578CFD15EBA9283A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <65c01257-b96d-4365-a86a-4d0758a8ec65@gmail.com>
 <cee6e5ba46f84557b0cd9122eaa8ae17@huawei.com>
 <SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f45c8d4-71c3-4857-6ad7-08dbf26fc113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ae8TmmiyvXjcV6B9KsDaybUgf5w962Ypf3kmG18DKcSeln5FkXh3kaiuATuPnhVYUn/hmb7ujCopUiPX56I3x91ZRZThBYM/bhdDoa/uU/OLXuyONbtP6P+ZdCzuaCHTqvSqsQdwBGjkBmN5B59xjbFOLbLCl7pwnaWc1eqcDb+1EjS63FRfodtybY1283SMBy6wkAf3p/aMn+zZxv0KDFYteHy+NEjgtHSpApFscFB1zcq0kTF0hevzhScT9qygY9msM263iYO4mVrcWGSihyMjSIl2aa37VazMzGWvpAW1LntoLmuzXbX/tkVWlWS+nA2CoZ4umWVHceQvQ6PE1fMStC24sTK3SbWZ0xIXz/mZzaOfp5pR+sKIWqBF9XzVw8ui7Vz5qXMN3KcKR+RM6/hpz/3et7e1rbcSzhgQZJcMf4Hvz1H4e4xXZiD9IEUytqK2pKA/lBEPrvko4Wz+id/G62f/9FPXyWF/IFPz/G4w4juuWITtr1zpVK9SHQ3f5tcPHTwhguai0fySE9+AyTc9ADYw/MSvaQ1sZaZstQUIHBeY3P2Kf2pyAb48FlOs/GE1x5lXZzH0YsEpZZf6VCwoXjzskXNjK8sPQnSdGl/DW6cm2A8TTok2iVMeUJ2ETVz73OPZ1BUOJCFFILElc0qYRHxu463FFvsS8GaE69JGS1vOKQFw0FLYm5BW71c+qSTvmgKZ1V+jAox2xSRKvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66899024)(31686004)(921008)(86362001)(83380400001)(66476007)(166002)(66946007)(38100700002)(36756003)(31696002)(54906003)(26005)(6506007)(66574015)(2616005)(6512007)(6666004)(33964004)(53546011)(110136005)(966005)(2906002)(316002)(66556008)(45080400002)(4326008)(5660300002)(8936002)(30864003)(7416002)(8676002)(478600001)(41300700001)(6486002)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjV4L2lDSm5VMmNWUXZMQUV5K3pSMHlWY3FjUll1MU4vamFzVVJGL0dhRHdm?=
 =?utf-8?B?cXdjQVlSY0plLzZXNWd2b1p1UC9oZnVKVmdUM2gzbEUzNzlCZExXcDltWUw5?=
 =?utf-8?B?RS9iQUdaWTcyV015TXBMM1craVhwTmxONUN0MGxhaUM2bGZFR1hDT0RGVTBa?=
 =?utf-8?B?enRYLy9idGo3UXlPYzVMaTZOeFgrK2Q2UlduZmFDK29FSlBreGg5Sk42eEVN?=
 =?utf-8?B?ZjlKdzdEaEFmTnNVeUJ4SThzc0hvWmp6YTN0M2g0T2F4dFRyNHBrck9XRFpJ?=
 =?utf-8?B?ZEQwZVhZWjZYUStxYXhqNnhCRGxjR3o2YXFHOGs1RStMRC8rVFY4M1Foek5M?=
 =?utf-8?B?TlJkNVovL053UlhySHFXeU5LYkJ2ODU1NzYzTGxZVTZJS1M0dFhrYXhvWjYv?=
 =?utf-8?B?Sm9hbCt5eWNTL000cFJFWDRqamJ3VGpZSk82Qi9BdG5PZTFRYThDSmNwQnls?=
 =?utf-8?B?WmlqaVc2dFhta0RCRjkrN3ZTKzYyYmJtQnd5Qng2a1JUY2doSVFTM3RWYVFk?=
 =?utf-8?B?NXlRdnRrN01Sb1k0M2Z4cTc4Mk50VWluK2R6cm9LRC9oSUtiSEVMU0taSGtX?=
 =?utf-8?B?bkl2ajVjeUdIU3B5cHl1ZUFHbk1BTko5MTR5Q3JWaGQ5TkwyUHpjekcrVGRX?=
 =?utf-8?B?UjhKUGQyZDkxWGxON29qZUp2TUdqU0tGcHQ1TzVqaHNsa054c0JKczVFUVQ1?=
 =?utf-8?B?VDQ1RjYxUEFNUzV4cXlyOThpakw3S0kwQTc4Z3pFS3p0V3IvR1NWSFdXbm1U?=
 =?utf-8?B?V2VEYnlGNFA0Yms0bHF6elI0a3U3Z1pSNVR4TnNlVWtST1JZRTI0cEMzMEhw?=
 =?utf-8?B?ZkR1T2ZFbzR5SUhQZmhKSkRETjVUZ2lpLzF3MlBXbE1md1VVK0xxZytrZ3VZ?=
 =?utf-8?B?OFFhNmt0Mjd0b1lhNkh2ZXdoRHJ1QWtSNE5nd2YwcHUzOW1BWkxiSG9DS2NL?=
 =?utf-8?B?ditqN1ZiV1FmQ2xGS0Y2d2R6UjRHdEhaMTljV1dTOWdKRGNsRE5FVFhEQXc5?=
 =?utf-8?B?N0VCcUg3NzVJZGJVRG0rVGRKT3J5NUIrWC9hVlJ5NFUzbXBibFg0YWlwTHBW?=
 =?utf-8?B?azlDUTU5a0hFMXhPZEtPN1R3QnJnRzFNS3BGdVRTRC8rRlZLSjBKKzRZWjY0?=
 =?utf-8?B?MTZKbkM2L1FzYjRTMTdFWGY4YXVzbzZ0MHorLzdwYjZGSFQveEhCUldEay9v?=
 =?utf-8?B?RnRoM293a1dqbmJwSXUvNG9LaEZJWHRUNXVvaGNqOUdUeGN2b0hjeFVLZU1B?=
 =?utf-8?B?MzhUdXhBTTRIRWlVMFE3WmVLb25uZVI2MW1YWEJ6c1FvSHZhdnpMS3NRc0JH?=
 =?utf-8?B?bmxIQTE3UGFIMjJjaENpVjUxckFJb2RxQXROaXUzRnFzWUxWWHBCVUJjT0hL?=
 =?utf-8?B?SVRDNHdLWHNkMkpaNS9zc3Ewakk5WDhVZU41NG94eXQ2U3lqZGNkSEt2am5S?=
 =?utf-8?B?U1FxUnFPb2JxU0kycFZnL2hGUEF0UEk4ZVZSRCtQVkdUbnAzRVl2QW9DOHFZ?=
 =?utf-8?B?NlUvZ0Q2eXlQVzU3RmZsWTdBRVRnQ3U3blFkQVQ2TE9IRlVUL2dnZkhxemhP?=
 =?utf-8?B?UFdySFQ3eW43UG4ydVBWZThIclNEbWRnN0UySVkxTjhGVzkwZVRKKzkzUk5s?=
 =?utf-8?B?NE5IMEhISDRMVG1OY0tLYzl2d2Z0Q2FZdi9MY28zR21pV05tRzhlRVVLaXhZ?=
 =?utf-8?B?dkU5VlFhWko0Q3hLSjN5OFVQT2pQNk5iZCtBemY0Q2phTkhJUnA4WlowSTNz?=
 =?utf-8?B?RFFkWXFsRzZZcys5MGRXUGF5ZUZUb3RmcTFma0hkMFR2Qy9zTW9IZHRmWDNM?=
 =?utf-8?B?R2ZOc3loR2lVSEtod1IvRm9uYkhmT0RVMDUxaVZ4QkxGYVJwUG41OG0zOGtl?=
 =?utf-8?B?QnpnZWpZcnJuRXZFWXYzUU1oSkR2VHo1S3lJOFRlalZHZlVVWVlPR3dHTWdJ?=
 =?utf-8?B?MjdDZU84QnV4WVpYKzRLN2Fnb3VBYlBYaVZGQlVVQ2VXRjQ2aUtWVG1zOVBr?=
 =?utf-8?B?c01qM3dPL3dQM3EvVURJUXlPczJyREh6aERJNnVDNUFSRDA1VTBWbTZ0dVYz?=
 =?utf-8?B?V3paQ3NnU3Zibzhsd1ZuNTZkK1pUUWFXTUZ0OWFoR1dqKzBTbTkvZGo2MDZy?=
 =?utf-8?Q?7KX4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f45c8d4-71c3-4857-6ad7-08dbf26fc113
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 13:16:40.2105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6Gq6axpk3iYE35KtN5aNFgnGOLRHzBFS8GPOiM9diZzNjUnD/Yjy4jQl//MVT6N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ziy@nvidia.com" <ziy@nvidia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mgorman@suse.de" <mgorman@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------dgLeyw0jf57U0fDoB74PxMLW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 01.12.23 um 06:48 schrieb Zeng, Oak:
> [SNIP]
>>    3. MMU notifiers register hooks at certain core MM events, while GMEM
>> declares basic functions and internally invokes them. GMEM requires less from
>> the driver side -- no need to understand what core MM behaves at certain MMU
>> events. GMEM also expects fewer bugs than MMU notifiers: implementing basic
>> operations with standard declarations vs. implementing whatever random device
>> MM logic in MMU notifiers.
> This seems true to me. I feel the mmu notifier thing, especially the synchronization/lock design (those sequence numbers, interacting with driver lock, and the mmap lock) are very complicated. I indeed spent time to understand the specification documented in hmm.rst...
>
> Your approach seems better.

I have to agree on that as well. HMM/MMU notifiers are developed with 
exposing MM functionality in mind instead of trying to fulfill driver 
requirements.

But this originated not in HMM/MMU notifiers, rather it was a 
requirement to not change the CPU side of the MM code to much.

So when you can get the acknowledgement to make changes to the CPU side 
of the MM code to better handle device driver requirements then I'm 
totally in favor of this.

It's just that I don't think the approach of starting with a new 
framework/idea will help with that. Instead rather try to improve the 
existing functionality.

>>    5. GMEM has been demonstrated to allow device memory oversubscription (a
>> GMEM-based 32GB NPU card can run a GPT model oversubscribing 500GB host
>> DDR), while drivers using HMM/MMU notifier must implement this logic one by
>> one. I will submit this part in a future RFC patch.
> When device memory is oversubscribed, do you call a driver callback function to evict device memory to system memory? Or just cpu copy? Copy with device's fast copy engine is faster.
>
> I can see even though with both approach we need to implement a driver copy function, with your approach, the driver logic can be simplified. With today's drm/ttm, I do see the logic in the memory eviction area is very complicated. Those eviction fence (some call it suspend fence), dma-fence enable signalling....very complicated to me.
>
> Essentially evict device memory to system memory is nothing different from evict system memory to disk... so if your approach can leverage some linux core mm eviction logic, I do see it can simplify things here...

We actually already do this in TTM as well through the MM shrinkers.

It's just that it's an intentional design decision to make the whole 
thing asynchronously using dma_fence etc... That's why you have this 
complexity in there.

>> I want to reiterate that GMEM's shared address space support is a bonus result,
>> not a main contribution... It was done because it was not difficult to implement
>> internal CPU-device coordination mechanism when core MM is extended by
>> GMEM to support devices.
> Besides memory eviction/oversubscription, there are a few other pain points when I use hmm:
>
> 1) hmm doesn't support file-back memory, so it is hard to share memory b/t process in a gpu environment. You mentioned you have a plan... How hard is it to support file-backed in your approach?

As hard as it is to support it through HMM. That's what I meant that 
this approach doesn't integrate well, as far as I know the problem isn't 
inside HMM or any other solution but rather in the file system layer.

Regards,
Christian.

> 2)virtual address range based memory attribute/hint: with hmadvise, where do you save the memory attribute of a virtual address range? Do you need to extend vm_area_struct to save it? With hmm, we have to maintain such information at driver. This ends up with pretty complicated logic to split/merge those address range. I know core mm has similar logic to split/merge vma...
>
> Oak
>
>
>> -Weixi
>>
>> -----Original Message-----
>> From: Christian König<ckoenig.leichtzumerken@gmail.com>
>> Sent: Thursday, November 30, 2023 4:28 PM
>> To: Zeng, Oak<oak.zeng@intel.com>; Christian König
>> <christian.koenig@amd.com>; zhuweixi<weixi.zhu@huawei.com>; linux-
>> mm@kvack.org;linux-kernel@vger.kernel.org;akpm@linux-foundation.org;
>> Danilo Krummrich<dakr@redhat.com>; Dave Airlie<airlied@redhat.com>; Daniel
>> Vetter<daniel@ffwll.ch>
>> Cc:intel-gvt-dev@lists.freedesktop.org;rcampbell@nvidia.com;
>> mhairgrove@nvidia.com;jgg@nvidia.com;weixi.zhu@openeuler.sh;
>> jhubbard@nvidia.com;intel-gfx@lists.freedesktop.org;apopple@nvidia.com;
>> Xinhui.Pan@amd.com;amd-gfx@lists.freedesktop.org;
>> tvrtko.ursulin@linux.intel.com;ogabbay@kernel.org;jglisse@redhat.com; dri-
>> devel@lists.freedesktop.org;ziy@nvidia.com; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>;alexander.deucher@amd.com;leonro@nvidia.com;
>> Felix.Kuehling@amd.com; Wang, Zhi A<zhi.a.wang@intel.com>;
>> mgorman@suse.de
>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>> management) for external memory devices
>>
>> Hi Oak,
>>
>> yeah, #4 is indeed a really good point and I think Felix will agree to that as well.
>>
>> HMM is basically still missing a way to advise device attributes for the CPU
>> address space. Both migration strategy as well as device specific information (like
>> cache preferences) fall into this category.
>>
>> Since there is a device specific component in those attributes as well I think
>> device specific IOCTLs still make sense to update them, but HMM should offer
>> the functionality to manage and store those information.
>>
>> Split and merge of VMAs only become a problem if you attach those information
>> to VMAs, if you keep them completely separate than that doesn't become an
>> issue either. The down side of this approach is that you don't get automatically
>> extending attribute ranges for growing VMAs for example.
>>
>> Regards,
>> Christian.
>>
>> Am 29.11.23 um 23:23 schrieb Zeng, Oak:
>>> Hi Weixi,
>>>
>>> Even though Christian has listed reasons rejecting this proposal (yes they are
>> very reasonable to me), I would open my mind and further explore the possibility
>> here. Since the current GPU driver uses a hmm based implementation (AMD and
>> NV has done this; At Intel we are catching up), I want to explore how much we
>> can benefit from the proposed approach and how your approach can solve some
>> pain points of our development. So basically what I am questioning here is: what
>> is the advantage of your approach against hmm.
>>> To implement a UVM (unified virtual address space b/t cpu and gpu device),
>> with hmm, driver essentially need to implement below functions:
>>> 1. device page table update. Your approach requires the same because
>>> this is device specific codes
>>>
>>> 2. Some migration functions to migrate memory b/t system memory and GPU
>> local memory. My understanding is, even though you generalized this a bit, such
>> as modified cpu page fault path, provided "general" gm_dev_fault handler... but
>> device driver still need to provide migration functions because migration
>> functions have to be device specific (i.e., using device dma/copy engine for
>> performance purpose). Right?
>>> 3. GPU physical memory management, this part is now in drm/buddy, shared
>> by all drivers. I think with your approach, driver still need to provide callback
>> functions to allocate/free physical pages. Right? Or do you let linux core mm
>> buddy manage device memory directly?
>>> 4. madvise/hints/virtual address range management. This has been pain point
>> for us. Right now device driver has to maintain certain virtual address range data
>> structure to maintain hints and other virtual address range based memory
>> attributes. Driver need to sync with linux vma. Driver need to explicitly deal with
>> range split/merging... HMM doesn't provide support in this area. Your approach
>> seems cleaner/simpler to me...
>>>
>>> So in above, I have examined the some key factors of a gpu UVM memory
>> manager. I think for #1 and #2, hmm has provide pretty good abstraction/tools
>> for address space mirroring and migration helpers. For #3, since we have a
>> common drm/buddy layer, I don't think it is a big problem for driver writer now.
>>> I do see #4 is something you solved more beautifully, requires new system call
>> though.
>>> Oak
>>>
>>>
>>>> -----Original Message-----
>>>> From: dri-devel<dri-devel-bounces@lists.freedesktop.org>  On Behalf
>>>> Of Christian König
>>>> Sent: Tuesday, November 28, 2023 8:09 AM
>>>> To: Weixi Zhu<weixi.zhu@huawei.com>;linux-mm@kvack.org; linux-
>>>> kernel@vger.kernel.org;akpm@linux-foundation.org; Danilo Krummrich
>>>> <dakr@redhat.com>; Dave Airlie<airlied@redhat.com>; Daniel Vetter
>>>> <daniel@ffwll.ch>
>>>> Cc:dri-devel@lists.freedesktop.org;leonro@nvidia.com;
>>>> apopple@nvidia.com;amd-gfx@lists.freedesktop.org;mgorman@suse.de;
>>>> ziy@nvidia.com; Wang, Zhi A<zhi.a.wang@intel.com>;
>>>> rcampbell@nvidia.com;jgg@nvidia.com;weixi.zhu@openeuler.sh;
>>>> jhubbard@nvidia.com;intel-gfx@lists.freedesktop.org;
>>>> mhairgrove@nvidia.com;jglisse@redhat.com; Vivi, Rodrigo
>>>> <rodrigo.vivi@intel.com>;intel-gvt-dev@lists.freedesktop.org;
>>>> tvrtko.ursulin@linux.intel.com;Felix.Kuehling@amd.com;
>>>> Xinhui.Pan@amd.com;alexander.deucher@amd.com;ogabbay@kernel.org
>>>> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
>>>> management) for external memory devices
>>>>
>>>> Adding a few missing important people to the explicit to list.
>>>>
>>>> Am 28.11.23 um 13:50 schrieb Weixi Zhu:
>>>>> The problem:
>>>>>
>>>>> Accelerator driver developers are forced to reinvent external MM
>>>>> subsystems case by case, because Linux core MM only considers host
>> memory resources.
>>>>> These reinvented MM subsystems have similar orders of magnitude of
>>>>> LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and
>>>>> Huawei NPU
>>>> has
>>>>> 30K. Meanwhile, more and more vendors are implementing their own
>>>>> accelerators, e.g. Microsoft's Maia 100. At the same time,
>>>>> application-level developers suffer from poor programmability --
>>>>> they must consider parallel address spaces and be careful about the
>>>>> limited device DRAM capacity. This can be alleviated if a
>>>>> malloc()-ed virtual address can be shared by the accelerator, or the
>>>>> abundant host DRAM can further transparently backup the device local
>> memory.
>>>>> These external MM systems share similar mechanisms except for the
>>>>> hardware-dependent part, so reinventing them is effectively
>>>>> introducing redundant code (14K~70K for each case). Such
>>>>> developing/maintaining is not cheap. Furthermore, to share a
>>>>> malloc()-ed virtual address, device drivers need to deeply interact
>>>>> with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM. This
>>>>> raises the bar for driver development, since developers must
>>>>> understand how Linux MM works. Further, it creates code maintenance
>>>>> problems -- any changes to Linux MM potentially require coordinated
>> changes to accelerator drivers using low-level MM APIs.
>>>>> Putting a cache-coherent bus between host and device will not make
>>>>> these external MM subsystems disappear. For example, a
>>>>> throughput-oriented accelerator will not tolerate executing heavy
>>>>> memory access workload with a host MMU/IOMMU via a remote bus.
>>>>> Therefore, devices will still have their own MMU and pick a simpler
>>>>> page table format for lower address translation overhead, requiring external
>> MM subsystems.
>>>>> --------------------
>>>>>
>>>>> What GMEM (Generalized Memory Management [1]) does:
>>>>>
>>>>> GMEM extends Linux MM to share its machine-independent MM code. Only
>>>>> high-level interface is provided for device drivers. This prevents
>>>>> accelerator drivers from reinventing the wheel, but relies on
>>>>> drivers to implement their hardware-dependent functions declared by
>>>>> GMEM. GMEM's
>>>> key
>>>>> interface include gm_dev_create(), gm_as_create(), gm_as_attach()
>>>>> and gm_dev_register_physmem(). Here briefly describe how a device
>>>>> driver utilizes them:
>>>>> 1. At boot time, call gm_dev_create() and registers the implementation of
>>>>>       hardware-dependent functions as declared in struct gm_mmu.
>>>>>         - If the device has local DRAM, call gm_dev_register_physmem() to
>>>>>           register available physical addresses.
>>>>> 2. When a device context is initialized (e.g. triggered by ioctl), check if
>>>>>       the current CPU process has been attached to a gmem address space
>>>>>       (struct gm_as). If not, call gm_as_create() and point current->mm->gm_as
>>>>>       to it.
>>>>> 3. Call gm_as_attach() to attach the device context to a gmem address space.
>>>>> 4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
>>>>>       device computation happens.
>>>>>
>>>>> GMEM has changed the following assumptions in Linux MM:
>>>>>      1. An mm_struct not only handle a single CPU context, but may also handle
>>>>>         external memory contexts encapsulated as gm_context listed in
>>>>>         mm->gm_as. An external memory context can include a few or all of the
>>>>>         following parts: an external MMU (that requires TLB invalidation), an
>>>>>         external page table (that requires PTE manipulation) and external DRAM
>>>>>         (that requires physical memory management).
>>>>>      2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not
>> necessarily
>>>>>         mean that a zero-filled physical page should be mapped. The virtual
>>>>>         page may have been mapped to an external memory device.
>>>>>      3. Unmapping a page may include sending device TLB invalidation (even if
>>>>>         its MMU shares CPU page table) and manipulating device PTEs.
>>>>>
>>>>> --------------------
>>>>>
>>>>> Semantics of new syscalls:
>>>>>
>>>>> 1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
>>>>>        Allocate virtual address that is shared between the CPU and all
>>>>>        attached devices. Data is guaranteed to be coherent whenever the
>>>>>        address is accessed by either CPU or any attached device. If the device
>>>>>        does not support page fault, then device driver is responsible for
>>>>>        faulting memory before data gets accessed. By default, the CPU DRAM is
>>>>>        can be used as a swap backup for the device local memory.
>>>>> 2. hmadvise(NUMA_id, va_start, size, memory_hint)
>>>>>        Issuing memory hint for a given VMA. This extends traditional madvise()
>>>>>        syscall with an extra argument so that programmers have better control
>>>>>        with heterogeneous devices registered as NUMA nodes. One
>>>>> useful
>>>> memory
>>>>>        hint could be MADV_PREFETCH, which guarantees that the physical data
>> of
>>>>>        the given VMA [VA, VA+size) is migrated to NUMA node #id. Another
>>>>>        useful memory hint is MADV_DONTNEED. This is helpful to increase
>> device
>>>>>        memory utilization. It is worth considering extending the existing
>>>>>        madvise() syscall with one additional argument.
>>>>>
>>>>> --------------------
>>>>>
>>>>> Implementation details
>>>>>
>>>>> 1. New VMA flag: MAP_PEER_SHARED
>>>>>
>>>>> This new flag helps isolate GMEM feature, so that common processes
>>>>> with no device attached does not need to maintain any logical page
>>>>> table. It can be deleted if the extra overhead from GMEM is acceptable.
>>>>>
>>>>> 2. MMU functions
>>>>> The device driver must implement the MMU functions declared in
>>>>> struct gm_mmu.
>>>>>
>>>>> VA functions: peer_va_alloc_fixed(), peer_va_free()
>>>>>
>>>>> They are used to negotiate a common available VMA between a host
>>>>> process and a device process at the mmap() time. This is because
>>>>> some accelerators like Intel Xeon Phi or Huawei's Ascend NPU have
>>>>> their acceleration tasks executed within a device CPU process
>>>>> context. Some accelerators may also choose a different format of
>>>>> virtual address space.
>>>>>
>>>>> PA functions: alloc_page(), free_page(), prepare_page()
>>>>>
>>>>> Alloc_page() and free_page() are used to allocate and free device
>>>>> physical pages. Prepare_page() is used to zero-fill or DMA the data
>>>>> of a physical page. These functions were removed from the submitted
>>>>> patch, since GMEM does not need to invoke them when testing Huawei's
>>>>> NPU accelerator. The
>>>> NPU
>>>>> accelerator has an OS running in the device that manages the device
>>>>> physical memory. However, even for such a device it is better for
>>>>> the host to directly manage device physical memory, which saves
>>>>> device HBM and avoids synchronizing management status between the host
>> and device.
>>>>> Page-table functions:
>>>>> pmap_create()/destroy()/enter()/release()/protect()
>>>>>
>>>>> They are used to create and destroy device page tables, install and
>>>>> uninstall page table entries and to change the protection of page
>>>>> table entries.
>>>>>
>>>>> TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()
>>>>>
>>>>> They are used to invalidate the TLB entries of a given range of VA
>>>>> or invalidate a given list of VMAs.
>>>>>
>>>>> Wrapper functions: peer_map() and peer_unmap()
>>>>>
>>>>> These two functions are used to create or destroy a device mapping
>>>>> which could include allocating physical memory and copying data.
>>>>> They effectively wraps the PA functions, Page-table functions and
>>>>> TLB-invalidation functions. Implementing these steps together allows
>>>>> devices to optimize the communication cost between host and device.
>>>>> However, it requires the device driver to correctly order these steps.
>>>>>
>>>>> 3. Tracking logical mappings:
>>>>>
>>>>> Each process starts maintaining an xarray in
>>>>> mm->vm_obj->logical_page_table at the first time a host process
>>>>> calls mmap(MAP_PRIVATE |
>>>> MAP_PEER_SHARED).
>>>>> When a virtual page gets touched, its mapping status is created and
>>>>> stored in struct gm_mapping. The logical page table is utilized to
>>>>> query the struct gm_mapping given a virtual address. GMEM extends
>>>>> Linux MM to
>>>> update
>>>>> and lookup these logical mappings. For example, in the patch set we
>>>>> modify the page fault path of to additionally check the logical
>>>>> mapping of MAP_PEER_SHARED VMAs and identify if a device page should
>> be migrated.
>>>>> Similarly, if the device driver wants to resolve a device page fault
>>>>> or prefetch data, the driver should call gm_dev_fault(). This
>>>>> function examines the mapping status and determines whether the
>>>>> device driver should migrate a CPU page to device or install a zero-filled
>> device page.
>>>>> The logical mapping abstraction enhances the extensibility of Linux
>>>>> core MM (a virtual page may be mapped to a device physical page
>>>>> without any CPU PTE installed). The current implementation is not
>>>>> complete, since it only focused on anonymous VMAs with
>>>>> MAP_PEER_SHARED flag. The future plan of logical page table is to
>>>>> provide a generic abstraction layer that support common anonymous
>>>>> memory (I am looking at you, transparent huge pages)
>>>> and
>>>>> file-backed memory.
>>>>>
>>>>> --------------------
>>>>>
>>>>> Use cases
>>>>>
>>>>> GMEM has been tested over Huawei's NPU (neural process unit) device
>> driver.
>>>>> The original NPU device driver has approximately 30,000 lines of
>>>>> code for memory management. On the contrary, the GMEM-based one has
>>>>> less than 30 lines of code calling GMEM API, with approximately
>>>>> 3,700 lines of code implementing the MMU functions. This effectively
>>>>> saves over 26,200 lines of MM code for one driver. Therefore,
>>>>> developers from accelerator vendors, including Nvidia, AMD, Intel
>>>>> and other companies are welcome to discuss if GMEM could be helpful.
>>>>>
>>>>> Using GMEM-based driver, it is possible to write a C-style
>>>>> accelerator code with malloc(), whose underlying mmap() syscall
>>>>> should include MAP_PEER_SHARED according to current GMEM
>>>>> implementation. Importantly,
>>>> GMEM
>>>>> guarantees a coherent view of memory between the host and all
>>>>> attached devices. This means that any data written by the CPU or any
>>>>> attached accelerator can be seen by the next memory load instruction
>>>>> issued by any attached accelerator or the CPU. Furthermore, the NPU
>>>>> device was able to oversubscribe memory by swapping memory to host
>>>>> DDR. Note that this
>>>> memory
>>>>> oversubscription mechanism can be universal if the physical memory
>>>>> management is provided by GMEM. Other potential use cases of GMEM
>>>>> could include the IOMMU driver, KVM and RDMA drivers, as long as the
>>>>> device needs to manage external memory resources like VMAs, MMUs or
>> local DRAMs.
>>>>> --------------------
>>>>>
>>>>> Discussion
>>>>>
>>>>> Physical memory management
>>>>> Most accelerators require the host OS to manage device DRAM. Even
>>>>> accelerators capable of running an OS inside the driver can benefit
>>>>> from it, since it helps avoid synchronizing management status
>>>>> between the host and device. In Linux OSS EU summit 2023, Hannes
>>>>> Reinecke from SUSE Labs suggested that people are concerned with the
>>>>> memory consumption of struct page (which considers all generic
>>>>> scenarios for the kernel). This leads to a possible solution that,
>>>>> instead of reusing Linux struct page and ZONE_DEVICE mechanism, GMEM
>>>>> can implement an isolated buddy allocator
>>>> for
>>>>> the device to instantiate and register. The isolation is useful
>>>>> because device DRAM physical address space is independent.
>>>>> Furthermore, the isolated buddy allocator can utilize a customized
>>>>> struct page that consumes less memory. It is worth discussing if
>>>>> accelerator vendors desire this solution.
>>>>>
>>>>> MMU functions
>>>>> The MMU functions peer_map() and peer_unmap() overlap other
>>>>> functions, leaving a question if the MMU functions should be
>>>>> decoupled as more basic operations. Decoupling them could
>>>>> potentially prevent device drivers coalescing these basic steps
>>>>> within a single host-device communication operation, while coupling
>>>>> them makes it more difficult for device drivers to utilize GMEM interface.
>>>>>
>>>>> The idea of GMEM was originated from Weixi's PhD study with Prof.
>>>>> Scott Rixner and Prof. Alan L. Cox at Rice University.
>>>>>
>>>>> [1]https://arxiv.org/abs/2310.12554.
>>>>>
>>>>> Weixi Zhu (6):
>>>>>      mm/gmem: add heterogeneous NUMA node
>>>>>      mm/gmem: add arch-independent abstraction to track address mapping
>>>>>        status
>>>>>      mm/gmem: add GMEM (Generalized Memory Management) interface for
>>>>>        external accelerators
>>>>>      mm/gmem: add new syscall hmadvise() to issue memory hints for
>>>>>        heterogeneous NUMA nodes
>>>>>      mm/gmem: resolve VMA conflicts for attached peer devices
>>>>>      mm/gmem: extending Linux core MM to support unified virtual address
>>>>>        space
>>>>>
>>>>>     arch/arm64/include/asm/unistd.h         |   2 +-
>>>>>     arch/arm64/include/asm/unistd32.h       |   2 +
>>>>>     drivers/base/node.c                     |   6 +
>>>>>     fs/proc/task_mmu.c                      |   3 +
>>>>>     include/linux/gmem.h                    | 368 ++++++++++++
>>>>>     include/linux/mm.h                      |   8 +
>>>>>     include/linux/mm_types.h                |   5 +
>>>>>     include/linux/nodemask.h                |  10 +
>>>>>     include/uapi/asm-generic/mman-common.h  |   4 +
>>>>>     include/uapi/asm-generic/unistd.h       |   5 +-
>>>>>     init/main.c                             |   2 +
>>>>>     kernel/fork.c                           |   5 +
>>>>>     kernel/sys_ni.c                         |   2 +
>>>>>     mm/Kconfig                              |  14 +
>>>>>     mm/Makefile                             |   1 +
>>>>>     mm/gmem.c                               | 746 ++++++++++++++++++++++++
>>>>>     mm/huge_memory.c                        |  85 ++-
>>>>>     mm/memory.c                             |  42 +-
>>>>>     mm/mempolicy.c                          |   4 +
>>>>>     mm/mmap.c                               |  40 +-
>>>>>     mm/oom_kill.c                           |   2 +
>>>>>     mm/page_alloc.c                         |   3 +
>>>>>     mm/vm_object.c                          | 309 ++++++++++
>>>>>     tools/include/uapi/asm-generic/unistd.h |   5 +-
>>>>>     24 files changed, 1654 insertions(+), 19 deletions(-)
>>>>>     create mode 100644 include/linux/gmem.h
>>>>>     create mode 100644 mm/gmem.c
>>>>>     create mode 100644 mm/vm_object.c
>>>>>

--------------dgLeyw0jf57U0fDoB74PxMLW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 01.12.23 um 06:48 schrieb Zeng, Oak:<br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  3. MMU notifiers register hooks at certain core MM events, while GMEM
declares basic functions and internally invokes them. GMEM requires less from
the driver side -- no need to understand what core MM behaves at certain MMU
events. GMEM also expects fewer bugs than MMU notifiers: implementing basic
operations with standard declarations vs. implementing whatever random device
MM logic in MMU notifiers.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This seems true to me. I feel the mmu notifier thing, especially the synchronization/lock design (those sequence numbers, interacting with driver lock, and the mmap lock) are very complicated. I indeed spent time to understand the specification documented in hmm.rst...

Your approach seems better.</pre>
    </blockquote>
    <br>
    I have to agree on that as well. HMM/MMU notifiers are developed
    with exposing MM functionality in mind instead of trying to fulfill
    driver requirements.<br>
    <br>
    But this originated not in HMM/MMU notifiers, rather it was a
    requirement to not change the CPU side of the MM code to much.<br>
    <br>
    So when you can get the acknowledgement to make changes to the CPU
    side of the MM code to better handle device driver requirements then
    I'm totally in favor of this.<br>
    <br>
    It's just that I don't think the approach of starting with a new
    framework/idea will help with that. Instead rather try to improve
    the existing functionality. <br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
  5. GMEM has been demonstrated to allow device memory oversubscription (a
GMEM-based 32GB NPU card can run a GPT model oversubscribing 500GB host
DDR), while drivers using HMM/MMU notifier must implement this logic one by
one. I will submit this part in a future RFC patch.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
When device memory is oversubscribed, do you call a driver callback function to evict device memory to system memory? Or just cpu copy? Copy with device's fast copy engine is faster.

I can see even though with both approach we need to implement a driver copy function, with your approach, the driver logic can be simplified. With today's drm/ttm, I do see the logic in the memory eviction area is very complicated. Those eviction fence (some call it suspend fence), dma-fence enable signalling....very complicated to me.

Essentially evict device memory to system memory is nothing different from evict system memory to disk... so if your approach can leverage some linux core mm eviction logic, I do see it can simplify things here...</pre>
    </blockquote>
    <br>
    We actually already do this in TTM as well through the MM shrinkers.<br>
    <br>
    It's just that it's an intentional design decision to make the whole
    thing asynchronously using dma_fence etc... That's why you have this
    complexity in there.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I want to reiterate that GMEM's shared address space support is a bonus result,
not a main contribution... It was done because it was not difficult to implement
internal CPU-device coordination mechanism when core MM is extended by
GMEM to support devices.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Besides memory eviction/oversubscription, there are a few other pain points when I use hmm:

1) hmm doesn't support file-back memory, so it is hard to share memory b/t process in a gpu environment. You mentioned you have a plan... How hard is it to support file-backed in your approach?</pre>
    </blockquote>
    <br>
    As hard as it is to support it through HMM. That's what I meant that
    this approach doesn't integrate well, as far as I know the problem
    isn't inside HMM or any other solution but rather in the file system
    layer.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB6991E67DA37DAC8EDA9929CB9281A@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
2)virtual address range based memory attribute/hint: with hmadvise, where do you save the memory attribute of a virtual address range? Do you need to extend vm_area_struct to save it? With hmm, we have to maintain such information at driver. This ends up with pretty complicated logic to split/merge those address range. I know core mm has similar logic to split/merge vma...

Oak


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
-Weixi

-----Original Message-----
From: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>
Sent: Thursday, November 30, 2023 4:28 PM
To: Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>; Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>; zhuweixi <a class="moz-txt-link-rfc2396E" href="mailto:weixi.zhu@huawei.com">&lt;weixi.zhu@huawei.com&gt;</a>; linux-
<a class="moz-txt-link-abbreviated" href="mailto:mm@kvack.org">mm@kvack.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:akpm@linux-foundation.org">akpm@linux-foundation.org</a>;
Danilo Krummrich <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Daniel
Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:intel-gvt-dev@lists.freedesktop.org">intel-gvt-dev@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:rcampbell@nvidia.com">rcampbell@nvidia.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:mhairgrove@nvidia.com">mhairgrove@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:jgg@nvidia.com">jgg@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:weixi.zhu@openeuler.sh">weixi.zhu@openeuler.sh</a>;
<a class="moz-txt-link-abbreviated" href="mailto:jhubbard@nvidia.com">jhubbard@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-gfx@lists.freedesktop.org">intel-gfx@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:apopple@nvidia.com">apopple@nvidia.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:Xinhui.Pan@amd.com">Xinhui.Pan@amd.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>;
<a class="moz-txt-link-abbreviated" href="mailto:tvrtko.ursulin@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:ogabbay@kernel.org">ogabbay@kernel.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:jglisse@redhat.com">jglisse@redhat.com</a>; dri-
<a class="moz-txt-link-abbreviated" href="mailto:devel@lists.freedesktop.org">devel@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:ziy@nvidia.com">ziy@nvidia.com</a>; Vivi, Rodrigo
<a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:alexander.deucher@amd.com">alexander.deucher@amd.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:leonro@nvidia.com">leonro@nvidia.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:Felix.Kuehling@amd.com">Felix.Kuehling@amd.com</a>; Wang, Zhi A <a class="moz-txt-link-rfc2396E" href="mailto:zhi.a.wang@intel.com">&lt;zhi.a.wang@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:mgorman@suse.de">mgorman@suse.de</a>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
management) for external memory devices

Hi Oak,

yeah, #4 is indeed a really good point and I think Felix will agree to that as well.

HMM is basically still missing a way to advise device attributes for the CPU
address space. Both migration strategy as well as device specific information (like
cache preferences) fall into this category.

Since there is a device specific component in those attributes as well I think
device specific IOCTLs still make sense to update them, but HMM should offer
the functionality to manage and store those information.

Split and merge of VMAs only become a problem if you attach those information
to VMAs, if you keep them completely separate than that doesn't become an
issue either. The down side of this approach is that you don't get automatically
extending attribute ranges for growing VMAs for example.

Regards,
Christian.

Am 29.11.23 um 23:23 schrieb Zeng, Oak:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Weixi,

Even though Christian has listed reasons rejecting this proposal (yes they are
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">very reasonable to me), I would open my mind and further explore the possibility
here. Since the current GPU driver uses a hmm based implementation (AMD and
NV has done this; At Intel we are catching up), I want to explore how much we
can benefit from the proposed approach and how your approach can solve some
pain points of our development. So basically what I am questioning here is: what
is the advantage of your approach against hmm.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
To implement a UVM (unified virtual address space b/t cpu and gpu device),
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">with hmm, driver essentially need to implement below functions:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
1. device page table update. Your approach requires the same because
this is device specific codes

2. Some migration functions to migrate memory b/t system memory and GPU
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">local memory. My understanding is, even though you generalized this a bit, such
as modified cpu page fault path, provided &quot;general&quot; gm_dev_fault handler... but
device driver still need to provide migration functions because migration
functions have to be device specific (i.e., using device dma/copy engine for
performance purpose). Right?
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
3. GPU physical memory management, this part is now in drm/buddy, shared
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">by all drivers. I think with your approach, driver still need to provide callback
functions to allocate/free physical pages. Right? Or do you let linux core mm
buddy manage device memory directly?
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
4. madvise/hints/virtual address range management. This has been pain point
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">for us. Right now device driver has to maintain certain virtual address range data
structure to maintain hints and other virtual address range based memory
attributes. Driver need to sync with linux vma. Driver need to explicitly deal with
range split/merging... HMM doesn't provide support in this area. Your approach
seems cleaner/simpler to me...
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

So in above, I have examined the some key factors of a gpu UVM memory
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">manager. I think for #1 and #2, hmm has provide pretty good abstraction/tools
for address space mirroring and migration helpers. For #3, since we have a
common drm/buddy layer, I don't think it is a big problem for driver writer now.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
I do see #4 is something you solved more beautifully, requires new system call
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">though.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Oak


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: dri-devel <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel-bounces@lists.freedesktop.org">&lt;dri-devel-bounces@lists.freedesktop.org&gt;</a> On Behalf
Of Christian König
Sent: Tuesday, November 28, 2023 8:09 AM
To: Weixi Zhu <a class="moz-txt-link-rfc2396E" href="mailto:weixi.zhu@huawei.com">&lt;weixi.zhu@huawei.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:linux-mm@kvack.org">linux-mm@kvack.org</a>; linux-
<a class="moz-txt-link-abbreviated" href="mailto:kernel@vger.kernel.org">kernel@vger.kernel.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:akpm@linux-foundation.org">akpm@linux-foundation.org</a>; Danilo Krummrich
<a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a>; Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>; Daniel Vetter
<a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:leonro@nvidia.com">leonro@nvidia.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:apopple@nvidia.com">apopple@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:mgorman@suse.de">mgorman@suse.de</a>;
<a class="moz-txt-link-abbreviated" href="mailto:ziy@nvidia.com">ziy@nvidia.com</a>; Wang, Zhi A <a class="moz-txt-link-rfc2396E" href="mailto:zhi.a.wang@intel.com">&lt;zhi.a.wang@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:rcampbell@nvidia.com">rcampbell@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:jgg@nvidia.com">jgg@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:weixi.zhu@openeuler.sh">weixi.zhu@openeuler.sh</a>;
<a class="moz-txt-link-abbreviated" href="mailto:jhubbard@nvidia.com">jhubbard@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-gfx@lists.freedesktop.org">intel-gfx@lists.freedesktop.org</a>;
<a class="moz-txt-link-abbreviated" href="mailto:mhairgrove@nvidia.com">mhairgrove@nvidia.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:jglisse@redhat.com">jglisse@redhat.com</a>; Vivi, Rodrigo
<a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:intel-gvt-dev@lists.freedesktop.org">intel-gvt-dev@lists.freedesktop.org</a>;
<a class="moz-txt-link-abbreviated" href="mailto:tvrtko.ursulin@linux.intel.com">tvrtko.ursulin@linux.intel.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:Felix.Kuehling@amd.com">Felix.Kuehling@amd.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:Xinhui.Pan@amd.com">Xinhui.Pan@amd.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:alexander.deucher@amd.com">alexander.deucher@amd.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:ogabbay@kernel.org">ogabbay@kernel.org</a>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
management) for external memory devices

Adding a few missing important people to the explicit to list.

Am 28.11.23 um 13:50 schrieb Weixi Zhu:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">The problem:

Accelerator driver developers are forced to reinvent external MM
subsystems case by case, because Linux core MM only considers host
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">memory resources.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">These reinvented MM subsystems have similar orders of magnitude of
LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has 14K and
Huawei NPU
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">has
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">30K. Meanwhile, more and more vendors are implementing their own
accelerators, e.g. Microsoft's Maia 100. At the same time,
application-level developers suffer from poor programmability --
they must consider parallel address spaces and be careful about the
limited device DRAM capacity. This can be alleviated if a
malloc()-ed virtual address can be shared by the accelerator, or the
abundant host DRAM can further transparently backup the device local
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">memory.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
These external MM systems share similar mechanisms except for the
hardware-dependent part, so reinventing them is effectively
introducing redundant code (14K~70K for each case). Such
developing/maintaining is not cheap. Furthermore, to share a
malloc()-ed virtual address, device drivers need to deeply interact
with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM. This
raises the bar for driver development, since developers must
understand how Linux MM works. Further, it creates code maintenance
problems -- any changes to Linux MM potentially require coordinated
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">changes to accelerator drivers using low-level MM APIs.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Putting a cache-coherent bus between host and device will not make
these external MM subsystems disappear. For example, a
throughput-oriented accelerator will not tolerate executing heavy
memory access workload with a host MMU/IOMMU via a remote bus.
Therefore, devices will still have their own MMU and pick a simpler
page table format for lower address translation overhead, requiring external
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">MM subsystems.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
--------------------

What GMEM (Generalized Memory Management [1]) does:

GMEM extends Linux MM to share its machine-independent MM code. Only
high-level interface is provided for device drivers. This prevents
accelerator drivers from reinventing the wheel, but relies on
drivers to implement their hardware-dependent functions declared by
GMEM. GMEM's
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">key
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">interface include gm_dev_create(), gm_as_create(), gm_as_attach()
and gm_dev_register_physmem(). Here briefly describe how a device
driver utilizes them:
1. At boot time, call gm_dev_create() and registers the implementation of
     hardware-dependent functions as declared in struct gm_mmu.
       - If the device has local DRAM, call gm_dev_register_physmem() to
         register available physical addresses.
2. When a device context is initialized (e.g. triggered by ioctl), check if
     the current CPU process has been attached to a gmem address space
     (struct gm_as). If not, call gm_as_create() and point current-&gt;mm-&gt;gm_as
     to it.
3. Call gm_as_attach() to attach the device context to a gmem address space.
4. Invoke gm_dev_fault() to resolve a page fault or prepare data before
     device computation happens.

GMEM has changed the following assumptions in Linux MM:
    1. An mm_struct not only handle a single CPU context, but may also handle
       external memory contexts encapsulated as gm_context listed in
       mm-&gt;gm_as. An external memory context can include a few or all of the
       following parts: an external MMU (that requires TLB invalidation), an
       external page table (that requires PTE manipulation) and external DRAM
       (that requires physical memory management).
    2. Faulting a MAP_PRIVATE VMA with no CPU PTE found does not
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">necessarily
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">       mean that a zero-filled physical page should be mapped. The virtual
       page may have been mapped to an external memory device.
    3. Unmapping a page may include sending device TLB invalidation (even if
       its MMU shares CPU page table) and manipulating device PTEs.

--------------------

Semantics of new syscalls:

1. mmap(..., MAP_PRIVATE | MAP_PEER_SHARED)
      Allocate virtual address that is shared between the CPU and all
      attached devices. Data is guaranteed to be coherent whenever the
      address is accessed by either CPU or any attached device. If the device
      does not support page fault, then device driver is responsible for
      faulting memory before data gets accessed. By default, the CPU DRAM is
      can be used as a swap backup for the device local memory.
2. hmadvise(NUMA_id, va_start, size, memory_hint)
      Issuing memory hint for a given VMA. This extends traditional madvise()
      syscall with an extra argument so that programmers have better control
      with heterogeneous devices registered as NUMA nodes. One
useful
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">memory
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">      hint could be MADV_PREFETCH, which guarantees that the physical data
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">of
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">      the given VMA [VA, VA+size) is migrated to NUMA node #id. Another
      useful memory hint is MADV_DONTNEED. This is helpful to increase
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">device
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">      memory utilization. It is worth considering extending the existing
      madvise() syscall with one additional argument.

--------------------

Implementation details

1. New VMA flag: MAP_PEER_SHARED

This new flag helps isolate GMEM feature, so that common processes
with no device attached does not need to maintain any logical page
table. It can be deleted if the extra overhead from GMEM is acceptable.

2. MMU functions
The device driver must implement the MMU functions declared in
struct gm_mmu.

VA functions: peer_va_alloc_fixed(), peer_va_free()

They are used to negotiate a common available VMA between a host
process and a device process at the mmap() time. This is because
some accelerators like Intel Xeon Phi or Huawei's Ascend NPU have
their acceleration tasks executed within a device CPU process
context. Some accelerators may also choose a different format of
virtual address space.

PA functions: alloc_page(), free_page(), prepare_page()

Alloc_page() and free_page() are used to allocate and free device
physical pages. Prepare_page() is used to zero-fill or DMA the data
of a physical page. These functions were removed from the submitted
patch, since GMEM does not need to invoke them when testing Huawei's
NPU accelerator. The
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">NPU
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">accelerator has an OS running in the device that manages the device
physical memory. However, even for such a device it is better for
the host to directly manage device physical memory, which saves
device HBM and avoids synchronizing management status between the host
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">and device.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Page-table functions:
pmap_create()/destroy()/enter()/release()/protect()

They are used to create and destroy device page tables, install and
uninstall page table entries and to change the protection of page
table entries.

TLB-invalidation functions: tlb_invl(), tlb_invl_coalesced()

They are used to invalidate the TLB entries of a given range of VA
or invalidate a given list of VMAs.

Wrapper functions: peer_map() and peer_unmap()

These two functions are used to create or destroy a device mapping
which could include allocating physical memory and copying data.
They effectively wraps the PA functions, Page-table functions and
TLB-invalidation functions. Implementing these steps together allows
devices to optimize the communication cost between host and device.
However, it requires the device driver to correctly order these steps.

3. Tracking logical mappings:

Each process starts maintaining an xarray in
mm-&gt;vm_obj-&gt;logical_page_table at the first time a host process
calls mmap(MAP_PRIVATE |
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">MAP_PEER_SHARED).
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">When a virtual page gets touched, its mapping status is created and
stored in struct gm_mapping. The logical page table is utilized to
query the struct gm_mapping given a virtual address. GMEM extends
Linux MM to
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">update
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">and lookup these logical mappings. For example, in the patch set we
modify the page fault path of to additionally check the logical
mapping of MAP_PEER_SHARED VMAs and identify if a device page should
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">be migrated.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Similarly, if the device driver wants to resolve a device page fault
or prefetch data, the driver should call gm_dev_fault(). This
function examines the mapping status and determines whether the
device driver should migrate a CPU page to device or install a zero-filled
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">device page.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
The logical mapping abstraction enhances the extensibility of Linux
core MM (a virtual page may be mapped to a device physical page
without any CPU PTE installed). The current implementation is not
complete, since it only focused on anonymous VMAs with
MAP_PEER_SHARED flag. The future plan of logical page table is to
provide a generic abstraction layer that support common anonymous
memory (I am looking at you, transparent huge pages)
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">and
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">file-backed memory.

--------------------

Use cases

GMEM has been tested over Huawei's NPU (neural process unit) device
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">driver.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">The original NPU device driver has approximately 30,000 lines of
code for memory management. On the contrary, the GMEM-based one has
less than 30 lines of code calling GMEM API, with approximately
3,700 lines of code implementing the MMU functions. This effectively
saves over 26,200 lines of MM code for one driver. Therefore,
developers from accelerator vendors, including Nvidia, AMD, Intel
and other companies are welcome to discuss if GMEM could be helpful.

Using GMEM-based driver, it is possible to write a C-style
accelerator code with malloc(), whose underlying mmap() syscall
should include MAP_PEER_SHARED according to current GMEM
implementation. Importantly,
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">GMEM
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">guarantees a coherent view of memory between the host and all
attached devices. This means that any data written by the CPU or any
attached accelerator can be seen by the next memory load instruction
issued by any attached accelerator or the CPU. Furthermore, the NPU
device was able to oversubscribe memory by swapping memory to host
DDR. Note that this
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">memory
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">oversubscription mechanism can be universal if the physical memory
management is provided by GMEM. Other potential use cases of GMEM
could include the IOMMU driver, KVM and RDMA drivers, as long as the
device needs to manage external memory resources like VMAs, MMUs or
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">local DRAMs.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
--------------------

Discussion

Physical memory management
Most accelerators require the host OS to manage device DRAM. Even
accelerators capable of running an OS inside the driver can benefit
from it, since it helps avoid synchronizing management status
between the host and device. In Linux OSS EU summit 2023, Hannes
Reinecke from SUSE Labs suggested that people are concerned with the
memory consumption of struct page (which considers all generic
scenarios for the kernel). This leads to a possible solution that,
instead of reusing Linux struct page and ZONE_DEVICE mechanism, GMEM
can implement an isolated buddy allocator
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">for
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">the device to instantiate and register. The isolation is useful
because device DRAM physical address space is independent.
Furthermore, the isolated buddy allocator can utilize a customized
struct page that consumes less memory. It is worth discussing if
accelerator vendors desire this solution.

MMU functions
The MMU functions peer_map() and peer_unmap() overlap other
functions, leaving a question if the MMU functions should be
decoupled as more basic operations. Decoupling them could
potentially prevent device drivers coalescing these basic steps
within a single host-device communication operation, while coupling
them makes it more difficult for device drivers to utilize GMEM interface.

The idea of GMEM was originated from Weixi's PhD study with Prof.
Scott Rixner and Prof. Alan L. Cox at Rice University.

[1] <a class="moz-txt-link-freetext" href="https://arxiv.org/abs/2310.12554">https://arxiv.org/abs/2310.12554</a>.

Weixi Zhu (6):
    mm/gmem: add heterogeneous NUMA node
    mm/gmem: add arch-independent abstraction to track address mapping
      status
    mm/gmem: add GMEM (Generalized Memory Management) interface for
      external accelerators
    mm/gmem: add new syscall hmadvise() to issue memory hints for
      heterogeneous NUMA nodes
    mm/gmem: resolve VMA conflicts for attached peer devices
    mm/gmem: extending Linux core MM to support unified virtual address
      space

   arch/arm64/include/asm/unistd.h         |   2 +-
   arch/arm64/include/asm/unistd32.h       |   2 +
   drivers/base/node.c                     |   6 +
   fs/proc/task_mmu.c                      |   3 +
   include/linux/gmem.h                    | 368 ++++++++++++
   include/linux/mm.h                      |   8 +
   include/linux/mm_types.h                |   5 +
   include/linux/nodemask.h                |  10 +
   include/uapi/asm-generic/mman-common.h  |   4 +
   include/uapi/asm-generic/unistd.h       |   5 +-
   init/main.c                             |   2 +
   kernel/fork.c                           |   5 +
   kernel/sys_ni.c                         |   2 +
   mm/Kconfig                              |  14 +
   mm/Makefile                             |   1 +
   mm/gmem.c                               | 746 ++++++++++++++++++++++++
   mm/huge_memory.c                        |  85 ++-
   mm/memory.c                             |  42 +-
   mm/mempolicy.c                          |   4 +
   mm/mmap.c                               |  40 +-
   mm/oom_kill.c                           |   2 +
   mm/page_alloc.c                         |   3 +
   mm/vm_object.c                          | 309 ++++++++++
   tools/include/uapi/asm-generic/unistd.h |   5 +-
   24 files changed, 1654 insertions(+), 19 deletions(-)
   create mode 100644 include/linux/gmem.h
   create mode 100644 mm/gmem.c
   create mode 100644 mm/vm_object.c

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------dgLeyw0jf57U0fDoB74PxMLW--
