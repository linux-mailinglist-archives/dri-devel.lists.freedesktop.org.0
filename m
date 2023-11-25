Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC767F88CA
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 08:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D2D10E0D2;
	Sat, 25 Nov 2023 07:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ABA10E208;
 Sat, 25 Nov 2023 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700882541; x=1732418541;
 h=date:from:to:cc:subject:message-id;
 bh=xyoCzyjsdyXHQiyqphndzVcXjxSku8dZ/DEPoX4aK5g=;
 b=jFgvavFpx1AIiPBFxMLz4pzRwzRPsawISEsO4FxikOoREDRXeWhzPLRk
 ietqbsqFbo7fqGKJj061BF2ngZlGJu2Z945/r8Yg3l8Bp4ciAJadW9Sy/
 NIJ9zyAv+qS8wcrrPlyssrH/l90vOtvats1Xz8LIvvVCDRD3oIIqaCX3t
 xsOqGjK5GuNG3j/XRQzKQDGZBoo5/wZ/Oe8rpHKsRIZmIpPkyJ/zVXfa6
 WdUg2nZwuqmmpHImnmdcB5UxYDXaG6tjHBmvkpIKUzYDo04EWh8gGAijr
 AUCE3T26W419eM4xSOdRVLJlEbbfrKTp6WyPjB4y/uoqU0ZNdZQipgJI+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372647070"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; d="scan'208";a="372647070"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 19:22:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1099241921"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; d="scan'208";a="1099241921"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2023 19:22:13 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r6jFD-0003af-1o;
 Sat, 25 Nov 2023 03:22:11 +0000
Date: Sat, 25 Nov 2023 11:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 8c9660f6515396aba78d1168d2e17951d653ebf2
Message-ID: <202311251108.gGORQde6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailman-Approved-At: Sat, 25 Nov 2023 07:24:41 +0000
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
Cc: linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 kvm@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-block@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-hexagon@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 8c9660f6515396aba78d1168d2e17951d653ebf2  Add linux-next specific files for 20231124

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202310302025.Pokm9vEs-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311011040.L1ncxDT3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311211857.NFL6O9OG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311230137.gpCHK9z4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311241526.Y2WZeUau-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311241540.XRrLFEKc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311241836.JpSWGIRK-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311250015.4rqAghbA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202311250244.C3mKQnhy-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

./drivers/gpu/drm/imagination/pvr_drv.c:1: warning: 'PowerVR Graphics Driver' not found
./include/net/page_pool/types.h:73: warning: Function parameter or member 'STRUCT_GROUP(' not described in 'page_pool_params'
./include/uapi/drm/pvr_drm.h:1: warning: 'Flags for DRM_PVR_DEV_QUERY_HEAP_INFO_GET.' not found
Documentation/gpu/imagination/uapi.rst:124: WARNING: Title underline too short.
Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
arch/arm64/kernel/vdso32/vgettimeofday.c:10:5: error: conflicting types for '__vdso_clock_gettime'
arch/arm64/kernel/vdso32/vgettimeofday.c:28:5: error: conflicting types for '__vdso_clock_getres'
arch/loongarch/kvm/mmu.c:810:13: error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you mean 'mmu_invalidate_retry_gfn'? [-Werror=implicit-function-declaration]
drivers/hwmon/pmbus/lm25066.c:485:13: warning: cast to smaller integer type 'enum chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
drivers/leds/leds-max5970.c:48:21: warning: variable 'num_leds' set but not used [-Wunused-but-set-variable]
fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
fs/bcachefs/replicas.c:36:52: error: builtin functions must be directly called

Unverified Error/Warning (likely false positive, please contact us if interested):

