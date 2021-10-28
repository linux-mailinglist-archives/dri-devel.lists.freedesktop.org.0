Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8B43D9A7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 05:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9646E042;
	Thu, 28 Oct 2021 03:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C806E042
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 03:06:51 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfr7T3y8vz4xbG;
 Thu, 28 Oct 2021 14:06:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1635390406;
 bh=4Z8RtmBKEJZe9Dzrso/ZzzvU182TDgKKdlUvm24xPcc=;
 h=Date:From:To:Cc:Subject:From;
 b=iE2wIJLQnajkbaOC0p8SN+VqXMxMmDjNKMRjB/ThC2eUFpAN2TepbOCzArPSzK5kp
 EMvJfYZGRExhD+o3X8KdDRuZxEL5BfigX9zClkuYkbkZtmwd0A1GTTx4WKQrLyTQ8x
 SwJv8OF8CFJBpt2jYgTxnnn/7yaL1uR5tvVBDQcjsx0nCDtUDH1nq8DMj0rPLzLyjE
 RYjkDVXOaMgepKDZIAsP1kQDBqIWSckX256Epbcyg38u+9DFK9qJrUgrw7iJ1mL/fN
 H0BU1CGImShqGT0YSEx0b0HRZXOHdo9hA9hMMKnTWpzDX6YbME1wHQIYwY0zsAUO5k
 rlh9JId1he0lw==
Date: Thu, 28 Oct 2021 14:06:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Bhawanpreet Lakha
 <Bhawanpreet.Lakha@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lyude Paul <lyude@redhat.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20211028140644.7c1a7244@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IspTBx_avmFxEn8ysc4IXMj";
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

--Sig_/IspTBx_avmFxEn8ysc4IXMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/display/dc/core/dc_link.c
  drivers/gpu/drm/drm_dp_mst_topology.c
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commits:

  d740e0bf8ed4 ("drm/amd/display: Add DP 2.0 MST DC Support")
  41724ea273cd ("drm/amd/display: Add DP 2.0 MST DM Support")
  00f965e700ef ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN i=
s not set")

from the drm tree and commits:

  6d23be5bc661 ("drm/amd/display: Add DP 2.0 MST DC Support")
  39b3c728e5ca ("drm/amd/display: Add DP 2.0 MST DM Support")
  8bc3824f0ee2 ("drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN i=
s not set")

from the amdgpu tree.

The conflicts between these different versions of the same patches,
and some other changes in the amdgpu tree are just a mess today, do I
have just dropped the amdgpu tree completely for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/IspTBx_avmFxEn8ysc4IXMj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6E8QACgkQAVBC80lX
0GwgEQgAm5ybNqy8bFm4dY5XXBEam6vgcOXi295gvzOh9eqDwpkHcuisfEcakVrP
3kfi/w+0NSowxmkzY9kfFjnJ+7oidophRJkaQK2TsK3ZsyjZtvVflfuD9dNl6dU+
gfWmRxo4dCaNlkAJeH3AUhsk3NLn6/tFe4zTNa9umi0f0vQlNQeMn0bpQM8xM1Jn
oJxpdCK0+33wDzYdpo0vbwYNz8OjRiYiG4nLbml666ShXX/6v0XQ4r6eDC+fHVzG
Vv/QfBlQmHXphYroIL5OJDpOG1adpmZXBldBrgPxbYZzXdGZk/ZfkVj2VPz+Ha5V
VHnMGR6UZ504S871ApwEGVKloT4G+Q==
=CF/T
-----END PGP SIGNATURE-----

--Sig_/IspTBx_avmFxEn8ysc4IXMj--
