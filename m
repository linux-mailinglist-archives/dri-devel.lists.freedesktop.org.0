Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7068B46D06
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 14:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE27710E0F7;
	Sat,  6 Sep 2025 12:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4JJWU7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00F210E0F7
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757162983; x=1788698983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FGhroKiv+4xuX6AwZtAlp9mlzfwdRYEJPq+jCneMv/A=;
 b=B4JJWU7xlWtc1owIiHXujgshaIIK5llsRPAYeLntEYNiZIf+medQT6Ba
 /haP9OWfopExziDP3ry10/RU7slYVrhrexdhd0eSv98zwykouxuNkeiFf
 Feet80bcalooXSbeRs3w+3P+HP2sPlJMTWYkRQ5gwWPvejJkhsCEF47wI
 0wp0OB+ao3tJD/xPTqiWHFDyPobtWT4XP+g5j0e+TJcml21tYed3ZyEa3
 5Lce1AREVk8ma9QY2k8LI7WDEY/QqXHE2xRsmrmDCjlPpqZYEHRSF8xHt
 KypNAPcFg5qtDPoJEVMJj2WyTkgjYKW2kpiyfKpS29Bo5LeopOlD6cSs3 A==;
X-CSE-ConnectionGUID: Vqfj8aZnTQ6ieo4mVVGqGQ==
X-CSE-MsgGUID: C6F3se7vSYK4vG5hSBFDvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59563138"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; d="scan'208";a="59563138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2025 05:49:43 -0700
X-CSE-ConnectionGUID: bYM0iKV3TQW7Ok4R3aOEnw==
X-CSE-MsgGUID: GySrpnKUQ3a8jrCQrRq2WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; d="scan'208";a="171652643"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 06 Sep 2025 05:49:39 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uusMK-0001SJ-1J;
 Sat, 06 Sep 2025 12:49:36 +0000
Date: Sat, 6 Sep 2025 20:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 quic_vtanuku@quicinc.com
Subject: Re: [PATCH v7 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <202509062008.lSOdhd4U-lkp@intel.com>
References: <20250903073059.2151837-3-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903073059.2151837-3-quic_jseerapu@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyothi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on andi-shyti/i2c/i2c-host linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dmaengine-qcom-gpi-Add-GPI-Block-event-interrupt-support/20250903-153745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250903073059.2151837-3-quic_jseerapu%40quicinc.com
patch subject: [PATCH v7 2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250906/202509062008.lSOdhd4U-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062008.lSOdhd4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062008.lSOdhd4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-qcom-geni.c: In function 'geni_i2c_gpi_multi_desc_unmap':
>> drivers/i2c/busses/i2c-qcom-geni.c:576:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     576 |                                    NULL, (dma_addr_t)NULL);
         |                                          ^


vim +576 drivers/i2c/busses/i2c-qcom-geni.c

   555	
   556	/**
   557	 * geni_i2c_gpi_multi_desc_unmap() - Unmaps DMA buffers post multi message TX transfers
   558	 * @gi2c: I2C dev handle
   559	 * @msgs: Array of I2C  messages
   560	 * @peripheral: Pointer to gpi_i2c_config
   561	 */
   562	static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
   563						  struct gpi_i2c_config *peripheral)
   564	{
   565		u32 msg_xfer_cnt, wr_idx = 0;
   566		struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer = &gi2c->i2c_multi_desc_config;
   567	
   568		msg_xfer_cnt = gi2c->err ? tx_multi_xfer->msg_idx_cnt : tx_multi_xfer->irq_cnt;
   569	
   570		/* Unmap the processed DMA buffers based on the received interrupt count */
   571		for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
   572			wr_idx = tx_multi_xfer->unmap_msg_cnt;
   573			geni_i2c_gpi_unmap(gi2c, &msgs[wr_idx],
   574					   tx_multi_xfer->dma_buf[wr_idx],
   575					   tx_multi_xfer->dma_addr[wr_idx],
 > 576					   NULL, (dma_addr_t)NULL);
   577	
   578			if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs - 1) {
   579				kfree(tx_multi_xfer->dma_buf);
   580				kfree(tx_multi_xfer->dma_addr);
   581				break;
   582			}
   583		}
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
