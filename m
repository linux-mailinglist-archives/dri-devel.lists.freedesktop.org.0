Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8F94E2B0F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A2310E4A4;
	Mon, 21 Mar 2022 14:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080910E4A4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:42:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k6so5766277plg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=itwmKt5D3YRmhePmZfG4X/rjRFYViLaVcU1Zd/ou0pM=;
 b=Iy48cvT2SJoI0Y2J0k4o97AvhdQ6RHEcwKzzsgUzHhYvya6G44v/Caw2bM8uP8GX+4
 lQRwewSNc9UnV7jx4cO6kzOEUmoHGQBA4MI4oDPDgXyVYI38gLc3l1m9VfabR62V3Fgf
 k8XUmyQ8CmaVnixy35W5nGFRfk53nRLsxMhO6rJn16+voNEn4F+VqjJ6IRaAj3cdPhj/
 zD4+/5lYyHUsekI/K140bl4UG+fzVFzPAgkkguvGfOyvqt6msKeh2FA9l/muaqYeJEsg
 aWPGa/bLsPwbYsdpgvRPOQMx499QvSTtcLkL8bziZpID6c1qR2tGjjTb4SeJEgL7Sipo
 hEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=itwmKt5D3YRmhePmZfG4X/rjRFYViLaVcU1Zd/ou0pM=;
 b=KAqz68DzJxzJiVagnjNSWFxzMdLK2Hjh1XFqITmB/K9ZWKh8hlmKeDBGr5k/H5v8Nt
 25lbIlUYjeN34hgPxcrqr2vJtQZkirlxL/6vyEfXboMnpFQHp1Z9gcHEzaE1IuqiB820
 QMKJZtmBHqZk+cOA8LxxVbpbF0vNNRS52EXQZnHfFNwmluSCMMJoW+C7SHW7nfkJCBjv
 qnG3T8wbDqNfvBMgnSX32N6AyOp2yAKKABJjxW2wIUmkknTb33QnUrVZmIcDMLJNkT+0
 wxWmSoeos3aE2jYufGk14LlED7qY4TjrCp+2N7Ql20Nprs/K/zvFZ65RnJ6DmRC7kFz7
 7asg==
X-Gm-Message-State: AOAM532ZKgmjdLBufqWwFeTV7973s4rAtuopQn04/iaIwU8VoRo1mBb/
 c+6P+Si6GVMWeZz/TYoFiyFJ0KutWxKN8EqE67o=
X-Google-Smtp-Source: ABdhPJyBnbo/UgxXqMV8gAY32qIJY6RHi9yPSeHqk0GIu5ekRfhkzA4VaeBXM8z2kz7ftDIR1xkMsAdLb/iUTjzJGYU=
X-Received: by 2002:a17:90a:7e8b:b0:1be:ef6c:9797 with SMTP id
 j11-20020a17090a7e8b00b001beef6c9797mr36644729pjl.183.1647873739850; Mon, 21
 Mar 2022 07:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220321133651.291592-1-cbranchereau@gmail.com>
 <20220321133651.291592-4-cbranchereau@gmail.com>
 <GJM39R.I3L8ZIKHOJ252@crapouillou.net>
 <CAFsFa85Rcxh7G-X9zygHdAaca2nydUXxGfE2Vgcx_nzqgQZVgw@mail.gmail.com>
In-Reply-To: <CAFsFa85Rcxh7G-X9zygHdAaca2nydUXxGfE2Vgcx_nzqgQZVgw@mail.gmail.com>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Mon, 21 Mar 2022 15:42:08 +0100
Message-ID: <CAFsFa85P8V-yePR5LTLjn57GCoqJJYn5pX6WNdp+a+G23XEbSg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/panel : innolux-ej030na and abt-y030xx067a :
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry I meant "sleep out" not "sleep in" obviously

