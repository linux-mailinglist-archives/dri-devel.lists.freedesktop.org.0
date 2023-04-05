Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DE6D8503
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB0B10E15D;
	Wed,  5 Apr 2023 17:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50410E148;
 Wed,  5 Apr 2023 17:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6YjeYuFf0SIAa+W2PFT583BA8LpNKo3nLMFIOCebKpiJUc4SHYBD8tVQGE4Fr7os6rlhOJHTL7zLoPNDO2+XeHKt+qT+hQtMr2NDgU8htwrGcdTHVLq2gDhzIihMsto7MHoAoVsRoh20Q59wxe7unvntq19h+XEKac970mOnKnIHYj9ws0pn77B9ua8+J0Q3xrBuCtABlWpflr6fESrCj1MpzEuyHJ2zWP75o3u+P62xLsa2KQaJpr+N0WgiIIV5y34Lbj/QhPyH3dxVUlC6mYvKUl2DlLz8jsJFLHOsuYlhG0Mqth6aWWlbZO5aP/CLB+uJKNkJe4k0iOxMtatwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dad05qCvStuFpv5bd0GkJebyx/3K1N9HqpDKza4dvuw=;
 b=jvQuSm7Pp6HyzF+6UeX356cVIHcUi9f2SUBm/dqtUqiHY5PoFrZmaTHa0hgxa87pQmk55wiIJ9DmcAFD8JNLdVMG13UBT6mRqFoxhXrI0ffm4T9c5QvcmM0nCG16nt2AOPfJ5+aBPrYAOI0AdFOG2hLUgZKQfZ8mDXCIjMxYNwSKubDyOrA0W30wHuzj3GOZpZTjgvuXri6dFoM8AR2FYxllmX72DJ+/DBFGQxtu8F8u+6nKtk7xc+eOQbrEh/EQ2qsR0qNjqueaNv9SpNS8CgbvRAWAfEoMJWDrz8o22Y9esa5jvDduSjntfMN0CAY6UXb2Mx76N3iweV/xzNyt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dad05qCvStuFpv5bd0GkJebyx/3K1N9HqpDKza4dvuw=;
 b=5FbYULCYtB5J/UTEpVqPQjoeVf12b2ehWw20zF8MwETtUSY2cwvQAKOLDeSxPUBB7dUhqV+BQV2/CeAIUD3wDqQhP3pUYefh0d0y2aZxFxO8TrgYsPhdz8D5x1XAIA+j+0QAiny/gC+ZMK6x1z54b2gdZI8ynCmGfszjCoeENxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.24; Wed, 5 Apr 2023 17:37:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 17:37:26 +0000
Message-ID: <698b54e7-9ae1-d0db-fd42-572d43180dac@amd.com>
Date: Wed, 5 Apr 2023 13:37:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-3-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 02/10] drm/sched: Move schedule policy to scheduler /
 entity
