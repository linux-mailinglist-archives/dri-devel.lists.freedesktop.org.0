Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7CBBE6D9
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 17:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454D10E1A3;
	Mon,  6 Oct 2025 15:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MP+rywNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879CF10E1A3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759763002;
 bh=LjZTl9hGgillNrTlwkaL3xQojDL6Mr3GIUIqRnoAR9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MP+rywNL4oQ7lmG30TH2fnz+O7a6Ep7vj5yhIYEvDTQZZgbyRjGzKICQfM7uz2iyS
 RJbN5FTe1X3lVN0urO0R4hH7L2XIB6z19rg+lk1eMQHqD6Z0XWjiqRx5H5nWjhD9o/
 wu8Y1mIsh3LRs1Hrop4LK7Hkk81G9Fy2UJJ8wJ0XG5D+k336yqXzEVotsnirni5nno
 dqofPdTCqmCeIfPAQ3ans2fz+Q6gmBT3mFDJUfvLjzZIqH1DvBSih3WpAx3GswLxLp
 10I5w17gvhusIWkVuIcqiX75LorOexQJujtX8vcSwz0fpk+c9y9CLsN3Wg26BDO3IY
 Yb3bhwcSpvrPw==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:ed09:4100:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AA2AB17E001E;
 Mon,  6 Oct 2025 17:03:21 +0200 (CEST)
Date: Mon, 6 Oct 2025 18:03:20 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com,
 daniel.stone@collabora.com, mripard@redhat.com,
 pekka.paalanen@collabora.com
Subject: Re: [PATCH v2] drm/connector: hdmi: Add a 'link bpc' property
Message-ID: <aOPaOHrfVhjORWVD@xpredator>
References: <20251006083043.3115-1-marius.vlad@collabora.com>
 <aOOKk6j_rHB18hR1@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aESANPQ3X7cftzYp"
Content-Disposition: inline
In-Reply-To: <aOOKk6j_rHB18hR1@intel.com>
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


--aESANPQ3X7cftzYp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,
On Mon, Oct 06, 2025 at 12:23:31PM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Oct 06, 2025 at 11:30:43AM +0300, Marius Vlad wrote:
> > From: Derek Foreman <derek.foreman@collabora.com>
> >=20
> > Add a way to know the actual bpc of a running link.
> >=20
> > Drivers might change the current bpc link value due to changes in mode
> > line or refresh rates. For example when enabling VRR the underlying
> > hardware might not be able sustain the same bandwidth for a particular
> > mode line, and it might attempt to lower the bpc.
>=20
> Not sure what this VRR stuff is trying to say. Enabling VRR doesn't
> itself change anything about the link bandwidth.
>=20
Any time a modeset happens which involves setting up 'max bpc' might
result in downgrading bpc in an attempt find an optimal output.

VRR by itself won't do that, neither other possible components or
blocks, but it might have an affect on it, like a modeset that requires
a higher refresh rate which can not be done with the currently set bpc.

Does this feel like it is more to your liking in terms of explaining the
VRR implication or should I just drop VRR entirely?

