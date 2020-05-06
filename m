Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F61C6E8B
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 12:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354416E029;
	Wed,  6 May 2020 10:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA326E029
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 10:38:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k12so2003590wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0O4Wk7qXB2T/KRRRJZxGlNhMmVWqgz6eW0lYeDRj47I=;
 b=K1NfRMSM6vdZWWn0blGT4AsqYfOEo0/nDgC5s48iO+UEDlBWTirQMshoHwVhNwz8V2
 6bObAu60vUZimYs3odjPKJsX/yGiFObgZyKa7mv9abZkEGLTqfmLAdg+U6afL9vXaTFZ
 FAb4sQl2xhuzM1cfNLIYvYHnO0FZJKyKuexCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0O4Wk7qXB2T/KRRRJZxGlNhMmVWqgz6eW0lYeDRj47I=;
 b=EiBbswBA/AsygZ+s53x40D71/R2bzSM7Zgs5e3hKysUdpkpSKGSye0D1aO0IoGjGhQ
 WeXFSR6KlWYJL3w4FsTtuSShSixVUvlu0vk6IxKJrrp2sNQDEHLdjxg/jAPlnct6c3fz
 xLToCqZairgB12Aav4Hffz4mvYrI7L3oRAp1WQArYnO3cZb24RMOjTetQhbyy0Li+Kch
 cvibLAj1J4e2+oAQTGK0Wm6Iau9puO1o9rovNjgf4Hoa2+Gu6NYy4dFV1A3FGfpiAArG
 r/gozwdzhbOdzM65HPtPBAjG9+eVMxEPxX1oIXP5WuN1rWK6FxYMHe9pyHvHtRQ6LMmo
 JIUg==
X-Gm-Message-State: AGi0PuaNbwmbiwQeHtFBhK+R9BZs4S98rwqVJh1TNdF8gfEt8c/0xIG2
 1u+rNX8qAlU/zhgGAUF+npLwVg==
X-Google-Smtp-Source: APiQypJpGyj5lytK4s6T4EM+wKFpikc9dHHrp0ePqFfdPKIXZB9noVF+I5pEkDymiB13ZfqFdwcevA==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr3934668wmj.21.1588761500004; 
 Wed, 06 May 2020 03:38:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 17sm2305184wmo.2.2020.05.06.03.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 03:38:19 -0700 (PDT)
Date: Wed, 6 May 2020 12:38:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/3] drm/panel: update backlight handling for
 samsung-s6e63j0x03
Message-ID: <20200506103817.GV10381@phenom.ffwll.local>
References: <20200409115239.5149-1-sam@ravnborg.org>
 <20200409115239.5149-3-sam@ravnborg.org>
 <CACvgo50wKm15F8z6xmTcXZHZt0NoXqpeuitmLFoenueJuY9nNA@mail.gmail.com>
 <20200409144613.GA5396@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409144613.GA5396@ravnborg.org>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: Joonas =?iso-8859-1?Q?Kylm=E4l=E4?= <joonas.kylmala@iki.fi>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Hyungwon Hwang <human.hwang@samsung.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 04:46:13PM +0200, Sam Ravnborg wrote:
> Hi Emil.
> =

> Thanks for your feedback!
> =

> On Thu, Apr 09, 2020 at 03:13:28PM +0100, Emil Velikov wrote:
> > On Thu, 9 Apr 2020 at 12:53, Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > The samsung-s6e63j0x03 had a local way to handle backlight.
> > >
> > > Update the driver to use a devm_ based register function
> > > and utilize drm_panel backlight support. The changes results
> > > in a simpler driver with the same functionality.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Joonas Kylm=E4l=E4 <joonas.kylmala@iki.fi>
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Inki Dae <inki.dae@samsung.com>
> > > Cc: Hyungwon Hwang <human.hwang@samsung.com>
> > > Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > > ---
> > >  .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  | 55 ++++++++++-------=
--
> > >  1 file changed, 29 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drive=
rs/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > > index a3570e0a90a8..2c035f87e3f0 100644
> > > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > > @@ -36,7 +36,6 @@
> > >  struct s6e63j0x03 {
> > >         struct device *dev;
> > >         struct drm_panel panel;
> > > -       struct backlight_device *bl_dev;
> > >
> > >         struct regulator_bulk_data supplies[2];
> > >         struct gpio_desc *reset_gpio;
> > > @@ -184,7 +183,7 @@ static unsigned int s6e63j0x03_get_brightness_ind=
ex(unsigned int brightness)
> > >  static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
> > >                                         unsigned int brightness)
> > >  {
> > > -       struct backlight_device *bl_dev =3D ctx->bl_dev;
> > > +       struct backlight_device *bl_dev =3D ctx->panel.backlight;
> > >         unsigned int index =3D s6e63j0x03_get_brightness_index(bright=
ness);
> > >         int ret;
> > >
> > > @@ -217,6 +216,30 @@ static const struct backlight_ops s6e63j0x03_bl_=
ops =3D {
> > >         .update_status =3D s6e63j0x03_set_brightness,
> > >  };
> > >
> > > +static int s6e63j0x03_backlight_register(struct s6e63j0x03 *ctx)
> > > +{
> > > +       struct backlight_properties props =3D {
> > Pretty sure we can (should really) make the props const.
> Thanks, will fix either in v2 or when I apply.
> =

> > =

> > Quick grep through drm, shows that there're other offenders, so might
> > as well do that in separate series.
> > Seems like other panels could follow suite, with later series of course.
> > =

> > Back on topic, it's not immediately obvious why the FB_BLANK_*
> > handling is safe to remove. Please add small mention in the commit log
> > mentioning why.
> =

> Maybe because it is not so?
> Lets take a closer look.
> backlight_enable() and backlight_disable() are called from
> drm_panel - because drm_panel->backlight is assigned.
> =

> =

> drm_panel_prepare:
> OLD:	ctx->bl_dev->props.power =3D FB_BLANK_NORMAL;
> NEW:
> =

> drm_panel_enable:
> OLD:	ctx->bl_dev->props.power =3D FB_BLANK_UNBLANK;
> NEW:	backlight_enable() =3D> =

> 		bd->props.power =3D FB_BLANK_UNBLANK;
> 		bd->props.fb_blank =3D FB_BLANK_UNBLANK;
> 	        bd->props.state &=3D ~BL_CORE_FBBLANK;
> =

> drm_panel_disable:
> OLD:	ctx->bl_dev->props.power =3D FB_BLANK_NORMAL;
> NEW:	backlight_disable() =3D>
> 		bd->props.power =3D FB_BLANK_POWERDOWN;
> 	        bd->props.fb_blank =3D FB_BLANK_POWERDOWN;
>         	bd->props.state |=3D BL_CORE_FBBLANK;
> =

> =

> drm_panel_unprepare:
> OLD:	ctx->bl_dev->props.power =3D FB_BLANK_POWERDOWN;
> NEW:
> =

> So old and new code are not exactly the same.
> =

> But with my (limited) backlight understanding this should
> work as expected - and it works for many other drivers.
> So if this does not work, then we should look at the backlight
> handling and not do workarounds in the driver.
> =

> I will summarize the above in the individual changelogs.

This is a long-term conversion even listed in the todo.rst. Backlight has
3 different flags that control on/off, and it's a complete mess. There's
uber-arcane rules as to in which order backlight drivers should be
following them (I think it's a logical and, but not sure), the goal is to
condense it all down to 1 on/off switch. todo.rst has the full plan.

So moving stuff over to backlight_enable/disable() functions is Very Good.
-Daniel

> =

> 	Sam
> =

> =

> > =

> > -Emil
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
