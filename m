Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E04519221
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 01:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA26210FAD5;
	Tue,  3 May 2022 23:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33B410FB4C;
 Tue,  3 May 2022 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651619092; x=1683155092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+vRMP2zM5ewDvjjz9re2aVDrEL6FpvDwlwE5L0GniEM=;
 b=QJhIIvNt4Pwg7NIZnGNMJs/TtCtJB3dzgMC9w7Nw3IyhR18zC7yNxbgP
 0n1rOYI93x5Nv4GXDFXJi+gp9c9Ll4e2ayfeBOG3LXZC8dBHJ7oNZ4+pE
 KJx44At6W5mnR5ZeNC4ZLJLA25WoecHiGkIXTtyVbiLtUR92BygJp3R/8 4=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 16:04:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:04:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 16:04:51 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 16:04:49 -0700
Message-ID: <124c0533-8f98-e459-c7d4-b9b3d86effc2@quicinc.com>
Date: Tue, 3 May 2022 16:04:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 07/25] drm/msm/dpu: drop dpu_plane_pipe function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-8-dmitry.baryshkov@linaro.org>
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



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> There no more need for the dpu_plane_pipe() function, crtc code can
> access pstate->pipe_hw.idx directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Perhaps this can be squashed with the previous change.

Otherwise,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h | 7 -------
>   3 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 5fc338ef3460..d21791db6ab1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -364,7 +364,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		pstate = to_dpu_plane_state(state);
>   		fb = state->fb;
>   
> -		sspp_idx = dpu_plane_pipe(plane);
> +		sspp_idx = pstate->pipe_hw->idx;
>   		set_bit(sspp_idx, fetch_active);
>   
>   		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> @@ -1112,7 +1112,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   		pstates[cnt].dpu_pstate = to_dpu_plane_state(pstate);
>   		pstates[cnt].drm_pstate = pstate;
>   		pstates[cnt].stage = pstate->normalized_zpos;
> -		pstates[cnt].pipe_id = dpu_plane_pipe(plane);
> +		pstates[cnt].pipe_id = to_dpu_plane_state(pstate)->pipe_hw->idx;
>   
>   		if (pipe_staged[pstates[cnt].pipe_id]) {
>   			multirect_plane[multirect_count].r0 =
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ca194cd83cd0..d1f9b4bc10ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1391,11 +1391,6 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
>   		.atomic_update = dpu_plane_atomic_update,
>   };
>   
> -enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
> -{
> -	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
> -}
> -
>   /* initialize plane */
>   struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		uint32_t pipe, enum drm_plane_type type,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index aa9478b475d4..d745cde4ea77 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -54,13 +54,6 @@ struct dpu_multirect_plane_states {
>   #define to_dpu_plane_state(x) \
>   	container_of(x, struct dpu_plane_state, base)
>   
> -/**
> - * dpu_plane_pipe - return sspp identifier for the given plane
> - * @plane:   Pointer to DRM plane object
> - * Returns: sspp identifier of the given plane
> - */
> -enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
> -
>   /**
>    * dpu_plane_flush - final plane operations before commit flush
>    * @plane: Pointer to drm plane structure
