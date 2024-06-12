Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8EA9049DD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 06:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1384710E1A2;
	Wed, 12 Jun 2024 04:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lh6t4AK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190F810E1A2;
 Wed, 12 Jun 2024 04:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1718165473;
 bh=ULpr/3m4ojGt/7RZA+O762TgofoB1Z/E9cgEf7iqBf8=;
 h=Date:From:To:Cc:Subject:From;
 b=lh6t4AK+BH16T3GOiJ5FIMVIIRq6+gpSRiY27IsOI9JdxrA5P/VLk8GrpnHuCSINW
 1aAqrTeOvf8QfASnDjRfE7IPAoYWj+fURP9RuHPb5IPxjU+1U0DI3B+7H3fMA5KI7k
 /8xDoF1Kd3S+kiTDU09JXAdxfxkdtPGUMyqtdYIJlHhLUqmxCtmc+EtfKA6IHHiYTl
 NLDnhsScpMYjz5EpY34Ht8TWGGoylzNP+sviEuCAkQnThaEEcvhR83advxMC7DUotw
 6TcEQ8FxZGMEYdnDTqUcuoy+JyepoVOWEH4iWd+VsuxNcokCmIRRSsYaZJXqSUWaRK
 PD56LwVQUk/pw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzXCh4J2Vz4w2P;
 Wed, 12 Jun 2024 14:11:12 +1000 (AEST)
Date: Wed, 12 Jun 2024 14:11:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240612141110.3aebb166@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK";
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

--Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/display/drm_dp_helper.h:127: warning: Function parameter or str=
uct member 'target_rr_divider' not described in 'drm_dp_as_sdp'

Introduced by commit

  a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS=
 SDP")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZpH94ACgkQAVBC80lX
0GyTlAf8C/fRIVfzIoRZrb+jFqhA08vy0+OmZBJDpnmiOHn4Xz4pRSrwHFi1mvmA
2brDKfqnTSogJwYMJzghZGh4jCml+o+FJHqX6Nv/K3KRfulGx1GIj7CZf5TKxBXC
VRVDhRKJyzPnKm1+ENDdGxX7RWIjDjImybfWiGkSjOzC9/LTXePvXY5zwkPhjUGT
JeGdWddhqybyj+JaHfvvaX0OaYcqWdzgb0zue9oLWv1KdU4iV9SpOSm4yoYYkajv
cFzhq81CcpVfWB13e2RS1Uhwider4C51gTEFBZW8J2crpArOaOUsC7wkF9OqiSyg
l7BmCeqPN64DK3vQkDcvyzsHjYtZcw==
=WYQW
-----END PGP SIGNATURE-----

--Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK--
