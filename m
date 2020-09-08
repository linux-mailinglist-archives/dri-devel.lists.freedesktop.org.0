Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B316261068
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 13:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D2A6E4E8;
	Tue,  8 Sep 2020 11:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69E96E4E8;
 Tue,  8 Sep 2020 11:04:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bm2Nf16mGz9sPB;
 Tue,  8 Sep 2020 21:04:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1599563092;
 bh=6U+pqYLfxynVW7ZBWg5ewtSebrhAHs8Jw/8Fsgfyq0Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CaXld08YvgRf7d39KaKgHP619xkysrKAzZdRY2sqZ0tQerwYvkE0GwKePLTW5SxDf
 1eg/R3asmvc6sRCDO3kb0sV3KSBu/hdBD8ksAueQANLDhT8xJweSXTrA9jRt634/di
 ewHOLutGWOkiqBAm5qpo+ic/M++ML7+vRoTYkR3YLNuxVcx/6vQ7CGqMvXKZ/z3dkp
 tACT/u4z05iYE8zAbUz6F24BvjZs0OQhnYwMC7IFqxuNpdXuTH3rFKm/ZDVbizm742
 Fij/LE8BI+XdhzcQcAIW+B2rlx3pTEgMWn4PBedj97223donzxhO6brrtrW7iWy4sY
 kI2KSOrUK6Flw==
Date: Tue, 8 Sep 2020 21:04:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20200908210449.1a4f8e52@canb.auug.org.au>
In-Reply-To: <db369f50-a3a0-2504-0628-ce5e6780d31b@redhat.com>
References: <20200908140022.67dd3801@canb.auug.org.au>
 <db369f50-a3a0-2504-0628-ce5e6780d31b@redhat.com>
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1676892389=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1676892389==
Content-Type: multipart/signed; boundary="Sig_/dGXS.TNI7czMZikC=h9RWLW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dGXS.TNI7czMZikC=h9RWLW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, 8 Sep 2020 10:22:06 +0200 Hans de Goede <hdegoede@redhat.com> wrote:
>
> On 9/8/20 6:00 AM, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the drm-intel tree got a conflict in:
> >=20
> >    drivers/gpu/drm/i915/display/intel_panel.c
> >=20
> > between commit:
> >=20
> >    f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an =
external PWM controller")

This should have been

  899c537c25f9 ("drm/i915: Use 64-bit division macro")

> >=20
> > from Linus' tree and commit:
> >=20
> >    6b51e7d23aa8 ("drm/i915: panel: Honor the VBT PWM frequency for devs=
 with an external PWM controller") =20
>=20
> That doesn't sound correct, those are both commits from the drm-intel tre=
e.
>=20
> > from the drm-intel tree.
> >=20
> > I fixed it up (I just used the latter) =20
>=20
> Just taking the drivers/gpu/drm/i915/display/intel_panel.c contents of:
>=20
> f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an exter=
nal PWM controller")
>=20
> Is the right thing to do, the problem is a difference in a line which gets
> removed in that commit.

Which is what I actually did, I guess :-)

Sorry about that.
--=20
Cheers,
Stephen Rothwell

--Sig_/dGXS.TNI7czMZikC=h9RWLW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XZVEACgkQAVBC80lX
0Gzlbwf+PPJxV9Q4ttdCmWNOyTMQU/r6ZMUpOfodqyfxbkboiTWSI6NyJshSUujB
46CgTj20eGsf1wxDpfceCBW10RiLoxvTv9RRCn0FKFJ4knjlUmLgd5H/q3nyw7KY
I9mymEV1qQR5Bt3qxz1kFzYDyaZVG6QHBSOAwVMkP+WPT9hAFPcJtVg4rqGsW9DS
xPBjTxacTcrBVq1hG+L+Uc5Urr4zxyGKibMeSd1YikukIuRquftUqjBpjINUBGvU
6DkZ2Hg5JFvNqbV1BiA9wxOFOUUCJz524+efusX9Fh5dL4YVCV6ex9SJhXboFLMP
KAlVyNGP4K23MYWFl+nKhqsvhxrf7Q==
=1Pjd
-----END PGP SIGNATURE-----

--Sig_/dGXS.TNI7czMZikC=h9RWLW--

--===============1676892389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1676892389==--
