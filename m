Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382DD708203
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4C510E091;
	Thu, 18 May 2023 13:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB5010E091
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHR8bjW91bLuL7FyWFtm+Wul17wi3XqUnSczHVUi/K7qnd23Q8UgzmumWB9M1olV3TPa+nl3PoEslP5bdVnpMKzkZc1E0CFzzb0OrcVzoqHivvL5FgEsJ4I/DKQO1ojxXb/A9nVxVdEaHtX+k9EakB9WxXeV+hzdmxruDgLNXB0nLbnvjuScXOCzYKl/hI4eVjjw1Jz3UakZ2ufMEbw7XteS4mAPdDaYSORfalqQN0vG8ygovyQqykxad4TBaDaXx+RRG0mIiAQPgCkboX8aOA1m+7EWBYSnyXPnHXcbSG1tabMan6rTacmTMc0eeBtqqq92VLDBId7KwwOB6+MJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0lJ7Wx5gOxm0vzQbbBcJu6Ax67UTkyAP7OMpI/WwsE=;
 b=TOg75ob0eCBagMNhLqdNE0OPoGOuIZnmkd2m1XkWYQj29wWeJqjN2cldFPBIRcIVzQJjJlPOe5CwJqB0tnMRjEv9vys/Pd1nuJ+hbshyo7ZaCnvROfySUIY7Cb2HYjkNSKtS2DnjIuYBTpu95xgbveEYKpDeV4W/CM+KnYPdy+U2BuIBQjj+ub3VOFta5PxqtlpDOHKm8mJ99Xyhi2/aJXDXnhGwXMifMI22ReXN87BXRHlOKCdCrxLFQgDFNT/1yeKdR3np5ZTORGMiRRVGwbcmFYxX0HQk/2B5iAo9N6fEeA0hE6cBUkFfZvtoUweSpthRtRVl0i98fDAnoIPO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0lJ7Wx5gOxm0vzQbbBcJu6Ax67UTkyAP7OMpI/WwsE=;
 b=JIg9R1nApOT+Ct+mnjH2B7/WajFaQBgYY+x0gp9O57oDJN3YgmzKXOnGlny9DkMcJZ5rbHtKP98IziNeaaPREHEaVKPITKqYnTrPSxqgyRv5y5YNF02US6U0P0UW+SZei79+YadB8RbNTlkP0Kng9yISck1UUprR75PlHdU9lE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 13:03:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 13:03:26 +0000
