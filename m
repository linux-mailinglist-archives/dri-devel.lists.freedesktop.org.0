Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FCBAFCA6F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E1E10E625;
	Tue,  8 Jul 2025 12:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TI/zRKxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F36410E623
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 12:30:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so28810665e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1751977831; x=1752582631; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rx4dEYIe9NApnwnQS011msr/FrxauQfjNeWI/gfP9UA=;
 b=TI/zRKxHBhoVYKWdZFUUbDq0WMdtCCMWtVr2kTII3t9woX1WGwcAflQmaNgDermo8A
 SrqRbfVAdA0osISy12A+ujv8u5u2PvJxiTFhluIyrxT17NwsvHLOIbZwt9JZZjhpZpby
 qAR/tAADRHbcYyDfrTV/DD6+9TBLXCZqQoQDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751977831; x=1752582631;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rx4dEYIe9NApnwnQS011msr/FrxauQfjNeWI/gfP9UA=;
 b=LMwouPExsrFWaqRv5j4eNMyG6uv8UEhFW3uRixMXLt1FN211TJ/Wk92tUAWkDgpT8p
 L8b19lQSUyekWueKjqpnnrjPM0ZmHmfLoMS2DfOl97lu+GpYb3pJxcxpIeVR7leYiGa/
 5oPbSkIK7jLEtyDArqxXVEJy3il8Q98GVhS0VJr0WqgtThqKgO2IDkSC8jRfoGO94v5F
 SKwSAtkVQdzETOh8xCzpmHyeLyo+tCef+Pz/wG/ivN8zHxYAk0kwFmDiPoR8PVj9n5GK
 M/GGxOX5sAPyL7LNqIkSzojKHaReccuL6I/GPGJbs5lLkjJUYGyqJNvht3Gg3b5MwR+B
 KO3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnPeIBxaCvnoBa6B/S8ftSpFhTtgVZhPSNvl1OLJK/oqTbqhoiR6tNUsoH6S7di9lEYoM/j1+mDlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUPYXrNhbctlDiadWFvHBX6YwJWcHABeUCN0c9ETXX32Dh5I34
 CIUIsQVaEDbSaFfFj7OHMPhcEsMi7m5Oceil9H8330GrtPlWlRBhX0Q8h6xcyen+Rpk=
X-Gm-Gg: ASbGncs1FUFJpFDl7cY4anqjNyvssc6DDvreXiJUvDqq3KG8yat7f9rBtbA2/W/Wqve
 wFlno6Qnih4+1nesoNftXAxbLuFei6WWzQsQITBa91zuXKyxAiQ3hMfAbI/5KvCearEkQ88kPfH
 Bh2SU1FsFuuIzIDcz+IHpCAIqbpqeKa0xsvowldNoAEAavjdX/RcKin005Xe6RDH7cs5NRId9Wc
 wiGfC9nsUfYxLaJg47QmYnXBZ0PbXbeiO3cv+J2NoJiHvjQdoH1WInJmRSK+dEzYrkmjwp8e2eS
 vXWq9WIRPkL74PLVhB+lj383WeK+BpnXZP7YBa6eHczPg+WRjB5ZwwVw+GKW8o27SBWFBFAuZw=
 =
X-Google-Smtp-Source: AGHT+IGFCtyxdkJRl2xMrrw9ZsAUEciqwZGICfS5Uhp/jUouorN8c1RFjyeIjLfpmrxrKaAe5Mx32Q==
X-Received: by 2002:a05:600c:3492:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-454cd4bb4f5mr25084645e9.12.1751977830363; 
 Tue, 08 Jul 2025 05:30:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd3a50cbsm20974235e9.18.2025.07.08.05.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 05:30:29 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:30:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-next
