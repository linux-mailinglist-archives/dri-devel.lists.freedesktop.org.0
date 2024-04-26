Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A78B40D5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 22:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116111AAA2;
	Fri, 26 Apr 2024 20:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HtH/l0L7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414A11AA94;
 Fri, 26 Apr 2024 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714163532; x=1745699532;
 h=date:from:to:cc:subject:message-id;
 bh=3bHExOdqYcyCmt6ogViu3EK/aQTiP0HSBE9i3t9nrBA=;
 b=HtH/l0L7nr9qWRjxSasmpgJ4lcWnHuMtAay2PY+JEVuBBoDetrtIjzk9
 WKatLPW72UX+aQEvnIElrhuBWFpRuMjyDeb3AojLSS/OZwu7I7dVul4jH
 BFAzDKjwnyvg28SrxkqN0N5ent6YPOsvLwRGcEXm6iGDgXCYE01Y1rlAK
 CGDar2HTYDk5oXkTKgDicrcNhfs1Si++zFtXaiydYdvDwPEbfNx07U4Hz
 J+e1bmyHk4LYgQ+6T3xnmWcae++ArUj3D94eVF/1ydgBDU8z4rsrpDPkU
 G98l3cZaUSPo0Ig2sz36j0F+swNr8fAX/nA+iwnv21beyJjWIaLOFKSYP Q==;
X-CSE-ConnectionGUID: LH0pJZHWSxyNexCdINVpgw==
X-CSE-MsgGUID: EFEJ+SJrTfKYcb1f4Q4tAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10445928"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="10445928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 13:32:11 -0700
X-CSE-ConnectionGUID: pRJrfhhiQ96ykwUd3G181g==
X-CSE-MsgGUID: 4WPFTd39Q06+erqwLTpTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="63005916"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 26 Apr 2024 13:32:08 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s0SEn-0004EQ-1Y;
 Fri, 26 Apr 2024 20:32:05 +0000
Date: Sat, 27 Apr 2024 04:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: [linux-next:master] BUILD REGRESSION
 bb7a2467e6beef44a80a17d45ebf2931e7631083
Message-ID: <202404270435.6z78k4Qz-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: bb7a2467e6beef44a80a17d45ebf2931e7631083  Add linux-next specific files for 20240426

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202404262217.Dt4HoodH-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/riscv/mm/init.c:1495:25: error: 'MODULES_VADDR' undeclared (first use in this function)
arch/riscv/mm/init.c:1496:23: error: 'MODULES_END' undeclared (first use in this function)
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:181:58: error: arithmetic between enumeration type 'enum dentist_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-conversion]
drivers/gpu/drm/drm_mm.c:152:1: error: unused function 'drm_mm_interval_tree_insert' [-Werror,-Wunused-function]
drivers/gpu/drm/drm_mm.c:152:1: error: unused function 'drm_mm_interval_tree_iter_next' [-Werror,-Wunused-function]

Unverified Error/Warning (likely false positive, please contact us if interested):

