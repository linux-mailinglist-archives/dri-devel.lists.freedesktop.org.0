Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B087BF50C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 09:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECE110E321;
	Tue, 10 Oct 2023 07:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9CB10E321
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 07:58:39 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3231d67aff2so5333350f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 00:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696924718; x=1697529518; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=DuF08tiAL2vBsnI7ItZlNLjLI9/OSkp0LDsu4D+EiFA=;
 b=reknD0Rvzfpl0msmSUMhhcBniWqgLTyubslCMovH+Ap1w2UglUapugXEosV1+RGBen
 oW1RWrc0BvQ4fnnnhrJkwQBLuBGtEtoZuTs6Dhz/9jTkQVNWVtjvLpNqgXeHfp4Wb7af
 arCDISC/qOl74pVAxjjT7CI2qdGNxKvpMcrkgUKzMXySAQNVo9KkYSaC2dvWUq8QOEpD
 8Fc31Kz3zqfRnD4pUOmnvRrvf3hi8cUDsQ2vq9wf+5HrdWxWtbVuARuxW1mYYjKZwRMb
 bvHWTS+DwDcV8+4+TDngeJOqiesC6UiG9KoLUAytEX2Svv+JXJ+Y1Bve4x81eAH9B1mr
 TEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696924718; x=1697529518;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DuF08tiAL2vBsnI7ItZlNLjLI9/OSkp0LDsu4D+EiFA=;
 b=gj1xJSvIRuG4kU+JOtnvcxjXZUVDM8Zf0IyPzDKnGtVUk2EMpwDTylpgrAQH3MstvW
 3ujOW+YCG2V6u/6NpTW4TLRdE3vDLTZUNMk8upgiKhSrlwOKRBG+GVvluXkZtvoO2HCR
 a4jyWw+DM6hY7LmYLeSa1xlJ/Eh7vT9g7SPmPlGgwS477XhKeLbt8UWF0uzfYxpPqmm0
 fa96jQSRedAZAedVzxHwYPXAs5/STJYXSjUEwjsuElYJR66ZtuCSK7StHSa3uCFnT1AM
 X9fefT6pJGZWaoZk7xMvEdVUpzkfY8u7yg1BmOq2NuFNYtraVtRQqNk8W+4fp21Hsx2S
 hHHQ==
X-Gm-Message-State: AOJu0YxID7UD17CjzgWtgKADnBOtKVQ9Hp44hh/87mDO2pDpM0S2GMik
 eyoQEUr46WVOWMOK5RDkrBk9nA==
X-Google-Smtp-Source: AGHT+IHfVtV+fM/y8bb4Y20eH4zD+GGKjiUOYYRNx1gqzX/XHYwbaChonFJ07oxttNsmMG54NZcuEQ==
X-Received: by 2002:a05:6000:1f0a:b0:32c:a930:fe0d with SMTP id
 bv10-20020a0560001f0a00b0032ca930fe0dmr1261947wrb.4.1696924717664; 
 Tue, 10 Oct 2023 00:58:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2eac:5b51:e0a4:4807?
 ([2a01:e0a:982:cbb0:2eac:5b51:e0a4:4807])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a5d534b000000b003232380ffd5sm11816539wrv.106.2023.10.10.00.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 00:58:37 -0700 (PDT)
Message-ID: <6ba6331c-12c6-4cce-bbf9-0255d4f17118@linaro.org>
Date: Tue, 10 Oct 2023 09:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 4/5] drm/msm: dpu1: call wb & sspp clk_force_ctrl op
 if split clock control
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-4-806c0dee4e43@linaro.org>
 <e1f70025-f93d-4d1f-bafa-1e834324ce62@linaro.org>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <e1f70025-f93d-4d1f-bafa-1e834324ce62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 19:07, Dmitry Baryshkov wrote:
