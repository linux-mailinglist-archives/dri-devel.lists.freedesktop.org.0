Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE4C2E624
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 00:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900710E4E8;
	Mon,  3 Nov 2025 23:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l8xhgtgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E1010E4E8;
 Mon,  3 Nov 2025 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762211521;
 bh=XNRomfW0zgB/0q6mq82N3Pb1lEyE73NfoDam92XZBJw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l8xhgtgLf/mSn/0cjZz9ESGrXdbbtl5Cgg7E5NZpDYcC47R+dg5klF57Au5twqOms
 p4+PNg4G8R9r9bqOL0EQnGnggzSJkAwqrVKDVWDXnI3M7M7mHIOchoo8XljOcEzEWT
 LNUwILCu0zL8/KedfOFiDmhmDq0ZiHii8HpBnUgu/RLXSHJ4mx9/PleOvG6FUikTKE
 6ZlTMJuCr4Z5Q4Nusiljk+tSjfypxNPPJcUQYTGfug0VhSN5zcjSv7FPOarTVKAi0C
 kLRDAD3K5m9XqiZ3siqZcbCU5SqCbwBgulljEUa30B2slCZXv9/uEBmhESwcW7/Jw9
 xRE7v4STOjOOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d0nR36VqKz4w2S;
 Tue, 04 Nov 2025 10:11:59 +1100 (AEDT)
Date: Tue, 4 Nov 2025 10:11:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20251104101158.1cc9abcd@canb.auug.org.au>
In-Reply-To: <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
References: <20251103112418.031b3f8c@canb.auug.org.au>
 <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YnC1+DebVg=JQxovUe.5+3v";
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

--Sig_/YnC1+DebVg=JQxovUe.5+3v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 03 Nov 2025 11:26:01 +0200 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
And now this:

drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_setup_vram':
drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:17: error: implicit declaration =
of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declarat=
ion]
   80 |                 drm_err(dev, "Failed to allocate mmio\n");
      |                 ^~~~~~~
      |                 pr_err
drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_vmbus_probe':
drivers/gpu/drm/hyperv/hyperv_drm_drv.c:140:17: error: implicit declaration=
 of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-decl=
aration]
  140 |                 drm_warn(dev, "Failed to update vram location.\n");
      |                 ^~~~~~~~
      |                 dev_warn
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_plane_atom=
ic_check':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:161:17: error: implicit declara=
tion of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-dec=
laration]
  161 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%=
d (pitch %d) greater than %ld\n",
      |                 ^~~~~~~
      |                 pr_err

I have used the drm-misc tree from next-20251031 again.
--=20
Cheers,
Stephen Rothwell

--Sig_/YnC1+DebVg=JQxovUe.5+3v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkJNr4ACgkQAVBC80lX
0Gz/wAf/Ytv/ek28tbaMISIf8+gVyIPkkFf2ciK+1tHr6rqODuafP+V+Uk+YNBkX
Of9YMBdt3J9PysNXw/nJGyve3WPWVEDBZ8gCy358m3EmCmURkKOrFkIdsOeiZlKJ
T5xf3/C3u+sUnDuumRUmI5sVf1rd4IuuG5Uyl7O0vpBaBqNaMEQJ9wwsAMmGvv1f
UWBuUq5L6HzxiA3URyjq2TCoXr99O/njQAkg0iJUpGOIrdfBpRhhTuU4bAfakKuR
+lD2Jc16LV4sG5MwSQAumnlQbNogDxPtNFEqoibYt0NYKx+xH3XZcI1RxtuYxzXD
mua3AxRBWVSjN827b7kthUOpxaGG6Q==
=Awl1
-----END PGP SIGNATURE-----

--Sig_/YnC1+DebVg=JQxovUe.5+3v--
