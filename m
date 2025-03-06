Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70FA55748
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 21:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA1010E2B8;
	Thu,  6 Mar 2025 20:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="J3dZeUbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1810E2B8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 20:07:03 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5495c1e1b63so1187482e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 12:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741291620; x=1741896420;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFBVTxBK91gOv/J1RwnobV6isevkXmYhVXuftt1K/I8=;
 b=J3dZeUbNfVawcS6zS2axPkXm0eUFZwM8G/6nfTpt+ZTqjUSlkJ3Q3+5wpSYvJK6v+t
 9QL4rQJhioFU3c9aBezEXjfeKI2CFAdVlErdIBKmcm+UIOu8h5QeIzQsAGt3p7Dh/kMk
 bivvV1cU2CLY6ywIRQBwY35VTy/lKcaexoL/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741291620; x=1741896420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFBVTxBK91gOv/J1RwnobV6isevkXmYhVXuftt1K/I8=;
 b=ssRwrCTsrOq2sUDsG4PmQaNpqDDTkcveSC6borf9OOU+pmEyVpyLmbK0HOqq/0uExF
 XFteqkdrbphiqj2pUeNLr7n5BM008w1/UW0ZP4Mw5HVCuSXMFvvLUpVDCrk9hP4RAIvQ
 Vy/QJPJuS6A4jdeVmoCm3yETx7nSGeTp5npq9gHzF2+nLpnhQe8+O/jC7jW1LNkYTkex
 lWGJdl9AusYeJY99FRjeSMjxu3HOJcnq7pzzI+wpdkZa5gYyPsxmuGkHZ10HlNCB6TIZ
 FQQqYeQ4kjX/NDbrJKtpjRh2xx80DEXA3iYcmdNdRdU+CIQAxEkpKUE/Bz2RZ3E1M73f
 u2dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGN5up5yy2Zcz3UEeremhL9DZupIZxbgmMC9p/r2Jz1FzOBgUNYoBwAacc09vYyXOo6z1d5ELiVL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBRFkFtv055YeJgGnUmMud/a0HhfoB5oQznmfIH8m2xIfI8mKt
 bhnwHEWNgsx/mDdNiL7JVguJ0NIrfwdMUS6sfyUDbaOOQSFDOfxhcIXzqlj3Bml46YJwfRUauOl
 q3CS/
X-Gm-Gg: ASbGncsaEx3p9BG1B4uemctcUr/+bPtk2Yb6p2/WYv+e0NxI6mr9gBtESr9mVB5MZ+M
 q1NkU11zXkouvgRoYTvWXhcc0j1jEwVEykjhaClqtsTQ7RDKOgdUYnXOnsbBKJlSSP2+8KUqpd2
 N7Z/hTU0ae624gqjF8CBuFR/vdM8jBSt9AbKa/exsZIIBPWaHtv2xf4sxJqRu2uYq8tO6Odnr/P
 cztsxvFtrOYeNHK4wNt3ZJjiVP4/TDuW5xLhIMggI4zr8wHG5Ib4A+jvG6ZvDpjXSw/KAkU8hwJ
 S3GDbFumlwtI12Uw2tLGKK5+gvonLxxnW8HAjvKLEgTxxMhYfa0JNrDDD6z/sEGcTrnS+OgsNTW
 pPXcPS7K2
X-Google-Smtp-Source: AGHT+IHJDW79sMIfqiv4B1a9YYuisAb0J/2TSLQknGqDSbzgmHY73JKLw6r8eQcNFvPQNur2ECQ5eQ==
X-Received: by 2002:a05:6512:3d15:b0:549:5b54:2c68 with SMTP id
 2adb3069b0e04-54990e5daccmr209597e87.22.1741291619855; 
 Thu, 06 Mar 2025 12:06:59 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b1c29adsm268304e87.215.2025.03.06.12.06.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 12:06:59 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5495c1e1b63so1187406e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 12:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9KkK+KDtFcdnzvo/j1w5w0iqQcKdXKtrjVjFCXzP88ATXSnOmpgCZEWdAor9q0R7cKZR9xGUvRTg=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2309:b0:549:7d6e:fe84 with SMTP id
 2adb3069b0e04-549910b7650mr139656e87.53.1741291617911; Thu, 06 Mar 2025
 12:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
 <p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb>
 <CAD=FV=XyOwoMmdvFA565AzGRUSNwonQ-5Ke2H6jc2ki9Sz+0Pg@mail.gmail.com>
 <CAA8EJpoG-rfaVb0rhbP-6xwzD7=k-95NVeyHUy=X3ESLEwZgYw@mail.gmail.com>
