Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA66C36B8AD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D718B89F89;
	Mon, 26 Apr 2021 18:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFB489F89;
 Mon, 26 Apr 2021 18:07:21 +0000 (UTC)
IronPort-SDR: XFPvAy2b2cyDRFYNVQM4BAhVE2qojn4kxaSHuyn+FTEAQW1+PX3UgeIZ4XILNIiypH+z0fJPGe
 1QGY26rPHbbg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196441544"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196441544"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 11:07:20 -0700
IronPort-SDR: Y6dl2azcb/ulYF11ovYrDmK7vPgP3CCYk15oXtwyXoysNRl04l9rdk6++HdYRiQpHVtHFgrlvC
 S73aSpM8t/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="387093682"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 26 Apr 2021 11:07:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Apr 2021 21:07:14 +0300
Date: Mon, 26 Apr 2021 21:07:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
Message-ID: <YIcBUl+94sHJsT8B@intel.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426173852.484368-2-harry.wentland@amd.com>
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, Uma Shankar <uma.shankar@intel.com>,
 hersenxs.wu@amd.com, amd-gfx@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 01:38:50PM -0400, Harry Wentland wrote:
> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> =

> Add the following color encodings
> - RGB versions for BT601, BT709, BT2020
> - DCI-P3: Used for digital movies
> =

> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 4 ++++
>  include/drm/drm_color_mgmt.h     | 4 ++++
>  2 files changed, 8 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color=
_mgmt.c
> index bb14f488c8f6..a183ebae2941 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -469,6 +469,10 @@ static const char * const color_encoding_name[] =3D {
>  	[DRM_COLOR_YCBCR_BT601] =3D "ITU-R BT.601 YCbCr",
>  	[DRM_COLOR_YCBCR_BT709] =3D "ITU-R BT.709 YCbCr",
>  	[DRM_COLOR_YCBCR_BT2020] =3D "ITU-R BT.2020 YCbCr",
> +	[DRM_COLOR_RGB_BT601] =3D "ITU-R BT.601 RGB",
> +	[DRM_COLOR_RGB_BT709] =3D "ITU-R BT.709 RGB",
> +	[DRM_COLOR_RGB_BT2020] =3D "ITU-R BT.2020 RGB",
> +	[DRM_COLOR_P3] =3D "DCI-P3",

These are a totally different thing than the YCbCr stuff.
The YCbCr stuff just specifies the YCbCr<->RGB converison matrix,
whereas these are I guess supposed to specify the primaries/whitepoint?
But without specifying what we're converting *to* these mean absolutely
nothing. Ie. I don't think they belong in this property.

The previous proposals around this topic have suggested a new
property to specify a conversion matrix either explicitly, or
via a separate enum (which would specify both the src and dst
colorspaces). I've always argued the enum approach is needed
anyway since not all hardware has a programmable matrix for
this. But a fully programmable matrix could be nice for tone
mapping purposes/etc, so we may want to make sure both are
possible.

As for the transfer func, the proposals so far have mostly just
been to expose a programmable degamma/gamma LUTs for each plane.
But considering how poor the current gamma uapi is we've thrown
around some ideas how to allow the kernel to properly expose the
hw capabilities. This is one of those ideas:
https://lists.freedesktop.org/archives/dri-devel/2019-April/212886.html
I think that basic idea could be also be extended to allow fixed
curves in case the hw doesn't have a fully programmable LUT. But
dunno if that's relevant for your hw.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
