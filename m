Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D996CF991
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 05:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A2810ECB3;
	Thu, 30 Mar 2023 03:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 103569 seconds by postgrey-1.36 at gabe;
 Thu, 30 Mar 2023 03:28:26 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E63210ECB3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 03:28:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pn85J4Q6nz4whh;
 Thu, 30 Mar 2023 14:28:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1680146901;
 bh=yUhZNgkn5eV0Ur1aC/2fo4WMW7FvsdeGN/s4ulLNmuQ=;
 h=Date:From:To:Cc:Subject:From;
 b=ScOs66Kpn9gmT6y4QXJl4J8jPe9G2bh/5r0o8QNK4hiusxcLC6zQDl3OPl0++/7Yz
 Mwt9qoa2Hgm6mwWLHeB0XRiNSQU9i5zqUoeMPZ/Jtop5KVArwk7sAzm+XwiFGt3M5t
 Q6rffQiNgpy81H17Htm1gRqkuzeEEzdALA/pNZ0OF+Qngkac1WAa10x4WTWWFdlPi1
 5HSB8uIHRshfEZ0JnS7aRA/bMcGOne6TJcrjapaINg0Fsh58gCU51MBZXW7/85h+Mb
 ovE5VTD3ZnjKsOOkTZP1CemgY7TgwauBfU4jh4o2CNJMksBfvB3tjSEzFTW6yImB2/
 ChdjKG4EGgPJA==
Date: Thu, 30 Mar 2023 14:28:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20230330142818.7efb6d05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uV74ZoVXfihRgGftLI6mCY8";
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
Cc: Rob Clark <robdclark@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uV74ZoVXfihRgGftLI6mCY8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'n=
um_fences' not described in 'sync_file_info'

Revealed by commit

  d71c11cc79d2 ("dma-buf/sync_file: Surface sync-file uABI")

Introduced by commit

  2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")

in 2016.

--=20
Cheers,
Stephen Rothwell

--Sig_/uV74ZoVXfihRgGftLI6mCY8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQlAdIACgkQAVBC80lX
0GxLKAgAhY+x2b23WFikyQa/VmcvBT3Akt8K2AnHpi/1OEaE/JEBnT88uxPK8uYS
XQJ/VALbugRZ5XsDnyRuAIyxlxcM05mpdOF1Z+jE2y1aFpOUmTVjMAuWTdBwn2b/
2NVAJhb+mS+IhlIQAkJvJIaaVDHlu33IhzY2WQf1wBLd9kJ1yVs1PCWpZdYYcO4J
inSriPiQ88E4DqYeo9CR6k+Fv4e40tB+12zJ/5rvUvYfppraE3Q1uDw3iVDJdqH1
mXHaOnM9V1Bt4DP5G8SfelZj1XVj4eSEeZr5hpYGKpB9Y0KkfVDOogguF1hiF3p1
L8t3ue2CyVDcJWXU3iP9quv/8AQU6Q==
=t6GX
-----END PGP SIGNATURE-----

--Sig_/uV74ZoVXfihRgGftLI6mCY8--
