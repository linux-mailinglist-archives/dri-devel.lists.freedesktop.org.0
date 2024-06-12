Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A933904B12
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 07:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FED89FA5;
	Wed, 12 Jun 2024 05:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhUNtjzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A461989FA5;
 Wed, 12 Jun 2024 05:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718171618; x=1749707618;
 h=date:from:to:cc:subject:message-id;
 bh=8EOQg9fQszyqBPY1SqPjlEW2wu5FnNbiEyDuGU169To=;
 b=nhUNtjzQSODIUR+MioQgQJumQcIqspyizTgnp6TrlEm+2Qk41BSwbWz3
 1babwihBlPl+TS5ULex/2og7eJ96QLVib5cz0HyHb7x5AWngyy2MtiH0y
 E5QfneqZp2TZfcgsohchUAKA/J3td4vEkbwxyuxa6K3SKjND9hAG824ka
 bB2k5DbTyZLjvQetMQP3Bmp+pZdryZ1OCORyFfYXZonb3HWUaFWDf8R5C
 Q0f51phlErLk3CkXNcMca5QpwPxPk3vMQXdrPoRCzcl5tdtPBLmL52nVq
 tbTueGaea1H9BmfO2U17UE2//SWwCGZxYDsgGhtX1HGWfF5Z564RMImbC g==;
X-CSE-ConnectionGUID: 6hvpmjbXTOuYwBBRKIChpw==
X-CSE-MsgGUID: RZw52UvHRRKQ0cluvssVSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14641134"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14641134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 22:53:36 -0700
X-CSE-ConnectionGUID: dZ7joJbtQ9yTHGHcYb3Nhw==
X-CSE-MsgGUID: PFR5GHUAQH6Ig9vCIP+cEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="77131767"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 11 Jun 2024 22:53:32 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sHGvJ-0001Fm-2e;
 Wed, 12 Jun 2024 05:53:29 +0000
