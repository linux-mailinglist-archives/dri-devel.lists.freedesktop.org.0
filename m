Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E02810717
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 01:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060EC10E22C;
	Wed, 13 Dec 2023 00:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28CF10E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 00:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1702429137;
 bh=KcEqEn+eIG9TyLxj3OVh5E9T+Hs/nxFado6LxKaKrPQ=;
 h=Date:From:To:Cc:Subject:From;
 b=WKCLTH0HtmkVLSur7gjjjqAm5L8veTQ1vcKsOcOIBpyZynJwpqNeonzymS2vNtLm0
 DfjvF18d+jsdHMQQ7yUWjgk9bmWDn8MG8EDyoD1Gy4k7tF+04F6fBKIk7fb6CyyodQ
 2R2LN6LBpuETe87+Fl7Jz143Ed+BiToHXzEkWhxhXwsVYOHPh6CFWnsnRBpVefno8g
 hn+W55zY5nFP+/BQ0NFHo6X2oygcRummYKPK4WIsCFymp2bvbUiKIBePVpon3gOzu7
 ul5D6rBFZKdVeGkUZWfxMQxhK9HMl29lSbXoWJhj3ylsQhVT75CJoT/L7ROsQmhzNp
 q+PhAzzpnQzPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqcYr2wCXz4wb1;
 Wed, 13 Dec 2023 11:58:56 +1100 (AEDT)
Date: Wed, 13 Dec 2023 11:58:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the fbdev tree with the drm tree
Message-ID: <20231213115855.561eb665@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dzRJDCs.Qr4lbbREaDsnb0F";
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/dzRJDCs.Qr4lbbREaDsnb0F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/vermilion/vermilion.c

between commit:

  76f92201b821 ("fbdev: Push pgprot_decrypted() into mmap implementations")

from the drm tree and commit:

  d8a47ee16884 ("fbdev: Remove support for Carillo Ranch driver")

from the fbdev tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/dzRJDCs.Qr4lbbREaDsnb0F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV5Ac8ACgkQAVBC80lX
0GyqyAf/SwpnR7NZupcNT8Vq8VYWkt96reqewgclKlkqI6dwoCp9RFu+44jrKJBz
akVfNlJS0mIRyR85j0E9BsikCqZ8Y/a3KJaZ7zJNP8bCEc+1GiG92EAiJgBLq21r
0lsoUUhddX6+e3A3sxfB3TXkUAmuL2GTaXEfosI7wt36D9snHXboQlo81/zTNapj
beXF6P9aM6TuRXjD64mkzS0GkfM3DvHSuxp65DQqH16KyQzUS+7aWuWQjlRbiqo0
VAgbTDkAGJPP37cbD31C5Iy5ke2NRxs88WmK+YNueZnNqfd6CNFDGCfHUM7Z6ZSF
g1YnvnEjTCfOVi5pLLaWzcEbUaxtSg==
=O0pK
-----END PGP SIGNATURE-----

--Sig_/dzRJDCs.Qr4lbbREaDsnb0F--
