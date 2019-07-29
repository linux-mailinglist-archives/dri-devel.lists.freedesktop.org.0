Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79F782D5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 02:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C5389DBD;
	Mon, 29 Jul 2019 00:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1589DBC;
 Mon, 29 Jul 2019 00:31:38 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45xgbp5h33z9s3l;
 Mon, 29 Jul 2019 10:31:34 +1000 (AEST)
Date: Mon, 29 Jul 2019 10:31:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the
 kspp-gustavo tree
Message-ID: <20190729103133.5a3deb85@canb.auug.org.au>
In-Reply-To: <20190723110331.1967d000@canb.auug.org.au>
References: <20190723110331.1967d000@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1564360295;
 bh=+JTon61vz1+YQHFE94AbS2eZpOMWfyvWSxXSDsfyxy8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GroEowRPhDqwkchQUSkgl6VRvtoatP01fbTBL+bZv7bh/2Jo+prb+Tp1EkMoSVOnc
 3ZCWekF1FZPMOfYCl+k+ZLz71r2Ekxd33NhaJeqdgbw3d7tJ0laAGlMbL17XliBkyF
 oexSKAHtAO7CzBfnZ4x5riOnxLXj0B+uo3wWJSKqaaT9f3zKSea9iw/dnj2cWBBkxy
 84lzGhPrb5D+lcOpuMzp/1TrfbTX+HnikV2EH+7rdynUv9yX1QHSWq7j3sQF/y97Dv
 oXpd4WzBbIU2Yh1hKKRAqwcGTYZ6wBdaTKqFXj6sC9VVDIvjrbnwNWWlk5kPGEcZ2t
 xuKLaHVFdP3bg==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1650085145=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1650085145==
Content-Type: multipart/signed; boundary="Sig_/DqgcD_x8eYr0_R2i9O0jMTP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DqgcD_x8eYr0_R2i9O0jMTP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 23 Jul 2019 11:03:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-intel tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/display/intel_dp.c
>=20
> between commit:
>=20
>   b6ac32eac063 ("drm/i915: Mark expected switch fall-throughs")

This is now commit

  2defb94edb44 (""drm/i915: Mark expected switch fall-throughs")

from Linus' tree.

> from the kspp-gustavo tree and commit:
>=20
>   bc85328ff431 ("drm/i915: Move the TypeC port handling code to a separat=
e file")
>   4f36afb26cbe ("drm/i915: Sanitize the TypeC FIA lane configuration deco=
ding")
>=20
> from the drm-intel tree.
>=20
> I fixed it up (bc85328ff431 moved the function updated by b6ac32eac063
> and 4f36afb26cbe added an equivalent fixup) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DqgcD_x8eYr0_R2i9O0jMTP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+PmUACgkQAVBC80lX
0Gz6bQf+KJXRHgo9OonMtR1Pc5z36XAnT9kMF0gp1cqGpTIdX0avC7dzI/tkcpS1
hdUOEYF1oc0DHbeb1HHWyRjfoPUgL9EUJwxCATyOuFv7V3UKbTxOZ3N5wSC1z5Yb
lA8IiuOW9xkyf4Pbf6BOYCErtzyicskwARI3AzW7qCHgRe3+WpGaV6LayJzuOcX6
TRefqb/dFGeo2ly9mkvcPpY8CgT5rKCjWchgbGICNqyGH9LMMH2jIxIfyXjV09AX
q9sXlyVxeJTNP8Eqpb2C/TBbaceCvRNt3/iLpuL4ZYdFr4QaMVJvOj6accgzpvCV
p3EWr5ky/iGRDcekwNbkyVVmsMEz1A==
=TFsE
-----END PGP SIGNATURE-----

--Sig_/DqgcD_x8eYr0_R2i9O0jMTP--

--===============1650085145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1650085145==--
