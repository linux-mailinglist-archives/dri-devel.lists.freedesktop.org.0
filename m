Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A4E99829C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 11:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598C710E8B2;
	Thu, 10 Oct 2024 09:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MeI7V1Ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B1C10E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 09:42:36 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6e2f4c1f79bso7428497b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728553355; x=1729158155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2AFuEM5iQK1BFg24WS6aJ9H/ndfdGGqBiQFPKLr/iwg=;
 b=MeI7V1ArCaFRprYO06ZFSk7GI/YOxR7quFyCAE0es0B9CZNKhU1yZz/peG5yU0Rv8V
 CsajJytf850hasCFOCUpPX+8ydjfpYIP0uEMZ/Kzv7Di1kwnyRJAfFNd+fBrENvRuGJQ
 EyfETJ8+Zc098NELWZdeytNiEyRSjGqUTKKiCDQy5CDMCJtlnwVDH+0prEl0mA0EnEq5
 G16xWed9MLYXKqGGgkriGgBEt8hfR5c6NCRJuMexddDFaLcvtE23Y9pYByxRDMLY8pN2
 3MspkWd4e11mWKfoy7d30zRJYIUfiqtGQ0FVTBD71L4Ox41Cj3MjdRRLHh5XlTgMOQCF
 oM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728553355; x=1729158155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2AFuEM5iQK1BFg24WS6aJ9H/ndfdGGqBiQFPKLr/iwg=;
 b=YmPTLDChwkFYdFjRjvVdjPOxCN7WKYbuX1TnV4AeX3LPDjUVpT8jQDzt/qLY/hyYEa
 00K6aZjfzclOZlxYS4TXd2g1hk5rvsqxX1rB8du82TXnYSTDEv9BD8y4KfZ1cvh4Efcn
 3fDDQFt8LHE+dr8McsS4VEBO6M76S2Zr7aQbtbGwU8eR8+xbb5fMLZ/CiMI3uI8RxybZ
 5c9I7fHAp0lbT1L1Fv2jq1GhoUcJHWo8jFV8AEWaKbMALjfW96qCLUvJUgWQ//gstX1B
 21vYWcVN5OWK57TDqPLeWeCSYr8Dhm/73X5qxEENAqJJiRdynSbQQ04MDliy2IYpjLdU
 RVrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtsgDIOSUg/3YlMV/MFEkV3gX1jS0MZEb80EHQNeyOrAvvM5S0BT16V9CX5yNBNcc76x088Wbrt1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsP2MVsoH/P9aunWta3qI3hLGqYpYLxuTbZz8t9ui7PC7qqyoq
 aOMLUTSuBMmz60CF2BvZnKhBdyfhllsNdCt+eK7v6n4neFmqD6Has15u+mwxrd9CytIHwTIsUBn
 Q2apYh+YtBXgLvWIWk42U4/jjETZggjGm6nPDPA==
X-Google-Smtp-Source: AGHT+IGmAQ12ZK/exUtgQunkQD9Pba+qYyFly3uEDHGNZP0eC+XCxiqyJ8v2g1NWX+u+g414abxOj3NfbQ9kYJQAxO4=
X-Received: by 2002:a05:690c:2f08:b0:6db:da26:e8c6 with SMTP id
 00721157ae682-6e322491509mr49597547b3.44.1728553355429; Thu, 10 Oct 2024
 02:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
 <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
 <CABymUCMAsXFz4tMdNexxU8UVGu_khcD6EE+KBt=5EHmKbXvG5A@mail.gmail.com>
In-Reply-To: <CABymUCMAsXFz4tMdNexxU8UVGu_khcD6EE+KBt=5EHmKbXvG5A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 12:42:24 +0300
Message-ID: <CAA8EJpqv84EPWysZKhATthybZ5ODutNq9mJ0SO2HpzqruaR=+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
To: Jun Nie <jun.nie@linaro.org>
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

On Thu, 10 Oct 2024 at 04:47, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 06:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 9 Oct 2024 at 09:39, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Only 2 DSC engines are allowed, or no DSC is involved currently.
> >
> > Can't parse this phrase.
>
> How about this:
> If DSC is enabled, the only case is with 2 DSC engines so far.

Just:

Currently if DSC support is requested, the driver only supports using
2 DSC blocks.

>
>
> >
> > > We need 4 DSC in quad-pipe topology in future. So let's only configur=
e
> > > DSC engines in use, instread of maximum number of DSC engines.
> >
> > Nit: instead
>
> Yep.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 39700b13e92f3..e8400b494687c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct d=
pu_hw_ctl *ctl,
> > >                 ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> > >  }
> > >
> > > -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> > > -                                struct drm_dsc_config *dsc)
> > > +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
> > >  {
> > >         /* coding only for 2LM, 2enc, 1 dsc config */
> > > +       struct dpu_encoder_virt *dpu_enc =3D to_dpu_encoder_virt(drm_=
enc);
> > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(drm_enc->=
crtc->state);
> > > +       struct drm_dsc_config *dsc =3D dpu_enc->dsc;
> >
> > Why? This doesn't seem to be related to num_dscs introduction.
>
> You mean the comments above these 3 lines? Yeah, it should be removed.

No, I mean that this whole chunk isn't related to the num_dsc support.
There is no need to change function arguments.

> >
> > > +       int num_dsc =3D cstate->num_dscs;
> > >         struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
> > >         struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
> > >         struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> >
> > [...]
> >
> > > @@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm=
_encoder *drm_enc)
> > >         }
> > >
> > >         if (dpu_enc->dsc)
> > > -               dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
> > > +               dpu_encoder_prep_dsc(drm_enc);
> > >  }
> > >
> > >  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
