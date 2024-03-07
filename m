Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B148A87499F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E0810F20C;
	Thu,  7 Mar 2024 08:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4awMxTfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6CA10F20C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709800171;
 bh=NMaQjJv++5pY7h2yzC0y0jCxvdwNmhLrZUnxJWQFy1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=4awMxTfsvD/OyC45MNL/d9gtiFOiK6+BiP00ayKwRQAViDDS74zAYOs0qpxE8qkTj
 yd5mY2DJF82dViqnW0e6n+nVpsNQnRWeGy7x7HTqvYnxXDbtkpSWUSR5l0C5bwgqL+
 MLknvPBad2tCZODaZFLBMx5UFFZzim2X00kHbdJ4phDdXyHPLbkLqDEddgyOR5FbsP
 DJm1oAVcVXHkG1oF+2wSb5ZUIUalYOpAPJgcdKPdCyvGHPDZ0dtiX6s8xkjc3d1d/B
 wBctY8tF4cyaijQHtf2x5x1aUp8fCkFDvzC6gnRKEjk7Ejc/5El4jA5tB1BWsBJXkI
 tm8TU3ehLkkAg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 98EAD3781FDF;
 Thu,  7 Mar 2024 08:29:30 +0000 (UTC)
Date: Thu, 7 Mar 2024 10:29:22 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Xaver Hugl <xaver.hugl@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/drm_connector: Document Colorspace property
 variants
Message-ID: <20240307102922.0f3701cb.pekka.paalanen@collabora.com>
In-Reply-To: <20240306164209.GA11561@toolbox>
References: <20240305135155.231687-1-sebastian.wick@redhat.com>
 <20240306102721.3c9c3785.pekka.paalanen@collabora.com>
 <20240306164209.GA11561@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//Cw8w_2vLFiUbjjCx/dX51m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_//Cw8w_2vLFiUbjjCx/dX51m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Mar 2024 17:42:09 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Wed, Mar 06, 2024 at 10:27:21AM +0200, Pekka Paalanen wrote:
> > On Tue,  5 Mar 2024 14:51:49 +0100
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >  =20
> > > The initial idea of the Colorspace prop was that this maps 1:1 to
> > > InfoFrames/SDP but KMS does not give user space enough information nor
> > > control over the output format to figure out which variants can be us=
ed
> > > for a given KMS commit. At the same time, properties like Broadcast R=
GB
> > > expect full range quantization range being produced by user space from
> > > the CRTC and drivers to convert to the range expected by the sink for
> > > the chosen output format, mode, InfoFrames, etc.
> > >=20
> > > This change documents the reality of the Colorspace property. The
> > > Default variant unfortunately is very much driver specific and not
> > > reflected by the EDID. The BT2020 variants are in active use by gener=
ic
> > > compositors which have expectations from the driver about the
> > > conversions it has to do when selecting certain output formats.
> > >=20
> > > Everything else is also marked as undefined. Coming up with valid
> > > behavior that makes it usable from user space and consistent with oth=
er
> > > KMS properties for those variants is left as an exercise for whoever
> > > wants to use them.
> > >=20
> > > v2:
> > >  * Talk about "pixel operation properties" that user space configures
> > >  * Mention that user space is responsible for checking the EDID for s=
ink
> > >    support
> > >  * Make it clear that drivers can choose between RGB and YCbCr on the=
ir
> > >    own
> > >=20
> > > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 79 +++++++++++++++++++++++++------=
--
> > >  include/drm/drm_connector.h     |  8 ----
> > >  2 files changed, 61 insertions(+), 26 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index b0516505f7ae..65cdcc7d22db 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -2147,24 +2147,67 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_pr=
operty);
> > >   * DOC: standard connector properties
> > >   *
> > >   * Colorspace:
> > > - *     This property helps select a suitable colorspace based on the=
 sink
> > > - *     capability. Modern sink devices support wider gamut like BT20=
20.
> > > - *     This helps switch to BT2020 mode if the BT2020 encoded video =
stream
> > > - *     is being played by the user, same for any other colorspace. T=
hereby
> > > - *     giving a good visual experience to users.
> > > - *
> > > - *     The expectation from userspace is that it should parse the ED=
ID
> > > - *     and get supported colorspaces. Use this property and switch t=
o the
> > > - *     one supported. Sink supported colorspaces should be retrieved=
 by
