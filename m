Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD96829A3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 10:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F65E10E315;
	Tue, 31 Jan 2023 09:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1110E327;
 Tue, 31 Jan 2023 09:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaMNsGJC7a9Y0NgToAgM1xW6hu2/K1NlqSWFRwNj+sOkGXLvIuck5VdpmoTqCFulH3PH4j2yzpvRSE5EUTxbecYBR+X3yHyLBSGa2i+xgtmv7hcVuawaj43tjRqZR3Q65l10peJvHWORblLrCWK2VuF7BBIbU+4UrJvGUN8RwrRocj1gUJXeUAk0GAoR8L+up+tyNrVz4vkknxPiYyMqM9BSRM67lkCG9lpXXwqjoz9gxjkuxsLlXWNiZ4mthqA1upjBOBCabsOzz4WUcELv3kuo6SUvYl18DNGHN2kQSsWmNCumeA0GzEbravX7HK6VKp0Vxanpm32O+oyiF1A/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oh520UGa/zk9ijvD9SmuFBeDTC18JbwMV/YwS4rg8s=;
 b=Z149GYH9TUnodHpXgphk/LXUjUHdkv1kJ7R4qYFueDX7zhMk6vefey/DUXZOFl+SQdk/sN+xTLa5ZZbPY7j1c+g+Aqaf/GtL9cx0mvPYTjlLNC7K5ZaON4xI/oMueMi6q7UpMVpBHVBK7UvHosUubthVwxKW0q4yCdnRF7M1csPNobFlWLEF3fGIusbgQ/CD2UfjzEvj3wIxe594nNj28ZNo5A5RuRs2RFFgKsBcP21MNNjjrzmddeOXSEjiLqWrHeepLdg20HVTEDFyTRItKzByqID2+55Si7QUH/dN3NWLcksNiL6TCpTl18K2K7EtynkWrQTPtWtqtLuqQPTdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oh520UGa/zk9ijvD9SmuFBeDTC18JbwMV/YwS4rg8s=;
 b=E16Sw4KRpAI/WgPeK5UPhLOrx3D61+XHl12Z1P6OzFyCUwkcWm8jzfcpX5SK9rPjBQL1ZzINWMFZ5qX75Mawmdvuzoj6VoFra40jCR6V1mGVnRrzDqitLFbkexvIZkS2N59knaSvzHFJBrhM8OYRgiKVNoipYNkzS/yoRGoj104=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7958.namprd12.prod.outlook.com (2603:10b6:510:285::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:55:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.030; Tue, 31 Jan 2023
 09:55:11 +0000
Message-ID: <b317761d-3603-bdce-0248-9781299783f9@amd.com>
Date: Tue, 31 Jan 2023 10:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] drm/amd/amdgpu revert "implement tdr advanced mode"
Content-Language: en-US
To: "Yin, ZhenGuo (Chris)" <zhengyin@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, vprosyak@amd.com, Alexander.Deucher@amd.com,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221026153557.63541-1-christian.koenig@amd.com>
 <e3ff3595-9717-83fc-92d2-d14bb66382a8@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e3ff3595-9717-83fc-92d2-d14bb66382a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 43693481-106b-4d3e-9354-08db03713e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3oe+IKgXESN0JVYchRcnxR6bQxCRxPJ7ypsG0ksGrmrPBHFewCsoOrr8pMV3FzULk5LisUyOQt50EG+ttCxi52DZmZsaod6qQ3qTPU8VAimKXjLGseO7JVYO1tvVP+vsaAnDXTKsV2r2qc3tk6gTlKqm9Rt+qUbcufFMu5ii15mtYhGM4xqyZH775Mlf59OmH1CIBqbk5GWvW69xOZzKfDDN2tW8R7/6OBF4Y9iFJkbFxNPC27GWmNtm0cCSUZ5P4pSnTjNKicZvGFUUb8hRBF77ywDEu3lSNCGwSqlVDtH9fkhQb++Zfo5VmXNh13L/EZZrGNOXYkVcoIsdLzEuoSswTD5sXrQUfP2OdzZ+k1jPv2kkqzv9/3H3OujPQMpysitGRORQvi0qkv7WJbTCYNsw0Fe1Fl2ljopWasZQnEE9/ez93XwMx80z48n5vVJuPjeDSGXcTc84AtOBKU42NoA8sERxjc+hDC1nF5Wd5UtJZxEhbVyS4jzjHPx30aRmJH88j0k8DubW2q7EiIp9P1TUDufdXT9ELSVG+VFcknOqsV8W05mXE8ZgXP6mrw48oS9XCBgS7oXrglCV1GqZZi6GFbenMQbpSgJnfGiBaXd2uvcPfb3tnFy5bMPORlo0RYwQKcZlVxQ9z/ZmAasYxWZCdC+pl3My+BUXaHv4b/DVN0ajhfKLQjnl34Nw5Cx8Iqo39MYYC3Jd57jSOVmjPPDXJ5R90CmKb6aRARa5slQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(66574015)(30864003)(53546011)(6666004)(110136005)(5660300002)(36756003)(31696002)(83380400001)(6506007)(38100700002)(316002)(41300700001)(2906002)(2616005)(86362001)(8936002)(8676002)(26005)(186003)(6512007)(4326008)(478600001)(31686004)(66556008)(66946007)(66476007)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTUxNFpSYlNESGluUGRYZ3g4aEluWm9TSWF2QlMvaHo2dWRZakVKMU9JVm1w?=
 =?utf-8?B?MStxU05tajFqaHZ1LzRWcTVWZnRKWHlzK0lPZTRPdE9DSjk4YnIrbEdDeWtG?=
 =?utf-8?B?VnVQTVhQWGR2TmE1NlZkSDk2b29xSWpwTmRMTmJxRDZIM05YSWd6alltWE9W?=
 =?utf-8?B?WTBMZXBEUjRHbWg1NG05eXRUR0dPVlNiQjR3RWtzNjZSRVZBbzBxdjNrdm54?=
 =?utf-8?B?Z0NHczBWbXJJVEhtWEVneERrUjZrSGJWY1dhang4OVNSRE5WZG14ejZQV3kr?=
 =?utf-8?B?RFdicG00d2JLTEY4QUJ1a1YxV2o2cVdXaWRZenFLb3Zldmpvd1F1dEdjb1Bz?=
 =?utf-8?B?RGdqK2V2V1hYYUgzdkVBMWhLZk9Ub2MyVC8xN0NLWjVQYkpMQURldDVQZVN6?=
 =?utf-8?B?QUJvYi9aeWVkaXJGc0IxSW9wajlVbXErSkw2UDhiR0Z0UkpRUG5maDRhd3Jr?=
 =?utf-8?B?RlVGWDJyQzVRL3V3S3duQjMwdWY5UEdRN25zNk0reWN0aU0vWENxcHk5c0hp?=
 =?utf-8?B?eFgyVFBhUlVha0hzNFFxWUFNUTJvN3hlV2g0M1lLNWthRU9abnZXYnJ5ck83?=
 =?utf-8?B?TWRoS2hFQ1hMaW12SzdjQ0FZUEY0ZGhCVkM3aW1wdU1tekRIWDR0NnJUYlBq?=
 =?utf-8?B?aCtzdUxMOERIN0s3dnAwQXNodWEwZmlySnowTjZFV2hNWThDVnBYeFE2Zytt?=
 =?utf-8?B?WUpDdWNRVHFrQ04xeHBPWmV5aWlESTJmUUplL1NaQ0tKQkFFNlovSnJxcVRx?=
 =?utf-8?B?eGtyZjVmeWZ2ZllFVFFXakF6cVlDOUVxQUxYTXBPcEovT3BVU0VZUG5GOVJY?=
 =?utf-8?B?M0FEdjdkOW1GOXQ2VjhxQzV2Wm5SZjYrc09iSThoUlh0a09YekFlZktTeWpr?=
 =?utf-8?B?QmRYV3kyVkdGd1FpSFl2Y0FQQ2FGTUpkVktCZ1BYNjZkQzlnQXlhWFZsVUUy?=
 =?utf-8?B?a3p3UVZMNWpEWUptVk9iNTBnaU9rNnQwd0xXZUl2N0RLTmhOL2t3RkxyTXps?=
 =?utf-8?B?V3FuWUs1TkdDVVRBYXd2aXlMSTVudUNGdnpvYTRLYXluNlJGWGgrdjV4SVRW?=
 =?utf-8?B?cWliOWdORjNnWDYrZ1FaenlBSksvMEpNZW1wbGI3N2l4SnI5RGJpYTYwY3Aw?=
 =?utf-8?B?S2d5emYwSERnakUzUzB2ZDNKR3dtTzF0SmtxZWtrcDlyclZNdnpFWCttK1Vo?=
 =?utf-8?B?ZysxK2dvQzNsY1crQVhzRWtCcm5mM3dZY05HTENoTkcwUUpsRGF5bDZUZit1?=
 =?utf-8?B?TnhsaklDSXBBMHVlV2xoZEtNcjQ0NFBFTHdISEdLUVlvbzYvOFpHSWt0cXRq?=
 =?utf-8?B?bjIrdVFMZ05SUHdtdEF1TTRGOExLSkVkSmsrNERRQzA5elZiaERKSU9WdWJn?=
 =?utf-8?B?Qkgxcnp5bXR3Q2Zhc005blNjdWFaQ3J6WmxtMURBeVhkQjVueGFObjIvajBJ?=
 =?utf-8?B?R1VsYVlqNmczK3JNV0FaV0JzcEJuaDZ6bXZOUWpJVGdJd2ZmSnhjcHJsRTBx?=
 =?utf-8?B?TzlRV0lUUHFqMHUzOW1kVlIvYTZ5MkJaYXppaGFhSWFCNDBISG9IckRYcVBF?=
 =?utf-8?B?MmQ1MUh0Q29yR3BsTmc5cm81akg5M0Fab0ZwdzBnYWwxZDNXaVpDd2t6Ulgx?=
 =?utf-8?B?UVU3S3BWMURybktlMko4NUt3cnR4UXQ2RklZajRyOW5RL0d3dGRNR0prSEY3?=
 =?utf-8?B?NVpmVmFBYjFOSmd5cUs1YzVaajh6WmJYV2hXWDlaUEtUY3JoRTM2Q1phY0w2?=
 =?utf-8?B?aU5ycjBqMDlDVEI3bm9rZXYwOWVINnhkekIwTHNCWk5Rbk1MOUg5clBsbktV?=
 =?utf-8?B?MmxVVXc4YVFlSDhnZ2dPcGpVYVVvak1TcjQ3MzNlcDFxTW5BL2NKZWx0RzBt?=
 =?utf-8?B?d0hRK3p2bWtabGt6ZzgzdDA2VDFJUmZZVGRrU2JaM25ha212V0dKVkRvUGdQ?=
 =?utf-8?B?cExqSnYxeExRZlRSMk1RSmJVZGR6VURZUFVxS2ZtYk9SQmpaVHQrQ2RRd2ph?=
 =?utf-8?B?a093UndCSnR3eGFZVW5JSWNxRmJHelVkRUpqM2dpWmwzcmo2RHozZHBBek5I?=
 =?utf-8?B?YkdKelFuYmVEZlozWm1RbkMyL1JUZCtPL1NFYVFVSy84MkJYMEFlRDN5UnUy?=
 =?utf-8?Q?txG82OJt/HS/+zp7qK+al/ZUM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43693481-106b-4d3e-9354-08db03713e01
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:55:11.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zFjZl5h+Q6UZBg7NCWtJXvJYNUFpXstk647urw46z7QLawVRocqb+AqFToQB/XJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7958
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
Cc: jingwen.chen2@amd.com, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> A later bad compute job can block a good gfx job

