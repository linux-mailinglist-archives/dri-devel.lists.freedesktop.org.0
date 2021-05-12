Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9352937B306
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 02:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56596EB43;
	Wed, 12 May 2021 00:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13CD6EB42;
 Wed, 12 May 2021 00:28:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfwcM5W45z9sWT;
 Wed, 12 May 2021 10:28:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1620779285;
 bh=wzxqF8VP57iO8VsSfCS3l59Sht3GWfjqDTx+GVL9UWc=;
 h=Date:From:To:Cc:Subject:From;
 b=ABPwpCXB41ws80GgNYcG/dIZOQ8zRz3Lqt+UtC1qWdPALLvnNa5iidHqkkViDsyUH
 oXV2GlY7lkPG/FWwMpPnnHFOqBb9lNv8fha1WYwWKiomaUoD7M08sK3yf2u5sdbe9Y
 0TLJEBfGuDCOZTF1d4WVdj+wh/BOJ1t8Gi2BVpbzFDD8XtjFALRu24+sAgTMhPsp2N
 NeLY4DLsRQ4f/wxE7ogiR8dNuosk4302Od/nrS4aXG1giLdR+1VVNLn1HVP9/DFYWl
 KEexmhej7aVwWdmK+ANrekUDPfStyPWK5wzywDwqP7bjqNlLq4UKZjz3NDz/D9JkM1
 FhWKeUpuuaHMQ==
Date: Wed, 12 May 2021 10:28:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Message-ID: <20210512102802.307861cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aLepwFzyOaaiX.gbf06/EqX";
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aLepwFzyOaaiX.gbf06/EqX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_pm.c

between commit:

  e7c6e405e171 ("Fix misc new gcc warnings")

from Linus' tree and commit:

  c6deb5e97ded ("drm/i915/pm: Make the wm parameter of print_wm_latency a p=
ointer")

from the drm-intel tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/aLepwFzyOaaiX.gbf06/EqX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbIRIACgkQAVBC80lX
0GztkAgAl5z3Cv2n1A/M3BBjk1JNfDaRxhKDrwjiMmHUdNqOMjn31OWYhWS3CjAi
7vlnJpw51ZV+1S9V+XqKo3U52U3s7l4LvelLEBJdCRsyTOQ8vgcme1o1W4NyJXQF
MNBUiOhaMBN62i5qU89z1ZJ9tJSCan41b1xGQ+xIOAxlHA8cwQb0AEmxKgVEUvg5
wjm96GaPqFfyO2vXEAT/eMyINZpwRBBmyoxpjE+/G/hRAts7OHYhFjmKPW3MTHQg
SyOaFdBLBYqrNFsQJ3gmV9o6H9OMQDPGlq/Q/CX1k7rgf/hSbs3D22A3vVua8x5e
4D3qjumkvyy4XFQL+PziTHVWsI6Keg==
=UcGr
-----END PGP SIGNATURE-----

--Sig_/aLepwFzyOaaiX.gbf06/EqX--
