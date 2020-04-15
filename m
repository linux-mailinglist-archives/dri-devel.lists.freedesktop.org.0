Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A51A90A4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 03:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87A86E81E;
	Wed, 15 Apr 2020 01:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9926E81E;
 Wed, 15 Apr 2020 01:52:08 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49252G1V8jz9s71;
 Wed, 15 Apr 2020 11:52:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1586915526;
 bh=fV1TG65RHgW5mIIIywIzh+2jkntYkoQhdhBIuj+ePD0=;
 h=Date:From:To:Cc:Subject:From;
 b=FUUAvjfwRzKEGTbuUm4Y1r7k7qnFRNUM2MLeVhoodY3Ji61ZSmq6NwbBmJW8G99ap
 M+9fugTMZoHdjjTBdES84Gthquced4zaLFGk9TbkqpMoJnjdTWRvlMVEycVcPc08ju
 QDYtjX3BOHNa3k/gCmFhKhDZN2aQnFsd+WnqsSHAlGL6hToPU8cyJR7DYkEnZ4i3Wu
 6Ve3qH3UDtLPHqT4eXewLm1MD7aEhRNiPIj+D+rpnPXjzYbBlQo6sIl9wH3fVmI5R7
 rMlnwRYpDkFf2/WE1Na/ro0hL2n1AyX8kzzHkDmomMRMyjwz/wI9PyjZj0TReKawN1
 3pIUwlmDtnMGA==
Date: Wed, 15 Apr 2020 11:52:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel tree
Message-ID: <20200415115204.4929f663@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============1736454841=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1736454841==
Content-Type: multipart/signed; boundary="Sig_/hn/Ojf3YwBFqzq4+MhBG6XU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hn/Ojf3YwBFqzq4+MhBG6XU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  743acd115070 ("drm/i915: Get rid of silly void* from MST code")

from the drm-intel tree and commit:

  20c22ad32957 ("drm/dp_mst: Remove drm_dp_mst_has_audio()")

from the drm-misc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/hn/Ojf3YwBFqzq4+MhBG6XU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WaMQACgkQAVBC80lX
0GzpcQf8CYjcwn/7zvb9NfTafo2jJWZDi0WdDDL19Jt/R0k+404h9D2DL44+bf1v
8892nWITiUWZmjrnjM/D6J4Q86CVyTVavZ8Fb0rdmxKWBm5EjjZV7//aV4hphYt3
24y37cVvGpxeWvLHlWq7NR5sBs1yRZjzACsw4mKxGuJcVdHD22jJhcPqF09QKTq/
53CJvOc4i/czFo6GwaUoKzpAmYdl0pbrfwglzooNWZBhKZp6HcVogLQ0nmLSKR2B
zd0+Tx69+zThCSfO1ZCo7sr1xn4cCJuXvtqn3cUuV1epxMi0ve/Ty6XCk24XIqmx
TYX+mwcJrKasdiy3kYV6TUsVa+Lo7A==
=mYXD
-----END PGP SIGNATURE-----

--Sig_/hn/Ojf3YwBFqzq4+MhBG6XU--

--===============1736454841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1736454841==--
