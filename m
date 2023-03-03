Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEAD6A94C1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 11:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C0710E124;
	Fri,  3 Mar 2023 10:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E8410E124
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 10:04:08 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id k14so2864723lfj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 02:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PE43XKo/WgEddymgmmBxjWwiJFJAm6sS/o3gvfnyfCQ=;
 b=CzE8aAydE9S5MQ8bS6Gj/M12uzdszbeQy+9bwn6MceFKBRVsenTlEc/U+BS/B3ynA2
 CFugrtLE8MeQARiEqDIFwTMLzBNDNU1TEo5zxnPwS/anGKZjn5i8lWMLOGjk7dHnw+GL
 YuWy03M6DYeuCy1Us49BTSIuNy6btp42UexlC/TgB9lZdqttergzeB24nC9AVkoWY6qj
 Q/6pk/w42T8g1BCLNDAx7xZejwSeieYjJu8liwlAEvTZXV7M8R3e7LFG3RFWTiv2bbHi
 71GT4X4gzcDaat505BPRkC3aBfA81rdCJhj+NW435fI6mWg0dltZU91d3pFCbQUdoaWK
 3WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PE43XKo/WgEddymgmmBxjWwiJFJAm6sS/o3gvfnyfCQ=;
 b=IOanFXTWcbZTmwEqJiKwhK3WJVs0MNrT0E/Lr/8kZnAFN4uHYOMb/Q3TKLeGHUp8Z7
 7M2vSc1LKyi0LQr78ke/w63wSfdG9IpAUnWhIzJmn6wEIskdkBldAlSdHQQ9ef7CtU/0
 ZCo12qGOD5TYLRK6Je8KhjYxCMEg2IAmUdgDE6BS+LVYk4n1i0dwLEfN9oYYcjrJDacl
 yq1v5sTkUEcJSbEACWzzZEaJwg3r3lvhMt61BtbK6+1IqoOZJhRRaDoiTNGI1uAsG1IX
 my0zk45Zq48IxNNeqeOigRmWXE/DfCofrfK4ufFVzQgZ0eSyeHBdqMXUcCocs7kSYfNK
 5o2A==
X-Gm-Message-State: AO0yUKVVCbpSUwdDf1iYG9nhf+Ylmb8h9tzvfsDjwGHFZqRs4ZkwAcHD
 dQpswJVy441xIAdn06eTonNH4w==
X-Google-Smtp-Source: AK7set8r6HNCYZMbYo9olpHaL1iwTTESqqbYHQDRtADO+VFgb+QtAiSYRRDoaH98GZ//SobIaaX9VA==
X-Received: by 2002:a19:7419:0:b0:4c0:2ddc:4559 with SMTP id
 v25-20020a197419000000b004c02ddc4559mr419717lfe.69.1677837846268; 
 Fri, 03 Mar 2023 02:04:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a056512024e00b004d127a5a73dsm320689lfo.181.2023.03.03.02.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:04:05 -0800 (PST)
Message-ID: <0351cdef-61ed-117c-71d5-477f2e8a191d@linaro.org>
Date: Fri, 3 Mar 2023 12:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 14/15] drm/msm/atomic: Switch to vblank_start helper
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-15-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230302235356.3148279-15-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Liu Shixin <liushixin2@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2023 01:53, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Drop our custom thing and switch to drm_crtc_next_vblank_start() for
> calculating the time of the start of the next vblank period.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

It took me a while to dig into the differences between old and proposed 
paths. Looks correct to me.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ---------------
>   drivers/gpu/drm/msm/msm_atomic.c        |  8 +++++---
>   drivers/gpu/drm/msm/msm_kms.h           |  8 --------
>   3 files changed, 5 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a683bd9b5a04..43996aecaf8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -411,20 +411,6 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   
> -static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
> -{
> -	struct drm_encoder *encoder;
> -
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
> -		ktime_t vsync_time;
> -
> -		if (dpu_encoder_vsync_time(encoder, &vsync_time) == 0)
> -			return vsync_time;
> -	}
> -
> -	return ktime_get();
> -}
> -
>   static void dpu_kms_prepare_commit(struct msm_kms *kms,
>   		struct drm_atomic_state *state)
>   {
> @@ -953,7 +939,6 @@ static const struct msm_kms_funcs kms_funcs = {
>   	.irq             = dpu_core_irq,
>   	.enable_commit   = dpu_kms_enable_commit,
>   	.disable_commit  = dpu_kms_disable_commit,
> -	.vsync_time      = dpu_kms_vsync_time,
>   	.prepare_commit  = dpu_kms_prepare_commit,
>   	.flush_commit    = dpu_kms_flush_commit,
>   	.wait_flush      = dpu_kms_wait_flush,
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 1686fbb611fd..c5e71c05f038 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -186,8 +186,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   	struct msm_kms *kms = priv->kms;
>   	struct drm_crtc *async_crtc = NULL;
>   	unsigned crtc_mask = get_crtc_mask(state);
> -	bool async = kms->funcs->vsync_time &&
> -			can_do_async(state, &async_crtc);
> +	bool async = can_do_async(state, &async_crtc);
>   
>   	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>   
> @@ -231,7 +230,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   
>   			kms->pending_crtc_mask |= crtc_mask;
>   
> -			vsync_time = kms->funcs->vsync_time(kms, async_crtc);
> +			if (drm_crtc_next_vblank_start(async_crtc, &vsync_time))
> +				goto fallback;
> +
>   			wakeup_time = ktime_sub(vsync_time, ms_to_ktime(1));
>   
>   			msm_hrtimer_queue_work(&timer->work, wakeup_time,
> @@ -253,6 +254,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   		return;
>   	}
>   
> +fallback:
>   	/*
>   	 * If there is any async flush pending on updated crtcs, fold
>   	 * them into the current flush.
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index f8ed7588928c..086a3f1ff956 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -59,14 +59,6 @@ struct msm_kms_funcs {
>   	void (*enable_commit)(struct msm_kms *kms);
>   	void (*disable_commit)(struct msm_kms *kms);
>   
> -	/**
> -	 * If the kms backend supports async commit, it should implement
> -	 * this method to return the time of the next vsync.  This is
> -	 * used to determine a time slightly before vsync, for the async
> -	 * commit timer to run and complete an async commit.
> -	 */
> -	ktime_t (*vsync_time)(struct msm_kms *kms, struct drm_crtc *crtc);
> -
>   	/**
>   	 * Prepare for atomic commit.  This is called after any previous
>   	 * (async or otherwise) commit has completed.

-- 
With best wishes
Dmitry

