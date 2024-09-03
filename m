Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236A996972A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF8610E35F;
	Tue,  3 Sep 2024 08:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i34ARqnF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B9D10E35F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:34:31 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-68518bc1407so52160577b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725352470; x=1725957270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3o9D8uVOtpTVbk+TPNxYEMvtHmsKPOlQhjwdRt4OfR4=;
 b=i34ARqnFM+IohBRR7z4d1gBylGnz7ZiM3f2cY2DmszVUQROaU1oI7BHxHIWN8JxmyK
 94T2+AGC3r2JH/bxQikBj9xNWS6Fs6kgVBNURIpj+JZp1YFZWgNq8i/gnplO7dxwNnlO
 xgb6zOnfaFUw+xIaHsMaBeD5YEKJXgJKExZIUiTqPepRhs4psMeWJgWQ4dLnkjwF7kZz
 IQH0mK9tNtIZEYxa36jQQiFWgeStMcZHBW0KavIR6GDqyF6Xg+DimuLG5SDyfFH5txTX
 f3FXFOkj364myZK3PZy1ZfvX4YB68hWuLQmYsa75H4lFqOtuNtBp7NtAORP77cdidkfP
 VPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352470; x=1725957270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3o9D8uVOtpTVbk+TPNxYEMvtHmsKPOlQhjwdRt4OfR4=;
 b=UX0qfN7m0j+wrFbnunjhH02Dv3yUydIlomRtYd/cwGeOGt4zh/1b4pb9t9dPC6yFRU
 wGag66Ae/odGwen9HZjalvB6774pjaMq6MC2mzsJWFFBJeVh3ig0JUbhy+xOl1zPfLhM
 dCICEzUtvvfhewT0mueSwQKjz7tVLFF0On5D/l60NqlE3ITN8FYkIN5KCeLrqjDjSVuS
 PMs/bQ8yGnPtikahoUdqL/nreY9PqvWf4puODU29X2hg3QnWMYYWsT7FPPcNhqJRWmLl
 gWAs1wY8maczGuk7XlhUiuP9nAUhV8fQ4Dr/GOPWNCJtvd0u7zoktp3pEKTEKOIgUrls
 JHaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOKVuEJHkHTE0JRRJd0D/n2dww1/yhffs9NAUyXYkLpegGcdRPrAfG1ZBslF9i/VW9JgUILxR8hLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFkWhNT5nrvMSUsrYtauRkFf04w2x/qYVR2l+bdfCCCB0HlrKU
 O/Ph3JaolOfwJiftMW4A3O6hXGhae++OlNm+zqCvy/hhTXqOhFsyThVznZ/vmixwoxgWXhZmOip
 YBle2k+Jfx6ZQF7fFFIIdcPKVVyQBWHE9JwQx2w==
X-Google-Smtp-Source: AGHT+IE/swZHdLRleFxe2nf/SNcWP2+mYsPYhZlOG8GFptpLYVix/nbfVUqMnxGfBq8VesnX9TqFoJ846I0MXEspRSE=
X-Received: by 2002:a05:690c:dca:b0:631:78a1:baf with SMTP id
 00721157ae682-6d40ee58397mr150471477b3.6.1725352470013; Tue, 03 Sep 2024
 01:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqCL1xFVB8_2j2QwPsF-vHBcFBt3yx=acpWgmo4_Oudug@mail.gmail.com>
 <CABymUCOsF5gL_i-uEyBBpgV_9qO_T3hNQ6vSX-dMGRsdFfgPXg@mail.gmail.com>
In-Reply-To: <CABymUCOsF5gL_i-uEyBBpgV_9qO_T3hNQ6vSX-dMGRsdFfgPXg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:34:19 +0300
Message-ID: <CAA8EJppjr=6LncRGZAKdefvsPFXra=HZPuD5TjJRvvaf7WbALA@mail.gmail.com>
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
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

On Tue, 3 Sept 2024 at 10:34, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Data width for dsc engine is aligned with pipe, not with whole screen
> > > width. Because the width may be halved in DSI bonded case.
> >
> > Can't really parse this.
>
> Please forgive me for my bad English. Is below words better?
>
> Data width for DSC timing is aligned with the width that goes to a DSI

to a single DSI interface

> interface, not with whole screen width. For bonded-DSI case, the
> width for DSC timing is half width of whole screen.

sounds much better.

> >
> > >
> > > The dsc width is not related to the timing with back front porch in
> > > later stage, so update dsc timing earlier.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
> > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm=
/dsi/dsi_host.c
> > > index 7a4d9c071be5a..5abade8f26b88 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host =
*msm_host, bool is_bonded_dsi)
> > >                         return;
> > >                 }
> > >
> > > -               dsc->pic_width =3D mode->hdisplay;
> > > +               dsc->pic_width =3D hdisplay;
> > >                 dsc->pic_height =3D mode->vdisplay;
> > >                 DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> >
> > Two separate commits
>
> OK. Will split it.
>
> >
> > >
> > > @@ -964,6 +964,11 @@ static void dsi_timing_setup(struct msm_dsi_host=
 *msm_host, bool is_bonded_dsi)
> > >                 if (ret)
> > >                         return;
> > >
> > > +               if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > +                       dsi_update_dsc_timing(msm_host, false, hdispl=
ay);
> > > +               else
> > > +                       dsi_update_dsc_timing(msm_host, true, hdispla=
y);
> > > +
> > >                 /*
> > >                  * DPU sends 3 bytes per pclk cycle to DSI. If widebu=
s is
> > >                  * enabled, bus width is extended to 6 bytes.
> > > @@ -990,9 +995,6 @@ static void dsi_timing_setup(struct msm_dsi_host =
*msm_host, bool is_bonded_dsi)
> > >         }
> > >
> > >         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > > -               if (msm_host->dsc)
> > > -                       dsi_update_dsc_timing(msm_host, false, mode->=
hdisplay);
> > > -
> > >                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
> > >                         DSI_ACTIVE_H_START(ha_start) |
> > >                         DSI_ACTIVE_H_END(ha_end));
> > > @@ -1011,9 +1013,6 @@ static void dsi_timing_setup(struct msm_dsi_hos=
t *msm_host, bool is_bonded_dsi)
> > >                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
> > >                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> > >         } else {                /* command mode */
> > > -               if (msm_host->dsc)
> > > -                       dsi_update_dsc_timing(msm_host, true, mode->h=
display);
> > > -
> > >                 /* image data and 1 byte write_memory_start cmd */
> > >                 if (!msm_host->dsc)
> > >                         wc =3D hdisplay * mipi_dsi_pixel_format_to_bp=
p(msm_host->format) / 8 + 1;
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
