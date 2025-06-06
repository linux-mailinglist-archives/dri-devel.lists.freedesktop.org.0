Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E5ACFD8D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 09:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E1C10E904;
	Fri,  6 Jun 2025 07:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H/lufMmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622DC10E904
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 07:33:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7256F5C59ED;
 Fri,  6 Jun 2025 07:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9392EC4CEEB;
 Fri,  6 Jun 2025 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749195213;
 bh=GgpsoVc6kfsSKu3xWYJA7jgXEAg40pxLEZStQKU5UU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/lufMmZV6xnLzAXFzkNz8IPJRd2Q2kpznY/0otRooxnk9ADP4W3S+1K7WIkBcNxL
 1qWh655K7ypWrYZ6+yPWWuW3Weq9zSnZJ+L2rap6Hvpny04qd5clKyFyfKEOc64ooz
 1dcKOGm0dw+TZOgCJWkzme59r2N5rewh168FnhBk0eiRZ7CGBFlAPkPXWQoaRe+y7Q
 OWnDHV9lF3Ak+Ywx5/zrfd1SH42vuKjxc3K5ALrvC4GHb0O61MUaY9C5B1Wnp60i1v
 DhOgjDkDeTN/uU+1oqYZmBDg1TpmDLgHPLnlr+hIczgZ/qcQLF+ottDbtEztyX5o6U
 jIPizOP2hyP7g==
Date: Fri, 6 Jun 2025 09:33:31 +0200
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
Message-ID: <20250606-pompous-mellow-guan-1d9ea4@houat>
References: <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
 <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
 <20250527-winged-prawn-of-virtuosity-d11a47@houat>
 <4a1c28b2ad4f701b9b2fe363ebf6acbab504e6ad@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="67qv6diskukyz3pt"
Content-Disposition: inline
In-Reply-To: <4a1c28b2ad4f701b9b2fe363ebf6acbab504e6ad@intel.com>
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


--67qv6diskukyz3pt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Tue, May 27, 2025 at 10:40:49PM +0300, Jani Nikula wrote:
> On Tue, 27 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, May 20, 2025 at 01:09:47PM +0300, Jani Nikula wrote:
> >>=20
> >> Maxime -
> >>=20
> >> I'm cutting a lot of context here. Not because I don't think it deserv=
es
> >> an answer, but because I seem to be failing at communication.
> >>=20
> >> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> >> > You still haven't explained why it would take anything more than
> >> > registering a dumb device at probe time though.
> >>=20
> >> With that, do you mean a dumb struct device, or any struct device with=
 a
> >> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
> >>=20
> >> Is using devm_drm_panel_alloc() like that instead of our own allocation
> >> with drm_panel_init() the main point of contention for you? If yes, we
> >> can do that.
> >
> > Yeah, I was thinking of something along the lines of:
> >
> > const struct drm_panel_funcs dummy_funcs =3D {};
> >
> > struct drm_panel *register_panel() {
> >     struct faux_device *faux;
> >     struct drm_panel *panel;
> >     int ret;
> >
> >     faux =3D faux_device_create(...);
> >     if IS_ERR(faux)
> >        return ERR_CAST(faux);
> >
> >     return __devm_drm_panel_alloc(&faux->dev, sizeof(*panel), 0, &dummy=
_funcs, $CONNECTOR_TYPE);
> > }
> >
> > And you have a panel, under your control, with exactly the same
> > setup than anyone else.
>=20
> This [1] is what I'm toying with now, but again, draft stuff. Using
> __devm_drm_panel_alloc() directly like above does make it cleaner.
>=20
> Long term it can be improved, but my first dab at refactoring to make
> that happen is already like 15-20 patches, and it'll just have to wait
> until after making stuff work at all first.
>=20
> I'm not sure if the ACPI device I'm passing to devm_drm_panel_alloc() is
> correct, but it'll have to be *some* ACPI device for the lookup to
> work. I am blissfully ignorant about its lifetime, but as long as
> drm_panel_add() and drm_panel_remove() remain as they are, I don't think
> it leaks anything. Fingers crossed.

Thanks for working on that. Your two patches (the one you sent here, and
the one in the other subthread) look good to me. So if that works, it
looks like we have a way forward.

Thanks!
Maxime

--67qv6diskukyz3pt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKZygAKCRAnX84Zoj2+
dn5cAYCkwOYmJ6UscZiyfFYQtRN968mhhnJoxkK2C1GTH4KOP4Q+W5o6shKCLkDZ
yH3gStwBfRXpQ9eCilwegVakty+hEFlgKTEXYW3QgkcpX/ElYapqcVoizKdGxDo8
tPcfqac3Zg==
=A9mR
-----END PGP SIGNATURE-----

--67qv6diskukyz3pt--
