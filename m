Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5032554387
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80ADA1138CF;
	Wed, 22 Jun 2022 07:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91D2113B51;
 Wed, 22 Jun 2022 07:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgAaeK1dRK4lrSMNQrqBbyYrCh9TVwOxbgB/0gmRqd7pw6RrYZKHaq/JbF498/pCL3iw7lNvPYHChzaNkjthWzVjNSnshr6tjJCNcmtz21VUBAuAlAotKhIL+u4idfDS5t9lcwHczkN+/VoWqywwvd0YSKpCuGgi27j9tsT4JKMZY3QaCO+bHEU3/x6xlXr/84sGKtz+8CjJTf1Uf08/bK2+Cs3JbtGWloYj+glV6G4hVKg1qOLEOdaxTFfXW4/ax6rPqVPuAyfXggxmGN4WgUY2AUT5yvU7f8tCFz2ohKFHrrHb09W62xRHP+XgBqVfZoNbwjkY5X2GGnxDhL3n8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHPJisBy+6NP9cBsbgoOzU5uTz2SdRN8tH2NoOiNlLY=;
 b=GVi0lmZQGD7ufSPqRjx67cxWevbhJTIVYOP+eoXzGLKOvGsuqTw4BEHPApk7ChnaAvK2vFTUbSV02ys2i7vjZqsJI7K1sctQEFfmJzycoJ2iojEKaPpoxNkoV6bHaadKBsBiJrjJ4YlCLhPXYw7ZGwDZ8mARJbGAlfgHhzQr6ra/WjKbBiLZ9ar2FQpUsio29H5PuzrFv0WlxBuG6YbMc3Sz6gPYh1yy9Nz9aZNPwTRjuKraVFCRo0JjTMKYUNpkQHMqI4D4B+JYMu4IlJnnzX8u27Ci/IsF1n0lfbPfYmCC75YIiMZnJDK8LTAp5CyNuLlEofCOGVNWpsQ1maMUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHPJisBy+6NP9cBsbgoOzU5uTz2SdRN8tH2NoOiNlLY=;
 b=YINQU79p+kWZKpl1mt/baaogA0ctmLwVk0eRo/IfnOP8o9iQT3wHalavv8yLeF7z4rfVI/trfNLUhkVesS0eWBTZSdol1iJpGF+oQ6JBSyc3mP/WLXviFLREZzhk6PpzNme1XTOAE/oMb5KBYmTxvjmRR3WBdJIoOqR3Ocge6Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 07:17:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 07:17:35 +0000
