Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8739A497F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 00:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B8A10E9D5;
	Fri, 18 Oct 2024 22:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuJIVu+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2D410E9D5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729289532; x=1760825532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0XtmqpLUZK6CHPnXpNrQPuV6yXOdGyf7OW4bxutI7VE=;
 b=HuJIVu+5Ex8E80xSvqVxz3JBPzZrit2DAux7/siyP5MRWOco2QaUgT+4
 gsadXZBFWJK8MM7zLbKGzq3+hqBSj/LTmkmfVjofxy6r5tCcAmnc7QO8E
 rqKHQh22oPq9wdc2H1IDmJBCcGGy5fkIyXbbrOcUeS+JLvR2zYDPemU6R
 n56mDt7VCatHmBEt7Z4qewBUADeBF/8osTtyXzb3LbywTYE6ZjT4WxKR6
 wrbkAO+/+uBJnCUf72KIHGyTJOovX+EanfojomXrfG7adT6y9HsavrAgZ
 kgdDLHsHPFNXtMd1K+yUB22aBPQdFhiLHmOxRgweNvdhdrzzhcFf4DZ6R A==;
X-CSE-ConnectionGUID: mE5nsqI3T+GfUePkJ2P/EA==
X-CSE-MsgGUID: EpqWvbfeQ4+6/MaS9ufnFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46333459"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="46333459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 15:12:12 -0700
X-CSE-ConnectionGUID: 0kdYjyC2RhiYMqT/th150A==
X-CSE-MsgGUID: rCCxcZiaT2GXWyrVSPCw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="109813608"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 15:12:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t1vCV-000OM5-2U;
 Fri, 18 Oct 2024 22:12:03 +0000
Date: Sat, 19 Oct 2024 06:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <202410190549.hGAfByqg-lkp@intel.com>
References: <20241015120750.21217-6-quic_jseerapu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015120750.21217-6-quic_jseerapu@quicinc.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 55bcd2e0d04c1171d382badef1def1fd04ef66c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dt-bindings-dmaengine-qcom-gpi-Add-additional-arg-to-dma-cell-property/20241015-202637
base:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
patch link:    https://lore.kernel.org/r/20241015120750.21217-6-quic_jseerapu%40quicinc.com
patch subject: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190549.hGAfByqg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190549.hGAfByqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190549.hGAfByqg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-qcom-geni.c:562:8: error: incompatible pointer to integer conversion passing 'dma_addr_t *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t' (aka 'unsigned long long'); dereference with * [-Wint-conversion]
     562 |                                    tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    *
   drivers/i2c/busses/i2c-qcom-geni.c:519:36: note: passing argument to parameter 'tx_addr' here
     519 |                                void *tx_buf, dma_addr_t tx_addr,
         |                                                         ^
>> drivers/i2c/busses/i2c-qcom-geni.c:562:47: error: incompatible pointer to integer conversion passing 'void *' to parameter of type 'dma_addr_t' (aka 'unsigned long long') [-Wint-conversion]
     562 |                                    tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
         |                                                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:520:36: note: passing argument to parameter 'rx_addr' here
     520 |                                void *rx_buf, dma_addr_t rx_addr)
         |                                                         ^
