Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5BDA48278
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C118210EB1F;
	Thu, 27 Feb 2025 15:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYqTzljC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC710EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740668931; x=1772204931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VTYx76++dzcn8BzXVhqS4x1bVjLz23b5NeDAfO0U3KQ=;
 b=eYqTzljCupWijmM7Vrs/1fpuZ2o85ibL3uyNG8+amYZWfOyYXer+nsoy
 anRLkOpO+iQ3t8de8w05IygDjY+B5lmsrIXYFiXgTyxCIeS6xEwDkMES0
 5ww0+4sXh9qKbiOolYlw7KQeucozWOKXzphtetQpVDSlEL8JoZtN9dS0a
 VVeNd70hsQ7dE3xs0G2yxQ0Fg4V/GAhPqpmh0+XxjUKGHnEJ4Ow9IOL8J
 Z3J2Fd6bhDi/dFChn4nsAV+dThDgB4qmhJXlUnYwPoSBH98rl298ewpDb
 33ZmFeQRcnOPHwbWzyecCHS8LRMYbZjDs00KeiavPLEtcrgU/g/PQIRzG g==;
X-CSE-ConnectionGUID: 6OAgDEdTSzulZoLJr5ORDQ==
X-CSE-MsgGUID: JaejAj8DTbCnJQ43+cQoRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40739979"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="40739979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:08:50 -0800
X-CSE-ConnectionGUID: lzSmMiRCQsSr1Xkh9GBnZg==
X-CSE-MsgGUID: 4C9V2n+WRe6ipXkVa7j12g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="116823280"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 07:08:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tnfV5-000DXa-0O;
 Thu, 27 Feb 2025 15:08:36 +0000
Date: Thu, 27 Feb 2025 23:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <202502272207.A1uo13Zf-lkp@intel.com>
References: <20250226093456.147402-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226093456.147402-9-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next linus/master v6.14-rc4 next-20250227]
[cannot apply to lee-backlight/for-backlight-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250226-174013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250226093456.147402-9-tzimmermann%40suse.de
patch subject: [PATCH v2 08/11] backlight: lcd: Replace fb events with a dedicated function call
config: i386-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272207.A1uo13Zf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272207.A1uo13Zf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272207.A1uo13Zf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
>> ERROR: modpost: "lcd_notify_mode_change_all" [drivers/video/fbdev/core/fb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
