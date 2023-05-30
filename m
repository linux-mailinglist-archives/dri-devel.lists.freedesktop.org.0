Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE2715357
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 03:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E22110E113;
	Tue, 30 May 2023 01:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1CB10E113
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 01:59:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVbDR63vwz4x3g;
 Tue, 30 May 2023 11:59:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1685411960;
 bh=ZRNRNDCKoqP4EaUu6722Asf28ywaHAK6fod38WQkMa8=;
 h=Date:From:To:Cc:Subject:From;
 b=KfZ5SPXnqLZECGo7TOzigpIlRkvZ9I4GYDuzC/OoF8dC0lAzfpbIUo9ucq6pKvmvv
 BBdFlA9oxc0C349zdC4CoykmCxUoiUTKHjKr0/wHk2NNrTDIFsOzKZugJhZ5RVtH/f
 FrFrWdLh32lgf6Ztgp46o1w3mjZTQ3qXOwiFhvOVoQ6ZKlvIQn0BU9y89P6eo4WsnS
 huegsR9H5MfXgUpEAKHbBtZbKFyhK9StE7yl9qB0r80+KiHiVQPEiFlDrwGeOvWrra
 ED6k/xriABjSTrVyrX+DZaXUFCxNcfPbn9sPg9SXM/gOA5q1xfda4AnlaC74t/yGvy
 2oPr3SiPF5OAg==
Date: Tue, 30 May 2023 11:59:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20230530115919.2b8bcf29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WmUIG7ZkJaOjI7dhiK6.lTn";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WmUIG7ZkJaOjI7dhiK6.lTn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  66ca1d8f222b ("drm/i915/i915_drv: Use i915 instead of dev_priv insied the=
 file_priv structure")

