Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193C878779A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 20:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CAA10E5AB;
	Thu, 24 Aug 2023 18:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011A810E5A7;
 Thu, 24 Aug 2023 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692901186; x=1724437186;
 h=date:from:to:cc:subject:message-id;
 bh=KBHkj7fzcIJg0KrCWqTdGCNjPHAqvcLqIcfCGqNO8Yo=;
 b=RTcpkYsFIUhj2fxdsP6uY1lEMw0P0DvtSHXshNon5lnwo/FtPgfZ6MTV
 0bfhbV0iNkaV8j5FrVLeQRUx5LOz72C1Q17b1PS43Qb3hHt8Dd9KzkgJd
 +WdDn1p8YjnTiMKI6/dnUSNPhwkq5DDWTs1LADToRqtqqxcp85xwTPCvz
 +LRWXyQ/4im5KNCm3H7v3o0oohKzSvkSozFkohxX6voQDKZY61RXjR9+z
 QOEY9XZfkdyrRCg0q0EnxWElcVjX0Fr5potGiqZqLnhNFS1xKPhrUVEy/
 kceBaaWnF8Vn4UOHwaBC06jqB1AyUBo/W7Rp9w5HGiebXUyiSFraIupY2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405522485"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="405522485"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 11:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860814171"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="860814171"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 11:19:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZEvg-0002tY-29;
 Thu, 24 Aug 2023 18:19:36 +0000
