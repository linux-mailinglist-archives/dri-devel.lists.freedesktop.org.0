Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBF85757C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 06:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B614D10EA9A;
	Fri, 16 Feb 2024 05:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhDacnUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258FE10E0B5;
 Fri, 16 Feb 2024 05:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708059864; x=1739595864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mvd4+ES9H4+E9FF2CWmYJA4SeFWwPFFspFFuFegVVh4=;
 b=MhDacnUtW7U5OEs/kucpelEY+zaSUVnvFsQqYKLpwcwT3Z4sZbsRW7hA
 sblTo2uOUVphspJbbLZPzJu4paIynW60g7fO/kqfqsCl+w2n8JIoZ2KI0
 cNhaFeQP7Hyvfjzc8ZL8sr4u3y6fp4xbhxMvuRU23Z8GZD4nS3AbBVBxm
 Hu6/CaClAVy5cdEqO4xsNjLlb/sLtv4Wues3SvfDn6pZCB/5SjARByU4e
 t4o1mdisyWt3ymYggOFUvBAYRE5FqonKi6N6Vbjrdw0e8ttUzgHrQZZzI
 O/ilOy0wX1TQPl0Z+B3fnOIxmPflpJXZpg+rMq9Gn9N322aoFd2fv5LXR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5148369"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="5148369"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 21:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; d="scan'208";a="34532258"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 15 Feb 2024 21:04:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1raqOT-00010S-0h;
 Fri, 16 Feb 2024 05:04:13 +0000
Date: Fri, 16 Feb 2024 13:03:49 +0800
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
Message-ID: <202402161205.v9d7IYpg-lkp@intel.com>
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
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_ATY128-0-0 (https://download.01.org/0day-ci/archive/20240216/202402161205.v9d7IYpg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402161205.v9d7IYpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161205.v9d7IYpg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_ATY128
   .config:233:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:335:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:336:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:437:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:511:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:613:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:620:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:705:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:719:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:766:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:774:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:791:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:825:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:840:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:871:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:875:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:894:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:903:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:905:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1160:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1246:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1287:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:1411:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1517:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:1543:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1547:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1739:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1833:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:1972:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2263:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2304:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2383:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:2500:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2535:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2622:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2808:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2904:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2906:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2928:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2945:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:2952:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3033:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:3058:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3075:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3098:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3339:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3430:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3434:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3476:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3596:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3678:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3697:warning: symbol value 'n' invalid for VERBOSE_MCHECK_ON
   .config:3699:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3745:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3756:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4000:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4019:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:4118:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4145:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4176:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4290:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4465:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4574:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4596:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4702:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:4979:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5060:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5079:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5216:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5237:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5330:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5347:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5434:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5517:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5609:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5638:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5728:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5736:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5759:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5922:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5956:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6051:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6218:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6236:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6337:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6588:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6732:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6783:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6793:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6801:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:6860:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6968:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6999:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7132:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:7173:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7195:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7306:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:7367:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7497:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES
   .config:7540:warning: symbol value 'n' invalid for PANEL_LCD

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
