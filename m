Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10E8572C6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 01:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D210EA76;
	Fri, 16 Feb 2024 00:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxQA5Jnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E17010EA68;
 Fri, 16 Feb 2024 00:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708044568; x=1739580568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hi1g0+fYHpb/qBcKjqo9OodSh/zvZwSukb8y7gMsq40=;
 b=YxQA5JnzRUMMCAMGNTLsBtggUndExZiUcnYttrs3jl3RUHuUP9udltqk
 7KXXBA8Srji8bWRYzmHoqBlqhMZa0hEVZ3oS28akHHL0vTz0tLJgRMbz6
 q/McidgFdmqdqvOooT9gufBGphKo/Fbh7+DaLHivdrTUCR0GuqSXAuyZu
 V/8QdR37Xc8dnojJSRk4P+U2OQpTNQC+2YLrkYrWuqjihSi9fy0vRh7Ip
 Go810NLxRD0WD4fBxjBEWEqcj7vOE24eWLp31QxcX8JqNj5b2BgrPT9HL
 SBV7efVfe8tRW+hc2zKVO/+00TGWhufGAZHUcOvTvV1ep7M1VxrP4U/8/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2566740"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2566740"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 16:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="3624569"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 15 Feb 2024 16:49:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ramPo-0000sm-1m;
 Fri, 16 Feb 2024 00:49:20 +0000
