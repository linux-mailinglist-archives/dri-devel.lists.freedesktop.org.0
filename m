Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OhVhDScblWlHLQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 02:51:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE215296F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 02:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A31510E165;
	Wed, 18 Feb 2026 01:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQYtk6Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6DD10E165;
 Wed, 18 Feb 2026 01:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771379489; x=1802915489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/lmZ/ulHJ+ovnjKc5hDkXmsLa12VxcNUlYZ9aUPBiK4=;
 b=VQYtk6Yyj9kBuXa5gcVrris/T3GyEgQhXX9gif63Vy4dE13J3WeCOyGZ
 iB+9dX8IvVJySk4JhhgcAgZNr2bBQIwum4pGhyzl/4UJoThs2J8k+SMVz
 Fy2H55BWdcbgtbBZdPV4FfKGrnJxCU0Cn6iiKm0vqNRBOmEGDM2J81I36
 tqec16vWImKPJN/iP7DbhiiFl2zCuKMkxTgtidnErw7uH+IlPLON9Cn2k
 sYwT3t7lx9eSPS/PJxKEVp6t8vh45n1ac3EUYLnxfMIGGQQ0umEnM48Un
 uJF6Ko6Ru0yNYSEqLf68BWORG/Bti/Aox0ZkQF5MMmdeH5pPtRp2KCdYg Q==;
X-CSE-ConnectionGUID: WzPqLJidTwmSlvFGLW5d6w==
X-CSE-MsgGUID: FsSAD8RhQnucrB7mXMRT0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="82787013"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="82787013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 17:51:29 -0800
X-CSE-ConnectionGUID: KXT5r+2iSHSZp4stvXNWLw==
X-CSE-MsgGUID: PLvuKyRqREe7wsoQndAXdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="214166461"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 17 Feb 2026 17:51:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vsWir-000000011vU-0hkl;
 Wed, 18 Feb 2026 01:51:25 +0000
Date: Wed, 18 Feb 2026 09:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>, linux-pci@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Simon Richter <Simon.Richter@hogyros.de>
Subject: Re: [PATCH 3/5] vgaarb: mark vga_get family as __must_check
Message-ID: <202602180912.N7IZbIal-lkp@intel.com>
References: <20260217170419.236739-4-Simon.Richter@hogyros.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217170419.236739-4-Simon.Richter@hogyros.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 1ACE215296F
X-Rspamd-Action: no action

Hi Simon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9702969978695d9a699a1f34771580cdbb153b33]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Richter/vgaarb-pass-vga_get-errors-to-userspace/20260218-010647
base:   9702969978695d9a699a1f34771580cdbb153b33
patch link:    https://lore.kernel.org/r/20260217170419.236739-4-Simon.Richter%40hogyros.de
patch subject: [PATCH 3/5] vgaarb: mark vga_get family as __must_check
config: powerpc-randconfig-002-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180912.N7IZbIal-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180912.N7IZbIal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180912.N7IZbIal-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_vga.c: In function 'intel_vga_disable':
>> drivers/gpu/drm/i915/display/intel_vga.c:68:2: warning: ignoring return value of 'vga_get_uninterruptible', declared with attribute warn_unused_result [-Wunused-result]
     vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_vga.c: In function 'intel_vga_reset_io_mem':
   drivers/gpu/drm/i915/display/intel_vga.c:93:2: warning: ignoring return value of 'vga_get_uninterruptible', declared with attribute warn_unused_result [-Wunused-result]
     vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vga_get_uninterruptible +68 drivers/gpu/drm/i915/display/intel_vga.c

0c80d60ae63461 Ville Syrjälä 2025-04-17  43  
4fb8783165b7c6 Jani Nikula   2019-10-01  44  /* Disable the VGA plane that we never use */
4b6e05c43b7542 Ville Syrjälä 2024-09-06  45  void intel_vga_disable(struct intel_display *display)
4fb8783165b7c6 Jani Nikula   2019-10-01  46  {
4b6e05c43b7542 Ville Syrjälä 2024-09-06  47  	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
4b6e05c43b7542 Ville Syrjälä 2024-09-06  48  	i915_reg_t vga_reg = intel_vga_cntrl_reg(display);
0c80d60ae63461 Ville Syrjälä 2025-04-17  49  	enum pipe pipe;
0c80d60ae63461 Ville Syrjälä 2025-04-17  50  	u32 tmp;
4fb8783165b7c6 Jani Nikula   2019-10-01  51  	u8 sr1;
4fb8783165b7c6 Jani Nikula   2019-10-01  52  
0c80d60ae63461 Ville Syrjälä 2025-04-17  53  	tmp = intel_de_read(display, vga_reg);
0c80d60ae63461 Ville Syrjälä 2025-04-17  54  	if (tmp & VGA_DISP_DISABLE)
a3af0140663dc3 Emil Velikov  2021-06-04  55  		return;
a3af0140663dc3 Emil Velikov  2021-06-04  56  
0c80d60ae63461 Ville Syrjälä 2025-04-17  57  	if (display->platform.cherryview)
0c80d60ae63461 Ville Syrjälä 2025-04-17  58  		pipe = REG_FIELD_GET(VGA_PIPE_SEL_MASK_CHV, tmp);
0c80d60ae63461 Ville Syrjälä 2025-04-17  59  	else if (has_vga_pipe_sel(display))
0c80d60ae63461 Ville Syrjälä 2025-04-17  60  		pipe = REG_FIELD_GET(VGA_PIPE_SEL_MASK, tmp);
0c80d60ae63461 Ville Syrjälä 2025-04-17  61  	else
0c80d60ae63461 Ville Syrjälä 2025-04-17  62  		pipe = PIPE_A;
0c80d60ae63461 Ville Syrjälä 2025-04-17  63  
0c80d60ae63461 Ville Syrjälä 2025-04-17  64  	drm_dbg_kms(display->drm, "Disabling VGA plane on pipe %c\n",
0c80d60ae63461 Ville Syrjälä 2025-04-17  65  		    pipe_name(pipe));
0c80d60ae63461 Ville Syrjälä 2025-04-17  66  
4fb8783165b7c6 Jani Nikula   2019-10-01  67  	/* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
4fb8783165b7c6 Jani Nikula   2019-10-01 @68  	vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
f0bb41fad02e03 Jani Nikula   2022-02-02  69  	outb(0x01, VGA_SEQ_I);
f0bb41fad02e03 Jani Nikula   2022-02-02  70  	sr1 = inb(VGA_SEQ_D);
f0bb41fad02e03 Jani Nikula   2022-02-02  71  	outb(sr1 | VGA_SR01_SCREEN_OFF, VGA_SEQ_D);
4fb8783165b7c6 Jani Nikula   2019-10-01  72  	vga_put(pdev, VGA_RSRC_LEGACY_IO);
4fb8783165b7c6 Jani Nikula   2019-10-01  73  	udelay(300);
4fb8783165b7c6 Jani Nikula   2019-10-01  74  
4b6e05c43b7542 Ville Syrjälä 2024-09-06  75  	intel_de_write(display, vga_reg, VGA_DISP_DISABLE);
4b6e05c43b7542 Ville Syrjälä 2024-09-06  76  	intel_de_posting_read(display, vga_reg);
4fb8783165b7c6 Jani Nikula   2019-10-01  77  }
4fb8783165b7c6 Jani Nikula   2019-10-01  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
