Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C8A552BE5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B581112464;
	Tue, 21 Jun 2022 07:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28E3112380;
 Tue, 21 Jun 2022 07:26:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id cw10so1810944ejb.3;
 Tue, 21 Jun 2022 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J/FXHf63jaZ4CP1Ip+M+iIXOar4uXhS4dHznXju5cys=;
 b=pafHcelc2F0jE3wEBa11Kuw/lhX4WkbQcdTl2zOO9wMpiG3h85diqzoIBdBg/ijB0q
 q61Y3NgPfJW/AcGNO/HctyIPVDDwxvLDjzU/OYcFKG7WsoJETEW6+yyw0fNLlw0uN7iu
 DC8lkAdwtF6aU9FxRRAVdb2Awj+FVSuywsDTKbLheEDz0HZG0p3o2T7iTaxYBxg5ljub
 6V5JEvH/6bwJrwF5wXx5kTR08WALZGpI/E535pGaCQYmmmMkJTRKSaEX63EUqnKW3UWJ
 xb/kgQsRnB0CTVqw3MD8thB+zdERXBfDFzXw171rRqqWbRMdIMM50enewJFEWimWWwYy
 522Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J/FXHf63jaZ4CP1Ip+M+iIXOar4uXhS4dHznXju5cys=;
 b=8RM80y0kc4o8r4e+41qYU8Lg2aRW7v6o0Fg0e17df4DgiaoZKHsNCQwKVQm8A6jf7q
 ZoAF2BNTXnTaUVDgM03/2N3QZm+ExzSNOPE7Jisv2nmb/Uy6qMH3JUWnydSWGBEx9hLV
 6vyCyUfiJridlUPmP7099QipoRU7zmzpHB2cDBzxyaon4Y6V5ZjmQd1VpFQ4b643jeDD
 0qeJK7x5QNfrX7vmbT5JCeDxJ4xO6dmoJdpPPmm62pdV4b2DlJ+EJI0rN4A46Dy1H0hA
 BPtgmEQYYZgv0IF4YsB3rycjAu2iqp8Omqus9WbBbGMYH5bmMR3PbQFLjwxYZDp3FuHV
 aAgw==
X-Gm-Message-State: AJIora8G/EH2L/3MkXb363lk4xcPoeRTMKd41kIFfEYaE0ieOiBLJZQn
 5D239Subh/7/avXx+3A9HeieMD6oM/M=
X-Google-Smtp-Source: AGRyM1t83WODsOfl8GXay999NQG2aZGHeIPBi9h77m/6pLb9Fl3171B2scXfUENiDPkk7CH4KIvvxg==
X-Received: by 2002:a17:906:194b:b0:710:967d:ba18 with SMTP id
 b11-20020a170906194b00b00710967dba18mr23919874eje.705.1655796413176; 
 Tue, 21 Jun 2022 00:26:53 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b006f3ef214daesm7088807ejg.20.2022.06.21.00.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:26:52 -0700 (PDT)
Message-ID: <46e20645-27ee-eb7e-6539-5f6b18192886@gmail.com>
Date: Tue, 21 Jun 2022 09:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] drm/sched: Partial revert of 'drm/sched: Keep
 s_fence->parent pointer'
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-5-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220620220302.86389-5-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
> Problem:
> This patch caused negative refcount as described in [1] because
> for that case parent fence did not signal by the time of drm_sched_stop and hence
> kept in pending list the assumption was they will not signal and
> so fence was put to account for the s_fence->parent refcount but for
> amdgpu which has embedded HW fence (always same parent fence)
> drm_sched_fence_release_scheduled was always called and would
> still drop the count for parent fence once more. For jobs that
> never signaled this imbalance was masked by refcount bug in
> amdgpu_fence_driver_clear_job_fences that would not drop
> refcount on the fences that were removed from fence drive
> fences array (against prevois insertion into the array in
> get in amdgpu_fence_emit).
>
> Fix:
> Revert this patch and by setting s_job->s_fence->parent to NULL
> as before prevent the extra refcount drop in amdgpu when
> drm_sched_fence_release_scheduled is called on job release.
>
> Also - align behaviour in drm_sched_resubmit_jobs_ext with that of
> drm_sched_main when submitting jobs - take a refcount for the
> new parent fence pointer and drop refcount for original kref_init
> for new HW fence creation (or fake new HW fence in amdgpu - see next patch).
>
> [1] - https://lore.kernel.org/all/731b7ff1-3cc9-e314-df2a-7c51b76d4db0@amd.com/t/#r00c728fcc069b1276642c325bfa9d82bf8fa21a3
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Yiqing Yao <yiqing.yao@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index b81fceb0b8a2..b38394f5694f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -419,6 +419,11 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   		if (s_job->s_fence->parent &&
>   		    dma_fence_remove_callback(s_job->s_fence->parent,
>   					      &s_job->cb)) {
> +			/* Revert drm/sched: Keep s_fence->parent pointer, no
> +			 * need anymore for amdgpu and creates only troubles
> +			 */

Please no amdgpu specific comments in common code.

Apart from that looks like a step into the right direction to me.

Regards,
Christian.

> +			dma_fence_put(s_job->s_fence->parent);
> +			s_job->s_fence->parent = NULL;
>   			atomic_dec(&sched->hw_rq_count);
>   		} else {
>   			/*
> @@ -548,7 +553,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>   		if (found_guilty && s_job->s_fence->scheduled.context == guilty_context)
>   			dma_fence_set_error(&s_fence->finished, -ECANCELED);
>   
> -		dma_fence_put(s_job->s_fence->parent);
>   		fence = sched->ops->run_job(s_job);
>   		i++;
>   
> @@ -558,7 +562,11 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>   
>   			s_job->s_fence->parent = NULL;
>   		} else {
> -			s_job->s_fence->parent = fence;
> +
> +			s_job->s_fence->parent = dma_fence_get(fence);
> +
> +			/* Drop for orignal kref_init */
> +			dma_fence_put(fence);
>   		}
>   	}
>   }
> @@ -952,6 +960,9 @@ static int drm_sched_main(void *param)
>   
>   		if (!IS_ERR_OR_NULL(fence)) {
>   			s_fence->parent = dma_fence_get(fence);
> +			/* Drop for original kref_init of the fence */
> +			dma_fence_put(fence);
> +
>   			r = dma_fence_add_callback(fence, &sched_job->cb,
>   						   drm_sched_job_done_cb);
>   			if (r == -ENOENT)
> @@ -959,7 +970,6 @@ static int drm_sched_main(void *param)
>   			else if (r)
>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
> -			dma_fence_put(fence);
>   		} else {
>   			if (IS_ERR(fence))
>   				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));

