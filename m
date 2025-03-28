Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20DA745F4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 10:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957B10E9A6;
	Fri, 28 Mar 2025 09:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VxkWA2zF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC2510E9A6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 09:05:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B02B843CEC;
 Fri, 28 Mar 2025 09:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E12C4CEE4;
 Fri, 28 Mar 2025 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743152743;
 bh=cLQBA67Ba0qiIZ5CrnS7UX0rwNAyNLraLvUpiKHqEIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VxkWA2zF3ZXXS/+6CT43xESeRUUFT8bO68NrlXVjIVa2wpiAOn+F5kwVq8FtE9Xfl
 Iae0pRL4HS/HYbFbLF6M4old/gy9mgc4x/LKWEUYqJ0kzvYieIoCS9PVzFldB47xpN
 0nYyIbJk3btZKVmjD5Tl1aq4DfKneGiK6PONutzBietqq4VwoXTrd4WeS6oH0A5jCz
 rWZxiifPaVMcImpfd4tHlS1PzVuF5Oje5sciKbxIBdT+MfXZTTJ4kgPZaCR2+WIOQ3
 FEiazV0PVjGHnFEDEWf9JYIET36LSKt1O+hx40QYnGYr2snjRHYQMLRaUWuwBopr/f
 tQflHDtcyHaGQ==
Date: Fri, 28 Mar 2025 10:05:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250328-ochre-rattlesnake-of-glamour-e3afea@houat>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
 <20250327-noisy-versed-mosquito-df380a@houat>
 <CAN9Xe3QCL=KwhS0KLfaOaDc_TthQg6Gt-pLf1oEEg=1EBLZE2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="npakimqlc44lqz6i"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3QCL=KwhS0KLfaOaDc_TthQg6Gt-pLf1oEEg=1EBLZE2w@mail.gmail.com>
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


--npakimqlc44lqz6i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Thu, Mar 27, 2025 at 11:33:15AM -0400, Anusha Srivatsa wrote:
> On Thu, Mar 27, 2025 at 11:58=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
>=20
> > On Thu, Mar 27, 2025 at 10:55:39AM -0400, Anusha Srivatsa wrote:
> > > Introduce reference counted allocations for panels to avoid
> > > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > > to allocate a new refcounted panel. Followed the documentation for
> > > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > > implementations for this purpose.
> > >
> > > v2: Better documentation for connector_type field - follow drm_panel_=
init
> > > documentation. (Luca)
> > > - Clarify the refcount initialisation in comments.(Maxime)
> > > - Correct the documentation of the return type (Maxime)
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
> > >  include/drm/drm_panel.h     | 23 +++++++++++++++++++++++
> > >  2 files changed, 48 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > index
> > c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc775822=
50960556308
> > 100644
> > > --- a/drivers/gpu/drm/drm_panel.c
> > > +++ b/drivers/gpu/drm/drm_panel.c
> > > @@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct
> > device_node *np)
> > >  }
> > >  EXPORT_SYMBOL(of_drm_find_panel);
> > >
> > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> > offset,
> > > +                          const struct drm_panel_funcs *funcs,
> > > +                          int connector_type)
> > > +{
> > > +     void *container;
> > > +     struct drm_panel *panel;
> > > +
> > > +     if (!funcs) {
> > > +             dev_warn(dev, "Missing funcs pointer\n");
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> > > +     if (!container)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     panel =3D container + offset;
> > > +     panel->funcs =3D funcs;
> > > +
> > > +     drm_panel_init(panel, dev, funcs, connector_type);
> > > +
> > > +     return container;
> > > +}
> > > +EXPORT_SYMBOL(__devm_drm_panel_alloc);
> > > +
> > >  /**
> > >   * of_drm_get_panel_orientation - look up the orientation of the pan=
el
> > through
> > >   * the "rotation" binding from a device tree node
> > > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > > index
> > a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41ffa6=
a88f3c3c58b
> > 100644
> > > --- a/include/drm/drm_panel.h
> > > +++ b/include/drm/drm_panel.h
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/errno.h>
> > >  #include <linux/list.h>
> > >  #include <linux/mutex.h>
> > > +#include <linux/kref.h>
> > >
> > >  struct backlight_device;
> > >  struct dentry;
> > > @@ -268,6 +269,28 @@ struct drm_panel {
> > >       bool enabled;
> > >  };
> > >
> > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> > offset,
> > > +                          const struct drm_panel_funcs *funcs,
> > > +                          int connector_type);
> > > +
> > > +/**
> > > + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
> > > + * @dev: struct device of the panel device
> > > + * @type: the type of the struct which contains struct &drm_panel
> > > + * @member: the name of the &drm_panel within @type
> > > + * @funcs: callbacks for this panel
> > > + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*)
> > corresponding to
> > > + * the panel interface
> > > + * Returns:
> > > + * Pointer to container structure embedding the panel, ERR_PTR on
> > failure.
> > > + * The reference count is initialised to 1 and is automatically  giv=
en
> > back
> > > + * by devm action.
> >
> > Sorry, I noticed after the facts, but this can't be in the Returns
> > section, it needs to be in the main one.
>
> Maxime, Not really following you. Are you suggesting this explanation
> needs to be in the helper documentation instead of in returns?

This is a general documentation thing, so it needs to be in the main
documentation section, thus between the argumnts and returned values
one.

Maxime

--npakimqlc44lqz6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+ZmYwAKCRDj7w1vZxhR
xe9AAQDJ1NtGWXZcg6iEX2wbn7qH42wMVJ4zXo3LlCHZ7pBOYwD/Y1KDZdkdr188
cPcBYpcQhZVETrVe31/WfeAyYJSlfwY=
=+hE0
-----END PGP SIGNATURE-----

--npakimqlc44lqz6i--
