Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7117FA19E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93310E294;
	Mon, 27 Nov 2023 13:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2710E294;
 Mon, 27 Nov 2023 13:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi2ZnDtpjYrEreBFv8T4QoHpjK6FdLKT8Z78tkONbr4GfOG6stNRVYaSOZ5UXf2gD/AHcRt1vYwIsgsskemqy4urygn17M+xflRvYHdStcfR2JiC/X4wLdoO5Oc4sEjzYNr4Il5AWz2HJlhJ0Q5Bp222j0DLyLO6SigLqy8OcjkJQbfH4OrctxjRO4Tzoe2iC3C7Aghf2AFrpOdHmhSBGohxi+Mlr60N4VcbxdpwawCCufCwH4OEyCistXJknBAfPqF8D3q0gSTvXplS4d4znNiqLPxTnj4T2VJb4KUIkxSX56iQXc+1TKhH3jijj0hGUQT8lgIB6e00TzfORRqBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rsjanHM+O4aiAfNtBdPaH+XkeKF+/dxe5kIh9lWIcY=;
 b=YtyEEUGTHF7w9IZSIfYJhfiOB5PNVogaqUVVzFLrvJdwyDR7HH83AcWsc4EXf82GCMFlMKeK8vrV1ziWyTYO9PXQy8g+vXReWv4vcig9nXAFWeujYGC67XjThzlNLF1rtwDNEujkEK1tpGoBffybMiEl6ANq5W0Qr7552EnUmkDmXkrBNV4kKLeRgDGsPcUasEJcwzBpIxMDd1pTtGPinA3FXn/fI7dA4N4iYEY7+7pL7FHNtCI3/ZNVwtdts8r1Lk3trdgmzy27st3JpCFqZ+MTC3Xw/l8DGsq6JxojqER1HVIn/7gTKqj9ZDhcgaemMyFh8OClJVQyc3TLzPn8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rsjanHM+O4aiAfNtBdPaH+XkeKF+/dxe5kIh9lWIcY=;
 b=Gxtm8GoqhmQlDMi98vA9KV+/mm9o5KCATGXQW9iJe8sKkjTxKBagC2Z2zuRQTxLI8bNgJbg/C1R1f1MO+m3HIQY92//3lQ2YB7+2Ef7x+JbSLgWQacRVUiNxE/P1MBIUphUbQtwtSYLQFoVpEm7nI4esaxThrNI2bLHAyPdYcW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Mon, 27 Nov
 2023 13:55:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 13:55:30 +0000
