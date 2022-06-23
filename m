Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383CF5572AF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 07:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A04113E79;
	Thu, 23 Jun 2022 05:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3EB113E71;
 Thu, 23 Jun 2022 05:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6wG18WEKdvqf/u6KLsJL4dMs2sZcT33nhGOnAyNJbsLQpzGOXpo81APojKM5U4ZFmipJMJg1FbHZ8LkWfZkiMamBjQC1CECojsP+lRcHLCvR/bXsrg0Rr//vNUjml90Cl6xinuQNSy9F3fSV0KTr4JNmLOdA1FEAFHWALcp85dqQhIVY5mcYqtiE06ghtMmxIBbWwY8eN9JPsjLxOIWh2QFy1BHPdrEgp/TtifcE4jfIYAcyGtNg2rAf5QfhJnreHgW9Xz0AWd+TEYVp35a7JBsYUARH8kM7Jl2VLvekMeSbWJpJvMaljy0OMCqrZmuti2WgwYzQqFvC54TBBh4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNn/2LIdCm4eUsFzNSfT8cUVDNGx+TKf5ryiEuHlYP8=;
 b=QVsmsBSrekBG55wUkedNTvxGejg3ZFglzM6WAsvQwkLidD/sXJdYewRil+HJPWAZO/IR3Yg+XrXkT3yilZIbF5RnJPHm4kqaZCs6Z3Oix9y8kE86XUtkE0Y84a1eN8BDHTfK2JN/IIrIAv4H+gqGraI99GQZPJ7FleJlOXT9G8vTucVg79FaxMHsMRiFqwvYqeH5FsQetrevwLE/mPhJwQmCO0HJd5M4tzfi6Cq+tKSFmfWOepB8W16eaq9TMzpS70Rz8hd0s4L8S+W8/Z3oU3JtNc7wkOQDDV0Bz57rIyM6aoh2Yd1T6g8KlGRNOBeFD3UD/9EsJ/2vbfoNalqxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNn/2LIdCm4eUsFzNSfT8cUVDNGx+TKf5ryiEuHlYP8=;
 b=tokZO2lpUi6wyJ1VnE+Nb1aWEZIeUMGeJ7LAyGYo99mXCx6tLJ3OjJILWs7FCzayI+CUKFLq/ilwWCMKCp5ULYSuz8+i/VZ3oRSHm3HAPXzOOKJEWtfiqojEcPB9xCJNzU1ybq5rB7APChbpF6d2Bwy4K5mCvRyxxjzNZoblmS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3580.namprd12.prod.outlook.com (2603:10b6:5:11e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 05:52:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 05:52:15 +0000
Message-ID: <29ca5b47-76e6-0850-1062-0b3a4f513303@amd.com>
Date: Thu, 23 Jun 2022 07:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] drm/amdgpu: Follow up change to previous drm
 scheduler change.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-6-andrey.grodzovsky@amd.com>
 <87fa2e6e-b519-11ef-65f4-7ab5ca091973@gmail.com>
 <2f22b90f-74ca-f70d-68ed-4dbf49360e2b@amd.com>
 <b011246b-fe55-0385-a64b-585c0baa2863@amd.com>
 <76e95c1d-83a0-2cd4-518b-7b769e963d13@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <76e95c1d-83a0-2cd4-518b-7b769e963d13@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77fc4d43-0469-432e-d821-08da54dc86ab
