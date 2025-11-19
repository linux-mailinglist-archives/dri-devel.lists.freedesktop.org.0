Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D08C6ED24
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716FD10E600;
	Wed, 19 Nov 2025 13:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9VnQceM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B789A10E600;
 Wed, 19 Nov 2025 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763558532; x=1795094532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4RZRKm1mcuRVsrxxt4NCQnk2yOWNnSIUwiCToHWTDNw=;
 b=b9VnQceMppKLqbm7B45kyhvgJwX70uPRND9nwKo5Akp06Bej4kXYlVAq
 E+7JTs09TR3qFJDvlMJqw+2fW05Vs4S3N7j6u2n8QhgALFdgLsMkelHQR
 eqkGRfihHe6Pk62jyU3eAci3+8u0txgPSLnt43EsLx2wVkdw3CVi1oacL
 f3yyidy0HdHlLCMUdk06kFrFEwJ7rUtgZjQoKPrZK/BJBxXzNVxawz0eM
 zdHz+qrQVGukj0hR9McJViXcbrfEt5vflEetUv1iPF4qf1cGxyJwdQ/1D
 +pis1l5eB2cP6mmLx2oCTAcmqnhvXlNV/ZOmzf7hbDzWnoWR8cx4/s6GE g==;
X-CSE-ConnectionGUID: pUPbkC/TTm+jc89CZWIIQg==
X-CSE-MsgGUID: ADV4SbLtSle87Tt25wMloA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65494295"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65494295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 05:22:11 -0800
X-CSE-ConnectionGUID: CK+7W/OXTIGCo7oW8YMnuw==
X-CSE-MsgGUID: fc3Qou9dRyuGausIOGMSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191090175"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:22:08 -0800
Date: Wed, 19 Nov 2025 14:21:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests: (Re)add kms_crtc_background_color test
Message-ID: <20251119132149.spbl5k3dmj2lwzon@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251110-crtc-bgcolor-v1-1-28669b692970@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110-crtc-bgcolor-v1-1-28669b692970@collabora.com>
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

