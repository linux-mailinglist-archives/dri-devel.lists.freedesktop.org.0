Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9684F2089
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 03:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5732710E192;
	Tue,  5 Apr 2022 01:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393B210E192;
 Tue,  5 Apr 2022 01:00:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KXTp36QHMz4xXg;
 Tue,  5 Apr 2022 11:00:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649120412;
 bh=pvAjgrubqUeybT12my8JKcBFZrLk6GFs9UdVcALm1Rw=;
 h=Date:From:To:Cc:Subject:From;
 b=hYcFQ3qY5EyREHyfFG7FXCrx9OZ8bIuRRhoeY9aUcgfxzenLCQFnCM8VG+0qjUGoN
 hb7DUGklkh5WCotHIUr2HbSxOArcUo1rN8wbPoKPAkGg5YuCkAGslCX2douUNvLDiI
 g1C0BJhHnw7QQBAhjf8JODKNQOD6gN4x+xVM2sigR/2oy5lEuYJCE/2QIApYn8rPNG
 uuPANRBVcR685QdrdUPcxPvH7AXpwtP1zSDiRBMfcSQMOWsTKvEVkuAVYanDBJpBDY
 hsgH/4h/F9N+Tf4e3/Gc/zzzk4xoWgYEUD9NOtwIvrGNc4qnstZchKRzytpEKrAo+u
 aXFC3kBsQUYtA==
Date: Tue, 5 Apr 2022 11:00:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20220405110011.42656314@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vJGFu34SKYSA_epYaranuCs";
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 CQ Tang <cq.tang@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Juha-Pekka =?UTF-8?B?SGVpa2tpbMOk?= <juha-pekka.heikkila@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vJGFu34SKYSA_epYaranuCs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_device_info.h

between commit:

  5e3094cfd9fb ("drm/i915/xehpsdv: Add has_flat_ccs to device info")

from Linus' tree and commit:

  072ce4164f97 ("drm/i915/dg2: Tile 4 plane format support")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_device_info.h
index 291215d9da28,8026e805ff12..000000000000
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@@ -134,10 -131,9 +134,11 @@@ enum intel_ppgtt_type=20
  	/* Keep has_* in alphabetical order */ \
  	func(has_64bit_reloc); \
  	func(has_64k_pages); \
 +	func(needs_compact_pt); \
  	func(gpu_reset_clobbers_display); \
  	func(has_reset_engine); \
 +	func(has_flat_ccs); \
+ 	func(has_4tile); \
  	func(has_global_mocs); \
  	func(has_gt_uc); \
  	func(has_guc_deprivilege); \

--Sig_/vJGFu34SKYSA_epYaranuCs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJLlJsACgkQAVBC80lX
0Gy1Vwf/ai698wOFTp8iHwKVkeATYt9n7KQrbPXReJI00ygB+CGtawI0WLEx+U1e
x3dNfaeuUNE3u6NFpWfmTNl/CuUEoWfyLOXe98zoJyczE8H2cLq0wBFVTZwSMahf
7PMhEduqTFMRpjI5eVF7/zfLg2p6MnnWo8kwP0qS+9s4vP71uE1V3m8nds705pxg
MaGFdowHREd54ChblVpa3OyQvpd6XdB9hX63c3diTDx6cXL9PPZ911ipPc7K47lq
RnqMakWG7Mo4Nb9m2hdvTLmyrJurcccTMqijsWv629Y6pQ8ryX5qhAn/qc9xvfkc
TAO7jEdUPw9Owol24EyVxmLJ0TUcLg==
=eJUe
-----END PGP SIGNATURE-----

--Sig_/vJGFu34SKYSA_epYaranuCs--
