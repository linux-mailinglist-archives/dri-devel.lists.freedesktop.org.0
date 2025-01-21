Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1335EA17680
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 05:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D9210E053;
	Tue, 21 Jan 2025 04:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l5CgKuan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543C210E053
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 04:28:37 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e455bf1f4d3so7074021276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 20:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737433716; x=1738038516; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZSNB6g5UtUoImhML+UGNfXWXkjaOAV6MUUxlrXnbfE=;
 b=l5CgKuanFCBlh2gDuphdBKYkWW5ONjMVSWemi0WM5ugLVyy6jNV3/cc+NOvvYISuNH
 POG9rxwKXyPPtmFFl1vFSJAO2xzLyfk5Vt0i5ez0eGQaOylgyfR1ian7HFbg/gvwv9mv
 zmRZItVk+di3aciZGa9pBkAuKVRW2RbUTT55FzZR8TKxWMFwonrX9TWLjtzK+Sns2yCD
 8wbujrC5Fj9kdJ4jm4VsVUq/xC1Z7svlK0MeyUEypdB8Kuix4cbMC/t/f2sPd8CEVY08
 9VSZXTBVlKLfbkomP7JZOY05Y7Pft6QFdllS09z6vWDQwPnVMeYqUHfGZNwDzOR1RIdY
 UqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737433716; x=1738038516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZSNB6g5UtUoImhML+UGNfXWXkjaOAV6MUUxlrXnbfE=;
 b=lyCodl1gG3EFDZCzOZFZcYxobgdn7U+/rye5edAtowGfsSQsTYM1zam6D7S4SHRfV0
 WYs3HYBoQcsZnY7OZUMelueFvpyqbUZB7cofftMaf1Kfej3tuEo07f1y357g00q+KKRV
 9SbUQflZKvwxm1xts7pQaT8X7G1xsAUVwHoDHSi5inaeo5DYmlwlxF8UcKJTH9uY/CN/
 SABLKwTgt/pW506a7XwDu5g57Nnr0y/MMTfg+QRaercPQBCZz6iYoZvsGHcM47aZF/5s
 b8QfSBHGxxHBk6MQstuZEUfl0xEK/rCMDOV/e94KYTXhNFFKnuiizlu0Q8RT2v9X+SXd
 jIfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfC/10Bhf2qrBjhvVm4+DDaDYkL9aeubXiEcKJi3vC0hxeCKxdIQXPm0diHwsjDu8iAvkzqjKc9EM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwrb+U0zhvhY8UKvqIc1E3LCmzEr7ZRa5/SW4H0ANX2x5ZeW8/
 w0K1vfwkEh0hc3nO4X92Lccm7FQcHtqodFJCHiepz8KSn7I9AE4pGwncSrITk9+OVysDpRneMfT
 FJwFps1WE29O3lk6potdIleXDs91MyhgkG2uLew==
X-Gm-Gg: ASbGncupHtxMA3cAN7d5NmDqyO14fGfolR/L05gXiCpMtCFmCd+OLGFdDGZnJKpF43U
 K63L2WVw2s9n5zHnT8zRH25AFca6wVEr9Q4DRZ6MifduSsDu1a+Nesw==
X-Google-Smtp-Source: AGHT+IGq/MHXBnnIFfgM/13ju/i+ES42JwboBmO2dRvRxF/fPN5yr5dACgnwRZOQCQDqbtKLPqHPHxnGRY22awQjXhE=
X-Received: by 2002:a05:690c:ed4:b0:6f6:ccef:ef4f with SMTP id
 00721157ae682-6f6eb659ce5mr124991237b3.2.1737433716183; Mon, 20 Jan 2025
 20:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
 <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
 <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>
 <6ds6wxlf56kt3lislorxubwbjldpknz74c76smglynzh4jxcpq@dcr2ptutaopa>
In-Reply-To: <6ds6wxlf56kt3lislorxubwbjldpknz74c76smglynzh4jxcpq@dcr2ptutaopa>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 20 Jan 2025 20:28:24 -0800
X-Gm-Features: AbW1kvb-DeFP6oG56gSKdFoJx3QfWKxrxchTK43xDe6e8I2Ayaxn3a_6GSbRAjA
Message-ID: <CABymUCPviHNEhjV8sp7_dFDXNa5HMOMC+c0V83pyhRQND_0p8A@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
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

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 04:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2025-01-17 15:32:44, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=
=E6=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> > > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC =
are
> > > > enabled.
> > >
> > > Why? What is the issue that you are solving?
> >
> >     To support high-resolution cases that exceed the width limitation o=
f
>
> How high is high?  Some Sony phones use a bonded 2:2:2 setup.

The high resolution here means the capability of 2 SSPP without multi-rect =
mode,
or the clock rate requirement exceed the SoC capability. It depends on spec=
ific
SoC spec.

