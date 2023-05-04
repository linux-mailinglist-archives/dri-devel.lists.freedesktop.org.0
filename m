Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E046F6460
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 07:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F8B10E385;
	Thu,  4 May 2023 05:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9583810E1E3;
 Thu,  4 May 2023 05:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETLWkkT159G/r04D6s3MBfkp/24Um+uiFg5UVM9rpLhB3VB0ogjpHTqPm6tjGYzr/j0YdAEfYoLaP1bvJARui8KoZ9e9ItZ5WNSART9Qg5WBhk23kZh+g68766xMd1oB4Io1Pd+WOV+jMmGHrzkwaUe4invg3YfIin/v+Y0BkaG2xo8hvfOLyFeG0xG0Ds/NMpD1nRSL5WCTQrhM7mERZTwZtSWp+rvaE8O/oY8gwFnAtk6O8TwKeAHziyFVI9d8zEGA5xcBt3fDqgl+8aCUPCoXsgVEkQgK+k7PPaZW0CE92nBglBTsw9yLFXHg42GSMChDj8RumwCE9n9H7vms0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QutSpgWM39KJn3r1HaYl76ewr/rfYMEH2pzuPYKjCV8=;
 b=Q3TRR5y9oNWJNuFopul64ek7+ZjK7568J8wZdR4pRZO3mG1ZImTo19TJf+Kyk6BJyJlyHiPgEXWvAB/wdrgZoln+qJfGLXPwmm2jopT8QTWvbhXXUPib3iBHiFnC5L/qV1Q1ROQbtwXNJ3fK6XHz9b2nPnBjh1uj0XXkv2Z93UuToMdd7qVICaEgppBIEuGUMKBdEtAvKNRqEh+O9X80fF3EEyD+xr8bqBRHTQ0d7GtJvybbltGCEKjNZEM93byQ4VaHJsu7mAeKGWQzLa1RRKFfBYH6Tn+8enHy4OtltQhClKH67T++POAXIJTF2P5CUC9uyEh/gHf+VJ+erfduKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QutSpgWM39KJn3r1HaYl76ewr/rfYMEH2pzuPYKjCV8=;
 b=k/yumFoPJyUYsreE+3AOGmXh9qemabxgYJCDYBORu0zXY/zJDY1rW6jsrbJ3MxQsH6Zwyig/qzZAFeo00GRAqXVlX4j3HnTFBAcFO5xu4HJJAT0Qu8GU0u4Z2tjQoAyh52dVJKgqYdsDnskoK6AcmXJb6luInNp0NWfT9N+JuZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Thu, 4 May 2023 05:28:54 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 05:28:54 +0000
Message-ID: <6d786062-0837-fd44-085b-2cc7e7d3c064@amd.com>
Date: Thu, 4 May 2023 01:28:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-5-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 04/10] drm/sched: Add generic scheduler message
 interface