X-MS-TrafficTypeDiagnostic: DM6PR12MB3580:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB35802016C2DBDABA9744AB1083B59@DM6PR12MB3580.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhNUhpJQOV8Vb9VeqjGdGErd1aFfwOCUHh/qxHGuhfGcpJfx0S6B7i2Kl8Ih1GR2tTFBBi2HT5eQrFPEkAbQrFu3UNuKkYvzfsviTv0JI3WKLyEs31EfO/Mg7SVfUBf/0zwVGav/vJ3sV1mrcRqArJ0iHv+VpGjum++dZ3GC/rXFdLSJvuRJPin7NNBAl5UUdVzKlizpuwjfq7u6TUsvq1whrNgDYJkyDBIXlRF/eX49MjS9j7FgZQVZTQeOHqB1sv7SizUp+4hR4jdaVNeNbmHvE7zWJWqUXojfmlVCPlHlCmv5weZtYQuLB6ItyrItrdc1zoEfkBVtVlJ8FakEMp6UAIUw3uG+VUaP1ofJG9NBxz7gECVD9B/Ga0xdJ9bW0NgyvG0GKXZ0FY4luAqYNJ98D1VdUWZBC81elH220FNNCWJWGk1wMpT5pePmyPpOYTlFrowRo5FnY0UObkINAbSxkmTq6NqYs7ZwQlSpPoQXAGmtbykSwxzofIxZVy5xfYS8BitGiLq4vmlWx0tuHmtCMZDiBv3BLksnuoCCINXw11iFif/YGVGaqshZEmreXbh5SqL0ZboOKq3lvElHvnDQwbGOLPdduQlhxybca9D8i1qVhSA1ZxxGXiiQNeYCmc/D65JcGlQ+LNMDgTakTvRDZjm5J41JAJKzluX1nRuKnYNUOvKghAK+udaWPk/nQWwb2PNnhEz64/IT5ncNKfbnhgDekBj7gmpWD3Za7VH8s+RwbafiAXotIzWNcrR9n22n1T5E4F6GdOs8PvPXxP0r3tIKert7UIlM3kp7Mtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(6486002)(26005)(6512007)(316002)(8936002)(31686004)(38100700002)(36756003)(86362001)(110136005)(2906002)(66556008)(4326008)(8676002)(41300700001)(83380400001)(66476007)(31696002)(66574015)(53546011)(478600001)(6666004)(5660300002)(6506007)(66946007)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEkvaFBzZm5HZ3FCYzNYb25lZFMzK3c3akZjZXptYm11Y25VT1JEN2xVUjZH?=
 =?utf-8?B?c1FwVE53NzMzVDNMa1ovMUUreHg3VGRrT3Q3NFUxZlZyWS9wenBUQ2RlMzNB?=
 =?utf-8?B?RWU2VDM5RGVaZWQ2dmduYzdFdHN4bW9BSGFUVERPZ2t0cENNdUx2blphMW80?=
 =?utf-8?B?UXlJdWhMcGhMVEdnUXpISnBGTE45RW9OVGF3VnI4RFdzNWZON1hnOHAraUI4?=
 =?utf-8?B?WFZyN0VGdCtVb0VsZXVWTnJReS9FcXBVUk9WTUJBV0lBaWVkekhINGF5dzM0?=
 =?utf-8?B?a1FhTUkzK0FGaFpSQjV1M3lVYlBtSEZGOHpEaTg2aGNyRGJvYlFiVkJiTjB2?=
 =?utf-8?B?VHlBeVNhM3M5NzY4S05xMG5iU2NZYlFjTVR4Y1p5VHA5dDRIMHA3bnFsVERV?=
 =?utf-8?B?TU1hVElMZ0N1RHRIa0JNZHlSUDMzY3JyZ3gzNGVxZ1JYMUsyc1drZ1JIMmJU?=
 =?utf-8?B?SmpHS1gvdVVIR2crZmNYWHF1ZFZHU3JyV2w4aW9Pa1ROUXUxdGI5SGxTc0pL?=
 =?utf-8?B?bk13RHVCbUNIMVRPWFZtbllLY0dBWUZSRm8vQTFrYkRTcGV0TTdKak9mUk1W?=
 =?utf-8?B?R2x5Y2p5aUliTGg2bGloeXI2SzRMbTBsMjRoazFkcDVJVVZxYU9LZXRoSlR1?=
 =?utf-8?B?TFRGT3FjOTdCajQwZGswS0lzQkpCVkVpZHJVMkZDaTNYaDRVTm5yVGh1S29Q?=
 =?utf-8?B?TG8zQjczNjd0ekJnMmhYaTdhWUs3WVJhMC9PUW5qaHhGL0pWQlRGbTE2bjJK?=
 =?utf-8?B?aDRrdUhORkNnaS9VYVY3TGtHNkE5RDJhNTJKY1VFU2ZzM29GaEZpa3ZlMnNw?=
 =?utf-8?B?NTJ5akgyN0lzdlcvcndCVzdkUlVYM3JFbnE3ckppZ2hkSG5ORFcrTmNlY1Bl?=
 =?utf-8?B?L2crNFBjSkhFVlJiYlR2aEdCUjMxMFBLYlVaeWJjUlYreXVUZmMxZ1Z4K0FT?=
 =?utf-8?B?WkdnWjR4dlVjdGxpZ25mN3N2M0QvOW9rRStsQ3p1S2l2WHFzRm5mL2I0WU1m?=
 =?utf-8?B?Zmp3ajlwYWcrSmtGMzd1L0tJejF0b016cFdNL0x5V2FoTEYzVnowQUVyYUJT?=
 =?utf-8?B?ZUh6MVZaVVRzeWNJa09MRVl6UE4ybmJEOUNqVExVdldZYUxFZmZHTjl6L3RH?=
 =?utf-8?B?dG5NcWZFKzRJME9GSXYyaW95RXA0cVlyNjhoMHFmNWczMHN2Q3NldENzMDhH?=
 =?utf-8?B?cnl2SlJKNDhzaC9PMGZuTThxd01DSDY2SWtNVHZTZmJVQXcza2JDcVhZS2FL?=
 =?utf-8?B?ZHNDQnNsRUp6TDdaNGdpNzg0dk5ITmxWZHZseHdVQUc1Zk1sS1Y1SU43bURR?=
 =?utf-8?B?MFpicU9aMkxDN0pCUU5PRG9MYlM0RitiVllVeGVIZW0rTUdFK2hGc0E4dGF5?=
 =?utf-8?B?WXNjMWN0R3Z1WkNYN3pPZDFTVG5oMnB4UWxaQ3EvcEY2TFhVYURRRlZJZ2dy?=
 =?utf-8?B?VFI4VTJLTlNGTVVidjVRbHAwbDBNdkV1aDNBUEVRUGt5cElrSDRBTVBPMzg1?=
 =?utf-8?B?MkF3S1N0S1BLTm14eS9oR2lvM1Zuc2VjV0tiV2xEMkUyenRIVlZYYXozMUZz?=
 =?utf-8?B?QVBGVXA4YjRVVHBUang5OEFsbHVuUEVLWXpnUHFXVk1ielhSZlIvNTJPdHQx?=
 =?utf-8?B?cW9HMVVPMmRDdWVCNHp4VTBVTGxjSlVlbEpuZEhiNHpzZU5lQnBqNyt0MTh4?=
 =?utf-8?B?dkNVdENaRkRqL3BrK3dGNmNtU3VrMjdrZEtodEQ2K2RTeDgyRjlOdFBpclZX?=
 =?utf-8?B?VUJ2MkhxTjF5aU1qdDZHaGR2UHFLdmVhZ25IRGZXdkxoVzZvVjJSZ0ZxQkxa?=
 =?utf-8?B?czAwS20rVHJ6TGZTVlNsLytJUENFRXFwYytYaHZTeTBkSnZoMXpYSHpxdXhN?=
 =?utf-8?B?ZFZCSlFIMW5oNndadVdNTEpwRldUZmpVdHF3NHNQNjZZSmhzemNCcXR5TDBM?=
 =?utf-8?B?Zjl4Uk44aVJEQllBclUreFo1MlVmVWVoZGNqZVdqOG1mbm1ZVDVkQ21NOWJN?=
 =?utf-8?B?MmkwYW1tS05LVkhqcU5kcEhYQVhoS3ZvNmZORXZYM3VIb3ZDL1p6Vy9wK0RH?=
 =?utf-8?B?SzJkS3QwbUk4elZXUTF5bnRrZVp3c3hxTGdEbk1zM1M3ZVpQeVpJTlIxZkFs?=
 =?utf-8?B?RmVtMFI5Z08xRDBhaU5CWGFGU0FISWtmUFd2QmVtVWVUOHpNeE9OZjdhQWVY?=
 =?utf-8?B?NnFwM2hGYWM0ME8wMGhJVnBqdUFqWXNJTUdRbExubHBGYjJudW5nOGkwUzF6?=
 =?utf-8?B?QTQwdXU3UmllaW41SHZIMlBrSzI5V0JiMk9SdVhKTGVSaFc1alBpYWMwMzY2?=
 =?utf-8?B?ZVROdkNjVTRUK28zZ3IvalZYUWJRaXdyVlU1V1h6SG8zL3JOTTNvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fc4d43-0469-432e-d821-08da54dc86ab
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 05:52:15.7012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xEItZnVgNSDe2/iM6I6UKzxFSexyt457Q2tsZJg0nTjWWRU5989R/+nUdQnwT56
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3580
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
Cc: jingwen.chen2@amd.com, monk.liu@amd.com, yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.22 um 19:19 schrieb Andrey Grodzovsky:
>
> On 2022-06-22 03:17, Christian König wrote:
>> Am 21.06.22 um 22:00 schrieb Andrey Grodzovsky:
>>>
>>> On 2022-06-21 03:28, Christian König wrote:
>>>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>>>> Align refcount behaviour for amdgpu_job embedded HW fence with
>>>>> classic pointer style HW fences by increasing refcount each
>>>>> time emit is called so amdgpu code doesn't need to make workarounds
>>>>> using amdgpu_job.job_run_counter to keep the HW fence refcount 
>>>>> balanced.
>>>>
>>>> Could we now also remove job_run_counter?
>>>>
>>>> Christian.
>>>
>>>
>>> I am afraid not, job counter is needed since at all times the 
>>> refcount on the
>>> embedded fence cannot drop to zero because this will free the job 
>>> itself before
>>> the end of it's life cycle. We have to be able to differentiate in 
>>> amdgpu_fence_emit
>>> between first ever call where we init the embedded fence's refcount 
>>> from scratch using kref_init
>>> to repeating calls when refcount already > 0 and we just fake 
>>> increase the refcount to align
>>> behavior with pointer style fences in other drivers.
>>
>> Well what we should probably rather do is move the init out of emit 
>> instead.
>>
>> The only down side I can see is that the sequence number isn't know 
>> on initial init and so needs to be zero or something like that.
>>
>> Regards,
>> Christian.
>
>
> Not sure how this help, the problem is not there but in 
> amdgpu_job_run, for embedded fence and resubmit job in pending list 
> amdgpu_job_run
> will be called twice or even 3 times with recheck guilty job sequence. 
> I am supposed to do dma_fence_init to embeded HW fence only on first 
> call while on second and
> third only update sequence_num and increase refcount. How can i 
> differentiate between first and non first calls without job_run_counter ?

