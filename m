Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B466A7CB
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 01:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0F010E226;
	Sat, 14 Jan 2023 00:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CD010E222;
 Sat, 14 Jan 2023 00:49:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30E0hPwJ020335; Sat, 14 Jan 2023 00:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PBJeVAHdx/4IrBIJaVgbaGREzoVPBZOupX/pXhOYDyM=;
 b=gbx64/jIKAQqm+srIQgmK13tpBjnkeykcIuf9aMk3HRVVM8QN0uLzX2OZyT9uuKQFCGk
 UO22WSk3rd+316NJBwO9cDQvgdTZDqmyPlWVd8dYN6YcoEVxhb8Kz9tXsGg8hc/DqU9+
 XHlTSIQFw2sFg0SrJ24uXB3XhuzZxWqp/woaAR8gdneJQilkfV9WK1K5D1xDNaPgtmVJ
 A4nI2f3WuHxcrKOrLDtG4vv6AYF0t3dCnIPm+ZKaDDIMYlgAQ/OeAajTs75BGIqm9VoI
 p812JG/bjsFmNmlkY5FjjqNpFse/xT0K+oZU/DPCzJlZdLT7oKyYOZkvahXe0vEBC/vc KQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n3j3ng07a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Jan 2023 00:49:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30E0ncVh019740
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Jan 2023 00:49:38 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 16:49:37 -0800
Message-ID: <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
Date: Fri, 13 Jan 2023 16:49:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/msm/dpu: remove CRTC frame event callback
 registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
 <20230102154748.951328-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230102154748.951328-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zYR8qcpUrA7KuNFrqfkIkYud7YyPi4z-
X-Proofpoint-ORIG-GUID: zYR8qcpUrA7KuNFrqfkIkYud7YyPi4z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_12,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301140003
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/2/2023 7:47 AM, Dmitry Baryshkov wrote:
> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> to NULL) and the data is always either the CRTC itself or NULL
> (correpondingly). Thus drop the event callback registration, call the
> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> assigned using dpu_encoder_assign_crtc().

I suggest you wait till we sort out the PSR series for this, especially 
this patch https://patchwork.freedesktop.org/patch/515787/

There is going to be some change in this code when PSR is pushed again 
sometime early next week because PSR will touch the crtc assignment code 
(dpu_enc->crtc),

Based on how we all like that patch, we can get back to this one as this 
one is a minor cleanup.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
>   5 files changed, 21 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..64cd2ec8a0c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -640,18 +640,8 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
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
> @@ -1051,9 +1041,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   
>   	dpu_core_perf_crtc_update(crtc, 0, true);
>   
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> -
>   	memset(cstate->mixers, 0, sizeof(cstate->mixers));
>   	cstate->num_mixers = 0;
>   
> @@ -1089,8 +1076,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
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
> +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> +
>   #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 84f8c8a1b049..bf0af5af4306 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -147,8 +147,6 @@ enum dpu_enc_rc_states {
>    * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
>    *				busy processing current command.
>    *				Bit0 = phys_encs[0] etc.
> - * @crtc_frame_event_cb:	callback handler for frame event
> - * @crtc_frame_event_cb_data:	callback handler private data
>    * @frame_done_timeout_ms:	frame done timeout in ms
>    * @frame_done_timer:		watchdog timer for frame done event
>    * @vsync_event_timer:		vsync timer
> @@ -187,8 +185,6 @@ struct dpu_encoder_virt {
>   	struct dentry *debugfs_root;
>   	struct mutex enc_lock;
>   	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> -	void (*crtc_frame_event_cb)(void *, u32 event);
> -	void *crtc_frame_event_cb_data;
>   
>   	atomic_t frame_done_timeout_ms;
>   	struct timer_list frame_done_timer;
> @@ -1358,28 +1354,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
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
> @@ -1418,15 +1392,12 @@ void dpu_encoder_frame_done_callback(
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
> @@ -2367,7 +2338,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   		return;
>   	}
>   
> -	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
> +	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {
>   		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
>   			      DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
>   		return;
> @@ -2380,7 +2351,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>   
>   	event = DPU_ENCODER_FRAME_EVENT_ERROR;
>   	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> -	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> +	dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
>   }
>   
>   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 9e7236ef34e6..dd9cff4f1606 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -57,16 +57,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
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
> index 76169f406505..c75b4363bfc6 100644
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
