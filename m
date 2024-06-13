Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CC9065DA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 09:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8C810E22F;
	Thu, 13 Jun 2024 07:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PLwyDk9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8986110E22F;
 Thu, 13 Jun 2024 07:57:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 167B6618BC;
 Thu, 13 Jun 2024 07:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C97C4AF5F;
 Thu, 13 Jun 2024 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718265438;
 bh=RmD8W+qERbJFVXWFv0k1jn2sHsDduLfg3wqCJILnzAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLwyDk9JvJ8UnzYIqw7zpM7zoe5LKeSGSq6cOz4IIKlaA2rW+C6EeeNNO5UHis+kL
 8WGiNXPlGsdau9tTDTRAvEtfs8r/6jo5Sq/Uk2JIqbcQx6Fh4Ztsp7tEb1t3MnUsTy
 RaRpbPjIN1vq9JfOl3hBUegoHrjIRW886WtbNfp95ZcsBDhLmQ+DL3lMgZP4JHT42h
 tBjiDwWIF3Bb7txy302O9p4hj6J8GtAtd4xmWuY/S6pL23kiNaamDWYVD/54K81LYt
 JfaGnJM17s2CEBxopZBGFCAeUA3kC2hHEFBEGE3DlsEaKfKAna2GGpf2qQUMZoyDrf
 EshQ7w97yPB3A==
Date: Thu, 13 Jun 2024 09:57:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
Message-ID: <20240613-hospitable-logical-jaguar-fc5b7d@houat>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
 <20240610-secret-rottweiler-from-asgard-132f75@houat>
 <CAA8EJpogi2qm0bhCwumY4zj-xMUkF4zbK-NAPqCeDbLcybFciw@mail.gmail.com>
 <20240610-smooth-liberal-guan-59853e@houat>
 <t5pav3up5r6ezs4q37lc7jqlv55ftta7fnntp75b4pjboycwsm@uvs7q6frrzf5>
 <20240611-zippy-pragmatic-catfish-cceee5@houat>
 <CAA8EJppcqLm7UbW9n2Y_4mfJv4JFWDkPXJ8=TBL53LiFPADzpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="odli6rndmcobp3e7"
Content-Disposition: inline
In-Reply-To: <CAA8EJppcqLm7UbW9n2Y_4mfJv4JFWDkPXJ8=TBL53LiFPADzpQ@mail.gmail.com>
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


