Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEBE3ABE1E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 23:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A4E6E1F1;
	Thu, 17 Jun 2021 21:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C766E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 21:28:58 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id im10so2513635qvb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 14:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cY6DBYqwyd/RoTCTULd1X1DyaC8gvhY3fGd6cSj0414=;
 b=I+fZckvUbZ509+hKbmapTBXgleoxn9N0Cr0kIO6TZZzCeS3y8o9l6t3XiFvBS51xH5
 cfi/vyJ/FVGWf70SlBAwOcuVwr2zVgOSvelJMw6rG0MizRMvlRl79VEGKODiDz+n/7ou
 xOP44enxNgM0tdurSnosCqtqta+u9zyLqMcQ3EsTBLUWoXvFeJC34kiaO7QBA4cBTwUH
 vpBMOp37YrUKOVQ5kEHWD9FMmtXbAUru/y1oo+EIoXJl6uZ0zwe8c++7iPIfdy4oGHVS
 IGf0zHb8Xah4CLcFEA5okKsBjmTbEVYYvFVuHbYr9nrDzhU65sjFA+yzaDn+tijBUUoW
 6iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cY6DBYqwyd/RoTCTULd1X1DyaC8gvhY3fGd6cSj0414=;
 b=SIq+WwMATrWPavu60Vrqp33RaajIX+Tw7F33JHtgrofQKDo7u7KPVsaW7/3TRbbHx7
 9hsTQFgRsgJtag5mz9LjjHYlvgUfixtJzvp3hrVaTi4YDOLZAtbuRJUPzw09CPz7fz4n
 RAbd0MtkdGcURPpznYBpIXIFbRYM0eaGc3YLS9jRWr3vveL1r52IZ1xL3s1F0T+P42xi
 5gnaQuI2iEaUFBGYcjMP3G80o2bTf4OCDr1Z2OCsorkkuJyz3LcsTWy24ndiH5VQNg1J
 2xf1Gcld6CJSbEtrWDXeWtEXWrctqOIS9EyVwMi86UdWOxeFBrATWYJA/VmcGx6aufWr
 NjPQ==
X-Gm-Message-State: AOAM531Jr7CGgYolqhd8uVpuq7g7TtLeWo9vj/ZSf8XQhC0CCsCIb0S/
 dE6y1Rf/gapndhs8kmqshcLQ9Oq8LYDGEQ0MaZkMWw==
X-Google-Smtp-Source: ABdhPJy7KOy1qicXWVGVe+L7Up9CZ1kT5GYPiEy80Cs86lw6Tgm49qVPi2xC6z7yy5JLSl2h374g6ri6EyImJowND+I=
X-Received: by 2002:ad4:55eb:: with SMTP id bu11mr2090631qvb.2.1623965337570; 
 Thu, 17 Jun 2021 14:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
 <20210617140908.412298-5-dmitry.baryshkov@linaro.org> <YMucAx2I4px12wgQ@yoga>
