Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D33A421A8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2608810E447;
	Mon, 24 Feb 2025 13:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aTksmlZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79F410E120
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:14:34 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6fbaf4cf2b5so29846337b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 02:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740392074; x=1740996874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BT21T9ZsOx2rQl7hC4pSS3NJ3nW+q3IUFkB1OpRZPQ=;
 b=aTksmlZ7PYDxPi+cEYXlM4EyaQ5ZrdGLpqHU1nbBnfNGXGKSshvIkkicTIOdUoLFo/
 rOptLsSP0BLOoR1M2c0ael8L296IHcWGWzNZJaLB6lZ2u/mVXeFwc1x+FVNCrhg7Sxb7
 sLYGJE2mWJg+61riiWfLOTVVFGoMg4PQrvaIuA0c4pfkRziV+ohSm/gd3NwQynGWxA5D
 76agZ+mHi38AuS6FP5fp801wde7C5/dQuVH8ftW7/aRPyhgW7NtbI49fU77icsfrYm0F
 OTN9sSZ08kYgfj2Rzh/tkhLQt0w8cycrwrzMPqN1Q4JKierhCcYpoA+dwWa3/8BA1zeD
 N4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740392074; x=1740996874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BT21T9ZsOx2rQl7hC4pSS3NJ3nW+q3IUFkB1OpRZPQ=;
 b=dDBwVz3cfS9JMuZF5cGT4c3jxaeASQiFR+m4vNf7OtpItNDxhcVwe8L4N3hPxBcTlK
 BwXHwUDh9UTK8Z/plm2m24k0pQdlSKH9+gKWcu5K8TixZ0+HC3xHl1w+WzqTeSKlXTgc
 NB7r/zCPJIG0wkHo+ULnyRYfA7UCYzqrdWATDHDVrSkvSMv54q5lgDCYvRtanMKvHL76
 XmD9rr87SH8fdkjMlqEd41U9Btslu26D5GL8J8IOj1ZXIUuhAJK05fGQ0H1PlpTy9RAU
 6fx46pGU7VwOKfGUEd0+P4iTJ0gOzuqyWVDDuKU7nvISw/5g4DyQE1SKrE+SojzE/HC7
 Acgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOc7fnNKjihFJfHj0fMBMgEqIbNotPzbgaMIHwhLBtsDjlBRWJvpIXgeXZLAxTsm4nzRPVIYMmqa4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxFdGBpS3pz6BINPXLnlur+ETXurR81hEiQNs1Zo/ZqDTRVO7R
 iBtoYj7+tGukKN5Bo6GgBGc2kNMK3MmlQhArSaqNLSDPX/epi3ew02yNYV6JGuKkbnjeMe/Q2YO
 lZIgY0j72rT4A+5P1bbvv/C1xW+Ky8UjGlX+sPw==
X-Gm-Gg: ASbGncvWO0CNOMdZmVazJJydpDnrh6ZjlDyPhfZ0Azn2vTsf0R1zX30LK33mM99wP4n
 k/CZX8hEgrEzjBLMUcaFwycIbMXV7PCdyhPl5GP/swbNYQzuRS+JGlBFmhg+dqjlKeHTP+X7hoD
 +yRzVqLl09jhFF
X-Google-Smtp-Source: AGHT+IHHGiZHgy3s+8XmerKKacF1ioGYVr8/i83Pon+/HFCKY/mSb0SsQmhW+azRKtQiXlPjwnGd0WwE37FqCzJtHXw=
X-Received: by 2002:a05:690c:9c05:b0:6f7:5605:c62b with SMTP id
 00721157ae682-6fbcc3673cfmr103922197b3.27.1740392073624; Mon, 24 Feb 2025
 02:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
 <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
In-Reply-To: <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 24 Feb 2025 18:14:22 +0800
X-Gm-Features: AWEUYZm42Zh3tL3vnQp2tEApXMrcBNfOORo391vJrlHk1uL8HJBN-be9zH45G4k
Message-ID: <CABymUCOnnWQZpOhgDfENmWrTUuwb76zSN7nSeO+eyNp4k+PKRw@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
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
=9C=8822=E6=97=A5=E5=91=A8=E5=85=AD 00:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Feb 17, 2025 at 10:16:02PM +0800, Jun Nie wrote:
> > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > quad-pipe usage scenarios require four pipes and involve configuring
> > two stages. In quad-pipe case, the first two pipes share a set of
> > mixer configurations and enable multi-rect mode when certain
> > conditions are met. The same applies to the subsequent two pipes.
> >
> > Assign SSPPs to the pipes in each stage using a unified method and
> > to loop the stages accordingly.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++----=
--------
> >  1 file changed, 39 insertions(+), 24 deletions(-)
> >
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             for (i =3D stage_id * PIPES_PER_STAGE; i < (stage_id + 1)=
 * PIPES_PER_STAGE; i++) {

Do you mean define and assign r_pipe / r_pipe_cfg here?

> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe_cfg =3D &pstate->pipe_cfg[i];
> > +
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) =3D=3D 0)
> > +                             break;
> > +
> > +                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > +                     if (!pipe->sspp)
> > +                             return -ENODEV;
> > +
> > +                     r_pipe =3D &pstate->pipe[i + 1];
> > +                     r_pipe_cfg =3D &pstate->pipe_cfg[i + 1];
> > +
> > +                     /*
> > +                      * If current pipe is the first pipe in pipe pair=
, check
> > +                      * multi-rect opportunity for the 2nd pipe in the=
 pair.
> > +                      * SSPP multi-rect mode cross mixer pairs is not =
supported.
> > +                      */
> > +                     if ((i % PIPES_PER_STAGE =3D=3D 0) &&
>
> Please move r_pipe / r_pipe_cfg definition and assignment here.

r_pipe / r_pipe_cfg is used in this if(). Please see above question.
>
>
> > +                         drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 =
&&
> > +                         dpu_plane_try_multirect_parallel(pipe, pipe_c=
fg, r_pipe, r_pipe_cfg,
> > +                                                           pipe->sspp,
> > +                                                           msm_framebu=
ffer_format(plane_state->fb),
> > +                                                           dpu_kms->ca=
talog->caps->max_linewidth)) {
> > +                             i++;
> > +                     } else {
> > +                             /* multirect is not possible, use two SSP=
P blocks */
> > +                             pipe->multirect_index =3D DPU_SSPP_RECT_S=
OLO;
> > +                             pipe->multirect_mode =3D DPU_SSPP_MULTIRE=
CT_NONE;
> > +                             DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d=
 for pipe %d.\n",
> > +                                             pipe->sspp->idx - SSPP_NO=
NE, i);
> > +                     }
> > +             }
> >       }
> >
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
