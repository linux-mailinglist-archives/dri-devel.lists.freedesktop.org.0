Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD78B2D1E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 00:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B94D10EA61;
	Thu, 25 Apr 2024 22:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4b4WdNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816DC10EA61
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714084161; x=1745620161;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=joGhIymXSrCBHKWGfpO+yRLZprwNFCNb4ms5Dh2gHBg=;
 b=X4b4WdNlF6YaHU6XYmzbhNHkqyd1KUVEqbYdvwuNOQDMR3UKNGw6JaWT
 sJr1WhiV5GdUJy2fHR7x6aMPfF1wfmiE0tK9ZwvVvCfGQVNFog4kYfiEa
 xV8Om11RMGVD3vd36GG2yAbt48bXknjb5QPUCj/mvI4neWzNvYXWgLGEN
 vTApyEhWcHzfAoIV4usqwdSql5x7KL9MYewgSr9GshMaI+U1C3aIRmRGZ
 b38+59BoK1BXCZpsn23gdz1+/EgkhbgcI7xHIYKscEAQfTCCmj0C2l0Jz
 +NEebF5lBcamt/gm5d6+38lFHvweMMXvnr+gMez04S+kGZTW01cuSPEXB g==;
X-CSE-ConnectionGUID: 7hR3ov41Srm/qbTD4SFGWQ==
X-CSE-MsgGUID: bEVQbkvaT42csZ4JsddvQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13587996"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="13587996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:29:20 -0700
X-CSE-ConnectionGUID: x26ROl4NS5qsvH/5nY2+CA==
X-CSE-MsgGUID: ZJWKaelKR+CJ+72DD3EMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="30027455"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 25 Apr 2024 15:29:19 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s07ae-0002ww-0p;
 Thu, 25 Apr 2024 22:29:16 +0000
Date: Fri, 26 Apr 2024 06:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [drm-misc:for-linux-next 6/6]
 drivers/gpu/drm/xlnx/zynqmp_disp.c:954: warning: Function parameter or
 struct member 'media_bus_format' not described in
 'zynqmp_disp_layer_find_live_format'
Message-ID: <202404260616.KFGDpCDN-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: 1b5151bd3a2e076653a935874b39dd2c3a00452a [6/6] drm: xlnx: zynqmp_dpsub: Set input live format
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240426/202404260616.KFGDpCDN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260616.KFGDpCDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260616.KFGDpCDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_disp.c:164: warning: Function parameter or struct member 'blend' not described in 'zynqmp_disp'
   drivers/gpu/drm/xlnx/zynqmp_disp.c:164: warning: Function parameter or struct member 'avbuf' not described in 'zynqmp_disp'
   drivers/gpu/drm/xlnx/zynqmp_disp.c:164: warning: Function parameter or struct member 'audio' not described in 'zynqmp_disp'
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:954: warning: Function parameter or struct member 'media_bus_format' not described in 'zynqmp_disp_layer_find_live_format'
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:954: warning: Excess function parameter 'drm_fmt' description in 'zynqmp_disp_layer_find_live_format'
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:1129: warning: Function parameter or struct member 'media_bus_format' not described in 'zynqmp_disp_layer_set_live_format'
   drivers/gpu/drm/xlnx/zynqmp_disp.c:1129: warning: Excess function parameter 'info' description in 'zynqmp_disp_layer_set_live_format'


