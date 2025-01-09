Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D932A06CF6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 05:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300C10ECDB;
	Thu,  9 Jan 2025 04:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YQEcrxNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C5010ECDB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 04:27:48 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so4238191fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 20:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736396806; x=1737001606; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8/Om4C21cxOdacF9bVr34DOZ7Jn+auy/uMpOh19Wfhk=;
 b=YQEcrxNamP+e06hM3jVPZSBPjKEsnGc4a5le32zIJRprfhMUsnHbd2niz2b4QNykKW
 6yCQngkeKJDhEDbH9EKUnlZNnJM6a8I8uzEvmm06lVMlWZHppKNGMswp8/jyvwvJiOWo
 BpAoZA9l8OrhhvzQdMpaPLe5zkpIuK+8fAHt4h56Unsk/KFab5ClH1v3CPPpqkKTCvmW
 BQplhOdpPhmjzXpU0lr/YiLlV80PrdHKyo9kAZrB0tVdd5G3DS0BU7RVsehrRJdBxofr
 mM5T6uL0FcNBLs6k1n4QoTLOn4S5Jg9n8KbJusT6zZn47KZAn1sneQggZN69ihf/0ezk
 utnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736396806; x=1737001606;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/Om4C21cxOdacF9bVr34DOZ7Jn+auy/uMpOh19Wfhk=;
 b=ZDZtWeY4pT+Ilrf5+6qhrIsSoliPdjXd+GeymIiPJb7yheFfF0sJhWER2q3DRgpL/t
 7FOFv7l9GaKrFfVFzlb7DFgM5jWLRfp4nKcS7uQX/tPXvI6M48Bz5dBeYH+CuvkaMqog
 9g+NNLX/RcXcWd0wOQ15N19aVt8IR0CFPj6GLDwr/tFntN/Wpj9id4YlgbEhEk+yrhe3
 +GJI00SzOo+KfbHx27dsyHetWmaLG/AYCwflZsLZEqNhogt2Xet5T+Mg2eU0gLea/ORq
 jQb4hE8OrCSRbQLVYtC78frR1FOtxq+dti8tOfv+KEp7BGdrUviNblmHX3GfOXakLAff
 L96A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVluj/lKPlr6gqOYow3z2SHiQi9reX79GCpvscdNPFX8hTPD6wH3tAv421rAOLGIW6GBTgUDYV5LOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFno/vizXWGek0xz7MWBqoN9noMGmIf2JlSK4AcTMgC4/BbHKA
 U6EpU/GoXmHhGEsynVxh+QxSwdecSTgafIYbHt5j4ShenJrM8LoLyswK9h+wlW4=
X-Gm-Gg: ASbGnctuP7ONisAVNaNWf0Y+zmDQzq2bw0SMmHoSMwKO8XNIc/0XBuhMHZzLYAxdBXf
 qT/+LkA1PqKJc3hr8Qz286JwFkeufQGPaEaJxi06/l3UHoyIvV/8h6QX6a8qBvgc1Ls3VB+VDr2
 jwUhCHOshExmd+rLImX240RR4IpOB7/FeWupXFUu4aexWjUxV/w3w8eEO/A+4wAg2xoBFNRW33/
 7Z9j/RakEKWnvsiNXggHN3gCdKSTQKCwCPefDQt0rJoJVbsIAcsfzEivjACM03fMw9lBmZzvNhz
 +9r6vtXo7xSkNmM9kr7sreffwMmKvsezBQGT
X-Google-Smtp-Source: AGHT+IHHq4gspYEdhTHMyXcmezEY1+Djfi+48+qomerqe9AIj5PpdcpYlixd2t1tkYNF4w8cqaCEbg==
X-Received: by 2002:a2e:809:0:b0:302:4130:e19c with SMTP id
 38308e7fff4ca-305f458cfc4mr11016961fa.19.1736396806486; 
 Wed, 08 Jan 2025 20:26:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7aaasm632581fa.70.2025.01.08.20.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 20:26:45 -0800 (PST)
Date: Thu, 9 Jan 2025 06:26:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <2i5vun3pabozzqxjnciylahfx7jljtdmowjo625ida44e37djm@2axmuodlaqtk>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
 <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>
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

On Wed, Jan 08, 2025 at 08:11:27PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/8/2025 6:27 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > > Perform corresponding check before calling the drm_atomic_helper_check()
> > > function.
> > > 
> > > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
> > > in case of YUV output")
> > > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > Closes:
> > > https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32
> > > +++++++++++++++++++++++++----
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26
> > > +++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> > >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> > >   5 files changed, 77 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c
> > > 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -753,6 +753,34 @@ static void
> > > dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > >       cstate->num_mixers = num_lm;
> > >   }
> > > +/**
> > > + * dpu_encoder_virt_check_mode_changed: check if full modeset is
> > > required
> > > + * @drm_enc:    Pointer to drm encoder structure
> > > + * @crtc_state:    Corresponding CRTC state to be checked
> > > + * @conn_state: Corresponding Connector's state to be checked
> > > + *
> > > + * Check if the changes in the object properties demand full mode set.
> > > + */
> > > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > +                    struct drm_crtc_state *crtc_state,
> > > +                    struct drm_connector_state *conn_state)
> > > +{
> > > +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > +    struct msm_display_topology topology;
> > > +
> > > +    DPU_DEBUG_ENC(dpu_enc, "\n");
> > > +
> > > +    /* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > +    topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode,
> > > crtc_state, conn_state);
> > > +
> > > +    if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > +        crtc_state->mode_changed = true;
> > > +    else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > +        crtc_state->mode_changed = true;
> > > +
> > > +    return 0;
> > > +}
> > 
> > How will this work exactly?
> > 
> > needs_cdm is set in the encoder's atomic_check which is called inside
> > drm_atomic_helper_check(). But this function is called before that.
> > 
> > So needs_cdm will never hit.
> > 
> 
> Sorry, my bad. after change (4) of this series needs_cdm is also populated
> within  dpu_encoder_get_topology().
> 
> To follow up on https://patchwork.freedesktop.org/patch/629231/?series=137975&rev=4#comment_1148651
> 
> So is the plan for CWB to add a dpu_crtc_check_mode_changed() like
> dpu_encoder's and call it?

I think dpu_encoder_virt_check_mode_changed() would transform into the
dpu_crtc_check_mode_changed() together with one of the patches that
moves resource allocation and refactors topology handling.

> 
> 
> > 
> > > +
> > >   static int dpu_encoder_virt_atomic_check(
> > >           struct drm_encoder *drm_enc,
> > >           struct drm_crtc_state *crtc_state,

-- 
With best wishes
Dmitry
