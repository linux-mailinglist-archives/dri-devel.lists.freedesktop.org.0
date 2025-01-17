Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B138A15508
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E49510EB42;
	Fri, 17 Jan 2025 16:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndsUG2yh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC7710EB42
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737132916; x=1768668916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J3sBxPVGs95RnNwmbCpIngBPBDIjhtL9gamaBrIlh1I=;
 b=ndsUG2yhCcS8IQDxgcCENN4IEVF4j9kLQndyjRacaH5/YZU6YfaaNqzI
 lYhQPBGR0SQDiHm2b4weTgWmkdRwGVmbVLb6cT+TGWizWAzSjVGkyQa1f
 D/MtZoO3ATpxKpreGVlVWMZpWwK5lE1pplrWTRayzgXmywr3s9khBl2DZ
 bm0cIzhB2ImeSSgGNr8KWjdp6YkFpUh/QoB7oSdW4kasEB/rjZPAlp9G3
 YYJqRYdWF6imVxcrqhG3Tr18SPKOmyP4DfUud0R0kYhDqPRBw/nNed3A+
 S0gBCHj4GEQWIeql2GCGZ6M+SlRfwhR1uhbvrtpgPZ3tG/Ryxv+OCXhft A==;
X-CSE-ConnectionGUID: 4Z5OtyxoQOyiVrjyDkOeTA==
X-CSE-MsgGUID: tzk7AP92Tlqu7UGaA0BPag==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48061897"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="48061897"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 08:55:16 -0800
X-CSE-ConnectionGUID: F3YXPKlSSO6lI8H448/XNQ==
X-CSE-MsgGUID: 5Nda3dfRQzKiK1N5GsXV8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110853008"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 08:55:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tYpcg-000TU3-2k;
 Fri, 17 Jan 2025 16:55:06 +0000
Date: Sat, 18 Jan 2025 00:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org,
 lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
 tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <202501180052.uSAwTJA8-lkp@intel.com>
References: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113145232.227674-33-angelogioacchino.delregno@collabora.com>
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250113]
[cannot apply to robh/for-next pza/reset/next linus/master pza/imx-drm/next drm-misc/drm-misc-next v6.13-rc7 v6.13-rc6 v6.13-rc5 v6.13-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Add-MT8195-and-MT8188-compat/20250113-225554
base:   next-20250113
patch link:    https://lore.kernel.org/r/20250113145232.227674-33-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v5 32/34] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501180052.uSAwTJA8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180052.uSAwTJA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180052.uSAwTJA8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c: In function 'mtk_hdmi_v2_aud_output_channel_map':
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:345:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     345 |         val = FIELD_PREP(SD0_MAP, sd0) | FIELD_PREP(SD1_MAP, sd1);
         |               ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c: In function 'mtk_hdmi_v2_hpd_pord_status':
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:812:23: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     812 |         hpd_pin_sta = FIELD_GET(HPD_PIN_STA, hpd_status);
         |                       ^~~~~~~~~
--
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddc_check_and_rise_low_bus':
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:59:36: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      59 |                                    FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
         |                                    ^~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddcm_read_hdmi':
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:207:47: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     207 |                         puc_value[read_idx] = FIELD_GET(DDC_DATA_OUT, val);
         |                                               ^~~~~~~~~


vim +/FIELD_PREP +345 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

   333	
   334	static u32 mtk_hdmi_v2_aud_output_channel_map(u8 sd0, u8 sd1, u8 sd2, u8 sd3,
   335						      u8 sd4, u8 sd5, u8 sd6, u8 sd7)
   336	{
   337		u32 val;
   338	
   339		/*
   340		 * Each of the Output Channels (0-7) can be mapped to get their input
   341		 * from any of the available Input Channels (0-7): this function
   342		 * takes input channel numbers and formats a value that must then
   343		 * be written to the TOP_AUD_MAP hardware register by the caller.
   344		 */
 > 345		val = FIELD_PREP(SD0_MAP, sd0) | FIELD_PREP(SD1_MAP, sd1);
   346		val |= FIELD_PREP(SD2_MAP, sd2) | FIELD_PREP(SD3_MAP, sd3);
   347		val |= FIELD_PREP(SD4_MAP, sd4) | FIELD_PREP(SD5_MAP, sd5);
   348		val |= FIELD_PREP(SD6_MAP, sd6) | FIELD_PREP(SD7_MAP, sd7);
   349	
   350		return val;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