> On 09/10/2023 19:36, Neil Armstrong wrote:
>> Now clk_ctrl IDs can be optional and the clk_ctrl_reg can be specified
>> on the SSPP & WB caps directly, pass the SSPP & WB hw struct to the
>> qos & limit params then call the clk_force_ctrl() op accordingly.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  9 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 37 +++++++++++++++-------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           | 12 ++++---
>>   4 files changed, 40 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 78037a697633..e4dfe0be7207 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -45,6 +45,7 @@ static void dpu_encoder_phys_wb_set_ot_limit(
>>       struct dpu_vbif_set_ot_params ot_params;
>>       memset(&ot_params, 0, sizeof(ot_params));
>> +    ot_params.wb = hw_wb;
>>       ot_params.xin_id = hw_wb->caps->xin_id;
>>       ot_params.num = hw_wb->idx - WB_0;
>>       ot_params.width = phys_enc->cached_mode.hdisplay;
>> @@ -52,7 +53,6 @@ static void dpu_encoder_phys_wb_set_ot_limit(
>>       ot_params.is_wfd = true;
>>       ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
>>       ot_params.vbif_idx = hw_wb->caps->vbif_idx;
>> -    ot_params.clk_ctrl = hw_wb->caps->clk_ctrl;
>>       ot_params.rd = false;
>>       dpu_vbif_set_ot_limit(phys_enc->dpu_kms, &ot_params);
>> @@ -81,9 +81,9 @@ static void dpu_encoder_phys_wb_set_qos_remap(
>>       hw_wb = phys_enc->hw_wb;
>>       memset(&qos_params, 0, sizeof(qos_params));
>> +    qos_params.wb = hw_wb;
>>       qos_params.vbif_idx = hw_wb->caps->vbif_idx;
>>       qos_params.xin_id = hw_wb->caps->xin_id;
>> -    qos_params.clk_ctrl = hw_wb->caps->clk_ctrl;
>>       qos_params.num = hw_wb->idx - WB_0;
>>       qos_params.is_rt = false;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index c2aaaded07ed..b0b662068377 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -350,6 +350,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>>       struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>       memset(&ot_params, 0, sizeof(ot_params));
>> +    ot_params.sspp = pipe->sspp;
>>       ot_params.xin_id = pipe->sspp->cap->xin_id;
>>       ot_params.num = pipe->sspp->idx - SSPP_NONE;
>>       ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>> @@ -357,7 +358,6 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>>       ot_params.is_wfd = !pdpu->is_rt_pipe;
>>       ot_params.frame_rate = frame_rate;
>>       ot_params.vbif_idx = VBIF_RT;
>> -    ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
>>       ot_params.rd = true;
>>       dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
>> @@ -377,16 +377,15 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
>>       memset(&qos_params, 0, sizeof(qos_params));
>>       qos_params.vbif_idx = VBIF_RT;
>> -    qos_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
>> +    qos_params.sspp = pipe->sspp;
>>       qos_params.xin_id = pipe->sspp->cap->xin_id;
>>       qos_params.num = pipe->sspp->idx - SSPP_VIG0;
>>       qos_params.is_rt = pdpu->is_rt_pipe;
>> -    DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
>> +    DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d\n",
>>               qos_params.num,
>>               qos_params.vbif_idx,
>> -            qos_params.xin_id, qos_params.is_rt,
>> -            qos_params.clk_ctrl);
>> +            qos_params.xin_id, qos_params.is_rt);
>>       dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>> index 2ae5cba1848b..a79559084a91 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
>> @@ -158,11 +158,19 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
>>       return ot_lim;
>>   }
>> -static bool dpu_vbif_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
>> -                      unsigned int clk_ctrl,
>> +static bool dpu_vbif_setup_clk_force_ctrl(struct dpu_hw_sspp *sspp,
>> +                      struct dpu_hw_wb *wb,
>> +                      struct dpu_hw_mdp *mdp,
>>                         bool enable)
>>   {
>> -    return mdp->ops.setup_clk_force_ctrl(mdp, clk_ctrl, enable);
>> +    if (sspp && sspp->cap->clk_ctrl_reg)
>> +        return sspp->ops.setup_clk_force_ctrl(sspp, enable);
>> +    else if (wb && wb->caps->clk_ctrl_reg)
>> +        return wb->ops.setup_clk_force_ctrl(wb, enable);
>> +    else
> 
> This is what I wanted to avoid.
> 
> If we move the caller function to the sspp / WB, we will not need this kind of wrapper.

I tried it, but it requires passing the mdp pointer to the setup_clk_force_ctrl op,
which is IMHO not super clean... or if you have a way to get dpu_hw_mdp from
within hw_sspp/hw_wb it would help.

> 
>> +        return mdp->ops.setup_clk_force_ctrl(mdp,
>> +                sspp ? sspp->cap->clk_ctrl : wb->caps->clk_ctrl,
>> +                enable);
>>   }
>>   /**
>> @@ -190,9 +198,13 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>>           return;
>>       }
>> -    if (!mdp->ops.setup_clk_force_ctrl ||
>> -            !vbif->ops.set_limit_conf ||
>> -            !vbif->ops.set_halt_ctrl)
>> +    if ((!params->sspp && !params->wb) ||
>> +        (params->sspp && !params->sspp->ops.setup_clk_force_ctrl) ||
>> +        (params->wb && !params->wb->ops.setup_clk_force_ctrl) ||
>> +        !mdp->ops.setup_clk_force_ctrl)
>> +        return;
>> +
>> +    if (!vbif->ops.set_limit_conf || !vbif->ops.set_halt_ctrl)
>>           return;
>>       /* set write_gather_en for all write clients */
>> @@ -207,7 +219,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>>       trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
>>           params->vbif_idx);
>> -    forced_on = dpu_vbif_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
>> +    forced_on = dpu_vbif_setup_clk_force_ctrl(params->sspp, params->wb, mdp, true);
> 
> I'd suggest removing the setup_clk_force_ctrl from dpu_vbif_set_ot_limit() and dpu_vbif_set_qos_remap(). Instead make dpu_plane / dpu_encoder_phys_wb call into dpu_hw_sspp / dpu_hw_wb, which will enable the clock, call dpu_vbif then disable the clock.
> 
> In my opinion this is simpler than the condition in the previous chunk.

