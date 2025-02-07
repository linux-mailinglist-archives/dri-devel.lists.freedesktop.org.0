Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B546A2B6F4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 01:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9FF10E9BD;
	Fri,  7 Feb 2025 00:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rWWg5DZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B8D10E9BD;
 Fri,  7 Feb 2025 00:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1738887140;
 bh=Bacfc9g4mK2N5F8ADgamDK4z6BaKuislD2vRGNhIeVs=;
 h=Date:From:To:Cc:Subject:From;
 b=rWWg5DZxc/Ad2xR5t/K1x86gXsNRCKchPL2pcHDT8K/Aj3RRZOZ74fihi0SGbMszT
 BrpVFXrRoN7wyoet1J7oQg2pK/Spmth6xQCJABzA/U6JWmGX7uA/6IBLAH83b9pE29
 WeVmAOQN9gEYpTGD4rRZOlp/qe3j8kYBHziZ1CJffKDhKP4Pn+CItrQnndpX/qtJKO
 +5apEMUhkzjsjncuKjHOcDEJMlpEaefTXpiATQTyCE/u8UG4Jbr7mDPpNoP4CLayQI
 GAQeOMX7I17ev1+AVStGlRRkCbOYO/ZoBWxg+SPZVQ+n3MJrnGrg/fasLStV2DTid/
 9u0j8UKKYKbmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpvYG6zY7z4wbR;
 Fri,  7 Feb 2025 11:12:18 +1100 (AEDT)
Date: Fri, 7 Feb 2025 11:12:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Imre Deak <imre.deak@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm-misc tree
Message-ID: <20250207111227.106a4468@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n0Mfrb3zlQJGaS5NfzRtVUu";
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

--Sig_/n0Mfrb3zlQJGaS5NfzRtVUu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  66df9debcb29 ("drm/connector: make mode_valid_ctx take a const struct drm=
_display_mode")

from the drm-misc tree and commit:

  d49b485d1be3 ("drm/i915/dp_mst: Use intel_connector vs. drm_connector poi=
nter in intel_dp_mst.c")

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

diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.c
index aecaaf1d0fe2,2324ca8f6096..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -1422,8 -1454,8 +1454,8 @@@ static int mst_connector_get_modes(stru
  }
 =20
  static int
- mst_connector_mode_valid_ctx(struct drm_connector *connector,
+ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 -			     struct drm_display_mode *mode,
 +			     const struct drm_display_mode *mode,
  			     struct drm_modeset_acquire_ctx *ctx,
  			     enum drm_mode_status *status)
  {

--Sig_/n0Mfrb3zlQJGaS5NfzRtVUu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmelT+sACgkQAVBC80lX
0Gx0Ewf/UGAeioMhhe79R0ggXFXY6vOyVUjXDM/68BsBElZERgqFHQeVPuB140/V
DXKJOeUVgHX+t2lxqoBdWirPB5JfS35pjZs0BqxVL/c3y03IbaCaE2UyouJAEXoB
40BPD+VZYmNRENsi5aGL/S8PYdTAnri/D3dzLSkY87G/TuZtuOQOKEDxc9XHIMUs
gLUF4llz6IsbR12E/Ldnfgz5z+Ghbs+tGVmCg7j1srcnWMcVwnDVPUDfQ/KFMUSP
2CzJmYAF7/d7676+lzk7phuNUWejFlYxf9avbmRkGOv4zaPug0VCgT8rhTAFmJkl
l6yANLEp9yd4nxpprdUrOoiuwbiVYw==
=/0Ww
-----END PGP SIGNATURE-----

--Sig_/n0Mfrb3zlQJGaS5NfzRtVUu--
