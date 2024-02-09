Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D19484F851
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C59310E2BE;
	Fri,  9 Feb 2024 15:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZQwO2a2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32F10E27F;
 Fri,  9 Feb 2024 15:15:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B3AF61CA4;
 Fri,  9 Feb 2024 15:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F262CC43390;
 Fri,  9 Feb 2024 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707491722;
 bh=JTPLE1ema4CnX5398MNCdxiinIwnPuFKQACAa2zXH6o=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ZQwO2a2hPIEEStloHFLwGlP6SdAamukNj5a2j1yihvm9CyFOZyrrCzpMg/Et2nI9s
 8v0y0CD5RQ5gvH60Wpmr1cxl3wE/ZFJcmRsWsZm4dxQF+zkIslK3pHFe5AwzRTyOaf
 1wR7lawrXkle+CEN8SwY3pCvf9jpKolnivfBq5VuFaEzIE4WDJTXeI+dTA/H2sppEz
 Bfp4YX0EIoaOgVt9joDYvNbR6JAUNiG9fE5ZZdIdGIj5ZnZzIjb6sFGuwvwQCmqia9
 jjxvy6E1qFqzmKWGN3cR7phDu6qUtTGk40J3yd+ByENWtPHbxhmBC7OU2s+tvLYybz
 RwXsG9GrMNzjg==
Date: Fri, 9 Feb 2024 16:15:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [etnaviv-next v13 7/7] drm/etnaviv: Add support for
 vivante GPU cores attached via PCI(e)
Message-ID: <65qv24hhkmmy4haylh53muvz2xliejysc3uywq44pl3xx7rus4@ynyau4djposv>
References: <20240206172759.421737-1-sui.jingfeng@linux.dev>
 <20240206172759.421737-8-sui.jingfeng@linux.dev>
 <ZcNO9aZwWzyYs-Rv@phenom.ffwll.local>
 <jahydq72bqb27de2ijwwmdjh4ri326mxhfjn5pbvf7cqcpnauq@rw5hjdiroi5d>
 <ZcYGWEG8eqAiqqai@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b3v5afrzvli3zdwb"
Content-Disposition: inline
In-Reply-To: <ZcYGWEG8eqAiqqai@phenom.ffwll.local>
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


--b3v5afrzvli3zdwb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2024 at 12:02:48PM +0100, Daniel Vetter wrote:
> On Thu, Feb 08, 2024 at 04:27:02PM +0100, Maxime Ripard wrote:
> > On Wed, Feb 07, 2024 at 10:35:49AM +0100, Daniel Vetter wrote:
> > > On Wed, Feb 07, 2024 at 01:27:59AM +0800, Sui Jingfeng wrote:
> > > > The component helper functions are the glue, which is used to bind =
multiple
> > > > GPU cores to a virtual master platform device. Which is fine and wo=
rks well
> > > > for the SoCs who contains multiple GPU cores.
> > > >=20
> > > > The problem is that usperspace programs (such as X server and Mesa)=
 will
> > > > search the PCIe device to use if it is exist. In other words, usper=
space
> > > > programs open the PCIe device with higher priority. Creating a virt=
ual
> > > > master platform device for PCI(e) GPUs is unnecessary, as the PCI d=
evice
> > > > has been created by the time drm/etnaviv is loaded.
> > > >=20
> > > > we create virtual platform devices as a representation for the viva=
nte GPU
> > > > ip core. As all of subcomponent are attached via the PCIe master de=
vice,
> > > > we reflect this hardware layout by binding all of the virtual child=
 to the
> > > > the real master.
> > > >=20
> > > > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> > >=20
> > > Uh so my understanding is that drivers really shouldn't create platfo=
rm
> > > devices of their own. For this case here I think the aux-bus framewor=
k is
> > > the right thing to use. Alternatively would be some infrastructure wh=
ere
> > > you feed a DT tree to driver core or pci subsystem and it instantiate=
s it
> > > all for you correctly, and especially with hotunplug all done right s=
ince
> > > this is pci now, not actually part of the soc that cannot be hotunplu=
gged.
> >=20
> > I don't think we need intermediate platform devices at all. We just need
> > to register our GPU against the PCI device and that's it. We don't need
> > a platform device, we don't need the component framework.
>=20
> Afaik that's what this series does. The component stuff is for the
> internal structure of the gpu ip, so that the same modular approach that
> works for arm-soc also works for pci chips.

But there should be a single PCI device, while we have multiple "DT"
devices, right? Or is there several PCI devices too on that PCI card?

Maxime

--b3v5afrzvli3zdwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcZBhwAKCRDj7w1vZxhR
xUxpAQDwhK8h9Y4aKOMIUeN+dGGWAvkUG9NwytlYTP3v40H7yAD9HGL3y8d+0QA7
Z5FPCPhXRz0bY70gPHmS8EVq0UuEQgI=
=5OJL
-----END PGP SIGNATURE-----

--b3v5afrzvli3zdwb--
