Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6E76BE8B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B06110E1DC;
	Tue,  1 Aug 2023 20:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E810E1DC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 20:38:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fdd14c1fbfso10052857e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 13:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690922279; x=1691527079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xwEpx+XEok6kgEnwudSYZZK15dvcK2lWA6rubTxhca4=;
 b=q/2DI4P0BhKreBK6U6oxRwWYuYev/0jUdoG0xlYMskCCDUMUKzRdJFdT38Ye/7fmrP
 Z/RSqwpJd/UT1h6z0TIB/F9YfhSLtG2aaPdFTrQqVe0zs/BrBNXtbtPGkCYBTMZhOXLn
 TfB02HuP75NPNINkrhyXsEwh17rs5NywEvzd/G+jPfgOO+GC7zGm1+gFQ4yyf9ovQNIy
 F+bNczN8j2yVrTI/6QUngPCW2lwHKAhumvSkh00G+RTvG8MgngOL5npFwpB3NR/PDlHb
 1Lt/KlfSLivBzh5DmE5P3DW4Aa2NA4YjIIEITNlyEm7fRZem1lzG3zZJb6bT19Q5U4WX
 l/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690922279; x=1691527079;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xwEpx+XEok6kgEnwudSYZZK15dvcK2lWA6rubTxhca4=;
 b=aQnHm+IKvz0FVCkYOC+++Ny6PET+DquBPk1Q5vFWMiBpBsEcBrskVhWNSP1tLPZpBN
 7+/PDTPibGqNiqqGLH0UAAX7CxaSutun+PRgDgwl0/NSdkPhPzA4+zSZ+xoe5ztYCYb6
 CF0AT3D2YZxJGq/zdkZU0eXesnwymUoN2kSdVf9rUXMsy2U1W5cxOWBaRROuA979cdrK
 47BachXtY632jR/wF00FgOGIZHqrt2bnF2IBTHUYNVCEx/NlBcrcjlIGvO1I1bcKUOvp
 JwmcieDBiZ9jWI20JsNPl8q7cnDgs90nQW7Bog5uHr631eGu/1WIIv2++IZk0/MmYqu+
 GOwA==
X-Gm-Message-State: ABy/qLbG0IXwx5wCSCs0NYLpa0eplK93Hfz2bH8D8yPMHF2qCFLPvLF7
 jxmWRNvnHSEhIlgxVwl0skXsKw==
X-Google-Smtp-Source: APBJJlF8dc4Y3xBPQFB8ccKzx/sev0/Gv7MpCQHYTj+5N6G3dbFMlHBCr46VwTV9w82go/6D6U+X9Q==
X-Received: by 2002:a05:6512:3e2a:b0:4fb:be3c:d8b7 with SMTP id
 i42-20020a0565123e2a00b004fbbe3cd8b7mr3861745lfv.51.1690922278900; 
 Tue, 01 Aug 2023 13:37:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004fe33e05eebsm1203709lfc.203.2023.08.01.13.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 13:37:58 -0700 (PDT)
