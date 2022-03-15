Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C54D9F71
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF6910E543;
	Tue, 15 Mar 2022 15:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5559588F0A;
 Tue, 15 Mar 2022 15:57:49 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id b188so21230033oia.13;
 Tue, 15 Mar 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jWnJoZKYShfYZipEE6ZCups7oAda7ot4SH+dHzTQHvg=;
 b=fWZD7fYBKrcCLLP36Nsix3PjhWakA2JV8NQtlNg4YC5dHtEVTEgCNhRv9ea6+TfccJ
 YdBc28ZgNOawCJhwAf+JMUmVLxx9UzQUWduiLBqCxddul/AlsE/jrVVlzEWqBt/Vhj+W
 y5X0OlnmJxwZ2cf7KIimGb1FjZiSc2JiV+7LNM16p2ounNFovSMPObuRi0A/xfQytnhm
 VkvUgJMiJZvsM9vMv8K6S50gVe7EXkordHNPIMvGCkALaNljmzOQaTdkbTiuB1us6Ezh
 ioRra7dygf4u8Mi2UXKUX3GmzFyhA78I/6ndcoJMwRyhbGKYCqBE0nBr22MP03u2+CTZ
 kHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jWnJoZKYShfYZipEE6ZCups7oAda7ot4SH+dHzTQHvg=;
 b=bM6nmR2Qpe4mqQNmCj9zuaBO3maF/WW5y+mWUxn0WEkG5oNlv/PZmT3wOFtWB00kW/
 6EFiAzSLMcnW5aXIkBK+G1gQm1QGzLzgOT68s55qTmwrbC/20rvLrTp6ebXwIOCgHd/M
 +/KTr4YJ3OHDyU7p7TrkVzmm8K+HqxQbFHzzwTjklqYfOwjWEvrpyCsULgB7wBwVKWtc
 CFtXZnOYqtHPz3TfsTI8DJ+wRjFWEt6e6GqoeQDrsXHU/p74s4pAYp5YKsT1Km9Ozg0H
 DdKVaUkQs6gDlzlAjnSIBXmGSDmnUJb/9xIJFEvC8TwZtpgEtRW7E+Llx4Y9Ntx9hg1/
 zkGA==
X-Gm-Message-State: AOAM5331W/l5rQF0CSr4tT3biXlHo4sWnj8iA6lL4+R84U4kxt0b+g6T
 gTHH1xnHI0QCEAi/xovQxqtwCWlopz5rakLuXNU=
X-Google-Smtp-Source: ABdhPJzRWyNdb48ClfOoM3rFiYP5LZ+gMeALH0ALX+N/qMsoETxcqvdDM36JHPdV/k5IHMOIZBkaVcnXhWMecct2ek8=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr1864355oic.200.1647359868626; Tue, 15
 Mar 2022 08:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-3-ville.syrjala@linux.intel.com>
 <2d51f77d-4067-ca23-3005-87cd72e1a397@amd.com>
In-Reply-To: <2d51f77d-4067-ca23-3005-87cd72e1a397@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 11:57:37 -0400
Message-ID: <CADnq5_MrzrsTxdriBppX0AAzpqPVKct2qy-Pxxd5Kt6MckzQ=A@mail.gmail.com>
Subject: Re: [PATCH 02/22] drm/amdgpu: Remove pointless on stack mode copies
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Feb 18, 2022 at 11:28 AM Harry Wentland <harry.wentland@amd.com> wr=
ote:
>
>
>
> On 2022-02-18 05:03, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >
> > These on stack copies of the modes appear to be pointless.
> > Just look at the originals directly.
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: Nikola Cornij <nikola.cornij@amd.com>
> > Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++++++----------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 21dba337dab0..65aab0d086b6 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -10139,27 +10139,27 @@ static bool
> >  is_timing_unchanged_for_freesync(struct drm_crtc_state *old_crtc_state=
,
> >                                struct drm_crtc_state *new_crtc_state)
> >  {
> > -     struct drm_display_mode old_mode, new_mode;
> > +     const struct drm_display_mode *old_mode, *new_mode;
> >
> >       if (!old_crtc_state || !new_crtc_state)
> >               return false;
> >
> > -     old_mode =3D old_crtc_state->mode;
> > -     new_mode =3D new_crtc_state->mode;
> > +     old_mode =3D &old_crtc_state->mode;
> > +     new_mode =3D &new_crtc_state->mode;
> >
> > -     if (old_mode.clock       =3D=3D new_mode.clock &&
> > -         old_mode.hdisplay    =3D=3D new_mode.hdisplay &&
> > -         old_mode.vdisplay    =3D=3D new_mode.vdisplay &&
> > -         old_mode.htotal      =3D=3D new_mode.htotal &&
> > -         old_mode.vtotal      !=3D new_mode.vtotal &&
> > -         old_mode.hsync_start =3D=3D new_mode.hsync_start &&
> > -         old_mode.vsync_start !=3D new_mode.vsync_start &&
> > -         old_mode.hsync_end   =3D=3D new_mode.hsync_end &&
> > -         old_mode.vsync_end   !=3D new_mode.vsync_end &&
> > -         old_mode.hskew       =3D=3D new_mode.hskew &&
> > -         old_mode.vscan       =3D=3D new_mode.vscan &&
> > -         (old_mode.vsync_end - old_mode.vsync_start) =3D=3D
> > -         (new_mode.vsync_end - new_mode.vsync_start))
> > +     if (old_mode->clock       =3D=3D new_mode->clock &&
> > +         old_mode->hdisplay    =3D=3D new_mode->hdisplay &&
> > +         old_mode->vdisplay    =3D=3D new_mode->vdisplay &&
> > +         old_mode->htotal      =3D=3D new_mode->htotal &&
> > +         old_mode->vtotal      !=3D new_mode->vtotal &&
> > +         old_mode->hsync_start =3D=3D new_mode->hsync_start &&
> > +         old_mode->vsync_start !=3D new_mode->vsync_start &&
> > +         old_mode->hsync_end   =3D=3D new_mode->hsync_end &&
> > +         old_mode->vsync_end   !=3D new_mode->vsync_end &&
> > +         old_mode->hskew       =3D=3D new_mode->hskew &&
> > +         old_mode->vscan       =3D=3D new_mode->vscan &&
> > +         (old_mode->vsync_end - old_mode->vsync_start) =3D=3D
> > +         (new_mode->vsync_end - new_mode->vsync_start))
> >               return true;
> >
> >       return false;
>
