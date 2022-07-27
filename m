Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87072581DC1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 04:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A55EBFC57;
	Wed, 27 Jul 2022 02:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C2BFC57;
 Wed, 27 Jul 2022 02:55:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lsz0b4Tvbz4x1W;
 Wed, 27 Jul 2022 12:55:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1658890512;
 bh=17gluqyXS9jfy3B9QJ3z57bs8ssPCqXX0ftG48rcxA4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bJ0l6+uVnxG8wrxHA5ireEiRVTboEOzvf02LkYrtvIEECY5ABukV4W29wFZVzWwJg
 iIa/h7M/cgMTBz7NAJq53Vh4A6Seq6R8m6XgR3htZgjDRjYAhkW78oDfnanRKdFU2q
 bi+wUOTll7J9LrOYpp+mHOn6qeda63SoM02GZbMTwDzBnY75zQByxvRdnDXDOpGzp2
 zTYYrmcxVoSDrqSVQK/SAlHg5eckW++J10oJjuJSb7nVBUrjmhvImzYVKC4dG6oDF0
 3tpd8vaGfjfdCIJCB/CozD8R6WnOyUiK05SOOwgZhZX6OOZ+YvYQLkTr/WOVRsgPP1
 XKQS0bxf+BT/Q==
Date: Wed, 27 Jul 2022 12:55:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20220727125508.1991f1e7@canb.auug.org.au>
In-Reply-To: <20220718094453.2f1a1f09@canb.auug.org.au>
References: <20220711124742.3b151992@canb.auug.org.au>
 <6e60d396-2a52-d1fa-f125-3c585605b531@amd.com>
 <20220718094453.2f1a1f09@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iz8zI2QfuiEyLtX1sFCVOPA";
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iz8zI2QfuiEyLtX1sFCVOPA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Jul 2022 09:44:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 11 Jul 2022 10:05:45 +0200 Christian K=C3=B6nig <christian.koenig=
@amd.com> wrote:
> >
> > Am 11.07.22 um 04:47 schrieb Stephen Rothwell: =20
> > >
> > > Today's linux-next merge of the drm tree got a conflict in:
> > >
> > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > >
> > > between commit:
> > >
> > >    925b6e59138c ("Revert "drm/amdgpu: add drm buddy support to amdgpu=
"")
> > >
> > > from the drm-misc-fixes tree and commit:
> > >
> > >    5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mg=
r_new")
> > >
> > > from the drm tree.
> > >
> > > This is a mess :-(  I have just reverted the above revert before merg=
in
> > > the drm tree for today, please fix it up.   =20
> >=20
> > Sorry for the noise, the patch "5e3f1e7729ec ("drm/amdgpu: fix start
> > calculation in amdgpu_vram_mgr_new")" and another one is going to be
> > reverted from the drm tree as well.
> >=20
> > It's just that -fixes patches where faster than -next patches. =20
>=20
> Here we are a week later, -rc7 has been released and as far as I can
> tell (though I may have missed it), this is still a problem :-(
>=20
> I am still reverting 925b6e59138c (which is now in Linus' tree).

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/iz8zI2QfuiEyLtX1sFCVOPA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLgqQwACgkQAVBC80lX
0GyVWgf9GwEX6bHLApvSCJDTXCThI/pRHsnhuWITnGzfjAB8P13nwYpCxYtGxaY2
BFoIIp+NsVqDyiN67mEqZLSX0nOYce5RJA65le0yUeIQt4lmjT+8x/xy4a7fpEIv
ELvxfvNMpYJDwW/8ZLjc4cm3UEhaYEKIJunYZs9+mVbSTuAVakt0tpvOnZMAUowM
8bXTbV+B3sa7MQr+Sy8hdIv2L2F8SefQhu/4jsVH6N3oecg6wT67Bo8xRnIW/qVJ
pIlmII/5aViLcYygcPY6x2ZkLzHVJEgj9tYDdX+fvZHlUdCLEKefvXFOzJ12nMrb
EiUUVrfmDgyyhglqcsuuskIsbN6dxQ==
=RG5S
-----END PGP SIGNATURE-----

--Sig_/iz8zI2QfuiEyLtX1sFCVOPA--
