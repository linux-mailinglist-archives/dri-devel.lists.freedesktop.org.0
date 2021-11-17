Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E157454321
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E156E2D8;
	Wed, 17 Nov 2021 08:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79AE6E321
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:58:14 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E3A95C01C2;
 Wed, 17 Nov 2021 03:58:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 03:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WxhMCF6GieKbc43ugPb4L6qi9Zl
 Qmle6MK84dK980pM=; b=IumAPrVLhryU34QhmDpiBuM/Sz7XvnQDZdEeDfzixO9
 c0yEKaco+nfysd9gJFCUx3G01SZmkBFWFBV91qOFwyqkrx424QYKlUNOX0lMiwPO
 VXoP3iuSc1gvablVWFcfloWnkgMOmIAaX5st8xWRUSmT521OkWr56AYm3S6El+ci
 +bYU3syAmSC/Nu58YJA5NbQpGcqWXOORShn7bLdXEctj8mbxTOUHk8NFVYc61eHG
 4dsKHZrXrVNS4VDcPO8feezBSAWBsIdntq7p6T6ETq0Gxz4on7Dd4Mqgt6udj2vC
 GgYJbAsBrdDDjM418V5AkWNp/bZVrm7uwfCcF5rya6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WxhMCF
 6GieKbc43ugPb4L6qi9ZlQmle6MK84dK980pM=; b=IqieXIg1CAJtuJsu1SNYpv
 Zm3eANTACXTqrAbGXe5GYoQVPGxqwyyH+lNkc8vK5FyvOX6v88+1vwbVyrEv+slw
 9pf4Bmt02uvopo89zeUx1pPd32ADaKnsjzVV6IGBH5DcnfpGs2JGCRnii4UAMgOI
 pK/vZeVLouYQGzEO/plsHfj0jIe3mXzzcLJxWU/fdtrw1q5BXr37NHnSxPElpfW0
 E7XuAWlkQJod/98s6VlHZtlCSfBM+K+vtgENI8tVKQvAKpo7ExO2wGBwQPh++IXW
 0zAnPxxh2gMkpe6LhPr5gQdH3RhCk318sCoHJt7deN2WNhTpvhPH5jPZadcqhbzw
 ==
X-ME-Sender: <xms:JcSUYbGgJDE6lxhgA4GII9nBb1-MHKGul2bUJLoMPcg1Vt11M9I8_g>
 <xme:JcSUYYWNGb7LbxOodaMZHKPihqtytthTIByDFWS7ZFbfaE-OygAaRh6ik64ipC7xk
 VYsyhZ6tfWKm6_7YRM>
X-ME-Received: <xmr:JcSUYdIXA6o1zORRlFgNqHgVWVznzsMZo30h8SGcjLgJPDbTxPsjDXv12SAm9VoxU_SFFDN_6XhYAv101PPPMDwemtN1AhXW4-OznkV9F3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleeghfejfeejudduudffjeehheetgfeuvdeijeejvdefhfekveettdehvdfh
 kedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JcSUYZE8M4EbpnXx47_UEBhZVRaAO6jsqPQpWpKn0R6SR1CthUXJ-A>
 <xmx:JcSUYRXUKtvja-h07TXR98wB8zqMAQPyjOaFIbkLgWqD8-SRT8g7Eg>
 <xmx:JcSUYUPHCQbQRpZ4qW6Kixbp4zpYXBcrtFYrK3TvnRv18YbxjcWZ4g>
 <xmx:JsSUYdqYz_O4WZ2blqP931oHlf0ytYqU5-89fP0OgeVdgaFSs3OiLQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 03:58:13 -0500 (EST)
Date: Wed, 17 Nov 2021 09:58:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian-Hong Pan <jhp@endlessos.org>
Subject: Re: [PATCH 0/6] drm/vc4: kms: Misc fixes for HVS commits
Message-ID: <20211117085811.225cwhd5zgiux23w@gilmour>
References: <20211115113105.103275-1-maxime@cerno.tech>
 <CAPpJ_eezZHUwbbq1r18jSgBrKa4L9dPcohQsCFBV10fD-TpcbA@mail.gmail.com>
 <20211117082454.mcjfeepnrer7on7h@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wa77uilnrhextvgg"
Content-Disposition: inline
In-Reply-To: <20211117082454.mcjfeepnrer7on7h@gilmour>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wa77uilnrhextvgg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 09:24:54AM +0100, Maxime Ripard wrote:
> Hi,
>=20
> On Wed, Nov 17, 2021 at 03:08:31PM +0800, Jian-Hong Pan wrote:
> > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8815=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:31=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Hi,
> > >
> > > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Co=
nvert to
> > > atomic helpers") introduced a number of issues in corner cases, most =
of them
> > > showing themselves in the form of either a vblank timeout or use-afte=
r-free
> > > error.
> > >
> > > These patches should fix most of them, some of them still being debug=
ged.
> > >
> > > Maxime
> > >
> > > Maxime Ripard (6):
> > >   drm/vc4: kms: Wait for the commit before increasing our clock rate
> > >   drm/vc4: kms: Fix return code check
> > >   drm/vc4: kms: Add missing drm_crtc_commit_put
> > >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> > >   drm/vc4: kms: Don't duplicate pending commit
> > >   drm/vc4: kms: Fix previous HVS commit wait
> > >
> > >  drivers/gpu/drm/vc4/vc4_kms.c | 36 ++++++++++++++-------------------=
--
> > >  1 file changed, 14 insertions(+), 22 deletions(-)
> > >
> > > --
> > > 2.33.1
> > >
> >=20
> > Thanks to Maxime's information!
> >=20
> > I tried to applied this patch series based on the latest mainline
> > kernel at commit commit 8ab774587903 ("Merge tag 'trace-v5.16-5' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace"),
> > which almost equals "tags/v5.16-rc1" and tested it on RPi 4B.
> > However, the system hangs and becomes dead at the kernel message:
> >=20
> > [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> >=20
> > The full dmesg can be found at
> > https://bugzilla.kernel.org/attachment.cgi?id=3D299603
> >=20
> > If I revert the patch series to the original mainline kernel, system
> > can boot up.
>=20
> Can you share a bit more information on the boot setup you have? Do you
> have a display connected? If so, on both output or just a single one?

Nevermind, I found what the issue is. I'll send a v2 shortly.

Maxime

--wa77uilnrhextvgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZTEIwAKCRDj7w1vZxhR
xbX5AQCaAcx5YffzEZvrLbElQB8V96U66/yDKqjwKUEagvWVaAEA2a2igyBmy7Ll
A/7ISJDUYlxCn8umUkTJ1B0zdYEu8gU=
=+Nao
-----END PGP SIGNATURE-----

--wa77uilnrhextvgg--
