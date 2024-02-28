Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049A86AF51
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 13:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665B010E0AA;
	Wed, 28 Feb 2024 12:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="begct1oV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5250610E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709124180; x=1740660180;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=/0t4Mbae428dTDHbmw//WSJF8pS8u8eLGcw1LoSCN58=;
 b=begct1oVFE/5GMUW5zF7HyrriVw24qC4lM0dlb1omZsRNUtO8ijr0hGX
 B2wn9MCGrCOW86Gp5NFJN6Car6WbM5nGOpvkyey68H67XpFW6mfesCD4s
 /+P1rVfWYkajBHWZ2kLUMNqpINxj/7emg0ahyKqumJNUrOTOmgWef9QO7
 euDxTp1D6Qcw7knh1OLAT4ax90IZtJZv2FiCjZFDfdTL6wmnfHuPwzr5U
 XXNkyt0yqppQU69JLVH+fdN/Jg3+6hyU6EgqTIf1J0cQq4rZjPkQxNgjc
 2DIV01NjoJO4caofgaJhJSLIaZd/c731RuD3Bohki3dq/CnMmitGaDbsI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3638230"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3638230"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 04:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="38252673"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 28 Feb 2024 04:42:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rfJGr-000C45-1O;
 Wed, 28 Feb 2024 12:42:49 +0000
Date: Wed, 28 Feb 2024 20:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 1/3]
 drivers/gpu/drm/i915/display/intel_dp.c:4233:15: error: implicit declaration
 of function 'intel_dp_vsc_sdp_pack'; did you mean 'drm_dp_vsc_sdp_pack'?
Message-ID: <202402282026.F2yrD1ZQ-lkp@intel.com>
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
head:   0c591381e4462005234f942d9fc36a369c0f5998
commit: 47f419e07111acecab3b529d4ae31a28985f5b61 [1/3] drm/dp: move intel_dp_vsc_sdp_pack() to generic helper
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240228/202402282026.F2yrD1ZQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282026.F2yrD1ZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282026.F2yrD1ZQ-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 0c591381e4462005234f942d9fc36a369c0f5998 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_dp.c: In function 'intel_write_dp_vsc_sdp':
>> drivers/gpu/drm/i915/display/intel_dp.c:4233:15: error: implicit declaration of function 'intel_dp_vsc_sdp_pack'; did you mean 'drm_dp_vsc_sdp_pack'? [-Werror=implicit-function-declaration]
    4233 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               drm_dp_vsc_sdp_pack
   cc1: some warnings being treated as errors


vim +4233 drivers/gpu/drm/i915/display/intel_dp.c

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
