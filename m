Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062374F0F2D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 08:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E34610E1E8;
	Mon,  4 Apr 2022 06:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83A910E1E8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 06:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3jMd0a08ACIP0Y2ylfYwPYP547h23QuxrKSrCbvZM1c2p487bwqQorBkQFyPiQ/b4qF6li8E3JUVlyRHSnxE9/1KyA/qXIUuLixBDdvGxQ5MvLwwFlGRnhQtiLBxqBAb9ayFrjUbir+3bLx2RvN07XYMKFOF8HDeujZjUKp54pqh39qjqrqZsk1VQZuHBuiDQ4N3/1QE7zFAGZq5lPlqhjv3PeCTJ8b/vIiNjgPcTGgKdwGlSfEqlMnIyeVJ59jLJ7hqU3hh/2RJkvr9lOJvjoUhOgNTEvBmiBE0VpQa4jcwrjrFaourls/70pKpgelbNHdfnFctsGI5TUvM6hArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVD8b+1O02l2D3WMTt9HXUUN1fS6NOCWZPv5HJVgvVE=;
 b=bmFJRO4uo8vMoHmIBnd5cTXgRUOD1L1Y/OAckzqKqgJgL9KhuWqdFlk9DYe7UiEGMoa+RYphEyr+18GrEGdT0lDwJ+1uNSC3JEg9sRZC7kPfrJV7NDc+rTE4mSmsKK0YzvdneSHB5C7B/znNLflVJOLRWFtaNAYtUHDL97q8Mlk4vGB0xv6KQWpKkK9LbxVEtSpiTuzJAkebzYEr6rxNp3J7lW5Cbpxl8VPqAoOPv7n2kwQaf0v0ZWvDIkP8TalQvJNgUhBf0dCt4bxmcK8xHasQB03rL0ZzZXMsG1OOljmsKZdGYM4lsVMAOlYt5q/EWMHrs3Ie0prRB2kFte2pTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVD8b+1O02l2D3WMTt9HXUUN1fS6NOCWZPv5HJVgvVE=;
 b=vXSGx68lREDzgEpslOxx3PeFbM0zPqyisCXj+3KbLoxUywt61PcnSZYpWflIOmqAPjufxMhpCPbYlj7LiQKqoPX6Ctn8va1OGGpawunpjLd0WFOOC5OYdB/Pl9R1TjUSPxtirHfQ6Tn/WNxn7Q3RW05lOruD/d9RCVCROVPn9ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2360.namprd12.prod.outlook.com (2603:10b6:4:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 06:20:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 06:20:10 +0000
Message-ID: <fb48bacd-7df2-44d0-8f88-af026936ca67@amd.com>
Date: Mon, 4 Apr 2022 08:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/scheduler: quieten kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220404042509.13455-1-rdunlap@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220404042509.13455-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0004.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d498a9a7-3564-47d7-49ed-08da16032b20
X-MS-TrafficTypeDiagnostic: DM5PR12MB2360:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2360B22071E172CC984C1C1C83E59@DM5PR12MB2360.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPXEs3eggDqeGJ4k+JeJ+5Geyn0dYwqnSfgx656o1Cmh4msVLScpsVIKUrkJ/gr9N5DJMOuNG4MB0Ix8DzQjdEQR7ZDwCCN6XkFTOIdQJWn1YEYi3lDs+6Mpjesu0epYQdKy/WpRGab+NbjQfS+1uqAHOvPM7v0LZWl7SjCDJCHdAWOiCuYz7SbnXcLkLFbXelkDc4XkC6PcgaO3Hba8+OV6p1ylI17e8vtlPgdxTla+CAym8esYESrGdULpQ/03yAGucaCiBb2nuPT2plF65UKU4ZecfMCwfZ3mT3SqYJoPeiH+5JhaMJ0MN81uTxkzcX2KQ3nWCjwjz9mXTojl3sQXebxdch9fxEBewYMU00+giJOLdswoqXopU2469DLCUgZzpHF++bqOWDWOYj6blAppt4/exDyk6TB2egNydih7/clKWNZkD5Q4qMySUVzYo3LBkQPj+AXjZXSuJcg3B07h5qJHPHVPNR4z70+3n3O3SsDpjgmqMfkvQoQB0EOJ49IimaSrXTrI/iyVv3/8eiJR+rt9oUA7up5biivwK558JAO4yv/HW/OoZ8pezWIMfIi4Z7xUvw1rqz7sfK3angMhYmpyuxqCrfr88pTRyw3vleegv2NsDwpGj/XeBb9T6vQIiCUd1Ic1fg+0kupFgEinvewfc9tcCN9Cqg6HIH+U03NQ0BrHDZoBb+Byv6EMP2F8O2Dsi2/rQnP6oPIfbuBiFzQwMkMaw2H13GyJCgM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(86362001)(6512007)(6486002)(66946007)(66476007)(66574015)(508600001)(8676002)(66556008)(4326008)(6506007)(6666004)(2906002)(84970400001)(2616005)(54906003)(38100700002)(5660300002)(26005)(8936002)(186003)(31686004)(36756003)(83380400001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHl3N0QwTWNFWkI3UCtJZzh3MDJ1TUswb3puV3JPVFNHbzdsbTMzL1gyaGM1?=
 =?utf-8?B?RjRUMVUxcTE2UXlTN3VwTGh5RVlpYzAvdDc3Tm95cmtTejU0aG1ub1ByT25M?=
 =?utf-8?B?NDg4Ni9LcU12YlJ2aFhjaHo0Q2prUEltVjRYWFc3RU9manlHczJDTlp4VVZC?=
 =?utf-8?B?NFlUVU9jRE5KVjhERTQ2ZytkQVdXMjFxWCs5YnFmTE8ybzkvMEZNdGUzV2pv?=
 =?utf-8?B?aXRSTkxVWXlpem5rVVVSMnZtb0FvNlNtWHg3UGwzUkpVZ3cwUWNFVk9rNTV2?=
 =?utf-8?B?WlhveGZSd0ltTTltaldoYkd2RGtHMXB5cDhvTDY1NDhlSmY5UEtZV3pMVEtp?=
 =?utf-8?B?NHUrcUNTYXNJdy9FbnpxTmh5d1J0SExWTEhlL3VFQnN2Y09KenpvVndBcWlR?=
 =?utf-8?B?dmhTQ2xXaGJMVGQyQVh6cUIyMTBzSytSaWZBN2NMRmxJTW54TTBxSG9UMUpu?=
 =?utf-8?B?NjhSUGwxcmNSeGVqSk9aR0RWMDJqL3JMTElhNGJZd2NDRVRqblM1YkFEdk5Z?=
 =?utf-8?B?Qk95WUlhblBHYnc0dVU3QXpNcTMzNThyMWlvNFZteXpzaVEwQ0VIOE5Ja2tz?=
 =?utf-8?B?T092YlBhd1kwd2R2MWhkSFc0NlJYVW9mSTN2RHREdkRIUWw4NlhqMGxnQnJC?=
 =?utf-8?B?QVBTT1FrVlJnOUpmZWorVnpnSzdSdFNwYWt3ZTl3ZElUMUIwRUZXcmxrSEda?=
 =?utf-8?B?NjVOS3liTEwyaG1FM2RnS2pCcFk1Y25MVkVLQm5DWlYxcGdRdGxQNnQvcVhp?=
 =?utf-8?B?ZVd3K3o2REpmdG1OQ3ZLMkp0MjVGQVRwV3N2Ni8rVUtoWWtPbVpIekFoYjcw?=
 =?utf-8?B?b0NNYmFKM25VbmRNQlA5ZzRjNzF2L3U3QVdpN1NNcEhYQTEvSUdXbTJlVzZi?=
 =?utf-8?B?NEN2TnZINS9rYU9pK0tIQUFIRVZvZURSUUJkOVRrVEdXaHdGeStTdkp5eE43?=
 =?utf-8?B?bnJJeXVWaHNpcUlEZllnam5WL2ExcFBFNmJqVm1UVFdxSElYMUMxOXY4S0RP?=
 =?utf-8?B?OWgveGtad1pxRjB3RDRENWp2WGp0L1ZGditjRnZ6Qll1OTdDYUZDd2cwcW11?=
 =?utf-8?B?NHRQL3k4MTBGc1BMRC9zbTQ0ckxJVDFlc1RPZy82RHdnRUNZR3lCSzdGa2JE?=
 =?utf-8?B?S3R0Q2MvUDNoYmYwWHdZYm1uSW1vUGxNRWF5b1VxZmpwNjI0M3dDZVhPZWZ6?=
 =?utf-8?B?dmw4VXpoQ3AyNVBKMlR6TUYwV2Nzd0NPbGR5OTNXYlloY0kvQysydmFqaUFn?=
 =?utf-8?B?cHpKUXVRZDVKOUZWMzg1cTRFZ1pQZ0VQSDNFbCtGTlBBT1F3MXJLYy92RS9o?=
 =?utf-8?B?d1hDejQ5NWxrZkFHem9LVXNNY0hVSGtKVEh1SWlvUEYwMjlESW85Y0ZjMW9B?=
 =?utf-8?B?L2RYbEh6S3hWTTJGSGo4dGh3UHB2czVyN1Y1SEpZMkhIK1hVV01IZ1dqZTMr?=
 =?utf-8?B?c3FDQzJsQlRpQit0cDBWTUFtVHFDNjVjN2ozdTN2UW9jZ0REUnExWEFMWWNr?=
 =?utf-8?B?TlQwYzlMQ081NWU2V0l2eFgzSEtnb0ZRR1dMb1FrODVYNno0WEt5RHpkWFF6?=
 =?utf-8?B?RDc5MzlhNUxHblp1aVN1SUQrbW1LcVltaVNCUWI4STRKSjdpakpWRkRHUG5P?=
 =?utf-8?B?S1BkdVBneXVUV0NSdU1FUUR1N2tYOGtud21vZFhXNk8yeEtuVEE2WVVMeUZL?=
 =?utf-8?B?c3IzRUV5OFJqSEF2NUtlbUlaVnV2UHBsNzNtQ29INHZicWZ0b3FxdEZJbHh1?=
 =?utf-8?B?UVh2RzZxZDhtVDBQRkJyWkxBY1g1ZnNPUDZRZE5CUnd2L0E1ZkQzQXh5bWt1?=
 =?utf-8?B?akp5MkN4YXR4ZXVLMVUxZXVZOWhxYmtFdlFyRllNTGVGbFFuMzJyMzhHTnU1?=
 =?utf-8?B?cnhoMGd3eTJQbjUwMUtPVG51bGRlYWMvUzM0Vldzc2lOaG1FK1I1ZDNwWW44?=
 =?utf-8?B?WU5GVEhTUyszNHU0SkpHcHNIOHoyZGJLRk1aZ0FwS1I5MVd2OVFUeFJaREo0?=
 =?utf-8?B?bEdjenJpejV6a1lodUdDWXNQZkZDQ3JZVUZpaFZvTktudE5PN1hSc3dMRnI2?=
 =?utf-8?B?cWNBS0NBYXBkekVQcW5SWVl0ZmdXVzVHQi8xTmo1bTJoN3pmR3Z5ZHJnMXFr?=
 =?utf-8?B?c2l2L2hxS2ZqYTVnY3lBQXNYcExIRjFGZk45V2ZQU2x3TWRtc0ZLNmxpQ05O?=
 =?utf-8?B?eHlENFJ5SVdGa1R5ZFpQK0xOcXRoeVFUL1ljSFBsclVQS2RpVENwaTdCbUFN?=
 =?utf-8?B?SEpjdjNNbncwUE93UFZEQlJlNGFtV29yVW5SSjcwbFdIeHpOd1g4KzRlcEdj?=
 =?utf-8?B?NExaWEtJRFVIeXlWa3VBVFdYa3daYkFObEkyMEcxMmlJenJQbnphUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d498a9a7-3564-47d7-49ed-08da16032b20
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 06:20:09.1845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuSKtyHQOjEGxrW7xV8oGPSxy9lbNlxSaGk4tzCJX08tI7ArtnFfjI7yM2zqgzt5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
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
 dri-devel@lists.freedesktop.org, Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.22 um 06:25 schrieb Randy Dunlap:
> Fix kernel-doc warnings in gpu_scheduler.h and sched_main.c.
>
> Quashes these warnings:
>
> include/drm/gpu_scheduler.h:316: warning: Function parameter or member 'work' not described in 'drm_sched_job'
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

Acked-by: Christian König <christian.koenig@amd.com>, but Andrey should 
take a look as well.

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

