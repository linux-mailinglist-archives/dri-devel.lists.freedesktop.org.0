Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD7123734
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 21:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448226E117;
	Tue, 17 Dec 2019 20:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 156624 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2019 20:22:11 UTC
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79ED6E117;
 Tue, 17 Dec 2019 20:22:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47cqLP4KnCz9sR4;
 Wed, 18 Dec 2019 07:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1576614128;
 bh=HNE5QHDUpxYl9Gzpb/l907YVIFjvEkK/+MtEopkr4DA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rv6PmcXHfNhTSM8MDTyYiTm/oeNrBYgP6Y96EF/L825FjFNR52ZF2cF7QHb2ATXce
 SMhAj85MStFfrhdi6xUfYjth0bBc/USrqLnDXEODzD7AFCYRgPre9kar4oW/Z21d0S
 wS2InJKRaDB3x0yuEYoQHy+i9VBRw/pG219TntpTFxpVfGhKCxAoL0xWQUMD85qDDE
 V6X7Q8e2aQq3MuD/MxIymsXlzeUuaT4tYTXQFmbRNMIo9W8rXtqSFPAaST1xuZkTM2
 Xgf6d4Pl35ZYFoc0dhssM1cf7wts60hsYV1whyHkl15lCCTtQIEUY8JQfrRzlM7VJC
 ujSQIxs1cyFYA==
Date: Wed, 18 Dec 2019 07:22:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191218072204.06ca0cd9@canb.auug.org.au>
In-Reply-To: <20191217131937.GZ624164@phenom.ffwll.local>
References: <20191216122331.43c766f1@canb.auug.org.au>
 <20191217131937.GZ624164@phenom.ffwll.local>
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
Cc: Wolfram Sang <wsa@the-dreams.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0169934669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0169934669==
Content-Type: multipart/signed; boundary="Sig_/qP.7snxCKhckK3Gxq8N8hHT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qP.7snxCKhckK3Gxq8N8hHT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 17 Dec 2019 14:19:37 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Dec 16, 2019 at 12:23:31PM +1100, Stephen Rothwell wrote:
> >=20
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c: In function 'anx634=
5_i2c_probe':
> > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:30: error: impli=
cit declaration of function 'i2c_new_dummy' [-Werror=3Dimplicit-function-de=
claration]
> >   738 |    anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
> >       |                              ^~~~~~~~~~~~~
> > drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:738:28: warning: ass=
ignment to 'struct i2c_client *' from 'int' makes pointer from integer with=
out a cast [-Wint-conversion]
> >   738 |    anx6345->i2c_clients[i] =3D i2c_new_dummy(client->adapter,
> >       |                            ^
> >=20
> > Caused by commit
> >=20
> >   6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> >=20
> > interacting with commit
> >=20
> >   2c2f00ab1641 ("i2c: remove i2c_new_dummy() API")
> >=20
> > From Linus' tree.
> >=20
> > I have applied the following fix up patch for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 16 Dec 2019 12:11:19 +1100
> > Subject: [PATCH] drm/bridge: fix up for removal of i2c_new_dummy()
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> =20
>=20
> Thanks pulled into drm-next since I just processed the first drm-misc-next
> pull.

Thanks.  For the future, though, merge fixes like this should be part
of the actual merge commit to avoid bisection problems.

--=20
Cheers,
Stephen Rothwell

--Sig_/qP.7snxCKhckK3Gxq8N8hHT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35OOwACgkQAVBC80lX
0GyJpAf/ZAQL39Fy+xbh/QKHNPjpxIBNkCwgsPMRTUIUT/rkDwmYQSHdjFWhOdHH
zG/io4ZNhuqtAjttARJgAVzeT9JBKlCEVFABGRZE6C5VrTRbeCsjN6uU/+jqk0sx
xkBxXz7y/sld8dFFsmJb7NxutkanUeVAGKzhjHMOEwrf33tEaGKWjnODtzc2y1TB
3e62mnjllvYR04jEMJhOLW6HJoFXM5CsXlTUVaQ3vw6P9lPXTSQ7+9q8FkDeQfyc
VbrI9HUJpsjt25Nz+XSPCBoS1sEt79FvpgkxjI7sZDrnmVcyeoZSWetl1aO/GFA/
/NxVcfb1iWbgF4q83MtZq9mwqZRT2A==
=PKb0
-----END PGP SIGNATURE-----

--Sig_/qP.7snxCKhckK3Gxq8N8hHT--

--===============0169934669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0169934669==--
