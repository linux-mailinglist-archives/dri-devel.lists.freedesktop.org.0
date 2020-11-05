Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC72A7593
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 03:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F70F6E97A;
	Thu,  5 Nov 2020 02:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F6C6E97A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:35:45 +0000 (UTC)
IronPort-SDR: f+LpuhmHieLCObU8EUAeLHG3BDHnfM6cU3K68wz4ShPNqWNF/Z5gVuHfInxHBK4i5pefB4RjOP
 YNQl7tX2jgSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="156305924"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
 d="gz'50?scan'50,208,50";a="156305924"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 18:35:42 -0800
IronPort-SDR: YyJNWOFt3BxJCpmPGOuuvKSVMX/RLHmIv9baE2QAhdoDJGntRNdW8V573+neYBfnr2QxR9FBe6
 hUOdWoKU5bNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
 d="gz'50?scan'50,208,50";a="358277493"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2020 18:35:40 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kaV7j-0001BP-NC; Thu, 05 Nov 2020 02:35:39 +0000
Date: Thu, 5 Nov 2020 10:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 440/442]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:802:6: warning: no
 previous prototype for 'kgd_gfx_v9_get_cu_occupancy'
Message-ID: <202011051057.TE8OLPyF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   26803606c5d6137fb24d8ecec9b326a99f890c91
commit: 3fe0f6b91eba324db40436d61064ec8f00a080a3 [440/442] drm/amd/amdgpu: Enable arcturus devices to access the method kgd_gfx_v9_get_cu_occupancy that is already defined
config: x86_64-randconfig-a012-20201104 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        git remote add radeon-alex git://people.freedesktop.org/~agd5f/linux.git
        git fetch --no-tags radeon-alex amd-staging-drm-next
        git checkout 3fe0f6b91eba324db40436d61064ec8f00a080a3
        # save the attached .config to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:94:6: warning: no previous prototype for 'kgd_gfx_v9_program_sh_mem_settings' [-Wmissing-prototypes]
      94 | void kgd_gfx_v9_program_sh_mem_settings(struct kgd_dev *kgd, uint32_t vmid,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:111:5: warning: no previous prototype for 'kgd_gfx_v9_set_pasid_vmid_mapping' [-Wmissing-prototypes]
     111 | int kgd_gfx_v9_set_pasid_vmid_mapping(struct kgd_dev *kgd, unsigned int pasid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:172:5: warning: no previous prototype for 'kgd_gfx_v9_init_interrupts' [-Wmissing-prototypes]
     172 | int kgd_gfx_v9_init_interrupts(struct kgd_dev *kgd, uint32_t pipe_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:234:5: warning: no previous prototype for 'kgd_gfx_v9_hqd_load' [-Wmissing-prototypes]
     234 | int kgd_gfx_v9_hqd_load(struct kgd_dev *kgd, void *mqd, uint32_t pipe_id,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:314:5: warning: no previous prototype for 'kgd_gfx_v9_hiq_mqd_load' [-Wmissing-prototypes]
     314 | int kgd_gfx_v9_hiq_mqd_load(struct kgd_dev *kgd, void *mqd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:367:5: warning: no previous prototype for 'kgd_gfx_v9_hqd_dump' [-Wmissing-prototypes]
     367 | int kgd_gfx_v9_hqd_dump(struct kgd_dev *kgd,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:501:6: warning: no previous prototype for 'kgd_gfx_v9_hqd_is_occupied' [-Wmissing-prototypes]
     501 | bool kgd_gfx_v9_hqd_is_occupied(struct kgd_dev *kgd, uint64_t queue_address,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:542:5: warning: no previous prototype for 'kgd_gfx_v9_hqd_destroy' [-Wmissing-prototypes]
     542 | int kgd_gfx_v9_hqd_destroy(struct kgd_dev *kgd, void *mqd,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:632:6: warning: no previous prototype for 'kgd_gfx_v9_get_atc_vmid_pasid_mapping_info' [-Wmissing-prototypes]
     632 | bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:645:5: warning: no previous prototype for 'kgd_gfx_v9_address_watch_disable' [-Wmissing-prototypes]
     645 | int kgd_gfx_v9_address_watch_disable(struct kgd_dev *kgd)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:650:5: warning: no previous prototype for 'kgd_gfx_v9_address_watch_execute' [-Wmissing-prototypes]
     650 | int kgd_gfx_v9_address_watch_execute(struct kgd_dev *kgd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:659:5: warning: no previous prototype for 'kgd_gfx_v9_wave_control_execute' [-Wmissing-prototypes]
     659 | int kgd_gfx_v9_wave_control_execute(struct kgd_dev *kgd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:684:10: warning: no previous prototype for 'kgd_gfx_v9_address_watch_get_offset' [-Wmissing-prototypes]
     684 | uint32_t kgd_gfx_v9_address_watch_get_offset(struct kgd_dev *kgd,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:691:6: warning: no previous prototype for 'kgd_gfx_v9_set_vm_context_page_table_base' [-Wmissing-prototypes]
     691 | void kgd_gfx_v9_set_vm_context_page_table_base(struct kgd_dev *kgd,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:802:6: warning: no previous prototype for 'kgd_gfx_v9_get_cu_occupancy' [-Wmissing-prototypes]
     802 | void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c:22:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:76:32: warning: 'dc_fixpt_ln2_div_2' defined but not used [-Wunused-const-variable=]
      76 | static const struct fixed31_32 dc_fixpt_ln2_div_2 = { 1488522236LL };
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:75:32: warning: 'dc_fixpt_ln2' defined but not used [-Wunused-const-variable=]
      75 | static const struct fixed31_32 dc_fixpt_ln2 = { 2977044471LL };
         |                                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:74:32: warning: 'dc_fixpt_e' defined but not used [-Wunused-const-variable=]
      74 | static const struct fixed31_32 dc_fixpt_e = { 11674931555LL };
         |                                ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:73:32: warning: 'dc_fixpt_two_pi' defined but not used [-Wunused-const-variable=]
      73 | static const struct fixed31_32 dc_fixpt_two_pi = { 26986075409LL };
         |                                ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:72:32: warning: 'dc_fixpt_pi' defined but not used [-Wunused-const-variable=]
      72 | static const struct fixed31_32 dc_fixpt_pi = { 13493037705LL };
         |                                ^~~~~~~~~~~

vim +/kgd_gfx_v9_get_cu_occupancy +802 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c

   755	
   756	/**
   757	 * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
   758	 * shader engine and aggregates the number of waves that are in flight for the
   759	 * process whose pasid is provided as a parameter. The process could have ZERO
   760	 * or more queues running and submitting waves to compute units.
   761	 *
   762	 * @kgd: Handle of device from which to get number of waves in flight
   763	 * @pasid: Identifies the process for which this query call is invoked
   764	 * @wave_cnt: Output parameter updated with number of waves in flight that
   765	 * belong to process with given pasid
   766	 * @max_waves_per_cu: Output parameter updated with maximum number of waves
   767	 * possible per Compute Unit
   768	 *
   769	 * @note: It's possible that the device has too many queues (oversubscription)
   770	 * in which case a VMID could be remapped to a different PASID. This could lead
   771	 * to an iaccurate wave count. Following is a high-level sequence:
   772	 *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
   773	 *    Time T2: passId = getPasId(vmid); vmid is associated with Pasid P2
   774	 * In the sequence above wave count obtained from time T1 will be incorrectly
   775	 * lost or added to total wave count.
   776	 *
   777	 * The registers that provide the waves in flight are:
   778	 *
   779	 *  SPI_CSQ_WF_ACTIVE_STATUS - bit-map of queues per pipe. The bit is ON if a
   780	 *  queue is slotted, OFF if there is no queue. A process could have ZERO or
   781	 *  more queues slotted and submitting waves to be run on compute units. Even
   782	 *  when there is a queue it is possible there could be zero wave fronts, this
   783	 *  can happen when queue is waiting on top-of-pipe events - e.g. waitRegMem
   784	 *  command
   785	 *
   786	 *  For each bit that is ON from above:
   787	 *
   788	 *    Read (SPI_CSQ_WF_ACTIVE_COUNT_0 + queue_idx) register. It provides the
   789	 *    number of waves that are in flight for the queue at specified index. The
   790	 *    index ranges from 0 to 7.
   791	 *
   792	 *    If non-zero waves are in flight, read CP_HQD_VMID register to obtain VMID
   793	 *    of the wave(s).
   794	 *
   795	 *    Determine if VMID from above step maps to pasid provided as parameter. If
   796	 *    it matches agrregate the wave count. That the VMID will not match pasid is
   797	 *    a normal condition i.e. a device is expected to support multiple queues
   798	 *    from multiple proceses.
   799	 *
   800	 *  Reading registers referenced above involves programming GRBM appropriately
   801	 */
 > 802	void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
   803			int *pasid_wave_cnt, int *max_waves_per_cu)
   804	{
   805		int qidx;
   806		int vmid;
   807		int se_idx;
   808		int sh_idx;
   809		int se_cnt;
   810		int sh_cnt;
   811		int wave_cnt;
   812		int queue_map;
   813		int pasid_tmp;
   814		int max_queue_cnt;
   815		int vmid_wave_cnt = 0;
   816		struct amdgpu_device *adev;
   817		DECLARE_BITMAP(cp_queue_bitmap, KGD_MAX_QUEUES);
   818	
   819		adev = get_amdgpu_device(kgd);
   820		lock_spi_csq_mutexes(adev);
   821		soc15_grbm_select(adev, 1, 0, 0, 0);
   822	
   823		/*
   824		 * Iterate through the shader engines and arrays of the device
   825		 * to get number of waves in flight
   826		 */
   827		bitmap_complement(cp_queue_bitmap, adev->gfx.mec.queue_bitmap,
   828				  KGD_MAX_QUEUES);
   829		max_queue_cnt = adev->gfx.mec.num_pipe_per_mec *
   830				adev->gfx.mec.num_queue_per_pipe;
   831		sh_cnt = adev->gfx.config.max_sh_per_se;
   832		se_cnt = adev->gfx.config.max_shader_engines;
   833		for (se_idx = 0; se_idx < se_cnt; se_idx++) {
   834			for (sh_idx = 0; sh_idx < sh_cnt; sh_idx++) {
   835	
   836				gfx_v9_0_select_se_sh(adev, se_idx, sh_idx, 0xffffffff);
   837				queue_map = RREG32(SOC15_REG_OFFSET(GC, 0,
   838						   mmSPI_CSQ_WF_ACTIVE_STATUS));
   839	
   840				/*
   841				 * Assumption: queue map encodes following schema: four
   842				 * pipes per each micro-engine, with each pipe mapping
   843				 * eight queues. This schema is true for GFX9 devices
   844				 * and must be verified for newer device families
   845				 */
   846				for (qidx = 0; qidx < max_queue_cnt; qidx++) {
   847	
   848					/* Skip qeueus that are not associated with
   849					 * compute functions
   850					 */
   851					if (!test_bit(qidx, cp_queue_bitmap))
   852						continue;
   853	
   854					if (!(queue_map & (1 << qidx)))
   855						continue;
   856	
   857					/* Get number of waves in flight and aggregate them */
   858					get_wave_count(adev, qidx, &wave_cnt, &vmid);
   859					if (wave_cnt != 0) {
   860						pasid_tmp =
   861						  RREG32(SOC15_REG_OFFSET(OSSSYS, 0,
   862							 mmIH_VMID_0_LUT) + vmid);
   863						if (pasid_tmp == pasid)
   864							vmid_wave_cnt += wave_cnt;
   865					}
   866				}
   867			}
   868		}
   869	
   870		gfx_v9_0_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
   871		soc15_grbm_select(adev, 0, 0, 0, 0);
   872		unlock_spi_csq_mutexes(adev);
   873	
   874		/* Update the output parameters and return */
   875		*pasid_wave_cnt = vmid_wave_cnt;
   876		*max_waves_per_cu = adev->gfx.cu_info.simd_per_cu *
   877					adev->gfx.cu_info.max_waves_per_simd;
   878	}
   879	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--GvXjxJ+pjyke8COw
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--GvXjxJ+pjyke8COw--
