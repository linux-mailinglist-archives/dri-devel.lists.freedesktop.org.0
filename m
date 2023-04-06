Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914926D9D79
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AE510EC5B;
	Thu,  6 Apr 2023 16:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF3210EC5B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:24:08 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94971337b10so13608366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 09:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680798247; x=1683390247;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AnA2PMAB62wwSg/6v/Op5LcZjbURhrX+N7Ls0hv92X4=;
 b=fJRQWbQIFzepewP/phpZ1UZRoW2o+QHpxpLBnYKFmBRX8KN7VltXTrygBDuoZ0pRhX
 Z6+TCyd/MPIyXNsyKhQ4JJM1mF/bn0I+WGJSDwzp9bRktoKdPiOqEGsueND7+T+gbvoT
 +zwa6H69aUqnQc9vgCmYhivXOpenfrs7aJwAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680798247; x=1683390247;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnA2PMAB62wwSg/6v/Op5LcZjbURhrX+N7Ls0hv92X4=;
 b=f2gHljRRvdBkADFm09wIrSyc/IusNcQIfmTd+5xA5V1zMhW9ZUbqPBZFSXGyac01xx
 9aImvmHLB/iX141vEeh3AGTk5B+aA1NIaTdMTYwnXWi0nDHJ8OjlZR3KQ038tpRuS3XR
 RiLq7GU6OgMbvlARHPYK0A3sjhOlKxCZshAiiSlJjcqZ5hhwd1TZJiPx6fwZ2C1PAzOx
 fDHvmuoEs19EKBztjJiWsRPlIMzIOeaYquJ4UDvHZb3ljqfJFbzBIz9Nn/dbyDoiofM3
 TbBRLjnDt09Q4BRwpS90DtlnBzUifC0Y0Qzxf47DUNlr4RuoqrYsgyX2J9anKdq6p1C5
 zmlw==
X-Gm-Message-State: AAQBX9cuGmdBbxpTvEx8Vl7GIeC9523gPnnkv5f3aGXpqbyZN+A0CiOB
 V917tpp+zsGVirkta15GZAMvEw==
X-Google-Smtp-Source: AKy350ZDOv4aSvJlmfQigu/iAijCUl8RKPVmf8qdpc3q1iWaRclR//9q9lmKSxCXW6+Nj7OSsFvLLg==
X-Received: by 2002:a17:906:1d4:b0:92e:f520:7762 with SMTP id
 20-20020a17090601d400b0092ef5207762mr5566661ejj.6.1680798246686; 
 Thu, 06 Apr 2023 09:24:06 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 gl2-20020a170906e0c200b00930aa50372csm1000828ejb.43.2023.04.06.09.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 09:24:06 -0700 (PDT)
Date: Thu, 6 Apr 2023 18:24:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] drm-intel-next
Message-ID: <ZC7yJMiqFdlJ3LOh@phenom.ffwll.local>
References: <ZC7RR3Laet8ywHRo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZC7RR3Laet8ywHRo@intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:03:51AM -0400, Rodrigo Vivi wrote:
> Hi Daniel,
> 
> Here goes drm-intel-next-2023-04-06:
> 
> - Fix DPT+shmem combo and add i915.enable_dpt modparam (Ville)
> - i915.enable_sagv module parameter (Ville)
> - Correction to QGV related register addresses (Vinod)
> - IPS debugfs per-crtc and new file for false_color (Ville)
> - More clean-up and reorganization of Display code (Jani)
> - DP DSC related fixes and improvements (Stanislav, Ankit, Suraj, Swati)
> - Make utility pin asserts more accurate (Ville)
> - Meteor Lake enabling (Daniele)
> - High refresh rate PSR fixes (Jouni)
> - Cursor and Plane chicken register fixes (Ville)
> - Align the ADL-P TypeC sequences with hardware specification (Imre)
> - Documentation build fixes and improvements to catch bugs earlier (Lee, Jani)
> - PL1 power limit hwmon entry changed to use 0 as disabled state (Ashutosh)
> - DP aux sync fix and improvements (Ville)
> - DP MST fixes and w/a (Stanislav)
> - Limit PXP drm-errors or warning on firmware API failures (Alan)
> 
> Thanks,
> Rodrigo.
> 
> The following changes since commit 46f28427f6f824b6cff06fa025a55350b7de454a:
> 
>   Merge tag 'drm-rcar-next-20230325' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into drm-next (2023-03-27 18:20:20 +0200)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-04-06
> 
> for you to fetch changes up to b358793c3bf231c455c55e0173256a86483997a8:
> 
>   drm/i915/wakeref: fix kernel-doc comment (2023-04-06 15:39:26 +0300)

