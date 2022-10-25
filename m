Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5D60CA32
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 12:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D49410E321;
	Tue, 25 Oct 2022 10:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC6910E321
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 10:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiBtKIJ89gWvNVS3YkCQQY1qef10MxGooxqn3cnWAmkpD0Q+ZuCvh6y5wzdzxZFnstfyYTM8wODy961Kag+okRa1L7Mztq68KLZOu10JEg+3B7feUzAHQiq8y7V+TefsnvR0uGkUoux2THryUlK7ntYNDCy4wA+f5AN2NQIMjkNn7Rf6YQFmhGR+9WOqygnVc4q2n5t7DrVBX2ljOMMCVZttOBgvDNMkYJfdTb1YwyJhAywR2P3gm3ud9oYwR1ZFMZrxVXcGAkGrddRXV+HBTiHUcfdr+Fk7pHcroh7DjWAP08Ny5H9icWwiGD0BGlAccFkR6IeMXzVQh7bYI0kHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJRsQT6TjheETVIKDxOzinvSw36VWKXd+BxT9i8x+mE=;
 b=Rsm4fENcjfZhoWtf9ZUTif+coSpWxGh+yQRyDMv2/S0UTfM92KF5ovFk2xXrwhqqlO3h1jSIKEYkI0dHk53YaLuybCT9WfuwOlyGeJsF7NZy799m1k8KQf8jj+3KFOBb+hkx3UH8sQZozD14GMZQ7l8vM//Kkh3iRdW1ld26OEH6kTa5KVGDwkOZ36u4EYUfOOqX5hlLrMV4cHRIs6ecpO2LWWhaUwJdaFiUR3DdVp81sJhy+pxg7duN6hlw4QbSj41qa01icB5b43VB4/o3kkkR9pyRUWEUPc1KHn+a8PvO6LsycfEbpTAsSDMSxiDSIwsgV+WERqz4YL/k5Ih+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJRsQT6TjheETVIKDxOzinvSw36VWKXd+BxT9i8x+mE=;
 b=2Sl3lbugxLjRV8+EKH9QWwoU21n0YRhPwCrBD/IMLaYF8W/B/cqUN9D0TgwPCOl8JWyyCzxQ2C/E94v3uPr9GKAPejUj49noS5LZSqkURA/seCsxpgHPNmh90PZmjSyTwXzNGNUpG7g7Az6PQABxdeL+rcs2YlouK4ar6/gmG+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 10:36:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 10:36:39 +0000
