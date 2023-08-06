Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6805977150A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CFA10E0EF;
	Sun,  6 Aug 2023 12:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEFA10E0EF;
 Sun,  6 Aug 2023 12:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691325076; x=1722861076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WG+jMRSs1giuugV7/S2AhBZlclIgxIwrnVuxY1rUKxk=;
 b=BCs3+kiehhqOrCpV/Z/f5S97PlFN1A6wYhpy6ORsv1eYKL5Qxvvcbzgc
 caO3EQuLYbuEeMlYMKK1o4x2RZZ2ybGuxHiuDNjA3QDr7lXngLWKdwt+Y
 +8I6GOPVC7kVJs09gOlIc6vTL4OBIxyjKGHVOfZ9YbtGiM2GL+VP96DJl
 Y//+dXqN5TZGthzUJHWOxEj7ReZbF9DQFMbhkLyceG2pN7nshgdvBA/mz
 foa8pbZC0ZNae8zSuHlP94ElxG8CAtWlg3+lOp05SjyGhQB/GbPJiUbSO
 AwbTJ0xClkBmPduyu3+FGQhHxL6ifQN8MzB7eaPd03L0W8Lejulfk84bE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="434222194"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; d="scan'208";a="434222194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2023 05:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="760144574"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; d="scan'208";a="760144574"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 06 Aug 2023 05:31:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qScub-0004Df-34;
 Sun, 06 Aug 2023 12:31:09 +0000
Date: Sun, 6 Aug 2023 20:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Message-ID: <202308062017.iKU92hML-lkp@intel.com>
References: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230802-091932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802011845.4176631-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 1/3] drm/display: add transparent bridge helper
config: i386-randconfig-r072-20230806 (https://download.01.org/0day-ci/archive/20230806/202308062017.iKU92hML-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308062017.iKU92hML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308062017.iKU92hML-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_simple_bridge.c:118:25: sparse: sparse: symbol 'drm_simple_bridge_drv' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
