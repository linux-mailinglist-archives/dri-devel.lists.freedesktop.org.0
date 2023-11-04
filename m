Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3D7E0E37
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 08:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391610E1FA;
	Sat,  4 Nov 2023 07:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5D810E1FA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Nov 2023 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699083692; x=1730619692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5igX/9rntoYJILSlWBj4hdZfUPKUoaFDSxRk7TV5fc8=;
 b=IcmPRM0r84UfRbsMbuYVbI6jlUbjB4zSqHeXqxbYtqHytvN7AdId3Dwd
 XwMnM8R13Dg0jsre7nRbXLJEPu47zDHBy4GCdUZPMseVJpM05WXALl/y9
 754Rab7eW+EYq05yfv9JGUUgG1h/tFoS9igtqJbJE6jU7B6UXUotO9W8F
 SWisAbJDOmWplkkui145h+wvAx6LdGHZYyPE6dCjO0rQHez2GUbzTvJYv
 SV9wr9ujzdmQEQgb2J3uAgVXTGoLiosFlPA6ddMDY+90RsDScxirEQ149
 TSSTQYFFKrtRSq2Ue/mXcqQfNDKPdxcMYioo6lJsuwPRRD1a1nJWCuQxk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368403539"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="368403539"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2023 00:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738311763"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="738311763"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 04 Nov 2023 00:41:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qzBHb-0003dg-0o;
 Sat, 04 Nov 2023 07:41:27 +0000
Date: Sat, 4 Nov 2023 15:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by
 calling lsdc_output_init()
Message-ID: <202311041536.7w9xBsF9-lkp@intel.com>
References: <20231029194607.379459-4-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029194607.379459-4-suijingfeng@loongson.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-loongson-Introduce-a-minimal-support-for-Loongson-VBIOS/20231030-034730
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231029194607.379459-4-suijingfeng%40loongson.cn
patch subject: [PATCH 3/8] drm/loongson: Allow attach drm bridge driver by calling lsdc_output_init()
config: x86_64-randconfig-122-20231102 (https://download.01.org/0day-ci/archive/20231104/202311041536.7w9xBsF9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041536.7w9xBsF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041536.7w9xBsF9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_output.c:555:5: sparse: sparse: symbol 'lsdc_encoder_init' was not declared. Should it be static?
>> drivers/gpu/drm/loongson/lsdc_output.c:578:5: sparse: sparse: symbol 'lsdc_connector_init' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
