Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0232D31100
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D663110E154;
	Fri, 16 Jan 2026 12:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sjEVUbK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AF810E154
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:27:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5609360160;
 Fri, 16 Jan 2026 12:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E850C116C6;
 Fri, 16 Jan 2026 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768566429;
 bh=vJkeSZJDlEr+vcRKl28dC23myQ3tVLtBezbfmx5tv0w=;
 h=Date:From:To:Cc:Subject:From;
 b=sjEVUbK5eDLEe4biY+4NGGhlHFA98iurZRGtV+DNeL/raL5sk7aOeDNMrokB4OBma
 HAX3MFbRTgbf/sjdivHjLSqEPhxKl/PueS7guXk/BxnGQRZEYPTscDwE9U8gCPVf7R
 9yZ12kPfIV/2Nyl+b664QN+2uv0SkmG2ciSyYzvTsRW35CSZ4Su9m6+TwkOl+8VBg8
 Ptq/I3n05m9yiB/TWn0vNFt4kl5oswevy9NnpbKuKsuXK2yjarqEKVDaiKRFjzcHnW
 9r4GfaoGibN8jGvh0onJPm9mLgN9wTkmbG+ko+BuOpgYT7TH9nd/1wtVrcfeIsyohG
 B2O3Uy5qA3UzA==
Date: Fri, 16 Jan 2026 12:27:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Many Fixes tags need work in the drm tree
Message-ID: <d681a658-cc84-48f5-beb6-2a327a355079@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7+0u+ZO/Jp49Ujmv"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.
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


--7+0u+ZO/Jp49Ujmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

  0288a345f19b2 ("drm/amd/amdgpu: Fix SMU warning during isp suspend-resume")
  155a748f14bc0 ("drm/amdgpu: always backup and reemit fences")
  16b5ad3195247 ("drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use")
  179176134b535 ("drm/amd/display: Check NULL before calling dac_load_detection")
  25314b453cf81 ("drm/amd/display: Apply e4479aecf658 to dml")
  563dfbefdf633 ("drm/amd/display: Reduce number of arguments of dcn30's CalculateWatermarksAndDRAMSpeedChangeSupport()")
  5c5189cf4b0cc ("drm/amd/pm: fix wrong pcie parameter on navi1x")
  72aee5f70ba47 ("drm/xe/svm: Fix a debug printout")
  7edb503fe4b6d ("drm/amd/pm: Disable MMIO access during SMU Mode 1 reset")
  a6ea0a430aca5 ("drm/amdgpu: Fix query for VPE block_type and ip_count")
  b20b3fc4210f8 ("drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()")
  b5179dbd1c147 ("drm/xe/guc: READ/WRITE_ONCE g2h_fence->done")
  bb5dfe2f5630c ("drm/amd/display: Add missing encoder setup to DACnEncoderControl")
  cdf6e4c0cdab1 ("drm/amd/display: Correct color depth for SelectCRTC_Source")
  dc135aa73561b ("drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]")
  fb62a2067ca45 ("drm/amdgpu: don't reemit ring contents more than once")
In commit

  6ef93f62533e4 ("drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_cper_records()")

Fixes tag

  Fixes:

has these problem(s):

  - No SHA1 recognised

Thanks,
Mark

--7+0u+ZO/Jp49Ujmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqLpgACgkQJNaLcl1U
h9BWPAf/Q7EP4eGa+ncZSWHO5QGAlejlRhP4IAQEHvxBOppaPOkFJoVdv89ghg9N
QRswzI89us4Q3S11vKTDQgAAGWsx2gkNHXF8qBpNMnnQd4PXYJIHgI8RHN00By5y
33KGQdgycXPynW2QvHnVo6hFrSlndr1/w63UbX1bYaxLRB2PCN2IDGe3nr/Rckeq
P6efd6bUfMIcic88owGtx6sglvWpMov4fkB0tLHXmHh4Jo0+JF5YTUdF2+OfP7tF
tk3RQ04ckmj1uv07qBGKaic+tU+blwqMcVgHqC3NcxmysH9nrIdMleGr4agcOrzk
FBeqZ+NFutugZ7DxFxeKCJzUHsqO3Q==
=+mjY
-----END PGP SIGNATURE-----

--7+0u+ZO/Jp49Ujmv--
