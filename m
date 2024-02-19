Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C2859BA5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 06:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59110E0EC;
	Mon, 19 Feb 2024 05:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pljFNpgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2513710E0EC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708320065;
 bh=hEt04/AGgzHfD+OrrEUUfWR48HIiav/LUTl3/xa9n2A=;
 h=Date:From:To:Cc:Subject:From;
 b=pljFNpgMtV+I9v7Jb5MTM0XeS9Evqpp2kL/IULJ8FBAiglQBbD5R1bFaBlHP0UZas
 81OcQMTEy4zB5U6G0dwyWsjPxbV/W0qa082GU6p72pDx5XNXztNSr/2+nNzUuf5azP
 aKq3+AaV6Tn3QqwDfk10hTJ7aTu0gZIVr6gCsJra9PD2/l5mhMSgrcbHtdtc0Y5thg
 O6Z7X3nnXPZLxeDHNWtSSlYmMf1zLlDM5DZhDhjvJfY1nLl0XloASjes0VKWBnME8u
 I9gYK87BBf8MC4WHfgTHQp/dLswcSfb1HMcL1Er+5/nky942NdLdmwqXYMfWpemjLp
 zKonUi6Asn8Jg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TdW8x4LNHz4wxX;
 Mon, 19 Feb 2024 16:21:05 +1100 (AEDT)
Date: Mon, 19 Feb 2024 16:21:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: =?UTF-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>, Tvrtko
 Ursulin <tvrtko.ursulin@intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20240219162104.2843ada2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MaLoh=z.sCLpfxsbm+jRki6";
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

--Sig_/MaLoh=z.sCLpfxsbm+jRki6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

include/uapi/drm/i915_drm.h:3579: warning: Function parameter or struct mem=
ber 'branch' not described in 'drm_i915_query_guc_submission_version'
include/uapi/drm/i915_drm.h:3579: warning: Function parameter or struct mem=
ber 'major' not described in 'drm_i915_query_guc_submission_version'
include/uapi/drm/i915_drm.h:3579: warning: Function parameter or struct mem=
ber 'minor' not described in 'drm_i915_query_guc_submission_version'
include/uapi/drm/i915_drm.h:3579: warning: Function parameter or struct mem=
ber 'patch' not described in 'drm_i915_query_guc_submission_version'

Introduced by commit

  b11236486749 ("drm/i915: Add GuC submission interface version query")

--=20
Cheers,
Stephen Rothwell

--Sig_/MaLoh=z.sCLpfxsbm+jRki6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXS5UAACgkQAVBC80lX
0GzO7AgAh5fGgDN0GGr12V5wLM+o7TyWaLvajulU+jT9kdGhJluiag8ubMpCo160
Q7cX6kNVi6IdAw1AJs9PYbxMg/UHKm4P+5sJNArei8lzUNBD6PvudraZDGFIgtli
6MgetDGkdbuYB7j/CuyG7KfMeBnIMbncTK5n3SQgPyX/aCXlA2bmLEPpk2poGhuT
KWeNv7DoEJwWc+A32AdG+AJvmC9S3AolykBhuBFgymHWAxb9UpdM8TzK4pYE3p4W
/X13PjlcJfplMq/SEObBhmTZoRenUc4yuh96dJHjp/RxPz1jHn4y0f+AlZWS3/jA
PDMFPwAmwboaAwCzhAC3/smXuMEgfg==
=2cZx
-----END PGP SIGNATURE-----

--Sig_/MaLoh=z.sCLpfxsbm+jRki6--
