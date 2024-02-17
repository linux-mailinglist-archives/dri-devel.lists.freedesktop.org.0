Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454A858CCB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 02:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5301010ED2A;
	Sat, 17 Feb 2024 01:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ulq3KcMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F0E10ED13;
 Sat, 17 Feb 2024 01:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708133734; x=1739669734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tJeR/H25Fovx8yHdDib038WHOER0afSpQWRaKY3w+iE=;
 b=Ulq3KcMmk95gLvjEWKpy/rGKnBxv/B7l+bx42KJ9BTpCbzeHuo4gGZOu
 H+4r8G0g7vfREmd6yg8FVPMwpnNZ8+lVvGZL5O0ObBiBq3sUyKfWm3PT3
 PnyT/F888Z6VW1Y9LS5pMwNFUsUmt7dRHW6fh5l9XBuqr40bvsghJ//Fl
 oW9aDk2hu0xTkKbYTGnlft/iABDdzo1JIt8J7VKOZa4HrdoKPpLXVAtms
 DW2R3Q0f7B4+BHI2abs6HOuqeVYTv0a1eT/+XFg7wqv2cIUT5Lu/Le5AS
 hnNkTLP5vDnS3BT4aWuo2h7Oj+BNRv3PlYgL9Q0mYMLdPZMODIfO5ZB2j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19803083"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="19803083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 17:35:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4378886"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa008.jf.intel.com with ESMTP; 16 Feb 2024 17:35:27 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rb9bu-0001kB-1k;
 Sat, 17 Feb 2024 01:35:23 +0000
Date: Sat, 17 Feb 2024 09:34:54 +0800
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
Message-ID: <202402170903.pSlAhO5F-lkp@intel.com>
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
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_SSD1307-0-0 (https://download.01.org/0day-ci/archive/20240217/202402170903.pSlAhO5F-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240217/202402170903.pSlAhO5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402170903.pSlAhO5F-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_SSD1307
   .config:254:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:268:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:441:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:460:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:610:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:619:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:645:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:757:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:758:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:800:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:834:warning: symbol value 'n' invalid for DUMMY_CONSOLE_ROWS
   .config:844:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:858:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:882:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:894:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:903:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:915:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:917:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:942:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:1062:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:1143:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1173:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1281:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1324:warning: symbol value 'n' invalid for VERBOSE_MCHECK_ON
   .config:1453:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1605:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1659:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:1755:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1881:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2135:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:2155:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2172:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2315:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2317:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2557:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2643:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2791:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2831:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2932:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2954:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2972:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:2978:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3082:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3119:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3212:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3341:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3400:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3454:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3457:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3497:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3617:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3726:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3797:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3808:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3841:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3941:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4058:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4147:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4204:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4206:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4318:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4534:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4541:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:4625:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4651:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5011:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5062:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5094:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5116:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5272:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5365:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5381:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5516:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5649:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5678:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5764:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5773:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5798:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5814:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6093:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6259:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6263:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6639:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6767:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6786:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6896:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6900:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6903:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6912:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7200:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7232:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:7250:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7278:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7421:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7426:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7604:warning: symbol value 'n' invalid for RCU_FANOUT
   .config:7657:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7780:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7944:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_RINGSIZE
   .config:8034:warning: symbol value 'n' invalid for MTDRAM_TOTAL_SIZE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
