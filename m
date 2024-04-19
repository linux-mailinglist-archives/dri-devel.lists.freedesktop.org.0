Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C058AAEFE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 15:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CBF10FECF;
	Fri, 19 Apr 2024 13:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ptQj5J08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D4510FECF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 13:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE808619D6;
 Fri, 19 Apr 2024 13:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E96C3277B;
 Fri, 19 Apr 2024 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713531672;
 bh=EfEgmbr1ktf8i8gBDSOo61C9Hr8ROwzxRco0v2/O6p0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ptQj5J08aVwRnk47dfnXt/VPP/OEroo0Ee3+LnY69c9iZQT0W4DMNG9ylpWGszuZB
 gEu3xNS/DD8Gqoid0m2dxfvDVwpDFkfD0hY6j8cWwrVepuhzb7rXz4nWuc36LeAdKu
 OLnbmOYR91KYbBuPRyF9z6RpmQJeWmQO0ZhrGIFP/dZDNdUuafj8uN/QEEaYInB95u
 s5okAtlwaotbluwnSOh4f/zLc7tkY5q2lGgKSGSYWOVA1RlpeHbdyu0i02voCfwRGg
 5uLLK/yQ374jR5e/ncIen4j1LbZTQ8eAx1GfgHVV5em2SudjN0fSJEjkML8EcUJH3U
 1hXX1OTWS/04g==
Date: Fri, 19 Apr 2024 15:01:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v11 15/28] drm/connector: hdmi: Compute bpc and format
 automatically
Message-ID: <20240419-illegal-rose-heron-e2ff64@houat>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
 <20240326-kms-hdmi-connector-state-v11-15-c5680ffcf261@kernel.org>
 <Zh6CQhD-2Yl5LUVb@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="27joxh4slrq34bs4"
Content-Disposition: inline
In-Reply-To: <Zh6CQhD-2Yl5LUVb@intel.com>
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


--27joxh4slrq34bs4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 04:50:58PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 26, 2024 at 04:40:19PM +0100, Maxime Ripard wrote:
> > Now that we have all the infrastructure needed, we can add some code
> > that will, for a given connector state and mode, compute the best output
> > format and bpc.
> >=20
> > The algorithm is equivalent to the one already found in i915 and vc4.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 197 +++++++++++++=
+++++++-
> >  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
> >  2 files changed, 210 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/=
gpu/drm/display/drm_hdmi_state_helper.c
> > index 063421835dba..b9bc0fb027ea 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -1,9 +1,11 @@
> >  // SPDX-License-Identifier: MIT
> > =20
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_connector.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_print.h>
> > =20
> >  #include <drm/display/drm_hdmi_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> > =20
> >  /**
> > @@ -46,10 +48,110 @@ connector_state_get_mode(const struct drm_connecto=
r_state *conn_state)
> >  		return NULL;
> > =20
> >  	return &crtc_state->mode;
> >  }
> > =20
> > +static bool
> > +sink_supports_format_bpc(const struct drm_connector *connector,
> > +			 const struct drm_display_info *info,
> > +			 const struct drm_display_mode *mode,
> > +			 unsigned int format, unsigned int bpc)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +	u8 vic =3D drm_match_cea_mode(mode);
> > +
> > +	/*
> > +	 * CTA-861-F, section 5.4 - Color Coding & Quantization states
> > +	 * that the bpc must be 8, 10, 12 or 16 except for the default
> > +	 * 640x480 VIC1 where the value must be 8.
> > +	 *
> > +	 * The definition of default here is ambiguous but the spec
> > +	 * refers to VIC1 being the default timing in several occasions
> > +	 * so our understanding is that for the default timing (ie,
> > +	 * VIC1), the bpc must be 8.
> > +	 */
> > +	if (vic =3D=3D 1 && bpc !=3D 8) {
> > +		drm_dbg_kms(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
> > +		return false;
> > +	}
> > +
> > +	if (!info->is_hdmi &&
> > +	    (format !=3D HDMI_COLORSPACE_RGB || bpc !=3D 8)) {
> > +		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> > +		return false;
> > +	}
> > +
> > +	if (!(connector->hdmi.supported_formats & BIT(format))) {
>=20
> These are the capabilities of the souce I take it?
>
> > +		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
> > +			    drm_hdmi_connector_get_output_format_name(format));
> > +		return false;
> > +	}
> > +
> > +	switch (format) {
> > +	case HDMI_COLORSPACE_RGB:
> > +		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
> > +
> > +		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
> > +			return false;
>=20
> and this is the sink.
>
> Maybe we should use the same bits for both? Anyways, that seems like
> material for a followup series.

Ack

> > +
> > +		if (bpc =3D=3D 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HD=
MI_DC_30)) {
> > +			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n"=
);
> > +			return false;
> > +		}
> > +
> > +		if (bpc =3D=3D 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HD=
MI_DC_36)) {
> > +			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n"=
);
> > +			return false;
> > +		}
> > +
> > +		drm_dbg_kms(dev, "RGB format supported in that configuration.\n");
> > +
> > +		return true;
> > +
> > +	case HDMI_COLORSPACE_YUV422:
> > +		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");
> > +
> > +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
> > +			drm_dbg_kms(dev, "Sink doesn't support YUV422.\n");
> > +			return false;
> > +		}
> > +
> > +		if (bpc !=3D 12) {
> > +			drm_dbg_kms(dev, "YUV422 only supports 12 bpc.\n");
> > +			return false;
> > +		}
>=20
> Did something change around here from the last time?

The format selection code now prefers to select a lower bpc rather than
another format, which is what you asked for in the previous version.


--27joxh4slrq34bs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiJrFQAKCRAnX84Zoj2+
dm//AYDBcbHF1j+MBygRYjzArO/7IC8ROQ0TnbdGU1QgBsuY7d6sseYpeJlG6wy4
nb4N4n8BgNUIdF8BxMB0oSpFmbipxEdz7fBTk7U7cq968A6gd9ZS3VCDFSZ+M67f
FOZCYGxFQQ==
=tQ9L
-----END PGP SIGNATURE-----

--27joxh4slrq34bs4--
