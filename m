Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D6849F5B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 17:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6710FABA;
	Mon,  5 Feb 2024 16:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G80gCspb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437910FABA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707149858; x=1738685858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DNaO54IRI7/2oh1XNOcunI96AdtlbD9Mn82BtlCzBqA=;
 b=G80gCspbt9uKgjTP7Y7pByLBqPLXWGCeKAZXLE8QKO0D+KsUi2p73TYC
 rS1eXsJ721mRBZIAEHMTtX+ZNOZCkAsmcb6NknDZfUf/nViARCzgUAArn
 P8UQVJwjuZFhZM+RhaEhUGRM2Pp8j6OmrlH1LLJA/lwT5o6NYOh5YT3N4
 RQQtoKM/T5Cg9alfX/lDNDKQQLlqm7irFziFSvhpRFkuR1AZz/gLm/9ZN
 B4F+Gel21Nk+s74QBbGU/+1thXtCbbSB1d581Jq5kBENacbBQIL3ZOYX5
 knYpwC3d2md+30n0aVYbMp2f7JDxVAoE/o+E/FS5WLjnXL12vHCxVl/Cc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="23033454"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="23033454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 08:17:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="24003295"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 05 Feb 2024 08:17:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rX1f0-0000dm-3A;
 Mon, 05 Feb 2024 16:17:30 +0000
Date: Tue, 6 Feb 2024 00:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: "mac.shen" <mac.shen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, mac.shen@mediatek.com,
 shuijing.li@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] Subject: [PATCH] drm/mediatek/dp: Add tee client
 application for HDCP feature
Message-ID: <202402052342.Y5awT1T2-lkp@intel.com>
References: <20240205055055.25340-2-mac.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205055055.25340-2-mac.shen@mediatek.com>
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

Hi mac.shen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on pza/reset/next linus/master v6.8-rc3 next-20240205]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mac-shen/Subject-PATCH-drm-mediatek-dp-Add-tee-client-application-for-HDCP-feature/20240205-163727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240205055055.25340-2-mac.shen%40mediatek.com
patch subject: [PATCH v2 1/3] Subject: [PATCH] drm/mediatek/dp: Add tee client application for HDCP feature
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240205/202402052342.Y5awT1T2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402052342.Y5awT1T2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402052342.Y5awT1T2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:34: warning: Function parameter or struct member 'dp_tee_priv' not described in 'dp_tee_op_send'
>> drivers/gpu/drm/mediatek/tlc_dp_hdcp.c:34: warning: Function parameter or struct member 'cmd_id' not described in 'dp_tee_op_send'


vim +34 drivers/gpu/drm/mediatek/tlc_dp_hdcp.c

    13	
    14	/*
    15	 * TA_FTPM_UUID: 99975014-3c7c-54ea-8487-a80d215ea92c
    16	 *
    17	 * Randomly generated, and must correspond to the GUID on the TA side.
    18	 * Defined here in the reference implementation:
    19	 * https://github.com/microsoft/ms-tpm-20-ref/blob/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/include/fTPM.h#L42
    20	 */
    21	static const uuid_t dp_ta_uuid =
    22		UUID_INIT(0x99975014, 0x3c7c, 0x54ea,
    23			  0x84, 0x87, 0xa8, 0x0d, 0x21, 0x5e, 0xa9, 0x2c);
    24	
    25	/**
    26	 * dp_tee_op_send() - send dp commands through the TEE shared memory.
    27	 * @len:	the number of bytes to send.
    28	 *
    29	 * Return:
    30	 *	In case of success, returns 0.
    31	 *	On failure, -errno
    32	 */
    33	static int dp_tee_op_send(struct dp_tee_private *dp_tee_priv, size_t len, u32 cmd_id)
  > 34	{
    35		int rc;
    36		u8 *temp_buf;
    37		struct tee_ioctl_invoke_arg transceive_args;
    38		struct tee_param command_params[4];
    39		struct tee_shm *shm = dp_tee_priv->shm;
    40	
    41		if (len > MAX_COMMAND_SIZE) {
    42			TLCERR("%s: len=%zd exceeds MAX_COMMAND_SIZE supported by dp TA\n", __func__, len);
    43			return -EIO;
    44		}
    45	
    46		memset(&transceive_args, 0, sizeof(transceive_args));
    47		memset(command_params, 0, sizeof(command_params));
    48		dp_tee_priv->resp_len = 0;
    49	
    50		/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of dp TA */
    51		transceive_args = (struct tee_ioctl_invoke_arg) {
    52			.func = cmd_id,
    53			.session = dp_tee_priv->session,
    54			.num_params = 4,
    55		};
    56	
    57		/* Fill FTPM_OPTEE_TA_SUBMIT_COMMAND parameters */
    58		command_params[0] = (struct tee_param) {
    59			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
    60			.u.memref = {
    61				.shm = shm,
    62				.size = len,
    63				.shm_offs = 0,
    64			},
    65		};
    66	
    67		command_params[1] = (struct tee_param) {
    68			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
    69			.u.memref = {
    70				.shm = shm,
    71				.size = MAX_RESPONSE_SIZE,
    72				.shm_offs = MAX_COMMAND_SIZE,
    73			},
    74		};
    75	
    76		rc = tee_client_invoke_func(dp_tee_priv->ctx, &transceive_args, command_params);
    77		if (rc < 0 || transceive_args.ret != 0) {
    78			TLCERR("%s: invoke error: 0x%x\n", __func__, transceive_args.ret);
    79			return (rc < 0) ? rc : transceive_args.ret;
    80		}
    81	
    82		temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
    83		if (IS_ERR(temp_buf)) {
    84			TLCERR("%s: tee_shm_get_va failed for receive\n", __func__);
    85			return PTR_ERR(temp_buf);
    86		}
    87	
    88		/* Sanity checks look good, cache the response */
    89		memcpy(dp_tee_priv->resp_buf, temp_buf, MAX_RESPONSE_SIZE / 2);
    90		dp_tee_priv->resp_len = MAX_RESPONSE_SIZE / 2;
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