Date: Wed, 12 Jun 2024 13:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 a957267fa7e9159d3d2ee1421359ebf228570c68
Message-ID: <202406121353.QfMToZQo-lkp@intel.com>
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
branch HEAD: a957267fa7e9159d3d2ee1421359ebf228570c68  Add linux-next specific files for 20240611

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406111949.9WfZTbkM-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202406121201.YnEA7WOO-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/pinctrl/pinctrl-keembay.c:1630:35: error: 'struct function_desc' has no member named 'name'
or1k-linux-ld: sound/soc/tegra/tegra210_i2s.c:932:(.text+0x668): undefined reference to `simple_util_get_sample_fmt'
powerpc-linux-ld: tegra210_i2s.c:(.text+0x56c): undefined reference to `simple_util_get_sample_fmt'
sound/soc/tegra/tegra210_i2s.c:922:(.text+0x62c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `simple_util_parse_convert'
sound/soc/tegra/tegra210_i2s.c:922:(.text+0x62c): undefined reference to `simple_util_parse_convert'
sound/soc/tegra/tegra210_i2s.c:932:(.text+0x668): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `simple_util_get_sample_fmt'
tegra210_i2s.c:(.text+0x538): undefined reference to `simple_util_parse_convert'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-r131-20240611
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- arm-randconfig-051-20240611
|   |-- arch-arm-boot-dts-rockchip-rk3128-evb.dtb:dsi:failed-to-match-any-schema-with-compatible:rockchip-rk3128-mipi-dsi-snps-dw-mipi-dsi
|   `-- arch-arm-boot-dts-rockchip-rk3128-xpi-.dtb:dsi:failed-to-match-any-schema-with-compatible:rockchip-rk3128-mipi-dsi-snps-dw-mipi-dsi
|-- arm64-randconfig-001-20240612
|   `-- drivers-pinctrl-pinctrl-keembay.c:error:struct-function_desc-has-no-member-named-name
|-- i386-randconfig-061-20240611
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- i386-randconfig-062-20240611
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- i386-randconfig-r132-20240611
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-hubbub-dcn401-dcn401_hubbub.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|   `-- drivers-thermal-thermal_trip.o:warning:objtool:unexpected-relocation-symbol-type-in-.rela.discard.reachable
|-- microblaze-allmodconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-allnoconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-allyesconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-defconfig
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-randconfig-051-20240611
|   |-- arch-microblaze-boot-dts-system.dtb::memory:False-schema-does-not-allow-device_type:memory-reg:
|   |-- arch-microblaze-boot-dts-system.dtb:amba_pl-dma-41e00000:failed-to-match-any-schema-with-compatible:xlnx-eth-dma
|   |-- arch-microblaze-boot-dts-system.dtb:amba_pl-i2c-i2cswitch-i2c-clock-generator-5d:failed-to-match-any-schema-with-compatible:silabs-si570
|   |-- arch-microblaze-boot-dts-system.dtb:amba_pl-serial-44a00000:failed-to-match-any-schema-with-compatible:xlnx-xps-uart16550-..a-ns16550a
|   |-- arch-microblaze-boot-dts-system.dtb:amba_pl:gpio-restart:ranges-is-a-required-property
|   |-- arch-microblaze-boot-dts-system.dtb:amba_pl:nodename:amba_pl-does-not-match-(-a-z-a-z0-bus-bus-localbus-soc-axi-ahb-apb)(-.-)
|   |-- arch-microblaze-boot-dts-system.dtb:clk_bus_0:linux-phandle-reg-do-not-match-any-of-the-regexes:pinctrl
|   |-- arch-microblaze-boot-dts-system.dtb:clk_cpu:linux-phandle-reg-do-not-match-any-of-the-regexes:pinctrl
|   |-- arch-microblaze-boot-dts-system.dtb:cpus-cpu:failed-to-match-any-schema-with-compatible:xlnx-microblaze-.
|   |-- arch-microblaze-boot-dts-system.dtb:ethernet-40c00000:axistream-control-connected-clock-frequency-device_type-linux-phandle-local-mac-address-xlnx-xlnx-axiliteclkrate-xlnx-axisclkrate-xlnx-clockselect
|   |-- arch-microblaze-boot-dts-system.dtb:ethernet-40c00000:reg:is-too-short
|   |-- arch-microblaze-boot-dts-system.dtb:flash:partition-partition-partition-partition-partition-do-not-match-any-of-the-regexes:.-names-.-supply-.-cells-a-zA-Z0-._-a-zA-Z0-a-zA-Z0-._-a-zA-Z0-a-zA-Z0-._-9a
|   |-- arch-microblaze-boot-dts-system.dtb:i2c:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-clock-frequency-i2cswitch-were-unexpected)
|   |-- arch-microblaze-boot-dts-system.dtb:i2c:clock-frequency:is-greater-than-the-maximum-of
|   |-- arch-microblaze-boot-dts-system.dtb:i2c:clock-frequency:is-not-one-of
|   |-- arch-microblaze-boot-dts-system.dtb:i2cswitch:Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-i2c-i2c-were-unexpected)
|   |-- arch-microblaze-boot-dts-system.dtb:i2cswitch:nodename:i2cswitch-does-not-match-(i2c-)-mux
|   |-- arch-microblaze-boot-dts-system.dtb:timer-41c00000:clock-frequency-xlnx-gen0-assert-xlnx-gen1-assert-xlnx-trig0-assert-xlnx-trig1-assert-do-not-match-any-of-the-regexes:pinctrl
|   |-- arch-microblaze-boot-dts-system.dtb:timer-41c00000:clock-names-is-a-required-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- microblaze-randconfig-r051-20240611
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(simple_bus_reg):amba_pl-gpio-restart:missing-or-empty-reg-ranges-property
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_format):amba_pl-flash-partition:unit-name-should-not-have-leading-0s
|   |-- arch-microblaze-boot-dts-system.dts.-.:Warning-(unit_address_vs_reg):memory:node-has-a-reg-or-ranges-property-but-no-unit-name
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-dma-41e00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-i2c:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-serial-44a00000:clocks:cell-is-not-a-phandle-reference
|   |-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):amba_pl-timer-41c00000:clocks:cell-is-not-a-phandle-reference
|   `-- arch-microblaze-boot-dts-system.dts.:Warning-(clocks_property):cpus-cpu:clocks:cell-is-not-a-phandle-reference
|-- nios2-randconfig-r113-20240611
|   |-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-buf-got-void-noderef-__iomem
|   `-- drivers-mtd-nand-raw-mxc_nand.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-unsigned-short-noderef-usertype-__iomem-t-got-void-buf
|-- openrisc-randconfig-r036-20220522
|   |-- or1k-linux-ld:sound-soc-tegra-tegra210_i2s.c:(.text):undefined-reference-to-simple_util_get_sample_fmt
|   |-- sound-soc-tegra-tegra210_i2s.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-undefined-symbol-simple_util_get_sample_fmt
|   |-- sound-soc-tegra-tegra210_i2s.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-undefined-symbol-simple_util_parse_convert
|   `-- sound-soc-tegra-tegra210_i2s.c:(.text):undefined-reference-to-simple_util_parse_convert
|-- parisc-randconfig-001-20240611
|   |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- parisc-randconfig-r123-20240611
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- powerpc-randconfig-c003-20220322
|   |-- powerpc-linux-ld:tegra210_i2s.c:(.text):undefined-reference-to-simple_util_get_sample_fmt
|   `-- tegra210_i2s.c:(.text):undefined-reference-to-simple_util_parse_convert
`-- sparc64-randconfig-001-20240611
    |-- kernel-trace-fgraph.c:warning:fgraph_pid_func-defined-but-not-used
    |-- kernel-trace-fgraph.c:warning:unused-variable-gops
    `-- kernel-trace-fgraph.c:warning:unused-variable-op
clang_recent_errors
|-- arm-randconfig-003-20240611
|   |-- kernel-trace-fgraph.c:warning:unused-variable-gops
|   `-- kernel-trace-fgraph.c:warning:unused-variable-op
|-- arm64-randconfig-r112-20240611
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- i386-randconfig-052-20240611
|   `-- drivers-gpu-drm-drm_mm.c:error:function-drm_mm_node_scanned_block-is-not-needed-and-will-not-be-emitted-Werror-Wunneeded-internal-declaration
|-- i386-randconfig-063-20240611
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|   |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
|   `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
|-- i386-randconfig-141-20240611
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vm.c-amdgpu_vm_bo_update()-error:we-previously-assumed-bo-could-be-null-(see-line-)
|   |-- drivers-gpu-drm-i915-display-intel_dpt.c-intel_dpt_pin_to_ggtt()-error:uninitialized-symbol-vma-.
|   |-- drivers-gpu-drm-i915-display-intel_fb_pin.c-intel_fb_pin_to_dpt()-error:uninitialized-symbol-vma-.
|   |-- drivers-gpu-drm-i915-display-intel_fb_pin.c-intel_fb_pin_to_dpt()-error:vma-dereferencing-possible-ERR_PTR()
|   |-- drivers-gpu-drm-xe-xe_drm_client.c-show_run_ticks()-error:uninitialized-symbol-gpu_timestamp-.
|   |-- drivers-gpu-drm-xe-xe_drm_client.c-show_run_ticks()-error:uninitialized-symbol-hwe-.
|   `-- drivers-gpu-drm-xe-xe_sched_job.c-xe_sched_job_arm()-error:uninitialized-symbol-fence-.
`-- x86_64-randconfig-122-20240611
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-B-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash1-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-new_hash2-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-orig_hash-got-struct-ftrace_hash-noderef-__rcu
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-ftrace_hash-src-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-assigned-filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-filter_hash-got-struct-ftrace_hash-save_filter_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-assigned-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-noderef-__rcu-notrace_hash-got-struct-ftrace_hash-save_notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash
    |-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_filter_hash-got-struct-ftrace_hash-noderef-__rcu-filter_hash
    `-- kernel-trace-ftrace.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-struct-ftrace_hash-save_notrace_hash-got-struct-ftrace_hash-noderef-__rcu-notrace_hash

elapsed time: 1344m

configs tested: 174
configs skipped: 9

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240611   gcc-13.2.0
arc                   randconfig-002-20240611   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                       aspeed_g4_defconfig   clang-19
arm                         bcm2835_defconfig   clang-19
arm                                 defconfig   clang-14
arm                        keystone_defconfig   gcc-13.2.0
arm                        mvebu_v5_defconfig   gcc-13.2.0
arm                             mxs_defconfig   clang-19
arm                   randconfig-001-20240611   gcc-13.2.0
arm                   randconfig-002-20240611   clang-19
arm                   randconfig-003-20240611   clang-15
arm                   randconfig-004-20240611   clang-19
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240611   clang-19
arm64                 randconfig-002-20240611   clang-17
arm64                 randconfig-003-20240611   clang-19
arm64                 randconfig-004-20240611   gcc-13.2.0
csky                             allmodconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                             allyesconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240611   gcc-13.2.0
csky                  randconfig-002-20240611   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240611   clang-19
hexagon               randconfig-002-20240611   clang-14
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240611   gcc-13
i386         buildonly-randconfig-002-20240611   gcc-11
i386         buildonly-randconfig-003-20240611   clang-18
i386         buildonly-randconfig-004-20240611   gcc-7
i386         buildonly-randconfig-005-20240611   gcc-11
i386         buildonly-randconfig-006-20240611   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240611   clang-18
i386                  randconfig-002-20240611   gcc-7
i386                  randconfig-003-20240611   gcc-13
i386                  randconfig-004-20240611   clang-18
i386                  randconfig-005-20240611   gcc-9
i386                  randconfig-006-20240611   clang-18
i386                  randconfig-011-20240611   clang-18
i386                  randconfig-012-20240611   gcc-10
i386                  randconfig-013-20240611   clang-18
i386                  randconfig-014-20240611   gcc-13
i386                  randconfig-015-20240611   clang-18
i386                  randconfig-016-20240611   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240611   gcc-13.2.0
loongarch             randconfig-002-20240611   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   gcc-13.2.0
mips                        maltaup_defconfig   clang-19
mips                        vocore2_defconfig   clang-15
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240611   gcc-13.2.0
nios2                 randconfig-002-20240611   gcc-13.2.0
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240611   gcc-13.2.0
parisc                randconfig-002-20240611   gcc-13.2.0
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang-19
powerpc                       holly_defconfig   clang-19
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240611   gcc-13.2.0
powerpc               randconfig-002-20240611   clang-19
powerpc               randconfig-003-20240611   clang-19
powerpc                     stx_gp3_defconfig   clang-19
powerpc                        warp_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240611   gcc-13.2.0
powerpc64             randconfig-002-20240611   clang-19
powerpc64             randconfig-003-20240611   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang
riscv                 randconfig-001-20240611   gcc-13.2.0
riscv                 randconfig-002-20240611   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang
s390                  randconfig-001-20240611   gcc-13.2.0
s390                  randconfig-002-20240611   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240611   gcc-13.2.0
sh                    randconfig-002-20240611   gcc-13.2.0
sh                           se7722_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240611   gcc-13.2.0
sparc64               randconfig-002-20240611   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang
um                               allyesconfig   gcc-13
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240611   gcc-11
um                    randconfig-002-20240611   gcc-13
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240611   gcc-13
x86_64       buildonly-randconfig-002-20240611   gcc-9
x86_64       buildonly-randconfig-003-20240611   gcc-13
x86_64       buildonly-randconfig-004-20240611   clang-18
x86_64       buildonly-randconfig-005-20240611   gcc-9
x86_64       buildonly-randconfig-006-20240611   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240611   clang-18
x86_64                randconfig-002-20240611   gcc-12
x86_64                randconfig-003-20240611   gcc-8
x86_64                randconfig-004-20240611   clang-18
x86_64                randconfig-005-20240611   gcc-10
x86_64                randconfig-006-20240611   clang-18
x86_64                randconfig-011-20240611   clang-18
x86_64                randconfig-012-20240611   gcc-13
x86_64                randconfig-013-20240611   clang-18
x86_64                randconfig-014-20240611   clang-18
x86_64                randconfig-015-20240611   clang-18
x86_64                randconfig-016-20240611   gcc-11
x86_64                randconfig-071-20240611   clang-18
x86_64                randconfig-072-20240611   gcc-9
x86_64                randconfig-073-20240611   clang-18
x86_64                randconfig-074-20240611   gcc-11
x86_64                randconfig-075-20240611   gcc-13
x86_64                randconfig-076-20240611   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240611   gcc-13.2.0
xtensa                randconfig-002-20240611   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