Message-ID: <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
Date: Mon, 27 Nov 2023 14:55:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
In-Reply-To: <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: af43c9e7-2856-47fa-ecb6-08dbef5084a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQ1wDPGbL8HP1fkJ63oRcLCrUcJixps8dyWywnu+TyqmDLizVoToYv8HRx6xnEVa4nm9hXDmfx8+dxrE+YXtwHzuXbmSTm6KaCXi6rfO2ONroBk+roQs+qFsfsLP5rT3OSUAJTqHiIlntedEQkJWuaTYIpVcq4nqg3H0VR5P2/iVsBIXo2GAQMjKb6HAzAIKrJC7InkfbE/1uzNSxYdMu01wSBH1kBST1CK10B5/rYAwBsBbQ9vEGuYZ7Hj5sJu4f42AzjPEMUVZBKo/f1mwX6y/SiDBwXsi2xoyzaMUD6Uui4o292xbu2PVzljpc937MaW2f3iSlYfbxIu9J7Og2AFpptE+QX/u+MQJBt7vGW3MBVDGPYHDwgk3HcpS9weP+d5MW5CFcGnwrEQzrPkYmINNyh9yVnnB3O9xaRwOXAHo96crpAZSr7frG9ary3kYUzCTBKkBL6ai0X2nd23/lZPEZV8yIJBZE1GhCLpgx53YQpIY/JPay26q6SNjq3tnSGZ41KW+XO93IT3RjhaTlCTu3BCT6S5Ug0C85SrC1g/puPK0ikkiej6SbXBGLbuCXQEr3Uhb3nMsx/jSkm0RzDDOdmj4KsUj66eg7R3YYWrcyjJWFGHEuZfOHe4sbU/mKkHZoC/gJ8ft2uRK6t/Ejg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(36756003)(5660300002)(2906002)(31696002)(86362001)(6512007)(6506007)(66574015)(6666004)(26005)(83380400001)(478600001)(6486002)(8936002)(2616005)(38100700002)(54906003)(110136005)(316002)(66946007)(66556008)(66476007)(31686004)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZSUnl4N0J0bmRBa1FwZExwMzEyUkRRM3l6QjVRNWg0OWhZalYzbmdhbWN6?=
 =?utf-8?B?NGxLN01sYWFxekU4OHEwckg5ZkFLaE5rT1lQNmFJcDFBWVAzRjZINktwVzR2?=
 =?utf-8?B?ZUFncHB5SlkrVTh5eWZmeGxnd1B1WSs2TGFVakErWTBEck9wTjc5UFYrekhW?=
 =?utf-8?B?amV3cXVOVU0rME56ejJVWnJFL0JkUHQxQi9pSTNOY1ZkNGdzTjBmT2Zmbzk3?=
 =?utf-8?B?UHlSV2p2YWVKMEdHZXZ1ekhyTE5HeUdjTWl1a3RmbDFocWxFWlVaWCtCaXFz?=
 =?utf-8?B?d2RLR1BXWEpwS09aK1Evd2s3bTllZDhvM2pmNHFrck1JZW9aQW0za1V2a2E1?=
 =?utf-8?B?cDlRdysyVE1VWmwweTFrenZyOW9hWUdlelpkbTBkQTNWQVVEa0xubDJobEFE?=
 =?utf-8?B?OXFrQldEY2dRODFYa1AyL3NGSURFdXJBQmFHcmJCaFRuYmxGV2N3bEk0ZEd2?=
 =?utf-8?B?N0lKeFFJWER4Zms3OFk5OVdnQ3lKMzJMSW9uQXQyUmpHcEZjMmQ2S2xoUTVR?=
 =?utf-8?B?dVVQNS9Ja09ubDV5Z2dwZkplN2EvaTJPRzROMnRnc3loYVc1OGMxRG1jUTMz?=
 =?utf-8?B?K0tUNmJsdmJRTjZTQ0QxNkxQZk5TSkVNM0NFd3AxMDFxUUhZZW9LRXVzRXZC?=
 =?utf-8?B?dE15Y3hoYm9mWnVpWDRiMUs0UTJVYWZXdi9uVzhCSlBqRE9OM1lwRXFpVEx4?=
 =?utf-8?B?RkJJRGJFOVhzQmlTbmx2NStWUzZwSko0L3d1MnhKOURtSy9sd2h0V1IwVTMw?=
 =?utf-8?B?UnRkZkwvQldLOGpnbzRESmllOGg4NTlQSVdPOGFnSUkrOGtrbXRlaC9lNVVz?=
 =?utf-8?B?RmVuRlg2TXN0RTBsVURqREsydHhJNmwwdmdReWV4SWNiR1RlQkx5TjlmZm5Y?=
 =?utf-8?B?Z1VZVWxXMkhaUWN1bXdmRVNTek91bG5Wc2FhelhrdTN0bE5TYzhhdFlUbHhD?=
 =?utf-8?B?dHBBcUF0V0xocUgwcXV0STkyWDhIMTZvUm1TdW5xMUdTNHRBbkhUdjFzdDlV?=
 =?utf-8?B?UmpBZHNwdVJpUExVL2YwQ2JqaDh4RHRKbmowYTg5a3F0SGFBRERyMWx5cTM2?=
 =?utf-8?B?aW9wQlkrL2ZOSFVTUGF2aDdaWW9qR2dBamwxcDBQNDcvclpJYjYzQ29uTHl6?=
 =?utf-8?B?K29PS3VLRmwzT1czZkpQUDBKcVpoU2gya205cDJjN2lQMW9pQ0xaY3Mrd0tO?=
 =?utf-8?B?cFFVeTBqSDMxeXMwL0Q5aDZyb0ZFTEhvV0UxVndqNGlkS0M1UnR2L0hWblZQ?=
 =?utf-8?B?VENJOXo1bWg1TTUzTVphTEpBV25BUUNIeXc2c3F1MTYvNndreDFrSkRJSTZY?=
 =?utf-8?B?bWd4a0VPNi91SytkblNTTUxoVEt5cmxhc3RKdDc1WjBmWjB1U29zbFo3UGhs?=
 =?utf-8?B?RWlqbzNEdVZ1am5FWTdpZ3BGZHlmay9qRWtGdjFGNlVlNG1OaXYxcER4V2pZ?=
 =?utf-8?B?REVDOWU0L3NzRmdiTGd5N3ZmYUFDNW5sV3BDZ0xUaWhtQUYxSjJQR1F5eXp4?=
 =?utf-8?B?bjBuU0pERTNvbE1nLyszUnpieVlTbVJkck91eU1aUnFxT0hEOTEvTXBvMU9y?=
 =?utf-8?B?U2ZLakFmWkQra2lWeFQ2TkV2ZW50ZFRRYnozNk5KdkNVL2xsQ2d4ZjY0TW1N?=
 =?utf-8?B?ZkxSSngwSjBqNXdLMjFEOG8vZDZxaDAvSFRBQTVNZWN5Q0FMa2JTVEY4RkZH?=
 =?utf-8?B?aVJSV1REZTdqOXZLTFZjYlVpTUc2eDRMMGdwNHBYY0F4c1FNOUFTNUxidzJZ?=
 =?utf-8?B?aGVYWEp0ZUxsM2d5T094UnpQQUNTUWtabWt2RDhVSkRDdFVNVDcyWjJEOHZk?=
 =?utf-8?B?TDFtWHJNNmdnRTFHd29McVNoQWlHZDNBbkNVYmdOT1BkUHBna2tjYXRocWJG?=
 =?utf-8?B?TE8rM1ZobEVSZFVrSG5QeHdGVFNUOFhaZDNrQ1A3SlluMFBWbkZ0SUQxY3lt?=
 =?utf-8?B?OUY1VFRXakZadnRPM20vbEJsNFRmQXZiZjVDWmJFSS9IdEQyeWZCWTdUdE5m?=
 =?utf-8?B?QkV5c3VxZXlxWVdSQmVxc0lUaXpHQWp3Q1BSUlpleVRGYXJCczdQcVhabkJR?=
 =?utf-8?B?bkVXZW1GLytsVFAzV1gvaHloOUVValNWZkx0dmtZVkRKNk5sT1F6WncvQmtD?=
 =?utf-8?Q?NLBDK54cSnX2XKhi2ly3NO3Fe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af43c9e7-2856-47fa-ecb6-08dbef5084a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:55:30.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToKGWscI9FIdcJIQd1RI4pL6c5Bi3elF1DitebAUpxKLhahfFs3Uyl4o7xp54rX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luben,