In-Reply-To: <20230404002211.3611376-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb86521-b4b7-415a-2cb3-08db4c607354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMheKCYT7x1doa8Jc81F895+y6Il6q44Rrn9HjGY1vzz1pSSSIdVskMA/kJlvvmmRVYNugoR8gYNbFmcDdeIgcetfR08bo5bfo8siFz45jYbIcaHoBFVsfLUdeANK7Zzh2MEW4bQEjofhaF/gA67l6i3LOYo0TVNc669EPzpC3EQnUFgpD28aQEjvSttY9+FkmLWKskwkf0sK5qODsC6QhqzggOsCv91Q7Jm7t+tQWR925PmkkqSNMt/3vfRZrHetB4j2357FJJc1gTT2gLbPvCNVW0misvpu9uaBCxalJ0+HWB/vztHBj2zsq7PFxI+lVZ5g1nTrXgeVZX91VmHs5V6tiYK9FV1vXlFsYr+SP7Yiyy5T/GyYYJLSH+fMMdpou+FxGeK6Xm4OwOnQfJZ3Y+A9JmXM6Jh/DdePaveU6UVmm8fi6s+PvCccMhl5zdq62KhMslH3C65zHQGbdtKH40f1v7W+pFeNTMh6z6MT1OMGUT7yMkJtvHWQyCflWJxJVpRfX/whaDIYDsrwht8nQwAOIeu69hK392HU+4k8VYXHWy5HlvbF248b9rchwAtpTD/ZdCEZuescWGUk10FGeZvN1LRHXUWdaOgoxGMSmjkdaZEpNp9gpA/FLrLzezY5eVC/TRjgnW/JIOs8Dn8qVon+L7OaIRM8dMK4bOsHX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(8676002)(8936002)(31696002)(6486002)(4326008)(86362001)(316002)(41300700001)(36756003)(66476007)(66556008)(66946007)(38100700002)(5660300002)(6512007)(53546011)(2616005)(2906002)(15650500001)(6506007)(83380400001)(31686004)(186003)(478600001)(26005)(44832011)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnRBbnhySnEvUGROQ1M0TStpbGpUb29HbSs1MkVQNGdJa0NCaXMxMURiemNC?=
 =?utf-8?B?WFNSWXZTTklsQzhGVFlYRGlLY1ppVDRTM2JNOXVOcEhiaGF6NjMrdmZSbld3?=
 =?utf-8?B?VEJNK3ZXaTB6bGhlSjVCRWFITDF2TExZUXVEdVp6Q3hxWHg0cHBDcHliZDJi?=
 =?utf-8?B?dHNweVRLSklQNmVvY2tWWGQ5WHJMejZoMUhyQXgxV05qYzlzOEQwS0JDbTgw?=
 =?utf-8?B?ejdjZUZSRE9wNWd1Q29Tb1ErVHRsaWpvb1RHaVcrM1AwaWd2RXRBSEFzZGln?=
 =?utf-8?B?MThOWXhVWStlK3k0eTBwNmhsaURnUjBlVDRoMzhXK205OW9Zb0lSd0ZDWmxI?=
 =?utf-8?B?K0IrMkJIdEFyWU0rd2xDanVqQ3JuRnU4Q3YxOWhHaVRVN2cwNG1LQlFKS1RN?=
 =?utf-8?B?YWUxVU8vWkZpZklBcmdyZC9uK2pWUHBySERmR0RFQzFtd1RZVmRYRnlEQWph?=
 =?utf-8?B?WnY0TlR6WUxOUFA5MWEvSm8wdlMyUEo2UElCWnFTSUNTSUdqU2IwNE1ZM3Zw?=
 =?utf-8?B?S0U5aklRc256aFBrZWhrNUpSZkU1bk8vcHZFUWxwSmc0Sk41MGFlblJYUjkx?=
 =?utf-8?B?M0Fmd0Uxc0tmUFpGUVNCdU1qVTJHUS9tb2UyMDhRY1ptaDgrNkRoZ1haQkpm?=
 =?utf-8?B?Wllod2FrWWJ2bzFySXU0UnltQXZneW95eExTdHVsWG1lNGtud3k4WjhUVHZL?=
 =?utf-8?B?eWJGRHBpRHJuYzlxbHFOOUllWEFPVVgyZUhmU3pSTEYyUzZHSHYzWTBJNWdu?=
 =?utf-8?B?MmJNZ0xTKzB2ZFlncUxPcnFOenZIbXI2MnZJb3VIeTR6WWFOamtVSG9vcmVz?=
 =?utf-8?B?VFJVdEw0VkFaZk9ZQUxrU045cHRIcS9WQlFMOVFTUEN4aExrL1ZFRmZLYm04?=
 =?utf-8?B?bVFqRFRDWVp4Y0EzczFIY0hTMEU0WXhYc1BHblRJTHl2UEZaRGdTN1pWdkJP?=
 =?utf-8?B?ZG9rUHYxelpKeFF2azF4QVowYzgrK1hIa2hPNllZclBvUCtacXc5YXlhZHp3?=
 =?utf-8?B?dStoaFdScFcwNWlVOWdLU0xPZDJSaTVkd2daRnBLeWlKOGtqTDliZU1qMlZv?=
 =?utf-8?B?UWZZRm12MHZoTzdURlNyM3pBa3Y2VFRDVnhRUTZJZmRlWElzcTMxVkFUZEZU?=
 =?utf-8?B?VUU1UTQrRHNOczNWUVE1Z3oyNlY4L1E0WW1XR01meHh4UUxjS1BkMEdmaE9Z?=
 =?utf-8?B?aHRXcHBid0lpakh0bythbmRuRDY2eDBwMjZaWm4wWUNneG5LbEtEZXFKQjYx?=
 =?utf-8?B?TGs1aWc3MFJIcVJsL1BVRk9yVytaRjFUdVZBb3QvcEZ0S2dCMjRJcEV2SW43?=
 =?utf-8?B?WTFoUklaaG9Ia0pURFhOZm1jc1Z3TWc0akk0V0FMblRiQ0VhaC9BbEJXWTFS?=
 =?utf-8?B?eXM0N0JydUwxaEFpcjFXS1FZaFE1aFhnOGdMbTlOWUltNk5ranB5VlM5bHZ0?=
 =?utf-8?B?eUZlU0N6S3RPZTlVdEo1ZTJzZXNXb3gwRHk5R3RpdDBkcUl4SDN4MVpxT29i?=
 =?utf-8?B?UnVJSHM3dk9rekxhYW9xVzJzKzN2MkkzQXdQaS9NSnhBYTJCZVdQZE8zQWJn?=
 =?utf-8?B?dzdqR3JHWjdpaTRQZ0RuaFdWTDNNbDNJOFU5dTRlZVo3Snh0akZkUisyM1Rt?=
 =?utf-8?B?VXJRbGdpTDE4bS9XNUkxdVVScnc0WGM1WU91c2ZPWmtOYjl4VTNRZ00rUkNw?=
 =?utf-8?B?UTNpcFJIbFVvaUwxdHExSUVsMGxpSENWQWZ5L1lQRUpFVHVES0dtbGRsV1F0?=
 =?utf-8?B?SFNjS29hbjRUMmFJemFSRG02SVNIYXVETDF5WmExM2M5TGtjYThZVHZWcS9i?=
 =?utf-8?B?TjFEUzEzYkpUZk5KMmpqWWN4eS9jRXdKQnIzT2JvOWZOemlhUUhIdXdjMTgy?=
 =?utf-8?B?V0tBaG9lVCtDSjNyZU5teExCQzZKNnRaVnN1RlhvZ2RNUUkraEFOOEkrMEpV?=
 =?utf-8?B?YUZUZS90TEJoaEs3U3FEQVdySGdYNzlZajJTNjNvRWdhWHlhL2l5aml3YkR3?=
 =?utf-8?B?T0tjb1A4OEVPUHVYVWVCRHpHanVGWmMrWjBVSjVsaEsvcjM0bzBRanVSRG9K?=
 =?utf-8?B?ZHZCNUwwTlo2YVgrbWlyd3VDOUxwWFIvVXRRYW1Fam1rVXpwTVg4aklLcnRD?=
 =?utf-8?Q?Sv1fOxNWkz8cvY4Mzyj8lb2NB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb86521-b4b7-415a-2cb3-08db4c607354
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 05:28:53.9867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S37yEhcDXFuY28rMGYla1AnwQMIXAVED0pcxuxt/YB1GmZ7doH8LMf7yG4cnACem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-03 20:22, Matthew Brost wrote:
> Add generic schedule message interface which sends messages to backend
> from the drm_gpu_scheduler main submission thread. The idea is some of
> these messages modify some state in drm_sched_entity which is also
> modified during submission. By scheduling these messages and submission
> in the same thread their is not race changing states in
> drm_sched_entity.

