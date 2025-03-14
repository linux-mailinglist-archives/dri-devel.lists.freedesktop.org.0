Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4EA612FB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC4810E9EA;
	Fri, 14 Mar 2025 13:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CJfW3Gme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7495210E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:47:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D4982A473F8;
 Fri, 14 Mar 2025 13:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CC5C4CEE3;
 Fri, 14 Mar 2025 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741960076;
 bh=Iplf0rc4WP8tVInazpAqt6fsMArNe+JUl/q0eXEstFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJfW3Gmez/TlxTfCxDrypT1DCSrRCdOQLmkKtB5L3UPcCA+3eoelslGxA+nDn2qEz
 iwUerXDao77z5BQjr4IUT169cBbh05WbohS32j9DItacpzfgQAYFpEcxMaPGZPqDIz
 D95iravls+Y0Ge6i12D27Adr5XSkTvfnToi3dX5vVUiF5NYUrXdEEbnY+ke+ykHAsM
 rJR+/Sdt9BEVJP6D2jrdmoPR9tFt48NyAW6AJr0f/uTvQGMH/5vPZl2OTEmmZTw1PC
 MQNkuYuOYSmGPnF/fh5gNBxXnhlQvOmFCm+Chpjnt9FmRIkWmbKjFLOQGftG6+t3QA
 dbF3wpetXwFgQ==
Date: Fri, 14 Mar 2025 14:47:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
Message-ID: <20250314-airborne-magenta-corgi-afd52c@houat>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-4-fbdb94f02562@collabora.com>
 <20250311-hypersonic-mature-leopard-d3afdc@houat>
 <g25hgb2mocl4sjny26k4nzn2hwpwhlodenqganzcqfzzg6itms@herenniualnw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="js5xpba5a2kvuwvy"
Content-Disposition: inline
In-Reply-To: <g25hgb2mocl4sjny26k4nzn2hwpwhlodenqganzcqfzzg6itms@herenniualnw>
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


--js5xpba5a2kvuwvy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 09:46:39PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 04:55:17PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > I think the first thing we need to address is that we will need to
> > differentiate between HDMI 1.4 devices and HDMI 2.0.
> >=20
> > It applies to YUV420, which is HDMI 2.0-only, and I guess your patches
> > are good enough if you consider YUV420 support only, but scrambler setup
> > for example is a thing we want to support in that infrastructure
> > eventually, and is conditioned on HDMI 2.0 as well.
> >=20
> > On Tue, Mar 11, 2025 at 12:57:36PM +0200, Cristian Ciocaltea wrote:
> > > Try to make use of YUV420 when computing the best output format and
> > > RGB cannot be supported for any of the available color depths.
> > >=20
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 69 +++++++++++++--=
----------
> > >  1 file changed, 35 insertions(+), 34 deletions(-)
> > >=20
>=20
> [...]
>=20
> > >  	return -EINVAL;
> > >  }
> > > =20
> > > +static int
> > > +hdmi_compute_config(const struct drm_connector *connector,
> > > +		    struct drm_connector_state *conn_state,
> > > +		    const struct drm_display_mode *mode)
> > > +{
> > > +	unsigned int max_bpc =3D clamp_t(unsigned int,
> > > +				       conn_state->max_bpc,
> > > +				       8, connector->max_bpc);
> > > +	int ret;
> > > +
> > > +	ret =3D hdmi_try_format(connector, conn_state, mode, max_bpc,
> > > +			      HDMI_COLORSPACE_RGB);
> > > +	if (!ret)
> > > +		return 0;
> > > +
> > > +	if (connector->ycbcr_420_allowed)
> > > +		ret =3D hdmi_try_format(connector, conn_state, mode, max_bpc,
> > > +				      HDMI_COLORSPACE_YUV420);
> >=20
> > I think that's conditioned on a few more things:
> >   - That the driver supports HDMI 2.0
>=20
> Isn't that included into connector->ycbcr_420_allowed? I'd expect that
> HDMI 1.4-only drivers don't set that flag.

Yeah, I guess that's one way to do it, but we don't have any way to
express it at the moment

Maxime

--js5xpba5a2kvuwvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9QziQAKCRAnX84Zoj2+
dsDJAX44hfiYxa3/CLfwf3gbHbyOce6ss/IJSLR3qokZjM7FFv+z4UC8vvcNDmC6
39Y9thkBf0Cr3jegqHhUz1MQcYVtshuo858Bvk3LgNN0AV4jDyqq63UqD0Dx2nEZ
UKoAruDLaQ==
=O4VN
-----END PGP SIGNATURE-----

--js5xpba5a2kvuwvy--