The gang submit/barrier approach makes sure that only one application at 
a time can use the gfx/compute block.

So when application B makes a compute submission while a GFX submission 
of application A is still running we will wait for that GFX submission 
to complete before B is allowed to access the hardware.

Two submissions to the same engine will wait in the hardware for the 
first submission to fully complete before the second is started.

This way neither concurrent submissions to different engines 
(compute/gfx) nor subsequent submissions to the same engine let 
different applications access the hardware at the same time.

It's essentially the same requirement we have for gang submit and that 
is now well tested and in production for a couple of month. So we 
already know that the approach works.

Regards,
Christian.

Am 28.01.23 um 09:28 schrieb Yin, ZhenGuo (Chris):
> Hi, Christian
>
> A later bad compute job can block a good gfx job, so the original TDR 
> design find a wrong guilty job(good gfx job).
>
> Advanced TDR re-submits jobs in order to find the real guilty job(bad 
> compute job).
>
> After reverting this commit, how does the new gang-submit promise the 
> isolation between compute jobs and gfx jobs?
>
> On 10/26/2022 11:35 PM, Christian König wrote:
>> This reverts commit e6c6338f393b74ac0b303d567bb918b44ae7ad75.
>>
>> This feature basically re-submits one job after another to
>> figure out which one was the one causing a hang.
>>
>> This is obviously incompatible with gang-submit which requires
>> that multiple jobs run at the same time. It's also absolutely
>> not helpful to crash the hardware multiple times if a clean
>> recovery is desired.
>>
>> For testing and debugging environments we should rather disable
>> recovery alltogether to be able to inspect the state with a hw
>> debugger.
>>
>> Additional to that the sw implementation is clearly buggy and causes
>> reference count issues for the hardware fence.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 103 ---------------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   2 +-
>>   drivers/gpu/drm/scheduler/sched_main.c     |  58 ++----------
>>   include/drm/gpu_scheduler.h                |   3 -
>>   4 files changed, 10 insertions(+), 156 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 6f958603c8cc..d4584e577b51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5070,94 +5070,6 @@ static int 
>> amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
>>       return 0;
>>   }
>>   -static void amdgpu_device_recheck_guilty_jobs(
>> -    struct amdgpu_device *adev, struct list_head *device_list_handle,
>> -    struct amdgpu_reset_context *reset_context)
>> -{
>> -    int i, r = 0;
>> -
>> -    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>> -        struct amdgpu_ring *ring = adev->rings[i];
>> -        int ret = 0;
>> -        struct drm_sched_job *s_job;
>> -
>> -        if (!ring || !ring->sched.thread)
>> -            continue;
>> -
>> -        s_job = list_first_entry_or_null(&ring->sched.pending_list,
>> -                struct drm_sched_job, list);
>> -        if (s_job == NULL)
>> -            continue;
>> -
>> -        /* clear job's guilty and depend the folowing step to decide 
>> the real one */
>> -        drm_sched_reset_karma(s_job);
>> -        drm_sched_resubmit_jobs_ext(&ring->sched, 1);
>> -
>> -        if (!s_job->s_fence->parent) {
>> -            DRM_WARN("Failed to get a HW fence for job!");
>> -            continue;
>> -        }
>> -
>> -        ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, 
>> ring->sched.timeout);
>> -        if (ret == 0) { /* timeout */
>> -            DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
>> -                        ring->sched.name, s_job->id);
>> -
>> -
>> -            amdgpu_fence_driver_isr_toggle(adev, true);
>> -
>> -            /* Clear this failed job from fence array */
>> -            amdgpu_fence_driver_clear_job_fences(ring);
>> -
>> -            amdgpu_fence_driver_isr_toggle(adev, false);
>> -
>> -            /* Since the job won't signal and we go for
>> -             * another resubmit drop this parent pointer
>> -             */
>> -            dma_fence_put(s_job->s_fence->parent);
>> -            s_job->s_fence->parent = NULL;
>> -
>> -            /* set guilty */
>> -            drm_sched_increase_karma(s_job);
>> -            amdgpu_reset_prepare_hwcontext(adev, reset_context);
>> -retry:
>> -            /* do hw reset */
>> -            if (amdgpu_sriov_vf(adev)) {
>> -                amdgpu_virt_fini_data_exchange(adev);
>> -                r = amdgpu_device_reset_sriov(adev, false);
>> -                if (r)
>> -                    adev->asic_reset_res = r;
>> -            } else {
>> -                clear_bit(AMDGPU_SKIP_HW_RESET,
>> -                      &reset_context->flags);
>> -                r = amdgpu_do_asic_reset(device_list_handle,
>> -                             reset_context);
>> -                if (r && r == -EAGAIN)
>> -                    goto retry;
>> -            }
>> -
>> -            /*
>> -             * add reset counter so that the following
>> -             * resubmitted job could flush vmid
>> -             */
>> -            atomic_inc(&adev->gpu_reset_counter);
>> -            continue;
>> -        }
>> -
>> -        /* got the hw fence, signal finished fence */
>> -        atomic_dec(ring->sched.score);
>> -        dma_fence_get(&s_job->s_fence->finished);
>> -        dma_fence_signal(&s_job->s_fence->finished);
>> -        dma_fence_put(&s_job->s_fence->finished);
>> -
>> -        /* remove node from list and free the job */
>> -        spin_lock(&ring->sched.job_list_lock);
>> -        list_del_init(&s_job->list);
>> -        spin_unlock(&ring->sched.job_list_lock);
>> -        ring->sched.ops->free_job(s_job);
>> -    }
>> -}
>> -
>>   static inline void amdgpu_device_stop_pending_resets(struct 
>> amdgpu_device *adev)
>>   {
>>       struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>> @@ -5178,7 +5090,6 @@ static inline void 
>> amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
>>     }
>>   -
>>   /**
>>    * amdgpu_device_gpu_recover - reset the asic and recover scheduler
>>    *
>> @@ -5201,7 +5112,6 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>       int i, r = 0;
>>       bool need_emergency_restart = false;
>>       bool audio_suspended = false;
>> -    int tmp_vram_lost_counter;
>>       bool gpu_reset_for_dev_remove = false;
>>         gpu_reset_for_dev_remove =
>> @@ -5347,7 +5257,6 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>           amdgpu_device_stop_pending_resets(tmp_adev);
>>       }
>>   -    tmp_vram_lost_counter = 
>> atomic_read(&((adev)->vram_lost_counter));
>>       /* Actual ASIC resets if needed.*/
>>       /* Host driver will handle XGMI hive reset for SRIOV */
>>       if (amdgpu_sriov_vf(adev)) {
>> @@ -5372,18 +5281,6 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>       /* Post ASIC reset for all devs .*/
>>       list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
>>   -        /*
>> -         * Sometimes a later bad compute job can block a good gfx 
>> job as gfx
>> -         * and compute ring share internal GC HW mutually. We add an 
>> additional
>> -         * guilty jobs recheck step to find the real guilty job, it 
>> synchronously
>> -         * submits and pends for the first job being signaled. If it 
>> gets timeout,
>> -         * we identify it as a real guilty job.
>> -         */
>> -        if (amdgpu_gpu_recovery == 2 &&
>> -            !(tmp_vram_lost_counter < 
>> atomic_read(&adev->vram_lost_counter)))
>> -            amdgpu_device_recheck_guilty_jobs(
>> -                tmp_adev, device_list_handle, reset_context);
>> -
>>           for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>               struct amdgpu_ring *ring = tmp_adev->rings[i];
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 16f6a313335e..f177d8e5b665 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -519,7 +519,7 @@ module_param_named(compute_multipipe, 
>> amdgpu_compute_multipipe, int, 0444);
>>    * DOC: gpu_recovery (int)
>>    * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). 
>> The default is -1 (auto, disabled except SRIOV).
>>    */
>> -MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (2 = 
>> advanced tdr mode, 1 = enable, 0 = disable, -1 = auto)");
>> +MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = 
>> enable, 0 = disable, -1 = auto)");
>>   module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>>     /**
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index e0ab14e0fb6b..bb28f31bff6f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -355,27 +355,6 @@ static void drm_sched_job_timedout(struct 
>> work_struct *work)
>>       }
>>   }
>>   - /**
>> -  * drm_sched_increase_karma - Update sched_entity guilty flag
>> -  *
>> -  * @bad: The job guilty of time out
>> -  *
>> -  * Increment on every hang caused by the 'bad' job. If this exceeds 
>> the hang
>> -  * limit of the scheduler then the respective sched entity is 
>> marked guilty and
>> -  * jobs from it will not be scheduled further
>> -  */
>> -void drm_sched_increase_karma(struct drm_sched_job *bad)
>> -{
>> -    drm_sched_increase_karma_ext(bad, 1);
>> -}
>> -EXPORT_SYMBOL(drm_sched_increase_karma);
>> -
>> -void drm_sched_reset_karma(struct drm_sched_job *bad)
>> -{
>> -    drm_sched_increase_karma_ext(bad, 0);
>> -}
>> -EXPORT_SYMBOL(drm_sched_reset_karma);
>> -
>>   /**
>>    * drm_sched_stop - stop the scheduler
>>    *
>> @@ -516,32 +495,15 @@ EXPORT_SYMBOL(drm_sched_start);
>>    *
>>    */
>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
>> -{
>> -    drm_sched_resubmit_jobs_ext(sched, INT_MAX);
>> -}
>> -EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>> -
>> -/**
>> - * drm_sched_resubmit_jobs_ext - helper to relunch certain number of 
>> jobs from mirror ring list
>> - *
>> - * @sched: scheduler instance
>> - * @max: job numbers to relaunch
>> - *
>> - */
>> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, 
>> int max)
>>   {
>>       struct drm_sched_job *s_job, *tmp;
>>       uint64_t guilty_context;
>>       bool found_guilty = false;
>>       struct dma_fence *fence;
>> -    int i = 0;
>>         list_for_each_entry_safe(s_job, tmp, &sched->pending_list, 
>> list) {
>>           struct drm_sched_fence *s_fence = s_job->s_fence;
>>   -        if (i >= max)
>> -            break;
>> -
>>           if (!found_guilty && atomic_read(&s_job->karma) > 
>> sched->hang_limit) {
>>               found_guilty = true;
>>               guilty_context = s_job->s_fence->scheduled.context;
>> @@ -551,7 +513,6 @@ void drm_sched_resubmit_jobs_ext(struct 
>> drm_gpu_scheduler *sched, int max)
>>               dma_fence_set_error(&s_fence->finished, -ECANCELED);
>>             fence = sched->ops->run_job(s_job);
>> -        i++;
>>             if (IS_ERR_OR_NULL(fence)) {
>>               if (IS_ERR(fence))
>> @@ -567,7 +528,7 @@ void drm_sched_resubmit_jobs_ext(struct 
>> drm_gpu_scheduler *sched, int max)
>>           }
>>       }
>>   }
>> -EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>> +EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>     /**
>>    * drm_sched_job_init - init a scheduler job
>> @@ -1081,13 +1042,15 @@ void drm_sched_fini(struct drm_gpu_scheduler 
>> *sched)
>>   EXPORT_SYMBOL(drm_sched_fini);
>>     /**
>> - * drm_sched_increase_karma_ext - Update sched_entity guilty flag
>> + * drm_sched_increase_karma - Update sched_entity guilty flag
>>    *
>>    * @bad: The job guilty of time out
>> - * @type: type for increase/reset karma
>>    *
>> + * Increment on every hang caused by the 'bad' job. If this exceeds 
>> the hang
>> + * limit of the scheduler then the respective sched entity is marked 
>> guilty and
>> + * jobs from it will not be scheduled further
>>    */
>> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>> +void drm_sched_increase_karma(struct drm_sched_job *bad)
>>   {
>>       int i;
>>       struct drm_sched_entity *tmp;
>> @@ -1099,10 +1062,7 @@ void drm_sched_increase_karma_ext(struct 
>> drm_sched_job *bad, int type)
>>        * corrupt but keep in mind that kernel jobs always considered 
>> good.
>>        */
>>       if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>> -        if (type == 0)
>> -            atomic_set(&bad->karma, 0);
>> -        else if (type == 1)
>> -            atomic_inc(&bad->karma);
>> +        atomic_inc(&bad->karma);
>>             for (i = DRM_SCHED_PRIORITY_MIN; i < 
>> DRM_SCHED_PRIORITY_KERNEL;
>>                i++) {
>> @@ -1113,7 +1073,7 @@ void drm_sched_increase_karma_ext(struct 
>> drm_sched_job *bad, int type)
>>                   if (bad->s_fence->scheduled.context ==
>>                       entity->fence_context) {
>>                       if (entity->guilty)
>> -                        atomic_set(entity->guilty, type);
>> +                        atomic_set(entity->guilty, 1);
>>                       break;
>>                   }
>>               }
>> @@ -1123,4 +1083,4 @@ void drm_sched_increase_karma_ext(struct 
>> drm_sched_job *bad, int type)
>>           }
>>       }
>>   }
>> -EXPORT_SYMBOL(drm_sched_increase_karma_ext);
>> +EXPORT_SYMBOL(drm_sched_increase_karma);
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 0fca8f38bee4..c564be29c5ae 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -488,10 +488,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler 
>> *sched);
>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct 
>> drm_sched_job *bad);
>>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool 
>> full_recovery);
>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, 
>> int max);
>>   void drm_sched_increase_karma(struct drm_sched_job *bad);
>> -void drm_sched_reset_karma(struct drm_sched_job *bad);
>> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
>>   bool drm_sched_dependency_optimized(struct dma_fence* fence,
>>                       struct drm_sched_entity *entity);
>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);

