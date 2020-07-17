Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4622304E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 03:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416956E15F;
	Fri, 17 Jul 2020 01:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821B6E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 01:27:43 +0000 (UTC)
IronPort-SDR: 8o4tgFjkmnbqGhsUzTl6ZTZr84akRLktRHpgC8lrtPeTiz4supf1smH4jb4/YAGtb9iPEQ0DAh
 +j06EbMY7nPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="167655843"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
 d="gz'50?scan'50,208,50";a="167655843"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 18:27:42 -0700
IronPort-SDR: LF+N70pmi66Mp/JlvHHoM+vai6N0dymFzGD6bv64Kli7sPvV0KSgXWPD9EroXr1dYiTnQK9uVX
 uWiHRWQQSFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; 
 d="gz'50?scan'50,208,50";a="318619980"
Received: from lkp-server01.sh.intel.com (HELO 70d1600e1569) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2020 18:27:40 -0700
Received: from kbuild by 70d1600e1569 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jwFA4-0000GK-3P; Fri, 17 Jul 2020 01:27:40 +0000
Date: Fri, 17 Jul 2020 09:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Zhang <Jack.Zhang1@amd.com>
Subject: [radeon-alex:amd-staging-drm-next 1066/1110]
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1233:3: warning: variable
 'direct_poll' set but not used
Message-ID: <202007170954.9O7P4AwW%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
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
Cc: Leo Liu <leo.liu@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   cefd5db37208da458fa10f83f866f2f37eef70e9
commit: 4a33206e976be79b832d5a826565b5cb430de877 [1066/1110] drm/amd/sriov porting sriov cap to vcn3.0
config: parisc-randconfig-r015-20200717 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 4a33206e976be79b832d5a826565b5cb430de877
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:94,
                    from include/drm/drm_vma_manager.h:27,
                    from include/drm/drm_gem.h:40,
                    from include/drm/ttm/ttm_bo_api.h:34,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:53,
                    from drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:25:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      96 |   pte_t old_pte;     \
         |         ^~~~~~~
   arch/parisc/include/asm/pgtable.h:322:34: note: in expansion of macro 'set_pte_at'
     322 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:2: note: in expansion of macro 'pte_clear'
     201 |  pte_clear(mm, address, ptep);
         |  ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:96:9: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      96 |   pte_t old_pte;     \
         |         ^~~~~~~
   include/asm-generic/pgtable.h:640:2: note: in expansion of macro 'set_pte_at'
     640 |  set_pte_at(vma->vm_mm, addr, ptep, pte);
         |  ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c: In function 'vcn_v3_0_start_sriov':
>> drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1233:3: warning: variable 'direct_poll' set but not used [-Wunused-but-set-variable]
    1233 |   direct_poll = { {0} };
         |   ^~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:25:
   At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:192:19: warning: 'debug_evictions' defined but not used [-Wunused-const-variable=]
     192 | static const bool debug_evictions; /* = false */
         |                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu.h:191:18: warning: 'sched_policy' defined but not used [-Wunused-const-variable=]
     191 | static const int sched_policy = KFD_SCHED_POLICY_HWS;
         |                  ^~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:33,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:65,
                    from drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:25:
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
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:67:32: warning: 'dc_fixpt_zero' defined but not used [-Wunused-const-variable=]
      67 | static const struct fixed31_32 dc_fixpt_zero = { 0 };
         |                                ^~~~~~~~~~~~~

