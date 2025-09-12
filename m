Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA2B54097
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 04:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF4C10E023;
	Fri, 12 Sep 2025 02:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lIAPbdjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383A610E023
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 02:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1757645243;
 bh=uyA3gwnjwiLRvIHVw+hw+As1uXVIOremMBXGfE27mrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lIAPbdjGrgXGoGUx0Pvmg/sleSlLvSdJaANg+ySOaEjoE0aYU6lOfJcSc+g0Mc37K
 d9KR1bdtm71wD7dqjphI1UebBugj/6fxtDxUjkC7UGybgzr7pUC7k5LYOYmUQXhkiX
 NNyCFC8Js06uQJa6UDqhfx9MJR2qjvweUiuqa3rJjI9bgv62c0n6ReQQ4oJGUMe8iu
 /sr0eKoaz3E7POp3vGQtaGVl/W4Tfcqr0f7a8Xa5gEWz64aoLyw2eCzZRoTh8Nwo8S
 IsfNuMpVZE1M2aZq+fQOcE0uszUit6rF8O6krrM8QnJF6tSs48qO/2H8cMOE7h3UyS
 u3p3UTWUPTOuw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNJk3113Xz4w9Z;
 Fri, 12 Sep 2025 12:47:22 +1000 (AEST)
Date: Fri, 12 Sep 2025 12:47:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <daeinki@gmail.com>, Inki Dae <inki.dae@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250912124721.535e89fc@canb.auug.org.au>
In-Reply-To: <20250904075923.537b45bd@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
 <20250826121320.4931c6eb@canb.auug.org.au>
 <20250901122226.20a39858@canb.auug.org.au>
 <20250902130304.1f80f4c6@canb.auug.org.au>
 <54f68544fa192779e15b46257dd0bfb4@disroot.org>
 <20250904075923.537b45bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vlnWCFb982EeKNDs4zdxxoi";
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

--Sig_/vlnWCFb982EeKNDs4zdxxoi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Sep 2025 07:59:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 03 Sep 2025 15:51:03 +0000 Kaustabh Chakraborty <kauschluss@disro=
ot.org> wrote:
> >
> > This commit is from commit [1] of branch [2]. However, the macro is
> > defined in commit [3] of branch [4]. I had sent those patches in a sing=
le
> > patchset, though.
> >=20
> > I guess the merge strategy would be exynos-drm-misc-next, followed by e=
xynos-drm-next.
> >=20
> > Let me know if you need to know anything else. Thanks!
> >=20
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git/commit/?h=3Dexynos-drm-next&id=3Dd07e4c00696f53510ec8a23dcba0c4ac878408=
74
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git/log/?h=3Dexynos-drm-next
> >=20
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git/commit/?h=3Dexynos-drm-misc-next&id=3Dbcd0d93e902e54e6b404b574b3a6b2331=
5bcea8d
> > [4] https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git/log/?h=3Dexynos-drm-misc-next =20
>=20
> The problem is that nobody has ever asked me to merge [4] into
> linux-next ... I also presume that it will be merged into the drm-fixes
> tree (or Linus' tree) at some point and that hasn't happened either.

This is still failing ... and it has been since Aug 21!

--=20
Cheers,
Stephen Rothwell

--Sig_/vlnWCFb982EeKNDs4zdxxoi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDibkACgkQAVBC80lX
0Gw7Qwf/fak4xQCP+gp0G6HgpQHsTmxoGw+qziMHtyE0ypb4+nwIUzAYACKFQGGh
zXcDVwnGICQDruDBjAoB+NLZEQZleg7wFu+cm9YQnkCZ1fHmn5j0abqWlMepGRGs
kS8G84LXBs/wUsSL+utwqiUfCZFyLYa/mW6vSTEFsPY+JDVlQvt+OFFNs9DX+9GI
a+67LQDwSHSsVSn9XigoKiG4zcKH+La67Yw3KTc4SH/Xqo+1WGvCT/1cUcTwVZDk
RKQfSWCCXubef93uf6+DpDOaZ7RuWKir6wHq7xyYggQLHGaLr5Kq8c1zvHD2T0Nl
SOc3Sk+Yh++VCiSRkJnZ5YK9L1vveA==
=LhyK
-----END PGP SIGNATURE-----

--Sig_/vlnWCFb982EeKNDs4zdxxoi--
