Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B8A3FB0C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D3E10EAE8;
	Fri, 21 Feb 2025 16:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m0BUuYeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37B810EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:25:03 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6f4b266d333so16969017b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155102; x=1740759902; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7dw2LSPn4p4oHMVWGGbX7p83lj89Xs+Zx7joVuGBhQE=;
 b=m0BUuYeRbienXNglL++M1CA4DqM6wfBqruaDrBV/kS9nb9nBhz98sNZUxGabPI/AEX
 m/WzrM05mADQmYYPOGQRgxHm44Vxca7p+q3bl5YfaYlmj7WCaVdDupnZ7MZFwKHuEqlZ
 lsh0pcvYUz50bDB5I0pGSecTxcIfhIpr+pMnXO//mmWBzmiyTAbreTaEdhz/3ykyfM9F
 xNT1qnDhXOx7EZF1zdf+r62XUvnONS14TogLMG+S5ZAzdBNFZR0PyPA6rs2PVrzm4TSv
 R9V585+B+z4VhH1KJEvDzQ3hM3Z/nBTLMK54+lWhyRqX84jlVqH6vY6P+BvXzNMTbjLX
 /7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155102; x=1740759902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dw2LSPn4p4oHMVWGGbX7p83lj89Xs+Zx7joVuGBhQE=;
 b=Q34F8UwRWyVqEeMwmDALCH0kU56M5In4RRjlN+17C8KIUjjP0W27QNYlOQDsyfOxnw
 WERwnBHtmT2vv2gCj3Iv44Q1Lgu+PGUN47Su6jqp09nuTFQX9LJZz0AbY2TBxx/MPvKi
 X75tujQN0sH9s+61EJnKSq1Fnbn0AeiRhyyyDFjAggG0HElpIeFFG8e+lvJMFgZTOuVV
 Tmi73D8rZxQun2JyMImW1mn58ZHhXHeut/+FQPeQKAApGEMx9BRMa1esQ64cxDo3FwGY
 68Rf/t7mBJYUNVI2csMRVS0+p9Bj5vORrMZT8CT9pkUWzoINs6uprr1fCpXRYbf475h5
 i4Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXk1mfa0HtKqOl6tS9VKZaxXOp1Bl6abZ9NHtGe2ApxzY0J24Xp1JBf5zRwDoTHhZ2PJTGnnEpLYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg1c3fFeAj/dL6GRzpuKUYaTUBiDcQm6YfpQiD9SvutO/5N+mv
 x8JuYU2dSpX39TOMEtNDIFirKiKpGkR5qrVxCfJs2ZqjFIv00cjOkkOCFtOxVhmBp3IZ/jRHU39
 bllHLIRRKA/kiWvXrB7Xwtn8uRfPVvCmWYMB+pg==
X-Gm-Gg: ASbGncuYWOYGsxbA0XHeQzu8xJOt/NgkwjdtuXFVDP6n3tFBQ3bKBEsACGANa2QlItN
 7dfBfAyQYAQ3O2obEcldgkT3sQwlh7G0Z8dpNk9hqs4Ql1lJa2hgvlqAGwfxwBMYHDSKHw5gDgG
 k7lWKtFOt32TefVPpP4iq1hg==
X-Google-Smtp-Source: AGHT+IHSP4qUUydGpYdXtz2gK85IvsMIHQC8OSLidB2Ckf6s9uE7p/Zt+DVtkEXwyAE91tbj7srKBQjREnpYB2HOfOI=
X-Received: by 2002:a05:690c:46c7:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-6fbcc85fbd6mr36065247b3.32.1740155102557; Fri, 21 Feb 2025
 08:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
 <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
 <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com>
 <djq577v6e7cnvybegddxfzqgg5eat4ormqyopa4b5j7wa6spfk@jwuy4cash6ch>
 <CABymUCOHTecLL7zvsXA1uw=3hr4TAL0PZN6AEwFVGRX5G0_j9g@mail.gmail.com>
In-Reply-To: <CABymUCOHTecLL7zvsXA1uw=3hr4TAL0PZN6AEwFVGRX5G0_j9g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 18:24:51 +0200
X-Gm-Features: AWEUYZk6hXewd_nXlg1xB3QA0qyGnOQaVvRf84wUzT4pvI9PIs5mozaQq_9coHg
Message-ID: <CAA8EJpppBjxenqXX3baEV2mmxBHEhT7wSanwY5Dq17Lcsc=wLA@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
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

