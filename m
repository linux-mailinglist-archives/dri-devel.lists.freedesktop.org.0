Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49402B75B0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 06:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02FE6E2E6;
	Wed, 18 Nov 2020 05:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6936E051;
 Wed, 18 Nov 2020 05:23:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbWSR2yBhz9sPB;
 Wed, 18 Nov 2020 16:23:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1605677032;
 bh=THPO9V2L7dvdAS9jHEYn7yEsc51znokxsc0KkAwqhw0=;
 h=Date:From:To:Cc:Subject:From;
 b=dvRlHy7q8O5Pj4seBQItGAsnyFR8dOGrVgfMw50c/WAxeE8rrrmrPuV7hmnt+geHl
 e0Kl+Av4sbPaTLXYaFgvCk9YpAhNV+emUIOgWMFhCiZMPOAjHfu4Kf59lJnws6xGPp
 SZsM64HyaO2C78y+FkUlelLyoflksWfRqstB+rQRftRxVx7J4GMONymnDd0Tfu0vFU
 E/xSAdgNzZQpAwJPpby7wI6VDYAbgqjxwIXTj8kLbqx5lesj87mnGX+/LZjryZjRez
 fOaOnbXFQl1bAygmsMQglAZOwIh8BcIXPYdfqCjNnVXx71SOxiQVs+PytcWjuYyzZB
 ayLuUHh+hQiEw==
Date: Wed, 18 Nov 2020 16:23:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20201118162346.07d3eac5@canb.auug.org.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1563376830=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1563376830==
Content-Type: multipart/signed; boundary="Sig_/m0q5U3u7THfVFLV3lrjVY3f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m0q5U3u7THfVFLV3lrjVY3f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/todo.rst:302: WARNING: Unexpected indentation.
Documentation/gpu/todo.rst:303: WARNING: Block quote ends without a blank l=
ine; unexpected unindent.

Introduced by commit

  39aead8373b3 ("fbcon: Disable accelerated scrolling")

--=20
Cheers,
Stephen Rothwell

--Sig_/m0q5U3u7THfVFLV3lrjVY3f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0r+IACgkQAVBC80lX
0Gyeawf9EEBzE8xJd5LmAY8ZjRGrsccS4pRUkZVhhNjK15y6lvSlX7L89g4RCffk
GCA/NuLEhh4wts6JlgNQnvr5jUKCxtN8pOW32W5JmNYjZxw7xUqzNjIpOEYHjfdx
H9wnESAeQUTrekJXTtj/3zXSl8+fbubmkdqFzk6LixwNnSGQ1g6LNxn0ASCwZa6D
LiFIjM9uj6tiSrUcbX//TTnJKfuxXYxW8h4lSfZtXynyqSUCyPb2QgiNv1AGf0b2
zsk06ywVi970oh0F/w9OuYKDJkwp+Y7Mrjtr12nqd3xYxsHDLzm51fzTdM9EzwdD
C4t2nWa5tr23+jNCRWHRx7rRCr0AUg==
=N+fA
-----END PGP SIGNATURE-----

--Sig_/m0q5U3u7THfVFLV3lrjVY3f--

--===============1563376830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1563376830==--
