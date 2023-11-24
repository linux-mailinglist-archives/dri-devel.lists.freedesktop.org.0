Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94A7F7013
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 10:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A61A10E7C6;
	Fri, 24 Nov 2023 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B59E10E7AC;
 Fri, 24 Nov 2023 09:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFu36Tc1ghnnKOEbaj4TTuZ3L6JFaiPRSrrOIZi/0Ev+VKRa27o2QnnW/1OTbVGBXE+1L0AGAEbgVtlRUqje8kfwZXzV33SL7UaRhHbhQOWm8aytuNGoqCo2oBx1M0gxAmjVElg1CfSHBNBqNNubAbLXCwPBE5LZnilVfjpzND7mchrVp65wX2+ArCWtZHlKUNm6d1GsPdze1QvVFgkuvdxLfDv8rWmJj4Dbljbfp7DLci20/Z++BJZiW+wwE1WQpd1gkYIzjJyIKk/9IRkqO1YzQJJ/ggNnFV/HC+Fjxj6GYYdNnmI5e/JU7vb6CE4XR6fj1F4G1UPfTAyp4tHsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28Bw10m8IYfBiCD4Aj6CmmtNER3ZvZpa9SlYqWSy+Kc=;
 b=Ed/t60Iqfg2r5xuGSR5D08tYWMU+0SVA1S84LYk4gTapVuFfppdjpKE28XNibruowQPDNpIcI5nrv3nJjhm99CGOiv/Rb+0FAaoUYTkytl+wxKxroy26LTDD1VJH9QJSmnb42/fiA+15DVbgg73dx1J1HoxTZ1yvv2qGtiC6ea7Egli20Hnbmqv49K1hEbV1O3DEc1X2UPK9t2VjOTYQO0cUtgIXRj7M28mOVGputdZEoiVvHbLpJYtzh8vr/JVa3KTEk+MuSmnGIfZfSni99ExthFZGGJoT61rGqXY+KNQ4vSqHjiHLFBMXDUfVL/kCMt4lawaMkMYz/oLU/6JsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28Bw10m8IYfBiCD4Aj6CmmtNER3ZvZpa9SlYqWSy+Kc=;
 b=gMkgSptussx+TGvxjUL/JqrFTxJWgIBYR0bvBxdVguYfnoJllPSofZnA9xb4AliD7BNwApns75LGVdpct8MRFoPgn0AZKwS4pBMxKrk4VwlH8z5YykcyBC96ijcmolWkuZLoCks8DSBmy6UNTTE9ZJ+kpp6nVxovwHDas06W45w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 09:38:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 09:38:13 +0000
