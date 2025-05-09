Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF11AB1266
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 13:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0AB10EA27;
	Fri,  9 May 2025 11:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oxbBQcLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8BE10EA27
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 11:42:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1DAE5C6330;
 Fri,  9 May 2025 11:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9682CC4CEE4;
 Fri,  9 May 2025 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746790917;
 bh=n/DhnS3dvqyfizgdmvKGb6oSEoIOIb37y2SAnxG84tA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oxbBQcLB7TQMY2KqPdu5qcI2huv7zoUOmkmbRA5X+im7G8Qdr8YCJJx7OAoYWEo+2
 2xrqL4+htrkvzaebZzLLY3HhRqsU8Yj7juwWUOQVKTcUhvkzP0NksYul28uJJC46wW
 uShRmGEwzrGCUJr7NRQJarbBQNg3azJb+k6NtYO0YWxEJOH4qUiEaMJU+NvHvsFmHu
 CaN1x9IoIpr2RpDVGWUE6mJLovDPHMIr48TKZ9RomXb8ajW3iCsZAQM0CZT4dcrEIk
 PgMbudXkru1eNjSA2ndcvEphyfpSyKoYXb0OTad9lf4kxE5ssZW+Ug9ba/lD2tp2IM
 TfwIwYRZOsGqQ==
Date: Fri, 9 May 2025 13:41:55 +0200
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
Message-ID: <20250509-rapid-flounder-of-devotion-6b26bb@houat>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="pxcula6ms75u4efb"
Content-Disposition: inline
In-Reply-To: <874ixvtbxy.fsf@intel.com>
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