> > > - *     userspace from EDID and driver will not explicitly expose the=
m.
> > > - *
> > > - *     Basically the expectation from userspace is:
> > > - *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > - *        colorspace
> > > - *      - Set this new property to let the sink know what it
> > > - *        converted the CRTC output to.
> > > - *      - This property is just to inform sink what colorspace
> > > - *        source is trying to drive.
> > > + *	This property is used to inform the driver about the color encodi=
ng
> > > + *	user space configured the pixel operation properties to produce.
> > > + *	The variants set the colorimetry, transfer characteristics, and w=
hich
> > > + *	YCbCr conversion should be used when necessary.
> > > + *	The transfer characteristics from HDR_OUTPUT_METADATA takes prece=
dence
> > > + *	over this property.
> > > + *	User space always configures the pixel operation properties to pr=
oduce
> > > + *	full quantization range data (see the Broadcast RGB property).
> > > + *
> > > + *	Drivers inform the sink about what colorimetry, transfer
> > > + *	characteristics, YCbCr conversion, and quantization range to expe=
ct
> > > + *	(this can depend on the output mode, output format and other
> > > + *	properties). Drivers also convert the user space provided data to=
 what
> > > + *	the sink expects. =20
> >=20
> > Hi Sebastian,
> >=20
> > should it be more explicit that drivers are allowed to do only
> > RGB->YCbCr and quantization range conversions, but not TF nor gamut
> > conversions?
> >=20
> > That is, if the driver cannot pick the TF implied by "Colorspace"
> > property for the sink, then it cannot pick another TF for the sink and
> > silently convert. It think this should apply to all options including
> > the undefined ones. Or is that too much to guess? =20
>=20
> That's a really good point. I'll add it in the next revision.
>=20
> > > + *
> > > + *	User space has to check if the sink supports all of the possible
> > > + *	colorimetries that the driver is allowed to pick by parsing the E=
DID. =20
> >=20
> > All? Rather than at least one?
> >=20
> > Is this how it has been implemented for BT2020, that userspace picked
> > colorimetry and driver picked color model and quantization are
> > completely independent, and drivers do not check the combination
> > against EDID? =20
>=20
> AFAIK the driver exposes all Colorspace variants that it can support in
> the driver, independent of the sink. That means user space has to make
> sure that the sink supports all colorimetry variants the driver can
> pick.

I didn't mean exposing but the driver could reject the atomic commit
that would lead to a combination not advertised as supported in EDID.
If drivers reject, then userspace does not need to check for all
driver-choosable variants, just one would be enough. Theoretically not
needing all might allow some cases to work that don't support all.
"Colorspace" property value could direct the driver's choice based on
what EDID claims to support.

Of course, if drivers don't do that already, then "all" it must be.


Thanks,
pq

> Would be good to get a confirmation from Harry and Ville.
>=20
> > If so, "all" it is. Would be good to explain this in the commit message=
. =20
>=20
> Will do.
>=20
> > > + *
> > > + *	For historical reasons this property exposes a number of variants=
 which