>
> >     a pair of SSPPs, or scenarios that surpass the maximum MDP clock ra=
te,
> >     additional pipes are necessary to enable parallel data processing
> >     within the SSPP width constraints and MDP clock rate.
> >
> >     Request 4 mixers and 4 DSCs for high-resolution cases where both DS=
C
> >     and dual interfaces are enabled. More use cases can be incorporated
> >     later if quad-pipe capabilities are required.
> >
> > >
> > > > 4 pipes are preferred for dual DSI case for it is power optimal
> > > > for DSC.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++=
++++++------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > > >  6 files changed, 29 insertions(+), 14 deletions(-)
> > > >
> > >
> > > > @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >
> > > >       /* Datapath topology selection
> > > >        *
> > > > -      * Dual display
> > > > +      * Dual display without DSC
> > > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > >        *
> > > > +      * Dual display with DSC
> > > > +      * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
>
> Are these always bonded (i.e. single display with dual-DSI link), or can =
it be
> two independent panels?

It can be two independent panels.
>
> > > > +      *
> > > >        * Single display
> > > >        * 1 LM, 1 INTF
> > > >        * 2 LM, 1 INTF (stream merge to support high resolution inte=
rfaces)
> > > >        *
> > > >        * Add dspps to the reservation requirements if ctm is reques=
ted
> > > >        */
> > > > +
> > >
> > > irrlevant extra line, please drop.
> > >
> > > >       if (intf_count =3D=3D 2)
> > > >               topology.num_lm =3D 2;
> > > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > > @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > > >                * this is power optimal and can drive up to (includi=
ng) 4k
> > > >                * screens
> > > > +              * But for dual display case, we prefer 4 layer mixer=
s. Because
> > > > +              * the resolution is always high in the case and 4 DS=
Cs are more
> > > > +              * power optimal.
> > >
> > > I think this part is thought about in a wrong way. If it was just abo=
ut
> > > power efficiency, we wouldn't have to add quad pipe support.
> > > Please correct me if I'm wrong, but I think it is about the maximum
> > > width supported by a particular topology being too low for a requeste=
d
> > > resolution. So, if there is a DSC and mode width is higher than 5120
> > > (8.x+) / 4096 ( <=3D 7.x), then we have to use quad pipe. Likewise if
> > > there is no DSC in play, the limitation should be 2 * max_mixer_width=
.
> >
> > Both width limitation and clock rate contribute to pipe number decision=
.
> > To support high resolution, the MDP clock may be required to overclock
> > to a higher rate than the safe rate. Current implementation does not
> > support checking clock rate when deciding topology. We can add the
> > clock rate check later with a new patch.
> > >
> > > >                */
> > > > -             topology.num_dsc =3D 2;
> > > > -             topology.num_lm =3D 2;
> > > > -             topology.num_intf =3D 1;
> > > > +
> > > > +             if (intf_count =3D=3D 2) {
> > > > +                     topology.num_dsc =3D dpu_kms->catalog->dsc_co=
unt >=3D 4 ? 4 : 2;
>
> What if there are other encoders that have already reserved DSC blocks, r=
educing
> the current available number of DSC blocks?  This patch seems to cover mu=
ltiple
> panels/interfaces on a single virtual encoder, how does one get to such a
> scenario?  Bonded display?  If one or more DP panel is connected, do they=
 use
> their own virtual encoder, and hence miss out on logic that properly divi=
des
> available DSC blocks?

Yes, it's bonded display. Your point is valid. The scenario will fail
at the resource
allocation stage and CRTC pipe fails to be setup if there is not
enough DSC block
available. But it should fail gracefully, so not a big issue. It is
always possible
that resource cannot support a usage scenario.

>
> That idea is what's been holding back a quick hack to support 1:1:1
> topology for sc7280 / FairPhone 5 to perform a similar workaround:
>
>         if (catalog->dsc_count < 2)
>                 num_dsc =3D num_lm =3D 1;.

Actually, I do not see issue here. Could you help point me the link
for this change?
Checking the discussion history helps on understanding more aspects of
this change.
>
> > >
> > > This assumes that the driver can support 2:2:2. Is it the case?
> >
> > The code falls back to 2:2:2 case here. But I guess 2:2:2 does not work=
 yet.
> > How about below code for DSC case?
>
> I've been working on 2:2:2 support [1] but have stalled it to see how you=
r
> series here pans out.  Doesn't look like it's heading in a compatible dir=
ection
> though, going for quick wins rather than redesigning how DSC blocks are
> allocated (to name one of the many topics).
>
> [1]: https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualp=
ipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org/
>
> - Marijn

Glad to know that a 2:2:2 case can be enabled. That can be supported with
code structure of quad-pipe in theory and we can co-work on that. But I wou=
ld
not call the quad-pipe patch set a quick wins, as I cannot cover a usage ca=
se
that's not supported by mainline yet, and I do not have hardware to support
2:2:2 neither. What I can do is to add new usage case and make sure
existing usage cases are not broken. More and more usage cases can be
added later this way.
Could you help elaborate what do you mean by how DSC blocks are allocated?
I see DSC is allocated just as other resources. Maybe you mean how the
topology is decided. While that's about adding new usage case without
breaking existing usage cases.

Regards,
Jun
>
> >
> >                  if (intf_count =3D=3D 2 && dpu_kms->catalog->dsc_count=
 >=3D 4) {
> >                          topology.num_dsc =3D 4;
> >                          topology.num_lm =3D 4;
> >                          topology.num_intf =3D 2;
> >                  } else {
> >                          topology.num_dsc =3D 2;
> >                          topology.num_lm =3D 2;
> >                          topology.num_intf =3D 1;
> >                  }
> >
> > >
> > > > +                     topology.num_lm =3D topology.num_dsc;
> > > > +                     topology.num_intf =3D 2;
> > > > +             } else {
> > > > +                     topology.num_dsc =3D 2;
> > > > +                     topology.num_lm =3D 2;
> > > > +                     topology.num_intf =3D 1;
> > > > +             }
> > > >       }
> > > >
> > > >       return topology;
> > >
> > > --
> > > With best wishes
> > > Dmitry
