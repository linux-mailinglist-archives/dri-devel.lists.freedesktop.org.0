Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34B8CA6F5
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 05:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA30310E6B2;
	Tue, 21 May 2024 03:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR2Z1nkZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F384D10E6B2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 03:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716261868; x=1747797868;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=XhD+cOdFiGdcs525aKCiTE3M7UB8+t8OXiB3QK5sJ44=;
 b=KR2Z1nkZrkjiRrkFULYJb5J93ew0Q1gXf1c1+2U7q58tIrI5JvwxOBcl
 HXeDpX8l2SZx7qSvAiYBOJWpjTJTvF3XHQSwOsdwh9sI0hC5X7iOK/cfD
 YIDrBtGtXHHiYEtIKjlD8vhl7wgpUmvZ1pvQKsn7nnmLpj/dOEesLo2B5
 0VIJMV7jAiDtPI75jQqhF80MCF/O/CcX2gMLrQW+rw71KN4W1S96AtDsJ
 dw2slVaGcm54RZCo18kCZgSYzVKx+FWOT37p0/tcj6CapfgV4H16ZDyCH
 gAQnsORShxWYiUg4fMH6l7VjjDfrg7LgSRdCxVosl8sR2yRNJvjdiTOUr A==;
X-CSE-ConnectionGUID: OoXaSdFjSrud+Mceoi24Cw==
X-CSE-MsgGUID: WZ4+rvP4QbGbaim/CCXuxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15373852"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="15373852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 20:24:27 -0700
X-CSE-ConnectionGUID: 4xEtwLa5S9WixpoSgM5zsg==
X-CSE-MsgGUID: lt12Ff/OS1mYithGDJyo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="33355449"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 20 May 2024 20:24:25 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s9G6x-0005Um-1S;
 Tue, 21 May 2024 03:24:23 +0000
Date: Tue, 21 May 2024 11:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Iago Toral Quiroga <itoral@igalia.com>
Subject: [drm-misc:drm-misc-next 1/6]
 drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning:
 'v3d_v42_performance_counters' defined but not used