Message-ID: <a7a4dd81-ff78-5fba-f2e7-cae5d3e023d3@amd.com>
Date: Tue, 25 Oct 2022 12:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/scheduler: Set the FIFO scheduling policy as the
 default
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20221024212634.27230-1-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221024212634.27230-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0014.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: ca27338d-082c-4a99-f716-08dab674cc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aAvoG7RqpqoxTPRFMpQsHM3Pe5n20nHu1ss9fezEuTRf6Q1L+COejETopTM3uY4i+ufAgLcgyFFVXqljkpJOtDL+bGpdQ25Bkuvhu5JhkujKbwBX0C0GHMefO1sAD9an3qVYnMkHneOanjCWZdecrLJXi7I+R0sEC7VENPL0ELU+IGMRaXPXlnTsO+TzOyk0GYgux1LcTRmzG1I8LjRxKFYuSyjfLSuQ9CKzEPBQOTAU0w6dP/iNHpWb0fuQIow4XMLZK0teBibii0fsXBo/FBRLv2bIqnGU1VHgKsl4Z46NARKYVGE5vht9o8SzGx+pbOAfXe++LrwvVLrSgrqsJVVrlBsY0OoGZdZ8FbrS3Zjf7WxTiIOOdzj3z/iqB+7+efmoC/ekKOAz0A3A3DPD//AR6gwfi7NfULWF/rRyYvkkMXKHi8t/WlVC0VM5+h5ix3Ta6esBI2SWAucF9K5WWltU97mlXWpENOjYsIgj5vMCfp+XDdIY0JxfJyuC7R+2u+DX3DKY2Ot66Kfyh7Il7fcx9yoiKiN6xqBpgw/5GWou3hUV7j4EfAN9FhMXrPjtLkBngcIzoj+LAwELUn/VxQeMi6aJ11S11napd6SM5tT+Zkd44HpoOoAXp23a2kecExNkP+tNWGdR8f4yirdMGJcC9nhYWNirHkJ59XBkbvcOyD0eJSRhwCEH2Pw+ADH/m/5MjwINTO+OBgR9LSRHKeGMIXEB7JzpKg4nmQm5hy0AQb4Xo6Uj8sYxGzC/O5u/Ph6D9G5pw4vFSS2SyE6HEvR/NiLuJ4oKxdKn3eoTKvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(41300700001)(6512007)(6666004)(6506007)(26005)(8676002)(66476007)(66946007)(2616005)(66556008)(31696002)(4326008)(2906002)(31686004)(478600001)(6486002)(86362001)(36756003)(316002)(38100700002)(83380400001)(66574015)(110136005)(8936002)(5660300002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdnQ2t6V1ZNRkVBcE9TVWVab0dwMkRzMkZsZE5mUHM2ZTRLeTZzVEY4T3VD?=
 =?utf-8?B?ZTR4YzdVamRvS1VIK3l0OG1ZMTZzb3puWU9pK3dUQkMwbFU1WXhlVForb0JO?=
 =?utf-8?B?cEZFUGl0WDRHOGl5VG5DSGl6ZmJqRnkvajh5bU1nWERvb01CUTlGaGJuYUdo?=
 =?utf-8?B?ai9Gb3pZajl4a1Q2WU5TSVFibDQrVkJVdmR1SnJ2WmlLdSs0WkkzcktoYkZs?=
 =?utf-8?B?dTlqS2xYZHFnMnp6RTVZdG5SWjRYQTMwUTB1c3U1c3ExMFNjSHVqV1c1VlFG?=
 =?utf-8?B?VkJySjhwRnZPSTBILy84d3pRaHNmVmp4OVFURDRZK2ExamhQcW5PZFZxSWsr?=
 =?utf-8?B?SGtWakF5SjBKTC9lN1daMGhGWlBGVXhreExVOVA2M1ZrSmhkbjhwRkpkcHFn?=
 =?utf-8?B?QWNkUEJrR3d4QmFjSTJpZ3U4MVVyVW0raXlKUzJ3SGVqNEpYYnUzY25Ca0ll?=
 =?utf-8?B?RTRXdXJCejBncytKYzZzekxTQU11SWNBbytONitucmNUTm5rTTkwenpvZWRt?=
 =?utf-8?B?bDgyckc5a3JPSVVxdEppZk9iKzlWUE4yZnAwZ1dQdjFyTTVIMmtZSlQrNjJr?=
 =?utf-8?B?NmY1ZmJ1TW81b0xWN2dkekZkRkhlQkpad1MrR2xYb044a0Fmd3AvUitDR3dq?=
 =?utf-8?B?OXYyVzRISEF6SDBoUThwQkhIYktpWGpwa05uaDZkdEVLd0cyUEx3WEpISnVN?=
 =?utf-8?B?RmQvcVlRN3ZjRTQyKzJtOXNWL1Z4REthNDdTSEl2V01FTlpicjJON0wvZi9J?=
 =?utf-8?B?QzNzeUgrWitNZXdUNmxHMTE3d3F5L2ZWdmxPTHNzWkJFTGVCZUFVMW05aUJx?=
 =?utf-8?B?emFXWkE5QmFqTFBWUkROWm82cUtwY3BxdkJHL1ZxZmZIaDlyQmNLQnhKNHF6?=
 =?utf-8?B?SnFHSjFWQ1ZuUzlJS05neWdKQWdLSGFpNWFsZTJqeDZEN3ZLS3ROWGI3Mm9O?=
 =?utf-8?B?eHhVNlRIajM3R3VzdHFTa3RxVzM1aEFCMWNmd3NicEQ3eEhXMy9ZeUNuRFJQ?=
 =?utf-8?B?ZTRqbUdZSlBaaEFCOU14dHhLYUxUNVBrRFBnaTVDQm1weDJ0ZTUvaDJESElz?=
 =?utf-8?B?Mm9qcVlQaEtYRjdkSXVKUFZBNzRub2gzdHNNSmR0N1pwYTRrNEhEZkxLaE9K?=
 =?utf-8?B?aVV2b1dYdFhNM3lxTUxiVDVOR01PcTJaRC9uNVF0VnBiMHdEREN2a0JRYkRS?=
 =?utf-8?B?NG00Nm9qQzArWjVvTG9uTWlhcWkwZ3dZR1NVRDNianRJZWprT3FmQkRDT3FF?=
 =?utf-8?B?UWE5d1BHZWJWQ1lnVW12bXo0N1hJTlQ3bCtlK1BKNVRyUjIvTy94SVE0cEVu?=
 =?utf-8?B?ZDkzNFIxaWlFM0Nhank3K2UrcUZEcVhGYU9EdDAxUmVab25RQUpRYUFqYU1h?=
 =?utf-8?B?QUhtdjk1WSs5Nk0zQy9pRTRJWWhxRmY5ZXdQSmdQcWZXUml4Z3Q1WUFIRGhX?=
 =?utf-8?B?bks4cjR3YnZRdnByMHZmMFdMZ045S0p1VVhIYjhnVzlkbWJkSkJJWjJ0VkZK?=
 =?utf-8?B?QU5ITG54MVczS25iQ2VSWUVwU0ppSWlrNnBiMi9QVXZOK0h5YWFxTDdrRXN5?=
 =?utf-8?B?eStRSExKTlBEbTNqblorZW40dmUyNFVkTWZGc0VlVFQ2enB6d1lBRnI2VTZZ?=
 =?utf-8?B?M2JVTE80TGVCdjlMY0ZPMUlSRS9nWWcxZ2s2eDNjaE53N2U4WTJYb1ZrWm03?=
 =?utf-8?B?N2s0dUVtVWxHY0pQOFRMb0RXYVlwc2dTSjhjWFh1ellueXlHQUtiRm13aG1N?=
 =?utf-8?B?QU4wR1M5eVdyZkdacnhyODc3VjVLdDFac0p5czB6MGdpM0NhejhxemJSaDZt?=
 =?utf-8?B?QVk3NTlZWGR1WDhkNlIvb0FLRGxXcUxQR2t6SFlQNHFGSGJQRVRDRVF2eW8v?=
 =?utf-8?B?ODlzeVgraDlFZXFkSFFDa1VvOUIyd1dWZUJaRlYya3RmNHhzaXdjd1ozVExu?=
 =?utf-8?B?K1EvMExTNEIyUGgxMHNlSVdsMSsvdmRmQnRsWExRRndySHQ3c21KMmJIcHBk?=
 =?utf-8?B?TGFQZmpybVZOMkRpenhIbUVFSWhma3hFRTFHQ0FtcHUwaU1FczhLZkJlaklo?=
 =?utf-8?B?NW44OUJRclJwdldQanhsdXVFZzF4NGNBMGt1VG41ZTZ0UUFuRElNdXNDaFRs?=
 =?utf-8?Q?BZQ2O7vFahTdtDA6eSbqFQk4G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca27338d-082c-4a99-f716-08dab674cc6c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 10:36:39.0688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqEp7zqFCS8nwexkJ7Gq6zXrifXOLQ/ctHPPgQHhVBHxAkb9GYOyqNf3+BR76V9N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next.

