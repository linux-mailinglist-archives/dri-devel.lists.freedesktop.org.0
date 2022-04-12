Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA404FC948
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DB310FA97;
	Tue, 12 Apr 2022 00:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377E010FA94;
 Tue, 12 Apr 2022 00:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649723468; x=1681259468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Agc/9Y7wOfxwFujbzIMC+t72NgHYwPEL9fQAInAnmBk=;
 b=I3I+0NnwNtEG7ujk75y7G7ClvzMr5YcnRUQ87gaTh+RYxNmrj/22kN4P
 9auiSQs4KOXfN6RUi1Yrr3wSysJGAJgMzfeVZEh/DKA7DK3RD73BMGGuc
 xEik2zqhemP5G96nb7AEpc1h/vsVlWGvgo+Hn91h82No42W5bbkZY7XaZ
 jFy1074i6df0mxdsQKjKMHf1NhsmvemBVq3I1j+EiVz7d7Q+64RaCU1Ie
 kRMdHZwzERvfTCgsZUEdAV9o+rwFMNhqhui++acENelEy5qnI1Xtd6aoD
 h6XEEYk1XSGKbf3KpD/s/HgfHlcR5PTaaZqJmLFM583gWGGA38sq/8ay2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262425743"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="262425743"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:31:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="644495956"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2022 17:31:04 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ne4Qx-0002Mc-Hi;
 Tue, 12 Apr 2022 00:31:03 +0000
Date: Tue, 12 Apr 2022 08:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 10/10] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Message-ID: <202204120815.MYwHtGG5-lkp@intel.com>
References: <20220411204741.1074308-11-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-11-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 abhinavk@codeaurora.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org,
 bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on v5.18-rc2 next-20220411]
[cannot apply to drm/drm-next drm-intel/for-linux-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Paul/drm-hdcp-Pull-HDCP-auth-exchange-check-into-helpers/20220412-045000
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: parisc-buildonly-randconfig-r003-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120815.MYwHtGG5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ba0d7728b853712a831745c4fddff8d72be1c9c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Paul/drm-hdcp-Pull-HDCP-auth-exchange-check-into-helpers/20220412-045000
        git checkout ba0d7728b853712a831745c4fddff8d72be1c9c8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=parisc SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_atomic.c:10:10: fatal error: dp_drm.h: No such file or directory
      10 | #include "dp_drm.h"
         |          ^~~~~~~~~~
   compilation terminated.


vim +10 drivers/gpu/drm/msm/msm_atomic.c

     9	
  > 10	#include "dp_drm.h"
    11	#include "msm_atomic_trace.h"
    12	#include "msm_drv.h"
    13	#include "msm_gem.h"
    14	#include "msm_kms.h"
    15	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
