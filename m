Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED48396C6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 18:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F51610E8C7;
	Tue, 23 Jan 2024 17:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFA710E866
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 17:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOVJ311Nh25FyIO8GLfA9fvGRpATfa8/41wD/vAkYN4/11g4yR+BnriWZzReKhZCPSNniH9YM6HoOlePH1f2idhyuEr1J3el5+8Iv5B8T9Q1KlwFH6M6J4gHuLj0SzKCyLFMkV2Zuj2+UR10vDrKb3dW7WjNv19jMEuM6h0467gjh1FDpd1DPnQ4E2i3jDYKAIJllBLg7tkQBijI3K5o/kfy/SI9x6QEJktEh5vmhnu+XiBtnLi65StTUiN8ytV/qzmM14u2/G5wTBtIhK36/ZKQv9xL9hzUjTqDpJPd8v0eeA8bkiSkAfeuoBDk/PKUGWF6DwDTJ/GRrE1E5l9Jjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXuqQRkDWlEwYqFZu90FrsmHQzK13NSEW5+ddDGj5H4=;
 b=AOPzp3g5RES/H7LPQtSZUzWFwNURyljff85OU9bckw1HMRTWdzjH8gpLjRUQR/nMBGS9/vgKKeK7HWx8JC/miH8Dws9lRNGXVWP3xVQtQcsd53wMz1/47yAFHz+bO9FlXqGGdL8uBJOInZExmE//vdAeWolz8XGefgnvxIAihNM9wIyEtDMZi/QNFAhRO0bqRcUnFSAuJWZxgJBdE9USBRFk8WaseVfhy6+PpBtd2bnngrfx1aRkx+UXufJGnQBl9m3hDvaHxf0YaueDgfZoCKPZhQBPTr3ddBL1Sw89bnr6qhwbTmuukzVMgfnc3d0hlqYnf9gg/Dkr/hCtT8/jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXuqQRkDWlEwYqFZu90FrsmHQzK13NSEW5+ddDGj5H4=;
 b=x0iI/UIfqYz6tWB8RdAAxMD2hNsp27XpxA+aYUpfcV1d3gnakgMMwR/EqziABR6G9llY6in9WrkYOU8BPVC75xka8mxVqBdZTyHO+ukQKQlxbbx12zRpko+Z3ez6hYAGdthuJhQjE+hEivnQNfZOGesKV0sQHrNZpfbIwxGoYys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB5014.namprd12.prod.outlook.com (2603:10b6:a03:1c4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 17:46:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 17:46:30 +0000
Message-ID: <ed29dcb8-bd2e-4de9-8310-81d8eead6be3@amd.com>
Date: Tue, 23 Jan 2024 11:46:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Revert "drm/sched: Split free_job into own work item"
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240123021155.2775-1-mario.limonciello@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240123021155.2775-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:806:f3::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ebba99-8a93-4772-d868-08dc1c3b3b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzqAec4Gbjpbe5RsSywFzarz2lvsy617ZWLM4yLaRVEGNAZgeIa2qM4gewj757R4txzEPsS4ckb9B949eosV6GIcbYvlWawlxs0HEESX/wvBa8GQMswFAAZgyp0hWuapuXzpVmL0d1YaGmmNSCqjpBiYmeB5wrqRf/OUS2YNWzMW3/ToYICafBXJ8MZPbzuox7vMsSWsMjrKHViPY9KJpaZw3DSDyVPRpUmhg5FFH/DZL0uklViH5MJLXztF2l+g9MhWSHM7UvOUGoHCDJmtz49RfdC+9jbxyyJ5/iiNUYSwxuY+vI81mZntsbYNI1Af89X+r75LuUwbl2N6s3wQ5KjOvEfRaQ25BAg9oOpbHloTNLNMor0/rz156cHynZyZBMN/Q5elxV2m/4v/dj0hrx4OGaMIZ7h3f9mVrchuMcfJ3vmtuzH07vmxXeNa0vxm31VbNElslBm8T/Z9ButBLNY9RMBxv1qPlX7DBe+nMEP7MU7ckJt8Lw8gZwkxe5qOnpAmkgNUXQr8SlxrmOUWGKpVMCeUYkRSURl7TQbM9Sv/vcVjiSFJMXUcOArxeDwKNYWwIOP1xscCneixVax3DU914qy7ndoF6rGfpUN15B1PTEJ9ie1pyKTseYO+x+V+DpkCt5R97jd1jwgAMCgztA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(31696002)(83380400001)(478600001)(966005)(8936002)(44832011)(6666004)(6506007)(4326008)(66946007)(54906003)(8676002)(316002)(6486002)(110136005)(66476007)(86362001)(2616005)(5660300002)(26005)(66556008)(2906002)(6512007)(53546011)(36756003)(41300700001)(31686004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3JZSGhaVU54V2Q3N3NodUFtTnlHdk40ZGFKd3cwZXl5N0xzTkwzK05ZZStJ?=
 =?utf-8?B?bXpYaEdFUnhBdllQSlhoNjVnNnl4MElwdFlLZk5PR093WXhGZUxWME1GTC9E?=
 =?utf-8?B?VmpFOFYyaVREWm80a2dkN0hLODZmOWc1QlBmQ2svNE1TVUkwK0oxUnJ4ZGl3?=
 =?utf-8?B?YmtWWWVqY01BNnlCa3h6dEp6OHVMNlgyS0NqYktiMWhKV2YyeXJEV2tlQldJ?=
 =?utf-8?B?NGF5UVlhNE5UcXhjTVgxcjdUVFF4N3NOTjIvREw3ZDFya0Y5UU9iUnlGM3Jw?=
 =?utf-8?B?bC8yMWRBTVVWY211K2JrRVdJL0JadlZqd0dkRDFBNkxsY3FxZlVYVmtPTHBO?=
 =?utf-8?B?S3ZTWEloN3RaajROOXZmTW9FMDBXaXVOaEc2d21FZ0hxMmNzZDU3am55Wm1n?=
 =?utf-8?B?ZDd2UElXV21pL3VyZFZBU3ozNTRRaGx6VG5qdGtKODJmZGRZK3hPODZhSnAx?=
 =?utf-8?B?Q25scWZxejdJeG8zQnpyRDd0M3kvVU15VHRhOW4vVzRvN3ptamVOeVVmUnBP?=
 =?utf-8?B?b0ZUbnpQbHJnU0dEWkxmMTFHTVplRnBWcXhzSXVHV1hWQUprRmtnWWw3ZXQ2?=
 =?utf-8?B?UlhuUmx0WjJldVc0K1JKNDJ0YjlnY3MyV3FBQzR5NHNRRGlIcXNvSW0vc28z?=
 =?utf-8?B?R2krSkV0NVVsSEFjVUU0Q0pFdzhZaVA2NVN4TjdJaktkSElaSllzajAvNVgv?=
 =?utf-8?B?WmFndEFmQlA1WFVMRTZCUUpKWmpGMm1tSFQ4SytLbzVrcXc1MGUzWjdSOGVG?=
 =?utf-8?B?Zm1OOXQ2ZHJOcGVyUHdleWNQVHNMNnpRYWNma3hUcHZ1bjFOdmc3SjF3UkY0?=
 =?utf-8?B?aFdlRWlMM0wrYmN3QnpWSjZGd3JGdG9YRlM5em0ydzZXVFIrOWNOcUo4NzJX?=
 =?utf-8?B?em9VSHZ1USs3cXA2WVcrQlZuM3pNNnlzNW1pektiMGV5NUw3R2MzMTdKbHhF?=
 =?utf-8?B?Wk9iOWFxelBETkhsYmF0MzlaNFU1WDJVWXg1MDhmNm0rM21wZmxUcTg3ekxW?=
 =?utf-8?B?c0dmTGVtRFRrVWtCN24vRjI0bCt6Z3NnSHMvSWRpNUFnUjU3QjZibUFOdjJT?=
 =?utf-8?B?Mlh6d1hoUm5QQ3JSOUNzaGQweVhpSGMwNzdQMjFyZ1BsMHNDQWdSK0tPN1hO?=
 =?utf-8?B?dFhxTlJ1V0FIRXBoQk1PcFY5dmdReE5OZXdJbzdEWUdBYURpYVJhTWRaZkRr?=
 =?utf-8?B?OXdjNGpLOTU4bWcxNDEraGo0QmhFVExnQ3NhcXc1YTVnSzZIWm9pcWlqa29j?=
 =?utf-8?B?YklXL0RnRlhyV2ZvYzh1MTFaV1RsTUFkN05FeFl4aEdYYlM4enpsU3B1S3lt?=
 =?utf-8?B?eXRHaWUyak9walF4azhLMlNqcHhZOStqNjlnUHVkNm02ZHhDdDZPU1dxT3lw?=
 =?utf-8?B?c2hrdUwxMXc5KzFnSnBrMDZzYk9mN1FjVWpzYU1WL1BkektNY2tEcEZSaG5n?=
 =?utf-8?B?em05bnUrNVJWRm1XNlpDeWZXYVgrNkRQK0dhZkgvWjlVTU5KeTFOS3crSUNZ?=
 =?utf-8?B?MFN0U2xFZEc2NGUzM1pXNk9HWGNEd09SVlY5SkdDVm1ja2R5anJmSVFMbHRW?=
 =?utf-8?B?a29wRTIwZHpGUXZzWFdMSUluSlVzQXlIU1ZNR1RkYU5kc0xSN0E3NXpuMTBx?=
 =?utf-8?B?OUxmU1ZMK3Bxa3dXY1V6MmxyckpDdWJWOXhWV0xxbzh5cjEyb0EvL3FXYXdK?=
 =?utf-8?B?d2cyRWpuSjkvYTZkOUlqbGlBRTluU0RCK3JlZGpHZnZ6Nk5mNVNhY0Rvbk1V?=
 =?utf-8?B?SmdBL29tT3VYTk0zNEFmaG85NldIUnFTRFlKekVHV2tJNmR4L1FhNjZWb1cw?=
 =?utf-8?B?ZlZQMVRzTjdPclhBUjMySFo5cERKT1BPMEU5Q0V3ZnVodHlIc0thM2wxRytw?=
 =?utf-8?B?aEk5NjlTRHZZZnMxZmdEeW1oSFFncFB5ZjA3eHdoaUg3bUlPQWh0NmRwbExv?=
 =?utf-8?B?cWY5VVJmRy91TiswVWc1S0pPaXhlUGl1SVIrSERLb0gxc2lpQno0M1lCZG9Q?=
 =?utf-8?B?OFlVZjN0MWlkdEN1VjhoVC9nRVBmbGNzUDBYanB3bExKdVF2NXFHKzhNVjFy?=
 =?utf-8?B?NzZ6UVRSeWlZRlNIS1R2cVlJd0dLdmo4ZUJ5TGhha2VDaTRqdHY1ZHJhM2ZL?=
 =?utf-8?Q?QWQs6tzvFFjdhK/7Jl6dBlQwx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ebba99-8a93-4772-d868-08dc1c3b3b63
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 17:46:30.8881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgI3jzuyfcAP5GSqpR5g9lWc5TMqB5UqB2jpcFAjfrSFUJZKRl8Cb2vZhGk3a+dAoFuefwvGvMQEF3sdRRhIZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5014
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:DRM GPU SCHEDULER" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/22/2024 20:11, Mario Limonciello wrote:
> commit f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
> causes graphics hangs at GDM or right after logging in on a
> Framework 13 AMD laptop (containing a Phoenix APU).
> 
> This reverts commit f7fe64ad0f22ff034f8ebcfbd7299ee9cc9b57d7.
> 
> Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> This is a regression introduced in 6.8-rc1, bisected from 6.7.
> This revert done on top of 6.8-rc1 fixes the issue.
> 
> I'm happy to gather any data to use to properly debug if that is
> preferable to a revert.

BTW - nothing in kernel log when this happens.
I did catch an ftrace with all the GPU scheduler trace events though:

https://gist.github.com/superm1/1d3fc752a414f324fbde526052573acd

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 133 +++++++++----------------
>   include/drm/gpu_scheduler.h            |   4 +-
>   2 files changed, 48 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 550492a7a031..91c96ab53fb5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -369,32 +369,6 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   		queue_work(sched->submit_wq, &sched->work_run_job);
>   }
>   
> -/**
> - * __drm_sched_run_free_queue - enqueue free-job work
> - * @sched: scheduler instance
> - */
> -static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> -{
> -	if (!READ_ONCE(sched->pause_submit))
> -		queue_work(sched->submit_wq, &sched->work_free_job);
> -}
> -
> -/**
> - * drm_sched_run_free_queue - enqueue free-job work if ready
> - * @sched: scheduler instance
> - */
> -static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_job *job;
> -
> -	spin_lock(&sched->job_list_lock);
> -	job = list_first_entry_or_null(&sched->pending_list,
> -				       struct drm_sched_job, list);
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> -		__drm_sched_run_free_queue(sched);
> -	spin_unlock(&sched->job_list_lock);
> -}
> -
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> @@ -414,7 +388,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence, result);
>   	dma_fence_put(&s_fence->finished);
> -	__drm_sched_run_free_queue(sched);
> +	drm_sched_run_job_queue(sched);
>   }
>   
>   /**
> @@ -1092,10 +1066,8 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>   						typeof(*next), list);
>   
>   		if (next) {
> -			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> -				     &next->s_fence->scheduled.flags))
> -				next->s_fence->scheduled.timestamp =
> -					dma_fence_timestamp(&job->s_fence->finished);
> +			next->s_fence->scheduled.timestamp =
> +				dma_fence_timestamp(&job->s_fence->finished);
>   			/* start TO timer for next job */
>   			drm_sched_start_timeout(sched);
>   		}
> @@ -1145,29 +1117,7 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
>   /**
> - * drm_sched_free_job_work - worker to call free_job
> - *
> - * @w: free job work
> - */
> -static void drm_sched_free_job_work(struct work_struct *w)
> -{
> -	struct drm_gpu_scheduler *sched =
> -		container_of(w, struct drm_gpu_scheduler, work_free_job);
> -	struct drm_sched_job *job;
> -
> -	if (READ_ONCE(sched->pause_submit))
> -		return;
> -
> -	job = drm_sched_get_finished_job(sched);
> -	if (job)
> -		sched->ops->free_job(job);
> -
> -	drm_sched_run_free_queue(sched);
> -	drm_sched_run_job_queue(sched);
> -}
> -
> -/**
> - * drm_sched_run_job_work - worker to call run_job
> + * drm_sched_run_job_work - main scheduler thread
>    *
>    * @w: run job work
>    */
> @@ -1176,50 +1126,64 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	struct drm_gpu_scheduler *sched =
>   		container_of(w, struct drm_gpu_scheduler, work_run_job);
>   	struct drm_sched_entity *entity;
> -	struct dma_fence *fence;
> -	struct drm_sched_fence *s_fence;
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *cleanup_job;
>   	int r;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
> +	cleanup_job = drm_sched_get_finished_job(sched);
>   	entity = drm_sched_select_entity(sched);
> -	if (!entity)
> -		return;
>   
> -	sched_job = drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
> -		complete_all(&entity->entity_idle);
> +	if (!entity && !cleanup_job)
>   		return;	/* No more work */
> -	}
>   
> -	s_fence = sched_job->s_fence;
> +	if (cleanup_job)
> +		sched->ops->free_job(cleanup_job);
>   
> -	atomic_add(sched_job->credits, &sched->credit_count);
> -	drm_sched_job_begin(sched_job);
> +	if (entity) {
> +		struct dma_fence *fence;
> +		struct drm_sched_fence *s_fence;
> +		struct drm_sched_job *sched_job;
> +
> +		sched_job = drm_sched_entity_pop_job(entity);
> +		if (!sched_job) {
> +			complete_all(&entity->entity_idle);
> +			if (!cleanup_job)
> +				return;	/* No more work */
> +			goto again;
> +		}
>   
> -	trace_drm_run_job(sched_job, entity);
> -	fence = sched->ops->run_job(sched_job);
> -	complete_all(&entity->entity_idle);
> -	drm_sched_fence_scheduled(s_fence, fence);
> +		s_fence = sched_job->s_fence;
>   
> -	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> +		atomic_inc(&sched->credit_count);
> +		drm_sched_job_begin(sched_job);
>   
> -		r = dma_fence_add_callback(fence, &sched_job->cb,
> -					   drm_sched_job_done_cb);
> -		if (r == -ENOENT)
> -			drm_sched_job_done(sched_job, fence->error);
> -		else if (r)
> -			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> -	} else {
> -		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -				   PTR_ERR(fence) : 0);
> +		trace_drm_run_job(sched_job, entity);
> +		fence = sched->ops->run_job(sched_job);
> +		complete_all(&entity->entity_idle);
> +		drm_sched_fence_scheduled(s_fence, fence);
> +
> +		if (!IS_ERR_OR_NULL(fence)) {
> +			/* Drop for original kref_init of the fence */
> +			dma_fence_put(fence);
> +
> +			r = dma_fence_add_callback(fence, &sched_job->cb,
> +						   drm_sched_job_done_cb);
> +			if (r == -ENOENT)
> +				drm_sched_job_done(sched_job, fence->error);
> +			else if (r)
> +				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> +					  r);
> +		} else {
> +			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +					   PTR_ERR(fence) : 0);
> +		}
> +
> +		wake_up(&sched->job_scheduled);
>   	}
>   
> -	wake_up(&sched->job_scheduled);
> +again:
>   	drm_sched_run_job_queue(sched);
>   }
>   
> @@ -1304,7 +1268,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	atomic_set(&sched->credit_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> -	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> @@ -1432,7 +1395,6 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, true);
>   	cancel_work_sync(&sched->work_run_job);
> -	cancel_work_sync(&sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_wqueue_stop);
>   
> @@ -1445,6 +1407,5 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, false);
>   	queue_work(sched->submit_wq, &sched->work_run_job);
> -	queue_work(sched->submit_wq, &sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..72f64bd0a6eb 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -495,10 +495,9 @@ struct drm_sched_backend_ops {
>    *                 waits on this wait queue until all the scheduled jobs are
>    *                 finished.
>    * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> + * @submit_wq: workqueue used to queue @work_run_job
>    * @timeout_wq: workqueue used to queue @work_tdr
>    * @work_run_job: work which calls run_job op of each scheduler.
> - * @work_free_job: work which calls free_job op of each scheduler.
>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
> @@ -528,7 +527,6 @@ struct drm_gpu_scheduler {
>   	struct workqueue_struct		*submit_wq;
>   	struct workqueue_struct		*timeout_wq;
>   	struct work_struct		work_run_job;
> -	struct work_struct		work_free_job;
>   	struct delayed_work		work_tdr;
>   	struct list_head		pending_list;
>   	spinlock_t			job_list_lock;

