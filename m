Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E3880742
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 23:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB8610F3F9;
	Tue, 19 Mar 2024 22:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nxClSLpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE1D10F40A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 22:26:09 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-609408d4b31so59535487b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710887168; x=1711491968; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yXTlJKil58FLSsQmNZkGCIWPoB5207eTAoC7ZhI4KLQ=;
 b=nxClSLpaQlr3ZiUCgQMLCRkEtHhp9VclL07OyRpqc3+A52miavKWILYqADCJ8lP3h8
 THkU+Mxt5uJJYf/ZKbIFkqpU1rYH6qDN8YBxEYW2t6+U4UGnB9sHV4K0sxzyV8PiSX0a
 NctUOjFDklJNFmJ+1T69Axc546JPVsZ8SE/aGhEK8yAXOr2LhmNiNJa5NiVvKEACz6PE
 z5DtsWNNjbc7fohfoJjVT0XrtUqRwCZA0ytCr0S14qUHlZ6I+dNv874LBV1f3ZpAX9hF
 rEex0rw+DSwB1xnmRcnmQk+K9HSmdpoh45+sehE0BbZEddb/QoXDO8tDZ57Kw1oSlK2S
 1YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710887168; x=1711491968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yXTlJKil58FLSsQmNZkGCIWPoB5207eTAoC7ZhI4KLQ=;
 b=MPQ7dzd5tTSHV72K/sllD8k3iZ+2H9ywtx5vHiWTI0p6JgfiRkMzwQnODjiMJVZnLL
 dXypYfxgQxIpB7+BO41XtHClbANXaDnZamTcfnRys2cnjmDKUdXLv7Gw5v00u7r5m1fp
 V1KrbqfxvN2HouqoQlsBZ5ZMivJvSZXSh9SCBQZGKDRuXXuXjsSIINI0P+QLSBvQcHwh
 D+n7qz8lYeD44kQGwTMdkfYbS/fb6Og7trh6EE2ojKH681zU3GRYpriYO8k09lpLaW/U
 rE36jjGKrrZ2iXFD1iZJ/tejhDzNdea3NOoDRYuPTk7eyF5RLEArYVWsyki31OP6YqOx
 /uBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0l7Iumjb2k8bhTbOp/pj+UxBX+MbenU+vcozEJ3HBQV8+unrylGDOWL2ZaGL8NAjFDn1yM636o6tebFw5ADLXFBwdFCtQwR9M7g2XZ/s0
X-Gm-Message-State: AOJu0YyKGw6KBgeF2qIRLZmvQPsV3G0lNRUKwIOy2snWxxHjItzrrOZd
 Zz/2bgTptHHj1Cdmz8/DqWOxbcTXLe44Y4GEgB9iZIc4Di1vFPMVkz2OGPT9eKt+Nv4nSZRGfV0
 cUuDcwt0R12uBSXMQtt4h1SVTrF49tIe4roEOjg==
X-Google-Smtp-Source: AGHT+IFyemvcLV2eFXzf6A6bMavLU7dQAVLvAK++1A5yltvDjNRHmXVwK08p4b/edHFxvTO+wQKEMbnd38lt4KQ6gxs=
X-Received: by 2002:a0d:d84f:0:b0:60a:35f:e92a with SMTP id
 a76-20020a0dd84f000000b0060a035fe92amr406778ywe.10.1710887168137; Tue, 19 Mar
 2024 15:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
 <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
 <CAA8EJprhgPheFq-xhAh54NkTTh5_BJk=bL1f94=hvsio6VUSQQ@mail.gmail.com>
 <949d04c1-910d-04e0-14f2-1373c1312daf@quicinc.com>
In-Reply-To: <949d04c1-910d-04e0-14f2-1373c1312daf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Mar 2024 00:25:57 +0200
Message-ID: <CAA8EJppVbnB+P4sYWXJZ4=1_yb2jQhPjC1x6w1zEJQp4Cnj4-A@mail.gmail.com>
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

On Tue, 19 Mar 2024 at 23:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/19/2024 1:43 PM, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 22:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> >>> Move perf mode handling for the bandwidth to
> >>> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> >>> and then aggregating known values.
> >>>
> >>> Note, this changes the fix_core_ab_vote. Previously it would be
> >>> multiplied per the CRTC number, now it will be used directly for
> >>> interconnect voting.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
> >>>    1 file changed, 19 insertions(+), 20 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> index 87b892069526..ff2942a6a678 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>> @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >>>                return;
> >>>        }
> >>>
> >>> -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> >>> -
> >>> -     if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> >>> -             perf->bw_ctl = 0;
> >>> -             perf->max_per_pipe_ib = 0;
> >>> -             perf->core_clk_rate = 0;
> >>> -     } else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> >>> -             perf->bw_ctl = core_perf->fix_core_ab_vote;
> >>> -             perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> >>> -             perf->core_clk_rate = core_perf->fix_core_clk_rate;
> >>> -     } else {
> >>> -             perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> >>> -             perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> >>> -             perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >>> -     }
> >>> +     perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> >>> +     perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> >>> +     perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >>>
> >>>        DRM_DEBUG_ATOMIC(
> >>>                "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> >>> @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >>>    {
> >>>        struct dpu_core_perf_params perf = { 0 };
> >>>        int i, ret = 0;
> >>> -     u64 avg_bw;
> >>> +     u32 avg_bw;
> >>> +     u32 peak_bw;
>
> Why were avg_bw and peak_bw values brought down to u32?
>
> I think we might go higher so u64 was better.

First of all, icc_set_bw takes u32, not u64. The unit is 1000 bps, not
1 bps, so sensible values fit into u32.

>
> >>>
> >>>        if (!kms->num_paths)
> >>>                return 0;
> >>>
> >>> -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >>> +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> >>> +             avg_bw = 0;
> >>> +             peak_bw = 0;
> >>> +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> >>> +             avg_bw = kms->perf.fix_core_ab_vote;
> >>> +             peak_bw = kms->perf.fix_core_ib_vote;
>
> Instead of changing the value of avg_bw like mentioned in commit text,
> why cant we do avg_bw = fix_core_ab * (drm_mode_config::num_crtc);
>
> Any reason you want to change it from "per CRTC fixed" to just "fixed"?
>
> Now, the user who wants to hard-code this also needs to first account
> for number of CRTCs from the dri state and then program the fixed value
> using debugfs. Thats not convenient.

Different CRTCs have different bandwidth values, so programming as
value-per-CRTC is not efficient. In the end we care for the overall
bandwidth, so one has to calculate the expected value then divide it
per num_crtc.

>
> >>> +     } else {
> >>> +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> >>
> >> Where is this function dpu_core_perf_aggregate() defined? I dont see it
> >> in msm-next
> >
> > In the previous patch.
> >
>
> Sorry, my bad. I thought it had a different name in the prev patch :/

No problems.

>
>
> >>
> >>> +
> >>> +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> >>> +             peak_bw = perf.max_per_pipe_ib;
> >>> +     }
> >>>
> >>> -     avg_bw = perf.bw_ctl;
> >>> -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> >>> +     avg_bw /= kms->num_paths;
> >>>
>
> >>>        for (i = 0; i < kms->num_paths; i++)
> >>> -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> >>> +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >>>
> >>>        return ret;
> >>>    }
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
