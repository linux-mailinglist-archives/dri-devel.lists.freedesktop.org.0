Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0A5114E9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 12:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16D310F161;
	Wed, 27 Apr 2022 10:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA1710F161
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 10:43:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t25so2382673lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d0j66OsdbjktC0pIK4Abp5IiaQ6Az9JyPiTPoioUGo4=;
 b=hLAMJlckLf2EuLG3HjZqOn+kyLaIxO2mqaj7/1VdEglnobcaQURsb9maJNne/ZKHi6
 Nzc+9jpkrWmmYHo5KVcLqhlcSqK/gRKwXoYt9EOP/PEwSJi7gSTNTxCbdP6rh96ZQtZ1
 7zM3oPmMcst+G0AYxvfJ3J8y9HrhccQe2cJrQ9YjOdxnb2jjpxYnURxNH8oKloewVLvS
 Yi14sOSUd47++pHHuyKZzNnZm6WduVMZMkjyJ1ok2ibgVwScPRYj/h8RWwfWSUKIcA/M
 Sm52peJZfyrsMTc9tnk+PI9D5dU21dnCtbt8hz2mmEJ4pN3+bqeOM1Gw2S1M3SBIhTS8
 C2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d0j66OsdbjktC0pIK4Abp5IiaQ6Az9JyPiTPoioUGo4=;
 b=Gjm5KwfJ49B1Viv7vVwaSkL+PuIJQeBOIhzv9kwyPKheh2J5eRYUHRVZJfj7kMcJTN
 ykh7tMfuTSeJAJ4pYiyODC4bxMAdmmXY13zjg7+GF9FUqIe34VpVVCDZ0uGiyFE2lMvx
 mlAT2dHj7xN5D5+oRq7ZEgeUIp/It+vdv56cW1bXnyoA8MxzDOm2ZeGBmvmhQ4bfEJ3r
 htk9husK17jKzekPM4/BPPSbHcQg5lKuRiF9p/W0Ah35uL230RyTK4DoU1JatLfR32ry
 2LHSlRzVJGKwqezfZTZDsZUGZYkCeGgpGQ6hz1XBAV6j7E/fbjmsZtwpPkoJk/x+dJdh
 V1Lg==
X-Gm-Message-State: AOAM530TCfZ7mwQpn1cgpkkffYC0mHaWuBJwKuWxkp4JSa11ZuQbKUzY
 Nbxt7nUSlmOlMcIi5lLAtNKEJQ==
X-Google-Smtp-Source: ABdhPJzvBrbT2SOToIfl1e3NwDilgheeKxsjX9VHmgRODO1bx6aCWqIuEsoYwo574PUXPiItp8vqww==
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id
 v30-20020ac25b1e000000b004722c9f5891mr1652357lfn.534.1651056222325; 
 Wed, 27 Apr 2022 03:43:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a2e9e97000000b0024921bcf06bsm1777371ljk.57.2022.04.27.03.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 03:43:41 -0700 (PDT)
Message-ID: <2a12a6c7-aff2-b364-a653-80630e4710e5@linaro.org>
Date: Wed, 27 Apr 2022 13:43:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 19/19] drm/msm/dpu: add wb_idx to DRM traces in
 dpu_encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650984096-9964-20-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650984096-9964-20-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2022 17:41, Abhinav Kumar wrote:
