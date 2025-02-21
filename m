Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE14A3EDE0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 09:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDE410EA3D;
	Fri, 21 Feb 2025 08:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PCaZKGuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1472110EA4A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:07:59 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6f678a27787so16283457b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740125278; x=1740730078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKLARkfaaKwz/7mRhDEGEg4d9xF3Ru4DEnZAZer9QI0=;
 b=PCaZKGujumQ1yCW15suVSJmDoKeKhgn9krjkC/9YR1on7ekompGHT9fv9EHC7dYR6J
 Qm+BLMBaJ5zk07v1BeNSeQSH+SWZklsuSIy1mJFP38RpqkvPhKlfmTYotmTh4DKP6kXN
 uH7+kMAITs5bcH614jTJ1ptuqbD7fmjCnvPi7dnBhl9MArFyMqp8/CjG7EfxJ0bPUQL2
 ++iHLznzBaHEp7XW47oL0GLqfNF12/qhmPbJ18TEj0k6ccRXY0u/u5LMDwe3ozExB4L5
 af0YbXNNXP6SyTpKOIVNGHyFRRqtMRmr8mKeBq0G/ChhJsNXiXEepZcBZSd3qBlYLFEy
 M2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740125278; x=1740730078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKLARkfaaKwz/7mRhDEGEg4d9xF3Ru4DEnZAZer9QI0=;
 b=ScE26rHBNVR6acs2d8F8dFYPQf0vPfAXEiO/9d7cfQJOt61JGZTT3TfVLvJV23AMQp
 lwfUFjCXFrKaaTHwHj5Ht2BqDd4ufeZyXNhz5JryDgkwyP8cX6V6KWNvDqwhyT9e0ej4
 IWXJJkEfCHqXKmkPvuSOlmRuCXvjt8mRbojDeuevDfmeWLY0SvUcetDpDJGriLkVQTD3
 yJ7IIXY0pmxwdwZkCAOYRa7z+OEO2xTfgJtiGu9J/u+glRwLnbqSpHZnWeY2TU6FNlu/
 7uERglfaQMbYgBuUePqwqnzWpEUPJXswmT+TuZGQhw94M2U1ZmQ6G+h04EanERgLxFBm
 tuOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi6jODRPXI2XtVLM9yE0Vn0Zh+QFMRcdBAXpFsJFrOQuUOa+v0negkJbrHLJEm2b3eauTGMlU59Z8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ+oi5fmFWOBEPZ0xsRIOInIBoNDELPVE6iWh45yl/ShyJ9qi+
 htLnec+Wn02O9j66VOhH9UaIbLhuyneV1D83/mhkvmF5TENYes241njuQmpwV1sZqiaXZfL8YKt
 +QZanPooVFNAQXyqXPUNYg0EPutI5vBChRquigw==
X-Gm-Gg: ASbGncsF8Tnt5yW62ofGJgZQgXc18Bpmj+Vf6oB4ZPudk+cx7i60uaJiU9SIPikFB1T
 yPqsnk9z1f36sOPl7HAnPGAlaviV3/o5Dt2ykqZk6s0ylMd6DZfcrUk+sGXnCaA7rB/ZkS8W/iM
 sFWQsErSKfWcuJ
X-Google-Smtp-Source: AGHT+IHr2Wt5r/ae1OtDGgTQeXf4bmm0pRkFgOlmNseOyKuTFSKX76LPYNlKpjw3JATtGd1XmmsjYnJQVJjXE60Qut8=
X-Received: by 2002:a05:690c:7409:b0:6f7:406e:48d with SMTP id
 00721157ae682-6fbcc3942efmr21304927b3.35.1740125277969; Fri, 21 Feb 2025
 00:07:57 -0800 (PST)
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
 <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
In-Reply-To: <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 21 Feb 2025 16:07:45 +0800
X-Gm-Features: AWEUYZlT0zegnUUFwqf9cd6gL2K4vN_ADtmplkuq26WeBuVh9ov_dWbeEYx7A5c
Message-ID: <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com>
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
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 00:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=
=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > > Currently, only 2 pipes are used at most for a plane. A stage struc=
ture
> > > > describes the configuration for a mixer pair. So only one stage is =
needed
> > > > for current usage cases. The quad-pipe case will be added in future=
 and 2
> > > > stages are used in the case. So extend the stage to an array with a=
rray size
> > > > STAGES_PER_PLANE and blend pipes per mixer pair with configuration =
in the
> > > > stage structure.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++=
++----------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc94354=
faaa816fe74566784844c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct d=
rm_crtc *crtc,
> > > >                                      struct dpu_hw_stage_cfg *stage=
_cfg
> > > >                                     )
> > > >  {
> > > > -     uint32_t lm_idx;
> > > > +     uint32_t lm_idx, lm_in_pair;
> > > >       enum dpu_sspp sspp_idx;
> > > >       struct drm_plane_state *state;
> > > >
> > > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct d=
rm_crtc *crtc,
> > > >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->multir=
ect_index;
> > > >
> > > >       /* blend config update */
> > > > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > > > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > > > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> > > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(m=
ixer[lm_idx].lm_ctl, sspp_idx);
> > >
> > > I almost missed this. Why is this necessary?
> >
> > It is protective code. In case there is only 1 LM, we should not
> > iterate 2 LM in a stage.
>
> That's not what the code does.

I do not get your iea. _dpu_crtc_blend_setup_pipe() is called with
num_mixers set as:
cstate->num_mixers - (stage * PIPES_PER_STAGE).
So lm_in_pair will get the LM number in this stage to iterate.
>
> > >
> > > >  }
> > > >
> > >
> > > [...]
> > >
> > > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_c=
rtc *crtc)
> > > >                       mixer[i].mixer_op_mode,
> > > >                       ctl->idx - CTL_0);
> > > >
> > > > +             /*
> > > > +              * call dpu_hw_ctl_setup_blendstage() to blend layers=
 per stage cfg.
> > > > +              * There are 4 mixers at most. The first 2 are for th=
e left half, and
> > > > +              * the later 2 are for the right half.
> > > > +              */
> > >
> > > The comment is invalid until you introduce quad pipe, currently there
> > > are 2 mixers at most. However you can just say something like 'stage
> > > data is shared between PIPES_PER_STAGE pipes'.
> >
> > Accepted.
> > >
> > > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > > > -                     &stage_cfg);
> > > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > > >       }
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682f26d=
02074505c5474a547a814 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > @@ -34,6 +34,7 @@
> > > >  #define DPU_MAX_PLANES                       4
> > > >  #endif
> > > >
> > > > +#define STAGES_PER_PLANE             2
>
> BTW, This should be 1 for now.

Yeah, it can be added in the last patch.
>
> > > >  #define PIPES_PER_PLANE                      2
> > > >  #define PIPES_PER_STAGE                      2
> > > >  #ifndef DPU_MAX_DE_CURVES
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
