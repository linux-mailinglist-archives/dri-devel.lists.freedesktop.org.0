Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D72858D5D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 06:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4321910E39E;
	Sat, 17 Feb 2024 05:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYUHNDGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0413B10E0C8;
 Sat, 17 Feb 2024 05:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708148243; x=1739684243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UcrjHHCLf48qRWhBN9fennqcYtTDrQyju80s0KOzzEY=;
 b=YYUHNDGECr/FDeuFIdAWvHXLF6JP15TtTkCGBGQo/e4Ug6iXuBJ35gq0
 C8MBOog7SnV/JXlox3u7YixpMfrlIi8KQK/V4wsr5EMAxaThwVIaZOWo3
 /H0v9yk4ugsJExJyYX7GkLD6qzICUlpL0w9rfs9bGQ2qORNio53rhJk4B
 g6gB2ZQn+LEVpMNUTRJhKdOVZbOboaH/CbdAA0rLCiUDhkTek3G3MRfb6
 6cfaH5QyOps6MTLcPIBlxG6xeRfFJ96hH6xXdZTXN46cX5WXfL//rZul3
 E/GOblrAhbqc4GZ2krG/yIcgabiiF1B7HVIynFXflHyFCSBCqlGhWrUEH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19710479"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="19710479"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 21:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4072629"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 16 Feb 2024 21:37:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rbDNt-0001sK-1G;
 Sat, 17 Feb 2024 05:37:11 +0000
Date: Sat, 17 Feb 2024 13:36:40 +0800
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
Message-ID: <202402171302.HKl1Cpkb-lkp@intel.com>
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
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_TFT-0-0 (https://download.01.org/0day-ci/archive/20240217/202402171302.HKl1Cpkb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171302.HKl1Cpkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171302.HKl1Cpkb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_TFT
   .config:262:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:360:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:445:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:599:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:634:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:638:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:680:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:780:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:820:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:881:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:894:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:928:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:939:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:940:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:942:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1112:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:1181:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:1208:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1238:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:1330:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1516:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1666:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1808:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1972:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2387:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2412:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2427:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:2607:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2633:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2722:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2919:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:3017:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3041:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3066:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3113:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:3132:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:3173:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3216:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3306:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:3454:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3554:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3564:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3567:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3612:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3638:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3730:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3815:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:3901:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3983:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3998:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4187:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:4267:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4338:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4405:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4425:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4456:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4667:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:4750:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4769:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4884:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4960:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:5156:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5237:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5259:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5261:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:5423:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5520:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5539:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5772:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5808:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5843:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5872:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:5937:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5944:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5968:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6011:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6030:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6268:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6431:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6437:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6464:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:6652:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6767:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:6820:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6969:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7104:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7210:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7213:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7233:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7446:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7557:warning: symbol value 'n' invalid for IIO_CONSUMERS_PER_TRIGGER
   .config:7600:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7621:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7752:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES
   .config:7918:warning: symbol value 'n' invalid for VGA_ARB_MAX_GPUS
   .config:7998:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7999:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:8147:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_RINGSIZE
   .config:8240:warning: symbol value 'n' invalid for MTDRAM_TOTAL_SIZE
   .config:8329:warning: symbol value 'n' invalid for LOCKDEP_BITS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
