Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9D728EC2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 06:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303AD10E0A5;
	Fri,  9 Jun 2023 04:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9FA10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 04:02:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QcnTV3H8Sz4x3k;
 Fri,  9 Jun 2023 14:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1686283327;
 bh=diX6SfjP269khVsruatAUVTVjprO6aCGR+YnLNNnENg=;
 h=Date:From:To:Cc:Subject:From;
 b=AKe4NQWXsqheU02RBdQOrnZ4VsCr6dSqw3fze26DexYQ9l1Rub9Q3DONH1733sTxK
 zXL2DqcUfT/I8Ui4CIYeKUml781r4R5mq/BA+R2vbNBki8NB6pruAP0rhl5SVVTWsD
 34zxbs56SUG4y3DzLvIguYuNBo2lwbjavgL7INiub+SHcukjoJlI6nvZGvSasB/bAD
 dDHLpORbefdxfAODf8GIoxF6ITwYjIZ1fXcpduja/m8iL4Wgn4QaSutX5rSeyPIGFp
 8PWtgCEg3msKwO7kzrnjkeBYj2LlxTh5hoRPYPRbpw7o17hMLZCEP5ULmB0yWsgbb/
 4l2jTzsPU7m6w==
Date: Fri, 9 Jun 2023 14:02:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20230609140204.79af860f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xnYH6qSVQ2wyx8+F8+tGP/M";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xnYH6qSVQ2wyx8+F8+tGP/M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_connector.c:2215: warning: Function parameter or member=
 'supported_colorspaces' not described in 'drm_mode_create_hdmi_colorspace_=
property'
drivers/gpu/drm/drm_connector.c:2239: warning: Function parameter or member=
 'supported_colorspaces' not described in 'drm_mode_create_dp_colorspace_pr=
operty'

Introduced by commit

  4d1be821b795 ("drm/connector: Allow drivers to pass list of supported col=
orspaces")

--=20
Cheers,
Stephen Rothwell

--Sig_/xnYH6qSVQ2wyx8+F8+tGP/M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSCpDwACgkQAVBC80lX
0Gw/PQf9GdI/8l42AmurWdFjfkjnYDLRl78BKS0D+MF8KCzdqEAskDHdznevFQNb
18KCVxxFFNSBapTvViEWDX19tcSyODMdnqB3lq4++ikB/9rdxsStjJqWcbdlxK2z
BESDANoMs58G3qLrgKQtwHqxMukJ6LHNTRnBRiLM4BPvQ4gLFCODu0RyqFoPkeAe
j04uFf2SR73MXbTLIwiWNMhTXpbnlAvXV5GUBI+QdVkM/mIJmsOSJGlBd1Jtgftc
FtueSOjbjhZIYwUcx5vs7mOaou+KGIX6n1vO8SE0VarC/8grn9AqS/5/s9R9Us6N
q7yc2T7Nsk0bmBjYrEYnMTyIi5llvQ==
=aKfS
-----END PGP SIGNATURE-----

--Sig_/xnYH6qSVQ2wyx8+F8+tGP/M--
