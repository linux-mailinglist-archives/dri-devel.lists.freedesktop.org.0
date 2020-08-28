Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88A25629A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 23:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351546E0FE;
	Fri, 28 Aug 2020 21:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89DA6E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 21:44:59 +0000 (UTC)
IronPort-SDR: TlujLgCBQ2jsiYTlK02dXCCC+eY4UR6zQxLaj1K9Sg9VJwS+4dNieWdOM38xiCEKis007jwvts
 v3TRfLVLNVVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="241568617"
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; 
 d="gz'50?scan'50,208,50";a="241568617"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 14:44:58 -0700
IronPort-SDR: erUstv96794WAW7+U9fd6aFw/q6if1eebaSVUCO6c06q1MrqfUiHtr5XzBKvpm3+UVSzuxHC3m
 U52KOUkC1YrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; 
 d="gz'50?scan'50,208,50";a="296266223"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2020 14:44:56 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kBmB5-0000Di-RW; Fri, 28 Aug 2020 21:44:55 +0000
Date: Sat, 29 Aug 2020 05:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 1403/1518]
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:44:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202008290508.xKiYqen5%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
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
Cc: Alex Deucher <alexander.deucher@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   8252270c0b5fba4dd651473c5fee66ecaa3d9026
commit: 82e6bcf7c9a0c82f3d41a5837bb1dadd68037e55 [1403/1518] drm/amd/pm: optimize the power related source code layout
config: powerpc64-randconfig-s032-20200828 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        git checkout 82e6bcf7c9a0c82f3d41a5837bb1dadd68037e55
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *d @@     got void *kaddr @@
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:44: sparse:     expected void volatile [noderef] <asn:2> *d
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:44: sparse:     got void *kaddr

git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
git fetch --no-tags radeon-alex amd-staging-drm-next
git checkout 82e6bcf7c9a0c82f3d41a5837bb1dadd68037e55
vim +408 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c

