Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76278C0DE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 11:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF8A10E1C2;
	Tue, 29 Aug 2023 09:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C5510E0EB;
 Tue, 29 Aug 2023 09:01:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26E6561329;
 Tue, 29 Aug 2023 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF83C433C7;
 Tue, 29 Aug 2023 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693299667;
 bh=GhfuQpWmdib87lCoauTo6AdDK1S/osETRmCezeujX90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YkDNtnbOfPzi+Np2TfrZKTn4jheHjhLwVZUKQJbJZx88CoPdUWLnJcdgnQd4xBWGX
 38lZlk6J39xJPNf50YdXdnI7y3U8Ds6BYRB1ueueFLQsOlihbvjiozUCtsoOfn2zis
 CZgtGjTVk1umGbC5D4dYAGlry2ZZxaqeBm66dap2+VaYUAFb9MjQSGT7uc8jp3aIRd
 iI4EhS0GHsb/UTo2pcdIcQmeu09/U/g1m9vG5XRLX5lIj1exZDbuZng5hkGD3fKCS8
 HpzvNS5zcZfuJQqNxxuc3rZkGB4hTJQHVsBjyikm4E4avnRdFbxDGUg1kx5mObStz6
 jnoutwgatBZug==
Date: Tue, 29 Aug 2023 11:01:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/display/dp: Assume 8 bpc support
 when DSC is supported
Message-ID: <u5ipy7ih3luuujkdrzxabcbgvb4tlj6van2goifc5ccigca37z@qz25nrtiicnx>
References: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
 <20230824125121.840298-2-ankit.k.nautiyal@intel.com>
 <87a5ua2q79.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cahg6vkq23vjc4ri"
Content-Disposition: inline
In-Reply-To: <87a5ua2q79.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cahg6vkq23vjc4ri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 11:44:10AM +0300, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> > As per DP v1.4, a DP DSC Sink device shall support 8bpc in DPCD 6Ah.
> > Apparently some panels that do support DSC, are not setting the bit for
> > 8bpc.
> >
> > So always assume 8bpc support by DSC decoder, when DSC is claimed to be
> > supported.
>=20
> Maarten, Maxime, Thomas, ack for merging this via drm-intel?

That's fine by me

Maxime

--cahg6vkq23vjc4ri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZO2z0AAKCRDj7w1vZxhR
xVSnAP0et/hZg+Mg/07GTMIBnvHKL6mvUUJ48rsgUcIEjIKHfgEA64vwUQJc+JBX
ITPpWtqPg7pVctALnOIjRISaaCRgiwA=
=Rku7
-----END PGP SIGNATURE-----

--cahg6vkq23vjc4ri--
