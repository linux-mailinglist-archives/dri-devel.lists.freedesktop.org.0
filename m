Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0402A3D2FD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 09:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B810E42B;
	Thu, 20 Feb 2025 08:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOZXSp5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F93B10E181;
 Thu, 20 Feb 2025 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740039697; x=1771575697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eQYTj3zyLS3aPUdG/Og76hysDgQMmUbtgdRarWN+Lww=;
 b=aOZXSp5sBJTKsaFvBWSawdyO7gQ0XDWGnaHgK1eijTIc/NNN2MtuXuig
 0ri1It52LHs024vUfcCs/7OZZrm7UlemGTm8ffbSPj7K97iTi4btFszyW
 nj2/Ad5EnJ6VOCA8glRZvH4H8/3VX+R6duVcoqsxmQpF64rGh4DgccnEP
 aJTXrDVuXTruuGPpaXkFCswYu8vPaYK7BZvdt5bn9TXcX55VxOKjcHjWH
 5MXaBIrMyx52CSgUyJ6VypgYmoCwGmAScFd1BeilvnaWffFr4Q1DKXOOp
 VrFuMwG+mqdSqUMN6LjUaFYodIoleNDdglY+hgYc/VW7boQFWI/b2+KtY A==;
X-CSE-ConnectionGUID: fCSWBdceQjCniZPNwzbr7Q==
X-CSE-MsgGUID: D5p8MrHPQPiybFzaLYjcrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40038759"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40038759"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:21:37 -0800
X-CSE-ConnectionGUID: ZVbKXaSUTjeCgera0AEWSw==
X-CSE-MsgGUID: KkBe72N7TT+LU+NN128KQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="115641475"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa009.fm.intel.com with ESMTP; 20 Feb 2025 00:21:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tl1oK-00042B-2i;
 Thu, 20 Feb 2025 08:21:32 +0000
Date: Thu, 20 Feb 2025 16:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH 1/6] drm: Introduce sharpness strength property
Message-ID: <202502201640.Kv91RrH2-lkp@intel.com>
References: <20250219115359.2320992-2-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219115359.2320992-2-nemesa.garg@intel.com>
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