from the drm tree and commits:

  5af5169d7582 ("drm/i915: Convert INTEL_INFO()->display to a pointer")
  18e0deeed8c8 ("drm/i915/display: Move display runtime info to display str=
ucture")
  95c08508e237 ("drm/i915/display: Move feature test macros to intel_displa=
y_device.h")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This is
now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_drv.h
index f23b030aaf09,e9c403def9c9..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@@ -407,11 -408,13 +408,13 @@@ static inline struct intel_gt *to_gt(st
  	     (engine__) && (engine__)->uabi_class =3D=3D (class__); \
  	     (engine__) =3D rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
 =20
 -#define INTEL_INFO(dev_priv)	(&(dev_priv)->__info)
 +#define INTEL_INFO(i915)	(&(i915)->__info)
+ #define DISPLAY_INFO(i915)	(INTEL_INFO(i915)->display)
 -#define RUNTIME_INFO(dev_priv)	(&(dev_priv)->__runtime)
 +#define RUNTIME_INFO(i915)	(&(i915)->__runtime)
+ #define DISPLAY_RUNTIME_INFO(i915)	(&(i915)->__display_runtime)
 -#define DRIVER_CAPS(dev_priv)	(&(dev_priv)->caps)
 +#define DRIVER_CAPS(i915)	(&(i915)->caps)
 =20
 -#define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
 +#define INTEL_DEVID(i915)	(RUNTIME_INFO(i915)->device_id)
 =20
  #define IP_VER(ver, rel)		((ver) << 8 | (rel))
 =20
@@@ -753,125 -756,82 +756,82 @@@ IS_SUBPLATFORM(const struct drm_i915_pr
   * The Gen7 cmdparser copies the scanned buffer to the ggtt for execution
   * All later gens can run the final buffer from the ppgtt
   */
 -#define CMDPARSER_USES_GGTT(dev_priv) (GRAPHICS_VER(dev_priv) =3D=3D 7)
 +#define CMDPARSER_USES_GGTT(i915) (GRAPHICS_VER(i915) =3D=3D 7)
 =20
 -#define HAS_LLC(dev_priv)	(INTEL_INFO(dev_priv)->has_llc)
 -#define HAS_4TILE(dev_priv)	(INTEL_INFO(dev_priv)->has_4tile)
 -#define HAS_SNOOP(dev_priv)	(INTEL_INFO(dev_priv)->has_snoop)
 -#define HAS_EDRAM(dev_priv)	((dev_priv)->edram_size_mb)
 -#define HAS_SECURE_BATCHES(dev_priv) (GRAPHICS_VER(dev_priv) < 6)
 -#define HAS_WT(dev_priv)	HAS_EDRAM(dev_priv)
 +#define HAS_LLC(i915)	(INTEL_INFO(i915)->has_llc)
 +#define HAS_4TILE(i915)	(INTEL_INFO(i915)->has_4tile)
 +#define HAS_SNOOP(i915)	(INTEL_INFO(i915)->has_snoop)
 +#define HAS_EDRAM(i915)	((i915)->edram_size_mb)
 +#define HAS_SECURE_BATCHES(i915) (GRAPHICS_VER(i915) < 6)
 +#define HAS_WT(i915)	HAS_EDRAM(i915)
 =20
 -#define HWS_NEEDS_PHYSICAL(dev_priv)	(INTEL_INFO(dev_priv)->hws_needs_phy=
sical)
 +#define HWS_NEEDS_PHYSICAL(i915)	(INTEL_INFO(i915)->hws_needs_physical)
 =20
 -#define HAS_LOGICAL_RING_CONTEXTS(dev_priv) \
 -		(INTEL_INFO(dev_priv)->has_logical_ring_contexts)
 -#define HAS_LOGICAL_RING_ELSQ(dev_priv) \
 -		(INTEL_INFO(dev_priv)->has_logical_ring_elsq)
 +#define HAS_LOGICAL_RING_CONTEXTS(i915) \
 +		(INTEL_INFO(i915)->has_logical_ring_contexts)
 +#define HAS_LOGICAL_RING_ELSQ(i915) \
 +		(INTEL_INFO(i915)->has_logical_ring_elsq)
 =20
 -#define HAS_EXECLISTS(dev_priv) HAS_LOGICAL_RING_CONTEXTS(dev_priv)
 +#define HAS_EXECLISTS(i915) HAS_LOGICAL_RING_CONTEXTS(i915)
 =20
 -#define INTEL_PPGTT(dev_priv) (RUNTIME_INFO(dev_priv)->ppgtt_type)
 -#define HAS_PPGTT(dev_priv) \
 -	(INTEL_PPGTT(dev_priv) !=3D INTEL_PPGTT_NONE)
 -#define HAS_FULL_PPGTT(dev_priv) \
 -	(INTEL_PPGTT(dev_priv) >=3D INTEL_PPGTT_FULL)
 +#define INTEL_PPGTT(i915) (RUNTIME_INFO(i915)->ppgtt_type)
 +#define HAS_PPGTT(i915) \
 +	(INTEL_PPGTT(i915) !=3D INTEL_PPGTT_NONE)
 +#define HAS_FULL_PPGTT(i915) \
 +	(INTEL_PPGTT(i915) >=3D INTEL_PPGTT_FULL)
 =20
 -#define HAS_PAGE_SIZES(dev_priv, sizes) ({ \
 +#define HAS_PAGE_SIZES(i915, sizes) ({ \
  	GEM_BUG_ON((sizes) =3D=3D 0); \
 -	((sizes) & ~RUNTIME_INFO(dev_priv)->page_sizes) =3D=3D 0; \
 +	((sizes) & ~RUNTIME_INFO(i915)->page_sizes) =3D=3D 0; \
  })
 =20
- #define HAS_OVERLAY(i915)		 (INTEL_INFO(i915)->display.has_overlay)
- #define OVERLAY_NEEDS_PHYSICAL(i915) \
- 		(INTEL_INFO(i915)->display.overlay_needs_physical)
-=20
  /* Early gen2 have a totally busted CS tlb and require pinned batches. */
 -#define HAS_BROKEN_CS_TLB(dev_priv)	(IS_I830(dev_priv) || IS_I845G(dev_pr=
iv))
 +#define HAS_BROKEN_CS_TLB(i915)	(IS_I830(i915) || IS_I845G(i915))
 =20
 -#define NEEDS_RC6_CTX_CORRUPTION_WA(dev_priv)	\
 -	(IS_BROADWELL(dev_priv) || GRAPHICS_VER(dev_priv) =3D=3D 9)
 +#define NEEDS_RC6_CTX_CORRUPTION_WA(i915)	\
 +	(IS_BROADWELL(i915) || GRAPHICS_VER(i915) =3D=3D 9)
 =20
  /* WaRsDisableCoarsePowerGating:skl,cnl */
 -#define NEEDS_WaRsDisableCoarsePowerGating(dev_priv)			\
 -	(IS_SKL_GT3(dev_priv) || IS_SKL_GT4(dev_priv))
 +#define NEEDS_WaRsDisableCoarsePowerGating(i915)			\
 +	(IS_SKL_GT3(i915) || IS_SKL_GT4(i915))
 =20
