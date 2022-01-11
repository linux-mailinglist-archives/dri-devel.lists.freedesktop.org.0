Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F1D48B169
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 16:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392F510E84D;
	Tue, 11 Jan 2022 15:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07DB10EAB2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 15:55:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8BB992B001F3;
 Tue, 11 Jan 2022 10:55:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 11 Jan 2022 10:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eNKRAhpIIobeHQgo54bkYon06zi
 koPtH5TTZyZIZ72Q=; b=BR65meAW9VLrXI2xu0RsumLUc//dz8vh+lv9Jjp5yia
 Znv+gwZNdTo18UWzs13Fai2qvoD+mhxdLTTHyIa2NCQlkvD+7CitUsUPOxsjcVPC
 JNbP9U0ulL24DqeMNNXOBax0iLPrazZkeVsRXx2vkyFqvk6sroqeuGn5vzt/p4WJ
 HGziaLGvMpA3G9Z454oBG1thzjHmaJdOJlaWKgJnLMt+XVDiZv5KzvPkoZPuWig7
 kC8hyZ/MY5pBeZffsaWZU7h0hbJVH3o9DQq64Nc/Q2uBxCB7oLQ22aNXgRyDKntO
 KqBbEjcf9DhWdPC2kQZAOTX7UWpESQtlbXIWYop70ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eNKRAh
 pIIobeHQgo54bkYon06zikoPtH5TTZyZIZ72Q=; b=LFJyPLSfcNoaLYzNUPvYRp
 ME+0uPZHjgr0m3+57Kg1hwExgqIL0EMWHab9TAhPpf0tNZ1xXmGjyfZq+rgw8AkF
 HOYgugX7Vapeuy35BDHe7nrLWHzh9wInVOwJCJXk6nplryqPtEUlnGiQX89nivAt
 f2eP63OkjmsnilkBzDAiMirW9dAyypes/OrGxlvaOfTSTAZg5hDPog7J0iWET+2/
 0JuFrMDXW429W8N07ovyB8MtC3UBJMoZINLkaXUjz6gL8FQP/aIh5w9xty1+riGA
 JP3GflknDBIzu5pvTRukKgMlBm6fLnlyUdps8bqV4bkMgt10xfgzZ9pQ+Bvht5hg
 ==
X-ME-Sender: <xms:eajdYbtfm12_qAmctIOlUXaYCpg3BtYTeeg_2qsmkFwLOxOCR4haQw>
 <xme:eajdYcfggyXHZgvYx4eO29pVOgtwSG5J6eeMk8v9sEByYjTr4CvvfT22N5pC0Te3s
 1AReDM8sz1D1cAdmYg>
X-ME-Received: <xmr:eajdYezW7TWGNQ1L043SN-hNXY4lNvRNyr2ZRhrsgrg2u1DDA3D3V4hW7_20sxdl68etHs9Q9g0l3k-a_l5ot07bi99K9Yu46jSGYmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eajdYaP2z7OepU2328mPZog1C7VlSt7llvG9CR_101H9O-R0WJHHxA>
 <xmx:eajdYb85qlsLOB0-v0OaPWzPDCfA4OnddJ9iSbzD2vFq_VWZDXZsKg>
 <xmx:eajdYaXMVlaURu4lv7wtfgnAFUsYVJzSOlB9rH6px2k-z3WR3N20DQ>
 <xmx:e6jdYSYGrEZrX21bLA45S7kQtOmFRgrt6_CHkiPp_ziO2Ulh8dR6J8c3QnY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 10:55:37 -0500 (EST)
Date: Tue, 11 Jan 2022 16:55:35 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 01/14] drm/edid: Don't clear YUV422 if using deep color
Message-ID: <20220111155535.tvrmtvtys6aj7w3r@houat>
References: <20211215124406.340180-1-maxime@cerno.tech>
 <20211215124406.340180-2-maxime@cerno.tech>
 <YbnyNx+0CK8R8Nd8@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yizldbqcd3ldefns"
Content-Disposition: inline
In-Reply-To: <YbnyNx+0CK8R8Nd8@intel.com>
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Werner Sembach <wse@tuxedocomputers.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yizldbqcd3ldefns
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

Thanks for your review

On Wed, Dec 15, 2021 at 03:48:39PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Dec 15, 2021 at 01:43:53PM +0100, Maxime Ripard wrote:
> > The current code, when parsing the EDID Deep Color depths, that the
> > YUV422 cannot be used, referring to the HDMI 1.3 Specification.
> >=20
> > This specification, in its section 6.2.4, indeed states:
> >=20
> >   For each supported Deep Color mode, RGB 4:4:4 shall be supported and
> >   optionally YCBCR 4:4:4 may be supported.
> >=20
> >   YCBCR 4:2:2 is not permitted for any Deep Color mode.
> >=20
> > This indeed can be interpreted like the code does, but the HDMI 1.4
> > specification further clarifies that statement in its section 6.2.4:
> >=20
> >   For each supported Deep Color mode, RGB 4:4:4 shall be supported and
> >   optionally YCBCR 4:4:4 may be supported.
> >=20
> >   YCBCR 4:2:2 is also 36-bit mode but does not require the further use
> >   of the Deep Color modes described in section 6.5.2 and 6.5.3.
> >=20
> > This means that, even though YUV422 can be used with 12 bit per color,
> > it shouldn't be treated as a deep color mode.
> >=20
> > This deviates from the interpretation of the code and comment, so let's
> > fix those.
> >=20
> > Fixes: d0c94692e0a3 ("drm/edid: Parse and handle HDMI deep color modes.=
")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 12893e7be89b..e57d1b8cdaaa 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -5106,10 +5106,9 @@ static void drm_parse_hdmi_deep_color_info(struc=
t drm_connector *connector,
> > =20
> >  	/*
> >  	 * Deep color support mandates RGB444 support for all video
> > -	 * modes and forbids YCRCB422 support for all video modes per
> > -	 * HDMI 1.3 spec.
> > +	 * modes.
> >  	 */
> > -	info->color_formats =3D DRM_COLOR_FORMAT_RGB444;
> > +	info->color_formats |=3D DRM_COLOR_FORMAT_RGB444;
> > =20
> >  	/* YCRCB444 is optional according to spec. */
> >  	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
>=20
> This whole code seems pretty much wrong. What it tries to do (I think)
> is make sure we don't use deep color with YCbCr 4:4:4 unless supported.
> But what it actually does is also disable YCbCr 4:4:4 8bpc when deep
> color is not supported for YCbCr 4:4:4.
>=20
> I think what we want is to just get rid of this color_formats stuff here
> entirely and instead have some kind of separate tracking of RGB 4:4:4 vs.
> YCbCr 4:4:4 deep color capabilities.

I'm sorry, I'm not entirely sure to understand what you're suggesting
here. Do you want to get ride of info->color_formats entirely?

Maxime

--yizldbqcd3ldefns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYd2odwAKCRDj7w1vZxhR
xZCdAP9xZ+QBWkCaximBtrMDAAId17gAy6SUE8NyLDz0du5WtgD+OUK7BgdDtGtL
r4/aIuBzin/31GQHA4sevVd7yvH6GA0=
=Ztn4
-----END PGP SIGNATURE-----

--yizldbqcd3ldefns--
