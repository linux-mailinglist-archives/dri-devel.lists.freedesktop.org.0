Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57B84E2C9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFA110E7C5;
	Thu,  8 Feb 2024 14:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHf9tqS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FF310E7AB;
 Thu,  8 Feb 2024 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707401125; x=1738937125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Rc37Vl+zcCyuLl5+ZxhsZB7XssNUYeEo7VyzgVpqPVI=;
 b=oHf9tqS0YHQcHn95k7kE6+91sj5HGvgkBb8UFiwihZgahx3VxCIBLDG5
 YubLnoVqvAbBhI27LN51eGYTg3vBNSPXdmDb30+DdAswwH2L1Gm/o3kU1
 Qj2xZinjU5js+Pb/UMle/aKACU1JPlRD+TaXyUkKUt9gtJgDBCbCts4UQ
 1j4cixxutWKej2c0njrfc4MhwcYJXPrRM1r/w/Hmg2bjuQbodL786zpdF
 2NjrDODBgrqQ95T6D5wu1VCFEIcM9xSRWRaHT7w5zT33q+6cATxvzJvJe
 qsOb7uqzXe0rDG7y3+tziLLlq+4Zbnp/X15IQT1B9ovsxq/0B1fg4DT8z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1519530"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1519530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="39093061"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:05:20 -0800
Date: Thu, 8 Feb 2024 15:05:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH i-g-t] benchmarks: Add VKMS benchmark
Message-ID: <20240208140501.dzhnel2haqwhgsr4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240207-bench-v1-1-7135ad426860@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240207-bench-v1-1-7135ad426860@riseup.net>
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

Hi Arthur,
On 2024-02-07 at 17:17:15 -0300, Arthur Grillo wrote:
> Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
> odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
> frames flipping framebuffers in each plane.
> 
> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> This benchmark was suggested by Pekka Paalanen on [1] to better analyse
> possible performance regression on the Virtual Kernel Modesetting(VKMS)
> driver.
> 
> With this benchmark I was able to determine two performance regression:
> 
> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
> 
> [1]: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
> ---
>  benchmarks/meson.build   |   1 +
>  benchmarks/vkms_stress.c | 203 +++++++++++++++++++++++++++++++++++++++++++++++
------------- ^^^^
Why did you named it vkms? Below at drm_open you use DRM_DRIVER_ANY
so rename it to something else? For example:

kms_fb_stress

Regards,
Kamil

