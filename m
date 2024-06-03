Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5588D8B66
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 23:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFC810E3E1;
	Mon,  3 Jun 2024 21:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gMDhLULY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231310E062
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 21:17:01 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-df481bf6680so4716320276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717449421; x=1718054221; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lpiBi+mPysSFN55XB2hY9eYMbPugbtviT0QRoPm7Lho=;
 b=gMDhLULY5BRbsbfF3GF9ASCIOtU0beSVJJgq8uWD3YVUTMhRZos/VXgcgbzxDqRbm8
 MiAtlOyN4Kw3kha0qakjeFcwfkxl0hTyQgJJOtuBeAkj8+gCzYMQUqZUbVtKJnNPIY0C
 ZEfN4uDhrrfpa4kWuTYVAJGrR2h6tRyJFc5GW7DA0rQhlT5jNIimhR4cxqGAMP81O9BB
 vhI4qH9CrmRGIeinmsrVHpcxKM9D1oa9Y2Fnmvd377tfRPguJ6/UstCS/qwVYtZk9/JA
 5zgPxlh+zutESZ3Ct1RUc61ZMSbNpBIfujAweQMt0IHx6HlEBnWkxO3MPC533B94s2MJ
 fd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717449421; x=1718054221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpiBi+mPysSFN55XB2hY9eYMbPugbtviT0QRoPm7Lho=;
 b=HEyAmJym2ROGbK5TZwMmBrl7FPytBq0VsOCd5UcjZUxoOhVnwBs69OnjjUM/UtxYG5
 y6xk6p85O6HSAJzAZsYW/RgiZyIbB8wts49fjTwp0jEet6793hPKV74otufovz2uY/tJ
 Fm6drxuvzbh1dzMLxGYgryKei8zBHTKc3bYww2gmRvA9b+RWFKY9aWAt7MqZdKvFuRmn
 zndjw03r/auzx5jj4T0oLD2NAv6YmrC9rR8fxzMjj1EhGPa2k0TQIHjwhwq15DIGwiJ2
 2bErcAdMA9jitv+CMrl+SUM20cXHCRAwdpAZibA+vDG0TxK6Vp65Rps8iUHXBQF7igSD
 8FJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbSEHGlvXCWQWmnZg9mNaVieyNXVjBgJnjdSKCsqoF4Uig1wTNe/bdIUrOtEl6EDFlrzfvyIeF+U0+07Xd6hnQLKsXSVY7rGKunTQI4MjP
X-Gm-Message-State: AOJu0YyDhuObL6d//dHVRrGITApkX5/bhU6o+2u5nA+wp8Mmsvp8IWqH
 1ZdRCeD/QPNXE0Xs7MaBP/NjJXnyXAKhh1Y19mBsFYSD79jPj6U81Cwfq4kwi1YKZcA/0QwmjxA
 tXbsI8AQ9gUynMEZazmHkWRk/9hC2hVlHwv30RQ==
X-Google-Smtp-Source: AGHT+IHXBjCG+hUE2uaiUa+TcyWv3gn4Tkioc8ie/Opt614FYx8Vk2I7G56tZfNuyxfaaO9hBJ98lE/p0E1CJ6Hfad4=
X-Received: by 2002:a25:a1e1:0:b0:dcf:411f:e78 with SMTP id
 3f1490d57ef6-dfa73c21968mr9024488276.25.1717449420670; Mon, 03 Jun 2024
 14:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
 <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
In-Reply-To: <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 00:16:49 +0300
Message-ID: <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
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

On Mon, 3 Jun 2024 at 23:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> > Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
> > LM requirements.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index e3b1e5f55a92..c5e874a3656a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >       _dpu_crtc_complete_flip(crtc);
> >   }
> >
> > -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> >               struct drm_crtc_state *state)
>
> Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?

Ack, I'll rename it.

>
> Also, prior to this change, we never had a bounds check for each LM
> which we should have had . Does this qualify for a Fixes tag?

Probably no. We currently have a limit in the drm_mode_config, which
ensures that the CRTC isn't too wide.

>
> With those two questions addressed,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> >   {
> >       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> >       struct drm_display_mode *adj_mode = &state->adjusted_mode;
> >       u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
> > +     struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >       int i;
> >
> >       for (i = 0; i < cstate->num_mixers; i++) {
> > @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> >               r->y2 = adj_mode->vdisplay;
> >
> >               trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
> > +
> > +             if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> > +                     return -E2BIG;
> >       }
>
> > +
> > +     return 0;
> >   }
> >
> >   static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
> > @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >       if (crtc_state->active_changed)
> >               crtc_state->mode_changed = true;
> >
> > -     if (cstate->num_mixers)
> > -             _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > +     if (cstate->num_mixers) {
> > +             rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > +             if (rc)
> > +                     return rc;
> > +     }
> >
> >       /* FIXME: move this to dpu_plane_atomic_check? */
> >       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> >



-- 
With best wishes
Dmitry