Message-ID: <1a51020c-162d-1207-0fb3-43844f315699@linaro.org>
Date: Tue, 1 Aug 2023 23:37:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dpu: Drop encoder vsync_event
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230801-encoder-cleanup-v1-1-f9e37fe27997@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2023 23:18, Jessica Zhang wrote:
> Drop vsync_event and vsync_event_work handlers as they are unnecessary.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 65 +----------------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
>   2 files changed, 1 insertion(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f0a2a1dca741..d34e684a4178 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -152,7 +152,6 @@ enum dpu_enc_rc_states {
>    * @crtc_frame_event_cb_data:	callback handler private data
>    * @frame_done_timeout_ms:	frame done timeout in ms
>    * @frame_done_timer:		watchdog timer for frame done event
> - * @vsync_event_timer:		vsync timer
>    * @disp_info:			local copy of msm_display_info struct
>    * @idle_pc_supported:		indicate if idle power collaps is supported
>    * @rc_lock:			resource control mutex lock to protect
> @@ -160,7 +159,6 @@ enum dpu_enc_rc_states {
>    * @rc_state:			resource controller state
>    * @delayed_off_work:		delayed worker to schedule disabling of
>    *				clks and resources after IDLE_TIMEOUT time.
> - * @vsync_event_work:		worker to handle vsync event for autorefresh
>    * @topology:                   topology of the display
>    * @idle_timeout:		idle timeout duration in milliseconds
>    * @wide_bus_en:		wide bus is enabled on this interface
> @@ -194,7 +192,6 @@ struct dpu_encoder_virt {
>   
>   	atomic_t frame_done_timeout_ms;
>   	struct timer_list frame_done_timer;
> -	struct timer_list vsync_event_timer;
>   
>   	struct msm_display_info disp_info;
>   
> @@ -202,7 +199,6 @@ struct dpu_encoder_virt {
>   	struct mutex rc_lock;
>   	enum dpu_enc_rc_states rc_state;
>   	struct delayed_work delayed_off_work;
> -	struct kthread_work vsync_event_work;
>   	struct msm_display_topology topology;
>   
>   	u32 idle_timeout;
> @@ -1770,49 +1766,6 @@ int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time)
>   	return 0;
>   }
>   
> -static void dpu_encoder_vsync_event_handler(struct timer_list *t)
> -{
> -	struct dpu_encoder_virt *dpu_enc = from_timer(dpu_enc, t,
> -			vsync_event_timer);
> -	struct drm_encoder *drm_enc = &dpu_enc->base;
> -	struct msm_drm_private *priv;
> -	struct msm_drm_thread *event_thread;
> -
> -	if (!drm_enc->dev || !drm_enc->crtc) {
> -		DPU_ERROR("invalid parameters\n");
> -		return;
> -	}
> -
> -	priv = drm_enc->dev->dev_private;
> -
> -	if (drm_enc->crtc->index >= ARRAY_SIZE(priv->event_thread)) {
> -		DPU_ERROR("invalid crtc index\n");
> -		return;
> -	}
> -	event_thread = &priv->event_thread[drm_enc->crtc->index];
> -	if (!event_thread) {
> -		DPU_ERROR("event_thread not found for crtc:%d\n",
> -				drm_enc->crtc->index);
> -		return;
> -	}
> -
> -	del_timer(&dpu_enc->vsync_event_timer);
> -}
> -
> -static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
> -{
> -	struct dpu_encoder_virt *dpu_enc = container_of(work,
> -			struct dpu_encoder_virt, vsync_event_work);
> -	ktime_t wakeup_time;
> -
> -	if (dpu_encoder_vsync_time(&dpu_enc->base, &wakeup_time))
> -		return;
> -
> -	trace_dpu_enc_vsync_event_work(DRMID(&dpu_enc->base), wakeup_time);
> -	mod_timer(&dpu_enc->vsync_event_timer,
> -			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
> -}
> -
>   static u32
>   dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
>   				  u32 enc_ip_width)
> @@ -1972,7 +1925,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
>   	struct dpu_encoder_phys *phys;
> -	ktime_t wakeup_time;
>   	unsigned long timeout_ms;
>   	unsigned int i;
>   
> @@ -1998,14 +1950,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>   			phys->ops.handle_post_kickoff(phys);
>   	}
>   
> -	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
> -			!dpu_encoder_vsync_time(drm_enc, &wakeup_time)) {
> -		trace_dpu_enc_early_kickoff(DRMID(drm_enc),
> -					    ktime_to_ms(wakeup_time));
> -		mod_timer(&dpu_enc->vsync_event_timer,
> -				nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
> -	}
> -
>   	DPU_ATRACE_END("encoder_kickoff");
>   }
>   
> @@ -2439,11 +2383,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   	timer_setup(&dpu_enc->frame_done_timer,
>   			dpu_encoder_frame_done_timeout, 0);
>   
> -	if (disp_info->intf_type == INTF_DSI)
> -		timer_setup(&dpu_enc->vsync_event_timer,
> -				dpu_encoder_vsync_event_handler,
> -				0);
> -	else if (disp_info->intf_type == INTF_DP)
> +	if (disp_info->intf_type == INTF_DP)
>   		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
>   				priv->dp[disp_info->h_tile_instance[0]]);
>   
> @@ -2451,9 +2391,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   			dpu_encoder_off_work);
>   	dpu_enc->idle_timeout = IDLE_TIMEOUT;
>   
> -	kthread_init_work(&dpu_enc->vsync_event_work,
> -			dpu_encoder_vsync_event_work_handler);
> -
>   	memcpy(&dpu_enc->disp_info, disp_info, sizeof(*disp_info));
>   
>   	DPU_DEBUG_ENC(dpu_enc, "created\n");
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 1a92d21094f4..7352903eab04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -467,10 +467,6 @@ DECLARE_EVENT_CLASS(dpu_enc_ktime_template,
>   	TP_printk("id=%u, time=%lld", __entry->drm_id,
>   		  ktime_to_ms(__entry->time))
>   );
> -DEFINE_EVENT(dpu_enc_ktime_template, dpu_enc_vsync_event_work,
> -	TP_PROTO(uint32_t drm_id, ktime_t time),
> -	TP_ARGS(drm_id, time)
> -);
>   DEFINE_EVENT(dpu_enc_ktime_template, dpu_enc_early_kickoff,
>   	TP_PROTO(uint32_t drm_id, ktime_t time),
>   	TP_ARGS(drm_id, time)

This trace event and corresponding event class can also be removed. 
Other than that LGTM.

> 
> ---
> base-commit: eab616ad7f56cafc8af85e9774816f0901e1efa2
> change-id: 20230721-encoder-cleanup-49887b263c6c
> 
> Best regards,

-- 
With best wishes
Dmitry

