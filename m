Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE504F1DF4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 23:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7910E782;
	Mon,  4 Apr 2022 21:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7052510E780
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 21:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcI9J6MoAEXriaJ2th0ziD92gsoliCTJ6hM1NgrTz2Mslsp8TQhLlGR6h7jctUhuxdqmd9sEog0H86AX0JWzWykh0gKOe9k9tX2ZS9FO6Q1r+kjX1Cby6IhcmTWGOf9EYtOpcF5jHz3eMK3FWiq+JtDyEZmLEXfz6iJSQkH1R7OXxftumtgulRWPLTeD6LPmjriIYkmT/6kZM8wOxkFWP2BGJwZI5CoZEbKC6SHquAmp16RgddC0MGMdnyMyRRkER8VDCePXaOaYosypjPlkhKvgTY9tdUP10HJ9QNvPoCGfG76t7qLm/Guo5PmYa5X3mQ+sauUsaCk9nRbvFvXm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61ceq99LU8ODD8Yq91yQqbjIXv7X2B7DWS5yRC88k9c=;
 b=LEfGbU6ObmpTaWSOzxJ5SUwa4MimDYc4jr8/Di7oXJTdSp304ASMPH5+dDDw71nKonsDnvFhi2c1AErjOS3BTGXvUH4Blvm/AnlEfXqzvYuac1qZdbD06gZf6K1o5ZoBSiMz1lu9YQpOqx7x1a/ewBxvC16GJLwZlthO19V/mCBQ+1fTGPGpo8zkLmXteoaJMumrd/G63jZonHNyu/Lbqx7jvGwMK5fPyHFafzMOuO7xMvOCftnWgtYfcDm0CNtCOxCoOtYUCKMNbWwkIea/qC356j6LAHPKXHA8D5a2FvxoPMtumPCXqSrJAUOg3U2E+FbhQaPWjhHHLucjIwF4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61ceq99LU8ODD8Yq91yQqbjIXv7X2B7DWS5yRC88k9c=;
 b=jGyopkci5wEzSzW8ap3NhGnJzF/ugqY+GLz77foo/WE7101M5sS5ae9Awj1UKn/9GngXv8rTwBSCvGHUAmnw4FqilPXdQD8ttTYECE9c4Zs+LV0AxlntR27kr0c7TgimqvdvJNHIWptY2VP0SodUT+vc38Mh80zfm73E0/lIDGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB2614.namprd12.prod.outlook.com (2603:10b6:a03:6b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 21:58:16 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 21:58:15 +0000
Message-ID: <68961bab-6448-9a98-8916-9c3cb0c5d020@amd.com>
Date: Mon, 4 Apr 2022 17:58:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220404213040.12912-1-rdunlap@infradead.org>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220404213040.12912-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a57acc95-31de-46c3-31db-08da16863876
X-MS-TrafficTypeDiagnostic: BYAPR12MB2614:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2614F7BD965890F63157793BEAE59@BYAPR12MB2614.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97ZOQ4fnj7Vq6gRWsP91YRbufBHvg2UJiDDza7CEycB145eUV2bQ2WYC7/ZFGPKCQ5JD+TJk5HnKV//bsmVBi732cYnRU0S8m3GJ9YKCmLT6Sg4vCKleD12zigXsm+J7l82kJ26ImxB0enKeoCFyzz6rD5OBA6AgeLiazbo6bGtxGUJMM77j13QWNKLtZzKw1AeiHFt2gtUIWLNieCljnXnJg+CAX6EI9KqDnMFtBC+QkA1tIvlvlDE6lpwVaMs0ZdYqzkzAT3Dec11OG7RpvZNYVFtvAaWdzSEh1N/9h4kjyzucXnt7179WXhrFCSXQFNuiBoEIMCPYlRYPlXeld9j8FQGDeDe+1RmoPTHcSteHCPlIQnDTyu2JLb5lv+e54WgjC5DHDoCj03Fe0Vj0UoKKi1hX+ayMcN6C8OSpXngeCDmmPGs0d7vVM4IeG4E7tHg+7a3vWEJRPPfaKzlaJfuoo+PdOHzRagaatze1VEQRIFHU066YbKmcs1MBW9vB8AEzF1dFpmbiZehpuG3qxGKdCdQO/mgNS5RiGP6uVdjjiXRan9Dv3xml1DOPgntvikEQyCjt03cdNimGrBK+74ndvKdW8olwjlHXxCQ+PfaTC8r7+kUnxpWbWheV0Kcb4Jvkcd8h4GwrVAzm6jAK8FOXTzWVjUzzCsZi6n0ZuPq7WRrBcOevM8wIj1qSyAR/oj6SiBK8PFNIH8hs0oOhrApDlc4xmg6ejxhtoRmJv+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(38100700002)(53546011)(4326008)(6506007)(44832011)(66556008)(186003)(66574015)(36756003)(508600001)(5660300002)(66476007)(66946007)(2616005)(31686004)(8676002)(83380400001)(2906002)(316002)(86362001)(54906003)(8936002)(31696002)(6512007)(84970400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE85b2NEbU1MQVJJNlBQWDlWVk1ZWmlnTExYZ1dSbTVQV24wZWE1eWQ0Tytt?=
 =?utf-8?B?WVZvYkl5RUw3YXRhMW9JbFdML1psRndFajR3ZG5Cb0RuL2tUTG1NYWF1SUpX?=
 =?utf-8?B?VTFWUWFDTTVoQ1hacDgxSXhZS0VScWRoYzVRR0RVRldTY25Nb0xFck9iSXJG?=
 =?utf-8?B?bWFFUXJkdTdOc3AzWDJRSlRpVmUra1FxVUREWXhqbzgvcUVZd2djZXJaK3FT?=
 =?utf-8?B?MU50Q1JGaXhTN2x0bjVGeEtCSzR1UUlBdStickpxeU92MXgzb2luVUtKbTlX?=
 =?utf-8?B?ZGFIbG9MMDZ4ejZGcEZmVlZ4RDBmQ2JBYkNGL1BQbjRiUHFXaVA4YkdyZ2I2?=
 =?utf-8?B?K0tpZEg2NFJHRHBKNU9QNGRoTFh3WkRLTWZQK2wwU1VvNnhVVldUVzRlWENy?=
 =?utf-8?B?eG5ZNloyMFRTOTU2eWVsK2IrWUx1Q2xhdDFOajEyYTVncW5vcWVzY3RCaFo2?=
 =?utf-8?B?RVpVNFpwbUs1V2J3MWFSakwrVklaQ0ExdkZoM2V3RFJ4SHNWZC96bndRd1c0?=
 =?utf-8?B?QStjU3djMTZkQ2JqQ3pGLzd0YnZSanJCKzgrVUtNSDR4ckt0d1BXN3RCdDl0?=
 =?utf-8?B?bEdwVzY4ZnFkZXFVU3RXMFVSRGFUN29mRC9GTUV6dmdNaGs5SGxFTUhTUHQ1?=
 =?utf-8?B?MTBoZ3MxL1JWNVp5Y2pJaXR1enRwOE5rUGhXZ3BZdGNoNkNsdGlOc1JZS25C?=
 =?utf-8?B?MjlIRjArZGVUSTAwYndVR1JpTm9qWEZRN0dTZXlOWUw2SDRIb200ZXpSeUxG?=
 =?utf-8?B?a3Rnbnd0cDlWdGx4L3NQQ2thcWxPWjBXNUVmK3JWbkxDMVQwamRaUUpTSUdG?=
 =?utf-8?B?WTl5Ui8zU1Y1Y05sd2hEYlVNUGovazNQMDZEcU9ya09QOGZnSGtGdGYrdU5q?=
 =?utf-8?B?UE9FK3NFcTB6aXhQa2ExWVFlUHJBV0FKc1JWQ0tjR1FXTWZIWDJlM1ppSkhK?=
 =?utf-8?B?b0QzREZ3dGI2VkxueUtYb3VNSmZLWUc1OW5DdkhzZXBjbWxnR0didkR1RkJ3?=
 =?utf-8?B?V2p2cE5XdkVhekVHN05nMkJRMUR6WnpzVUQrOVJVVTFrUWFETmpqQkFmNFVH?=
 =?utf-8?B?cldycFlsQm1IUnZHSXZESTVtSmxQYzgzcWFvSThoY0lSUUIrcWViQitEczFM?=
 =?utf-8?B?WHRPaUFkR1B1R2gyR1NFZ3AxYkErY25YU2owMzFJcFIrTTdLcllDdm9rSVlF?=
 =?utf-8?B?UVkwSlRKeExSUDVHQUE2SEVFaTY5Tkp3cnZZWmFRL2hqTFBiZXp6STJ1b2M0?=
 =?utf-8?B?b01mZ1ZVcGlQYkVyZXVvMVQ1WWJTT3Uyakh4WTY0NzhGZjdkdDQ4TGtQaG4r?=
 =?utf-8?B?SWNsL1NtTTdUays3OHd6Q3U4ejc2Z1Y3dExUQ1lpcklTQ01YQUNvOEFhZFQ4?=
 =?utf-8?B?dlVTSTFXQUQraU9rblhsOHFiQndKR3lranhkbWpFV0prR1ZsYm9RVGNsZERr?=
 =?utf-8?B?OXgwTHlEVE5NdEVzZFo4cHp2NkJHb0E2SXJNbTF4YkVTOXdyZjhDdFNTRUc4?=
 =?utf-8?B?UVcrWnE4L0hxMjJIeWNmdHkwKzZoY1lmQ09ZVlNENWRqVTZhSzJEb0FmcVBI?=
 =?utf-8?B?TU9XUVFXaXZFZ3BaRCtRWktQYVlQZVlaRHRHM0NFbEhVZ3B5N0ZDM3IyVWJ5?=
 =?utf-8?B?NTJmSHlWM2NvclFab3BWM1haMTZ2Q0VMNStOMkpUeU5RRmptSHRlbVpKcFVL?=
 =?utf-8?B?YnZVdkdaVDFCOFpraVdoRlF5djVlMkNjQ0dRU3poM000Y3Z3U2YySlRrbmpj?=
 =?utf-8?B?TmlFTk1adnd0UHplRXBZUHVmSm9CbmpkSGQ4N2FReHdZUE9XT0F6dkdER0ZL?=
 =?utf-8?B?aHFrRWk1eHEyUUJ5QlJDNGhIakd2eVp5NWREUnQ1ZDVxTmtYN2FNNUJaTTlU?=
 =?utf-8?B?Zk5CaDFnL0pqYzZQSVkzL2ZUL053eDJwRkpMMVhHSDB3T1hOQUhoSk12czF6?=
 =?utf-8?B?K0lwQ0o5emZvakF6NVpOdTBtaVR4K1k3VWlzSXJiYTRQOE1IemFXak5Mc2Jj?=
 =?utf-8?B?UGFzQzNqQ2h2dWZxZlVEdTJiUHRZQ2RkaEJISm8vaDIrOEJXT0JHVzl3bGdJ?=
 =?utf-8?B?S0FDSFlkTGxydFZXdzVVTHY0SjBJa2E0R2tWcHRpNkhQSC8zVlhIMGRXSjNi?=
 =?utf-8?B?WVh5S3NJaUZNNEFFZndkemlJTll2VzF0eHVLR1U2MFZJQ2M5dXNXZDdLYjFL?=
 =?utf-8?B?Z1dQcGhqTk12MXN5cXM2OTV4RnA0TGxHeGhsY3NmMDJvUzBCL3oyYkNiUGxr?=
 =?utf-8?B?MTN5TEVzSklDRm53RExQRjArWWU4eldkeVlkUUIwTVdVZWdxM1V1bmdHMDFT?=
 =?utf-8?B?SVBabXJJV3ZraW52K2ZEUVkrZXVuVU9Gc0RwbytnajNzek1CT3UyOVFILzR3?=
 =?utf-8?Q?rM5DQFs9t+FsPS1Sf7e3hlWCMrud1bg/NXDiNa6eA2YKW?=
X-MS-Exchange-AntiSpam-MessageData-1: KLPGXc+pT91D1w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57acc95-31de-46c3-31db-08da16863876
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 21:58:15.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oafk3Usi0h39jcQGlTUmOAdpofK6lOGgZzUbO2ky9iYxM2lN2AhhIE3y18R+vcVqAcCIwkCtZifzONKA9KEtiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2614
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
Cc: David Airlie <airlied@linux.ie>, Jiawei Gu <Jiawei.Gu@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Andrey

On 2022-04-04 17:30, Randy Dunlap wrote:
> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
> 
> Quashes these warnings:
> 
> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>   * struct drm_sched_backend_ops
> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>   * struct drm_gpu_scheduler
> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
> 
> drivers/gpu/drm/scheduler/sched_main.c:201: warning: missing initial short description on line:
>   * drm_sched_dependency_optimized
> drivers/gpu/drm/scheduler/sched_main.c:995: warning: Function parameter or member 'dev' not described in 'drm_sched_init'
> 
> Fixes: 2d33948e4e00 ("drm/scheduler: add documentation")
> Fixes: 8ab62eda177b ("drm/sched: Add device pointer to drm_gpu_scheduler")
> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Nayan Deshmukh <nayan26deshmukh@gmail.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Jiawei Gu <Jiawei.Gu@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
> Feel free to make changes or suggest changes...
> 
> v2: drop @work description (already done by Andrey)
> 
>   drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>   include/drm/gpu_scheduler.h            |    9 +++++----
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> --- linux-next-20220404.orig/drivers/gpu/drm/scheduler/sched_main.c
> +++ linux-next-20220404/drivers/gpu/drm/scheduler/sched_main.c
> @@ -198,7 +198,7 @@ static void drm_sched_job_done_cb(struct
>   }
>   
>   /**
> - * drm_sched_dependency_optimized
> + * drm_sched_dependency_optimized - test if the dependency can be optimized
>    *
>    * @fence: the dependency fence
>    * @entity: the entity which depends on the above fence
> @@ -984,6 +984,7 @@ static int drm_sched_main(void *param)
>    *		used
>    * @score: optional score atomic shared with other schedulers
>    * @name: name used for debugging
> + * @dev: target &struct device
>    *
>    * Return 0 on success, otherwise error code.
>    */
> --- linux-next-20220404.orig/include/drm/gpu_scheduler.h
> +++ linux-next-20220404/include/drm/gpu_scheduler.h
> @@ -328,10 +328,10 @@ enum drm_gpu_sched_stat {
>   };
>   
>   /**
> - * struct drm_sched_backend_ops
> + * struct drm_sched_backend_ops - Define the backend operations
> + *	called by the scheduler
>    *
> - * Define the backend operations called by the scheduler,
> - * these functions should be implemented in driver side.
> + * These functions should be implemented in the driver side.
>    */
>   struct drm_sched_backend_ops {
>   	/**
> @@ -408,7 +408,7 @@ struct drm_sched_backend_ops {
>   };
>   
>   /**
> - * struct drm_gpu_scheduler
> + * struct drm_gpu_scheduler - scheduler instance-specific data
>    *
>    * @ops: backend operations provided by the driver.
>    * @hw_submission_limit: the max size of the hardware queue.
> @@ -434,6 +434,7 @@ struct drm_sched_backend_ops {
>    * @_score: score used when the driver doesn't provide one
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
> + * @dev: system &struct device
>    *
>    * One scheduler is implemented for each hardware ring.
>    */