> Change the DRM traces to include both the intf_mode
> and wb_idx similar to the DRM prints in the previous change.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This commit got traces broken. I'm going to apply a fix.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 26 ++++++++++++++++++--------
>   2 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 35080c4..52516eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1354,8 +1354,9 @@ static void dpu_encoder_frame_done_callback(
>   			 * suppress frame_done without waiter,
>   			 * likely autorefresh
>   			 */
> -			trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc),
> -					event, ready_phys->intf_idx);
> +			trace_dpu_enc_frame_done_cb_not_busy(DRMID(drm_enc), event,
> +					dpu_encoder_helper_get_intf_type(ready_phys->intf_mode),
> +					ready_phys->intf_idx, ready_phys->wb_idx);
>   			return;
>   		}
>   
> @@ -1433,9 +1434,11 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>   	if (ctl->ops.get_pending_flush)
>   		ret = ctl->ops.get_pending_flush(ctl);
>   
> -	trace_dpu_enc_trigger_flush(DRMID(drm_enc), phys->intf_idx,
> -				    pending_kickoff_cnt, ctl->idx,
> -				    extra_flush_bits, ret);
> +	trace_dpu_enc_trigger_flush(DRMID(drm_enc),
> +			dpu_encoder_helper_get_intf_type(phys->intf_mode),
> +			phys->intf_idx, phys->wb_idx,
> +			pending_kickoff_cnt, ctl->idx,
> +			extra_flush_bits, ret);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 58b411f..1106d44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -380,20 +380,26 @@ TRACE_EVENT(dpu_enc_rc,
>   );
>   
>   TRACE_EVENT(dpu_enc_frame_done_cb_not_busy,
> -	TP_PROTO(uint32_t drm_id, u32 event, enum dpu_intf intf_idx),
> -	TP_ARGS(drm_id, event, intf_idx),
> +	TP_PROTO(uint32_t drm_id, u32 event, char *intf_mode, enum dpu_intf intf_idx,
> +			enum dpu_wb wb_idx),
> +	TP_ARGS(drm_id, event, intf_mode, intf_idx, wb_idx),
>   	TP_STRUCT__entry(
>   		__field(	uint32_t,	drm_id		)
>   		__field(	u32,		event		)
> +		__string(	intf_mode_str,		intf_mode	)
>   		__field(	enum dpu_intf,	intf_idx	)
> +		__field(    enum dpu_wb,  wb_idx    )

Nit: indentation broken. Please use tabs.

>   	),
>   	TP_fast_assign(
>   		__entry->drm_id = drm_id;
>   		__entry->event = event;
> +		__assign_str(intf_mode_str, intf_mode);
>   		__entry->intf_idx = intf_idx;
> +		__entry->wb_idx = wb_idx;
>   	),
> -	TP_printk("id=%u, event=%u, intf=%d", __entry->drm_id, __entry->event,
> -		  __entry->intf_idx)
> +	TP_printk("id=%u, event=%u, intf_mode=%s intf=%d wb=%d", __entry->drm_id,
> +			__entry->event, __get_str(intf_mode_str),
> +			__entry->intf_idx, __entry->wb_idx)
>   );
>   
>   TRACE_EVENT(dpu_enc_frame_done_cb,
> @@ -415,14 +421,16 @@ TRACE_EVENT(dpu_enc_frame_done_cb,
>   );
>   
>   TRACE_EVENT(dpu_enc_trigger_flush,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
> +	TP_PROTO(uint32_t drm_id, char *intf_mode, enum dpu_intf intf_idx, enum dpu_wb wb_idx,
>   		 int pending_kickoff_cnt, int ctl_idx, u32 extra_flush_bits,
>   		 u32 pending_flush_ret),
> -	TP_ARGS(drm_id, intf_idx, pending_kickoff_cnt, ctl_idx,
> +	TP_ARGS(drm_id, intf_mode, intf_idx, pending_kickoff_cnt, ctl_idx,
>   		extra_flush_bits, pending_flush_ret),

wb_idx is missing from the TP_ARGS, so compilation fails.

>   	TP_STRUCT__entry(
>   		__field(	uint32_t,	drm_id			)
> +		__string(	intf_mode_str,	intf_mode	)
>   		__field(	enum dpu_intf,	intf_idx		)
> +		__field(    enum dpu_wb,  wb_idx        )

Nit: indentation broken. Please use tabs.

>   		__field(	int,		pending_kickoff_cnt	)
>   		__field(	int,		ctl_idx			)
>   		__field(	u32,		extra_flush_bits	)
> @@ -430,15 +438,17 @@ TRACE_EVENT(dpu_enc_trigger_flush,
>   	),
>   	TP_fast_assign(
>   		__entry->drm_id = drm_id;
> +		__assign_str(intf_mode_str, intf_mode);
>   		__entry->intf_idx = intf_idx;
> +		__entry->wb_idx = wb_idx;
>   		__entry->pending_kickoff_cnt = pending_kickoff_cnt;
>   		__entry->ctl_idx = ctl_idx;
>   		__entry->extra_flush_bits = extra_flush_bits;
>   		__entry->pending_flush_ret = pending_flush_ret;
>   	),
> -	TP_printk("id=%u, intf_idx=%d, pending_kickoff_cnt=%d ctl_idx=%d "
> +	TP_printk("id=%u, intf_mode=%s, intf_idx=%d, wb_idx=%d, pending_kickoff_cnt=%d ctl_idx=%d "
>   		  "extra_flush_bits=0x%x pending_flush_ret=0x%x",
> -		  __entry->drm_id, __entry->intf_idx,
> +		  __entry->drm_id, __get_str(intf_mode_str), __entry->intf_idx, __entry->wb_idx,
>   		  __entry->pending_kickoff_cnt, __entry->ctl_idx,
>   		  __entry->extra_flush_bits, __entry->pending_flush_ret)
>   );


-- 
With best wishes
Dmitry
