Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515F6EA27C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 05:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50EF10E0DB;
	Fri, 21 Apr 2023 03:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D41010E004;
 Fri, 21 Apr 2023 03:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682049189; x=1713585189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hZgpuqIzJeQzUGcVl7JBW26FU9lNr05huyE0YaHEz7A=;
 b=K+fJQCxYk7ovmHzZszu1blo7L06gBBbL/O+SspZVGHhSVVzJptvHN0P9
 0DZhbDUQEjJOKrX2SjYG9+BJqQ7HqvRtgrdq2ZIZYz2zbpS5UFHSBzKPC
 WoALb+vd6cKjrlMJ0NytDV9CqlUfmjwGButT+IX4LKBbr98UvCEMQ5QgP
 qqWbp2WWvLsxlys3JjFKVE4075v/Meo9n9htuIazwr82/aoX5JmSR/Yg8
 y2tbwwYUNZNkCwYm2/2B8vi6kgSg+vSycesDk3niuOy2T++necwB7OZkv
 KrWxrE9QQ1ysSHv/F7rfztZuxGbqjHMP/Y6hsTlT6v3RkWqfSg6XFmbM3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="347808269"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="347808269"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 20:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938332076"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938332076"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2023 20:53:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pphpV-000gIS-34;
 Fri, 21 Apr 2023 03:53:01 +0000
Date: Fri, 21 Apr 2023 11:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Subject: Re: [PATCH v1 1/5] drm/msm/dpu: add support for DSC encoder v1.2
 engine
Message-ID: <202304211131.LQJKi60t-lkp@intel.com>
References: <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682033114-28483-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 oe-kbuild-all@lists.linux.dev, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dpu-add-support-for-DSC-encoder-v1-2-engine/20230421-072925
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1682033114-28483-2-git-send-email-quic_khsieh%40quicinc.com
patch subject: [PATCH v1 1/5] drm/msm/dpu: add support for DSC encoder v1.2 engine
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230421/202304211131.LQJKi60t-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1c3eede9e4f8fc63f52eddb0c55f63d59fad4b68
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuogee-Hsieh/drm-msm-dpu-add-support-for-DSC-encoder-v1-2-engine/20230421-072925
        git checkout 1c3eede9e4f8fc63f52eddb0c55f63d59fad4b68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211131.LQJKi60t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c: In function 'dpu_hw_dsc_config_1_2':
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c:227:31: error: implicit declaration of function 'drm_dsc_calculate_flatness_det_thresh' [-Werror=implicit-function-declaration]
     227 |         det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c:124:23: warning: variable 'off' set but not used [-Wunused-but-set-variable]
     124 |         void __iomem *off;
         |                       ^~~
   cc1: some warnings being treated as errors


