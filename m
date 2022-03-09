Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC54D2E30
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E62D10E52F;
	Wed,  9 Mar 2022 11:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7446310E483;
 Wed,  9 Mar 2022 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646825770; x=1678361770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yZfd0yrdxn/084b8ilGpKvAPRKSOPL9X9NLFEQ6Zec4=;
 b=TqbndIKRQfXGqdZohH6BxI3WszQWEuIfPIFOkmkghYnaydDprrljKbus
 ya8mTJtCIXSZT0ljxJf1shO33hAxgEacW8V+N0W7by3u02pXnX+Q7oEB0
 0KuiIYH3L/sKlVEOsHxqaUJcJiKPUcnHNtgOxkIfKHfUEXL6HCWM1xXX1
 OuYH6oxg3j2LwItjgTW5AfFyZArpasVGeDyw01JS/rrkLkrBeY6Per1hI
 LhMXvEH20eLOuOd8+TUueBw16J/xeAFw1gX4hri/pN7ABV2+up22L0RBZ
 DFolcJdEb/YpWHHKylTuQx4vRJ8O+F8xAmFX2RxXIOHXzGOfYXV3P5Tcx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234906014"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="234906014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 03:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="688269779"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2022 03:36:06 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRubt-0003Ap-F2; Wed, 09 Mar 2022 11:36:05 +0000
