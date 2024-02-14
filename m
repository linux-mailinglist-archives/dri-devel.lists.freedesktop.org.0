Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43606855323
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 20:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DCF10E196;
	Wed, 14 Feb 2024 19:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z0znwNTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D30A10E212
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 19:20:28 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcc4de7d901so25190276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 11:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707938427; x=1708543227; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B73bS06AIkXzjnqoVP2qP94tAmB+abCne/7xyPl1XbQ=;
 b=z0znwNTsGAz1JHZJhOVjE7O0cwLaigYfRmB3Emmb0C21EONoqUbI0ncTIjewV2E7Gr
 n/BZY+I0la9PDHlEvQMtC9P3ffqym5fLBG24aRjQ290oCmo8hs6jLezvcIbZ5ezRFcVO
 efMHQnO3xRQRPqyKOIOebIY4kOON84k27YkUSC9XYjpaUt8S0Dws8IOBoedEhJMsDygy
 5U0etcXFh36Ch0yBTjecY41z2w0bNUdcczB4PtQBiveNpLmA0fEIdL2cI1MA7rObkt78
 pfnQ+JkuaIfg7cnZ9cWcKcFJ4gf7JLYo6U/Gg/gBG5HiGtJTdQ2BhaqhvWhzUezl+2Nt
 GLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707938427; x=1708543227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B73bS06AIkXzjnqoVP2qP94tAmB+abCne/7xyPl1XbQ=;
 b=IKnawqj+1ILrqIdd5IHJCye00ve1JtSCHYbL/L7r6MHtN1QYrKjyBTj5sR5a2GQTUz
 TaUtaQxG/PTOZdytTiIkR1PkDmcynTFa8Eh7z25b0kX6L+XrQedl6tfcTdy0UWxuMpAb
 kx/8R/GCOXZM7GrhjFHeSyp1yh1ukwUYe4JVaQJ8v/kVuJ0wkJNGtzxxzFuwD8v4Pmf3
 NwYhOvLkIgGQsCOp5YLBXNMRuPFw1ohKxu2/+7n4XrMKolKv471/srIoPqM32QjSAEDC
 KUsmFMA5YI/7pZDAWs6M82XIZ2mS+vafAgyNCjMrI5ehZyqW/vSHYKCCVRtfeb/sTcJh
 LDjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTUE4GTLldrYr6NTUMt/OoJO3sB/J7RGkwO/PEMVsqBEXlc89wDyE0+RvBhHl1PlGHtFA1THARtpoVzfnWjm8KM3lROaO5ZEQuu+Vyp7d+
X-Gm-Message-State: AOJu0Yy7XLKR9tTvDW14fZ6Wrigse5fNuM3l2hzItyYV/e7hFlN4U2G5
 Md3AZROYXy8S5mTs+62iFUwebq1yF9HSitt1qcCNbefZKLJFDx/etXC8r4Hpkc7GOueTX5DOIqP
 o5CjcBYwMcclyJm4u8VpFXywGCcDunlo8bQQkvQ==
X-Google-Smtp-Source: AGHT+IE9s7xRxFgyDDO/OOi6qfcHjatwcC09w9tCG2wbS1m6yq9DQHisEE7YMYJmWehqqbTOKLKef79RBRk0hbjJOXU=
X-Received: by 2002:a25:4156:0:b0:dbd:5bfa:9681 with SMTP id
 o83-20020a254156000000b00dbd5bfa9681mr3218536yba.37.1707938427173; Wed, 14
 Feb 2024 11:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
 <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
In-Reply-To: <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:20:16 +0200
Message-ID: <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
> > We have several reports of vblank timeout messages. However after some
> > debugging it was found that there might be different causes to that.
> > To allow us to identify the DPU block that gets stuck, include the
> > actual CTL_FLUSH value into the timeout message and trigger the devcore
> > snapshot capture.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Added a call to msm_disp_snapshot_state() to trigger devcore dump
> >    (Abhinav)
> > - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index d0f56c5c4cce..a8d6165b3c0a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >               (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >               msecs_to_jiffies(50));
> >       if (ret <= 0) {
> > -             DPU_ERROR("vblank timeout\n");
> > +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> > +             msm_disp_snapshot_state(phys_enc->parent->dev);
>
>
> There is no rate limiting in this piece of code unfortunately. So this
> will flood the number of snapshots.

Well... Yes and no. The devcoredump will destroy other snapshots if
there is a pending one. So only the console will be flooded and only
in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.

>
> Short-term solution is you can go with a vblank_timeout_cnt and reset it
> in the enable() like other similar error counters.
>
> long-term solution is we need to centralize these error locations to one
> single dpu_encoder_error_handler() with a single counter and the error
> handler will print out the error code along with the snapshot instead of
> the snapshot being called from all over the place.
>
>
>
> >               return -ETIMEDOUT;
> >       }
> >
> >
> > ---
> > base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
> > change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063
> >
> > Best regards,



-- 
With best wishes
Dmitry
