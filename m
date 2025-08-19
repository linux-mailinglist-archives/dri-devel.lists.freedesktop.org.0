Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC69B2B53E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 02:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232410E090;
	Tue, 19 Aug 2025 00:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0Nwbfy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A12610E090
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 00:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755562794; x=1787098794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AR34Y3cUHe299MkLB5vxlNw6W6dIHDHLtnEw+RTlkQo=;
 b=c0Nwbfy67BFyhobvlMfyrQGkwCGI/j24Uj9af4NX8EwJfQq2o1mM3c6S
 DNV/GQ/krsyWATcordGHrhvnOSOvNv621WHeqEaaovUuhqkmED0PaHbmb
 BTWWfGp17tx1PCg350u4NoOxSPN+VWLFEeAqyPvu0qi0bmBKQCCAprvKo
 7i/EuVhFUIeziJNxRTtaMYpoAV7vzJgu4tN4z2s18bcuZktrDLTQ+GFAh
 CzEJzTgdBQ7Vr6zlsV8ZsvUMVWwyc2i1IJQXsALeD/c2AY+48CZ9pVcDm
 t5lVYfGtie5fpbYEfjt1vljphri41KRdhZEsW7jd0SV1AycB/7ySYIoM9 w==;
X-CSE-ConnectionGUID: R7bNVHWiRcWkwc0ME3S3wQ==
X-CSE-MsgGUID: /4HnfuSbT6GnAMxZGJXWLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57509726"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57509726"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 17:19:54 -0700
X-CSE-ConnectionGUID: JkeMgubOSbmutcJ2PIIx5A==
X-CSE-MsgGUID: JOl/WuWzSUuBYHJ5PZzkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167617232"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2025 17:19:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uoA4L-000GKd-2m;
 Tue, 19 Aug 2025 00:19:26 +0000
Date: Tue, 19 Aug 2025 08:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] fbcon: Rename struct fbcon_ops to struct fbcon
Message-ID: <202508190824.awMtfRRR-lkp@intel.com>
References: <20250818104655.235001-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818104655.235001-3-tzimmermann@suse.de>
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

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbcon-Fix-empty-lines-in-fbcon-h/20250818-185124
base:   linus/master
patch link:    https://lore.kernel.org/r/20250818104655.235001-3-tzimmermann%40suse.de
patch subject: [PATCH 2/6] fbcon: Rename struct fbcon_ops to struct fbcon
config: x86_64-buildonly-randconfig-004-20250819 (https://download.01.org/0day-ci/archive/20250819/202508190824.awMtfRRR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190824.awMtfRRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190824.awMtfRRR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fbcon.c:708:19: error: use of undeclared identifier 'con'
     708 |         fbcon_set_bitops(con);
         |                          ^
   1 error generated.


vim +/con +708 drivers/video/fbdev/core/fbcon.c

   689	
   690	static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
   691	{
   692		int err = 0;
   693	
   694		if (info->flags & FBINFO_MISC_TILEBLITTING &&
   695		    info->tileops->fb_get_tilemax(info) < charcount)
   696			err = 1;
   697	
   698		return err;
   699	}
   700	#else
   701	static void set_blitting_type(struct vc_data *vc, struct fb_info *info)
   702	{
   703		struct fbcon *confb = info->fbcon_par;
   704	
   705		info->flags &= ~FBINFO_MISC_TILEBLITTING;
   706		confb->p = &fb_display[vc->vc_num];
   707		fbcon_set_rotation(info);
 > 708		fbcon_set_bitops(con);
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