Date: Fri, 25 Aug 2023 02:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 2b3bd393093b04d4882152398019cbb96b0440ff
Message-ID: <202308250221.YqxTUwh9-lkp@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-edac@vger.kernel.org,
 linux-cifs@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 Linux Memory Management List <linux-mm@kvack.org>, keyrings@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, dmaengine@vger.kernel.org, cgroups@vger.kernel.org,
 bpf@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-crypto@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 2b3bd393093b04d4882152398019cbb96b0440ff  Add linux-next specific files for 20230824

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308111853.ISf5a6VC-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308112307.TPmYbd3L-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308112326.AJAVWCOC-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308162234.Y7j8JEIF-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308170007.OzhdwITj-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308170206.fZG3V1Gy-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308171521.DFEZZNuE-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308171801.P2Rd8yeL-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308211837.4VBSUAtZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308212225.fGjY1rr6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308212225.rDBrZgwf-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308212348.1TirdKeg-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308220024.7HnE6uda-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308220116.C2UzYhrZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308220517.9ZeSFZc3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308220614.h0EIBlon-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308230251.2EhAALdZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308231008.lxCTs3d2-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308240556.jFbsuVxg-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308241150.LquDYwGT-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308241954.oRNfVqmB-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/13.2.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
ERROR: modpost: ".L874" [drivers/mtd/nand/raw/nand.ko] undefined!
arch/arc/kernel/setup.c:82:13: warning: variable 'atomic' set but not used [-Wunused-but-set-variable]
arch/csky/include/asm/ptrace.h:100:11: error: expected ';' before 'void'
arch/csky/include/asm/ptrace.h:99:11: error: expected ';' before 'int'
arch/csky/include/asm/traps.h:43:11: error: expected ';' before 'void'
arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
arch/um/os-Linux/umid.c:106:23: warning: '__builtin___sprintf_chk' may write a terminating nul past the end of the destination [-Wformat-overflow=]
arch/x86/events/amd/iommu.c:441:57: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
block/disk-events.c:300: warning: Excess function parameter 'events' description in 'disk_force_media_change'
drivers/clk/clk-lmk04832.c:1297:36: warning: '%02d' directive writing between 2 and 11 bytes into a region of size between 0 and 3 [-Wformat-overflow=]
drivers/clk/clk-lmk04832.c:1312:31: warning: '%02d' directive writing between 2 and 11 bytes into a region of size 6 [-Wformat-overflow=]
drivers/crypto/hifn_795x.c:2396:64: warning: '%s' directive output may be truncated writing up to 7871 bytes into a region of size 128 [-Wformat-truncation=]
drivers/crypto/hifn_795x.c:2396:64: warning: '%s' directive output may be truncated writing up to 8831 bytes into a region of size 128 [-Wformat-truncation=]
drivers/crypto/intel/qat/qat_common/adf_isr.c:197:19: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 5 [-Wformat-truncation=]
drivers/crypto/intel/qat/qat_common/adf_isr.c:197:47: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 5 [-Wformat-truncation=]
drivers/crypto/intel/qat/qat_common/adf_isr.c:197:47: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 5 [-Wformat-truncation=]
drivers/dma/dw-edma/dw-edma-v0-debugfs.c:193:36: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
drivers/dma/dw-edma/dw-edma-v0-debugfs.c:193:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
drivers/dma/dw-edma/dw-edma-v0-debugfs.c:256:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:125:36: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:125:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:142:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
drivers/dma/tegra20-apb-dma.c:1496:64: warning: '%d' directive output may be truncated writing between 1 and 8 bytes into a region of size 5 [-Wformat-truncation=]
drivers/edac/sb_edac.c:1678:41: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 3 [-Wformat-truncation=]
drivers/firmware/turris-mox-rwtm.c:255:90: warning: '%08x' directive writing 8 bytes into a region of size between 7 and 9 [-Wformat-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_dpia.c:427:17: warning: 'dp_decide_lane_settings' accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c:426:25: warning: 'dp_decide_lane_settings' accessing 4 bytes in a region of size 1 [-Wstringop-overflow=]
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:516: warning: Function parameter or member 'xcc_id' not described in 'amdgpu_mm_wreg_mmio_rlc'
drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Excess function parameter 'db_index' description in 'amdgpu_doorbell_index_on_bar'
drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c:123: warning: Function parameter or member 'doorbell_index' not described in 'amdgpu_doorbell_index_on_bar'
drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:1037:101: warning: '%012llX' directive output may be truncated writing between 12 and 16 bytes into a region of size between 9 and 14 [-Wformat-truncation=]
drivers/gpu/drm/drm_gpuva_mgr.c:1079:32: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/drm_gpuva_mgr.c:1079:39: warning: variable 'prev' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/i915/display/intel_tc.c:1845:11: error: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting prototype for drm_kunit_helper_context_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead
drivers/hwmon/i5k_amb.c:284:13: warning: '_label' directive output may be truncated writing 6 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
drivers/hwmon/i5k_amb.c:299:13: warning: '_input' directive output may be truncated writing 6 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
drivers/hwmon/i5k_amb.c:314:13: warning: '_min' directive output may be truncated writing 4 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
drivers/hwmon/i5k_amb.c:330:13: warning: '_mid' directive output may be truncated writing 4 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
drivers/hwmon/i5k_amb.c:346:13: warning: '_max' directive output may be truncated writing 4 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
drivers/hwmon/i5k_amb.c:362:13: warning: '_alarm' directive output may be truncated writing 6 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
drivers/infiniband/hw/qib/qib_init.c:586:46: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 3 [-Wformat-truncation=]
drivers/infiniband/hw/qib/qib_verbs.c:1554:26: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size 43 [-Wformat-truncation=]
drivers/infiniband/hw/qib/qib_verbs.c:1554:40: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size 43 [-Wformat-truncation=]
drivers/leds/leds-lp55xx-common.c:184:57: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 5 and 24 [-Wformat-truncation=]
drivers/media/platform/cadence/cdns-csi2rx.c:422:41: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
drivers/media/radio/radio-shark2.c:191:17: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
drivers/mfd/cs42l43.c:1076:12: warning: 'cs42l43_suspend' defined but not used [-Wunused-function]
drivers/mfd/cs42l43.c:1106:12: warning: 'cs42l43_resume' defined but not used [-Wunused-function]
drivers/mfd/cs42l43.c:1124:12: warning: 'cs42l43_runtime_suspend' defined but not used [-Wunused-function]
drivers/mfd/cs42l43.c:1138:12: warning: 'cs42l43_runtime_resume' defined but not used [-Wunused-function]
drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:277:31: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:277:59: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 6 [-Wformat-truncation=]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:3199:43: warning: '%d' directive output may be truncated writing between 1 and 7 bytes into a region of size 5 [-Wformat-truncation=]
drivers/net/ethernet/marvell/octeontx2/af/cgx.c:1644:49: warning: '%d' directive writing between 1 and 11 bytes into a region of size between 4 and 6 [-Wformat-overflow=]
drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1809:58: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c:718:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 220 and 230 [-Wformat-truncation=]
drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:545:66: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 7 [-Wformat-truncation=]
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:1054:45: warning: '%d' directive writing between 1 and 11 bytes into a region of size between 4 and 19 [-Wformat-overflow=]
drivers/net/ethernet/qlogic/qede/qede_main.c:1903:47: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 5 and 20 [-Wformat-truncation=]
drivers/net/ethernet/qlogic/qede/qede_main.c:1903:61: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 5 and 20 [-Wformat-truncation=]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:1771:49: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 9 and 24 [-Wformat-truncation=]
drivers/net/virtio_net.c:4101:36: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
drivers/net/virtio_net.c:4101:48: warning: '%d' directive writing between 1 and 11 bytes into a region of size 10 [-Wformat-overflow=]
drivers/net/virtio_net.c:4101:50: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
drivers/net/virtio_net.c:4102:35: warning: '%d' directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
drivers/net/virtio_net.c:4102:49: warning: '%d' directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
drivers/of/unittest.c:3763:14: error: 'overlays' undeclared (first use in this function)
drivers/of/unittest.c:3763:36: error: dereferencing pointer to incomplete type 'struct overlay_info'
drivers/of/unittest.c:3763:48: error: increment of pointer to an incomplete type 'struct overlay_info'
drivers/of/unittest.c:3773:8: error: too many arguments to function 'of_overlay_fdt_apply'
drivers/opp/debugfs.c:63:42: warning: '%.1d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
drivers/parisc/led.c:693:24: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size 26 [-Wformat-truncation=]
drivers/pci/controller/dwc/pci-keystone.c:1189:55: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
drivers/pci/hotplug/cpci_hotplug_core.c:215:44: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
drivers/pinctrl/pinctrl-cy8c95x0.c:168: warning: Function parameter or member 'gpio_reset' not described in 'cy8c95x0_pinctrl'
drivers/platform/x86/think-lmi.c:756:14: warning: '%s' directive argument is null [-Wformat-overflow=]
drivers/power/supply/bq2415x_charger.c:1501:36: warning: '%d' directive writing between 1 and 10 bytes into a region of size 6 [-Wformat-overflow=]
drivers/power/supply/cros_peripheral_charger.c:20:26: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member 'remote_flow_restricted' not described in 'rpmsg_eptdev'
drivers/rpmsg/rpmsg_char.c:75: warning: Function parameter or member 'remote_flow_updated' not described in 'rpmsg_eptdev'
drivers/scsi/myrs.c:1089:10: warning: 'physical device - not rebuilding
drivers/usb/gadget/function/f_mass_storage.c:2946:48: warning: '%d' directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Wformat-truncation=]
drivers/vdpa/pds/debugfs.c:266:49: warning: '%02d' directive output may be truncated writing between 2 and 11 bytes into a region of size 6 [-Wformat-truncation=]
drivers/watchdog/stm32_iwdg.c:215:34: warning: 'stm32_iwdg_of_match' defined but not used [-Wunused-const-variable=]
fs/dlm/debug_fs.c:1031:43: warning: '_queued_asts' directive output may be truncated writing 12 bytes into a region of size between 8 and 72 [-Wformat-truncation=]
fs/dlm/debug_fs.c:1031:50: warning: '_queued_asts' directive output may be truncated writing 12 bytes into a region of size between 8 and 72 [-Wformat-truncation=]
fs/gfs2/super.c:767: warning: Function parameter or member 'who' not described in 'gfs2_freeze_super'
fs/gfs2/super.c:822: warning: Function parameter or member 'who' not described in 'gfs2_thaw_super'
fs/smb/server/smb2pdu.c:4166: warning: Excess function parameter 'infoclass_size' description in 'buffer_check_err'
fs/tracefs/event_inode.c:58: warning: Function parameter or member 'del_list' not described in 'eventfs_file'
fs/tracefs/event_inode.c:58: warning: Function parameter or member 'is_freed' not described in 'eventfs_file'
fs/tracefs/event_inode.c:58: warning: Function parameter or member 'rcu' not described in 'eventfs_file'
include/linux/dynamic_debug.h:269:33: warning: '%s' directive argument is null [-Wformat-overflow=]
include/linux/fortify-string.h:57:33: warning: '__builtin_memcpy' writing 18446744073709551615 bytes into a region of size between 1 and 9223372036854775807 [-Wstringop-overflow=]
include/linux/printk.h:455:44: warning: '%s' directive argument is null [-Wformat-overflow=]
kernel/bpf/core.c:596:3: warning: '%s' directive argument is null [-Wformat-overflow=]
kernel/bpf/core.c:596:54: warning: '%s' directive argument is null [-Wformat-overflow=]
kernel/bpf/core.c:596:54: warning: '%s' directive argument is null [-Wformat-truncation=]
kernel/bpf/map_iter.c:200:17: warning: no previous declaration for 'bpf_map_sum_elem_count' [-Wmissing-declarations]
lib/vsprintf.c:2893:33: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
mm/mempolicy.c:3118:26: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
net/bpf/test_run.c:559:15: warning: no previous declaration for 'bpf_fentry_test_sinfo' [-Wmissing-declarations]
net/bpf/test_run.c:569:17: warning: no previous declaration for 'bpf_modify_return_test2' [-Wmissing-declarations]
net/core/selftests.c:404:38: warning: '%s' directive output may be truncated writing likely 30 or more bytes into a region of size 28 [-Wformat-truncation=]
net/socket.c:1678:21: warning: no previous declaration for 'update_socket_protocol' [-Wmissing-declarations]
security/keys/proc.c:211:19: warning: '%llu' directive writing between 1 and 18 bytes into a region of size 16 [-Wformat-overflow=]
security/keys/proc.c:213:23: warning: 'h' directive writing 1 byte into a region of size between 0 and 15 [-Wformat-overflow=]
security/keys/proc.c:213:44: warning: 'h' directive writing 1 byte into a region of size between 0 and 15 [-Wformat-overflow=]
security/keys/proc.c:215:24: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
security/keys/proc.c:217:45: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
sound/firewire/fireworks/fireworks.c:97:14: warning: ', GUID ' directive output may be truncated writing 7 bytes into a region of size between 4 and 77 [-Wformat-truncation=]
sound/hda/intel-sdw-acpi.c:34:21: warning: '-subproperties' directive output may be truncated writing 14 bytes into a region of size between 8 and 17 [-Wformat-truncation=]
sound/hda/intel-sdw-acpi.c:34:35: warning: '-subproperties' directive output may be truncated writing 14 bytes into a region of size between 7 and 17 [-Wformat-truncation=]
sound/hda/intel-sdw-acpi.c:34:35: warning: '-subproperties' directive output may be truncated writing 14 bytes into a region of size between 8 and 17 [-Wformat-truncation=]
sound/pci/riptide/riptide.c:2109:55: warning: '%x' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 37 [-Wformat-truncation=]
sound/pci/riptide/riptide.c:2109:69: warning: '%x' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 37 [-Wformat-truncation=]
sound/soc/amd/ps/pci-ps.c:277:49: warning: '-subproperties' directive output may be truncated writing 14 bytes into a region of size between 8 and 17 [-Wformat-truncation=]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
kernel/cgroup/cgroup.c:1104:22: warning: 'compare_css_sets' accessing 4 bytes in a region of size 0 [-Wstringop-overflow=]
lib/crypto/mpi/mpi-inv.c:34:15: warning: variable 'k' set but not used [-Wunused-but-set-variable]
sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:1095: Error: pcrel too far
{standard input}:1211: Warning: overflow in branch to .L99; converted into longer instruction sequence
{standard input}:1454: Error: pcrel too far
{standard input}:611: Warning: end of file not at end of a line; newline inserted
{standard input}:835: Warning: overflow in branch to .L85; converted into longer instruction sequence
{standard input}:944: Error: unknown pseudo-op: `.'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- alpha-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-marvell-octeontx2-af-cgx.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-marvell-octeontx2-nic-otx2_pf.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-vdpa-pds-debugfs.c:warning:02d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   `-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|-- alpha-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- alpha-randconfig-r004-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   `-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|-- alpha-randconfig-r034-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   `-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|-- arc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- arc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- arc-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- arc-randconfig-001-20230824
|   |-- arch-arc-kernel-setup.c:warning:variable-atomic-set-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- arc-randconfig-r011-20230824
|   |-- arch-arc-kernel-setup.c:warning:variable-atomic-set-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- arc-randconfig-r032-20230824
|   |-- arch-arc-kernel-setup.c:warning:variable-atomic-set-but-not-used
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- arc-vdk_hs38_smp_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- arm-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arm-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- security-keys-proc.c:warning:h-directive-writing-byte-into-a-region-of-size-between-and
|   `-- security-keys-proc.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|-- arm-randconfig-001-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- security-keys-proc.c:warning:h-directive-writing-byte-into-a-region-of-size-between-and
|   `-- security-keys-proc.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|-- arm64-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- arm64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- csky-allmodconfig
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-int
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-void
|   |-- arch-csky-include-asm-traps.h:error:expected-before-void
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-broadcom-bnx2x-bnx2x_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- csky-allnoconfig
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-int
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-void
|   |-- arch-csky-include-asm-traps.h:error:expected-before-void
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- csky-allyesconfig
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-int
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-void
|   |-- arch-csky-include-asm-traps.h:error:expected-before-void
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-broadcom-bnx2x-bnx2x_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- csky-defconfig
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-int
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-void
|   |-- arch-csky-include-asm-traps.h:error:expected-before-void
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- csky-randconfig-r031-20230824
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-int
|   |-- arch-csky-include-asm-ptrace.h:error:expected-before-void
|   |-- arch-csky-include-asm-traps.h:error:expected-before-void
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-power-supply-bq2415x_charger.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-alldefconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- i386-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-buildonly-randconfig-001-20230824
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-buildonly-randconfig-002-20230824
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-buildonly-randconfig-003-20230824
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-buildonly-randconfig-004-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-buildonly-randconfig-005-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-watchdog-stm32_iwdg.c:warning:stm32_iwdg_of_match-defined-but-not-used
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- include-linux-printk.h:warning:s-directive-argument-is-null
|   `-- kernel-bpf-core.c:warning:s-directive-argument-is-null
|-- i386-buildonly-randconfig-006-20230824
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-debian-10.3
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- net-socket.c:warning:no-previous-declaration-for-update_socket_protocol
|-- i386-randconfig-001-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-randconfig-002-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- include-linux-printk.h:warning:s-directive-argument-is-null
|-- i386-randconfig-003-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- include-linux-dynamic_debug.h:warning:s-directive-argument-is-null
|   |-- include-linux-printk.h:warning:s-directive-argument-is-null
|   `-- lib-vsprintf.c:warning:writing-byte-into-a-region-of-size
|-- i386-randconfig-004-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- include-linux-printk.h:warning:s-directive-argument-is-null
|-- i386-randconfig-005-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-randconfig-006-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- i386-randconfig-141-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- kernel-bpf-core.c:warning:s-directive-argument-is-null
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- loongarch-allnoconfig
|   |-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_thread_lbt_defines
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- loongarch-allyesconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- loongarch-defconfig
|   |-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_thread_lbt_defines
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   `-- sound-hda-intel-sdw-acpi.c:warning:subproperties-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- loongarch-randconfig-r003-20230824
|   |-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_thread_lbt_defines
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   `-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|-- m68k-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   `-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|-- m68k-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   `-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|-- m68k-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-hp300_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-mvme16x_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- m68k-sun3_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- microblaze-allmodconfig
|   |-- arch-microblaze-include-asm-cacheflush.h:warning:flush_dcache_folio-defined-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-broadcom-bnx2x-bnx2x_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- microblaze-allnoconfig
|   |-- arch-microblaze-include-asm-cacheflush.h:warning:flush_dcache_folio-defined-but-not-used
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- microblaze-allyesconfig
|   |-- arch-microblaze-include-asm-cacheflush.h:warning:flush_dcache_folio-defined-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-broadcom-bnx2x-bnx2x_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- microblaze-defconfig
|   |-- arch-microblaze-include-asm-cacheflush.h:warning:flush_dcache_folio-defined-but-not-used
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- microblaze-randconfig-r002-20230824
|   |-- arch-microblaze-include-asm-cacheflush.h:warning:flush_dcache_folio-defined-but-not-used
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- mips-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- mips-randconfig-r023-20230824
|   `-- include-linux-fortify-string.h:warning:__builtin_memcpy-writing-bytes-into-a-region-of-size-between-and
|-- nios2-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   `-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|-- nios2-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- nios2-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   `-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|-- nios2-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- nios2-randconfig-r015-20230824
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- nios2-randconfig-r036-20230824
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- openrisc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-broadcom-bnx2x-bnx2x_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- openrisc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- openrisc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-broadcom-bnx2x-bnx2x_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- openrisc-randconfig-r012-20230824
|   `-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|-- parisc-allmodconfig
|   |-- ERROR:L874-drivers-mtd-nand-raw-nand.ko-undefined
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- parisc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- parisc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- parisc-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   `-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- parisc-randconfig-r001-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-mellanox-mlx5-core-en-reporter_rx.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- sound-pci-riptide-riptide.c:warning:x-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- parisc-randconfig-r016-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-tegra20-apb-dma.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-pci-controller-dwc-pci-keystone.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-usb-gadget-function-f_mass_storage.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   `-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|-- parisc-randconfig-r025-20230824
|   |-- drivers-crypto-hifn_795x.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   `-- drivers-watchdog-stm32_iwdg.c:warning:stm32_iwdg_of_match-defined-but-not-used
|-- parisc64-alldefconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- parisc64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   `-- drivers-parisc-led.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- powerpc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-arches_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-canyonlands_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- powerpc-currituck_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- powerpc-wii_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- riscv-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- riscv-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- riscv-rv32_defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- s390-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- s390-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- sh-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   |-- standard-input:Error:unknown-pseudo-op:
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- sh-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- sh-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- sh-randconfig-r013-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-watchdog-stm32_iwdg.c:warning:stm32_iwdg_of_match-defined-but-not-used
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- sh-randconfig-r022-20230824
|   |-- standard-input:Warning:overflow-in-branch-to-.L85-converted-into-longer-instruction-sequence
|   `-- standard-input:Warning:overflow-in-branch-to-.L99-converted-into-longer-instruction-sequence
|-- sparc-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-marvell-octeontx2-af-cgx.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-marvell-octeontx2-nic-otx2_pf.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-vdpa-pds-debugfs.c:warning:02d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- sparc-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- sparc-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-marvell-octeontx2-af-cgx.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-marvell-octeontx2-nic-otx2_pf.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-vdpa-pds-debugfs.c:warning:02d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- sparc-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- sparc-randconfig-r006-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   `-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|-- sparc-randconfig-r022-20230824
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- sparc64-allmodconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-marvell-octeontx2-af-cgx.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-marvell-octeontx2-nic-otx2_pf.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-vdpa-pds-debugfs.c:warning:02d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- sparc64-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-marvell-octeontx2-af-cgx.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-marvell-octeontx2-nic-otx2_pf.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-net-ethernet-mellanox-mlxsw-core_thermal.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-netxen-netxen_nic_main.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-ethernet-qlogic-qlcnic-qlcnic_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-vdpa-pds-debugfs.c:warning:02d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- sparc64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- um-defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- um-i386_defconfig
|   |-- arch-um-os-Linux-umid.c:warning:__builtin___sprintf_chk-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- net-socket.c:warning:no-previous-declaration-for-update_socket_protocol
|-- um-x86_64_defconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- x86_64-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|-- x86_64-allyesconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-infiniband-hw-qib-qib_verbs.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-smb-server-smb2pdu.c:warning:Excess-function-parameter-infoclass_size-description-in-buffer_check_err
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-buildonly-randconfig-001-20230824
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- drivers-watchdog-stm32_iwdg.c:warning:stm32_iwdg_of_match-defined-but-not-used
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-buildonly-randconfig-002-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:08x-directive-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-leds-leds-lp55xx-common.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- sound-pci-riptide-riptide.c:warning:x-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- x86_64-buildonly-randconfig-003-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   `-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-buildonly-randconfig-004-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:warning:u-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-opp-debugfs.c:warning:.1d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-buildonly-randconfig-005-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-power-supply-cros_peripheral_charger.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- net-core-selftests.c:warning:s-directive-output-may-be-truncated-writing-likely-or-more-bytes-into-a-region-of-size
|   |-- security-keys-proc.c:warning:h-directive-writing-byte-into-a-region-of-size-between-and
|   |-- security-keys-proc.c:warning:llu-directive-writing-between-and-bytes-into-a-region-of-size
|   `-- security-keys-proc.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|-- x86_64-buildonly-randconfig-006-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras_eeprom.c:warning:012llX-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-hwmon-i5k_amb.c:warning:_alarm-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_input-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_label-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_max-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_mid-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_min-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-infiniband-hw-qib-qib_init.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-infiniband-hw-qib-qib_verbs.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-aquantia-atlantic-aq_ethtool.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-qlogic-qede-qede_main.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-opp-debugfs.c:warning:.1d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- kernel-bpf-map_iter.c:warning:no-previous-declaration-for-bpf_map_sum_elem_count
|   |-- net-bpf-test_run.c:warning:no-previous-declaration-for-bpf_fentry_test_sinfo
|   |-- net-bpf-test_run.c:warning:no-previous-declaration-for-bpf_modify_return_test2
|   |-- net-socket.c:warning:no-previous-declaration-for-update_socket_protocol
|   `-- sound-pci-riptide-riptide.c:warning:x-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- x86_64-defconfig
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- include-linux-printk.h:warning:s-directive-argument-is-null
|   |-- lib-vsprintf.c:warning:writing-byte-into-a-region-of-size
|   |-- mm-mempolicy.c:warning:writing-byte-into-a-region-of-size
|   `-- sound-hda-intel-sdw-acpi.c:warning:subproperties-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-randconfig-011-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_resume-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_runtime_suspend-defined-but-not-used
|   |-- drivers-mfd-cs42l43.c:warning:cs42l43_suspend-defined-but-not-used
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- include-linux-printk.h:warning:s-directive-argument-is-null
|-- x86_64-randconfig-012-20230824
|   |-- arch-x86-events-amd-iommu.c:warning:u-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-platform-x86-think-lmi.c:warning:s-directive-argument-is-null
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- include-linux-printk.h:warning:s-directive-argument-is-null
|   |-- sound-firewire-fireworks-fireworks.c:warning:GUID-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- sound-hda-intel-sdw-acpi.c:warning:subproperties-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- sound-soc-amd-ps-pci-ps.c:warning:subproperties-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|-- x86_64-randconfig-013-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-leds-leds-lp55xx-common.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- include-linux-dynamic_debug.h:warning:s-directive-argument-is-null
|   `-- lib-vsprintf.c:warning:writing-byte-into-a-region-of-size
|-- x86_64-randconfig-014-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-randconfig-015-20230824
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-opp-debugfs.c:warning:.1d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- kernel-bpf-map_iter.c:warning:no-previous-declaration-for-bpf_map_sum_elem_count
|   |-- net-bpf-test_run.c:warning:no-previous-declaration-for-bpf_fentry_test_sinfo
|   |-- net-bpf-test_run.c:warning:no-previous-declaration-for-bpf_modify_return_test2
|   `-- net-socket.c:warning:no-previous-declaration-for-update_socket_protocol
|-- x86_64-randconfig-016-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-edac-sb_edac.c:warning:u-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- include-linux-printk.h:warning:s-directive-argument-is-null
|-- x86_64-randconfig-071-20230824
|   |-- drivers-clk-clk-lmk04832.c:warning:02d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-clk-clk-lmk04832.c:warning:02d-directive-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras_eeprom.c:warning:012llX-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-pci-hotplug-cpci_hotplug_core.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-pinctrl-pinctrl-cy8c95x0.c:warning:Function-parameter-or-member-gpio_reset-not-described-in-cy8c95x0_pinctrl
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- net-socket.c:warning:no-previous-declaration-for-update_socket_protocol
|-- x86_64-randconfig-072-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- kernel-bpf-core.c:warning:s-directive-argument-is-null
|-- x86_64-randconfig-073-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-randconfig-074-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-infiniband-hw-qib-qib_verbs.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   |-- fs-dlm-debug_fs.c:warning:_queued_asts-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-randconfig-075-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-dma-dw-edma-dw-edma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-dma-dw-edma-dw-hdma-v0-debugfs.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras_eeprom.c:warning:012llX-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-hwmon-i5k_amb.c:warning:_alarm-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_input-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_label-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_max-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_mid-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-hwmon-i5k_amb.c:warning:_min-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-media-platform-cadence-cdns-csi2rx.c:warning:u-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-opp-debugfs.c:warning:.1d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-scsi-myrs.c:warning:physical-device-not-rebuilding
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_freeze_super
|   |-- fs-gfs2-super.c:warning:Function-parameter-or-member-who-not-described-in-gfs2_thaw_super
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   |-- kernel-bpf-map_iter.c:warning:no-previous-declaration-for-bpf_map_sum_elem_count
|   |-- net-bpf-test_run.c:warning:no-previous-declaration-for-bpf_fentry_test_sinfo
|   |-- net-bpf-test_run.c:warning:no-previous-declaration-for-bpf_modify_return_test2
|   `-- net-socket.c:warning:no-previous-declaration-for-update_socket_protocol
|-- x86_64-randconfig-076-20230824
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training_dpia.c:warning:dp_decide_lane_settings-accessing-bytes-in-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training_fixed_vs_pe_retimer.c:warning:dp_decide_lane_settings-accessing-bytes-in-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-media-radio-radio-shark2.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- x86_64-randconfig-161-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_device.c:warning:Function-parameter-or-member-xcc_id-not-described-in-amdgpu_mm_wreg_mmio_rlc
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-leds-leds-lp55xx-common.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- lib-vsprintf.c:warning:writing-byte-into-a-region-of-size
|-- x86_64-randconfig-r033-20230824
|   |-- arch-x86-events-amd-iommu.c:warning:u-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-crypto-intel-qat-qat_common-adf_isr.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- drivers-net-virtio_net.c:warning:d-directive-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-virtio_net.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|   |-- drivers-of-unittest.c:error:dereferencing-pointer-to-incomplete-type-struct-overlay_info
|   |-- drivers-of-unittest.c:error:increment-of-pointer-to-an-incomplete-type-struct-overlay_info
|   |-- drivers-of-unittest.c:error:overlays-undeclared-(first-use-in-this-function)
|   |-- drivers-of-unittest.c:error:too-many-arguments-to-function-of_overlay_fdt_apply
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|   `-- include-linux-printk.h:warning:s-directive-argument-is-null
|-- x86_64-rhel-8.3
|   |-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
|   |-- drivers-gpu-drm-drm_gpuva_mgr.c:warning:variable-prev-set-but-not-used
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-del_list-not-described-in-eventfs_file
|   |-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-is_freed-not-described-in-eventfs_file
|   `-- fs-tracefs-event_inode.c:warning:Function-parameter-or-member-rcu-not-described-in-eventfs_file
|-- xtensa-allnoconfig
|   `-- block-disk-events.c:warning:Excess-function-parameter-events-description-in-disk_force_media_change
`-- xtensa-randconfig-r122-20230824
    `-- kernel-cgroup-cgroup.c:warning:compare_css_sets-accessing-bytes-in-a-region-of-size