In-Reply-To: <CAA8EJpoG-rfaVb0rhbP-6xwzD7=k-95NVeyHUy=X3ESLEwZgYw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Mar 2025 12:06:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WvKjTFOubSyDcdn1TKoBL9jeExkKSLydfxpKhqjVPLuA@mail.gmail.com>
X-Gm-Features: AQ5f1Jos7fHq7Zgo3vzyzU6fKV4__HXNnXnaQS-cI3RFMrxWkmNF6UCCasL5LYQ
Message-ID: <CAD=FV=WvKjTFOubSyDcdn1TKoBL9jeExkKSLydfxpKhqjVPLuA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi,

On Thu, Mar 6, 2025 at 11:03=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 6 Mar 2025 at 18:44, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Mar 6, 2025 at 8:33=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Thu, Mar 06, 2025 at 03:05:10PM +0100, neil.armstrong@linaro.org w=
rote:
> > > > On 06/03/2025 14:43, Tejas Vipin wrote:
> > > > > Changes the novatek-nt36523 panel to use multi style functions fo=
r
> > > > > improved error handling.
> > > > >
> > > > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > > > ---
> > > > >   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++--=
-------
> > > > >   1 file changed, 823 insertions(+), 860 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/driv=
ers/gpu/drm/panel/panel-novatek-nt36523.c
> > > > > index 04f1d2676c78..922a225f6258 100644
> > > > > --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > > > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > > > > @@ -23,10 +23,12 @@
> > > > >   #define DSI_NUM_MIN 1
> > > > > -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)    =
    \
> > > > > -           do {                                                 =
\
> > > > > -                   mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      =
\
> > > > > -                   mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      =
\
> > > > > +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cm=
d, seq...)      \
> > > > > +           do {                                                 =
           \
> > > > > +                   mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, =
seq);      \
> > > > > +                   dsi_ctx1.accum_err =3D dsi_ctx0.accum_err;   =
             \
> > > > > +                   mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, =
seq);      \
> > > > > +                   dsi_ctx0.accum_err =3D dsi_ctx1.accum_err;   =
             \
> > > >
> > > > Just thinking out loud, but can't we do :
> > > >
> > > > struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D NULL };
> > > >
> > > > #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd,=
 seq...)      \
> > > >               do {
> > > >                       dsi_ctx.dsi =3D dsi0;                        =
             \
> > > >                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, s=
eq);       \
> > > >                       dsi_ctx.dsi =3D dsi1;                        =
             \
> > > >                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, s=
eq);       \
> > > >
> > > > ?
> > > >
> > > > So we have a single accum_err.
> > >
> > > I'd say that can be counter-prodactive. If only one of the links fall=
s
> > > apart, then the second link still can be initialized (and by observin=
g a
> > > half of the screen the user / devloper can make several assumptions).
> > > In case of using just one context the driver will fail on the first
> > > error and skip the rest of the init for both halves.
> > >
> > > I'd have a different suggestion though: what about passing two contex=
ts
> > > to the init_sequence callback and letting nt36523_prepare() handle ea=
ch
> > > of the error separately?
> >
> > IMO that's a bit outside the scope of what Tejas is doing since it's a
> > functional change. Unless something is a super obvious bugfix it feels
> > like doing the conversions like we're doing here should not include
> > functionality changes and should be straight conversions.
> >
> > Also: I don't have tons of experience with dual MIPI panels, but I'm
> > not totally sure how your suggestion would work in the end. Would you
> > expect that if one panel succeeded and the other didn't that the
> > prepare/enable calls in the panel should return "success"?
>
> Well, panel bridge ignores return codes.
>
> >  If they
> > don't then higher levels will assume that the single "panel" that
> > they're aware of didn't initialize at all and won't continue to do
> > more. That means the user wouldn't have a chance to observe half the
> > screen working.
> >
> > I could believe that, for all practical purposes, we could keep the
> > errors separate and then just return the if either panel got an error
> > in the end. It probably wouldn't make a huge difference and would
> > shrink the code side. ...but that I think that should probably be the
> > second patch in the series and not squahsed into the conversion.
>
> I think passing two contexts can be considered a part of the
> conversion. In the end, we have been changing some of the function
> arguments already to pass context instead of global data.
> In the end, currently there was no way for either of those double-DSI
> panels to fail the init seq.

OK, fair enough. No objections from me for going this way, then.
Please make sure that the functionality change is mentioned in the
commit message, though.

-Doug
