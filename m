Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD0B934494
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 00:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC6310E46C;
	Wed, 17 Jul 2024 22:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EaicEHiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E7810E46A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 22:09:17 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-66498fd4f91so1077517b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721254156; x=1721858956; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bsVDKWypgLDT5YDLNjnV8mTYT3kKNXub5wdl2QEBMpM=;
 b=EaicEHiSZcutKSMLBc+/rTd/dBOrMCIFBUYlmpo1WbuF840lfA+mIxUWNg5l+lvk7C
 xgO3Oo+SQyEJ/YokcUGaRiVY9RWpSueMq+o95rtQIcH1jKAuQXTw2qUxty03B2kTdwSX
 B94p9WDXTEMqagvYRksmdkX167MzCbxdsmt+8VfNS79NWPyIZlPwj/N4C3Dkt27oyzbe
 /815qBfTqPBsX84NJloXm23aMe9fcL2HwUVMMdSfNcuI0YpejTvaA051OfpCSmA+MpcP
 r4TvChps3ml2tl2k6gOHqAlJ0FNFlP6Y9iqWXcXmJuvpve8KmoY4l6S7oT/maREdjiA+
 sEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721254156; x=1721858956;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsVDKWypgLDT5YDLNjnV8mTYT3kKNXub5wdl2QEBMpM=;
 b=unEzVh0zVBiI8mic+qEs01dW/i68XhaiNc+WSAbbcG8NbErP60dOJp1xGcOiPlWaVc
 N82EegvMZ1Wc6EhcHl1vhdc6Y2Jwyo3mhUS1kOIMzaf66allaQfqX4lxmWQLoW7rWZBQ
 z3BN9PuCC0qfI927DK/JjJJav5NfvD2cSd8NvhTwNk0SXT3npV9dAELOwFp0mF2n71sr
 PlhbZgL66ej5Pl0umyWVJnQIUazx2q3I/CeQA2X5M1bm0GRPY64kpWHw/gRa9TaX8SKa
 Vd5Qgw2L3VRkRTU4azTgIxpph9y3juMFmRscUmfjoBWfe6V9Lqz8xi3YScyQxVxQFHG2
 S7hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjrTtVBVhFuNLp/YHOZ+XLgSbiwg+niveygFzrK5XG+D+lsUARm9V+r1paSbOIjOcb0y1gm/yVGqkHDc5c5wcmQDLPPkoL2jEQ734Pi5Rn
X-Gm-Message-State: AOJu0YwcgC1WvPv9BdPXA0e/YeTANGg5vifPJO0ufJI4AQ5bvw/U1t2s
 XIhb1cD3A0lkwRh+zojF9uyjkAfpq0k2LnYR4aN08ULDx5s/9gJX9Tw5NI/tdDbOmepT9c+z9E2
 wysDEwS0mOzRtcnLuH6NYo3fI+yboDilDXrJH8Q==
X-Google-Smtp-Source: AGHT+IGp53w5JFJXinLfxngAAOC4Se8zd8clOSSE5HSo6ISXAyhqoYmBo0Hc7/CZzmDiE/S24AngXbmiTkF8yavGN3A=
X-Received: by 2002:a05:690c:4d48:b0:65f:7cee:43b with SMTP id
 00721157ae682-664fe071e10mr34429437b3.19.1721254155923; Wed, 17 Jul 2024
 15:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-8-501d984d634f@linaro.org>
 <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
In-Reply-To: <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jul 2024 01:09:04 +0300
Message-ID: <CAA8EJppGC_u-79YyXqXEeQAc9oBUOm-+ZuUDu_3b8MWnVVAOxg@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] drm/msm/dpu: drop msm_format from struct
 dpu_hw_fmt_layout
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 17 Jul 2024 at 23:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> > The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
> > sizes and pitches. Drop format field from this structure as it's not a
> Missing closing brace ")" here?
>
> > part of the data layout.
> >
>
> Its a bit subjective IMO whether you consider format as part of hardware
> data layout or not. Registers do have format bitfields too so I am
> somewhat unsure if this change is really needed.

It's not a part of the data buffer layout (num_planes, sizes, pitches
and offsets) - the items that are defined by struct dpu_hw_fmt_layout.
As such there is no need to store it in the structure. When necessary
we can always get it from the framebuffer itself.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 31 +++++++---------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 ++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
> >   5 files changed, 25 insertions(+), 38 deletions(-)
> >
>
> <Snip>
>
> > @@ -318,15 +318,10 @@ static void dpu_encoder_phys_wb_setup(
> >   {
> >       struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
> >       struct drm_display_mode mode = phys_enc->cached_mode;
> > -     struct drm_framebuffer *fb = NULL;
> >       struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> > -     struct drm_writeback_job *wb_job;
> >       const struct msm_format *format;
> > -     const struct msm_format *dpu_fmt;
> >
> > -     wb_job = wb_enc->wb_job;
> >       format = msm_framebuffer_format(wb_enc->wb_job->fb);
> > -     dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
> >
>
> This is interesting. I wonder why I just didnt use format directly that
> time itself :)
>
> Maybe I was thinking that mdp_get_format() will also match the modifiers
> and return the corresponding msm_format.
>
> >       DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
> >                       hw_wb->idx - WB_0, mode.name,
> > @@ -338,9 +333,9 @@ static void dpu_encoder_phys_wb_setup(
> >
> >       dpu_encoder_phys_wb_set_qos(phys_enc);
> >
> > -     dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
> > +     dpu_encoder_phys_wb_setup_fb(phys_enc, format);
> >
> > -     dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
> > +     dpu_encoder_helper_phys_setup_cdm(phys_enc, format, CDM_CDWN_OUTPUT_WB);
> >
> >       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >   }
> > @@ -584,14 +579,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
> >
> >       format = msm_framebuffer_format(job->fb);
> >
> > -     wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
> > -                                          format->pixel_format, job->fb->modifier);
> > -     if (!wb_cfg->dest.format) {
> > -             /* this error should be detected during atomic_check */
> > -             DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
> > -             return;
> > -     }
> > -
> >       ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
> >       if (ret) {
> >               DPU_DEBUG("failed to populate layout %d\n", ret);



-- 
With best wishes
Dmitry
