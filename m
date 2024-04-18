Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335628AA01B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 18:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94B113DCD;
	Thu, 18 Apr 2024 16:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SmzhN8RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD0A113DCD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 16:33:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55DD261735;
 Thu, 18 Apr 2024 16:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A046BC113CC;
 Thu, 18 Apr 2024 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713458037;
 bh=lArloNKVKGEPKb6sLd3btLeNdS79IuMsK6F6Ge4DTP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SmzhN8RYacSUvgmQeoSoei5bqe+spnwnlZfh3M/5/2LphAsoTy3X4yDNKUr+kZjOP
 nI0GUpxnlrDcVtXz+2C2GDMRMcaYoupRC+vwqbixVNYW4O5NZRoV9ROmQp6WigP2Fl
 t9vpZxB85aIoGbE8IH878QDLPSg7WdqjGxSQKAsQmNervesyvQvVJdtcVT92gND8Hp
 OrEs566wYq0tBLwzGRcI7M9vwdTElQ+NWCqgQTLv19g7AafiALvoigjgN73I3vj8eC
 5h8fooNygIBvJ6jTi9EYpXgRpuQDti2BMJsvmDnne0PGqJSFdCPbNGETCdelbl4o+J
 /I4Qof48Leebw==
Date: Thu, 18 Apr 2024 18:33:54 +0200
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
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v11 09/28] drm/display: hdmi: Add HDMI compute clock helper
Message-ID: <20240418-spiritual-loyal-hornet-2fbbfd@houat>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
 <20240326-kms-hdmi-connector-state-v11-9-c5680ffcf261@kernel.org>
 <Zh6Ars8z1ESz-LQO@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wahmhb7ukfwggb5k"
Content-Disposition: inline
In-Reply-To: <Zh6Ars8z1ESz-LQO@intel.com>
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


--wahmhb7ukfwggb5k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 04:44:14PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 26, 2024 at 04:40:13PM +0100, Maxime Ripard wrote:
> > A lot of HDMI drivers have some variation of the formula to calculate
> > the TMDS character rate from a mode, but few of them actually take all
> > parameters into account.
> >=20
> > Let's create a helper to provide that rate taking all parameters into
> > account.
> >=20
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c | 70 +++++++++++++++++++++++=
++++++++
> >  include/drm/display/drm_hdmi_helper.h     |  4 ++
> >  2 files changed, 74 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/dr=
m/display/drm_hdmi_helper.c
> > index faf5e9efa7d3..2518dd1a07e7 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -193,5 +193,75 @@ void drm_hdmi_avi_infoframe_content_type(struct hd=
mi_avi_infoframe *frame,
> >  	}
> > =20
> >  	frame->itc =3D conn_state->content_type !=3D DRM_MODE_CONTENT_TYPE_NO=
_DATA;
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
> > +
> > +/**
> > + * drm_hdmi_compute_mode_clock() - Computes the TMDS Character Rate
> > + * @mode: Display mode to compute the clock for
> > + * @bpc: Bits per character
> > + * @fmt: Output Pixel Format used
> > + *
> > + * Returns the TMDS Character Rate for a given mode, bpc count and out=
put format.
> > + *
> > + * RETURNS:
> > + * The TMDS Character Rate, in Hertz, or 0 on error.
>=20
> Everything generally uses kHz. Sticking to common units
> would be better.

Not everything, no. The clock framework is using Hz for example, and on
drm-misc drivers it's usually going to be the consumer of that field.

And there's almost 200 hits on mode->clock * 1000 in drivers/gpu/drm as
of today, including some in i915. This is a bit less than a third of all
the mode->clock usage, including the one that are unit-neutral (like
comparisons between two mode->clock fields).

Given how the rest of the DRM code is structured, yes, there's going to
be some impedance mismatch, but it's really not as clear cut as you make
it to be.

> > + */
> > +unsigned long long
> > +drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> > +			    unsigned int bpc, enum hdmi_colorspace fmt)
> > +{
> > +	unsigned long long clock =3D mode->clock * 1000ULL;
> > +	unsigned int vic =3D drm_match_cea_mode(mode);
> > +
> > +	/*
> > +	 * CTA-861-G Spec, section 5.4 - Color Coding and Quantization
> > +	 * mandates that VIC 1 always uses 8 bpc.
> > +	 */
> > +	if (vic =3D=3D 1 && bpc !=3D 8)
> > +		return 0;
> > +
> > +	/*
> > +	 * HDMI 2.0 Spec, section 7.1 - YCbCr 4:2:0 Pixel Encoding
> > +	 * specifies that YUV420 encoding is only available for those
> > +	 * VICs.
> > +	 */
> > +	if (fmt =3D=3D HDMI_COLORSPACE_YUV420 &&
> > +	    !(vic =3D=3D 96 || vic =3D=3D 97 || vic =3D=3D 101 ||
> > +	      vic =3D=3D 102 || vic =3D=3D 106 || vic =3D=3D 107))
> > +		return 0;
>=20
> I believe that is already outdated. I would just rip this out since the=
=20
> sink is anyway required to declare for which timings it will support
> 4:2:0 via the Y420CMDB/VDB data blocks (see
> drm_mode_is_420_{only,also}().

Should we use drm_mode_is_420() then or rip it out entirely?

> > +
> > +	if (fmt =3D=3D HDMI_COLORSPACE_YUV422) {
> > +		/*
> > +		 * HDMI 1.4b Spec, section 6.2.3 - Pixel Encoding Requirements
> > +		 * specifies that YUV422 is 36-bit only.
> > +		 */
> > +		if (bpc !=3D 12)
> > +			return 0;
> > +
> > +		/*
> > +		 * HDMI 1.0 Spec, section 6.5 - Pixel Encoding
> > +		 * specifies that YUV422 requires two 12-bits components per
> > +		 * pixel clock, which is equivalent in our calculation to three
> > +		 * 8-bits components
> > +		 */
> > +		bpc =3D 8;
> > +	}
> > +
> > +	/*
> > +	 * HDMI 2.0 Spec, Section 7.1 - YCbCr 4:2:0 Pixel Encoding
> > +	 * specifies that YUV420 encoding is carried at a TMDS Character Rate
> > +	 * equal to half the pixel clock rate.
> > +	 */
> > +	if (fmt =3D=3D HDMI_COLORSPACE_YUV420)
> > +		clock =3D clock / 2;
> > +
> > +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> > +		clock =3D clock * 2;
> > +
> > +	clock =3D clock * bpc;
> > +	do_div(clock, 8);
>=20
> IMO one shouldn't use bare do_div(). There are
> more sensible wrappers for it.
>=20
> In this case I would use DIV_ROUND_CLOSEST_ULL().

Ack.

Thanks!
Maxime


--wahmhb7ukfwggb5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiFLagAKCRAnX84Zoj2+
dlldAX9qCzh/RA7mK7FqSsjMey+9M1jDrHEO4/u17NwCJ+/AYaHi+wppWxmtK+K+
sLdIITcBgOE4oCoHKzJp+1JalYFdUKenCg0IWTcdxL0i3zyaXi9LePr+JzQS6ptm
EHgy3onxJA==
=/Ryj
-----END PGP SIGNATURE-----

--wahmhb7ukfwggb5k--
