Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC69A51BD
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 01:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BBB10E370;
	Sat, 19 Oct 2024 23:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6r7uJlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AACE10E370
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 23:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729380670; x=1760916670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QJFaiLJx8wP1o0F9cMZ2/TiWHrNvfHJ/0KxFQ/SqVaw=;
 b=a6r7uJlC5Xp8sUTtebtDMoZUMvLdHPJHSmWZ1OROpjb5tfxwBYdOlh7X
 yNQF+lB4yYVykTE/aB4RqZEpD9pDLeLT9jXW8i/lbWxm6AW4IQKcJqGpQ
 bbiumYlOHG+D9ALCk979Hqfhm+G5p73UnBQp1tNj9GFaUMAKFYAmpH+AN
 6YWONOCifwcS8c+WHcw3v3+9gVzeCJp3P7RybG2w6FU7sonP9vs3Cuol8
 lKZ/1EjLgdBnhUkbQhJtToE5dTm3VDKk5NSuN0Fe6Dl+BppxwJP3DWHMs
 st0kq5Rf7CJ/IQDv1sSJHulvVYOHP4wdtAJg0/3Nl3oYKxdqb4W8iLIHG Q==;
X-CSE-ConnectionGUID: toZaXyLiQb+p6Dm7DVuOzw==
X-CSE-MsgGUID: kkoMFg+fSWqC6bNo6K8DZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29052603"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29052603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 16:31:09 -0700
X-CSE-ConnectionGUID: Ah9d7WF/Qw2YlxG1P2hU9Q==
X-CSE-MsgGUID: c6jHdY2PQMeFhMQQ9pJuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="79590031"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 19 Oct 2024 16:31:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t2IuU-000Pdl-0u;
 Sat, 19 Oct 2024 23:31:02 +0000
Date: Sun, 20 Oct 2024 07:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kenneth Hung <Kenneth.hung@ite.com.tw>,
 Pet Weng <Pet.Weng@ite.com.tw>, Hermes Wu <Hermes.wu@ite.com.tw>
Subject: Re: [PATCH v6 03/10] drm/bridge: it6505: add AUX operation for HDCP
 KSV list read
Message-ID: <202410200756.KlsPLE8A-lkp@intel.com>
References: <20241016-upstream-v6-v6-3-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-3-4d93a0c46de1@ite.com.tw>
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

Hi Hermes,

kernel test robot noticed the following build errors:

[auto build test ERROR on b8128f7815ff135f0333c1b46dcdf1543c41b860]

url:    https://github.com/intel-lab-lkp/linux/commits/Hermes-Wu-via-B4-Relay/drm-bridge-it6505-Change-definition-of-AUX_FIFO_MAX_SIZE/20241016-155607
base:   b8128f7815ff135f0333c1b46dcdf1543c41b860
patch link:    https://lore.kernel.org/r/20241016-upstream-v6-v6-3-4d93a0c46de1%40ite.com.tw
patch subject: [PATCH v6 03/10] drm/bridge: it6505: add AUX operation for HDCP KSV list read
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410200756.KlsPLE8A-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200756.KlsPLE8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200756.KlsPLE8A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/ite-it6505.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/bridge/ite-it6505.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/bridge/ite-it6505.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/bridge/ite-it6505.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/bridge/ite-it6505.c:1004:40: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1004 |         it6505_write(it6505, REG_AUX_CMD_REQ, FIELD_GET(M_AUX_REQ_CMD, cmd));
         |                                               ^
   7 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/FIELD_GET +1004 drivers/gpu/drm/bridge/ite-it6505.c

   956	
   957	static ssize_t it6505_aux_operation(struct it6505 *it6505,
   958					    enum aux_cmd_type cmd,
   959					    unsigned int address, u8 *buffer,
   960					    size_t size, enum aux_cmd_reply *reply)
   961	{
   962		int i, ret;
   963		bool aux_write_check = false;
   964	
   965		if (!it6505_get_sink_hpd_status(it6505))
   966			return -EIO;
   967	
   968		/* set AUX user mode */
   969		it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
   970	
   971	aux_op_start:
   972		/* HW AUX FIFO supports only EDID and DCPD KSV FIFO area */
   973		if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
   974			/* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
   975			size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
   976			/* Enable AUX FIFO read back and clear FIFO */
   977			it6505_set_bits(it6505, REG_AUX_CTRL,
   978					AUX_EN_FIFO_READ | CLR_EDID_FIFO,
   979					AUX_EN_FIFO_READ | CLR_EDID_FIFO);
   980	
   981			it6505_set_bits(it6505, REG_AUX_CTRL,
   982					AUX_EN_FIFO_READ | CLR_EDID_FIFO,
   983					AUX_EN_FIFO_READ);
   984		} else {
   985			/* The DP AUX transmit buffer has 4 bytes. */
   986			size = min_t(size_t, size, 4);
   987			it6505_set_bits(it6505, REG_AUX_CTRL, AUX_NO_SEGMENT_WR,
   988					AUX_NO_SEGMENT_WR);
   989		}
   990	
   991		/* Start Address[7:0] */
   992		it6505_write(it6505, REG_AUX_ADR_0_7, (address >> 0) & 0xFF);
   993		/* Start Address[15:8] */
   994		it6505_write(it6505, REG_AUX_ADR_8_15, (address >> 8) & 0xFF);
   995		/* WriteNum[3:0]+StartAdr[19:16] */
   996		it6505_write(it6505, REG_AUX_ADR_16_19,
   997			     ((address >> 16) & 0x0F) | ((size - 1) << 4));
   998	
   999		if (cmd == CMD_AUX_NATIVE_WRITE)
  1000			regmap_bulk_write(it6505->regmap, REG_AUX_OUT_DATA0, buffer,
  1001					  size);
  1002	
  1003		/* Aux Fire */
