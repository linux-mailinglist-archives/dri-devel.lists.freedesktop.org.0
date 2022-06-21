Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8C553AF7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 22:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A976D10F0DB;
	Tue, 21 Jun 2022 20:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E16510EF02;
 Tue, 21 Jun 2022 20:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUVHeB4SYSkNWtZmshaaoc5Xi2sPjbwQsOMkeI4GgAFWI//d4po0l/lJFmMQmyRwOxhOXF6ELFp4Th4Jm2gJUHoVrnmYAjy2mSApydGPIKxpRB0x179i0tM3aleid4hDlj4kt/SPcpKyfjpKotR2jD8LL7+7vgKoPFZH9gaXCX+35yccgbM5YeQIt2EWse7dXDf2sL0KpzGmQ42ZMrTTxbCErAsLM/DtFhF1Oo9/FrrxZ9V0ZqJqavgZV3nfsrAz4KoX6LzeuFHHy/AnycZh+/jUt5IpuzlTPV1k4A3BBH/2EDJkf0alJQBwXpYSTxRQwGKwAP/nf2/P5YBYrUPtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUEsWYmBCQW3nfJqlc05N3sT2XsLHRE149dQnZpFQh8=;
 b=CQ4QZFOzjj6H2OX/7JQYISpi+nwDaAfhdVYN/I6iEqfBQewwL2BGnjurVVcKAVBb+JrpGxoV6z4E2hEof2rY9IN+ahNzl6VDERjjUQA4wyLKsBILnvS9dy4Qs+6wN7jx0uNOvY3EzlvDKCzNVD5p5b+A9OPs/7XaYOyy93Jn5TZ1A8K+njo5Iq139tpKLwqINE6hALgDzlLfv+uU/Goaj4+HgA3HyVilBd69UArSLc2Jb54Fk+XclHe8u8skmqYeLO6ZNWuC9Bu3SMi6aGNxoVz11i11KQuOwa9T3hp3Wv3ACpThH3/G4Tw0AsEdtwDRm0FUjNeqUugnGTGiuHR0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUEsWYmBCQW3nfJqlc05N3sT2XsLHRE149dQnZpFQh8=;
 b=nO01Y5R6AML5WqUKCzpZDgwaQXLzJCUQ0ajS/3lNVDM73RnZfGFNGog0SK19Ri9KRJH5kHpM9Ld7j4nE2sAp5AqUw07ENpjoPIX++pe1gfwGZEFn808xGlf4THBUV1KSaFzP8BcWxRSE5J/Pp4/NnqkRKPkQliMsydObk9qpfso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB3175.namprd12.prod.outlook.com (2603:10b6:a03:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 20:00:21 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 20:00:21 +0000
Message-ID: <2f22b90f-74ca-f70d-68ed-4dbf49360e2b@amd.com>
Date: Tue, 21 Jun 2022 16:00:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] drm/amdgpu: Follow up change to previous drm
 scheduler change.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-6-andrey.grodzovsky@amd.com>
 <87fa2e6e-b519-11ef-65f4-7ab5ca091973@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <87fa2e6e-b519-11ef-65f4-7ab5ca091973@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::11) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e14450c0-f067-4c79-34d4-08da53c0ac25
