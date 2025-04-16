Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560B6A8B707
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 12:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336DB10E8C4;
	Wed, 16 Apr 2025 10:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5dkR8Ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2883010E8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744800167; x=1776336167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x1lH8oqBgVGQYWa5D2CjIrYJC5tQeyL3FgkI0tDXeuQ=;
 b=W5dkR8OkBc4OlnT2uMlBMysiS1Qq+bQ1uWr1BLfMU1rmNIJ4aI2cLp3X
 hRrHSg9O6V9V8g9WyUznWUBNOrbegJjCW5S2yJN+bWknK5RXMYXsPGZoi
 kmiUtspPmBZqo/so52Dsp6HO4ecsvOo4wsq7SMTp8eM8mpWV4A2GJRg/3
 Ugx7pG0k8vd9WAgLeByOhT5eTBdjfU8uYILq2PRdtwFlIDoLaLe6wZI1E
 FzaJinPbUrzp82Qp3CC7OJFwJGPe7VvaRzPOZtqs2MF66zdPlywokboEK
 6ImC/AwaMjYcjSGEWnUNyH70kOCNsmBPMFCRgCLjoJHXgvJsEGl+syS+J w==;
X-CSE-ConnectionGUID: j2MYbxbwQzyc0zheVEtg2Q==
X-CSE-MsgGUID: wrpLsxV+QfCpJDILV7jATQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56976598"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="56976598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:42:45 -0700
X-CSE-ConnectionGUID: z9dLZdJJST2jc1KhAcS7uA==
X-CSE-MsgGUID: s295PVukTPyNQXGcU5Y76w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130949202"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 16 Apr 2025 03:42:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u50E1-000JXy-15;
 Wed, 16 Apr 2025 10:42:37 +0000
Date: Wed, 16 Apr 2025 18:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Nipun Gupta <nipun.gupta@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
 conor+dt@kernel.org, ogabbay@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de
Cc: oe-kbuild-all@lists.linux.dev, praveen.jain@amd.com,
 harpreet.anand@amd.com, nikhil.agarwal@amd.com,
 srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com,
 Nipun Gupta <nipun.gupta@amd.com>
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <202504161842.xI2wcOdf-lkp@intel.com>
References: <20250409173033.2261755-2-nipun.gupta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409173033.2261755-2-nipun.gupta@amd.com>
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

Hi Nipun,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on staging/staging-testing staging/staging-next staging/staging-linus linus/master drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc2 next-20250416]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nipun-Gupta/accel-amdpk-add-driver-for-AMD-PKI-accelerator/20250410-013224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250409173033.2261755-2-nipun.gupta%40amd.com
patch subject: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
config: x86_64-randconfig-003-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161842.xI2wcOdf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161842.xI2wcOdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161842.xI2wcOdf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/drm/amdpk.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/amdpk.h] Error 1 shuffle=3983912090
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1375: headers] Error 2 shuffle=3983912090
   scripts/kernel-doc: 1: kernel-doc.py: not found
   make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 127 shuffle=3983912090
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1276: prepare0] Error 2 shuffle=3983912090
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3983912090
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3983912090
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
