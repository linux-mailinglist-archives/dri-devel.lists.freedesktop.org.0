Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06114A39751
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD2610E253;
	Tue, 18 Feb 2025 09:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KZOjc3da";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B97510E253
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:43:57 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-545fed4642aso2494088e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739871835; x=1740476635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9j3FDtCSLrxBBi5ynX/ADgMlPdUEwdI7w+vv6UgkLA=;
 b=KZOjc3daGf2yZu+2JedV4Ny+kw3vwEG0VEup6fjC7EO61D2mhb359h456P1mwPX8TV
 LZuWDXAwk4y0tjpIpdjG7KdYmivBUarF8Utvjpk/Lk+s/D9S49wfMMd/sKa3FOaoiWdP
 VbVWJcec4UXdYKI/qwiGAynzkFXLUHOwD7H2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739871835; x=1740476635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9j3FDtCSLrxBBi5ynX/ADgMlPdUEwdI7w+vv6UgkLA=;
 b=hEL6raywbFoHrGAdHyiQJUAaF1cgWs9XkWsqIkk4GD6WGwJHDahUToor+9Qc0pq13L
 Qvol+M8yBewnZoAwQaHyoovCPK4f9w2/fmvUQgX+dmAmbl9tyovHq99ypioLZRDRyMzg
 IRz8FqGtRV5eW4P0wONshQL6tIem7uZbnTXcUadebcYcMwSTyzNzRYkQyPgasbX+XcH6
 YeN7pGBpvI+g8Itl4fOn33065iqQOzQ7Kh5In4UxVJ+EvWaVQp7+eJcjJHZPPiRsXO6b
 XVpyuQE01vKFq7u3GWKVF4u4bczPmbSGs77aGU4+aonnVqmjzY3SW7+GDr6MwleAOuyI
 BLbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0QM5gPAauLqHqBpI7CYDExvM8SLD4R4f2GkCcXDhBtiO6Nat7g5u4Wke7/3Apt04I8u2WvEC7jaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRYYnEuYGQJVTO5oZydVnNBbJz34TxUgQYxwitYNwk93VmwiYO
 GvZWRKxfDl+8P6nuH53Ym6rPDUjvv+O1GLqJXyLZX8ny3WeyfkiynhYn9c+LONWS5APAyPewz/O
 94V7eugQiOLX0CRmGSqueqK5kBnD6I8EpfBYs
X-Gm-Gg: ASbGnctIgEuApTQJ8vs3rvqKirNB+6FjRGsSWC07Fl97wmUlQTgyZn2X9H+3N+ZuqzS
 kPeCBC+3ZhEq9vHDX4Y2LZqnvRhSNLD4wlaE3ys8O35htq8QaZNx5oPW9W1BgFHjoW/Qbjl93NX
 v0vhpHU4T7KXyA26HHUzdrqA8M
X-Google-Smtp-Source: AGHT+IFlFPI5zREPHuDeV35TrewF5xMFDi2pmIizcSEr1MF1Kyd27IzONQ06Tosq2K+bGbditdWvnMiF3nl6toSE7rk=
X-Received: by 2002:a05:6512:eaa:b0:540:1a40:ab0d with SMTP id
 2adb3069b0e04-5452fe65367mr4774141e87.28.1739871835497; Tue, 18 Feb 2025
 01:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
 <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
In-Reply-To: <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Feb 2025 17:43:43 +0800
X-Gm-Features: AWEUYZnscch0ATD4RPMuHj0VAYHapvvByEnogTVDzdPu_Io7G9wuKVum6WjojR4
Message-ID: <CAGXv+5GSF=YSiHTgty1J2suAvVYUtOgPShW2mmvuxYiFwK-yeg@mail.gmail.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Paul Kocialkowski <contact@paulk.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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

On Tue, Feb 11, 2025 at 2:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > Adding a panel does currently not add a panel_bridge wrapping it. Usual=
ly
> > the panel_bridge creation happens when some other driver (e.g. the prev=
ious
> > bridge or the encoder) calls *_of_get_bridge() and the following elemen=
t in
> > the pipeline is a panel.
> >
> > This has some drawbacks:
> >
> >  * the panel_bridge is not created in the context of the driver of the
> >    underlying physical device (the panel driver), but of some other dri=
ver
> >  * that "other driver" is not aware of whether the returned drm_bridge
> >    pointer is a panel_bridge created on the fly, a pre-existing
> >    panel_bridge or a non-panel bridge
> >  * removal of a panel_bridge requires calling drm_panel_bridge_remove()=
,
> >    but the "other driver" doesn't know whether this is needed because i=
t
> >    doesn't know whether it has created a panel_bridge or not
> >
> > So far this approach has been working because devm and drmm ensure the
> > panel bridge would be dealloacted at some later point. However with the
> > upcoming implementation of dynamic bridge lifetime this will get more
> > complicated.
> >
> > Correct removal of a panel_bridge might possibly be obtained by adding =
more
> > devm/drmm technology to have it freed correctly at all times. However t=
his
> > would add more complexity and not help making lifetime more understanda=
ble.
> >
> > Use a different approach instead: always create a panel_bridge with a
> > drm_panel, thus matching the lifetime of the drm_panel and the panel_br=
idge
> > wrapping it. This makes lifetime much more straightforward to understan=
d
> > and to further develop on.
> >
> > With the panel_bridge always created, the functions to get a bridge
> > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler beca=
use
> > the bridge they are looking for exists already (if it can exist at all)=
. In
> > turn, this is implemented based on a variant of
> > drm_of_find_panel_or_bridge() that only looks for panels:
> > of_drm_find_bridge_by_endpoint(). In the future
> > drm_of_find_panel_or_bridge() can be progressively removed because ther=
e
> > will never be a panel not exposing a bridge.
> >
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >
> > ---
> >
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++-=
--------
> >  include/drm/drm_panel.h        |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pa=
nel.c
> > index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb153a=
fd475746ced764712 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
> >   */
> >  void drm_panel_add(struct drm_panel *panel)
> >  {
> > +     panel->bridge =3D drm_panel_bridge_add(panel);
> > +     WARN_ON(!panel->bridge);
> > +
> >       mutex_lock(&panel_lock);
> >       list_add_tail(&panel->list, &panel_list);
> >       mutex_unlock(&panel_lock);
> > @@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
> >       mutex_lock(&panel_lock);
> >       list_del_init(&panel->list);
> >       mutex_unlock(&panel_lock);
> > +
> > +     drm_panel_bridge_remove(panel->bridge);
> > +     panel->bridge =3D NULL;
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove);
>
> Given that drm_panel_add and drm_panel_remove are typically called at
> probe/remove, it's pretty much equivalent to using devm. Both of these
> solutions aren't safe, and the drm_panel lifetime is still broken.

FWIW I believe this solves the panel vs panel_bridge lifetime
inconsistencies we previously reported [1]. Of course, as you rightly
point out, any pointers to the bridge become stale if the panel gets
removed.

> I'd rather work on a solution that actually fixes those lifetime issues.

I think that can happen once the bridges are ref-counted?

Instead of removing the bridge from the list, it can just clear the
panel pointer and have all the callbacks skip any operations involving
the panel.

The other option is to have the panel itself be ref-counted. I don't
think that's worth pursuing if the idea is to move everything over to
panel_bridge and things are somewhat ready.

ChenYu

[1] https://lore.kernel.org/dri-devel/20241009052402.411978-1-fshao@chromiu=
m.org/
