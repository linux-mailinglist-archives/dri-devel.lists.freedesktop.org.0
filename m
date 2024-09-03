Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACC96960B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503D10E426;
	Tue,  3 Sep 2024 07:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NpWavYni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4210E424
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:50:06 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5343617fdddso8536248e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725349805; x=1725954605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lqltuZsVvo3q+kL5FQoAhahgvZp8TI3+xOC4Ek386E=;
 b=NpWavYnieHg8Qc9/tzq8LIcaj7ZwqZ9+CwM/E0UBzuTP2Xs7ohbBoZjgVj7fs/IPY7
 frhKXFMmM5Ly+mx7Ma4OfEa098v+5fBzj21OKgXOE6H7I6PTF/seV6SixaYHHRlVDQTE
 buYAEZcq+Qi8QZRC2sIKyOG2Sv2tBxko9yNiVyN6GUmk2nRQlveCj+sNZvtCH3RPuLtD
 8aL+Qe26e7rdpHygqy89LbJTJdDqyFj/r6Xn3OvLR8CmI+CvNLal/a7DY3Fe37ZGyKGC
 pyyzkbB6PyDeaQEztgFpgM2NyNY7YOvm5i73n4gEZ/XY/T4Ba6A7dstECgfaUOgZI4lu
 RqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725349805; x=1725954605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lqltuZsVvo3q+kL5FQoAhahgvZp8TI3+xOC4Ek386E=;
 b=Ou4UNh/fi5SdA60uqvYiU5Yt12skRlvltRyJWZjBApvQBX30y6qx7dRzYniwUvNlYt
 pTMipO8oO+2Qvynu+UgFQgk7BRRlxyK4ztEa6K4nF0XuDrj9ZFhoiAl94DWfOcsRwI62
 IkQqilyECxVUI/a18VZfONJ4A+NIGZgZQO4NHM5vlgSOTz9Ki/DSMe0ZGZ81HgTDfD7y
 daYLQ4tGfnmTvDxcn37ir3QwjxpQFsbP1PPO7K3aTOmat4BcKRKzMYgAOA3SyqD7sd35
 +J9XfJTjf6lsAU03IkSuheG8tSF93aGGKgRemuYRZ6LM/vv+RpAblBvbSIw5bJgOQZpp
 5MOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjd/QtmBATyyykdI9MvrSSkpaEFbGCqyp8Bup0vfwIR2xt4NdXMxG7duK7qXm2rQX5+NNeLm9LapY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXIFO8PVGu0qc14VBUt5RD4b34IrUQc6XFgZh0AXNb3VN9N6jC
 cHyBMoU/C97KRB1xMnBtLah/s1WhAFZqjWUWSBLwAmzPdy9oHOnsFD57P8z4JH13SHiS6F66XiZ
 47MA9k0o7GgKyhDPT+d979GDPH1Zhc57fK6ODOg==
X-Google-Smtp-Source: AGHT+IEJwTXohM4H9uSVusjPmKwI6JnO7SPg+/suagC/qP96uj/Jk/AgITd3OvcJR2rJohaA8rXhIBIKARoJIvpPzkw=
X-Received: by 2002:a05:6512:3c9e:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-53546bde550mr9695782e87.38.1725349804799; Tue, 03 Sep 2024
 00:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-10-bdb05b4b5a2e@linaro.org>
 <CAA8EJppFCVQPFa1-o7T08Bs+vzbykDXwVTOq4=B2LuWJb2gYGw@mail.gmail.com>
In-Reply-To: <CAA8EJppFCVQPFa1-o7T08Bs+vzbykDXwVTOq4=B2LuWJb2gYGw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:49:53 +0800
Message-ID: <CABymUCPi-DbPW=Aos=m0mrHj2TgxEy=QNEFpbCsb3srr-qe1Eg@mail.gmail.com>
Subject: Re: [PATCH 10/21] drm/msm/dpu: fix lm number counter for quad-pipe
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Add the case to reserve multiple pair mixer for high resolution
>
> I think you already know what is missing here.

Add the case to reserve multiple pair mixer for high resolution. Current
code only support one pair of mixer usage case. To support quad-pipe
usage case, multiple pair mixers are needed.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 8 +++++++-
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 33cfd94badaba..f57725ad494d2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -54,7 +54,7 @@
> >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> >         (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> >
> > -#define MAX_CHANNELS_PER_ENC 2
> > +#define MAX_CHANNELS_PER_ENC 4
> >
> >  #define IDLE_SHORT_TIMEOUT     1
> >
> > @@ -2029,8 +2029,8 @@ static void dpu_encoder_helper_reset_mixers(struc=
t dpu_encoder_phys *phys_enc)
> >         struct dpu_hw_mixer_cfg mixer;
> >         int i, num_lm;
> >         struct dpu_global_state *global_state;
> > -       struct dpu_hw_blk *hw_lm[2];
> > -       struct dpu_hw_mixer *hw_mixer[2];
> > +       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +       struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> >         struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> >
> >         memset(&mixer, 0, sizeof(mixer));
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index e219d706610c2..77d7ff789346e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >                 if (!rm->mixer_blks[i])
> >                         continue;
> >
> > -               lm_count =3D 0;
> > +               /*
> > +                * Clear the last bit to drop the previous primary mixe=
r if
> > +                * fail to find its peer.
> > +                */
> > +               lm_count &=3D 0xfe;
> >                 lm_idx[lm_count] =3D i;
> >
> >                 if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global=
_state,
> > @@ -353,6 +357,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >
> >                 trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
> >                                          pp_idx[i] + PINGPONG_0);
> > +               DPU_DEBUG("reserve lm[%d]:%d, pp_idx[%d]:%d, dspp[%d]:%=
d for enc_id %d\n",
> > +                         i, lm_idx[i], i, pp_idx[i], i, dspp_idx[i], e=
nc_id);
> >         }
> >
> >         return 0;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