ERROR: modpost: "add_preferred_console_match" [drivers/tty/serial/serial_base.ko] undefined!
ERROR: modpost: "pnp_bus_type" [drivers/tty/serial/serial_base.ko] undefined!
drivers/usb/dwc3/core.c:679:15: warning: variable 'hw_mode' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- arm-randconfig-r111-20240426
|   `-- drivers-gpu-drm-panel-panel-lg-sw43408.c:sparse:sparse:symbol-sw43408_backlight_ops-was-not-declared.-Should-it-be-static
|-- arm-randconfig-r132-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-randconfig-001-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-randconfig-053-20240427
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-randconfig-r121-20240426
|   |-- drivers-gpu-drm-panel-panel-lg-sw43408.c:(.text):undefined-reference-to-drm_dsc_pps_payload_pack
|   |-- drivers-gpu-drm-panel-panel-lg-sw43408.c:sparse:sparse:symbol-sw43408_backlight_ops-was-not-declared.-Should-it-be-static
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- loongarch-randconfig-r064-20231215
|   `-- ERROR:pnp_bus_type-drivers-tty-serial-serial_base.ko-undefined
|-- mips-allyesconfig
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- mips-randconfig-r064-20240427
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- nios2-allmodconfig
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- nios2-randconfig-001-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- powerpc-randconfig-r061-20240427
|   `-- ERROR:drm_dsc_pps_payload_pack-drivers-gpu-drm-panel-panel-lg-sw43408.ko-undefined
|-- powerpc64-randconfig-001-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- powerpc64-randconfig-002-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- powerpc64-randconfig-r131-20240426
|   |-- drivers-gpu-drm-panel-panel-lg-sw43408.c:sparse:sparse:symbol-sw43408_backlight_ops-was-not-declared.-Should-it-be-static
|   `-- panel-lg-sw43408.c:(.text):undefined-reference-to-drm_dsc_pps_payload_pack
|-- riscv-randconfig-c024-20221028
|   |-- arch-riscv-mm-init.c:error:MODULES_END-undeclared-(first-use-in-this-function)
|   `-- arch-riscv-mm-init.c:error:MODULES_VADDR-undeclared-(first-use-in-this-function)
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|-- s390-randconfig-r064-20240412
|   `-- ERROR:add_preferred_console_match-drivers-tty-serial-serial_base.ko-undefined
|-- sparc-randconfig-001-20240426
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- sparc-randconfig-002-20240426
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|-- sparc-randconfig-r112-20240426
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|-- x86_64-buildonly-randconfig-002-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-012-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-013-20240426
|   |-- drivers-gpu-drm-panel-panel-lg-sw43408.c:(.text):undefined-reference-to-drm_dsc_pps_payload_pack
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-014-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-015-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-075-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-122-20240426
|   `-- drivers-gpu-drm-panel-panel-lg-sw43408.c:sparse:sparse:symbol-sw43408_backlight_ops-was-not-declared.-Should-it-be-static
|-- x86_64-randconfig-161-20240426
|   |-- drivers-pwm-core.c-pwm_cdev_ioctl()-warn:possible-spectre-second-half.-pwm
|   `-- drivers-pwm-core.c-pwm_cdev_ioctl()-warn:potential-spectre-issue-cdata-pwm-r
`-- xtensa-randconfig-001-20240426
    `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
