Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A496A7F6D44
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368F910E79E;
	Fri, 24 Nov 2023 07:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DEF10E79E;
 Fri, 24 Nov 2023 07:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul1eAq5CVsiaY8oUUCWiQPql/bCotcQR8MGqybbPWHQntUdaDIyAsSc68igOZ7V6atfrLiM2uV0SmyTPmcunT1MjJlvgp79anRoWf+RDjCZtEAw9I2qbE2gQ/zoqtrlCSJ6P47i33fKhkH5PLr+cljeOQEEiNR/jyARswgMvNG4xXmudYAyaIkrHlvX7nQ2ZaYxIwhPO44hPz86FIv/+io/dVwhrih7pTANI1vukjCTSg4y1tw5mPhxkapC3hp5/N99cHaGsNe4LWFivFI/BzqbOmMcKUGtJNfA+RTEPUmX7XInRYhxAWRlr4fSjp9OreDC09J+a+j/T8aUk4GIQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqvLCVBSlTx61pZnp2MJifB/YzuNwGQ3JcK4Cz0VNOY=;
 b=l5oJgZbfYzwrzfg3Eg2DaqHnH1ld6Ks+VGACNGHoZZLGCp4IQW3xmT9IxmofaLxE6xn7cXB13VMo+9kLZEywfW4+BG+LyEKfUL/6i/OnQf2+GQzPz/tSlSvCldELhjLKcu9kAh7lYaN1UU0Cr71Eeg2PEuTZuMZ2fL1v/bsbWhQQ7K7EUp4lwnQgVXpusi+gdpA7BQhqSUoYq8aP8lL+D9e8YylEw+gWInASVXLxL3jhj8eszXAauMGBtlxB2PCnz19t/I1GPNYjX4r62f8dgxia6bHg73QxZP0u/jIROzPwZ1UZrYz0jANLAqLYoiJnaGuUKZaeeJ/EsSN9XJKGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqvLCVBSlTx61pZnp2MJifB/YzuNwGQ3JcK4Cz0VNOY=;
 b=nAfLkAeCB/eZWvuFuzPObLZsj2sDTXNStwoSUzYxxOA7az3Ej3wIfIKwsNt6nIlr96CX/cGOGcUflcUJKi3oig7q+30k8PFDnqyvEhCB7VIvqPZRPPpwkwEFZvmDmLnkV+kHS/9FTr7JGlp1mGSdyGVuTlokae+U9wNo/HRc3e0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 07:57:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 07:57:33 +0000