> 1004		it6505_write(it6505, REG_AUX_CMD_REQ, FIELD_GET(M_AUX_REQ_CMD, cmd));
  1005	
  1006		ret = it6505_aux_wait(it6505);
  1007		if (ret < 0)
  1008			goto aux_op_err;
  1009	
  1010		ret = it6505_read(it6505, REG_AUX_ERROR_STS);
  1011		if (ret < 0)
  1012			goto aux_op_err;
  1013	
  1014		switch ((ret >> 6) & 0x3) {
  1015		case 0:
  1016			*reply = REPLY_ACK;
  1017			break;
  1018		case 1:
  1019			*reply = REPLY_DEFER;
  1020			ret = -EAGAIN;
  1021			goto aux_op_err;
  1022		case 2:
  1023			*reply = REPLY_NACK;
  1024			ret = -EIO;
  1025			goto aux_op_err;
  1026		case 3:
  1027			ret = -ETIMEDOUT;
  1028			goto aux_op_err;
  1029		}
  1030	
  1031		/* Read back Native Write data */
  1032		if (cmd == CMD_AUX_NATIVE_WRITE) {
  1033			aux_write_check = true;
  1034			cmd = CMD_AUX_NATIVE_READ;
  1035			goto aux_op_start;
  1036		}
  1037	
  1038		if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
  1039			for (i = 0; i < size; i++) {
  1040				ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
  1041				if (ret < 0)
  1042					goto aux_op_err;
  1043				buffer[i] = ret;
  1044			}
  1045		} else {
  1046			for (i = 0; i < size; i++) {
  1047				ret = it6505_read(it6505, REG_AUX_DATA_0_7 + i);
  1048				if (ret < 0)
  1049					goto aux_op_err;
  1050	
  1051				if (aux_write_check && buffer[size - 1 - i] != ret) {
  1052					ret = -EINVAL;
  1053					goto aux_op_err;
  1054				}
  1055	
  1056				buffer[size - 1 - i] = ret;
  1057			}
  1058		}
  1059	
  1060		ret = i;
  1061	
  1062	aux_op_err:
  1063		if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
  1064			/* clear AUX FIFO */
  1065			it6505_set_bits(it6505, REG_AUX_CTRL,
  1066					AUX_EN_FIFO_READ | CLR_EDID_FIFO,
  1067					AUX_EN_FIFO_READ | CLR_EDID_FIFO);
  1068			it6505_set_bits(it6505, REG_AUX_CTRL,
  1069					AUX_EN_FIFO_READ | CLR_EDID_FIFO, 0x00);
  1070		}
  1071	
  1072		/* Leave AUX user mode */
  1073		it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, 0);
  1074	
  1075		return ret;
  1076	}
  1077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
