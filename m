Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47800989233
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 02:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1398B10E1A0;
	Sun, 29 Sep 2024 00:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyzTwTTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097F710E1A0
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 00:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727571430; x=1759107430;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NiLVv74q1BE9keWXYGZl2tbxpA/ZRjXFnF8/A2XkZTI=;
 b=IyzTwTTPOZULmB18dA0ukleP2H9M9H9fMh6eWwxRLV9wF/BOosXr1SLl
 xxobyB/Y5XwGcCD7Z8VP00TVN9cOcVMb9C9Tgnkx7FuZfflYjtBFAAm/d
 CHP4I7VrjuZZwrU9KYxbMEleE1hNtJJ71GyDWtpV0oSh2JtUrm/au5gm3
 TcUY15sAdHI5Uy/vJsRp9yyChhz7OmkjBje3Re378CYfhRWhuDMH0gXF3
 hgwZE9DMcx70tU8ZqMpI9FmzdtDo0HiDpRsZJWPA//nZn5juu2o4mJicp
 jf3pyFkeJlw0Pf8VV9D7PgA4cJDF367CKO5MJgsW5Hir24i4vTKo4TAYC w==;
X-CSE-ConnectionGUID: 856q3mnzSYGtCy0/Pjz8DQ==
X-CSE-MsgGUID: r4PlT4tCQoqGU0dg4ZX03A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38044600"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="38044600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 17:57:09 -0700
X-CSE-ConnectionGUID: /wU22n8jQGS3lz6zq1CGAA==
X-CSE-MsgGUID: p+KE2/Q7Sle4Xk2MbDO4IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; d="scan'208";a="73068033"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2024 17:57:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1suiFD-000Nmr-17;
 Sun, 29 Sep 2024 00:57:03 +0000
Date: Sun, 29 Sep 2024 08:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <202409290814.OGfHXRw7-lkp@intel.com>
References: <20240927124152.139099-2-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927124152.139099-2-wse@tuxedocomputers.com>
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

Hi Werner,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-tuxedo-Add-virtual-LampArray-for-TUXEDO/20240927-214157
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240927124152.139099-2-wse%40tuxedocomputers.com
patch subject: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
config: x86_64-randconfig-161-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290814.OGfHXRw7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290814.OGfHXRw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290814.OGfHXRw7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: wmidev_evaluate_method
   >>> referenced by tuxedo_nb04_wmi_util.c:26 (drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c:26)
   >>>               vmlinux.o:(__wmi_method_buffer_out)
--
>> ld.lld: error: undefined symbol: __wmi_driver_register
   >>> referenced by tuxedo_nb04_wmi_ab_init.c:86 (drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c:86)
   >>>               vmlinux.o:(tuxedo_nb04_wmi_ab_driver_init)
--
>> ld.lld: error: undefined symbol: wmi_driver_unregister
   >>> referenced by tuxedo_nb04_wmi_ab_init.c:86 (drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c:86)
   >>>               vmlinux.o:(tuxedo_nb04_wmi_ab_driver_exit)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
