Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2645256909
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 18:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882316E202;
	Sat, 29 Aug 2020 16:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCBB6E1FB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 16:27:46 +0000 (UTC)
IronPort-SDR: ZemK0QxcLArnshY1Qykw8R7ah7By0Kz1ISxDmOFzc+WFxJZkAGflFeLF2R6HSUKWvjBU6PyA4T
 9hIKMO9wuehQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9728"; a="156070847"
X-IronPort-AV: E=Sophos;i="5.76,368,1592895600"; 
 d="gz'50?scan'50,208,50";a="156070847"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2020 09:27:45 -0700
IronPort-SDR: Dwx+C2cvOWJHy/592pD5DduIwolrFknsb8NhFLVlW6GzJcGixjmGTeDhqJwvartcUkNHnbigY2
 VAz3aM1AXNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,368,1592895600"; 
 d="gz'50?scan'50,208,50";a="324405553"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2020 09:27:43 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kC3hf-0000XS-3p; Sat, 29 Aug 2020 16:27:43 +0000
Date: Sun, 30 Aug 2020 00:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Quan <evan.quan@amd.com>
Subject: [radeon-alex:drm-next 473/599]
 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:9:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202008300051.wUFsC6e7%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Q68bSM7Ycu6FN28Q"
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


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git drm-next
head:   b8bccd965ee3a8e17af971e55ec8df9e425dec5c
commit: e098bc9612c2b60f94920461d71c92962a916e73 [473/599] drm/amd/pm: optimize the power related source code layout
config: arm-randconfig-s031-20200829 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        git checkout e098bc9612c2b60f94920461d71c92962a916e73
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *to @@     got void *kaddr @@
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:9: sparse:     expected void volatile [noderef] __iomem *to
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:408:9: sparse:     got void *kaddr

git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
git fetch --no-tags radeon-alex drm-next
git checkout e098bc9612c2b60f94920461d71c92962a916e73
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

--Q68bSM7Ycu6FN28Q
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--Q68bSM7Ycu6FN28Q--