Message-ID: <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
Date: Fri, 24 Nov 2023 08:57:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231124052752.6915-5-ltuikov89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: e63a6ebe-76a9-43bf-0058-08dbecc303be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+ksWNkWdBGo07wxiHrrABjAIQ4+xq/dxuPqhGOxjVNrQC3jL08vVlbOHd7kBub+p1ZGkWhFmI1Xxc4/qxv4FKesPI4mhNOduwaOZdCPmch/vYsFTQd4tw6Dqjhb4PQtETtUALeSd/y9hkzFPngOQ0w3c2BAAX2Q9oKUiSYD9VtB87PY+ue+TcnaP1wgO948OOi0R3Tul9M/UQpiKSijWB+1PpiDuTSrVK5KX5prVnbnN01JK9j5iXaMr0hWA1fo5/j+xuCvGY1m604GD0BTDseHFAgOo25o3BshJl/8C8GgAfRdoOfrz+EDZCRuF6TLzjTcq8ytr2u6Uclu5CwPIRlMowlkd9a117RZPBe8O6RETtsbIYHyKoyRiop+mkM/78mNnyPw0iNz2zw7bT51A/1oC7JFD8IBbLIefbvpYltFSpGkv3UwHPkygyCgcxIt85VYrbVUROhMM6CL9DJPk+7X8B1XZKv4zRcWA4rXRJFqzkP5u3oKSDTxNCEMTOsoYXh+xf6xI8lSXG1yuw5dToC7TkeFszKTYCx+wwOA7vpyPu6Fz1nNBFdzDPMsyyP6q+EzAaOYLSOuZgkIOMGcYWV2wxcwtb5ai0BAm2cEevQ/aAhMsR6cfy2catJoxevVG0t+8ta6r9+ZBPAcROZ9uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(66574015)(6506007)(26005)(31696002)(41300700001)(6512007)(2616005)(38100700002)(31686004)(36756003)(6486002)(478600001)(6666004)(110136005)(316002)(66946007)(66556008)(66476007)(54906003)(2906002)(8936002)(8676002)(4326008)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWdjUXBmNXhTVEZ5UnpqWUNLekhMKzJnbzNZTFFkZnNENVVrNWNKeWxNNVVv?=
 =?utf-8?B?U21QNHdtSUdidTRnRmlMcmVpV0FIYUFYSzRxK2xoTjF4NzJ3MzdlRFFxOEJj?=
 =?utf-8?B?Qk01bGF3akRvNzlUVEpBUWlCTnF1cTYybUZlZyswbkFsUmMvaHhabHdHTDFM?=
 =?utf-8?B?R1V3K0MwcjN0NWpCdEZka3pMS1R4UGxxRkI1SVEyL0xCQklxaXl5clVFUVpy?=
 =?utf-8?B?dFdERUtzTXlCRmJmdmxQMDhTZkxFOVVad3dkelpDR0IxZkVseCsyS3lDbHUy?=
 =?utf-8?B?YVNhcTNHRlo2NUJxY1hSa251a0FqaEM1MjMvamNsdUVtc2FTVS9rdWhSanJZ?=
 =?utf-8?B?N1JybjlzTklpSVpDN2tJZFowbDdPalFDNGpsMnp1WU5mSXlBRERFQVppTXdp?=
 =?utf-8?B?TWdDVWlNa1gwdkVjMURaeXJCV1ZnVFBTUGlyaXJYdnlhQ0JDREVadmN6Y2Zz?=
 =?utf-8?B?dmF3ZkJWZDhoWTErcjB2U250dER4ZmwwS2VCeStwaFE2NlBDV0tnNlpVQWZC?=
 =?utf-8?B?Q3VTVS80ZDczZk8zZG9leFIzb3ZmTVNaQ2tjdHIrbHV3TUduY0FMR1A3WS92?=
 =?utf-8?B?c0swN1dRelpZU3pQVHB6Z3RxSEIxTWUrYlZGMmFGdlZzczVJd0tJeXVuSjlK?=
 =?utf-8?B?Y0xCRkRSbUNoYmxiaWlYUmExeENhR29YaWRWS3VucXgyWlpxcmE5ZXNaUElD?=
 =?utf-8?B?ZTE2MlNtWThBZUEyYi9WMU5XMTExd2E4dm9BOHRJZTJqaG5YNVliak90MFI5?=
 =?utf-8?B?eFgyUWJseGkrVDZiQ3hrZmZRZjdDUWh0cEY3dERJUFV2ejBEa2c3dElqMW5Z?=
 =?utf-8?B?dFF5MS9KZ0FqdytlNjM1NkpFeVlPVVlha1BYRmI2VUZDU3VGRDYralBqcjlC?=
 =?utf-8?B?cFdteTFiZ1A4czJpbEttb3EzYUJLalc3SklBK3NNK1U2NURreXgybkdoR3lR?=
 =?utf-8?B?azhiMUduV3BUUnpROWh1TUNoU0p0d3lsdE4rbFZpVkNraWwyQzFEZVZrMHJa?=
 =?utf-8?B?S3kvak5iQWhHTzI2MGY0T0RFL1NUQTA3VllhN2MvSExESWRKVjNPL2FTTXIv?=
 =?utf-8?B?MHBydzJ0dUUrYzBxUVByRmxBR2d5c2ZST0YyWVJwa1FtV2NJaktXOTZkaUZS?=
 =?utf-8?B?eGpRZWJLQXF5dnVoRU54K2RHTUNjeXJlMmJXa3RJTXNvWWROTjQwU0ZGRmw5?=
 =?utf-8?B?TklyT1hUQXN2VEVUNHlGbzNLeDJSZnk0STNFaDRBckJEaCtqVkw2ZUMzbU5F?=
 =?utf-8?B?Q2JCQ0x5NDBSazlsUXI2V3A5azUwV1BaMnNENENGdEc1endxMHdJcTJQZTE1?=
 =?utf-8?B?L091cExBTWdIbWpGZld0K1ZodW1kbWJ1bVltOGlNYzZXY2kyaTBIVlRvUVE3?=
 =?utf-8?B?LzZQYU5IWWFuREF5Qm5mdWpJNjIxY05oU1JQNkE2eHd4RGtrU0pvaDhTZll2?=
 =?utf-8?B?ZDMzZE9RcEhaeGs2ZUhGZGpELzFCdWdIZ1JoSVJIdjYrSm8wRjdENVNiUWVN?=
 =?utf-8?B?cTVaSjAzcCszeW5BZ1lNQm9rYnFTUDBmbFduVnVKMExZNFZBVHVzYlRvSGM2?=
 =?utf-8?B?cnJWZ081b0JydjJ2SU1tVGtDRWhEZHRIdHpJTUhyalI1c0krdjJJSmFYRUFn?=
 =?utf-8?B?YTFadS9CUVhxVjNvMUdCUmw1YmhMN3hIYmp5MWlJMEw5ejV3WlN6WU1QQk93?=
 =?utf-8?B?Q3FvcmZQQ0k0UGNqTUxvV0xrRDRudUVIK0tmYThoMWVPYVE4d01ndlg0V3E1?=
 =?utf-8?B?UC9FQUFYaUx0bnFEL256UnVrQjdNRU82T3NhNlA3Q3ZXNGVaRmJKU1R0UDli?=
 =?utf-8?B?WmVEdk1TdWNRcmE4R01EQVorUkthVW5QOVZhM3VMS3ZjTnlyeGhiY0ErbnZX?=
 =?utf-8?B?MDJCZmlDN2wrVWFsVFNiZ084MGgrdlQzM05YWjY5cDlwRUtBUVc5NVlxRkE4?=
 =?utf-8?B?SUgzcXI5SDQ4Z2FQQzBmZURrTlFoTU5YbXRmT1crOGZXNkpXREx4Q0dRTDFr?=
 =?utf-8?B?ZjJYYUprdHlIeFlFUmlCOFEvbjgxZFdJNSszSFltd3R1eGd5QkNjMUhEeUdV?=
 =?utf-8?B?eitxS3ZCMU9uRUMzUlN6b2xpTGRGZEJnSVUyc3BnelNwMXhrdzRoK0ZmbUZZ?=
 =?utf-8?Q?y08q5RwB5k/9Fea9XjByUIVcV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63a6ebe-76a9-43bf-0058-08dbecc303be
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 07:57:32.9802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkm4nDa4dpnw8PRJWJsNZdACEA/bCPdJG/hLAvfk+xDhujP1X22+1J3nvyTcCDNZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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

