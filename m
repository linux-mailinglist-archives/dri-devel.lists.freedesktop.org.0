Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F38476750
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 02:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC0A10E328;
	Thu, 16 Dec 2021 01:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C240E10E328;
 Thu, 16 Dec 2021 01:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639617114; x=1671153114;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zx0VtHMLd4Wnp0S9ajuKroJxOPd1pzhoG2yQ62+1joo=;
 b=ufMisNcb/55woswyeeHQ0BVmsso6EEcbV6sQ5nlo9szQKQgj8LsYE8dL
 L9zVeh88TrkyZiaoEsXR5LaFstoAQ3NQIBLRY3Eap/k4gXWDE8JJei9QV
 8Q8/Yodw3Xk1dGK07otT/4lJfdXg7jVBJkn0mW/TTNmOz0E0ARdP8n24K k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 15 Dec 2021 17:11:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:11:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 15 Dec 2021 17:11:52 -0800
Received: from [10.111.165.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 15 Dec
 2021 17:11:49 -0800
Message-ID: <84b35381-b068-5698-3a33-9e0cf0ee6322@quicinc.com>
Date: Wed, 15 Dec 2021 17:11:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: add
 dpu_crtc_atomic_print_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/15/2021 8:09 AM, Dmitry Baryshkov wrote:
> Implement CRTC's atomic_print_state() callback, printing DPU-specific
> CRTC state (LM, CTL and DSPP ids).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 59b1bcfbe8c0..df128a680697 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -924,6 +924,20 @@ static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
>   	return &cstate->base;
>   }
>   
> +static void dpu_crtc_atomic_print_state(struct drm_printer *p,
> +					const struct drm_crtc_state *state)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +	int i;
> +
> +	for (i = 0; i < cstate->num_mixers; i++) {
> +		drm_printf(p, "\tlm[%d]=%d\n", i, cstate->mixers[i].hw_lm->idx - LM_0);
> +		drm_printf(p, "\tctl[%d]=%d\n", i, cstate->mixers[i].lm_ctl->idx - CTL_0);
> +		if (cstate->mixers[i].hw_dspp)
> +			drm_printf(p, "\tdspp[%d]=%d\n", i, cstate->mixers[i].hw_dspp->idx - DSPP_0);
> +	}
> +}
> +
>   static void dpu_crtc_disable(struct drm_crtc *crtc,
>   			     struct drm_atomic_state *state)
>   {
> @@ -1454,6 +1468,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
>   	.reset = dpu_crtc_reset,
>   	.atomic_duplicate_state = dpu_crtc_duplicate_state,
>   	.atomic_destroy_state = dpu_crtc_destroy_state,
> +	.atomic_print_state = dpu_crtc_atomic_print_state,
>   	.late_register = dpu_crtc_late_register,
>   	.verify_crc_source = dpu_crtc_verify_crc_source,
>   	.set_crc_source = dpu_crtc_set_crc_source,
> 