"... there is no race when changing ..." or better yet,
"... we eliminate races due to drm_sched_entity state changes."

> 
> This interface will be used in XE, new Intel GPU driver, to cleanup,

"Xe"?

Regards,
Luben

> suspend, resume, and change scheduling properties of a drm_sched_entity.
> 
> The interface is designed to be generic and extendable with only the
> backend understanding the messages.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 58 +++++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h            | 29 ++++++++++++-
>  2 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2795021efe7b..9dc3378e9c5e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1055,6 +1055,54 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>  }
>  EXPORT_SYMBOL(drm_sched_pick_best);
>  
> +/**
> + * drm_sched_add_msg - add scheduler message
> + *
> + * @sched: scheduler instance
> + * @msg: message to be added
> + *
> + * Can and will pass an jobs waiting on dependencies or in a runnable queue.
> + * Messages processing will stop if schedule run wq is stopped and resume when
> + * run wq is started.
> + */
> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> +		       struct drm_sched_msg *msg)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	list_add_tail(&msg->link, &sched->msgs);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	/*
> +	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
> +	 * paused, harmless if this races
> +	 */
> +	if (!sched->pause_run_wq)
> +		queue_work(sched->run_wq, &sched->work_run);
> +}
> +EXPORT_SYMBOL(drm_sched_add_msg);
> +
> +/**
> + * drm_sched_get_msg - get scheduler message
> + *
> + * @sched: scheduler instance
> + *
> + * Returns NULL or message
> + */
> +static struct drm_sched_msg *
> +drm_sched_get_msg(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_msg *msg;
> +
> +	spin_lock(&sched->job_list_lock);
> +	msg = list_first_entry_or_null(&sched->msgs,
> +				       struct drm_sched_msg, link);
> +	if (msg)
> +		list_del(&msg->link);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return msg;
> +}
> +
>  /**
>   * drm_sched_main - main scheduler thread
>   *
> @@ -1068,6 +1116,7 @@ static void drm_sched_main(struct work_struct *w)
>  
>  	while (!READ_ONCE(sched->pause_run_wq)) {
>  		struct drm_sched_entity *entity;
> +		struct drm_sched_msg *msg;
>  		struct drm_sched_fence *s_fence;
>  		struct drm_sched_job *sched_job;
>  		struct dma_fence *fence;
> @@ -1075,12 +1124,16 @@ static void drm_sched_main(struct work_struct *w)
>  
>  		cleanup_job = drm_sched_get_cleanup_job(sched);
>  		entity = drm_sched_select_entity(sched);
> +		msg = drm_sched_get_msg(sched);
>  
>  		if (cleanup_job)
>  			sched->ops->free_job(cleanup_job);
>  
> +		if (msg)
> +			sched->ops->process_msg(msg);
> +
>  		if (!entity) {
> -			if (!cleanup_job)
> +			if (!cleanup_job && !msg)
>  				break;
>  			continue;
>  		}
> @@ -1089,7 +1142,7 @@ static void drm_sched_main(struct work_struct *w)
>  
>  		if (!sched_job) {
>  			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> +			if (!cleanup_job && !msg)
>  				break;
>  			continue;
>  		}
> @@ -1181,6 +1234,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
> +	INIT_LIST_HEAD(&sched->msgs);
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 3e421f5a710c..18172ae63ab7 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -398,6 +398,23 @@ enum drm_gpu_sched_stat {
>  	DRM_GPU_SCHED_STAT_ENODEV,
>  };
>  
> +/**
> + * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
> + * message
> + *
> + * Generic enough for backend defined messages, backend can expand if needed.
> + */
> +struct drm_sched_msg {
> +	/** @link: list link into the gpu scheduler list of messages */
> +	struct list_head		link;
> +	/**
> +	 * @private_data: opaque pointer to message private data (backend defined)
> +	 */
> +	void				*private_data;
> +	/** @opcode: opcode of message (backend defined) */
> +	unsigned int			opcode;
> +};
> +
>  /**
>   * struct drm_sched_backend_ops - Define the backend operations
>   *	called by the scheduler
> @@ -475,6 +492,12 @@ struct drm_sched_backend_ops {
>           * and it's time to clean it up.
>  	 */
>  	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @process_msg: Process a message. Allowed to block, it is this
> +	 * function's responsibility to free message if dynamically allocated.
> +	 */
> +	void (*process_msg)(struct drm_sched_msg *msg);
>  };
>  
>  /**
> @@ -486,6 +509,7 @@ struct drm_sched_backend_ops {
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
>   * @sched_rq: priority wise array of run queues.
> + * @msgs: list of messages to be processed in @work_run
>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>   *                 waits on this wait queue until all the scheduled jobs are
>   *                 finished.
> @@ -493,7 +517,7 @@ struct drm_sched_backend_ops {
>   * @job_id_count: used to assign unique id to the each job.
>   * @run_wq: workqueue used to queue @work_run
>   * @timeout_wq: workqueue used to queue @work_tdr
> - * @work_run: schedules jobs and cleans up entities
> + * @work_run: schedules jobs, cleans up jobs, and processes messages
>   * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>   *            timeout interval is over.
>   * @pending_list: the list of jobs which are currently in the job queue.
> @@ -517,6 +541,7 @@ struct drm_gpu_scheduler {
>  	long				timeout;
>  	const char			*name;
>  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
> +	struct list_head		msgs;
>  	wait_queue_head_t		job_scheduled;
>  	atomic_t			hw_rq_count;
>  	atomic64_t			job_id_count;
> @@ -570,6 +595,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> +void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
> +		       struct drm_sched_msg *msg);
>  void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
>  void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);