On Fri, 21 Feb 2025 at 18:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Feb 21, 2025 at 04:07:45PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B4=
2=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 00:17=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=
=B9=B42=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=
=9A
> > > > > >
> > > > > > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > > > > > Currently, only 2 pipes are used at most for a plane. A stage=
 structure
> > > > > > > describes the configuration for a mixer pair. So only one sta=
ge is needed
> > > > > > > for current usage cases. The quad-pipe case will be added in =
future and 2
> > > > > > > stages are used in the case. So extend the stage to an array =
with array size
> > > > > > > STAGES_PER_PLANE and blend pipes per mixer pair with configur=
ation in the
> > > > > > > stage structure.
> > > > > > >
> > > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++=
++++++++----------
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > > > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffc=
c94354faaa816fe74566784844c 100644
> > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(st=
ruct drm_crtc *crtc,
> > > > > > >                                      struct dpu_hw_stage_cfg =
*stage_cfg
> > > > > > >                                     )
> > > > > > >  {
> > > > > > > -     uint32_t lm_idx;
> > > > > > > +     uint32_t lm_idx, lm_in_pair;
> > > > > > >       enum dpu_sspp sspp_idx;
> > > > > > >       struct drm_plane_state *state;
> > > > > > >
> > > > > > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(st=
ruct drm_crtc *crtc,
> > > > > > >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->=
multirect_index;
> > > > > > >
> > > > > > >       /* blend config update */
> > > > > > > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > > > > > > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > > > > > > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> > > > > > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_=
sspp(mixer[lm_idx].lm_ctl, sspp_idx);
> > > > > >
> > > > > > I almost missed this. Why is this necessary?
> > > > >
> > > > > It is protective code. In case there is only 1 LM, we should not
> > > > > iterate 2 LM in a stage.
> > > >
> > > > That's not what the code does.
> > >
> > > I do not get your iea. _dpu_crtc_blend_setup_pipe() is called with
> > > num_mixers set as:
> > > cstate->num_mixers - (stage * PIPES_PER_STAGE).
> > > So lm_in_pair will get the LM number in this stage to iterate.
> >
> > You have written that it is incorrect to iterate over two LMs if we hav=
e
> > one. The code does a different thing: 'don't iterate over more than two
> > LMs'. It would be more idiomatic to write it as:
> >
> > lm_in_pair =3D min(num_mixers, 2);
> >
> > And then it is obvious that it is not 'lm_in_pair' (note, singular), bu=
t
> > something like 'lms_in_stage'. I'd really ask you to pull this up to a
> > caller function and pass a correct num_mixers instead.
>
> Thanks for the suggestion! min() is much more readable than mine version.=
 And
> stage is more proper than LM pair as a stage may only contain one LM. Wil=
l
> replace the term.
>
> For the pulling up to a caller, you mean the min(num_mixers, 2) here, rig=
ht?

Yes, to _dpu_crtc_blend_setup_mixer(). And of course. use a proper define f=
or 2.

>
> >
> > > >
> > > > > >
> > > > > > >  }
> > > > > > >
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct=
 drm_crtc *crtc)
> > > > > > >                       mixer[i].mixer_op_mode,
> > > > > > >                       ctl->idx - CTL_0);
> > > > > > >
> > > > > > > +             /*
> > > > > > > +              * call dpu_hw_ctl_setup_blendstage() to blend =
layers per stage cfg.
> > > > > > > +              * There are 4 mixers at most. The first 2 are =
for the left half, and
> > > > > > > +              * the later 2 are for the right half.
> > > > > > > +              */
> > > > > >
> > > > > > The comment is invalid until you introduce quad pipe, currently=
 there
> > > > > > are 2 mixers at most. However you can just say something like '=
stage
> > > > > > data is shared between PIPES_PER_STAGE pipes'.
> > > > >
> > > > > Accepted.
> > > > > >
> > > > > > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->=
idx,
> > > > > > > -                     &stage_cfg);
> > > > > > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > > > > > >       }
> > > > > > >  }
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/dr=
ivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be56=
82f26d02074505c5474a547a814 100644
> > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > > @@ -34,6 +34,7 @@
> > > > > > >  #define DPU_MAX_PLANES                       4
> > > > > > >  #endif
> > > > > > >
> > > > > > > +#define STAGES_PER_PLANE             2
> > > >
> > > > BTW, This should be 1 for now.
> > >
> > > Yeah, it can be added in the last patch.
> > > >
> > > > > > >  #define PIPES_PER_PLANE                      2
> > > > > > >  #define PIPES_PER_STAGE                      2
> > > > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > > > >
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > With best wishes
> > > > > > Dmitry
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
