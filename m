Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37AB8FC7C8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 11:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857A410E3C9;
	Wed,  5 Jun 2024 09:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjD4IPFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C53810E08A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 09:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717579726; x=1749115726;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jfMimj9yCvvx1rko72rPH5wOnYD7J/4vGMplWwKGn3k=;
 b=DjD4IPFJ9Pl27pSeBTWNXocHqEBKZ5M+7l+iVp48E8mRbyZEl5yzDxYI
 ZQumPPXz7s43Gcfc0a0y3Dq/+oC0j5svFpvzmLdaEWmF7PAJ28WrfSRAC
 OBxhvg2qjGELDcL2r+pms0A/Mr9rWOkxLrP3YZcqeetzl6UucbibgePZk
 hXUI/QVanL9Aa3s0UPqMKl6VWjYeNar+rwRYCqj/38m3t5NBTZ9ULII8V
 /ZRbNxAHKiOUSnZu3UWFt++f8zsKCmyUscxjEutw71QkT6g5Fw32MYO+K
 fWUim4YBsFRnjgNqIA6BYMs/e0woSFS6YGIrXi6JJ2aPCANCY5yWDwPt8 w==;
X-CSE-ConnectionGUID: r7/W+CZnTMy+x4TNQ8waKQ==
X-CSE-MsgGUID: /7H0drplSau+VxFa3zIlZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14288291"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14288291"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 02:28:30 -0700
X-CSE-ConnectionGUID: fRq3jestRFmECQJyjI2WjA==
X-CSE-MsgGUID: hFuFoeJWQB2lN1PRSp8d4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="41970146"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 02:28:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, kernel test robot
 <lkp@intel.com>, Iago Toral Quiroga <itoral@igalia.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/v3d: Fix perfmon build error/warning
