Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBBE1B530D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 05:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98DD89F3C;
	Thu, 23 Apr 2020 03:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11E189F3C;
 Thu, 23 Apr 2020 03:17:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4972Y52cnLz9sSd;
 Thu, 23 Apr 2020 13:17:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1587611851;
 bh=fPDIGwXG/O4qiqrUxCx7mK5RkR0Hcw3uGWDBx9Czdpo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nyHeleDwAgVoKB4YEW03uvm1lWxrzgQh9rVFnjAjW6gswWO934SsC5+uFr5DXsSCf
 SC6Gik2GTym6KqqY8MFEJLCMBncDRjwCCx+7Ot6ypatGgT1n3MjTB7ei9sDtkoUdWf
 6h0iOGWiYUf78URbWzBft+FxNuvTpU5jjn9wKIXRFJpEhDY4Ace9ySok7r6z9m7Nop
 BA2elb6XKODKSQxyTFNdB34gUC5tic1WCQGu6tVtgQB0ssuiELHRVbUfryDgSbreh1
 ysBZ/8QH+gISoCU8ASs1+ZMlXz/IVjqT8+H1J9FPZz3iF70hCyD1LmYL63FiYv09aZ
 uE0rDSsPi4MrA==
Date: Thu, 23 Apr 2020 13:17:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20200423131727.1e0f2d9f@canb.auug.org.au>
In-Reply-To: <c299b6d5-a786-1620-2863-8814a1242cf8@ti.com>
References: <20200421115241.704f2fbf@canb.auug.org.au>
 <c299b6d5-a786-1620-2863-8814a1242cf8@ti.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0872181051=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0872181051==
Content-Type: multipart/signed; boundary="Sig_/AMvG1A0w1rTbKJfBVJzBQUh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AMvG1A0w1rTbKJfBVJzBQUh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Apr 2020 09:10:25 +0300 Tomi Valkeinen <tomi.valkeinen@ti.com> w=
rote:
>
> On 21/04/2020 04:52, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the drm-misc tree got a conflict in:he drm-=
misc tree with the drm-misc-fixes tree
> >=20
> >    drivers/gpu/drm/tidss/tidss_encoder.c
> >=20
> > between commit:
> >=20
> >    9da67433f64e ("drm/tidss: fix crash related to accessing freed memor=
y")
> >=20
> > from the drm-misc-fixes tree and commit:
> >=20
> >    b28ad7deb2f2 ("drm/tidss: Use simple encoder")
> >=20
> > from the drm-misc tree.
> >=20
> > I fixed it up (I just used the latter version of this file) and can =20
>=20
> We need to use "drm/tidss: fix crash related to accessing freed memory" v=
ersion.
>=20
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts. =20
>=20
> I have fixed this with drm-misc's dim tool, so I presume the conflict goe=
s away when drm-misc-fixes=20
> is merged to drm-fixes, and drm-fixes is then at some point merged to drm=
-misc-next.
>=20
> It was a bit bad timing with the "drm/tidss: Use simple encoder", which r=
emoves the plumbing I=20
> needed to implement the fix. So I effectively revert the "drm/tidss: Use =
simple encoder".
>=20
>   Tomi
>=20

This is now a conflict between the drm and drm-misc-fixes trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/AMvG1A0w1rTbKJfBVJzBQUh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6hCMcACgkQAVBC80lX
0Gx1HQf/ZbE+upiUXsPewgi3i1246+n4LMTaWEPrQRqedXUrDaUQco9CjpsFokVn
bvFHf5ZAtypMb7s9vAcLiniS4TCvDcZX1ouP2ACafaz8iQ3GauxlywggjuAkO4iz
HD5uoOcRVoELlEffWurIWO6FPx+2u4WOVz8vgwNthN2Krgc7a3BrxLJNi4uvKpVp
Tat/nquI1FznqxZOuLpR2a7NHXgVOD0ZIqX0CToEZY6uQ+OWjQZybESkaevRJrsw
Ru4wdq4BLHm24Gqgvypfh92ckMF9+CPbQgdw5i+2+y4X3b6pVhgKKrWOwfKHMm2+
xy0ceQXNkz4ds3Hpv6w6g4g8OTARTA==
=pewb
-----END PGP SIGNATURE-----

--Sig_/AMvG1A0w1rTbKJfBVJzBQUh--

--===============0872181051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0872181051==--
