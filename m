Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1686AB558D
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C529A10E5A0;
	Tue, 13 May 2025 13:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fni1ch+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC32210E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:06:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 91FFEA4D831;
 Tue, 13 May 2025 13:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC894C4CEE4;
 Tue, 13 May 2025 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747141604;
 bh=VB3oYTJaiQFMCG9P0myn/Fu/ZJZu5pS3CuMoJ3ObLh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fni1ch+/HX5TbTW09KmiG/6DYnx4fKwCsUdL5L56L/qG4kdLDOP9/8J0dzKMZ9U75
 LuxxMl6XsCjxRxdwFdgbkRTEqZ4773JzTWEbDFk4SfwSvKvLKvsi3WeNQKYXl4CcGk
 rpRM96M/Dp+A/XDWjB7K5Dhrm+g2DBxuYDLcZrHKqKrW2q6zqCwUrmXM8GqF3EHP1I
 KH/AJP0PFr3iKU6tYizqqa9x259RfSApz6d3WxVOLnO2bJtyDhvWjt2Mq+uyL8VrhS
 DL0SrwAvmkYrC9IaqxtKiPlAHualZJQYswSv9NaGRMApYfv2qEDg670LWhoVjdeNsa
 Ptw7cJ4p9sDbw==
Date: Tue, 13 May 2025 15:06:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="svlohnjjypbescdq"
Content-Disposition: inline
In-Reply-To: <87r00yj6kv.fsf@intel.com>
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


--svlohnjjypbescdq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Fri, May 09, 2025 at 03:45:36PM +0300, Jani Nikula wrote:
> On Fri, 09 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, May 08, 2025 at 05:27:21PM +0300, Jani Nikula wrote:
> >> On Mon, 05 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> >> > On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
> >> >
> >> >> Hi Jani,
> >> >>
> >> >> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
> >> >> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> >> > > Hi Jani,
> >> >> > >
> >> >> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> >> >> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wro=
te:
> >> >> > >> > Allocate panel via reference counting. Add _get() and _put()=
 helper
