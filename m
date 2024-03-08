Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1FB8763AB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C2E113887;
	Fri,  8 Mar 2024 11:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GJqVQke+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16180113887;
 Fri,  8 Mar 2024 11:53:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C63A76170E;
 Fri,  8 Mar 2024 11:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205E5C433C7;
 Fri,  8 Mar 2024 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709898785;
 bh=yDiNkR4X7KXVgRLLoYDJcFC4O4wBiD4Sk3/nfzt0XxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GJqVQke+alNoo0bXad/ip5uQsb6VFH3Yzx9bsMs5kBqebaW9MmeCOlFyFK816ouR9
 MjqUV1GCMdwZP00I0ckxn0RejyrszLJAJDSTT7b8MGjjOBKCPnSkp+crtWvSVndCPw
 s1ZOdTODDO/1ezyiFyNeIX6mpGno9P0qZlpAobKRwGTHNxcSpltJj56UTTghAmPfMe
 HXS2SIpWZLl7WVEPkbBuzaHhQqSde/te+O8QZ7CZR27RvPn41QfRuIHdCH/pifiMea
 0GH0WFhf4yFShux9kUDPGAOKF6eQqPLNI3KgVYDMZnOd4+5s+r9J8sPFRLBaGW5FVJ
 ko9ubqWkU9dBQ==
Date: Fri, 8 Mar 2024 12:53:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 3/6] drm/connector: hdmi: split setup code of the
 HDMI connector
Message-ID: <20240308-economic-sambar-of-prosperity-6aed71@houat>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
 <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>
 <20240308-provocative-pumpkin-hoatzin-f9f31e@houat>
 <CAA8EJpp2XwZfG4SuNFqVMmr5hvWZoOq+zCutpgzdNpZM3EwjBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="npogbf4v5q3oxv3y"
Content-Disposition: inline
In-Reply-To: <CAA8EJpp2XwZfG4SuNFqVMmr5hvWZoOq+zCutpgzdNpZM3EwjBA@mail.gmail.com>
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