In-Reply-To: <20230404002211.3611376-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0403.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: d65c12f4-c9f6-4bf6-863f-08db35fc6bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWF6LSE6RVCRi3EknR7IbL+YKDWk7mb6lLUTtlyI/gzRTVfuzRZZAU1pS4KvLSG+CNdcsx7eNYTwujwl4S0cKI6BIWdm9k+GgvM/HVU/hqERZW64EayZu4z5+0F2LpzgiYR/nnYSmhRUdiXSFQZPJMl07n204wHxzkkWD0QkMRa/PdqCD3Hp8xtcU1U1jazjBUqvLXifvQXbxwb1vE7qRQRRCmoCjbxIjfSLojD6G92XbxI/VS2plfE7XEJ6yBiEL0iReNsOMcpdOG3JNUYbJwysRnyLUJW4aPYj3P5BHiQ1PVCdGOBdLCpkIgv3IFokr7B7KOLC6cdxi7oXZMH+A+YEcPpkYPryeU4YZkNDx6GIuqxvQH4fz525gW23gx/0Jke4nlIWt73Qxar5MwIk7GQ35SJba+U/6tTUShRNJUsG1Oxi7+4i5E7ZAtzstW6SwgpPcHevZ2+u3ltKoNfr+YVIbDpmVoKJhF+7ie4lMmAeaFgd2SbRaqXrSWZS1Xzv3STp+aT1+gacpc15RsiawtpRtmq02p/3dHPg1xo6VGP5GRxtZqHl9PfP+AUN+Yf/OTjPLQIlGbKS4HK6UBACqXZtmazF2VkhCfbxzSAChHJ5jJ5jfgFPDGxsPR8IJekkRPN/lQgDzLX7hWI6yGvx6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(36756003)(66946007)(316002)(6666004)(66476007)(6486002)(66556008)(8676002)(41300700001)(5660300002)(478600001)(44832011)(2906002)(6506007)(30864003)(86362001)(31696002)(186003)(2616005)(38100700002)(8936002)(53546011)(26005)(6512007)(83380400001)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGdUbnJZWE45SFdXU2cyR0ZqMlhwb3ZzR3NGelYxNERWRzMwczNIYjRJbDZy?=
 =?utf-8?B?T3AyeUFjRFFDR0VXOTEyUGhPVGJONXJSakpHK0Z5c0tVdkQ1Nkt0WkZXNnpt?=
 =?utf-8?B?YUtLRlJVSDRDcHVjb1NSSGtBU2pXd3dRcTRjaE9adnpyQjR0ekZrNmRTcTV1?=
 =?utf-8?B?OGpKVkFDUmdManA0cW5UZW5pRzdxN0dpd09GODYxcnlXTmNsbys1MnkyQWpv?=
 =?utf-8?B?SXhsTm1VdmI4WldCQ213QXdWcjZYamUrM2JPSkx6WG5CL3pEa2FpdURNTW5u?=
 =?utf-8?B?S1NBdmcwajRram9Sd3pmZDhYcUxLVCtwZStaSklsTVdPNHc3ZnRQUnJVZ3N1?=
 =?utf-8?B?Z0VZOWdhRElURnJOOGFkOXZtalQxRVF4QW5oQjhDUXpubUk0OW55ZFpranlW?=
 =?utf-8?B?VzYwcXFvak9leW5uSjIwNVVaeHFDTDluQVhYbHkvZDhyZzRlUHMrZllWb1Ft?=
 =?utf-8?B?bUVRNTZLSTFtdkNtOTNDZ2hUeGtyay9oMkFhWjRQQ3YwdTRDaTVFSEhVTEpO?=
 =?utf-8?B?WFZXVEI5bHlFSDcxeHlMQzh4V3NWekFwZ3MzWHF5OWkyRWFYcjR3WkRMU05u?=
 =?utf-8?B?N1dZV0RBY2M1N21HS0lUUnVBOWs0Qmd3ZDRUNkgvMjQ4bTU5WWxvbUhvVXFV?=
 =?utf-8?B?MWYzemd2WFZqek9ITEMvdndjdzFiS1RMWlR6QTVJM3h0V3BXaWx1M2JBV3dY?=
 =?utf-8?B?SGpDMFl4dDJlOXRzWEJlNXZsTDAzOWZtQkhLWXZ4YlF2V1dFajNpNXpFKzlL?=
 =?utf-8?B?WWtCZTJpV1BMRWc5Z3doMjFudDlndnk5ODVPbEZ2L2NGcHZrcVZjUlJYOFpN?=
 =?utf-8?B?Zzh5T0dsaUdIeVgvUUxTOVEvZUZoR3FnckNqdWh6WjZVcm5mSmpmWmR5T3pK?=
 =?utf-8?B?a2ZWZURYWDI0bDJDU2t5K1ZFbXhuc2tFTlk1N0UvRkFuQ1U1YS9aTU1mY2xy?=
 =?utf-8?B?aWlRSnMxQzBHWlNZNmtmMWRQMHVHZnV6M3paaEltc08zK2pJOXBOSXdJZFMx?=
 =?utf-8?B?K281S3kycktEKzZpTkJCRUlMRHI5c1dSZ1NVaW1Bdmc1NWxiRW9kRUhyY1lX?=
 =?utf-8?B?QjdQK08vRGF3L0Rqa0g4QkhYQ1RkeGtub0h6SkFhcTZuRGZQYjNvSWxiZ0ox?=
 =?utf-8?B?ZE1qa1FVT2NheUhjZXg3clJ0TVd2cm5SQjFEYklnc3M0Y0hKNmViTnZmdzRz?=
 =?utf-8?B?ZmNNeG1zMnRFTEV5TmNDZVFCYUVzaW9DVFIzRE04amNoUXQ5b1dYRVJxenJS?=
 =?utf-8?B?MzlPczR0YmZoc0FxUlN3UklWTVFhYmJncFdKUWgxeUVRenhZU2lRR29zVEVG?=
 =?utf-8?B?Uy9BczZSOTVqazRpa3BNTWpGOG9JQ0FiYjhYL2xwVWpQQkJmQ3c4R0lmdExU?=
 =?utf-8?B?a2lYRk96YlBVV2tBZ0ttQnF1RnRzL1c1cFlTdWszampYUzY4eUpINGtuN0dn?=
 =?utf-8?B?YWVPNE5rQTBPbFBNVzkrVUFZR05jZlJQMVBjczJXYThkMWxqRTdDSW1jZ0xR?=
 =?utf-8?B?ajBzbmtOUC95aGJEeUc2NW15OWlJSDhhbGswNm9LanpSaTMybG1KZUg4Q2tI?=
 =?utf-8?B?Z1ZEUjBtV09ZaG0zZktvNnRzZGQzSmtWcGROMnlpQW1YTi9Oc0lxelczUTYv?=
 =?utf-8?B?VUo3bzVCVFd5c3V3ZE9Ra2h4dURlMlNxTGt1OHRKZGhwMS9qMWVTUlJvYVNT?=
 =?utf-8?B?cm5KbE5hSjdWOWoxSDZBQnp3R2RwbkFTZXFtWnBjWWo2WkQzb25XcmhCSHpQ?=
 =?utf-8?B?UVVIRGxFT1hrN1FWVHBlYTViWXpraW51ZGZXYmFJb3pFRWV1M0h3T00zd0JO?=
 =?utf-8?B?Z2RVOVBMd2xhRC81N1lRRUlWQnRKMmNBeStSbm5meTZGcUNjVFBLMk1tU1g5?=
 =?utf-8?B?WUU2WXgyTlFLNHlma1doeVFZOHhsRVh3WG1LVmpIZ1kwa2p0a2FXb2oyUVg2?=
 =?utf-8?B?cnJpTjFQSXQwYzFybjFOajVtRzZVcHBiZnRBelRsUEtaS0dTMnYraUNXM0d1?=
 =?utf-8?B?NGJjQXcvQjFQTXpYTXd3UWQwbUNnOVU2eGFsWHZwQW4vUUhFcms2b3B3Zng2?=
 =?utf-8?B?cTRWNUxxN3BkNktDSlVaWUhMTmI2UHA1TXVxWmZLc2NMdXRGalhpTmRjSWpo?=
 =?utf-8?Q?0INYaeBGNgabRLdO0WKMoPxTz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65c12f4-c9f6-4bf6-863f-08db35fc6bff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 17:37:26.5634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vULVXh60COCHKe8J3nhZ1997BZ7kkpO/xlCFbFFjmk4uXm/++W7mNw6mCv4CMQzc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683
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

