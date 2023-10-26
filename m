Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE07D7A20
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 03:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911D110E609;
	Thu, 26 Oct 2023 01:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329110E602;
 Thu, 26 Oct 2023 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698283553; x=1729819553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=amRn4daTHQX0xyFE0A0SgaV8/g/JqTUm/9VBQw6e+oY=;
 b=G4prrn559aiGpd01ZexAOyh62Wks6dgJ4Zj1MDaASRacQEFXD6APT7vx
 tVuG8QMsWI2ggY8TVQnYjAIzVBdehisMEdwGesEDziT3QoQJv5L/+zweI
 RZ4HgIeNkboyIsox7TZCH7vcQCuTePfhXkSjZgq6mXjoAlKq+tQTpS4ws
 azGXH7ljCfQ/xG6prXpIhPnzGAYxKdwkKJlOmDvrEKcSEBormUvV+4gHK
 1HXNB7v6P54WFP15Cg6KJpdc6P6oIdIaw3GcBzuNItsm4xfArL1AirvmK
 LbFJugrJL/9fvX4hB50Cb4mOALKdNqr9E68yEyDaWr86VEa/EzZkdMKEn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="224222"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="224222"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 18:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932563473"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="932563473"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 25 Oct 2023 18:25:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qvp85-0009KA-0R;
 Thu, 26 Oct 2023 01:25:45 +0000
Date: Thu, 26 Oct 2023 09:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sagar Vashnav <sagarvashnav72427@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: add kernel docs for
 dc_stream_forward_crc_window
Message-ID: <202310260912.JFR01gdE-lkp@intel.com>
References: <20231025140419.21180-1-sagarvashnav72427@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025140419.21180-1-sagarvashnav72427@gmail.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sagar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sagar-Vashnav/drm-amd-display-add-kernel-docs-for-dc_stream_forward_crc_window/20231026-001250
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231025140419.21180-1-sagarvashnav72427%40gmail.com
patch subject: [PATCH] drm/amd/display: add kernel docs for dc_stream_forward_crc_window
config: csky-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231026/202310260912.JFR01gdE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260912.JFR01gdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260912.JFR01gdE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:536: warning: bad line: 
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:539: warning: bad line: 


vim +536 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

   530	
   531	/**
   532	 * dc_stream_forward_crc_window() - Forward CRC window configuration to DMUB or DMCU.
   533	 * @stream: The stream state to forward CRC window configuration for.
   534	 * @rect: Pointer to the rectangle defining the CRC window coordinates.
   535	 * @is_stop: Flag indicating whether the CRC capture should be stopped.
 > 536	
   537	 * This function is responsible for forwarding the CRC window configuration
   538	 * for a given stream to either the DMUB or DMCU, depending on their availability.
   539	
   540	 * Return:
   541	 * %true if the CRC window configuration was successfully forwarded;
   542	 * %false if the stream was not found or CRC forwarding is not supported.
   543	 */
   544	bool
   545	dc_stream_forward_crc_window(struct dc_stream_state *stream,
   546			struct rect *rect, bool is_stop)
   547	{
   548		struct dmcu *dmcu;
   549		struct dc_dmub_srv *dmub_srv;
   550		struct otg_phy_mux mux_mapping;
   551		struct pipe_ctx *pipe;
   552		int i;
   553		struct dc *dc = stream->ctx->dc;
   554	
   555		for (i = 0; i < MAX_PIPES; i++) {
   556			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
   557			if (pipe->stream == stream && !pipe->top_pipe && !pipe->prev_odm_pipe)
   558				break;
   559		}
   560	
   561		/* Stream not found */
   562		if (i == MAX_PIPES)
   563			return false;
   564	
   565		mux_mapping.phy_output_num = stream->link->link_enc_hw_inst;
   566		mux_mapping.otg_output_num = pipe->stream_res.tg->inst;
   567	
   568		dmcu = dc->res_pool->dmcu;
   569		dmub_srv = dc->ctx->dmub_srv;
   570	
   571		/* forward to dmub */
   572		if (dmub_srv)
   573			dc_stream_forward_dmub_crc_window(dmub_srv, rect, &mux_mapping, is_stop);
   574		/* forward to dmcu */
   575		else if (dmcu && dmcu->funcs->is_dmcu_initialized(dmcu))
   576			dc_stream_forward_dmcu_crc_window(dmcu, rect, &mux_mapping, is_stop);
   577		else
   578			return false;
   579	
   580		return true;
   581	}
   582	#endif /* CONFIG_DRM_AMD_SECURE_DISPLAY */
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
