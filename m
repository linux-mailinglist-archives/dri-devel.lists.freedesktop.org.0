Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BFE9660DD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 13:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8456010EA8D;
	Fri, 30 Aug 2024 11:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgRgi67l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4B510EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725017726; x=1756553726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UeGZVoJV7CHsrrYPjHdplLAZFH7WuRH3o+A5uDfsIfw=;
 b=WgRgi67lhdevXXNivsgwWc1LjEnDLiUHkJZO1U3SoLRRf00qtDdXsyYj
 VNKoMOQ7KfQxtPhSS9S5rkvUat+YTkiLZ/ApeIpQr19RDlUT/5iB7o+Hb
 qNIVqn9zv0zctVXhZljwptkghiFLwO7R4S4HFk/amsrRTJROncpmyve9r
 JVX7/dbAOBrBzVL6JRquIdKkFBAgRspOVEnFnwuAjAFPaFZcuBzUhcNDx
 Y8j1lXzbdmFTFlsByPLrhvfdCQTT+WEo1iSGuGYQFXGsesG0fviWScKhu
 nn1e6cJsHVS/lsrWNmwkEZBS3zYMIbA2HGPHX6VYpEK3VBSd0mm5vZ8kI Q==;
X-CSE-ConnectionGUID: /KVy0vQVTW6qw8Kyp9CswQ==
X-CSE-MsgGUID: iCgmXHebSl+CmPCf6Dms9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23222420"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23222420"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:35:26 -0700
X-CSE-ConnectionGUID: pd7FzVPmRRiu910O0E2tIw==
X-CSE-MsgGUID: 4PRXSzI2RCa4OW3c2tojaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="63886926"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 30 Aug 2024 04:35:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Aug 2024 14:35:21 +0300
Date: Fri, 30 Aug 2024 14:35:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Yulia Garbovich <yulia.garbovich@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 liviu.dudau@arm.com, rosen.zhelev@arm.com, nd@arm.com
Subject: Re: [PATCH] drm: drm_fourcc: adding 10/12/14 bit formats
Message-ID: <ZtGuedfBo4RZDCL2@intel.com>
References: <20240829102038.2274242-1-yulia.garbovich@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240829102038.2274242-1-yulia.garbovich@arm.com>
X-Patchwork-Hint: comment
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

