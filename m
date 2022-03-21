Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41474E2746
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CE010E277;
	Mon, 21 Mar 2022 13:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D59D10E277
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:12:23 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id d76so966233pga.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mEohOEa4Z3YAP5XexYCCbZz+gLzcw6SRQ1GP+Rej68Q=;
 b=MzB/0uANJBEzKT8Jth8tKtlNHY6ErC3WAqCY4nic7AOcrIarxPW3B/FVaYLwM7AJAx
 0daY0el8h98WxxSC2GwjQZiBP/pafbjJKOSLUxBa/ICHoNKAfCFqGr+uPvXPNq0erid2
 KmvBkXYJF7LLigcU4Tbq+isEYa2X8qExugiHx68fZSCZHR07+dyLKqLeskza+4PmOsCo
 MEPTy8UnNdpZtNt1Jvc2KNzOOBZEbDmjBrWQ8ee42J1s8y6ADeh/nY3CoJOQ4IDRk35K
 nmZGu4IEloLqCTzZaGAYtg0+Mebv5dkm+TvchRN9rdKGg0CKagO42SFEeBApblNE4cO5
 178w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mEohOEa4Z3YAP5XexYCCbZz+gLzcw6SRQ1GP+Rej68Q=;
 b=zWvhpMCuILBoFNJ79AyXgk6qgxpcQmcF7+Enz6T+sKewpr64Kq2Dd/LhNNpENC9Oer
 bb8lsD99H8DlxNtrHF4q8ltnENFvrzZOc4Xz4urPukol7/7+bu0phIRqiSKgOs6nVliV
 RY3osFNT+3bQKflXLBHu8XK8wR24qMEc1+7tA8X5SoIFoXSG/Ceo8M7q1cpXWnrN5L4y
 zk9MK3xNw8zQ8bMCsGFynet9fufTUH/adgLcScCZwo1IEZyagqAe5c0AU9uREWhEPKH2
 n/7292NPrI0Q+IyMA3hDorHhd+EBdQyYehgUZmDZD3LLMlvMmdf045FDxYl0+b1zexbB
 ehLA==
X-Gm-Message-State: AOAM532m22EXnmcxhEN2ifJXFxttOudIaw/brPz88/yb6XB2F/iUQ1Ys
 15pSpaMQH1UKB5WsyW6YaUduWJcutVSfkV9HmYA=
X-Google-Smtp-Source: ABdhPJwl8G9oRmj3N217o3SVJs7VpI4fVP6vZmjtJfii7jsKzpcDrZ+TUHrJHmClEgK6jTrHv6jwZwMlKwwfvAVdCog=
X-Received: by 2002:a05:6a00:23d1:b0:4f7:109d:a1c1 with SMTP id
 g17-20020a056a0023d100b004f7109da1c1mr24145314pfc.2.1647868342518; Mon, 21
 Mar 2022 06:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220301153122.20660-1-cbranchereau@gmail.com>
 <20220301153122.20660-4-cbranchereau@gmail.com>
 <VM548R.0I9BAN681OS83@crapouillou.net>
 <CAFsFa85Wb7HcxCqGCYQoSOHOTLJY9xtUHc85PoxO3XTbr=HN4g@mail.gmail.com>
 <736R8R.46MVQ2VHV6IY1@crapouillou.net>
In-Reply-To: <736R8R.46MVQ2VHV6IY1@crapouillou.net>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Mon, 21 Mar 2022 14:12:10 +0100
Message-ID: <CAFsFa87U2REBB=W6c4yy5Y3u1nmPHoKY3_vn31tkM+7PZt1Omw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/panel : innolux-ej030na and abt-y030xx067a :
 add .enable and .disable
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul, yes that works fine, thanks for checking it out