clang_recent_errors
|-- arm-multi_v5_defconfig
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- hexagon-randconfig-001-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- hexagon-randconfig-002-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- hexagon-randconfig-r005-20230824
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- hexagon-randconfig-r024-20230824
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   `-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|-- hexagon-randconfig-r026-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   |-- drivers-media-platform-mediatek-vcodec-common-mtk_vcodec_fw_vpu.c:warning:cast-from-mtk_vcodec_ipi_handler-(aka-void-(-)(void-unsigned-int-void-)-)-to-ipi_handler_t-(aka-void-(-)(const-void-unsigned-i
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-011-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-012-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-013-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-014-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-015-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-016-20230824
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- i386-randconfig-r014-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- mips-ath79_defconfig
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- mips-cu1000-neo_defconfig
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- s390-randconfig-001-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_restricted-not-described-in-rpmsg_eptdev
|   |-- drivers-rpmsg-rpmsg_char.c:warning:Function-parameter-or-member-remote_flow_updated-not-described-in-rpmsg_eptdev
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- x86_64-randconfig-001-20230824
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Excess-function-parameter-db_index-description-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_doorbell_mgr.c:warning:Function-parameter-or-member-doorbell_index-not-described-in-amdgpu_doorbell_index_on_bar
|   |-- drivers-gpu-drm-tests-drm_kunit_helpers.c:warning:expecting-prototype-for-drm_kunit_helper_context_alloc().-Prototype-was-for-drm_kunit_helper_acquire_ctx_alloc()-instead
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- x86_64-randconfig-002-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- x86_64-randconfig-003-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- x86_64-randconfig-004-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- x86_64-randconfig-005-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
|-- x86_64-randconfig-006-20230824
|   `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used
`-- x86_64-rhel-8.3-rust
    `-- lib-crypto-mpi-mpi-inv.c:warning:variable-k-set-but-not-used

