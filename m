Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DD0AD48D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 04:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1110E2F7;
	Wed, 11 Jun 2025 02:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d6/hfQze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42FE10E2F7;
 Wed, 11 Jun 2025 02:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1749608569;
 bh=LxD5HQJOJ7DxFFENLP6r2586LhCQdCVtdN/m1q6Pzmk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d6/hfQzeeCnw6q+/7oW9h0f3PtRwGWa1DZDOmYojFKMNUiRoq/Q8YQc3LPl5sok5I
 ReEYxu3+PuIaodFnrXrATnCmOGjNl3K4XFo88ZNKaU4rDQ00DyU5nerD9vExGk6vfp
 3ijCBLvNx2kNTIdpLCHdfxA4diTGdVWPKL9pPGNO4MsWGer6JAhBy1qvk2ODsMQGSH
 9CySwn5vuX323k3JRFCT5ZUOBErCOfF+YmV8DBPuW/ltUfUpC3fMdyPTol0wWozA2Y
 zu1U+ZZcI0ov4AVt/V84GE/d9NDP8X1BggmFLT2prRgcCDUtEiBSSBgCqT7bIMkPnw
 bmAKlW4QyfAYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH8Zd2Vwfz4wvb;
 Wed, 11 Jun 2025 12:22:49 +1000 (AEST)
Date: Wed, 11 Jun 2025 12:22:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Gabriel Dalimonte
 <gabriel.dalimonte@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20250611122248.67996245@canb.auug.org.au>
In-Reply-To: <20250611120801.48566070@canb.auug.org.au>
References: <20250611120801.48566070@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9DUQGyY1RqU=7u0EUYh6I+w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/9DUQGyY1RqU=7u0EUYh6I+w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jun 2025 12:08:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/vc4/vc4_hdmi.c
>=20
> between commit:
>=20
>   c0317ad44f45 ("drm/vc4: fix infinite EPROBE_DEFER loop")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   d9f9bae6752f ("drm/bridge: allow limiting I2S formats")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (the former removes code updated by the latter, so I just
> removed the code) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

Actually, the code was moved, not removed, so it needs the below merge
fix up.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vc4/vc4_hdmi.c
index 163d092bd973,4797ed1c21f4..000000000000
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@@ -2285,12 -2291,6 +2285,12 @@@ static int vc4_hdmi_audio_init(struct v
  		return ret;
  	}
 =20
 +	ret =3D drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
- 					    &vc4_hdmi_audio_funcs, 8, false,
++					    &vc4_hdmi_audio_funcs, 8, 0, false,
 +					    -1);
 +	if (ret)
 +		return ret;
 +
  	dai_link->cpus		=3D &vc4_hdmi->audio.cpu;
  	dai_link->codecs	=3D &vc4_hdmi->audio.codec;
  	dai_link->platforms	=3D &vc4_hdmi->audio.platform;

--Sig_/9DUQGyY1RqU=7u0EUYh6I+w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhI6HgACgkQAVBC80lX
0GwF+wf/bAJ+afUr5JN1mtlUDnctvxXxxlSAZF6J8WJ8pb0zZ1YvfbkfC7w4NObX
bQy0hejCIOhhBT4X+nujtWD4NjzcsmPrUhuEc19T7aqz9loDn4HH2Pz9/WXFtjMA
5jWgS8xu+LrCo1IMfM7qzI0kyZ/DFCfxIyIIq+mjmaeWe3+DD6sEr7yn5bientRI
ezbSmYcrPpfL2932+MezuIFO7DKox6nvjnjOy2zz8B20sz3t3nd1oHkCYJi+vmiB
GRTPM28NQDhFPlRbOVy1woZYS6nS4jZxfgABF5VsUr7vkQRqgXgohZNNWPvbY7TT
T21wsPAj5kgZLRMLYrA5X87Ll6gQEQ==
=PpFa
-----END PGP SIGNATURE-----

--Sig_/9DUQGyY1RqU=7u0EUYh6I+w--
