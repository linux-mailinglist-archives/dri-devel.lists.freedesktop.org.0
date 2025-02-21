Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C21A3FA66
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ED210EAD2;
	Fri, 21 Feb 2025 16:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gbbx3NcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA5910EAD2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:12:28 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6fb95249855so19876627b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740154348; x=1740759148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65xzch6iPMqxFMiA53gm5fHWZzrCGPb+BPyetZgHuuE=;
 b=gbbx3NcIM+G9m9XWrQ91v14sg5E+Lkb5G1xHGWgAP/SEk5Pj52LXHLdGYAcSQ2y1Xc
 GodEaG7A8H024kA5LYmDwSA7aYziu016BO/HHSTov78oFixVpFkQoa6jZnzbqjTAfplE
 oERx0XCOT1UR48jhLTn1fyr/Pbqw8D+7VsWA++ObxbkNfwsAyok9knqAcOfIY0gSTYXe
 PFXXrX9g8xUB5YM0TVSG1vOe+bS2SrtPdDHgvoVRAAA4u0e4/QDB7HUMsyuMLi1S/Gdu
 jALH+SYangsUcH+p3oI25IOVm0awqZbXqsxXlBma0R4sn45ov7LVOgN0Fm6xUzXDoSaB
 N0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154348; x=1740759148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65xzch6iPMqxFMiA53gm5fHWZzrCGPb+BPyetZgHuuE=;
 b=cCGDh1dfEfNgSk/emWElDL/SASAvCkYfpRWKs8Pybm5+ee57H/sl7B91/NlXL0mgzr
 Jb3qfxEBc0nLSbTyCO8uDcVo9Sw0M+/U7HyrrisP5K2GiC3vO1JR/8xJoHqLcNig+D06
 1LurzK+v7uqCMQql67qj5foaTJYnnnxBjaumaCnkfflbd1LEDzH/OJYZiWSSrdLvR6OF
 dKPzXosxFkNcd5mBDYFQgx1wkkvKRsOyCF8O5xwiD0NhtifeEMhEiivbktoRQ7njYOho
 MOTHga1YT/28vIc17lQsAv/96DeWzeSC1kOOOqcrPVQPPfpy62AEE/kaYTGW10lltaE2
 MzEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCSAiYzZ9Tz8YVhZMxyIcpccS9l83xWaM1bUgMYlFPc3BOSpuAGbwNwIF4YPZPHNGb7E/HEFYFiW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAaQKUr0XvUJJv7IJFKKnRC2VbI6RQNT2dT9gy2MvWOAijV+po
 NunYgMgSoKF/0rdSEhG643QAWncy4mpvoLxOmvrO+lVJxbe/KCQqEpDYTcjTf4peH6rKdiI+CQV
 FmFbuVVLjkdUncl+X+7OACLgGoebJOtQIYsJokA==
X-Gm-Gg: ASbGncv5CuCQlcWKavgTdZ5FAZ2SpjF2540VrhqYSYtBADvztWmIWuXFuPjiu34Ea3U
 r144U7fpfhZ/6HJkiKTBtux1o/lz7K/CfDD3rhnrfr69Nj19ckK6AXW4Ua8Ar5aeBMoL+7UU0VL
 0SizCmStFg4m8e
X-Google-Smtp-Source: AGHT+IGhNDJlgVkhfevt2ccrr13CZOx64ah/8NXOZPmYhx9ZCe7w01Cm/DjAmVoBy2piD5CQUVdcDHmyt87znifdS/U=
X-Received: by 2002:a05:690c:3393:b0:6fb:9c08:4980 with SMTP id
 00721157ae682-6fbcc382c64mr33877327b3.27.1740154347729; Fri, 21 Feb 2025
 08:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
 <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
 <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com>
 <djq577v6e7cnvybegddxfzqgg5eat4ormqyopa4b5j7wa6spfk@jwuy4cash6ch>
In-Reply-To: <djq577v6e7cnvybegddxfzqgg5eat4ormqyopa4b5j7wa6spfk@jwuy4cash6ch>
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 22 Feb 2025 00:12:16 +0800
X-Gm-Features: AWEUYZlpK1Ks7M8EF1HJs2GjsF4cj_v_CBxkpXT6E_5dZ-ZfLiCHfDvGXKyuqKk
Message-ID: <CABymUCOHTecLL7zvsXA1uw=3hr4TAL0PZN6AEwFVGRX5G0_j9g@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 21, 2025 at 04:07:45PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 00:17=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=
=B42=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > > > > Currently, only 2 pipes are used at most for a plane. A stage s=
tructure
> > > > > > describes the configuration for a mixer pair. So only one stage=
 is needed
