Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5988062B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 21:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F2E10E6AE;
	Tue, 19 Mar 2024 20:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wE5q9IA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760FE10E6AE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 20:43:57 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dcc7cdb3a98so5904242276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710881036; x=1711485836; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OeXdd6BoIpGck+XAlpFKofkTnIc6zBqulWBdd+v07Ic=;
 b=wE5q9IA2LauU7FVY8OCm7l9kGKSpxcyxCjsNTsFveUeMlMJxEa2QJZhc3vo6x1RrDz
 Tj9mSYZrqIw/S7NDqSdzrLFHXCbLFqa4tGkvxORXKzuRWEoF4IsQG10wfR8b68nDCftx
 +lp8EUSIe2b26fOwgtpBU7T2ZY4uFdUZ43QwzhDtzCVPnVwj4bxkC15mfTR8hKU/RSFa
 u2Zv222mgQLFwIF0Tw90x9zaFA+DimnlQ4cWN1T0AybL6HtCRm43USWlfzsXAcgqldEn
 mjarZIwh9J0TFE/x1WXIfyrRD3t/j/uu3JhzpSbb5tW47E8x+PcX93HJBiXRT5I3nj7G
 FPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710881036; x=1711485836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeXdd6BoIpGck+XAlpFKofkTnIc6zBqulWBdd+v07Ic=;
 b=PIqpZ/7fOZ8qb4DWJ1ajglJxP1GA0OeUqkwLybC+D8ZhALpmqT2JgS5YoCPpeQziFi
 Z8Jx85GG+O/hANp9bsEQpVTaQehrffGDjpm4QzAEviWe+4Cj5g7K3BKmU1kdw9i2C06f
 hM6sX4UhiKJyPJ7glNzxFxjRCgB4xq0qmevKNF9U0BpL4YzSR3i7zK2YHxnJ59CQ23tI
 9wSeKLH1UfXh5lzlomLglo3SiNDC9vDx9HLRK8CSqOXhkCNw9aB1kA+hoV0fm+b5QJOb
 p28svr8ZNSMGKN+QgPNCNYugdloaNo+bj5Jjg047euE3kz8M7LJd4Bk/aueoliivkBov
 LqHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjuqWJpxLainFDhH/H3LEw0DvI5npIVDV+rP8akSHQyBSqZ7TszuP2IsXBp0ewthADI2g0HRUyoyB1pmAiudoJOTbDlywjOBr3PhlxNqZh
X-Gm-Message-State: AOJu0Ywoiz3S93TINyY9sSLUZGDezrcYXlLhpulrIkayWkTIXMbh2Fhc
 80sYAFvIEX+JaLhNyLKIL16X7kVexOYFx4T+fz4YLckCqmn6JsxTcvb8Mhsn+jXs1+tLBfQCfAm
 5Vxkyo2txwxMsluHpLVg+QG6pfl1d9oQvJpTf1g==
X-Google-Smtp-Source: AGHT+IEGB9smWzSs4kyVjf1ngJ0sHXwF85dqOAOilm7NUBGQFDjvo6qUc1UKfbV7DzP5s2uNDsumhOKr73aIWIBS4y8=
X-Received: by 2002:a5b:c08:0:b0:dcb:e82c:f7f with SMTP id
 f8-20020a5b0c08000000b00dcbe82c0f7fmr13872142ybq.12.1710881036276; 
 Tue, 19 Mar 2024 13:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
 <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
In-Reply-To: <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 22:43:44 +0200
Message-ID: <CAA8EJprhgPheFq-xhAh54NkTTh5_BJk=bL1f94=hvsio6VUSQQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, 
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

On Tue, 19 Mar 2024 at 22:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> >
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
> >   1 file changed, 19 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 87b892069526..ff2942a6a678 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >               return;
> >       }
> >
> > -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -     if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -             perf->bw_ctl = 0;
> > -             perf->max_per_pipe_ib = 0;
> > -             perf->core_clk_rate = 0;
> > -     } else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -             perf->bw_ctl = core_perf->fix_core_ab_vote;
> > -             perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > -             perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > -     } else {
> > -             perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -             perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > -             perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > -     }
> > +     perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > +     perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > +     perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >
> >       DRM_DEBUG_ATOMIC(
> >               "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> > @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   {
> >       struct dpu_core_perf_params perf = { 0 };
> >       int i, ret = 0;
> > -     u64 avg_bw;
> > +     u32 avg_bw;
> > +     u32 peak_bw;
> >
> >       if (!kms->num_paths)
> >               return 0;
> >
> > -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +             avg_bw = 0;
> > +             peak_bw = 0;
> > +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +             avg_bw = kms->perf.fix_core_ab_vote;
> > +             peak_bw = kms->perf.fix_core_ib_vote;
> > +     } else {
> > +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>
> Where is this function dpu_core_perf_aggregate() defined? I dont see it
> in msm-next

In the previous patch.

>
> > +
> > +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +             peak_bw = perf.max_per_pipe_ib;
> > +     }
> >
> > -     avg_bw = perf.bw_ctl;
> > -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +     avg_bw /= kms->num_paths;
> >
> >       for (i = 0; i < kms->num_paths; i++)
> > -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >
> >       return ret;
> >   }
> >



-- 
With best wishes
Dmitry
