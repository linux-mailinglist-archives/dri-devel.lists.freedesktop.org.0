Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE163F0BDC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06076E92D;
	Wed, 18 Aug 2021 19:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024106E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 19:34:48 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id w4so5610045ljh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TZlXaJlwbJlKP9XZ2W5P2GZHKRhAsGJfCRtafkq42N0=;
 b=czGYTLZlBSS0MpLF+grC/baAZmnoaauH2+vYDEPDp1X4LQDp6Ut5KRonPkauh8QBTZ
 P/0bK23QJTUYqjE2IaQDExLdOJs8g7BI0BwP/VuaHlHEI3BNP9BMA6JTrGE867xhX2Fh
 QtHDMZuKGNgaJUbtw91tTcYhoJmQEAIOzxpAkVcoNtAKzMNTM/aE4ZeKiFrzTWYEnVF8
 OphFelD929rzV4CpSDjt4jVhsRw+MqMRzCvx/ZlCay7Av5kSrbyg+Lg3OsKkmUDLg7OY
 30ulL53oLZVbkZ9T3S4mIqbxlTirg638Wf9/BBYoU4vJ4MwQeKCbmG7xoQsx5NPAS9a/
 ZsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TZlXaJlwbJlKP9XZ2W5P2GZHKRhAsGJfCRtafkq42N0=;
 b=JrmuqLkvSmBh6AIMVHIWNmUp/jDhkGfJtJcTUzWplNoi8bQupRyK9btM77gCMyd0/C
 6A3hm7krbNv0h8hDXUt0l170NVVTztDWgtih4QtroRjc541h9DU26wVgIS5kBl89h/Go
 ntwaU8iW8BMmj8q1qoDICgVbmXOgghY2gxlLJru44sepWOnzdP51eHFu2ExWWIKwdnkR
 D4NJiHWB6qAutdPi9OvaTW9iXFRgMz9LA0FPG0zxr3Om1WOok8Tuvdc8WkIe7AMjLXoh
 ER4T/CVsv10qJgVr3xssprExWFoe5qyGoDhYYShHOePoHjDBldG37F+DnVw1cnSl9Mez
 8+2g==
X-Gm-Message-State: AOAM532k+bWmG0zHORnu6zOKd9O01SiGH2YdxS3qdbx60BoWXGFxN5+8
 lI2SLMMXyR8A5IFfqEFTRiVOwQ==
X-Google-Smtp-Source: ABdhPJw2+c2F6EluGW6TFgDdrC99bIRcb/YQdf85++cOTvPzkUrPy/YikduJ8dq2zCdYVyugwh49RQ==
X-Received: by 2002:a2e:9802:: with SMTP id a2mr3448720ljj.470.1629315286311; 
 Wed, 18 Aug 2021 12:34:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w16sm54372lfd.295.2021.08.18.12.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 12:34:45 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add support for alpha blending
 properties
To: abhinavk@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
References: <20210628191958.2754731-1-dmitry.baryshkov@linaro.org>
 <34ee522aa37172099dac9f686f0196ec@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <9584eaee-d3ed-041e-f473-06d9a1ddb0bc@linaro.org>
Date: Wed, 18 Aug 2021 22:34:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <34ee522aa37172099dac9f686f0196ec@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/08/2021 20:48, abhinavk@codeaurora.org wrote:
> On 2021-06-28 12:19, Dmitry Baryshkov wrote:
>> Add support for alpha blending properties. Setup the plane blend state
>> according to those properties.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I think this has already been picked up by Rob but just had a couple of 
> comments
> below.
> 
> Also, how has this been validated? On RB boards i dont think all the 
> paths get
> executed.

I've used modetest to set pixel blending properties. The results looked 
logical from my point of view.

