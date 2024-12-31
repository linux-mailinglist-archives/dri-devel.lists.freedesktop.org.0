Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B49FEFE5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 15:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAB810E0A3;
	Tue, 31 Dec 2024 14:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y/if8o6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B89610E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 14:05:34 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e460717039fso12011026276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 06:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735653873; x=1736258673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL17eu52TPn+FxCKD51YSXrmc7q5Hp1A9+hdV9KvlH0=;
 b=y/if8o6ndp8IDJn0Kisf2DKBbvQK2kEvNsR8/a3O658Cg1TjU5kDh8cmXl/4o1FO79
 p8GOeTYcUfkzvjsBpfto7WaTSAcxj2NVmAX8t7buZ4gZKLu9q1O2khJtBNA6VOcTSQM9
 ojXbieZGvRKR8enjicB+7wp1bjtIw42cdxHNcbuiVP9xiMHQmtljvCCWelfTAJQH+OST
 YGPBysnejKev7dVi1FKVVLrtyGPLBhrnzKl27HnD2rOwAYSdcMpx1XuAKIB8clvO8Oey
 4XGYZc664fKgI04xHXH+laJYeLVu18g+svC6FDTUxVbQ3VItKw8/iiLuFAggP12x+L5M
 +sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735653873; x=1736258673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rL17eu52TPn+FxCKD51YSXrmc7q5Hp1A9+hdV9KvlH0=;
 b=DidaQXzL9xRbhNUA9NNfKTlO7+5aHKud9L6g4xdBXB1oDLcYQQRDnWCwaBWt310N4j
 MPHOmUimKXWHTaAyPen5lXz2YdO918Tx89x8TLFwZhEoD4NHes/7PKuqhbPHYED8QzaG
 cENqWJxT3Khl5r43+DbcOW3/SpMj1zKHnR9cgyqIOJWzeNFpzZm7BzJTdFMj3Nu5ga91
 xAW1N19lB8ZHemXcwLGfOIacfLUPu6CcDUh5EcwOoB7nr/FzRheJv10ggOxOSACoQeOq
 zANFUCkn8pvCEHOcnXMRUfTAf91/T53Xz1brkNmWuHSC/GyFMcPPs1jdyrWvwSNF9kC1
 +Vbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJGESWFnc8uf0bJ3KIJWXtD6YSdVr+DVjo9xF11n+s1Giq+YzlEWOURxPZt34XKIfGoI2OaGnKZ74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Y2KEvQSrlG14eNBNlr8f+dnGpbwR4FA8kUg/kE4li7/+h9xR
 Zblz6W3bOMLXOjYE6mdGxQ1IvmupiXgAX2SagFDiTodvzyQHpRvUxAuxws0MW6mkMg9HIG4MPxU
 2lNvmZf4UTLvKOIooNR1IymSkPj2WA+EJSpAe6A==
X-Gm-Gg: ASbGncvmRmdt8t93si/6g57JnzP/KagSlA54NIICJrmdfK/9m9IoprWaUhqvnrj7uUZ
 6jdQY+hW7BNXVT58NBB4UNvNZMgKiQnegPFJFs+TaUi0gcEwn9jjOB5YcbxVvwr/dI+HqQJ4=
X-Google-Smtp-Source: AGHT+IHu5RvYyC4nB2qf+XDJ+++3gqSi2Op4GcMB04A2jw0fnQSrmJDmXEVSJBJcKxrFc2tdYxydWafdNf7U76/hxNI=
X-Received: by 2002:a05:690c:113:b0:6ef:96f8:b609 with SMTP id
 00721157ae682-6f3f821a21dmr343989677b3.31.1735653873018; Tue, 31 Dec 2024
 06:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
 <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
 <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
In-Reply-To: <CABymUCPDTxR7drbanHpjYmVgQyHqWSWwL-_rsFWZ9=uOFj2kPQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Dec 2024 16:04:22 +0200
Message-ID: <CAA8EJpp-sRDLWMYHO_m6J=iFQArqiRF143QEj-KzntQXgyc0ow@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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

On Tue, 31 Dec 2024 at 15:24, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=
=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 06:29=E5=86=99=E9=81=93=EF=BC=9A
>
>
> >
> > On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> > > Add pipe as trace argument to ease converting pipe into
> > > pipe array later.
> >
> > Isn't it already converted in on of the previous patches? Also you are
> > adding it to a particular trace function, trace_dpu_crtc_setup_mixer().
>
> It is converted in this patch. But this patch should be earlier than
> the patch to
> convert pipe into array actually. Will reverse the sequence in next versi=
on.
> Yes, I am adding it to a particular trace function. Do you mean I should =
mention
> the specific function in title?

Mentioning it in the commit message is enough.

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
> > >  2 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 72ed8749cd716..6841d0504d450 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm=
_crtc *crtc,
> > >
> > >       trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> > >                                  state, to_dpu_plane_state(state), st=
age_idx,
> > > -                                format->pixel_format,
> > > +                                format->pixel_format, pipe,
> > >                                  modifier);
> > >
> > >       DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d mul=
tirect_idx %d\n",
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_trace.h
> > > index 5307cbc2007c5..cb24ad2a6d8d3 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> > > @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> > >       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
> > >                struct drm_plane_state *state, struct dpu_plane_state =
*pstate,
> > >                uint32_t stage_idx, uint32_t pixel_format,
> > > -              uint64_t modifier),
> > > +              struct dpu_sw_pipe *pipe, uint64_t modifier),
> > >       TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> > > -             pixel_format, modifier),
> > > +             pixel_format, pipe, modifier),
> > >       TP_STRUCT__entry(
> > >               __field(        uint32_t,               crtc_id        =
 )
> > >               __field(        uint32_t,               plane_id       =
 )
> > > @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
> > >               __entry->dst_rect =3D drm_plane_state_dest(state);
> > >               __entry->stage_idx =3D stage_idx;
> > >               __entry->stage =3D pstate->stage;
> > > -             __entry->sspp =3D pstate->pipe.sspp->idx;
> > > -             __entry->multirect_idx =3D pstate->pipe.multirect_index=
;
> > > -             __entry->multirect_mode =3D pstate->pipe.multirect_mode=
;
> > > +             __entry->sspp =3D pipe->sspp->idx;
> > > +             __entry->multirect_idx =3D pipe->multirect_index;
> > > +             __entry->multirect_mode =3D pipe->multirect_mode;
> > >               __entry->pixel_format =3D pixel_format;
> > >               __entry->modifier =3D modifier;
> > >       ),
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