Message-ID: <34ee5d50-d8ac-0ce3-cf60-418ca6888294@amd.com>
Date: Thu, 18 May 2023 09:03:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_can_queue()
Content-Language: en-CA, en-US
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20230517233550.377847-1-luben.tuikov@amd.com>
 <20230517233550.377847-2-luben.tuikov@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230517233550.377847-2-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::30)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e3385f-6795-4da3-5254-08db57a044d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t04Dg7bfXpK5etlIhyNJp1efqyvEXB8/wSOb3nj7S2VWdEIB9idPxe0lH+r5zpBxuz7wL6YFEB6+5xOa3kNtmKN/Pj07rj+n0q6nEEnBkShmHbSxkgZ6PsoCEiK16wmeyNuK+DhanUUJuwyYRpuduqph6VVk36tF+QA9ZT8KbZONA9VNCNilK+mVzlPqKpGw2w9sZztt0vq50dPkXxBu3ZO5/fzAvFgF6PXhjwem0Ge+bUdYBmnD78jQvRJdjz0W/GbMNGCRqSxyerptuZOLFc1fSma6xYqJa8X4JoWqjUC85rWRUPxAda5oB52Y9mDdLW38P9bUjPfWyU/kQFQQ8dXwuUFWYyAC7JtpmgqqpI0WC9dAL6lxURi3dEOgcMkFf+8fEKhENGW6oPNGnOiLvozdRNug1q2vbW+mJKgXTJpKDWrD2spz/cfI+ESDbrWfFnIHoH+DGM72Yfm0Np6X5C3815Udxxr4Fno+HF3e53RQgnFZBhpgtgc431SoVrj4Z8TjhbEWQc4D0+czJnmcVJTQGt3rMt00GpSqAHC1GFxvlAQppttWbMfDArF/k7YTX1x1zIC4DBN/dsAz6L19iHC92oK5Lf7pvfGYNYCnH5LqMBtOlzauyfKxs9DPz1sKgd1X2W7ayjBaTa/ylUNfTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(31686004)(31696002)(66556008)(316002)(66946007)(4326008)(66476007)(66574015)(54906003)(6916009)(36756003)(478600001)(86362001)(83380400001)(186003)(2616005)(26005)(53546011)(6512007)(6506007)(8936002)(8676002)(44832011)(2906002)(5660300002)(6486002)(38100700002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eit6UnVRUFdyUGNNTTVtcEQ5L3J0YkRranFyMkNSaW5KcERwNjBRaHZtVWxa?=
 =?utf-8?B?cTNHZytUZFdvckxkZjUrQ1l4Y3E4Y0pCR0VqYkNUTWdPcEx0ZmVOZ25UbkdD?=
 =?utf-8?B?OXBnempkUnVNd2FBZ2MvcUZyWG5QYjhhR2JZYkd0VmRkd3N0Wm5UdStwZkNZ?=
 =?utf-8?B?RTE5Z1lwcmljQ01OQmJ6VG00TUNIcmZ5eThhTS9PR0U3R1UyUFgrTnBGS1FL?=
 =?utf-8?B?WU9SSUY4OVc5YnpOY3NQN1JUUTJ6OHVLQ2xtdGxVR3B1QXl3a1ExS1daSVM5?=
 =?utf-8?B?cWVhZy9CRndKZnBVRGIzSkU0SFQwd3prSk9pSWk3QmtjemhvaWpabkhOU0li?=
 =?utf-8?B?QytjYk51Y2pEUitvMURSY1NUNDZWWW9mOXhpb29mUHhZRXVmbXlzR0J1T29Y?=
 =?utf-8?B?VTgrVzFjNXNxcm9kaTgxREZCd2dMSkk0bjlLZ2prWk12NTZ4dmE3S2JpUVF2?=
 =?utf-8?B?bk8yLzAvb1pjNnhMQlllU0VDQUNBZEZvNzVsWENHSGRkKzRkaHlYQld4Rkg1?=
 =?utf-8?B?N1lCa1dzWGc3QmU5d0JHNDVkK3VIaWlRNGhMQ3EwY1pyMUlQMEs5YUgyVTBl?=
 =?utf-8?B?Q2U3OEt5NjRnVUg4Z2V0UnI1YnZqQTNWaEh0WEVEckZJQlY1VDI4S0I4Sksw?=
 =?utf-8?B?UDQ5azQvNzR3ZGhMZG1rNzdLU0RJMTZTSGlpeHV3eStOcStrbk5FZWsxdEhM?=
 =?utf-8?B?M3BlWE9XZXFHc285YlRJTVc5azBqeFdTRUlKNTVid20zdUNxTDB0RDh0WTJV?=
 =?utf-8?B?UStCdUZTbDFtdlQzY3FQeGNKbFNDcEhmRXRjQkRKL3hUaTRaM2lVc3ZQcUt2?=
 =?utf-8?B?WGQyZkVFanRySzlDRDRBUU9kem9EblkvY0MrbGpTUk9FUytEeEhXeXBCeHhk?=
 =?utf-8?B?d0lWcXNKcnNQL3hIWlJmaHdmc1lDRjVaZHViUEJJeldpZHU2Umk4SUdsZi9j?=
 =?utf-8?B?RzFPaHhvYVJwVWhYZzVUMTNDY0VId3pJTFdoZ1JXUGRnaHp0dW81dmdXWkRk?=
 =?utf-8?B?OFJZbzB3ZHhTR1YxUkVlNDB6eGN0YlRkU1dGWmllY2lXWU41YWFaWm85aVFR?=
 =?utf-8?B?bUdGdkFYUTdGc3pQWDdpM3dUaFd1ekFBbmVFdFY0b01pcDhyQnNGVFFKc1Rj?=
 =?utf-8?B?ZXFkNTJuVVJUTTFBV24wbnU0YUVnbTU5V2pxWWJwSzBtd1FtT2dkc1NDNFJS?=
 =?utf-8?B?VUcrcXJCaHR6eURCUzlFd3QyVStvR295alEzSWpqRzdhdlhpWElQMlpDazhW?=
 =?utf-8?B?b3hTVU9kVmJBd2lJbG84WElmN25yYmZ6dWNranMzam1SUVRGVUY4U0VzbEN1?=
 =?utf-8?B?UitMbkFCM1RsVW9TWTRZUGx1Nk44YWdJZnNzVGxQZDVpaXM4NXFlcUpSWkcy?=
 =?utf-8?B?ZlpmSUNUVWp1RzVES2JJb3g0dHNXZGdDRlBCbStkeHVwQ1J5ZDlDVUdsZFNp?=
 =?utf-8?B?WE5NZ3NKOUJ1eHlHZkJTN1ZJNXdwTW9nN3RRUXk4VUNPNjMvSVVOWTJsaXVk?=
 =?utf-8?B?VHU1dWpsVlg5ckYzR1FJa0VvMjlrYWJEcnRjNUwvVFpESVhqMjFRa0c0ZGJP?=
 =?utf-8?B?eExzVTdXTndXQ3JjWW9ZNUxvREpMckJLUnFYa3Vhd3IrY1FRNlNWWXd4SUhO?=
 =?utf-8?B?cVZHZ2RCQWkwZ2d2c1lpcTdEMVpmcmlobGpBWU44azd3T0dMakh4RG9vZ0RR?=
 =?utf-8?B?Uk9kV2hnZEJnTnNFWEJUTzk0RmNhNjBSdm1Yc3pzcWFWeGx3MDlPZTVWay9r?=
 =?utf-8?B?UGNaTnhBbWFreGg2alRFeEd2RTN3YThORnFEb0ZCTHdnWVo4UE04eUFuN0Yz?=
 =?utf-8?B?WTIxVC9oNkloSkN0OGdWSjYvYkpnelVoek5hazVQQzlYKzBiTVA5WmxaZzRD?=
 =?utf-8?B?b1M0eGcweDNLY01obC9ySm8rUndVQUZsYXJUMVZaZlovMnZSMTYrWGRoUFlB?=
 =?utf-8?B?eVdHWmtHenZuUFFVeE1vM0N3WjJtUWZ1bUo0RFNvbXdJTC80NlBpZStXS2xN?=
 =?utf-8?B?eGNQVm5hVy90ZXVxbGd1bmdSUWJhYWU4dVA0TFR6ZVdoclhZRHFwaWlOUkZ6?=
 =?utf-8?B?TUEwK0s4dHFNaEZYaWx6OWhEVzgvSENOMTJzTUFnWkdOaWl1aGZtUmgrNHk2?=
 =?utf-8?Q?A4zo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e3385f-6795-4da3-5254-08db57a044d5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 13:03:26.6892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UKPePWdi+Ing8vdwWKlLfrJ6lU4JfPjEQ1XMIzituJgA1qqdySEmgq06RAdzpxO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 19:35, Luben Tuikov wrote:
> Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the former
> is misleading, as it wakes up the GPU scheduler _only if_ more jobs can be
> queued to the underlying hardware.
> 
> This distinction is important to make, since the wake conditional in the GPU
> scheduler thread wakes up when other conditions are also true, e.g. when there
> are jobs to be cleaned. For instance, a user might want to wake up the
> scheduler only because there are more jobs to clean, but whether we can queue
> more jobs is irrelevant.
> 
> v2: Separate "canqueue" to "can_queue". (Alex D.)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

^ ping!

Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>  drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
>  include/drm/gpu_scheduler.h              | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index cfb433e9200586..68e807ae136ad8 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup(entity->rq->sched);
> +	drm_sched_wakeup_if_can_queue(entity->rq->sched);
>  }
>  
>  /**
> @@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup(entity->rq->sched);
> +		drm_sched_wakeup_if_can_queue(entity->rq->sched);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8739322c30321b..b352227a605538 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  }
>  
>  /**
> - * drm_sched_wakeup - Wake up the scheduler when it is ready
> - *
> + * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>   * @sched: scheduler instance
>   *
> + * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
>  		wake_up_interruptible(&sched->wake_up_worker);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 31d1f5166c79fe..e95b4837e5a373 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>                                     unsigned int num_sched_list);
>  
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

