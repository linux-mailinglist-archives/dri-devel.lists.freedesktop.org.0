Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05F84D24D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 20:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACDE10E24E;
	Wed,  7 Feb 2024 19:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ri0WEVL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4210E445
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 19:40:15 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60485382886so12086977b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 11:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707334814; x=1707939614; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v+xXbucLH0Z71gEzcP04jhL2BdIsPsj4klmuhvkUi5Q=;
 b=Ri0WEVL1x3pmXz/pN39WCL6V7En8gfMA4o6NxejxB51TfRAgjLVTUDuUAhbzFXpEdS
 45SRMLnJB89AmTsh5pA3Q8GBdYpNUkgNeYTywD2BLeJ/nZ0i8wQU4hrbVlELM7VTNli9
 78wazmsqFXqZOes8T32oJHsKgsJuqrON8uN3tdlX6CVaVhDqvnMvc4kRxHwORa6Uou4+
 b9qShwVar6BTmnocKoqYU05D92+2E6ZQzrdqXCPZF5ePJKm29b29XvZLldfdiirKl7Ys
 SjzToq0Zsx8zABR4ee3s95/X/zYu2zJYgYT+8KcuejuN8jNLQ27JVzNqBKaG4H3P+l5i
 Nv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707334814; x=1707939614;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+xXbucLH0Z71gEzcP04jhL2BdIsPsj4klmuhvkUi5Q=;
 b=Fm8QITbp3dqpVLYmRlzrHAv9dNuDVnftsI6aNOCU8cX2T0OlWa3YOWgWAXsYmJVLUl
 vc1zD47Jawn0s8RuwGZ+zv94DopHLGgOzx9/fNe01UXm5nDNfwkRMpzjTNLeYd4BoJYb
 Eyvd1mou9lKvNGLFiV7VDwu95XWG/aknUzEF+yjTFpME8+/A3ULRX4zgKR2Dk/aYD++O
 CWAJhNNVS/tj8AtTPWXmbEiAOTsiSiRFD3MVUshpLf7kxMHYNcBDhqdQWJvm2yhSaXeM
 AhCRzw+2TJpF/mvxiie/TP+K1W9lgmu+2G8eUKL1CklmZI3IKq4iLZ/Gzx+FFRWBRnQx
 iIMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4fmlTPI/cCnO/qcHBRHeNLMEyFH6WohJ8icPp+lpZKv4HT5at2Ltl4LQ80pIHtP9SthVF6ibUGuLJatNZ+plT2K2Ps01kOUZqJYcG5dSz
X-Gm-Message-State: AOJu0YwmZrDj6P2H3RSpp96B99PYnKpK+iysIZRGbn1wucGrSpCNAKUj
 P9P6Yj9YKXI6vHnsaSq07/IRm36Bphf0IPn+KSRxVEX6zH29ZUrsVU5QoZgCRwkmW9gA6Xr6dzp
 n6BmP1QnFrmw9ZGKEwrMAWjyFQzWa+kNs3tZaYg==
X-Google-Smtp-Source: AGHT+IGTjDmYUCOs2coNnv2X5cc5vHEE21Ju1bQ8ebfh38NDN39/GMQRSQ0FSwxV/+izQWFIDpklv+ogC5CLyT4+AOM=
X-Received: by 2002:a0d:d411:0:b0:604:85cc:ecc9 with SMTP id
 w17-20020a0dd411000000b0060485ccecc9mr4770709ywd.49.1707334813985; Wed, 07
 Feb 2024 11:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20231005220659.2404199-1-dmitry.baryshkov@linaro.org>
 <f2e146a3-0825-3e92-a694-b2b947b92b66@quicinc.com>
In-Reply-To: <f2e146a3-0825-3e92-a694-b2b947b92b66@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 21:40:01 +0200
Message-ID: <CAA8EJpoihsOeA8BPn0oq9oGxARZawAGszYp3XW38WJodXPYBMg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: remove CRTC frame event callback
 registration
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
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