Message-ID: <dbb91dbe-ef77-4d79-aaf9-2adb171c1d7a@amd.com>
Date: Fri, 24 Nov 2023 10:38:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-6-ltuikov89@gmail.com>
 <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
 <9226e1d4-82f6-4c14-9170-4449de36804e@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9226e1d4-82f6-4c14-9170-4449de36804e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: ce00f704-c11b-43ca-1388-08dbecd11410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvtZbodsnT73t3rduJzbZchriJef269UcsPpUXmpYCAVAGLEZRY8n4srdt4a7QDiGkwuVqSntJrICBpohxtZIV4PxzSp7Ec6mL22kgLxMoefApB7akbRyEC06BkNxuL18HD97UROI32KMBz5F8KsPSsuqQZj8WNghBZCOACY9EiYpQol5W+LDYJNCpGdF1r/ePuDRxW3v8gWASbocBXD4wKmy8RiCdNgFNpFcSUicTjFLGV/vXzgEJA054+fqW3HsfLs+T5o/sFL6oJtBg1g/m3jUh76BZPqKGKhEwOIThw2edc+TJXJ49Gk4oTx4espk8aEgb0JtjbDy3V2sPsSO0hYkspr0BkwQScKM3YXf2/IcCshJqJpCKFRLyWWmz1cBMP3sl+JqOqwLFDkGNi21Zfi+bdBmOhVIjidFrFNZ//i2ubgcC50p/3eMeNFhnLoki4YwJplmTJP5fNFA6layGriUTTmlTMWtytWuusdysWfu6MMrz96hXZps+VVnGQdtyo649yQ8S0ZcrHMzYGbY4eupOF1O3n59835QTKgGsjC2CSihJubCBn1BtJCeecw7CoLtYcI5/lQLkLQbSWk8vNFdNzFP0AfnDzZ4FuIufYI0LCwuQas0nF4JyWNE48d1VUVxaHFPlKeN4tJC5l3yA+HE6mPzY3KEdU6x8uG7Wrn9olr6iobs537URX+TCMu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6486002)(478600001)(31686004)(41300700001)(54906003)(316002)(38100700002)(6666004)(110136005)(6506007)(66946007)(86362001)(31696002)(36756003)(2616005)(66556008)(66476007)(4326008)(8676002)(2906002)(83380400001)(26005)(53546011)(8936002)(5660300002)(66574015)(6512007)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDUvbW1DRC9yQ1pDWEI2U2Rrc0drTDk2SDRaTGZtcGV0UFErLzd5dVV4QXhl?=
 =?utf-8?B?ZW1wOVh4TTJ1N0JqRUZuaXZTU2hqRXo2c0l0bm5uN1pyODhIODR6RGNDS3Jt?=
 =?utf-8?B?VzNqVXdEdWJjY0EzVFBGZ1B6RVl5ZlR0QzB2by9EaTMvaStVNWtGbGhpK252?=
 =?utf-8?B?cHYzOWprSDh1RFJXdC9TMFk3RkdXcDF2WW5IZVVBaUg2aXpWeUJuNkRyL0ho?=
 =?utf-8?B?eEtTNXZjVVFxcEhEaHJ5bFBIUTM0d0ZKWVJZa1RMMXYvaCtrdTJoUC9pV3RS?=
 =?utf-8?B?aFBGM05kRlRIcnovckNsaEFpMEg1NVVhMW5iazVZcTFLZGhESkNIR3RtUGNv?=
 =?utf-8?B?cFVPNlpGQjlaQ2UzQU5GNzRLeHMrQis3MVZwanBHaEJUSlp3K2lQN1l0K3hy?=
 =?utf-8?B?QTNwaVQvOU5QQjVGcE0wWnI0SkpTN2x2NFRHVzhBOXE0Wm56S0ZzZGJlbkVU?=
 =?utf-8?B?d25oWENuVmRicEJwV1Z3QUd1VEVRdmNhSjB3UllMc0pHVkZYMDBGTjhGbllO?=
 =?utf-8?B?T0ZMUHNlQnZ6Y2kzYWVuOFBrd2JQYUI0cVVValZWOEg1MzJ4czZNbE9NM0xJ?=
 =?utf-8?B?aHMraTBNYnBNcjg5c241aUhZWitmclRRczdmSHVCNVFDYldQN2ZVNk5Cckk0?=
 =?utf-8?B?L2ZRWFhhQ1gwdWlScXZIeXp4ak0rZWp5bGlBS21tVmNKWHo4QWVjV0pocTVC?=
 =?utf-8?B?eEJ5UHpCMnVzSFZvVTZ1T3ZNUTVhelZvUXA4LzdvYStuSFloa1A5UHErZEx5?=
 =?utf-8?B?RmxMUXNHdFB6Z3NKT09UQVQ0MnhZVW9oRDdoY1ByNk41MmFKM3pJSE5ua2JG?=
 =?utf-8?B?WXNRR0JQcnpIeVRBYmNmQ2J1TE5VSHZxU1BrOHkvYWNKUXorempsUHNBc1FT?=
 =?utf-8?B?U1doQU1nZ28xTXQ0T0JGZ1V4OEIrZUpLaDFuamlTeGxiSjRtSVNNUmhmWWw1?=
 =?utf-8?B?SWtUbXdJVktQaDdKT1puSW5WNWhPY2ZEbitWWVRyY3p5a3lKdUlqMnJWTjJM?=
 =?utf-8?B?YWxxTW40d1p1MzB0alViN3ZqeWNmZEtXa2FiWVZOeml5U0RuSmNnTGhEQUIx?=
 =?utf-8?B?bWQ0MzZuM3pIb1AvVWhkZFIrWjBpRFNQTFcrZzkvR1NEcnpJNklTdUNxYVJm?=
 =?utf-8?B?VmdMazMvM2pWdC9ZbllSUWR0L0pZMHVzZkZ5K3NGci96YVQrRlJKa3ZKT0F5?=
 =?utf-8?B?WllYRjZFNHJaZndLOFFZL2lqbWpGWWlSRFN6L1hEamJpVyt6U1FBek5PWkxk?=
 =?utf-8?B?WFVnTUxZMG4zbEJEa2pBcEY0TmMvc1RBQlk2RFFZbFAvbndidm5WMWF2bzdy?=
 =?utf-8?B?YW9zRmhtTVFmclUvZytQZ2R5S0pSaVVuMlRIVmNtM0dQTXBHWklnUlUzN2g5?=
 =?utf-8?B?V1UvMlVtSmpIQVdWZ0ppb1M0dXJwK0krOTNnVjJJd1hKM2VYdnVrN0tKQitW?=
 =?utf-8?B?clR0RE43d0YvVmlUQlhkcjBISEVBV0tLQU5FQVZIUEJYZkFWNVhjcktpbU1x?=
 =?utf-8?B?Y0xnb1ZaaUdrUi9TaUJKZm5jT3hnYWV4aWxXSDJFRnBoajMvTERlN29VdW1w?=
 =?utf-8?B?ZE9KLzhiM3BSZXV1RWgvbVBjcnllZGlTdXlIOUdwM0o3cnBuUkhwZTVsV1Rp?=
 =?utf-8?B?d1ZjRHpHQTFYeGVweWd5bHQzK3JjMUpzSFJyWk1ienIxWlRxZk50ejZ1ajJO?=
 =?utf-8?B?Q2VBRzdUdUVnWENlUGQyTEZudFE4dVhmYlBSTWJoMEJKWlRERUh1UkFVcStV?=
 =?utf-8?B?cnMwTjQ1dlJSU0VxRXhXc3Jrek83VW0rcWFlTUFzRzZCdkIxOVk1bHRHdDdT?=
 =?utf-8?B?WWpwOGpwZGVuL1JtbEhhdVpOUEVPZVhQR1JMUDEwcXBkNjFhcGlFa0xBNTZt?=
 =?utf-8?B?WG1JcGUyKzdUZ1ZjdFlBTWVPbXFveS95OVVqZGVWVGFZdENBS0lTd3BZUm1s?=
 =?utf-8?B?YUZpbkUvSGdLUTcxdW5sVTY3UHNmaXUvZEhVa0NaUzNoR1VDbUdEOTY1S0xL?=
 =?utf-8?B?elRVMFZ6K3Q2NURCNTJUcE55dzlJVEdWVWdXaUs4cEV6MFhQbUgwbWhzS0JG?=
 =?utf-8?B?ZC9tRUcxdEk3Qk1GU0FhMkcvVkFreHhXY0lOemVMSVV1eUdVVGZ4SGZ1WXZF?=
 =?utf-8?Q?GSiY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce00f704-c11b-43ca-1388-08dbecd11410
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 09:38:13.4063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxtlR/nZ8rWZvjLn7eEz8Cp4WsG5DDoQVPt9Lse382NGOXp8og6z8FZOiDx8NeXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685
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