X-MS-TrafficTypeDiagnostic: BYAPR12MB3175:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB317570169BEDBBD80CB132ECEAB39@BYAPR12MB3175.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJbGLroRNcvl244JZkQA2eJ64hpADpNF7v+SxInlmj+abEXl1CybHIJVps2/7MNcG+W7d5SuXdCvQVbLIzYGNDuRWbzmC4O+UaczeAqacOOwWbE/TVwRNPCC7B2kSY2MMHcJEm+4k+fLTRrbDqMNxrA/CYexEBp/PVhBwAfsVgscr0n8lLR2Q1GLsSH3osQLuwQaB5rb9ukhDmWDHcUOxb0j6rJW0lyM7ZP73xIkhqEVHIwxcpYWVum4l/xEmEU1ZsqQSfeUhmm5OVnzMed7wo76Q7gy/wp7QC9RuoBdCeR3ICBEulSglkqz0xamrKiaNI2HRt1jkYqtl24OOzfY1qX9suxoBOGjkZ2TkOxE1pmzMf25pyJgR0Cwv/CjSKRRINylN19r2A6JiY88OorjGOkzxeD9agG2FT3zZ6voeCdHRHvmPaPhQ+2CPIjVSjO0kpW8JoCjJoCwQ7K+9cZ644fSqzVMwwNG24M+iRRyg6CN6HTTtIK9GUoekmgOku7Ga/G30UstKUKIUdJgKTNiZHeIClJBXdg5Q1nnYBovPzH4x06aYm3CL5T6Q0m2hE1riEHRvhDyI8D/tGa/2B+QkuVwrOqOYQxGNCXQZflQ4fXAgMSLGctRNi1oLYLgxt28YOH3alCyKaZ5EXKtZ4ngqObwWkZidiEIWVGVFwBt2Q+WvILx9d36Jl4P9XWPEZbIHTEf+GtGkAHWUIkpoTlOHD88fAgxEmBDRXo3ecYYgSFG5vKRHzkFqvZpVc9v2o9y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(6512007)(6506007)(186003)(31696002)(86362001)(2906002)(38100700002)(53546011)(83380400001)(41300700001)(478600001)(2616005)(66476007)(66574015)(6486002)(66946007)(5660300002)(8936002)(66556008)(44832011)(4326008)(36756003)(31686004)(316002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhKMDQyZlpBUmhtenZxRHd3dEVIV1dJVVlpZlQ3VXJVWWhyREJGZHIvN2to?=
 =?utf-8?B?a2VlZnBYYkhmYjZPQkhWcm95SnJlbmpodmRpRU4wWVhUVkVmck41YkVLMG9B?=
 =?utf-8?B?NGI1WFRlcTJYQ1k1bUM5MDlIekpOTmE0YXI3M084NmI1WVE4Tk9nYXprSlZv?=
 =?utf-8?B?RlZ3ZVc4SlNhbUxQaWtaclhvSWJaNm1tZXlhclh5d1Iwb3M4S1NzYm9SbVRu?=
 =?utf-8?B?TmFEZzV1eVU1RkVpRHlzaUJJL3U4bHhRcit0RUJTSlp2OExFYTFrL2dxd3or?=
 =?utf-8?B?eWQ5ck5lbEFaVU1uUzJFbFd6VjBPam5RV042d3hqQUpwd3JPdEpYVlc1am1w?=
 =?utf-8?B?T0UyVXJxdkhoWWk0dHJnWmRGSGdQY0xsbzViVVBGZW1WNlR0UEJab2NXTTg0?=
 =?utf-8?B?MUNIZWpzSzdJRnZjZVY0ZSt5WXpRWDZYalo2dXQwSzNXNFkxMmVxSEtGay9o?=
 =?utf-8?B?c2o1K0ZLVlF4MktqQmlyR0F2NmJFVHYyK244UU5PWDNHR21LUmU1aG1zdzRE?=
 =?utf-8?B?Q1FaWlVWRDdKOFdiRy9kYklnNTFwdzMyK0hXUHFPT28vYUZ5cnV0R2M1aUY5?=
 =?utf-8?B?aVQ2UEQ5ZFpnd1poNEhrMUFzbzRhakZ0amxOV1djWEtlKzZxQTVWaGJnMFg0?=
 =?utf-8?B?NGVTUmFlYXYwVEZxVkRaUHdGWGw3VG02dzRxUTdFVE1pTUltZnRyL3dOeVdl?=
 =?utf-8?B?YjFWNTBLdDZOTzJRMGcvOHB1bTRlTGZBUkM4ZFVvb1NTNlV0WXBVcThyOG54?=
 =?utf-8?B?VzdMNHNDME5odStDZ3FOZC9sWk5kV2xHMTZIM0tpZVZHN2hNdWVzSzFpbDFZ?=
 =?utf-8?B?ZXd1WjdpZUJYWU9HWEZQYW52cEh6ZFA0UEhuV0RydW5Ed0lORDlSUTh0WHEw?=
 =?utf-8?B?eUZNVVcxVkw0ZVg4Z0tSOWZCTytIWFR1T1pnTWFQVnd0L2ZxU1VLTDFBaGls?=
 =?utf-8?B?anRmdHUrS2xjSVdzV0ZuMVh0TlUzaVZzZDhqaG0xU3gzSjNBWFY3SUU0RCsx?=
 =?utf-8?B?NkxYaTlHejF1STFPcW16WnBydElHZUpjUXFaL28yWGUzSzJnMzNPZXpJWXdY?=
 =?utf-8?B?ZUxmNm5YMm9HNWthSlQyTGkvWGNWa1Jaa1pOMmxqdVNKQkM0MTVzWjduMEtO?=
 =?utf-8?B?eG9zU3hlS1crT1J6RHEyVjV5WnI0ZEJLUThYQWcrT0h5ZHFTN1NhSlFXWERP?=
 =?utf-8?B?OVNvTldkNjg4Qloya0I1ZDRtN2dzT1Q5dHBaNnAyaG9HSnJzS09RYzF4OTAr?=
 =?utf-8?B?N1lod3BSVmZpWURhVUlsczVhWElKT1RaNzBuaXVBc3JZamNWenh1MUJINlRM?=
 =?utf-8?B?YXNNNzhDMmM1YWMvcmJpZTJYQW9ic0VxQ0hpYUF2bU45d0NTcG9vOTZuUXo0?=
 =?utf-8?B?L0o0eEgxZU8xalpjM3F1dkZ1MUxvZlZ5WlhhTjVzK0NpQVZUNEh1UTRCRnZ3?=
 =?utf-8?B?cWlxVFEvTG5CRCtQOFcrcklUZzB5MHFUbENBdkVXdmwvUlpndDcxMkFCa2tF?=
 =?utf-8?B?NW40LzFOT2lIR0RkQVVYRkY1V2NvQTBsR3ljVGd1S0ZIL0hGV2pYb0M1LzhX?=
 =?utf-8?B?TWJQR1FheXV5ZzdtUEJKb2dnenhtQ1JUK1Z5cVBVTC9CL01GNFZaa29JUnNQ?=
 =?utf-8?B?ZVM2Mmo0YVMxUnFKMkFoTjhhQ3BaUG9hMzhzM3N4OXdyQVhTQm4zR2RWZVla?=
 =?utf-8?B?Zkk1ZVVnMXFSTG10WTdmVWJiUjQzeXFJK3c2d1dKNmdJSWtQZWZSNk1wSEtw?=
 =?utf-8?B?MVA3cTJJdk1BdCtXU0h5SWQya0w3b2lpMG1vaGRIWXBNY3NHQi84azRlQ3lk?=
 =?utf-8?B?QjZ4d05QS1BpTTdaR0Q5OXo5VjJndkhiM3VzVkgzazl0N0E3amxVTlloY2R3?=
 =?utf-8?B?eTdsL1NKc3BBSGVQMWZlUjJ5UXVhb1I4RmhxelF3dnRGY3ZWNWJIeWE4c0Rs?=
 =?utf-8?B?eC9KV0IxNkRNTnp3N0NpRVJCSzd4czlVUHhlT0d3ZUtsdlZUcVhvd0RtVlI4?=
 =?utf-8?B?YmVuR045RFVHdGkyVHhHUTlYaWV3Z3hMNXdmd0dSdjBiWDc2QmtjWnhFTm1n?=
 =?utf-8?B?K2pGaXZBdFhTak5mT1FoTmdLS2E5MDFFeWhRNzBmaUd1ZjNWT0pxTS9SSFls?=
 =?utf-8?B?QXNaQkJ5c2tncEVXWUNYSUc1MG1NeEsvcDhkc1pxbE9BUUkwRytRWW0velox?=
 =?utf-8?B?SzF0UytSSzBRaXZ3RkgzNnhzcXQ3aVdjN2RrYytQVGJ3R3lVbU1GNXNLKzBt?=
 =?utf-8?B?ODRKNVpSWTZmeXd5OXVJL3doeDVOZWZmbStxTDB6Wms0ZjdQWGR6WXhDeW5K?=
 =?utf-8?B?R2hwWlRhOEZLeTdKZDV6Qk9rTkM3MncwT2RDWXJqdi8yaXZXYTFnVytVeW5C?=
 =?utf-8?Q?Sjo4C/bScVakMEaXb3bOj250PZJK4tIfd746ULRtjjm0p?=
X-MS-Exchange-AntiSpam-MessageData-1: 5mV+svinlU3fFQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14450c0-f067-4c79-34d4-08da53c0ac25
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 20:00:21.4854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSP7yFQ9QAF01I+I197dRz4f3A90mRpgS9qsStAbGfa17600JEetuHAz9f6ugmQ7C0nOyoEe33euTisd4M65Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3175
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-21 03:28, Christian König wrote:
> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>> Align refcount behaviour for amdgpu_job embedded HW fence with
>> classic pointer style HW fences by increasing refcount each
>> time emit is called so amdgpu code doesn't need to make workarounds
>> using amdgpu_job.job_run_counter to keep the HW fence refcount balanced.
>
> Could we now also remove job_run_counter?
>
> Christian.


I am afraid not, job counter is needed since at all times the refcount 
on the
embedded fence cannot drop to zero because this will free the job itself 
before
the end of it's life cycle. We have to be able to differentiate in 
amdgpu_fence_emit
between first ever call where we init the embedded fence's refcount from 
scratch using kref_init
to repeating calls when refcount already > 0 and we just fake increase 
the refcount to align
behavior with pointer style fences in other drivers.

I guess we could assume that embedded fence is all zeroes before first 
dma_fence_init  if assuming the job itself
was allocated using kzalloc and so u can look at dma_fence_ops == NULL 
or maybe seqno == 0
as a hint if that the fist call or not but it's a risky assumption in my 
opinion.

Andrey


>
>>
>> Also since in the previous patch we resumed setting s_fence->parent 
>> to NULL
>> in drm_sched_stop switch to directly checking if job->hw_fence is
>> signaled to short circuit reset if already signed.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 ++++++++++++++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  7 ++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ----
>>   4 files changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index 513c57f839d8..447bd92c4856 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -684,6 +684,8 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device 
>> *adev,
>>           goto err_ib_sched;
>>       }
>>   +    /* Drop the initial kref_init count (see drm_sched_main as 
>> example) */
>> +    dma_fence_put(f);
>>       ret = dma_fence_wait(f, false);
>>     err_ib_sched:
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index c99541685804..f9718119834f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5009,16 +5009,28 @@ static void amdgpu_device_recheck_guilty_jobs(
>>             /* clear job's guilty and depend the folowing step to 
>> decide the real one */
>>           drm_sched_reset_karma(s_job);
>> -        /* for the real bad job, it will be resubmitted twice, 
>> adding a dma_fence_get
>> -         * to make sure fence is balanced */
>> -        dma_fence_get(s_job->s_fence->parent);
>>           drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>>   +        if (!s_job->s_fence->parent) {
>> +            DRM_WARN("Failed to get a HW fence for job!");
>> +            continue;
>> +        }
>> +
>>           ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, 
>> ring->sched.timeout);
>>           if (ret == 0) { /* timeout */
>>               DRM_ERROR("Found the real bad job! ring:%s, 
>> job_id:%llx\n",
>>                           ring->sched.name, s_job->id);
>>   +
>> +            /* Clear this failed job from fence array */
>> +            amdgpu_fence_driver_clear_job_fences(ring);
>> +
>> +            /* Since the job won't signal and we go for
>> +             * another resubmit drop this parent pointer
>> +             */
>> +            dma_fence_put(s_job->s_fence->parent);
>> +            s_job->s_fence->parent = NULL;
>> +
>>               /* set guilty */
>>               drm_sched_increase_karma(s_job);
>>   retry:
>> @@ -5047,7 +5059,6 @@ static void amdgpu_device_recheck_guilty_jobs(
>>             /* got the hw fence, signal finished fence */
>>           atomic_dec(ring->sched.score);
>> -        dma_fence_put(s_job->s_fence->parent);
>>           dma_fence_get(&s_job->s_fence->finished);
>>           dma_fence_signal(&s_job->s_fence->finished);
>>           dma_fence_put(&s_job->s_fence->finished);
>> @@ -5220,8 +5231,8 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>        *
>>        * job->base holds a reference to parent fence
>>        */
>> -    if (job && job->base.s_fence->parent &&
>> -        dma_fence_is_signaled(job->base.s_fence->parent)) {
>> +    if (job && (job->hw_fence.ops != NULL) &&
>> +        dma_fence_is_signaled(&job->hw_fence)) {
>>           job_signaled = true;
>>           dev_info(adev->dev, "Guilty job already signaled, skipping 
>> HW reset");
>>           goto skip_hw_reset;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index d6d54ba4c185..9bd4e18212fc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -164,11 +164,16 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, 
>> struct dma_fence **f, struct amd
>>       if (job && job->job_run_counter) {
>>           /* reinit seq for resubmitted jobs */
>>           fence->seqno = seq;
>> +        /* TO be inline with external fence creation and other 
>> drivers */
>> +        dma_fence_get(fence);
>>       } else {
>> -        if (job)
>> +        if (job) {
>>               dma_fence_init(fence, &amdgpu_job_fence_ops,
>>                          &ring->fence_drv.lock,
>>                          adev->fence_context + ring->idx, seq);
>> +            /* Against remove in amdgpu_job_{free, free_cb} */
>> +            dma_fence_get(fence);
>> +        }
>>           else
>>               dma_fence_init(fence, &amdgpu_fence_ops,
>>                          &ring->fence_drv.lock,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 58568fdde2d0..638e1d600258 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -267,10 +267,6 @@ static struct dma_fence *amdgpu_job_run(struct 
>> drm_sched_job *sched_job)
>>               DRM_ERROR("Error scheduling IBs (%d)\n", r);
>>       }
>>   -    if (!job->job_run_counter)
>> -        dma_fence_get(fence);
>> -    else if (finished->error < 0)
>> -        dma_fence_put(&job->hw_fence);
>>       job->job_run_counter++;
>>       amdgpu_job_free_resources(job);
>
