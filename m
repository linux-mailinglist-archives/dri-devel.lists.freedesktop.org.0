Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2F9BF540
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 19:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7B10E164;
	Wed,  6 Nov 2024 18:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ncga7DDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C71210E164
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 18:30:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 604FFA44241;
 Wed,  6 Nov 2024 18:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF61C4CEC6;
 Wed,  6 Nov 2024 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730917847;
 bh=lwnwFqyElhS59Xfq7JeJ9Np9U8KffT4TejVqEqCOZp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ncga7DDBTtU5oQZ5uy2fj4VeVQineuf963jbAweI5cQL8TstTDlhAj0dNYtVpHgT9
 NjvMOiaYR8U0g+WtexhB47eFW1KxSqwXHprIWbQ+IThqovpgxFLCJq3bvaHXW0s0TH
 Nvi9g1U4hkfr7kVzo3/kIQYTaNqorVnhIn0+gzPIM1HaX5opU2d0i2AyDxEp0vYcWJ
 b3y/ndaOYgyNOiXTTHVfl/XquCmbuX9O7NV/LIAy0mb6t0sKa/Iq4Mg+Ux9O313/v/
 MfLvBNHGtUsRCKaSgoyYbXtpA2w2fu/DIgkl+bfeEDipcHanKFXw7VCZ2tgCJ589bg
 uNfuvfK34/DkQ==
Date: Wed, 6 Nov 2024 18:30:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 04/21] dt-bindings: gpu: img: Allow dma-coherent
Message-ID: <20241106-dried-spoils-f6ddd8020f40@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-4-4ed30e865892@imgtec.com>
 <20241105-linseed-steadfast-98cd8abe898c@spud>
 <5e26957f-dc79-42ef-a8a1-597fb386ae51@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f01tRNt2X5Z6+tQq"
Content-Disposition: inline
In-Reply-To: <5e26957f-dc79-42ef-a8a1-597fb386ae51@imgtec.com>
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


--f01tRNt2X5Z6+tQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:18:06AM +0000, Matt Coster wrote:
> On 05/11/2024 18:06, Conor Dooley wrote:
> > On Tue, Nov 05, 2024 at 03:58:10PM +0000, Matt Coster wrote:
> >> This attribute will be required for the BXS-4-64 MC1 and will be enabl=
ed in
> >> the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
> >> dtbs_check doesn't complain later.
> >=20
> > Sounds like the property should be made required for that integration.
>=20
> This is something I went back and forth on. Where is the line drawn
> between things that should be enforced in bindings and things that only
> ever need to be specified once, so should just be left to the dt itself
> to be the source of truth?
>=20
> Having said that, I realise TI could spin a new SoC with a new dt but
> use the same compatible string for the GPU;

No they can't. New SoC, new compatible.

> the "single" source of truth
> then wouldn't be so single anymore. I guess by making this property
> required for this compatible string, we're saying any use of it must
> behave in exactly the same way, right?

--f01tRNt2X5Z6+tQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyu10QAKCRB4tDGHoIJi
0oE5AP4yKMe2zZuHfZWRLLe1EVB1RY5SngwUhkXzFSPhIY8wLgEAlaS4WL2LzDDS
8YfEDzUHezrqSxoOdDYmEg7VZOPVXwQ=
=AxQP
-----END PGP SIGNATURE-----

--f01tRNt2X5Z6+tQq--
