Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12292DDAA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 03:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2163410E753;
	Thu, 11 Jul 2024 01:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dAP9R92h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1373510E753
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 01:09:08 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2c965efab0fso300011a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720660147; x=1721264947;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqCvHAYPbXi+bXWOTcgpjsS2oEkHfV0BUOm/T2chX4o=;
 b=dAP9R92h/r7wqlKtQzK9Epf0ApX43DSBO5gH5ssN0/qPMynJ0w5UsHue0FUlem/C8z
 ZgCqSU+G/rzm1DnyAxI5v/xLzy76Alm9aPDHEnsR+L5F89f1nKf397XYV4fltly5r8Yb
 yp/Bfb854tVc2s42rTmcvcezfL8i+/obdvAA3rr36TfzMzsYYKu13ubMAP2axdvZH/g3
 jN9vJCgxmvuOv0ikGt2r4+3BtZQQ/pj6dM2z0pv6LRf0Q/wAogg3MPU8Su15pDsAMpuI
 hXdTgVl5rIrOEPgM+qPTvLIo6lqTeM429A4lczNuLwKhenxcZx3g1mNWrFD0VvCHZRWP
 dVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720660147; x=1721264947;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqCvHAYPbXi+bXWOTcgpjsS2oEkHfV0BUOm/T2chX4o=;
 b=tvdAALUeCQ5fGpuPputYn1rD7LS/WHvopa+Bo32BTaYFPhdVxOGpIkiVukxROB0R6l
 vtkypPWZnSx/1kIre82vldDgd7g/QnImO2LI3F7R85WeQjP+TV+/EA2ddxsZmBOLZkw2
 ZV2Pg4DKebaMiyWmH90bBr7i5X8PTwKOGj1hvop7hjWdaNN0pRFIfdEfSrx3L+0eFWyt
 gwNvEaUtZIWdUPP3gW/eZp5nU+KdqkD2SlP5sxBm42jgd0b7GOiFGkcTOIF+0Ywpa/Rq
 zS1w3T1zGy4OnHgOdAlDsUNTM+ptVqxLYU55fCU3xIxSiuVOMFqpNCVNvUe2A5sGOU3X
 g75A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWSZ0GRVKPJCpdlZfdJXBTUJ6UObjA2Lzme9OyLlQiT5a0Impo3ako5lQaEmt+8joDcAZr99vRHZG5VRenY60n8KiMQ+Ce+CqM6+1YUiP1
X-Gm-Message-State: AOJu0YzoN1M1FUfnWVXssZgRfJ6RPkyXiZuKQRQEnvzEyCu2SYZAKCzg
 CVbK+VXjv4l0Gkv2M200WKjC5Q60sos0S7c5OY7L+5x3pa1Sagii37QiKmhvbqn5cFrwvQVxyAQ
 trRqEko/BgQDT0L0eSrcEV90l7T1oWezNLVSGrE6lnBvU9OnM5us=
X-Google-Smtp-Source: AGHT+IFyrtGUaUGdRNgeSP7+9iE929t4jQSmmz5maOkAya9CBSMFs5XxwCa8KTcvEuvQSO8TuEpKJpL1DfHMvT+wAeE=
X-Received: by 2002:a17:90a:69a5:b0:2c9:6f06:8009 with SMTP id
 98e67ed59e1d1-2ca35bf40acmr5527910a91.1.1720660147368; Wed, 10 Jul 2024
 18:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
 <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
 <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
 <D2M42ODWQPAU.I0BMEOLKUP29@kernel.org>
In-Reply-To: <D2M42ODWQPAU.I0BMEOLKUP29@kernel.org>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 11 Jul 2024 09:08:56 +0800
Message-ID: <CAHwB_NJ+YEMoL18Sr9HFmTVH_ErDztyF7vxxPFAE0Y2ta3dO0A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
To: Michael Walle <mwalle@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, quic_jesszhan@quicinc.com, 
 neil.armstrong@linaro.org, linus.walleij@linaro.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Michael Walle <mwalle@kernel.org> =E4=BA=8E2024=E5=B9=B47=E6=9C=8811=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed Jul 10, 2024 at 9:12 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Michael Walle <mwalle@kernel.or=
g> wrote:
> > >
> > > On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
> > > > Break select page cmds into helper function.
> > >
> > > Why though? I don't find that anything easier to read. In fact, I
> > > deliberately chose not to factor that out into a function. It's just
> > > a sequence of magic commands, taken straight from the datasheet. So,
> > > I'd like to keep it that way.
> >
> > The consensus of previous discussion on the lists was that folks
> > agreed that we should, where possible, make it more obvious what these
> > magic sequences of commands were doing. IMO separating out the page
> > switch command helps. Certainly I'm always happy to hear other
> > opinions, though.
>
> Fair enough, but in that case, one should take the datasheet (which
> you can find online) and replace all the magic numbers with the
> correct command names from it. E.g. 0xff is the ENEXTC register. To
> be clear, I'm not just talking about the "switch page command".
>
> As patch stands, I don't see much value, TBH. On the contrary, you
> make it harder to compare it with the Ortustech panel datasheet.
>
> just my 2c,
> -michael

If all drivers replace all the magic numbers with the correct command names=
,
it will be a huge amount of work (assuming that the datasheet can be found)=
.
 I am afraid I don't have enough time to complete it.  Thanks.

>
> > > -michael
> > >
> > > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 14 ++++++++++----
> > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/driver=
s/gpu/drm/panel/panel-ilitek-ili9806e.c
> > > > index e4a44cd26c4d..68fb9a1a4d80 100644
> > > > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> > > > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> > > > @@ -35,6 +35,12 @@ struct ili9806e_panel {
> > > >       enum drm_panel_orientation orientation;
> > > >  };
> > > >
> > > > +#define ILI9806E_DCS_SWITCH_PAGE     0xff
> > > > +
> > > > +#define ili9806e_switch_page(ctx, page) \
> > > > +     mipi_dsi_dcs_write_seq_multi(ctx, ILI9806E_DCS_SWITCH_PAGE, \
> > > > +                                  0xff, 0x98, 0x06, 0x04, (page))
> > > > +
> > > >  static const char * const regulator_names[] =3D {
> > > >       "vdd",
> > > >       "vccio",
> > > > @@ -227,7 +233,7 @@ static void ili9806e_dsi_remove(struct mipi_dsi=
_device *dsi)
> > > >  static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
> > > >  {
> > > >       /* Switch to page 1 */
> > > > -     mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x0=
4, 0x01);
> > > > +     ili9806e_switch_page(ctx, 0x01);
> >
> > I think with your change you should remove the "Switch to page X"
> > comments since they're now obvious. Other than that, I'm happy with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
