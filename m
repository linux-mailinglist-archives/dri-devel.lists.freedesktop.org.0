Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3784426C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 16:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FB310FA8C;
	Wed, 31 Jan 2024 15:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5F110FA87;
 Wed, 31 Jan 2024 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706713247; x=1738249247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XHXmUrXB0DQ91NntNyc8xAkHA9J2SJKaW6SzVulinmY=;
 b=QWOKkJDmQ10bh9ScmNFgFbSqajw2ZpSxCd+EZlyNhfLxT8DueRQou2Kd
 oVVpxsftz22PdIKsgXvhXKMYRigFBvpvfwktyGNjsOq9wg9npKRILm7ZN
 0Y/g1/rdW8/bqPM25RjPG4zBye5qxMXlO5NC8lOvpwEjN6HJwZt7gAicn
 t/APn0stKMtxxpNgoRyDOYVJktBalUXb7LMRg97WEpLRcPcHgJe12Jo72
 hnzJ+XL8OzIDx3gxm1YIMrIFr6drZyF23gpH68ODwXdXeVZZNzoL3sEa/
 DAeN+LnhdHxOdhfnpC0PvihffXPMk9s6LBiubFqukj1zq+A4tCFXeDj54 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10257209"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10257209"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 07:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="30525905"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2024 07:00:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rVC4o-0001eh-2h;
 Wed, 31 Jan 2024 15:00:34 +0000
Date: Wed, 31 Jan 2024 23:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] drm: Add drm_get_acpi_edid() helper
Message-ID: <202401312256.jBAoMFd9-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_ACPI_WMI-CONFIG_DRM-0-0 (https://download.01.org/0day-ci/archive/20240131/202401312256.jBAoMFd9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240131/202401312256.jBAoMFd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401312256.jBAoMFd9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_WMI when selected by DRM
   .config:248:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:250:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:308:warning: symbol value 'n' invalid for SQUASHFS_FRAGMENT_CACHE_SIZE
   .config:333:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:356:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:414:warning: symbol value 'n' invalid for FB_OMAP2_NUM_FBS
   .config:459:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:543:warning: symbol value 'n' invalid for CFAG12864B_RATE
   .config:651:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:665:warning: symbol value 'n' invalid for BLK_DEV_LOOP_MIN_COUNT
   .config:756:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:840:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:855:warning: symbol value 'n' invalid for MAGIC_SYSRQ_DEFAULT_ENABLE
   .config:893:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:894:warning: symbol value 'n' invalid for RAPIDIO_DISC_TIMEOUT
   .config:917:warning: symbol value 'n' invalid for FAT_DEFAULT_CODEPAGE
   .config:920:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:966:warning: symbol value 'n' invalid for CMA_SIZE_MBYTES
   .config:967:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:969:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:1152:warning: symbol value 'n' invalid for NODES_SHIFT
   .config:1247:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1307:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1318:warning: symbol value 'n' invalid for AIC7XXX_DEBUG_MASK
   .config:1479:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1645:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1682:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_Y
   .config:1861:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1936:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2029:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:2151:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2259:warning: symbol value 'n' invalid for SND_HDA_PREALLOC_SIZE
   .config:2310:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2467:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2523:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:2542:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:2725:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2745:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:2824:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:3026:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:3136:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:3162:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:3190:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3306:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3347:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3351:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:3503:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3641:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:3722:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3771:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3855:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3902:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3944:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3956:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:4174:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4201:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:4335:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4447:warning: symbol value 'n' invalid for X86_AMD_PSTATE_DEFAULT_MODE
   .config:4458:warning: symbol value 'n' invalid for CMA_AREAS
   .config:4516:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4640:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4685:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4808:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:4865:warning: symbol value 'n' invalid for MTRR_SANITIZER_SPARE_REG_NR_DEFAULT
   .config:4894:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_BAUDRATE
   .config:4965:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:5032:warning: symbol value 'n' invalid for DUMMY_CONSOLE_ROWS
   .config:5329:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:5423:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:5473:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5496:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5659:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5712:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5757:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5775:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:6033:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:6055:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:6189:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:6195:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:6205:warning: symbol value 'n' invalid for EFI_MAX_FAKE_MEM
   .config:6220:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:6443:warning: symbol value 'n' invalid for SERIAL_8250_RUNTIME_UARTS
   .config:6463:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:6572:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6726:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6937:warning: symbol value 'n' invalid for SND_MAX_CARDS
   .config:6996:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7104:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:7111:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:7124:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:7130:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7143:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:7521:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7815:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7944:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7994:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:8000:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:8084:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:8117:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:8132:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
