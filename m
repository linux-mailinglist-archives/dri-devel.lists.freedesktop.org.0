Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E7758E20
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 08:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403510E021;
	Wed, 19 Jul 2023 06:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F8D10E021
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689749466; x=1721285466;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5xJdQh7J3IAI6lBSp+6GJoGty65hwbpC9fdEWdEtFdU=;
 b=OX8PHr0FJTzrJJjLaffuy681hqbR6Txrk4jUb+TWqOmZ47dL08G52R+m
 B+wKu29ixXE8CuKi5E2qcvS9rjoRz7267LrBpgQsbPPAOobeI2HP/WZOb
 KoTDm3a7xEop1o/AEzr8dlLntCkbPTRcQKRpcXLP9MxjZaBoRut6gUhoJ
 0DJmhXEbrEeqDfFunkS89+npVQluF7kJt+pCxhuwqgzy+nyEBviMMsyjc
 GuuRgICytEG0e/vDNAkjuvtFupPhhFb9e+/N7927VxHwpkK5exSDWCqry
 f7f/HZj+HD7JfBeDfYqlkXmlUyyQxWMghRwn4o5NFM4EIZXARZAJbnb5H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365265538"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="365265538"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 23:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789302616"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="789302616"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2023 23:51:03 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qM11a-0004E9-1L;
 Wed, 19 Jul 2023 06:51:02 +0000
Date: Wed, 19 Jul 2023 14:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Message-ID: <202307191411.kDvvppjm-lkp@intel.com>
References: <20230718181726.3799-3-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718181726.3799-3-gcarlos@disroot.org>
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
Cc: andrealmeid@igalia.com, davidgow@google.com, tales.aparecida@gmail.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, mripard@kernel.org,
 mairacanal@riseup.net, tzimmermann@suse.de, oe-kbuild-all@lists.linux.dev,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc2 next-20230718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Eduardo-Gallo-Filho/drm-Add-kernel-doc-for-drm_framebuffer_check_src_coords/20230719-022204
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230718181726.3799-3-gcarlos%40disroot.org
patch subject: [PATCH v2 2/4] drm/tests: Add test for drm_framebuffer_check_src_coords()
config: m68k-randconfig-r035-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191411.kDvvppjm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191411.kDvvppjm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191411.kDvvppjm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_framebuffer_check_src_coords" [drivers/gpu/drm/tests/drm_framebuffer_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