block/bdev.c:834 bdev_open_by_dev() warn: possible memory leak of 'handle'
drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:11: error: use of undeclared identifier 'LPI_FLAG_SLEW_RATE_SAME_REG'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|-- alpha-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- alpha-defconfig
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- arc-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- arc-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- arc-randconfig-001-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- arc-randconfig-002-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   `-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|-- arm-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- arm-allnoconfig
|   `-- arch-arm-kernel-process.c:warning:variable-buf-set-but-not-used
|-- arm-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- arm64-defconfig
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- csky-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- csky-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- csky-randconfig-001-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   `-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|-- csky-randconfig-002-20231124
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- i386-defconfig
|   `-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|-- i386-randconfig-011-20231124
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-randconfig-012-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-randconfig-013-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- i386-randconfig-014-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- i386-randconfig-015-20231124
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-randconfig-016-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- loongarch-allmodconfig
|   |-- arch-loongarch-kvm-mmu.c:error:implicit-declaration-of-function-mmu_invalidate_retry_hva
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- loongarch-defconfig
|   |-- arch-loongarch-kvm-mmu.c:error:implicit-declaration-of-function-mmu_invalidate_retry_hva
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- loongarch-randconfig-001-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   `-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|-- loongarch-randconfig-002-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- m68k-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- m68k-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- m68k-defconfig
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- microblaze-allmodconfig
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-fp-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-pc-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- microblaze-allnoconfig
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-fp-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-pc-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   `-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|-- microblaze-allyesconfig
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-fp-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-pc-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- microblaze-defconfig
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-fp-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-loglvl-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-pc-not-described-in-unwind_trap
|   |-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-task-not-described-in-unwind_trap
|   `-- arch-microblaze-kernel-unwind.c:warning:Function-parameter-or-member-trace-not-described-in-unwind_trap
|-- mips-allyesconfig
|   |-- arch-mips-kernel-machine_kexec.c:warning:no-previous-prototype-for-machine_shutdown
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- nios2-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- nios2-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- nios2-randconfig-001-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- nios2-randconfig-002-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- openrisc-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- parisc-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- parisc-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- parisc-randconfig-001-20231124
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- parisc-randconfig-002-20231124
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- riscv-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- riscv-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- riscv-defconfig
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- s390-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- s390-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- s390-defconfig
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- s390-randconfig-001-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- s390-randconfig-002-20231124
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- sh-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- sh-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- sh-randconfig-001-20231124
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   `-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|-- sh-randconfig-002-20231124
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- sparc-allmodconfig
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- sparc-allnoconfig
|   |-- kernel-dma.c:warning:no-previous-prototype-for-free_dma
|   `-- kernel-dma.c:warning:no-previous-prototype-for-request_dma
|-- sparc-allyesconfig
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- sparc-defconfig
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- kernel-dma.c:warning:no-previous-prototype-for-free_dma
|   `-- kernel-dma.c:warning:no-previous-prototype-for-request_dma
|-- sparc-randconfig-001-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-dma.c:warning:no-previous-prototype-for-free_dma
|   |-- kernel-dma.c:warning:no-previous-prototype-for-request_dma
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- sparc-randconfig-002-20231124
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-dma.c:warning:no-previous-prototype-for-free_dma
|   |-- kernel-dma.c:warning:no-previous-prototype-for-request_dma
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- sparc64-allmodconfig
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- sparc64-allyesconfig
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-firmware-broadcom-bcm47xx_sprom.c:warning:snprintf-output-may-be-truncated-before-the-last-format-character
|   |-- drivers-input-touchscreen-stmpe-ts.c:warning:stmpe_ts_ids-defined-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   |-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- sparc64-defconfig
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- sparc64-randconfig-001-20231124
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-module.c:error:variable-strtab-set-but-not-used
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   |-- arch-sparc-mm-init_64.c:error:variable-pagecv_flag-set-but-not-used
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- sparc64-randconfig-002-20231124
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-alloc_tag_store
|   |-- arch-sparc-kernel-adi_64.c:error:no-previous-prototype-for-find_tag_store
|   |-- arch-sparc-kernel-pci_sun4v.c:error:no-previous-prototype-for-dma_4v_iotsb_bind
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:SECTIONS_WIDTH-NODES_WIDTH-ZONES_WIDTH-ilog2(roundup_pow_of_two(NR_CPUS))
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-allnoconfig
|   |-- Documentation-gpu-imagination-uapi.rst:WARNING:Title-underline-too-short.
|   |-- Warning:Documentation-devicetree-bindings-power-wakeup-source.txt-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-input-qcom-pm8xxx-keypad.txt
|   |-- drivers-gpu-drm-imagination-pvr_drv.c:warning:PowerVR-Graphics-Driver-not-found
|   |-- drivers-pinctrl-qcom-pinctrl-lpass-lpi.c:linux-seq_file.h-is-included-more-than-once.
|   |-- include-net-page_pool-types.h:warning:Function-parameter-or-member-STRUCT_GROUP(-not-described-in-page_pool_params
|   `-- include-uapi-drm-pvr_drm.h:warning:Flags-for-DRM_PVR_DEV_QUERY_HEAP_INFO_GET.-not-found
|-- x86_64-defconfig
|   `-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|-- x86_64-randconfig-001-20231124
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- x86_64-randconfig-002-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-pca955x.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|-- x86_64-randconfig-003-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-platform-mellanox-mlxreg-hotplug.c:warning:d-directive-output-may-be-truncated-writing-byte-into-a-region-of-size-between-and
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-randconfig-004-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- x86_64-randconfig-005-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-platform-mellanox-mlxreg-hotplug.c:warning:d-directive-output-may-be-truncated-writing-byte-into-a-region-of-size-between-and
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-randconfig-006-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-ida_dump
|   `-- net-8021q-vlan.c:warning:i-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size-between-and
|-- x86_64-randconfig-161-20231123
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_connectors.c-amdgpu_connector_dvi_detect()-warn:inconsistent-indenting
|-- xtensa-randconfig-001-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-input-touchscreen-wdt87xx_i2c.c:warning:wdt87xx_acpi_id-defined-but-not-used
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
`-- xtensa-randconfig-002-20231124
    |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
    |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
    |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
    |-- drivers-net-ppp-pppoe.c:warning:variable-pde-set-but-not-used
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
    `-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
clang_recent_errors
|-- arm-defconfig
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   `-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|-- arm-randconfig-001-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- arm-randconfig-002-20231124
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- arm-randconfig-003-20231124
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- arm-randconfig-004-20231124
|   |-- drivers-clocksource-timer-ti-32k.c:warning:expecting-prototype-for-timer().-Prototype-was-for-OMAP2_32KSYNCNT_REV_OFF()-instead
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- arm64-allmodconfig
|   |-- arch-arm64-kernel-vdso32-vgettimeofday.c:error:conflicting-types-for-__vdso_clock_getres
|   `-- arch-arm64-kernel-vdso32-vgettimeofday.c:error:conflicting-types-for-__vdso_clock_gettime
|-- arm64-allyesconfig
|   `-- drivers-pinctrl-qcom-pinctrl-sm8650-lpass-lpi.c:error:use-of-undeclared-identifier-LPI_FLAG_SLEW_RATE_SAME_REG
|-- arm64-randconfig-001-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- arm64-randconfig-002-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- arm64-randconfig-003-20231124
|   |-- arch-arm64-kernel-vdso32-vgettimeofday.c:error:conflicting-types-for-__vdso_clock_getres
|   `-- arch-arm64-kernel-vdso32-vgettimeofday.c:error:conflicting-types-for-__vdso_clock_gettime
|-- hexagon-allmodconfig
|   |-- arch-hexagon-kernel-process.c:warning:no-previous-prototype-for-function-do_work_pending
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-hexagon-kernel-traps.c:warning:no-previous-prototype-for-function-do_genex
|   |-- arch-hexagon-kernel-vdso.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-hexagon-kernel-vm_events.c:warning:no-previous-prototype-for-function-dummy_handler
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-paging_init
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-setup_arch_memory
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-execute_protection_fault
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-write_protection_fault
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_page
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_range
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-tlb_flush_all
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   |-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|   `-- stdin:warning:syscall-clone3-not-implemented-W-warnings
|-- hexagon-allnoconfig
|   |-- arch-hexagon-kernel-process.c:warning:no-previous-prototype-for-function-do_work_pending
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-hexagon-kernel-traps.c:warning:no-previous-prototype-for-function-do_genex
|   |-- arch-hexagon-kernel-vdso.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-hexagon-kernel-vm_events.c:warning:no-previous-prototype-for-function-dummy_handler
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-paging_init
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-setup_arch_memory
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-execute_protection_fault
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-write_protection_fault
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_page
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_range
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-tlb_flush_all
|   `-- stdin:warning:syscall-clone3-not-implemented-W-warnings
|-- hexagon-allyesconfig
|   |-- arch-hexagon-kernel-process.c:warning:no-previous-prototype-for-function-do_work_pending
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-hexagon-kernel-traps.c:warning:no-previous-prototype-for-function-do_genex
|   |-- arch-hexagon-kernel-vdso.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-hexagon-kernel-vm_events.c:warning:no-previous-prototype-for-function-dummy_handler
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-paging_init
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-setup_arch_memory
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-execute_protection_fault
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-write_protection_fault
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_page
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_range
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-tlb_flush_all
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   |-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|   `-- stdin:warning:syscall-clone3-not-implemented-W-warnings
|-- hexagon-defconfig
|   |-- arch-hexagon-kernel-process.c:warning:no-previous-prototype-for-function-do_work_pending
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-hexagon-kernel-traps.c:warning:no-previous-prototype-for-function-do_genex
|   |-- arch-hexagon-kernel-vdso.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-hexagon-kernel-vm_events.c:warning:no-previous-prototype-for-function-dummy_handler
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-paging_init
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-setup_arch_memory
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-execute_protection_fault
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-write_protection_fault
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_page
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_range
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-tlb_flush_all
|   `-- stdin:warning:syscall-clone3-not-implemented-W-warnings
|-- hexagon-randconfig-001-20231124
|   |-- arch-hexagon-kernel-process.c:warning:no-previous-prototype-for-function-do_work_pending
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-hexagon-kernel-traps.c:warning:no-previous-prototype-for-function-do_genex
|   |-- arch-hexagon-kernel-vdso.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-hexagon-kernel-vm_events.c:warning:no-previous-prototype-for-function-dummy_handler
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-paging_init
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-setup_arch_memory
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-execute_protection_fault
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-write_protection_fault
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_page
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_range
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-tlb_flush_all
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   `-- stdin:warning:syscall-clone3-not-implemented-W-warnings
|-- hexagon-randconfig-002-20231124
|   |-- arch-hexagon-kernel-process.c:warning:no-previous-prototype-for-function-do_work_pending
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_halt
|   |-- arch-hexagon-kernel-reset.c:warning:no-previous-prototype-for-function-machine_power_off
|   |-- arch-hexagon-kernel-traps.c:warning:no-previous-prototype-for-function-do_genex
|   |-- arch-hexagon-kernel-vdso.c:warning:no-previous-prototype-for-function-arch_setup_additional_pages
|   |-- arch-hexagon-kernel-vm_events.c:warning:no-previous-prototype-for-function-dummy_handler
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-paging_init
|   |-- arch-hexagon-mm-init.c:warning:no-previous-prototype-for-function-setup_arch_memory
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-execute_protection_fault
|   |-- arch-hexagon-mm-vm_fault.c:warning:no-previous-prototype-for-function-write_protection_fault
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_mm
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_page
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-flush_tlb_range
|   |-- arch-hexagon-mm-vm_tlb.c:warning:no-previous-prototype-for-function-tlb_flush_all
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   `-- stdin:warning:syscall-clone3-not-implemented-W-warnings
|-- i386-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-buildonly-randconfig-001-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-buildonly-randconfig-002-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-buildonly-randconfig-003-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-spi-spi-img-spfi.c:warning:unused-variable-img_spfi_of_match
|   |-- drivers-spi-spi-meson-spifc.c:warning:unused-variable-meson_spifc_dt_match
|   |-- drivers-spi-spi-pic32.c:warning:unused-variable-pic32_spi_of_match
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-buildonly-randconfig-004-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-buildonly-randconfig-005-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   `-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|-- i386-buildonly-randconfig-006-20231124
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-randconfig-001-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-randconfig-002-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-randconfig-003-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- fs-bcachefs-replicas.c:error:builtin-functions-must-be-directly-called
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- i386-randconfig-004-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-randconfig-005-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- i386-randconfig-006-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- i386-randconfig-141-20231124
|   |-- block-bdev.c-bdev_open_by_dev()-warn:possible-memory-leak-of-handle
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- crypto-tcrypt.c-do_test()-warn:Function-too-hairy.-No-more-merges.
|   |-- drivers-hwtracing-stm-core.c-stm_register_device()-error:double-free-of-stm
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- mips-mtx1_defconfig
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- powerpc-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- powerpc-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- powerpc-randconfig-002-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-net-ppp-pppoe.c:warning:variable-pde-set-but-not-used
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- powerpc-randconfig-003-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- powerpc64-randconfig-001-20231124
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- net-ipv4-ipconfig.c:warning:variable-start_jiffies-set-but-not-used
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- powerpc64-randconfig-002-20231124
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- powerpc64-randconfig-003-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- riscv-randconfig-001-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   `-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|-- riscv-randconfig-002-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   `-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|-- riscv-rv32_defconfig
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- x86_64-allmodconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-hwmon-pmbus-lm25066.c:warning:cast-to-smaller-integer-type-enum-chips-from-const-void
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- x86_64-allyesconfig
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mtd-nand-raw-lpc32xx_mlc.c:warning:cast-from-irqreturn_t-(-)(int-struct-lpc32xx_nand_host-)-(aka-enum-irqreturn-(-)(int-struct-lpc32xx_nand_host-)-)-to-irq_handler_t-(aka-enum-irqreturn-(-)(in
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-dest-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Excess-function-parameter-source-description-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-dst-not-described-in-gcov_info_add
|   |-- kernel-gcov-clang.c:warning:Function-parameter-or-member-src-not-described-in-gcov_info_add
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|   `-- sound-core-seq-seq_midi.c:warning:cast-from-int-(-)(struct-snd_rawmidi_substream-const-char-int)-to-snd_seq_dump_func_t-(aka-int-(-)(void-void-int)-)-converts-to-incompatible-function-type
|-- x86_64-buildonly-randconfig-001-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-net-ppp-pppoe.c:warning:variable-pde-set-but-not-used
|   |-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- x86_64-buildonly-randconfig-002-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mux-adg792a.c:warning:unused-variable-adg792a_of_match
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-buildonly-randconfig-003-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-buildonly-randconfig-004-20231124
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-buildonly-randconfig-005-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-buildonly-randconfig-006-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-dma-img-mdc-dma.c:warning:unused-variable-mdc_dma_of_match
|   |-- drivers-spi-spi-meson-spifc.c:warning:unused-variable-meson_spifc_dt_match
|   |-- drivers-spi-spi-pic32.c:warning:unused-variable-pic32_spi_of_match
|   |-- drivers-spi-spi-st-ssc4.c:warning:unused-variable-stm_spi_match
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- x86_64-randconfig-012-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-randconfig-013-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   `-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|-- x86_64-randconfig-014-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   `-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|-- x86_64-randconfig-015-20231124
|   `-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|-- x86_64-randconfig-016-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
|   |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
|   `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt
|-- x86_64-randconfig-071-20231124
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-mux-adg792a.c:warning:unused-variable-adg792a_of_match
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-randconfig-072-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   `-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|-- x86_64-randconfig-073-20231124
|   |-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|   `-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|-- x86_64-randconfig-074-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
|   |-- fs-bcachefs-btree_write_buffer.c:error:unknown-token-in-expression
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   `-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|-- x86_64-randconfig-075-20231124
|   |-- block-partitions-aix.c:warning:Function-parameter-or-member-state-not-described-in-read_lba
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-randconfig-076-20231124
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
|   |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   `-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|-- x86_64-randconfig-161-20231124
|   |-- block-bdev.c-bdev_open_by_dev()-warn:possible-memory-leak-of-handle
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-file-not-described-in-binder_task_work_cb
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-length-not-described-in-binder_sg_copy
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-offset-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-skip_size-not-described-in-binder_ptr_fixup
|   |-- drivers-android-binder.c:warning:Function-parameter-or-member-thread-not-described-in-binder_free_buf
|   |-- drivers-android-binder_alloc.c:warning:Function-parameter-or-member-lru-not-described-in-binder_alloc_free_page
|   |-- drivers-hwmon-sht3x.c-update_interval_write()-error:uninitialized-symbol-ret-.
|   |-- drivers-hwtracing-stm-core.c-stm_register_device()-error:double-free-of-stm
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-host-not-described-in-memstick_remove_host
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-mrq-not-described-in-memstick_init_req
|   |-- drivers-memstick-core-memstick.c:warning:Function-parameter-or-member-tpc-not-described-in-memstick_init_req
|   |-- drivers-thunderbolt-tmu.c-tb_switch_tmu_change_mode()-warn:missing-unwind-goto
|   |-- kernel-sched-fair.c-find_energy_efficient_cpu()-error:uninitialized-symbol-best_energy_cpu-.
|   |-- kernel-sched-fair.c-select_idle_sibling()-error:uninitialized-symbol-util_max-.
|   |-- kernel-sched-fair.c-select_idle_sibling()-error:uninitialized-symbol-util_min-.
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-in-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-olen-not-described-in-sw842_compress
|   |-- lib-842_compress.c:warning:Function-parameter-or-member-wmem-not-described-in-sw842_compress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-ilen-not-described-in-sw842_decompress
|   |-- lib-842_decompress.c:warning:Function-parameter-or-member-out-not-described-in-sw842_decompress
|   |-- lib-test_ida.c:warning:no-previous-prototype-for-function-ida_dump
|   |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
`-- x86_64-rhel-8.3-rust
    |-- drivers-usb-host-xhci.c:warning:Function-parameter-or-member-desc-not-described-in-xhci_get_endpoint_index
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-buf-not-described-in-ftrace_set_global_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_global_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-len-not-described-in-ftrace_set_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_filter
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_global_notrace
    |-- kernel-trace-ftrace.c:warning:Function-parameter-or-member-reset-not-described-in-ftrace_set_notrace
    |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-level-not-described-in-apparmor_socket_getsockopt
    |-- security-apparmor-lsm.c:warning:Function-parameter-or-member-optname-not-described-in-apparmor_socket_getsockopt
    `-- security-apparmor-lsm.c:warning:Function-parameter-or-member-sock-not-described-in-apparmor_socket_setsockopt

elapsed time: 1463m

configs tested: 177
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231124   gcc  
arc                   randconfig-002-20231124   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                          collie_defconfig   clang
arm                                 defconfig   clang
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20231124   clang
arm                   randconfig-002-20231124   clang
arm                   randconfig-003-20231124   clang
arm                   randconfig-004-20231124   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231124   clang
arm64                 randconfig-002-20231124   clang
arm64                 randconfig-003-20231124   clang
arm64                 randconfig-004-20231124   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231124   gcc  
csky                  randconfig-002-20231124   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231124   clang
hexagon               randconfig-002-20231124   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231124   clang
i386         buildonly-randconfig-002-20231124   clang
i386         buildonly-randconfig-003-20231124   clang
i386         buildonly-randconfig-004-20231124   clang
i386         buildonly-randconfig-005-20231124   clang
i386         buildonly-randconfig-006-20231124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231124   clang
i386                  randconfig-002-20231124   clang
i386                  randconfig-003-20231124   clang
i386                  randconfig-004-20231124   clang
i386                  randconfig-005-20231124   clang
i386                  randconfig-006-20231124   clang
i386                  randconfig-011-20231124   gcc  
i386                  randconfig-012-20231124   gcc  
i386                  randconfig-013-20231124   gcc  
i386                  randconfig-014-20231124   gcc  
i386                  randconfig-015-20231124   gcc  
i386                  randconfig-016-20231124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231124   gcc  
loongarch             randconfig-002-20231124   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231124   gcc  
nios2                 randconfig-002-20231124   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20231124   gcc  
parisc                randconfig-002-20231124   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc               randconfig-001-20231124   clang
powerpc               randconfig-002-20231124   clang
powerpc               randconfig-003-20231124   clang
powerpc                     tqm8540_defconfig   clang
powerpc64             randconfig-001-20231124   clang
powerpc64             randconfig-002-20231124   clang
powerpc64             randconfig-003-20231124   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231124   clang
riscv                 randconfig-002-20231124   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231124   gcc  
s390                  randconfig-002-20231124   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231124   gcc  
sh                    randconfig-002-20231124   gcc  
sh                           se7705_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231124   gcc  
sparc64               randconfig-002-20231124   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231124   clang
um                    randconfig-002-20231124   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231124   clang
x86_64       buildonly-randconfig-002-20231124   clang
x86_64       buildonly-randconfig-003-20231124   clang
x86_64       buildonly-randconfig-004-20231124   clang
x86_64       buildonly-randconfig-005-20231124   clang
x86_64       buildonly-randconfig-006-20231124   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231124   gcc  
x86_64                randconfig-002-20231124   gcc  
x86_64                randconfig-003-20231124   gcc  
x86_64                randconfig-004-20231124   gcc  
x86_64                randconfig-005-20231124   gcc  
x86_64                randconfig-006-20231124   gcc  
x86_64                randconfig-011-20231124   clang
x86_64                randconfig-012-20231124   clang
x86_64                randconfig-013-20231124   clang
x86_64                randconfig-014-20231124   clang
x86_64                randconfig-015-20231124   clang
x86_64                randconfig-016-20231124   clang
x86_64                randconfig-071-20231124   clang
x86_64                randconfig-072-20231124   clang
x86_64                randconfig-073-20231124   clang
x86_64                randconfig-074-20231124   clang
x86_64                randconfig-075-20231124   clang
x86_64                randconfig-076-20231124   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20231124   gcc  
xtensa                randconfig-002-20231124   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