> 
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 43 ++++++++++++++++-------
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++--
>>  2 files changed, 37 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 9a5c70c87cc8..768012243b44 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -30,12 +30,6 @@
>>  #include "dpu_core_perf.h"
>>  #include "dpu_trace.h"
>>
>> -#define DPU_DRM_BLEND_OP_NOT_DEFINED    0
>> -#define DPU_DRM_BLEND_OP_OPAQUE         1
>> -#define DPU_DRM_BLEND_OP_PREMULTIPLIED  2
>> -#define DPU_DRM_BLEND_OP_COVERAGE       3
>> -#define DPU_DRM_BLEND_OP_MAX            4
>> -
>>  /* layer mixer index on dpu_crtc */
>>  #define LEFT_MIXER 0
>>  #define RIGHT_MIXER 1
>> @@ -146,20 +140,43 @@ static void _dpu_crtc_setup_blend_cfg(struct
>> dpu_crtc_mixer *mixer,
>>  {
>>      struct dpu_hw_mixer *lm = mixer->hw_lm;
>>      uint32_t blend_op;
>> +    uint32_t fg_alpha, bg_alpha;
>>
>> -    /* default to opaque blending */
>> -    blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>> -        DPU_BLEND_BG_ALPHA_BG_CONST;
>> +    fg_alpha = pstate->base.alpha >> 8;
>> +    bg_alpha = 0xff - fg_alpha;
>>
>> -    if (format->alpha_enable) {
>> +    /* default to opaque blending */
>> +    if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
>> +        !format->alpha_enable) {
>> +        blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>> +            DPU_BLEND_BG_ALPHA_BG_CONST;
>> +    } else if (pstate->base.pixel_blend_mode == 
>> DRM_MODE_BLEND_PREMULTI) {
>> +        blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>> +            DPU_BLEND_BG_ALPHA_FG_PIXEL;
>> +        if (fg_alpha != 0xff) {
>> +            bg_alpha = fg_alpha;
>> +            blend_op |= DPU_BLEND_BG_MOD_ALPHA |
>> +                    DPU_BLEND_BG_INV_MOD_ALPHA;
>> +        } else {
>> +            blend_op |= DPU_BLEND_BG_INV_ALPHA;
>> +        }
>> +    } else {
>>          /* coverage blending */
>>          blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
>> -            DPU_BLEND_BG_ALPHA_FG_PIXEL |
>> -            DPU_BLEND_BG_INV_ALPHA;
>> +            DPU_BLEND_BG_ALPHA_FG_PIXEL;
>> +        if (fg_alpha != 0xff) {
>> +            bg_alpha = fg_alpha;
>> +            blend_op |= DPU_BLEND_FG_MOD_ALPHA |
>> +                    DPU_BLEND_FG_INV_MOD_ALPHA |
> comparing this with the blend rule downstream, is this inversion necessary?
> I only see below rule downstream:
> 
> 628             if (fg_alpha != 0xff) {
> 629                 bg_alpha = fg_alpha;
> 630                 blend_op |= SDE_BLEND_FG_MOD_ALPHA |
> 631                     SDE_BLEND_BG_MOD_ALPHA |
> 632                     SDE_BLEND_BG_INV_MOD_ALPHA;

I've also stumbled upon this for quite some time. If you check old 
kernel trees, you'll see that up to 4.9 there was an inversion. But 
during the import to 4.14 this line was silently removed. I suspect that 
it got lost because of some mistake during the import.

The same code (with the inversion) was present in the mdp5 driver.

Could you please check against the manual, how these bits should work?
See 
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-composition-properties 
for the expected formulas.

> 
>> +                    DPU_BLEND_BG_MOD_ALPHA |
>> +                    DPU_BLEND_BG_INV_MOD_ALPHA;
>> +        } else {
>> +            blend_op |= DPU_BLEND_BG_INV_ALPHA;
>> +        }
>>      }
>>
>>      lm->ops.setup_blend_config(lm, pstate->stage,
>> -                0xFF, 0, blend_op);
>> +                fg_alpha, bg_alpha, blend_op);
>>
>>      DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
>>            &format->base.pixel_format, format->alpha_enable, blend_op);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index ec4a6f04394a..c989621209aa 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1339,9 +1339,7 @@ static void dpu_plane_reset(struct drm_plane 
>> *plane)
>>          return;
>>      }
>>
>> -    pstate->base.plane = plane;
>> -
>> -    plane->state = &pstate->base;
>> +    __drm_atomic_helper_plane_reset(plane, &pstate->base);
>>  }
>>
>>  #ifdef CONFIG_DEBUG_FS
>> @@ -1647,6 +1645,12 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>      if (ret)
>>          DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>>
>> +    drm_plane_create_alpha_property(plane);
>> +    drm_plane_create_blend_mode_property(plane,
>> +            BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +            BIT(DRM_MODE_BLEND_PREMULTI) |
>> +            BIT(DRM_MODE_BLEND_COVERAGE));
>> +
>>      drm_plane_create_rotation_property(plane,
>>              DRM_MODE_ROTATE_0,
>>              DRM_MODE_ROTATE_0 |


-- 
With best wishes
Dmitry
