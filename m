Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39B4A7935
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 21:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2A410E519;
	Wed,  2 Feb 2022 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D6110E1E9;
 Wed,  2 Feb 2022 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643832506; x=1675368506;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rX4IpCULHcPxvwbeGlnyKWAIWnEu9XapRPbaMucEoqg=;
 b=h3HMq5bi5r7UqumZQjvk6mvXC79q4lzkxQ2c57KAMCzt2pEwUK22woLy
 4ALSg0hmphv1PnoKnvyLQ9vRGaW01vnxrU/RKK8lAyM5G5+6d9JQGLQwN
 F/zlJH0cpw+hSqLamdWY93Q4BuEPnVG+nlJ3Lh5ktpcTdI9TrpVVB4PnG
 W/a40ZpTlcSogr/z49wuPb8FbPPR6TN9VbkUWRT1NE3F2iZzOhuZQyVUh
 ZQxaLyiVPIOdMZ2W0395dNRnb2F/+OM6gelaSiJDvBBTy1udsCIM4EPLw
 aKEede2fGMKFgXj2NdpYHg7Ya4E7kEEdpgC7TmJzQgCOClQTfE7eEgE43 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="311316470"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="311316470"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 12:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="676560007"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2022 12:08:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFLvS-000V4Q-NM; Wed, 02 Feb 2022 20:08:22 +0000
Date: Thu, 3 Feb 2022 04:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kandpal Suraj <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/6] drm: add writeback pointers to
 drm_connector
Message-ID: <202202030437.kmrDD39E-lkp@intel.com>
References: <20220202085429.22261-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202085429.22261-2-suraj.kandpal@intel.com>
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
Cc: kbuild-all@lists.01.org, carsten.haitzler@arm.com, jani.nikula@intel.com,
 llvm@lists.linux.dev, quic_abhinavk@quicinc.com,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kandpal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kandpal-Suraj/drm-writeback-connector-changes/20220202-164832
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a013-20220131 (https://download.01.org/0day-ci/archive/20220203/202202030437.kmrDD39E-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/57ad56d769873f62f87fe432243030ceb1678f87
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kandpal-Suraj/drm-writeback-connector-changes/20220202-164832
        git checkout 57ad56d769873f62f87fe432243030ceb1678f87
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-review/Kandpal-Suraj/drm-writeback-connector-changes/20220202-164832 HEAD 75bbd0a8b1fb58f702279bfbc2fe2d74db8f7028 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_writeback.c:117:56: error: member reference type 'struct drm_connector *' is a pointer; did you mean to use '->'?
           struct drm_connector_state *conn_state = wb_conn->base.state;
                                                    ~~~~~~~~~~~~~^
                                                                 ->
>> drivers/gpu/drm/vkms/vkms_writeback.c:143:38: error: member reference type 'struct drm_encoder *' is a pointer; did you mean to use '->'?
           vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
                                               ->
>> drivers/gpu/drm/vkms/vkms_writeback.c:144:27: error: incompatible pointer types passing 'struct drm_connector **' to parameter of type 'struct drm_connector *'; remove & [-Werror,-Wincompatible-pointer-types]
           drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
                                    ^~~~~~~~~
   include/drm/drm_modeset_helper_vtables.h:1153:67: note: passing argument to parameter 'connector' here
   static inline void drm_connector_helper_add(struct drm_connector *connector,
                                                                     ^
   3 errors generated.


vim +117 drivers/gpu/drm/vkms/vkms_writeback.c

dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  108  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  109  static void vkms_wb_atomic_commit(struct drm_connector *conn,
eca22edb37d29f Maxime Ripard    2020-11-18  110  				  struct drm_atomic_state *state)
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  111  {
eca22edb37d29f Maxime Ripard    2020-11-18  112  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
eca22edb37d29f Maxime Ripard    2020-11-18  113  											 conn);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  114  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  115  	struct vkms_output *output = &vkmsdev->output;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  116  	struct drm_writeback_connector *wb_conn = &output->wb_connector;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30 @117  	struct drm_connector_state *conn_state = wb_conn->base.state;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  118  	struct vkms_crtc_state *crtc_state = output->composer_state;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  119  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  120  	if (!conn_state)
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  121  		return;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  122  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  123  	vkms_set_composer(&vkmsdev->output, true);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  124  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  125  	spin_lock_irq(&output->composer_lock);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  126  	crtc_state->active_writeback = conn_state->writeback_job->priv;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  127  	crtc_state->wb_pending = true;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  128  	spin_unlock_irq(&output->composer_lock);
eca22edb37d29f Maxime Ripard    2020-11-18  129  	drm_writeback_queue_job(wb_conn, connector_state);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  130  }
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  131  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  132  static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  133  	.get_modes = vkms_wb_connector_get_modes,
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  134  	.prepare_writeback_job = vkms_wb_prepare_job,
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  135  	.cleanup_writeback_job = vkms_wb_cleanup_job,
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  136  	.atomic_commit = vkms_wb_atomic_commit,
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  137  };
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  138  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  139  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  140  {
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  141  	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  142  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30 @143  	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30 @144  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
