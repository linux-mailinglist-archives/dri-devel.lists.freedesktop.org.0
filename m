Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B77FF9B0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 19:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F2A10E75D;
	Thu, 30 Nov 2023 18:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 30 Nov 2023 18:42:42 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234458826D;
 Thu, 30 Nov 2023 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369762; x=1732905762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IGGS3ZJAvVbvSqfCChebVYd+/KpvmrRDEwYOg0wlBwM=;
 b=ePaWEdBErl9ekJfnr8KBCzXBEwi7jOs1RrVZBYXwrMBnNqSmzNpuaEDt
 hYtdF17jWbmgFoNd64Vwbhmym3SIcwHx74A6hPVZpZMyuktQ8TAUcUqnv
 XEz2a3KDCXME8aLvBHcIx/FEm4CovmmLCydLOmG6wbVQdihNCU3rTz7PD
 4xWecQC/PPWEIkVoHGiKOsatAT9JOU8pUKqPhX2OX/pcu5Vt7XvYbeTNi
 SzguAwfQ7X0/e69Ol10ulz46DpqYy9Ui0if66bGqNG4+I/Z7pGZNuilXy
 j8b/jXVmg42H8ImVc8TbEk+OSxtQ7EZkl8TKMRK19NLeVF++Hy/QV/BqY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="228351"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="228351"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887337506"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="887337506"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2023 10:35:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1r8lsn-0002YR-1T;
 Thu, 30 Nov 2023 18:35:29 +0000
Date: Fri, 1 Dec 2023 02:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/msm/dpu: Capture dpu snapshot when
 frame_done_timer timeouts
Message-ID: <202312010225.2OJWLKmA-lkp@intel.com>
References: <20231129184159.24216-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129184159.24216-1-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 oe-kbuild-all@lists.linux.dev, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paloma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc3 next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paloma-Arellano/drm-msm-dpu-Capture-dpu-snapshot-when-frame_done_timer-timeouts/20231130-055033
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231129184159.24216-1-quic_parellan%40quicinc.com
patch subject: [PATCH v2] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231201/202312010225.2OJWLKmA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010225.2OJWLKmA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010225.2OJWLKmA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:211: warning: Function parameter or member 'frame_done_timeout_cnt' not described in 'dpu_encoder_virt'


