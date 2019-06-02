Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36E32587
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 00:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947D289219;
	Sun,  2 Jun 2019 22:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170A789219;
 Sun,  2 Jun 2019 22:20:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45HCLt6QTJz9s4V;
 Mon,  3 Jun 2019 08:20:53 +1000 (AEST)
Date: Mon, 3 Jun 2019 08:20:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: unable to fetch the drm-intel-fixes tree
Message-ID: <20190603082051.273a014c@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1559514056;
 bh=wTdYZ6QQsl/ZBjigzg21CbLkrvMORg6/09w4BHo4vmk=;
 h=Date:From:To:Cc:Subject:From;
 b=pcV0gcQc5rgsOqLva+zbsq+h4LGY5mRBs7Fq2Le0oEjUpqKKFXFBGw0ipMTig1+JP
 QMalwNmB0GlH2lwEQrX9fYyXGRdwPksaeoIgujrvzAkMdDHgh3hErboDdkVgwOsdlE
 kuITZ/h9PI4PhYwMHnZ6gaa2sRq2iJfjZRHLrg9nVBxHwf8BSo4JvKxJpsQVDngcJJ
 9djmV9jXqzQZWkxJQFR17kHqYsd2QsG2IfrCE1G9bXw7CNppM8S/aceSEwm/Y9KxjY
 ZmR6WL/OFatzSCBarvjvhvDnODktchcr/N4LXMXXaqsZGB8psS0o9iQeDOJN63ezFy
 R+X4CZ06dwBCg==
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
Content-Type: multipart/mixed; boundary="===============0362050316=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0362050316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1_9rLO0/J=YT2o1Opl+PJ50"; protocol="application/pgp-signature"

--Sig_/1_9rLO0/J=YT2o1Opl+PJ50
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Trying to fetch the drm-intel-fixes tree today gives me this error:

-----------------------------------------------------------------
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
-----------------------------------------------------------------

The same for drm-misc-fixes, drm-intel and drm-misc.  These are all
hosted on git://anongit.freedesktop.org/ .

--=20
Cheers,
Stephen Rothwell

--Sig_/1_9rLO0/J=YT2o1Opl+PJ50
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz0S8MACgkQAVBC80lX
0Gz3UQf9E0cKzaW8f5StW3DTvDdZiWjw1QyXRHKf8WQoEXoPZwtJ+0sJ64rdgg5N
5ohpavRBGdD3FScFgbbCQw5O1Sq2yUVp328M+Er7LgqYrjr0CVrdRWnETC/Opujq
7/Vpq33iyAqSsNH00H0cdU9Rj0CaTcQE1K2OlYmZucqXPldsT2UWTli3+SufoiUL
ygs4VwVjBfld47TKB+xJF/ucl6b5egXv+Wnk5QR42FwkKSdFyLXxeVLnyZ60LerE
583IymIdHjMOlg4j8iZ3vZw6mpbGKveoGo1FNh5O9ziNgqXXP2H69EyfAWyirvU3
5rXk2jci4jM9RCzU6bxf4JtV9gFYbQ==
=leUS
-----END PGP SIGNATURE-----

--Sig_/1_9rLO0/J=YT2o1Opl+PJ50--

--===============0362050316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0362050316==--
