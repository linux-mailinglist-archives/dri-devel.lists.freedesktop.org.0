Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F1476756
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 02:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1070010F9E7;
	Thu, 16 Dec 2021 01:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA20410E68C;
 Thu, 16 Dec 2021 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639617221; x=1671153221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f+k2LrVXe7OHN+HIZ0lYADo6ciCOB8y17XUGdsEJ79E=;
 b=WmBx8X7Wuxa+hyWMB0K2Vs6ZzjDkx+o3Id8YlqZ2n++Sd/ApcZe+ido2
 uoL/3PWrWwHbMLaBQzh1SQgFnrdXut/6X5GxA286emM0KA7ePKVwryAhD
 07YerWSmWFkcAf2pjl3+1UN2BTU4eDG2xbXNxEPLimrH/fDtlUVs5SDcj U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Dec 2021 17:13:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 17:13:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 15 Dec 2021 17:13:39 -0800
Received: from [10.111.165.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 15 Dec
 2021 17:13:37 -0800
Message-ID: <4156df7a-54c3-e991-7a5b-d76a0e7174a0@quicinc.com>
Date: Wed, 15 Dec 2021 17:13:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu: add
 dpu_plane_atomic_print_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
 <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
> Implement plane's atomic_print_state() callback, printing DPU-specific
> plane state: blending stage, SSPP and multirect mode and index.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 +++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index fe2f8221ab6e..bdecbe39a12b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1305,6 +1305,46 @@ dpu_plane_duplicate_state(struct drm_plane *plane)
>   	return &pstate->base;
>   }
>   
> +static const char * const multirect_mode_name[] = {
> +	[DPU_SSPP_MULTIRECT_NONE] = "none",
> +	[DPU_SSPP_MULTIRECT_PARALLEL] = "parallel",
> +	[DPU_SSPP_MULTIRECT_TIME_MX] = "time_mx",
> +};
> +
> +static const char * const multirect_index_name[] = {
> +	[DPU_SSPP_RECT_SOLO] = "solo",
> +	[DPU_SSPP_RECT_0] = "rect_0",
> +	[DPU_SSPP_RECT_1] = "rect_1",
> +};
> +
> +static const char *dpu_get_multirect_mode(enum dpu_sspp_multirect_mode mode)
> +{
> +	if (WARN_ON(mode >= ARRAY_SIZE(multirect_mode_name)))
> +		return "unknown";
> +
> +	return multirect_mode_name[mode];
> +}
> +
> +static const char *dpu_get_multirect_index(enum dpu_sspp_multirect_index index)
> +{
> +	if (WARN_ON(index >= ARRAY_SIZE(multirect_index_name)))
> +		return "unknown";
> +
> +	return multirect_index_name[index];
> +}
> +
> +static void dpu_plane_atomic_print_state(struct drm_printer *p,
> +		const struct drm_plane_state *state)
> +{
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> +	struct dpu_plane *pdpu = to_dpu_plane(state->plane);
> +
> +	drm_printf(p, "\tstage=%d\n", pstate->stage);
> +	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
> +	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
> +	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
> +}
> +
>   static void dpu_plane_reset(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
> @@ -1388,6 +1428,7 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
>   		.reset = dpu_plane_reset,
>   		.atomic_duplicate_state = dpu_plane_duplicate_state,
>   		.atomic_destroy_state = dpu_plane_destroy_state,
> +		.atomic_print_state = dpu_plane_atomic_print_state,
>   		.format_mod_supported = dpu_plane_format_mod_supported,
>   };
>   
> 
