Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68F133854
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 02:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DFF6E15A;
	Wed,  8 Jan 2020 01:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E234E6E15A;
 Wed,  8 Jan 2020 01:15:30 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47srsD5Jtzz9sRl;
 Wed,  8 Jan 2020 12:15:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1578446129;
 bh=WLW9s4Q6bkfwP6wWJS5exAJsayPk4KKaWV7JLajorGA=;
 h=Date:From:To:Cc:Subject:From;
 b=lYRkCjgnuv1rq7lOgF5SDeVPUH+redG/CrYRA9hDhpQPjLkryYyzbB/v3CxUlmsx+
 AqjMl5Haap3euKwXkBEwnG3PYt537VXayBH+mE3LnYjI9v6m/e7tzIwx7a9gALT+xy
 3135NW0/GCQ4ekUVUUL5L1Cfo3FePkN7Evhi2XpEI10mAUL/YlzvM7BpybP4J4mvVQ
 aQ4uv9MxBAoqiMKyJKTGMQZnzqNXN0zPMkfUWWqkDYoMY8qZiATklgLtomPogy2cg7
 SygUd6ZTD3NO76wCDeeRYKjzUpukZSO13oOMFGlA02knynBZXJEKsmU00UVyEBv5CO
 vxqHHLPFvwcLg==
Date: Wed, 8 Jan 2020 12:15:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <20200108121528.5a800a65@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1548564681=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1548564681==
Content-Type: multipart/signed; boundary="Sig_/0S8l_O_FFF2_z+jPteUKeci";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0S8l_O_FFF2_z+jPteUKeci
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_display.c

between commit:

  2b2c4a83d69d ("drm/i915/dp: Disable Port sync mode correctly on teardown")

from the drm-intel-fixes tree and commit:

  773b4b54351c ("drm/i915: Move stuff from haswell_crtc_disable() into enco=
der .post_disable()")

from the drm tree.

I fixed it up (I applied the change to icl_disable_transcoder_port_sync()
from the former commit in its new location - see patch below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 8 Jan 2020 12:12:45 +1100
Subject: [PATCH] drm/i915: fixup for "drm/i915/dp: Disable Port sync mode
 correctly on teardown"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i91=
5/display/intel_ddi.c
index c9ba7d7f3787..e535a3b85575 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3860,8 +3860,6 @@ static void icl_disable_transcoder_port_sync(const st=
ruct intel_crtc_state *old_
 {
 	struct intel_crtc *crtc =3D to_intel_crtc(old_crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
-	i915_reg_t reg;
-	u32 trans_ddi_func_ctl2_val;
=20
 	if (old_crtc_state->master_transcoder =3D=3D INVALID_TRANSCODER)
 		return;
@@ -3869,10 +3867,7 @@ static void icl_disable_transcoder_port_sync(const s=
truct intel_crtc_state *old_
 	DRM_DEBUG_KMS("Disabling Transcoder Port Sync on Slave Transcoder %s\n",
 		      transcoder_name(old_crtc_state->cpu_transcoder));
=20
-	reg =3D TRANS_DDI_FUNC_CTL2(old_crtc_state->cpu_transcoder);
-	trans_ddi_func_ctl2_val =3D ~(PORT_SYNC_MODE_ENABLE |
-				    PORT_SYNC_MODE_MASTER_SELECT_MASK);
-	I915_WRITE(reg, trans_ddi_func_ctl2_val);
+	I915_WRITE(TRANS_DDI_FUNC_CTL2(old_crtc_state->cpu_transcoder), 0);
 }
=20
 static void intel_ddi_post_disable(struct intel_encoder *encoder,
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/0S8l_O_FFF2_z+jPteUKeci
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4VLTAACgkQAVBC80lX
0GxQ0Af+JWKZelrEALDfQfGtW3uISstZ63INkQ42kft7UNa2Kjv/0IV5oZlwuq0u
w9g23iZGl4xdwu9mAGA8EoomH2haNoMLKlhWHOnPspKwy9DW2vDg0hqijPMla6OC
vC/F0wzRn9BerGsjow6wErxfjV2KEiqJTqoykr+t083tqsf94JsqFclXgh8EoxvG
BScp8pePlvWk8FpBYEfcP8JpKkYZa+NPgVEHjzN2knBzBe/YNzApdth6fnD27VZl
lBzvND0LbdQ02OgDkH9uhCRXMBOsKMSklGQ5EvpumG0CkG2NwRe8qv7UtFbXqQyX
WBzAlymRoDMvQZP0AEUvsPkRhoWygg==
=5PNq
-----END PGP SIGNATURE-----

--Sig_/0S8l_O_FFF2_z+jPteUKeci--

--===============1548564681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1548564681==--
