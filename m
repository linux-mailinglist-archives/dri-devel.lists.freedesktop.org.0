Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2034275A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8F6EABB;
	Fri, 19 Mar 2021 21:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B026EABA;
 Fri, 19 Mar 2021 21:03:45 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b16so12342607eds.7;
 Fri, 19 Mar 2021 14:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjVS0SnDX61jMx2wfBnx1BEYhRCdQ0ZZrMII3jS2EzE=;
 b=KbhJcu0IzVSbjpcnQDYgCOlegp2VYpe2h9Ub+Q6Tfwg/DTl1rcNKEwFxXXBtOx48Kh
 qpKFUWRvkT+A1+pM7P1SBjK1dOPsvMkBuPF6UQbW93SucEQv1bZ5uHG9JoN68isARlSQ
 fP3+nT9PtyvitG8gycQo1a3UBKnIhJfq1437UDHRnCALRrwbnYolzOKUuQ1169HsdCha
 HcnXxK0MOFqYpOPHfl3j11NQGwCIpnnxclmKAErh4Tftj79VwWLnsTPt8MD0nNz6GSNG
 2hdsnK+BARXZLKFB2oEqq7sLmg61RClYTDParmuKT4qzBtJHnOIjic+/Z+6mJ9pgfzAB
 je/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjVS0SnDX61jMx2wfBnx1BEYhRCdQ0ZZrMII3jS2EzE=;
 b=K5biD5LPzrl24EVL/kvuW+eiJjDPWpzVxEnLTjLu0HDOCWFYLVlYodefn568X48UjR
 rFTPVZsWTm3dCLOu2Jz7pg993bHPGDm38VZa3a4ULqYdyMkMwiOlAqNdcpmGYNG4in8E
 mdVfqz6A2zsHfBqYYlUWClDYnsXIzwd48qXoQMscf7dNYIOnOiHq3KeztpAqAcYPv3Zt
 pjpWkhZ8KCMM0A3KL4TIZRcPy2mQaPjaS7pswbEjbh0dSW8hQxUuC+kcQ3E16w9Mt2u/
 QpxUkTBrYbhT/Eyg2oFw7ieJ12gRBbcSPWgo/FJg0BtTFe7qngFDuvoUHcpaRMPbXFYN
 NLKA==
X-Gm-Message-State: AOAM530pC7ltYkk+WZomzAkffPCkmBYjJd3KRqnn7zX7NjFm/oDs3Ex9
 zKQVNDI9MpvHSpUoWCH3hJXHLGj9BzQ=
X-Google-Smtp-Source: ABdhPJySov4wRsiAX9oG0/+jhxMFAL4ZvGkOL8dadR5fPvVUE0bt1bS3VDWXk78dm74woXW7DvEh4A==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr11639498edt.251.1616187824205; 
 Fri, 19 Mar 2021 14:03:44 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-7833-6000-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:7833:6000:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id jj15sm4353122ejc.99.2021.03.19.14.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:03:43 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/amd/display: Add support for
 SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616.
Date: Fri, 19 Mar 2021 22:03:14 +0100
Message-Id: <20210319210317.32369-3-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the necessary format definition, bandwidth and pixel size mappings,
prescaler setup, and pixelformat selection, following the logic
already present for SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616.

The new SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616 is implemented as the
old SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 format, but with swapped
red <-> green color channel, by use of the hardware xbar.

Please note that on the DCN 1/2/3 display engines, the pixelformat
in hubp and dpp setup for the old SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616
and the new SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616 was changed from
format id 22 to id 26. See amd/include/navi10_enum.h for the meaning
of the id's.

For format 22, the display engine read the framebuffer in 16 bpc format,
but truncated to the 12 bpc actually supported by later pipeline stages.
However, the engine took the 12 LSB of each color component for
truncation, which is incompatible with rendering at least under Vulkan,
where content is 16 bit wide, and a 12 MSB alignment would be appropriate,
if any. Format 20 for ARGB16161616_12MSB does work, but even better, we
can choose format 26 for ARGB16161616_UNORM, keeping all 16 bits around
until later stages of the display pipeline.