Date: Wed, 9 Mar 2022 19:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 06/10] drm/msm/a6xx: Propagate OOB set error
Message-ID: <202203091923.2RD2Ech3-lkp@intel.com>
References: <20220302225551.v1.6.I7f93862e5dfa6eb1cc3e6d3d4e5e83022a491a94@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302225551.v1.6.I7f93862e5dfa6eb1cc3e6d3d4e5e83022a491a94@changeid>
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
Cc: kbuild-all@lists.01.org, Dan Carpenter <error27@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Wang Qing <wangqing@vivo.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next v5.17-rc7 next-20220308]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-P-Oommen/Support-for-GMU-coredump-and-some-related-improvements/20220303-013028
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: s390-randconfig-m031-20220307 (https://download.01.org/0day-ci/archive/20220309/202203091923.2RD2Ech3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
drivers/gpu/drm/msm/adreno/a6xx_gpu.c:894 hw_init() warn: inconsistent indenting

vim +894 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

   874	
   875	#define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
   876		  A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW | \
   877		  A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
   878		  A6XX_RBBM_INT_0_MASK_CP_IB2 | \
   879		  A6XX_RBBM_INT_0_MASK_CP_IB1 | \
   880		  A6XX_RBBM_INT_0_MASK_CP_RB | \
   881		  A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS | \
   882		  A6XX_RBBM_INT_0_MASK_RBBM_ATB_BUS_OVERFLOW | \
   883		  A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
   884		  A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
   885		  A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR)
   886	
   887	static int hw_init(struct msm_gpu *gpu)
   888	{
   889		struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
   890		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
   891		int ret;
   892	
   893		/* Make sure the GMU keeps the GPU on while we set it up */
 > 894		 ret = a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
   895	
   896		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
   897	
   898		/*
   899		 * Disable the trusted memory range - we don't actually supported secure
   900		 * memory rendering at this point in time and we don't want to block off
   901		 * part of the virtual memory space.
   902		 */
   903		gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
   904			REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
   905		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
   906	
   907		/* Turn on 64 bit addressing for all blocks */
   908		gpu_write(gpu, REG_A6XX_CP_ADDR_MODE_CNTL, 0x1);
   909		gpu_write(gpu, REG_A6XX_VSC_ADDR_MODE_CNTL, 0x1);
   910		gpu_write(gpu, REG_A6XX_GRAS_ADDR_MODE_CNTL, 0x1);
   911		gpu_write(gpu, REG_A6XX_RB_ADDR_MODE_CNTL, 0x1);
   912		gpu_write(gpu, REG_A6XX_PC_ADDR_MODE_CNTL, 0x1);
   913		gpu_write(gpu, REG_A6XX_HLSQ_ADDR_MODE_CNTL, 0x1);
   914		gpu_write(gpu, REG_A6XX_VFD_ADDR_MODE_CNTL, 0x1);
   915		gpu_write(gpu, REG_A6XX_VPC_ADDR_MODE_CNTL, 0x1);
   916		gpu_write(gpu, REG_A6XX_UCHE_ADDR_MODE_CNTL, 0x1);
   917		gpu_write(gpu, REG_A6XX_SP_ADDR_MODE_CNTL, 0x1);
   918		gpu_write(gpu, REG_A6XX_TPL1_ADDR_MODE_CNTL, 0x1);
   919		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_ADDR_MODE_CNTL, 0x1);
   920	
   921		/* enable hardware clockgating */
   922		a6xx_set_hwcg(gpu, true);
   923	
   924		/* VBIF/GBIF start*/
   925		if (adreno_is_a640_family(adreno_gpu) ||
   926		    adreno_is_a650_family(adreno_gpu)) {
   927			gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
   928			gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
   929			gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
   930			gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
   931			gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
   932			gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
   933		} else {
   934			gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
   935		}
   936	
   937		if (adreno_is_a630(adreno_gpu))
   938			gpu_write(gpu, REG_A6XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
   939	
   940		/* Make all blocks contribute to the GPU BUSY perf counter */
   941		gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
   942	
   943		/* Disable L2 bypass in the UCHE */
   944		gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_LO, 0xffffffc0);
   945		gpu_write(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX_HI, 0x0001ffff);
   946		gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_LO, 0xfffff000);
   947		gpu_write(gpu, REG_A6XX_UCHE_TRAP_BASE_HI, 0x0001ffff);
   948		gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_LO, 0xfffff000);
   949		gpu_write(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
   950	
   951		if (!adreno_is_a650_family(adreno_gpu)) {
   952			/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
   953			gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
   954				REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
   955	
   956			gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
   957				REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
   958				0x00100000 + adreno_gpu->gmem - 1);
   959		}
   960	
   961		gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
   962		gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
   963	
   964		if (adreno_is_a640_family(adreno_gpu) ||
   965		    adreno_is_a650_family(adreno_gpu))
   966			gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
   967		else
   968			gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
   969		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
   970	
   971		if (adreno_is_a660_family(adreno_gpu))
   972			gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
   973	
   974		/* Setting the mem pool size */
   975		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
   976	
   977		/* Setting the primFifo thresholds default values,
   978		 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
   979		*/
   980		if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
   981			gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
   982		else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
   983			gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
   984		else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
   985			gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
   986		else
   987			gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
   988	
   989		/* Set the AHB default slave response to "ERROR" */
   990		gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
   991	
   992		/* Turn on performance counters */
   993		gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_CNTL, 0x1);
   994	
   995		/* Select CP0 to always count cycles */
   996		gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL(0), PERF_CP_ALWAYS_COUNT);
   997	
   998		a6xx_set_ubwc_config(gpu);
   999	
  1000		/* Enable fault detection */
  1001		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL,
  1002			(1 << 30) | 0x1fffff);
  1003	
  1004		gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
  1005	
  1006		/* Set weights for bicubic filtering */
  1007		if (adreno_is_a650_family(adreno_gpu)) {
  1008			gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
  1009			gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
  1010				0x3fe05ff4);
  1011			gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
  1012				0x3fa0ebee);
  1013			gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
  1014				0x3f5193ed);
  1015			gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
  1016				0x3f0243f0);
  1017		}
  1018	
  1019		/* Protect registers from the CP */
  1020		a6xx_set_cp_protect(gpu);
  1021	
  1022		if (adreno_is_a660_family(adreno_gpu)) {
  1023			gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
  1024			gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
  1025		}
  1026	
  1027		/* Set dualQ + disable afull for A660 GPU */
  1028		if (adreno_is_a660(adreno_gpu))
  1029			gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
  1030	
  1031		/* Enable expanded apriv for targets that support it */
  1032		if (gpu->hw_apriv) {
  1033			gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
  1034				(1 << 6) | (1 << 5) | (1 << 3) | (1 << 2) | (1 << 1));
  1035		}
  1036	
  1037		/* Enable interrupts */
  1038		gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_INT_MASK);
  1039	
  1040		ret = adreno_hw_init(gpu);
  1041		if (ret)
  1042			goto out;
  1043	
  1044		ret = a6xx_ucode_init(gpu);
  1045		if (ret)
  1046			goto out;
  1047	
  1048		/* Set the ringbuffer address */
  1049		gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
  1050			gpu->rb[0]->iova);
  1051	
  1052		/* Targets that support extended APRIV can use the RPTR shadow from
  1053		 * hardware but all the other ones need to disable the feature. Targets
  1054		 * that support the WHERE_AM_I opcode can use that instead
  1055		 */
  1056		if (adreno_gpu->base.hw_apriv)
  1057			gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
  1058		else
  1059			gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
  1060				MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
  1061	
  1062		/*
  1063		 * Expanded APRIV and targets that support WHERE_AM_I both need a
  1064		 * privileged buffer to store the RPTR shadow
  1065		 */
  1066	
  1067		if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) {
  1068			if (!a6xx_gpu->shadow_bo) {
  1069				a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
  1070					sizeof(u32) * gpu->nr_rings,
  1071					MSM_BO_WC | MSM_BO_MAP_PRIV,
  1072					gpu->aspace, &a6xx_gpu->shadow_bo,
  1073					&a6xx_gpu->shadow_iova);
  1074	
  1075				if (IS_ERR(a6xx_gpu->shadow))
  1076					return PTR_ERR(a6xx_gpu->shadow);
  1077	
  1078				msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
  1079			}
  1080	
  1081			gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
  1082				REG_A6XX_CP_RB_RPTR_ADDR_HI,
  1083				shadowptr(a6xx_gpu, gpu->rb[0]));
  1084		}
  1085	
  1086		/* Always come up on rb 0 */
  1087		a6xx_gpu->cur_ring = gpu->rb[0];
  1088	
  1089		gpu->cur_ctx_seqno = 0;
  1090	
  1091		/* Enable the SQE_to start the CP engine */
  1092		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
  1093	
  1094		ret = a6xx_cp_init(gpu);
  1095		if (ret)
  1096			goto out;
  1097	
  1098		/*
  1099		 * Try to load a zap shader into the secure world. If successful
  1100		 * we can use the CP to switch out of secure mode. If not then we
  1101		 * have no resource but to try to switch ourselves out manually. If we
  1102		 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
  1103		 * be blocked and a permissions violation will soon follow.
  1104		 */
  1105		ret = a6xx_zap_shader_init(gpu);
  1106		if (!ret) {
  1107			OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
  1108			OUT_RING(gpu->rb[0], 0x00000000);
  1109	
  1110			a6xx_flush(gpu, gpu->rb[0]);
  1111			if (!a6xx_idle(gpu, gpu->rb[0]))
  1112				return -EINVAL;
  1113		} else if (ret == -ENODEV) {
  1114			/*
  1115			 * This device does not use zap shader (but print a warning
  1116			 * just in case someone got their dt wrong.. hopefully they
  1117			 * have a debug UART to realize the error of their ways...
  1118			 * if you mess this up you are about to crash horribly)
  1119			 */
  1120			dev_warn_once(gpu->dev->dev,
  1121				"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
  1122			gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
  1123			ret = 0;
  1124		} else {
  1125			return ret;
  1126		}
  1127	
  1128	out:
  1129		/*
  1130		 * Tell the GMU that we are done touching the GPU and it can start power
  1131		 * management
  1132		 */
  1133		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
  1134	
  1135		if (a6xx_gpu->gmu.legacy) {
  1136			/* Take the GMU out of its special boot mode */
  1137			a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
  1138		}
  1139	
  1140		return ret;
  1141	}
  1142	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
