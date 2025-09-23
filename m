Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD42EB95C64
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 14:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8D710E600;
	Tue, 23 Sep 2025 12:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V2SeEy4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3BD10E600
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758629189;
 bh=w5escWjDrR8bqw2vUVMmm67iUZS6ztSR9UBppZ5mcP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2SeEy4VQMAkQMR6r+NbQJma073ZhnAMsaNDYFQCYyrUIOckynyKLWk4nQk969JNk
 skKv+8lAQlzWxSkCe3/ylhbGpRpDmDqFq0Vdvz0eS1no2wy4o/2wFgDMXUcA5zikzd
 G2u8Rl3RqjzlP1bIx4NWlHiwb+s42TIPwVGbDGKlgUWagJ0fFXXyjkO1O38K0s/VpV
 xdPqZQL1bAM/Uay0Ier2zRgEqapA5tA5n23imqi2lQzD/PHD1mos4kakd2n93tYUDR
 x73hjR3ttq1403bVRlwO5uyvxRxfhYQrjERxXRBF4VeRwC87C6pcf1orGhJGkdHcYj
 gXxGnMwtKHnsA==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:ed09:4100:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D66F717E0097;
 Tue, 23 Sep 2025 14:06:28 +0200 (CEST)
Date: Tue, 23 Sep 2025 15:06:27 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH] drm/connector: hdmi: Add a link bpc property
Message-ID: <aNKNQ8MWPGMyNf63@xpredator>
References: <20250801101750.1726-1-marius.vlad@collabora.com>
 <l6s63vlxu2lrsxcbwrxt5shcn6rnldwjdevggmipstjmluxnyn@7ynu3iygwvxf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gS2W5Rd5gCaAjXII"
Content-Disposition: inline
In-Reply-To: <l6s63vlxu2lrsxcbwrxt5shcn6rnldwjdevggmipstjmluxnyn@7ynu3iygwvxf>
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