- #define HAS_GMBUS_IRQ(i915) (DISPLAY_VER(i915) >=3D 4)
- #define HAS_GMBUS_BURST_READ(i915) (DISPLAY_VER(i915) >=3D 11 || \
- 					IS_GEMINILAKE(i915) || \
- 					IS_KABYLAKE(i915))
-=20
  /* With the 945 and later, Y tiling got adjusted so that it was 32 128-by=
te
   * rows, which changed the alignment requirements and fence programming.
   */
 -#define HAS_128_BYTE_Y_TILING(dev_priv) (GRAPHICS_VER(dev_priv) !=3D 2 &&=
 \
 -					 !(IS_I915G(dev_priv) || IS_I915GM(dev_priv)))
 +#define HAS_128_BYTE_Y_TILING(i915) (GRAPHICS_VER(i915) !=3D 2 && \
 +					 !(IS_I915G(i915) || IS_I915GM(i915)))
- #define SUPPORTS_TV(i915)		(INTEL_INFO(i915)->display.supports_tv)
- #define I915_HAS_HOTPLUG(i915)	(INTEL_INFO(i915)->display.has_hotplug)
 =20
- #define HAS_FW_BLC(i915)	(DISPLAY_VER(i915) > 2)
- #define HAS_FBC(i915)	(RUNTIME_INFO(i915)->fbc_mask !=3D 0)
- #define HAS_CUR_FBC(i915)	(!HAS_GMCH(i915) && DISPLAY_VER(i915) >=3D 7)
-=20
- #define HAS_DPT(i915)	(DISPLAY_VER(i915) >=3D 13)
-=20
- #define HAS_IPS(i915)	(IS_HSW_ULT(i915) || IS_BROADWELL(i915))
-=20
- #define HAS_DP_MST(i915)	(INTEL_INFO(i915)->display.has_dp_mst)
- #define HAS_DP20(i915)	(IS_DG2(i915) || DISPLAY_VER(i915) >=3D 14)
-=20
- #define HAS_DOUBLE_BUFFERED_M_N(i915)	(DISPLAY_VER(i915) >=3D 9 || IS_BRO=
ADWELL(i915))
-=20
- #define HAS_CDCLK_CRAWL(i915)	 (INTEL_INFO(i915)->display.has_cdclk_crawl)
- #define HAS_CDCLK_SQUASH(i915)	 (INTEL_INFO(i915)->display.has_cdclk_squa=
sh)
- #define HAS_DDI(i915)		 (INTEL_INFO(i915)->display.has_ddi)
- #define HAS_FPGA_DBG_UNCLAIMED(i915) (INTEL_INFO(i915)->display.has_fpga_=
dbg)
- #define HAS_PSR(i915)		 (INTEL_INFO(i915)->display.has_psr)
- #define HAS_PSR_HW_TRACKING(i915) \
- 	(INTEL_INFO(i915)->display.has_psr_hw_tracking)
- #define HAS_PSR2_SEL_FETCH(i915)	 (DISPLAY_VER(i915) >=3D 12)
- #define HAS_TRANSCODER(i915, trans)	 ((RUNTIME_INFO(i915)->cpu_transcoder=
_mask & BIT(trans)) !=3D 0)
 =20
 -#define HAS_RC6(dev_priv)		 (INTEL_INFO(dev_priv)->has_rc6)
 -#define HAS_RC6p(dev_priv)		 (INTEL_INFO(dev_priv)->has_rc6p)
 -#define HAS_RC6pp(dev_priv)		 (false) /* HW was never validated */
 +#define HAS_RC6(i915)		 (INTEL_INFO(i915)->has_rc6)
 +#define HAS_RC6p(i915)		 (INTEL_INFO(i915)->has_rc6p)
 +#define HAS_RC6pp(i915)		 (false) /* HW was never validated */
 =20
 -#define HAS_RPS(dev_priv)	(INTEL_INFO(dev_priv)->has_rps)
 +#define HAS_RPS(i915)	(INTEL_INFO(i915)->has_rps)
 =20
