Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF596F25EA
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 20:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC0710E184;
	Sat, 29 Apr 2023 18:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56FD10E176
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 18:48:46 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-55a00da4e53so4257957b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 11:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682794125; x=1685386125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9WfKV3S+55vdcT7DtgnFzqVHeEOhgU77sHHynaR2lMs=;
 b=hCwQ/F5YCZSPVvIc1Cr7d0P8mi8lj8uXLyxqj2mL/vW/vTIYSqH66Pzk+nnmmDBGK4
 w5yTwl5VorpSq0brQinYfkrdFWrrg3MGI/WFvJhAJSo+gpROozaAeSQy4GPiMXFTGjBF
 7ZPhGP5tforZ8IbKV15oziqYFX1WfXk75KJBV6fMArXDEW57XpG45xV5mSY3N31ewtk0
 iP/OyZOMiNwmdj8EYMqCFcdl5pJ3m8C4yI+WIuSFHeUx0wYAzUdZBLxBIy+nPH49dzor
 GUglBd57/c61nukLWJeuH3894myn5fc1r4Peds0cw8ohbr/bR2uTqpwFdhwmiIgcyT2b
 g0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682794125; x=1685386125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9WfKV3S+55vdcT7DtgnFzqVHeEOhgU77sHHynaR2lMs=;
 b=Jh+C2oRM/RC6Y2g6T3ksOQ69PNhRw5KXppk+guVUBrMZNqF4zBd0cdZuoJzlgeD7xV
 Moeii6aEYIoA55rwc+qc7DL49Eb8uVTovMk34QoXpJRHr8jKWQ4RCcjLIkTx8SqvEEtL
 nBQzapup8UEcDG+/ncYBXIEYVSAlxIblJnQZ6N+dm1VuWaG7bSpLc5yjSJvHUMcgWPN0
 ZYnq4EmkYDXZyvvLVFWWoCOwjpR2es84J3ztn5VPyRlrl/KiGV1+Ygu5T5IBlfRGC0Hy
 s7i5qyib5400jnS1MWFme/J72t3AKWpFKdNSMbXPQFE6xOioEbU0CNlj+7cvXobkz9qJ
 xJdQ==
X-Gm-Message-State: AC+VfDwXND4dthKZ9HEdSgrA8H9XFDbygT36884gDbsho6wUV1KeiQkQ
 WF5wO/r+F+LpPoag9byyUn0mJvtym09mViYrXOzreVQSM0fq93HAnYo=
X-Google-Smtp-Source: ACHHUZ7Ni3R6uBUZ2y7fEdCQYDJn5tDjdGp4SbVgrHBV3wvqVSFqfxcMe3nbhO8E/PHsJrmtcrw7zdS1ToHqUBKn3ZI=
X-Received: by 2002:a81:8357:0:b0:54f:bb34:1a0 with SMTP id
 t84-20020a818357000000b0054fbb3401a0mr8510109ywf.33.1682794125676; Sat, 29
 Apr 2023 11:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
 <085c3b3a-1a29-7082-934d-497be5b050fd@quicinc.com>
 <5fbf2ba1-f8fd-1373-55f2-4eb3789bc5e7@linaro.org>
 <1c0f5c9d-f38e-a008-b950-e85a5eb94633@quicinc.com>
In-Reply-To: <1c0f5c9d-f38e-a008-b950-e85a5eb94633@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 29 Apr 2023 21:48:34 +0300
Message-ID: <CAA8EJpotuzEOWsrJcyjn+tFTed7KSamwbRm0JnQWqrAwXmr_LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused SSPP sub-block information
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Apr 2023 at 11:46, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/28/2023 9:30 PM, Dmitry Baryshkov wrote:
> > On 29/04/2023 07:29, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/28/2023 7:42 PM, Dmitry Baryshkov wrote:
> >>> The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
> >>> Drop corresponding definitions.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
> >>>   1 file changed, 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> index 3e92c2c66716..db6488a6929d 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >>> @@ -384,10 +384,6 @@ struct dpu_caps {
> >>>    * @qseed_ver: qseed version
> >>>    * @scaler_blk:
> >>>    * @csc_blk:
> >>> - * @hsic:
> >>> - * @memcolor:
> >>> - * @pcc_blk:
> >>> - * @igc_blk:
> >>>    * @format_list: Pointer to list of supported formats
> >>>    * @num_formats: Number of supported formats
> >>>    * @virt_format_list: Pointer to list of supported formats for
> >>> virtual planes
> >>> @@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
> >>>       u32 qseed_ver;
> >>>       struct dpu_scaler_blk scaler_blk;
> >>>       struct dpu_pp_blk csc_blk;
> >>> -    struct dpu_pp_blk hsic_blk;
> >>> -    struct dpu_pp_blk memcolor_blk;
> >>> -    struct dpu_pp_blk pcc_blk;
> >>> -    struct dpu_pp_blk igc_blk;
> >>
> >> I have included IGC in this patch
> >> https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1
> >>
> >> So that one can be dropped from this patch?
> >
> > It will get dropped while applying because of the conflict.
> >
>
> Knowing that its going to conflict, why not fix one of the patches now,
> preferably this one since I was handling GC/IGC together in that series.

Because it requires me to pull in additional patches into the dev
branch. No problem, I'll do it.

>
> >>
> >> Rest is fine.
> >>
> >>>       const u32 *format_list;
> >>>       u32 num_formats;
> >



-- 
With best wishes
Dmitry
