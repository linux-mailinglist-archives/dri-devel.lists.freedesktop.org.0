Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133919695AA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 09:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FD289B48;
	Tue,  3 Sep 2024 07:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WPfQxxMr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8207789B48
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 07:34:17 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so80510471fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725348855; x=1725953655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vliWi3Scy6RbjNeD5IhoobKc4xR9iQkqtP489fUblNA=;
 b=WPfQxxMrvAmciYhMGajBsgVc9LBT/VGQ/CjQlN4g/QJe4Q4Qx+EmMNV7Lj5nCfGzvg
 YiqkckbTA4SlEyjfB6FUE0kFHlpcm/94XOdHizZVcjz/kW6b4djP+DNJ06s9rRc2eU6m
 2Ym71jrnuOHgacPeGv9Vgz7cWbRgJUMIUOxRFnnmzNsKrbjhTgV7CegbLgPwpIJjcaXs
 sRgSginvMkl+D8O1LTa5SL9RHfp4ac6tU1QDCaOvlEfZBHxJ+cBQuwstJItY/oZ58dAB
 Ou7Y9ASL9M8qhLp8z34rFWcidu913L8KKGn5kpRrVYmPyzhaWDVvf10diRCj6umdrqzA
 njMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725348855; x=1725953655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vliWi3Scy6RbjNeD5IhoobKc4xR9iQkqtP489fUblNA=;
 b=UAoxeC7t1w80GrD8RVbS26HS6OWwTGy0zNTOyCru/dvXxZ5H1THXZktMnCPUXewyAg
 2n6wdZ3YBNH7Da+nfrBntw3C1HvXCmKgpVAVhx6ezTfh6Z1YaPmXgnG9npOa+DD4rCu0
 g8J3yIpCaYltS+CG9VXpUpP78K984weY6mdlGiQhvg+VhDrjSldpj29vIWeQW16dsY/Z
 1Fd6ulH3kym8fEVGll/PgrgVgihwZdMa8ktj90izopapKN/NAzEJfYjuvucfmmz4TqTp
 yn8YWCfSYAcJGDTH0sAQebaM6XKD34htAgvlf5mIOfnMojhaZzyz0tt/YW8n1Xi61VUN
 v9jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvMxmD+ayk96888r05vh77QXPeqotlEJ4A+JXqJ83Wvy6J3R0jAQcZwborgGXbyH3OsNPeo5lhYO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBd9yWfHOFmWZAInVwAf8CIMseTMBdR8gBV8ZZ8XqPJS3Y91Zh
 Ve2XV7DdtaTgnsnu6UBcxvXtj/+P1ZryEHlyp77Rny6sloVx8kRpU+x41Prsmb8ineuqsd6YjE1
 Odim7ZbKiKCgQLr2bk92ZvUFhHSanyKwepujQ+w==
X-Google-Smtp-Source: AGHT+IHikyCHpHDr69r3AMp2hdtbS/gza98nV+dXCxjEmDuwsCsZHqpmx08yOwWIt7zcbWMhhcpZyTO9rvIXl6UZ4Wo=
X-Received: by 2002:a05:651c:551:b0:2f0:27da:6864 with SMTP id
 38308e7fff4ca-2f6105d7954mr149363671fa.17.1725348855335; Tue, 03 Sep 2024
 00:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqCL1xFVB8_2j2QwPsF-vHBcFBt3yx=acpWgmo4_Oudug@mail.gmail.com>
In-Reply-To: <CAA8EJpqCL1xFVB8_2j2QwPsF-vHBcFBt3yx=acpWgmo4_Oudug@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:34:03 +0800
Message-ID: <CABymUCOsF5gL_i-uEyBBpgV_9qO_T3hNQ6vSX-dMGRsdFfgPXg@mail.gmail.com>
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
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
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Data width for dsc engine is aligned with pipe, not with whole screen
> > width. Because the width may be halved in DSI bonded case.
>
> Can't really parse this.

Please forgive me for my bad English. Is below words better?

Data width for DSC timing is aligned with the width that goes to a DSI
interface, not with whole screen width. For bonded-DSI case, the
width for DSC timing is half width of whole screen.
>
> >
> > The dsc width is not related to the timing with back front porch in
> > later stage, so update dsc timing earlier.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 7a4d9c071be5a..5abade8f26b88 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *m=
sm_host, bool is_bonded_dsi)
> >                         return;
> >                 }
> >
> > -               dsc->pic_width =3D mode->hdisplay;
> > +               dsc->pic_width =3D hdisplay;
> >                 dsc->pic_height =3D mode->vdisplay;
> >                 DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>
> Two separate commits

OK. Will split it.

>
> >
> > @@ -964,6 +964,11 @@ static void dsi_timing_setup(struct msm_dsi_host *=
msm_host, bool is_bonded_dsi)
> >                 if (ret)
> >                         return;
> >
> > +               if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> > +                       dsi_update_dsc_timing(msm_host, false, hdisplay=
);
> > +               else
> > +                       dsi_update_dsc_timing(msm_host, true, hdisplay)=
;
> > +
> >                 /*
> >                  * DPU sends 3 bytes per pclk cycle to DSI. If widebus =
is
> >                  * enabled, bus width is extended to 6 bytes.
> > @@ -990,9 +995,6 @@ static void dsi_timing_setup(struct msm_dsi_host *m=
sm_host, bool is_bonded_dsi)
> >         }
> >
> >         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -               if (msm_host->dsc)
> > -                       dsi_update_dsc_timing(msm_host, false, mode->hd=
isplay);
> > -
> >                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
> >                         DSI_ACTIVE_H_START(ha_start) |
> >                         DSI_ACTIVE_H_END(ha_end));
> > @@ -1011,9 +1013,6 @@ static void dsi_timing_setup(struct msm_dsi_host =
*msm_host, bool is_bonded_dsi)
> >                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
> >                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
> >         } else {                /* command mode */
> > -               if (msm_host->dsc)
> > -                       dsi_update_dsc_timing(msm_host, true, mode->hdi=
splay);
> > -
> >                 /* image data and 1 byte write_memory_start cmd */
> >                 if (!msm_host->dsc)
> >                         wc =3D hdisplay * mipi_dsi_pixel_format_to_bpp(=
msm_host->format) / 8 + 1;
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
