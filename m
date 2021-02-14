Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0FF31B312
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 23:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1A66E104;
	Sun, 14 Feb 2021 22:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C146E103;
 Sun, 14 Feb 2021 22:39:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df2GP3p41z9rx8;
 Mon, 15 Feb 2021 09:39:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1613342353;
 bh=VMHVI12n/sYnj/11+gz6BWBErWtIiDEN9XaqwRspFDg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q5UFaagv1VaKmBvQCvXt+ry3l6YMuxH1CffIWUubOAutw4CXE2ZhJdZpDWx0EGEb5
 Texqy0X+K0clqEwC2oDzsCuLGHLiBcxrnaYDzWam7Q0zbg5OJgH4haeQG0Y1l/BnJC
 TOpI0T5NxkLYYaOBSGhXMjMDu4Pxh6ah8JJit2SoIHVOvmLnkXEt/Q5ytuRIhPOLRK
 qZ86Uk9l7Yu8iut7dxfHmp6Vx3uTM5e7+mpBrQlL3d8PIloxLA0N9DhUERpjz9DVH3
 ak6nxqeZGLgiH5Pp9DPWP1K+NY5uedchMD9ahmdr+u09FSA3oHIfeT8vhWxT+AHaTg
 Y2qJ0/FyXk0DQ==
Date: Mon, 15 Feb 2021 09:39:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <mark.gross@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
Message-ID: <20210215093908.06e349bf@canb.auug.org.au>
In-Reply-To: <20210204155846.5aef94a8@canb.auug.org.au>
References: <20210204155846.5aef94a8@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1054593303=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1054593303==
Content-Type: multipart/signed; boundary="Sig_/fcEgAKpFpYpY8sFQopChY8R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fcEgAKpFpYpY8sFQopChY8R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 4 Feb 2021 15:58:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>=20
>   drivers/gpu/drm/gma500/Kconfig
>   drivers/gpu/drm/gma500/mdfld_device.c
>   drivers/gpu/drm/gma500/mdfld_dsi_output.c
>   drivers/gpu/drm/gma500/mdfld_output.c
>   drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c
>=20
> between commits:
>=20
>   b51035c200bd ("drm/gma500: Remove Medfield support")

Now

  e1da811218d2 ("drm/gma500: Remove Medfield support")

>   837f23bb4b60 ("drm/gma500: Drop DRM_GMA3600 config option")

Now

  26499e0518a7 ("drm/gma500: Drop DRM_GMA3600 config option")

>=20
> from the drm-misc tree and commit:
>=20
>   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
>   25ded39ad064 ("drm/gma500: Get rid of duplicate NULL checks")
>=20
> from the drivers-x86 tree.
>=20
> I fixed it up (the former removed the text that was updated by the
> latter and removed the last 4 files) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

With the merge window about to open, this is a reminder that this
conflict still exists.

The two drivers-x86 tree commits have also been merged into the pm tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/fcEgAKpFpYpY8sFQopChY8R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAppowACgkQAVBC80lX
0Gxl3wgAhhEyvRY4qiXMEtT4FpGLU1UyQNXQFRtdXb/dKQVXzZZCuqH3Gx5V18i/
mcXC55FKpS2uPSBUdk37HTQTdrhtolvI2CN52jB3afpcVQgIt+g13WkPl1oYil9v
NxvZsMn8RV1Hdy/9ROGxb5I3ASENJsCEpTwzByMU19C3udFB/PGTBSkanYoxuES+
fsrBPbGw9/s6GQWsrC4opfCDE+gUdehkRambSJhWjbAS0MeWdOD6oaqLJp5bZm3A
55AO0txPTZLKfbcW5l/sXCHJz3OUulfLNnih0LlZtvxtPJ8TDwzWmpP2uAeV0ZX0
I/gYSyPFNwwlMmXbToELUic6I6BStA==
=wY4n
-----END PGP SIGNATURE-----

--Sig_/fcEgAKpFpYpY8sFQopChY8R--

--===============1054593303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1054593303==--
