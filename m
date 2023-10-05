Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315417B9A3D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 05:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EBC10E33A;
	Thu,  5 Oct 2023 03:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAB110E33A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 03:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696477246; x=1728013246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JFME8NcBpXCY8du/pdsUnFMfE0p6inW9BJPFM1YAbvc=;
 b=IYTdZvELp9Y9yJv1B1yWBvUuIRsm8BN4+qG3io8MyL9GopRChz1IwhyF
 CDdVL/tPLX6jZrDS8FdFGe6r/LFowgwYHg8vNjAQ63cYgDmvQl5TIOo6s
 8ldMv2Opy4Jcx5xkoyYvjXZQkCOjsRWH3YNKzGCyY+A0XgCd+jDxf1ujm
 i76B4B9lTbC7q6PfYf3I1dOwdzipbGJp6BlZMYOiaRGnWYcE8rt46eYHS
 xNn/49jdXlLHED4tmUvmIYRYYqovLe6mZfQ+++NlY5PU9i+/cRV9rgPKQ
 sD+AsKGkxnQJCaJwDoYH5/UHDT+diAQxx8U6GyA6QJxUgxmIjUtgTizVS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383292186"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="383292186"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 20:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998784603"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="998784603"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2023 20:40:42 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qoFE7-000Kxm-34;
 Thu, 05 Oct 2023 03:40:39 +0000
Date: Thu, 5 Oct 2023 11:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <202310051128.nptC5NyW-lkp@intel.com>
References: <20231003142508.190246-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003142508.190246-3-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2dde18cd1d8fac735875f2e4987f11817cc0bc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Export-line-conversion-helper-for-drm_panic/20231003-222642
base:   2dde18cd1d8fac735875f2e4987f11817cc0bc2c
patch link:    https://lore.kernel.org/r/20231003142508.190246-3-jfalempe%40redhat.com
patch subject: [PATCH v4 2/4] drm/panic: Add a drm panic handler
config: i386-randconfig-063-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051128.nptC5NyW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310051128.nptC5NyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051128.nptC5NyW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_panic.c:339:23: sparse: sparse: symbol 'drm_panic_notifier' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