Am 24.11.23 um 08:57 schrieb Christian König:
> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>>
>> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler 
>> priorities
>> in ascending order,
>>    DRM_SCHED_PRIORITY_LOW,
>>    DRM_SCHED_PRIORITY_NORMAL,
>>    DRM_SCHED_PRIORITY_HIGH,
>>    DRM_SCHED_PRIORITY_KERNEL.
>>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Looks like you missed one usage in Nouveau:

drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error: 
‘DRM_SCHED_PRIORITY_MIN’ undeclared here (not in a function); did you 
mean ‘DRM_SCHED_PRIORITY_LOW’?
    21 |         NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
       | ^~~~~~~~~~~~~~~~~~~~~~
       | DRM_SCHED_PRIORITY_LOW

This now results in a build error on drm-misc-next.

Christian.

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>>   drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
>>   include/drm/gpu_scheduler.h              |  2 +-
>>   6 files changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> index e2ae9ba147ba97..5cb33ac99f7089 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> @@ -73,10 +73,10 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
>>           return DRM_SCHED_PRIORITY_NORMAL;
>>         case AMDGPU_CTX_PRIORITY_VERY_LOW:
>> -        return DRM_SCHED_PRIORITY_MIN;
>> +        return DRM_SCHED_PRIORITY_LOW;
>>         case AMDGPU_CTX_PRIORITY_LOW:
>> -        return DRM_SCHED_PRIORITY_MIN;
>> +        return DRM_SCHED_PRIORITY_LOW;
>>         case AMDGPU_CTX_PRIORITY_NORMAL:
>>           return DRM_SCHED_PRIORITY_NORMAL;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 62bb7fc7448ad9..1a25931607c514 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct 
>> drm_gpu_scheduler *sched)
>>       int i;
>>         /* Signal all jobs not yet scheduled */
>> -    for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> +    for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>>           struct drm_sched_rq *rq = sched->sched_rq[i];
>>           spin_lock(&rq->lock);
>>           list_for_each_entry(s_entity, &rq->entities, list) {
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h 
>> b/drivers/gpu/drm/msm/msm_gpu.h
>> index 4252e3839fbc83..eb0c97433e5f8a 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
>>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in 
>> some
>>    * cases, so we don't use it (no need for kernel generated jobs).
>>    */
>> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - 
>> DRM_SCHED_PRIORITY_MIN)
>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - 
>> DRM_SCHED_PRIORITY_LOW)
>>     /**
>>    * struct msm_file_private - per-drm_file context
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 20c9c561843ce1..cb7445be3cbb4e 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -88,7 +88,7 @@ int drm_sched_entity_init(struct drm_sched_entity 
>> *entity,
>>               drm_err(sched_list[0], "entity with out-of-bounds 
>> priority:%u num_rqs:%u\n",
>>                   entity->priority, sched_list[0]->num_rqs);
>>               entity->priority = max_t(s32, (s32) 
>> sched_list[0]->num_rqs - 1,
>> -                         (s32) DRM_SCHED_PRIORITY_MIN);
>> +                         (s32) DRM_SCHED_PRIORITY_LOW);
>>           }
>>           entity->rq = sched_list[0]->sched_rq[entity->priority];
>>       }
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 044a8c4875ba64..b6d7bc49ff6ef4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1052,7 +1052,7 @@ drm_sched_select_entity(struct 
>> drm_gpu_scheduler *sched)
>>       int i;
>>         /* Kernel run queue has higher priority than normal run queue*/
>> -    for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> +    for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>>           entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>>               drm_sched_rq_select_entity_fifo(sched, 
>> sched->sched_rq[i]) :
>>               drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>> @@ -1291,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler 
>> *sched,
>>       if (!sched->sched_rq)
>>           goto Out_free;
>>       sched->num_rqs = num_rqs;
>> -    for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
>> +    for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
>>           sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), 
>> GFP_KERNEL);
>>           if (!sched->sched_rq[i])
>>               goto Out_unroll;
>> @@ -1312,7 +1312,7 @@ int drm_sched_init(struct drm_gpu_scheduler 
>> *sched,
>>       sched->ready = true;
>>       return 0;
>>   Out_unroll:
>> -    for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
>> +    for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
>>           kfree(sched->sched_rq[i]);
>>   Out_free:
>>       kfree(sched->sched_rq);
>> @@ -1338,7 +1338,7 @@ void drm_sched_fini(struct drm_gpu_scheduler 
>> *sched)
>>         drm_sched_wqueue_stop(sched);
>>   -    for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> +    for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>>           struct drm_sched_rq *rq = sched->sched_rq[i];
>>             spin_lock(&rq->lock);
>> @@ -1390,7 +1390,7 @@ void drm_sched_increase_karma(struct 
>> drm_sched_job *bad)
>>       if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>>           atomic_inc(&bad->karma);
>>   -        for (i = DRM_SCHED_PRIORITY_MIN;
>> +        for (i = DRM_SCHED_PRIORITY_LOW;
>>                i < min_t(typeof(sched->num_rqs), sched->num_rqs, 
>> DRM_SCHED_PRIORITY_KERNEL);
>>                i++) {
>>               struct drm_sched_rq *rq = sched->sched_rq[i];
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 9a50348bd5c04e..d8e2d84d9223e3 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -63,7 +63,7 @@ struct drm_file;
>>    * to an array, and as such should start at 0.
>>    */
>>   enum drm_sched_priority {
>> -    DRM_SCHED_PRIORITY_MIN,
>> +    DRM_SCHED_PRIORITY_LOW,
>>       DRM_SCHED_PRIORITY_NORMAL,
>>       DRM_SCHED_PRIORITY_HIGH,
>>       DRM_SCHED_PRIORITY_KERNEL,
>

