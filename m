Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F656352B9A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 16:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF816EE5D;
	Fri,  2 Apr 2021 14:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4906E0DB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 14:50:54 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id w2so1941391ilj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rGJLgTs/l2/MGpdEoc1r+xCFDRI912a08UTCUjCZJcM=;
 b=12/JtV5J74usgV+61jnq39vygaGI0FceLpeazebIQHziSq3srw8jHXAssSvjAzYtGw
 LloGO3KOJjWoZCLOxdPDDtKHNLDX0aQc7PUFx4bal+SbFCATuMcdiLYObnbgnLnZqpS+
 hSTozvOMLnBM0jtYf07da4adYvdxEhXR66PDI3ZWwgjCOQ92eRGcRcCThJWpRIKZzv2J
 dAJ3V+/G/NRiyjsJqaDbeI5mD/414OQI6KbwOn6Uf0+LVFV1RqlqJnmaRrYUs6m1IpY+
 WtX8ptMr6rTYF1M95BzFHGwQ77ZGJAdpnIlr1PsSaTdrI7Hx6Qennkid+HYH6Qh3OJLa
 0Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rGJLgTs/l2/MGpdEoc1r+xCFDRI912a08UTCUjCZJcM=;
 b=SgShp6telYBnk16bNeacZ3SRgXeBtuzC+9WKgp9X+739LPHOyXJDuvHnIftNuJnHGJ
 /8zts6+pdRWLJjPKhfB8R3yAJHqmf/mTLQxRVLTht0ob/ORFWFeFyU6+GHPxCiOEEoOn
 eccTOv0L3pRAav7GiVbYTxZRadF0Qis7hpWvOFAGggHSUr1VL/XwwnyCZo6QVp3EqZ08
 f5fdbk1it/ybM9CPYwA/Oofy00MnM2TzP/w2azYUo4Zr06UNO7H0BaHhv6S5HqwF1yxN
 LWI6MxuHlxaD6kq5IyIXfgljV6yh5RzCK+bnjzMrHqmIcRcHmjf/r1Xx1sCLp6HXd3yX
 9srw==
X-Gm-Message-State: AOAM533jFbw414Tw6LSq2coNpk7nXIWbs4Yje9OrUZocJOv7CJpvtFve
 K6zpPH8vY594/x+w0GO75HMpyQ==
X-Google-Smtp-Source: ABdhPJz0/LdzjBlr7ice5pFWBbXbg5Wcm4vvuQ2a1qOfESBnw1zkjaA5BKoyzuJ3aWS5JpDIkMQ/YQ==
X-Received: by 2002:a05:6e02:1a65:: with SMTP id
 w5mr11357415ilv.5.1617375054056; 
 Fri, 02 Apr 2021 07:50:54 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id q207sm4724742iod.6.2021.04.02.07.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 07:50:53 -0700 (PDT)
Date: Fri, 2 Apr 2021 08:50:51 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm: Add param for userspace to
 query suspend count
Message-ID: <20210402145051.jcs23ssgkqkkmmtq@cosmicpenguin.net>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
References: <20210325012358.1759770-1-robdclark@gmail.com>
 <20210325012358.1759770-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325012358.1759770-3-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Jordan Crouse <jcrouse@codeaurora.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 06:23:53PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Performance counts, and ALWAYS_ON counters used for capturing GPU
> timestamps, lose their state across suspend/resume cycles.  Userspace
> tooling for performance monitoring needs to be aware of this.  For
> example, after a suspend userspace needs to recalibrate it's offset
> between CPU and GPU time.
> 

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  drivers/gpu/drm/msm/msm_drv.c           | 1 +
>  drivers/gpu/drm/msm/msm_gpu.c           | 2 ++
>  drivers/gpu/drm/msm/msm_gpu.h           | 2 ++
>  include/uapi/drm/msm_drm.h              | 1 +
>  5 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index f09175698827..e473b7c9ff7f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -280,6 +280,9 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>  	case MSM_PARAM_FAULTS:
>  		*value = gpu->global_faults;
>  		return 0;
> +	case MSM_PARAM_SUSPENDS:
> +		*value = gpu->suspend_count;
> +		return 0;
>  	default:
>  		DBG("%s: invalid param: %u", gpu->name, param);
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b29e439eb299..4f9fa0189a07 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -39,6 +39,7 @@
>   *           GEM object's debug name
>   * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
>   * - 1.6.0 - Syncobj support
> + * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
>   */
>  #define MSM_VERSION_MAJOR	1
>  #define MSM_VERSION_MINOR	6
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 7bdb01f202f4..ab888d83b887 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -256,6 +256,8 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>  	if (ret)
>  		return ret;
>  
> +	gpu->suspend_count++;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index d7cd02cd2109..18baf935e143 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -152,6 +152,8 @@ struct msm_gpu {
>  		ktime_t time;
>  	} devfreq;
>  
> +	uint32_t suspend_count;
> +
>  	struct msm_gpu_state *crashstate;
>  	/* True if the hardware supports expanded apriv (a650 and newer) */
>  	bool hw_apriv;
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index a6c1f3eb2623..5596d7c37f9e 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -76,6 +76,7 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_NR_RINGS   0x07
>  #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
>  #define MSM_PARAM_FAULTS     0x09
> +#define MSM_PARAM_SUSPENDS   0x0a
>  
>  struct drm_msm_param {
>  	__u32 pipe;           /* in, MSM_PIPE_x */
> -- 
> 2.29.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
