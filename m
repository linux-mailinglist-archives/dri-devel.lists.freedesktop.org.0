Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3A70CDA8
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049E10E3A1;
	Mon, 22 May 2023 22:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2383A10E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:18:02 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-561f10b6139so47416517b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684793881; x=1687385881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DeCmY/HBMITjyNBxp2qy2I9d6dc5OBlvJ0fpShZ8ExE=;
 b=tGMa1++9zeVUqt5/xI7scoDwkC9oXOHlv4cVNHuLT6zd+pCA9fY+u7Jcb+kMZOMnik
 v4l5uiw7gb8HAI/rHrjxc+XnA2umoaYrpEg/Rsxrfoqsc15d/N8Zv0m+uNJvi6NrJ4Bx
 7KkW6PKZ0dt+Lx+3OoihM1aOADJuU76bW0DffwlGjLL/OEiJGD9uIGbJ9OG1l6FY6xZM
 UCWZp27wNRQsHzGU5eo0uql4V4CYCKXzlRMmD23Y1sEc9PsKVhwizYtsuQ0qg2VOCmiw
 zQFdXcIjG8khBwas43pOOCH8L2Z6vwSTerFNKDsscUUsiMlMW/XjQFc9bRhNonOLMKTH
 B/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684793881; x=1687385881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DeCmY/HBMITjyNBxp2qy2I9d6dc5OBlvJ0fpShZ8ExE=;
 b=QkopXbB6wgDtQbLoJ1ADepu8Fq61DYCgWK3HM4yt4bZSZn04rcGcNszwZpmnzLOHrz
 58mkh7lDQn1OOLlgzMw0PQoWW2wcY0EWrg3yYZOUYdZtwbv8ppiae1fQ0hUIQ+v5B5EW
 OAbg9dU1d4wf8ihmh498PBGU1g4nMT5w86veG4a3+478XmOL7ysSbBJBOPLu+pYkfHLc
 yBRSXWjfXr55Q6MqlGcdas8aLocH6R4o69t5DiuBnUtTwAUCQ8+6fsfTY1vS/qMM6C1v
 GivKEKhcIEDhZGB9ddeVYlvK6WgGJs0rVCXJ+fkkyNTYPAhUYEXQnmBgZ6kFh19kM+oB
 HuoA==
X-Gm-Message-State: AC+VfDwhP82PU/5AyZV4ZJiKZOpMOp0TTUCtNjZ7S9cBOAZBVF9CysN9
 U2MZN3w0V4Hs9xTkbGFrWFDzZsnxBT4ClGn9QCs8Iw==
X-Google-Smtp-Source: ACHHUZ7neBJSxVucZXVZlBzDvxXsFNfIl+9F85NjZg+9HXn1wz9iM8cEE7v8NZYN2dxiwVZZmjg7jlIcG+z4p9fJ6G8=
X-Received: by 2002:a81:9c49:0:b0:559:f181:1a7d with SMTP id
 n9-20020a819c49000000b00559f1811a7dmr13155322ywa.27.1684793881088; Mon, 22
 May 2023 15:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-5-dmitry.baryshkov@linaro.org>
 <j4sprk5c7wiafq5w5246xab2qgrevyz26bcwukgdk7zcac4ylk@pyt4s2ms5fyk>
In-Reply-To: <j4sprk5c7wiafq5w5246xab2qgrevyz26bcwukgdk7zcac4ylk@pyt4s2ms5fyk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 01:17:50 +0300
Message-ID: <CAA8EJpr7caQsbUACsETQG6KTU=rzrXadBv-RHVTQD_zeY8x1Jg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/dpu: autodetect supported interrupts
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

On Tue, 23 May 2023 at 01:12, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-23 00:45:25, Dmitry Baryshkov wrote:
> > Declaring the mask of supported interrupts proved to be error-prone. It
> > is very easy to add a bit with no corresponding backing block or to miss
> > the INTF TE bit. Replace this with looping over the enabled INTF blocks
> > to setup the irq mask.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index a03d826bb9ad..01f2660a2354 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> >  {
> >       struct dpu_hw_intr *intr;
> >       int nirq = MDP_INTR_MAX * 32;
> > +     unsigned int i;
> >
> >       if (!addr || !m)
> >               return ERR_PTR(-EINVAL);
> > @@ -480,7 +481,24 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> >
> >       intr->total_irqs = nirq;
> >
> > -     intr->irq_mask = m->mdss_irqs;
> > +     intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
> > +                      BIT(MDP_SSPP_TOP0_INTR2) |
> > +                      BIT(MDP_SSPP_TOP0_HIST_INTR);
> > +     for (i = 0; i < m->intf_count; i++) {
> > +             const struct dpu_intf_cfg *intf = &m->intf[i];
> > +
> > +             if (intf->type == INTF_NONE)
> > +                     continue;
> > +
> > +             intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
> > +
> > +             if (test_bit(DPU_INTF_TE, &intf->features)) {
> > +                     unsigned idx = MDP_INTFn_TEAR_INTR(intf->id);
> > +
> > +                     if (!WARN_ON(idx == -1))
>
> We don't need to validate the catalog?  But warning users about this
> (and accidentally turning on all interrupt bits hiding the issue anyway)
> is a nice side effect though, as you showed it was already going wrong
> in patch 1/6.
>
> OTOH you might have inlined the macro and provided a more useful warning
> message (DPU_INTF_TE can only be present on INTF1/2)... and then one
> could assert on INTF_DSI etc etc etc...

I'd prefer to keep it, as a safeguard for submission being in
progress, newer generations gaining TE blocks on other interfaces,
etc.
I was selecting between having explicit intf->id == INTF_1 || ==
INTF_2 condition and this kind of macro.

>
> - Marijn
>
> > +                             intr->irq_mask |= BIT(idx);
> > +             }
> > +     }
> >
> >       spin_lock_init(&intr->irq_lock);
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > index f329d6d7f646..f0b92c9e3b09 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > @@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
> >       MDP_SSPP_TOP0_INTR,
> >       MDP_SSPP_TOP0_INTR2,
> >       MDP_SSPP_TOP0_HIST_INTR,
> > +     /* All MDP_INTFn_INTR should come sequentially */
> >       MDP_INTF0_INTR,
> >       MDP_INTF1_INTR,
> >       MDP_INTF2_INTR,
> > @@ -33,6 +34,11 @@ enum dpu_hw_intr_reg {
> >       MDP_INTR_MAX,
> >  };
> >
> > +#define MDP_INTFn_INTR(intf) (MDP_INTF0_INTR + (intf - INTF_0))
> > +#define MDP_INTFn_TEAR_INTR(intf) (intf == INTF_1 ? MDP_INTF1_TEAR_INTR : \
> > +                                intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
> > +                                -1)
> > +
> >  /* compatibility */
> >  #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
> >  #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
