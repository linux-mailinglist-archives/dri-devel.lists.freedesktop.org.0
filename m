Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91A8587DD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 22:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE3E10ECC5;
	Fri, 16 Feb 2024 21:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwnhhII5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A3210E3AC;
 Fri, 16 Feb 2024 21:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708118344; x=1739654344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wew+CW4tKdINP5Tg/pRZDgVR1S7k1tpLboeBWPBTKIE=;
 b=dwnhhII5MEBCt0/s8cIOsPXAP+pSPlGGqs4704Y3hPh+5MxzRLzTM84U
 1NmqTAl693Wq33Ywv3r5MX1f4Lz/KtieurHMwuxhRxtuPfR9AZcLt4WT6
 LShmU+5iChCjpTnvt0Ic6SqqFddCcmFmoWf6B/NJs2iG741UATt7fRCpN
 3EfYAp5bKjchy+locPJHIb3Ci8dLL++cQGCj06MpfHXNnpuHwAZMkZX8g
 OKAMj5Fnwf3GZRSUrbuWxJ25Qmp4ChsQi+GdqEH34Nib/VvuAHpRUJQko
 saMkV90Prjo/GP2t/vqWe++mCp9HCnEqwSqAacENmil0fPlZlX/yBmnnw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2377624"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2377624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 13:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="3996861"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 16 Feb 2024 13:18:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rb5bj-0001cC-1f;
 Fri, 16 Feb 2024 21:18:55 +0000
Date: Sat, 17 Feb 2024 05:18:06 +0800
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
Message-ID: <202402170543.qd0JRj6h-lkp@intel.com>
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
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_SH_MOBILE_LCDC-0-0 (https://download.01.org/0day-ci/archive/20240217/202402170543.qd0JRj6h-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240217/202402170543.qd0JRj6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402170543.qd0JRj6h-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_SH_MOBILE_LCDC
   .config:92:warning: symbol value 'n' invalid for AIC7XXX_DEBUG_MASK
   .config:218:warning: symbol value 'n' invalid for RAPIDIO_DISC_TIMEOUT
   .config:242:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:259:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:339:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:341:warning: symbol value 'n' invalid for PANEL_PROFILE
   .config:352:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:432:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:610:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:616:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:717:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:755:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:784:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:805:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:807:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:825:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:864:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:886:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:894:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:896:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:988:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:1124:warning: symbol value 'n' invalid for RCU_CPU_STALL_TIMEOUT
   .config:1150:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1237:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1303:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:1396:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1533:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1723:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1759:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:1805:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:1981:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2132:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2232:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2278:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2512:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2520:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2599:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2785:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2883:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2884:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2894:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:2908:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2924:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:2931:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3032:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3059:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3068:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3282:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3397:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3400:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3410:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:3443:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3560:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3580:warning: symbol value 'n' invalid for SCSI_MESH_RESET_DELAY_MS
   .config:3610:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3668:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3680:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3693:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3752:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:3932:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4071:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4138:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4250:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4394:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4425:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:4508:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4550:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4931:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5013:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5035:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5172:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:5188:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5279:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5297:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5359:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5361:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5550:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5576:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:5583:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5677:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5683:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5706:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6004:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6113:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:6170:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6171:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6246:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:6545:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6684:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6702:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6725:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6734:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6747:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:6873:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7082:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7112:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7150:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:7153:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7244:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:7262:warning: symbol value 'n' invalid for RIONET_TX_SIZE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
