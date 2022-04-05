Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75D4F3D4D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 21:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F2710EE64;
	Tue,  5 Apr 2022 19:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F0310E0F7;
 Tue,  5 Apr 2022 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649186013; x=1680722013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BNf83Q5/1PWslvUKwhpqfDSkCkwhO7rU7ZNMZq/zkYQ=;
 b=kUeAa1xOna8qaCyFt2FlvCZPFtsFGgi6oOFB2IfO8SJ5HU4Ok0WX0tFE
 p75bBdTMyi3grb/s0rK+BZiMhuGw4FJQmmYbQBWgB3bzAAIXHvnoBNyXg
 0TO1JyQUiNdfoF5CJFHXrysProILic0XT9G7966KmmA4o25YnJgWstaMj
 z6Ko6eT/OCUGt1PX1AFBElU4xjBEkWJhjxrprEwDSkDVjWHDEinFZ8IEt
 5DCmlQcfKRRug4xNzHW4R2IQHaAiOQqaiilVJGDxVrJYer9zROr9Fmo/8
 +oULibvVxOMaQFQimHPIxLHl335uy3roQpYOd76usaukrOtVd2kp34pqg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="260835479"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="260835479"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 12:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="789979762"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2022 12:13:27 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbocI-0003gn-FR;
 Tue, 05 Apr 2022 19:13:26 +0000
Date: Wed, 6 Apr 2022 03:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v6 14/14] drm/msm/dsi: Add support for DSC configuration
Message-ID: <202204060308.OkAS3XG3-lkp@intel.com>
References: <20220404163436.956875-15-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404163436.956875-15-vkoul@kernel.org>
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
Cc: kbuild-all@lists.01.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 05241de1f69eb7f56b0a5e0bec96a7752fad1b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinod-Koul/drm-msm-Add-Display-Stream-Compression-Support/20220405-003745
base:   05241de1f69eb7f56b0a5e0bec96a7752fad1b2f
config: hexagon-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204060308.OkAS3XG3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c54db3ee1e02d639e568c37121f797ac586af3d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vinod-Koul/drm-msm-Add-Display-Stream-Compression-Support/20220405-003745
        git checkout 6c54db3ee1e02d639e568c37121f797ac586af3d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
           u32 reg, intf_width, reg_ctrl, reg_ctrl2;
                                ^
   1 warning generated.


vim +/reg_ctrl +918 drivers/gpu/drm/msm/dsi/dsi_host.c

   914	
   915	static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
   916	{
   917		struct msm_display_dsc_config *dsc = msm_host->dsc;
 > 918		u32 reg, intf_width, reg_ctrl, reg_ctrl2;
   919		u32 slice_per_intf, total_bytes_per_intf;
   920		u32 pkt_per_line;
   921		u32 bytes_in_slice;
   922		u32 eol_byte_num;
   923	
   924		/* first calculate dsc parameters and then program
   925		 * compress mode registers
   926		 */
   927		intf_width = hdisplay;
   928		slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
   929	
   930		/* If slice_per_pkt is greater than slice_per_intf
   931		 * then default to 1. This can happen during partial
   932		 * update.
   933		 */
   934		if (slice_per_intf > dsc->drm->slice_count)
   935			dsc->drm->slice_count = 1;
   936	
   937		slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
   938		bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * dsc->drm->bits_per_pixel, 8);
   939	
   940		dsc->drm->slice_chunk_size = bytes_in_slice;
   941	
   942		total_bytes_per_intf = bytes_in_slice * slice_per_intf;
   943	
   944		eol_byte_num = total_bytes_per_intf % 3;
   945		pkt_per_line = slice_per_intf / dsc->drm->slice_count;
   946	
   947		if (is_cmd_mode) /* packet data type */
   948			reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
   949		else
   950			reg = DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE(MIPI_DSI_COMPRESSED_PIXEL_STREAM);
   951	
   952		/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
   953		 * registers have similar offsets, so for below common code use
   954		 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
   955		 */
   956		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
   957		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
   958		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;
   959	
   960		if (is_cmd_mode) {
   961			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
   962			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
   963	
   964			reg_ctrl |= reg;
   965			reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
   966	
   967			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
   968			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
   969		} else {
   970			dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
   971		}
   972	}
   973	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