Message-ID: <b011246b-fe55-0385-a64b-585c0baa2863@amd.com>
Date: Wed, 22 Jun 2022 09:17:30 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2f22b90f-74ca-f70d-68ed-4dbf49360e2b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 788bf8c0-6891-406f-6f70-08da541f47c9
X-MS-TrafficTypeDiagnostic: CH2PR12MB3895:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB389552CCBC7BB7F6DB7CF37483B29@CH2PR12MB3895.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RAxntpqistpxlUKXjtr8AMRnpxzVqK75iO8LWL8zNF+GLElouQK5nSHYYhLzNwX2nFlvyVhxpGUOijTSnF0J4oZM796//0sMEgsSTJlg83ao9HtS24dRULGseBS77XaFwOL743CxgELtOmmga9D6U4wSqc6KXase/rAAX1RZiXk9Z1jjQHpV57LVotqLZ1Wjk1M1n8MpRLXrXNYl7S1zOT3jxR/D5R/FScEptWX3HJ08KzJbw7OR9s4SSoWB2kqHwGEXG96GFByzFIAnN8KLYQkLoOQ/LBo5oITM+Mo++F9hpFE9JHj+AcMSJZeqUk6U2fYVb1b2cvTEzmmWMx+FCpNSkZRVD35NVa8FqDgHKazKi1eE1vyj8NJYsOd0f0fzpMAQ0IkS++TylcgbCj8kaG/f6LvXkAjoU9T4wJYymi862yGirM86xhFBYj/AHsg3u3Z5UgHcGU8ZiYR8Q1N+zMBCGoXkXSJ34k/ZlyF/noBt8ALglF4x3SSMMBty3auiHLD9cRdMp7fFMM8cDLbeFz91i+kbyCk3x7ihdApdKEYfo/riuqDL0D2wiefWYbtB2x+z1eeOBvbTx+SfMk+F44O20iuD4rEsdgpIpSx1bhM5IYcOB0IJBx31P/CJAHedm6mJv/PcXB5rTm1sTbuFkK3/QTJnQOdTJgzdZVrBq3PRULzfiemRTr4lfgXviHGoOQKOiF24Dn/VlkHu/4UKnR6Jn4D49cELNSGwMdVFolPBkDMQoAYdDObIXJikN1LgXzrYG2pAAmVbeqZBQcFKvkfh1VTFvbvS72XAxM7/nI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(86362001)(316002)(38100700002)(31696002)(478600001)(8936002)(5660300002)(2906002)(6486002)(31686004)(66556008)(186003)(66476007)(4326008)(8676002)(6506007)(83380400001)(53546011)(41300700001)(6666004)(66574015)(2616005)(6512007)(110136005)(66946007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0RUYWxucjdmN2JVdExTZDM0T0NxbUozbWxZeDV0Vkpjb1NtaEVOZ1BxQm5m?=
 =?utf-8?B?TTBNS051L2ZLS3E2T2NOZGFxVVA4aStBTHY2Z0YyT1d5NVQvc1JQVndQSkxk?=
 =?utf-8?B?UEtYRWMxb010cXBMTW5TbUlTRVRTbDRyYzErYm0yTEVWT0paL2dhcldycHpT?=
 =?utf-8?B?Umhwam1Sa2ZSUDBwK0FZSm5NMzNPUmI1VERqWm1TcmhqblJWSzUvT05DbUhp?=
 =?utf-8?B?cnlXd1ovaE5WbnhGa29idjlXaWQvV2dPVG9UK0JaT2l3WjkwLzZhSHh0QkJo?=
 =?utf-8?B?bjQ3bTVDbFJ4VWdjdkZFYXhWUXFOd1RuU1BOMTdUeUIrN01CNytyVUY1UnYy?=
 =?utf-8?B?ZVNxKzFYMjVrVHF1czJQNGxwNHJyU2dPWnJBMEREdTVMT1o3aEM5bTRYYmxo?=
 =?utf-8?B?RVo4RWd3UTBFMEIyUkczaWo2UkZWV1BoZERwZDhTa3A2NG1zS2dRYnd3UGtR?=
 =?utf-8?B?Y0tWTnhpQ1ViN0h2TEtUaTMrbWtrUWg0V1dHZHNab1pEY1ZvdmxQTUJ3bWlL?=
 =?utf-8?B?S05Iby9NWUQwTENIUCtMSGdZL2dYcTgrL3ptYWlBRE95VWlHY3FXZXgzQW5W?=
 =?utf-8?B?eW1xTHZ6UElzKzd0UGdpK1ZHcDV1Vy9zdDlaKzlMWVY4amoreUZFMkJpdnZC?=
 =?utf-8?B?MzBXSERUZDR6NHp0bVVHbzN4ckVxbEZMbGwzbUYyRXhkekFFaUM5Ym00VnRG?=
 =?utf-8?B?WEFMN3BTUFljNFNNWDJReVZhYkkyMXo4bTc5Tyt2cGFaTzYzbTlyV3ZGbHpi?=
 =?utf-8?B?aFh0VkE5WWRGdk8rSkI1eWRCUGwxdnUveWpRQmVTMkpQclhLL2NQQTdoblFs?=
 =?utf-8?B?NmVmdmxVOVk2VWZxdEhtTS9QazVaYUdidytOOWsvcXV3Zkx4UFdpbmpYWi9F?=
 =?utf-8?B?V2REYXVsT0owWHFVM2lLUVNValRCeE8zcTYyODgzZVMzVEJCRERwbWM4aGtJ?=
 =?utf-8?B?TlNGdE5ZMHJjVmRYb3Y3bnZJZ0NGZG5VSnRGcHJ2ZWw3NHpDNVBBTUw5NWJS?=
 =?utf-8?B?YkR0MXJLSDJwSGRSc1NPSHZmemk4T1ZSbVNPOVUzd21wK0VDQnhGZ2RvTFlU?=
 =?utf-8?B?WGEzcnNxc0JEVnVwU0JhY21JOGhZMnNoOUpLbEJDUk5DM1VWZzF4bkpzVU9D?=
 =?utf-8?B?Tk1WeDBFZnNNSzFxZ0tNMjUrd1Q1c25yMDR0MTZOWll0TXNPZEJTZzl2QmZW?=
 =?utf-8?B?c2RTNFNKME9UaHFvSWRtOVRZS0lCNGN6ODlFNVBObWxvb0lJU01pUU8wNlVV?=
 =?utf-8?B?Mk56Z0s2V0FGQUFja29BMUU0eDc3TU1YNUdQTG9tWGdCb0lzUlpGY2w5RFdB?=
 =?utf-8?B?cDhqRjlnZndvM09rdEhhWkNsTkpJeWFZTUhXK1llL3RlQmxwOE5qQkV2dlMy?=
 =?utf-8?B?d0JZczBqZXJXbjlMaytWbHB0eXFaY3VwSHBtbW9nSXJpN2NsTXIyUUpnbVh4?=
 =?utf-8?B?Z2xmNWpQQ1RCSXdJM2IyRHV6YlpmaHorSlExY04wcXl5b2k3bkI4UDQ3aXpQ?=
 =?utf-8?B?MXNvN3c5WWdic1N4aStaUzdOQXRhMCtNQ1RIR2VnTytoTE5NV0kyMUNieHpL?=
 =?utf-8?B?U0VHRE1sdE51eFNtNVJGbWZicVlmV0RnZXNIWm9RL2Yya0FSVWtJeklLeUZO?=
 =?utf-8?B?OXdTa24zSWg0cFRsaFdTc28vSUJmNmxIYU1RSW1uLzVZZmNoOHNlU2E0UUtj?=
 =?utf-8?B?NE5QcDNQckY1OTBtb0RoM0tKOG5YUC9WY1RUdFNZcTYyMkprZHlaQ1NLNlpz?=
 =?utf-8?B?WTZENk9NQWZjdGMvZ0Y1Qkg5bjV6WTg1NG1Qdm5oQ1E2eUwwQWJRVmhCYVBM?=
 =?utf-8?B?b1d4dTJpQzBXUXlpNVZqRk5TWWFtbWwydU1sS3QxRlNwWFg2THUwWFBJZ29r?=
 =?utf-8?B?QVczbUg1THVEYnJ4MDlBdHZuTUowK2xYQ2RpZ2lmV3NYWTNPd2RGcU1uT2tT?=
 =?utf-8?B?M1RhY3ZVVjRtZlU1dDQ2Qk94OUxhMFh3Q0xIcENsbGl1K3ZUZU40Y3ppZUVR?=
 =?utf-8?B?MzZFajFLRm56bk1NTmN1UVREczBDWElsb1c5eW9DbDhNWCtST3NjMFVpeW9B?=
 =?utf-8?B?M3RqbWRIWVo1MXB4UVowNCtKdjRaMWZRdmJGTFI4amRvcGpZUjNWT1BLNVk4?=
 =?utf-8?B?MjBqSXRjbEtFMkZabFRRTHEreDRmdmRxMjhvdHVSaENCTHFURGdtT1F4VW9v?=
 =?utf-8?B?NkxJRUUzcCsyWG5aMnFRZWxVaG1KUTYzMFVZWU8vYXZHaWQ3a3h3S1A0QVZ2?=
 =?utf-8?B?TjN2dHhaT3NHTHVIK0xtRkpEVW9BK0U3KzlTemV6b2svYmtqL1Z4TTlMMUtD?=
 =?utf-8?B?YTAxVjJnN2NQWXJxV01qbVM4dmhiNWdGcGs5OWJENnFnK3B2VzE3dmlZbHRu?=
 =?utf-8?Q?j+0Afn9kpSqoq2GYp1bgW3QkPQ1ql9ud6j1uETbjVOKr+?=