Yeah, good point. We should really stop re-submitting jobs altogether in 
the kernel and move that whole functionality into userspace.

Christian.

>
> Andrey
>
>
>>
>>>
>>> I guess we could assume that embedded fence is all zeroes before 
>>> first dma_fence_init  if assuming the job itself
>>> was allocated using kzalloc and so u can look at dma_fence_ops == 
>>> NULL or maybe seqno == 0
>>> as a hint if that the fist call or not but it's a risky assumption 
>>> in my opinion.
>>>
>>> Andrey
>>>
>>>
>>>>
>>>>>
>>>>> Also since in the previous patch we resumed setting 
>>>>> s_fence->parent to NULL
>>>>> in drm_sched_stop switch to directly checking if job->hw_fence is
>>>>> signaled to short circuit reset if already signed.
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 
>>>>> ++++++++++++++++------
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>>>>>   4 files changed, 25 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>> index 513c57f839d8..447bd92c4856 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct 
>>>>> amdgpu_device *adev,
>>>>>           goto err_ib_sched;
>>>>>       }
>>>>>   +    /* Drop the initial kref_init count (see drm_sched_main as 
>>>>> example) */
>>>>> +    dma_fence_put(f);
>>>>>       ret = dma_fence_wait(f, false);
>>>>>     err_ib_sched:
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index c99541685804..f9718119834f 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -5009,16 +5009,28 @@ static void 
>>>>> amdgpu_device_recheck_guilty_jobs(
>>>>>             /* clear job's guilty and depend the folowing step to 
>>>>> decide the real one */
>>>>>           drm_sched_reset_karma(s_job);
>>>>> -        /* for the real bad job, it will be resubmitted twice, 
>>>>> adding a dma_fence_get
>>>>> -         * to make sure fence is balanced */
>>>>> -        dma_fence_get(s_job->s_fence->parent);
>>>>>           drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>>>>>   +        if (!s_job->s_fence->parent) {
>>>>> +            DRM_WARN("Failed to get a HW fence for job!");
>>>>> +            continue;
>>>>> +        }
>>>>> +
>>>>>           ret = dma_fence_wait_timeout(s_job->s_fence->parent, 
>>>>> false, ring->sched.timeout);
>>>>>           if (ret == 0) { /* timeout */
>>>>>               DRM_ERROR("Found the real bad job! ring:%s, 
>>>>> job_id:%llx\n",
>>>>>                           ring->sched.name, s_job->id);
>>>>>   +
>>>>> +            /* Clear this failed job from fence array */
>>>>> +            amdgpu_fence_driver_clear_job_fences(ring);
>>>>> +
>>>>> +            /* Since the job won't signal and we go for
>>>>> +             * another resubmit drop this parent pointer
>>>>> +             */
>>>>> +            dma_fence_put(s_job->s_fence->parent);
>>>>> +            s_job->s_fence->parent = NULL;
>>>>> +
>>>>>               /* set guilty */
>>>>>               drm_sched_increase_karma(s_job);
>>>>>   retry:
>>>>> @@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>>             /* got the hw fence, signal finished fence */
>>>>>           atomic_dec(ring->sched.score);
>>>>> -        dma_fence_put(s_job->s_fence->parent);
>>>>> dma_fence_get(&s_job->s_fence->finished);
>>>>> dma_fence_signal(&s_job->s_fence->finished);
>>>>> dma_fence_put(&s_job->s_fence->finished);
>>>>> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct 
>>>>> amdgpu_device *adev,
>>>>>        *
>>>>>        * job->base holds a reference to parent fence
>>>>>        */
>>>>> -    if (job && job->base.s_fence->parent &&
>>>>> - dma_fence_is_signaled(job->base.s_fence->parent)) {
>>>>> +    if (job && (job->hw_fence.ops != NULL) &&
>>>>> +        dma_fence_is_signaled(&job->hw_fence)) {
>>>>>           job_signaled = true;
>>>>>           dev_info(adev->dev, "Guilty job already signaled, 
>>>>> skipping HW reset");
>>>>>           goto skip_hw_reset;
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>> index d6d54ba4c185..9bd4e18212fc 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring 
>>>>> *ring, struct dma_fence **f, struct amd
>>>>>       if (job && job->job_run_counter) {
>>>>>           /* reinit seq for resubmitted jobs */
>>>>>           fence->seqno = seq;
>>>>> +        /* TO be inline with external fence creation and other 
>>>>> drivers */
>>>>> +        dma_fence_get(fence);
>>>>>       } else {
>>>>> -        if (job)
>>>>> +        if (job) {
>>>>>               dma_fence_init(fence, &amdgpu_job_fence_ops,
>>>>>                          &ring->fence_drv.lock,
>>>>>                          adev->fence_context + ring->idx, seq);
>>>>> +            /* Against remove in amdgpu_job_{free, free_cb} */
>>>>> +            dma_fence_get(fence);
>>>>> +        }
>>>>>           else
>>>>>               dma_fence_init(fence, &amdgpu_fence_ops,
>>>>>                          &ring->fence_drv.lock,
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> index 58568fdde2d0..638e1d600258 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> @@ -267,10 +267,6 @@ static struct dma_fence 
>>>>> *amdgpu_job_run(struct drm_sched_job *sched_job)
>>>>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>>>>       }
>>>>>   -    if (!job->job_run_counter)
>>>>> -        dma_fence_get(fence);
>>>>> -    else if (finished->error < 0)
>>>>> -        dma_fence_put(&job->hw_fence);
>>>>>       job->job_run_counter++;
>>>>>       amdgpu_job_free_resources(job);
>>>>
>>

