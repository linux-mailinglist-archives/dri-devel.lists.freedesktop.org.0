Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AD902668
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 18:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32FC10E350;
	Mon, 10 Jun 2024 16:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRfuaN+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E96E10E376
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718036150; x=1749572150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qm2rSBRp7xf2gPqbWpmFefMa+S4IvIHvvjUopiG04uw=;
 b=XRfuaN+1BuiYuphHx1gpQV7PDRigiY+EmYi2SBNWxCuVu2mOUk64dLbm
 uXH/XU5/5qMuAH3VbrzDBdrfiZBNu70lCm7a4RKru9RfjKUdvZHihBXiz
 99jtSZSyILqT4bmshn7/TlK/mL1ZZWkrfppKcRRA0aQWEpvGzr4PDZdQ6
 pOZz1XiyFoRhk9d0YOIRkYt/3iwJ8Erz30uGPe60b0Mi6m4nWxV2Bl+Aw
 K+/Wqr3VfwrX61BWzs7ju0Y8lMQJg9tJ+HTTyXzrYBpmTl4clJrbW+dZy
 9DvCLAMxbBnaLnDM8GycKv582KdEgHr78j7Cde+hNBD8Y2UMxnubSacPX w==;
X-CSE-ConnectionGUID: FtUpvAhxSxKDMJj+OBU9sA==
X-CSE-MsgGUID: xYZAS3tiQ925ip//lMO4nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="37230612"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="37230612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:15:49 -0700
X-CSE-ConnectionGUID: X+wopBWlQ4WLT3IWD3PqMQ==
X-CSE-MsgGUID: fbeIrED/RhuyG6a3yJ5ihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43543508"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 09:15:46 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sGhgO-0002H7-19;
 Mon, 10 Jun 2024 16:15:44 +0000