Hi Cristian,
On 2025-11-10 at 15:18:05 +0200, Cristian Ciocaltea wrote:
> Provide test to verify the behavior of BACKGROUND_COLOR DRM CRTC
> property.
> 
> This is done by filling a full-screen primary plane with a given color
> and comparing the resulting CRC with the one obtained after turning off
> all planes while having the CRTC background set to the same color.
> 
> It's worth noting this is a reworked version of the test that has been
> dropped over 5 years ago via commit 33f07391e5f6 ("tests: Remove
> kms_crtc_background_color test"), as the required kernel changes never
> landed because of missing userspace support.
> 
+cc J-P, Karthik, Swati
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

I have few nits, see below.

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> This has been tested on a Radxa ROCK 5B board which is based on Rockchip
> RK3588 SoC.  It relies on the kernel series [1] introducing the
> BACKGROUND_COLOR CRTC property and a few additional patches from [2]
> enabling the required CRC functionality for the Rockchip platform (still
> require a bit more work before sending those upstream).
> 
> It's worth noting CRC is only supported by the display controller (VOP2)
> present in the RK3576 SoC variant.  However, the computation is done by
> the hardware before applying the background color, hence it has limited
> usage in IGT testing.
> 
> Luckily, the frame CRCs can be captured through DPCD, i.e. at
> DisplayPort AUX channel level, hence I used the USB-C DP AltMode capable
> port of the aforementioned board to perform the actual validation.
> 
> [1] https://lore.kernel.org/all/20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com/
> [2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/cristicc/rk3588-vop2-crc
> 
> root@rock5b$ cat /sys/kernel/debug/dri/1/vop2/summary
> 
> cat /sys/kernel/debug/dri/1/vop2/summary
> Video Port0: DISABLED
> Video Port1: DISABLED
> Video Port2: ACTIVE
>     Connector: DP-1
> 	bus_format[1018]: RGB101010_1X30
> 	output_mode[f] color_space[0]
> 	background color (10bpc): r=0x0 g=0x0 b=0x0
>     Display mode: 3840x2160p60
> 	clk[594000] real_clk[594000] type[48] flag[9]
> 	H: 3840 4016 4104 4400
> 	V: 2160 2164 2174 2250
>     Cluster2-win0: ACTIVE
> 	win_id: 2
> 	format: XR24 little-endian (0x34325258) glb_alpha[0xff]
> 	rotate: xmirror: 0 ymirror: 0 rotate_90: 0 rotate_270: 0
> 	zpos: 0
> 	src: pos[0, 0] rect[3840 x 2160]
> 	dst: pos[0, 0] rect[3840 x 2160]
> 	buf[0]: addr: 0x0000000000000000 pitch: 15360 offset: 0
> 
> root@rock5b$ ./kms_crtc_background_color --device drm:/dev/dri/card1
> 
> IGT-Version: 2.2-g3e4ec308e (aarch64) (Linux: 6.18.0-rc1 aarch64)
> Using IGT_SRANDOM=1762774806 for randomisation
> Opened device: /dev/dri/card1
> Starting subtest: background-color-red
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.491s)
> Subtest background-color-red: SUCCESS (0.493s)
> Starting subtest: background-color-green
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.533s)
> Subtest background-color-green: SUCCESS (0.535s)
> Starting subtest: background-color-blue
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.541s)
> Subtest background-color-blue: SUCCESS (0.544s)
> Starting subtest: background-color-yellow
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
> Subtest background-color-yellow: SUCCESS (0.537s)
> Starting subtest: background-color-purple
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.536s)
> Subtest background-color-purple: SUCCESS (0.538s)
> Starting subtest: background-color-cyan
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.539s)
> Subtest background-color-cyan: SUCCESS (0.541s)
> Starting subtest: background-color-black
> Starting dynamic subtest: pipe-C-DP-1
> (kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
> (kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
> (kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
> (kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
> Subtest background-color-black: SUCCESS (0.537s)
> Starting subtest: background-color-white
> Starting dynamic subtest: pipe-C-DP-1
> Dynamic subtest pipe-C-DP-1: SUCCESS (0.540s)
> Subtest background-color-white: SUCCESS (0.542s)
> ---
>  lib/igt_kms.c                     |   1 +
>  lib/igt_kms.h                     |   3 +-
>  tests/kms_crtc_background_color.c | 139 ++++++++++++++++++++++++++++++++++++++
>  tests/meson.build                 |   1 +
>  4 files changed, 143 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 9208c8dbfc86..7c0848865038 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -705,6 +705,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>  };
>  
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> +	[IGT_CRTC_BACKGROUND] = "BACKGROUND_COLOR",
>  	[IGT_CRTC_CTM] = "CTM",
>  	[IGT_CRTC_GAMMA_LUT] = "GAMMA_LUT",
>  	[IGT_CRTC_GAMMA_LUT_SIZE] = "GAMMA_LUT_SIZE",
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index eff76f0de0b3..a19f8d126a8d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -156,7 +156,8 @@ void kmstest_restore_vt_mode(void);
>  void kmstest_set_vt_text_mode(void);
>  
>  enum igt_atomic_crtc_properties {
> -       IGT_CRTC_CTM = 0,
> +       IGT_CRTC_BACKGROUND = 0,
> +       IGT_CRTC_CTM,
>         IGT_CRTC_GAMMA_LUT,
>         IGT_CRTC_GAMMA_LUT_SIZE,
>         IGT_CRTC_DEGAMMA_LUT,
> diff --git a/tests/kms_crtc_background_color.c b/tests/kms_crtc_background_color.c
> new file mode 100644
> index 000000000000..4e6d183b736d
> --- /dev/null
> +++ b/tests/kms_crtc_background_color.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2013,2014 Intel Corporation
> + * Copyright © 2025 Collabora, Ltd.
> + */
> +

Please add here:

/**
 * TEST: crtc background color
 * Category: Display
 * Description: Test background color feature with CRC at CRTC
 * Driver requirement: i915, xe
 * Mega feature: General Display Features
 */

Feel free to correct me with name and/or description.
Karthik or Swati, please also correct this if I made any
mistake here.

> +#include "igt.h"
> +
> +IGT_TEST_DESCRIPTION("Test crtc background color feature");
> +
> +typedef struct {
> +	int drm_fd;
> +	int debugfs;
> +	igt_display_t display;
> +} data_t;
> +
> +#define __DRM_ARGB64_PREP(c, shift, bpc)			\
> +	(((__u64)(c) << (16 - (bpc)) & 0xffffU) << (shift))
> +
> +#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)	\
> +	(__DRM_ARGB64_PREP(alpha, 48, bpc) |			\
> +	 __DRM_ARGB64_PREP(red,   32, bpc) |			\
> +	 __DRM_ARGB64_PREP(green, 16, bpc) |			\
> +	 __DRM_ARGB64_PREP(blue,   0, bpc))
> +
> +static void test_background(data_t *data, enum pipe pipe, igt_output_t *output,
> +			    __u16 red, __u16 green, __u16 blue)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_crc_t plane_crc, bg_crc;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_plane_t *plane;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode = igt_output_get_mode(output);
> +
> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	/* Fill the primary plane and set the background to the same color */
> +	igt_create_color_fb(data->drm_fd,
> +			    mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_NONE,
> +			    (double)red / 0xffff,
> +			    (double)green / 0xffff,
> +			    (double)blue / 0xffff,
> +			    &fb);
> +
> +	igt_plane_set_fb(plane, &fb);
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
> +				DRM_ARGB64_PREP_BPC(0xffff, red, green, blue, 8));
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
> +	igt_pipe_crc_collect_crc(pipe_crc, &plane_crc);
> +
> +	/* Turn off the primary plane so that only the background is visible */
> +	igt_plane_set_fb(plane, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_pipe_crc_collect_crc(pipe_crc, &bg_crc);
> +
> +	/*
> +	 * The test assumes hardware is able to generate valid CRCs when setting
> +	 * the background color. Some platforms, e.g. Intel, might require at
> +	 * least one plane to be visible before reading the pipe-level ("dmux")
> +	 * CRC. Other platforms, e.g. Rockchip, do not take background color
> +	 * into account when computing CRC at CRTC level.
> +	 * A possible workaround would be to use alternative CRC sources, e.g.
> +	 * where computation is performed at encoder or sink level.
> +	 */
> +	igt_assert_crc_equal(&plane_crc, &bg_crc);
> +
> +	/* Clean-up */
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_BACKGROUND,
> +				DRM_ARGB64_PREP_BPC(0xffff, 0, 0, 0, 8));
> +	igt_pipe_crc_free(pipe_crc);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit(display);
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +

Add here:

/**
 * SUBTEST: background-color-%s
 * Description: Tests %arg[1] in background color
 *
 * arg[1]:
 *
 * @red:      red
 * @green:    green
 * @blue:     blue
 * @yellow:   yellow
 * @purple:   purple
 * @cyan:     cyan
 * @black:    black
 * @white:    white
 */

With this it will compile and will be tested by Intel CI.

Regards,
Kamil

> +igt_main
> +{
> +	igt_output_t *output;
> +	data_t data = {};
> +	enum pipe pipe;
> +	int i;
> +
> +	struct {
> +		const char *color;
> +		__u16 red;
> +		__u16 green;
> +		__u16 blue;
> +	} tests[] = {
> +		{ "red",    0xffff, 0x0000, 0x0000, },
> +		{ "green",  0x0000, 0xffff, 0x0000, },
> +		{ "blue",   0x0000, 0x0000, 0xffff, },
> +		{ "yellow", 0xffff, 0xffff, 0x0000, },
> +		{ "purple", 0xffff, 0x0000, 0xffff, },
> +		{ "cyan",   0x0000, 0xffff, 0xffff, },
> +		{ "black",  0x0000, 0x0000, 0x0000, },
> +		{ "white",  0xffff, 0xffff, 0xffff, },
> +	};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		igt_require_pipe_crc(data.drm_fd);
> +
> +		data.debugfs = igt_debugfs_dir(data.drm_fd);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe_f("Test crtc background color %s", tests[i].color);
> +		igt_subtest_with_dynamic_f("background-color-%s", tests[i].color) {
> +			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				igt_require(igt_pipe_has_prop(&data.display, pipe,
> +							      IGT_CRTC_BACKGROUND));
> +
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +					test_background(&data, pipe, output, tests[i].red,
> +							tests[i].green, tests[i].blue);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 9736f2338507..06827b41a00c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -27,6 +27,7 @@ test_progs = [
>  	'kms_color',
>  	'kms_concurrent',
>  	'kms_content_protection',
> +	'kms_crtc_background_color',
>  	'kms_cursor_crc',
>  	'kms_cursor_edge_walk',
>  	'kms_cursor_legacy',
> 
> ---
> base-commit: 862eb176244feac8ee711f381fe1be1fdc6a7ede
> change-id: 20251110-crtc-bgcolor-f6ed9a58e0bf
> 
