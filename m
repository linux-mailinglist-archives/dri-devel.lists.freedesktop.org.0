Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968753C14F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFA3113CDF;
	Thu,  2 Jun 2022 23:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2701A113CDD;
 Thu,  2 Jun 2022 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654212419; x=1685748419;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GRhPAQ2CU2PMb7oMPFXlMaxADdhIAO/5kxDqAOm3iB0=;
 b=j170YE8dLFLzJxzXhKuYYb3iSeSZLaC5ef0dWbutWaE3wyaCN4WoiiY8
 L92cpzGXfGfE5hODcI5Wrhzr/CS2o+pq8Zviy9Ya0SdWOo1NoHPksUyro
 KnqBUgUXmshmXOCWsXnyXLP49ycgB564l5ce6YPvLOqym/DuJnFCl6K7v
 e/ANb7biJuyh3xbKfkLjj4ccgZf6iRTGWqAtHgdfqQqCxOkthoE6iQKgM
 +GpQl48ZSC3+2XvPZ/EmvuoadLB4giXeumsysxnLb7Ncb6gzi6B5i+Bql
 aKa+ZSAgEI2Bk9QRKUjbmDvL+EQbRmEyod1+YXEnR2cQFjzDvGISmlRZB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301482842"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="301482842"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 16:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="563544713"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 02 Jun 2022 16:26:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nwuDN-0005WF-L0;
 Thu, 02 Jun 2022 23:26:53 +0000
Date: Fri, 3 Jun 2022 07:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack@kde.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/qxl: Create mouse hotspot properties on cursor
 planes
Message-ID: <202206030750.8hv8vdBA-lkp@intel.com>
References: <20220602154243.1015688-4-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602154243.1015688-4-zack@kde.org>
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
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
 virtualization@lists.linux-foundation.org, krastevm@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip v5.18 next-20220602]
[cannot apply to airlied/drm-next tegra-drm/drm/tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/drm-Add-mouse-cursor-hotspot-support-to-atomic-KMS/20220602-234633
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220603/202206030750.8hv8vdBA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0bf2395ee17bd25ae6411c560de883496256195d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-Add-mouse-cursor-hotspot-support-to-atomic-KMS/20220602-234633
        git checkout 0bf2395ee17bd25ae6411c560de883496256195d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/qxl/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/qxl/qxl_display.c:486:26: warning: unused variable 'fb' [-Wunused-variable]
           struct drm_framebuffer *fb = plane_state->fb;
                                   ^
   drivers/gpu/drm/qxl/qxl_display.c:532:26: warning: unused variable 'fb' [-Wunused-variable]
           struct drm_framebuffer *fb = plane_state->fb;
                                   ^
   2 warnings generated.


vim +/fb +486 drivers/gpu/drm/qxl/qxl_display.c

c2ff663260fee3 Gabriel Krisman Bertazi 2017-02-27  482  
b4b27f08f9f96d Gerd Hoffmann           2021-02-17  483  static int qxl_primary_apply_cursor(struct qxl_device *qdev,
b4b27f08f9f96d Gerd Hoffmann           2021-02-17  484  				    struct drm_plane_state *plane_state)
9428088c90b6f7 Ray Strode              2017-11-27  485  {
b4b27f08f9f96d Gerd Hoffmann           2021-02-17 @486  	struct drm_framebuffer *fb = plane_state->fb;
b4b27f08f9f96d Gerd Hoffmann           2021-02-17  487  	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
9428088c90b6f7 Ray Strode              2017-11-27  488  	struct qxl_cursor_cmd *cmd;
9428088c90b6f7 Ray Strode              2017-11-27  489  	struct qxl_release *release;
9428088c90b6f7 Ray Strode              2017-11-27  490  	int ret = 0;
9428088c90b6f7 Ray Strode              2017-11-27  491  
9428088c90b6f7 Ray Strode              2017-11-27  492  	if (!qcrtc->cursor_bo)
9428088c90b6f7 Ray Strode              2017-11-27  493  		return 0;
9428088c90b6f7 Ray Strode              2017-11-27  494  
9428088c90b6f7 Ray Strode              2017-11-27  495  	ret = qxl_alloc_release_reserved(qdev, sizeof(*cmd),
9428088c90b6f7 Ray Strode              2017-11-27  496  					 QXL_RELEASE_CURSOR_CMD,
9428088c90b6f7 Ray Strode              2017-11-27  497  					 &release, NULL);
9428088c90b6f7 Ray Strode              2017-11-27  498  	if (ret)
9428088c90b6f7 Ray Strode              2017-11-27  499  		return ret;
9428088c90b6f7 Ray Strode              2017-11-27  500  
9428088c90b6f7 Ray Strode              2017-11-27  501  	ret = qxl_release_list_add(release, qcrtc->cursor_bo);
9428088c90b6f7 Ray Strode              2017-11-27  502  	if (ret)
9428088c90b6f7 Ray Strode              2017-11-27  503  		goto out_free_release;
9428088c90b6f7 Ray Strode              2017-11-27  504  
9428088c90b6f7 Ray Strode              2017-11-27  505  	ret = qxl_release_reserve_list(release, false);
9428088c90b6f7 Ray Strode              2017-11-27  506  	if (ret)
9428088c90b6f7 Ray Strode              2017-11-27  507  		goto out_free_release;
9428088c90b6f7 Ray Strode              2017-11-27  508  
9428088c90b6f7 Ray Strode              2017-11-27  509  	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
9428088c90b6f7 Ray Strode              2017-11-27  510  	cmd->type = QXL_CURSOR_SET;
0bf2395ee17bd2 Zack Rusin              2022-06-02  511  	cmd->u.set.position.x = plane_state->crtc_x + plane_state->hotspot_x;
0bf2395ee17bd2 Zack Rusin              2022-06-02  512  	cmd->u.set.position.y = plane_state->crtc_y + plane_state->hotspot_y;
9428088c90b6f7 Ray Strode              2017-11-27  513  
9428088c90b6f7 Ray Strode              2017-11-27  514  	cmd->u.set.shape = qxl_bo_physical_address(qdev, qcrtc->cursor_bo, 0);
9428088c90b6f7 Ray Strode              2017-11-27  515  
9428088c90b6f7 Ray Strode              2017-11-27  516  	cmd->u.set.visible = 1;
9428088c90b6f7 Ray Strode              2017-11-27  517  	qxl_release_unmap(qdev, release, &cmd->release_info);
9428088c90b6f7 Ray Strode              2017-11-27  518  
9428088c90b6f7 Ray Strode              2017-11-27  519  	qxl_release_fence_buffer_objects(release);
933db73351d359 Vasily Averin           2020-04-29  520  	qxl_push_cursor_ring_release(qdev, release, QXL_CMD_CURSOR, false);
9428088c90b6f7 Ray Strode              2017-11-27  521  
9428088c90b6f7 Ray Strode              2017-11-27  522  	return ret;
9428088c90b6f7 Ray Strode              2017-11-27  523  
9428088c90b6f7 Ray Strode              2017-11-27  524  out_free_release:
9428088c90b6f7 Ray Strode              2017-11-27  525  	qxl_release_free(qdev, release);
9428088c90b6f7 Ray Strode              2017-11-27  526  	return ret;
9428088c90b6f7 Ray Strode              2017-11-27  527  }
9428088c90b6f7 Ray Strode              2017-11-27  528  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