Date: Tue, 11 Jun 2024 00:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
Message-ID: <202406102348.TVIh790U-lkp@intel.com>
References: <20240610111200.428224-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610111200.428224-1-mripard@kernel.org>
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

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip]
[cannot apply to linus/master v6.10-rc3 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-hdmi-Fix-kerneldoc-warnings/20240610-191427
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240610111200.428224-1-mripard%40kernel.org
patch subject: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406102348.TVIh790U-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406102348.TVIh790U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406102348.TVIh790U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/drm/drm_modes.h:33,
                    from include/drm/drm_crtc.h:32,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/drm_atomic.c:32:
>> include/drm/drm_connector.h:997:1: error: expected ';', identifier or '(' before 'struct'
     997 | struct drm_connector_state {
         | ^~~~~~


vim +997 include/drm/drm_connector.h

5b530587b3eb3e Maxime Ripard        2024-06-10   993  
52217195176115 Daniel Vetter        2016-08-12   994  /**
52217195176115 Daniel Vetter        2016-08-12   995   * struct drm_connector_state - mutable connector state
52217195176115 Daniel Vetter        2016-08-12   996   */
52217195176115 Daniel Vetter        2016-08-12  @997  struct drm_connector_state {
aab999a66e4bc4 Daniel Vetter        2018-07-09   998  	/** @connector: backpointer to the connector */
52217195176115 Daniel Vetter        2016-08-12   999  	struct drm_connector *connector;
52217195176115 Daniel Vetter        2016-08-12  1000  
afb21ea63d815d Daniel Vetter        2016-08-31  1001  	/**
afb21ea63d815d Daniel Vetter        2016-08-31  1002  	 * @crtc: CRTC to connect connector to, NULL if disabled.
afb21ea63d815d Daniel Vetter        2016-08-31  1003  	 *
afb21ea63d815d Daniel Vetter        2016-08-31  1004  	 * Do not change this directly, use drm_atomic_set_crtc_for_connector()
afb21ea63d815d Daniel Vetter        2016-08-31  1005  	 * instead.
afb21ea63d815d Daniel Vetter        2016-08-31  1006  	 */
afb21ea63d815d Daniel Vetter        2016-08-31  1007  	struct drm_crtc *crtc;
52217195176115 Daniel Vetter        2016-08-12  1008  
aab999a66e4bc4 Daniel Vetter        2018-07-09  1009  	/**
aab999a66e4bc4 Daniel Vetter        2018-07-09  1010  	 * @best_encoder:
aab999a66e4bc4 Daniel Vetter        2018-07-09  1011  	 *
aab999a66e4bc4 Daniel Vetter        2018-07-09  1012  	 * Used by the atomic helpers to select the encoder, through the
aab999a66e4bc4 Daniel Vetter        2018-07-09  1013  	 * &drm_connector_helper_funcs.atomic_best_encoder or
aab999a66e4bc4 Daniel Vetter        2018-07-09  1014  	 * &drm_connector_helper_funcs.best_encoder callbacks.
27edadf6df811b Daniel Vetter        2019-05-06  1015  	 *
1b27fbdde1df17 Laurent Pinchart     2019-06-11  1016  	 * This is also used in the atomic helpers to map encoders to their
1b27fbdde1df17 Laurent Pinchart     2019-06-11  1017  	 * current and previous connectors, see
12db36bc3cec76 Sean Paul            2019-08-12  1018  	 * drm_atomic_get_old_connector_for_encoder() and
12db36bc3cec76 Sean Paul            2019-08-12  1019  	 * drm_atomic_get_new_connector_for_encoder().
1b27fbdde1df17 Laurent Pinchart     2019-06-11  1020  	 *
27edadf6df811b Daniel Vetter        2019-05-06  1021  	 * NOTE: Atomic drivers must fill this out (either themselves or through
27edadf6df811b Daniel Vetter        2019-05-06  1022  	 * helpers), for otherwise the GETCONNECTOR and GETENCODER IOCTLs will
27edadf6df811b Daniel Vetter        2019-05-06  1023  	 * not return correct data to userspace.
aab999a66e4bc4 Daniel Vetter        2018-07-09  1024  	 */
52217195176115 Daniel Vetter        2016-08-12  1025  	struct drm_encoder *best_encoder;
52217195176115 Daniel Vetter        2016-08-12  1026  
40ee6fbef75fe6 Manasi Navare        2016-12-16  1027  	/**
40ee6fbef75fe6 Manasi Navare        2016-12-16  1028  	 * @link_status: Connector link_status to keep track of whether link is
40ee6fbef75fe6 Manasi Navare        2016-12-16  1029  	 * GOOD or BAD to notify userspace if retraining is necessary.
40ee6fbef75fe6 Manasi Navare        2016-12-16  1030  	 */
40ee6fbef75fe6 Manasi Navare        2016-12-16  1031  	enum drm_link_status link_status;
40ee6fbef75fe6 Manasi Navare        2016-12-16  1032  
aab999a66e4bc4 Daniel Vetter        2018-07-09  1033  	/** @state: backpointer to global drm_atomic_state */
52217195176115 Daniel Vetter        2016-08-12  1034  	struct drm_atomic_state *state;
299a16b163c95f Boris Brezillon      2016-12-02  1035  
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1036  	/**
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1037  	 * @commit: Tracks the pending commit to prevent use-after-free conditions.
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1038  	 *
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1039  	 * Is only set when @crtc is NULL.
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1040  	 */
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1041  	struct drm_crtc_commit *commit;
21a01abbe32a3c Maarten Lankhorst    2017-09-04  1042  
aab999a66e4bc4 Daniel Vetter        2018-07-09  1043  	/** @tv: TV connector state */
299a16b163c95f Boris Brezillon      2016-12-02  1044  	struct drm_tv_connector_state tv;
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1045  
1452c25b0e6027 Sean Paul            2019-06-12  1046  	/**
1452c25b0e6027 Sean Paul            2019-06-12  1047  	 * @self_refresh_aware:
1452c25b0e6027 Sean Paul            2019-06-12  1048  	 *
1452c25b0e6027 Sean Paul            2019-06-12  1049  	 * This tracks whether a connector is aware of the self refresh state.
1452c25b0e6027 Sean Paul            2019-06-12  1050  	 * It should be set to true for those connector implementations which
1452c25b0e6027 Sean Paul            2019-06-12  1051  	 * understand the self refresh state. This is needed since the crtc
1452c25b0e6027 Sean Paul            2019-06-12  1052  	 * registers the self refresh helpers and it doesn't know if the
1452c25b0e6027 Sean Paul            2019-06-12  1053  	 * connectors downstream have implemented self refresh entry/exit.
1452c25b0e6027 Sean Paul            2019-06-12  1054  	 *
1452c25b0e6027 Sean Paul            2019-06-12  1055  	 * Drivers should set this to true in atomic_check if they know how to
1452c25b0e6027 Sean Paul            2019-06-12  1056  	 * handle self_refresh requests.
1452c25b0e6027 Sean Paul            2019-06-12  1057  	 */
1452c25b0e6027 Sean Paul            2019-06-12  1058  	bool self_refresh_aware;
1452c25b0e6027 Sean Paul            2019-06-12  1059  
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1060  	/**
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1061  	 * @picture_aspect_ratio: Connector property to control the
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1062  	 * HDMI infoframe aspect ratio setting.
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1063  	 *
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1064  	 * The %DRM_MODE_PICTURE_ASPECT_\* values much match the
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1065  	 * values for &enum hdmi_picture_aspect
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1066  	 */
0e9f25d0e15fd9 Maarten Lankhorst    2017-05-01  1067  	enum hdmi_picture_aspect picture_aspect_ratio;
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1068  
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1069  	/**
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1070  	 * @content_type: Connector property to control the
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1071  	 * HDMI infoframe content type setting.
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1072  	 * The %DRM_MODE_CONTENT_TYPE_\* values much
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1073  	 * match the values.
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1074  	 */
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1075  	unsigned int content_type;
50525c332b55f8 Stanislav Lisovskiy  2018-05-15  1076  
7672dbba85d30d Ramalingam C         2019-08-01  1077  	/**
7672dbba85d30d Ramalingam C         2019-08-01  1078  	 * @hdcp_content_type: Connector property to pass the type of
7672dbba85d30d Ramalingam C         2019-08-01  1079  	 * protected content. This is most commonly used for HDCP.
7672dbba85d30d Ramalingam C         2019-08-01  1080  	 */
7672dbba85d30d Ramalingam C         2019-08-01  1081  	unsigned int hdcp_content_type;
7672dbba85d30d Ramalingam C         2019-08-01  1082  
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1083  	/**
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1084  	 * @scaling_mode: Connector property to control the
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1085  	 * upscaling, mostly used for built-in panels.
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1086  	 */
8f6e1e22e7d0d4 Maarten Lankhorst    2017-05-01  1087  	unsigned int scaling_mode;
24557865c8b1a6 Sean Paul            2018-01-08  1088  
24557865c8b1a6 Sean Paul            2018-01-08  1089  	/**
24557865c8b1a6 Sean Paul            2018-01-08  1090  	 * @content_protection: Connector property to request content
24557865c8b1a6 Sean Paul            2018-01-08  1091  	 * protection. This is most commonly used for HDCP.
24557865c8b1a6 Sean Paul            2018-01-08  1092  	 */
24557865c8b1a6 Sean Paul            2018-01-08  1093  	unsigned int content_protection;
935774cd71fe60 Brian Starkey        2017-03-29  1094  
d2c6a405846c24 Uma Shankar          2019-02-19  1095  	/**
d2c6a405846c24 Uma Shankar          2019-02-19  1096  	 * @colorspace: State variable for Connector property to request
d2c6a405846c24 Uma Shankar          2019-02-19  1097  	 * colorspace change on Sink. This is most commonly used to switch
d2c6a405846c24 Uma Shankar          2019-02-19  1098  	 * to wider color gamuts like BT2020.
d2c6a405846c24 Uma Shankar          2019-02-19  1099  	 */
1626761ee4406c Harry Wentland       2023-02-03  1100  	enum drm_colorspace colorspace;
d2c6a405846c24 Uma Shankar          2019-02-19  1101  
935774cd71fe60 Brian Starkey        2017-03-29  1102  	/**
935774cd71fe60 Brian Starkey        2017-03-29  1103  	 * @writeback_job: Writeback job for writeback connectors
935774cd71fe60 Brian Starkey        2017-03-29  1104  	 *
b13cc8dd588434 Brian Starkey        2017-03-29  1105  	 * Holds the framebuffer and out-fence for a writeback connector. As
b13cc8dd588434 Brian Starkey        2017-03-29  1106  	 * the writeback completion may be asynchronous to the normal commit
b13cc8dd588434 Brian Starkey        2017-03-29  1107  	 * cycle, the writeback job lifetime is managed separately from the
b13cc8dd588434 Brian Starkey        2017-03-29  1108  	 * normal atomic state by this object.
935774cd71fe60 Brian Starkey        2017-03-29  1109  	 *
935774cd71fe60 Brian Starkey        2017-03-29  1110  	 * See also: drm_writeback_queue_job() and
935774cd71fe60 Brian Starkey        2017-03-29  1111  	 * drm_writeback_signal_completion()
935774cd71fe60 Brian Starkey        2017-03-29  1112  	 */
935774cd71fe60 Brian Starkey        2017-03-29  1113  	struct drm_writeback_job *writeback_job;
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1114  
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1115  	/**
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1116  	 * @max_requested_bpc: Connector property to limit the maximum bit
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1117  	 * depth of the pixels.
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1118  	 */
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1119  	u8 max_requested_bpc;
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1120  
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1121  	/**
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1122  	 * @max_bpc: Connector max_bpc based on the requested max_bpc property
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1123  	 * and the connector bpc limitations obtained from edid.
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1124  	 */
47e22ff1a9e0c1 Radhakrishna Sripada 2018-10-12  1125  	u8 max_bpc;
fbb5d0353c62d1 Uma Shankar          2019-05-16  1126  
107fe904302092 Rajat Jain           2021-10-05  1127  	/**
107fe904302092 Rajat Jain           2021-10-05  1128  	 * @privacy_screen_sw_state: See :ref:`Standard Connector
107fe904302092 Rajat Jain           2021-10-05  1129  	 * Properties<standard_connector_properties>`
107fe904302092 Rajat Jain           2021-10-05  1130  	 */
107fe904302092 Rajat Jain           2021-10-05  1131  	enum drm_privacy_screen_status privacy_screen_sw_state;
107fe904302092 Rajat Jain           2021-10-05  1132  
fbb5d0353c62d1 Uma Shankar          2019-05-16  1133  	/**
fbb5d0353c62d1 Uma Shankar          2019-05-16  1134  	 * @hdr_output_metadata:
fbb5d0353c62d1 Uma Shankar          2019-05-16  1135  	 * DRM blob property for HDR output metadata
fbb5d0353c62d1 Uma Shankar          2019-05-16  1136  	 */
fbb5d0353c62d1 Uma Shankar          2019-05-16  1137  	struct drm_property_blob *hdr_output_metadata;
54cb39e2293b1e Maxime Ripard        2024-05-27  1138  
54cb39e2293b1e Maxime Ripard        2024-05-27  1139  	/**
54cb39e2293b1e Maxime Ripard        2024-05-27  1140  	 * @hdmi: HDMI-related variable and properties. Filled by
54cb39e2293b1e Maxime Ripard        2024-05-27  1141  	 * @drm_atomic_helper_connector_hdmi_check().
54cb39e2293b1e Maxime Ripard        2024-05-27  1142  	 */
5b530587b3eb3e Maxime Ripard        2024-06-10  1143  	struct drm_connector_hdmi_state hdmi;
52217195176115 Daniel Vetter        2016-08-12  1144  };
52217195176115 Daniel Vetter        2016-08-12  1145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
