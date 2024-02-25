Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9E862C74
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 19:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBF710E2C6;
	Sun, 25 Feb 2024 18:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2FkVT8M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3121710E2C6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708884134; x=1740420134;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=WQ4k+cVAnhT15Z7wFi7deNZ+ISFJHpvAqziU5YWj4Z4=;
 b=Z2FkVT8MJ+sOlSOm2DrwJYjLHSdLMbBv5kcIt7R3He+LdHs6js4BMaFK
 hIQ7/LBMeMW9bOIIFzcwFgoMIAZ78oCkNy77XvVEo8VsWDpMIQjMVRmqM
 i1i69PdX2zA3nxz4Q41JRt2tjMfnRvGc37mcF9RJ8wxB4ayKdC4DqWxTV
 NTqOp4L5n75+N9Lspap0mioDQezZCLg9LahhUnWNI8V4j7CvIQOE26LNi
 D4L3OXobhePU08l0M54nBEAVoLwkbJiiyiUkvXD0X+jvBU6+7HdDtrWJ9
 jgepUDTL16u47lt1PwkY/Q3/t4Xm6WpIsnwUXs8X9TP9gOlDfBFw3PI2o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20612660"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="20612660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 10:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11088206"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa004.fm.intel.com with ESMTP; 25 Feb 2024 10:02:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1reIpB-0009iS-0L;
 Sun, 25 Feb 2024 18:02:07 +0000
Date: Mon, 26 Feb 2024 02:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 1/3]
 drivers/gpu/drm/i915/display/intel_dp.c:4233:8: error: call to undeclared
 function 'intel_dp_vsc_sdp_pack'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202402260120.eBo7nTYE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   de8de2c8acb931ce6197a04376a7078ccf50e821
commit: 47f419e07111acecab3b529d4ae31a28985f5b61 [1/3] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
config: i386-buildonly-randconfig-003-20240225 (https://download.01.org/0day-ci/archive/20240226/202402260120.eBo7nTYE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260120.eBo7nTYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402260120.eBo7nTYE-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD de8de2c8acb931ce6197a04376a7078ccf50e821 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.c:4233:8: error: call to undeclared function 'intel_dp_vsc_sdp_pack'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4233 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
         |               ^
   drivers/gpu/drm/i915/display/intel_dp.c:4233:8: note: did you mean 'drm_dp_vsc_sdp_pack'?
   include/drm/display/drm_dp_helper.h:815:9: note: 'drm_dp_vsc_sdp_pack' declared here
     815 | ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
         |         ^
   1 error generated.


vim +/intel_dp_vsc_sdp_pack +4233 drivers/gpu/drm/i915/display/intel_dp.c

03c761b00c87d6 Gwan-gyeong Mun       2020-02-11  4223  
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4224  void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4225  			    const struct intel_crtc_state *crtc_state,
9ce5884e513903 José Roberto de Souza 2021-09-22  4226  			    const struct drm_dp_vsc_sdp *vsc)
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4227  {
7801f3b792b0fd Lucas De Marchi       2020-06-30  4228  	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4229  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4230  	struct dp_sdp sdp = {};
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4231  	ssize_t len;
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4232  
cafac5a9836199 Gwan-gyeong Mun       2020-05-14 @4233  	len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4234  
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4235  	if (drm_WARN_ON(&dev_priv->drm, len < 0))
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4236  		return;
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4237  
7801f3b792b0fd Lucas De Marchi       2020-06-30  4238  	dig_port->write_infoframe(encoder, crtc_state, DP_SDP_VSC,
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4239  					&sdp, len);
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4240  }
cafac5a9836199 Gwan-gyeong Mun       2020-05-14  4241  

:::::: The code at line 4233 was first introduced by commit
:::::: cafac5a983619944afa639c53f0d5d885616a3d2 drm/i915/dp: Add compute routine for DP PSR VSC SDP

:::::: TO: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