vim +/direct_poll +1233 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c

  1210	
  1211	static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
  1212	{
  1213		int i, j;
  1214		struct amdgpu_ring *ring;
  1215		uint64_t cache_addr;
  1216		uint64_t rb_addr;
  1217		uint64_t ctx_addr;
  1218		uint32_t param, resp, expected;
  1219		uint32_t offset, cache_size;
  1220		uint32_t tmp, timeout;
  1221		uint32_t id;
  1222	
  1223		struct amdgpu_mm_table *table = &adev->virt.mm_table;
  1224		uint32_t *table_loc;
  1225		uint32_t table_size;
  1226		uint32_t size, size_dw;
  1227	
  1228		struct mmsch_v3_0_cmd_direct_write
  1229			direct_wt = { {0} };
  1230		struct mmsch_v3_0_cmd_direct_read_modify_write
  1231			direct_rd_mod_wt = { {0} };
  1232		struct mmsch_v3_0_cmd_direct_polling
> 1233			direct_poll = { {0} };
  1234		struct mmsch_v3_0_cmd_end end = { {0} };
  1235		struct mmsch_v3_0_init_header header;
  1236	
  1237		direct_wt.cmd_header.command_type =
  1238			MMSCH_COMMAND__DIRECT_REG_WRITE;
  1239		direct_rd_mod_wt.cmd_header.command_type =
  1240			MMSCH_COMMAND__DIRECT_REG_READ_MODIFY_WRITE;
  1241		direct_poll.cmd_header.command_type =
  1242			MMSCH_COMMAND__DIRECT_REG_POLLING;
  1243		end.cmd_header.command_type =
  1244			MMSCH_COMMAND__END;
  1245	
  1246		header.version = MMSCH_VERSION;
  1247		header.total_size = sizeof(struct mmsch_v3_0_init_header) >> 2;
  1248		for (i = 0; i < AMDGPU_MAX_VCN_INSTANCES; i++) {
  1249			header.inst[i].init_status = 0;
  1250			header.inst[i].table_offset = 0;
  1251			header.inst[i].table_size = 0;
  1252		}
  1253	
  1254		table_loc = (uint32_t *)table->cpu_addr;
  1255		table_loc += header.total_size;
  1256		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
  1257			if (adev->vcn.harvest_config & (1 << i))
  1258				continue;
  1259	
  1260			table_size = 0;
  1261	
  1262			MMSCH_V3_0_INSERT_DIRECT_RD_MOD_WT(SOC15_REG_OFFSET(VCN, i,
  1263				mmUVD_STATUS),
  1264				~UVD_STATUS__UVD_BUSY, UVD_STATUS__UVD_BUSY);
  1265	
  1266			cache_size = AMDGPU_GPU_PAGE_ALIGN(adev->vcn.fw->size + 4);
  1267	
  1268			if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
  1269				id = amdgpu_ucode_id_vcns[i];
  1270				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1271					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
  1272					adev->firmware.ucode[id].tmr_mc_addr_lo);
  1273				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1274					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
  1275					adev->firmware.ucode[id].tmr_mc_addr_hi);
  1276				offset = 0;
  1277				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1278					mmUVD_VCPU_CACHE_OFFSET0),
  1279					0);
  1280			} else {
  1281				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1282					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
  1283					lower_32_bits(adev->vcn.inst[i].gpu_addr));
  1284				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1285					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
  1286					upper_32_bits(adev->vcn.inst[i].gpu_addr));
  1287				offset = cache_size;
  1288				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1289					mmUVD_VCPU_CACHE_OFFSET0),
  1290					AMDGPU_UVD_FIRMWARE_OFFSET >> 3);
  1291			}
  1292	
  1293			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1294				mmUVD_VCPU_CACHE_SIZE0),
  1295				cache_size);
  1296	
  1297			cache_addr = adev->vcn.inst[i].gpu_addr + offset;
  1298			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1299				mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
  1300				lower_32_bits(cache_addr));
  1301			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1302				mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH),
  1303				upper_32_bits(cache_addr));
  1304			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1305				mmUVD_VCPU_CACHE_OFFSET1),
  1306				0);
  1307			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1308				mmUVD_VCPU_CACHE_SIZE1),
  1309				AMDGPU_VCN_STACK_SIZE);
  1310	
  1311			cache_addr = adev->vcn.inst[i].gpu_addr + offset +
  1312				AMDGPU_VCN_STACK_SIZE;
  1313			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1314				mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW),
  1315				lower_32_bits(cache_addr));
  1316			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1317				mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH),
  1318				upper_32_bits(cache_addr));
  1319			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1320				mmUVD_VCPU_CACHE_OFFSET2),
  1321				0);
  1322			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1323				mmUVD_VCPU_CACHE_SIZE2),
  1324				AMDGPU_VCN_CONTEXT_SIZE);
  1325	
  1326			for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
  1327				ring = &adev->vcn.inst[i].ring_enc[j];
  1328				ring->wptr = 0;
  1329				rb_addr = ring->gpu_addr;
  1330				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1331					mmUVD_RB_BASE_LO),
  1332					lower_32_bits(rb_addr));
  1333				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1334					mmUVD_RB_BASE_HI),
  1335					upper_32_bits(rb_addr));
  1336				MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1337					mmUVD_RB_SIZE),
  1338					ring->ring_size / 4);
  1339			}
  1340	
  1341			ring = &adev->vcn.inst[i].ring_dec;
  1342			ring->wptr = 0;
  1343			rb_addr = ring->gpu_addr;
  1344			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1345				mmUVD_LMI_RBC_RB_64BIT_BAR_LOW),
  1346				lower_32_bits(rb_addr));
  1347			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1348				mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH),
  1349				upper_32_bits(rb_addr));
  1350			/* force RBC into idle state */
  1351			tmp = order_base_2(ring->ring_size);
  1352			tmp = REG_SET_FIELD(0, UVD_RBC_RB_CNTL, RB_BUFSZ, tmp);
  1353			tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_BLKSZ, 1);
  1354			tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_FETCH, 1);
  1355			tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_UPDATE, 1);
  1356			tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_RPTR_WR_EN, 1);
  1357			MMSCH_V3_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCN, i,
  1358				mmUVD_RBC_RB_CNTL),
  1359				tmp);
  1360	
  1361			/* add end packet */
  1362			MMSCH_V3_0_INSERT_END();
  1363	
  1364			/* refine header */
  1365			header.inst[i].init_status = 1;
  1366			header.inst[i].table_offset = header.total_size;
  1367			header.inst[i].table_size = table_size;
  1368			header.total_size += table_size;
  1369		}
  1370	
  1371		/* Update init table header in memory */
  1372	        size = sizeof(struct mmsch_v3_0_init_header);
  1373		table_loc = (uint32_t *)table->cpu_addr;
  1374		memcpy((void *)table_loc, &header, size);
  1375	
  1376		/* message MMSCH (in VCN[0]) to initialize this client
  1377		 * 1, write to mmsch_vf_ctx_addr_lo/hi register with GPU mc addr
  1378		 * of memory descriptor location
  1379		 */
  1380		ctx_addr = table->gpu_addr;
  1381		WREG32_SOC15(VCN, 0, mmMMSCH_VF_CTX_ADDR_LO, lower_32_bits(ctx_addr));
  1382		WREG32_SOC15(VCN, 0, mmMMSCH_VF_CTX_ADDR_HI, upper_32_bits(ctx_addr));
  1383	
  1384		/* 2, update vmid of descriptor */
  1385		tmp = RREG32_SOC15(VCN, 0, mmMMSCH_VF_VMID);
  1386		tmp &= ~MMSCH_VF_VMID__VF_CTX_VMID_MASK;
  1387		/* use domain0 for MM scheduler */
  1388		tmp |= (0 << MMSCH_VF_VMID__VF_CTX_VMID__SHIFT);
  1389		WREG32_SOC15(VCN, 0, mmMMSCH_VF_VMID, tmp);
  1390	
  1391		/* 3, notify mmsch about the size of this descriptor */
  1392		size = header.total_size;
  1393		WREG32_SOC15(VCN, 0, mmMMSCH_VF_CTX_SIZE, size);
  1394	
  1395		/* 4, set resp to zero */
  1396		WREG32_SOC15(VCN, 0, mmMMSCH_VF_MAILBOX_RESP, 0);
  1397	
  1398		/* 5, kick off the initialization and wait until
  1399		 * MMSCH_VF_MAILBOX_RESP becomes non-zero
  1400		 */
  1401		param = 0x10000001;
  1402		WREG32_SOC15(VCN, 0, mmMMSCH_VF_MAILBOX_HOST, param);
  1403		tmp = 0;
  1404		timeout = 1000;
  1405		resp = 0;
  1406		expected = param + 1;
  1407		while (resp != expected) {
  1408			resp = RREG32_SOC15(VCN, 0, mmMMSCH_VF_MAILBOX_RESP);
  1409			if (resp == expected)
  1410				break;
  1411	
  1412			udelay(10);
  1413			tmp = tmp + 10;
  1414			if (tmp >= timeout) {
  1415				DRM_ERROR("failed to init MMSCH. TIME-OUT after %d usec"\
  1416					" waiting for mmMMSCH_VF_MAILBOX_RESP "\
  1417					"(expected=0x%08x, readback=0x%08x)\n",
  1418					tmp, expected, resp);
  1419				return -EBUSY;
  1420			}
  1421		}
  1422	
  1423		return 0;
  1424	}
  1425	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--LZvS9be/3tNcYl/X
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
8T9tQ69ShoMBAA==

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--LZvS9be/3tNcYl/X--
