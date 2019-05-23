Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33627D90
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 15:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE5A89E33;
	Thu, 23 May 2019 13:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031B189DF7;
 Thu, 23 May 2019 13:04:32 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458qTR0Bgvz9s1c;
 Thu, 23 May 2019 23:04:27 +1000 (AEST)
Date: Thu, 23 May 2019 23:04:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20190523230409.31da92b9@canb.auug.org.au>
In-Reply-To: <20190523115355.joyeqlmbjkufueyn@flea>
References: <20190521105151.51ffa942@canb.auug.org.au>
 <20190523115355.joyeqlmbjkufueyn@flea>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558616668;
 bh=d5ZuvkUP8TBeK3z+2ilZtV6jDe/CcGS8heAqRVjKyAc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WbLEKpyn+6AuwbkHqX6gXhyjuGcn4cZX2J5oIjCcNCN7Ey0ipmIEcoo4rBkdlhcZE
 ZVEdz+zKdre7TOdoSLKv+XZnhmLOK5Eb4TQ1SjHWjrIRNvBpwqDoiYW8hpPi60iOEB
 dGWM/0rjlpIIoKowDqXK28a3DJz7e1/eb0MKib1BYTvTreP00ZyBMplpCKj8NplYo/
 lo8wMCY5uLrHbOS2jYqQtsMYwQSJAqFYVtEXI76fqQrRtezTQsg3u6UvQHB6pyp/9T
 BDNVV9W1cZFpoS9BQT7HfDGnzjCprZgy54Usd4C98xbisTQZ7M5InZ6QNzk55uAErD
 IzE6GlfdXfbOQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, DRI <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0914626144=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0914626144==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_M21XHDo4D4.=IXfMFpYmIR"; protocol="application/pgp-signature"

--Sig_/_M21XHDo4D4.=IXfMFpYmIR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, 23 May 2019 13:53:55 +0200 Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
>
> On Tue, May 21, 2019 at 10:51:51AM +1000, Stephen Rothwell wrote:
> >
> > Today's linux-next merge of the drm-misc tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/vendor-prefixes.txt
> >
> > between commit:
> >
> >   8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")
> >
> > from Linus' tree and commits:
> >
> >   b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
> >   b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9=
700RTWV43TR-01B")
> >   fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electron=
ics")
> >
> > from the drm-misc tree.
>=20
> I just took your patch and pushed a temp branch there:
> https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git/commit/=
?h=3Ddrm-misc-next&id=3D3832f2cad5307ebcedeead13fbd8d3cf06ba5e90
>=20
> Rob, Stephen, are you ok with the change? If so, I'll push it.

All that needs to be done is for my patch (slightly corrected) needs to
be applied to the drm-misc tree.  That tree already has the back merge
of Linus' tree and the txt file has been removed (my patch should have
been applied as part of the merge resolution but doing it later is fine).

--=20
Cheers,
Stephen Rothwell

--Sig_/_M21XHDo4D4.=IXfMFpYmIR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzmmkkACgkQAVBC80lX
0GwClQf+KtJ3Zpo/s3kaUrdzpTkte/89nvyxmaiI63SFv545RTxjA9IyszIyDugJ
amyGja9rdP0UOiFkAy+Y3mcI1Nyp36x4Pcp3qvsdHWcJd+6QZ8H2J7IP6ItA1F4M
EXpv5KBcR1BSPxmY+aJQp4vLuE8AfafHAGtMf4uPFMr7XRIfhSm6w4K4UF9Y/Xp1
b3xC3Tp2BjZg1pc2ZNEj3c4H2pElewVaRex7F4Pozihu8sVlnLMrNEQvlEumgSBr
i+ZH0L7Dc9ggHXqPU/4R+6NcbDxMzccWtOZqy3oBoir7g98D2O+1vlfv0Hcz8MP7
XBhTHOlQZwlM55ReOqZ2ja3WiNdafw==
=7Nua
-----END PGP SIGNATURE-----

--Sig_/_M21XHDo4D4.=IXfMFpYmIR--

--===============0914626144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0914626144==--
