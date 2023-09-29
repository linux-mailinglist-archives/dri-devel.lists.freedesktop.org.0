Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4AA7B2D1B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5680C10E6C6;
	Fri, 29 Sep 2023 07:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4D510E6C6;
 Fri, 29 Sep 2023 07:35:34 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 75811660733A;
 Fri, 29 Sep 2023 08:35:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695972933;
 bh=qjPPqE9zHRE5tamuiVnfytx+s61U29Sk9qis654yxG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BYhjZ9Q0fJSsrupaRff6yIGE3gpOlNNrSVua10loaeIXTNkUT8G8KoCrh2UMiycj2
 gY+wlQVYChZ6bWW9opkcwyWvf8C1I2NbMjcJYgd28dRI3w+ISQsT0wNPFqkjTlqTNh
 nR+B+J1k+WLFWUdlGGk3kx3u/6AF1lGHF8Mub9LlSlUibLgm25e2xfzJX+i6OfwKGN
 trSYbNgIEDeNN+RN4NbySmaRg18PK+xWq778+SpSh5C2AKwXhVJQ2kBdpKIuP/vbjj
 Gj6kBWlyxyeNrT00ox5ZQf4vvN20aJL6AAvutUaGrQqUtc8gVOJ+YULV8lKlaiMzX1
 RQdkrbebGBdBg==
Date: Fri, 29 Sep 2023 10:35:22 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 07/32] drm/amd/display: document AMDGPU pre-defined
 transfer functions
Message-ID: <20230929103522.5635c48b.pekka.paalanen@collabora.com>
In-Reply-To: <c1f850e7-7442-4cb9-a83f-289d467dc749@amd.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-8-mwen@igalia.com>
 <c1f850e7-7442-4cb9-a83f-289d467dc749@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gLhra_5zRZi5cDlUfF6gIjx";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/gLhra_5zRZi5cDlUfF6gIjx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 28 Sep 2023 16:16:57 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2023-09-25 15:49, Melissa Wen wrote:
> > Brief documentation about pre-defined transfer function usage on AMD
> > display driver and standardized EOTFs and inverse EOTFs.
> >=20
> > v3:
> > - Document BT709 OETF (Pekka)
> > - Fix description of sRGB and pure power funcs (Pekka)
> >=20
> > Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > index d03bdb010e8b..14f9c02539c6 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> > @@ -85,6 +85,45 @@ void amdgpu_dm_init_color_mod(void)
> >  }
> > =20
> >  #ifdef AMD_PRIVATE_COLOR
> > +/* Pre-defined Transfer Functions (TF)
> > + *
> > + * AMD driver supports pre-defined mathematical functions for transfer=
ring
> > + * between encoded values and optical/linear space. Depending on HW co=
lor caps,
> > + * ROMs and curves built by the AMD color module support these transfo=
rms.
> > + *
> > + * The driver-specific color implementation exposes properties for pre=
-blending
> > + * degamma TF, shaper TF (before 3D LUT), and blend(dpp.ogam) TF and
> > + * post-blending regamma (mpc.ogam) TF. However, only pre-blending deg=
amma
> > + * supports ROM curves. AMD color module uses pre-defined coefficients=
 to build
> > + * curves for the other blocks. What can be done by each color block is
> > + * described by struct dpp_color_capsand struct mpc_color_caps.
> > + *
> > + * AMD driver-specific color API exposes the following pre-defined tra=
nsfer
> > + * functions:
> > + *
> > + * - Linear/Unity: linear/identity relationship between pixel value and
> > + *   luminance value;
> > + * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure power functions;
> > + * - sRGB: 2.4: The piece-wise transfer function from IEC 61966-2-1:19=
99;
> > + * - BT.709: has a linear segment in the bottom part and then a power =
function
> > + *   with a 0.45 (~1/2.22) gamma for the rest of the range; standardiz=
ed by
> > + *   ITU-R BT.709-6;
> > + * - PQ (Perceptual Quantizer): used for HDR display, allows luminance=
 range
> > + *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.
> > + * =20
>=20
> I think it's important to highlight that the AMD color model is
> designed with an assumption that SDR (sRGB, BT.709, G2.2, etc.)
> peak white maps (normalized to 1.0 FP) to 80 nits in the PQ system.
> This has the implication that PQ EOTF (NL-to-L) maps to [0.0..125.0].
> 125.0 =3D 10,000 nits / 80 nits
>=20
> I think we'll want table or some other way describing this:
>=20
> (Using L to mean linear and NL to mean non-linear.)
>=20
> =3D=3D sRGB, BT709, Gamma 2.x =3D=3D
> NL form is either UNORM or [0.0, 1.0]
> L form is [0.0, 1.0]
>=20
> Note that HDR multiplier can wide range beyond [0.0, 1.0].
> In practice this means that PQ TF is needed for any subsequent
> L-to-NL transforms.
>=20
> =3D=3D PQ =3D=3D
> NL form is either UNORM or FP16 CCCS (Windows canonical composition color=
 space, see [1])
> L form is [0.0, 125.0]

Hi,

what is [1]?


Thanks,
pq

> =3D=3D Unity, Default =3D=3D
> NL form is either UNORM or FP16 CCCS
> L form is either [0.0, 1.0] (mapping from UNORM) or CCCS (mapping from CC=
CS FP16)
>=20
> Harry
>=20
> > + * In the driver-specific API, color block names attached to TF proper=
ties
> > + * suggest the intention regarding non-linear encoding pixel's luminan=
ce
> > + * values. As some newer encodings don't use gamma curve, we make enco=
ding and
> > + * decoding explicit by defining an enum list of transfer functions su=
pported
> > + * in terms of EOTF and inverse EOTF, where:
> > + *
> > + * - EOTF (electro-optical transfer function): is the transfer functio=
n to go
> > + *   from the encoded value to an optical (linear) value. De-gamma fun=
ctions
> > + *   traditionally do this.
> > + * - Inverse EOTF (simply the inverse of the EOTF): is usually intende=
d to go
> > + *   from an optical/linear space (which might have been used for blen=
ding)
> > + *   back to the encoded values. Gamma functions traditionally do this.
> > + */
> >  static const char * const
> >  amdgpu_transfer_function_names[] =3D {
> >  	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		=3D "Default", =20
>=20
>=20


--Sig_/gLhra_5zRZi5cDlUfF6gIjx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmUWfjoACgkQI1/ltBGq
qqcO0BAAjMBkEu6r6XkNgzlsRrL6NDIoXzH+tJmVA6FdEUKnv1yDdbN8lZ0zS+Uc
kAYvKGM9CzXGIkR7eXSx7Bd87Jo13s8M7dKoXuH5vzhl9vwQp+5eRjWh1YPdJBZX
L7u/HVZXE7W3699qyAt8SAQI6gz8IAepBR6Go2CZlVlNy/1TyIFlglKOS6c9cTzX
zJqXoaGMY03w9e5CplI6AGV3WhixNfZxQXpRQ0hVTWhW+72lVDFaiqpcxru+0hQi
9GdGJrBXKmQeebyyJoL3OqWeoenmlEbx+McYLwqrqJUMLsWWTqMq5PYFWu6JJSuI
PbVVIlDaCk7VDg5jg3KiBVms2Y6SXTGnVf71qZ9lLAZKKzaBV6BLIZU92MHhnqTC
gRtIY8xA0w54lM3G8LSBdckKxRRcga0rjJaHBI/nAnpm8EEWG/xW+XKVinurbfOF
hEbkUMm0oKz1KW9KKm19aJcNVpcG+MUdrQYJdmtsDamll7QumCM5g8fviI6HfS2z
qkVYXFIyBTedlFJMB79/659XmAPUBtWC7ydDACPDo6UZiCFVkq6XPP0gYZT3/CBK
I5iM9MdkuliJ7YIpEu1eJdqJ/LQoCFNcmMhy4WrJPD3G5Xq57N+Vg9xcbmpKAY1+
oETfwPVe9SxEw78HFy6wUNMrRSFVXhFeidCUpGaCm0GUTcLOYrY=
=pNkG
-----END PGP SIGNATURE-----

--Sig_/gLhra_5zRZi5cDlUfF6gIjx--
