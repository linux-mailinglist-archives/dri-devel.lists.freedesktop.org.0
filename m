Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0526092A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 06:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB5F6E117;
	Tue,  8 Sep 2020 04:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4D56E117;
 Tue,  8 Sep 2020 04:00:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Blryw3lfYz9sSP;
 Tue,  8 Sep 2020 14:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1599537629;
 bh=lX+lFzaomXR3T5BNsGpelGARr9NU3vJkQfKKiQ3vhfo=;
 h=Date:From:To:Cc:Subject:From;
 b=OnTn3YI/noqm0XeiRNjqDqsf27QSFchpoFOwYNoKV5Eln0f4Xg46WXR9m4LQFxXSq
 y18VBCHxYmAbMFCbbrVFeP30hQtx/kEDT3WNg4BUeUM0em/LkskRDYwrVfumXzQ/w/
 h6ezb6t0N5kEtiwMyYqnfFSiffQHE7GKi9rPZQBAE8gAItZd+71Q8rGTLTxoL+kdOG
 BvXO/VMr0xmmGnwlUfVYjk3nr7UPOgC77+dsm34C5mmwbGDrHsjdT9oELMy98qniqZ
 9kty7X/fjrRhkTFO8tOXoVkaB9Tjlpw8q7DKyJtV9fjv0L7vxOdJA9MpBBp8w3nfjp
 aLV37DoAM5L2A==
Date: Tue, 8 Sep 2020 14:00:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20200908140022.67dd3801@canb.auug.org.au>
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
Cc: Guru Das Srinagesh <gurus@codeaurora.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: multipart/mixed; boundary="===============0158620330=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0158620330==
Content-Type: multipart/signed; boundary="Sig_/h0m8vAjcwPu32aOQXEmjVLl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h0m8vAjcwPu32aOQXEmjVLl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_panel.c

between commit:

  f8bd54d21904 ("drm/i915: panel: Use atomic PWM API for devs with an exter=
nal PWM controller")

from Linus' tree and commit:

  6b51e7d23aa8 ("drm/i915: panel: Honor the VBT PWM frequency for devs with=
 an external PWM controller")

from the drm-intel tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/h0m8vAjcwPu32aOQXEmjVLl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XAdYACgkQAVBC80lX
0GyqvQf8Cn9ZF8yqil/uPRy79nIaruZ5rShO6tXxLcj2/g03Eyk3zsCcaV9Vs00N
2MVGydDPI4xh40OjIrPKuhbHjvqwosg9TQQ6g0q8VIv/e1tE62qP3Dst3VWYIHhl
t3TgfrLfzqMKoLgUrcyqbUmZ2/E+iH538sLZbm2UdqJNVT311IgNSMMVtdYbfn+Q
5w5LGYltB74C0ai55NDMw8Hl4/uqeXIDMqdy3C4Ul7R1wE83hD7s2j9F59vx0AAo
RbNIupYaBxVQMwqev3TsrRO7tPJvEDBB1fH+UZsD3YyTG7ZqyTRL+EYdPi/YC176
b5FtRP4/npzO3KXZ0FafbxtzNWUu5w==
=pB//
-----END PGP SIGNATURE-----

--Sig_/h0m8vAjcwPu32aOQXEmjVLl--

--===============0158620330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0158620330==--
