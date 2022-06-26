Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFDB55B453
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 00:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBD910E188;
	Sun, 26 Jun 2022 22:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0B810E188
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 22:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656283495; x=1687819495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ldNtxryiGQA157R36YiyLpP+MEeDc4uJSIYeTMYoMY=;
 b=AjaHAdt/CdKUA3RiN4HPSd8JHzqOggWX+nR0zfYdHA9g8M7hD9hV+3vb
 lqsUirgZFe6Kw80LLv4s6mnw25GtQsV9T0ip6XuhzvHgmET9lTuhhCSxe
 sVqtMXddvYG/SBzsYyvt38ZfpxL6prCoyWzc/gxaoXrpVdJ3YSAbX1ZAW
 Qta9IZOFJ7XZFS+CY5C1fzgLOXfjUrYdSHBkD5kotdygm6JFtFofWZA+q
 wGRMe7/kwTCN85N134JBDIWLdLlDO00VgxOWPfwkBLa7/7VxtaH3wwfXF
 NHA13RUpa3UMHSqubTchjnKtvFAHJ2Cxo3MekrdRNuG+x1mdmFdWA/LXS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="261125168"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="261125168"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2022 15:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="589697177"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 26 Jun 2022 15:44:52 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o5azr-0007up-CL;
 Sun, 26 Jun 2022 22:44:51 +0000
Date: Mon, 27 Jun 2022 06:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 laurent.pinchart@ideasonboard.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V2 2/2] drm: xlnx: dsi: Add Xilinx MIPI DSI-Tx subsystem
 driver
Message-ID: <202206270612.vJbBPJ9r-lkp@intel.com>
References: <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655389056-37044-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 kbuild-all@lists.01.org, airlied@linux.ie, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, vgannava@xilinx.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Venkateshwar,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master v5.19-rc3 next-20220624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Venkateshwar-Rao-Gannavarapu/Add-Xilinx-DSI-Tx-subsystem-DRM-driver/20220616-222008
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: mips-randconfig-c004-20220626
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/28aa62ffdc1901029bf75961166f4ebba948b9b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Venkateshwar-Rao-Gannavarapu/Add-Xilinx-DSI-Tx-subsystem-DRM-driver/20220616-222008
        git checkout 28aa62ffdc1901029bf75961166f4ebba948b9b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xlnx/xlnx_dsi.c:255:10: error: label at end of compound statement: expected statement
           default: /* define */
                   ^
                    ;
   1 error generated.


vim +255 drivers/gpu/drm/xlnx/xlnx_dsi.c

   227	
   228	#define MAX_INPUT_SEL_FORMATS   3
   229	static u32
   230	*xlnx_dsi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
   231						   struct drm_bridge_state *bridge_state,
   232						   struct drm_crtc_state *crtc_state,
   233						   struct drm_connector_state *conn_state,
   234						   u32 output_fmt,
   235						   unsigned int *num_input_fmts)
   236	{
   237		u32 *input_fmts;
   238		unsigned int i = 0;
   239	
   240		*num_input_fmts = 0;
   241		input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
   242		if (!input_fmts)
   243			return NULL;
   244	
   245		switch (output_fmt) {
   246		case MEDIA_BUS_FMT_FIXED:
   247			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
   248			break;
   249		case MEDIA_BUS_FMT_RGB666_1X18:
   250			input_fmts[i++] = MEDIA_BUS_FMT_RGB666_1X18;
   251			break;
   252		case MEDIA_BUS_FMT_RGB565_1X16:
   253			input_fmts[i++] = MEDIA_BUS_FMT_RGB565_1X16;
   254			break;
 > 255		default: /* define */
   256		}
   257	
   258		*num_input_fmts = i;
   259		if (*num_input_fmts == 0) {
   260			kfree(input_fmts);
   261			input_fmts = NULL;
   262		}
   263	
   264		return input_fmts;
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
