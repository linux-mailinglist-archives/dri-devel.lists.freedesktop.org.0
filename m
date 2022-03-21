Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A64E2AFF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 15:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656310E3F7;
	Mon, 21 Mar 2022 14:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70FF10E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 14:39:34 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id s42so15685756pfg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=otEtZcU6MdpaBuEDZA9J3R3n8hjTa/J/6ZnkgJ1OboU=;
 b=dynQS1StUd8M+YLBvJbW1baAzNtE1ZWcmhSLV2F4BKkMHSYUQo9CzXJBxNklp7T7zF
 sUTGMf4kr2QZ+wZkJ62YrluqEKVw042Xu/IH5TRSRXbol5MCGoj484bR7TKt3bjNS+Ps
 rn3ht4jMcXD9OiMn7P19ESPQVKpYskydNUnWNY2HTGWNTG2NfjTzJvKjS3NK4rfd6YtQ
 Rf0LZbGPW+UwOvaTj4lJSyp460rqGr3TslK5zcpCn9c5i52d1pkChG179t86eHKbyAuv
 6bw1g55ZL3tPGm8xQk+grnj0OnI0zkr5cDYlEs+CjWnhGiro04vw3ezzyTIBm+D0NDXk
 bmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=otEtZcU6MdpaBuEDZA9J3R3n8hjTa/J/6ZnkgJ1OboU=;
 b=OmnvFlC5NzNbI/UlDNxqa3p0Lv388Pb9J3tuF+FZNWawmDik3/fP4JvrNoKqPx/QsY
 5NENjFng0ij9hhd1XmElaRHu/Eif5EL+CnKnR33X8S26VVMUuilLZi1auiWtsfKW8vCU
 BoNJC9ncEhDP6uw1Y0x9uAUkWG5NLa7HGsskc/nCQY7J3j7RF54uL+k9PFHQM1zvYCpx
 Zy9kEYldIFLb0lzWOnkm59V7aYWbTZT6Y+OxxrveupZKDPkO6EAjitdoG1zIkM5VGjnp
 lhoGHtNTabm61TCafif8YujVWXk/fHQg1eeFXrotG99WPeu7qwNV+G3lcs9TDXD2hzMP
 3C+A==
X-Gm-Message-State: AOAM533GCAY6Jk+pBEEOUpTAFwjYeOOlpev9VxploNilXTa4KOAOa7bb
 qfqVJ1pP+Jpa8nfITxIGeIllewolM94+Fyr0JaA=
X-Google-Smtp-Source: ABdhPJzt1jDFcRgvlEDBWJcGiWHbLWxR0X41mnznthjFPoZLD9uxyCOETKWi4zF8ymcspL5dNWDpejVEQCZj2iNBlGs=
X-Received: by 2002:a63:68c8:0:b0:380:3fbd:2ec9 with SMTP id
 d191-20020a6368c8000000b003803fbd2ec9mr18207249pgc.608.1647873574355; Mon, 21
 Mar 2022 07:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220321133651.291592-1-cbranchereau@gmail.com>
 <20220321133651.291592-4-cbranchereau@gmail.com>
 <GJM39R.I3L8ZIKHOJ252@crapouillou.net>
In-Reply-To: <GJM39R.I3L8ZIKHOJ252@crapouillou.net>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Mon, 21 Mar 2022 15:39:23 +0100
Message-ID: <CAFsFa85Rcxh7G-X9zygHdAaca2nydUXxGfE2Vgcx_nzqgQZVgw@mail.gmail.com>
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

Following the introduction of bridge_atomic_enable in the ingenic
drm driver, the crtc is enabled between .prepare and .enable, if
it exists. Add it so the backlight is only enabled after the crtc is, to
avoid graphical issues.

As we're moving the "sleep in" command out of the init sequence
into .enable for the ABT, we need to switch the regmap cache
to REGCACHE_FLAT to be able to use regmap_set_bits, given this
panel registers are write-ony and read as 0.

