Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB1557E50
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 16:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D859110E1BD;
	Thu, 23 Jun 2022 14:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6455B10E1BD;
 Thu, 23 Jun 2022 14:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfLwXEyTBTFlvd6nV9AW6Ws1fieL2vVFiyMh5o/zVgpYRCAmYjKjQNRk770QBjEMRkK6YyAkNIoD+qW05SZ8J32/sxPz202Xcuf9WVvMFcEI4Sco+IDs/taQB0w9Ib8Z5JumIv0IpaQi+6fuy+iJWlzT4hV5K9K5d3DCAeT7KJVe/u7diCom1zdH6XpXEIpWMV2lPfbCYnMc8BmsPvRO/dHM1JAzUshTMFphmtFtt34r7LOz7qX8OWCTToOu2b5BalcI/RlEtemL9vs2KWAidqEvw8knZzUXDuBWMi68UH8jhKKBEVxQGCFCckq4k/EzDYrdM2frrO+F0DC14ZS92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c68YUIB63emBMy0ngz8RIjRqjNHE9qGH4P87pSfL8EM=;
 b=GnwUPUafU0kjhsUuK2/oGI0/jALdkGQc327v1W4Xh8RL6NiHhd1nU6M9MVx8MQqPEWDWeMpvM1fAXW4gOng+Tog39wBCpy6An1NWoP6d1BVonKXvRQAhZNLjxkgikCMPXAdRPyGNC+1BaebQG4YNMqEvxN3UnjyBwqj+544Broua/S0kWjn6rAnev/FaIKHN4cCHsqknJRX5OXqw3T2zDnj63clOdBZwq3jFKKfr2IvbDlI4JA3OeXh76DrVdw8qFclu2Zb77YNFvoFLmKicZjS36JGASatUwD5TmjPbYbFIogP5Q4lNo7Qcah/fMghFRA3upNs60yguJXwqjfBYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c68YUIB63emBMy0ngz8RIjRqjNHE9qGH4P87pSfL8EM=;
 b=fJUDeqVmUSlpxLD6RpEb8TdXjgoqB0sgXqcYujaI8g4ZJa4j2g8Ioh5hNf+LwyLPqH9BzLnSb5H74YKj7Q7K8NYi+xXm51wMI6snrFn/5MVGxkeM7BsENUUgnW+/IS7Jx5vwAfPHnh87E3XQsxfz8f2yR5bBoY58Bc4QG6WNB3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4249.namprd12.prod.outlook.com (2603:10b6:5:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 14:54:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 14:54:09 +0000
Message-ID: <a0f54b33-9a26-af5c-84c2-65196f9e5b6f@amd.com>
Date: Thu, 23 Jun 2022 16:54:02 +0200
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
 <29ca5b47-76e6-0850-1062-0b3a4f513303@amd.com>
 <e911dec4-0b53-ab01-1507-a75c25fd9648@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e911dec4-0b53-ab01-1507-a75c25fd9648@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0075.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cd0b48f-0378-4a14-486b-08da55283a12
X-MS-TrafficTypeDiagnostic: DM6PR12MB4249:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42492EB66D433894CF619D4083B59@DM6PR12MB4249.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdvORbquhSI3rAStKYhTy17SGL+DdgqVrzicpFOU4P8J91eCx3vI3I8PkKj8bgsUEpbhmTT9EyutdpidGngWvfPlusEOgvtVHY+feNxu91gv+RogUlpepfNKQl6HUDMw8thB0tadWHenHSe07KVQ4UN1zOu8RzBzABZR7nqGPm4AoAIZBv465ZQVZ1XPj7hBQl7L5jcP9+UZCvzqV2AwvnUVLzI6FdMLs6yDK06IwmbObnju5d3K1dKTmaQRaOmSjGgjD3aY03l4y5VbQmXqdgXCW2WcxFOQ0L0z7BGR/BD6xyAzx4vhB1JGs9XDheBrw3JGbUayicWg5u/ZTmiAT8GpsRDECQdjaPPPY8fgCO3Rsd1zvs1BapktUojngFBALbOKrRr3uOkKen+GCU46Q8Mnb/IhsQ5YwvsrgYXtLkJQTAjBlTUZHJqneHXcjP0CuJ9O3NS/EUu4yWElWSRQ/f5unH61Rk/8lieQnnFOjXeXKoECvQztSn1/Vupd2SgSVfNsGyksalDVQE6cUjXuW0KNHqyADEGFznLmwBPPO4/qvSUVs5KmvPx5K3CCf2DMgxKcDGllvpLqnJrjKlCbIP2UmWLsPiUk0q4JiZIvNEr3qbja80lHg7SJeXeyyXO40iC81vYHfG+9W/+dcPmTPWxCFOEsQFR1lCWivmfVVmF6BUhhepvXtU61Jbs8ZVIbqFkRvsvn5neQk7T0rzfs/BsaCBP8+Re/4I/gqI4PHC6NKeYWw1Z/6CPon3F/mxFJmuI2vE54kLkT4afTWn/8QmyHa6qG7v9Z4UdR8Ach/WE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(6506007)(31696002)(6666004)(2906002)(6512007)(186003)(36756003)(478600001)(83380400001)(8936002)(53546011)(5660300002)(6486002)(31686004)(66476007)(86362001)(66946007)(4326008)(66574015)(316002)(38100700002)(66556008)(8676002)(110136005)(2616005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUR2YnJGZEJuUU1RNllxcytDTnp2UzZ0VzFlbG5NTnhpTmxJR1JIUVk2S1Bn?=
 =?utf-8?B?ZkZyWmlSNkY4eWIydGRmc21PcDNzbG1seGVta2QyeHBvYXpCQmNqQmJjemdl?=
 =?utf-8?B?dEU1MXhSZWkwM01YQkFHckRhbW83QjlhbG0rUGZGdktKNVNiVmFmbTR2dzhr?=
 =?utf-8?B?Z3pBN3I5UVgwaE8vcVFhMXdKQWZQQTd3cFNCbGNLNkpzeHB6Zjhsa0ovRHdz?=
 =?utf-8?B?K0dZMDVkaTNuMXdjSjVuTldVSXdINGhOc1p1M0M1VS9PS2VBbWtRNG9BZmJr?=
 =?utf-8?B?Yk5KUXVhN3dzbDBqRE11SklGaE5UR2tNQlZLUHNCMXM4SjFHYnIyczVXVFZN?=
 =?utf-8?B?YzVRWjFmUm5GT0NPejNGWmFZQlEwdHo3UnBCWWxSL0hxNlZvbkJtUmhDbDk0?=
 =?utf-8?B?RUdDc1lucnRIb0dJUUJycnFzODQ4bkltK1ZCNGR3ZUdZdEVWNzVjWWloOTVL?=
 =?utf-8?B?ZXhwZ2V2S0w2VEdEL0dhRFpnbGdzeGRXMG05ZzJ3M1hFVFlmN1YxalJHTHpp?=
 =?utf-8?B?NUFkQ1ZKSElWTE5TeGdBSjBvTHpOOXR4YXNDbXNzVHhQVkdGTDVaZUxFZlVp?=
 =?utf-8?B?MkpzSFFhZUJ0OCttTTNkcDdadnh2ZEo2cEJDZ0NRN2s4QzdGcDZ2MXRaKyt4?=
 =?utf-8?B?S3NDRVNIaWk4R3crY3RYVGtrUEZjTXVjeFdKbXV5aVE5czMwaDlPbnFxTmQz?=
 =?utf-8?B?Mjc3ZWZtSkJ5ODhQUlR2Z1JpbURTSFlDeTFRN2ZXM0ROMVhwa29LMzUrdWk0?=
 =?utf-8?B?ZUNKM0NzTnFlSzQ0MFJ6SU5lS0JDc2M5STd2c2NwdG9UbC9XUUN5cXdlMnV4?=
 =?utf-8?B?ektQYjJ4VE82TW5RemR2cGRuTlJCcTVVeHNaZkNHM1BjNWtmWFdPMGljdmhx?=
 =?utf-8?B?U211S3JOMjd2REpXNldRc0tMRnNjMTdWcHdxYkRJTGNMNU1xbXBWcENpaFRG?=
 =?utf-8?B?VFo1M0xZOEVnUG5zcXZGeVIwNEgyTGMzZk1OaEtwREE5dTRUSyt1OWpodnFy?=
 =?utf-8?B?RWJSRkNmcmpwREVMZFdkWWtrSlBzeHlkSFpXMGkxcUxnNnljK0llNVdoN3Z4?=
 =?utf-8?B?SUVJNFN2bXpQeFRWQ1Q1SXVhTnhrTVlGUGZncG50NmgrUklZejZpaXppRm8y?=
 =?utf-8?B?cnl1bGVWY3pTY2NlN1J0WWllSkpXUXhWNEkzOTFVVDJNc3RWcjNUWE12VXFj?=
 =?utf-8?B?NGlVR3ZSS3M4MEFySjZScHIvUUU4dTJIejdldGlucy92Rzg3ZVBpZUZqd0Z4?=
 =?utf-8?B?cVBGMHFHSk1xNWJBS1JmT29maHJ0Z1BoMUJQbzJOZ0ZzRXlSUGMwNlpta2M1?=
 =?utf-8?B?SFlDMmZ0K2sxRkd1N1dnb21zQWRIcWluWWloYkdDUExwUUo5bjJRUXJ1QzVh?=
 =?utf-8?B?SDV3Z0JudFczb0tNdEIrUm9VOVpQR0g0SEVuU0NDQnRZakdIRHlnQ0thM1J6?=
 =?utf-8?B?OFFuZDUvcDJkT1R6VW0rL2hRbkcxT2tVQmN2WnA4akw1TGVrM2FVdFRFK3kw?=
 =?utf-8?B?anNSZEV0KzQrWFAya1oreG5oYlg4YzlIVkx6YVFRWHdNc2VzUHpQdC9OMHlU?=
 =?utf-8?B?VGRuUHVDcVM5c0ovQWlXQUtIYjVOcEE0N2pzTDVLVlF3UDdPZG1lWmpOSlNY?=
 =?utf-8?B?bW0xR0F4enZ3ejB6aHNHMEtLZk0yajlsT29xSTFqbWRqMitHelcwdHF2cHBM?=
 =?utf-8?B?dWtoMTJwa0pmaVd2RmZoK2M3VThYVExQeDdsRldxSlQrWk1aYlh6QnhyMHlr?=
 =?utf-8?B?aVNkcHR0OTBuWkZWUEJaaWdHMFZKMURKa25yRVdUd3I0YUx4SW1lSDgwbFB4?=
 =?utf-8?B?S1BKY2lWV3d6MDJJSllwQ0xlckg4MXRqb1U1NVYzbmhlZjFIdGJHUVBmellT?=
 =?utf-8?B?R2Fmdyt5RjJEV04wQ2dQREdrYU1VOGhsbkpZbUc2N01oTEN2QnJvV1BVeitZ?=
 =?utf-8?B?MWZEemlTZjVBeTJvL3pKcmwxakhqcXRxYlZhR0dLOFV5TEZ3SUlHcXdNUElm?=
 =?utf-8?B?VkpBTGpTOFJ1R3FWY00xMFJQWnhPQ2lsck5hbVlPcDcvMHozN0dXRGY1OUpZ?=
 =?utf-8?B?Mk1LVndmODJFUFpkdTlGQWNTckhYQWFYWnZkMWZVRHV0c2IvM0UweGRhaVVU?=
 =?utf-8?B?OC9xeHhRbXNxcGdZL3ZWdnVCY3JPVnBSWUJvbWV1aHdwV2JlaXVkL1lISy81?=
 =?utf-8?Q?Rf+89TtcvjGenhbHR+EtOdheZRKgJ9YwQRg7nqk3l0RL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd0b48f-0378-4a14-486b-08da55283a12
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:54:09.0488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GRm8TD2oqwpfVSFYhda1Jt5I0bhhnpS6H4Kaf0WrnBQ4SlNRI26PTdPleY25kjm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4249
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

Am 23.06.22 um 16:51 schrieb Andrey Grodzovsky:
>
> On 2022-06-23 01:52, Christian König wrote:
>> Am 22.06.22 um 19:19 schrieb Andrey Grodzovsky:
>>>
>>> On 2022-06-22 03:17, Christian König wrote:
>>>> Am 21.06.22 um 22:00 schrieb Andrey Grodzovsky:
>>>>>
>>>>> On 2022-06-21 03:28, Christian König wrote:
>>>>>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>>>>>> Align refcount behaviour for amdgpu_job embedded HW fence with
>>>>>>> classic pointer style HW fences by increasing refcount each
>>>>>>> time emit is called so amdgpu code doesn't need to make workarounds
>>>>>>> using amdgpu_job.job_run_counter to keep the HW fence refcount 
>>>>>>> balanced.
>>>>>>
>>>>>> Could we now also remove job_run_counter?
>>>>>>
>>>>>> Christian.
>>>>>
>>>>>
>>>>> I am afraid not, job counter is needed since at all times the 
>>>>> refcount on the
>>>>> embedded fence cannot drop to zero because this will free the job 
>>>>> itself before
>>>>> the end of it's life cycle. We have to be able to differentiate in 
>>>>> amdgpu_fence_emit
>>>>> between first ever call where we init the embedded fence's 
>>>>> refcount from scratch using kref_init
>>>>> to repeating calls when refcount already > 0 and we just fake 
>>>>> increase the refcount to align
>>>>> behavior with pointer style fences in other drivers.
>>>>
>>>> Well what we should probably rather do is move the init out of emit 
>>>> instead.
>>>>
>>>> The only down side I can see is that the sequence number isn't know 
>>>> on initial init and so needs to be zero or something like that.
>>>>
>>>> Regards,
>>>> Christian.
>>>
>>>
>>> Not sure how this help, the problem is not there but in 
>>> amdgpu_job_run, for embedded fence and resubmit job in pending list 
>>> amdgpu_job_run
>>> will be called twice or even 3 times with recheck guilty job 
>>> sequence. I am supposed to do dma_fence_init to embeded HW fence 
>>> only on first call while on second and
>>> third only update sequence_num and increase refcount. How can i 
>>> differentiate between first and non first calls without 
>>> job_run_counter ?
>>
>> Yeah, good point. We should really stop re-submitting jobs altogether 
>> in the kernel and move that whole functionality into userspace.
>>
>> Christian.
>
>
> So i guess we keep this for now and see how to move resubmit 
> functionality to user space ? as a separate task ?

Well yes. I mean that's a rather larger project on it's own.

Christian.

>
> Andrey
>
>
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>>>
>>>>> I guess we could assume that embedded fence is all zeroes before 
>>>>> first dma_fence_init  if assuming the job itself
>>>>> was allocated using kzalloc and so u can look at dma_fence_ops == 
>>>>> NULL or maybe seqno == 0
>>>>> as a hint if that the fist call or not but it's a risky assumption 
>>>>> in my opinion.
>>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Also since in the previous patch we resumed setting 
>>>>>>> s_fence->parent to NULL
>>>>>>> in drm_sched_stop switch to directly checking if job->hw_fence is
>>>>>>> signaled to short circuit reset if already signed.
>>>>>>>
>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 
>>>>>>> ++++++++++++++++------
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>>>>>>>   4 files changed, 25 insertions(+), 11 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>>>> index 513c57f839d8..447bd92c4856 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>>>>>> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct 
>>>>>>> amdgpu_device *adev,
>>>>>>>           goto err_ib_sched;
>>>>>>>       }
>>>>>>>   +    /* Drop the initial kref_init count (see drm_sched_main 
>>>>>>> as example) */
>>>>>>> +    dma_fence_put(f);
>>>>>>>       ret = dma_fence_wait(f, false);
>>>>>>>     err_ib_sched:
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> index c99541685804..f9718119834f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>> @@ -5009,16 +5009,28 @@ static void 
>>>>>>> amdgpu_device_recheck_guilty_jobs(
>>>>>>>             /* clear job's guilty and depend the folowing step 
>>>>>>> to decide the real one */
>>>>>>>           drm_sched_reset_karma(s_job);
>>>>>>> -        /* for the real bad job, it will be resubmitted twice, 
>>>>>>> adding a dma_fence_get
>>>>>>> -         * to make sure fence is balanced */
>>>>>>> -        dma_fence_get(s_job->s_fence->parent);
>>>>>>> drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>>>>>>>   +        if (!s_job->s_fence->parent) {
>>>>>>> +            DRM_WARN("Failed to get a HW fence for job!");
>>>>>>> +            continue;
>>>>>>> +        }
>>>>>>> +
>>>>>>>           ret = dma_fence_wait_timeout(s_job->s_fence->parent, 
>>>>>>> false, ring->sched.timeout);
>>>>>>>           if (ret == 0) { /* timeout */
>>>>>>>               DRM_ERROR("Found the real bad job! ring:%s, 
>>>>>>> job_id:%llx\n",
>>>>>>>                           ring->sched.name, s_job->id);
>>>>>>>   +
>>>>>>> +            /* Clear this failed job from fence array */
>>>>>>> + amdgpu_fence_driver_clear_job_fences(ring);
>>>>>>> +
>>>>>>> +            /* Since the job won't signal and we go for
>>>>>>> +             * another resubmit drop this parent pointer
>>>>>>> +             */
>>>>>>> + dma_fence_put(s_job->s_fence->parent);
>>>>>>> +            s_job->s_fence->parent = NULL;
>>>>>>> +
>>>>>>>               /* set guilty */
>>>>>>>               drm_sched_increase_karma(s_job);
>>>>>>>   retry:
>>>>>>> @@ -5047,7 +5059,6 @@ static void 
>>>>>>> amdgpu_device_recheck_guilty_jobs(
>>>>>>>             /* got the hw fence, signal finished fence */
>>>>>>>           atomic_dec(ring->sched.score);
>>>>>>> -        dma_fence_put(s_job->s_fence->parent);
>>>>>>> dma_fence_get(&s_job->s_fence->finished);
>>>>>>> dma_fence_signal(&s_job->s_fence->finished);
>>>>>>> dma_fence_put(&s_job->s_fence->finished);
>>>>>>> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct 
>>>>>>> amdgpu_device *adev,
>>>>>>>        *
>>>>>>>        * job->base holds a reference to parent fence
>>>>>>>        */
>>>>>>> -    if (job && job->base.s_fence->parent &&
>>>>>>> - dma_fence_is_signaled(job->base.s_fence->parent)) {
>>>>>>> +    if (job && (job->hw_fence.ops != NULL) &&
>>>>>>> +        dma_fence_is_signaled(&job->hw_fence)) {
>>>>>>>           job_signaled = true;
>>>>>>>           dev_info(adev->dev, "Guilty job already signaled, 
>>>>>>> skipping HW reset");
>>>>>>>           goto skip_hw_reset;
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> index d6d54ba4c185..9bd4e18212fc 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring 
>>>>>>> *ring, struct dma_fence **f, struct amd
>>>>>>>       if (job && job->job_run_counter) {
>>>>>>>           /* reinit seq for resubmitted jobs */
>>>>>>>           fence->seqno = seq;
>>>>>>> +        /* TO be inline with external fence creation and other 
>>>>>>> drivers */
>>>>>>> +        dma_fence_get(fence);
>>>>>>>       } else {
>>>>>>> -        if (job)
>>>>>>> +        if (job) {
>>>>>>>               dma_fence_init(fence, &amdgpu_job_fence_ops,
>>>>>>>                          &ring->fence_drv.lock,
>>>>>>>                          adev->fence_context + ring->idx, seq);
>>>>>>> +            /* Against remove in amdgpu_job_{free, free_cb} */
>>>>>>> +            dma_fence_get(fence);
>>>>>>> +        }
>>>>>>>           else
>>>>>>>               dma_fence_init(fence, &amdgpu_fence_ops,
>>>>>>>                          &ring->fence_drv.lock,
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> index 58568fdde2d0..638e1d600258 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> @@ -267,10 +267,6 @@ static struct dma_fence 
>>>>>>> *amdgpu_job_run(struct drm_sched_job *sched_job)
>>>>>>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>>>>>>       }
>>>>>>>   -    if (!job->job_run_counter)
>>>>>>> -        dma_fence_get(fence);
>>>>>>> -    else if (finished->error < 0)
>>>>>>> -        dma_fence_put(&job->hw_fence);
>>>>>>>       job->job_run_counter++;
>>>>>>>       amdgpu_job_free_resources(job);
>>>>>>
>>>>
>>

