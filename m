Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B980BB88
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 15:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3248D10E0F7;
	Sun, 10 Dec 2023 14:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56E010E0F7;
 Sun, 10 Dec 2023 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702217257; x=1733753257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AqMQ12hypplovnBMfrnx3Zg6ItOfjkwRtKkMHvGMTUQ=;
 b=SJ2LnbdZKqcEGWcnOaXiM1zfoP+4U6Vhrep/6d3RrWSh23MFacewplb0
 Sq05Y/dG8lObddFbVlvwec0SI+XPgjT8h2bwaEq+qgiHv5UqIZOJ34Lqu
 gtLazybtQdqykJfCE7t/huhU1MufZesBVBXflKB5Dj4GmXmiP6ue+clBx
 DiZ2O+MbfYzH+hnNtffm2lwUua6YYCV6pebWBUsCPVhkTVjMxMUXSi/MG
 aaB4p/e19VfKj30ASUg2nzUE1kLausuLi50tYNp0di7nuwnjRUCg/sIVH
 hHT1xQ7pfZHBYlgSlQoeP6QxWpueQ/pa+DyeHnHL94o3mz0RAzDFE8yLC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7914855"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="7914855"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 06:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="722435368"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; d="scan'208";a="722435368"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 10 Dec 2023 06:07:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rCKSv-000GuU-29;
 Sun, 10 Dec 2023 14:07:29 +0000
Date: Sun, 10 Dec 2023 22:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 12/16] drm/msm/dpu: add an API to setup the CDM block
 for writeback
Message-ID: <202312102149.qmbCdsg2-lkp@intel.com>
References: <20231208050641.32582-13-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208050641.32582-13-quic_abhinavk@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, oe-kbuild-all@lists.linux.dev,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231207]
[also build test WARNING on v6.7-rc4]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc4 v6.7-rc3 v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhinav-Kumar/drm-msm-dpu-add-formats-check-for-writeback-encoder/20231208-130820
base:   next-20231207
patch link:    https://lore.kernel.org/r/20231208050641.32582-13-quic_abhinavk%40quicinc.com
patch subject: [PATCH v2 12/16] drm/msm/dpu: add an API to setup the CDM block for writeback
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231210/202312102149.qmbCdsg2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102149.qmbCdsg2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102149.qmbCdsg2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:267: warning: expecting prototype for dpu_encoder_phys_wb_setup_cdp(). Prototype was for dpu_encoder_helper_phys_setup_cdm() instead


vim +267 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c

   261	
   262	/**
   263	 * dpu_encoder_phys_wb_setup_cdp - setup chroma down sampling block
   264	 * @phys_enc:Pointer to physical encoder
   265	 */
   266	static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 > 267	{
   268		struct dpu_hw_cdm *hw_cdm;
   269		struct dpu_hw_cdm_cfg *cdm_cfg;
   270		struct dpu_hw_pingpong *hw_pp;
   271		struct dpu_encoder_phys_wb *wb_enc;
   272		const struct msm_format *format;
   273		const struct dpu_format *dpu_fmt;
   274		struct drm_writeback_job *wb_job;
   275		int ret;
   276	
   277		if (!phys_enc)
   278			return;
   279	
   280		wb_enc = to_dpu_encoder_phys_wb(phys_enc);
   281		cdm_cfg = &wb_enc->cdm_cfg;
   282		hw_pp = phys_enc->hw_pp;
   283		hw_cdm = phys_enc->hw_cdm;
   284		wb_job = wb_enc->wb_job;
   285	
   286		format = msm_framebuffer_format(wb_enc->wb_job->fb);
   287		dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format, wb_job->fb->modifier);
   288	
   289		if (!hw_cdm)
   290			return;
   291	
   292		if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
   293			DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
   294				  dpu_fmt->base.pixel_format);
   295			if (hw_cdm->ops.disable)
   296				hw_cdm->ops.disable(hw_cdm);
   297	
   298			return;
   299		}
   300	
   301		memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
   302	
   303		cdm_cfg->output_width = wb_job->fb->width;
   304		cdm_cfg->output_height = wb_job->fb->height;
   305		cdm_cfg->output_fmt = dpu_fmt;
   306		cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
   307		cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
   308				CDM_CDWN_OUTPUT_10BIT : CDM_CDWN_OUTPUT_8BIT;
   309		cdm_cfg->csc_cfg = dpu_hw_get_csc_cfg(DPU_HW_RGB2YUV_601L_10BIT);
   310		if (!cdm_cfg->csc_cfg) {
   311			DPU_ERROR("valid csc not found\n");
   312			return;
   313		}
   314	
   315		/* enable 10 bit logic */
   316		switch (cdm_cfg->output_fmt->chroma_sample) {
   317		case DPU_CHROMA_RGB:
   318			cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
   319			cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
   320			break;
   321		case DPU_CHROMA_H2V1:
   322			cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
   323			cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
   324			break;
   325		case DPU_CHROMA_420:
   326			cdm_cfg->h_cdwn_type = CDM_CDWN_COSITE;
   327			cdm_cfg->v_cdwn_type = CDM_CDWN_OFFSITE;
   328			break;
   329		case DPU_CHROMA_H1V2:
   330		default:
   331			DPU_ERROR("[enc:%d] unsupported chroma sampling type\n",
   332				  DRMID(phys_enc->parent));
   333			cdm_cfg->h_cdwn_type = CDM_CDWN_DISABLE;
   334			cdm_cfg->v_cdwn_type = CDM_CDWN_DISABLE;
   335			break;
   336		}
   337	
   338		DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
   339			  DRMID(phys_enc->parent), cdm_cfg->output_width,
   340			  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
   341			  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
   342			  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
   343	
   344		if (hw_cdm->ops.enable) {
   345			cdm_cfg->pp_id = hw_pp->idx;
   346			ret = hw_cdm->ops.enable(hw_cdm, cdm_cfg);
   347			if (ret < 0) {
   348				DPU_ERROR("[enc:%d] failed to enable CDM; ret:%d\n",
   349					  DRMID(phys_enc->parent), ret);
   350				return;
   351			}
   352		}
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
