Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3CC715190
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8438F89C83;
	Mon, 29 May 2023 22:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242510E305
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 22:13:24 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-561b7729a12so67728597b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685398403; x=1687990403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kOr0DX6iLxxYAuILB8BTJpX8Pk1Fui7+IF7W6JxB0DE=;
 b=yFvxlIe0WMww2gewXbt456IW5lVKafrqLCQcAIYIpLHr1Qcq5iemMXYe6QVfVFaEzM
 YyFz2vls/Ty5U++b4Nwtv+pPmzoQU6uavXCLJM+ctxVKVivUHOKx1DrfDOSvvKpJJ934
 98KiV7kNqysQeS1c41OET0HopeD/2bFmh8MgMbbavuslyBShzZ+hzw7KOm9nVgtEzdAA
 L39jnx8VuFKcxZO6SO5jivnxKyhnmNMUj5VD3dsQKEgl4kvue2LERMyV3Zl5bidOmWV5
 K389aa6u7YTVKsLYCQ20KAYP8WncegH5mq1tajNBeDdsiuoQko3lLa28+HucVmWiRqJ1
 FHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685398403; x=1687990403;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kOr0DX6iLxxYAuILB8BTJpX8Pk1Fui7+IF7W6JxB0DE=;
 b=j6lsW/iqUPr/m2JKECbykJz0WcnvbcAJ2b3okJuXio0hlXCJLZiYuH7WqTyTyNeNG1
 eHoDfY4pLvCF2Ny4HY3L4i19dTfa07C5rZrGbnfyh3oQ8H5tYqiPZ0Imp9LjGrxPr7p2
 nuZvLcrOLe3YK0RfYUB6WgA/xWE1dnlX9q/ADFiSN6k75+TEADI3Byi3k2Haergf9dSp
 /5ZdXYemp/HOW7jZwPvpY7vvHO98R2yra8fMPGwUwDVkum3yps22UXQjA300m35jxO9P
 Ji5C1LSx7Hu8WSMVcs4wSyWk1QwDp9yNUiQ/HgEkllxraI5v+zP1iO0m4OlILBN1SGTS
 aZXQ==
X-Gm-Message-State: AC+VfDxZcAJZ6KsVxYp4AsDE/O+f+HMS2aA86988bTYA2Hss/of4MMZ0
 tCLmG1sb3tXJIEZg8QWMSVk88EHDSgpVIaivX89wYw==
X-Google-Smtp-Source: ACHHUZ7vUjFcyiefKEHtkKZuqT1Jg5guyvCgl6QIHZzhD4Haicd2lKi39F6CBiMxb+/0CcothL7GC4QeobfxTCkmnHs=
X-Received: by 2002:a81:5287:0:b0:55a:3502:d2ca with SMTP id
 g129-20020a815287000000b0055a3502d2camr514571ywb.13.1685398403688; Mon, 29
 May 2023 15:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230526090945.439639-1-dmitry.baryshkov@linaro.org>
 <h33hhvvlwq67uooelhm5wot7hx5utzegxtq3wu25rfrcrjx45n@dznkc26cxz23>
In-Reply-To: <h33hhvvlwq67uooelhm5wot7hx5utzegxtq3wu25rfrcrjx45n@dznkc26cxz23>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 May 2023 01:13:12 +0300
Message-ID: <CAA8EJpq6cse-cxDSv+a1A0Pn4p0o-a1NO9+3vCDROnkc6gJT2A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 May 2023 at 00:46, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-26 12:09:45, Dmitry Baryshkov wrote:
> > Currently the driver passes the PINGPONG index to
> > dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> > flag to tell whether INTF should be bound or unbound. Simplify this by
> > passing PINGPONG_NONE in case of unbinding and drop the flag completely.
>
> Perhaps worth mentioning that this flag was only recently introduced
> (and link to it as a dependency under the cut),

The patch is already a part of linux-next. This is the usual boundary
of skipping the dependencies.

>  as well as explain that
> the passed `enum dpu_pingpong` value is bogus when enable=false because
> it is not part of the value written to the register for the
> "unbind/disable" case?

Good suggestion.

>  See for example the wording I suggested on the
> patch that introduces and uses PINGPONG_NONE.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
>
> How about appending/sending another patch that drops this from
> dpu_hw_wb.c as well?

Ack, nice catch.

>
> >  5 files changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index ebe34eda6e50..7fd3a13ac226 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2102,8 +2102,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> >               for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >                       if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> >                               phys_enc->hw_intf->ops.bind_pingpong_blk(
> > -                                             dpu_enc->phys_encs[i]->hw_intf, false,
> > -                                             dpu_enc->phys_encs[i]->hw_pp->idx);
> > +                                             dpu_enc->phys_encs[i]->hw_intf,
> > +                                             PINGPONG_NONE);
> >
> >                       /* mark INTF flush as pending */
> >                       if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 1a4c20f02312..3130c86a32cc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >       if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> >               phys_enc->hw_intf->ops.bind_pingpong_blk(
> >                               phys_enc->hw_intf,
> > -                             true,
> >                               phys_enc->hw_pp->idx);
> >
> >       if (phys_enc->hw_intf->ops.enable_compression)
> > @@ -556,8 +555,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
> >       if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
> >               phys_enc->hw_intf->ops.bind_pingpong_blk(
> >                               phys_enc->hw_intf,
> > -                             false,
> > -                             phys_enc->hw_pp->idx);
> > +                             PINGPONG_NONE);
>
> Is there also a cleanup state where hw_pp is assigned back to NULL?

No. None of the encoder resources are reassigned to NULL. I will tend
this topic during vN of resource allocation rework.

>
> >               ctl = phys_enc->hw_ctl;
> >               ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 3a374292f311..220020273304 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -287,7 +287,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
> >       if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> >               phys_enc->hw_intf->ops.bind_pingpong_blk(
> >                               phys_enc->hw_intf,
> > -                             true,
> >                               phys_enc->hw_pp->idx);
> >
> >       if (phys_enc->hw_pp->merge_3d)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > index a2486f99d3c2..918d154848b9 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -268,7 +268,6 @@ static void dpu_hw_intf_setup_prg_fetch(
> >
> >  static void dpu_hw_intf_bind_pingpong_blk(
> >               struct dpu_hw_intf *intf,
> > -             bool enable,
> >               const enum dpu_pingpong pp)
> >  {
> >       struct dpu_hw_blk_reg_map *c = &intf->hw;
> > @@ -277,7 +276,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
> >       mux_cfg = DPU_REG_READ(c, INTF_MUX);
> >       mux_cfg &= ~0xf;
> >
> > -     if (enable)
> > +     if (pp != PINGPONG_NONE)
>
> Kuogee just used `if (pp)`, I think we should stay consistent.

Sure. The rest of the driver usually compares to foo_NONE.

>
> - Marijn
>
> >               mux_cfg |= (pp - PINGPONG_0) & 0x7;
> >       else
> >               mux_cfg |= 0xf;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > index 72fe907729f1..e2d15e89880d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > @@ -89,7 +89,6 @@ struct dpu_hw_intf_ops {
> >       u32 (*get_line_count)(struct dpu_hw_intf *intf);
> >
> >       void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
> > -                     bool enable,
> >                       const enum dpu_pingpong pp);
> >       void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
> >       int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
> > --
> > 2.39.2


-- 
With best wishes
Dmitry
