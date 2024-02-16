Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A470D8583AF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94B310EC54;
	Fri, 16 Feb 2024 17:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOgeLvgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A72310EC49;
 Fri, 16 Feb 2024 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708103554; x=1739639554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K6UtEVBR6uRkR+4SVn/AX4Wfv7U6gUrkLF6U4slDXBs=;
 b=ZOgeLvgSqXRDg5YIdquXteiQtNS7F01FTZ6ijKAioHRRSZyRLiWK8UBN
 eJWajmZr2UOO5mJvFIMqLs1ujUOw3L0vIXJcQB9NQtzeIEMQwaDu16szQ
 EIv0OgkwAnuhlLfivI3f0/eCKIkPmQ5AuiRAynZpDPW88KBGnKkCYtKr/
 hJZdY7jUP39NzDqTK8LBJzw/J8vnR3hi4BGg2T8eIMBKVz3es/ocOQ1dA
 Zg+6oWytl6SrgFBCZ4l54PXnsARviVKzlmLEiRyVcXPLgvfC4YkPZBffH
 6yp3lMpu8UwIWaQmpYoUkmv2Eg1vi0Bj51UtsHNwmMkAgyh1xyfzF+fg/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="12782912"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="12782912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 09:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8486686"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2024 09:11:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rb1kV-0001UC-29;
 Fri, 16 Feb 2024 17:11:48 +0000
Date: Sat, 17 Feb 2024 01:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
Message-ID: <202402170047.miJMtqIc-lkp@intel.com>
References: <20240214215756.6530-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214215756.6530-2-mario.limonciello@amd.com>
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

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-Stop-using-select-ACPI_VIDEO-in-all-drivers/20240215-055936
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240214215756.6530-2-mario.limonciello%40amd.com
patch subject: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_RIVA-0-0 (https://download.01.org/0day-ci/archive/20240217/202402170047.miJMtqIc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240217/202402170047.miJMtqIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402170047.miJMtqIc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_RIVA
   .config:69:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:240:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:307:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:328:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:359:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:429:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:612:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:613:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:702:warning: symbol value 'n' invalid for VGA_ARB_MAX_GPUS
   .config:715:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:789:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:793:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:811:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:830:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:855:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:877:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:893:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:901:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:903:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1095:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:1130:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1159:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1238:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1397:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1524:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:1528:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1726:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1763:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:1817:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2048:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2143:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2237:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2290:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2523:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2568:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2606:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2707:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:2779:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:2791:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2888:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2910:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2934:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:2968:warning: symbol value 'n' invalid for DUMMY_CONSOLE_ROWS
   .config:3008:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3038:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3078:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3203:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3248:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:3294:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3407:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3455:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3570:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3636:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3708:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3721:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3787:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3964:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4094:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4105:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4149:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4235:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:4264:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4416:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4524:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4565:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4948:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:4975:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:5029:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5051:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5209:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5298:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5316:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5323:warning: symbol value 'n' invalid for PANEL_PROFILE
   .config:5384:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5424:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5570:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5574:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5605:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5694:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5702:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5724:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5929:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6021:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6127:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:6186:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6198:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6321:warning: symbol value 'n' invalid for VERBOSE_MCHECK_ON
   .config:6560:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6580:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6708:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6757:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6760:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6777:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7048:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:7062:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7140:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7148:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:7167:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:7172:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7266:warning: symbol value 'n' invalid for LOCKDEP_BITS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