Christian.

Am 24.10.22 um 23:26 schrieb Luben Tuikov:
> The currently default Round-Robin GPU scheduling can result in starvation
> of entities which have a large number of jobs, over entities which have
> a very small number of jobs (single digit).
>
> This can be illustrated in the following diagram, where jobs are
> alphabetized to show their chronological order of arrival, where job A is
> the oldest, B is the second oldest, and so on, to J, the most recent job to
> arrive.
>
>      ---> entities
> j | H-F-----A--E--I--
> o | --G-----B-----J--
> b | --------C--------
> s\/ --------D--------
>
> WLOG, assuming all jobs are "ready", then a R-R scheduling will execute them
> in the following order (a slice off of the top of the entities' list),
>
> H, F, A, E, I, G, B, J, C, D.
>
> However, to mitigate job starvation, we'd rather execute C and D before E,
> and so on, given, of course, that they're all ready to be executed.
>
> So, if all jobs are ready at this instant, the order of execution for this
> and the next 9 instances of picking the next job to execute, should really
> be,
>
> A, B, C, D, E, F, G, H, I, J,
>
> which is their chronological order. The only reason for this order to be
> broken, is if an older job is not yet ready, but a younger job is ready, at
> an instant of picking a new job to execute. For instance if job C wasn't
> ready at time 2, but job D was ready, then we'd pick job D, like this:
>
> 0 +1 +2  ...
> A, B, D, ...
>
> And from then on, C would be preferred before all other jobs, if it is ready
> at the time when a new job for execution is picked. So, if C became ready
> two steps later, the execution order would look like this:
>
> ......0 +1 +2  ...
> A, B, D, E, C, F, G, H, I, J
>
> This is what the FIFO GPU scheduling algorithm achieves. It uses a
> Red-Black tree to keep jobs sorted in chronological order, where picking
> the oldest job is O(1) (we use the "cached" structure), and balancing the
> tree is O(log n). IOW, it picks the *oldest ready* job to execute now.
>
> The implementation is already in the kernel, and this commit only changes
> the default GPU scheduling algorithm to use.
>
> This was tested and achieves about 1% faster performance over the Round
> Robin algorithm.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2fab218d708279..d0ff9e11cb69fa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,13 +62,13 @@
>   #define to_drm_sched_job(sched_job)		\
>   		container_of((sched_job), struct drm_sched_job, queue_node)
>   
> -int drm_sched_policy = DRM_SCHED_POLICY_RR;
> +int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>   
>   /**
>    * DOC: sched_policy (int)
>    * Used to override default entities scheduling policy in a run queue.
>    */
> -MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>   module_param_named(sched_policy, drm_sched_policy, int, 0444);
>   
>   static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>
> base-commit: 27b2ae654370e1a8e446b0e48c4e406abed12ca1