clang_recent_errors
|-- arm-randconfig-001-20240426
|   |-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|   `-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-node_stat_item-and-enum-lru_list-)-Werror-Wenum-enum-conversion
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|   |-- drivers-gpu-drm-i915-display-intel_cursor.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-phy-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_dpll_mgr.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-intel_dpll_id-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_hotplug.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_pipe_crc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:arithmetic-between-different-enumeration-types-(-enum-intel_display_power_domain-and-enum-tc_port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_vdsc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-skl_universal_plane.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-skl_watermark.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-renesas-rcar-du-rcar_cmm.c:error:unused-function-rcar_cmm_read-Werror-Wunused-function
|   |-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|   |-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-node_stat_item-and-enum-lru_list-)-Werror-Wenum-enum-conversion
|   `-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-zone_stat_item-and-enum-numa_stat_item-)-Werror-Wenum-enum-conversion
|-- arm64-randconfig-r063-20240427
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- hexagon-allmodconfig
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   `-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|-- hexagon-randconfig-r012-20220322
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-randconfig-002-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-randconfig-006-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- i386-randconfig-061-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dml2-dml21-src-dml2_dpmm-dml2_dpmm_dcn4.c:error:arithmetic-between-enumeration-type-enum-dentist_divider_range-and-floating-point-type-double-Werror-Wenum-floa
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|   |-- drivers-gpu-drm-i915-display-intel_cursor.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-phy-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_dpll_mgr.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-intel_dpll_id-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_hotplug.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_pipe_crc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:arithmetic-between-different-enumeration-types-(-enum-intel_display_power_domain-and-enum-tc_port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_vdsc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-skl_universal_plane.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-skl_watermark.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|   |-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-node_stat_item-and-enum-lru_list-)-Werror-Wenum-enum-conversion
|   `-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-zone_stat_item-and-enum-numa_stat_item-)-Werror-Wenum-enum-conversion
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|   |-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|   |-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-node_stat_item-and-enum-lru_list-)-Werror-Wenum-enum-conversion
|   `-- include-linux-vmstat.h:error:arithmetic-between-different-enumeration-types-(-enum-zone_stat_item-and-enum-numa_stat_item-)-Werror-Wenum-enum-conversion
|-- x86_64-allnoconfig
|   |-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-display-exynos
|   |-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-reserved-memory-qcom
|   `-- net-ipv6-udp.c:trace-events-udp.h-is-included-more-than-once.
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-bridge-synopsys-dw-hdmi-i2s-audio.c:error:unused-function-hdmi_read-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|   |-- drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc_freq_target_hi_bits-Werror-Wunused-function
|   |-- drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc_freq_target_low_bits-Werror-Wunused-function
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-buildonly-randconfig-001-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-004-20240426
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-006-20240426
|   `-- ld.lld:error:undefined-symbol:drm_dsc_pps_payload_pack
|-- x86_64-randconfig-011-20240426
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
|   |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
|   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
|-- x86_64-randconfig-103-20240427
|   `-- ld.lld:error:undefined-symbol:drm_dsc_pps_payload_pack
|-- x86_64-randconfig-104-20240427
|   `-- ld.lld:error:undefined-symbol:drm_dsc_pps_payload_pack
`-- x86_64-randconfig-123-20240426
    |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_insert-Werror-Wunused-function
    |-- drivers-gpu-drm-drm_mm.c:error:unused-function-drm_mm_interval_tree_iter_next-Werror-Wunused-function
    `-- drivers-gpu-drm-panel-panel-lg-sw43408.c:sparse:sparse:symbol-sw43408_backlight_ops-was-not-declared.-Should-it-be-static

elapsed time: 737m

configs tested: 179
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240426   gcc  
arc                   randconfig-002-20240426   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                      footbridge_defconfig   clang
arm                   randconfig-001-20240426   clang
arm                   randconfig-002-20240426   gcc  
arm                   randconfig-003-20240426   gcc  
arm                   randconfig-004-20240426   gcc  
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240426   gcc  
arm64                 randconfig-002-20240426   gcc  
arm64                 randconfig-003-20240426   clang
arm64                 randconfig-004-20240426   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240426   gcc  
csky                  randconfig-002-20240426   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240426   clang
hexagon               randconfig-002-20240426   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240426   gcc  
i386         buildonly-randconfig-002-20240426   clang
i386         buildonly-randconfig-003-20240426   gcc  
i386         buildonly-randconfig-004-20240426   gcc  
i386         buildonly-randconfig-005-20240426   clang
i386         buildonly-randconfig-006-20240426   clang
i386                                defconfig   clang
i386                  randconfig-001-20240426   gcc  
i386                  randconfig-002-20240426   clang
i386                  randconfig-003-20240426   gcc  
i386                  randconfig-004-20240426   gcc  
i386                  randconfig-005-20240426   gcc  
i386                  randconfig-006-20240426   clang
i386                  randconfig-011-20240426   gcc  
i386                  randconfig-012-20240426   clang
i386                  randconfig-013-20240426   clang
i386                  randconfig-014-20240426   clang
i386                  randconfig-015-20240426   clang
i386                  randconfig-016-20240426   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240426   gcc  
loongarch             randconfig-002-20240426   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                           xway_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240426   gcc  
nios2                 randconfig-002-20240426   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240426   gcc  
parisc                randconfig-002-20240426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                 mpc834x_itx_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20240426   clang
powerpc               randconfig-002-20240426   gcc  
powerpc               randconfig-003-20240426   clang
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20240426   gcc  
powerpc64             randconfig-002-20240426   gcc  
powerpc64             randconfig-003-20240426   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240426   clang
riscv                 randconfig-002-20240426   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240426   clang
s390                  randconfig-002-20240426   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240426   gcc  
sh                    randconfig-002-20240426   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240426   gcc  
sparc64               randconfig-002-20240426   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240426   gcc  
um                    randconfig-002-20240426   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240426   clang
x86_64       buildonly-randconfig-002-20240426   gcc  
x86_64       buildonly-randconfig-003-20240426   clang
x86_64       buildonly-randconfig-004-20240426   clang
x86_64       buildonly-randconfig-005-20240426   gcc  
x86_64       buildonly-randconfig-006-20240426   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240426   gcc  
x86_64                randconfig-002-20240426   gcc  
x86_64                randconfig-003-20240426   gcc  
x86_64                randconfig-004-20240426   clang
x86_64                randconfig-005-20240426   clang
x86_64                randconfig-006-20240426   clang
x86_64                randconfig-011-20240426   clang
x86_64                randconfig-012-20240426   gcc  
x86_64                randconfig-013-20240426   gcc  
x86_64                randconfig-014-20240426   gcc  
x86_64                randconfig-015-20240426   gcc  
x86_64                randconfig-016-20240426   clang
x86_64                randconfig-071-20240426   clang
x86_64                randconfig-072-20240426   clang
x86_64                randconfig-073-20240426   clang
x86_64                randconfig-074-20240426   gcc  
x86_64                randconfig-075-20240426   gcc  
x86_64                randconfig-076-20240426   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240426   gcc  
xtensa                randconfig-002-20240426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
