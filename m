Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A4484D037
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 18:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1795410E16C;
	Wed,  7 Feb 2024 17:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VcSRj3k7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C6310E59E;
 Wed,  7 Feb 2024 17:52:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 417ElPFZ006570; Wed, 7 Feb 2024 17:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=TZmShF+zuWyy0fDayloINV9p8eO6XunAmw4rhxYoHvQ=; b=Vc
 SRj3k7v6AucfRTjxe2J7X9+yVtH6qFR0l8+HM3Jh9WKRj1Trz7iOhJx8reWtOeJ1
 CHR73FqQV8NuK7acL8dXi1PmX9+R5oldMlqiSJoCQJArH68SDhxdex1azZbPQKDy
 Dr9EXvAdpXThoT5lXGxzU25Qk8mfpVDFCSCZElXwSWy+qaJLz2KaODs6YkqqIyVB
 dVZ9Enc+nuynMRbEkCy3mG99Q+kZpi2D+Zp0y3rOM4/r5AV3mKuaFLsFd6yjnQRQ
 TxoRwWVAEDHRoiTs15Julbm3wRW6ruw1ZdfuFnVQJ6kYrIMC3R240W3O7TwgkQuN
 CgxDGp74mF5Fbk8bZv0Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w46r8141a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:52:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 417Hqhj8016039
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Feb 2024 17:52:43 GMT
Received: from [10.110.9.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 09:52:43 -0800
Message-ID: <f2e146a3-0825-3e92-a694-b2b947b92b66@quicinc.com>
Date: Wed, 7 Feb 2024 09:52:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/msm/dpu: remove CRTC frame event callback
 registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20231005220659.2404199-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231005220659.2404199-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3Qi8gpbeS4JldGeIkwuMnZeQroBVA69L
X-Proofpoint-ORIG-GUID: 3Qi8gpbeS4JldGeIkwuMnZeQroBVA69L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070132
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/5/2023 3:06 PM, Dmitry Baryshkov wrote:
> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> to NULL) and the data is always either the CRTC itself or NULL
> (correpondingly). Thus drop the event callback registration, call the
> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> assigned using dpu_encoder_assign_crtc().
> 

The idea behind the registration was for CRTC to register for events if 
it wants to and perhaps have different callbacks for different events 
through a common registration mechanism and encoder need not know each 
dpu_crtc calls as most of the time we dont want encoder to go back to 
crtc to look up what its APIs are.

But, we are always registering today and have only one callback, so it 
kind of makes it an additional redundant wrapper. So I guess, once again 
one of those things which , seems not necessary with the current code 
but nothing really wrong with it.

Anyway, couple of comments below.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> This patch was previously posted as a part of the [1]
> 
> Changes since v1:
> - Rebased on top of linux-next
> 
> [1] https://patchwork.freedesktop.org/series/112353/
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
>   5 files changed, 21 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 8ce7586e2ddf..dec5417b69d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -669,18 +669,8 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
>   	DPU_ATRACE_END("crtc_frame_event");
>   }
>   
> -/*
> - * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
> - * registers this API to encoder for all frame event callbacks like
> - * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> - * from different context - IRQ, user thread, commit_thread, etc. Each event
> - * should be carefully reviewed and should be processed in proper task context
> - * to avoid schedulin delay or properly manage the irq context's bottom half
> - * processing.
> - */
> -static void dpu_crtc_frame_event_cb(void *data, u32 event)
> +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
>   {
> -	struct drm_crtc *crtc = (struct drm_crtc *)data;
>   	struct dpu_crtc *dpu_crtc;
>   	struct msm_drm_private *priv;
>   	struct dpu_crtc_frame_event *fevent;
> @@ -1102,9 +1092,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   
>   	dpu_core_perf_crtc_update(crtc, 0);
>   
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> -
>   	memset(cstate->mixers, 0, sizeof(cstate->mixers));
>   	cstate->num_mixers = 0;
>   
> @@ -1143,8 +1130,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>   		 */
>   		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
>   			request_bandwidth = true;
> -		dpu_encoder_register_frame_event_callback(encoder,
> -				dpu_crtc_frame_event_cb, (void *)crtc);
>   	}
>   
>   	if (request_bandwidth)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 539b68b1626a..3aa536d95721 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -300,4 +300,18 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>   	return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
>   }
>   
> +/**
> + * dpu_crtc_frame_event_cb - crtc frame event callback API
> + * @crtc: Pointer to crtc
> + * @event: Event to process
> + *
> + * CRTC module registers this API to encoder for all frame event callbacks like
> + * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> + * from different context - IRQ, user thread, commit_thread, etc. Each event
> + * should be carefully reviewed and should be processed in proper task context
> + * to avoid schedulin delay or properly manage the irq context's bottom half
> + * processing.
> + */