--pxcula6ms75u4efb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Thu, May 08, 2025 at 05:27:21PM +0300, Jani Nikula wrote:
> On Mon, 05 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> > On Mon, May 5, 2025 at 2:54=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >
> >> Hi Jani,
> >>
> >> On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
> >> > On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> > > Hi Jani,
> >> > >
> >> > > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> >> > >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> >> > >> > Allocate panel via reference counting. Add _get() and _put() he=
lper
> >> > >> > functions to ensure panel allocations are refcounted. Avoid use
> >> after
> >> > >> > free by ensuring panel pointer is valid and can be usable till =
the
> >> last
> >> > >> > reference is put.
> >> > >> >
> >> > >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> > >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> > >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >> > >> >
> >> > >> > ---
> >> > >> > v4: Add refcounting documentation in this patch (Maxime)
> >> > >> >
> >> > >> > v3: Add include in this patch (Luca)
> >> > >> >
> >> > >> > v2: Export drm_panel_put/get() (Maxime)
> >> > >> > - Change commit log with better workding (Luca, Maxime)
> >> > >> > - Change drm_panel_put() to return void (Luca)
> >> > >> > - Code Cleanups - add return in documentation, replace bridge to
> >> > >> > panel (Luca)
> >> > >> > ---
> >> > >> >  drivers/gpu/drm/drm_panel.c | 64
> >> ++++++++++++++++++++++++++++++++++++++++++++-
> >> > >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> >> > >> >  2 files changed, 82 insertions(+), 1 deletion(-)
> >> > >> >
> >> > >> > diff --git a/drivers/gpu/drm/drm_panel.c
> >> b/drivers/gpu/drm/drm_panel.c
> >> > >> > index
> >> bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d=
2e4d8332f748
> >> 100644
> >> > >> > --- a/drivers/gpu/drm/drm_panel.c
> >> > >> > +++ b/drivers/gpu/drm/drm_panel.c
> >> > >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const
> >> struct device_node *np)
> >> > >> >  }
> >> > >> >  EXPORT_SYMBOL(of_drm_find_panel);
> >> > >> >
> >> > >> > +static void __drm_panel_free(struct kref *kref)
> >> > >> > +{
> >> > >> > +        struct drm_panel *panel =3D container_of(kref, struct
> >> drm_panel, refcount);
> >> > >> > +
> >> > >> > +        kfree(panel->container);
> >> > >> > +}
> >> > >> > +
> >> > >> > +/**
> >> > >> > + * drm_panel_get - Acquire a panel reference
> >> > >> > + * @panel: DRM panel
> >> > >> > + *
> >> > >> > + * This function increments the panel's refcount.
> >> > >> > + * Returns:
> >> > >> > + * Pointer to @panel
> >> > >> > + */
> >> > >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> >> > >> > +{
> >> > >> > +        if (!panel)
> >> > >> > +                return panel;
> >> > >> > +
> >> > >> > +        kref_get(&panel->refcount);
> >> > >> > +
> >> > >> > +        return panel;
> >> > >> > +}
> >> > >> > +EXPORT_SYMBOL(drm_panel_get);
> >> > >> > +
> >> > >> > +/**
> >> > >> > + * drm_panel_put - Release a panel reference
> >> > >> > + * @panel: DRM panel
> >> > >> > + *
> >> > >> > + * This function decrements the panel's reference count and fr=
ees
> >> the
> >> > >> > + * object if the reference count drops to zero.
> >> > >> > + */
> >> > >> > +void drm_panel_put(struct drm_panel *panel)
> >> > >> > +{
> >> > >> > +        if (panel)
> >> > >> > +                kref_put(&panel->refcount, __drm_panel_free);
> >> > >> > +}
> >> > >> > +EXPORT_SYMBOL(drm_panel_put);
> >> > >> > +
> >> > >> > +/**
> >> > >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a vo=
id
> >> pointer
> >> > >> > + *
> >> > >> > + * @data: pointer to @struct drm_panel, cast to a void pointer
> >> > >> > + *
> >> > >> > + * Wrapper of drm_panel_put() to be used when a function takin=
g a
> >> void
> >> > >> > + * pointer is needed, for example as a devm action.
> >> > >> > + */
> >> > >> > +static void drm_panel_put_void(void *data)
> >> > >> > +{
> >> > >> > +        struct drm_panel *panel =3D (struct drm_panel *)data;
> >> > >> > +
> >> > >> > +        drm_panel_put(panel);
> >> > >> > +}
> >> > >> > +
> >> > >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size,
> >> size_t offset,
> >> > >> >                               const struct drm_panel_funcs *fun=
cs,
> >> > >> >                               int connector_type)
> >> > >> >  {
> >> > >> >          void *container;
> >> > >> >          struct drm_panel *panel;
> >> > >> > +        int err;
> >> > >> >
> >> > >> >          if (!funcs) {
> >> > >> >                  dev_warn(dev, "Missing funcs pointer\n");
> >> > >> >                  return ERR_PTR(-EINVAL);
> >> > >> >          }
> >> > >> >
> >> > >> > -        container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> >> > >> > +        container =3D kzalloc(size, GFP_KERNEL);
> >> > >> >          if (!container)
> >> > >> >                  return ERR_PTR(-ENOMEM);
> >> > >> >
> >> > >> >          panel =3D container + offset;
> >> > >> > +        panel->container =3D container;
> >> > >> >          panel->funcs =3D funcs;
> >> > >> > +        kref_init(&panel->refcount);
> >> > >>
> >> > >> Hi Anusha, this should be done in drm_panel_init() instead.
> >> > >>
> >> > >> There are many users of drm_panel that don't use
> >> devm_drm_panel_alloc()
> >> > >> but allocate separately, and call drm_panel_init() only.
> >> > >
> >> > > That wouldn't really work, because then drivers would have allocat=
ed
> >> the
> >> > > panel with devm_kzalloc and thus the structure would be freed when=
 the
> >> > > device is removed, no matter the reference counting state.
> >> > >
> >> > >> They'll all have refcount set to 0 instead of 1 like kref_init() =
does.
> >> > >>
> >> > >> This means all subsequent get/put pairs on such panels will lead =
to
> >> > >> __drm_panel_free() being called! But through a lucky coincidence,=
 that
> >> > >> will be a nop because panel->container is also not initialized...
> >> > >>
> >> > >> I'm sorry to say, the drm refcounting interface is quite broken f=
or
> >> such
> >> > >> use cases.
> >> > >
> >> > > The plan is to convert all panel drivers to that function, and Anu=
sha
> >> > > already sent series to do. It still needs a bit of work, but it sh=
ould
> >> > > land soon-ish.
> >> > >
> >> > > For the transitional period though, it's not clear to me what you =
think
> >> > > is broken at the moment, and / or what should be fixed.
> >> > >
> >> > > Would you prefer an explicit check on container not being 0, with a
> >> > > comment?
> >> >
> >> > I'm looking at what it would take to add drm_panel support to i915 so
> >> > that you could have drm_panel_followers on it. There are gaps of cou=
rse,
> >> > but initially it would mean allocating and freeing drm_panel ourselv=
es,
> >> > not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of t=
he
> >> > other stuff is allocated that way. drm_panel would just sit as a
> >> > sub-struct inside struct intel_panel, which is a sub-struct of struct
> >> > intel_connector, which has its own allocation...
> >>
> >> I'm not entirely sure why you would need to allocate it from i915? The
> >> drm_panel structure is only meant to be allocated by panel drivers, and
> >> afaik no panel interface controller is allocating it.
>=20
> I'm looking into a use case involving drm_panel_follower, which requires
> a drm_panel. I don't really need any of the other stuff in drm_panel.
>=20
> And basically you'd have one drm_panel per connector that is connected
> to a panel, within the same driver.

That answers why you need a drm_panel pointer, but not really why the
i915 needs to allocate it itself. The whole point of panel drivers it to
decouple panel drivers from the connector driver (and everything
upstream).

drm_panel is always allocated by the panel driver itself. I don't really
see a good reason to change that.

If you don't have a panel descriptor in the ACPI tables, then you can
always allocate a panel-edp driver or whatever from i915 and getting its
drm_panel?

Maxime

--pxcula6ms75u4efb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaB3qAwAKCRAnX84Zoj2+
dpjzAX0c2Euyfm4Ac/NoUi8k9RcC1HY0nQcpYh8G40SW9a2In5aEC72X49ity0mM
Dvxb4u0BgO+6vme4i5AsbT6UZs3+oRtoRoQ+c4yxVeFrs++ver7+S44aqVouNmwp
Uo4DkmS+mA==
=aRaa
-----END PGP SIGNATURE-----

--pxcula6ms75u4efb--
