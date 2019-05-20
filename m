Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218323355
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 14:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441398916F;
	Mon, 20 May 2019 12:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578DA8916F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 12:15:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 456yXd5b41z9sDn;
 Mon, 20 May 2019 22:15:45 +1000 (AEST)
Date: Mon, 20 May 2019 22:15:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: Fixes tag needs some work in the drm-intel tree
Message-ID: <20190520221526.0e103916@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558354548;
 bh=ETBmQ+Y+GyGiALkiX0vj+AzC1DdCK5qfZ1pG+ZVbdpo=;
 h=Date:From:To:Cc:Subject:From;
 b=mumQlepsUvLMzAtjAm0I8cqlF/WYBi67C4W3B8zJjHcy+EvQ0OYqJMzBe6oEayh9z
 QW7ggmBIl5Tpi0T8cHMjqioPUcFB+LkKfNfUgy9ZW0cBuUBODEWWS14sgs8ZPdgVa9
 P9oJ1ldnszoOiB9jiwLroNmB0yY1ce5IgJqiXaBqCpfuXi0N3S1kcIZ10Xjlc/5cg2
 4aaaSJ4PJw81As14pe0Dwtw5Peaw8fsdqD8EwUZxO5N+XQYq22SS6asfgHkA+eHNJA
 SKzpYH+Tmnyp1+xOuZgnoNwSLtHzUec2kO+iCFXUT79WuTRnxAJMQqcWZdR6Wa//8U
 LjcgFReypfV7w==
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
Content-Type: multipart/mixed; boundary="===============0748962392=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0748962392==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/93.yJMrxB2DtnwT3NNY0Pe4"; protocol="application/pgp-signature"

--Sig_/93.yJMrxB2DtnwT3NNY0Pe4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0d90ccb70211 ("drm/i915: Delay semaphore submission until the start of th=
e signaler")

Fixes tag

  Fixes: e88619646971 ("drm/i915: Use HW semaphores for inter-engine synchr=
oni

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please don't split Fixes tags across more than one line.



--=20
Cheers,
Stephen Rothwell

--Sig_/93.yJMrxB2DtnwT3NNY0Pe4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzimmoACgkQAVBC80lX
0GxWzwf+JJpeqte4AZNmzAlqyodr2d/yBI5DD7IxonPDxwoD/Ilm+eMpi0WIpLe7
ZES0519Y1Q9WOZXLZyjwLcRyxXMZjBdCjtFsEqBXN76kv75lycG+36jLMRETIf/I
oJ6cfDd1XPgvY08HvBvexcO9hfABtSWhOuOcN/h8AJBf8YG1nt2fTF4KERXQDLpw
nvqwKEmaM3y/s8LTUx0oJnQxCUFrfRE1yq4S2M0Ga99Bho84Qvh+wo7I3EMa1HnG
oOIo3vShLHmNoK4buX5kfqRJhgs/Cqn6P83KQvDcoUjJagEsuSnAqeUMO5y90jmZ
I1E7mYfhYZpsnDyYGm5Q/srqj9PDjw==
=vD+z
-----END PGP SIGNATURE-----

--Sig_/93.yJMrxB2DtnwT3NNY0Pe4--

--===============0748962392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0748962392==--
