Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694479DB24
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 23:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA8388130;
	Tue, 12 Sep 2023 21:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F21088130
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 21:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694555388; x=1726091388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G4ckZzBMFAv23ztB33PWVAUTc1jeURarpukWHrwzPcI=;
 b=MVdyE14bDpC/cJ2lh705RMvTO49m4Gen73PyRIaaOBdJtadiZBVIbACs
 IvYV0P0dvvaDPPDwkKaicKGuUVKq4DZ3xwDcLRs0+olkEelgKY71A7b5w
 GDG9BhkfNEM5Hxxj5lhdjVSExG1QLZRnMGMPeHZrd3qE6lM0+VyidEwyO
 Xb0p1lKCnkNVZrW39rFktGcVIVQ4Mchug3/o2VI5ofs1q9Ld8kwfdIDLv
 6W9SF9aRhtKxYu6bnTBcbGCtcbfyo9oo0ie7DNaLeq9wk1H8pYCBnp8Zt
 jvybrfT88XJb08pPI5WIZ3cAJEQ29UTTFZjhfcQMxM4qhN/C3mCuwrc9G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444939171"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="444939171"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 14:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809421556"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; d="scan'208";a="809421556"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2023 14:49:45 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qgBGR-0000JJ-18;
 Tue, 12 Sep 2023 21:49:43 +0000
Date: Wed, 13 Sep 2023 05:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
Message-ID: <202309130552.3IV4BeIj-lkp@intel.com>
References: <20230912110946.944791-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912110946.944791-1-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/drm-ssd130x-Store-the-HW-buffer-in-the-driver-private-CRTC-state/20230912-191205
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230912110946.944791-1-javierm%40redhat.com
patch subject: [PATCH v3] drm/ssd130x: Store the HW buffer in the driver-private CRTC state
config: i386-randconfig-063-20230913 (https://download.01.org/0day-ci/archive/20230913/202309130552.3IV4BeIj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130552.3IV4BeIj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130552.3IV4BeIj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/solomon/ssd130x.c:810:5: sparse: sparse: symbol 'ssd130x_crtc_helper_atomic_check' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