--odli6rndmcobp3e7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 02:26:12PM GMT, Dmitry Baryshkov wrote:
> On Tue, 11 Jun 2024 at 11:54, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Jun 10, 2024 at 08:54:09PM GMT, Dmitry Baryshkov wrote:
> > > On Mon, Jun 10, 2024 at 02:07:06PM +0200, Maxime Ripard wrote:
> > > > Hi,
> > > >
> > > > +Hans
> > > >
> > > > On Mon, Jun 10, 2024 at 02:46:03PM GMT, Dmitry Baryshkov wrote:
> > > > > On Mon, 10 Jun 2024 at 11:04, Maxime Ripard <mripard@kernel.org> =
wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Fri, Jun 07, 2024 at 04:22:59PM GMT, Dmitry Baryshkov wrote:
> > > > > > > Turn drm_bridge_connector to using drmm_kzalloc() and
> > > > > > > drmm_connector_init() and drop the custom destroy function. T=
he
> > > > > > > drm_connector_unregister() and fwnode_handle_put() are alread=
y handled
> > > > > > > by the drm_connector_cleanup() and so are safe to be dropped.
> > > > > > >
> > > > > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_bridge_connector.c | 23 +++++-----------=
-------
> > > > > > >  1 file changed, 5 insertions(+), 18 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers=
/gpu/drm/drm_bridge_connector.c
> > > > > > > index 982552c9f92c..e093fc8928dc 100644
> > > > > > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > > > > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > > > > > @@ -15,6 +15,7 @@
> > > > > > >  #include <drm/drm_connector.h>
> > > > > > >  #include <drm/drm_device.h>
> > > > > > >  #include <drm/drm_edid.h>
> > > > > > > +#include <drm/drm_managed.h>
> > > > > > >  #include <drm/drm_modeset_helper_vtables.h>
> > > > > > >  #include <drm/drm_probe_helper.h>
> > > > > > >
> > > > > > > @@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_c=
onnector *connector, bool force)
> > > > > > >       return status;
> > > > > > >  }
> > > > > > >
> > > > > > > -static void drm_bridge_connector_destroy(struct drm_connecto=
r *connector)
> > > > > > > -{
> > > > > > > -     struct drm_bridge_connector *bridge_connector =3D
> > > > > > > -             to_drm_bridge_connector(connector);
> > > > > > > -
> > > > > > > -     drm_connector_unregister(connector);
> > > > > > > -     drm_connector_cleanup(connector);
> > > > > > > -
> > > > > > > -     fwnode_handle_put(connector->fwnode);
> > > > > > > -
> > > > > > > -     kfree(bridge_connector);
> > > > > > > -}
> > > > > > > -
> > > > > > >  static void drm_bridge_connector_debugfs_init(struct drm_con=
nector *connector,
> > > > > > >                                             struct dentry *ro=
ot)
> > > > > > >  {
> > > > > > > @@ -224,7 +212,6 @@ static const struct drm_connector_funcs d=
rm_bridge_connector_funcs =3D {
> > > > > > >       .reset =3D drm_atomic_helper_connector_reset,
> > > > > > >       .detect =3D drm_bridge_connector_detect,
> > > > > > >       .fill_modes =3D drm_helper_probe_single_connector_modes,
> > > > > > > -     .destroy =3D drm_bridge_connector_destroy,
> > > > > > >       .atomic_duplicate_state =3D drm_atomic_helper_connector=
_duplicate_state,
> > > > > > >       .atomic_destroy_state =3D drm_atomic_helper_connector_d=
estroy_state,
> > > > > > >       .debugfs_init =3D drm_bridge_connector_debugfs_init,
> > > > > > > @@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connecto=
r_init(struct drm_device *drm,
> > > > > > >       int connector_type;
> > > > > > >       int ret;
> > > > > > >
> > > > > > > -     bridge_connector =3D kzalloc(sizeof(*bridge_connector),=
 GFP_KERNEL);
> > > > > > > +     bridge_connector =3D drmm_kzalloc(drm, sizeof(*bridge_c=
onnector), GFP_KERNEL);
> > > > > >
> > > > > > So you make destroy's kfree call unnecessary here ...
> > > > > >
> > > > > > >       if (!bridge_connector)
> > > > > > >               return ERR_PTR(-ENOMEM);
> > > > > > >
> > > > > > > @@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connecto=
r_init(struct drm_device *drm,
> > > > > > >               return ERR_PTR(-EINVAL);
> > > > > > >       }
> > > > > > >
> > > > > > > -     ret =3D drm_connector_init_with_ddc(drm, connector,
> > > > > > > -                                       &drm_bridge_connector=
_funcs,
> > > > > > > -                                       connector_type, ddc);
> > > > > > > +     ret =3D drmm_connector_init(drm, connector,
> > > > > > > +                               &drm_bridge_connector_funcs,
> > > > > > > +                               connector_type, ddc);
> > > > > >
> > > > > > ... and here of drm_connector_cleanup.
> > > > > >
> > > > > > drm_connector_unregister wasn't needed, so can ignore it, but y=
ou leak a reference to
> > > > > > connector->fwnode since you don't call fwnode_handle_put anymor=
e.
> > > > > >
> > > > > > We should register a drmm action right below the call to fwnode=
_handle_get too.
> > > > >
> > > > > But drm_connector_cleanup() already contains
> > > > > fwnode_handle_put(connector->fwnode). Isn't that enough?
> > > >
> > > > It does, but now I'm confused.
> > > >
> > > > drm_bridge_connector_init takes a reference, drm_connector_init doe=
sn't.
> > > > It will call drm_bridge_connector_destroy() that gives back its
> > > > reference (which makes sense to me), but then why do
> > > > drm_connector_cleanup() does? None of the drm_connector code even t=
ook
> > > > that reference, and we end up with a double-put.
> > > >
> > > > It looks like it was introduced by commit 48c429c6d18d ("drm/connec=
tor:
> > > > Add a fwnode pointer to drm_connector and register with ACPI (v2)")=
 from
> > > > Hans, which does call put, but never gets that reference.
> > >
> > > The mentioned patch documents that pretty clearly:
> > >
> > > * Drivers can set this to associate a fwnode with a connector, drivers
> > > * are expected to get a reference on the fwnode when setting this.
> > > * drm_connector_cleanup() will call fwnode_handle_put() on this.
> > >
> > > This is logical. Whoever sets the drm_connector::fwnode pointer, shou=
ld
> > > get reference. This way drm_connector_init() doesn't need to play with
> > > the reference counting. The cleanup code drops the reference (so the
> > > driver doesn't need to), because cleanup might be assynchronous..
> >
> > Right, but it's the cleanup part that isn't logical. It makes total
> > sense to have the connector that sets connector->fwnode get the
> > reference itself. It doesn't make sense to have the core give that
> > reference instead of the driver.
> >
> > It's confusing, because if the driver is supposed to handle its
> > reference itself, then it should handle all of it itself. This bug is
> > the testament for that: the natural approach is buggy.
>=20
> I'd say this is the 'transfer of the ownership'. The base driver gets
> the reference, and then gives it away to the drm_connecter. But indeed
> this is not very intuitive.
>=20
> I have looked at the original series by Hans/Heikky, but I don't seem
> to be able to find a good way to solve that. The fwnode can be set
> after initialising the drm_connector. And at the same time it doesn't
> make so much sense to put that burden onto the driver. One option
> might be to add drm_connector_set_fwnode() that will get the reference
> internally, but that looks a bit like an overkill.

It looks like there's only one driver that actually requires that kind
of hack: i915. So, imo, the hacks should be in i915 and not cripple the
core API.

Maxime

--odli6rndmcobp3e7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmqmWwAKCRDj7w1vZxhR
xcjzAQDuOeXpsgePlCrhU3r5smgfj3E03ZHXYfWHP71uY61ASgEAodwkgwKkhBri
T8x1uNmi+gNToVAgRiaOGjTKj5XRNA4=
=rzeG
-----END PGP SIGNATURE-----

--odli6rndmcobp3e7--
