Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3DE7BF79D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95B10E162;
	Tue, 10 Oct 2023 09:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E78D10E162
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:40:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 07EBBCE1CE6;
 Tue, 10 Oct 2023 09:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF57BC433C8;
 Tue, 10 Oct 2023 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696930826;
 bh=M9NQ/9ONnkLygtXrRPJyQLEJiZXZIH8yXqGEWj8Ynbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHXweph2WmpGmsRDFRlbeznDnNI3YeIfPyqv7Q56S0JctrtvtpB/dti26q5SiV9uM
 Pcbn7Doi6zP/xaIrWPpjWvqoIOvvjXV4ymliUxHK63a2ftr5YeX5feFGcHCGPhKuJD
 LGkSkQ6szGhhRHMIV91jFZT+irqWv/Or+Iy/93W6Zg1/iOZfaWoaJzJzojvh3eVZdN
 dJ3aDwoUEc7RjMououblRwZS/N3yLDyYK5P/l03hl+ksNSiIKfI25QQx4bjOshYQ9t
 3Lg72Fi7ACg5hcvmGfMmGgsPavSHaf4psBy817C5Pgn0du2Oz+gBD/v+ew9wDVbqbB
 28LabWL7qC/OQ==
Date: Tue, 10 Oct 2023 11:40:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 2/7] drm/atomic-helper: Add format-conversion state to
 shadow-plane state
Message-ID: <qlp6jhzcgqhhyhdzbmijb4cujadru44dw53avvj46pbdhiqphy@lnvvbcbdejav>
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <20231009141018.11291-3-tzimmermann@suse.de>
 <87bkd7vpsq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sg2tn4wvi4qi6kod"
Content-Disposition: inline
In-Reply-To: <87bkd7vpsq.fsf@minerva.mail-host-address-is-not-set>
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
Cc: jfalempe@redhat.com, dri-devel@lists.freedesktop.org, mairacanal@riseup.net,
 noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sg2tn4wvi4qi6kod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 04:22:29PM +0200, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> > Store an instance of struct drm_format_conv_state in the shadow-plane
> > state struct drm_shadow_plane_state. Many drivers with shadow planes
> > use DRM's format helpers to copy or convert the framebuffer data to
> > backing storage in the scanout buffer. The shadow plane provides the
> > necessary state and manages the conversion's intermediate buffer memory.
> >
>=20
> I would argue this is one of the primary selling points for this series
> (since Maxime was asking about the motivation). As you point out, many
> drivers that use a shadow-buffer can also expose a different format than
> the native one to user-space, so makes sense to have the buffer used for
> conversion as a part of the shadow-plane state.

I'm confused, can we convert between formats or not? Or is it about
XRGB8888 vs whatever native format is used by the device?

Maxime

--sg2tn4wvi4qi6kod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSUcBwAKCRDj7w1vZxhR
xa4RAQCI96hztBsOWmNeJ14S8PLBzHbAqUpZBH8nrTlJ5yPIigD/cMV3ZbiozH6q
b9vVn84WlNLMluJeVr+00yQ33KogcQg=
=GpUw
-----END PGP SIGNATURE-----

--sg2tn4wvi4qi6kod--
