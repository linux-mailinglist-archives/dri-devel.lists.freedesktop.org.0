Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CDF67B854
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F7E10E37E;
	Wed, 25 Jan 2023 17:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0910E0C3;
 Wed, 25 Jan 2023 17:22:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30PEMsEA004319; Wed, 25 Jan 2023 17:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i02FCDVW6G1T0C20yjVLg6MT/sT2taAVIlLkzuylqh4=;
 b=J4Z6s+iGdbSOrIh++2QaVQBV4edbpxdCmar0Z+Wy6GKZ2BtVUnTZ+M7l0MpU1OENrMeB
 3OweguUpkEQqo/C6oQPQSj5glC+ILIsdJQdf3JcURPedYXa0uDE9Mfkuo3gmMcQz1X16
 Zx+3VSl/U+EYDdwwc9iw+9+KyPsEa5+ZmXzYlAQTEsyLNCT5Ydn3+8uSOX2IIV/m2GK1
 mcm4tGAKeY7Xp/3uXnUW8SwbPOBmf3oJIMa0EX/ZBKLkOnSXImB7M9LAlJUXn8yi9ele
 H3vucXVzd+Vsa3fWJG6m7j3Op/wROKdyHsJ8F+7nKDuBg8tO15k0T1aK0D4E/AvSEiuw +A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3naaasb8sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 17:22:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30PHMAQa030214
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 17:22:10 GMT
Received: from [10.110.102.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 09:22:08 -0800
Message-ID: <f08b04b2-3fdd-38f5-6402-16c57a3322d2@quicinc.com>
Date: Wed, 25 Jan 2023 09:22:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/msm/dp: Return IRQ_NONE for unhandled interrupts
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
 <20230119145248.2.I2d7aec2fadb9c237cd0090a47d6a8ba2054bf0f8@changeid>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230119145248.2.I2d7aec2fadb9c237cd0090a47d6a8ba2054bf0f8@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ty9ffe_7begRDoZxgbdc9Seg5nuJkmrS
X-Proofpoint-ORIG-GUID: Ty9ffe_7begRDoZxgbdc9Seg5nuJkmrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_10,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250155
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, Johan
 Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/19/2023 2:53 PM, Douglas Anderson wrote:
> If our interrupt handler gets called and we don't really handle the
> interrupt then we should return IRQ_NONE. The current interrupt
> handler didn't do this, so let's fix it.
>
> NOTE: for some of the cases it's clear that we should return IRQ_NONE
> and some cases it's clear that we should return IRQ_HANDLED. However,
> there are a few that fall somewhere in between. Specifically, the
> documentation for when to return IRQ_NONE vs. IRQ_HANDLED is probably
> best spelled out in the commit message of commit d9e4ad5badf4
> ("Document that IRQ_NONE should be returned when IRQ not actually
> handled"). That commit makes it clear that we should return
> IRQ_HANDLED if we've done something to make the interrupt stop
> happening.
>
> The case where it's unclear is, for instance, in dp_aux_isr() after
> we've read the interrupt using dp_catalog_aux_get_irq() and confirmed
> that "isr" is non-zero. The function dp_catalog_aux_get_irq() not only
> reads the interrupts but it also "ack"s all the interrupts that are
> returned. For an "unknown" interrupt this has a very good chance of
> actually stopping the interrupt from happening. That would mean we've
> identified that it's our device and done something to stop them from
> happening and should return IRQ_HANDLED. Specifically, it should be
> noted that most interrupts that need "ack"ing are ones that are
> one-time events and doing an "ack" is enough to clear them. However,
> since these interrupts are unknown then, by definition, it's unknown
> if "ack"ing them is truly enough to clear them. It's possible that we
> also need to remove the original source of the interrupt. In this
> case, IRQ_NONE would be a better choice.
>
> Given that returning an occasional IRQ_NONE isn't the absolute end of
> the world, however, let's choose that course of action. The IRQ
> framework will forgive a few IRQ_NONE returns now and again (and it
> won't even log them, which is why we have to log them ourselves). This
> means that if we _do_ end hitting an interrupt where "ack"ing isn't
> enough the kernel will eventually detect the problem and shut our
> device down.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 12 +++++++-----
>   drivers/gpu/drm/msm/dp/dp_aux.h     |  2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++--
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 +++++---
>   5 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 34ad08ae6eb9..59e323b7499d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -368,14 +368,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   	return ret;
>   }
>   
> -void dp_aux_isr(struct drm_dp_aux *dp_aux)
> +irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
>   {
>   	u32 isr;
>   	struct dp_aux_private *aux;
>   
>   	if (!dp_aux) {
>   		DRM_ERROR("invalid input\n");
> -		return;
> +		return IRQ_NONE;
>   	}
>   
>   	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> @@ -384,11 +384,11 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>   
>   	/* no interrupts pending, return immediately */
>   	if (!isr)
> -		return;
> +		return IRQ_NONE;
>   
>   	if (!aux->cmd_busy) {
>   		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
> -		return;
> +		return IRQ_NONE;
>   	}
>   
>   	/*
> @@ -420,10 +420,12 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>   			aux->aux_error_num = DP_AUX_ERR_DEFER;
>   	} else {
>   		DRM_WARN("Unexpected interrupt: %#010x\n", isr);
> -		return;
> +		return IRQ_NONE;
>   	}
>   
>   	complete(&aux->comp);
> +
> +	return IRQ_HANDLED;
>   }
>   
>   void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> index e930974bcb5b..511305da4f66 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -11,7 +11,7 @@
>   
>   int dp_aux_register(struct drm_dp_aux *dp_aux);
>   void dp_aux_unregister(struct drm_dp_aux *dp_aux);
> -void dp_aux_isr(struct drm_dp_aux *dp_aux);
> +irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
>   void dp_aux_init(struct drm_dp_aux *dp_aux);
>   void dp_aux_deinit(struct drm_dp_aux *dp_aux);
>   void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dd26ca651a05..1a5377ef1967 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1979,27 +1979,33 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   	return ret;
>   }
>   
> -void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
> +irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
>   {
>   	struct dp_ctrl_private *ctrl;
>   	u32 isr;
> +	irqreturn_t ret = IRQ_NONE;
>   
>   	if (!dp_ctrl)
> -		return;
> +		return IRQ_NONE;
>   
>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>   
>   	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
can you add (!isr) check and return IRQ_NONE here to be consistent with 
dp_aux_isr()?
>
> +
>   	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
>   		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
>   		complete(&ctrl->video_comp);
> +		ret = IRQ_HANDLED;
>   	}
>   
>   	if (isr & DP_CTRL_INTR_IDLE_PATTERN_SENT) {
>   		drm_dbg_dp(ctrl->drm_dev, "idle_patterns_sent\n");
>   		complete(&ctrl->idle_comp);
> +		ret = IRQ_HANDLED;
>   	}
> +
> +	return ret;
>   }
>   
>   struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 9f29734af81c..c3af06dc87b1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -25,7 +25,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
> -void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
> +irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
>   void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
>   struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>   			struct dp_panel *panel,	struct drm_dp_aux *aux,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7ff60e5ff325..8996adbc5bd3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1192,7 +1192,7 @@ static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>   static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>   {
>   	struct dp_display_private *dp = dev_id;
> -	irqreturn_t ret = IRQ_HANDLED;
> +	irqreturn_t ret = IRQ_NONE;
>   	u32 hpd_isr_status;
>   
>   	if (!dp) {
> @@ -1220,13 +1220,15 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>   
>   		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
>   			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +
> +		ret = IRQ_HANDLED;
>   	}
>   
>   	/* DP controller isr */
> -	dp_ctrl_isr(dp->ctrl);
> +	ret |= dp_ctrl_isr(dp->ctrl);
>   
>   	/* DP aux isr */
> -	dp_aux_isr(dp->aux);
> +	ret |= dp_aux_isr(dp->aux);
>   
>   	return ret;
>   }