> > > > > > for current usage cases. The quad-pipe case will be added in fu=
ture and 2
> > > > > > stages are used in the case. So extend the stage to an array wi=
th array size
> > > > > > STAGES_PER_PLANE and blend pipes per mixer pair with configurat=
ion in the
> > > > > > stage structure.
> > > > > >
> > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++=
++++++----------
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc9=
4354faaa816fe74566784844c 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(stru=
ct drm_crtc *crtc,
> > > > > >                                      struct dpu_hw_stage_cfg *s=
tage_cfg
> > > > > >                                     )
> > > > > >  {
> > > > > > -     uint32_t lm_idx;
> > > > > > +     uint32_t lm_idx, lm_in_pair;
> > > > > >       enum dpu_sspp sspp_idx;
> > > > > >       struct drm_plane_state *state;
> > > > > >
> > > > > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(stru=
ct drm_crtc *crtc,
> > > > > >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->mu=
ltirect_index;
> > > > > >
> > > > > >       /* blend config update */
> > > > > > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > > > > > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > > > > > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> > > > > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_ss=
pp(mixer[lm_idx].lm_ctl, sspp_idx);
> > > > >
> > > > > I almost missed this. Why is this necessary?
> > > >
> > > > It is protective code. In case there is only 1 LM, we should not
> > > > iterate 2 LM in a stage.
> > >
> > > That's not what the code does.
> >
> > I do not get your iea. _dpu_crtc_blend_setup_pipe() is called with
> > num_mixers set as:
> > cstate->num_mixers - (stage * PIPES_PER_STAGE).
> > So lm_in_pair will get the LM number in this stage to iterate.
>
> You have written that it is incorrect to iterate over two LMs if we have
> one. The code does a different thing: 'don't iterate over more than two
> LMs'. It would be more idiomatic to write it as:
>
> lm_in_pair =3D min(num_mixers, 2);
>
> And then it is obvious that it is not 'lm_in_pair' (note, singular), but
> something like 'lms_in_stage'. I'd really ask you to pull this up to a
> caller function and pass a correct num_mixers instead.

Thanks for the suggestion! min() is much more readable than mine version. A=
nd
stage is more proper than LM pair as a stage may only contain one LM. Will
replace the term.

For the pulling up to a caller, you mean the min(num_mixers, 2) here, right=
?

>
> > >
> > > > >
> > > > > >  }
> > > > > >
> > > > >
> > > > > [...]
> > > > >
> > > > > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct d=
rm_crtc *crtc)
> > > > > >                       mixer[i].mixer_op_mode,
> > > > > >                       ctl->idx - CTL_0);
> > > > > >
> > > > > > +             /*
> > > > > > +              * call dpu_hw_ctl_setup_blendstage() to blend la=
yers per stage cfg.
> > > > > > +              * There are 4 mixers at most. The first 2 are fo=
r the left half, and
> > > > > > +              * the later 2 are for the right half.
> > > > > > +              */
> > > > >
> > > > > The comment is invalid until you introduce quad pipe, currently t=
here
> > > > > are 2 mixers at most. However you can just say something like 'st=
age
> > > > > data is shared between PIPES_PER_STAGE pipes'.
> > > >
> > > > Accepted.
> > > > >
> > > > > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->id=
x,
> > > > > > -                     &stage_cfg);
> > > > > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > > > > >       }
> > > > > >  }
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/driv=
ers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682=
f26d02074505c5474a547a814 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > @@ -34,6 +34,7 @@
> > > > > >  #define DPU_MAX_PLANES                       4
> > > > > >  #endif
> > > > > >
> > > > > > +#define STAGES_PER_PLANE             2
> > >
> > > BTW, This should be 1 for now.
> >
> > Yeah, it can be added in the last patch.
> > >
> > > > > >  #define PIPES_PER_PLANE                      2
> > > > > >  #define PIPES_PER_STAGE                      2
> > > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > > >
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