--gS2W5Rd5gCaAjXII
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,
On Fri, Aug 01, 2025 at 05:09:06PM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 01, 2025 at 01:17:50PM +0300, Marius Vlad wrote:
> > From: Derek Foreman <derek.foreman@collabora.com>
> >=20
> > Add a way to know the actual bpc of a running link.
> >=20
> > Drivers might change the current bpc link value due to changes in mode
> > line or refresh rates. For example when enabling VRR the underlying
> > hardware might not be able sustain the same bandwidth for a particular
> > mode line, and it might attempt to lower the bpc. Another example can be
> > found when switching the color output format, part of YUV420 fallback.
> >=20
> > This means we might be displaying a stale bpc value although it was
> > modified for different reasons -- like a refresh rate or an output
> > color format.
> >=20
> > This patch introduces a new property 'link bpc' that user-space can
> > use to get the current bpc value of a running link. In the same
> > time this would allow user-space set up bpc using 'max_bpc' property.
>=20
> Could you please point out the userspace implementation which uses this
> property?
I'll be adding a MR for Weston for retriving this property. It will compare
it with 'max bpc' and inform the users that we've noticed a link change.
>=20
> >=20
> > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
> >  drivers/gpu/drm/drm_connector.c   | 26 ++++++++++++++++++++++++++
> >  include/drm/drm_connector.h       |  8 ++++++++
> >  3 files changed, 39 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index ecc73d52bfae..3a2ffb957ade 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  						   fence_ptr);
> >  	} else if (property =3D=3D connector->max_bpc_property) {
> >  		state->max_requested_bpc =3D val;
> > +	} else if (property =3D=3D connector->link_bpc_property) {
> > +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max_bp=
c instead\n");
> > +		return -EINVAL;
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		state->privacy_screen_sw_state =3D val;
> >  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connec=
tor *connector,
> >  		*val =3D 0;
> >  	} else if (property =3D=3D connector->max_bpc_property) {
> >  		*val =3D state->max_requested_bpc;
> > +	} else if (property =3D=3D connector->link_bpc_property) {
> > +		*val =3D state->hdmi.output_bpc;
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		*val =3D state->privacy_screen_sw_state;
> >  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 272d6254ea47..7ed27aec0ccc 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -542,6 +542,28 @@ int drmm_connector_init(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drmm_connector_init);
> > =20
> > +static int
> > +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> > +				       int min, int max)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +	struct drm_property *prop;
> > +
> > +	prop =3D connector->link_bpc_property;
> > +	if (prop)
> > +		return 0;
>=20
> Shouldn't it be:
>=20
> if (connector->link_bpc_property)
> 	return -EBUSY;
Yeah.
>=20
> > +
> > +	prop =3D drm_property_create_range(dev, 0, "link bpc", min, max);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	connector->link_bpc_property =3D prop;
> > +
> > +	drm_object_attach_property(&connector->base, prop, max);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> >   * @dev: DRM device
> > @@ -618,6 +640,10 @@ int drmm_connector_hdmi_init(struct drm_device *de=
v,
> >  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> >  	connector->max_bpc =3D max_bpc;
> > =20
> > +	ret =3D drm_connector_attach_link_bpc_property(connector, 8, max_bpc);
> > +	if (ret)
> > +		return ret;
>=20
> Is there a code which sets this property?
Hmm, the idea is/was that userspace will just read out this property and
compare with the 'max bpc' one. In my mind it should be immutable. Is
that what you're implying here?
>=20
> > +
> >  	if (max_bpc > 8)
> >  		drm_connector_attach_hdr_output_metadata_property(connector);
> > =20
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 8f34f4b8183d..4a50198aa7c0 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -2079,6 +2079,14 @@ struct drm_connector {
> >  	 */
> >  	struct drm_property *max_bpc_property;
> > =20
> > +	/**
> > +	 * @link_bpc_property: Current connector link bpc set by the driver
> > +	 *
> > +	 * This property can be used to retrieve the current link bpc from
> > +	 * connector_state::hdmi:output_bpc
> > +	 */
> > +	struct drm_property *link_bpc_property;
> > +
> >  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. =
*/
> >  	struct drm_privacy_screen *privacy_screen;
> > =20
> > --=20
> > 2.47.2
> >=20
>=20
> --=20
> With best wishes
> Dmitry

--gS2W5Rd5gCaAjXII
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjSjT8ACgkQ9jQS5glH
1u+C0hAA0FNoSaLCfrTXzxHF47LapgK7AQhL5IUncJk4x+S9GqCkX5NstxyAvlpW
Un7Lu5nRRss2nrF/auJERYEp0vRVy3HtQeUjk4Uqv/gHMXvJ0LaQi4cluq5cnNJ5
U29Mqw2DLSXzhh+32irKga6nshyi+8e3T80+RVLs2qaW9M/+PmrIVmVJXkl+/2Pr
uP+/LhAabpxKjiudzJPfhxTMC8i5PuXdSCCJyQw97QY5rdzLDdMD0NBy7MAzH0WP
ND5eTC9DUmWGQ6wGIIWjR+W5ieDT1o3nmVac50klZy1nDdKGZo9Fbdk6s3JnbhvJ
ldCapCg4CI7fI2NR9YwA+v1gGyYYk++nn9GK9/MALfuO7NKleX+QqQRiLav6P5W7
VE5Z5ifrNZpwNN09KK/HC/xGMEv6QaSH4gz5hku2HMINhRyMOaUz0sRwM9ArUlCN
WDeoQDbsijzUpnmzHpx9R2hacztyL4Sai08HyhP4isXPOUo06kbX0EEgEzfHjWWt
JuT7EUcMWZUD0Ujm3O/qqyK3fwFhGWI165s1q7EZDXeHI7/vFPPSbHpnswcmKkkS
3S+tENrjphagpUFGb0umuUUjxw8nSTrWM7suAHNN+GsbO7pt4QVyWw+nljnDNNIN
xFjGGGr4avJAPJl22xt+yC5r4fLOtHKI/h33w7vkMYqcypGloCc=
=sG50
-----END PGP SIGNATURE-----

--gS2W5Rd5gCaAjXII--
