Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837D96981D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4378510E44A;
	Tue,  3 Sep 2024 09:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mEqimGQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA3910E446
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:00:51 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6d74ff7216eso15375277b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725354051; x=1725958851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzXI1qraFC32y8PSZHxs3qrZ1v3I2001PgDQyaVPFY8=;
 b=mEqimGQP78LK3RgGlpCVec9NOCdb6uyYNhtxge2flXsrWVSIIoo9pKP+eRgdnaIa1D
 RotIgDxa3TLbDKBX6+7YnFyTHZ7LldZVqLxMxrfaMtLyV/lwbsen3wFvlU9l2W6yVfTa
 9JemaN3uulFAYls36CZpF+u20SaamsrremKm6u7k1Y06R0Px+fUfBCAI03cLLBx1wz3d
 5OrS5WJCQGNjSz29bafpSAM89Oo8hWHQ/b2rDtmD3KNFlG1akcVwbdoPxyThJhM3Wk+i
 LNVl50drwd4nsBG+H4qaadIHrxD7NrP4p9X8nTKj8nz55NWZyiIXtNNPEl7zjRNIvNEV
 5KFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725354051; x=1725958851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzXI1qraFC32y8PSZHxs3qrZ1v3I2001PgDQyaVPFY8=;
 b=NgY5+0Q1GSmrTBhFBYJq5UuScTWas/Nw03kxKzg6gQ4s7JpghV8hmvavQqSgSLLeke
 630Bnmhe5/a6xp3SdwY809zeoDDWLJ9NHCsghb08JsUl0xmu/BRiu9nfVgMY6I4SvB4d
 so92BvQocb8ncRdI68Kmsb0QmS+wdsF2I+y1XsdopuqugKOeDSi8R3+xL3y7zk5jG3KR
 NhrElCAVjmUhyZi8pI5Xh8en7ESjuHyTHHl8KmLRzBN8tnbgPfxHMyzCAAkJoVXzcBC3
 RXZ5QH0VKJQUiCdBBTMelteTTTeJbmfikXA3jMfK16Hjlk/qbJFP3JEBbbHg2417ng2+
 ceeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ0zr/u+VkpUI7bpkN5hY0S5dEPDhS0A96hIt9MqWecGfsR0ABFJ5/bLUvuNH2WTO/CaEm/cLz3Ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvGJhUoqrL17ZFNPtt3hwZoP4XakDekfUJu5tlraztjwwb6oy0
 Up3kv4lMX26eRy2rmUIqne6TOLXod8dBYUwrVceG5p6eWTH4486X3FpQRTPXHFkrYhBRccRW/Ud
 fOcfA8ZIZFNuSJ19A1WFNhOrBIylA4MSBNYe+uw==
X-Google-Smtp-Source: AGHT+IEtqczCdvweUykaC6gAScFx3adGVghBsWc2cZOE9ORfMTjKVTP6UEs2Qza961LkgKnkP3BZH+Lmp9Oru9Wqm7w=
X-Received: by 2002:a05:690c:39c:b0:6b1:735c:a2fc with SMTP id
 00721157ae682-6d40fe14bcdmr140534407b3.27.1725354050728; Tue, 03 Sep 2024
 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com>
 <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
In-Reply-To: <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:00:40 +0300
Message-ID: <CAA8EJppK=ngrNOXF8EbPubqWFAER6JqWp1z-GXYuL5hdAe_4mg@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
To: Jun Nie <jun.nie@linaro.org>
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

On Tue, 3 Sept 2024 at 10:53, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:38=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > @@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_=
plane *plane,
> > >                         return -E2BIG;
> > >                 }
> > >
> > > -               /*
> > > -                * Use multirect for wide plane. We do not support dy=
namic
> > > -                * assignment of SSPPs, so we know the configuration.
> > > -                */
> > >                 pipe->multirect_index =3D DPU_SSPP_RECT_0;
> > >                 pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> > >
> > > +               r_pipe->sspp =3D pipe->sspp;
> >
> > NAK
> >
> I do not understand what's your point here. If multi-rectangle mode is
> used, the 2 sw_pipe share a
> SSPP structure. Otherwise the right half of mixer pair does not work
> and no display on that side,
> because there is no SSPP to handle in r_pipe setup.

r_pipe->sspp is assigned dynamically and it signifies if r_pipe is to
be used or not. Also if the virtual planes are enabled, r_pipe->sspp
can differ from pipe->sspp.

--=20
With best wishes
Dmitry