This allows to directly consume what the rendering hw produces under
Vulkan for swapchain format VK_FORMAT_R16G16B16A16_UNORM, as tested
with a patched version of the current AMD open-source amdvlk driver
which maps swapchain format VK_FORMAT_R16G16B16A16_UNORM onto
DRM_FORMAT_XBGR16161616.

The old id 22 would cause colorful pixeltrash to be displayed instead.

Tested under DCN-1.0 and DCE-11.2.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c            | 2 ++
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c            | 2 ++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 2 ++
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h                | 2 ++
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c          | 2 ++
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 +
 drivers/gpu/drm/amd/display/dc/dce110/dce110_mem_input_v.c  | 1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c            | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c         | 1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c           | 4 +++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c            | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c         | 1 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c           | 4 +++-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c       | 1 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c            | 3 ++-
 15 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
index e633f8a51edb..4e3664db7456 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
@@ -2827,6 +2827,7 @@ static void populate_initial_data(
 			data->bytes_per_pixel[num_displays + 4] = 4;
 			break;
 		case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+		case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 		case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 			data->bytes_per_pixel[num_displays + 4] = 8;
 			break;
@@ -2930,6 +2931,7 @@ static void populate_initial_data(
 				data->bytes_per_pixel[num_displays + 4] = 4;
 				break;
 			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 				data->bytes_per_pixel[num_displays + 4] = 8;
 				break;
diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
index d4df4da5b81a..0e18df1283b6 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
@@ -236,6 +236,7 @@ static enum dcn_bw_defs tl_pixel_format_to_bw_defs(enum surface_pixel_format for
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010_XR_BIAS:
 		return dcn_bw_rgb_sub_32;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		return dcn_bw_rgb_sub_64;
@@ -375,6 +376,7 @@ static void pipe_ctx_to_e2e_pipe_params (
 		input->src.viewport_height_c   = input->src.viewport_height / 2;
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		input->src.source_format = dm_444_64;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 0c26c2ade782..f1aed40b3124 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -562,6 +562,7 @@ static enum pixel_format convert_pixel_format_to_dalsurface(
 		dal_pixel_format = PIXEL_FORMAT_420BPP10;
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	default:
 		dal_pixel_format = PIXEL_FORMAT_UNKNOWN;
 		break;
@@ -2990,6 +2991,7 @@ unsigned int resource_pixel_format_to_bpp(enum surface_pixel_format format)
 #endif
 		return 32;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		return 64;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index b41e6367b15e..87f8b1b486d3 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -182,6 +182,8 @@ enum surface_pixel_format {
 	SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010_XR_BIAS,
 	/*64 bpp */
 	SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616,
+	/*swapped*/
+	SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616,
 	/*float*/
 	SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F,
 	/*swaped & float*/
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
index 79a6f261a0da..4cdd4dacb761 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
@@ -566,6 +566,7 @@ static void program_grph_pixel_format(
 			 *  should problem swap endian*/
 		format == SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010 ||
 		format == SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010_XR_BIAS ||
+		format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616 ||
 		format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F) {
 		/* ABGR formats */
 		red_xbar = 2;
@@ -606,6 +607,7 @@ static void program_grph_pixel_format(
 		fallthrough;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F: /* shouldn't this get float too? */
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 		grph_depth = 3;
 		grph_format = 0;
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index caee1c9f54bd..a4eec436ba2e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -263,6 +263,7 @@ static void build_prescale_params(struct ipp_prescale_params *prescale_params,
 		prescale_params->scale = 0x2008;
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		prescale_params->scale = 0x2000;
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_mem_input_v.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_mem_input_v.c
index 8bbb499067f7..db7557a1c613 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_mem_input_v.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_mem_input_v.c
@@ -393,6 +393,7 @@ static void program_pixel_format(
 			grph_format = 1;
 			break;
 		case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+		case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 		case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 			grph_depth = 3;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
index 7f8456b9988b..a77e7bd3b8d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
@@ -257,7 +257,8 @@ static void dpp1_setup_format_flags(enum surface_pixel_format input_format,\
 	if (input_format == SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F ||
 		input_format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F)
 		*fmt = PIXEL_FORMAT_FLOAT;
-	else if (input_format == SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616)
+	else if (input_format == SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 ||
+		input_format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616)
 		*fmt = PIXEL_FORMAT_FIXED16;
 	else
 		*fmt = PIXEL_FORMAT_FIXED;
@@ -368,7 +369,8 @@ void dpp1_cnv_setup (
 		select = INPUT_CSC_SELECT_ICSC;
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
-		pixel_format = 22;
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
+		pixel_format = 26; /* ARGB16161616_UNORM */
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 		pixel_format = 24;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
index 6f42d10dd772..f4f423d0b8c3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c
@@ -785,6 +785,7 @@ static bool hubbub1_dcc_support_pixel_format(
 		*bytes_per_element = 4;
 		return true;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		*bytes_per_element = 8;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
index 9e796dfeac20..4e2ac6c5e35d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
@@ -245,6 +245,7 @@ void hubp1_program_pixel_format(
 	if (format == SURFACE_PIXEL_FORMAT_GRPH_ABGR8888
 			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010
 			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010_XR_BIAS
+			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616
 			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F) {
 		red_bar = 2;
 		blue_bar = 3;
@@ -277,8 +278,9 @@ void hubp1_program_pixel_format(
 				SURFACE_PIXEL_FORMAT, 10);
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616: /*we use crossbar already*/
 		REG_UPDATE(DCSURF_SURFACE_CONFIG,
-				SURFACE_PIXEL_FORMAT, 22);
+				SURFACE_PIXEL_FORMAT, 26); /* ARGB16161616_UNORM */
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:/*we use crossbar already*/
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
index 4af96cc5d9d6..f2f44ddf522a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
@@ -166,7 +166,8 @@ static void dpp2_cnv_setup (
 		select = DCN2_ICSC_SELECT_ICSC_A;
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
-		pixel_format = 22;
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
+		pixel_format = 26; /* ARGB16161616_UNORM */
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 		pixel_format = 24;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
index 6d03d98fca22..91a9305d42e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c
@@ -158,6 +158,7 @@ bool hubbub2_dcc_support_pixel_format(
 		*bytes_per_element = 4;
 		return true;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 		*bytes_per_element = 8;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 0df0da2e6a4d..05c5494bf00f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -428,6 +428,7 @@ void hubp2_program_pixel_format(
 	if (format == SURFACE_PIXEL_FORMAT_GRPH_ABGR8888
 			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010
 			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR2101010_XR_BIAS
+			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616
 			|| format == SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F) {
 		red_bar = 2;
 		blue_bar = 3;
@@ -460,8 +461,9 @@ void hubp2_program_pixel_format(
 				SURFACE_PIXEL_FORMAT, 10);
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616: /*we use crossbar already*/
 		REG_UPDATE(DCSURF_SURFACE_CONFIG,
-				SURFACE_PIXEL_FORMAT, 22);
+				SURFACE_PIXEL_FORMAT, 26); /* ARGB16161616_UNORM */
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:/*we use crossbar already*/
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 2c2dbfcd8957..4083075c1ee6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2358,6 +2358,7 @@ int dcn20_populate_dml_pipes_from_context(
 				pipes[pipe_cnt].pipe.src.source_format = dm_420_10;
 				break;
 			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
+			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
 			case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 			case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
 				pipes[pipe_cnt].pipe.src.source_format = dm_444_64;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 6e864b1a95c4..0bc5c5eba7af 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -245,7 +245,8 @@ static void dpp3_cnv_setup (
 		select = INPUT_CSC_SELECT_ICSC;
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
-		pixel_format = 22;
+	case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616:
+		pixel_format = 26; /* ARGB16161616_UNORM */
 		break;
 	case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F:
 		pixel_format = 24;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