1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  321  
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  322  int smu7_request_smu_load_fw(struct pp_hwmgr *hwmgr)
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  323  {
b3b030520df05fc drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-26  324  	struct smu7_smumgr *smu_data = (struct smu7_smumgr *)(hwmgr->smu_backend);
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  325  	uint32_t fw_to_load;
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  326  	int r = 0;
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  327  
744a522794bdc64 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-09-29  328  	amdgpu_ucode_init_bo(hwmgr->adev);
744a522794bdc64 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-09-29  329  
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  330  	if (smu_data->soft_regs_start)
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  331  		cgs_write_ind_register(hwmgr->device, CGS_IND_REG__SMC,
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  332  					smu_data->soft_regs_start + smum_get_offsetof(hwmgr,
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  333  					SMU_SoftRegisters, UcodeLoadStatus),
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  334  					0x0);
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  335  
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  336  	if (hwmgr->chip_id > CHIP_TOPAZ) { /* add support for Topaz */
8bb575a2d83af09 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-03-22  337  		if (hwmgr->not_vf) {
d9c8316eb372268 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-26  338  			smum_send_msg_to_smc_with_parameter(hwmgr,
e224e4f17dc89b2 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Xiangliang Yu 2016-12-02  339  						PPSMC_MSG_SMU_DRAM_ADDR_HI,
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  340  						upper_32_bits(smu_data->smu_buffer.mc_addr),
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  341  						NULL);
d9c8316eb372268 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-26  342  			smum_send_msg_to_smc_with_parameter(hwmgr,
e224e4f17dc89b2 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Xiangliang Yu 2016-12-02  343  						PPSMC_MSG_SMU_DRAM_ADDR_LO,
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  344  						lower_32_bits(smu_data->smu_buffer.mc_addr),
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  345  						NULL);
e224e4f17dc89b2 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Xiangliang Yu 2016-12-02  346  		}
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  347  		fw_to_load = UCODE_ID_RLC_G_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  348  			   + UCODE_ID_SDMA0_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  349  			   + UCODE_ID_SDMA1_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  350  			   + UCODE_ID_CP_CE_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  351  			   + UCODE_ID_CP_ME_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  352  			   + UCODE_ID_CP_PFP_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  353  			   + UCODE_ID_CP_MEC_MASK;
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  354  	} else {
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  355  		fw_to_load = UCODE_ID_RLC_G_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  356  			   + UCODE_ID_SDMA0_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  357  			   + UCODE_ID_SDMA1_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  358  			   + UCODE_ID_CP_CE_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  359  			   + UCODE_ID_CP_ME_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  360  			   + UCODE_ID_CP_PFP_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  361  			   + UCODE_ID_CP_MEC_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  362  			   + UCODE_ID_CP_MEC_JT1_MASK
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  363  			   + UCODE_ID_CP_MEC_JT2_MASK;
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  364  	}
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  365  
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  366  	if (!smu_data->toc) {
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  367  		struct SMU_DRAMData_TOC *toc;
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  368  
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  369  		smu_data->toc = kzalloc(sizeof(struct SMU_DRAMData_TOC), GFP_KERNEL);
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  370  		if (!smu_data->toc)
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  371  			return -ENOMEM;
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  372  		toc = smu_data->toc;
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  373  		toc->num_entries = 0;
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  374  		toc->structure_version = 1;
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  375  
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  376  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  377  				UCODE_ID_RLC_G, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  378  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  379  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  380  				UCODE_ID_CP_CE, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  381  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  382  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  383  				UCODE_ID_CP_PFP, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  384  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  385  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  386  				UCODE_ID_CP_ME, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  387  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  388  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  389  				UCODE_ID_CP_MEC, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  390  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  391  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  392  				UCODE_ID_CP_MEC_JT1, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  393  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  394  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  395  				UCODE_ID_CP_MEC_JT2, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  396  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  397  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  398  				UCODE_ID_SDMA0, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  399  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  400  		PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  401  				UCODE_ID_SDMA1, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  402  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
8bb575a2d83af09 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-03-22  403  		if (!hwmgr->not_vf)
d3f8c0abf45866d drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2017-09-20  404  			PP_ASSERT_WITH_CODE(0 == smu7_populate_single_firmware_entry(hwmgr,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  405  				UCODE_ID_MEC_STORAGE, &toc->entry[toc->num_entries++]),
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  406  				"Failed to Get Firmware Entry.", r = -EINVAL; goto failed);
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  407  	}
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12 @408  	memcpy_toio(smu_data->header_buffer.kaddr, smu_data->toc,
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  409  		    sizeof(struct SMU_DRAMData_TOC));
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  410  	smum_send_msg_to_smc_with_parameter(hwmgr,
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  411  			PPSMC_MSG_DRV_DRAM_ADDR_HI,
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  412  			upper_32_bits(smu_data->header_buffer.mc_addr),
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  413  			NULL);
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  414  	smum_send_msg_to_smc_with_parameter(hwmgr,
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  415  			PPSMC_MSG_DRV_DRAM_ADDR_LO,
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  416  			lower_32_bits(smu_data->header_buffer.mc_addr),
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  417  			NULL);
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  418  
a0ec225633d9f68 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Evan Quan     2020-03-27  419  	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_LoadUcodes, fw_to_load, NULL);
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  420  
5e161e5442a8a20 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-09-29  421  	r = smu7_check_fw_load_finish(hwmgr, fw_to_load);
7a3e0bb2a574284 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-10-10  422  	if (!r)
5e161e5442a8a20 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-09-29  423  		return 0;
7a3e0bb2a574284 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-10-10  424  
5e161e5442a8a20 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2018-09-29  425  	pr_err("SMU load firmware failed\n");
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  426  
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  427  failed:
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  428  	kfree(smu_data->toc);
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  429  	smu_data->toc = NULL;
d92867122cd9524 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Alex Deucher  2018-07-12  430  	return r;
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  431  }
1ff55f465103782 drivers/gpu/drm/amd/powerplay/smumgr/smu7_smumgr.c Rex Zhu       2016-08-19  432  

:::::: The code at line 408 was first introduced by commit
:::::: d92867122cd952485a4d209829bfa935689b14fe drm/amdgpu/pp/smu7: cache smu firmware toc

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--vkogqOf2sHV7VnPd
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--vkogqOf2sHV7VnPd--
