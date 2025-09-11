Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96169B53A71
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D3610E3CD;
	Thu, 11 Sep 2025 17:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Sv/Z6mlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C8010E3CD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 17:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757612089;
 bh=zM3zVeC4q+DzpkkbNJKAivjjI3id20uSb/omGoxRe1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sv/Z6mlvYnwWroL3flYX8F/gK2zc9Ac780GLZk1SoR0YEFe3b2ncsTenfzsshiSTU
 lq+ojzji6HN5MsXz/5jJWE1sNPL4yQCE0SGPZmvkMJVrUBQuyntZ5sC1KW+9Btyicm
 BwMlw1gWtv20RV/Pj3zQ3uyVvyOIHuWSPcn+2eJp8ozJhnS49/axq8bZv7VLIcprTh
 bicVsv0gFzJwoDKWHpvrO5Ygr6YqzG9OJP0dziDYhr2QhkWyniZI+Xy95j7KLTEsOj
 X7KVGI+yt3h5tpiL8B0XMK1JAppW76ViliBdeE4SBDYcn5X+FQIYVKJ6sWnFAI25vw
 f8btrasBfe0hw==
Received: from xpredator (unknown
 [IPv6:2a02:2f05:840b:7800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A54D17E0927;
 Thu, 11 Sep 2025 19:34:49 +0200 (CEST)
Date: Thu, 11 Sep 2025 20:34:48 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com, mripard@kernel.org,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <aMMIOBfuQ7oJFH6i@xpredator>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
 <fekbw2ngxyg4mvkhlvkvegylcm4vm74y5rhhxeygiqxve7oqaj@sxvkyqjssdru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v1gtAyp9vO1WI533"
Content-Disposition: inline
In-Reply-To: <fekbw2ngxyg4mvkhlvkvegylcm4vm74y5rhhxeygiqxve7oqaj@sxvkyqjssdru>
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


--v1gtAyp9vO1WI533
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 04:55:29PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 04:07:36PM +0300, Marius Vlad wrote:
> > Initialize drm_brige with advertised colors formats straight on.
> >=20
> > Drivers that make use of DRM helpers would check the
> > drm_brige::supported_formats bit-field list and refuse to use the color
> > format passed. Drivers that make use of drm_bridge can pass the
> > supported color formats in the bridge as well as supported color format
> > for the DRM color format property.
>=20
> Your commit message doesn't match patch contents. You are pushing format
> selection to the instance creating drm_bridge_connector, which
> frequently has no idea about the other end of the chain - the bridges
> which actually send pixel data to the monitor.

None of these changes in this patch actually perform a functional
change, it will just explicitly expose the fact that BIT(HDMI_COLORSPACE_RG=
B)
was embedded in drm_bridge_connector_init().=20

Commit description is a bit forthcoming explaining the rationale behind
the change. This actually allows the ability to pass a list of supported
formats the bridge itself, similar how do we do it with the connector.

If any of these are wrong, they were prior to me touching them.

>=20
> We have drm_bridge::ycbcr_420_allowed with clearly defined meaning. I
> think it would be wise to start from that and to describe why such a
> field doesn't fulfill your needs.
Alright, I'll be looking into this.=20
>=20
> >=20
> > This includes a fallback to RGB when Auto has been selected.
> >=20
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c      | 2 +-
> >  drivers/gpu/drm/bridge/ite-it6263.c               | 2 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c             | 3 ++-
> >  drivers/gpu/drm/display/drm_bridge_connector.c    | 4 ++--
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c               | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_dpi.c                | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                | 2 +-
> >  drivers/gpu/drm/meson/meson_encoder_cvbs.c        | 3 ++-
> >  drivers/gpu/drm/meson/meson_encoder_hdmi.c        | 4 ++--
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          | 2 +-
> >  drivers/gpu/drm/msm/dp/dp_drm.c                   | 3 ++-
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c             | 2 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 2 +-
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 2 +-
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 2 +-
> >  drivers/gpu/drm/rockchip/cdn-dp-core.c            | 2 +-
> >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 2 +-
> >  drivers/gpu/drm/rockchip/rockchip_lvds.c          | 2 +-
> >  drivers/gpu/drm/tegra/hdmi.c                      | 2 +-
> >  drivers/gpu/drm/tegra/rgb.c                       | 2 +-
> >  drivers/gpu/drm/tidss/tidss_encoder.c             | 2 +-
> >  include/drm/drm_bridge_connector.h                | 3 ++-
> >  22 files changed, 28 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/d=
p_drm.c
> > index 9a461ab2f32f..8d5299849be6 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -368,7 +368,8 @@ struct drm_connector *msm_dp_drm_connector_init(str=
uct msm_dp *msm_dp_display,
> >  {
> >  	struct drm_connector *connector =3D NULL;
> > =20
> > -	connector =3D drm_bridge_connector_init(msm_dp_display->drm_dev, enco=
der);
> > +	connector =3D drm_bridge_connector_init(msm_dp_display->drm_dev, enco=
der,
> > +					      BIT(HDMI_COLORSPACE_RGB));
>=20
> Just to point out: this is wrong.
Yeah, I understand why you're saying that just that I haven't really
modified these.
>=20
> >  	if (IS_ERR(connector))
> >  		return connector;
> > =20
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/ms=
m/dsi/dsi_manager.c
> > index ca400924d4ee..4b87f4f78d38 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -479,7 +479,7 @@ int msm_dsi_manager_connector_init(struct msm_dsi *=
msm_dsi,
> >  	if (ret)
> >  		return ret;
> > =20
> > -	connector =3D drm_bridge_connector_init(dev, encoder);
> > +	connector =3D drm_bridge_connector_init(dev, encoder, BIT(HDMI_COLORS=
PACE_RGB));
>=20
> And this totally depends on the bridge chain. If we have a DSI-to-HDMI
> bridge somewhere in the middle, we are able to output YUV data to the
> HDMI connector.
That's actually the usecase for this patch: to allow passing other color
formats, but this patch is a transitory patch to further expose the fact
drm_bridge_connector_init was embedding BIT(HDMI_COLORSPACE_RGB) for the
format. See rockchip implementation for this bit, the last patch in this
series.
>=20
> >  	if (IS_ERR(connector)) {
> >  		DRM_ERROR("Unable to create bridge connector\n");
> >  		return PTR_ERR(connector);
>=20
> --=20
> With best wishes
> Dmitry

--v1gtAyp9vO1WI533
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjDCDQACgkQ9jQS5glH
1u9SPxAAxLNqwmVzYKpHxEUz6NOR7EvDV88Xg0JuavUZsq1Uap+ICO9+GoQiot8V
mU7xxr+VGMTCybDLe1Vgl5GuRC1bBFHAsHTnNd8RJsPAGk78E6wXbTHP+ZQh3nJI
PWqEKK+PVGQcRgocat55p0jBz+rC365U8qjVMeGi4jXhnBE30UWxtd+NStnrTriW
kRdLrRPhAXdJPB+QbGs5xgUZUWjCXESwpTqip+NVqmBpe2kjXX8r5o/yY9dQq7pb
8EoK47JRCX5/hnH9JzFVGwpY1fu0t+gVl6UJp4NNNdRZtWyl60ScqM+rVSPV1s70
AHDCuVnHlz1gzQyDP2MSIMkb8h8qKANuf7YJ5jEjMHIZvcE28mIKNWgPgqy/BWB9
j2gpBsGUAsY712r6ORsFBIg5Gst4sl+J7LnWmumRCr9iVXQyr0w2irkCFrkTUSxc
GSA26KN5lST0MFrlQcOBmIERbN1h8mBOP1sKYhSwqjMXnsFgIVsIwSz6opDabQP2
psBnwQz1r5qF6Gafq9jdgTuPjX48btv6Y4z6pSJKg7rFURrlvnrAsXU5hAyyjwYo
t1K7od0mw7kXGOs8bY9YoaeuCxnru4GhfhZ3qFzc+FjFUtaBm1Kjn53K04sQWSKD
1zf1Ayr/UCtGnJl9oVb3r44dgk9sFoBhhO+hEsN9c+JOwnY9wj4=
=Gk55
-----END PGP SIGNATURE-----

--v1gtAyp9vO1WI533--
