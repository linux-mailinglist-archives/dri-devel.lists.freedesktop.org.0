Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F7843A06
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 10:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257D710F3FD;
	Wed, 31 Jan 2024 09:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA80E10E5E0;
 Wed, 31 Jan 2024 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706691750; x=1738227750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NJRd4XDA5lDVXNSXsbiVsUP4P+c7qrvLCJJwrQTLTL4=;
 b=UiGBrf8bLl75hXdEih2UAvdWv5Zf+72afShdZvTNCpqstmeq0+8kqE5l
 VEv65371tYjoyudBc8oaKT4gkLU1WwP2F4bLa4Yc/bRPzmYQWj+gtfYSn
 TVVAI3E48QaOdPG4uoecNuLWqrnipJR5NDUuiPSiJ22A2S5/NO/4y/XmZ
 lpsivF7c5GzQR6QItGv+gurDQEoq4e/MSV3fzN4QRTjgR5xGlemKHKlYN
 wxMFbJiG0O/+bEAMW35W3cTZogKGMkCmjKjfgh7MJDGk+tGKYUT7N8CwC
 U18wbfM9qrTR9WW67kdXjfM7aIdEaHJAojOfpYy4wag7sbei/2U4bIwE4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10177153"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10177153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 01:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="30169253"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 31 Jan 2024 01:02:25 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rV6U5-0001MC-0U;
 Wed, 31 Jan 2024 09:02:19 +0000
Date: Wed, 31 Jan 2024 17:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] drm: Add drm_get_acpi_edid() helper
Message-ID: <202401311634.FE5CBVwe-lkp@intel.com>
References: <20240130192608.11666-3-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130192608.11666-3-mario.limonciello@amd.com>
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
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, oe-kbuild-all@lists.linux.dev,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/acpi-bus linus/master v6.8-rc2 next-20240131]
[cannot apply to drm-misc/drm-misc-next rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-video-Handle-fetching-EDID-that-is-longer-than-256-bytes/20240131-032909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240130192608.11666-3-mario.limonciello%40amd.com
patch subject: [PATCH v2 2/4] drm: Add drm_get_acpi_edid() helper
config: x86_64-kismet-CONFIG_ACPI_PLATFORM_PROFILE-CONFIG_HP_WMI-0-0 (https://download.01.org/0day-ci/archive/20240131/202401311634.FE5CBVwe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401311634.FE5CBVwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311634.FE5CBVwe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_PLATFORM_PROFILE when selected by HP_WMI
   .config:101:warning: symbol value 'n' invalid for RADIO_RTRACK2_PORT
   .config:223:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:240:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:310:warning: symbol value 'n' invalid for DRM_I915_TIMESLICE_DURATION
   .config:321:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:345:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:457:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:633:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:651:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:674:warning: symbol value 'n' invalid for FB_GBE_MEM
   .config:739:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:836:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:851:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:871:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:900:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:951:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:961:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:962:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1002:warning: symbol value 'n' invalid for SQUASHFS_FRAGMENT_CACHE_SIZE
   .config:1113:warning: symbol value 'n' invalid for FB_OMAP2_NUM_FBS
   .config:1237:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1253:warning: symbol value 'n' invalid for CFAG12864B_RATE
   .config:1290:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1468:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1528:warning: symbol value 'n' invalid for RAPIDIO_DISC_TIMEOUT
   .config:1568:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:1608:warning: symbol value 'n' invalid for WATCHDOG_OPEN_TIMEOUT
   .config:1615:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1638:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:1850:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1903:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2189:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2246:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2358:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2452:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2554:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2701:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2763:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:2798:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2996:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:3107:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3132:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3152:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:3159:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3236:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:3278:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3321:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3414:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3437:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3468:warning: symbol value 'n' invalid for BLK_DEV_LOOP_MIN_COUNT
   .config:3692:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3695:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3696:warning: symbol value 'n' invalid for CMA_SIZE_MBYTES
   .config:3739:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3773:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3870:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3887:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3963:warning: symbol value 'n' invalid for AIC7XXX_DEBUG_MASK
   .config:4102:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4257:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4296:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:4599:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4610:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4730:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4819:warning: symbol value 'n' invalid for MTRR_SANITIZER_SPARE_REG_NR_DEFAULT
   .config:4918:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:5343:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5415:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5437:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5601:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5609:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5700:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5718:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5871:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:5992:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:6028:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:6121:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:6130:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:6140:warning: symbol value 'n' invalid for EFI_MAX_FAKE_MEM
   .config:6156:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6336:warning: symbol value 'n' invalid for KVM_MAX_NR_VCPUS
   .config:6443:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6483:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:6485:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6661:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6684:warning: symbol value 'n' invalid for X86_AMD_PSTATE_DEFAULT_MODE
   .config:6771:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:6867:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:6978:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7002:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7041:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:7080:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:7091:warning: symbol value 'n' invalid for LOCKDEP_BITS
   .config:7236:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:7398:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:7400:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7745:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7808:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7916:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:7917:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