On Mon, Mar 21, 2022 at 3:21 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Christophe,
>
> Le lun., mars 21 2022 at 14:36:51 +0100, Christophe Branchereau
> <cbranchereau@gmail.com> a =C3=A9crit :
> > Following the introduction of bridge_atomic_enable in the ingenic
> > drm driver, the crtc is enabled between .prepare and .enable, if
> > it exists.
> >
> > Add it so the backlight is only enabled after the crtc is, to avoid
> > graphical issues.
> >
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
>
> Didn't Sam acked it?
>
> > ---
> >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 31
> > +++++++++++++++++--
> >  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31
> > ++++++++++++++++---
> >  2 files changed, 55 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > index f043b484055b..ddfacaeac1d4 100644
> > --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > @@ -140,7 +140,7 @@ static const struct reg_sequence
> > y030xx067a_init_sequence[] =3D {
> >       { 0x03, REG03_VPOSITION(0x0a) },
> >       { 0x04, REG04_HPOSITION1(0xd2) },
> >       { 0x05, REG05_CLIP | REG05_NVM_VREFRESH | REG05_SLBRCHARGE(0x2) }=
,
> > -     { 0x06, REG06_XPSAVE | REG06_NT },
> > +     { 0x06, REG06_NT },
> >       { 0x07, 0 },
> >       { 0x08, REG08_PANEL(0x1) | REG08_CLOCK_DIV(0x2) },
> >       { 0x09, REG09_SUB_BRIGHT_R(0x20) },
> > @@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel
> > *panel)
> >               goto err_disable_regulator;
> >       }
> >
> > -     msleep(120);
> > -
> >       return 0;
> >
> >  err_disable_regulator:
> > @@ -202,6 +200,30 @@ static int y030xx067a_unprepare(struct drm_panel
> > *panel)
> >       return 0;
> >  }
> >
> > +static int y030xx067a_enable(struct drm_panel *panel)
> > +{
> > +
> > +     struct y030xx067a *priv =3D to_y030xx067a(panel);
> > +
> > +     regmap_set_bits(priv->map, 0x06, REG06_XPSAVE);
> > +
> > +     if (panel->backlight) {
> > +             /* Wait for the picture to be ready before enabling backl=
ight */
> > +             msleep(120);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int y030xx067a_disable(struct drm_panel *panel)
> > +{
> > +     struct y030xx067a *priv =3D to_y030xx067a(panel);
> > +
> > +     regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);
> > +
> > +     return 0;
> > +}
> > +
> >  static int y030xx067a_get_modes(struct drm_panel *panel,
> >                               struct drm_connector *connector)
> >  {
> > @@ -239,6 +261,8 @@ static int y030xx067a_get_modes(struct drm_panel
> > *panel,
> >  static const struct drm_panel_funcs y030xx067a_funcs =3D {
> >       .prepare        =3D y030xx067a_prepare,
> >       .unprepare      =3D y030xx067a_unprepare,
> > +     .enable         =3D y030xx067a_enable,
> > +     .disable        =3D y030xx067a_disable,
> >       .get_modes      =3D y030xx067a_get_modes,
> >  };
> >
> > @@ -246,6 +270,7 @@ static const struct regmap_config
> > y030xx067a_regmap_config =3D {
> >       .reg_bits =3D 8,
> >       .val_bits =3D 8,
> >       .max_register =3D 0x15,
> > +     .cache_type =3D REGCACHE_FLAT,
>
> I understand that this is added because the panel registers are
> write-only and read as zero, and it is needed for
> regmap_{clear,set}_bits to work.
>
> This information should definitely be added to the commit message.
>
> If you can add it inline here, and I'll update the commit message when
> applying the patch.
>
> Cheers,
> -Paul
>
> >  };
> >
> >  static int y030xx067a_probe(struct spi_device *spi)
> > diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > index c558de3f99be..6de7370185cd 100644
> > --- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > +++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
> > @@ -80,8 +80,6 @@ static const struct reg_sequence
> > ej030na_init_sequence[] =3D {
> >       { 0x47, 0x08 },
> >       { 0x48, 0x0f },
> >       { 0x49, 0x0f },
> > -
> > -     { 0x2b, 0x01 },
> >  };
> >
> >  static int ej030na_prepare(struct drm_panel *panel)
> > @@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel
> > *panel)
> >               goto err_disable_regulator;
> >       }
> >
> > -     msleep(120);
> > -
> >       return 0;
> >
> >  err_disable_regulator:
> > @@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel
> > *panel)
> >       return 0;
> >  }
> >
> > +static int ej030na_enable(struct drm_panel *panel)
> > +{
> > +     struct ej030na *priv =3D to_ej030na(panel);
> > +
> > +     /* standby off */
> > +     regmap_write(priv->map, 0x2b, 0x01);
> > +
> > +     if (panel->backlight) {
> > +             /* Wait for the picture to be ready before enabling backl=
ight */
> > +             msleep(120);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ej030na_disable(struct drm_panel *panel)
> > +{
> > +     struct ej030na *priv =3D to_ej030na(panel);
> > +
> > +     /* standby on */
> > +     regmap_write(priv->map, 0x2b, 0x00);
> > +
> > +     return 0;
> > +}
> > +
> >  static int ej030na_get_modes(struct drm_panel *panel,
> >                            struct drm_connector *connector)
> >  {
> > @@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel
> > *panel,
> >  static const struct drm_panel_funcs ej030na_funcs =3D {
> >       .prepare        =3D ej030na_prepare,
> >       .unprepare      =3D ej030na_unprepare,
> > +     .enable         =3D ej030na_enable,
> > +     .disable        =3D ej030na_disable,
> >       .get_modes      =3D ej030na_get_modes,
> >  };
> >
> > --
> > 2.35.1
> >
>
>
