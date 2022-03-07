Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808D4D060F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 19:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A127010E100;
	Mon,  7 Mar 2022 18:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BE310E100
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 18:13:02 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d17so5939723pfv.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 10:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B6TsA2XdiYCsVCW3zF/aw39LpYtkoWg4fApwKJ6gmVw=;
 b=NPI9cJpZJGsl1RRJXCbjypAIObWaZrfLdzSTVP4Hl8FLRMVmD8hxJvJveN331QcppE
 qPQW4nt53HD/7XlOdvP7Wxi74RUHnFCJ5/gWZEp97N8iOKA2kh6WcINEwXJqcjo03jt6
 g3nH8X5TAifEYgahdO+5cjwPEbnOfcMtE7wKUACGy1hLYJqq7IXBB0O3gLS9YwQVRTV3
 5PDuMjV/QgR3r0XdnDzs7YZ7VM3bMu2O6lxtmJHubNz5fDqVw/lhAaIGulJQBoFcsh8B
 5RMuIPLgYcjn0V9iE2h6EvMy/G9I6xtWuYeKXYPY/4jdeMTLpMzD2aXMatk4vKnbao+G
 PLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B6TsA2XdiYCsVCW3zF/aw39LpYtkoWg4fApwKJ6gmVw=;
 b=KzpBRKYXYpHnZPCWSty8Jpje8ooeNIHm/4meBGYP+adpY0QmeKj1PIixAmT02pBADu
 vMNhRHzsu0e6CTz0xkI6Mqv+3K2RyVbPffl98hlBlepvyiC6IJTsUf/vZ1X+fRiOTESS
 ZXg1i+2DDoOWQpCUkpj1mwytRUWAcYlOYEzegD5HBBlE0GK7GoUgAlOO1AaqjaZgJDtd
 +AweGt8y9y/X9cNntZ71VC/PkhNeVGVknA+Cnukqf9zCRzCktzbFBomm/M4Im1Z/B5v9
 SEgpdtPNfr459Enx6wfHvCG4EE+Rmo/mX2wpo8WWg58IzukiwqOmrsy+jMlptavKYsKd
 D0hA==
X-Gm-Message-State: AOAM531doHhkFHljpP9ylW2OaB9ZAk0V4ucWpLt/y+ClMSN8sp1gE3qj
 oNd94iB7r3VjeCcJb0Dw+flcS675z7AK9Q/opsA=
X-Google-Smtp-Source: ABdhPJwv8Oq73LsXdfaVk3NJmFp9gR6Y6EpdkcLPgyA9p4k18Xc3iMqj44R+bhPSTRJjFK2FsUjccNownQ2eZaZAYG4=
X-Received: by 2002:a63:c011:0:b0:378:74a6:9c31 with SMTP id
 h17-20020a63c011000000b0037874a69c31mr10811098pgg.585.1646676781529; Mon, 07
 Mar 2022 10:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20220301153122.20660-1-cbranchereau@gmail.com>
 <20220301153122.20660-4-cbranchereau@gmail.com>
 <VM548R.0I9BAN681OS83@crapouillou.net>
In-Reply-To: <VM548R.0I9BAN681OS83@crapouillou.net>
From: Christophe Branchereau <cbranchereau@gmail.com>
Date: Mon, 7 Mar 2022 19:12:49 +0100
Message-ID: <CAFsFa85Wb7HcxCqGCYQoSOHOTLJY9xtUHc85PoxO3XTbr=HN4g@mail.gmail.com>
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

Hi Paul, it should in theory, but doesn't work in practice, the
display doesn't like having that bit set outside of the init sequence.

Feel free to experiment if you think you can make it work though, you
should have that panel on 1 or 2 devices I think.

KR
CB

On Wed, Mar 2, 2022 at 12:22 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Christophe,
>
> Le mar., mars 1 2022 at 16:31:22 +0100, Christophe Branchereau
> <cbranchereau@gmail.com> a =C3=A9crit :
> > Following the introduction of bridge_atomic_enable in the ingenic
> > drm driver, the crtc is enabled between .prepare and .enable, if
> > it exists.
> >
> > Add it so the backlight is only enabled after the crtc is, to avoid
> > graphical issues.
> >
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 23 ++++++++++++--
> >  drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31
> > ++++++++++++++++---
> >  2 files changed, 48 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > index f043b484055b..b5736344e3ec 100644
> > --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> > +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
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
> > @@ -202,6 +200,25 @@ static int y030xx067a_unprepare(struct drm_panel
> > *panel)
> >       return 0;
> >  }
> >
> > +static int y030xx067a_enable(struct drm_panel *panel)
> > +{
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
>
> Shouldn't that be balanced by a regmap_set_bits() in the .enable()
> function?
>
> Cheers,
> -Paul
>
> > +
> > +     return 0;
> > +}
> > +
> >  static int y030xx067a_get_modes(struct drm_panel *panel,
> >                               struct drm_connector *connector)
> >  {
> > @@ -239,6 +256,8 @@ static int y030xx067a_get_modes(struct drm_panel
> > *panel,
> >  static const struct drm_panel_funcs y030xx067a_funcs =3D {
> >       .prepare        =3D y030xx067a_prepare,
> >       .unprepare      =3D y030xx067a_unprepare,
> > +     .enable         =3D y030xx067a_enable,
> > +     .disable        =3D y030xx067a_disable,
> >       .get_modes      =3D y030xx067a_get_modes,
> >  };
> >
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
> > 2.34.1
> >
>
>
