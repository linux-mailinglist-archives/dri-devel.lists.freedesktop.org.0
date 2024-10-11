Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7C999CA7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8AC10EA3F;
	Fri, 11 Oct 2024 06:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LoIKRx4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C9710EA3F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:30:19 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e29028f3926so1639601276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 23:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728628218; x=1729233018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BVcEDroOEZwsIMVrx+9WRohn0DDzskEXWSGatUhqlGY=;
 b=LoIKRx4EGK6+7MCvV0066gS+Y5GCrheatUV9y2jtq9JNzMHqMn5atBwWykwsxLbRGp
 hQ3zE9nNweKqB23uykY/W0fCmAoYt6LjziSZntvKA9mGbNkqct0vLHlLWSprRUuPRSvY
 /jhcqFgaJK0/cUuTPZafwrZ0qYVvMKwR5vXaq4wQqD9PITQHFyrHNMwFcJN6A53vy+qv
 T2rnB1aQ4BH8px0WiSzLrjAQHR8v4ExnYrb54lCuXGjHMGKcKLB6hmVM8XA1BAOrIDLD
 qlygymay1zWMFNdcxK1iNzL0uBaI046htRLZlD3jDT7n9+AQEsVVOb/AX+grTzI01KIb
 H6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728628218; x=1729233018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BVcEDroOEZwsIMVrx+9WRohn0DDzskEXWSGatUhqlGY=;
 b=cZBiwaTaXl97Y83H95I5xm1HB4TeGmr0BVdJKmxsuv+INzsCkZ0i0kuKL88kM6JadW
 nWqF6sTibp6Og0xicQdneqJonCzAcK3WFgXgH91mlV6ZYC5CgKzc09/hpXvty92Zc8El
 b9U8C50Q9yxhKzmgIscOakZxR7HokX2wUlSRnHU3lhre2QW1ndrr3NCd63S49B5jMon7
 +A87SCYojrxJnWm5g0aHlDLHeV0hjpUDKbwclxM1b4u1FEDNQyqcfS+KHo13BoChVSqv
 X+14G4KR3PE+eXsCF5n1XLTXmMXrbc09QyNIs1WlR6NxMnGxyNbxO0Sn2muYOl8gNsxs
 dkBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo2vIziZZBkOwb1oSfgG5PUG6wNc3f8bpo1fHEUnkDRuEs3jkaGerGdNlXzmx1PTMwflhuAbA9z04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmto8NEte0u9r2N1nKtdmdR8Vq/qNddu+YhYXL4sGOgr4P77Cn
 ILDYG2Qdo9VJ0AA679TW/6rLtFwweuvhos/YMFzFEvtYj9SlropSHwaxcJacASz4VYTk/aX22bh
 sfnc91W0SGOgcHexuDjd+ZWoDmQPR1OFwhhG/LQ==
X-Google-Smtp-Source: AGHT+IHJdQGSufApLca8LjP+ezebvoTYvY+Iadu6v7iZqW7H9NHt7SSVE59XTNWKkbubvse0s188tLVmRhsmcUOf89Q=
X-Received: by 2002:a05:6902:1441:b0:e29:2e8:5c95 with SMTP id
 3f1490d57ef6-e2919fff5aemr1088090276.51.1728628218609; Thu, 10 Oct 2024
 23:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
 <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
In-Reply-To: <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:30:07 +0800
Message-ID: <CABymUCPV+bu-MNGCRp_0A+jC9Z6hY3XRm4vZ5Ju2XxT5YuRzPA@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:21PM GMT, Jun Nie wrote:
> > Update mixer number info earlier so that the plane nopipe check
> > can have the info to clip the plane. Otherwise, the first nonpipe
> > check will have mixer number as 0 and plane is not checked.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index dfe282c607933..68655c8817bf8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
> >       struct dpu_global_state *global_state;
> >       struct drm_framebuffer *fb;
> >       struct drm_dsc_config *dsc;
> > +     struct dpu_crtc_state *cstate;
> >       int ret =3D 0;
> >
> >       if (!drm_enc || !crtc_state || !conn_state) {
> > @@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
> >       dsc =3D dpu_encoder_get_dsc_config(drm_enc);
> >
> >       topology =3D dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode,=
 crtc_state, dsc);
> > +     cstate =3D to_dpu_crtc_state(crtc_state);
> > +     cstate->num_mixers =3D topology.num_lm;
> >
> >       /*
> >        * Use CDM only for writeback or DP at the moment as other interf=
aces cannot handle it.
> > @@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(str=
uct drm_encoder *drm_enc,
> >       }
> >
> >       cstate->num_dscs =3D num_dsc;
> > -     cstate->num_mixers =3D num_lm;
> > +     if (cstate->num_mixers !=3D num_lm) {
> > +             if (!cstate->num_mixers)
> > +                     DPU_ERROR_ENC(dpu_enc,
> > +                                   "mixer number %d is not as expected=
 %d\n",
> > +                                   num_lm, cstate->num_mixers);
> > +             cstate->num_mixers =3D num_lm;
> > +     }
>
> Is it a possible case or just defensive coding?

The value is initialized beforehand only in virtual plane case. So we
still need this
for non virtual plane case.
>
> >       dpu_enc->connector =3D conn_state->connector;
> >
> >       /*
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
