Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18995A14A2C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 08:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D64810EA6F;
	Fri, 17 Jan 2025 07:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CeTasxHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA8610EA6F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 07:32:57 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so2814365276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 23:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737099177; x=1737703977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5hN3WCRaDcwfEGZIF7HwAWSSytle4jyv+q+dyIgSdU=;
 b=CeTasxHzKqV/3zCtRQ4pu2wpXpOBxDWpcAKk6J+Uoq2WBvKmRil1OuoiyqSksUvDvL
 PUmQ7hesnPD796LoCvpe07xkcCbNRLX/iwTwWpLTRk60/uSMWfrQut3G113OQnPFz8bk
 xTN4xiXUHTXeFeA19B4E2Ms1UVAC9w2adJ8fFugIYBgqT0XCzMpkzzrA3Vzxq11ko8sZ
 p74YfAIv9Fxz2K+Dp4xyDCCJJ5E9CITF+dQ/cqcCX+nVXu7Minxvc1qODlkV6vUgAzEc
 uWG+XBaCUidSXonqw4uLk1yg5UeSTuBlEw6lSsoVox6kYiyhUHNtYaAb2n8bpI7MSKZN
 mBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737099177; x=1737703977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5hN3WCRaDcwfEGZIF7HwAWSSytle4jyv+q+dyIgSdU=;
 b=Mi7adxbHaSvvmLt+LhxtyB721H+rKznhQtpgh08bKlCRMmajhRWwYHm1gCk6hdyxrO
 neS+4SDeqRA1rBFy7yd7vJ4Glzr3HXCgm8+7bnDJFPokFhw03QCbiNnHQfTE3kIG9fp0
 90gZDizU7CsXl9NHA9HZrpvM7q7NQkKPy9ZeAs7Rhry609rnXyGZcBKXVAXfTliLezPR
 j1suuyRTE+NfQOqS5xlYsNed+OvcvBTGt2YdI3n0KDU4RFmUixcfSjksU5VGDtvI1VcZ
 BoqEZfZce2Rmb0zGaPMEpemS13OobUSeaUaOVZL/Cw5IsB7HB5LpQjDn8lo0xEs6+u35
 Kv0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnMdqpChmPMN4FG85O9vO2VtYVwCIRU3KhGyPejZwfRFfNxWtpiXoyNX5DzlDnFW72TR4flQhnybQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeJ+hxYRhaj/Ji8fH9CaddB3hIcrFYQ6qJOhXcebL+tDbnRD7u
 cY3IxTsalnygeePvvAhmErAb9lnIFeiKw4qVFCPhccg8MGFqeJ6MeFEn5lwFdUs/c2SQ/8Yvjsq
 p5c9GBvVIl96tFs7dOAAHZEPmSjnLfzexw7V8AQ==
X-Gm-Gg: ASbGncvw72JIpDPVW1X+TI87nDL4nmhPz4ZIIJ9Y8yQDkZ1ShElXKU1u6AhOO0sjMrE
 7feKI+t+o6AfoCrUfgNs8dH2UfFO3ZEgrHLAoMyuaFvs=
X-Google-Smtp-Source: AGHT+IE+XYh2alu1rY2U8oCgLEh1aqoCMjyJMFnHicZCBv3oNDm+hi8vM03R6tYssS6lGIrrrW8gy6Wp3lPsC3GuOFk=
X-Received: by 2002:a05:6902:140c:b0:e4c:e9b8:eb37 with SMTP id
 3f1490d57ef6-e57b1030127mr1141878276.3.1737099175190; Thu, 16 Jan 2025
 23:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
 <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
In-Reply-To: <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 17 Jan 2025 15:32:44 +0800
X-Gm-Features: AbW1kvbp5yJi4HYj9X5TBWCrEONnlBk4y8iKuerYlGqjnYqdJtYg1reAc_pA1gY
Message-ID: <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > enabled.
>
> Why? What is the issue that you are solving?

    To support high-resolution cases that exceed the width limitation of
    a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
    additional pipes are necessary to enable parallel data processing
    within the SSPP width constraints and MDP clock rate.

    Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
    and dual interfaces are enabled. More use cases can be incorporated
    later if quad-pipe capabilities are required.

>
> > 4 pipes are preferred for dual DSI case for it is power optimal
> > for DSC.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++=
++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  6 files changed, 29 insertions(+), 14 deletions(-)
> >
>
> > @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >       /* Datapath topology selection
> >        *
> > -      * Dual display
> > +      * Dual display without DSC
> >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >        *
> > +      * Dual display with DSC
> > +      * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > +      *
> >        * Single display
> >        * 1 LM, 1 INTF
> >        * 2 LM, 1 INTF (stream merge to support high resolution interfac=
es)
> >        *
> >        * Add dspps to the reservation requirements if ctm is requested
> >        */
> > +
>
> irrlevant extra line, please drop.
>
> >       if (intf_count =3D=3D 2)
> >               topology.num_lm =3D 2;
> >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >                * 2 DSC encoders, 2 layer mixers and 1 interface
> >                * this is power optimal and can drive up to (including) =
4k
> >                * screens
> > +              * But for dual display case, we prefer 4 layer mixers. B=
ecause
> > +              * the resolution is always high in the case and 4 DSCs a=
re more
> > +              * power optimal.
>
> I think this part is thought about in a wrong way. If it was just about
> power efficiency, we wouldn't have to add quad pipe support.
> Please correct me if I'm wrong, but I think it is about the maximum
> width supported by a particular topology being too low for a requested
> resolution. So, if there is a DSC and mode width is higher than 5120
> (8.x+) / 4096 ( <=3D 7.x), then we have to use quad pipe. Likewise if
> there is no DSC in play, the limitation should be 2 * max_mixer_width.

Both width limitation and clock rate contribute to pipe number decision.
To support high resolution, the MDP clock may be required to overclock
to a higher rate than the safe rate. Current implementation does not
support checking clock rate when deciding topology. We can add the
clock rate check later with a new patch.
>
> >                */
> > -             topology.num_dsc =3D 2;
> > -             topology.num_lm =3D 2;
> > -             topology.num_intf =3D 1;
> > +
> > +             if (intf_count =3D=3D 2) {
> > +                     topology.num_dsc =3D dpu_kms->catalog->dsc_count =
>=3D 4 ? 4 : 2;
>
> This assumes that the driver can support 2:2:2. Is it the case?

The code falls back to 2:2:2 case here. But I guess 2:2:2 does not work yet=
.
How about below code for DSC case?

                 if (intf_count =3D=3D 2 && dpu_kms->catalog->dsc_count >=
=3D 4) {
                         topology.num_dsc =3D 4;
                         topology.num_lm =3D 4;
                         topology.num_intf =3D 2;
                 } else {
                         topology.num_dsc =3D 2;
                         topology.num_lm =3D 2;
                         topology.num_intf =3D 1;
                 }

>
> > +                     topology.num_lm =3D topology.num_dsc;
> > +                     topology.num_intf =3D 2;
> > +             } else {
> > +                     topology.num_dsc =3D 2;
> > +                     topology.num_lm =3D 2;
> > +                     topology.num_intf =3D 1;
> > +             }
> >       }
> >
> >       return topology;
>
> --
> With best wishes
> Dmitry
