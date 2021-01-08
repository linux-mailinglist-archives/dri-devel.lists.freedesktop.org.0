Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61012EF7AB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 19:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974406E89F;
	Fri,  8 Jan 2021 18:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39D46E898;
 Fri,  8 Jan 2021 18:50:11 +0000 (UTC)
IronPort-SDR: Gr2piVxBE2gsVJrclw4VROl2vvQ5DZE4W0zykQo3ttevGMYPJGqaIrbhqhIVwprdsUagJW5jIF
 jFinpiqinCDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="175062705"
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; 
 d="gz'50?scan'50,208,50";a="175062705"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 10:50:11 -0800
IronPort-SDR: 4OXSw27zMY/fXl7nTRXpfjAUVgBlpTU+riWzdQjbChfOzBJmPd5zUoG6kBe40D5dx1LckPRjbg
 yPaDE3hvnLWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; 
 d="gz'50?scan'50,208,50";a="566553618"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2021 10:50:08 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kxwpr-0000c1-AP; Fri, 08 Jan 2021 18:50:07 +0000
Date: Sat, 9 Jan 2021 02:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [drm-intel:topic/dp-hdmi-2.1-pcon 15/15]
 drivers/gpu/drm/i915/display/intel_dp.c:6909:42: error: use of logical '||'
 with constant operand
Message-ID: <202101090237.XsAAPySP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel topic/dp-hdmi-2.1-pcon
head:   522508b665df3bbfdf40381d4e61777844b1703f
commit: 522508b665df3bbfdf40381d4e61777844b1703f [15/15] drm/i915/display: Let PCON convert from RGB to YCbCr if it can
config: x86_64-randconfig-r011-20210108 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c951623bc8965fa1e89660f2f5f4a2944e4981a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel topic/dp-hdmi-2.1-pcon
        git checkout 522508b665df3bbfdf40381d4e61777844b1703f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.c:6909:42: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
                                                                    DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
                                                                                                    ^
   drivers/gpu/drm/i915/display/intel_dp.c:6909:42: note: use '|' for a bitwise operation
                                                                    DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
                                                                                                    ^~
                                                                                                    |
   drivers/gpu/drm/i915/display/intel_dp.c:6910:42: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
                                                                    DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
                                                                                                    ^
   drivers/gpu/drm/i915/display/intel_dp.c:6910:42: note: use '|' for a bitwise operation
                                                                    DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
                                                                                                    ^~
                                                                                                    |
>> drivers/gpu/drm/i915/display/intel_dp.c:6911:10: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
                                                                    DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
                                                                    ^
   include/drm/drm_dp_helper.h:444:48: note: expanded from macro 'DP_DS_HDMI_BT2020_RGB_YCBCR_CONV'
   # define DP_DS_HDMI_BT2020_RGB_YCBCR_CONV   (1 << 7)
                                                  ^
   drivers/gpu/drm/i915/display/intel_dp.c:6909:10: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
                                                                    DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
                                                                    ^
   include/drm/drm_dp_helper.h:442:48: note: expanded from macro 'DP_DS_HDMI_BT601_RGB_YCBCR_CONV'
   # define DP_DS_HDMI_BT601_RGB_YCBCR_CONV    (1 << 5)
                                                  ^
   drivers/gpu/drm/i915/display/intel_dp.c:6910:10: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
                                                                    DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
                                                                    ^
   include/drm/drm_dp_helper.h:443:48: note: expanded from macro 'DP_DS_HDMI_BT709_RGB_YCBCR_CONV'
   # define DP_DS_HDMI_BT709_RGB_YCBCR_CONV    (1 << 6)
                                                  ^
   5 errors generated.


vim +6909 drivers/gpu/drm/i915/display/intel_dp.c

  6879	
  6880	static void
  6881	intel_dp_update_420(struct intel_dp *intel_dp)
  6882	{
  6883		struct drm_i915_private *i915 = dp_to_i915(intel_dp);
  6884		struct intel_connector *connector = intel_dp->attached_connector;
  6885		bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420, rgb_to_ycbcr;
  6886	
  6887		/* No YCbCr output support on gmch platforms */
  6888		if (HAS_GMCH(i915))
  6889			return;
  6890	
  6891		/*
  6892		 * ILK doesn't seem capable of DP YCbCr output. The
  6893		 * displayed image is severly corrupted. SNB+ is fine.
  6894		 */
  6895		if (IS_GEN(i915, 5))
  6896			return;
  6897	
  6898		is_branch = drm_dp_is_branch(intel_dp->dpcd);
  6899		ycbcr_420_passthrough =
  6900			drm_dp_downstream_420_passthrough(intel_dp->dpcd,
  6901							  intel_dp->downstream_ports);
  6902		/* on-board LSPCON always assumed to support 4:4:4->4:2:0 conversion */
  6903		ycbcr_444_to_420 =
  6904			dp_to_dig_port(intel_dp)->lspcon.active ||
  6905			drm_dp_downstream_444_to_420_conversion(intel_dp->dpcd,
  6906								intel_dp->downstream_ports);
  6907		rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
  6908									 intel_dp->downstream_ports,
> 6909									 DP_DS_HDMI_BT601_RGB_YCBCR_CONV ||
  6910									 DP_DS_HDMI_BT709_RGB_YCBCR_CONV ||
> 6911									 DP_DS_HDMI_BT2020_RGB_YCBCR_CONV);
  6912	
  6913		if (INTEL_GEN(i915) >= 11) {
  6914			/* Let PCON convert from RGB->YCbCr if possible */
  6915			if (is_branch && rgb_to_ycbcr && ycbcr_444_to_420) {
  6916				intel_dp->dfp.rgb_to_ycbcr = true;
  6917				intel_dp->dfp.ycbcr_444_to_420 = true;
  6918				connector->base.ycbcr_420_allowed = true;
  6919			} else {
  6920			/* Prefer 4:2:0 passthrough over 4:4:4->4:2:0 conversion */
  6921				intel_dp->dfp.ycbcr_444_to_420 =
  6922					ycbcr_444_to_420 && !ycbcr_420_passthrough;
  6923	
  6924				connector->base.ycbcr_420_allowed =
  6925					!is_branch || ycbcr_444_to_420 || ycbcr_420_passthrough;
  6926			}
  6927		} else {
  6928			/* 4:4:4->4:2:0 conversion is the only way */
  6929			intel_dp->dfp.ycbcr_444_to_420 = ycbcr_444_to_420;
  6930	
  6931			connector->base.ycbcr_420_allowed = ycbcr_444_to_420;
  6932		}
  6933	
  6934		drm_dbg_kms(&i915->drm,
  6935			    "[CONNECTOR:%d:%s] RGB->YcbCr conversion? %s, YCbCr 4:2:0 allowed? %s, YCbCr 4:4:4->4:2:0 conversion? %s\n",
  6936			    connector->base.base.id, connector->base.name,
  6937			    yesno(intel_dp->dfp.rgb_to_ycbcr),
  6938			    yesno(connector->base.ycbcr_420_allowed),
  6939			    yesno(intel_dp->dfp.ycbcr_444_to_420));
  6940	}
  6941	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--LQksG6bCIzRHxTLp
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--LQksG6bCIzRHxTLp--
