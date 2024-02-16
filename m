Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C18857D1D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 14:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7E10EB51;
	Fri, 16 Feb 2024 13:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAjzLwx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C28610EB46;
 Fri, 16 Feb 2024 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708088504; x=1739624504;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3oDy60zjdhTLSBPxSAfy1GIJx1bPsmJfTGaygN2Eg4w=;
 b=EAjzLwx3shFEdf5a5w3t5SpBicTMXsNyGcSXpryqfpFnlzWT/Q2+u8DG
 vkBGiXeTLe2UWzZetcjpKI0bWwRC6PUxPGvoZD00ySxxuX2U1O9rZfBee
 kX15jU/AOPuVoWSk6fEFqy2A8on1w1HiJIG2ls3FV29+uib7vk6qhBjGv
 aICisJANaUJ09CnlvMUOrY9dWxsuqGTSXBvMEad0AOetaJdxAoyrT5roU
 NAFlg76wKPuE41mVmR83fCOK0tUn2lsdDescUEyc+ppPT5QZDjexhBpMt
 Ki+7h52ztLJHCU5C8VX0ms8m/0BYNMBN9pUIccEukQcafSJIJPGJF4ezd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2348186"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2348186"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 05:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3859933"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 16 Feb 2024 05:01:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1raxqR-0001Hi-2T;
 Fri, 16 Feb 2024 13:01:35 +0000
Date: Fri, 16 Feb 2024 21:01:31 +0800
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
Message-ID: <202402162046.Jr7HgB8P-lkp@intel.com>
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
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_RADEON-0-0 (https://download.01.org/0day-ci/archive/20240216/202402162046.Jr7HgB8P-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402162046.Jr7HgB8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402162046.Jr7HgB8P-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_RADEON
   .config:171:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:253:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:358:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:438:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:623:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:662:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:677:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:773:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:804:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:870:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:891:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:918:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:928:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:930:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:935:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:1064:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:1162:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1182:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:1190:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1220:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1312:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1493:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1636:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1637:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1782:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1788:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:1939:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2157:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2205:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2353:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2384:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2400:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:2594:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2634:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2681:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2872:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2971:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2994:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3020:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3048:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3128:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3165:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3203:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:3465:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3493:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3514:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3518:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3561:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3619:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3682:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3810:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:3844:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3914:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3931:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4194:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4224:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4276:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4306:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4349:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4393:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4668:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4705:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4799:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4937:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:5092:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5174:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5180:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5196:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5355:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5368:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:5453:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5471:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5680:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:5681:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5733:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5766:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5861:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5867:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5891:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6093:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6189:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6272:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6289:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6359:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6399:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6420:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6526:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6547:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:6739:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6801:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:6887:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7085:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7089:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7106:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7367:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7411:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7483:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7545:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7675:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES
   .config:7720:warning: symbol value 'n' invalid for RCU_FANOUT

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
