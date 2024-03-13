Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405387A843
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 14:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9ED10F2F7;
	Wed, 13 Mar 2024 13:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="wLrXzWta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9848310F23F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710336358;
 bh=RZr/S1DKlUmdEIdxbi9K0rR+lHc6q1RgMDZm+qLpPos=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wLrXzWtaUBgBp5LBG+gYMDyMBCiMVruH2Qck6o3cWXZpqxJ83zb3BDivC1Jodm/T2
 FX7ctkXk296zjK8hKBAllnq8SZueA2J7BLouyJozCSkwOiF3TswRQiXkB97ycfe9ZS
 +PmgrfSHDN27jtYtyJVDv1YMH6bnmyOBGFyApZSjs51yA4Yfu14q2wChtJauhuBHkp
 XeECvYYKnDEDOSI25n2M5VY3l69257gbnlNpQ34vl9dWwYFv/qxy6ec2H6OH16QDD+
 IWqYSJ4VDOVFMMQQCwQABnqaAj07t4SBzUv3VlKn3O2Yf2LzaVxPrtPNnIVwQY88JK
 0ALuTFEbuuaDw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A77BD3782079;
 Wed, 13 Mar 2024 13:25:57 +0000 (UTC)
Date: Wed, 13 Mar 2024 15:25:47 +0200
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
Message-ID: <20240313152547.5f53ad9f.pekka.paalanen@collabora.com>
In-Reply-To: <20240311160634.GA323822@toolbox>
References: <20240305135155.231687-1-sebastian.wick@redhat.com>
 <20240306102721.3c9c3785.pekka.paalanen@collabora.com>
 <20240306164209.GA11561@toolbox>
 <20240307102922.0f3701cb.pekka.paalanen@collabora.com>
 <20240311160634.GA323822@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0/sOD/Dg9eaVC=j.gb3JfyJ";
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

--Sig_/0/sOD/Dg9eaVC=j.gb3JfyJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Mar 2024 17:06:34 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Thu, Mar 07, 2024 at 10:29:22AM +0200, Pekka Paalanen wrote:
> > On Wed, 6 Mar 2024 17:42:09 +0100
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >  =20
> > > On Wed, Mar 06, 2024 at 10:27:21AM +0200, Pekka Paalanen wrote: =20
> > > > On Tue,  5 Mar 2024 14:51:49 +0100
> > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > >    =20
> > > > > The initial idea of the Colorspace prop was that this maps 1:1 to
> > > > > InfoFrames/SDP but KMS does not give user space enough informatio=
n nor
> > > > > control over the output format to figure out which variants can b=
e used
> > > > > for a given KMS commit. At the same time, properties like Broadca=
st RGB
> > > > > expect full range quantization range being produced by user space=
 from
> > > > > the CRTC and drivers to convert to the range expected by the sink=
 for
> > > > > the chosen output format, mode, InfoFrames, etc.
> > > > >=20
> > > > > This change documents the reality of the Colorspace property. The
> > > > > Default variant unfortunately is very much driver specific and not
> > > > > reflected by the EDID. The BT2020 variants are in active use by g=
eneric
> > > > > compositors which have expectations from the driver about the
> > > > > conversions it has to do when selecting certain output formats.
> > > > >=20
> > > > > Everything else is also marked as undefined. Coming up with valid
> > > > > behavior that makes it usable from user space and consistent with=
 other
> > > > > KMS properties for those variants is left as an exercise for whoe=
ver
> > > > > wants to use them.
> > > > >=20
> > > > > v2:
> > > > >  * Talk about "pixel operation properties" that user space config=
ures
> > > > >  * Mention that user space is responsible for checking the EDID f=
or sink
> > > > >    support
> > > > >  * Make it clear that drivers can choose between RGB and YCbCr on=
 their
> > > > >    own
> > > > >=20
> > > > > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_connector.c | 79 +++++++++++++++++++++++++--=
------
> > > > >  include/drm/drm_connector.h     |  8 ----
> > > > >  2 files changed, 61 insertions(+), 26 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/dr=
m_connector.c
> > > > > index b0516505f7ae..65cdcc7d22db 100644
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > @@ -2147,24 +2147,67 @@ EXPORT_SYMBOL(drm_mode_create_aspect_rati=
o_property);
> > > > >   * DOC: standard connector properties
> > > > >   *
> > > > >   * Colorspace:
> > > > > - *     This property helps select a suitable colorspace based on=
 the sink
> > > > > - *     capability. Modern sink devices support wider gamut like =
BT2020.
> > > > > - *     This helps switch to BT2020 mode if the BT2020 encoded vi=
deo stream
> > > > > - *     is being played by the user, same for any other colorspac=
e. Thereby
> > > > > - *     giving a good visual experience to users.
> > > > > - *
> > > > > - *     The expectation from userspace is that it should parse th=
e EDID
> > > > > - *     and get supported colorspaces. Use this property and swit=
ch to the
> > > > > - *     one supported. Sink supported colorspaces should be retri=
eved by
> > > > > - *     userspace from EDID and driver will not explicitly expose=
 them.
