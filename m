Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213C5ADCC5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 03:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813FA10E383;
	Tue,  6 Sep 2022 01:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD98610E383
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662426307; x=1693962307;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=6E9vEXGnWSLw8272iZYzcSnfvmq3epErU3w1jy4p1xc=;
 b=hk8g7EqL3jR8kAAr6qDHhWd/ptSM/ayEPa516dzbRmaxPEaF1Vkf49wI
 ClAoGSUnMpjXsC67q1G7LBqR/LGPQso2l9H+jUw/k0ZnormNG5+qnFd0q
 lbQWOaf1sf4WogIK+kkDHDHstLMpTF/Up/w+Xd6fjdWkHGeVQ1MFqOuzX
 BNGe4duL3Hr5OhwZ1pgT8NM+0tJ7FiPcvaatNdX1AiarljDbSDbSpssnr
 hoEh0MQu34mGA4ZlqGx/SWAyJiS//Wh5fAhu8QnFtCmUAp9cmg8tu1Qbg
 qUWG47X5UNyxVbJ70fzLAiwZBhDz+p/FbVaBsKJgpyATdr8Pwa4og8ta8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="276867188"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; d="scan'208";a="276867188"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 18:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; d="scan'208";a="643964143"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 05 Sep 2022 18:05:05 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oVN1U-0004hI-1t;
 Tue, 06 Sep 2022 01:05:04 +0000
Date: Tue, 6 Sep 2022 09:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: [drm-misc:for-linux-next 3/9]
 drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for
 drm_atomic_helper_check_wb_connector_state(). Prototype was for
 drm_atomic_helper_check_wb_encoder_state() instead
Message-ID: <202209060828.2Q6b2EhU-lkp@intel.com>
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
Cc: Melissa Wen <melissa.srw@gmail.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   396369d6754993e40f1c84b2e22e40e92dfa4c49
commit: 254fe9c106ed69245fbe0beac582054c98a91482 [3/9] drm: drm_atomic_helper: Add a new helper to deal with the writeback connector validation
config: i386-randconfig-a011-20220905 (https://download.01.org/0day-ci/archive/20220906/202209060828.2Q6b2EhU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 254fe9c106ed69245fbe0beac582054c98a91482
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead


vim +802 drivers/gpu/drm/drm_atomic_helper.c

   787	
   788	/**
   789	 * drm_atomic_helper_check_wb_connector_state() - Check writeback encoder state
   790	 * @encoder: encoder state to check
   791	 * @conn_state: connector state to check
   792	 *
   793	 * Checks if the writeback connector state is valid, and returns an error if it
   794	 * isn't.
   795	 *
   796	 * RETURNS:
   797	 * Zero for success or -errno
   798	 */
   799	int
   800	drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
   801						 struct drm_connector_state *conn_state)
 > 802	{
   803		struct drm_writeback_job *wb_job = conn_state->writeback_job;
   804		struct drm_property_blob *pixel_format_blob;
   805		struct drm_framebuffer *fb;
   806		size_t i, nformats;
   807		u32 *formats;
   808	
   809		if (!wb_job || !wb_job->fb)
   810			return 0;
   811	
   812		pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
   813		nformats = pixel_format_blob->length / sizeof(u32);
   814		formats = pixel_format_blob->data;
   815		fb = wb_job->fb;
   816	
   817		for (i = 0; i < nformats; i++)
   818			if (fb->format->format == formats[i])
   819				return 0;
   820	
   821		drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
   822	
   823		return -EINVAL;
   824	}
   825	EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
   826	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
