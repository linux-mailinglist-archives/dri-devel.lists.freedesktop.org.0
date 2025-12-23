Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4127CD8D39
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 11:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BC710E1AD;
	Tue, 23 Dec 2025 10:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jx1N2Dlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99EC10E1AD;
 Tue, 23 Dec 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766486138; x=1798022138;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=m0WskXWQpePLutk15uwE8f1MNTZ0bzp8OVq+Ooov+LM=;
 b=Jx1N2DlzV17fNvru2KcSgweh7L5gx/c/nJQyNKzMTt1Dcqo8WaCV9rr/
 aJ/ygtJLzoJ5f9ZzZKPMK6i1tl2Oq1YFMvU3YsH5SIc73WIp8KE0Q10Ma
 +ZNCgREzhb3TlrSwk+p9u7+AF7HMNHIf7lqtoA4w8Mo9YsfIp5x96tvHG
 nZxvRwLekY5hhdTN4xISGIFT/1TLe70TI4L0pyDzmwTsCgXyQlMHHNxxS
 unt2UmH7AzcCWksIdRhc+otZPZ5K4znaEn6KB9FwHBRUE4EWbx230hIva
 nkt6Y7QvsczHYNKQcHj/C6rG+EPTP5s+c3FzcJjoFcYQ5nPoLNAGcV5AS g==;
X-CSE-ConnectionGUID: OSEkpoHMQh2uCT9+HBRjIA==
X-CSE-MsgGUID: 6sLijX9ASEevAL1JPONK4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68376377"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="68376377"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 02:35:37 -0800
X-CSE-ConnectionGUID: CTlnXJcIQji5gBmaore9EQ==
X-CSE-MsgGUID: MMoKpnP4QVqdZKcGLnZD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="200658795"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 02:35:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, kernel test robot
 <lkp@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/configfs: Fix 'undefined reference to
 xe_configfs_...' errors
In-Reply-To: <20251222175006.9706-3-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251222175006.9706-1-michal.wajdeczko@intel.com>
 <20251222175006.9706-3-michal.wajdeczko@intel.com>
Date: Tue, 23 Dec 2025 12:35:31 +0200
Message-ID: <e22a535a6405412aaeb0f2251733840b72c93b56@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 22 Dec 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On configs where Xe is built-in (DRM_XE=y) but configfs is defined
> as a module (CONFIGFS=m), we were not enabling our configfs stubs,
> which might lead to the following build errors:
>
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
>    xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
>    xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
>    xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
>    xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
>    xe_lrc.c:(.text+0x32fc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
>    xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
>    xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
>    xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
>    xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
>    xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
>    powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
>    xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'
>
> Fix that by using IS_REACHABLE check instead of IS_ENABLED when
> deciding whether to stub variant or not.

Please avoid IS_REACHABLE() like the plague. It allows build but is
unlikely to result in a configuration or end result that anyone
wants. It also results in bug reports that are tedious to figure
out. The problem should be solved at kconfig time.

Again, the solution is

	depends on CONFIGFS_FS || !CONFIGFS_FS


BR,
Jani.


> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 9998ec7c9956..ab75485b08b6 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -12,7 +12,7 @@
>  
>  struct pci_dev;
>  
> -#if IS_ENABLED(CONFIG_CONFIGFS_FS)
> +#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
>  int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);

-- 
Jani Nikula, Intel
