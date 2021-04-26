Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC736B9CB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221EF89F4A;
	Mon, 26 Apr 2021 19:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E454689CF9;
 Mon, 26 Apr 2021 19:09:02 +0000 (UTC)
IronPort-SDR: e1GUVLWVAtJr/wRFXtBHovMIcoYXO+E/eZXR76SWqEXHao2IqXR3YrrgKze5+lSBE9QGCzsb23
 oHW03OwTaq9Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="281721590"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="281721590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 12:09:01 -0700
IronPort-SDR: OWfTgoBZ8D11pxLQjpLuxI+DCD7Yz4GzIcNS18pQUr6UalJIlmPimOEqsUJjbN5IuXKMhVWrux
 8Yx4gOOMQ60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="429506445"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 26 Apr 2021 12:08:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Apr 2021 22:08:55 +0300
Date: Mon, 26 Apr 2021 22:08:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
Message-ID: <YIcPx6ozxPN7BbEU@intel.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com>
 <YIcBUl+94sHJsT8B@intel.com>
 <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
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

On Mon, Apr 26, 2021 at 02:56:26PM -0400, Harry Wentland wrote:
> On 2021-04-26 2:07 p.m., Ville Syrj=E4l=E4 wrote:
> > On Mon, Apr 26, 2021 at 01:38:50PM -0400, Harry Wentland wrote:
> >> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> >>
> >> Add the following color encodings
> >> - RGB versions for BT601, BT709, BT2020
> >> - DCI-P3: Used for digital movies
> >>
> >> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_color_mgmt.c | 4 ++++
> >>   include/drm/drm_color_mgmt.h     | 4 ++++
> >>   2 files changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_co=
lor_mgmt.c
> >> index bb14f488c8f6..a183ebae2941 100644
> >> --- a/drivers/gpu/drm/drm_color_mgmt.c
> >> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> >> @@ -469,6 +469,10 @@ static const char * const color_encoding_name[] =
=3D {
> >>   	[DRM_COLOR_YCBCR_BT601] =3D "ITU-R BT.601 YCbCr",
> >>   	[DRM_COLOR_YCBCR_BT709] =3D "ITU-R BT.709 YCbCr",
> >>   	[DRM_COLOR_YCBCR_BT2020] =3D "ITU-R BT.2020 YCbCr",
> >> +	[DRM_COLOR_RGB_BT601] =3D "ITU-R BT.601 RGB",
> >> +	[DRM_COLOR_RGB_BT709] =3D "ITU-R BT.709 RGB",
> >> +	[DRM_COLOR_RGB_BT2020] =3D "ITU-R BT.2020 RGB",
> >> +	[DRM_COLOR_P3] =3D "DCI-P3",
> > =

> > These are a totally different thing than the YCbCr stuff.
> > The YCbCr stuff just specifies the YCbCr<->RGB converison matrix,
> > whereas these are I guess supposed to specify the primaries/whitepoint?
> > But without specifying what we're converting *to* these mean absolutely
> > nothing. Ie. I don't think they belong in this property.
> > =

> =

> If this is the intention I don't see it documented.
> =

> I might have overlooked something but do we have a way to explicitly =

> specify today what *to* format the YCbCr color encodings convert into? =


These just specific which YCbCr<->RGB matrix to use as specificed
in the relevant standards. The primaries/whitepoint/etc. don't
change at all.

> Would that be a combination of the output color encoding specified via =

> colorspace_property and the color space encoded in the primaries and =

> whitepoint of the hdr_output_metadata?

Those propertis only affect the infoframes. They don't apply any
color processing to the data.

> =

> Fundamentally I don't see how the use of this property differs, whether =

> you translate from YCbCr or from RGB. In either case you're converting =

> from the defined input color space and pixel format to an output color =

> space and pixel format.

The gamut does not change when you do YCbCr<->RGB conversion.

> =

> > The previous proposals around this topic have suggested a new
> > property to specify a conversion matrix either explicitly, or
> > via a separate enum (which would specify both the src and dst
> > colorspaces). I've always argued the enum approach is needed
> > anyway since not all hardware has a programmable matrix for
> > this. But a fully programmable matrix could be nice for tone
> > mapping purposes/etc, so we may want to make sure both are
> > possible.
> > =

> > As for the transfer func, the proposals so far have mostly just
> > been to expose a programmable degamma/gamma LUTs for each plane.
> > But considering how poor the current gamma uapi is we've thrown
> > around some ideas how to allow the kernel to properly expose the
> > hw capabilities. This is one of those ideas:
> > https://lists.freedesktop.org/archives/dri-devel/2019-April/212886.html=
>> I think that basic idea could be also be extended to allow fixed
> > curves in case the hw doesn't have a fully programmable LUT. But
> > dunno if that's relevant for your hw.
> > =

> =

> The problem with exposing gamma, whether per-plane or per-crtc, is that =

> it is hard to define an API that works for all the HW out there. The =

> capabilities for different HW differ a lot, not just between vendors but =

> also between generations of a vendor's HW.
> =

> Another reason I'm proposing to define the color space (and gamma) of a =

> plane is to make this explicit. Up until the color space and gamma of a =

> plane or framebuffer are not well defined, which leads to drivers =

> assuming the color space and gamma of a buffer (for blending and other =

> purposes) and might lead to sub-optimal outcomes.

The current state is that things just get passed through as is
(apart from the crtc LUTs/CTM).

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
