Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C533D3A267
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7853810E3C5;
	Mon, 19 Jan 2026 09:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a11ioWA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EB010E3C5;
 Mon, 19 Jan 2026 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768813586; x=1800349586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZNyPe/ryLA7w5APbE/3RPh/xhpJgGNVGdIHZlFS67Q0=;
 b=a11ioWA++nQYgkNteowwYbDG3IDRfS3m161ZR7wlWdPccY77WWoy387c
 aayqIQJ4WhQ5lT0KcGsgu9T1Jdz7Ey6+2EcBKIp+cragSusUhbuQeDEUq
 UNq9PkFRiwdB7nxlQsjY9fXSElyd6nwcf1SPNuSxVeUM3jsTDPilTJse9
 f+c5c5q/vJrjIjVdZ4hFwdzXdupN89tCQ1fXQCuDde/AOStIYlPxEi6uy
 BflGxy8s9UDl4nDU2dQ7RqtR4UhYRvQE0Cq+UOgCADeg/7OnWQ+HSDwZ2
 7GjDd1oJwIzubvZrbPKRHqcj6AblsLzPEcLU7vg8nbLZwcy9CLjb9dZd/ Q==;
X-CSE-ConnectionGUID: xMAgtKTcSZOm4UncRBBjSQ==
X-CSE-MsgGUID: U0ZqN+YNQh6NX+8s4UltuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80742954"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="80742954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:06:25 -0800
X-CSE-ConnectionGUID: 7VCcJ9XIQWOsyQxFkaW/BA==
X-CSE-MsgGUID: 1zmXuXqjTq+f+OjTTRJsQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205075349"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 19 Jan 2026 01:06:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vhlDG-00000000NdB-0DEq;
 Mon, 19 Jan 2026 09:06:18 +0000
Date: Mon, 19 Jan 2026 17:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Riana Tauro <riana.tauro@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe/xe_hw_error: Add support for GT hardware
 errors
Message-ID: <202601191630.EAGtgUQy-lkp@intel.com>
References: <20260119040023.2821518-9-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119040023.2821518-9-riana.tauro@intel.com>
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

Hi Riana,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm/drm-next next-20260116]
[cannot apply to drm-misc/drm-misc-next linus/master v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-ras-Introduce-the-DRM-RAS-infrastructure-over-generic-netlink/20260119-113326
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260119040023.2821518-9-riana.tauro%40intel.com
patch subject: [PATCH v4 3/4] drm/xe/xe_hw_error: Add support for GT hardware errors
config: alpha-randconfig-r072-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191630.EAGtgUQy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191630.EAGtgUQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191630.EAGtgUQy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_hw_error.c: In function 'gt_hw_error_handler':
>> drivers/gpu/drm/xe/xe_hw_error.c:168:4: error: a label can only be part of a statement and a declaration is not a statement
       u32 errbit;
       ^~~


vim +168 drivers/gpu/drm/xe/xe_hw_error.c

   134	
   135	static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
   136					u32 error_id)
   137	{
   138		const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
   139		struct xe_device *xe = tile_to_xe(tile);
   140		struct xe_drm_ras *ras = &xe->ras;
   141		struct xe_drm_ras_counter *info = ras->info[severity];
   142		struct xe_mmio *mmio = &tile->mmio;
   143		unsigned long err_stat = 0;
   144		int i, len;
   145	
   146		if (xe->info.platform != XE_PVC)
   147			return;
   148	
   149		if (hw_err == HARDWARE_ERROR_NONFATAL) {
   150			atomic64_inc(&info[error_id].counter);
   151			log_hw_error(tile, info[error_id].name, severity);
   152			return;
   153		}
   154	
   155		len = (hw_err == HARDWARE_ERROR_CORRECTABLE) ? ERR_STAT_GT_COR_VECTOR_LEN
   156							     : ERR_STAT_GT_VECTOR_MAX;
   157	
   158		for (i = 0; i < len; i++) {
   159			u32 vector, val;
   160	
   161			vector = xe_mmio_read32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i));
   162			if (!vector)
   163				continue;
   164	
   165			switch (i) {
   166			case ERR_STAT_GT_VECTOR0:
   167			case ERR_STAT_GT_VECTOR1:
 > 168				u32 errbit;
   169	
   170				val = hweight32(vector);
   171				atomic64_add(val, &info[error_id].counter);
   172				log_gt_err(tile, "Subslice", i, vector, severity);
   173	
   174				/* Read Error Status Register once */
   175				if (err_stat)
   176					break;
   177	
   178				err_stat = xe_mmio_read32(mmio, ERR_STAT_GT_REG(hw_err));
   179				for_each_set_bit(errbit, &err_stat, GT_HW_ERROR_MAX_ERR_BITS) {
   180					if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
   181					    (BIT(errbit) & PVC_COR_ERR_MASK))
   182						atomic64_inc(&info[error_id].counter);
   183					if (hw_err == HARDWARE_ERROR_FATAL &&
   184					    (BIT(errbit) & PVC_FAT_ERR_MASK))
   185						atomic64_inc(&info[error_id].counter);
   186				}
   187				if (err_stat)
   188					xe_mmio_write32(mmio, ERR_STAT_GT_REG(hw_err), err_stat);
   189				break;
   190			case ERR_STAT_GT_VECTOR2:
   191			case ERR_STAT_GT_VECTOR3:
   192				val = hweight32(vector);
   193				atomic64_add(val, &info[error_id].counter);
   194				log_gt_err(tile, "L3 BANK", i, vector, severity);
   195				break;
   196			case ERR_STAT_GT_VECTOR6:
   197				val = hweight32(vector);
   198				atomic64_add(val, &info[error_id].counter);
   199				log_gt_err(tile, "TLB", i, vector, severity);
   200				break;
   201			case ERR_STAT_GT_VECTOR7:
   202				val = hweight32(vector);
   203				atomic64_add(val, &info[error_id].counter);
   204				break;
   205			default:
   206				log_gt_err(tile, "Undefined", i, vector, severity);
   207			}
   208	
   209			xe_mmio_write32(mmio, ERR_STAT_GT_VECTOR_REG(hw_err, i), vector);
   210		}
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
