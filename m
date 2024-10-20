Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393B9A51CA
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 02:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D41810E0CF;
	Sun, 20 Oct 2024 00:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvvXUVms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D43910E0CF
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 00:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729385534; x=1760921534;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3uYxzM5SuE6IVyoBJrbsh5T2akkOFk11lgtp5eoWzKY=;
 b=GvvXUVms/XnP4jU4mcWNqVWDDbN9kABi9olhWAwLQUb3qvD69RMP4seK
 NqgMYKQNj0oI/b2GMKJkc9sUWpE6afw1LR21S5PphFfE2panZpVgowv1/
 3xNcJQ41dspOIg+D8Gl38VVbw0y3ld+04vjB6Ht7AdqLUx81JHxmUeXhw
 9+p+fCxOscwGBZerNsuHtypxmUPvK35ak6Affhpu8VFzKHiU4bkBcQCeT
 9g1KsB91j/YhSIrnbbXNwWsST65nksMydTnsHIy4pwlT0RvjrpSdTYsFQ
 VIPOHsYrknPcC7rxBjokS0pwTBzGky78hAW0kJl/l3H7fJHVD3U9JtU1H w==;
X-CSE-ConnectionGUID: 5hBi/ZiLQ/GsJ9ptipenIQ==
X-CSE-MsgGUID: C8XLVzXZSuO1kldbuS+hSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="29020155"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="29020155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 17:52:13 -0700
X-CSE-ConnectionGUID: lZZ66clARgudNajTPAyeww==
X-CSE-MsgGUID: wSK3Je3WTXWPvwKdLYaS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="80010875"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 19 Oct 2024 17:52:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t2KAw-000Pin-1V;
 Sun, 20 Oct 2024 00:52:06 +0000
Date: Sun, 20 Oct 2024 08:52:03 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kenneth Hung <Kenneth.hung@ite.com.tw>,
 Pet Weng <Pet.Weng@ite.com.tw>, Hermes Wu <Hermes.wu@ite.com.tw>
Subject: Re: [PATCH v6 03/10] drm/bridge: it6505: add AUX operation for HDCP
 KSV list read
Message-ID: <202410200624.sr8sF1ya-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241020/202410200624.sr8sF1ya-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200624.sr8sF1ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200624.sr8sF1ya-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/ite-it6505.c: In function 'it6505_aux_operation':
>> drivers/gpu/drm/bridge/ite-it6505.c:1004:47: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    1004 |         it6505_write(it6505, REG_AUX_CMD_REQ, FIELD_GET(M_AUX_REQ_CMD, cmd));
         |                                               ^~~~~~~~~

Kconfig warnings: (for reference only)
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