> > Another example can be
> > found when switching the color output format, part of YUV420 fallback.
> >=20
> > This means we might be displaying a stale bpc value although it was
> > modified for different reasons -- like a refresh rate or an output
> > color format.
> >=20
> > Introduces a new property 'link bpc' that user-space can use to get the
> > current bpc value of a running link while in the same time allow
> > user-space to set-up bpc using 'max bpc' property.
> >=20
> > An implementation for Weston [1] and a simple test for i-g-t [2] have b=
een added.
> >=20
> > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> >=20
> > [1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850
> > [2] https://lists.freedesktop.org/archives/igt-dev/2025-October/097061.=
html
> >=20
> > ---
> >=20
> > v1:=20
> > - https://lore.kernel.org/dri-devel/20250801101750.1726-1-marius.vlad@c=
ollabora.com/T/#u
> >=20
> > v2:=20
> > - replace return with EBUSY if connector already exists (Dmitry)
> > - add i-g-t test and an implementation for Weston (Dmitry)
> > - re-wording patch description (Jani)
> >    =20
> >=20
> >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
> >  drivers/gpu/drm/drm_connector.c   | 25 +++++++++++++++++++++++++
> >  include/drm/drm_connector.h       |  8 ++++++++
> >  3 files changed, 38 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> > index 85dbdaa4a2e2..15c5ad7ddfb5 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct=
 drm_connector *connector,
> >  						   fence_ptr);
> >  	} else if (property =3D=3D connector->max_bpc_property) {
> >  		state->max_requested_bpc =3D val;
> > +	} else if (property =3D=3D connector->link_bpc_property) {
> > +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max bp=
c instead\n");
> > +		return -EINVAL;
>=20
> Is there a particular reason this isn't just an immutable prop?
Did tried passing DRM_MODE_PROP_IMMUTABLE here, but DRM UAPI will not go th=
rough=20
drm_atomic_connector_get_property() hence dropping the flag (it goes
through __drm_object_property_get_prop_value() from what I can tell) and
with that I don't see the value being updated.
>=20
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
>=20
> Assuming hdmi here doesn't seem good. What about all the other
> connector types?
Right, Jani raised this as well. I don't have a good answer here really.
I'm using what I have in the tree at the moment.

On one side this would only be for HDMI type of connectors, and on
another side only drivers that actually use the helpers would gain
access to the property.

When adding support for this Maxime even mentioned that i915/vc4 was using a
similar algorithm (https://patchwork.freedesktop.org/patch/595684/).
Itself this patch doesn't even touch that but I gather it does raises a
few eyebrows as this is strictly for HDMI. I imagined there might be
reason for just doing this for HDMI but tbh I haven't really followed up
on that.

Do I get that you'd like see this happening for other types of connectors? =
How
would that go?

Would following a similar path we have now in the tree for to the
broadcast_rgb be something you'd see as reasonable? I see that i915
hooks its own get_property (intel_digital_connector_atomic_get_property())=
=20
which I wasn't aware until now.

>=20
> >  	} else if (property =3D=3D connector->privacy_screen_sw_state_propert=
y) {
> >  		*val =3D state->privacy_screen_sw_state;
> >  	} else if (property =3D=3D connector->broadcast_rgb_property) {
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 272d6254ea47..7cc99cd16e20 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -542,6 +542,27 @@ int drmm_connector_init(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drmm_connector_init);
> > =20
> > +static int
> > +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> > +				       int max)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +	struct drm_property *prop;
> > +
> > +	if (connector->link_bpc_property)
> > +		return -EBUSY;
> > +
> > +	prop =3D drm_property_create_range(dev, 0, "link bpc", 8, max);
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
> > @@ -618,6 +639,10 @@ int drmm_connector_hdmi_init(struct drm_device *de=
v,
> >  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> >  	connector->max_bpc =3D max_bpc;
> > =20
> > +	ret =3D drm_connector_attach_link_bpc_property(connector, max_bpc);
> > +	if (ret)
> > +		return ret;
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
>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--aESANPQ3X7cftzYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjj2jQACgkQ9jQS5glH
1u820w//QxwouXzJ/FPC+vK+9FNAQSxR8yqKAvtBEISbpqcIGcsgU75HM9fGPs01
N6Dc0yqX0+UnLy3FdZKg1sLsc7uxYExBNY9RYw0CJbXkziRgPtiNDUZ3k8G6ivG+
JQFt/CQcfeuGQzngLgZ27LVYMX7atVfrITHE5zhfAc2XeDhGGxqkZsVEvcPDDWyE
++60Ze0nTkJQ+D9Kp8P32KVQgNdRsSByrJ5Oc0X0jC7O24LL1/WRDEOzjKYxR6KI
3ZKwPDcCr6dMa0x6/0csyftUDRdgfaetXZWrefksCEmG/IWYqTeCBMpHtEPkNbMP
VizkfkYJGMbtb6vNFtfgxUF6zD8tqj+ePZojhNSj09s/erFzfhzSLzkr9Ry8I0su
hTwZI/VkC2DaM+DCLP49B2qkCp98WV2M+153DxnlK6PDZC3cTNV39CwJnihTJTyF
AJsj895BaIf5hULRAqLJLmOvujh0vsEAc+tmnqKsONjaJoynf9s3SoZbCnQjqDae
5/b1RBdEMwNTLpff5UsmhLABMWyDiCfFqet0xEuaRzL5ILaXq1p+vaM3d/14zw6z
qHwrwHfexPHH/LGWXmRPJhafWC5yWCI0JC0SAEmnnl8cnyH4VCEYi3KrEUujbWQG
kodEQiEiWzjSgAUTBYq9+lxMrjF88r7gnwvzE1l8GB/RCaRn0aM=
=ZrKf
-----END PGP SIGNATURE-----

--aESANPQ3X7cftzYp--
