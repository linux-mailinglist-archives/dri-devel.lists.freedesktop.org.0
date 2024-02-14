Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BAA855316
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 20:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2532E10E2D3;
	Wed, 14 Feb 2024 19:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wknsR1uE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7EA10E2C3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 19:18:25 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcc80d6004bso25271276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707938304; x=1708543104; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vX31/EzD/EWKcus6lCA8zVhfltgaK7sFq7I9qzmQtfs=;
 b=wknsR1uEdtpdUhZa15dB63lByin2PycfelmOzIrrxlr65oyvcP4exjFR2T+VgBcvGS
 ddCuq6UowFNgpjVMpFdT13XCRQl+SHtQJUv5ppGi+8MDCw2/BsTH+YCqmRDkSt/h1eSe
 qnswVrmZvooiwTcJvAdDr1RfTbcz/84X2slskcPYbb7r/ouOOxD/s7e38xsAKt1n6DPn
 O6QpZxKdp1/N6Ui3wRtu+64K0KcdB+Vg8qtJr4yje4sPEA3FcwN9U5DUzlJobMPbrDmm
 g4pCAhddjpdpi7FZWlKjdcqxpYEFUOW/KJkv5LNvviUTjbrA2PURLF+LfWFDSaMcGs4/
 HMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707938304; x=1708543104;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vX31/EzD/EWKcus6lCA8zVhfltgaK7sFq7I9qzmQtfs=;
 b=SyAAz5mR0S4BexCQYMv+5BKp1kQixmFynVP8XA9dtlF1znLgGoFnGmI4QN7cCC8OMS
 xM8vSutGGIzeseU1ZvjWhOcyrplJiNJcl5dEe0SudvFMJHuO2gK560Y/FUxwpveTxjYd
 oO+XKeL5X2YRJw9Xy6HbNgBKv+kG6CixOOc+kEo9NS1gAWOLASy8kTEvDkdOZUFqsOQm
 X1UpmZ+eYp0+48ubOYgShrCBntUsQ4Jo5m694koRD2tIODVS/ixr2YiiWQcbTWh12f2q
 HZWnhDuUZPF/894wFvdZl/KaAEXOJjtGTcypKK59eav0dW8jrTQsOf6YJfaGxqKeu/c0
 T6ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZRX1rrRavzCXixAE6Ovp65arG4CMg/D87FqLN//0LhzeaZ25ysc4AAOe7vqe2uLpuwlaKiqqMLalNwqmuOVuk31wTjiizTZ5//8yICTcA
X-Gm-Message-State: AOJu0YyEdxSRpMZV9ONYW4ctiOhpXRPV7LJpYy3wut4yG1FB0q2L7CdG
 4sK9JowQ5uKlY+T79RDl8bKZiK/1vLeXezmtJaruXe1hN6vj3ys5ZJ7LHyTPTdIDtpGnQgXQFe2
 ji9S6bvVXzGWwM3NxAW2jW0G+k2zrcRmRk/k8aQ==
X-Google-Smtp-Source: AGHT+IF4aOVnL4Bd3VrS8xHPrKHuOlpm4uq7GLf0etCj1mf7gTKYmLfKqrL9SvEfzUISs1HpP36UHgZNvqQJmZKizwE=
X-Received: by 2002:a25:854d:0:b0:dcd:5e0f:19c7 with SMTP id
 f13-20020a25854d000000b00dcd5e0f19c7mr2748331ybn.54.1707938304299; Wed, 14
 Feb 2024 11:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-3-dmitry.baryshkov@linaro.org>
 <311b5714-47a8-7170-5b14-cde3ac05a314@quicinc.com>
In-Reply-To: <311b5714-47a8-7170-5b14-cde3ac05a314@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:18:13 +0200
Message-ID: <CAA8EJprQb=xDZ8e2bsLg-d3RmXQbjgda7K7BLsYb7zxMuAxGZw@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] drm/msm/dpu: add current resource allocation to
 dumped state
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

On Wed, 14 Feb 2024 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 9/13/2023 10:06 PM, Dmitry Baryshkov wrote:
> > Provide atomic_print_state callback to the DPU's private object. This
> > way the debugfs/dri/0/state will also include RM's internal state.
> >
>
> I like this idea !
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 +++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 48 +++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
> >   4 files changed, 62 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index ee84160592ce..172b64dc60e6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -362,6 +362,7 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
> >   static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
> >       .atomic_duplicate_state = dpu_kms_global_duplicate_state,
> >       .atomic_destroy_state = dpu_kms_global_destroy_state,
> > +     .atomic_print_state = dpu_rm_print_state,
> >   };
> >
> >   static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> > @@ -375,6 +376,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> >       drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> >                                   &state->base,
> >                                   &dpu_kms_global_state_funcs);
> > +
> > +     state->rm = &dpu_kms->rm;
> > +
> >       return 0;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index ed549f0f7c65..dd2be279b366 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -130,6 +130,8 @@ struct vsync_info {
> >   struct dpu_global_state {
> >       struct drm_private_state base;
> >
> > +     struct dpu_rm *rm;
> > +
> >       uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >       uint32_t mixer_to_enc_id[LM_MAX - LM_0];
> >       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f9215643c71a..5e3442fb8678 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -652,3 +652,51 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >
> >       return num_blks;
> >   }
> > +
> > +void dpu_rm_print_state(struct drm_printer *p,
> > +                     const struct drm_private_state *state)
> > +{
> > +     const struct dpu_global_state *global_state = to_dpu_global_state(state);
> > +     const struct dpu_rm *rm = global_state->rm;
> > +     int i;
> > +
> > +     drm_puts(p, "pingpong:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
> > +             if (rm->pingpong_blks[i])
> > +                     drm_printf(p, " %d,", global_state->pingpong_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "mixer:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
> > +             if (rm->mixer_blks[i])
> > +                     drm_printf(p, " %d,", global_state->mixer_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "ctl:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
> > +             if (rm->ctl_blks[i])
> > +                     drm_printf(p, " %d,", global_state->ctl_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "dspp:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
> > +             if (rm->dspp_blks[i])
> > +                     drm_printf(p, " %d,", global_state->dspp_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +
> > +     drm_puts(p, "dsc:");
> > +     for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
> > +             if (rm->dsc_blks[i])
> > +                     drm_printf(p, " %d,", global_state->dsc_to_enc_id[i]);
> > +             else
> > +                     drm_puts(p, " -,");
> > +     drm_puts(p, "\n");
> > +}
>
> You also need to include cdm_to_enc_id now. But otherwise LGTM.
>
> If you have run this before, do you have a sample output to share?

No, I don't have a dump at hand. But I can post this patch separately,
including the CDM change.

>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index 2b551566cbf4..913baca81a42 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -92,6 +92,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >       struct dpu_global_state *global_state, uint32_t enc_id,
> >       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> >
> > +/**
> > + * dpu_rm_print_state - output the RM private state
> > + * @p: DRM printer
> > + * @state: private object state
> > + */
> > +void dpu_rm_print_state(struct drm_printer *p,
> > +                     const struct drm_private_state *state);
> > +
> >   /**
> >    * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
> >    * @rm: DPU Resource Manager handle



-- 
With best wishes
Dmitry