Pulled, thanks

> 
> ----------------------------------------------------------------
> - Fix DPT+shmem combo and add i915.enable_dpt modparam (Ville)
> - i915.enable_sagv module parameter (Ville)
> - Correction to QGV related register addresses (Vinod)
> - IPS debugfs per-crtc and new file for false_color (Ville)
> - More clean-up and reorganization of Display code (Jani)
> - DP DSC related fixes and improvements (Stanislav, Ankit, Suraj, Swati)
> - Make utility pin asserts more accurate (Ville)
> - Meteor Lake enabling (Daniele)
> - High refresh rate PSR fixes (Jouni)
> - Cursor and Plane chicken register fixes (Ville)
> - Align the ADL-P TypeC sequences with hardware specification (Imre)
> - Documentation build fixes and improvements to catch bugs earlier (Lee, Jani)
> - PL1 power limit hwmon entry changed to use 0 as disabled state (Ashutosh)
> - DP aux sync fix and improvements (Ville)
> - DP MST fixes and w/a (Stanislav)
> - Limit PXP drm-errors or warning on firmware API failures (Alan)
> 
> ----------------------------------------------------------------
> Alan Previn (1):
>       drm/i915/pxp: limit drm-errors or warning on firmware API failures
> 
> Ankit Nautiyal (2):
>       drm/dp_helper: Add helper to check DSC support with given o/p format
>       drm/i915/dp: Check if DSC supports the given output_format
> 
> Ashutosh Dixit (1):
>       drm/i915/hwmon: Use 0 to designate disabled PL1 power limit
> 
> Daniele Ceraolo Spurio (1):
>       drm/i915/mtl: Fix MTL stolen memory GGTT mapping
> 
> Imre Deak (29):
>       drm/i915/tc: Group the TC PHY setup/query functions per platform
>       drm/i915/tc: Use the adlp prefix for ADLP TC PHY functions
>       drm/i915/tc: Rename tc_phy_status_complete() to tc_phy_is_ready()
>       drm/i915/tc: Use the tc_phy prefix for all TC PHY functions
>       drm/i915/tc: Move TC port fields to a new intel_tc_port struct
>       drm/i915/tc: Check for TC PHY explicitly in intel_tc_port_fia_max_lane_count()
>       drm/i915/tc: Move the intel_tc_port struct declaration to intel_tc.c
>       drm/i915/tc: Add TC PHY hook to get the PHY HPD live status
>       drm/i915/tc: Add TC PHY hooks to get the PHY ready/owned state
>       drm/i915/tc: Add TC PHY hook to read out the PHY HW state
>       drm/i915/tc: Add generic TC PHY connect/disconnect handlers
>       drm/i915/tc: Factor out tc_phy_verify_legacy_or_dp_alt_mode()
>       drm/i915/tc: Add TC PHY hooks to connect/disconnect the PHY
>       drm/i915/tc: Fix up the legacy VBT flag only in disconnected mode
>       drm/i915/tc: Check TC mode instead of the VBT legacy flag
>       drm/i915/tc: Block/unblock TC-cold in the PHY connect/disconnect hooks
>       drm/i915/tc: Remove redundant wakeref=0 check from unblock_tc_cold()
>       drm/i915/tc: Drop tc_cold_block()/unblock()'s power domain parameter
>       drm/i915/tc: Add TC PHY hook to get the TC-cold blocking power domain
>       drm/i915/tc: Add asserts in TC PHY hooks that the required power is on
>       drm/i915/tc: Add TC PHY hook to init the PHY
>       drm/i915/adlp/tc: Use the DE HPD ISR register for hotplug detection
>       drm/i915/tc: Get power ref for reading the HPD live status register
>       drm/i915/tc: Don't connect the PHY in intel_tc_port_connected()
>       drm/i915/adlp/tc: Align the connect/disconnect PHY sequence with bspec
>       drm/i915: Move shared DPLL disabling into CRTC disable hook
>       drm/i915: Disable DPLLs before disconnecting the TC PHY
>       drm/i915: Remove TC PHY disconnect workaround
>       drm/i915: Remove the encoder update_prepare()/complete() hooks
> 
> Jani Nikula (14):
>       drm/i915: remove unused config DRM_I915_UNSTABLE
>       drm/i915/pps: split out PPS regs to a separate file
>       drm/i915/tv: split out TV regs to a separate file
>       drm/i915/aux: split out DP AUX regs to a separate file
>       drm/i915/fdi: split out FDI regs to a separate file
>       drm/i915/dsb: split out DSB regs to a separate file
>       drm/i915/wm: split out SKL+ watermark regs to a separate file
>       drm/i915/psr: split out PSR regs to a separate file
>       drm/i915: enable kernel-doc warnings for CONFIG_DRM_I915_WERROR=y
>       drm/i915: run kernel-doc on headers as part of HDRTEST
>       drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
>       drm/i915/clock: mass rename dev_priv to i915
>       drm/i915/tc: demote a kernel-doc comment to a regular comment
>       drm/i915/wakeref: fix kernel-doc comment
> 
> Jouni Högander (6):
>       drm/i915/psr: Unify pre/post hooks
>       drm/i915/psr: Modify/Fix Wa_16013835468 and prepare for Wa_14015648006
>       drm/i915/psr: Implement Wa_14015648006
>       drm/i915/psr: Add helpers for block count number handling
>       drm/i915/psr: Check that vblank is long enough for psr2
>       drm/i915/psr: Implement Display WA #1136
> 
> Lee Jones (3):
>       drm/i915/display/intel_display_debugfs: Fix incorrect param naming for 'intel_connector'
>       drm/i915/display/intel_display_power: Fix incorrectly documented function __intel_display_power_put_async()
>       drm/i915/display/intel_wm: Fix a little doc-rot in intel_update_watermarks()
> 
> Rodrigo Vivi (1):
>       Merge drm/drm-next into drm-intel-next
> 
> Stanislav Lisovskiy (2):
>       drm/i915: Use compressed bpp when calculating m/n value for DP MST DSC
>       drm/i915: Implement UHBR bandwidth check
> 
> Suraj Kandpal (4):
>       drm/i915/dsc: Adding the new registers for DSC
>       drm/i915/dsc: Enable YCbCr420 for VDSC
>       drm/i915/dsc: Fill in native_420 field
>       drm/i915/vdsc: Check slice design requirement
> 
> Swati Sharma (1):
>       drm/i915/dsc: Add debugfs entry to validate DSC output formats
> 
> Ville Syrjälä (15):
>       drm/i915/dpt: Treat the DPT BO as a framebuffer
>       drm/i915/dpt: Only do the POT stride remap when using DPT
>       drm/i915/dpt: Introduce HAS_DPT()
>       drm/i915: Add PLANE_CHICKEN registers
>       drm/i915/dpt: Add a modparam to disable DPT via the chicken bit
>       drm/i915: Move PLANE_BUG_CFG bit definitions to the correct place
>       drm/i915: Add i915.enable_sagv modparam
>       drm/i915/ips: Make IPS debugfs per-crtc
>       drm/i915/ips: Add i915_ips_false_color debugfs file
>       drm/i915: Make utility pin asserts more accurate
>       drm/i915: Skip cursor when writing PLANE_CHICKEN
>       drm/i915: Document that PLANE_CHICKEN are for tgl+
>       drm/i915: Define cursor chicken reg
>       drm/i915: Fix fast wake AUX sync len
>       drm/i915: Explain the magic numbers for AUX SYNC/precharge length
> 
> Vinod Govindapillai (2):
>       drm/i915/reg: fix QGV points register access offsets
>       drm/i915/reg: use the correct register to access SAGV block time
> 
>  .../ABI/testing/sysfs-driver-intel-i915-hwmon      |    4 +-
>  drivers/gpu/drm/i915/Kconfig                       |    6 -
>  drivers/gpu/drm/i915/Kconfig.unstable              |   21 -
>  drivers/gpu/drm/i915/Makefile                      |   12 +-
>  drivers/gpu/drm/i915/display/hsw_ips.c             |   73 +-
>  drivers/gpu/drm/i915/display/hsw_ips.h             |    3 +-
>  drivers/gpu/drm/i915/display/icl_dsi.c             |    2 -
>  drivers/gpu/drm/i915/display/intel_crt.c           |    1 +
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c   |    4 +-
>  .../gpu/drm/i915/display/intel_crtc_state_dump.h   |    2 +
>  drivers/gpu/drm/i915/display/intel_ddi.c           |   71 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |   95 +-
>  drivers/gpu/drm/i915/display/intel_display.h       |    7 -
>  drivers/gpu/drm/i915/display/intel_display_core.h  |    4 +
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |   83 +-
>  drivers/gpu/drm/i915/display/intel_display_power.c |   10 +-
>  .../drm/i915/display/intel_display_power_well.c    |    7 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |   21 +-
>  drivers/gpu/drm/i915/display/intel_dp.c            |   48 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        |   33 +-
>  drivers/gpu/drm/i915/display/intel_dp_aux_regs.h   |   84 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c        |   50 +-
>  drivers/gpu/drm/i915/display/intel_dpt.c           |   27 +
>  drivers/gpu/drm/i915/display/intel_dpt.h           |    2 +
>  drivers/gpu/drm/i915/display/intel_dsb.c           |    1 +
>  drivers/gpu/drm/i915/display/intel_dsb_regs.h      |   67 ++
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c       |    1 +
>  drivers/gpu/drm/i915/display/intel_fb.c            |   11 +-
>  drivers/gpu/drm/i915/display/intel_fb.h            |    1 +
>  drivers/gpu/drm/i915/display/intel_fdi.c           |    1 +
>  drivers/gpu/drm/i915/display/intel_fdi_regs.h      |  151 +++
>  drivers/gpu/drm/i915/display/intel_lvds.c          |    1 +
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c |    1 -
>  drivers/gpu/drm/i915/display/intel_pch_display.c   |    1 +
>  drivers/gpu/drm/i915/display/intel_pps.c           |    1 +
>  drivers/gpu/drm/i915/display/intel_pps_regs.h      |   78 ++
>  drivers/gpu/drm/i915/display/intel_psr.c           |   91 +-
>  drivers/gpu/drm/i915/display/intel_psr_regs.h      |  260 ++++
>  drivers/gpu/drm/i915/display/intel_qp_tables.c     |  187 ++-
>  drivers/gpu/drm/i915/display/intel_qp_tables.h     |    4 +-
>  drivers/gpu/drm/i915/display/intel_tc.c            | 1253 +++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_tc.h            |    4 +-
>  drivers/gpu/drm/i915/display/intel_tv.c            |    3 +-
>  drivers/gpu/drm/i915/display/intel_tv_regs.h       |  490 ++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.c          |  132 ++-
>  drivers/gpu/drm/i915/display/intel_vdsc_regs.h     |   28 +
>  drivers/gpu/drm/i915/display/intel_wm.c            |    2 +-
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |    6 +
>  drivers/gpu/drm/i915/display/skl_watermark.c       |   11 +-
>  drivers/gpu/drm/i915/display/skl_watermark_regs.h  |  160 +++
>  drivers/gpu/drm/i915/gem/i915_gem_object.h         |    2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h   |    3 +
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   15 +-
>  drivers/gpu/drm/i915/gvt/edid.c                    |    1 +
>  drivers/gpu/drm/i915/gvt/handlers.c                |    5 +
>  drivers/gpu/drm/i915/i915_driver.c                 |    8 +-
>  drivers/gpu/drm/i915/i915_drv.h                    |    2 +
>  drivers/gpu/drm/i915/i915_gem.c                    |    8 +-
>  drivers/gpu/drm/i915/i915_hwmon.c                  |   26 +
>  drivers/gpu/drm/i915/i915_irq.c                    |    2 +
>  drivers/gpu/drm/i915/i915_params.c                 |    6 +
>  drivers/gpu/drm/i915/i915_params.h                 |    2 +
>  drivers/gpu/drm/i915/i915_pci.c                    |    3 -
>  drivers/gpu/drm/i915/i915_reg.h                    | 1243 +------------------
>  drivers/gpu/drm/i915/intel_clock_gating.c          |  888 ++++++++++++++
>  drivers/gpu/drm/i915/intel_clock_gating.h          |   14 +
>  drivers/gpu/drm/i915/intel_device_info.h           |    1 -
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |    4 +
>  drivers/gpu/drm/i915/intel_pm.c                    |  885 --------------
>  drivers/gpu/drm/i915/intel_pm.h                    |   18 -
>  drivers/gpu/drm/i915/intel_wakeref.h               |    2 +-
>  .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h |    3 +
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c       |    2 +-
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c           |   77 +-
>  drivers/gpu/drm/i915/vlv_suspend.c                 |    4 +-
>  include/drm/display/drm_dp_helper.h                |   13 +
>  76 files changed, 3965 insertions(+), 2888 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/Kconfig.unstable
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_aux_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dsb_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fdi_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_pps_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_psr_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_tv_regs.h
>  create mode 100644 drivers/gpu/drm/i915/display/skl_watermark_regs.h
>  create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.c
>  create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
>  delete mode 100644 drivers/gpu/drm/i915/intel_pm.c
>  delete mode 100644 drivers/gpu/drm/i915/intel_pm.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
