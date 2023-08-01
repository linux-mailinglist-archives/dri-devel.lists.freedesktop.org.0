Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633576A5C7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 02:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4C10E2C9;
	Tue,  1 Aug 2023 00:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF48D10E121
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 00:52:28 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so8449939e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 17:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690851147; x=1691455947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1NKXg/g5efYjR2gX2N5bK1rih7pdkkOohSLAVvGedKE=;
 b=yLR+Yl2aiBC5F+bC/tFzyiRnUvccjqHt7AdLl8bgZ5zfQTYHlFdofbJG+E/m8W5ySA
 36IjBWhPGXUHqiWDMW16zdeqHSKz49/20FSohtyXdYh0zCzmc6C7P5ytApB6G6O2B9A5
 J9ltGiT8cCm89Eyta4/zignPdehcjIXJEx/c+e1si2Nu8B2hhbVn/sYI9dAwYrt/AAcY
 ePho8nA0Ex9mLBSe4E68C6wX6P+uhLekM37F0VBkOg3dFHH/RIZG5fhYas9P9A2Zw5/5
 0HEipZd86AIOu9aCAphEkMVN9TejPz3s2/Ow4rUPF2571/TdUVAEmqDqRLBzWHLrb3Q6
 OLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690851147; x=1691455947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1NKXg/g5efYjR2gX2N5bK1rih7pdkkOohSLAVvGedKE=;
 b=Hj7RlhRj5acpqLYCnsN0xJ1h4WA4egRet7CUJvpt3L6cPATsHcNCjMufPk1yR6HOdb
 jiHIP5xKwmot44RryS8kjv/CrGnf2sDxh3V/xrCxqv3MqJyIYpwbkQk/MODgzMk2QDgS
 Wu3r/8SC9q2ERwr5MOhCd7aSH+bevc1GRwaG8bvzcuPYjkgB04/S89KTScH8dYR8kJmv
 qTrTy+cxrunwTc2ZxTdRgH5jigFHPwJRTkkG7PSigqUlR1UhNomuNNRq9pHnRRDY5A8y
 hAwPMjkthGdjhwqqpzqXN0nesHc5Mdw2B0pK3sWaBYcDbrurjNYlBhEOspaLK9bnReyJ
 RYOA==
X-Gm-Message-State: ABy/qLZt3Ky99fKHeEglT4MM+THC5NzeEVTxJv03Z97k5PAswQ4RpDbd
 YSybtkrpaIr/z8pt7TSCVHMJDw==
X-Google-Smtp-Source: APBJJlGA0wgQojlAKs8r5YiuKmrcXpMSpGszyxN9j9HbPGthi9g8bcwo69pMuUOwvTpWLD05UCHtNg==
X-Received: by 2002:a19:7913:0:b0:4f8:7772:3dfd with SMTP id
 u19-20020a197913000000b004f877723dfdmr1010857lfc.11.1690851146673; 
 Mon, 31 Jul 2023 17:52:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac25fd2000000b004fdc0023a47sm2277435lfg.238.2023.07.31.17.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 17:52:26 -0700 (PDT)
Message-ID: <23cf0a04-7988-9d83-7411-eec1ff270fad@linaro.org>
Date: Tue, 1 Aug 2023 03:52:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v5 09/10] drm/msm/dpu: Use DRM solid_fill property
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-9-053dbefa909c@quicinc.com>
 <de406c53-023d-f477-17f2-7d6dabf838bd@linaro.org>
 <b2c55511-f44d-1c5a-a59b-108d57a07864@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b2c55511-f44d-1c5a-a59b-108d57a07864@quicinc.com>
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2023 03:39, Jessica Zhang wrote:
> 
> 
> On 7/30/2023 9:15 PM, Dmitry Baryshkov wrote:
>> On 28/07/2023 20:02, Jessica Zhang wrote:
>>> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
>>> determine if the plane is solid fill. In addition drop the DPU plane
>>> color_fill field as we can now use drm_plane_state.solid_fill instead,
>>> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
>>> allow userspace to configure the alpha value for the solid fill color.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 24 
>>> ++++++++++++++++++------
>>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 114c803ff99b..95fc0394d13e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -42,7 +42,6 @@
>>>   #define SHARP_SMOOTH_THR_DEFAULT    8
>>>   #define SHARP_NOISE_THR_DEFAULT    2
>>> -#define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
>>>   #define DPU_ZPOS_MAX 255
>>>   /*
>>> @@ -82,7 +81,6 @@ struct dpu_plane {
>>>       enum dpu_sspp pipe;
>>> -    uint32_t color_fill;
>>>       bool is_error;
>>>       bool is_rt_pipe;
>>>       const struct dpu_mdss_cfg *catalog;
>>> @@ -606,6 +604,20 @@ static void _dpu_plane_color_fill_pipe(struct 
>>> dpu_plane_state *pstate,
>>>       _dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, 
>>> pstate->rotation);
>>>   }
>>> +static uint32_t _dpu_plane_get_bgr_fill_color(struct drm_solid_fill 
>>> solid_fill)
>>
>> As I commented for v4 (please excuse me for not responding to your 
>> email at thattime), we can return abgr here, taking 
>> plane->state->alpha into account.
> 
> Hi Dmitry,
> 
> Since it seems that this comment wasn't resolved, I can drop your R-B 
> tag in the next revision.

It's a minor issue, so no need to drop the tag.

> 
>  From my previous response, I pointed out that the color parameter 
> expects an RGB value [1].
> 
> So is the intention here to refactor _dpu_plane_color_fill() to accept 
> an ABGR8888 color?

That's what I'm suggesting.

> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L676
> 
>>
>>> +{
>>> +    uint32_t ret = 0;
>>> +    uint8_t b = solid_fill.b >> 24;
>>> +    uint8_t g = solid_fill.g >> 24;
>>> +    uint8_t r = solid_fill.r >> 24;
>>> +
>>> +    ret |= b << 16;
>>> +    ret |= g << 8;
>>> +    ret |= r;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   /**
>>>    * _dpu_plane_color_fill - enables color fill on plane
>>>    * @pdpu:   Pointer to DPU plane object
>>> @@ -977,9 +989,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>>>       if (pdpu->is_error)
>>>           /* force white frame with 100% alpha pipe output on error */
>>>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
>>> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>>> -        /* force 100% alpha */
>>> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>>> +    else if (drm_plane_solid_fill_enabled(plane->state))
>>> +        _dpu_plane_color_fill(pdpu, 
>>> _dpu_plane_get_bgr_fill_color(plane->state->solid_fill),
>>> +                plane->state->alpha);
>>>       else {
>>>           dpu_plane_flush_csc(pdpu, &pstate->pipe);
>>>           dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
>>> @@ -1024,7 +1036,7 @@ static void dpu_plane_sspp_update_pipe(struct 
>>> drm_plane *plane,
>>>       }
>>>       /* override for color fill */
>>> -    if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>>> +    if (drm_plane_solid_fill_enabled(plane->state)) {
>>>           _dpu_plane_set_qos_ctrl(plane, pipe, false);
>>>           /* skip remaining processing on color fill */
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

