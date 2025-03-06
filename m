Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA83A55624
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 20:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDA910E06F;
	Thu,  6 Mar 2025 19:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zNjEXnxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3F210E06F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 19:03:35 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e60cab0f287so714031276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 11:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741287814; x=1741892614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwCDdrKQOyctXlG8s2t32dxkWsTqqYWpj8SXJw5MqC4=;
 b=zNjEXnxJYhGk5ntuFtkKVffFPzGkKCzKmAso7/TfbRScYl8E1ZyDLNYHH5rK6cm5MY
 A299DSW9EojN7gAmqYZYnseb3Z0zYuVpDZTkDs6mWudbaKfdii1zp2IvVrB0d0wCBKvz
 FCLg/X3uewOO3eC4W93q2FZ8bMYFYlYGmvl5mAyhtxjH755rzsOrULeH0rLjcAKAcCoC
 0tq2YHfTL9jby5O/JFcOWAYU5nXry3T0kawPG9Yc57fVs4/ZWg/RcQrkoOcaYzIoNppV
 mEJ8S6t9plDp1rQD7HGBHrvwNEC8LkCvzu0gTXL4OIiK+3SI+vEDKNAcIzX2yvqyO1c6
 vwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741287814; x=1741892614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwCDdrKQOyctXlG8s2t32dxkWsTqqYWpj8SXJw5MqC4=;
 b=SuwgiT5EKJGvjfP5yzoVfqIHkwrtiuC1cBGY5zFqfCT2S0tpITkfZ737ZQ0PKrURUO
 gri+fmaE8xT3kwEIlg+F8CePR/H2gPBv+zfEBvJyCO6axaQv4NhJ0rHjV0W9+PARCbPV
 9PjCQOihePYF2PuxeFSvNw7B8iUQ7Sf1RseZoKpkXL1JKbRKgaV3/qB99SHuH5S80Psf
 +GBz5SMR60mcCQcPY9XvTlJSdwr7LcgQ3vpO1tQDLxP9oRx1Valv/FL+ippqxSKtIooz
 CwNgRG3oVCjgpZCQTGGMmFuGvgMVgpe1yz59HTZ/vYeQbA+5CUSoypB3nUOPr3xfSSUG
 u/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX24KqI/6ojrU76xSXp8U/KJOFSg/tHAuK8Lqkze2A9aegbGCoDrNNUr7PO3V3Yt0FaBzU1koer9Hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweIa9TSj8vx2Q64tvru39WhQgGIqV/4cli5uUtiH9P8rcZZmWe
 baOwzjySWSg5Cllc28Lr4LAJ8S9bewgkuITiLkWM6JiVmmen4hH26JkDvTez4gG/b/cY6nFhmt0
 YxAzqg5E3vY1K4ukfWJPKwfhs7mkcdvyuAwz1kA==
X-Gm-Gg: ASbGncvOgN4vyLc3LxYhzsySZbrkQbhjrxL7OyaspK766EwUgQuKKE9qw/x2sbs4/I0
 YsIaam90+S8nbi+L/2IwU0oaN3cIICweaQfc/u/kJuo7UB0qdjNbkZbclEgrRpFRhpEy17fe1ah
 jdxuY4GAV3VKwWWvfu2xgApkY/1VANL6i8XFK65gJoNfMPoZGGLjh6x9xA
X-Google-Smtp-Source: AGHT+IHwvj0CxkMdhq6vZm8WoZOOXbWTiQ8NAVWXBvLwqYH0y2h7UDiE+hITztg+nqSsiSEQ4EgrLVUkS+uTYKmx4H4=
X-Received: by 2002:a05:6902:1b8f:b0:e5d:bf57:7dc7 with SMTP id
 3f1490d57ef6-e635c16eec8mr606132276.21.1741287814199; Thu, 06 Mar 2025
 11:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
 <p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb>
 <CAD=FV=XyOwoMmdvFA565AzGRUSNwonQ-5Ke2H6jc2ki9Sz+0Pg@mail.gmail.com>