Am 24.11.23 um 09:22 schrieb Luben Tuikov:
> On 2023-11-24 03:04, Christian König wrote:
>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>> Reverse run-queue priority enumeration such that the higest priority is now 0,
>>> and for each consecutive integer the prioirty diminishes.
>>>
>>> Run-queues correspond to priorities. To an external observer a scheduler
>>> created with a single run-queue, and another created with
>>> DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
>>> sched->sched_rq[0] with the same "priority", as that index run-queue exists in
>>> both schedulers, i.e. a scheduler with one run-queue or many. This patch makes
>>> it so.
>>>
>>> In other words, the "priority" of sched->sched_rq[n], n >= 0, is the same for
>>> any scheduler created with any allowable number of run-queues (priorities), 0
>>> to DRM_SCHED_PRIORITY_COUNT.
>>>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: freedreno@lists.freedesktop.org
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>>>    drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
>>>    drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
>>>    include/drm/gpu_scheduler.h              |  6 +++---
>>>    5 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 1a25931607c514..71a5cf37b472d4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>>>    	int i;
>>>    
>>>    	/* Signal all jobs not yet scheduled */
>>> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>>> +	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>    		struct drm_sched_rq *rq = sched->sched_rq[i];
>>>    		spin_lock(&rq->lock);
>>>    		list_for_each_entry(s_entity, &rq->entities, list) {
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>> index eb0c97433e5f8a..2bfcb222e35338 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>> @@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
>>>     * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>>>     * cases, so we don't use it (no need for kernel generated jobs).
>>>     */
>>> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
>>>    
>>>    /**
>>>     * struct msm_file_private - per-drm_file context
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index cb7445be3cbb4e..6e2b02e45e3a32 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -81,14 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>    		 */
>>>    		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>>    	} else if (num_sched_list) {
>>> -		/* The "priority" of an entity cannot exceed the number
>>> -		 * of run-queues of a scheduler.
>>> +		/* The "priority" of an entity cannot exceed the number of
>>> +		 * run-queues of a scheduler. Choose the lowest priority
>>> +		 * available.
>>>    		 */
>>>    		if (entity->priority >= sched_list[0]->num_rqs) {
>>>    			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
>>>    				entity->priority, sched_list[0]->num_rqs);
>>>    			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>>> -						 (s32) DRM_SCHED_PRIORITY_LOW);
>>> +						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>> That seems to be a no-op. You basically say max_T(.., num_rqs - 1, 0),
>> this will always be num_rqs - 1
> This protects against num_rqs being equal to 0, in which case we select KERNEL (0).

Ah! That's also why convert it to signed! I was already wondering why 
you do this.

>
> This comes from "[PATCH] drm/sched: Fix bounds limiting when given a malformed entity"
> which I sent yesterday (Message-ID: <20231123122422.167832-2-ltuikov89@gmail.com>).

I can't find that one in my inbox anywhere, but was able to find it in 
patchwork.

> Could you R-B that patch too?

I would add a comment cause the intention of max_t(s32 is really not 
obvious here.

With that done feel free to add my rb to both patches.

Regards,
Christian.


>
>> Apart from that looks good to me.
> Okay, could you R-B this patch then.