> > > + *	result in undefined behavior.
> > > + *
> > > + *	Default:
> > > + *		The behavior is driver-specific.
> > > + *	BT2020_RGB:
> > > + *	BT2020_YCC:
> > > + *		User space configures the pixel operation properties to produce
> > > + *		RGB content with Rec. ITU-R BT.2020 colorimetry, Rec.
> > > + *		ITU-R BT.2020 (Table 4, RGB) transfer characteristics and full
> > > + *		quantization range.
> > > + *		User space can use the HDR_OUTPUT_METADATA property to set the
> > > + *		transfer characteristics to PQ (Rec. ITU-R BT.2100 Table 4) or
> > > + *		HLG (Rec. ITU-R BT.2100 Table 5) in which case, user space
> > > + *		configures pixel operation properties to produce content with
> > > + *		the respective transfer characteristics.
> > > + *		User space has to make sure the sink supports Rec.
> > > + *		ITU-R BT.2020 R'G'B' and Rec. ITU-R BT.2020 Y'C'BC'R
> > > + *		colorimetry.
> > > + *		Drivers can configure the sink to use an RGB format, tell the
> > > + *		sink to expect Rec. ITU-R BT.2020 R'G'B' colorimetry and convert
> > > + *		to the appropriate quantization range.
> > > + *		Drivers can configure the sink to use a YCbCr format, tell the
> > > + *		sink to expect Rec. ITU-R BT.2020 Y'C'BC'R colorimetry, convert
> > > + *		to YCbCr using the Rec. ITU-R BT.2020 non-constant luminance
> > > + *		conversion matrix and convert to the appropriate quantization
> > > + *		range.
> > > + *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
> > > + *		driver chooses between RGB and YCbCr on its own.
> > > + *	SMPTE_170M_YCC:
> > > + *	BT709_YCC:
> > > + *	XVYCC_601:
> > > + *	XVYCC_709:
> > > + *	SYCC_601:
> > > + *	opYCC_601:
> > > + *	opRGB:
> > > + *	BT2020_CYCC:
> > > + *	DCI-P3_RGB_D65:
> > > + *	DCI-P3_RGB_Theater:
> > > + *	RGB_WIDE_FIXED:
> > > + *	RGB_WIDE_FLOAT:
> > > + *	BT601_YCC:
> > > + *		The behavior is undefined.
> > >   *
> > >   * Because between HDMI and DP have different colorspaces,
> > >   * drm_mode_create_hdmi_colorspace_property() is used for HDMI conne=
ctor and
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index fe88d7fc6b8f..02c42b01a3a7 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -437,14 +437,6 @@ enum drm_privacy_screen_status {
> > >   *
> > >   * DP definitions come from the DP v2.0 spec
> > >   * HDMI definitions come from the CTA-861-H spec
> > > - *
> > > - * A note on YCC and RGB variants:
> > > - *
> > > - * Since userspace is not aware of the encoding on the wire
> > > - * (RGB or YCbCr), drivers are free to pick the appropriate
> > > - * variant, regardless of what userspace selects. E.g., if
> > > - * BT2020_RGB is selected by userspace a driver will pick
> > > - * BT2020_YCC if the encoding on the wire is YUV444 or YUV420.
> > >    *
> > >   * @DRM_MODE_COLORIMETRY_DEFAULT:
> > >   *   Driver specific behavior. =20
> >=20
> > This looks really good. This also makes me need to revisit the Weston
> > series I've been brewing that adds "Colorspace" KMS support.
> >=20
> > I think the two questions I had may be slightly too much in the
> > direction of improving rather than just documenting this property, so
> > I'll already give
> >=20
> > Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com> =20
>=20
> Thanks.
>=20
> >=20
> > Thanks,
> > pq =20
>=20
>=20


--Sig_//Cw8w_2vLFiUbjjCx/dX51m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXpeuIACgkQI1/ltBGq
qqeWmQ/8CQNE9BFYBgGexaOt9gvbnwK8jNE8AmNlLZGkKPAFLuqsdNFYAcIiuWPw
J8yse3Fh3TvA8RYgHc1U26MQmB7Wxa1rOTB9JJAiqo1FqeT1kSVb9JFLjuwVOiQs
DoilkacjnB/NSAAsL/oOhcAX6WLzoWvV10olByFLutj/BGnzUj9nu0zmvdkqMYBl
ZYkTJGWB2EvNY4N13QHq3gcRXSDZhbtZneSjLHbJ7mNGqyoEdqjI9Vy0xWy3WvKU
NBPTspPon89Y/Rkb8A7zNbINoSYG6jEZ2nT0TRAOlv5jLP0guxo97jaafVnN63+I
QorzUC4FOxF4w5cPZ8v0zM8imd9UZcJpi8BXxBa6LBSUvEHEOTaj70vCzJZXAW3A
Gex9opNoVOJ19R7p7NLrYQQGts0BFN8PsYKBSESUlnqcjlaZLqdwDnrrnX2xLv1t
/KzTLg4P4WbuVszm1XKUmHfyN532WcIxpgjvT/b+/dW0UXQJw7BAGNJcpWKKQA3A
koBwmKcN9aW/Ud+4NSuWqzmXBDDurIaAxyFgIXlrRomn1sDmUuEmUb5yj8KPhOqb
dE+WLZR9Dq1AeygLECEs1EMSOs1hLZq6QajsdJdTDUVAqexFT7ciKKkRVFhU9tfv
Jk96yAcxoOEtRHskIjoKGJ9lQd+9ypilOCGZWnq+Egnd4EY71i8=
=m5KP
-----END PGP SIGNATURE-----

--Sig_//Cw8w_2vLFiUbjjCx/dX51m--
