Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADDAC516E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E48C10E2DB;
	Tue, 27 May 2025 14:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XZ/N/AV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB81E10E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:57:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E11D2A4D510;
 Tue, 27 May 2025 14:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF27C4CEED;
 Tue, 27 May 2025 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748357873;
 bh=6c8NYwxQYQ3V862xbvTlYlSVIDJLz9fGUYXs65CCQPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XZ/N/AV1VxebNxlwGSCrP2AhiFSN4bdwpZoS6C+ydOav4vmyu8C7xhTAldizOUcQR
 eajI7VJ5TBAuBATJaFgUtBv4DffQAcN6uMcDXkgi5HdpWOmqiKO9CYeMw0vJD/Pi+O
 dQMFss4g8Wu7S9YLoFY+mpBk36XZpGKGw05lLtpoDOiJnFfF/Dy6E+LR+CANtTKvYd
 5G81TRsGJM9zLdbAjf5AoehXvUSywkaQJYLc3tFGJivIn+E50zGicitDpQ2LkQTQJE
 DpU5oHvDAeJacQpI9vv6Z+inpNQBXzrc0C3T9NUt1raZfMSGBzrovtkAra9KZVlW56
 x9p6Wmq1zamfA==
Date: Tue, 27 May 2025 16:57:51 +0200
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
Message-ID: <20250527-winged-prawn-of-virtuosity-d11a47@houat>
References: <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
 <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vrxhigte2cmrplrl"
Content-Disposition: inline
In-Reply-To: <87sekztwyc.fsf@intel.com>
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


--vrxhigte2cmrplrl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Tue, May 20, 2025 at 01:09:47PM +0300, Jani Nikula wrote:
>=20
> Maxime -
>=20
> I'm cutting a lot of context here. Not because I don't think it deserves
> an answer, but because I seem to be failing at communication.
>=20
> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > You still haven't explained why it would take anything more than
> > registering a dumb device at probe time though.
>=20
> With that, do you mean a dumb struct device, or any struct device with a
> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
>=20
> Is using devm_drm_panel_alloc() like that instead of our own allocation
> with drm_panel_init() the main point of contention for you? If yes, we
> can do that.

Yeah, I was thinking of something along the lines of:

const struct drm_panel_funcs dummy_funcs =3D {};

struct drm_panel *register_panel() {
    struct faux_device *faux;
    struct drm_panel *panel;
    int ret;

    faux =3D faux_device_create(...);
    if IS_ERR(faux)
       return ERR_CAST(faux);

    return __devm_drm_panel_alloc(&faux->dev, sizeof(*panel), 0, &dummy_fun=
cs, $CONNECTOR_TYPE);
}

And you have a panel, under your control, with exactly the same
setup than anyone else.

Maxime

--vrxhigte2cmrplrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXS6wAKCRAnX84Zoj2+
dkDUAYC5iZn1TuEBLw27T/PkCrKe8tbxEuy7qgQ0R0AkVjHAaVk5ip9n6kkwLRmX
TkcmqWwBfRH9yn4WuyWOb4dNBTub0wm0ycegfvKL655zm3YXGO7USOj4aGjG/Ou9
AEXevAVGuw==
=lUVs
-----END PGP SIGNATURE-----

--vrxhigte2cmrplrl--