vim +211 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  114  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  115  /**
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  116   * struct dpu_encoder_virt - virtual encoder. Container of one or more physical
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  117   *	encoders. Virtual encoder manages one "logical" display. Physical
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  118   *	encoders manage one intf block, tied to a specific panel/sub-panel.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  119   *	Virtual encoder defers as much as possible to the physical encoders.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  120   *	Virtual encoder registers itself with the DRM Framework as the encoder.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  121   * @base:		drm_encoder base class for registration with DRM
585b3f9472eea8 Sean Paul         2018-11-16  122   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
fba7427eb59496 Sean Paul         2018-11-16  123   * @enabled:		True if the encoder is active, protected by enc_lock
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  124   * @num_phys_encs:	Actual number of physical encoders contained.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  125   * @phys_encs:		Container of physical encoders managed.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  126   * @cur_master:		Pointer to the current master in this mode. Optimization
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  127   *			Only valid after enable. Cleared as disable.
cca5ff947c7c6e Lee Jones         2020-11-23  128   * @cur_slave:		As above but for the slave encoder.
cca5ff947c7c6e Lee Jones         2020-11-23  129   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  130   *			pingpong blocks can be different than num_phys_encs.
58dca981074948 Vinod Koul        2022-04-06  131   * @hw_dsc:		Handle to the DSC blocks used for the display.
58dca981074948 Vinod Koul        2022-04-06  132   * @dsc_mask:		Bitmask of used DSC blocks.
cca5ff947c7c6e Lee Jones         2020-11-23  133   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  134   *			for partial update right-only cases, such as pingpong
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  135   *			split where virtual pingpong does not generate IRQs
e4914867ac99ca Sean Paul         2018-11-16  136   * @crtc:		Pointer to the currently assigned crtc. Normally you
e4914867ac99ca Sean Paul         2018-11-16  137   *			would use crtc->state->encoder_mask to determine the
e4914867ac99ca Sean Paul         2018-11-16  138   *			link between encoder/crtc. However in this case we need
e4914867ac99ca Sean Paul         2018-11-16  139   *			to track crtc in the disable() hook which is called
e4914867ac99ca Sean Paul         2018-11-16  140   *			_after_ encoder_mask is cleared.
6b6921e5537d0f Dmitry Baryshkov  2022-02-17  141   * @connector:		If a mode is set, cached pointer to the active connector
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  142   * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  143   *				all CTL paths
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  144   * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  145   * @debugfs_root:		Debug file system root file node
fba7427eb59496 Sean Paul         2018-11-16  146   * @enc_lock:			Lock around physical encoder
fba7427eb59496 Sean Paul         2018-11-16  147   *				create/destroy/enable/disable
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  148   * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  149   *				busy processing current command.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  150   *				Bit0 = phys_encs[0] etc.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  151   * @crtc_frame_event_cb:	callback handler for frame event
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  152   * @crtc_frame_event_cb_data:	callback handler private data
70df9610de0fd3 Sean Paul         2019-01-28  153   * @frame_done_timeout_ms:	frame done timeout in ms
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  154   * @frame_done_timer:		watchdog timer for frame done event
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  155   * @disp_info:			local copy of msm_display_info struct
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  156   * @idle_pc_supported:		indicate if idle power collaps is supported
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  157   * @rc_lock:			resource control mutex lock to protect
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  158   *				virt encoder over various state changes
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  159   * @rc_state:			resource controller state
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  160   * @delayed_off_work:		delayed worker to schedule disabling of
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  161   *				clks and resources after IDLE_TIMEOUT time.
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  162   * @topology:                   topology of the display
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  163   * @idle_timeout:		idle timeout duration in milliseconds
4b27f469b155bd Dmitry Baryshkov  2023-01-18  164   * @wide_bus_en:		wide bus is enabled on this interface
46dd0c0658ff57 Dmitry Baryshkov  2022-07-11  165   * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  166   */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  167  struct dpu_encoder_virt {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  168  	struct drm_encoder base;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  169  	spinlock_t enc_spinlock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  170  
fba7427eb59496 Sean Paul         2018-11-16  171  	bool enabled;
fba7427eb59496 Sean Paul         2018-11-16  172  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  173  	unsigned int num_phys_encs;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  174  	struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  175  	struct dpu_encoder_phys *cur_master;
86b89080368b46 Jeykumar Sankaran 2018-09-05  176  	struct dpu_encoder_phys *cur_slave;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  177  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul        2022-04-06  178  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
58dca981074948 Vinod Koul        2022-04-06  179  
58dca981074948 Vinod Koul        2022-04-06  180  	unsigned int dsc_mask;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  181  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  182  	bool intfs_swapped;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  183  
e4914867ac99ca Sean Paul         2018-11-16  184  	struct drm_crtc *crtc;
6b6921e5537d0f Dmitry Baryshkov  2022-02-17  185  	struct drm_connector *connector;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  186  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  187  	struct dentry *debugfs_root;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  188  	struct mutex enc_lock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  189  	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  190  	void (*crtc_frame_event_cb)(void *, u32 event);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  191  	void *crtc_frame_event_cb_data;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  192  
70df9610de0fd3 Sean Paul         2019-01-28  193  	atomic_t frame_done_timeout_ms;
ccd5957a0bacc2 Paloma Arellano   2023-11-29  194  	atomic_t frame_done_timeout_cnt;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  195  	struct timer_list frame_done_timer;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  196  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  197  	struct msm_display_info disp_info;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  198  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  199  	bool idle_pc_supported;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  200  	struct mutex rc_lock;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  201  	enum dpu_enc_rc_states rc_state;
e077fe752cd344 Jeykumar Sankaran 2018-12-14  202  	struct delayed_work delayed_off_work;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  203  	struct msm_display_topology topology;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  204  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  205  	u32 idle_timeout;
3309a75639718c Kuogee Hsieh      2022-02-25  206  
3309a75639718c Kuogee Hsieh      2022-02-25  207  	bool wide_bus_en;
58dca981074948 Vinod Koul        2022-04-06  208  
58dca981074948 Vinod Koul        2022-04-06  209  	/* DSC configuration */
46dd0c0658ff57 Dmitry Baryshkov  2022-07-11  210  	struct drm_dsc_config *dsc;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @211  };
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  212  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