This doc is no longer correct.

CRTC module no longer registers anything.

> +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> +
>   #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d34e684a4178..709fffa4dfa7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -148,8 +148,6 @@ enum dpu_enc_rc_states {
>    * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
>    *				busy processing current command.
>    *				Bit0 = phys_encs[0] etc.
> - * @crtc_frame_event_cb:	callback handler for frame event
> - * @crtc_frame_event_cb_data:	callback handler private data
>    * @frame_done_timeout_ms:	frame done timeout in ms
>    * @frame_done_timer:		watchdog timer for frame done event
>    * @disp_info:			local copy of msm_display_info struct
> @@ -187,8 +185,6 @@ struct dpu_encoder_virt {
>   	struct dentry *debugfs_root;
>   	struct mutex enc_lock;
>   	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> -	void (*crtc_frame_event_cb)(void *, u32 event);
> -	void *crtc_frame_event_cb_data;
>   
>   	atomic_t frame_done_timeout_ms;
>   	struct timer_list frame_done_timer;
> @@ -1377,28 +1373,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
>   	}
>   }
>   
> -void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
> -		void (*frame_event_cb)(void *, u32 event),
> -		void *frame_event_cb_data)
> -{
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	unsigned long lock_flags;
> -	bool enable;
> -
> -	enable = frame_event_cb ? true : false;
> -
> -	if (!drm_enc) {
> -		DPU_ERROR("invalid encoder\n");
> -		return;
> -	}
> -	trace_dpu_enc_frame_event_cb(DRMID(drm_enc), enable);
> -
> -	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> -	dpu_enc->crtc_frame_event_cb = frame_event_cb;
> -	dpu_enc->crtc_frame_event_cb_data = frame_event_cb_data;
> -	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> -}
> -
>   void dpu_encoder_frame_done_callback(
>   		struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *ready_phys, u32 event)
> @@ -1438,15 +1412,12 @@ void dpu_encoder_frame_done_callback(
>   			dpu_encoder_resource_control(drm_enc,
>   					DPU_ENC_RC_EVENT_FRAME_DONE);
>   
> -			if (dpu_enc->crtc_frame_event_cb)
> -				dpu_enc->crtc_frame_event_cb(
> -					dpu_enc->crtc_frame_event_cb_data,
> -					event);
> +			if (dpu_enc->crtc)
> +				dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
>   		}
>   	} else {
> -		if (dpu_enc->crtc_frame_event_cb)
> -			dpu_enc->crtc_frame_event_cb(
> -				dpu_enc->crtc_frame_event_cb_data, event);
> +		if (dpu_enc->crtc)
> +			dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
>   	}
>   }
>   
> @@ -2318,7 +2289,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   		return;
>   	}
>   
> -	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
> +	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {

Why do we need !dpu_enc->crtc check for just printing this error log and 
returning?

>   		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
>   			      DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
>   		return;
> @@ -2331,7 +2302,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   	event = DPU_ENCODER_FRAME_EVENT_ERROR;
>   	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> -	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> +	dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
>   }
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 4c05fd5e9ed1..dfa8edeca925 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -55,16 +55,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
>   void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
>   					struct drm_crtc *crtc, bool enable);
>   
> -/**
> - * dpu_encoder_register_frame_event_callback - provide callback to encoder that
> - *	will be called after the request is complete, or other events.
> - * @encoder:	encoder pointer
> - * @cb:		callback pointer, provide NULL to deregister
> - * @data:	user data provided to callback
> - */
> -void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
> -		void (*cb)(void *, u32), void *data);
> -
>   /**
>    * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
>    *	path (i.e. ctl flush and start) at next appropriate time.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index c74b9be25e68..dc097e109fd2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -346,10 +346,6 @@ DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
>   	TP_PROTO(uint32_t drm_id, bool enable),
>   	TP_ARGS(drm_id, enable)
>   );
> -DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_frame_event_cb,
> -	TP_PROTO(uint32_t drm_id, bool enable),
> -	TP_ARGS(drm_id, enable)
> -);
>   DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_phys_cmd_connect_te,
>   	TP_PROTO(uint32_t drm_id, bool enable),
>   	TP_ARGS(drm_id, enable)
