Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C72A22CE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 02:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B266E213;
	Mon,  2 Nov 2020 01:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99B26E20B;
 Mon,  2 Nov 2020 01:46:41 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CPbPB2W86z9sVM;
 Mon,  2 Nov 2020 12:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604281599;
 bh=oQFsCoiE8U94TPw5QxzXe6ZcHl/6J4ak2cxPP2CA0pg=;
 h=Date:From:To:Cc:Subject:From;
 b=FiUEa3I4OCfkHiK6+0eyi4cFeTddu+zRsl8/gWChE+lh01UQrDo9yFhsjZMyCLYQX
 csNUDtExjI5WZIArq9ycfx/bRzkLFwpbopMJWCRFLP3jsApJqM5syaJMD1ZFEq5kHQ
 vPZ/Rs8BK+Bu/SYujq2Jnp6GDI+XR9OR5DWY6qmUmZHb7m9nK8oXa5NtV9UoRDixqG
 +P/py18z90saDh9dxw+OyQkwsdqtXcsV1NDhoifnJW/0AjURN+kwzvtef0Ef3AyOk/
 tSvjS0xCei7fnNOT44vUQXk1mY0UP27apQVgE49gd5OuPd8fnsD0YH516jT0Kx1XoR
 8LgUeOHRmRlOA==
Date: Mon, 2 Nov 2020 12:46:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20201102124637.1e846861@canb.auug.org.au>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============1399193032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1399193032==
Content-Type: multipart/signed; boundary="Sig_/Pm3yuwARsKf/T8Ex=wJggVw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pm3yuwARsKf/T8Ex=wJggVw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-drm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_close':
drivers/gpu/drm/panfrost/panfrost_job.c:617:28: warning: unused variable 'j=
s' [-Wunused-variable]
  617 |  struct panfrost_job_slot *js =3D pfdev->js;
      |                            ^~

Introduced by commit

  a17d609e3e21 ("drm/panfrost: Don't corrupt the queue mutex on open/close")

--=20
Cheers,
Stephen Rothwell

--Sig_/Pm3yuwARsKf/T8Ex=wJggVw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+fZP0ACgkQAVBC80lX
0GylaAf+JKje30rm2zVTrjXc4tUoNnjahQ81iOA94KdpwWzX53618rPY9VgFGaXY
39U2CC+rEfcPsUgmu57TPTa0CVBb10HfQPRhrD8RSi+jqoQ3MXQWTt0mLCe/nMPN
+CKjYwVUcN0JCoKXVYWzYm9wLZPHzA0I4QfC63okiqoVEYT0HA1bItUse78jCjmf
yYUCwWNzkgPgvQZsGm8aJdzsSIj86sKL8Q9FlT+rsosNzwP8bWwXeuCZA+bqqpde
sE+8e+2+pqkQNqQOiUzIhWJEzEtS+010/C8B8oWZKsHJOxGjgD8DtuJHsFtUJvpo
HAGADilhPByfycb3qEoPOOt/N41Yzw==
=W0fQ
-----END PGP SIGNATURE-----

--Sig_/Pm3yuwARsKf/T8Ex=wJggVw--

--===============1399193032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1399193032==--
