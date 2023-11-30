Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3A7FF1DD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4A310E711;
	Thu, 30 Nov 2023 14:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 14:32:11 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F352010E710;
 Thu, 30 Nov 2023 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701354732; x=1732890732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IbtxtPQSaw1rbwoM+xVDv5JrPCQ3Y9QHpjjvR9eEpmU=;
 b=KYV1husabOks3iRnIeItHrcnQSME18ayQCtVh5IxThZG67BgKNQl72/u
 7/E4Dlnyhl5nlWCDc/0B+LOcA8n611yf5G6y68MIwM61HpH3l6dFVxFOm
 Z7Svi3XG2EmMLfetp5V7ejF5GoPbOG/wqJEH/xWC0KvR+NFZ2BK12VsxM
 brbZBO684SxS+6fBwoZT1x72sItE7Svkyws4X5ldSPGASYJs3ATIMoh90
 aohImfKC8R3T1cxchhu2zpfAuSeH9poS7KrRG14lvKTSb2ywNtoqFW4f2
 FbnGDLGnKL+y6+UyfD8gAN2EEtfFkgSbAL3hkYUICj6fR1ybzxDOJlQ4K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="209451"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="209451"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:25:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="803711816"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="803711816"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 30 Nov 2023 06:24:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r8hyL-00027A-0z;
 Thu, 30 Nov 2023 14:24:57 +0000
Date: Thu, 30 Nov 2023 22:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@gmail.com, agross@kernel.org, dmitry.baryshkov@linaro.org,
 andersson@kernel.org
Subject: Re: [PATCH v1] drm/msm/dpu: improve DSC allocation
Message-ID: <202311302230.t6X5rroJ-lkp@intel.com>
References: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, oe-kbuild-all@lists.linux.dev,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuogee,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuogee-Hsieh/drm-msm-dpu-improve-DSC-allocation/20231130-064646
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1701289898-12235-1-git-send-email-quic_khsieh%40quicinc.com
patch subject: [PATCH v1] drm/msm/dpu: improve DSC allocation
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231130/202311302230.t6X5rroJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302230.t6X5rroJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302230.t6X5rroJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c: In function '_dpu_rm_reserve_dsc':
>> drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:537:38: warning: assignment to 'uint32_t' {aka 'unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     537 |                 pp_to_enc_id[pp_idx] = NULL;
         |                                      ^


vim +537 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c

   463	
   464	static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
   465				       struct dpu_global_state *global_state,
   466				       struct drm_encoder *enc,
   467				       const struct msm_display_topology *top)
   468	{
   469		int num_dsc = 0;
   470		int i, pp_idx;
   471		bool pair = false;
   472		int dsc_idx[DSC_MAX - DSC_0];
   473		uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
   474		int pp_max = PINGPONG_MAX - PINGPONG_0;
   475	
   476		if (!top->num_dsc || !top->num_intf)
   477			return 0;
   478	
   479		/*
   480		 * Truth:
   481		 * 1) every layer mixer only connects to one pingpong
   482		 * 2) no pingpong split -- two layer mixers shared one pingpong
   483		 * 3) each DSC engine contains two dsc encoders
   484		 *    -- index(0,1), index (2,3),... etc
   485		 * 4) dsc pair can only happens with same DSC engine except 4 dsc
   486		 *    merge mode application (8k) which need two DSC engines
   487		 * 5) odd pingpong connect to odd dsc
   488		 * 6) even pingpong connect even dsc
   489		 */
   490	
   491		/* num_dsc should be either 1, 2 or 4 */
   492		if (top->num_dsc > top->num_intf)	/* merge mode */
   493			pair = true;
   494	
   495		/* fill working copy with pingpong list */
   496		memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
   497	
   498		for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
   499			if (!rm->dsc_blks[i])	/* end of dsc list */
   500				break;
   501	
   502			if (global_state->dsc_to_enc_id[i]) {	/* used */
   503				/* consective dsc index to be paired */
   504				if (pair && num_dsc) {	/* already start pairing, re start */
   505					num_dsc = 0;
   506					/* fill working copy with pingpong list */
   507					memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
   508									sizeof(pp_to_enc_id));
   509				}
   510				continue;
   511			}
   512	
   513			/* odd index can not become start of pairing */
   514			if (pair && (i & 0x01) && !num_dsc)
   515				continue;
   516	
   517			/*
   518			 * find the pingpong index which had been reserved
   519			 * previously at layer mixer allocation
   520			 */
   521			for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
   522				if (pp_to_enc_id[pp_idx] == enc->base.id)
   523					break;
   524			}
   525	
   526			/*
   527			 * dsc even index must map to pingpong even index
   528			 * dsc odd index must map to pingpong odd index
   529			 */
   530			if ((i & 0x01) != (pp_idx & 0x01))
   531				continue;
   532	
   533			/*
   534			 * delete pp_idx so that it can not be found at next search
   535			 * in the case of pairing
   536			 */
 > 537			pp_to_enc_id[pp_idx] = NULL;
   538	
   539			dsc_idx[num_dsc++] = i;
   540			if (num_dsc >= top->num_dsc)
   541				break;
   542		}
   543	
   544		if (num_dsc < top->num_dsc) {
   545			DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
   546							num_dsc, top->num_dsc );
   547			return -ENAVAIL;
   548		}
   549	
   550		/* reserve dsc */
   551		for (i = 0; i < top->num_dsc; i++) {
   552			int j;
   553	
   554			j = dsc_idx[i];
   555			global_state->dsc_to_enc_id[j] = enc->base.id;
   556		}
   557	
   558		return 0;
   559	}
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