>> drivers/i2c/busses/i2c-qcom-geni.c:586:7: error: incompatible pointer to integer conversion assigning to 'dma_addr_t' (aka 'unsigned long long') from 'dma_addr_t *' (aka 'unsigned long long *'); dereference with * [-Wint-conversion]
     586 |         addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                *
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +562 drivers/i2c/busses/i2c-qcom-geni.c

   532	
   533	/**
   534	 * gpi_i2c_multi_desc_unmap() - unmaps the buffers post multi message TX transfers
   535	 * @dev: pointer to the corresponding dev node
   536	 * @gi2c: i2c dev handle
   537	 * @msgs: i2c messages array
   538	 * @peripheral: pointer to the gpi_i2c_config
   539	 */
   540	static void gpi_i2c_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
   541					     struct gpi_i2c_config *peripheral)
   542	{
   543		u32 msg_xfer_cnt, wr_idx = 0;
   544		struct gpi_multi_xfer *tx_multi_xfer = &peripheral->multi_xfer;
   545	
   546		/*
   547		 * In error case, need to unmap all messages based on the msg_idx_cnt.
   548		 * Non-error case unmap all the processed messages.
   549		 */
   550		if (gi2c->err)
   551			msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
   552		else
   553			msg_xfer_cnt = tx_multi_xfer->irq_cnt * NUM_MSGS_PER_IRQ;
   554	
   555		/* Unmap the processed DMA buffers based on the received interrupt count */
   556		for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
   557			if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
   558				break;
   559			wr_idx = tx_multi_xfer->unmap_msg_cnt % QCOM_GPI_MAX_NUM_MSGS;
   560			geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
   561					   tx_multi_xfer->dma_buf[wr_idx],
 > 562					   tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
   563			tx_multi_xfer->freed_msg_cnt++;
   564		}
   565	}
   566	
   567	static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int cur_msg_idx,
   568				struct dma_slave_config *config, dma_addr_t *dma_addr_p,
   569				void **buf, unsigned int op, struct dma_chan *dma_chan)
   570	{
   571		struct gpi_i2c_config *peripheral;
   572		unsigned int flags;
   573		void *dma_buf;
   574		dma_addr_t addr;
   575		enum dma_data_direction map_dirn;
   576		enum dma_transfer_direction dma_dirn;
   577		struct dma_async_tx_descriptor *desc;
   578		int ret;
   579		struct gpi_multi_xfer *gi2c_gpi_xfer;
   580		dma_cookie_t cookie;
   581	
   582		peripheral = config->peripheral_config;
   583		gi2c_gpi_xfer = &peripheral->multi_xfer;
   584		gi2c_gpi_xfer->msg_idx_cnt = cur_msg_idx;
   585		dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
 > 586		addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
   587	
   588		dma_buf = i2c_get_dma_safe_msg_buf(&msgs[gi2c_gpi_xfer->msg_idx_cnt], 1);
   589		if (!dma_buf) {
   590			gi2c->err = -ENOMEM;
   591			return -ENOMEM;
   592		}
   593	
   594		if (op == I2C_WRITE)
   595			map_dirn = DMA_TO_DEVICE;
   596		else
   597			map_dirn = DMA_FROM_DEVICE;
   598	
   599		addr = dma_map_single(gi2c->se.dev->parent,
   600				      dma_buf, msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
   601				      map_dirn);
   602		if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
   603			i2c_put_dma_safe_msg_buf(dma_buf, &msgs[gi2c_gpi_xfer->msg_idx_cnt],
   604						 false);
   605			gi2c->err = -ENOMEM;
   606			return -ENOMEM;
   607		}
   608	
   609		if (gi2c->is_tx_multi_xfer) {
   610			if (((gi2c_gpi_xfer->msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
   611				peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
   612			else
   613				peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
   614	
   615			/* BEI bit to be cleared for last TRE */
   616			if (gi2c_gpi_xfer->msg_idx_cnt == gi2c->num_msgs - 1)
   617				peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
   618		}
   619	
   620		/* set the length as message for rx txn */
   621		peripheral->rx_len = msgs[gi2c_gpi_xfer->msg_idx_cnt].len;
   622		peripheral->op = op;
   623	
   624		ret = dmaengine_slave_config(dma_chan, config);
   625		if (ret) {
   626			dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
   627			goto err_config;
   628		}
   629	
   630		peripheral->set_config = 0;
   631		peripheral->multi_msg = true;
   632		flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
   633	
   634		if (op == I2C_WRITE)
   635			dma_dirn = DMA_MEM_TO_DEV;
   636		else
   637			dma_dirn = DMA_DEV_TO_MEM;
   638	
   639		desc = dmaengine_prep_slave_single(dma_chan, addr,
   640						   msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
   641						   dma_dirn, flags);
   642		if (!desc) {
   643			dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
   644			gi2c->err = -EIO;
   645			goto err_config;
   646		}
   647	
   648		desc->callback_result = i2c_gpi_cb_result;
   649		desc->callback_param = gi2c;
   650	
   651		if (!((msgs[cur_msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
   652			gi2c_gpi_xfer->msg_idx_cnt++;
   653			gi2c_gpi_xfer->buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
   654		}
   655		cookie = dmaengine_submit(desc);
   656		if (dma_submit_error(cookie)) {
   657			dev_err(gi2c->se.dev,
   658				"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
   659			return -EINVAL;
   660		}
   661	
   662		if (gi2c->is_tx_multi_xfer) {
   663			dma_async_issue_pending(gi2c->tx_c);
   664			if ((cur_msg_idx == (gi2c->num_msgs - 1)) ||
   665			    (gi2c_gpi_xfer->msg_idx_cnt >=
   666			     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
   667				ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,
   668							     gi2c->num_msgs, XFER_TIMEOUT,
   669							     &gi2c->done);
   670				if (ret) {
   671					dev_dbg(gi2c->se.dev,
   672						"I2C multi write msg transfer timeout: %d\n",
   673						ret);
   674					gi2c->err = -ETIMEDOUT;
   675					goto err_config;
   676				}
   677			}
   678		} else {
   679			/* Non multi descriptor message transfer */
   680			*buf = dma_buf;
   681			*dma_addr_p = addr;
   682		}
   683		return 0;
   684	
   685	err_config:
   686		dma_unmap_single(gi2c->se.dev->parent, addr,
   687				 msgs[cur_msg_idx].len, map_dirn);
   688		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[cur_msg_idx], false);
   689		return ret;
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