X-MS-Exchange-AntiSpam-MessageData-1: R00LGLMSqctoDQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788bf8c0-6891-406f-6f70-08da541f47c9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 07:17:35.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRqLkxuhAIedWOlL/ktuh7w7xRZygjDEQlLDoC65JcuVBZ6k2KTYFE3qcCpP+p4/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3895
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

Am 21.06.22 um 22:00 schrieb Andrey Grodzovsky:
>
> On 2022-06-21 03:28, Christian König wrote:
>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>> Align refcount behaviour for amdgpu_job embedded HW fence with
>>> classic pointer style HW fences by increasing refcount each
>>> time emit is called so amdgpu code doesn't need to make workarounds
>>> using amdgpu_job.job_run_counter to keep the HW fence refcount 
>>> balanced.
>>
>> Could we now also remove job_run_counter?
>>
>> Christian.
>
>
> I am afraid not, job counter is needed since at all times the refcount 
> on the
> embedded fence cannot drop to zero because this will free the job 
> itself before
> the end of it's life cycle. We have to be able to differentiate in 
> amdgpu_fence_emit
> between first ever call where we init the embedded fence's refcount 
> from scratch using kref_init
> to repeating calls when refcount already > 0 and we just fake increase 
> the refcount to align
> behavior with pointer style fences in other drivers.

Well what we should probably rather do is move the init out of emit instead.

The only down side I can see is that the sequence number isn't know on 
initial init and so needs to be zero or something like that.

Regards,
Christian.