vim +/off +124 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c

   112	
   113	static void dpu_hw_dsc_config_1_2(struct dpu_hw_dsc *hw_dsc,
   114				      struct drm_dsc_config *dsc,
   115				      u32 mode,
   116				      u32 initial_lines)
   117	{
   118		struct dpu_hw_blk_reg_map *hw;
   119		u32 offset;
   120		u32 data = 0;
   121		u32 det_thresh_flatness;
   122		u32 num_active_ss_per_enc;
   123		u32 bpp;
 > 124		void __iomem *off;
   125	
   126		if (!hw_dsc || !dsc)
   127			return;
   128	
   129		hw = &hw_dsc->hw;
   130	
   131		_dsc_subblk_offset(hw_dsc, DPU_DSC_ENC, &offset);
   132	
   133		if (mode & DSC_MODE_SPLIT_PANEL)
   134			data |= BIT(0);
   135	
   136		if (mode & DSC_MODE_MULTIPLEX)
   137			data |= BIT(1);
   138	
   139		num_active_ss_per_enc = dsc->slice_count;
   140		if (mode & DSC_MODE_MULTIPLEX)
   141			num_active_ss_per_enc = dsc->slice_count >> 1;
   142	
   143		data |= (num_active_ss_per_enc & 0x3) << 7;
   144	
   145		DPU_REG_WRITE(hw, DSC_CMN_MAIN_CNF, data);
   146	
   147		data = (initial_lines & 0xff);
   148	
   149		if (mode & DSC_MODE_VIDEO)
   150			data |= BIT(9);
   151	
   152		data |= (_dsc_calc_ob_max_addr(hw_dsc, num_active_ss_per_enc) << 18);
   153	
   154		DPU_REG_WRITE(hw, offset + ENC_DF_CTRL, data);
   155	
   156		data = (dsc->dsc_version_minor & 0xf) << 28;
   157		if (dsc->dsc_version_minor == 0x2) {
   158			if (dsc->native_422)
   159				data |= BIT(22);
   160			if (dsc->native_420)
   161				data |= BIT(21);
   162		}
   163	
   164		bpp = dsc->bits_per_pixel;
   165		/* as per hw requirement bpp should be programmed
   166		 * twice the actual value in case of 420 or 422 encoding
   167		 */
   168		if (dsc->native_422 || dsc->native_420)
   169			bpp = 2 * bpp;
   170		data |= (dsc->block_pred_enable ? 1 : 0) << 20;
   171		data |= bpp << 10;
   172		data |= (dsc->line_buf_depth & 0xf) << 6;
   173		data |= dsc->convert_rgb << 4;
   174		data |= dsc->bits_per_component & 0xf;
   175	
   176		DPU_REG_WRITE(hw, offset + DSC_MAIN_CONF, data);
   177	
   178		data = (dsc->pic_width & 0xffff) |
   179			((dsc->pic_height & 0xffff) << 16);
   180	
   181		DPU_REG_WRITE(hw, offset + DSC_PICTURE_SIZE, data);
   182	
   183		data = (dsc->slice_width & 0xffff) |
   184			((dsc->slice_height & 0xffff) << 16);
   185	
   186		DPU_REG_WRITE(hw, offset + DSC_SLICE_SIZE, data);
   187	
   188		DPU_REG_WRITE(hw, offset + DSC_MISC_SIZE,
   189				(dsc->slice_chunk_size) & 0xffff);
   190	
   191		data = (dsc->initial_xmit_delay & 0xffff) |
   192			((dsc->initial_dec_delay & 0xffff) << 16);
   193	
   194		DPU_REG_WRITE(hw, offset + DSC_HRD_DELAYS, data);
   195	
   196		DPU_REG_WRITE(hw, offset + DSC_RC_SCALE,
   197				dsc->initial_scale_value & 0x3f);
   198	
   199		data = (dsc->scale_increment_interval & 0xffff) |
   200			((dsc->scale_decrement_interval & 0x7ff) << 16);
   201	
   202		DPU_REG_WRITE(hw, offset + DSC_RC_SCALE_INC_DEC, data);
   203	
   204		data = (dsc->first_line_bpg_offset & 0x1f) |
   205			((dsc->second_line_bpg_offset & 0x1f) << 5);
   206	
   207		DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_1, data);
   208	
   209		data = (dsc->nfl_bpg_offset & 0xffff) |
   210			((dsc->slice_bpg_offset & 0xffff) << 16);
   211	
   212		DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_2, data);
   213	
   214		data = (dsc->initial_offset & 0xffff) |
   215			((dsc->final_offset & 0xffff) << 16);
   216	
   217		DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_3, data);
   218	
   219		data = (dsc->nsl_bpg_offset & 0xffff) |
   220			((dsc->second_line_offset_adj & 0xffff) << 16);
   221	
   222		DPU_REG_WRITE(hw, offset + DSC_RC_OFFSETS_4, data);
   223	
   224		data = (dsc->flatness_min_qp & 0x1f);
   225		data |= (dsc->flatness_max_qp & 0x1f) << 5;
   226	
   227		det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
   228		data |= (det_thresh_flatness & 0xff) << 10;
   229	
   230		DPU_REG_WRITE(hw, offset + DSC_FLATNESS_QP, data);
   231	
   232		DPU_REG_WRITE(hw, offset + DSC_RC_MODEL_SIZE,
   233				(dsc->rc_model_size) & 0xffff);
   234	
   235		data = dsc->rc_edge_factor & 0xf;
   236		data |= (dsc->rc_quant_incr_limit0 & 0x1f) << 8;
   237		data |= (dsc->rc_quant_incr_limit1 & 0x1f) << 13;
   238		data |= (dsc->rc_tgt_offset_high & 0xf) << 20;
   239		data |= (dsc->rc_tgt_offset_low & 0xf) << 24;
   240	
   241		DPU_REG_WRITE(hw, offset + DSC_RC_CONFIG, data);
   242	
   243		/* program the dsc wrapper */
   244		_dsc_subblk_offset(hw_dsc, DPU_DSC_CTL, &offset);
   245	
   246		off = hw->blk_addr + offset;
   247	
   248		data = BIT(0); /* encoder enable */
   249		if (dsc->native_422)
   250			data |= BIT(8);
   251		else if (dsc->native_420)
   252			data |= BIT(9);
   253		if (!dsc->convert_rgb)
   254			data |= BIT(10);
   255		if (dsc->bits_per_component == 8)
   256			data |= BIT(11);
   257		if (mode & DSC_MODE_SPLIT_PANEL)
   258			data |= BIT(12);
   259		if (mode & DSC_MODE_MULTIPLEX)
   260			data |= BIT(13);
   261		if (!(mode & DSC_MODE_VIDEO))
   262			data |= BIT(17);
   263	
   264		DPU_REG_WRITE(hw, offset + DSC_CFG, data);
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