On Mon, Mar 14, 2022 at 9:54 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Christophe,
>
> Le lun., mars 7 2022 at 19:12:49 +0100, Christophe Branchereau
> <cbranchereau@gmail.com> a =C3=A9crit :
> > Hi Paul, it should in theory, but doesn't work in practice, the
> > display doesn't like having that bit set outside of the init sequence.
> >
> > Feel free to experiment if you think you can make it work though, you
> > should have that panel on 1 or 2 devices I think.
>
> It does actually work in practice; what probably fails for you is the
> regmap_set_bits(), which causes a spi-read-then-write. Since AFAIK it
> is not possible to read registers from this panel (only write), then
> this does not work.
>
> An easy fix would be to just use REGCACHE_FLAT as the cache type in the
> regmap_config. Then regmap_set_bits() can be used.
>
> Cheers,
> -Paul
>
> >
> > KR
> > CB
> >
> > On Wed, Mar 2, 2022 at 12:22 PM Paul Cercueil <paul@crapouillou.net>
> > wrote:
> >>
> >>  Hi Christophe,
> >>
> >>  Le mar., mars 1 2022 at 16:31:22 +0100, Christophe Branchereau
> >>  <cbranchereau@gmail.com> a =C3=A9crit :
> >>  > Following the introduction of bridge_atomic_enable in the ingenic
> >>  > drm driver, the crtc is enabled between .prepare and .enable, if
> >>  > it exists.
> >>  >
> >>  > Add it so the backlight is only enabled after the crtc is, to
> >> avoid
> >>  > graphical issues.
> >>  >
> >>  > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> >>  > ---
> >>  >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 23 ++++++++++++--
> >>  >  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31
> >>  > ++++++++++++++++---
> >>  >  2 files changed, 48 insertions(+), 6 deletions(-)
> >>  >
> >>  > diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> >>  > b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> >>  > index f043b484055b..b5736344e3ec 100644
> >>  > --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> >>  > +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> >>  > @@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel
> >>  > *panel)
> >>  >               goto err_disable_regulator;
> >>  >       }
> >>  >
> >>  > -     msleep(120);
> >>  > -
> >>  >       return 0;
> >>  >
> >>  >  err_disable_regulator:
> >>  > @@ -202,6 +200,25 @@ static int y030xx067a_unprepare(struct
> >> drm_panel
> >>  > *panel)
> >>  >       return 0;
> >>  >  }
> >>  >
> >>  > +static int y030xx067a_enable(struct drm_panel *panel)
> >>  > +{
> >>  > +     if (panel->backlight) {
> >>  > +             /* Wait for the picture to be ready before enabling
> >> backlight */
> >>  > +             msleep(120);
> >>  > +     }
> >>  > +
> >>  > +     return 0;
> >>  > +}
> >>  > +
> >>  > +static int y030xx067a_disable(struct drm_panel *panel)
> >>  > +{
> >>  > +     struct y030xx067a *priv =3D to_y030xx067a(panel);
> >>  > +
> >>  > +     regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);
> >>
> >>  Shouldn't that be balanced by a regmap_set_bits() in the .enable()
> >>  function?
> >>
> >>  Cheers,
> >>  -Paul
> >>
> >>  > +
> >>  > +     return 0;
> >>  > +}
> >>  > +
> >>  >  static int y030xx067a_get_modes(struct drm_panel *panel,
> >>  >                               struct drm_connector *connector)
> >>  >  {
> >>  > @@ -239,6 +256,8 @@ static int y030xx067a_get_modes(struct
> >> drm_panel
> >>  > *panel,
> >>  >  static const struct drm_panel_funcs y030xx067a_funcs =3D {
> >>  >       .prepare        =3D y030xx067a_prepare,
> >>  >       .unprepare      =3D y030xx067a_unprepare,
> >>  > +     .enable         =3D y030xx067a_enable,
> >>  > +     .disable        =3D y030xx067a_disable,
> >>  >       .get_modes      =3D y030xx067a_get_modes,
> >>  >  };
> >>  >
> >>  > diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> >>  > b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> >>  > index c558de3f99be..6de7370185cd 100644
> >>  > --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> >>  > +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> >>  > @@ -80,8 +80,6 @@ static const struct reg_sequence
> >>  > ej030na_init_sequence[] =3D {
> >>  >       { 0x47, 0x08 },
> >>  >       { 0x48, 0x0f },
> >>  >       { 0x49, 0x0f },
> >>  > -
> >>  > -     { 0x2b, 0x01 },
> >>  >  };
> >>  >
> >>  >  static int ej030na_prepare(struct drm_panel *panel)
> >>  > @@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel
> >>  > *panel)
> >>  >               goto err_disable_regulator;
> >>  >       }
> >>  >
> >>  > -     msleep(120);
> >>  > -
> >>  >       return 0;
> >>  >
> >>  >  err_disable_regulator:
> >>  > @@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel
> >>  > *panel)
> >>  >       return 0;
> >>  >  }
> >>  >
> >>  > +static int ej030na_enable(struct drm_panel *panel)
> >>  > +{
> >>  > +     struct ej030na *priv =3D to_ej030na(panel);
> >>  > +
> >>  > +     /* standby off */
> >>  > +     regmap_write(priv->map, 0x2b, 0x01);
> >>  > +
> >>  > +     if (panel->backlight) {
> >>  > +             /* Wait for the picture to be ready before enabling
> >> backlight */
> >>  > +             msleep(120);
> >>  > +     }
> >>  > +
> >>  > +     return 0;
> >>  > +}
> >>  > +
> >>  > +static int ej030na_disable(struct drm_panel *panel)
> >>  > +{
> >>  > +     struct ej030na *priv =3D to_ej030na(panel);
> >>  > +
> >>  > +     /* standby on */
> >>  > +     regmap_write(priv->map, 0x2b, 0x00);
> >>  > +
> >>  > +     return 0;
> >>  > +}
> >>  > +
> >>  >  static int ej030na_get_modes(struct drm_panel *panel,
> >>  >                            struct drm_connector *connector)
> >>  >  {
> >>  > @@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel
> >>  > *panel,
> >>  >  static const struct drm_panel_funcs ej030na_funcs =3D {
> >>  >       .prepare        =3D ej030na_prepare,
> >>  >       .unprepare      =3D ej030na_unprepare,
> >>  > +     .enable         =3D ej030na_enable,
> >>  > +     .disable        =3D ej030na_disable,
> >>  >       .get_modes      =3D ej030na_get_modes,
> >>  >  };
> >>  >
> >>  > --
> >>  > 2.34.1
> >>  >
> >>
> >>
>
>