>
> I guess we could assume that embedded fence is all zeroes before first 
> dma_fence_init  if assuming the job itself
> was allocated using kzalloc and so u can look at dma_fence_ops == NULL 
> or maybe seqno == 0
> as a hint if that the fist call or not but it's a risky assumption in 
> my opinion.
>
> Andrey
>
>
>>
>>>
>>> Also since in the previous patch we resumed setting s_fence->parent 
>>> to NULL
>>> in drm_sched_stop switch to directly checking if job->hw_fence is
>>> signaled to short circuit reset if already signed.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 
>>> ++++++++++++++++------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>>>   4 files changed, 25 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> index 513c57f839d8..447bd92c4856 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>>> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device 
>>> *adev,
>>>           goto err_ib_sched;
>>>       }
>>>   +    /* Drop the initial kref_init count (see drm_sched_main as 
>>> example) */
>>> +    dma_fence_put(f);
>>>       ret = dma_fence_wait(f, false);
>>>     err_ib_sched:
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index c99541685804..f9718119834f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5009,16 +5009,28 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>             /* clear job's guilty and depend the folowing step to 
>>> decide the real one */
>>>           drm_sched_reset_karma(s_job);
>>> -        /* for the real bad job, it will be resubmitted twice, 
>>> adding a dma_fence_get
>>> -         * to make sure fence is balanced */
>>> -        dma_fence_get(s_job->s_fence->parent);
>>>           drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>>>   +        if (!s_job->s_fence->parent) {
>>> +            DRM_WARN("Failed to get a HW fence for job!");
>>> +            continue;
>>> +        }
>>> +
>>>           ret = dma_fence_wait_timeout(s_job->s_fence->parent, 
>>> false, ring->sched.timeout);
>>>           if (ret == 0) { /* timeout */
>>>               DRM_ERROR("Found the real bad job! ring:%s, 
>>> job_id:%llx\n",
>>>                           ring->sched.name, s_job->id);
>>>   +
>>> +            /* Clear this failed job from fence array */
>>> +            amdgpu_fence_driver_clear_job_fences(ring);
>>> +
>>> +            /* Since the job won't signal and we go for
>>> +             * another resubmit drop this parent pointer
>>> +             */
>>> +            dma_fence_put(s_job->s_fence->parent);
>>> +            s_job->s_fence->parent = NULL;
>>> +
>>>               /* set guilty */
>>>               drm_sched_increase_karma(s_job);
>>>   retry:
>>> @@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>             /* got the hw fence, signal finished fence */
>>>           atomic_dec(ring->sched.score);
>>> -        dma_fence_put(s_job->s_fence->parent);
>>>           dma_fence_get(&s_job->s_fence->finished);
>>> dma_fence_signal(&s_job->s_fence->finished);
>>>           dma_fence_put(&s_job->s_fence->finished);
>>> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct 
>>> amdgpu_device *adev,
>>>        *
>>>        * job->base holds a reference to parent fence
>>>        */
>>> -    if (job && job->base.s_fence->parent &&
>>> - dma_fence_is_signaled(job->base.s_fence->parent)) {
>>> +    if (job && (job->hw_fence.ops != NULL) &&
>>> +        dma_fence_is_signaled(&job->hw_fence)) {
>>>           job_signaled = true;
>>>           dev_info(adev->dev, "Guilty job already signaled, skipping 
>>> HW reset");
>>>           goto skip_hw_reset;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index d6d54ba4c185..9bd4e18212fc 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring 
>>> *ring, struct dma_fence **f, struct amd
>>>       if (job && job->job_run_counter) {
>>>           /* reinit seq for resubmitted jobs */
>>>           fence->seqno = seq;
>>> +        /* TO be inline with external fence creation and other 
>>> drivers */
>>> +        dma_fence_get(fence);
>>>       } else {
>>> -        if (job)
>>> +        if (job) {
>>>               dma_fence_init(fence, &amdgpu_job_fence_ops,
>>>                          &ring->fence_drv.lock,
>>>                          adev->fence_context + ring->idx, seq);
>>> +            /* Against remove in amdgpu_job_{free, free_cb} */
>>> +            dma_fence_get(fence);
>>> +        }
>>>           else
>>>               dma_fence_init(fence, &amdgpu_fence_ops,
>>>                          &ring->fence_drv.lock,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 58568fdde2d0..638e1d600258 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -267,10 +267,6 @@ static struct dma_fence *amdgpu_job_run(struct 
>>> drm_sched_job *sched_job)
>>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>>       }
>>>   -    if (!job->job_run_counter)
>>> -        dma_fence_get(fence);
>>> -    else if (finished->error < 0)
>>> -        dma_fence_put(&job->hw_fence);
>>>       job->job_run_counter++;
>>>       amdgpu_job_free_resources(job);
>>

