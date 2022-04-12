Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1814FCC00
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 03:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C92110FB3F;
	Tue, 12 Apr 2022 01:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB5810FB3D;
 Tue, 12 Apr 2022 01:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649728428; x=1681264428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ir3eT6jI/snnEdY9SDd2SItgjEL3YQS+5bWAtYrZ8TA=;
 b=Dlf8BnNOv/8N+yjXjViKb+yI28p4LH24fnVvGVvb/X3g+shFddjtB4zb
 TQsT8tO9wJ/yF8sShSC/111SazeluL3odXORM6Uv8eJTrEG60PISx5l5O
 df93IJWRRueRe9krEez2wc54jIx0Jr0w3+47UH5B1n9aFlGKGx0vXQd11
 tJJD+rjlw8KVuuyFU+NwqFSlAB/iNiQAniIPo3CI1OReP/vVWbT8ahAU6
 /ln3lB/0xLBLYmb0fJ1tNgH2qk/1iY3CKj2fHpdpLCljBe5Lx6rkZhUlu
 dREmVubJfl00xlRjCuRVBtyPeYMKM8w/Oesjg24B4NGYIbXfuh0cv80C8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262000879"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="262000879"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 18:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572507578"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 11 Apr 2022 18:53:44 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ne5ix-0002Pw-DT;
 Tue, 12 Apr 2022 01:53:43 +0000
Date: Tue, 12 Apr 2022 09:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, rodrigo.vivi@intel.com
Subject: Re: [Intel-gfx] [PATCH v5 04/10] drm/hdcp: Expand HDCP helper
 library for enable/disable/check
Message-ID: <202204120922.hnbHBMC7-lkp@intel.com>
References: <20220411204741.1074308-5-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411204741.1074308-5-sean@poorly.run>
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
 markyacoub@chromium.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
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
config: mips-buildonly-randconfig-r001-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120922.hnbHBMC7-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7486d07edbd9a137420102bc24535c5d29c53c12
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Paul/drm-hdcp-Pull-HDCP-auth-exchange-check-into-helpers/20220412-045000
        git checkout 7486d07edbd9a137420102bc24535c5d29c53c12
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/gpu/drm/drm_hdcp.o: in function `drm_hdcp_remote_dpcd_read':
>> drm_hdcp.c:(.text+0x5e4): undefined reference to `drm_dp_dpcd_read'
   mips-linux-ld: drivers/gpu/drm/drm_hdcp.o: in function `drm_hdcp_remote_write':
>> drm_hdcp.c:(.text+0xf48): undefined reference to `drm_dp_dpcd_write'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