> > > > > - *
> > > > > - *     Basically the expectation from userspace is:
> > > > > - *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > > > - *        colorspace
> > > > > - *      - Set this new property to let the sink know what it
> > > > > - *        converted the CRTC output to.
> > > > > - *      - This property is just to inform sink what colorspace
> > > > > - *        source is trying to drive.
> > > > > + *	This property is used to inform the driver about the color en=
coding
> > > > > + *	user space configured the pixel operation properties to produ=
ce.
> > > > > + *	The variants set the colorimetry, transfer characteristics, a=
nd which
> > > > > + *	YCbCr conversion should be used when necessary.
> > > > > + *	The transfer characteristics from HDR_OUTPUT_METADATA takes p=
recedence
> > > > > + *	over this property.
> > > > > + *	User space always configures the pixel operation properties t=
o produce
> > > > > + *	full quantization range data (see the Broadcast RGB property).
> > > > > + *
> > > > > + *	Drivers inform the sink about what colorimetry, transfer
> > > > > + *	characteristics, YCbCr conversion, and quantization range to =
expect
> > > > > + *	(this can depend on the output mode, output format and other
> > > > > + *	properties). Drivers also convert the user space provided dat=
a to what
> > > > > + *	the sink expects.   =20
> > > >=20
> > > > Hi Sebastian,
> > > >=20
> > > > should it be more explicit that drivers are allowed to do only
> > > > RGB->YCbCr and quantization range conversions, but not TF nor gamut
> > > > conversions?
> > > >=20
> > > > That is, if the driver cannot pick the TF implied by "Colorspace"
> > > > property for the sink, then it cannot pick another TF for the sink =
and
> > > > silently convert. It think this should apply to all options includi=
ng
> > > > the undefined ones. Or is that too much to guess?   =20
> > >=20
> > > That's a really good point. I'll add it in the next revision.
> > >  =20
> > > > > + *
> > > > > + *	User space has to check if the sink supports all of the possi=
ble
> > > > > + *	colorimetries that the driver is allowed to pick by parsing t=
he EDID.   =20
> > > >=20
> > > > All? Rather than at least one?
> > > >=20
> > > > Is this how it has been implemented for BT2020, that userspace pick=
ed
> > > > colorimetry and driver picked color model and quantization are
> > > > completely independent, and drivers do not check the combination
> > > > against EDID?   =20
> > >=20
> > > AFAIK the driver exposes all Colorspace variants that it can support =
in
> > > the driver, independent of the sink. That means user space has to make
> > > sure that the sink supports all colorimetry variants the driver can
> > > pick. =20
> >=20
> > I didn't mean exposing but the driver could reject the atomic commit
> > that would lead to a combination not advertised as supported in EDID.
> > If drivers reject, then userspace does not need to check for all
> > driver-choosable variants, just one would be enough. Theoretically not
> > needing all might allow some cases to work that don't support all.
> > "Colorspace" property value could direct the driver's choice based on
> > what EDID claims to support. =20
>=20
> Right, this could be possible and is probably even better than what I
> wrote down but...
>=20
> > Of course, if drivers don't do that already, then "all" it must be. =20
>=20
> ...unfortunately that seems to be the case. Maybe we can get away with
> changing it though?

I wouldn't risk it at this point, I think :-)

It's another battle.


Thanks,
pq