Hi Nemesa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250219]
[cannot apply to drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master v6.14-rc3 v6.14-rc2 v6.14-rc1 v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-Introduce-sharpness-strength-property/20250219-200229
base:   next-20250219
patch link:    https://lore.kernel.org/r/20250219115359.2320992-2-nemesa.garg%40intel.com
patch subject: [PATCH 1/6] drm: Introduce sharpness strength property
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250220/202502201640.Kv91RrH2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201640.Kv91RrH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201640.Kv91RrH2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/drm/drm_crtc.h:321: warning: Incorrect use of kernel-doc format:          * @sharpness_strength
>> include/drm/drm_crtc.h:398: warning: Function parameter or struct member 'sharpness_strength' not described in 'drm_crtc_state'
>> include/drm/drm_crtc.h:1194: warning: Function parameter or struct member 'sharpness_strength_property' not described in 'drm_crtc'
>> include/drm/drm_crtc.h:1194: warning: Excess struct member 'sharpness_strength_prop' description in 'drm_crtc'


vim +321 include/drm/drm_crtc.h

    65	
    66	/**
    67	 * struct drm_crtc_state - mutable CRTC state
    68	 *
    69	 * Note that the distinction between @enable and @active is rather subtle:
    70	 * Flipping @active while @enable is set without changing anything else may
    71	 * never return in a failure from the &drm_mode_config_funcs.atomic_check
    72	 * callback. Userspace assumes that a DPMS On will always succeed. In other
    73	 * words: @enable controls resource assignment, @active controls the actual
    74	 * hardware state.
    75	 *
    76	 * The three booleans active_changed, connectors_changed and mode_changed are
    77	 * intended to indicate whether a full modeset is needed, rather than strictly
    78	 * describing what has changed in a commit. See also:
    79	 * drm_atomic_crtc_needs_modeset()
    80	 */
    81	struct drm_crtc_state {
    82		/** @crtc: backpointer to the CRTC */
    83		struct drm_crtc *crtc;
    84	
    85		/**
    86		 * @enable: Whether the CRTC should be enabled, gates all other state.
    87		 * This controls reservations of shared resources. Actual hardware state
    88		 * is controlled by @active.
    89		 */
    90		bool enable;
    91	
    92		/**
    93		 * @active: Whether the CRTC is actively displaying (used for DPMS).
    94		 * Implies that @enable is set. The driver must not release any shared
    95		 * resources if @active is set to false but @enable still true, because
    96		 * userspace expects that a DPMS ON always succeeds.
    97		 *
    98		 * Hence drivers must not consult @active in their various
    99		 * &drm_mode_config_funcs.atomic_check callback to reject an atomic
   100		 * commit. They can consult it to aid in the computation of derived
   101		 * hardware state, since even in the DPMS OFF state the display hardware
   102		 * should be as much powered down as when the CRTC is completely
   103		 * disabled through setting @enable to false.
   104		 */
   105		bool active;
   106	
   107		/**
   108		 * @planes_changed: Planes on this crtc are updated. Used by the atomic
   109		 * helpers and drivers to steer the atomic commit control flow.
   110		 */
   111		bool planes_changed : 1;
   112	
   113		/**
   114		 * @mode_changed: @mode or @enable has been changed. Used by the atomic
   115		 * helpers and drivers to steer the atomic commit control flow. See also
   116		 * drm_atomic_crtc_needs_modeset().
   117		 *
   118		 * Drivers are supposed to set this for any CRTC state changes that
   119		 * require a full modeset. They can also reset it to false if e.g. a
   120		 * @mode change can be done without a full modeset by only changing
   121		 * scaler settings.
   122		 */
   123		bool mode_changed : 1;
   124	
   125		/**
   126		 * @active_changed: @active has been toggled. Used by the atomic
   127		 * helpers and drivers to steer the atomic commit control flow. See also
   128		 * drm_atomic_crtc_needs_modeset().
   129		 */
   130		bool active_changed : 1;
   131	
   132		/**
   133		 * @connectors_changed: Connectors to this crtc have been updated,
   134		 * either in their state or routing. Used by the atomic
   135		 * helpers and drivers to steer the atomic commit control flow. See also
   136		 * drm_atomic_crtc_needs_modeset().
   137		 *
   138		 * Drivers are supposed to set this as-needed from their own atomic
   139		 * check code, e.g. from &drm_encoder_helper_funcs.atomic_check
   140		 */
   141		bool connectors_changed : 1;
   142		/**
   143		 * @zpos_changed: zpos values of planes on this crtc have been updated.
   144		 * Used by the atomic helpers and drivers to steer the atomic commit
   145		 * control flow.
   146		 */
   147		bool zpos_changed : 1;
   148		/**
   149		 * @color_mgmt_changed: Color management properties have changed
   150		 * (@gamma_lut, @degamma_lut or @ctm). Used by the atomic helpers and
   151		 * drivers to steer the atomic commit control flow.
   152		 */
   153		bool color_mgmt_changed : 1;
   154	
   155		/**
   156		 * @no_vblank:
   157		 *
   158		 * Reflects the ability of a CRTC to send VBLANK events. This state
   159		 * usually depends on the pipeline configuration. If set to true, DRM
   160		 * atomic helpers will send out a fake VBLANK event during display
   161		 * updates after all hardware changes have been committed. This is
   162		 * implemented in drm_atomic_helper_fake_vblank().
   163		 *
   164		 * One usage is for drivers and/or hardware without support for VBLANK
   165		 * interrupts. Such drivers typically do not initialize vblanking
   166		 * (i.e., call drm_vblank_init() with the number of CRTCs). For CRTCs
   167		 * without initialized vblanking, this field is set to true in
   168		 * drm_atomic_helper_check_modeset(), and a fake VBLANK event will be
   169		 * send out on each update of the display pipeline by
   170		 * drm_atomic_helper_fake_vblank().
   171		 *
   172		 * Another usage is CRTCs feeding a writeback connector operating in
   173		 * oneshot mode. In this case the fake VBLANK event is only generated
   174		 * when a job is queued to the writeback connector, and we want the
   175		 * core to fake VBLANK events when this part of the pipeline hasn't
   176		 * changed but others had or when the CRTC and connectors are being
   177		 * disabled.
   178		 *
   179		 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
   180		 * from the current state, the CRTC driver is then responsible for
   181		 * updating this field when needed.
   182		 *
   183		 * Note that the combination of &drm_crtc_state.event == NULL and
   184		 * &drm_crtc_state.no_blank == true is valid and usually used when the
   185		 * writeback connector attached to the CRTC has a new job queued. In
   186		 * this case the driver will send the VBLANK event on its own when the
   187		 * writeback job is complete.
   188		 */
   189		bool no_vblank : 1;
   190	
   191		/**
   192		 * @plane_mask: Bitmask of drm_plane_mask(plane) of planes attached to
   193		 * this CRTC.
   194		 */
   195		u32 plane_mask;
   196	
   197		/**
   198		 * @connector_mask: Bitmask of drm_connector_mask(connector) of
   199		 * connectors attached to this CRTC.
   200		 */
   201		u32 connector_mask;
   202	
   203		/**
   204		 * @encoder_mask: Bitmask of drm_encoder_mask(encoder) of encoders
   205		 * attached to this CRTC.
   206		 */
   207		u32 encoder_mask;
   208	
   209		/**
   210		 * @adjusted_mode:
   211		 *
   212		 * Internal display timings which can be used by the driver to handle
   213		 * differences between the mode requested by userspace in @mode and what
   214		 * is actually programmed into the hardware.
   215		 *
   216		 * For drivers using &drm_bridge, this stores hardware display timings
   217		 * used between the CRTC and the first bridge. For other drivers, the
   218		 * meaning of the adjusted_mode field is purely driver implementation
   219		 * defined information, and will usually be used to store the hardware
   220		 * display timings used between the CRTC and encoder blocks.
   221		 */
   222		struct drm_display_mode adjusted_mode;
   223	
   224		/**
   225		 * @mode:
   226		 *
   227		 * Display timings requested by userspace. The driver should try to
   228		 * match the refresh rate as close as possible (but note that it's
   229		 * undefined what exactly is close enough, e.g. some of the HDMI modes
   230		 * only differ in less than 1% of the refresh rate). The active width
   231		 * and height as observed by userspace for positioning planes must match
   232		 * exactly.
   233		 *
   234		 * For external connectors where the sink isn't fixed (like with a
   235		 * built-in panel), this mode here should match the physical mode on the
   236		 * wire to the last details (i.e. including sync polarities and
   237		 * everything).
   238		 */
   239		struct drm_display_mode mode;
   240	
   241		/**
   242		 * @mode_blob: &drm_property_blob for @mode, for exposing the mode to
   243		 * atomic userspace.
   244		 */
   245		struct drm_property_blob *mode_blob;
   246	
   247		/**
   248		 * @degamma_lut:
   249		 *
   250		 * Lookup table for converting framebuffer pixel data before apply the
   251		 * color conversion matrix @ctm. See drm_crtc_enable_color_mgmt(). The
   252		 * blob (if not NULL) is an array of &struct drm_color_lut.
   253		 */
   254		struct drm_property_blob *degamma_lut;
   255	
   256		/**
   257		 * @ctm:
   258		 *
   259		 * Color transformation matrix. See drm_crtc_enable_color_mgmt(). The
   260		 * blob (if not NULL) is a &struct drm_color_ctm.
   261		 */
   262		struct drm_property_blob *ctm;
   263	
   264		/**
   265		 * @gamma_lut:
   266		 *
   267		 * Lookup table for converting pixel data after the color conversion
   268		 * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
   269		 * NULL) is an array of &struct drm_color_lut.
   270		 *
   271		 * Note that for mostly historical reasons stemming from Xorg heritage,
   272		 * this is also used to store the color map (also sometimes color lut,
   273		 * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
   274		 */
   275		struct drm_property_blob *gamma_lut;
   276	
   277		/**
   278		 * @target_vblank:
   279		 *
   280		 * Target vertical blank period when a page flip
   281		 * should take effect.
   282		 */
   283		u32 target_vblank;
   284	
   285		/**
   286		 * @async_flip:
   287		 *
   288		 * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
   289		 * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL itself yet.
   290		 */
   291		bool async_flip;
   292	
   293		/**
   294		 * @vrr_enabled:
   295		 *
   296		 * Indicates if variable refresh rate should be enabled for the CRTC.
   297		 * Support for the requested vrr state will depend on driver and
   298		 * hardware capabiltiy - lacking support is not treated as failure.
   299		 */
   300		bool vrr_enabled;
   301	
   302		/**
   303		 * @self_refresh_active:
   304		 *
   305		 * Used by the self refresh helpers to denote when a self refresh
   306		 * transition is occurring. This will be set on enable/disable callbacks
   307		 * when self refresh is being enabled or disabled. In some cases, it may
   308		 * not be desirable to fully shut off the crtc during self refresh.
   309		 * CRTC's can inspect this flag and determine the best course of action.
   310		 */
   311		bool self_refresh_active;
   312	
   313		/**
   314		 * @scaling_filter:
   315		 *
   316		 * Scaling filter to be applied
   317		 */
   318		enum drm_scaling_filter scaling_filter;
   319	
   320		/**
 > 321		 * @sharpness_strength
   322		 *
   323		 * Used by the user to set the sharpness intensity.
   324		 * The value ranges from 0-255.
   325		 * Any value greater than 0 means enabling the featuring
   326		 * along with setting the value for sharpness.
   327		 */
   328		u8 sharpness_strength;
   329	
   330		/**
   331		 * @event:
   332		 *
   333		 * Optional pointer to a DRM event to signal upon completion of the
   334		 * state update. The driver must send out the event when the atomic
   335		 * commit operation completes. There are two cases:
   336		 *
   337		 *  - The event is for a CRTC which is being disabled through this
   338		 *    atomic commit. In that case the event can be send out any time
   339		 *    after the hardware has stopped scanning out the current
   340		 *    framebuffers. It should contain the timestamp and counter for the
   341		 *    last vblank before the display pipeline was shut off. The simplest
   342		 *    way to achieve that is calling drm_crtc_send_vblank_event()
   343		 *    somewhen after drm_crtc_vblank_off() has been called.
   344		 *
   345		 *  - For a CRTC which is enabled at the end of the commit (even when it
   346		 *    undergoes an full modeset) the vblank timestamp and counter must
   347		 *    be for the vblank right before the first frame that scans out the
   348		 *    new set of buffers. Again the event can only be sent out after the
   349		 *    hardware has stopped scanning out the old buffers.
   350		 *
   351		 *  - Events for disabled CRTCs are not allowed, and drivers can ignore
   352		 *    that case.
   353		 *
   354		 * For very simple hardware without VBLANK interrupt, enabling
   355		 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
   356		 * send a fake VBLANK event at the end of the display update after all
   357		 * hardware changes have been applied. See
   358		 * drm_atomic_helper_fake_vblank().
   359		 *
   360		 * For more complex hardware this
   361		 * can be handled by the drm_crtc_send_vblank_event() function,
   362		 * which the driver should call on the provided event upon completion of
   363		 * the atomic commit. Note that if the driver supports vblank signalling
   364		 * and timestamping the vblank counters and timestamps must agree with
   365		 * the ones returned from page flip events. With the current vblank
   366		 * helper infrastructure this can be achieved by holding a vblank
   367		 * reference while the page flip is pending, acquired through
   368		 * drm_crtc_vblank_get() and released with drm_crtc_vblank_put().
   369		 * Drivers are free to implement their own vblank counter and timestamp
   370		 * tracking though, e.g. if they have accurate timestamp registers in
   371		 * hardware.
   372		 *
   373		 * For hardware which supports some means to synchronize vblank
   374		 * interrupt delivery with committing display state there's also
   375		 * drm_crtc_arm_vblank_event(). See the documentation of that function
   376		 * for a detailed discussion of the constraints it needs to be used
   377		 * safely.
   378		 *
   379		 * If the device can't notify of flip completion in a race-free way
   380		 * at all, then the event should be armed just after the page flip is
   381		 * committed. In the worst case the driver will send the event to
   382		 * userspace one frame too late. This doesn't allow for a real atomic
   383		 * update, but it should avoid tearing.
   384		 */
   385		struct drm_pending_vblank_event *event;
   386	
   387		/**
   388		 * @commit:
   389		 *
   390		 * This tracks how the commit for this update proceeds through the
   391		 * various phases. This is never cleared, except when we destroy the
   392		 * state, so that subsequent commits can synchronize with previous ones.
   393		 */
   394		struct drm_crtc_commit *commit;
   395	
   396		/** @state: backpointer to global drm_atomic_state */
   397		struct drm_atomic_state *state;
 > 398	};
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