Am 24.11.23 um 06:27 schrieb Luben Tuikov:
> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>
> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities
> in ascending order,
>    DRM_SCHED_PRIORITY_LOW,
>    DRM_SCHED_PRIORITY_NORMAL,
>    DRM_SCHED_PRIORITY_HIGH,
>    DRM_SCHED_PRIORITY_KERNEL.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>   drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
>   include/drm/gpu_scheduler.h              |  2 +-
>   6 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index e2ae9ba147ba97..5cb33ac99f7089 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -73,10 +73,10 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
>   		return DRM_SCHED_PRIORITY_NORMAL;
>   
>   	case AMDGPU_CTX_PRIORITY_VERY_LOW:
> -		return DRM_SCHED_PRIORITY_MIN;
> +		return DRM_SCHED_PRIORITY_LOW;
>   
>   	case AMDGPU_CTX_PRIORITY_LOW:
> -		return DRM_SCHED_PRIORITY_MIN;
> +		return DRM_SCHED_PRIORITY_LOW;
>   
>   	case AMDGPU_CTX_PRIORITY_NORMAL:
>   		return DRM_SCHED_PRIORITY_NORMAL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 62bb7fc7448ad9..1a25931607c514 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>   	int i;
>   
>   	/* Signal all jobs not yet scheduled */
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>   		spin_lock(&rq->lock);
>   		list_for_each_entry(s_entity, &rq->entities, list) {
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 4252e3839fbc83..eb0c97433e5f8a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>    * cases, so we don't use it (no need for kernel generated jobs).
>    */
> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
>   
>   /**
>    * struct msm_file_private - per-drm_file context
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 20c9c561843ce1..cb7445be3cbb4e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -88,7 +88,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
>   				entity->priority, sched_list[0]->num_rqs);
>   			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> -						 (s32) DRM_SCHED_PRIORITY_MIN);
> +						 (s32) DRM_SCHED_PRIORITY_LOW);
>   		}
>   		entity->rq = sched_list[0]->sched_rq[entity->priority];
>   	}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 044a8c4875ba64..b6d7bc49ff6ef4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1052,7 +1052,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   	int i;
>   
>   	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>   		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>   			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>   			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
> @@ -1291,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	if (!sched->sched_rq)
>   		goto Out_free;
>   	sched->num_rqs = num_rqs;
> -	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
> +	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
>   		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>   		if (!sched->sched_rq[i])
>   			goto Out_unroll;
> @@ -1312,7 +1312,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->ready = true;
>   	return 0;
>   Out_unroll:
> -	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
> +	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
>   		kfree(sched->sched_rq[i]);
>   Out_free:
>   	kfree(sched->sched_rq);
> @@ -1338,7 +1338,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   
>   	drm_sched_wqueue_stop(sched);
>   
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>   
>   		spin_lock(&rq->lock);
> @@ -1390,7 +1390,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>   	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>   		atomic_inc(&bad->karma);
>   
> -		for (i = DRM_SCHED_PRIORITY_MIN;
> +		for (i = DRM_SCHED_PRIORITY_LOW;
>   		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
>   		     i++) {
>   			struct drm_sched_rq *rq = sched->sched_rq[i];
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9a50348bd5c04e..d8e2d84d9223e3 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -63,7 +63,7 @@ struct drm_file;
>    * to an array, and as such should start at 0.
>    */
>   enum drm_sched_priority {
> -	DRM_SCHED_PRIORITY_MIN,
> +	DRM_SCHED_PRIORITY_LOW,
>   	DRM_SCHED_PRIORITY_NORMAL,
>   	DRM_SCHED_PRIORITY_HIGH,
>   	DRM_SCHED_PRIORITY_KERNEL,