Date: Fri, 16 Feb 2024 08:49:11 +0800
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
Message-ID: <202402160822.2b7VxNN3-lkp@intel.com>
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
config: alpha-kismet-CONFIG_FB_BACKLIGHT-CONFIG_FB_ATY-0-0 (https://download.01.org/0day-ci/archive/20240216/202402160822.2b7VxNN3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240216/202402160822.2b7VxNN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160822.2b7VxNN3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_BACKLIGHT when selected by FB_ATY
   .config:163:warning: symbol value 'n' invalid for USB_GADGET_STORAGE_NUM_BUFFERS
   .config:241:warning: symbol value 'n' invalid for SATA_MOBILE_LPM_POLICY
   .config:343:warning: symbol value 'n' invalid for PSTORE_BLK_MAX_REASON
   .config:432:warning: symbol value 'n' invalid for KFENCE_SAMPLE_INTERVAL
   .config:572:warning: symbol value 'n' invalid for PANEL_LCD_PIN_E
   .config:596:warning: symbol value 'n' invalid for AIC79XX_DEBUG_MASK
   .config:616:warning: symbol value 'n' invalid for DRM_XE_JOB_TIMEOUT_MIN
   .config:629:warning: symbol value 'n' invalid for CRYPTO_DEV_QCE_SW_MAX_LEN
   .config:738:warning: symbol value 'n' invalid for PANEL_LCD_CHARSET
   .config:794:warning: symbol value 'n' invalid for SND_AC97_POWER_SAVE_DEFAULT
   .config:852:warning: symbol value 'n' invalid for DRM_I915_MAX_REQUEST_BUSYWAIT
   .config:887:warning: symbol value 'n' invalid for SND_AT73C213_TARGET_BITRATE
   .config:902:warning: symbol value 'n' invalid for SERIAL_AR933X_NR_UARTS
   .config:903:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MIN
   .config:911:warning: symbol value 'n' invalid for NET_EMATCH_STACK
   .config:913:warning: symbol value 'n' invalid for VMCP_CMA_SIZE
   .config:986:warning: symbol value 'n' invalid for AIC79XX_CMDS_PER_DEVICE
   .config:1048:warning: symbol value 'n' invalid for PANEL_LCD_PIN_SDA
   .config:1170:warning: symbol value 'n' invalid for MTDRAM_ERASE_SIZE
   .config:1270:warning: symbol value 'n' invalid for SERIAL_UARTLITE_NR_UARTS
   .config:1434:warning: symbol value 'n' invalid for LEGACY_PTY_COUNT
   .config:1578:warning: symbol value 'n' invalid for AIC7XXX_RESET_DELAY_MS
   .config:1614:warning: symbol value 'n' invalid for AIC79XX_RESET_DELAY_MS
   .config:1753:warning: symbol value 'n' invalid for IBM_EMAC_POLL_WEIGHT
   .config:1867:warning: symbol value 'n' invalid for DRM_I915_STOP_TIMEOUT
   .config:2174:warning: symbol value 'n' invalid for RCU_FANOUT_LEAF
   .config:2220:warning: symbol value 'n' invalid for MTD_REDBOOT_DIRECTORY_BLOCK
   .config:2308:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MAX
   .config:2320:warning: symbol value 'n' invalid for PANEL_LCD_BWIDTH
   .config:2339:warning: symbol value 'n' invalid for KCOV_IRQ_AREA_SIZE
   .config:2559:warning: symbol value 'n' invalid for PANEL_PARPORT
   .config:2646:warning: symbol value 'n' invalid for NOUVEAU_DEBUG_DEFAULT
   .config:2838:warning: symbol value 'n' invalid for KCSAN_REPORT_ONCE_IN_MS
   .config:2936:warning: symbol value 'n' invalid for KCSAN_UDELAY_INTERRUPT
   .config:2958:warning: symbol value 'n' invalid for PANEL_LCD_PIN_BL
   .config:2971:warning: symbol value 'n' invalid for SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_NUM
   .config:2976:warning: symbol value 'n' invalid for DEBUG_OBJECTS_ENABLE_DEFAULT
   .config:2984:warning: symbol value 'n' invalid for INITRAMFS_ROOT_GID
   .config:3090:warning: symbol value 'n' invalid for ATM_FORE200E_TX_RETRY
   .config:3124:warning: symbol value 'n' invalid for FB_OMAP2_DSS_MIN_FCK_PER_PCK
   .config:3301:warning: symbol value 'n' invalid for PSTORE_BLK_CONSOLE_SIZE
   .config:3393:warning: symbol value 'n' invalid for FTRACE_RECORD_RECURSION_SIZE
   .config:3415:warning: symbol value 'n' invalid for KCSAN_UDELAY_TASK
   .config:3448:warning: symbol value 'n' invalid for BOOKE_WDT_DEFAULT_TIMEOUT
   .config:3468:warning: symbol value 'n' invalid for MMC_BLOCK_MINORS
   .config:3472:warning: symbol value 'n' invalid for INET_TABLE_PERTURB_ORDER
   .config:3509:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_SYNC
   .config:3557:warning: symbol value 'n' invalid for XEN_MEMORY_HOTPLUG_LIMIT
   .config:3630:warning: symbol value 'n' invalid for UCLAMP_BUCKETS_COUNT
   .config:3748:warning: symbol value 'n' invalid for SERIAL_MCF_BAUDRATE
   .config:3819:warning: symbol value 'n' invalid for DE2104X_DSL
   .config:3828:warning: symbol value 'n' invalid for BLK_DEV_RAM_COUNT
   .config:3978:warning: symbol value 'n' invalid for VGA_ARB_MAX_GPUS
   .config:4041:warning: symbol value 'n' invalid for STACK_MAX_DEFAULT_SIZE_MB
   .config:4085:warning: symbol value 'n' invalid for IP_VS_SH_TAB_BITS
   .config:4118:warning: symbol value 'n' invalid for IP_VS_MH_TAB_INDEX
   .config:4225:warning: symbol value 'n' invalid for INPUT_MOUSEDEV_SCREEN_X
   .config:4241:warning: symbol value 'n' invalid for USBIP_VHCI_HC_PORTS
   .config:4339:warning: symbol value 'n' invalid for RIONET_RX_SIZE
   .config:4568:warning: symbol value 'n' invalid for RADIO_TYPHOON_PORT
   .config:4608:warning: symbol value 'n' invalid for PANEL_LCD_PIN_RW
   .config:4649:warning: symbol value 'n' invalid for IBM_EMAC_TXB
   .config:4689:warning: symbol value 'n' invalid for SERIAL_TXX9_NR_UARTS
   .config:5033:warning: symbol value 'n' invalid for ARCH_MMAP_RND_BITS
   .config:5113:warning: symbol value 'n' invalid for DRM_I915_FENCE_TIMEOUT
   .config:5135:warning: symbol value 'n' invalid for TTY_PRINTK_LEVEL
   .config:5292:warning: symbol value 'n' invalid for MIPS_EJTAG_FDC_KGDB_CHAN
   .config:5385:warning: symbol value 'n' invalid for KDB_DEFAULT_ENABLE
   .config:5402:warning: symbol value 'n' invalid for SERIAL_ALTERA_UART_MAXPORTS
   .config:5456:warning: symbol value 'n' invalid for RCU_BOOST_DELAY
   .config:5564:warning: symbol value 'n' invalid for PPC_EARLY_DEBUG_EHV_BC_HANDLE
   .config:5666:warning: symbol value 'n' invalid for PANEL_LCD_HWIDTH
   .config:5701:warning: symbol value 'n' invalid for LOCKDEP_CHAINS_BITS
   .config:5792:warning: symbol value 'n' invalid for DRM_I915_HEARTBEAT_INTERVAL
   .config:5798:warning: symbol value 'n' invalid for KCSAN_SKIP_WATCH
   .config:5822:warning: symbol value 'n' invalid for PSTORE_BLK_KMSG_SIZE
   .config:5974:warning: symbol value 'n' invalid for DRM_XE_PREEMPT_TIMEOUT_MAX
   .config:6075:warning: symbol value 'n' invalid for CRYPTO_DEV_FSL_CAAM_INTC_TIME_THLD
   .config:6121:warning: symbol value 'n' invalid for ARCH_MMAP_RND_COMPAT_BITS
   .config:6289:warning: symbol value 'n' invalid for RADIO_TRUST_PORT
   .config:6400:warning: symbol value 'n' invalid for SERIAL_SH_SCI_NR_UARTS
   .config:6466:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_MAX_TAGS
   .config:6574:warning: symbol value 'n' invalid for MTD_UBI_WL_THRESHOLD
   .config:6603:warning: symbol value 'n' invalid for RIONET_TX_SIZE
   .config:6669:warning: symbol value 'n' invalid for CMA_SIZE_PERCENTAGE
   .config:6807:warning: symbol value 'n' invalid for DRM_XE_TIMESLICE_MIN
   .config:6961:warning: symbol value 'n' invalid for DVB_MAX_ADAPTERS
   .config:6968:warning: symbol value 'n' invalid for SCSI_NCR53C8XX_MAX_TAGS
   .config:6978:warning: symbol value 'n' invalid for SCSI_SYM53C8XX_DMA_ADDRESSING_MODE
   .config:7004:warning: symbol value 'n' invalid for OMAP2_DSS_MIN_FCK_PER_PCK
   .config:7282:warning: symbol value 'n' invalid for SERIAL_ARC_NR_PORTS
   .config:7352:warning: symbol value 'n' invalid for IBM_EMAC_RXB
   .config:7455:warning: symbol value 'n' invalid for SCSI_MPT3SAS_MAX_SGE
   .config:7523:warning: symbol value 'n' invalid for ZSMALLOC_CHAIN_SIZE
   .config:7540:warning: symbol value 'n' invalid for KDB_CONTINUE_CATASTROPHIC
   .config:7587:warning: symbol value 'n' invalid for PSTORE_DEFAULT_KMSG_BYTES
   .config:7632:warning: symbol value 'n' invalid for RCU_FANOUT
   .config:7717:warning: symbol value 'n' invalid for VIDEO_VIVID_MAX_DEVS
   .config:7732:warning: symbol value 'n' invalid for PANEL_LCD
   .config:7781:warning: symbol value 'n' invalid for LOCKDEP_BITS

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