On Thu, Aug 29, 2024 at 01:20:38PM +0300, Yulia Garbovich wrote:
> Adding the following formats
>      - DRM_FORMAT_RX106
>      - DRM_FORMAT_GXRX106106
>      - DRM_FORMAT_RX124
>      - DRM_FORMAT_GXRX124124
>      - DRM_FORMAT_AXBXGXRX124124124124
>      - DRM_FORMAT_RX142
>      - DRM_FORMAT_GXRX142142
>      - DRM_FORMAT_AXBXGXRX142142142142
> 
> They are useful for communicating Bayer data between ISPs and GPU by emulating GL_R16UI and GL_RG16UI formats
> Signed-off-by: Yulia Garbovich <yulia.garbovich@arm.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  |  8 +++++
>  include/uapi/drm/drm_fourcc.h | 61 +++++++++++++++++++++++++++++++++--
>  2 files changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 193cf8ed7912..cd5f467edfeb 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -170,6 +170,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_R8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_R10,		.depth = 10, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_R12,		.depth = 12, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_RX106,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_RX124,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_RX142,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_RGB332,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_BGR233,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_XRGB4444,	.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
> @@ -200,6 +203,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_XBGR8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_RGBX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_BGRX8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_GXRX106106,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_GXRX124124,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
> +		{ .format = DRM_FORMAT_GXRX142142,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_RGB565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_BGR565_A8,	.depth = 24, .num_planes = 2, .cpp = { 2, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_XRGB2101010,	.depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
> @@ -219,6 +225,8 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_ARGB16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_ABGR16161616F,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_AXBXGXRX106106106106, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> +		{ .format = DRM_FORMAT_AXBXGXRX124124124124, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> +		{ .format = DRM_FORMAT_AXBXGXRX142142142142, .depth = 0, .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
>  		{ .format = DRM_FORMAT_XRGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_XBGR16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
>  		{ .format = DRM_FORMAT_ARGB16161616,	.depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 84d502e42961..30d0f4b6247a 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -146,6 +146,24 @@ extern "C" {
>  /* 12 bpp Red (direct relationship between channel value and brightness) */
>  #define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
>  
> +/*
> + * 1-component 16 bpp format that has a 10-bit R component in the top 10 bits of the word
> + * in bytes 0..1 with the bottom 6 bits of the word unused
> + */
> +#define DRM_FORMAT_RX106	fourcc_code('R', '0', '1', '0') /* [15:0] R:x 10:6 */

All drm formats are supposed to have explicit endianness.

> +
> +/*
> + * 1-component 16 bpp format that has a 12-bit R component in the top 12 bits of the word
> + * in bytes 0..1 with the bottom 4 bits of the word unused
> + */
> +#define DRM_FORMAT_RX124	fourcc_code('R', '0', '1', '2') /* [15:0] R:x 12:4 */
> +
> +/*
> + * 1-component 16 bpp format that has a 14-bit R component in the top 14 bits of the word
> + * in bytes 0..1 with the bottom 2 bits of the word unused
> + */
> +#define DRM_FORMAT_RX142	fourcc_code('R', '0', '1', '4') /* [15:0] R:x 14:2 */
> +
>  /* 16 bpp Red (direct relationship between channel value and brightness) */
>  #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little endian */
>  
> @@ -157,6 +175,27 @@ extern "C" {
>  #define DRM_FORMAT_RG1616	fourcc_code('R', 'G', '3', '2') /* [31:0] R:G 16:16 little endian */
>  #define DRM_FORMAT_GR1616	fourcc_code('G', 'R', '3', '2') /* [31:0] G:R 16:16 little endian */
>  
> + /*
> + * 2-component  32bpp  format that has a 10-bit R component in the top 10 bits of the word
> + * in bytes 0..1, and a 10-bit G component in the top 10 bits of the word in bytes 2..3,
> + * with the bottom 6 bits of each word unused.
> + */
> +#define DRM_FORMAT_GXRX106106	fourcc_code('G', 'R', '1', '0') /* [31:0] G:x:R:x 10:6:10:6 */
> +
> +/*
> + * 2-component  32bpp  format that has a 12-bit R component in the top 12 bits of the word
> + * in bytes 0..1, and a 12-bit G component in the top 12 bits of the word in bytes 2..3,
> + * with the bottom 4 bits of each word unused.
> + */
> +#define DRM_FORMAT_GXRX124124	fourcc_code('G', 'R', '1', '2') /* [31:0] G:x:R:x 12:4:12:4 */
> +
> +/*
> + * 2-component  32bpp  format that has a 14-bit R component in the top 14 bits of the word
> + * in bytes 0..1, and a 14-bit G component in the top 14 bits of the word in bytes 2..3,
> + * with the bottom 2 bits of each word unused.
> + */
> +#define DRM_FORMAT_GXRX142142	fourcc_code('G', 'R', '1', '4') /* [31:0] G:x:R:x 14:2:14:2 */
> +
>  /* 8 bpp RGB */
>  #define DRM_FORMAT_RGB332	fourcc_code('R', 'G', 'B', '8') /* [7:0] R:G:B 3:3:2 */
>  #define DRM_FORMAT_BGR233	fourcc_code('B', 'G', 'R', '8') /* [7:0] B:G:R 2:3:3 */
> @@ -229,11 +268,29 @@ extern "C" {
>  #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
>  
>  /*
> - * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
> - * of unused padding per component:
> + * 4-component, 64bpp format that has a 10-bit R component in the top 10 bits of the word in bytes 0..1,
> + * a 10-bit G component in the top 10 bits of the word in bytes 2..3, a 10-bit B component in the top 10 bits of the word
> + * in bytes 4..5, and a 10-bit A component in the top 10 bits of the word in bytes 6..7,
> + * with the bottom 6 bits of each word unused.
>   */
>  #define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
>  
> +/*
> + * 4-component, 64bpp format that has a 12-bit R component in the top 12bits of the word in bytes 0..1,
> + * a 12-bit G component in the top 12 bits of the word in bytes 2..3, a 12-bit B component in the top 12 bits of the word
> + * in bytes 4..5, and a 12-bit A component in the top 12 bits of the word in bytes 6..7,
> + * with the bottom 4 bits of each word unused.
> + */
> +#define DRM_FORMAT_AXBXGXRX124124124124	fourcc_code('A', 'B', '1', '2') /* [63:0] A:x:B:x:G:x:R:x 12:4:12:4:12:4:12:4 */
> +
> +/*
> + * 4-component, 64bpp format that has a 14-bit R component in the top 14 bits of the word in bytes 0..1,
> + * a 14-bit G component in the top 14 bits of the word in bytes 2..3, a 14-bit B component in the top 14 bits of the word
> + * in bytes 4..5, and a 14-bit A component in the top 14 bits of the word in bytes 6..7,
> + * with the bottom 2 bits of each word unused.
> + */
> +#define DRM_FORMAT_AXBXGXRX142142142142	fourcc_code('A', 'B', '1', '4') /* [63:0] A:x:B:x:G:x:R:x 14:2:14:2:14:2:14:2 */
> +
>  /* packed YCbCr */
>  #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
>  #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