>  2 files changed, 204 insertions(+)
> 
> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> index c451268bc44f..3aa66d6dffe2 100644
> --- a/benchmarks/meson.build
> +++ b/benchmarks/meson.build
> @@ -20,6 +20,7 @@ benchmark_progs = [
>  	'kms_vblank',
>  	'prime_lookup',
>  	'vgem_mmap',
> +	'vkms_stress',
>  ]
>  
>  benchmarksdir = join_paths(libexecdir, 'benchmarks')
> diff --git a/benchmarks/vkms_stress.c b/benchmarks/vkms_stress.c
> new file mode 100644
> index 000000000000..b9128c208861
> --- /dev/null
> +++ b/benchmarks/vkms_stress.c
> @@ -0,0 +1,203 @@
> +/*
> + * Copyright © 2024 Arthur Grillo
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *    Arthur Grillo <arthurgrillo@riseup.net>
> + *
> + */
> +
> +#include "igt.h"
> +
> +#define FRAME_COUNT 100
> +
> +struct rect_t {
> +	int x, y;
> +	int width, height;
> +};
> +
> +struct plane_t {
> +	igt_plane_t *base;
> +	struct rect_t rect;
> +	uint32_t format;
> +	struct igt_fb fbs[2];
> +};
> +
> +struct kms_t {
> +	struct plane_t primary;
> +	struct plane_t overlay_a;
> +	struct plane_t overlay_b;
> +	struct plane_t writeback;
> +};
> +
> +struct data_t {
> +	int fd;
> +	igt_display_t display;
> +	igt_output_t *wb_output;
> +	drmModeModeInfo *mode;
> +	struct kms_t kms;
> +};
> +
> +static void plane_create_fb(struct plane_t *plane, int fd, size_t index)
> +{
> +	igt_create_fb(fd, plane->rect.width, plane->rect.height,
> +			plane->format, DRM_FORMAT_MOD_LINEAR,
> +			&plane->fbs[index]);
> +}
> +
> +static void plane_create_color_fb(struct plane_t *plane, int fd, size_t index, double r, double g,
> +				   double b)
> +{
> +	igt_create_color_fb(fd, plane->rect.width, plane->rect.height,
> +			plane->format, DRM_FORMAT_MOD_LINEAR,
> +			r, g, b,
> +			&plane->fbs[index]);
> +}
> +
> +static void plane_setup(struct plane_t *plane, int index)
> +{
> +	igt_plane_set_size(plane->base, plane->rect.width, plane->rect.height);
> +	igt_plane_set_position(plane->base, plane->rect.x, plane->rect.y);
> +	igt_plane_set_fb(plane->base, &plane->fbs[index]);
> +}
> +
> +static void gen_fbs(struct data_t *data)
> +{
> +	struct kms_t *kms = &data->kms;
> +	drmModeModeInfo *mode = igt_output_get_mode(data->wb_output);
> +
> +	for (int i = 0; i < 2; i++) {
> +		plane_create_color_fb(&kms->primary, data->fd, i, !i, i, i);
> +
> +		plane_create_color_fb(&kms->overlay_a, data->fd, i, i, !i, i);
> +
> +		plane_create_color_fb(&kms->overlay_b, data->fd, i, i, i, !i);
> +
> +		kms->writeback.rect.width = mode->hdisplay;
> +		kms->writeback.rect.height = mode->vdisplay;
> +		plane_create_fb(&kms->writeback, data->fd, i);
> +	}
> +}
> +
> +static igt_output_t *find_wb_output(struct data_t *data)
> +{
> +	for (int i = 0; i < data->display.n_outputs; i++) {
> +		igt_output_t *output = &data->display.outputs[i];
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
> +			continue;
> +
> +		return output;
> +
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct kms_t default_kms = {
> +	.primary = {
> +		.rect = {
> +			.x = 101, .y = 0,
> +			.width = 3639, .height = 2161,
> +		},
> +		.format = DRM_FORMAT_XRGB8888,
> +	},
> +	.overlay_a = {
> +		.rect = {
> +			.x = 201, .y = 199,
> +			.width = 3033, .height = 1777,
> +		},
> +		.format = DRM_FORMAT_XRGB16161616,
> +	},
> +	.overlay_b = {
> +		.rect = {
> +			.x = 1800, .y = 250,
> +			.width = 1507, .height = 1400,
> +		},
> +		.format = DRM_FORMAT_ARGB8888,
> +	},
> +	.writeback = {
> +		.rect = {
> +			.x = 0, .y = 0,
> +			// Size is to be determined at runtime
> +		},
> +		.format = DRM_FORMAT_XRGB8888,
> +	},
> +};
> +
> +
> +igt_simple_main
> +{
> +	struct data_t data;
> +	enum pipe pipe = PIPE_NONE;
> +
> +	data.kms = default_kms;
> +
> +	data.fd = drm_open_driver_master(DRIVER_ANY);
> +
> +	igt_display_require(&data.display, data.fd);
> +
> +	kmstest_set_vt_graphics_mode();
> +
> +	igt_display_require(&data.display, data.fd);
> +	igt_require(data.display.is_atomic);
> +
> +	igt_display_require_output(&data.display);
> +
> +	igt_require(data.wb_output);
> +	igt_display_reset(&data.display);
> +
> +	data.wb_output = find_wb_output(&data);
> +
> +	for_each_pipe(&data.display, pipe) {
> +		igt_debug("Selecting pipe %s to %s\n",
> +			  kmstest_pipe_name(pipe),
> +			  igt_output_name(data.wb_output));
> +		igt_output_set_pipe(data.wb_output, pipe);
> +	}
> +
> +	igt_display_commit_atomic(&data.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	gen_fbs(&data);
> +
> +	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
> +	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
> +								  DRM_PLANE_TYPE_OVERLAY, 0);
> +	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
> +								  DRM_PLANE_TYPE_OVERLAY, 1);
> +
> +	for (int i = 0; i < FRAME_COUNT; i++) {
> +		int fb_index = i % 2;
> +
> +		plane_setup(&data.kms.primary, fb_index);
> +
> +		plane_setup(&data.kms.overlay_a, fb_index);
> +
> +		plane_setup(&data.kms.overlay_b, fb_index);
> +
> +		igt_output_set_writeback_fb(data.wb_output, &data.kms.writeback.fbs[fb_index]);
> +
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +	}
> +
> +	igt_display_fini(&data.display);
> +	drm_close_driver(data.fd);
> +}
> 
> ---
> base-commit: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc
> change-id: 20240207-bench-393789eaba47
> 
> Best regards,
> -- 
> Arthur Grillo <arthurgrillo@riseup.net>
> 
