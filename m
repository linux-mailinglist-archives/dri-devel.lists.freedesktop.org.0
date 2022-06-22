Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E044B554DFF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077F110E042;
	Wed, 22 Jun 2022 14:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ED210E042
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655909692; x=1687445692;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=xt08plImEShN1KM7O5cvlqdeoqoYtPaOL7SS4ddkGaM=;
 b=CgTXZiwWdfRXfIv+lPboONH9bvatsvqSTMSYOAefPQ+39H7H9fsEZhMq
 Oze2NDwVCf2GKlHQ6aU1sqJYgXyyXacm5SLa852bhfJ50nsCQI2BYLo1h
 tvGZgwfAVxKQ7i8fSW2twxm2dxnms6sx/AwnYaElYavzM06AMTqDCLQqO
 YNbC+IXo2Jz/CeBLT6XnrxX/pr0CPNe98PLn07uTuGLmqZYvTGqmVUlBk
 zO55kkadMh4LaVHfVx9upv8GQFJuZFKlb3+i0lgYqF/mjsDkaB8x1Llc4
 BMC0hb0+kZx1F7QOgd+PYEoTSiyuF66XdVucr6IISy9/h3iSq/0EVmUZV g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281167758"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281167758"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 07:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="834149115"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2022 07:54:50 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o41kn-0001O4-NR;
 Wed, 22 Jun 2022 14:54:49 +0000
Date: Wed, 22 Jun 2022 22:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [drm-misc:drm-misc-next 1/4]
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:58:17: error: implicit
 declaration of function 'drm_add_modes_noedid'
Message-ID: <202206222209.bTdAT1Bp-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   62a4ddcb79e073465f21c5cf84d80a2f22820c39
commit: 255490f9150da7c6dabe468f3a877b92fd0f02c1 [1/4] drm: Drop drm_edid.h from drm_crtc.h
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220622/202206222209.bTdAT1Bp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 255490f9150da7c6dabe468f3a877b92fd0f02c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_connector_get_modes':
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:58:17: error: implicit declaration of function 'drm_add_modes_noedid' [-Werror=implicit-function-declaration]
      58 |         count = drm_add_modes_noedid(connector,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:61:9: error: implicit declaration of function 'drm_set_preferred_mode'; did you mean 'drm_mm_reserve_node'? [-Werror=implicit-function-declaration]
      61 |         drm_set_preferred_mode(connector, hv->preferred_width,
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         drm_mm_reserve_node
   cc1: some warnings being treated as errors


vim +/drm_add_modes_noedid +58 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c

76c56a5affeba1 Deepak Rawat 2021-05-27  52  
76c56a5affeba1 Deepak Rawat 2021-05-27  53  static int hyperv_connector_get_modes(struct drm_connector *connector)
76c56a5affeba1 Deepak Rawat 2021-05-27  54  {
76c56a5affeba1 Deepak Rawat 2021-05-27  55  	struct hyperv_drm_device *hv = to_hv(connector->dev);
76c56a5affeba1 Deepak Rawat 2021-05-27  56  	int count;
76c56a5affeba1 Deepak Rawat 2021-05-27  57  
76c56a5affeba1 Deepak Rawat 2021-05-27 @58  	count = drm_add_modes_noedid(connector,
76c56a5affeba1 Deepak Rawat 2021-05-27  59  				     connector->dev->mode_config.max_width,
76c56a5affeba1 Deepak Rawat 2021-05-27  60  				     connector->dev->mode_config.max_height);
76c56a5affeba1 Deepak Rawat 2021-05-27 @61  	drm_set_preferred_mode(connector, hv->preferred_width,
76c56a5affeba1 Deepak Rawat 2021-05-27  62  			       hv->preferred_height);
76c56a5affeba1 Deepak Rawat 2021-05-27  63  
76c56a5affeba1 Deepak Rawat 2021-05-27  64  	return count;
76c56a5affeba1 Deepak Rawat 2021-05-27  65  }
76c56a5affeba1 Deepak Rawat 2021-05-27  66  

:::::: The code at line 58 was first introduced by commit
:::::: 76c56a5affeba1e163b66b9d8cc192e6154466f0 drm/hyperv: Add DRM driver for hyperv synthetic video device

:::::: TO: Deepak Rawat <drawat.floss@gmail.com>
:::::: CC: Deepak Rawat <drawat.floss@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
