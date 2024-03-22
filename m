Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC5D886E7C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1301124E4;
	Fri, 22 Mar 2024 14:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IdKgeDw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FD61124E6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:27:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9490660C22;
 Fri, 22 Mar 2024 14:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098E6C43390;
 Fri, 22 Mar 2024 14:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711117623;
 bh=tx6ucvlunDL3a1XWYgCPuVgW4leQngQpb66CHagFab0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IdKgeDw552A7xmpeFSFYEM0+GsSUFusbLRaXCrHdEBjD1v77kVS4JK0uuJ9sHCuYz
 jR6zndwZjSlPpFJaqh40J1i8/o3ABICncRGkRPEYQqMI4XyrCAdhLrqlQ695G3GNQT
 5oox3LItD7m89v9B+7eD0AiBHJv6jdJQsQNrBAKnb8hs2PLF2fkICXZMAM/s/NWVtf
 6tsVw4VFEFMOc7abXOIZ6ZcernqGkQct5DySa270a80LKHYGPJ8pj1WMSRMLyQwwbn
 BcHCnAqRRVq2Bm5V4Dcxa1YoilYCl3gCzPkhZtZg7q0WaCvpZ1Tan8D7XV+AletqSo
 V5t9Ddr6dxsVw==
Date: Fri, 22 Mar 2024 15:27:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 12/13] drm/ast: Implement polling for VGA and SIL164
 connectors
Message-ID: <20240322-analytic-malkoha-of-skill-85eed7@houat>
References: <20240320093738.6341-1-tzimmermann@suse.de>
 <20240320093738.6341-13-tzimmermann@suse.de>
 <20240321-elated-optimal-lion-7ae26a@houat>
 <e83eb697-a359-4b8d-b038-a26d2ae00f21@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2cesgggdpskbc2h2"
Content-Disposition: inline
In-Reply-To: <e83eb697-a359-4b8d-b038-a26d2ae00f21@suse.de>
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


--2cesgggdpskbc2h2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 07:40:52AM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 21.03.24 um 15:09 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Wed, Mar 20, 2024 at 10:34:17AM +0100, Thomas Zimmermann wrote:
> > > +/**
> > > + * drm_connector_helper_detect_ctx - Read EDID and detect connector =
status.
> > > + * @connector: The connector
> > > + * @ctx: Acquire context
> > > + * @force: Perform screen-destructive operations, if necessary
> > > + *
> > > + * Detects the connector status by reading the EDID using drm_probe_=
ddc(),
> > > + * which requires connector->ddc to be set. Returns connector_status=
_connected
> > > + * on success or connector_status_disconnected on failure.
> > > + *
> > > + * Returns:
> > > + * The connector status as defined by enum drm_connector_status.
> > > + */
> > > +int drm_connector_helper_detect_ctx(struct drm_connector *connector,
> > > +				    struct drm_modeset_acquire_ctx *ctx,
> > > +				    bool force)
> > > +{
> > > +	struct i2c_adapter *ddc =3D connector->ddc;
> > > +
> > > +	if (!ddc)
> > > +		return connector_status_unknown;
> > > +
> > > +	if (drm_probe_ddc(ddc))
> > > +		return connector_status_connected;
> > > +
> > > +	return connector_status_disconnected;
> > > +}
> > > +EXPORT_SYMBOL(drm_connector_helper_detect_ctx);
> > I think it would be better to make it more obvious that we rely on DDC
> > to detect and we shouldn't consider it a generic helper that would work
> > in all cases.
> >=20
> > drm_connector_helper_detect_probe_ddc maybe?
>=20
> No objection from me about mentioning DDC. What what about
> drm_connector_helper_get_modes()? It relies on DDC as well, so I thought
> that that's the default. Should we consider renaming it?

I see your point, but I think it's not totally in the same situation.
Unless you have a fixed mode panel (and even then, some support EDID),
EDID is the de-facto standard to retrieve the modes from the attached
monitor.

You don't really have that standardization with monitor detection:
probing the DDC bus is one of the many valid methods to do so, along
with reading the HPD register, reading a GPIO state, etc.

So I would say it's much more critical for the detect helper than it is
for the get_modes one. But we could totally do it for get_modes too to
make it somewhat consistent.

Maxime

--2cesgggdpskbc2h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZf2VNAAKCRAnX84Zoj2+
ds2hAYCrAgBkqjoNZIIOlpYcpmpO8Jf9zLMVL/F7fFfB9HOovNi+J2pi+D7jqdBz
IisGGE0BgIQv8oL57OUD1bTf68b0SptcDxV7HBG+UB7wjdl7wd82BFGD2yvP9MAH
KqbV7Toybw==
=9ZLV
-----END PGP SIGNATURE-----

--2cesgggdpskbc2h2--