On Mon, Mar 21, 2022 at 3:39 PM Christophe Branchereau
<cbranchereau@gmail.com> wrote:
>
> Following the introduction of bridge_atomic_enable in the ingenic
> drm driver, the crtc is enabled between .prepare and .enable, if
> it exists. Add it so the backlight is only enabled after the crtc is, to
> avoid graphical issues.
>
> As we're moving the "sleep in" command out of the init sequence
> into .enable for the ABT, we need to switch the regmap cache
> to REGCACHE_FLAT to be able to use regmap_set_bits, given this
> panel registers are write-ony and read as 0.
>
> On Mon, Mar 21, 2022 at 3:21 PM Paul Cercueil <paul@crapouillou.net> wrot=
e:
> >
> > Hi Christophe,
> >
> > Le lun., mars 21 2022 at 14:36:51 +0100, Christophe Branchereau
> > <cbranchereau@gmail.com> a =C3=A9crit :
> > > Following the introduction of bridge_atomic_enable in the ingenic
> > > drm driver, the crtc is enabled between .prepare and .enable, if
> > > it exists.
> > >
> > > Add it so the backlight is only enabled after the crtc is, to avoid
> > > graphical issues.
> > >
> > > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> >
> > Didn't Sam acked it?
> >
> > > ---
> > >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 31
> > > +++++++++++++++++--
> > >  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31
> > > ++++++++++++++++---
> > >  2 files changed, 55 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > > b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > > index f043b484055b..ddfacaeac1d4 100644
> > > --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > > +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > > @@ -140,7 +140,7 @@ static const struct reg_sequence
> > > y030xx067a_init_sequence[] =3D {
> > >       { 0x03, REG03_VPOSITION(0x0a) },
> > >       { 0x04, REG04_HPOSITION1(0xd2) },
> > >       { 0x05, REG05_CLIP | REG05_NVM_VREFRESH | REG05_SLBRCHARGE(0x2)=
 },
> > > -     { 0x06, REG06_XPSAVE | REG06_NT },
> > > +     { 0x06, REG06_NT },
> > >       { 0x07, 0 },
> > >       { 0x08, REG08_PANEL(0x1) | REG08_CLOCK_DIV(0x2) },
> > >       { 0x09, REG09_SUB_BRIGHT_R(0x20) },
> > > @@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel
> > > *panel)
> > >               goto err_disable_regulator;
> > >       }
> > >
> > > -     msleep(120);
> > > -
> > >       return 0;
> > >
> > >  err_disable_regulator:
> > > @@ -202,6 +200,30 @@ static int y030xx067a_unprepare(struct drm_panel
> > > *panel)
> > >       return 0;
> > >  }
> > >
> > > +static int y030xx067a_enable(struct drm_panel *panel)
> > > +{
> > > +
> > > +     struct y030xx067a *priv =3D to_y030xx067a(panel);
> > > +
> > > +     regmap_set_bits(priv->map, 0x06, REG06_XPSAVE);
> > > +
> > > +     if (panel->backlight) {
> > > +             /* Wait for the picture to be ready before enabling bac=
klight */
> > > +             msleep(120);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int y030xx067a_disable(struct drm_panel *panel)
> > > +{
> > > +     struct y030xx067a *priv =3D to_y030xx067a(panel);
> > > +
> > > +     regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static int y030xx067a_get_modes(struct drm_panel *panel,
> > >                               struct drm_connector *connector)
> > >  {
> > > @@ -239,6 +261,8 @@ static int y030xx067a_get_modes(struct drm_panel
> > > *panel,
> > >  static const struct drm_panel_funcs y030xx067a_funcs =3D {
> > >       .prepare        =3D y030xx067a_prepare,
> > >       .unprepare      =3D y030xx067a_unprepare,
> > > +     .enable         =3D y030xx067a_enable,
> > > +     .disable        =3D y030xx067a_disable,
> > >       .get_modes      =3D y030xx067a_get_modes,
> > >  };
> > >
> > > @@ -246,6 +270,7 @@ static const struct regmap_config
> > > y030xx067a_regmap_config =3D {
> > >       .reg_bits =3D 8,
> > >       .val_bits =3D 8,
> > >       .max_register =3D 0x15,
> > > +     .cache_type =3D REGCACHE_FLAT,
> >
> > I understand that this is added because the panel registers are
> > write-only and read as zero, and it is needed for
> > regmap_{clear,set}_bits to work.
> >
> > This information should definitely be added to the commit message.
> >
> > If you can add it inline here, and I'll update the commit message when
> > applying the patch.
> >
> > Cheers,
> > -Paul
> >
> > >  };
> > >
> > >  static int y030xx067a_probe(struct spi_device *spi)
> > > diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > > b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > > index c558de3f99be..6de7370185cd 100644
> > > --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > > +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > > @@ -80,8 +80,6 @@ static const struct reg_sequence
> > > ej030na_init_sequence[] =3D {
> > >       { 0x47, 0x08 },
> > >       { 0x48, 0x0f },
> > >       { 0x49, 0x0f },
> > > -
> > > -     { 0x2b, 0x01 },
> > >  };
> > >
> > >  static int ej030na_prepare(struct drm_panel *panel)
> > > @@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel
> > > *panel)
> > >               goto err_disable_regulator;
> > >       }
> > >
> > > -     msleep(120);
> > > -
> > >       return 0;
> > >
> > >  err_disable_regulator:
> > > @@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel
> > > *panel)
> > >       return 0;
> > >  }
> > >
> > > +static int ej030na_enable(struct drm_panel *panel)
> > > +{
> > > +     struct ej030na *priv =3D to_ej030na(panel);
> > > +
> > > +     /* standby off */
> > > +     regmap_write(priv->map, 0x2b, 0x01);
> > > +
> > > +     if (panel->backlight) {
> > > +             /* Wait for the picture to be ready before enabling bac=
klight */
> > > +             msleep(120);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ej030na_disable(struct drm_panel *panel)
> > > +{
> > > +     struct ej030na *priv =3D to_ej030na(panel);
> > > +
> > > +     /* standby on */
> > > +     regmap_write(priv->map, 0x2b, 0x00);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static int ej030na_get_modes(struct drm_panel *panel,
> > >                            struct drm_connector *connector)
> > >  {
> > > @@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel
> > > *panel,
> > >  static const struct drm_panel_funcs ej030na_funcs =3D {
> > >       .prepare        =3D ej030na_prepare,
> > >       .unprepare      =3D ej030na_unprepare,
> > > +     .enable         =3D ej030na_enable,
> > > +     .disable        =3D ej030na_disable,
> > >       .get_modes      =3D ej030na_get_modes,
> > >  };
> > >
> > > --
> > > 2.35.1
> > >
> >
> >
