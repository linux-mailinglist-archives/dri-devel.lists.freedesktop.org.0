Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AFD7FF316
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBAA10E04A;
	Thu, 30 Nov 2023 14:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566910E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701356363; x=1732892363;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=lxrSAElFzs7yodrjs4Cn6Lua8wvKfuFbqpxl6fAPlSY=;
 b=ax57AECOlDA6g6DkpapjTqHRD+xDqMef/+GlXJxLGsXuiF4bJhBANkno
 0ljQz/hLsyIlRA4FcXgZDheAj7V+4eKrrmb2UjHjWIHAyM/8beALWIftH
 bVwyKi+hkjdv28a1Bu3PIet65w1ZXbNyu+qPjfk2O+x/fXZIS8nEBaZOn
 hCp2JXhmukSGZCrYtzifo3KWWU6BKHXE2DukXezjPun0ba4zdaihlw40p
 /DwZ6+Q52qlqKaiXCpPXjDQ0xVkBzTeRunuj4gjagMPjCktdl4t6aD0j8
 zcAm4xDfW9oGGW3YawkokpXTiDvARt7WNL2f353xyjt3zWShRiVUmYw6/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393075924"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393075924"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 06:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913227430"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913227430"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2023 06:59:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r8iVZ-000292-39;
 Thu, 30 Nov 2023 14:59:18 +0000
Date: Thu, 30 Nov 2023 22:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Subject: [drm-misc:for-linux-next-fixes 1/2]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function
 parameter or member 'priv' not described in 'r535_gsp_msg_run_cpu_sequencer'
Message-ID: <202311302252.rJ0uF9t0-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   64111a0e22a9d4e0de7a5d04e7d5c21d0af4b900
commit: 88a2b4d34a64bba914c4e245c6de3ca42bea93cf [1/2] nouveau/gsp: document some aspects of GSP-RM
config: arm64-randconfig-001-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302252.rJ0uF9t0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302252.rJ0uF9t0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302252.rJ0uF9t0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function parameter or member 'priv' not described in 'r535_gsp_msg_run_cpu_sequencer'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function parameter or member 'fn' not described in 'r535_gsp_msg_run_cpu_sequencer'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function parameter or member 'repv' not described in 'r535_gsp_msg_run_cpu_sequencer'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1389: warning: Function parameter or member 'repc' not described in 'r535_gsp_msg_run_cpu_sequencer'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1783: warning: Function parameter or member 'gsp' not described in 'r535_gsp_libos_init'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1923: warning: Function parameter or member 'device' not described in 'nvkm_gsp_radix3_sg'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1923: warning: Function parameter or member 'sgt' not described in 'nvkm_gsp_radix3_sg'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1923: warning: Function parameter or member 'size' not described in 'nvkm_gsp_radix3_sg'
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1923: warning: Function parameter or member 'rx3' not described in 'nvkm_gsp_radix3_sg'


vim +1389 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

