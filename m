Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BpeCEPQfGlbOwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:37:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ED2BC171
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 16:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0010E375;
	Fri, 30 Jan 2026 15:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p2IfpDpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29D710E375
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 15:37:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EAF9E6013A;
 Fri, 30 Jan 2026 15:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EA4C4CEF7;
 Fri, 30 Jan 2026 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769787453;
 bh=FasJqHiOy0M0v15r/lxI+qGvnaL+Q2UI4XVHktLRoxg=;
 h=Date:From:To:Cc:Subject:From;
 b=p2IfpDpD2GXGuAKV0nkiYeLEJCrFfHMj8EGFanHwILNCi1pUt51wQOJOMoYMZRayL
 kG5SRvmuudO8M8h0t3cgnchg6mBkThrPEIFxbjeny26+Sb1xduh9/TSP3OeW5S1jq5
 Ci8ULsW754G0XpJmoitsz7GodyiSiU5vXBLXqupmxhCDYUQBCARm77qQen7y6lmctS
 CcXiBu/phZSaN5zKxc3fVIXx3CwZaHRf7YCIuje/WgN9cuxXJNG18B/MtzVec+4gSc
 ALpCTtCZYUzCcx+SSTUOboY6/V/agXhiYMmNmg0p/pPdhkh79JoKknk08MX/c92bry
 sDmNcEay13PMA==
Date: Fri, 30 Jan 2026 15:37:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Brian Nguyen <brian3.nguyen@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aXzQOAppSJT_SUlb@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GNAsuMu+HLqy/fS0"
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:brian3.nguyen@intel.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:lukasz.laguna@intel.com,m:matthew.brost@intel.com,m:matthew.d.roper@intel.com,m:michal.wajdeczko@intel.com,m:nitin.r.gote@intel.com,m:oak.zeng@intel.com,m:tejas.upadhyay@intel.com,m:thomas.hellstrom@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[13];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 79ED2BC171
X-Rspamd-Action: no action


--GNAsuMu+HLqy/fS0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  drivers/gpu/drm/xe/xe_pci.c
  drivers/gpu/drm/xe/xe_pci_types.h

between commit:

  ca8dcfedac480 ("drm/xe: derive mem copy capability from graphics version")

=66rom the drm-fixes tree and commits:

  83f4151787c5d ("drm/xe/lnl: Drop pre-production workaround support")
  7ef2d25e47736 ("drm/xe: Track pre-production workaround support")
  9b1a0e0a15c97 ("drm/xe: Add page reclamation info to device info")
  79cb005c71343 ("drm/xe: Add device flag to indicate standalone MERT")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_pci.c
index 2aa883f5ef797,09189ff3da441..0000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -358,10 -365,15 +364,14 @@@ static const struct xe_device_desc bmg_
  	.has_fan_control =3D true,
  	.has_flat_ccs =3D 1,
  	.has_mbx_power_limits =3D true,
+ 	.has_mbx_thermal_info =3D true,
  	.has_gsc_nvm =3D 1,
  	.has_heci_cscfi =3D 1,
+ 	.has_i2c =3D true,
  	.has_late_bind =3D true,
+ 	.has_pre_prod_wa =3D 1,
+ 	.has_soc_remapper_telem =3D true,
  	.has_sriov =3D true,
 -	.has_mem_copy_instr =3D true,
  	.max_gt_per_tile =3D 2,
  	.needs_scratch =3D true,
  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
@@@ -378,6 -390,9 +388,8 @@@ static const struct xe_device_desc ptl_
  	.has_display =3D true,
  	.has_flat_ccs =3D 1,
  	.has_sriov =3D true,
 -	.has_mem_copy_instr =3D true,
+ 	.has_pre_prod_wa =3D 1,
+ 	.has_pxp =3D true,
  	.max_gt_per_tile =3D 2,
  	.needs_scratch =3D true,
  	.needs_shared_vf_gt_wq =3D true,