Message-ID: <aG0PY7k6x4S8ji3b@phenom.ffwll.local>
References: <6d728bf6ef23681b00dfbc7da9aeae41042dee02@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d728bf6ef23681b00dfbc7da9aeae41042dee02@intel.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Fri, Jul 04, 2025 at 01:29:23PM +0300, Jani Nikula wrote:
> 
> Hi Dave & Sima -
> 
> Here's the second i915 feature pull request for v6.17, mostly just
> display changes.
> 
> Rodrigo will handle the subsequent (likely just fixes) pull requests for
> v6.17, if any.
> 
> 
> BR,
> Jani.
> 
> 
> drm-intel-next-2025-07-04:
> drm/i915 feature pull #2 for v6.17:
> 
> Features and functionality:
> - Add drm_panic support for both i915 and xe drivers (Jocelyn Falempe)
> - Add initial flip queue implementation, disabled by default, for LNL and PTL
>   (Ville)
> - Add support for Wildcat Lake (WCL) display, version 30.02 (Matt Roper, Matt
>   Atwood, Dnyaneshwar)
> - Extend drm_panel and follower support to DDI eDP (Arun)
> 
> Refactoring and cleanups:
> - Make all global state objects opaque (Jani)
> - Move display works to display specific unordered workqueue (Luca)
> - Add and use struct drm_device based pcode interface (Jani, Lucas)
> - Use clamp() instead of max()+min() combo (Ankit)
> - Simplify wait for power well disable (Jani)
> - Various stylistics cleanups and renames (Jani)
> 
> Fixes:
> - Deal with loss of pipe DMC state (Ville)
> - Fix PTL HDCP2 stream status check (Suraj)
> - Add workaround for ADL-P DKL PHY DP and HDMI (Nemesa)
> - Fix skl_print_wm_changes() stack usage with KMSAN (Arnd Bergmann)
> - Fix PCON capability reads on non-branch devices (Chaitanya)
> - Fix which platforms have ultra joiner (Ankit)
> 
> DRM core changes:
> - Add ttm_bo_kmap_try_from_panic() for xe drm_panic support (Jocelyn Falempe)
> - Add private pointer to struct drm_scanout buffer for xe/i915 drm_panic support
>   (Jocelyn Falempe)
> 
> Merges:
> - Backmerge drm-next for drm_panel and xe changes (Jani)
> 
> BR,
> Jani.
> 
> The following changes since commit 36c52fb703e90388285963fc8f03cf60f76cbe4c:
> 
>   Merge tag 'drm-intel-next-2025-06-18' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2025-06-23 10:49:27 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-07-04

Pulled into drm-next, thanks.
-Sima

