Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E850ABA7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 00:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629810E1C8;
	Thu, 21 Apr 2022 22:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320110E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 22:48:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id v1so4088067ljv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eX96mCWhBbn19biHjcAeRB51bc+o2ODAUiLkS8PgHY0=;
 b=qsjucDk9aKv8VXWpD8aZCuW8VbD6IC9b3HEwIWNJz/xjjrCZdEcIr2T61P56lnKrL1
 x0fvcOsfnpXVwV6TbEC3P9G4jAiA6PV/pIkrC3llEHD9zDRYONz08f/be0EPy2XfpUFu
 MLGstpnCjWC6oUoNOL/10uLz5wYNY9nZGX+kHjYPbgJB5D83YeaF7AeRa/Kc2yRpFr/v
 TQkBdccxZQENeo9CurheeOq7sOEgEKA0Px1Hd0LyyntfM1LcA1EXmxJTZaD+XFn/ZZUA
 zetZYiGe80/7AuQaVkAMGZryxF4rEep3oEt5fCUjWcKmExh3nP4azlHmbAmjjc8QAE0K
 zhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eX96mCWhBbn19biHjcAeRB51bc+o2ODAUiLkS8PgHY0=;
 b=QbRDTOrINJYSLgXGi8JbtUr9AtCZ8HbaJSPwbnWQCbkT/moWt0FtIf0WuygJSaAbVM
 2n946Iv7wWaVpbiaIMnluDQxDbLfQuDzFZZnKYhnkr9Pe9nok8R1fgcm0GzLwSNYGBf/
 q0SjTRvNeo6Ywfyfw5ekJuY5QBidvGRqx3i4UnAJEAoX8HicY0ZBGxulYZE+HukZ2ohX
 6SDPilxGUBpYyhjsQ4piT0ElKSNSoui5HP+i9NaEVTlHdCo7DVe+142IXPR/bfYqUhSP
 65bTSaru5cA065ctLwmXlAi95PZr7k+h62MTyYx/EwlxElNe+T430PEwmKLFUqL14ZXV
 z9RA==
X-Gm-Message-State: AOAM531tvcHHfL7XMJ6ptSiNGx0Y/K/VdugNgNR5JgV9Iaa9i9IqR/w4
 zuR6cgbIzoozQacYBGcG9SRURw==
X-Google-Smtp-Source: ABdhPJxzt6Y0Y0t3/y+TvzQHwVkjtPOPD1DeUtqz6XtrGDyfd8mXYtfJQXSFwuOaQKtccs8ml7RtBQ==
X-Received: by 2002:a2e:2a41:0:b0:24d:d2d7:3bb3 with SMTP id
 q62-20020a2e2a41000000b0024dd2d73bb3mr1052642ljq.114.1650581324252; 
 Thu, 21 Apr 2022 15:48:44 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a056512131700b004486c863c8esm34292lfu.257.2022.04.21.15.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 15:48:43 -0700 (PDT)
Message-ID: <ccef9bd0-4776-2ffc-64ba-8662316c372c@linaro.org>
Date: Fri, 22 Apr 2022 01:48:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC 4/4] drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650574112-25294-5-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650574112-25294-5-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 23:48, Abhinav Kumar wrote:
> Change the DRM traces to include both the intf_mode
> and wb_idx similar to the DRM prints in the previous change.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 26 ++++++++++++++++++--------
>   2 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 871ce87..42affd3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1345,8 +1345,9 @@ static void dpu_encoder_frame_done_callback(
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
> @@ -1424,9 +1425,11 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
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
>   	TP_STRUCT__entry(
>   		__field(	uint32_t,	drm_id			)
> +		__string(	intf_mode_str,	intf_mode	)
>   		__field(	enum dpu_intf,	intf_idx		)
> +		__field(    enum dpu_wb,  wb_idx        )
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