@@@ -390,6 -405,8 +402,7 @@@ static const struct xe_device_desc nvls
  	.dma_mask_size =3D 46,
  	.has_display =3D true,
  	.has_flat_ccs =3D 1,
 -	.has_mem_copy_instr =3D true,
+ 	.has_pre_prod_wa =3D 1,
  	.max_gt_per_tile =3D 2,
  	.require_force_probe =3D true,
  	.va_bits =3D 48,
@@@ -666,11 -692,18 +688,17 @@@ static int xe_info_init_early(struct xe
  	xe->info.has_gsc_nvm =3D desc->has_gsc_nvm;
  	xe->info.has_heci_gscfi =3D desc->has_heci_gscfi;
  	xe->info.has_heci_cscfi =3D desc->has_heci_cscfi;
+ 	xe->info.has_i2c =3D desc->has_i2c;
  	xe->info.has_late_bind =3D desc->has_late_bind;
  	xe->info.has_llc =3D desc->has_llc;
+ 	xe->info.has_mert =3D desc->has_mert;
+ 	xe->info.has_page_reclaim_hw_assist =3D desc->has_page_reclaim_hw_assist;
+ 	xe->info.has_pre_prod_wa =3D desc->has_pre_prod_wa;
  	xe->info.has_pxp =3D desc->has_pxp;
+ 	xe->info.has_soc_remapper_sysctrl =3D desc->has_soc_remapper_sysctrl;
+ 	xe->info.has_soc_remapper_telem =3D desc->has_soc_remapper_telem;
  	xe->info.has_sriov =3D xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm=
=2Edev)) &&
  		desc->has_sriov;
 -	xe->info.has_mem_copy_instr =3D desc->has_mem_copy_instr;
  	xe->info.skip_guc_pc =3D desc->skip_guc_pc;
  	xe->info.skip_mtcfg =3D desc->skip_mtcfg;
  	xe->info.skip_pcode =3D desc->skip_pcode;
diff --cc drivers/gpu/drm/xe/xe_pci_types.h
index a4451bdc79fb3,20acc5349ee6d..0000000000000
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@@ -46,7 -48,14 +48,13 @@@ struct xe_device_desc=20
  	u8 has_late_bind:1;
  	u8 has_llc:1;
  	u8 has_mbx_power_limits:1;
+ 	u8 has_mbx_thermal_info:1;
 -	u8 has_mem_copy_instr:1;
+ 	u8 has_mert:1;
+ 	u8 has_pre_prod_wa:1;
+ 	u8 has_page_reclaim_hw_assist:1;
  	u8 has_pxp:1;
+ 	u8 has_soc_remapper_sysctrl:1;
+ 	u8 has_soc_remapper_telem:1;
  	u8 has_sriov:1;
  	u8 needs_scratch:1;
  	u8 skip_guc_pc:1;

--GNAsuMu+HLqy/fS0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml80DcACgkQJNaLcl1U
h9AYQgf/bmqOOOJNHFc6u5QWVeLLby3oq3FfaMiQGnfgONWF8IYwks+TO2IukY5M
UI7J8KGcDEuRJ96MqBxfFSxCT+dywErDeIMaKSX5O8nqXiQr4mVla1PqodYRAwPx
EyucNUVUaovzM3jO6PPvf29mhq7yijXOoS28j36eBHY6dH0KW7smq9/mxXLmnbtv
Mutd0SxyRN2hiNmpsXQE2sFDZ2VptQWR5V1gEMiYdXjO7/IqTW/KgDjrX5LzVuAL
qSZv0Sad/mlRkaWt/bevBAgYTpocUUXmzpREW6fDIxhnMZ2tqTwVm1Y/nM6UvrXu
2NWgt7TIwawpS+MvXUEX97ASAwjsHw==
=0l0I
-----END PGP SIGNATURE-----

--GNAsuMu+HLqy/fS0--