Message-ID: <202405211137.hueFkLKG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   673087d8b023faf34b84e8faf63bbeea3da87bab
commit: 3cbcbe016c31ad4fe1b7a53b325c1a36be6191f4 [1/6] drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240521/202405211137.hueFkLKG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211137.hueFkLKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211137.hueFkLKG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                    from drivers/gpu/drm/v3d/v3d_bo.c:25:
>> drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: warning: 'v3d_v42_performance_counters' defined but not used [-Wunused-const-variable=]
     118 | static const struct v3d_perf_counter_desc v3d_v42_performance_counters[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/v3d/v3d_performance_counters.h:22:43: warning: 'v3d_v71_performance_counters' defined but not used [-Wunused-const-variable=]
      22 | static const struct v3d_perf_counter_desc v3d_v71_performance_counters[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/v3d_v42_performance_counters +118 drivers/gpu/drm/v3d/v3d_performance_counters.h

   117	
 > 118	static const struct v3d_perf_counter_desc v3d_v42_performance_counters[] = {
   119		{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primitives that result in no rendered pixels, for all rendered tiles"},
   120		{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives for all rendered tiles (primitives may be counted in more than one tile)"},
   121		{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped quads"},
   122		{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
   123		{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads with no pixels passing the stencil test"},
   124		{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB] Quads with no pixels passing the Z and stencil tests"},
   125		{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads with any pixels passing the Z and stencil tests"},
   126		{"TLB", "TLB-quads-with-zero-coverage", "[TLB] Quads with all pixels having zero coverage"},
   127		{"TLB", "TLB-quads-with-non-zero-coverage", "[TLB] Quads with any pixels having non-zero coverage"},
   128		{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads with valid pixels written to colour buffer"},
   129		{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB] Primitives discarded by being outside the viewport"},
   130		{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives that need clipping"},
   131		{"PTB", "PTB-primitives-discarded-reversed", "[PTB] Primitives that are discarded because they are reversed"},
   132		{"QPU", "QPU-total-idle-clk-cycles", "[QPU] Total idle clock cycles for all QPUs"},
   133		{"QPU", "QPU-total-active-clk-cycles-vertex-coord-shading", "[QPU] Total active clock cycles for all QPUs doing vertex/coordinate/user shading (counts only when QPU is not stalled)"},
   134		{"QPU", "QPU-total-active-clk-cycles-fragment-shading", "[QPU] Total active clock cycles for all QPUs doing fragment shading (counts only when QPU is not stalled)"},
   135		{"QPU", "QPU-total-clk-cycles-executing-valid-instr", "[QPU] Total clock cycles for all QPUs executing valid instructions"},
   136		{"QPU", "QPU-total-clk-cycles-waiting-TMU", "[QPU] Total clock cycles for all QPUs stalled waiting for TMUs only (counter won't increment if QPU also stalling for another reason)"},
   137		{"QPU", "QPU-total-clk-cycles-waiting-scoreboard", "[QPU] Total clock cycles for all QPUs stalled waiting for Scoreboard only (counter won't increment if QPU also stalling for another reason)"},
   138		{"QPU", "QPU-total-clk-cycles-waiting-varyings", "[QPU] Total clock cycles for all QPUs stalled waiting for Varyings only (counter won't increment if QPU also stalling for another reason)"},
   139		{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total instruction cache hits for all slices"},
   140		{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total instruction cache misses for all slices"},
   141		{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms cache hits for all slices"},
   142		{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total uniforms cache misses for all slices"},
   143		{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture cache accesses"},
   144		{"TMU", "TMU-total-text-cache-miss", "[TMU] Total texture cache misses (number of fetches from memory/L2cache)"},
   145		{"VPM", "VPM-total-clk-cycles-VDW-stalled", "[VPM] Total clock cycles VDW is stalled waiting for VPM access"},
   146		{"VPM", "VPM-total-clk-cycles-VCD-stalled", "[VPM] Total clock cycles VCD is stalled waiting for VPM access"},
   147		{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread active cycles"},
   148		{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render thread active cycles"},
   149		{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache hits"},
   150		{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache misses"},
   151		{"CORE", "cycle-count", "[CORE] Cycle counter"},
   152		{"QPU", "QPU-total-clk-cycles-waiting-vertex-coord-shading", "[QPU] Total stalled clock cycles for all QPUs doing vertex/coordinate/user shading"},
   153		{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading", "[QPU] Total stalled clock cycles for all QPUs doing fragment shading"},
   154		{"PTB", "PTB-primitives-binned", "[PTB] Total primitives binned"},
   155		{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by watch 0"},
   156		{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch 0"},
   157		{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write stalls seen by watch 0"},
   158		{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls seen by watch 0"},
   159		{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes written seen by watch 0"},
   160		{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes read seen by watch 0"},
   161		{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by watch 1"},
   162		{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch 1"},
   163		{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write stalls seen by watch 1"},
   164		{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls seen by watch 1"},
   165		{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes written seen by watch 1"},
   166		{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes read seen by watch 1"},
   167		{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB] Partial quads written to the colour buffer"},
   168		{"TMU", "TMU-total-config-access", "[TMU] Total config accesses"},
   169		{"L2T", "L2T-no-id-stalled", "[L2T] No ID stall"},
   170		{"L2T", "L2T-command-queue-stalled", "[L2T] Command queue full stall"},
   171		{"L2T", "L2T-TMU-writes", "[L2T] TMU write accesses"},
   172		{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
   173		{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
   174		{"CLE", "CLE-thread-active-cycles", "[CLE] Bin or render thread active cycles"},
   175		{"L2T", "L2T-TMU-reads", "[L2T] TMU read accesses"},
   176		{"L2T", "L2T-CLE-reads", "[L2T] CLE read accesses"},
   177		{"L2T", "L2T-VCD-reads", "[L2T] VCD read accesses"},
   178		{"L2T", "L2T-TMU-config-reads", "[L2T] TMU CFG read accesses"},
   179		{"L2T", "L2T-SLC0-reads", "[L2T] SLC0 read accesses"},
   180		{"L2T", "L2T-SLC1-reads", "[L2T] SLC1 read accesses"},
   181		{"L2T", "L2T-SLC2-reads", "[L2T] SLC2 read accesses"},
   182		{"L2T", "L2T-TMU-write-miss", "[L2T] TMU write misses"},
   183		{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
   184		{"L2T", "L2T-CLE-read-miss", "[L2T] CLE read misses"},
   185		{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
   186		{"L2T", "L2T-TMU-config-read-miss", "[L2T] TMU CFG read misses"},
   187		{"L2T", "L2T-SLC0-read-miss", "[L2T] SLC0 read misses"},
   188		{"L2T", "L2T-SLC1-read-miss", "[L2T] SLC1 read misses"},
   189		{"L2T", "L2T-SLC2-read-miss", "[L2T] SLC2 read misses"},
   190		{"CORE", "core-memory-writes", "[CORE] Total memory writes"},
   191		{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
   192		{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
   193		{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
   194		{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
   195		{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
   196		{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
   197		{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
   198		{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
   199		{"GMP", "GMP-memory-reads", "[GMP] Total memory reads"},
   200		{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words written"},
   201		{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words written"},
   202		{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words read"},
   203		{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words read"},
   204		{"TMU", "TMU-MRU-hits", "[TMU] Total MRU hits"},
   205		{"CORE", "compute-active-cycles", "[CORE] Compute active cycles"},
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
