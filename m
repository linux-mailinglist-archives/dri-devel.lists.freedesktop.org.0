Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34B68FC36
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 01:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A18010E8D4;
	Thu,  9 Feb 2023 00:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E067410E8D5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 00:53:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id hx15so1910033ejc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 16:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sOyW9LAmTtWfl/yC7dD/NiWL3342cTdBhfReCFAVF6Q=;
 b=Kmv+QfRel4zco2DGL1LmeOF/d2xfQGpEPh5HbWKgV7XFX7kHj8aeU/gabSsqozGp9+
 ehuLIwObSe9s9nM7N/oSY2moMzEC/fjBenpse3DAepO3ptOJA0qFTLKci4Uc7n2mFTSG
 DZtxRktss2vY0qveJz0r+8+qDG/Ngws8quBqJYE9KkRUMCrB3YYsMu8CHrxnP7Q2EbHk
 CW7eLINEQZ+FtdMRgxcilpD52lR5/LDTjdespyCMBPadHvXWeMaILgQ9x6d2slNZduN6
 bYGnSTaqAukSY/aumXX2pJzb/A39V4hwswqsMqHvBhjT3YGhazpUng/jU09Ky10R5KTB
 GwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sOyW9LAmTtWfl/yC7dD/NiWL3342cTdBhfReCFAVF6Q=;
 b=XwWZ1f02oz/O58Nqhv/TUiO6gzwleQkZb2ZI/AtRW3IsyvKB0Vql2iq8UbvaaV8xBU
 h+DabFWGRe7gUFaFih8mf3grGWG5Is+vPSGJBSm8ecsnkjgxNQTTPN1JLK3XT4Jh4xcv
 pX9EyjcaDsYMyBPA2+aqy9qy7VZxDRCf5gBVKDrEN2OGpv3k07HMpkJBcjFRumMVtNgr
 BN8QjpSPqCj4nIBSCgOTFgBNj9dUwoFZC+T6IdiNErfzUpD3b0vDhNUwDj72TdIiGxP6
 gukCRZXC0sZNRV4YpgRrx4JtjVPNzrenc5nbTM8nZd3VtpfXTTnU9eFXzn5BwucMxWyd
 5HFA==
X-Gm-Message-State: AO0yUKVlza6sNbh8KgHFmqccJDje+0mIw/Btb6PzDC2fSiB4QKOsqRi2
 0UzYcbSycKBcDquC16xoUpXj3A==
X-Google-Smtp-Source: AK7set+Z3QH7Oudl+1KTTYPN7nTS/82k8Ds/lfTAqYGaBkA6rDfIsxLJp3lTszEKepkgxZUmzte57g==
X-Received: by 2002:a17:906:b888:b0:881:efcd:1bc4 with SMTP id
 hb8-20020a170906b88800b00881efcd1bc4mr10277026ejb.46.1675904019375; 
 Wed, 08 Feb 2023 16:53:39 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170906868300b0087879f8c65asm155350ejx.89.2023.02.08.16.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 16:53:38 -0800 (PST)
Message-ID: <5e64d17b-c592-74a4-1609-239e4de22b2b@linaro.org>
Date: Thu, 9 Feb 2023 02:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 25/27] drm/msm/dpu: rework static color fill code
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-26-dmitry.baryshkov@linaro.org>
 <ef6b0227-1ac9-331e-1c8e-beb6ce8a0aff@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ef6b0227-1ac9-331e-1c8e-beb6ce8a0aff@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 00:34, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Rework static color fill code to separate the pipe / pipe_cfg handling.
>> This is a preparation for the r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 70 +++++++++++++----------
>>   1 file changed, 41 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 05047192cb37..e2e85688ed3c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -639,20 +639,54 @@ static void _dpu_plane_setup_scaler(struct 
>> dpu_sw_pipe *pipe,
>>                   fmt);
>>   }
>> +static int _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
>> +        struct dpu_sw_pipe *pipe,
>> +        struct dpu_hw_sspp_cfg *old_pipe_cfg,
> 
> Why is this called old_pipe_cfg instead of just pipe_cfg?

Ack. Probably got that wrong during mass-renaming and then missed to fix it.

> 
> 
>> +        u32 fill_color,
>> +        const struct dpu_format *fmt)
>> +{
>> +    struct dpu_hw_sspp_cfg pipe_cfg;
>> +
>> +    /* update sspp */
>> +    if (!pipe->sspp->ops.setup_solidfill)
>> +        return 0;
> 
> You can just return from here and make this function void?

Of course.

> 
>> +
>> +    pipe->sspp->ops.setup_solidfill(pipe, fill_color);
>> +
>> +    /* override scaler/decimation if solid fill */
>> +    pipe_cfg.dst_rect = old_pipe_cfg->dst_rect;
>> +
>> +    pipe_cfg.src_rect.x1 = 0;
>> +    pipe_cfg.src_rect.y1 = 0;
>> +    pipe_cfg.src_rect.x2 =
>> +        drm_rect_width(&pipe_cfg.dst_rect);
>> +    pipe_cfg.src_rect.y2 =
>> +        drm_rect_height(&pipe_cfg.dst_rect);
>> +
>> +    if (pipe->sspp->ops.setup_format)
>> +        pipe->sspp->ops.setup_format(pipe, fmt, DPU_SSPP_SOLID_FILL);
>> +
>> +    if (pipe->sspp->ops.setup_rects)
>> +        pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
>> +
>> +    _dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, 
>> pstate->rotation);
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * _dpu_plane_color_fill - enables color fill on plane
>>    * @pdpu:   Pointer to DPU plane object
>>    * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, 
>> [7..0] Red
>>    * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
>> - * Returns: 0 on success
>>    */
>> -static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>> +static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>>           uint32_t color, uint32_t alpha)
>>   {
>>       const struct dpu_format *fmt;
>>       const struct drm_plane *plane = &pdpu->base;
>>       struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>> -    struct dpu_hw_sspp_cfg pipe_cfg;
>> +    u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
>>       DPU_DEBUG_PLANE(pdpu, "\n");
>> @@ -661,34 +695,12 @@ static int _dpu_plane_color_fill(struct 
>> dpu_plane *pdpu,
>>        * h/w only supports RGB variants
>>        */
>>       fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>> +    /* should not happen ever */
>> +    if (!fmt)
>> +        return;
>>       /* update sspp */
>> -    if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
>> -        pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
>> -                (color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
>> -
>> -        /* override scaler/decimation if solid fill */
>> -        pipe_cfg.dst_rect = pstate->base.dst;
>> -
>> -        pipe_cfg.src_rect.x1 = 0;
>> -        pipe_cfg.src_rect.y1 = 0;
>> -        pipe_cfg.src_rect.x2 =
>> -            drm_rect_width(&pipe_cfg.dst_rect);
>> -        pipe_cfg.src_rect.y2 =
>> -            drm_rect_height(&pipe_cfg.dst_rect);
>> -
>> -        if (pstate->pipe.sspp->ops.setup_format)
>> -            pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
>> -                    fmt, DPU_SSPP_SOLID_FILL);
>> -
>> -        if (pstate->pipe.sspp->ops.setup_rects)
>> -            pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
>> -                    &pipe_cfg);
>> -
>> -        _dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, 
>> pstate->rotation);
>> -    }
>> -
>> -    return 0;
>> +    _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, 
>> &pstate->pipe_cfg, fill_color, fmt);
>>   }
>>   int dpu_plane_validate_multirect_v2(struct 
>> dpu_multirect_plane_states *plane)

-- 
With best wishes
Dmitry