In-Reply-To: <YMucAx2I4px12wgQ@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Jun 2021 00:28:46 +0300
Message-ID: <CAA8EJpp_K7tbXi_JaiiU99HGfo_YiivUT+BgfmpLK3R=UwhQCQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dpu: hide struct dpu_irq_callback
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu, 17 Jun 2021 at 22:01, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 17 Jun 09:09 CDT 2021, Dmitry Baryshkov wrote:
>
> > The struct dpu_irq_callbacks looks internal to IRQ handling code. Hide
> > it from the rest of the DPU driver.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 18 +++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
> >  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++-
> >  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  6 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 62 ++++++++++++++-----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 12 ----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  8 +--
> >  8 files changed, 69 insertions(+), 55 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> > index 90ae6c9ccc95..44ab97fb2964 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> > @@ -46,10 +46,8 @@ u32 dpu_core_irq_read(
> >   *                             interrupt
> >   * @dpu_kms:         DPU handle
> >   * @irq_idx:         irq index
> > - * @irq_cb:          IRQ callback structure, containing callback function
> > - *                   and argument. Passing NULL for irq_cb will unregister
> > - *                   the callback for the given irq_idx
> > - *                   This must exist until un-registration.
> > + * @irq_cb:          IRQ callback funcion.
> > + * @irq_arg:         IRQ callback argument.
> >   * @return:          0 for success registering callback, otherwise failure
> >   *
> >   * This function supports registration of multiple callbacks for each interrupt.
> > @@ -57,17 +55,16 @@ u32 dpu_core_irq_read(
> >  int dpu_core_irq_register_callback(
> >               struct dpu_kms *dpu_kms,
> >               int irq_idx,
> > -             struct dpu_irq_callback *irq_cb);
> > +             void (*irq_cb)(void *arg, int irq_idx),
> > +             void *irq_arg);
> >
> >  /**
> >   * dpu_core_irq_unregister_callback - For unregistering callback function on IRQ
> >   *                             interrupt
> >   * @dpu_kms:         DPU handle
> >   * @irq_idx:         irq index
> > - * @irq_cb:          IRQ callback structure, containing callback function
> > - *                   and argument. Passing NULL for irq_cb will unregister
> > - *                   the callback for the given irq_idx
> > - *                   This must match with registration.
> > + * @irq_cb:          IRQ callback funcion.
> > + * @irq_arg:         IRQ callback argument.
> >   * @return:          0 for success registering callback, otherwise failure
> >   *
> >   * This function supports registration of multiple callbacks for each interrupt.
> > @@ -75,7 +72,8 @@ int dpu_core_irq_register_callback(
> >  int dpu_core_irq_unregister_callback(
> >               struct dpu_kms *dpu_kms,
> >               int irq_idx,
> > -             struct dpu_irq_callback *irq_cb);
> > +             void (*irq_cb)(void *arg, int irq_idx),
> > +             void *irq_arg);
> >
> >  /**
> >   * dpu_debugfs_core_irq_init - register core irq debugfs
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 7f06238a7c64..186b2f87d193 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -310,7 +310,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
> >                                     phys_enc->hw_pp->idx - PINGPONG_0,
> >                                     atomic_read(wait_info->atomic_cnt));
> >                       local_irq_save(flags);
> > -                     irq->cb.func(phys_enc, irq->irq_idx);
> > +                     irq->func(phys_enc, irq->irq_idx);
> >                       local_irq_restore(flags);
> >                       ret = 0;
> >               } else {
> > @@ -352,7 +352,7 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
> >       }
> >
> >       ret = dpu_core_irq_register_callback(phys_enc->dpu_kms, irq->irq_idx,
> > -                     &irq->cb);
> > +                     irq->func, phys_enc);
> >       if (ret) {
> >               DPU_ERROR_PHYS(phys_enc,
> >                       "failed to register IRQ callback for %s\n",
> > @@ -384,7 +384,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
> >       }
> >
> >       ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx,
> > -                     &irq->cb);
> > +                     irq->func, phys_enc);
> >       if (ret) {
> >               DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
> >                         DRMID(phys_enc->parent), intr_idx,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index e7270eb6b84b..80d87871fd94 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -174,7 +174,7 @@ struct dpu_encoder_irq {
> >       const char *name;
> >       enum dpu_intr_idx intr_idx;
> >       int irq_idx;
> > -     struct dpu_irq_callback cb;
> > +     void (*func)(void *arg, int irq_idx);
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index dba1219c6f1b..dbc8f0811dd1 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -786,30 +786,28 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> >       phys_enc->enable_state = DPU_ENC_DISABLED;
> >       for (i = 0; i < INTR_IDX_MAX; i++) {
> >               irq = &phys_enc->irq[i];
> > -             INIT_LIST_HEAD(&irq->cb.list);
> >               irq->irq_idx = -EINVAL;
> > -             irq->cb.arg = phys_enc;
> >       }
> >
> >       irq = &phys_enc->irq[INTR_IDX_CTL_START];
> >       irq->name = "ctl_start";
> >       irq->intr_idx = INTR_IDX_CTL_START;
> > -     irq->cb.func = dpu_encoder_phys_cmd_ctl_start_irq;
> > +     irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
> >
> >       irq = &phys_enc->irq[INTR_IDX_PINGPONG];
> >       irq->name = "pp_done";
> >       irq->intr_idx = INTR_IDX_PINGPONG;
> > -     irq->cb.func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> > +     irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> >
> >       irq = &phys_enc->irq[INTR_IDX_RDPTR];
> >       irq->name = "pp_rd_ptr";
> >       irq->intr_idx = INTR_IDX_RDPTR;
> > -     irq->cb.func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> > +     irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> >
> >       irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> >       irq->name = "underrun";
> >       irq->intr_idx = INTR_IDX_UNDERRUN;
> > -     irq->cb.func = dpu_encoder_phys_cmd_underrun_irq;
> > +     irq->func = dpu_encoder_phys_cmd_underrun_irq;
> >
> >       atomic_set(&phys_enc->vblank_refcount, 0);
> >       atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 391b13b99c01..21722cdfaaf7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -728,20 +728,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
> >       phys_enc->enc_spinlock = p->enc_spinlock;
> >       for (i = 0; i < INTR_IDX_MAX; i++) {
> >               irq = &phys_enc->irq[i];
> > -             INIT_LIST_HEAD(&irq->cb.list);
> >               irq->irq_idx = -EINVAL;
> > -             irq->cb.arg = phys_enc;
> >       }
> >
> >       irq = &phys_enc->irq[INTR_IDX_VSYNC];
> >       irq->name = "vsync_irq";
> >       irq->intr_idx = INTR_IDX_VSYNC;
> > -     irq->cb.func = dpu_encoder_phys_vid_vblank_irq;
> > +     irq->func = dpu_encoder_phys_vid_vblank_irq;
> >
> >       irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> >       irq->name = "underrun";
> >       irq->intr_idx = INTR_IDX_UNDERRUN;
> > -     irq->cb.func = dpu_encoder_phys_vid_underrun_irq;
> > +     irq->func = dpu_encoder_phys_vid_underrun_irq;
> >
> >       atomic_set(&phys_enc->vblank_refcount, 0);
> >       atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index e5dce884e7c0..73a20fc5c766 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -32,6 +32,18 @@
> >  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
> >  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
> >
> > +/*
> > + * struct dpu_irq_callback - IRQ callback handlers
> > + * @list: list to callback
> > + * @func: intr handler
> > + * @arg: argument for the handler
> > + */
> > +struct dpu_irq_callback {
> > +     struct list_head list;
> > +     void (*func)(void *arg, int irq_idx);
> > +     void *arg;
> > +};
> > +
> >  /**
> >   * struct dpu_intr_reg - array of DPU register sets
> >   * @clr_off: offset to CLEAR reg
> > @@ -428,20 +440,19 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
> >  }
> >
> >  int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> > -             struct dpu_irq_callback *register_irq_cb)
> > +             void (*irq_cb)(void *arg, int irq_idx),
> > +             void *irq_arg)
> >  {
> >       unsigned long irq_flags;
> > +     struct dpu_irq_callback *register_irq_cb;
> >
> >       if (!dpu_kms->hw_intr->irq_cb_tbl) {
> >               DPU_ERROR("invalid params\n");
> >               return -EINVAL;
> >       }
> >
> > -     if (!register_irq_cb || !register_irq_cb->func) {
> > -             DPU_ERROR("invalid irq_cb:%d func:%d\n",
> > -                             register_irq_cb != NULL,
> > -                             register_irq_cb ?
> > -                                     register_irq_cb->func != NULL : -1);
> > +     if (!irq_cb) {
> > +             DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
> >               return -EINVAL;
> >       }
> >
> > @@ -452,9 +463,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
>
> At least the callbacks related to the interfaces are registered and
> unregistered for every frame, so I would prefer that we don't
> kzalloc()/kfree() in this code path.

Ack.

> I've unfortunately not been able to backtrack this fully, but I was
> expecting something like that register the callbacks once and then
> mask/unmask the interrupts as needed - in which case this patch looks
> good.

IMO masking/unmasking is a bad idea if we allow several callbacks for
a single interrupt. Or we'd have to reintroduce the reference counts,
etc.

However it looks like we have at most a single user per interrupt
(please correct me if I'm wrong), so we might instead preallocate
callback tables for a single callback per interrupt.
I will test this for v2 of this patchset.

-- 
With best wishes
Dmitry