> 
> for you to fetch changes up to d6a59ee852758bc69c4cc821954db277a2bd5b93:
> 
>   drm/ttm: Remove unneeded blank line in comment (2025-07-02 13:31:20 -0700)
> 
> ----------------------------------------------------------------
> drm/i915 feature pull #2 for v6.17:
> 
> Features and functionality:
> - Add drm_panic support for both i915 and xe drivers (Jocelyn Falempe)
> - Add initial flip queue implementation, disabled by default, for LNL and PTL
>   (Ville)
> - Add support for Wildcat Lake (WCL) display, version 30.02 (Matt Roper, Matt
>   Atwood, Dnyaneshwar)
> - Extend drm_panel and follower support to DDI eDP (Arun)
> 
> Refactoring and cleanups:
> - Make all global state objects opaque (Jani)
> - Move display works to display specific unordered workqueue (Luca)
> - Add and use struct drm_device based pcode interface (Jani, Lucas)
> - Use clamp() instead of max()+min() combo (Ankit)
> - Simplify wait for power well disable (Jani)
> - Various stylistics cleanups and renames (Jani)
> 
> Fixes:
> - Deal with loss of pipe DMC state (Ville)
> - Fix PTL HDCP2 stream status check (Suraj)
> - Add workaround for ADL-P DKL PHY DP and HDMI (Nemesa)
> - Fix skl_print_wm_changes() stack usage with KMSAN (Arnd Bergmann)
> - Fix PCON capability reads on non-branch devices (Chaitanya)
> - Fix which platforms have ultra joiner (Ankit)
> 
> DRM core changes:
> - Add ttm_bo_kmap_try_from_panic() for xe drm_panic support (Jocelyn Falempe)
> - Add private pointer to struct drm_scanout buffer for xe/i915 drm_panic support
>   (Jocelyn Falempe)
> 
> Merges:
> - Backmerge drm-next for drm_panel and xe changes (Jani)
> 
> ----------------------------------------------------------------
> Ankit Nautiyal (3):
>       drm/i915/snps_hdmi_pll: Fix 64-bit divisor truncation by using div64_u64
>       drm/i915/snps_hdmi_pll: Use clamp() instead of max(min())
>       drm/i915/display: Fix macro HAS_ULTRAJOINER
> 
> Arnd Bergmann (1):
>       drm/i915/wm: reduce stack usage in skl_print_wm_changes()
> 
> Arun R Murthy (1):
>       drm/i915/panel: register drm_panel and call prepare/unprepare for eDP
> 
> Chaitanya Kumar Borah (1):
>       drm/xe/display: read PCON capability only when present
> 
> Dan Carpenter (1):
>       drm/i915/selftests: Change mock_request() to return error pointers
> 
> Dnyaneshwar Bhadane (3):
>       drm/i915/xe3lpd: Extend DMC load path for display
>       drm/i915/wcl: C10 phy connected to port A and B
>       drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02
> 
> Hans de Goede (1):
>       drm/i915/dsi: Fix NULL pointer deref in vlv_dphy_param_init()
> 
> Jani Nikula (37):
>       drm/i915/vrr: fix register file style
>       drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
>       drm/i915/plane: drop atomic from intel_atomic_plane_check_clipping()
>       drm/i915/plane: make intel_plane_atomic_check() static and rename
>       drm/i915/plane: rename intel_atomic_check_planes() to intel_plane_atomic_check()
>       drm/i915/plane: rename intel_atomic_add_affected_planes() to intel_plane_add_affected()
>       Merge drm/drm-next into drm-intel-next
>       drm/i915/panel: make panel funcs static
>       drm/i915/pcode: drop fast wait from snb_pcode_write_timeout()
>       drm/i915/pcode: add struct drm_device based interface
>       drm/xe/pcode: add struct drm_device based interface
>       drm/i915/display: switch to struct drm_device based pcode interface
>       drm/i915/dram: switch to struct drm_device based pcode interface
>       drm/xe/compat: remove old pcode compat interface
>       drm/i915: remove unused DISPLAY_PLANE_FLIP_PENDING() macro
>       drm/i915/wm: abstract intel_dbuf_pmdemand_needs_update()
>       drm/i915/wm: add more accessors to dbuf state
>       drm/i915/wm: make struct intel_dbuf_state opaque type
>       drm/i915/bw: abstract intel_bw_pmdemand_needs_update()
>       drm/i915/bw: relocate intel_can_enable_sagv() and rename to intel_bw_can_enable_sagv()
>       drm/i915: move icl_sagv_{pre, post}_plane_update() to intel_bw.c
>       drm/i915/bw: abstract intel_bw_qgv_point_peakbw()
>       drm/i915/bw: make struct intel_bw_state opaque
>       drm/i915/cdclk: abstract intel_cdclk_logical()
>       drm/i915/cdclk: abstract intel_cdclk_min_cdclk()
>       drm/i915/cdclk: abstract intel_cdclk_bw_min_cdclk()
>       drm/i915/cdclk: abstract intel_cdclk_pmdemand_needs_update()
>       drm/i915/cdclk: abstract intel_cdclk_force_min_cdclk()
>       drm/i915/cdclk: abstract intel_cdclk_read_hw()
>       drm/i915/cdclk: abstract intel_cdclk_actual() and intel_cdclk_actual_voltage_level()
>       drm/i915/cdclk: make struct intel_cdclk_state opaque
>       drm/i915/power: move enum skl_power_gate under display
>       drm/i915/power: relocate {SKL,ICL}_PW_CTL_IDX_TO_PG()
>       drm/i915/power: convert {SKL, ICL}_PW_CTL_IDX_TO_PG() macros to a function
>       drm/i915/fb: use struct intel_display for DISPLAY_VER()
>       drm/i915/display: drop a number of dependencies on i915_drv.h
>       drm/i915/power: use intel_de_wait_for_clear() instead of wait_for()
> 
> Jocelyn Falempe (12):
>       drm/panic: Add a private field to struct drm_scanout_buffer
>       drm/i915/fbdev: Add intel_fbdev_get_map()
>       drm/i915/display/i9xx: Add a disable_tiling() for i9xx planes
>       drm/i915/display: Add a disable_tiling() for skl planes
>       drm/ttm: Add ttm_bo_kmap_try_from_panic()
>       drm/i915: Add intel_bo_alloc_framebuffer()
>       drm/i915: Add intel_bo_panic_setup() and intel_bo_panic_finish()
>       drm/i915/display: Add drm_panic support
>       drm/i915/display: Add drm_panic support for Y-tiling with DPT
>       drm/i915/display: Add drm_panic support for 4-tiling with DPT
>       drm/i915/psr: Add intel_psr2_panic_force_full_update
>       drm/ttm: Remove unneeded blank line in comment
> 
> Luca Coelho (1):
>       drm/i915/display: move unordered works to new private workqueue
> 
> Lucas De Marchi (1):
>       drm/xe: Fix conflicting intel_pcode_* symbols
> 
> Matt Atwood (2):
>       drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
>       drm/i915: Set max cdclk for display 30.02
> 
> Matt Roper (1):
>       drm/i915/xe3lpd: Add support for display version 30.02
> 
> Nemesa Garg (1):
>       drm/i915/display: Implement wa_16011342517
> 
> Suraj Kandpal (2):
>       drm/i915/hdcp: Do not use inline intel_de_read
>       drm/i915/hdcp: Use HDCP2_STREAM_STATUS instead of HDCP2_AUTH_STREAM
> 
> Ville Syrjälä (16):
>       drm/i915/dmc: Limit pipe DMC clock gating w/a to just ADL/DG2/MTL
>       drm/i915/dmc: Parametrize MTL_PIPEDMC_GATING_DIS
>       drm/i915/dmc: Shuffle code around
>       drm/i915/dmc: Extract dmc_load_program()
>       drm/i915/dmc: Reload pipe DMC state on TGL when enabling pipe A
>       drm/i915/dmc: Reload pipe DMC MMIO registers for pipe C/D on various platforms
>       drm/i915/dmc: Assert DMC is loaded harder
>       drm/i915/dmc: Pass crtc_state to intel_dmc_{enable,disable}_pipe()
>       drm/i915/dmc: Do not enable the pipe DMC on TGL when PSR is possible
>       drm/i915: Set PKG_C_LATENCY.added_wake_time to 0
>       drm/i915: Try to program PKG_C_LATENCY more correctly
>       drm/i915/dmc: Define flip queue related PIPEDMC registers
>       drm/i915/flipq: Provide the nuts and bolts code for flip queue
>       drm/i915/flipq: Implement flip queue based commit path
>       drm/i915/flipq: Implement Wa_18034343758
>       drm/i915/flipq: Add intel_flipq_dump()
> 
>  Documentation/gpu/i915.rst                         |  10 +-
>  drivers/gpu/drm/i915/Makefile                      |   5 +-
>  drivers/gpu/drm/i915/display/hsw_ips.c             |  15 +-
>  drivers/gpu/drm/i915/display/i9xx_plane.c          |  36 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c        |   2 +-
>  drivers/gpu/drm/i915/display/intel_audio.c         |   2 +-
>  drivers/gpu/drm/i915/display/intel_bo.c            |  17 +
>  drivers/gpu/drm/i915/display/intel_bo.h            |   5 +
>  drivers/gpu/drm/i915/display/intel_bw.c            | 188 ++++++--
>  drivers/gpu/drm/i915/display/intel_bw.h            |  53 +--
>  drivers/gpu/drm/i915/display/intel_cdclk.c         | 156 +++++--
>  drivers/gpu/drm/i915/display/intel_cdclk.h         |  50 +--
>  drivers/gpu/drm/i915/display/intel_connector.c     |   4 +-
>  drivers/gpu/drm/i915/display/intel_crtc.c          |   2 +-
>  drivers/gpu/drm/i915/display/intel_cursor.c        |  10 +-
>  drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   8 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c           |  20 +
>  drivers/gpu/drm/i915/display/intel_display.c       |  79 +++-
>  drivers/gpu/drm/i915/display/intel_display_core.h  |   9 +
>  .../gpu/drm/i915/display/intel_display_device.c    |   1 +
>  .../gpu/drm/i915/display/intel_display_device.h    |   5 +-
>  .../gpu/drm/i915/display/intel_display_driver.c    |  39 +-
>  drivers/gpu/drm/i915/display/intel_display_irq.c   |   2 +-
>  .../gpu/drm/i915/display/intel_display_params.c    |   3 +
>  .../gpu/drm/i915/display/intel_display_params.h    |   1 +
>  drivers/gpu/drm/i915/display/intel_display_power.c |   4 +-
>  .../drm/i915/display/intel_display_power_well.c    |  44 +-
>  drivers/gpu/drm/i915/display/intel_display_regs.h  |  21 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |  24 ++
>  drivers/gpu/drm/i915/display/intel_dkl_phy_regs.h  |   1 +
>  drivers/gpu/drm/i915/display/intel_dmc.c           | 457 ++++++++++++++------
>  drivers/gpu/drm/i915/display/intel_dmc.h           |  18 +-
>  drivers/gpu/drm/i915/display/intel_dmc_regs.h      | 190 +++++++++
>  drivers/gpu/drm/i915/display/intel_dmc_wl.c        |   4 +-
>  drivers/gpu/drm/i915/display/intel_dp.c            |   3 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       |  20 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c          |   7 +-
>  drivers/gpu/drm/i915/display/intel_encoder.c       |   5 +-
>  drivers/gpu/drm/i915/display/intel_fb.c            |   8 +-
>  drivers/gpu/drm/i915/display/intel_fb_pin.c        |   7 +-
>  drivers/gpu/drm/i915/display/intel_fb_pin.h        |   2 +
>  drivers/gpu/drm/i915/display/intel_fbc.c           |   6 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c         |   5 +
>  drivers/gpu/drm/i915/display/intel_fbdev.h         |   6 +-
>  drivers/gpu/drm/i915/display/intel_flipq.c         | 472 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_flipq.h         |  37 ++
>  drivers/gpu/drm/i915/display/intel_hdcp.c          |  27 +-
>  drivers/gpu/drm/i915/display/intel_hdcp_regs.h     |   4 +-
>  drivers/gpu/drm/i915/display/intel_hotplug.c       |  12 +-
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_opregion.c      |   7 +-
>  drivers/gpu/drm/i915/display/intel_panel.c         |   5 +-
>  .../{intel_atomic_plane.c => intel_plane.c}        | 199 ++++++++-
>  .../{intel_atomic_plane.h => intel_plane.h}        |  22 +-
>  drivers/gpu/drm/i915/display/intel_plane_initial.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_pmdemand.c      |  41 +-
>  drivers/gpu/drm/i915/display/intel_pps.c           |   7 +-
>  drivers/gpu/drm/i915/display/intel_psr.c           |  31 +-
>  drivers/gpu/drm/i915/display/intel_psr.h           |   2 +
>  drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c |   8 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c        |  14 +-
>  drivers/gpu/drm/i915/display/intel_vrr_regs.h      | 121 +++---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  36 +-
>  drivers/gpu/drm/i915/display/skl_watermark.c       | 452 ++++++++++----------
>  drivers/gpu/drm/i915/display/skl_watermark.h       |  33 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c             |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h         |   6 +
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c          | 142 +++++++
>  drivers/gpu/drm/i915/i915_reg.h                    |  14 +-
>  drivers/gpu/drm/i915/i915_vma.h                    |   5 +
>  drivers/gpu/drm/i915/intel_pcode.c                 |  29 +-
>  drivers/gpu/drm/i915/intel_pcode.h                 |  15 +-
>  drivers/gpu/drm/i915/selftests/i915_request.c      |  20 +-
>  drivers/gpu/drm/i915/selftests/mock_request.c      |   2 +-
>  drivers/gpu/drm/i915/soc/intel_dram.c              |   5 +-
>  drivers/gpu/drm/ttm/ttm_bo_util.c                  |  26 ++
>  drivers/gpu/drm/xe/Makefile                        |   3 +-
>  .../gpu/drm/xe/compat-i915-headers/intel_pcode.h   |  31 --
>  .../gpu/drm/xe/compat-i915-headers/intel_uncore.h  |   7 -
>  drivers/gpu/drm/xe/display/intel_bo.c              |  91 ++++
>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |   5 +
>  drivers/gpu/drm/xe/display/xe_plane_initial.c      |   2 +-
>  drivers/gpu/drm/xe/xe_pcode.c                      |  30 ++
>  drivers/gpu/drm/xe/xe_pcode.h                      |  12 +-
>  include/drm/drm_panic.h                            |   6 +
>  include/drm/ttm/ttm_bo.h                           |   1 +
>  86 files changed, 2638 insertions(+), 904 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_flipq.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_flipq.h
>  rename drivers/gpu/drm/i915/display/{intel_atomic_plane.c => intel_plane.c} (89%)
>  rename drivers/gpu/drm/i915/display/{intel_atomic_plane.h => intel_plane.h} (86%)
> 
> -- 
> Jani Nikula, Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