elapsed time: 757m

configs tested: 178
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230824   gcc  
alpha                randconfig-r034-20230824   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230824   gcc  
arc                  randconfig-r011-20230824   gcc  
arc                  randconfig-r032-20230824   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                       netwinder_defconfig   clang
arm                   randconfig-001-20230824   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230824   gcc  
hexagon               randconfig-001-20230824   clang
hexagon               randconfig-002-20230824   clang
hexagon              randconfig-r005-20230824   clang
hexagon              randconfig-r024-20230824   clang
hexagon              randconfig-r026-20230824   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230824   gcc  
i386         buildonly-randconfig-002-20230824   gcc  
i386         buildonly-randconfig-003-20230824   gcc  
i386         buildonly-randconfig-004-20230824   gcc  
i386         buildonly-randconfig-005-20230824   gcc  
i386         buildonly-randconfig-006-20230824   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230824   gcc  
i386                  randconfig-002-20230824   gcc  
i386                  randconfig-003-20230824   gcc  
i386                  randconfig-004-20230824   gcc  
i386                  randconfig-005-20230824   gcc  
i386                  randconfig-006-20230824   gcc  
i386                  randconfig-011-20230824   clang
i386                  randconfig-012-20230824   clang
i386                  randconfig-013-20230824   clang
i386                  randconfig-014-20230824   clang
i386                  randconfig-015-20230824   clang
i386                  randconfig-016-20230824   clang
i386                 randconfig-r014-20230824   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230824   gcc  
loongarch            randconfig-r003-20230824   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r002-20230824   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                     cu1000-neo_defconfig   clang
mips                        omega2p_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230824   gcc  
nios2                randconfig-r036-20230824   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r012-20230824   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230824   gcc  
parisc               randconfig-r016-20230824   gcc  
parisc               randconfig-r025-20230824   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64            randconfig-r035-20230824   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230824   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230824   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r013-20230824   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230824   gcc  
sparc                randconfig-r022-20230824   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r021-20230824   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230824   gcc  
x86_64       buildonly-randconfig-002-20230824   gcc  
x86_64       buildonly-randconfig-003-20230824   gcc  
x86_64       buildonly-randconfig-004-20230824   gcc  
x86_64       buildonly-randconfig-005-20230824   gcc  
x86_64       buildonly-randconfig-006-20230824   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230824   clang
x86_64                randconfig-002-20230824   clang
x86_64                randconfig-003-20230824   clang
x86_64                randconfig-004-20230824   clang
x86_64                randconfig-005-20230824   clang
x86_64                randconfig-006-20230824   clang
x86_64                randconfig-011-20230824   gcc  
x86_64                randconfig-012-20230824   gcc  
x86_64                randconfig-013-20230824   gcc  
x86_64                randconfig-014-20230824   gcc  
x86_64                randconfig-015-20230824   gcc  
x86_64                randconfig-016-20230824   gcc  
x86_64                randconfig-071-20230824   gcc  
x86_64                randconfig-072-20230824   gcc  
x86_64                randconfig-073-20230824   gcc  
x86_64                randconfig-074-20230824   gcc  
x86_64                randconfig-075-20230824   gcc  
x86_64                randconfig-076-20230824   gcc  
x86_64               randconfig-r033-20230824   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r023-20230824   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
