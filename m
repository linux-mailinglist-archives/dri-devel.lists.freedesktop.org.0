Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F3556DCB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 23:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910B710E9FA;
	Wed, 22 Jun 2022 21:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFAB10E8B4;
 Wed, 22 Jun 2022 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655932926; x=1687468926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wbr1pl9iV24n71aLN4ufD61f/bpnnMShwneyl4/fWGA=;
 b=bwKae3CUuC9IdN2uQOlC6U5CsF9KIRAIYavnleRAqTJl+fhf35ACxi0g
 KgL99B9BGNlkj9ehOoY+L34ocuu9K+19J6gaTUfqSjV3YQUf6glFrRQLb
 8c+jaPl+IqD7OXvWsOC0dunKA2pWW/2roY2oZX29Dl7boc2YfvkZazmvi
 AL54Iy2+ic4XpGP2pzrqmm4cX3dO6OXjHF9OIY06Y4g5PUebXjizw8MUp
 G10SYYicNcgo7liZDavW8wD/ezXZjzzrIffVwYa5XNvyMSoao+DWTb81T
 SUUNivuNFUSq+7SANNPiiMxO9UQ/pZfjokn3nJGRHelgMRDeP+lTfw3VJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281625969"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281625969"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 14:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="677755811"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2022 14:22:02 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o47nW-0001hj-22;
 Wed, 22 Jun 2022 21:22:02 +0000
Date: Thu, 23 Jun 2022 05:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [v3 5/5] drm/msm/disp/dpu1: add PSR support for eDP interface in
 dpu driver
Message-ID: <202206230551.H0oXeV2E-lkp@intel.com>
References: <1655808800-3996-6-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655808800-3996-6-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 kbuild-all@lists.01.org, swboyd@chromium.org, llvm@lists.linux.dev,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next linus/master v5.19-rc3 next-20220622]
[cannot apply to drm-intel/for-linux-next airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinod-Polimera/drm-msm-dp-Add-basic-PSR-support-for-eDP/20220621-195406
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-randconfig-r025-20220622 (https://download.01.org/0day-ci/archive/20220623/202206230551.H0oXeV2E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2c3c31343481a4faf2402cf513c85fb7d75ce205
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vinod-Polimera/drm-msm-dp-Add-basic-PSR-support-for-eDP/20220621-195406
        git checkout 2c3c31343481a4faf2402cf513c85fb7d75ce205
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1064:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
                   drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
                   ^
   include/drm/drm_encoder.h:314:3: note: expanded from macro 'drm_for_each_encoder_mask'
                   for_each_if ((encoder_mask) & drm_encoder_mask(encoder))
                   ^
   include/drm/drm_util.h:63:53: note: expanded from macro 'for_each_if'
   #define for_each_if(condition) if (!(condition)) {} else
                                                       ^
   1 warning generated.


vim +1064 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1032  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1033  static void dpu_crtc_enable(struct drm_crtc *crtc,
351f950db4ab28 Maxime Ripard     2020-10-08  1034  		struct drm_atomic_state *state)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1035  {
e12e5263bf1d8d Rob Clark         2020-09-07  1036  	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1037  	struct drm_encoder *encoder;
35c719da95c0d2 Rob Clark         2020-08-11  1038  	bool request_bandwidth = false;
2c3c31343481a4 Vinod Polimera    2022-06-21  1039  	struct drm_crtc_state *old_crtc_state;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1040  
2c3c31343481a4 Vinod Polimera    2022-06-21  1041  	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
b77d0f0d4ee757 Sean Paul         2018-11-16  1042  	pm_runtime_get_sync(crtc->dev->dev);
b77d0f0d4ee757 Sean Paul         2018-11-16  1043  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1044  	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1045  
241b507c166fef Rob Clark         2019-08-20  1046  	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
241b507c166fef Rob Clark         2019-08-20  1047  		/* in video mode, we hold an extra bandwidth reference
241b507c166fef Rob Clark         2019-08-20  1048  		 * as we cannot drop bandwidth at frame-done if any
241b507c166fef Rob Clark         2019-08-20  1049  		 * crtc is being used in video mode.
241b507c166fef Rob Clark         2019-08-20  1050  		 */
241b507c166fef Rob Clark         2019-08-20  1051  		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
241b507c166fef Rob Clark         2019-08-20  1052  			request_bandwidth = true;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1053  		dpu_encoder_register_frame_event_callback(encoder,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1054  				dpu_crtc_frame_event_cb, (void *)crtc);
241b507c166fef Rob Clark         2019-08-20  1055  	}
241b507c166fef Rob Clark         2019-08-20  1056  
241b507c166fef Rob Clark         2019-08-20  1057  	if (request_bandwidth)
241b507c166fef Rob Clark         2019-08-20  1058  		atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1059  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1060  	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1061  	dpu_crtc->enabled = true;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1062  
2c3c31343481a4 Vinod Polimera    2022-06-21  1063  	if (!old_crtc_state->self_refresh_active)
a796ba2cb3dde3 Sean Paul         2018-11-16 @1064  		drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
a796ba2cb3dde3 Sean Paul         2018-11-16  1065  			dpu_encoder_assign_crtc(encoder, crtc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1066  
2f2eb723b50b4d Rajesh Yadav      2018-07-13  1067  	/* Enable/restore vblank irq handling */
2f2eb723b50b4d Rajesh Yadav      2018-07-13  1068  	drm_crtc_vblank_on(crtc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1069  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1070  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
