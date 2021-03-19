Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25307342782
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C600F6EACA;
	Fri, 19 Mar 2021 21:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4F6EAC9;
 Fri, 19 Mar 2021 21:16:16 +0000 (UTC)
IronPort-SDR: 0cZo0lLyM84VnknVtuEGafeF0zi7aQ2tFoS6Hj4wxo+YhQyaAdOUuep65PZrIQm0t7SVJUFwbm
 IowFhpGyP46A==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="251318844"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="251318844"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 14:16:14 -0700
IronPort-SDR: Q7clm1UL2ZOAKaWnS+C237txGQEcnNNPDS1cSlaQFGOoPvKpNcHNXkHpyzk0Jr07LbbC87f/sq
 SweGr3X63x5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="380307098"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 19 Mar 2021 14:16:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Mar 2021 23:16:11 +0200
Date: Fri, 19 Mar 2021 23:16:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH 1/5] drm/fourcc: Add 16 bpc fixed point framebuffer
 formats.
Message-ID: <YFUUm0atqi3ox17k@intel.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
 <20210319210317.32369-2-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319210317.32369-2-mario.kleiner.de@gmail.com>
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 10:03:13PM +0100, Mario Kleiner wrote:
> These are 16 bits per color channel unsigned normalized formats.
> They are supported by at least AMD display hw, and suitable for
> direct scanout of Vulkan swapchain images in the format
> VK_FORMAT_R16G16B16A16_UNORM.
> =

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 4 ++++
>  include/uapi/drm/drm_fourcc.h | 7 +++++++
>  2 files changed, 11 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 03262472059c..ce13d2be5d7b 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -203,6 +203,10 @@ const struct drm_format_info *__drm_format_info(u32 =
format)
>  		{ .format =3D DRM_FORMAT_ARGB16161616F,	.depth =3D 0,  .num_planes =3D=
 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
>  		{ .format =3D DRM_FORMAT_ABGR16161616F,	.depth =3D 0,  .num_planes =3D=
 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
>  		{ .format =3D DRM_FORMAT_AXBXGXRX106106106106, .depth =3D 0, .num_plan=
es =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D tr=
ue },
> +		{ .format =3D DRM_FORMAT_XRGB16161616,	.depth =3D 0,  .num_planes =3D =
1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_XBGR16161616,	.depth =3D 0,  .num_planes =3D =
1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
> +		{ .format =3D DRM_FORMAT_ARGB16161616,	.depth =3D 0,  .num_planes =3D =
1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> +		{ .format =3D DRM_FORMAT_ABGR16161616,	.depth =3D 0,  .num_planes =3D =
1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
>  		{ .format =3D DRM_FORMAT_RGB888_A8,	.depth =3D 32, .num_planes =3D 2, =
.cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
>  		{ .format =3D DRM_FORMAT_BGR888_A8,	.depth =3D 32, .num_planes =3D 2, =
.cpp =3D { 3, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
>  		{ .format =3D DRM_FORMAT_XRGB8888_A8,	.depth =3D 32, .num_planes =3D 2=
, .cpp =3D { 4, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f76de49c768f..f7156322aba5 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -168,6 +168,13 @@ extern "C" {
>  #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0]=
 R:G:B:A 10:10:10:2 little endian */
>  #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0]=
 B:G:R:A 10:10:10:2 little endian */
>  =

> +/* 64 bpp RGB */
> +#define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0=
] x:R:G:B 16:16:16:16 little endian */
> +#define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0=
] x:B:G:R 16:16:16:16 little endian */
> +
> +#define DRM_FORMAT_ARGB16161616	fourcc_code('A', 'R', '4', '8') /* [63:0=
] A:R:G:B 16:16:16:16 little endian */
> +#define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0=
] A:B:G:R 16:16:16:16 little endian */

These look reasonable enough to me. IIRC we should be able to expose
them on some recent Intel hw as well.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