In-Reply-To: <CAD=FV=XyOwoMmdvFA565AzGRUSNwonQ-5Ke2H6jc2ki9Sz+0Pg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Mar 2025 20:03:23 +0100
X-Gm-Features: AQ5f1Jq5XTpi2paX4JarjRQ14efVOLE111e7OJDJdnK2KOGvG8rnVmL6vgNVl5c
Message-ID: <CAA8EJpoG-rfaVb0rhbP-6xwzD7=k-95NVeyHUy=X3ESLEwZgYw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, Tejas Vipin <tejasvipin76@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lujianhua000@gmail.com, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
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

On Thu, 6 Mar 2025 at 18:44, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Mar 6, 2025 at 8:33=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Mar 06, 2025 at 03:05:10PM +0100, neil.armstrong@linaro.org wro=
te:
> > > On 06/03/2025 14:43, Tejas Vipin wrote:
> > > > Changes the novatek-nt36523 panel to use multi style functions for
> > > > improved error handling.
> > > >
> > > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > > ---
> > > >   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++----=
-----
> > > >   1 file changed, 823 insertions(+), 860 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/driver=
s/gpu/drm/panel/panel-novatek-nt36523.c
> > > > index 04f1d2676c78..922a225f6258 100644
> > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > > > @@ -23,10 +23,12 @@
> > > >   #define DSI_NUM_MIN 1
> > > > -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)      =
  \
> > > > -           do {                                                 \
> > > > -                   mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > > > -                   mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > > > +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd,=
 seq...)      \
> > > > +           do {                                                   =
         \
> > > > +                   mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, se=
q);      \
> > > > +                   dsi_ctx1.accum_err =3D dsi_ctx0.accum_err;     =
           \
> > > > +                   mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, se=
q);      \
> > > > +                   dsi_ctx0.accum_err =3D dsi_ctx1.accum_err;     =
           \
> > >
> > > Just thinking out loud, but can't we do :
> > >
> > > struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D NULL };
> > >
> > > #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, s=
eq...)      \
> > >               do {
> > >                       dsi_ctx.dsi =3D dsi0;                          =
           \
> > >                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq=
);       \
> > >                       dsi_ctx.dsi =3D dsi1;                          =
           \
> > >                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq=
);       \
> > >
> > > ?
> > >
> > > So we have a single accum_err.
> >
> > I'd say that can be counter-prodactive. If only one of the links falls
> > apart, then the second link still can be initialized (and by observing =
a
> > half of the screen the user / devloper can make several assumptions).
> > In case of using just one context the driver will fail on the first
> > error and skip the rest of the init for both halves.
> >
> > I'd have a different suggestion though: what about passing two contexts
> > to the init_sequence callback and letting nt36523_prepare() handle each
> > of the error separately?
>
> IMO that's a bit outside the scope of what Tejas is doing since it's a
> functional change. Unless something is a super obvious bugfix it feels
> like doing the conversions like we're doing here should not include
> functionality changes and should be straight conversions.
>
> Also: I don't have tons of experience with dual MIPI panels, but I'm
> not totally sure how your suggestion would work in the end. Would you
> expect that if one panel succeeded and the other didn't that the
> prepare/enable calls in the panel should return "success"?

Well, panel bridge ignores return codes.

>  If they
> don't then higher levels will assume that the single "panel" that
> they're aware of didn't initialize at all and won't continue to do
> more. That means the user wouldn't have a chance to observe half the
> screen working.
>
> I could believe that, for all practical purposes, we could keep the
> errors separate and then just return the if either panel got an error
> in the end. It probably wouldn't make a huge difference and would
> shrink the code side. ...but that I think that should probably be the
> second patch in the series and not squahsed into the conversion.

I think passing two contexts can be considered a part of the
conversion. In the end, we have been changing some of the function
arguments already to pass context instead of global data.
In the end, currently there was no way for either of those double-DSI
panels to fail the init seq.

>
>
> Oh, also: Tejas, please make sure you CC Anusha on your patches. :-) Adde=
d here.



--=20
With best wishes
Dmitry