On Wed, 7 Feb 2024 at 19:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/5/2023 3:06 PM, Dmitry Baryshkov wrote:
> > The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> > to NULL) and the data is always either the CRTC itself or NULL
> > (correpondingly). Thus drop the event callback registration, call the
> > dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> > assigned using dpu_encoder_assign_crtc().
> >
>
> The idea behind the registration was for CRTC to register for events if
> it wants to and perhaps have different callbacks for different events
> through a common registration mechanism and encoder need not know each
> dpu_crtc calls as most of the time we dont want encoder to go back to
> crtc to look up what its APIs are.
>
> But, we are always registering today and have only one callback, so it
> kind of makes it an additional redundant wrapper. So I guess, once again
> one of those things which , seems not necessary with the current code
> but nothing really wrong with it.
>
> Anyway, couple of comments below.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > This patch was previously posted as a part of the [1]
> >
> > Changes since v1:
> > - Rebased on top of linux-next
> >
> > [1] https://patchwork.freedesktop.org/series/112353/
> >
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
> >   5 files changed, 21 insertions(+), 65 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 8ce7586e2ddf..dec5417b69d8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -669,18 +669,8 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
> >       DPU_ATRACE_END("crtc_frame_event");
> >   }
> >
> > -/*
> > - * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
> > - * registers this API to encoder for all frame event callbacks like
> > - * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> > - * from different context - IRQ, user thread, commit_thread, etc. Each event
> > - * should be carefully reviewed and should be processed in proper task context
> > - * to avoid schedulin delay or properly manage the irq context's bottom half
> > - * processing.
> > - */
> > -static void dpu_crtc_frame_event_cb(void *data, u32 event)
> > +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
> >   {
> > -     struct drm_crtc *crtc = (struct drm_crtc *)data;
> >       struct dpu_crtc *dpu_crtc;
> >       struct msm_drm_private *priv;
> >       struct dpu_crtc_frame_event *fevent;
> > @@ -1102,9 +1092,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >
> >       dpu_core_perf_crtc_update(crtc, 0);
> >
> > -     drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> > -             dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> > -
> >       memset(cstate->mixers, 0, sizeof(cstate->mixers));
> >       cstate->num_mixers = 0;
> >
> > @@ -1143,8 +1130,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
> >                */
> >               if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
> >                       request_bandwidth = true;
> > -             dpu_encoder_register_frame_event_callback(encoder,
> > -                             dpu_crtc_frame_event_cb, (void *)crtc);
> >       }
> >
> >       if (request_bandwidth)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > index 539b68b1626a..3aa536d95721 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -300,4 +300,18 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> >       return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
> >   }
> >
> > +/**
> > + * dpu_crtc_frame_event_cb - crtc frame event callback API
> > + * @crtc: Pointer to crtc
> > + * @event: Event to process
> > + *
> > + * CRTC module registers this API to encoder for all frame event callbacks like
> > + * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
> > + * from different context - IRQ, user thread, commit_thread, etc. Each event
> > + * should be carefully reviewed and should be processed in proper task context
> > + * to avoid schedulin delay or properly manage the irq context's bottom half
> > + * processing.
> > + */
>
> This doc is no longer correct.
>
> CRTC module no longer registers anything.

Ack. I should have fixed this c&p.

