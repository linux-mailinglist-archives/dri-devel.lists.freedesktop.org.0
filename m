Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869794B0A34
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864210E7CA;
	Thu, 10 Feb 2022 10:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE36710E7C8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:03:48 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7214C2B000DC;
 Thu, 10 Feb 2022 05:03:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 10 Feb 2022 05:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Kj71E0QS3924F9JjSyzild8MmcO396CBiIPncL
 lcSZ0=; b=MJ85wClfp1i5m3tYxRaq3rFRbTbwDPcivCr+xwU44MVnWjapw7wXU2
 HGQg/xCaEVO5qztBZu9oPK7Vkmsna1+k6if5QH/rjYmtsY8Ddyi5gdVtGsbk3cBA
 RasujdT3iYhCitRjYjWhtPvFe7V+nk/7pgYk2He9llEhhXBhQG9gXU3JVOP2ES/q
 eQt9j6KSL/vbbU6Jh869lllBjYesLIgM/+/DPKcwJuLByovoPGrV7QSTcfkOQh3J
 NUj5oPd0xXgfn/n6wFErzNTAvTVNIyK/UpG1Mt9EF32JQR+RIWLu12vrSGp0WbuF
 Yc/I/BeOzhnjf3OtdZv1i8o7LeA1lguw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Kj71E0QS3924F9JjS
 yzild8MmcO396CBiIPncLlcSZ0=; b=JNFD/2OS+5hUyXf/dA0JEGRtkeTAMy5zi
 S5Gp8a1Rdxsjo7uUySPN1D8vpr//FCA7dASfTesEG5ArfUkTwJr77TF0cE0vAjhZ
 oPZ1kMpnL3PvyyH2XCdEc6TsDKtjPMRODL4ymgzozb4iM0nHbu/TCGtRl46iDmEF
 6i+ntXNx1fl728RtpO83VW5ALgv1scTYKSb95Z+egyLqoo2uqPlGn/3DnGFsQ5oW
 /ER6LAaTuZpKNIGyEXBvYlC7594/1Bhp5taCdcYwP/mCdUCieZfZRGWYLgPF2/9H
 HZQvUOV9Kh0tQo4xENkm3CmuVLRLlSG4I7DA+taGrMXydfPp6xTEg==
X-ME-Sender: <xms:AuMEYl0p1GWR0evhLNEiy8DTTszS8egSA4w9-GAMNo_-leAe0kWCKw>
 <xme:AuMEYsFGMQggCV9EH8c2zW00nvW6nmqk-Z6wcimiiocnSGM7tGBccJfbwdQ5LtcYp
 c9KEt4MzBraEQ_gOCY>
X-ME-Received: <xmr:AuMEYl7e2FGY1dLjot_H5yQLNNvJdF-pIgOberUQLT6zeaLB-dyHwNuK53w-hyTBaMwQqkHkzDy5IQu_1esLDvzUEc5Ed2ALA2SkPBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AuMEYi2OqnhCwicx2fwmDJsAklIrSjppUpOP-97cVmDB1LuYS0HgUQ>
 <xmx:AuMEYoG7GvAHUuFCxQIJ6IxF9ivl7wSG_WVJ2Lv6BN99SWBjpYJLiw>
 <xmx:AuMEYj9Yqnlmt62HIF-IkQSjzYir9orslzLFDNngU8WzjTN-lSbBGg>
 <xmx:A-MEYjCU42GGueFozW2ssFgktw5eDT5KJ8JxCivxo42ZjCN2QxjwGZHyWxE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 05:03:45 -0500 (EST)
Date: Thu, 10 Feb 2022 11:03:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 6/6] drm/vc4: hdmi: Support HDMI YUV output
Message-ID: <20220210100343.dbmdmhsvchhpgaj6@houat>
References: <20220127141021.302482-1-maxime@cerno.tech>
 <20220127141021.302482-7-maxime@cerno.tech>
 <Yfw1+r99ZsLQcrm8@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jahegamtxqakzmeg"