> >> >> > >> > functions to ensure panel allocations are refcounted. Avoid =
use
> >> >> after
> >> >> > >> > free by ensuring panel pointer is valid and can be usable ti=
ll the
> >> >> last
> >> >> > >> > reference is put.
> >> >> > >> >
> >> >> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> >> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> >> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >> >> > >> >
> >> >> > >> > ---
> >> >> > >> > v4: Add refcounting documentation in this patch (Maxime)
> >> >> > >> >
> >> >> > >> > v3: Add include in this patch (Luca)
> >> >> > >> >
> >> >> > >> > v2: Export drm_panel_put/get() (Maxime)
> >> >> > >> > - Change commit log with better workding (Luca, Maxime)
> >> >> > >> > - Change drm_panel_put() to return void (Luca)
> >> >> > >> > - Code Cleanups - add return in documentation, replace bridg=
e to
> >> >> > >> > panel (Luca)
> >> >> > >> > ---
> >> >> > >> >  drivers/gpu/drm/drm_panel.c | 64
> >> >> ++++++++++++++++++++++++++++++++++++++++++++-
> >> >> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> >> >> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
> >> >> > >> >
> >> >> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
> >> >> b/drivers/gpu/drm/drm_panel.c
> >> >> > >> > index
> >> >> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc30317099195=
64d2e4d8332f748
> >> >> 100644
> >> >> > >> > --- a/drivers/gpu/drm/drm_panel.c
> >> >> > >> > +++ b/drivers/gpu/drm/drm_panel.c
> >> >> > >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(co=
nst
> >> >> struct device_node *np)
> >> >> > >> >  }
> >> >> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
> >> >> > >> >
> >> >> > >> > +static void __drm_panel_free(struct kref *kref)
> >> >> > >> > +{
> >> >> > >> > +        struct drm_panel *panel =3D container_of(kref, stru=
ct
> >> >> drm_panel, refcount);
> >> >> > >> > +
> >> >> > >> > +        kfree(panel->container);
> >> >> > >> > +}
> >> >> > >> > +
> >> >> > >> > +/**
> >> >> > >> > + * drm_panel_get - Acquire a panel reference
> >> >> > >> > + * @panel: DRM panel
> >> >> > >> > + *
> >> >> > >> > + * This function increments the panel's refcount.
> >> >> > >> > + * Returns:
> >> >> > >> > + * Pointer to @panel
> >> >> > >> > + */
> >> >> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> >> >> > >> > +{
> >> >> > >> > +        if (!panel)
> >> >> > >> > +                return panel;
> >> >> > >> > +
> >> >> > >> > +        kref_get(&panel->refcount);
> >> >> > >> > +
> >> >> > >> > +        return panel;
> >> >> > >> > +}
> >> >> > >> > +EXPORT_SYMBOL(drm_panel_get);
> >> >> > >> > +
> >> >> > >> > +/**
> >> >> > >> > + * drm_panel_put - Release a panel reference
> >> >> > >> > + * @panel: DRM panel
> >> >> > >> > + *
> >> >> > >> > + * This function decrements the panel's reference count and=
 frees
> >> >> the
> >> >> > >> > + * object if the reference count drops to zero.
> >> >> > >> > + */
> >> >> > >> > +void drm_panel_put(struct drm_panel *panel)
> >> >> > >> > +{
> >> >> > >> > +        if (panel)
> >> >> > >> > +                kref_put(&panel->refcount, __drm_panel_free=
);
> >> >> > >> > +}
> >> >> > >> > +EXPORT_SYMBOL(drm_panel_put);
> >> >> > >> > +
> >> >> > >> > +/**
> >> >> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a=
 void
> >> >> pointer
> >> >> > >> > + *
> >> >> > >> > + * @data: pointer to @struct drm_panel, cast to a void poin=
ter
> >> >> > >> > + *
> >> >> > >> > + * Wrapper of drm_panel_put() to be used when a function ta=
king a
> >> >> void
> >> >> > >> > + * pointer is needed, for example as a devm action.
> >> >> > >> > + */
> >> >> > >> > +static void drm_panel_put_void(void *data)
> >> >> > >> > +{
> >> >> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)dat=
a;
> >> >> > >> > +
> >> >> > >> > +        drm_panel_put(panel);
> >> >> > >> > +}
> >> >> > >> > +
> >> >> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t siz=
e,
> >> >> size_t offset,
> >> >> > >> >                               const struct drm_panel_funcs *=
funcs,
> >> >> > >> >                               int connector_type)
> >> >> > >> >  {
> >> >> > >> >          void *container;
> >> >> > >> >          struct drm_panel *panel;
> >> >> > >> > +        int err;
> >> >> > >> >
> >> >> > >> >          if (!funcs) {
> >> >> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
> >> >> > >> >                  return ERR_PTR(-EINVAL);
> >> >> > >> >          }
> >> >> > >> >
> >> >> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> >> >> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
> >> >> > >> >          if (!container)
> >> >> > >> >                  return ERR_PTR(-ENOMEM);
> >> >> > >> >
> >> >> > >> >          panel =3D container + offset;
> >> >> > >> > +        panel->container =3D container;
> >> >> > >> >          panel->funcs =3D funcs;
> >> >> > >> > +        kref_init(&panel->refcount);
> >> >> > >>
> >> >> > >> Hi Anusha, this should be done in drm_panel_init() instead.
> >> >> > >>
> >> >> > >> There are many users of drm_panel that don't use
> >> >> devm_drm_panel_alloc()
> >> >> > >> but allocate separately, and call drm_panel_init() only.
> >> >> > >
> >> >> > > That wouldn't really work, because then drivers would have allo=
cated
> >> >> the
> >> >> > > panel with devm_kzalloc and thus the structure would be freed w=
hen the
> >> >> > > device is removed, no matter the reference counting state.
> >> >> > >
> >> >> > >> They'll all have refcount set to 0 instead of 1 like kref_init=
() does.
> >> >> > >>
> >> >> > >> This means all subsequent get/put pairs on such panels will le=
ad to
> >> >> > >> __drm_panel_free() being called! But through a lucky coinciden=
ce, that
> >> >> > >> will be a nop because panel->container is also not initialized=
=2E..
> >> >> > >>
> >> >> > >> I'm sorry to say, the drm refcounting interface is quite broke=
n for
> >> >> such
> >> >> > >> use cases.
> >> >> > >
> >> >> > > The plan is to convert all panel drivers to that function, and =
Anusha
> >> >> > > already sent series to do. It still needs a bit of work, but it=
 should
> >> >> > > land soon-ish.
> >> >> > >
> >> >> > > For the transitional period though, it's not clear to me what y=
ou think
> >> >> > > is broken at the moment, and / or what should be fixed.
> >> >> > >
> >> >> > > Would you prefer an explicit check on container not being 0, wi=
th a
> >> >> > > comment?
> >> >> >
> >> >> > I'm looking at what it would take to add drm_panel support to i91=
5 so
> >> >> > that you could have drm_panel_followers on it. There are gaps of =
course,
> >> >> > but initially it would mean allocating and freeing drm_panel ours=
elves,
> >> >> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none o=
f the
> >> >> > other stuff is allocated that way. drm_panel would just sit as a
> >> >> > sub-struct inside struct intel_panel, which is a sub-struct of st=
ruct
> >> >> > intel_connector, which has its own allocation...
> >> >>
> >> >> I'm not entirely sure why you would need to allocate it from i915? =
The
> >> >> drm_panel structure is only meant to be allocated by panel drivers,=
 and
> >> >> afaik no panel interface controller is allocating it.
> >>=20
> >> I'm looking into a use case involving drm_panel_follower, which requir=
es
> >> a drm_panel. I don't really need any of the other stuff in drm_panel.
> >>=20
> >> And basically you'd have one drm_panel per connector that is connected
> >> to a panel, within the same driver.
> >
> > That answers why you need a drm_panel pointer, but not really why the
> > i915 needs to allocate it itself. The whole point of panel drivers it to
> > decouple panel drivers from the connector driver (and everything
> > upstream).
> >
> > drm_panel is always allocated by the panel driver itself. I don't really
> > see a good reason to change that.
> >
> > If you don't have a panel descriptor in the ACPI tables, then you can
> > always allocate a panel-edp driver or whatever from i915 and getting its
> > drm_panel?
>=20
> The thing is, absolutely none of our hardware/firmware/software stack
> was designed in a way that would fit the drm_panel model. (Or, arguably,
> drm_panel wasn't designed in a way that would fit our stack, in the
> chronology of things.)
>
> It's all one PCI device.

You access the panel itself through PCI? Not i2c, not CSI, not eDP, but
PCI?

> All in the same MMIO space. The VBT (Video BIOS Tables) contain all
> the information for the panels, as well as for absolutely everything
> else about our display hardware. It's not separate in any meaningful
> way.

It's a pretty common setup on ARM, there's nothing special about it
except (maybe) its scale. It's exactly what the MFD framework was
designed for, and several other similar mechanisms.

> Having a separate panel driver would get in the way. Having panel-edp
> would get in the way. That's why there isn't a single x86 user for
> drm_panel, AFAICT.

At the end of the day, it's also about interacting with the larger
framework. You're effectively asking a common part of the framework that
works with dozens of drivers to compromise its design for one.

Is it really surprising you get some pushback when you are using a
design that is the complete opposite to what every user of it for the
last decade has been doing?

> Yes, we only really need the drm_panel handle, to play ball with the
> things that were built around it, specifically drm_panel_follower.
>=20
> And we do need to allocate drm_panel ourselves. We're both the host and
> the panel driver at the same time, and there's no benefit in trying to
> articially change that. DRM infrastructure should provide frameworks
> that are usable for everyone,

This one is usable, but you rule out the way you could use it. I guess
it's clear now that you won't consider anything else. I wonder why you
started that discussion in the first place if you already have a clear
mind on how to get things moving forward.

Maxime

--svlohnjjypbescdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCND2wAKCRAnX84Zoj2+
dtpGAYD/EAIw9921IF6nt3+xCfrV/kds87GliRh+eFuGm/S9bSQhyittQLs9hn8E
D1c545cBgKsraYZa2NpBzOCK+js9OhRU0P+HKBwBhVgqueLaiGJl7Xr7UrRzyVT+
LbZ5dTERLw==
=btNl
-----END PGP SIGNATURE-----

--svlohnjjypbescdq--