> > > Would be good to get a confirmation from Harry and Ville.
> > >  =20
> > > > If so, "all" it is. Would be good to explain this in the commit mes=
sage.   =20
> > >=20
> > > Will do.
> > >  =20
> > > > > + *
> > > > > + *	For historical reasons this property exposes a number of vari=
ants which
> > > > > + *	result in undefined behavior.
> > > > > + *
> > > > > + *	Default:
> > > > > + *		The behavior is driver-specific.
> > > > > + *	BT2020_RGB:
> > > > > + *	BT2020_YCC:
> > > > > + *		User space configures the pixel operation properties to prod=
uce
> > > > > + *		RGB content with Rec. ITU-R BT.2020 colorimetry, Rec.
> > > > > + *		ITU-R BT.2020 (Table 4, RGB) transfer characteristics and fu=
ll
> > > > > + *		quantization range.
> > > > > + *		User space can use the HDR_OUTPUT_METADATA property to set t=
he
> > > > > + *		transfer characteristics to PQ (Rec. ITU-R BT.2100 Table 4) =
or
> > > > > + *		HLG (Rec. ITU-R BT.2100 Table 5) in which case, user space
> > > > > + *		configures pixel operation properties to produce content with
> > > > > + *		the respective transfer characteristics.
> > > > > + *		User space has to make sure the sink supports Rec.
> > > > > + *		ITU-R BT.2020 R'G'B' and Rec. ITU-R BT.2020 Y'C'BC'R
> > > > > + *		colorimetry.
> > > > > + *		Drivers can configure the sink to use an RGB format, tell the
> > > > > + *		sink to expect Rec. ITU-R BT.2020 R'G'B' colorimetry and con=
vert
> > > > > + *		to the appropriate quantization range.
> > > > > + *		Drivers can configure the sink to use a YCbCr format, tell t=
he
> > > > > + *		sink to expect Rec. ITU-R BT.2020 Y'C'BC'R colorimetry, conv=
ert
> > > > > + *		to YCbCr using the Rec. ITU-R BT.2020 non-constant luminance
> > > > > + *		conversion matrix and convert to the appropriate quantization
> > > > > + *		range.
> > > > > + *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
> > > > > + *		driver chooses between RGB and YCbCr on its own.
> > > > > + *	SMPTE_170M_YCC:
> > > > > + *	BT709_YCC:
> > > > > + *	XVYCC_601:
> > > > > + *	XVYCC_709:
> > > > > + *	SYCC_601:
> > > > > + *	opYCC_601:
> > > > > + *	opRGB:
> > > > > + *	BT2020_CYCC:
> > > > > + *	DCI-P3_RGB_D65:
> > > > > + *	DCI-P3_RGB_Theater:
> > > > > + *	RGB_WIDE_FIXED:
> > > > > + *	RGB_WIDE_FLOAT:
> > > > > + *	BT601_YCC:
> > > > > + *		The behavior is undefined.
> > > > >   *
> > > > >   * Because between HDMI and DP have different colorspaces,
> > > > >   * drm_mode_create_hdmi_colorspace_property() is used for HDMI c=
onnector and
> > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connec=
tor.h
> > > > > index fe88d7fc6b8f..02c42b01a3a7 100644
> > > > > --- a/include/drm/drm_connector.h
> > > > > +++ b/include/drm/drm_connector.h
> > > > > @@ -437,14 +437,6 @@ enum drm_privacy_screen_status {
> > > > >   *
> > > > >   * DP definitions come from the DP v2.0 spec
> > > > >   * HDMI definitions come from the CTA-861-H spec
> > > > > - *
> > > > > - * A note on YCC and RGB variants:
> > > > > - *
> > > > > - * Since userspace is not aware of the encoding on the wire
> > > > > - * (RGB or YCbCr), drivers are free to pick the appropriate
> > > > > - * variant, regardless of what userspace selects. E.g., if
> > > > > - * BT2020_RGB is selected by userspace a driver will pick
> > > > > - * BT2020_YCC if the encoding on the wire is YUV444 or YUV420.
> > > > >    *
> > > > >   * @DRM_MODE_COLORIMETRY_DEFAULT:
> > > > >   *   Driver specific behavior.   =20
> > > >=20
> > > > This looks really good. This also makes me need to revisit the West=
on
> > > > series I've been brewing that adds "Colorspace" KMS support.
> > > >=20
> > > > I think the two questions I had may be slightly too much in the
> > > > direction of improving rather than just documenting this property, =
so
> > > > I'll already give
> > > >=20
> > > > Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>   =20
> > >=20
> > > Thanks.
> > >  =20
> > > >=20
> > > > Thanks,
> > > > pq   =20
> > >=20
> > >  =20
> >  =20
>=20
>=20


--Sig_/0/sOD/Dg9eaVC=j.gb3JfyJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXxqVsACgkQI1/ltBGq
qqcD3g/+Ofe3tWavi4NKB+wuLiR5Ml0jOJY0vvfRBvclp/RweducnWgYG3wXcEK8
BuGdxp7f0lfObbvliaW8b1jt9P1HVqrXWMrVGjrnSD04jU1KbzuB2mdRMs3JXKxb
B76KCI+9POVtFbAfipBIh3XpXWHJ/XvkSSH/bmg5k8l1NDGUyYuQXRqXZiO1oG9O
xdigsI4w23cyyvrjqvC4X2EE9cfbTR2kPTvaNtt8AM/pPNcGfPn5UHML5Li0dfUT
YQE6q+R/ROqTOp+RE51vZaXdNaSV27EwnzvTXNw2o/D3FzmEm76pr6uGFMZjeJaX
Yi3oV1h2aVP3PpaHHszhSkv8cCBESBDwiIQtQmf/DE0kdIX3oTl8de97o3l6irx3
7S4zzuPgLc8JEbUaF4Odn7Y6gBtv0FASZeOIzO444AnKU1iQNsGkBuf8OoBWLB+7
/3DBaF3zUObUIVL6MlBulZ1QNFoKr9wfGUP1NbFsFhDDLkSetUTWSclMo4ZlFNBc
fZRiMtoLLmnY3bYOFynSZ+ErN+SgUvb4AE28o/35QjG4uyAdVeuYCvoOvz+0jjxw
mPa65285foOcqsILH9L4gIpK2cjwoC29noEBRUyd0pTGqaNjgWKE0ga8YnyJwlaf
cAAxRSmVMaSW+9sogUXsRmqF+dEo1jwp8LTRh+DjuqGKE+sz6UQ=
=yvo4
-----END PGP SIGNATURE-----

--Sig_/0/sOD/Dg9eaVC=j.gb3JfyJ--