Content-Disposition: inline
In-Reply-To: <Yfw1+r99ZsLQcrm8@intel.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jahegamtxqakzmeg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 10:07:22PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Jan 27, 2022 at 03:10:21PM +0100, Maxime Ripard wrote:
> > +/*
> > + * Conversion between Full Range RGB and Full Range YUV444 using the
> > + * BT.709 Colorspace
> > + *
> > + * [ -0.117208 -0.394207  0.511416  128 ]
> > + * [  0.511416 -0.464524 -0.046891  128 ]
> > + * [  0.212639  0.715169  0.072192  0   ]
> > + *
> > + * Matrix is signed 2p13 fixed point, with signed 9p6 offsets
> > + */
> > +static const u16 vc5_hdmi_csc_full_rgb_to_full_yuv444_bt709[3][4] =3D {
>=20
> I think YCbCr output is supposed to be limited range. Or at least=20
> that was the case with DP. For HDMI/CTA IIRC the spec is super
> unclear/confusing when it talks about the YCC quantizaton range
> stuff.=20
>=20
> Currently i915 will only do limited range BT.709 YCbCr output.

Indeed I haven't been able to find anything in the spec, so I'll just
drop it, if only to remain consistent across drivers.

> > +	{ 0xfc41, 0xf364, 0x105e, 0x2000 },
> > +	{ 0x105e, 0xf124, 0xfe81, 0x2000 },
> > +	{ 0x06ce, 0x16e3, 0x024f, 0x0000 },
> > +};
> > +
> >  static void vc5_hdmi_set_csc_coeffs(struct vc4_hdmi *vc4_hdmi,
> >  				    const u16 coeffs[3][4])
> >  {
> <snip>
> > @@ -1323,11 +1534,56 @@ vc4_hdmi_encoder_compute_clock(const struct vc4=
_hdmi *vc4_hdmi,
> >  	return 0;
> >  }
> > =20
> > +static int
> > +vc4_hdmi_encoder_compute_format(const struct vc4_hdmi *vc4_hdmi,
> > +				struct vc4_hdmi_connector_state *vc4_state,
> > +				const struct drm_display_mode *mode,
> > +				unsigned int bpc)
> > +{
> > +	struct drm_device *dev =3D vc4_hdmi->connector.dev;
> > +	const struct drm_connector *connector =3D &vc4_hdmi->connector;
> > +	const struct drm_display_info *info =3D &connector->display_info;
> > +	unsigned int format;
> > +
> > +	drm_dbg(dev, "Trying with an RGB output\n");
> > +
> > +	format =3D VC4_HDMI_OUTPUT_RGB;
> > +	if (vc4_hdmi_sink_supports_format_bpc(vc4_hdmi, info, mode, format, b=
pc)) {
> > +		int ret;
> > +
> > +		ret =3D vc4_hdmi_encoder_compute_clock(vc4_hdmi, vc4_state,
> > +						     mode, bpc, format);
> > +		if (!ret) {
> > +			vc4_state->output_format =3D format;
> > +			return 0;
> > +		}
> > +	}
>=20
> You seem to have the bpc vs. format selection in the opposite order to
> i915. We try to exhaust all RGB color depths first, and only then fall
> back to YCbCr 4:2:0. The automagic YCbCr 4:2:0 fallback is only
> really there because without it you may not be able to light up the
> display at all (at least if you want the higher resolutions).
>=20
> With the current i915 logic 4:2:2 doesn't make any sense since it has=20
> the same requirements as 8bpc RGB. Hence we don't even implement
> YCbCr 4:2:2 (also hw didn't have it until recently).

Our use-case is slightly different, but the basic idea is the same:
since we support from 8 to 12 bpc, an output to YUV422 output can prove
useful if we are reading a 12 bpc content and we don't have the
bandwidth to use RGB.

Thus, when we have a max_bpc of 12, we try RGB and YUV422, if none of
them work we try RGB in 10 and 8 bpc.

This is indeed a bit different than i915, but it doesn't seem
fundamentally different to me.

> There has occasionally been some talk about introducing a new property
> to give the user explicit control over this stuff. If/when that
> happens I guess we might want to revisit the 4:2:2 situation for i915.

This seems to be stalled entirely though, and this approach isn't
incompatible with whatever that would involve.

Maxime

--jahegamtxqakzmeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgTi/wAKCRDj7w1vZxhR
xd20AQD5MYiVfKNZ9QMkVmk+ZL51Bb//Qxd7A8LGShgA3aIedAD/YVs1yGBkt/1K
o4IfL7KHOc53ScIwN8Qs44BGlZNnLgs=
=flCv
-----END PGP SIGNATURE-----

--jahegamtxqakzmeg--