In-Reply-To: <20240604160210.24073-1-tursulin@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240604160210.24073-1-tursulin@igalia.com>
Date: Wed, 05 Jun 2024 12:28:22 +0300
Message-ID: <871q5bd9hl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 04 Jun 2024, Tvrtko Ursulin <tursulin@igalia.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Move static const array into the source file to fix the "defined but not
> used" errors.
>
> The fix is perhaps not the prettiest due hand crafting the array sizes
> in v3d_performance_counters.h, but I did add some build time asserts to
> validate the counts look sensible, so hopefully it is good enough for a
> quick fix.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 3cbcbe016c31 ("drm/v3d: Add Performance Counters descriptions for =
V3D 4.2 and 7.1")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405211137.hueFkLKG-lkp@i=
ntel.com/Cc: Ma=C3=ADra Canal <mcanal@igalia.com>

I guess it's too late now, but \n missing before Cc: there.

BR,
Jani.


> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c                 |   4 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                 |   3 -
>  drivers/gpu/drm/v3d/v3d_perfmon.c             | 204 +++++++++++++++++-
>  .../gpu/drm/v3d/v3d_performance_counters.h    | 189 +---------------
>  4 files changed, 205 insertions(+), 195 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index f7477488b1cc..a47f00b443d3 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -299,9 +299,9 @@ static int v3d_platform_drm_probe(struct platform_dev=
ice *pdev)
>  	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
>=20=20
>  	if (v3d->ver >=3D 71)
> -		v3d->max_counters =3D ARRAY_SIZE(v3d_v71_performance_counters);
> +		v3d->max_counters =3D V3D_V71_NUM_PERFCOUNTERS;
>  	else if (v3d->ver >=3D 42)
> -		v3d->max_counters =3D ARRAY_SIZE(v3d_v42_performance_counters);
> +		v3d->max_counters =3D V3D_V42_NUM_PERFCOUNTERS;
>  	else
>  		v3d->max_counters =3D 0;
>=20=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 556cbb400ba0..099b962bdfde 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -351,9 +351,6 @@ struct v3d_timestamp_query {
>  	struct drm_syncobj *syncobj;
>  };
>=20=20
> -/* Maximum number of performance counters supported by any version of V3=
D */
> -#define V3D_MAX_COUNTERS ARRAY_SIZE(v3d_v71_performance_counters)
> -
>  /* Number of perfmons required to handle all supported performance count=
ers */
>  #define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
>  				      DRM_V3D_MAX_PERF_COUNTERS)
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_=
perfmon.c
> index 73e2bb8bdb7f..b7d0b02e1a95 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -9,6 +9,192 @@
>  #define V3D_PERFMONID_MIN	1
>  #define V3D_PERFMONID_MAX	U32_MAX
>=20=20
> +static const struct v3d_perf_counter_desc v3d_v42_performance_counters[]=
 =3D {
> +	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primiti=
ves that result in no rendered pixels, for all rendered tiles"},
> +	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives=
 for all rendered tiles (primitives may be counted in more than one tile)"},
> +	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped quads"},
> +	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
> +	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads with no pixe=
ls passing the stencil test"},
> +	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB] Quads with n=
o pixels passing the Z and stencil tests"},
> +	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads with any p=
ixels passing the Z and stencil tests"},
> +	{"TLB", "TLB-quads-with-zero-coverage", "[TLB] Quads with all pixels ha=
ving zero coverage"},
> +	{"TLB", "TLB-quads-with-non-zero-coverage", "[TLB] Quads with any pixel=
s having non-zero coverage"},
> +	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads with valid pi=
xels written to colour buffer"},
> +	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB] Primitives =
discarded by being outside the viewport"},
> +	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives that need cli=
pping"},
> +	{"PTB", "PTB-primitives-discarded-reversed", "[PTB] Primitives that are=
 discarded because they are reversed"},
> +	{"QPU", "QPU-total-idle-clk-cycles", "[QPU] Total idle clock cycles for=
 all QPUs"},
> +	{"QPU", "QPU-total-active-clk-cycles-vertex-coord-shading", "[QPU] Tota=
l active clock cycles for all QPUs doing vertex/coordinate/user shading (co=
unts only when QPU is not stalled)"},
> +	{"QPU", "QPU-total-active-clk-cycles-fragment-shading", "[QPU] Total ac=
tive clock cycles for all QPUs doing fragment shading (counts only when QPU=
 is not stalled)"},
> +	{"QPU", "QPU-total-clk-cycles-executing-valid-instr", "[QPU] Total cloc=
k cycles for all QPUs executing valid instructions"},
> +	{"QPU", "QPU-total-clk-cycles-waiting-TMU", "[QPU] Total clock cycles f=
or all QPUs stalled waiting for TMUs only (counter won't increment if QPU a=
lso stalling for another reason)"},
> +	{"QPU", "QPU-total-clk-cycles-waiting-scoreboard", "[QPU] Total clock c=
ycles for all QPUs stalled waiting for Scoreboard only (counter won't incre=
ment if QPU also stalling for another reason)"},
> +	{"QPU", "QPU-total-clk-cycles-waiting-varyings", "[QPU] Total clock cyc=
les for all QPUs stalled waiting for Varyings only (counter won't increment=
 if QPU also stalling for another reason)"},
> +	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total instruction cache hit=
s for all slices"},
> +	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total instruction cache mi=
sses for all slices"},
> +	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms cache hits=
 for all slices"},
> +	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total uniforms cache mis=
ses for all slices"},
> +	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture cache acces=
ses"},
> +	{"TMU", "TMU-total-text-cache-miss", "[TMU] Total texture cache misses =
(number of fetches from memory/L2cache)"},
> +	{"VPM", "VPM-total-clk-cycles-VDW-stalled", "[VPM] Total clock cycles V=
DW is stalled waiting for VPM access"},
> +	{"VPM", "VPM-total-clk-cycles-VCD-stalled", "[VPM] Total clock cycles V=
CD is stalled waiting for VPM access"},
> +	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread active cycles=
"},
> +	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render thread active =
cycles"},
> +	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache hits"},
> +	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache misses"},
> +	{"CORE", "cycle-count", "[CORE] Cycle counter"},
> +	{"QPU", "QPU-total-clk-cycles-waiting-vertex-coord-shading", "[QPU] Tot=
al stalled clock cycles for all QPUs doing vertex/coordinate/user shading"},
> +	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading", "[QPU] Total s=
talled clock cycles for all QPUs doing fragment shading"},
> +	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives binned"},
> +	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by watch 0"},
> +	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch 0"},
> +	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write stalls seen by =
watch 0"},
> +	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls seen by wa=
tch 0"},
> +	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes written seen=
 by watch 0"},
> +	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes read seen by =
watch 0"},
> +	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by watch 1"},
> +	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch 1"},
> +	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write stalls seen by =
watch 1"},
> +	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls seen by wa=
tch 1"},
> +	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes written seen=
 by watch 1"},
> +	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes read seen by =
watch 1"},
> +	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB] Partial qua=
ds written to the colour buffer"},
> +	{"TMU", "TMU-total-config-access", "[TMU] Total config accesses"},
> +	{"L2T", "L2T-no-id-stalled", "[L2T] No ID stall"},
> +	{"L2T", "L2T-command-queue-stalled", "[L2T] Command queue full stall"},
> +	{"L2T", "L2T-TMU-writes", "[L2T] TMU write accesses"},
> +	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
> +	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
> +	{"CLE", "CLE-thread-active-cycles", "[CLE] Bin or render thread active =
cycles"},
> +	{"L2T", "L2T-TMU-reads", "[L2T] TMU read accesses"},
> +	{"L2T", "L2T-CLE-reads", "[L2T] CLE read accesses"},
> +	{"L2T", "L2T-VCD-reads", "[L2T] VCD read accesses"},
> +	{"L2T", "L2T-TMU-config-reads", "[L2T] TMU CFG read accesses"},
> +	{"L2T", "L2T-SLC0-reads", "[L2T] SLC0 read accesses"},
> +	{"L2T", "L2T-SLC1-reads", "[L2T] SLC1 read accesses"},
> +	{"L2T", "L2T-SLC2-reads", "[L2T] SLC2 read accesses"},
> +	{"L2T", "L2T-TMU-write-miss", "[L2T] TMU write misses"},
> +	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
> +	{"L2T", "L2T-CLE-read-miss", "[L2T] CLE read misses"},
> +	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
> +	{"L2T", "L2T-TMU-config-read-miss", "[L2T] TMU CFG read misses"},
> +	{"L2T", "L2T-SLC0-read-miss", "[L2T] SLC0 read misses"},
> +	{"L2T", "L2T-SLC1-read-miss", "[L2T] SLC1 read misses"},
> +	{"L2T", "L2T-SLC2-read-miss", "[L2T] SLC2 read misses"},
> +	{"CORE", "core-memory-writes", "[CORE] Total memory writes"},
> +	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
> +	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
> +	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
> +	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
> +	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
> +	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
> +	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
> +	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
> +	{"GMP", "GMP-memory-reads", "[GMP] Total memory reads"},
> +	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words written"},
> +	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words written"},
> +	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words read"},
> +	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words read"},
> +	{"TMU", "TMU-MRU-hits", "[TMU] Total MRU hits"},
> +	{"CORE", "compute-active-cycles", "[CORE] Compute active cycles"},
> +};
> +
> +static const struct v3d_perf_counter_desc v3d_v71_performance_counters[]=
 =3D {
> +	{"CORE", "cycle-count", "[CORE] Cycle counter"},
> +	{"CORE", "core-active", "[CORE] Bin/Render/Compute active cycles"},
> +	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread active cycles=
"},
> +	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render thread active =
cycles"},
> +	{"CORE", "compute-active-cycles", "[CORE] Compute active cycles"},
> +	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primiti=
ves that result in no rendered pixels, for all rendered tiles"},
> +	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives=
 for all rendered tiles (primitives may be counted in more than one tile)"},
> +	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped quads"},
> +	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
> +	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads with no pixe=
ls passing the stencil test"},
> +	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB] Quads with n=
o pixels passing the Z and stencil tests"},
> +	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads with any p=
ixels passing the Z and stencil tests"},
> +	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads with valid pi=
xels written to colour buffer"},
> +	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB] Partial qua=
ds written to the colour buffer"},
> +	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives that need cli=
pping"},
> +	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB] Primitives =
discarded by being outside the viewport"},
> +	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives binned"},
> +	{"PTB", "PTB-primitives-discarded-reversed", "[PTB] Primitives that are=
 discarded because they are reversed"},
> +	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total instruction cache hit=
s for all slices"},
> +	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total instruction cache mi=
sses for all slices"},
> +	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms cache hits=
 for all slices"},
> +	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total uniforms cache mis=
ses for all slices"},
> +	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
> +	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
> +	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture cache acces=
ses"},
> +	{"TMU", "TMU-cache-x4-active-cycles", "[TMU] Cache active cycles for x4=
 access"},
> +	{"TMU", "TMU-cache-x4-stalled-cycles", "[TMU] Cache stalled cycles for =
x4 access"},
> +	{"TMU", "TMU-total-text-quads-x4-access", "[TMU] Total texture cache x4=
 access"},
> +	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache hits"},
> +	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache misses"},
> +	{"L2T", "L2T-local", "[L2T] Local mode access"},
> +	{"L2T", "L2T-writeback", "[L2T] Writeback"},
> +	{"L2T", "L2T-zero", "[L2T] Zero"},
> +	{"L2T", "L2T-merge", "[L2T] Merge"},
> +	{"L2T", "L2T-fill", "[L2T] Fill"},
> +	{"L2T", "L2T-stalls-no-wid", "[L2T] Stalls because no WID available"},
> +	{"L2T", "L2T-stalls-no-rid", "[L2T] Stalls because no RID available"},
> +	{"L2T", "L2T-stalls-queue-full", "[L2T] Stalls because internal queue f=
ull"},
> +	{"L2T", "L2T-stalls-wrightback", "[L2T] Stalls because writeback in fli=
ght"},
> +	{"L2T", "L2T-stalls-mem", "[L2T] Stalls because AXI blocks read"},
> +	{"L2T", "L2T-stalls-fill", "[L2T] Stalls because fill pending for victi=
m cache-line"},
> +	{"L2T", "L2T-hitq", "[L2T] Sent request via hit queue"},
> +	{"L2T", "L2T-hitq-full", "[L2T] Sent request via main queue because hit=
 queue is full"},
> +	{"L2T", "L2T-stalls-read-data", "[L2T] Stalls because waiting for data =
from SDRAM"},
> +	{"L2T", "L2T-TMU-read-hits", "[L2T] TMU read hits"},
> +	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
> +	{"L2T", "L2T-VCD-read-hits", "[L2T] VCD read hits"},
> +	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
> +	{"L2T", "L2T-SLC-read-hits", "[L2T] SLC read hits (all slices)"},
> +	{"L2T", "L2T-SLC-read-miss", "[L2T] SLC read misses (all slices)"},
> +	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by watch 0"},
> +	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch 0"},
> +	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write stalls seen by =
watch 0"},
> +	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls seen by wa=
tch 0"},
> +	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes written seen=
 by watch 0"},
> +	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes read seen by =
watch 0"},
> +	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by watch 1"},
> +	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch 1"},
> +	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write stalls seen by =
watch 1"},
> +	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls seen by wa=
tch 1"},
> +	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes written seen=
 by watch 1"},
> +	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes read seen by =
watch 1"},
> +	{"CORE", "core-memory-writes", "[CORE] Total memory writes"},
> +	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
> +	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
> +	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
> +	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
> +	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
> +	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
> +	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
> +	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
> +	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words written"},
> +	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words written"},
> +	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words read"},
> +	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words read"},
> +	{"AXI", "AXI-read-trans", "[AXI] Read transaction count"},
> +	{"AXI", "AXI-write-trans", "[AXI] Write transaction count"},
> +	{"AXI", "AXI-read-wait-cycles", "[AXI] Read total wait cycles"},
> +	{"AXI", "AXI-write-wait-cycles", "[AXI] Write total wait cycles"},
> +	{"AXI", "AXI-max-outstanding-reads", "[AXI] Maximum outstanding read tr=
ansactions"},
> +	{"AXI", "AXI-max-outstanding-writes", "[AXI] Maximum outstanding write =
transactions"},
> +	{"QPU", "QPU-wait-bubble", "[QPU] Pipeline bubble in qcycles due all th=
reads waiting"},
> +	{"QPU", "QPU-ic-miss-bubble", "[QPU] Pipeline bubble in qcycles due ins=
truction-cache miss"},
> +	{"QPU", "QPU-active", "[QPU] Executed shader instruction"},
> +	{"QPU", "QPU-total-active-clk-cycles-fragment-shading", "[QPU] Total ac=
tive clock cycles for all QPUs doing fragment shading (counts only when QPU=
 is not stalled)"},
> +	{"QPU", "QPU-stalls", "[QPU] Stalled qcycles executing shader instructi=
on"},
> +	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading", "[QPU] Total s=
talled clock cycles for all QPUs doing fragment shading"},
> +	{"QPU", "QPU-stalls-TMU", "[QPU] Stalled qcycles waiting for TMU"},
> +	{"QPU", "QPU-stalls-TLB", "[QPU] Stalled qcycles waiting for TLB"},
> +	{"QPU", "QPU-stalls-VPM", "[QPU] Stalled qcycles waiting for VPM"},
> +	{"QPU", "QPU-stalls-uniforms", "[QPU] Stalled qcycles waiting for unifo=
rms"},
> +	{"QPU", "QPU-stalls-SFU", "[QPU] Stalled qcycles waiting for SFU"},
> +	{"QPU", "QPU-stalls-other", "[QPU] Stalled qcycles waiting for any othe=
r reason (vary/W/Z)"},
> +};
> +
>  void v3d_perfmon_get(struct v3d_perfmon *perfmon)
>  {
>  	if (perfmon)
> @@ -234,15 +420,21 @@ int v3d_perfmon_get_counter_ioctl(struct drm_device=
 *dev, void *data,
>  	if (req->counter >=3D v3d->max_counters)
>  		return -EINVAL;
>=20=20
> -	if (v3d->ver >=3D 71) {
> -		WARN_ON(v3d->max_counters !=3D ARRAY_SIZE(v3d_v71_performance_counters=
));
> +	BUILD_BUG_ON(ARRAY_SIZE(v3d_v42_performance_counters) !=3D
> +		     V3D_V42_NUM_PERFCOUNTERS);
> +	BUILD_BUG_ON(ARRAY_SIZE(v3d_v71_performance_counters) !=3D
> +		     V3D_V71_NUM_PERFCOUNTERS);
> +	BUILD_BUG_ON(V3D_MAX_COUNTERS < V3D_V42_NUM_PERFCOUNTERS);
> +	BUILD_BUG_ON(V3D_MAX_COUNTERS < V3D_V71_NUM_PERFCOUNTERS);
> +	BUILD_BUG_ON((V3D_MAX_COUNTERS !=3D V3D_V42_NUM_PERFCOUNTERS) &&
> +		     (V3D_MAX_COUNTERS !=3D V3D_V71_NUM_PERFCOUNTERS));
> +
> +	if (v3d->ver >=3D 71)
>  		counter =3D &v3d_v71_performance_counters[req->counter];
> -	} else if (v3d->ver >=3D 42) {
> -		WARN_ON(v3d->max_counters !=3D ARRAY_SIZE(v3d_v42_performance_counters=
));
> +	else if (v3d->ver >=3D 42)
>  		counter =3D &v3d_v42_performance_counters[req->counter];
> -	} else {
> +	else
>  		return -EOPNOTSUPP;
> -	}
>=20=20
>  	strscpy(req->name, counter->name, sizeof(req->name));
>  	strscpy(req->category, counter->category, sizeof(req->category));
> diff --git a/drivers/gpu/drm/v3d/v3d_performance_counters.h b/drivers/gpu=
/drm/v3d/v3d_performance_counters.h
> index 72822205ebdc..131b2909522a 100644
> --- a/drivers/gpu/drm/v3d/v3d_performance_counters.h
> +++ b/drivers/gpu/drm/v3d/v3d_performance_counters.h
> @@ -19,190 +19,11 @@ struct v3d_perf_counter_desc {
>  	char description[256];
>  };
>=20=20
> -static const struct v3d_perf_counter_desc v3d_v71_performance_counters[]=
 =3D {
> -	{"CORE", "cycle-count", "[CORE] Cycle counter"},
> -	{"CORE", "core-active", "[CORE] Bin/Render/Compute active cycles"},
> -	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread active cycles=
"},
> -	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render thread active =
cycles"},
> -	{"CORE", "compute-active-cycles", "[CORE] Compute active cycles"},
> -	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primiti=
ves that result in no rendered pixels, for all rendered tiles"},
> -	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives=
 for all rendered tiles (primitives may be counted in more than one tile)"},
> -	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped quads"},
> -	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
> -	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads with no pixe=
ls passing the stencil test"},
> -	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB] Quads with n=
o pixels passing the Z and stencil tests"},
> -	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads with any p=
ixels passing the Z and stencil tests"},
> -	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads with valid pi=
xels written to colour buffer"},
> -	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB] Partial qua=
ds written to the colour buffer"},
> -	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives that need cli=
pping"},
> -	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB] Primitives =
discarded by being outside the viewport"},
> -	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives binned"},
> -	{"PTB", "PTB-primitives-discarded-reversed", "[PTB] Primitives that are=
 discarded because they are reversed"},
> -	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total instruction cache hit=
s for all slices"},
> -	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total instruction cache mi=
sses for all slices"},
> -	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms cache hits=
 for all slices"},
> -	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total uniforms cache mis=
ses for all slices"},
> -	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
> -	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
> -	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture cache acces=
ses"},
> -	{"TMU", "TMU-cache-x4-active-cycles", "[TMU] Cache active cycles for x4=
 access"},
> -	{"TMU", "TMU-cache-x4-stalled-cycles", "[TMU] Cache stalled cycles for =
x4 access"},
> -	{"TMU", "TMU-total-text-quads-x4-access", "[TMU] Total texture cache x4=
 access"},
> -	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache hits"},
> -	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache misses"},
> -	{"L2T", "L2T-local", "[L2T] Local mode access"},
> -	{"L2T", "L2T-writeback", "[L2T] Writeback"},
> -	{"L2T", "L2T-zero", "[L2T] Zero"},
> -	{"L2T", "L2T-merge", "[L2T] Merge"},
> -	{"L2T", "L2T-fill", "[L2T] Fill"},
> -	{"L2T", "L2T-stalls-no-wid", "[L2T] Stalls because no WID available"},
> -	{"L2T", "L2T-stalls-no-rid", "[L2T] Stalls because no RID available"},
> -	{"L2T", "L2T-stalls-queue-full", "[L2T] Stalls because internal queue f=
ull"},
> -	{"L2T", "L2T-stalls-wrightback", "[L2T] Stalls because writeback in fli=
ght"},
> -	{"L2T", "L2T-stalls-mem", "[L2T] Stalls because AXI blocks read"},
> -	{"L2T", "L2T-stalls-fill", "[L2T] Stalls because fill pending for victi=
m cache-line"},
> -	{"L2T", "L2T-hitq", "[L2T] Sent request via hit queue"},
> -	{"L2T", "L2T-hitq-full", "[L2T] Sent request via main queue because hit=
 queue is full"},
> -	{"L2T", "L2T-stalls-read-data", "[L2T] Stalls because waiting for data =
from SDRAM"},
> -	{"L2T", "L2T-TMU-read-hits", "[L2T] TMU read hits"},
> -	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
> -	{"L2T", "L2T-VCD-read-hits", "[L2T] VCD read hits"},
> -	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
> -	{"L2T", "L2T-SLC-read-hits", "[L2T] SLC read hits (all slices)"},
> -	{"L2T", "L2T-SLC-read-miss", "[L2T] SLC read misses (all slices)"},
> -	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by watch 0"},
> -	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch 0"},
> -	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write stalls seen by =
watch 0"},
> -	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls seen by wa=
tch 0"},
> -	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes written seen=
 by watch 0"},
> -	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes read seen by =
watch 0"},
> -	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by watch 1"},
> -	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch 1"},
> -	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write stalls seen by =
watch 1"},
> -	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls seen by wa=
tch 1"},
> -	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes written seen=
 by watch 1"},
> -	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes read seen by =
watch 1"},
> -	{"CORE", "core-memory-writes", "[CORE] Total memory writes"},
> -	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
> -	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
> -	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
> -	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
> -	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
> -	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
> -	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
> -	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
> -	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words written"},
> -	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words written"},
> -	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words read"},
> -	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words read"},
> -	{"AXI", "AXI-read-trans", "[AXI] Read transaction count"},
> -	{"AXI", "AXI-write-trans", "[AXI] Write transaction count"},
> -	{"AXI", "AXI-read-wait-cycles", "[AXI] Read total wait cycles"},
> -	{"AXI", "AXI-write-wait-cycles", "[AXI] Write total wait cycles"},
> -	{"AXI", "AXI-max-outstanding-reads", "[AXI] Maximum outstanding read tr=
ansactions"},
> -	{"AXI", "AXI-max-outstanding-writes", "[AXI] Maximum outstanding write =
transactions"},
> -	{"QPU", "QPU-wait-bubble", "[QPU] Pipeline bubble in qcycles due all th=
reads waiting"},
> -	{"QPU", "QPU-ic-miss-bubble", "[QPU] Pipeline bubble in qcycles due ins=
truction-cache miss"},
> -	{"QPU", "QPU-active", "[QPU] Executed shader instruction"},
> -	{"QPU", "QPU-total-active-clk-cycles-fragment-shading", "[QPU] Total ac=
tive clock cycles for all QPUs doing fragment shading (counts only when QPU=
 is not stalled)"},
> -	{"QPU", "QPU-stalls", "[QPU] Stalled qcycles executing shader instructi=
on"},
> -	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading", "[QPU] Total s=
talled clock cycles for all QPUs doing fragment shading"},
> -	{"QPU", "QPU-stalls-TMU", "[QPU] Stalled qcycles waiting for TMU"},
> -	{"QPU", "QPU-stalls-TLB", "[QPU] Stalled qcycles waiting for TLB"},
> -	{"QPU", "QPU-stalls-VPM", "[QPU] Stalled qcycles waiting for VPM"},
> -	{"QPU", "QPU-stalls-uniforms", "[QPU] Stalled qcycles waiting for unifo=
rms"},
> -	{"QPU", "QPU-stalls-SFU", "[QPU] Stalled qcycles waiting for SFU"},
> -	{"QPU", "QPU-stalls-other", "[QPU] Stalled qcycles waiting for any othe=
r reason (vary/W/Z)"},
> -};
>=20=20
> -static const struct v3d_perf_counter_desc v3d_v42_performance_counters[]=
 =3D {
> -	{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primiti=
ves that result in no rendered pixels, for all rendered tiles"},
> -	{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives=
 for all rendered tiles (primitives may be counted in more than one tile)"},
> -	{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped quads"},
> -	{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
> -	{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads with no pixe=
ls passing the stencil test"},
> -	{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB] Quads with n=
o pixels passing the Z and stencil tests"},
> -	{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads with any p=
ixels passing the Z and stencil tests"},
> -	{"TLB", "TLB-quads-with-zero-coverage", "[TLB] Quads with all pixels ha=
ving zero coverage"},
> -	{"TLB", "TLB-quads-with-non-zero-coverage", "[TLB] Quads with any pixel=
s having non-zero coverage"},
> -	{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads with valid pi=
xels written to colour buffer"},
> -	{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB] Primitives =
discarded by being outside the viewport"},
> -	{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives that need cli=
pping"},
> -	{"PTB", "PTB-primitives-discarded-reversed", "[PTB] Primitives that are=
 discarded because they are reversed"},
> -	{"QPU", "QPU-total-idle-clk-cycles", "[QPU] Total idle clock cycles for=
 all QPUs"},
> -	{"QPU", "QPU-total-active-clk-cycles-vertex-coord-shading", "[QPU] Tota=
l active clock cycles for all QPUs doing vertex/coordinate/user shading (co=
unts only when QPU is not stalled)"},
> -	{"QPU", "QPU-total-active-clk-cycles-fragment-shading", "[QPU] Total ac=
tive clock cycles for all QPUs doing fragment shading (counts only when QPU=
 is not stalled)"},
> -	{"QPU", "QPU-total-clk-cycles-executing-valid-instr", "[QPU] Total cloc=
k cycles for all QPUs executing valid instructions"},
> -	{"QPU", "QPU-total-clk-cycles-waiting-TMU", "[QPU] Total clock cycles f=
or all QPUs stalled waiting for TMUs only (counter won't increment if QPU a=
lso stalling for another reason)"},
> -	{"QPU", "QPU-total-clk-cycles-waiting-scoreboard", "[QPU] Total clock c=
ycles for all QPUs stalled waiting for Scoreboard only (counter won't incre=
ment if QPU also stalling for another reason)"},
> -	{"QPU", "QPU-total-clk-cycles-waiting-varyings", "[QPU] Total clock cyc=
les for all QPUs stalled waiting for Varyings only (counter won't increment=
 if QPU also stalling for another reason)"},
> -	{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total instruction cache hit=
s for all slices"},
> -	{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total instruction cache mi=
sses for all slices"},
> -	{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms cache hits=
 for all slices"},
> -	{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total uniforms cache mis=
ses for all slices"},
> -	{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture cache acces=
ses"},
> -	{"TMU", "TMU-total-text-cache-miss", "[TMU] Total texture cache misses =
(number of fetches from memory/L2cache)"},
> -	{"VPM", "VPM-total-clk-cycles-VDW-stalled", "[VPM] Total clock cycles V=
DW is stalled waiting for VPM access"},
> -	{"VPM", "VPM-total-clk-cycles-VCD-stalled", "[VPM] Total clock cycles V=
CD is stalled waiting for VPM access"},
> -	{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread active cycles=
"},
> -	{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render thread active =
cycles"},
> -	{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache hits"},
> -	{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache misses"},
> -	{"CORE", "cycle-count", "[CORE] Cycle counter"},
> -	{"QPU", "QPU-total-clk-cycles-waiting-vertex-coord-shading", "[QPU] Tot=
al stalled clock cycles for all QPUs doing vertex/coordinate/user shading"},
> -	{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading", "[QPU] Total s=
talled clock cycles for all QPUs doing fragment shading"},
> -	{"PTB", "PTB-primitives-binned", "[PTB] Total primitives binned"},
> -	{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by watch 0"},
> -	{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch 0"},
> -	{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write stalls seen by =
watch 0"},
> -	{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls seen by wa=
tch 0"},
> -	{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes written seen=
 by watch 0"},
> -	{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes read seen by =
watch 0"},
> -	{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by watch 1"},
> -	{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch 1"},
> -	{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write stalls seen by =
watch 1"},
> -	{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls seen by wa=
tch 1"},
> -	{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes written seen=
 by watch 1"},
> -	{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes read seen by =
watch 1"},
> -	{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB] Partial qua=
ds written to the colour buffer"},
> -	{"TMU", "TMU-total-config-access", "[TMU] Total config accesses"},
> -	{"L2T", "L2T-no-id-stalled", "[L2T] No ID stall"},
> -	{"L2T", "L2T-command-queue-stalled", "[L2T] Command queue full stall"},
> -	{"L2T", "L2T-TMU-writes", "[L2T] TMU write accesses"},
> -	{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
> -	{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
> -	{"CLE", "CLE-thread-active-cycles", "[CLE] Bin or render thread active =
cycles"},
> -	{"L2T", "L2T-TMU-reads", "[L2T] TMU read accesses"},
> -	{"L2T", "L2T-CLE-reads", "[L2T] CLE read accesses"},
> -	{"L2T", "L2T-VCD-reads", "[L2T] VCD read accesses"},
> -	{"L2T", "L2T-TMU-config-reads", "[L2T] TMU CFG read accesses"},
> -	{"L2T", "L2T-SLC0-reads", "[L2T] SLC0 read accesses"},
> -	{"L2T", "L2T-SLC1-reads", "[L2T] SLC1 read accesses"},
> -	{"L2T", "L2T-SLC2-reads", "[L2T] SLC2 read accesses"},
> -	{"L2T", "L2T-TMU-write-miss", "[L2T] TMU write misses"},
> -	{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
> -	{"L2T", "L2T-CLE-read-miss", "[L2T] CLE read misses"},
> -	{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
> -	{"L2T", "L2T-TMU-config-read-miss", "[L2T] TMU CFG read misses"},
> -	{"L2T", "L2T-SLC0-read-miss", "[L2T] SLC0 read misses"},
> -	{"L2T", "L2T-SLC1-read-miss", "[L2T] SLC1 read misses"},
> -	{"L2T", "L2T-SLC2-read-miss", "[L2T] SLC2 read misses"},
> -	{"CORE", "core-memory-writes", "[CORE] Total memory writes"},
> -	{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
> -	{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
> -	{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
> -	{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
> -	{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
> -	{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
> -	{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
> -	{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
> -	{"GMP", "GMP-memory-reads", "[GMP] Total memory reads"},
> -	{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words written"},
> -	{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words written"},
> -	{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words read"},
> -	{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words read"},
> -	{"TMU", "TMU-MRU-hits", "[TMU] Total MRU hits"},
> -	{"CORE", "compute-active-cycles", "[CORE] Compute active cycles"},
> -};
> +#define V3D_V42_NUM_PERFCOUNTERS (87)
> +#define V3D_V71_NUM_PERFCOUNTERS (93)
> +
> +/* Maximum number of performance counters supported by any version of V3=
D */
> +#define V3D_MAX_COUNTERS (93)
>=20=20
>  #endif

--=20
Jani Nikula, Intel
