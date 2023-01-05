Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E1865E3A9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80BE10E633;
	Thu,  5 Jan 2023 03:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3224510E633
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 03:43:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnXPF2gxrz4xyP;
 Thu,  5 Jan 2023 14:43:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672890193;
 bh=SF1Ddp+cBAmNu3gSOhMheGZ/XSSjmtZS8P2QDJJO9ho=;
 h=Date:From:To:Cc:Subject:From;
 b=S41bp0lSyBY9MYHuboiVUTMIh0XLV4A/e5Swxqmha/7FKdk1HGqNsnTdEGdXqs0oN
 Fe9nTL1M6GWNL3ccbl5jQf3kQ1aYJsQaKwF3J7j+TOo3EuBDXCHHa82pkHiu3+3fHF
 L68uBvH2V1J8NozFzWEVRdx4joIluWGfLT1WQV83DqMEVLISc6HWzlKKLbkc0vYNmH
 wBRKKXr0ItnoWtll7hVUEIb1j23aYyvNs98CiRQAVpAgctQ017NlleaAmwAK7tOxat
 +D2/TXdarYrBJgk3PiZMW9Kf7koqt1LbGuxt8610MH1a/SZa00U/lcaYvGIcp5ValZ
 C8WVtFdGmRHTQ==
Date: Thu, 5 Jan 2023 14:43:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20230105144312.134c1a2b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cJ7GIzfJS9rBbHyKuppnsI6";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/cJ7GIzfJS9rBbHyKuppnsI6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

include/drm/drm_connector.h:203: warning: Enum value 'DRM_MODE_TV_MODE_MAX'=
 not described in enum 'drm_connector_tv_mode'

Introduced by commit

  7d63cd8526f1 ("drm/connector: Add TV standard property")

--=20
Cheers,
Stephen Rothwell

--Sig_/cJ7GIzfJS9rBbHyKuppnsI6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO2R1AACgkQAVBC80lX
0Gww0Qf+IEwBjeCqub9TegkYFs7u13s52ut6T4Sz7SbOGvNYMbJNnmmLNqsKYYa7
SR6/mAlzxVLKVS+S2y0Yw7JaJpJb15HhyY2BX09mKgn8bCKyDc5pswfmlsoekWgs
muCFIwCZG08jYBNF2wkzZRtUursAv4KFYG3uJc3IkQWqjILbXTONAOfyl983JxPq
PgP0/OjyzNJenFDvyHJgg98g+lCn0D6lqJbkS5n4dB5zOBMeP5d6m7Vr9W7pXQYk
nTyyRKrkUP1wqj6/ChI03lZ1U0R0MYFDRrQdrD7KTAPCwwVzQPZfZF5eI34dckn4
PorljVjpkZ2pMaTsZadqF3JSgi8rHA==
=lSJU
-----END PGP SIGNATURE-----

--Sig_/cJ7GIzfJS9rBbHyKuppnsI6--