vim +954 drivers/gpu/drm/xlnx/zynqmp_disp.c

   938	
   939	/**
   940	 * zynqmp_disp_layer_find_live_format - Find format information for given
   941	 * media bus format
   942	 * @layer: The layer
   943	 * @drm_fmt: Media bus format to search
   944	 *
   945	 * Search display subsystem format information corresponding to the given media
   946	 * bus format @media_bus_format for the @layer, and return a pointer to the
   947	 * format descriptor.
   948	 *
   949	 * Return: A pointer to the format descriptor if found, NULL otherwise
   950	 */
   951	static const struct zynqmp_disp_format *
   952	zynqmp_disp_layer_find_live_format(struct zynqmp_disp_layer *layer,
   953					   u32 media_bus_format)
 > 954	{
   955		unsigned int i;
   956	
   957		for (i = 0; i < layer->info->num_formats; i++)
   958			if (layer->info->formats[i].bus_fmt == media_bus_format)
   959				return &layer->info->formats[i];
   960	
   961		return NULL;
   962	}
   963	
   964	/**
   965	 * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
   966	 * @layer: The layer
   967	 * @num_formats: Pointer to the returned number of formats
   968	 *
   969	 * NOTE: This function doesn't make sense for live video layers and will
   970	 * always return an empty list in such cases. zynqmp_disp_live_layer_formats()
   971	 * should be used to query a list of media bus formats supported by the live
   972	 * video input layer.
   973	 *
   974	 * Return: A newly allocated u32 array that stores all the DRM formats
   975	 * supported by the layer. The number of formats in the array is returned
   976	 * through the num_formats argument.
   977	 */
   978	u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
   979					   unsigned int *num_formats)
   980	{
   981		unsigned int i;
   982		u32 *formats;
   983	
   984		if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
   985			*num_formats = 0;
   986			return NULL;
   987		}
   988	
   989		formats = kcalloc(layer->info->num_formats, sizeof(*formats),
   990				  GFP_KERNEL);
   991		if (!formats) {
   992			*num_formats = 0;
   993			return NULL;
   994		}
   995	
   996		for (i = 0; i < layer->info->num_formats; ++i)
   997			formats[i] = layer->info->formats[i].drm_fmt;
   998	
   999		*num_formats = layer->info->num_formats;
  1000		return formats;
  1001	}
  1002	
  1003	/**
  1004	 * zynqmp_disp_live_layer_formats - Return the media bus formats supported by
  1005	 * the live video layer
  1006	 * @layer: The layer
  1007	 * @num_formats: Pointer to the returned number of formats
  1008	 *
  1009	 * NOTE: This function should be used only for live video input layers.
  1010	 *
  1011	 * Return: A newly allocated u32 array of media bus formats supported by the
  1012	 * layer. The number of formats in the array is returned through the
  1013	 * @num_formats argument.
  1014	 */
  1015	u32 *zynqmp_disp_live_layer_formats(struct zynqmp_disp_layer *layer,
  1016					    unsigned int *num_formats)
  1017	{
  1018		unsigned int i;
  1019		u32 *formats;
  1020	
  1021		if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_LIVE)) {
  1022			*num_formats = 0;
  1023			return NULL;
  1024		}
  1025	
  1026		formats = kcalloc(layer->info->num_formats, sizeof(*formats),
  1027				  GFP_KERNEL);
  1028		if (!formats) {
  1029			*num_formats = 0;
  1030			return NULL;
  1031		}
  1032	
  1033		for (i = 0; i < layer->info->num_formats; ++i)
  1034			formats[i] = layer->info->formats[i].bus_fmt;
  1035	
  1036		*num_formats = layer->info->num_formats;
  1037		return formats;
  1038	}
  1039	
  1040	/**
  1041	 * zynqmp_disp_layer_enable - Enable a layer
  1042	 * @layer: The layer
  1043	 *
  1044	 * Enable the @layer in the audio/video buffer manager and the blender. DMA
  1045	 * channels are started separately by zynqmp_disp_layer_update().
  1046	 */
  1047	void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
  1048	{
  1049		zynqmp_disp_avbuf_enable_video(layer->disp, layer);
  1050		zynqmp_disp_blend_layer_enable(layer->disp, layer);
  1051	}
  1052	
  1053	/**
  1054	 * zynqmp_disp_layer_disable - Disable the layer
  1055	 * @layer: The layer
  1056	 *
  1057	 * Disable the layer by stopping its DMA channels and disabling it in the
  1058	 * audio/video buffer manager and the blender.
  1059	 */
  1060	void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
  1061	{
  1062		unsigned int i;
  1063	
  1064		if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
  1065			for (i = 0; i < layer->drm_fmt->num_planes; i++)
  1066				dmaengine_terminate_sync(layer->dmas[i].chan);
  1067		}
  1068	
  1069		zynqmp_disp_avbuf_disable_video(layer->disp, layer);
  1070		zynqmp_disp_blend_layer_disable(layer->disp, layer);
  1071	}
  1072	
  1073	/**
  1074	 * zynqmp_disp_layer_set_format - Set the layer format
  1075	 * @layer: The layer
  1076	 * @info: The format info
  1077	 *
  1078	 * NOTE: Use zynqmp_disp_layer_set_live_format() to set media bus format for
  1079	 * live video layers.
  1080	 *
  1081	 * Set the format for @layer to @info. The layer must be disabled.
  1082	 */
  1083	void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
  1084					  const struct drm_format_info *info)
  1085	{
  1086		unsigned int i;
  1087	
  1088		if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_NONLIVE))
  1089			return;
  1090	
  1091		layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
  1092		if (WARN_ON(!layer->disp_fmt))
  1093			return;
  1094		layer->drm_fmt = info;
  1095	
  1096		zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
  1097	
  1098		/*
  1099		 * Set pconfig for each DMA channel to indicate they're part of a
  1100		 * video group.
  1101		 */
  1102		for (i = 0; i < info->num_planes; i++) {
  1103			struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
  1104			struct xilinx_dpdma_peripheral_config pconfig = {
  1105				.video_group = true,
  1106			};
  1107			struct dma_slave_config config = {
  1108				.direction = DMA_MEM_TO_DEV,
  1109				.peripheral_config = &pconfig,
  1110				.peripheral_size = sizeof(pconfig),
  1111			};
  1112	
  1113			dmaengine_slave_config(dma->chan, &config);
  1114		}
  1115	}
  1116	
  1117	/**
  1118	 * zynqmp_disp_layer_set_live_format - Set the live video layer format
  1119	 * @layer: The layer
  1120	 * @info: The format info
  1121	 *
  1122	 * NOTE: This function should not be used to set format for non-live video
  1123	 * layer. Use zynqmp_disp_layer_set_format() instead.
  1124	 *
  1125	 * Set the display format for the live @layer. The layer must be disabled.
  1126	 */
  1127	void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
  1128					       u32 media_bus_format)
> 1129	{
  1130		if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_LIVE))
  1131			return;
  1132	
  1133		layer->disp_fmt = zynqmp_disp_layer_find_live_format(layer,
  1134								     media_bus_format);
  1135		if (WARN_ON(!layer->disp_fmt))
  1136			return;
  1137	
  1138		zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
  1139	
  1140		layer->drm_fmt = drm_format_info(layer->disp_fmt->drm_fmt);
  1141	}
  1142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
