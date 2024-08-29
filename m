Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BE963709
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 02:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7C910E136;
	Thu, 29 Aug 2024 00:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j19TwASp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108510E136;
 Thu, 29 Aug 2024 00:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1724892585;
 bh=328Prx/KK8v+a7H8wqcR70si4uCIzGzfuIJ25nYD0JE=;
 h=Date:From:To:Cc:Subject:From;
 b=j19TwASp/C2+yyA+WVoLHzfjKw0wsTJGLXnw3gerYydrASkWCGa1u7NpF4fpuRuCf
 +DqEqXBU9323ufBF9mPmkrwZHa3VAKzTKF0ETKVjWnmEyiEyoVlTEg6lriq4ytM2Ls
 yW2NwVe/C11BUleFwTXAI1VKkNgSKik4/DdLqZ2dCgfXc/TsyS+2PA6s9NxdGBvpi9
 Wt3x/V7YIL77XZH4+20s6W2G1d31KFrfaDDeQ/M9iWQS3L+XnQKnQBGVJeiJV2J6jr
 lB4bDQg8BXig9Iyjja4Y/q8zDFhc0vVZ07nJSXQdzI5sVilkpzZK4HgcfYorWNpnGJ
 GfkT96jpC/VgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvN3C6Bxvz4wxJ;
 Thu, 29 Aug 2024 10:49:43 +1000 (AEST)
Date: Thu, 29 Aug 2024 10:49:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <20240829104943.5f4b2ab3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GZwGiN5L/uBJl1ACUbLZkS3";
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

--Sig_/GZwGiN5L/uBJl1ACUbLZkS3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c
  drivers/gpu/drm/i915/display/intel_dp_mst.h

between commit:

  a2ccc33b88e2 ("drm/i915/dp_mst: Fix MST state after a sink reset")

from the drm-intel-fixes tree and commit:

  e44bc451aa4b ("drm/i915/dp_mst: Ensure link parameters are up-to-date for=
 a disabled link")

from the drm tree.

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
index 17978a1f9ab0,45d2230d1801..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@@ -1999,42 -2033,32 +2033,72 @@@ bool intel_dp_mst_crtc_needs_modeset(st
  	return false;
  }
 =20
 +/*
 + * intel_dp_mst_verify_dpcd_state - verify the MST SW enabled state wrt. =
the DPCD
 + * @intel_dp: DP port object
 + *
 + * Verify if @intel_dp's MST enabled SW state matches the corresponding D=
PCD
 + * state. A long HPD pulse - not long enough to be detected as a disconne=
cted
 + * state - could've reset the DPCD state, which requires tearing
 + * down/recreating the MST topology.
 + *
 + * Returns %true if the SW MST enabled and DPCD states match, %false
 + * otherwise.
 + */
 +bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
 +{
 +	struct intel_display *display =3D to_intel_display(intel_dp);
 +	struct intel_connector *connector =3D intel_dp->attached_connector;
 +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
 +	struct intel_encoder *encoder =3D &dig_port->base;
 +	int ret;
 +	u8 val;
 +
 +	if (!intel_dp->is_mst)
 +		return true;
 +
 +	ret =3D drm_dp_dpcd_readb(intel_dp->mst_mgr.aux, DP_MSTM_CTRL, &val);
 +
 +	/* Adjust the expected register value for SST + SideBand. */
 +	if (ret < 0 || val !=3D (DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC))=
 {
 +		drm_dbg_kms(display->drm,
 +			    "[CONNECTOR:%d:%s][ENCODER:%d:%s] MST mode got reset, removing top=
ology (ret=3D%d, ctrl=3D0x%02x)\n",
 +			    connector->base.base.id, connector->base.name,
 +			    encoder->base.base.id, encoder->base.name,
 +			    ret, val);
 +
 +		return false;
 +	}
 +
 +	return true;
 +}
++
+ /**
+  * intel_dp_mst_prepare_probe - Prepare an MST link for topology probing
+  * @intel_dp: DP port object
+  *
+  * Prepare an MST link for topology probing, programming the target
+  * link parameters to DPCD. This step is a requirement of the enumaration
+  * of path resources during probing.
+  */
+ void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp)
+ {
+ 	int link_rate =3D intel_dp_max_link_rate(intel_dp);
+ 	int lane_count =3D intel_dp_max_lane_count(intel_dp);
+ 	u8 rate_select;
+ 	u8 link_bw;
+=20
+ 	if (intel_dp->link_trained)
+ 		return;
+=20
+ 	if (intel_mst_probed_link_params_valid(intel_dp, link_rate, lane_count))
+ 		return;
+=20
+ 	intel_dp_compute_rate(intel_dp, link_rate, &link_bw, &rate_select);
+=20
+ 	intel_dp_link_training_set_mode(intel_dp, link_rate, false);
+ 	intel_dp_link_training_set_bw(intel_dp, link_bw, rate_select, lane_count,
+ 				      drm_dp_enhanced_frame_cap(intel_dp->dpcd));
+=20
+ 	intel_mst_set_probed_link_params(intel_dp, link_rate, lane_count);
+ }
diff --cc drivers/gpu/drm/i915/display/intel_dp_mst.h
index 9e4c7679f1c3,fba76454fa67..000000000000
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
@@@ -27,6 -27,6 +27,7 @@@ int intel_dp_mst_atomic_check_link(stru
  				   struct intel_link_bw_limits *limits);
  bool intel_dp_mst_crtc_needs_modeset(struct intel_atomic_state *state,
  				     struct intel_crtc *crtc);
 +bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp);
+ void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp);
 =20
  #endif /* __INTEL_DP_MST_H__ */

--Sig_/GZwGiN5L/uBJl1ACUbLZkS3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbPxacACgkQAVBC80lX
0GwxrggAnkLvdxxVwdkUUWqdiK/6bWQEkakrEP+8xcWxlqAEESdHL1g7diwE1iKr
WZhYYl5i7us55wxcjS9mlDzLgNWKs8Y9TYbu/aG4vtNW+JT76X2z9ST/gnBQamjF
AaAc/hr4a+OBv089w0p8enHXqEEHuuTQpVyxUAjcqXjX3jqly9v7UNl6dYQKzN1G
CfcZdkMq4KV6TsKRIwTiCGH2NuW/fifHG433B0ZOm059gP6VbMIs3ShS/PeruIBm
3XKX2VKgO2H+KM8CH58IkE+8cU7Rk+OQBnXPMPeaNu83y0UAzkV9jTLLJPxOL0Ty
cfATNAdbIDG9gPMYF4msXYb4ovuQpg==
=RssE
-----END PGP SIGNATURE-----

--Sig_/GZwGiN5L/uBJl1ACUbLZkS3--