Hi,

Inlined:

On 2023-04-03 20:22, Matthew Brost wrote:
> Rather than a global modparam for scheduling policy, move the scheduling
> policy to scheduler / entity so user can control each scheduler / entity
> policy.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
>  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
>  drivers/gpu/drm/scheduler/sched_entity.c   | 25 ++++++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 21 +++++++++++++-----
>  drivers/gpu/drm/v3d/v3d_sched.c            | 15 ++++++++-----
>  include/drm/gpu_scheduler.h                | 23 ++++++++++++++------
>  9 files changed, 73 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 00c9c03c8f94..4df0fca5a74c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  				   ring->num_hw_submission, amdgpu_job_hang_limit,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> +				   DRM_SCHED_POLICY_DEFAULT,
>  				   adev->dev);
>  		if (r) {
>  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 8486a2923f1b..61204a3f8b0b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
> -			     dev_name(gpu->dev), gpu->dev);
> +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
> +			     gpu->dev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 54f53bece27c..33042ba6ae93 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
> -			      NULL, name, pipe->ldev->dev);
> +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
> +			      pipe->ldev->dev);
>  }
>  
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 5879fc262047..f408a9097315 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -97,7 +97,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  
>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>  			num_hw_submissions, 0, sched_timeout,
> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> +			NULL, NULL, to_msm_bo(ring->bo)->name,
> +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
>  	if (ret) {
>  		goto fail;
>  	}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index f48b07056a16..effa48b33dce 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -819,7 +819,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> -				     NULL, "pan_js", pfdev->dev);
> +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
> +				     pfdev->dev);
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>  			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..f1299e51860b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -33,6 +33,20 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> +			 unsigned int num_sched_list)
> +{
> +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> +	unsigned int i;
> +
> +	/* All scdedule policies must match */
> +	for (i = 1; i < num_sched_list; ++i)
> +		if (sched_policy != sched_list[i]->sched_policy)
> +			return true;
> +
> +	return false;
> +}
> +
>  /**
>   * drm_sched_entity_init - Init a context entity used by scheduler when
>   * submit to HW ring.
> @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty)
>  {
> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> +	    bad_policies(sched_list, num_sched_list))
>  		return -EINVAL;
>  
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
> @@ -75,8 +90,10 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	entity->last_scheduled = NULL;
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
> -	if(num_sched_list)
> +	if(num_sched_list) {
>  		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +		entity->sched_policy = sched_list[0]->sched_policy;
> +	}
>  
>  	init_completion(&entity->entity_idle);
>  
> @@ -440,7 +457,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO) {

The entity (context) shouldn't have the "sched_policy" property.
That property belong only to the scheduler.

>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -528,7 +545,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
>  			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
>  
>  		drm_sched_wakeup(entity->rq->sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 808008990721..77894976fa55 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,14 +62,14 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>  
>  /**
>   * DOC: sched_policy (int)
>   * Used to override default entities scheduling policy in a run queue.
>   */
>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
>  
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>  							    const struct rb_node *b)
> @@ -173,7 +173,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
>  
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
>  		drm_sched_rq_remove_fifo_locked(entity);
>  
>  	spin_unlock(&rq->lock);
> @@ -931,7 +931,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>  		if (entity)
> @@ -1106,6 +1106,7 @@ static void drm_sched_main(struct work_struct *w)
>   *		used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
> + * @sched_policy: schedule policy
>   * @dev: target &struct device
>   *
>   * Return 0 on success, otherwise error code.
> @@ -1115,9 +1116,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *run_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev)
>  {
>  	int i;
> +
> +	if (sched_policy >= DRM_SCHED_POLICY_MAX)
> +		return -EINVAL;
> +
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> @@ -1127,6 +1134,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
> +		sched->sched_policy = default_drm_sched_policy;
> +	else
> +		sched->sched_policy = sched_policy;
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 38e092ea41e6..5e3fe77fa991 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_bin_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>  	if (ret)
>  		return ret;
>  
> @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_render_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_tfu_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_csd_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> +				     v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  
> @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_cache_clean_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +				     NULL, "v3d_cache_clean",
> +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 98fb5f85eba6..39cb72b7fe5d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -72,11 +72,15 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> -/* Used to chose between FIFO and RR jobs scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR    0
> -#define DRM_SCHED_POLICY_FIFO  1
> +/* Used to chose default scheduling policy*/
> +extern int default_drm_sched_policy;
> +
> +enum drm_sched_policy {
> +	DRM_SCHED_POLICY_DEFAULT,
> +	DRM_SCHED_POLICY_RR,
> +	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_MAX,
> +};

Please don't use MAX. It is very confusing, as maximum and minimum values
are values which can be attained, in literature and common use.
For instance, "the maximum temperature today is 287K, also expect rains"
means that that temperature will actually be attained.

Use, DRM_SCHED_POLICY_COUNT for instance, since for 0-based indexing,
as that of C enums, the last element in the set is in fact the number of
elements, i.e. the count of the set. (_NUM is also bad as it means
"number" which could really be anything.)

So using DRM_SCHED_POLICY_COUNT is most clear.

>  
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
> @@ -217,6 +221,9 @@ struct drm_sched_entity {
>  	 */
>  	bool 				stopped;
>  
> +	/** @sched_policy: Schedule policy for entity */
> +	enum drm_sched_policy		sched_policy;
> +

This creates data redundancy. "sched_policy" should only be found
in the drm_gpu_scheduler structure. The context's tasks then get to run
on a scheduler with such and such priority. We shouldn't have this here,
only in drm_gpu_scheduler structure.

Regards,
Luben

>  	/**
>  	 * @entity_idle:
>  	 *
> @@ -489,6 +496,7 @@ struct drm_sched_backend_ops {
>   *              guilty and it will no longer be considered for scheduling.
>   * @score: score to help loadbalancer pick a idle sched
>   * @_score: score used when the driver doesn't provide one
> + * @sched_policy: Schedule policy for scheduler
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
>   * @pause_run_wq: pause queuing of @work_run on @run_wq
> @@ -514,6 +522,7 @@ struct drm_gpu_scheduler {
>  	int				hang_limit;
>  	atomic_t                        *score;
>  	atomic_t                        _score;
> +	enum drm_sched_policy		sched_policy;
>  	bool				ready;
>  	bool				free_guilty;
>  	bool				pause_run_wq;
> @@ -525,7 +534,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *run_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,

