Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IYuDS/OfGlbOwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:28:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90424BC045
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9F610E4EB;
	Fri, 30 Jan 2026 15:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pB2wvjKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FEC10E375
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 15:28:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 67C456001A;
 Fri, 30 Jan 2026 15:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6649C4CEF7;
 Fri, 30 Jan 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769786922;
 bh=uA8YZORO7B+yXHQ+TgVUI9wt71XGHm11ITXH1rE8ObI=;
 h=Date:From:To:Cc:Subject:From;
 b=pB2wvjKV2TLs4GUXvrB8bfZqa20XG+Tn11dKAKEkjfTLjPfdDNlROlMHDt/7yrz3N
 RoAxs39O1Iu9NMNy1h3ERHU8XOaCHr+QE+NtcS9ynpPtR9slm5XKPiotaGm2HgLn1G
 GWfJbauKjTVcCrpHiAVqbWH+PRUDxTXSu/Z6ix+aw+PXS1APb8xaOD0+SxdpmaXqXT
 MvSVFshvb4F3ZaXjVJ1YAp8CAtQteJt8+p/ONuD5vhWlqQt1QuunaO95Xbl3EHeP4E
 8gAoAvzz3Q/NjYxuzJVOrxAqyyE5IGS0krO94dmwxmfCVjcc1w9t+xe9PgghVTXVs0
 UNSynFX1k7XLg==
Date: Fri, 30 Jan 2026 15:28:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aXzOJoJ6zhgtFL5u@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TLCRHCZHnl+s3H3W"
Content-Disposition: inline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:alexander.deucher@amd.com,m:Jack.Xiao@amd.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 90424BC045
X-Rspamd-Action: no action


--TLCRHCZHnl+s3H3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c

between commits:

  3eb46fbb601f9 ("drm/amdgpu/gfx11: adjust KGQ reset sequence")
  dfd64f6e8cd7b ("drm/amdgpu/gfx12: adjust KGQ reset sequence")

=66rom the drm-fixes tree and commit:

  d09c7e266c8cd ("drm/amdgpu/mes: add multi-xcc support")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index e642236ea2c51,3a4ca104b1612..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@@ -6828,7 -6832,7 +6833,7 @@@ static int gfx_v11_0_reset_kgq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio);
 -	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, false, 0);
++	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio, 0);
  	if (r) {
 =20
  		dev_warn(adev->dev, "reset via MES failed and try pipe reset %d\n", r);
@@@ -6837,18 -6841,16 +6842,18 @@@
  			return r;
  	}
 =20
 -	r =3D gfx_v11_0_kgq_init_queue(ring, true);
 -	if (r) {
 -		dev_err(adev->dev, "failed to init kgq\n");
 -		return r;
 -	}
 +	if (use_mmio) {
 +		r =3D gfx_v11_0_kgq_init_queue(ring, true);
 +		if (r) {
 +			dev_err(adev->dev, "failed to init kgq\n");
 +			return r;
 +		}
 =20
- 		r =3D amdgpu_mes_map_legacy_queue(adev, ring);
 -	r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 -	if (r) {
 -		dev_err(adev->dev, "failed to remap kgq\n");
 -		return r;
++		r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 +		if (r) {
 +			dev_err(adev->dev, "failed to remap kgq\n");
 +			return r;
 +		}
  	}
 =20
  	return amdgpu_ring_reset_helper_end(ring, timedout_fence);
diff --cc drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 4aab89a9ab401,40660b05f9794..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@@ -5302,7 -5296,7 +5297,7 @@@ static int gfx_v12_0_reset_kgq(struct a
 =20
  	amdgpu_ring_reset_helper_begin(ring, timedout_fence);
 =20
- 	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio);
 -	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, false, 0);
++	r =3D amdgpu_mes_reset_legacy_queue(ring->adev, ring, vmid, use_mmio, 0);
  	if (r) {
  		dev_warn(adev->dev, "reset via MES failed and try pipe reset %d\n", r);
  		r =3D gfx_v12_reset_gfx_pipe(ring);
@@@ -5310,18 -5304,16 +5305,18 @@@
  			return r;
  	}
 =20
 -	r =3D gfx_v12_0_kgq_init_queue(ring, true);
 -	if (r) {
 -		dev_err(adev->dev, "failed to init kgq\n");
 -		return r;
 -	}
 +	if (use_mmio) {
 +		r =3D gfx_v12_0_kgq_init_queue(ring, true);
 +		if (r) {
 +			dev_err(adev->dev, "failed to init kgq\n");
 +			return r;
 +		}
 =20
- 		r =3D amdgpu_mes_map_legacy_queue(adev, ring);
 -	r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 -	if (r) {
 -		dev_err(adev->dev, "failed to remap kgq\n");
 -		return r;
++		r =3D amdgpu_mes_map_legacy_queue(adev, ring, 0);
 +		if (r) {
 +			dev_err(adev->dev, "failed to remap kgq\n");
 +			return r;
 +		}
  	}
 =20
  	return amdgpu_ring_reset_helper_end(ring, timedout_fence);

--TLCRHCZHnl+s3H3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8ziUACgkQJNaLcl1U
h9DblggAhksD09t0akRktEE//4f51U7wqQGjVJ8AbbWsqjgfV57nq7AwpCFJzMCH
A+dxsHvK1PrBQqd3bvR7UMe5Tnbb1sDUgvRLSKAtD18khZLPIbVE7xMfgDWml9VP
Tyv24kN4wN5YNUT3MzqQ384c/kUvl47tBGP56Q5jPQP+0q28fQkVqMdOdEtCyoFH
w5sBZt7VV0VitUURPJ7Zm7Wf5IFrmfz+XJXd4SYO9plLKRZlsDqgw6z/0VXwqeG/
H6XXOOYFkS13LkTVwZJHMM2QyrSKVBajs66lagyrlGBRhurSuURYFAman7diSrjt
jfoDSodrIyvnevZwKmXMsfya/PgCnA==
=taB6
-----END PGP SIGNATURE-----

--TLCRHCZHnl+s3H3W--