Indeed this is a nice option, but the hw_mdp pointer requirement into hw_sspp/hw_wb
still puzzles me.

> 
>>       vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
>> @@ -220,7 +232,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>>       vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
>>       if (forced_on)
>> -        dpu_vbif_setup_clk_force_ctrl(mdp,  params->clk_ctrl, false);
>> +        dpu_vbif_setup_clk_force_ctrl(params->sspp, params->wb, mdp, false);
>>   }
>>   void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>> @@ -245,7 +257,10 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>>           return;
>>       }
>> -    if (!vbif->ops.set_qos_remap || !mdp->ops.setup_clk_force_ctrl) {
>> +    if ((!params->sspp && !params->wb) ||
>> +        (params->sspp && !params->sspp->ops.setup_clk_force_ctrl) ||
>> +        (params->wb && !params->wb->ops.setup_clk_force_ctrl) ||
>> +        !mdp->ops.setup_clk_force_ctrl || !vbif->ops.set_qos_remap) {
>>           DRM_DEBUG_ATOMIC("qos remap not supported\n");
>>           return;
>>       }
>> @@ -258,7 +273,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>>           return;
>>       }
>> -    forced_on = dpu_vbif_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
>> +    forced_on = dpu_vbif_setup_clk_force_ctrl(params->sspp, params->wb, mdp, true);
>>       for (i = 0; i < qos_tbl->npriority_lvl; i++) {
>>           DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
>> @@ -269,7 +284,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
>>       }
>>       if (forced_on)
>> -        dpu_vbif_setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
>> +        dpu_vbif_setup_clk_force_ctrl(params->sspp, params->wb, mdp, false);
>>   }
>>   void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
>> index ab490177d886..a4fe76e390d9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
>> @@ -7,7 +7,12 @@
>>   #include "dpu_kms.h"
>> +struct dpu_hw_sspp;
>> +struct dpu_hw_wb;
>> +
>>   struct dpu_vbif_set_ot_params {
>> +    struct dpu_hw_sspp *sspp;
>> +    struct dpu_hw_wb *wb;
>>       u32 xin_id;
>>       u32 num;
>>       u32 width;
>> @@ -16,28 +21,27 @@ struct dpu_vbif_set_ot_params {
>>       bool rd;
>>       bool is_wfd;
>>       u32 vbif_idx;
>> -    u32 clk_ctrl;
>>   };
>>   struct dpu_vbif_set_memtype_params {
>>       u32 xin_id;
>>       u32 vbif_idx;
>> -    u32 clk_ctrl;
>>       bool is_cacheable;
>>   };
>>   /**
>>    * struct dpu_vbif_set_qos_params - QoS remapper parameter
>> + * @sspp: backing SSPP
>>    * @vbif_idx: vbif identifier
>>    * @xin_id: client interface identifier
>> - * @clk_ctrl: clock control identifier of the xin
>>    * @num: pipe identifier (debug only)
>>    * @is_rt: true if pipe is used in real-time use case
>>    */
>>   struct dpu_vbif_set_qos_params {
>> +    struct dpu_hw_sspp *sspp;
>> +    struct dpu_hw_wb *wb;
>>       u32 vbif_idx;
>>       u32 xin_id;
>> -    u32 clk_ctrl;
>>       u32 num;
>>       bool is_rt;
>>   };
>>
> 

Thanks,
Neil