--npogbf4v5q3oxv3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024 at 12:52:04PM +0200, Dmitry Baryshkov wrote:
> On Fri, 8 Mar 2024 at 11:44, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi Dmitry,
> >
> > Thanks a lot for working on that, it's greatly appreciated :)
> >
> > On Fri, Mar 08, 2024 at 01:57:02AM +0200, Dmitry Baryshkov wrote:
> > > In order to use HDMI connector extensions from the bridge drivers, ca=
rve
> > > out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). T=
his
> > > way the drm_bridge drivers can call new function from their
> > > setup_connector callbacks.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-=
----------
> > >  include/drm/drm_connector.h     |  5 +++
> > >  2 files changed, 54 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 427816239038..ba953eb45557 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
> > >  EXPORT_SYMBOL(drmm_connector_init);
> > >
> > >  /**
> > > - * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> > > - * @dev: DRM device
> > > + * drm_connector_hdmi_setup - Init a preallocated HDMI connector
> > >   * @connector: A pointer to the HDMI connector to init
> > >   * @vendor: HDMI Controller Vendor name
> > >   * @product: HDMI Controller Product name
> > > - * @funcs: callbacks for this connector
> > >   * @hdmi_funcs: HDMI-related callbacks for this connector
> > > - * @connector_type: user visible type of the connector
> > > - * @ddc: optional pointer to the associated ddc adapter
> > >   * @supported_formats: Bitmask of @hdmi_colorspace listing supported=
 output formats
> > >   * @max_bpc: Maximum bits per char the HDMI connector supports
> > >   *
> > > @@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
> > >   * Returns:
> > >   * Zero on success, error code on failure.
> > >   */
> > > -int drmm_connector_hdmi_init(struct drm_device *dev,
> > > -                          struct drm_connector *connector,
> > > +int drm_connector_hdmi_setup(struct drm_connector *connector,
> > >                            const char *vendor, const char *product,
> > > -                          const struct drm_connector_funcs *funcs,
> > >                            const struct drm_connector_hdmi_funcs *hdm=
i_funcs,
> > > -                          int connector_type,
> > > -                          struct i2c_adapter *ddc,
> > >                            unsigned long supported_formats,
> > >                            unsigned int max_bpc)
> > >  {
> > > -     int ret;
> > > -
> > >       if (!vendor || !product)
> > >               return -EINVAL;
> > >
> > > @@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *d=
ev,
> > >           (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
> > >               return -EINVAL;
> > >
> > > -     if (!(connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> > > -           connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB))
> > > +     if (connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIA &&
> > > +         connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIB)
> > >               return -EINVAL;
> > >
> > >       if (!supported_formats || !(supported_formats & BIT(HDMI_COLORS=
PACE_RGB)))
> > > @@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *=
dev,
> > >       if (!(max_bpc =3D=3D 8 || max_bpc =3D=3D 10 || max_bpc =3D=3D 1=
2))
> > >               return -EINVAL;
> > >
> > > -     ret =3D drmm_connector_init(dev, connector, funcs, connector_ty=
pe, ddc);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > >       connector->hdmi.supported_formats =3D supported_formats;
> > >       strtomem_pad(connector->hdmi.vendor, vendor, 0);
> > >       strtomem_pad(connector->hdmi.product, product, 0);
> > > @@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *=
dev,
> > >
> > >       return 0;
> > >  }
> > > +EXPORT_SYMBOL(drm_connector_hdmi_setup);
> >
> > I guess it's more of a general comment on the whole design of things,
> > but this is the starting point I think.
> >
> > None of the other DRM entities have the split between init and setup,
> > connectors included. So this creates a bit of oddity in the API which I
> > think we should avoid at all cost. API consistency is the most
> > important.
> >
> > If I got the rest of your series properly, this all stems from the fact
> > that since connectors are disconnected from bridges nowadays, there's no
> > way to implement drm_connector_hdmi_funcs on an HDMI bridge, and
> > especially to get those hooks called with some sort of pointer to the
> > bridge private instance.
> >
> > And so I assume this is why you split init in two here, and added a data
> > field to the HDMI part of drm_connector, so that you can init the
> > connector in drm_bridge_connector, and then call setup with your
> > drm_connector_hdmi_funcs and the private data pointer in setup so it all
> > works out. Right?
>=20
> Yes.
>=20
> >
> > If so, I believe this doesn't only create an inconsistency at the KMS
> > core API level, but also in the bridge API. To me, bridges are meant to
> > fill the encoder gap, so we shouldn't special-case the core API to
> > accomodate the bridge design. And the bridge framework has been designed
> > that way too.
>=20
> My feeling about the drm_connector_hdmi was closer to helpers, rather
> than just init. In case of helpers we set them after initializing the
> object rather than setting them at the init time.
>=20
> >
> > If you look at the way EDID or HPD handling, we fundamentally have the
> > same problem: the connector is supposed to implement it, but it really
> > is handled by the bridge driver that wants to operate with its private
> > instance data.
>=20
> Yes.
>=20
> >
> > So I think we should go for a similar approach:
> >
> >   - We keep the drm_hdmi_connector_init function only
> >
> >   - If the drm_bridge_connector has an HDMI type, we can
> >     drm_hdmi_connector_init and call
> >     drm_atomic_helper_connector_hdmi_check() at atomic_check time.
>=20
> This is slightly problematic. First of all, it breaks layering. What
> if the HDMI stream gets wrapped? E.g. into the MyDP (think of
> anx7808)? Then the drm_bridge_connector will have connector_type field
> equal to DRM_CONNECTOR_DisplayPort (MyDP). I have not looked into the
> dual-mode DP connectors or USB-C MHL mode, but they might also cause
> some wraparounds. Or changes to the connector_type.

I guess there's several aspects here:

- For me, it's something for the bridge framework to solve. The format
  negociation is already there, we would probably need more logic to
  deal with the rest of the setup, but it doesn't look like it's
  impossible.

- AFAIK, we don't solve that at the moment either in the anx7808 driver,
  so it doesn't seem to be an important use case.

- Another solution to this would be to make the automatic logic
  opt-in/opt-out (through a bridge OP flag?) so drivers like this can
  always handle it themselves if they want to. And we could make the
  logic available through helpers if they still want to benefit from it
  without using the connector state.

But yeah, I think we should try to remain at feature parity here until
we have more advanced use-cases, and it looks to me that the solution
above would fit that bill.

> So, I think it is incorrect to call
> drm_atomic_helper_connector_hdmi_check() from the drm_bridge_connector
> itself.
>=20
> Likewise, to setup HDMI connector parts from drm_bridge_connector we
> will have to pass vendor/product/max_bpc/formats between layers.
> Setting up HDMI connector from the bridge itself saves us from such
> issues.

We could also add two char string to drm_bridge and that would just
work, without making the main API inconsistent.

> The only possible case I have in my mind is that setting up HDMI
> connector from the end of the chain would allow us to override some of
> the properties. E.g. I can think of hdmi-connector overriding vendor /
> product strings.
>=20
> >
> >   - We create a drm_bridge_* set of functions and associated hooks to
> >     handle HDMI TMDS char rate filtering and infoframes setup that gets
> >     called by drm_bridge_connector, and pass the bridge, connector and
> >     all the extra arguments we need.
> >
> > Once we've done that, we're probably in a good position to support what
> > we want to support. The drm_connector_state is passed to the atomic set
> > of bridges hooks so they can just read the content from there and we
> > should be good?
>=20
> This might save us from the drm_connector.hdmi.data hassle.

Ultimately, it looks like it's about design goals and trade-offs. The
initial point of my series was about making sure the easiest path
forward for drivers was the correct one: you get all the stuff you need
=66rom the connector state. And only by supplementing the framework.

The drm_bridge framework (and especially drm_bridge_connector) chose to
take the connector out of the bridge control. That's fine, it solves
some real use cases, but also has a bunch of drawbacks, one of them
being the one we're seeing right now.

Still, I think we should follow the same general principles: remain
consistent with the KMS and drm_bridge framework and to make it as easy
as possible for drivers without breaking the existing ones.

So yeah, I don't think we need to support all the possible use-cases
right now. We can start small and support only the trivial use-cases
with only an HDMI bridge being last for example at first for example,
and then we'll grow from there.

> Last, but not least. Your proposal means that we have to use
> drm_bridge_connector. Some platforms still use bridge-created
> connector. What is the status of the migration? Should we start
> pushing drivers towards drm_bridge_connector in a more aggressive way?

That's fine, if the bridge creates the connector itself, it's in control
of the connector structure, its state, and can retrieve its private
data. So we would support both. So I don't think there's a need to push
for anything.

Maxime

--npogbf4v5q3oxv3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZer8HgAKCRDj7w1vZxhR
xczlAP4oYTHfh+3jnvjSf+XXVm0H7tkfWv6F5NECE52N3ttWdgD/X/VsMBg+0LZV
2atmJ6K9loVj0QWVStAfEvA0FXsZwgk=
=2cJD
-----END PGP SIGNATURE-----

--npogbf4v5q3oxv3y--
