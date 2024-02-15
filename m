Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D485856EFD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 21:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E78010EA32;
	Thu, 15 Feb 2024 20:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZtT7tP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AA310E05F;
 Thu, 15 Feb 2024 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708030774; x=1739566774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dzMOWydciWlsZQSBk3YqJpzmwB45g+fPik1wUBpE5hc=;
 b=XZtT7tP3KYpLZHEoNteRQIah/O8ZxYOxFBrf0rltljjp4cPo6dB/ioWL
 LtNF5Mxd2/+vvk1Ci6BXcigKMEMZaGQmBVPG4SsJ5cxVGGOFYBHT7sVYu
 ydCdg/+Nbm5NLUgj1hq/br1rTNYXPn4XoUZacrD0l8b9YYemX088aJkKh
 xEWYe/aVKkt+QYRAqIum60JMFV1qmJRGwnXXPsJql38nGj6LUexs4LL3n
 lRxF3lBut2mktYPImkxdlRTruKkE27rVaL+C9FqbzSq7invCoaZ9yzJVv
 NuWDAUwQwEoZJ7u4SMHEQ0YrcL0aeqsCk2KQNJjk58XgJ9FNZAGv/+K/H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2021959"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2021959"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 12:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3671651"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 15 Feb 2024 12:59:25 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1raipF-0000lM-1e;
 Thu, 15 Feb 2024 20:59:21 +0000
Date: Fri, 16 Feb 2024 04:59:06 +0800
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
Message-ID: <202402160459.DYHkPajY-lkp@intel.com>
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
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-Stop-using-select-ACPI_VIDEO-in-all-drivers/20240215-055936
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240214215756.6530-2-mario.limonciello%40amd.com
patch subject: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_ATMEL-0-0 (https://download.01.org/0day-ci/archive/20240216/202402160459.DYHkPajY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402160459.DYHkPajY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160459.DYHkPajY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_ATMEL
   .config:166:warning: symbol value 'n' invalid for RAPIDIO_DISC_TIMEOUT
   .config:190:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:241:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:335:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:344:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:426:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:596:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:618:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:712:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:752:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:770:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:790:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:810:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:823:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:860:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:875:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:884:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:886:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:917:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:1139:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1233:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1245:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:1403:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1541:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1550:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1686:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:1717:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1805:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:1972:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2126:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2231:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2274:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2465:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2585:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2775:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2836:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:2873:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2887:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2896:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2920:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3025:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3062:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3074:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3302:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3394:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:3401:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3404:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3448:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3530:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:3564:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3640:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3680:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3713:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3724:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3970:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4097:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4114:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4149:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4265:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4408:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:4445:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4551:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4565:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4947:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5030:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5051:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5144:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:5208:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5301:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5319:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5392:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5433:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5568:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5575:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5607:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5699:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5706:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5729:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5933:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6028:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6099:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:6193:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6195:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6218:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:6553:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6639:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6698:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6739:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6746:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6761:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:6879:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7073:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7096:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:7104:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7163:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7198:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:7199:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:7337:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7477:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7508:warning: symbol value 'n' invalid for RCU_FANOUT

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