- #define HAS_DMC(i915)	(RUNTIME_INFO(i915)->has_dmc)
- #define HAS_DSB(i915)	(INTEL_INFO(i915)->display.has_dsb)
- #define HAS_DSC(__i915)		(RUNTIME_INFO(__i915)->has_dsc)
- #define HAS_HW_SAGV_WM(i915) (DISPLAY_VER(i915) >=3D 13 && !IS_DGFX(i915))
-=20
 -#define HAS_HECI_PXP(dev_priv) \
 -	(INTEL_INFO(dev_priv)->has_heci_pxp)
 +#define HAS_HECI_PXP(i915) \
 +	(INTEL_INFO(i915)->has_heci_pxp)
 =20
 -#define HAS_HECI_GSCFI(dev_priv) \
 -	(INTEL_INFO(dev_priv)->has_heci_gscfi)
 +#define HAS_HECI_GSCFI(i915) \
 +	(INTEL_INFO(i915)->has_heci_gscfi)
 =20
 -#define HAS_HECI_GSC(dev_priv) (HAS_HECI_PXP(dev_priv) || HAS_HECI_GSCFI(=
dev_priv))
 +#define HAS_HECI_GSC(i915) (HAS_HECI_PXP(i915) || HAS_HECI_GSCFI(i915))
 =20
- #define HAS_MSO(i915)		(DISPLAY_VER(i915) >=3D 12)
-=20
 -#define HAS_RUNTIME_PM(dev_priv) (INTEL_INFO(dev_priv)->has_runtime_pm)
 -#define HAS_64BIT_RELOC(dev_priv) (INTEL_INFO(dev_priv)->has_64bit_reloc)
 +#define HAS_RUNTIME_PM(i915) (INTEL_INFO(i915)->has_runtime_pm)
 +#define HAS_64BIT_RELOC(i915) (INTEL_INFO(i915)->has_64bit_reloc)
 =20
 -#define HAS_OA_BPC_REPORTING(dev_priv) \
 -	(INTEL_INFO(dev_priv)->has_oa_bpc_reporting)
 -#define HAS_OA_SLICE_CONTRIB_LIMITS(dev_priv) \
 -	(INTEL_INFO(dev_priv)->has_oa_slice_contrib_limits)
 -#define HAS_OAM(dev_priv) \
 -	(INTEL_INFO(dev_priv)->has_oam)
 +#define HAS_OA_BPC_REPORTING(i915) \
 +	(INTEL_INFO(i915)->has_oa_bpc_reporting)
 +#define HAS_OA_SLICE_CONTRIB_LIMITS(i915) \
 +	(INTEL_INFO(i915)->has_oa_slice_contrib_limits)
 +#define HAS_OAM(i915) \
 +	(INTEL_INFO(i915)->has_oam)
 =20
  /*
   * Set this flag, when platform requires 64K GTT page sizes or larger for
   * device local memory access.
   */
 -#define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
 +#define HAS_64K_PAGES(i915) (INTEL_INFO(i915)->has_64k_pages)
 =20
- #define HAS_IPC(i915)		(INTEL_INFO(i915)->display.has_ipc)
- #define HAS_SAGV(i915)		(DISPLAY_VER(i915) >=3D 9 && !IS_LP(i915))
-=20
  #define HAS_REGION(i915, i) (RUNTIME_INFO(i915)->memory_regions & (i))
  #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
 =20
@@@ -881,49 -841,32 +841,32 @@@
   * Platform has the dedicated compression control state for each lmem sur=
faces
   * stored in lmem to support the 3D and media compression formats.
   */
 -#define HAS_FLAT_CCS(dev_priv)   (INTEL_INFO(dev_priv)->has_flat_ccs)
 +#define HAS_FLAT_CCS(i915)   (INTEL_INFO(i915)->has_flat_ccs)
 =20
 -#define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
 +#define HAS_GT_UC(i915)	(INTEL_INFO(i915)->has_gt_uc)
 =20
 -#define HAS_POOLED_EU(dev_priv)	(RUNTIME_INFO(dev_priv)->has_pooled_eu)
 +#define HAS_POOLED_EU(i915)	(RUNTIME_INFO(i915)->has_pooled_eu)
 =20
 -#define HAS_GLOBAL_MOCS_REGISTERS(dev_priv)	(INTEL_INFO(dev_priv)->has_gl=
