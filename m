Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F94F1714
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 16:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E2010F847;
	Mon,  4 Apr 2022 14:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3104E10F847
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 14:35:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHfv8OXVUvCRE1jBMLu/3dKKfO6cOz2176Mq61jE55ctsLQ4qWLryOdPC0zWkIAQ2xWJY/1KoCfiqWZ3SosQu8P7Bc8+7Xx25Ju0LAqurYmaCIvdEHXN3+xTf7kXDmfHSShrVqCKZXRloHjsH5I0wZaRsD3mAgwQpdj9WClcNaJtZjfRXiYPi39vGxFV0YhacaKUQ2lJ2r7/avya06kOERKPn+w7XHTuqEZrvJdfrmOo34iyp8YzMEqx22WN2oDB+1pqZhD9V24fwYPFAvuGyjcWUrgw9f7Pu6RfWgStUA8eL9bMishURPBfppUNvXhtBALDTbceeO/Vp0A7zWO2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLotLd0jYp7IJVxL263oG3Pfcib/WYoGg/dKI3dtbWU=;
 b=iig5eATr278z1egmNnP0WQgqq3TDdWyssorXmu3FdKKaBudtxRdbi32tJcu+R1SuGIl5ACmlpITZQNJhU1fh8DABSNfOhqxevWUtY6k10GFybXIRi0aN1az7sXWZDyEC1brMOKUN8cOrn8IzMOrixqvtJ3hW+ypl7Tdu4Jf1D9gDwfm3d7PorUebjoZp97cUY2lss7yqdZQW1I2iseOnY/dKxE44hSgEvVxTelE39/Wy8x4ijGHysHSPV4mlh+U/ow1LDtDzgPr7t/l2StPcXVZBYJL/ApRuV6gbXVQ5ru99WEDi9hyBSyv4+c2RNnD0ZZ5cnqtL4ppD/S9XpWjfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLotLd0jYp7IJVxL263oG3Pfcib/WYoGg/dKI3dtbWU=;
 b=lg36isX2VqLXARUZMcT73CEKiqQJYDTeHcgPn6bt8bVO32Yhqwxs/NPM9fg5MRp71Ts2w28dsnJYx+nnaofEkh212CTExIl+zVMFrFFduRHrZODWhp67D84th+RaME8I+7r3uhG2qkA9hRV+GDimIOUy/lreIDXIYj2PmM4na10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB2777.namprd12.prod.outlook.com (2603:10b6:5:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 14:35:02 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 14:35:02 +0000
Message-ID: <6f89be90-50fe-729c-028c-978044e6840a@amd.com>
Date: Mon, 4 Apr 2022 10:34:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220404042509.13455-1-rdunlap@infradead.org>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220404042509.13455-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:208:134::39) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ff8b042-0170-4728-b3c0-08da16484db7
X-MS-TrafficTypeDiagnostic: DM6PR12MB2777:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2777DBA47845F8B819BDFCF2EAE59@DM6PR12MB2777.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /UAsV8PpPpHnGoWeoURlfLljVE8R7SWR1hR7fq91/0lszmFXCpvOUl8iQ/po0omP6aBSiPgBnGPEjk6BAHZiedyP1uG+1F25L74RgAIPTC+14toCoiiAYCg2C6HHzWeMd+dFFjPYrVJfLRic2l+ap+pqCP2HKROitB2Ic51fKbEtUFSh4ql17LgUQi4oUqC2x+PS95rmbb7CwDJD/kKSxx8ZrC7YIBbTWpd7LgyrzhsZGrOyNW7iSU1H0OLeinFG3zMBedyXkN4l1FsEcxRa5i7XVlFLXwk/DD2ymKE+4VThs6OUN8NJSeThfkAIfrNd54TsTikUpCdnTn79evVd95pAbyTAkKWvLccNlNysSkVM4og6x2PZ80ceVs4NOurbM4sAkZhA5Dx6lCqFwOB3Z1XYK468OTQbdwBg71OtgbAqX1vwhea5jllNRoJ90oY9PZhvv9YmbxCaAMvuPR+kH6UBh9mwkFz2nhVQeCiysw1EgUTv0iw0c7G6ae2qPiQNCmii2hhoASv67VgGzwqCD2WJNsF8IN0VOqNHvdkNBvw3eazECSpJLQplYL7ITnNcYKSLbXLbaB+mo4MDBfSLvsqZR8ZMssTtsk/WbktdfWe/YtZ+PgIrgt2aTELM41kXvsDdxTQrT1xbnC4icvdaGD45wbJ22CUP28m6NOOqgCrDNb0rn6ezvYR2xMmylgYyyhEIqpQcxbnA4D6tLIQNEInq0Y307px5glefjNZyCvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(83380400001)(38100700002)(54906003)(6486002)(31686004)(6512007)(6506007)(44832011)(84970400001)(86362001)(8936002)(4326008)(8676002)(5660300002)(316002)(66946007)(66556008)(66476007)(31696002)(36756003)(508600001)(6666004)(66574015)(2616005)(186003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkplV1E5c1grTWVPYllFdk1RcUoyc25Da3pYY3BRbkloZ1JsVjN5WEE1Qkk3?=
 =?utf-8?B?alBwRDRTUDJTeWlwWkdHa0htVWlzQlRmbWNHQ2ZRWFhOTmhiME13bzlCdDZr?=
 =?utf-8?B?eXdUYng4ZVRBUXZCT2paRUhjaXRKVlUwc1hpZVhBMDZzR0ZZenFocllWZEdX?=
 =?utf-8?B?a01WekZrVUJsKzc5eWFiVG1QZFhXMkhyNGttdlBQTzN2akZJYmZDaHpUaXNM?=
 =?utf-8?B?Z0VKcHJFZmE4Wm5aNVlqNDhWRUJmWngrOTJZNm9vUUhBcWlnNG5ndXNUNmhM?=
 =?utf-8?B?NGNvd2lSMmk5cnF5Rjl1S1I1T2ZBWTdwVng3bmdiY1RNSmkrK2FjZDhLbnZX?=
 =?utf-8?B?bjR2UWdKMjJuVFhkaklKeFA1THptSURVTHVhWFRvbCtCWUhBWWFlS1Vwa0sy?=
 =?utf-8?B?N0xIY3ZkL2dCc0c5aUQ4WWpnbFlQUk9PSDJhZERKUTRKd1g3aGx0cFN6a21B?=
 =?utf-8?B?SFNWc0JONGlmUFB1cDhVSUhwaytjTGprdGRCQXVEazk4NElLSEIzMS9Qekp5?=
 =?utf-8?B?aUlPd0VSQzBtbFphOHIydlErNDZEL25NRko3bUZNVXhCSXNjbWZqV291TWF2?=
 =?utf-8?B?MHNrVG8wM3BXazVsNHNIaWJYVkZLb1B5M2lXRHZjbEx2NGZtd2lKVDBvMzhu?=
 =?utf-8?B?ZUhmMkFUaXNOUy82cStrVmJyUXEyY3dNZ2QxN3MzUlVVbzNQWFVYc0JaVWNY?=
 =?utf-8?B?S0V0QzEzMVpYOHRYU2ZUL25JYm02bTYyb000Wm0vSzdxa2JPVVg1ZGZEdmpi?=
 =?utf-8?B?UzR1OWZsL0JOckRuZWM5LzhCUzJJVWlqUk1CMXBZTndmbVRNUFBtMCtGTEdr?=
 =?utf-8?B?VzE4UzFvZllUalU2bjM2Q1dRZnNITFRQMlROQUVPR2lnZzFEQnVicngvMjk5?=
 =?utf-8?B?dWZQdTRaczRydDZGY2Q3RDd4YmtkNFE0eFEyTnZndDBDU2NPNGQwQXpTK2U4?=
 =?utf-8?B?azQ3OHRlL1gxU3dDOUNOVWZST09oWHVnQ2k0YkEyM3ExT0lQSmczeko2eFhT?=
 =?utf-8?B?c3FTcU5hYjc1bGdxNDRDSTZYS21TN2J1clRRRmVBTnY4bGg0bXZyZjI1QXpM?=
 =?utf-8?B?OEI2QmpPaTZoMkplaFhPSklZSXp1T3FrWVNGaVBHaTRiRHh0djBCc3FPK1Fr?=
 =?utf-8?B?UWcvQ0pGSnVxSWdtNHVtYnFHQXovWHJscysyQmFCcGx0SWU1eVE2Y2tBM0Js?=
 =?utf-8?B?QTNoOEswUnhhVTBJVHltaGM1OVE4SlZEK3B6VXdlSm9rYXd6MEdtUkF1ajRx?=
 =?utf-8?B?VTBBWHg3UmYwVkU3VVpQQjdZMG1OM0FJcUtwV2wvdzhzWGxkRHoxcnJ5ZFBX?=
 =?utf-8?B?UVdDQ2M0MUxNUy9vZzIyRmxFN2g3Ry84M0ZuMUFlZVlWdEpjMmplM3phVWd5?=
 =?utf-8?B?eVl6SGlWWmltelRlQlFJdVc4R1N6c3p6R0ZLOWE4ODE2S0JQRXdrQ2FDcDNJ?=
 =?utf-8?B?Z2lQSkwwTU9NclRXMmpqSmVmb2c5T0t6WDR3bEtPZzNDckRtMC9GZW5NZUFG?=
 =?utf-8?B?SURNQ0NKb1NzQUtxYVJIZitNLzBvdmhpMVJWWHpCcnFJWDlLTXVSSVlaV0hL?=
 =?utf-8?B?VTVGSTltNHlhMkVMTVV2NCtaeit0b0lzZXBqM3VTbW5Pb2NKcmtjZi9vb2U2?=
 =?utf-8?B?QWI0STg2Wkt2Z1B0SjBVSTZ6OHRHV0UzOE0yMjd2dmxDeHFMZjFEcUhNTVda?=
 =?utf-8?B?WGdLKytoeGtyaHYwZFptSVpKZ2Y4VWtBN3NBTm5hY3oyc0JRVlJNRFdrMmtM?=
 =?utf-8?B?WVZXdDZwRWcxK2JDV3VOQmw3UFc1akdIYkZIaWdwYzY5TWZocjF4VGd4MzhD?=
 =?utf-8?B?aWtoRi9xUTJlRTJ6UXJKejRzRjdnSDkrNjJoM2JvNVlQL3hCekRBZjZEOHk2?=
 =?utf-8?B?dTJWbGFVc2JDdVdRK001VGplU0JRdTRKNTJaV2hNRi8rWGM2cWYrM0Q0L3Vx?=
 =?utf-8?B?RFVZSGFFMWJseDVFTUREZDR2eUpFVEpUcUR4Z1kwK2tJVVFWVm40TWV1OXda?=
 =?utf-8?B?cG00SVMrZ3JXcW81VHNxRnpXbkNvQWc5UXY4em93T25uWGhOME94TXpzbTd0?=
 =?utf-8?B?NFh3a0lkWGVrWmMxYWNSUnc3ekw1OGVaODFzeTVtOHlKejIvMjREeGtOWUVq?=
 =?utf-8?B?dzRLclZ5MzFDeklJNkszRW8yeHBCNmdkZmZleE1EVjV2T2J4aWNyeERuUnB0?=
 =?utf-8?B?Z2VlYWNOYlRlaVVoTWFXVE8zTVpyV2Q1NitFc2JjM0ZuUFQ3QXhGVmtTVm1h?=
 =?utf-8?B?Q1hYM0ZXSTBsdGhtaUNzNzFVWlI5RExqT2NicWlrMXNRakZMejVlREw0UWMw?=
 =?utf-8?B?L3QvcXBEdnoxUmVrLytjcGs3N20yUWxOYVc2bVVNdjlNemZBT3lJTnhaakZ0?=
 =?utf-8?Q?eFM1w4imLn+E51kh21J3zuL8d1jGuWNZDhKvpdUI7UXOt?=
X-MS-Exchange-AntiSpam-MessageData-1: T/oMq0+YPVunsw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff8b042-0170-4728-b3c0-08da16484db7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 14:35:02.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q63UMccr79gJUY/LK6vMx0Mvdtrb9t6fIlrxVVOY4So62riDW88rksVlc6/qTJLS8NmIhSfg7NLJEsr2gucsfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2777
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

On 2022-04-04 00:25, Randy Dunlap wrote:
> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
> 
> Quashes these warnings:
> 
> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'

Looks good to me except one point is that I already commited a fix for 
the above warning to drm-misc-next.

Andrey

> include/drm/gpu_scheduler.h:332: warning: missing initial short description on line:
>   * struct drm_sched_backend_ops
> include/drm/gpu_scheduler.h:412: warning: missing initial short description on line:
>   * struct drm_gpu_scheduler
> 
> include/drm/gpu_scheduler.h:461: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
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
> ---
> Feel free to make changes or suggest changes...
> 
>   drivers/gpu/drm/scheduler/sched_main.c |    3 ++-
>   include/drm/gpu_scheduler.h            |   10 ++++++----
>   2 files changed, 8 insertions(+), 5 deletions(-)
> 
> --- linux-next-20220401.orig/drivers/gpu/drm/scheduler/sched_main.c
> +++ linux-next-20220401/drivers/gpu/drm/scheduler/sched_main.c
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
> --- linux-next-20220401.orig/include/drm/gpu_scheduler.h
> +++ linux-next-20220401/include/drm/gpu_scheduler.h
> @@ -270,6 +270,7 @@ struct drm_sched_fence *to_drm_sched_fen
>    * @sched: the scheduler instance on which this job is scheduled.
>    * @s_fence: contains the fences for the scheduling of job.
>    * @finish_cb: the callback for the finished fence.
> + * @work: scheduler work queue
>    * @id: a unique id assigned to each job scheduled on the scheduler.
>    * @karma: increment on every hang caused by this job. If this exceeds the hang
>    *         limit of the scheduler then the job is marked guilty and will not
> @@ -328,10 +329,10 @@ enum drm_gpu_sched_stat {
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
> @@ -408,7 +409,7 @@ struct drm_sched_backend_ops {
>   };
>   
>   /**
> - * struct drm_gpu_scheduler
> + * struct drm_gpu_scheduler - scheduler instance-specific data
>    *
>    * @ops: backend operations provided by the driver.
>    * @hw_submission_limit: the max size of the hardware queue.
> @@ -434,6 +435,7 @@ struct drm_sched_backend_ops {
>    * @_score: score used when the driver doesn't provide one
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
> + * @dev: system &struct device
>    *
>    * One scheduler is implemented for each hardware ring.
>    */
