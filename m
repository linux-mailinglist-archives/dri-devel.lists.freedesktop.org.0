Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5789670DC4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 00:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67D10E601;
	Tue, 17 Jan 2023 23:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A5D10E5EF;
 Tue, 17 Jan 2023 23:38:03 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NxQLJ0K5Tz4xG5;
 Wed, 18 Jan 2023 10:37:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1673998681;
 bh=6o8f/hsZEwlY53BGqySN9SPEz6PJroAobIGjrinQTSk=;
 h=Date:From:To:Cc:Subject:From;
 b=GdV8R3SkGkXScJGg4DCKpHQ7bfsdlEzxKsNHMpdAqjMBgYr0roTo3fojIUxEQdNOE
 bkWFsMKroeG9QJtw6GiypcKtKam+kmA4iK9rFC5f/MUsnqvN5OdMM8kCFQFPTzDssA
 Pg6gc7yuUQ2Gdhw/YWHxx27ZQOFC71u+foIkGUARKF4cMcnIGoXFuF+8BhZ9YaFrDl
 zsdHCMp3s1MS7flLhjElksxJlgUnRti97ixH7K7xMG6Zn6aeR0+oukIVZBT4GJs3mx
 8kCu3bTyOFRNMOzFJ2nCRwwSvifM0MfpVlezoWRPmwXzCzS681Ot0gJqB8HR2Ectf/
 54/Nsv1A5fExw==
Date: Wed, 18 Jan 2023 10:37:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: duplicate patch in the drm-intel tree
Message-ID: <20230118103758.135fe5a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u7VdDh0MoqRd_0D7xHcYRX3";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/u7VdDh0MoqRd_0D7xHcYRX3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the drm-intel-fixes tree as a different
commit (but the same patch):

  0fe76b198d48 ("drm/i915/display: Check source height is > 0")

this is commit

  8565c502e7c1 ("drm/i915/display: Check source height is > 0")

in the drm-intel-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/u7VdDh0MoqRd_0D7xHcYRX3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPHMVYACgkQAVBC80lX
0GyaAgf/dTYHcQK7vqkDT+y1zjCMVNrhHHQGIA7yZHREcvu/i1dtVJn6myl2zIwb
pMumbJmbC4dImXlxx8eVgXHJuEZDDW6wd9itn772o44YAPFmg2H+pGG8Evnvo/d/
n+1Coj1asHT2nceuTDsEZV/FZfoY0Ghtr0XMpSPZOrprtbc7nCEHvJMULRDn0XvT
TdfD0GSx/ntPWlAYsPTx4o0igTNRYvMfiJQ8C8i0CryKIqf5V6RuRJRUBDSW6vQf
jV0VK2Vg1YBb074rIosLRuA5MDvBg6qw3sBcfOChTk3lIlXaFfLjeu9ndAy2ixFy
kph8iZv0fmq/GBmJ3ZfGpeGv7+AroQ==
=E1Ip
-----END PGP SIGNATURE-----

--Sig_/u7VdDh0MoqRd_0D7xHcYRX3--