obal_mocs)
 +#define HAS_GLOBAL_MOCS_REGISTERS(i915)	(INTEL_INFO(i915)->has_global_moc=
s)
 =20
- #define HAS_GMCH(i915) (INTEL_INFO(i915)->display.has_gmch)
-=20
  #define HAS_GMD_ID(i915)	(INTEL_INFO(i915)->has_gmd_id)
 =20
- #define HAS_LSPCON(i915) (IS_DISPLAY_VER(i915, 9, 10))
-=20
  #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
 =20
  /* DPF =3D=3D dynamic parity feature */
 -#define HAS_L3_DPF(dev_priv) (INTEL_INFO(dev_priv)->has_l3_dpf)
 -#define NUM_L3_SLICES(dev_priv) (IS_HSW_GT3(dev_priv) ? \
 -				 2 : HAS_L3_DPF(dev_priv))
 +#define HAS_L3_DPF(i915) (INTEL_INFO(i915)->has_l3_dpf)
 +#define NUM_L3_SLICES(i915) (IS_HSW_GT3(i915) ? \
 +				 2 : HAS_L3_DPF(i915))
 =20
- #define INTEL_NUM_PIPES(i915) (hweight8(RUNTIME_INFO(i915)->pipe_mask))
-=20
- #define HAS_DISPLAY(i915) (RUNTIME_INFO(i915)->pipe_mask !=3D 0)
-=20
- #define HAS_VRR(i915)	(DISPLAY_VER(i915) >=3D 11)
-=20
- #define HAS_ASYNC_FLIPS(i915)		(DISPLAY_VER(i915) >=3D 5)
-=20
  /* Only valid when HAS_DISPLAY() is true */
 -#define INTEL_DISPLAY_ENABLED(dev_priv) \
 -	(drm_WARN_ON(&(dev_priv)->drm, !HAS_DISPLAY(dev_priv)),		\
 -	 !(dev_priv)->params.disable_display &&				\
 -	 !intel_opregion_headless_sku(dev_priv))
 +#define INTEL_DISPLAY_ENABLED(i915) \
 +	(drm_WARN_ON(&(i915)->drm, !HAS_DISPLAY(i915)),		\
 +	 !(i915)->params.disable_display &&				\
 +	 !intel_opregion_headless_sku(i915))
 =20
 -#define HAS_GUC_DEPRIVILEGE(dev_priv) \
 -	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
 +#define HAS_GUC_DEPRIVILEGE(i915) \
 +	(INTEL_INFO(i915)->has_guc_deprivilege)
 =20
- #define HAS_D12_PLANE_MINIMIZATION(i915) (IS_ROCKETLAKE(i915) || \
- 					      IS_ALDERLAKE_S(i915))
-=20
- #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915) || DISPLAY_VER(i915)=
 >=3D 14)
-=20
  #define HAS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->has_3d_pipeline)
 =20
  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_f=
use_bit)

--Sig_/WmUIG7ZkJaOjI7dhiK6.lTn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR1WHcACgkQAVBC80lX
0GzUzQf/fq3l/LrzSrwRxGVX5EQgNulOCyDn+FGGThvhgPK+b2zH3u0Z0BeRn4vF
zCIVXWB0umYL+0BzpP09IvnjkeiY+wF4/96QVo6LZw/80TKmoYi9YgCte8zH1w2F
RwpCxnYBUvAZtls740/bQDCYpfGh/bUxwzUuP2S/JSGOXjSBpW2zDXd5ak20HSOQ
gP6mzrSIPSy6RsscN4p7sLJhXcyBKL8aVE6T2Re84X9/Yw146V/9FCzsKW4BkegC
cFJ2dlvYMJ0T/vevPC1d2QRBL0BOrJ8hCLHgdeaxAwgY5YqOXiJH9dtJS1ANvQcY
9/AskX4trPytID1rYu3M3lA/bOtmFg==
=n+j/
-----END PGP SIGNATURE-----

--Sig_/WmUIG7ZkJaOjI7dhiK6.lTn--
