Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3ACA485CD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 17:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BAC10EB29;
	Thu, 27 Feb 2025 16:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR+BMNmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EC310EB29
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740675286; x=1772211286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wmPZL0hTajLmHouhNoG+H8g4d9k2lliIa/FDsUAPuXM=;
 b=fR+BMNmAYIzkn1JDa9x0MkXGSGPjrQh2DojUua44lvIboDFqUlUS0fb0
 OhsWwiI7/wEFmQVjgXO4c5kVDuQhpYVKrLWBQY4kwSWKpNM1gS7GaL/Hr
 jtdG5pO+aAfAoR2aMbrISKsUjMWaipO/9CeVgdbRVKq9COVt57wwbDNSn
 ZAxSSLgFm0JJqgorM2KPMsNJUAdKs8u64J56JCR+Ld1v+sxMi0bInsn/6
 CeJAuXTlU+hf64AWtnGCI9kpzSRgkDQ2EjxPmRNqRrqDsxWkc6DR3Xs2E
 V3wWqH087rp5qfvOvyICWwvQwJukNI51aaoeRBHZNV9n2ck8g8EJI3rvA g==;
X-CSE-ConnectionGUID: aHpP8zaXROa0/6CUtyznKQ==
X-CSE-MsgGUID: +OfUdWfVQQSXwJ2gigdf4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41495721"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41495721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 08:54:46 -0800
X-CSE-ConnectionGUID: ZDe6c26fRMyo6x8RxzXcLQ==
X-CSE-MsgGUID: cBPTHcmiQ0mGjDKfAROMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117580453"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2025 08:54:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnh9j-000Djc-3D;
 Thu, 27 Feb 2025 16:54:39 +0000
Date: Fri, 28 Feb 2025 00:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <202502280028.1Y9QMcR0-lkp@intel.com>
References: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
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

Hi Aditya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Garg/drm-format-helper-Add-conversion-from-XRGB8888-to-BGR888/20250224-214352
base:   linus/master
patch link:    https://lore.kernel.org/r/844C1D39-4891-4DC2-8458-F46FA1B59FA0%40live.com
patch subject: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
config: alpha-kismet-CONFIG_HID_MULTITOUCH-CONFIG_DRM_APPLETBDRM-0-0 (https://download.01.org/0day-ci/archive/20250228/202502280028.1Y9QMcR0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280028.1Y9QMcR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280028.1Y9QMcR0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HID_MULTITOUCH when selected by DRM_APPLETBDRM
   WARNING: unmet direct dependencies detected for HID_MULTITOUCH
     Depends on [n]: HID_SUPPORT [=n] && HID [=n]
     Selected by [y]:
     - DRM_APPLETBDRM [=y] && HAS_IOMEM [=y] && DRM [=y] && USB [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
