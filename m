Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7E84F1C0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 09:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAC510F25B;
	Fri,  9 Feb 2024 08:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1vY/Hd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0649B10F25B;
 Fri,  9 Feb 2024 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707468886; x=1739004886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rdsRj+SKzaTNzp2uNmwq57wMHjqfz9uyyW2dCqZpMgg=;
 b=F1vY/Hd4omu5aagQHxC89NZoGeZ5I2cO1I9sRkjRHcfvBqTInhG33QZn
 7Wze1cx4wtD4LJWFhVqzCIM70zVh9/ABnliHYvObPesITrXJ12m0E2lIE
 v/j8x76HbRNFDvZnJF5Aufy8OO8xXX+6PPz9MA/b8daQwMpTr0bCA29jA
 ock5DoXdjMIqjUQN5y+N019WbhnpAPoV30WGHZn3v93TXquq77udUsBpg
 /o9moF6b7M8GufUY9LWBq36ZeWN2TBHc5SNMSxFwXTHMmqBT0+xnhMRSX
 fWgDdGcHiBNmSTSuDJniUo5DXjxlkAneuGVpfDPgO/qOtkwmILY7UWC8a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12766195"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12766195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:54:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="32682565"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 00:54:42 -0800
Date: Fri, 9 Feb 2024 09:54:20 +0100
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
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v2] benchmarks: Add VKMS benchmark
Message-ID: <20240209085420.6f7el7uxn7sharb3@kamilkon-desk.igk.intel.com>
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
 Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240208-bench-v2-1-1eccee1055ad@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208-bench-v2-1-1eccee1055ad@riseup.net>
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
On 2024-02-08 at 17:04:52 -0300, Arthur Grillo wrote:
> Create a benchmark for the VKMS driver. Use a KMS layout with deliberate
> odd sizes to try to avoid alignment accidents and run it for FRAME_COUNT
> frames flipping framebuffers in each plane.
> 
> This benchmark was suggested by Pekka Paalanen to better analyse
> possible performance regression on the Virtual Kernel Modesetting(VKMS)
> driver.
> 
> With this benchmark I was able to determine two performance regression:
> 
> - 322d716a3e8a ("drm/vkms: isolate pixel conversion functionality")
> - cc4fd2934d41 ("drm/vkms: Isolate writeback pixel conversion functions")
> 
> Link: https://lore.kernel.org/all/20240202214527.1d97c881@ferris.localdomain/
> Suggested-by: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> Changes in v2:
> - Zero initialize data
> - Don't wrap igt_create_* functions (Juha-Pekka Heikkila)
> - Add a `break;` when a pipe is found (Pekka Paalanen)
> - Rename file to kms_fb_stress.c (Kamil Konieczny)
> - Replace 2 by NUM_FBS (Juha-Pekka Heikkila)
> - Replace license text by SPDX License (Kamil Konieczny)
> - Move explanations to commit description (Kamil Konieczny)
> - Require output after find_wb_output() (Pekka Paalanen & Juha-Pekka
>   Heikkila)
> - Remove unnecessary commit (Pekka Paalanen)
> - Link to v1: https://lore.kernel.org/r/20240207-bench-v1-1-7135ad426860@riseup.net
> ---
>  benchmarks/kms_fb_stress.c | 176 +++++++++++++++++++++++++++++++++++++++++++++
>  benchmarks/meson.build     |   1 +
>  2 files changed, 177 insertions(+)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> new file mode 100644
> index 000000000000..af0014bed672
> --- /dev/null
> +++ b/benchmarks/kms_fb_stress.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Arthur Grillo
> + */
> +
> +#include "igt.h"
> +
> +#define FRAME_COUNT 100
> +#define NUM_FBS 2
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
> +	struct igt_fb fbs[NUM_FBS];
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
> +	for (int i = 0; i < NUM_FBS; i++) {
> +		igt_create_color_fb(data->fd, kms->primary.rect.width, kms->primary.rect.height,
> +				    kms->primary.format, DRM_FORMAT_MOD_LINEAR,
> +				    !i, i, i,
> +				    &kms->primary.fbs[i]);
> +
> +		igt_create_color_fb(data->fd, kms->overlay_a.rect.width, kms->overlay_a.rect.height,
> +				    kms->overlay_a.format, DRM_FORMAT_MOD_LINEAR,
> +				    i, !i, i,
> +				    &kms->overlay_a.fbs[i]);
> +
> +		igt_create_color_fb(data->fd, kms->overlay_b.rect.width, kms->overlay_b.rect.height,
> +				    kms->overlay_b.format, DRM_FORMAT_MOD_LINEAR,
> +				    i, i, !i,
> +				    &kms->overlay_b.fbs[i]);
> +
> +		kms->writeback.rect.width = mode->hdisplay;
> +		kms->writeback.rect.height = mode->vdisplay;
> +		igt_create_fb(data->fd, kms->writeback.rect.width, kms->writeback.rect.height,
> +			      kms->writeback.format, DRM_FORMAT_MOD_LINEAR,
> +			      &kms->writeback.fbs[i]);
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
> +	struct data_t data = {0};
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
> +	igt_display_reset(&data.display);
> +
> +	data.wb_output = find_wb_output(&data);
> +	igt_require(data.wb_output);
> +
> +	for_each_pipe(&data.display, pipe) {
> +		igt_debug("Selecting pipe %s to %s\n",
> +			  kmstest_pipe_name(pipe),
> +			  igt_output_name(data.wb_output));
> +		igt_output_set_pipe(data.wb_output, pipe);
> +		break;
> +	}
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
> +		int fb_index = i % NUM_FBS;
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
> diff --git a/benchmarks/meson.build b/benchmarks/meson.build
> index c451268bc44f..e949e6073719 100644
> --- a/benchmarks/meson.build
> +++ b/benchmarks/meson.build
> @@ -20,6 +20,7 @@ benchmark_progs = [
>  	'kms_vblank',
>  	'prime_lookup',
>  	'vgem_mmap',
> +	'kms_fb_stress',

Put this in alphabetical order before kms_vblank,
with this fixed:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  ]
>  
>  benchmarksdir = join_paths(libexecdir, 'benchmarks')
> 
> ---
> base-commit: c58c5fb6aa1cb7d3627a15e364816a7a2add9edc
> change-id: 20240207-bench-393789eaba47
> 
> Best regards,
> -- 
> Arthur Grillo <arthurgrillo@riseup.net>
> 