>
> > +void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > +
> >   #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d34e684a4178..709fffa4dfa7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -148,8 +148,6 @@ enum dpu_enc_rc_states {
> >    * @frame_busy_mask:                Bitmask tracking which phys_enc we are still
> >    *                          busy processing current command.
> >    *                          Bit0 = phys_encs[0] etc.
> > - * @crtc_frame_event_cb:     callback handler for frame event
> > - * @crtc_frame_event_cb_data:        callback handler private data
> >    * @frame_done_timeout_ms:  frame done timeout in ms
> >    * @frame_done_timer:               watchdog timer for frame done event
> >    * @disp_info:                      local copy of msm_display_info struct
> > @@ -187,8 +185,6 @@ struct dpu_encoder_virt {
> >       struct dentry *debugfs_root;
> >       struct mutex enc_lock;
> >       DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> > -     void (*crtc_frame_event_cb)(void *, u32 event);
> > -     void *crtc_frame_event_cb_data;
> >
> >       atomic_t frame_done_timeout_ms;
> >       struct timer_list frame_done_timer;
> > @@ -1377,28 +1373,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
> >       }
> >   }
> >
> > -void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
> > -             void (*frame_event_cb)(void *, u32 event),
> > -             void *frame_event_cb_data)
> > -{
> > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > -     unsigned long lock_flags;
> > -     bool enable;
> > -
> > -     enable = frame_event_cb ? true : false;
> > -
> > -     if (!drm_enc) {
> > -             DPU_ERROR("invalid encoder\n");
> > -             return;
> > -     }
> > -     trace_dpu_enc_frame_event_cb(DRMID(drm_enc), enable);
> > -
> > -     spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
> > -     dpu_enc->crtc_frame_event_cb = frame_event_cb;
> > -     dpu_enc->crtc_frame_event_cb_data = frame_event_cb_data;
> > -     spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
> > -}
> > -
> >   void dpu_encoder_frame_done_callback(
> >               struct drm_encoder *drm_enc,
> >               struct dpu_encoder_phys *ready_phys, u32 event)
> > @@ -1438,15 +1412,12 @@ void dpu_encoder_frame_done_callback(
> >                       dpu_encoder_resource_control(drm_enc,
> >                                       DPU_ENC_RC_EVENT_FRAME_DONE);
> >
> > -                     if (dpu_enc->crtc_frame_event_cb)
> > -                             dpu_enc->crtc_frame_event_cb(
> > -                                     dpu_enc->crtc_frame_event_cb_data,
> > -                                     event);
> > +                     if (dpu_enc->crtc)
> > +                             dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
> >               }
> >       } else {
> > -             if (dpu_enc->crtc_frame_event_cb)
> > -                     dpu_enc->crtc_frame_event_cb(
> > -                             dpu_enc->crtc_frame_event_cb_data, event);
> > +             if (dpu_enc->crtc)
> > +                     dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
> >       }
> >   }
> >
> > @@ -2318,7 +2289,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
> >               return;
> >       }
> >
> > -     if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
> > +     if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {
>
> Why do we need !dpu_enc->crtc check for just printing this error log and
> returning?

This was to keep function semantics: bail out either if there is no
frame_busy_mask or if there is no CRTC for this encoder.

>
> >               DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
> >                             DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
> >               return;
> > @@ -2331,7 +2302,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
> >
> >       event = DPU_ENCODER_FRAME_EVENT_ERROR;
> >       trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> > -     dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> > +     dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
> >   }
> >
> >   static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index 4c05fd5e9ed1..dfa8edeca925 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -55,16 +55,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
> >   void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
> >                                       struct drm_crtc *crtc, bool enable);
> >
> > -/**
> > - * dpu_encoder_register_frame_event_callback - provide callback to encoder that
> > - *   will be called after the request is complete, or other events.
> > - * @encoder: encoder pointer
> > - * @cb:              callback pointer, provide NULL to deregister
> > - * @data:    user data provided to callback
> > - */
> > -void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
> > -             void (*cb)(void *, u32), void *data);
> > -
> >   /**
> >    * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
> >    *  path (i.e. ctl flush and start) at next appropriate time.
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > index c74b9be25e68..dc097e109fd2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > @@ -346,10 +346,6 @@ DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
> >       TP_PROTO(uint32_t drm_id, bool enable),
> >       TP_ARGS(drm_id, enable)
> >   );
> > -DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_frame_event_cb,
> > -     TP_PROTO(uint32_t drm_id, bool enable),
> > -     TP_ARGS(drm_id, enable)
> > -);
> >   DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_phys_cmd_connect_te,
> >       TP_PROTO(uint32_t drm_id, bool enable),
> >       TP_ARGS(drm_id, enable)



-- 
With best wishes
Dmitry
