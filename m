Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F953910618
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37D10E9CD;
	Thu, 20 Jun 2024 13:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uIT/GL3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289510E9EA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:33:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DA82FCE235E;
 Thu, 20 Jun 2024 13:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C10C2BD10;
 Thu, 20 Jun 2024 13:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718890387;
 bh=JHFuoApI8YwZUO/loNI2s728PX2xltX+ADqEX216v6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uIT/GL3mLdUa7jfpy43tlMQsAAFJ1x0xaDrwJJafP2MbCY0+bgn5KOgFw9XC89l4i
 BcEKinoybFMAlIl6hHkhxWE507U2uWufpN00xqjpHsf2iRFIIllkL7R/iwKx8FUE7N
 X+uq431xl6DsouXK9Rq2Ua1uc46oFnN1FNICPmQNmhmIOV2rUpEgERz0qZPrTaIpAT
 9m8seuN381ShvGNmBnuA8R0IgoEXKUal/v3bozi2bdF4AeZN3Jx+RL2SO/nNxu4kp6
 YC3slBfeEhH9H2pMFOIx0qTUX1izawSF86lK6j/68TlX5HXgJZztZJxgWMIsp2cbfV
 AV1+dqAC+dxpw==
Date: Thu, 20 Jun 2024 15:33:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/3] drm/todo: Create a TODO item for additional HDMI work
Message-ID: <20240620-bald-amusing-foxhound-c1d4dc@houat>
References: <20240612143553.915966-1-mripard@kernel.org>
 <87tthxi8wl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dqsi76omhzccoqdq"
Content-Disposition: inline
In-Reply-To: <87tthxi8wl.fsf@intel.com>
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


--dqsi76omhzccoqdq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Thu, Jun 13, 2024 at 10:44:42AM GMT, Jani Nikula wrote:
> On Wed, 12 Jun 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > We recently added some infrastructure to deal with HDMI but we're still
> > lacking a couple of things. Add a TODO entry with the remaining items.
> >
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  Documentation/gpu/todo.rst | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 2ea6ffc9b22b..52fd8672fb6d 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -633,10 +633,39 @@ long as that supports DMA. Otherwise importing ca=
n still needlessly fail.
> > =20
> >  Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> > =20
> >  Level: Advanced
> > =20
> > +Improve HDMI Infrastructure
> > +---------------------------
> > +
> > +We have a bunch of helpers to handle HDMI and reduce the boilerplate in
> > +drivers. Support so far includes HDMI 1.4 support, but we need to exte=
nd
> > +it with:
> > +
> > +  - CEC handling support. CEC requires a bit of integration into every
> > +    HDMI driver to set the device physical address according to the ED=
ID
> > +    in `.get_modes`, and to clear/reset it in the hotplug detection
> > +    path. We should create the ``drm_atomic_helper_connector_hdmi_get_=
modes()``
> > +    and ``drm_atomic_helper_connector_hdmi_handle_hotplug()`` helpers =
to handle
> > +    this properly, and convert drivers to use them.
>=20
> Furthermore, we should stop passing EDID to the CEC functions, and
> instead use the source physical address we've parsed ourselves and
> stored to connector->display_info.source_physical_address.
>=20
> I.e. stop using
>=20
> - drm_dp_cec_set_edid()
> - cec_s_phys_addr_from_edid()
> - cec_get_edid_phys_addr()
>=20
> And instead use .source_physical_address and
>=20
> - drm_dp_cec_attach()
> - cec_s_phys_addr()
>=20
> The main rationale is to avoid using a separate EDID parser that's
> outside of the drm subsystem and unaware of struct drm_edid and frankly
> cdoes not look very robust.

It's a good idea, but imo do not belong in that entry. I've added it to
the last patch of this series which fits better to me.

Thanks!
Maxime

--dqsi76omhzccoqdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnQvjwAKCRDj7w1vZxhR
xeA0AP9rDYxFRRByfyZAlk9IQ8j/ttKNqm8xmT588tCU6zlQ8wEAzbtHA4mz5cNc
Q4h79WNe5LaoiFVqawk8VhlSnyZrMgA=
=wW8C
-----END PGP SIGNATURE-----

--dqsi76omhzccoqdq--
