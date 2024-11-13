Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E80AB9C6955
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 07:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A0A10E684;
	Wed, 13 Nov 2024 06:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LBjR4DNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2810E261;
 Wed, 13 Nov 2024 06:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1731479619;
 bh=ygUXM9cyet0rOB7Ae8SPe/FAe67XouoFd1A9KN8VhFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LBjR4DNQ26MEoHy9VbkBURZir4obe0otR8txLnT/CaIaxhqKzg2fExa4OByRaQAIo
 Txgk5kBo/docNDW2qjePZ9TNdIZAqEwaRh+WGMGHabok7qlY1bsxpb6nHtL2Hmaojm
 aFhaF9s0p1RtDGc9rDxWuMr6pwgIiqVwItYhTMRGFuH7Pr2t/67mbHLHV5jbnn6sVC
 vQn+U7puqSlfqP68sSfNUCF+TFb0256uDV7o5Q/h7jXeYYGF/beMHPrdpjENhn9avy
 xIgi6kY7Gs34ATVtPYN5yiJzhdGnP/3Qup20PEXmfvqA/dUGd/AgcwgJMRFWHb5wIV
 D1pBUo0Yyqn+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpD4y4f7bz4wc3;
 Wed, 13 Nov 2024 17:33:38 +1100 (AEDT)
Date: Wed, 13 Nov 2024 17:33:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Philipp Stanner
 <pstanner@redhat.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241113173340.345a196e@canb.auug.org.au>
In-Reply-To: <20241108175655.6d3fcfb7@canb.auug.org.au>
References: <20241108175655.6d3fcfb7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q7TG3z8kTKztApVEjDuHvF=";
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

--Sig_/q7TG3z8kTKztApVEjDuHvF=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 Nov 2024 17:56:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/gpu/drm-mm:571: drivers/gpu/drm/scheduler/sched_main.c:1359=
: ERROR: Unexpected indentation.
>=20
> Introduced by commit
>=20
>   baf4afc58314 ("drm/sched: Improve teardown documentation")

I am still seeing this warning (now in the drm tree)

--=20
Cheers,
Stephen Rothwell

--Sig_/q7TG3z8kTKztApVEjDuHvF=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0SEQACgkQAVBC80lX
0GxDNgf/THbv3cMa7n0KQ39opRw5GvltAffCB8zEM4unatKuWQcaYn+BgvVPUM4F
I32JGSduDqXPlUVlSGJmYPClmCzIHOub7vwbnE85d1UvcwfBO22FY5+TenCPjbZD
QtEEpOGYDQlgzcM9m9JqaQPjso0hpXswCfmmyf95UGyFRn/CXT0R4kXoWxVEKeUF
EWJci4iiWveDwvIWeIIYOnYM/FnoIWxDobuX1KGjDsO/7wfbpU9VzdnGb0jrw0eu
i05/QLAoOlpwpuPnsZT7Zlil4uwIh5jZLKCEoTwF8cNPeKHviNNigT3YInJqi4n/
NUhK/E0PAQ1pBkyraaSjDcBHo/5XGg==
=INO/
-----END PGP SIGNATURE-----

--Sig_/q7TG3z8kTKztApVEjDuHvF=--