9e99444490238d2 Ben Skeggs 2023-09-19  1379  
88a2b4d34a64bba Timur Tabi 2023-11-22  1380  /**
88a2b4d34a64bba Timur Tabi 2023-11-22  1381   * r535_gsp_msg_run_cpu_sequencer() -- process I/O commands from the GSP
88a2b4d34a64bba Timur Tabi 2023-11-22  1382   *
88a2b4d34a64bba Timur Tabi 2023-11-22  1383   * The GSP sequencer is a list of I/O commands that the GSP can send to
88a2b4d34a64bba Timur Tabi 2023-11-22  1384   * the driver to perform for various purposes.  The most common usage is to
88a2b4d34a64bba Timur Tabi 2023-11-22  1385   * perform a special mid-initialization reset.
88a2b4d34a64bba Timur Tabi 2023-11-22  1386   */
176fdcbddfd2884 Ben Skeggs 2023-09-19  1387  static int
176fdcbddfd2884 Ben Skeggs 2023-09-19  1388  r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
176fdcbddfd2884 Ben Skeggs 2023-09-19 @1389  {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1390  	struct nvkm_gsp *gsp = priv;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1391  	struct nvkm_subdev *subdev = &gsp->subdev;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1392  	struct nvkm_device *device = subdev->device;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1393  	rpc_run_cpu_sequencer_v17_00 *seq = repv;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1394  	int ptr = 0, ret;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1395  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1396  	nvkm_debug(subdev, "seq: %08x %08x\n", seq->bufferSizeDWord, seq->cmdIndex);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1397  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1398  	while (ptr < seq->cmdIndex) {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1399  		GSP_SEQUENCER_BUFFER_CMD *cmd = (void *)&seq->commandBuffer[ptr];
176fdcbddfd2884 Ben Skeggs 2023-09-19  1400  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1401  		ptr += 1;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1402  		ptr += GSP_SEQUENCER_PAYLOAD_SIZE_DWORDS(cmd->opCode);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1403  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1404  		switch (cmd->opCode) {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1405  		case GSP_SEQ_BUF_OPCODE_REG_WRITE: {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1406  			u32 addr = cmd->payload.regWrite.addr;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1407  			u32 data = cmd->payload.regWrite.val;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1408  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1409  			nvkm_trace(subdev, "seq wr32 %06x %08x\n", addr, data);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1410  			nvkm_wr32(device, addr, data);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1411  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1412  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1413  		case GSP_SEQ_BUF_OPCODE_REG_MODIFY: {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1414  			u32 addr = cmd->payload.regModify.addr;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1415  			u32 mask = cmd->payload.regModify.mask;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1416  			u32 data = cmd->payload.regModify.val;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1417  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1418  			nvkm_trace(subdev, "seq mask %06x %08x %08x\n", addr, mask, data);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1419  			nvkm_mask(device, addr, mask, data);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1420  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1421  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1422  		case GSP_SEQ_BUF_OPCODE_REG_POLL: {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1423  			u32 addr = cmd->payload.regPoll.addr;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1424  			u32 mask = cmd->payload.regPoll.mask;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1425  			u32 data = cmd->payload.regPoll.val;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1426  			u32 usec = cmd->payload.regPoll.timeout ?: 4000000;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1427  			//u32 error = cmd->payload.regPoll.error;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1428  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1429  			nvkm_trace(subdev, "seq poll %06x %08x %08x %d\n", addr, mask, data, usec);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1430  			nvkm_rd32(device, addr);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1431  			nvkm_usec(device, usec,
176fdcbddfd2884 Ben Skeggs 2023-09-19  1432  				if ((nvkm_rd32(device, addr) & mask) == data)
176fdcbddfd2884 Ben Skeggs 2023-09-19  1433  					break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1434  			);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1435  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1436  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1437  		case GSP_SEQ_BUF_OPCODE_DELAY_US: {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1438  			u32 usec = cmd->payload.delayUs.val;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1439  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1440  			nvkm_trace(subdev, "seq usec %d\n", usec);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1441  			udelay(usec);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1442  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1443  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1444  		case GSP_SEQ_BUF_OPCODE_REG_STORE: {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1445  			u32 addr = cmd->payload.regStore.addr;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1446  			u32 slot = cmd->payload.regStore.index;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1447  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1448  			seq->regSaveArea[slot] = nvkm_rd32(device, addr);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1449  			nvkm_trace(subdev, "seq save %08x -> %d: %08x\n", addr, slot,
176fdcbddfd2884 Ben Skeggs 2023-09-19  1450  				   seq->regSaveArea[slot]);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1451  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1452  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1453  		case GSP_SEQ_BUF_OPCODE_CORE_RESET:
176fdcbddfd2884 Ben Skeggs 2023-09-19  1454  			nvkm_trace(subdev, "seq core reset\n");
176fdcbddfd2884 Ben Skeggs 2023-09-19  1455  			nvkm_falcon_reset(&gsp->falcon);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1456  			nvkm_falcon_mask(&gsp->falcon, 0x624, 0x00000080, 0x00000080);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1457  			nvkm_falcon_wr32(&gsp->falcon, 0x10c, 0x00000000);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1458  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1459  		case GSP_SEQ_BUF_OPCODE_CORE_START:
176fdcbddfd2884 Ben Skeggs 2023-09-19  1460  			nvkm_trace(subdev, "seq core start\n");
176fdcbddfd2884 Ben Skeggs 2023-09-19  1461  			if (nvkm_falcon_rd32(&gsp->falcon, 0x100) & 0x00000040)
176fdcbddfd2884 Ben Skeggs 2023-09-19  1462  				nvkm_falcon_wr32(&gsp->falcon, 0x130, 0x00000002);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1463  			else
176fdcbddfd2884 Ben Skeggs 2023-09-19  1464  				nvkm_falcon_wr32(&gsp->falcon, 0x100, 0x00000002);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1465  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1466  		case GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT:
176fdcbddfd2884 Ben Skeggs 2023-09-19  1467  			nvkm_trace(subdev, "seq core wait halt\n");
176fdcbddfd2884 Ben Skeggs 2023-09-19  1468  			nvkm_msec(device, 2000,
176fdcbddfd2884 Ben Skeggs 2023-09-19  1469  				if (nvkm_falcon_rd32(&gsp->falcon, 0x100) & 0x00000010)
176fdcbddfd2884 Ben Skeggs 2023-09-19  1470  					break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1471  			);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1472  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1473  		case GSP_SEQ_BUF_OPCODE_CORE_RESUME: {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1474  			struct nvkm_sec2 *sec2 = device->sec2;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1475  			u32 mbox0;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1476  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1477  			nvkm_trace(subdev, "seq core resume\n");
176fdcbddfd2884 Ben Skeggs 2023-09-19  1478  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1479  			ret = gsp->func->reset(gsp);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1480  			if (WARN_ON(ret))
176fdcbddfd2884 Ben Skeggs 2023-09-19  1481  				return ret;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1482  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1483  			nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
176fdcbddfd2884 Ben Skeggs 2023-09-19  1484  			nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
176fdcbddfd2884 Ben Skeggs 2023-09-19  1485  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1486  			nvkm_falcon_start(&sec2->falcon);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1487  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1488  			if (nvkm_msec(device, 2000,
176fdcbddfd2884 Ben Skeggs 2023-09-19  1489  				if (nvkm_rd32(device, 0x1180f8) & 0x04000000)
176fdcbddfd2884 Ben Skeggs 2023-09-19  1490  					break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1491  			) < 0)
176fdcbddfd2884 Ben Skeggs 2023-09-19  1492  				return -ETIMEDOUT;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1493  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1494  			mbox0 = nvkm_falcon_rd32(&sec2->falcon, 0x040);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1495  			if (WARN_ON(mbox0)) {
176fdcbddfd2884 Ben Skeggs 2023-09-19  1496  				nvkm_error(&gsp->subdev, "seq core resume sec2: 0x%x\n", mbox0);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1497  				return -EIO;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1498  			}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1499  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1500  			nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1501  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1502  			if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
176fdcbddfd2884 Ben Skeggs 2023-09-19  1503  				return -EIO;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1504  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1505  			break;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1506  		default:
176fdcbddfd2884 Ben Skeggs 2023-09-19  1507  			nvkm_error(subdev, "unknown sequencer opcode %08x\n", cmd->opCode);
176fdcbddfd2884 Ben Skeggs 2023-09-19  1508  			return -EINVAL;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1509  		}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1510  	}
176fdcbddfd2884 Ben Skeggs 2023-09-19  1511  
176fdcbddfd2884 Ben Skeggs 2023-09-19  1512  	return 0;
176fdcbddfd2884 Ben Skeggs 2023-09-19  1513  }
176fdcbddfd2884 Ben Skeggs 2023-09-19  1514  

:::::: The code at line 1389 was first introduced by commit
:::::: 176fdcbddfd288408ce8571c1760ad618d962096 drm/nouveau/gsp/r535: add support for booting GSP-RM

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
