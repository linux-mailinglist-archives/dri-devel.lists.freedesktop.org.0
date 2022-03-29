Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC904EB203
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 18:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDAB10F14F;
	Tue, 29 Mar 2022 16:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176FD10F14F;
 Tue, 29 Mar 2022 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8wqEKXSkbDGZj91zAI+Jfg3Gtjsg3aNT8OtNjfi9Zs=; b=SoWpbqpU6fDY+mFjuVDPq5IyxG
 uLehs+26G4SVu59WfW44HBpV5ng0N76WM/2otSYtH/LR+yRoZQ7zxJUDa+fkMO5ikf78zu0VAmNHi
 SOFs14OgsjJMIDNUoutuSfGFlybzM8M10D97C8E8m+vFt8SNEL59mNvmKspZfKcaalXsFZ/KduKle
 7Vbv6rgkfuzfAF1wgm2wv3EkTEWWO0jtX2w74IRZdoi7DuQl/EJ1rD+fNjs5hX3yJavPVJ8cDUybv
 eSaKVGffXCiTSOn2yp5fJZRb0puD/+5vmEe/CsGMBrN0FwbuKsv32Fag0ifjt3MkI4pzxQZFJIuJL
 kOBoPi3A==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nZEvy-0000cd-Oz; Tue, 29 Mar 2022 18:43:06 +0200
Date: Tue, 29 Mar 2022 15:42:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: Re: [RFC PATCH] drm/amd/display: dont ignore alpha property
Message-ID: <20220329164244.zwlpcxbal3muy4sx@mail.igalia.com>
References: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
 <DM4PR12MB5182CCC2B6476A1FC88E725FEC1D9@DM4PR12MB5182.namprd12.prod.outlook.com>
 <20220328164224.shj6qlw6u2akb2tj@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="52pbzy446z4fh3hv"
Content-Disposition: inline
In-Reply-To: <20220328164224.shj6qlw6u2akb2tj@mail.igalia.com>
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
Cc: "Liu, Zhan" <Zhan.Liu@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Gutierrez,
 Agustin" <Agustin.Gutierrez@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--52pbzy446z4fh3hv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/28, Melissa Wen wrote:
> On 03/28, Kazlauskas, Nicholas wrote:
> > [AMD Official Use Only]
> >=20
> > > -----Original Message-----
> > > From: Melissa Wen <mwen@igalia.com>
> > > Sent: Friday, March 25, 2022 4:45 PM
> > > To: amd-gfx@lists.freedesktop.org; Wentland, Harry
> > > <Harry.Wentland@amd.com>; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>; Siqueira, Rodrigo
> > > <Rodrigo.Siqueira@amd.com>; Kazlauskas, Nicholas
> > > <Nicholas.Kazlauskas@amd.com>; Gutierrez, Agustin
> > > <Agustin.Gutierrez@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org; Simon Ser <contact@emersion.fr>
> > > Subject: [RFC PATCH] drm/amd/display: dont ignore alpha property
> > > Importance: High
> > >
> > > Hi all,
> > >
> > > I'm examining the IGT kms_plane_alpha_blend test, specifically the
> > > alpha-7efc. It fails on AMD and Intel gen8 hw, but passes on Intel
> > > gen11. At first, I thought it was a rounding issue. In fact, it may be
> > > the problem for different results between intel hw generations.
> > >
> > > However, I changed the test locally to compare CRCs for all alpha val=
ues
> > > in the range before the test fails. Interestingly, it fails for all
> > > values when running on AMD, even when comparing planes with zero alpha
> > > (fully transparent). Moreover, I see the same CRC values regardless of
> > > the value set in the alpha property.
> > >
> > > To ensure that the blending mode is as expected, I explicitly set the
> > > Pre-multiplied blending mode in the test. Then I tried using different
> > > framebuffer data and alpha values. I've tried obvious comparisons too,
> > > such as fully opaque and fully transparent.
> > >
> > > As far as I could verify and understand, the value set for the ALPHA
> > > property is totally ignored by AMD drivers. I'm not sure if this is a
> > > matter of how we interpret the meaning of the premultiplied blend mode
> > > or the driver's assumptions about the data in these blend modes.
> > > For example, I made a change in the test as here:
> > > https://paste.debian.net/1235620/
> > > That basically means same framebuffer, but different alpha values for
> > > each plane. And the result was succesful (but I expected it fails).
> > >
> >=20
> > The intent was that we don't enable global plane alpha along with anyth=
ing that requires per pixel alpha.
> >=20
> > The HW does have bits to specify a mode that's intended to work like th=
is, but I don't think we've ever fully supported it in software.
> >=20
> > I wouldn't necessarily expect that the blending result is correct, but =
maybe the IGT test result says otherwise.
>=20
> hmm... afaiu, I think the issue here is that no formula of pixel blend
> mode ignores the "global plane alpha". Looking at the description here:
> https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_blend.=
c#n142
> I understand the global plane alpha is the plane_alpha, described as:
> "Plane alpha value set by the plane "alpha" property."
> And the pixel alpha is the fg.alpha, right? So, the "None" mode doesn't
> care of pixel alpha, but still considers (global) plane alpha, and
> "Pre-multiplied" mode is considering plane alpha and pixel alpha to
> calculate how background RGB affects the resulted composition...
>=20
> >=20
> > > Besides that, I see that other subtests in kms_plane_alpha_blend are
> > > skipped, use "None" pixel blend mode, or are not changing the
> > > IGT_PLANE_ALPHA property. So, this alpha-7efc seems to be the only one
> > > in the subset that is checking changes on alpha property under a
> > > Pre-multiplied blend mode, and it is failing.
> > >
> > > I see some inputs in this issue:
> > > https://gitlab.freedesktop.org/drm/amd/-/issues/1769.
> > > But them, I guessed there are different interpretations for handling
> > > plane alpha in the pre-multiplied blend mode. Tbh, I'm not clear, but
> > > there's always a chance of different interpretations, and I don't have
> > > a third driver with CRC capabilities for further comparisons.
> > >
> > > I made some experiments on blnd_cfg values, changing alpha_mode vs
> > > global_gain and global_alpha. I think the expected behaviour for the
> > > Pre-multiplied blend mode is achieved by applying this RFC patch (for
> > > Cezanne).
> > >
> > > Does it seems reasonable? Can anyone help me with more inputs to guide
> > > me the right direction or point out what I misunderstood about these
> > > concepts?
> > >
> > > Thanks,
> > >
> > > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > > ---
> > >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 2 +-
> > >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 4 ++++
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > index 6633df7682ce..821ffafa441e 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > @@ -5438,7 +5438,7 @@ fill_blending_from_plane_state(const struct
> > > drm_plane_state *plane_state,
> > >
> > >       if (plane_state->alpha < 0xffff) {
> > >               *global_alpha =3D true;
> > > -             *global_alpha_value =3D plane_state->alpha >> 8;
> > > +             *global_alpha_value =3D plane_state->alpha;
> >=20
> > Isn't the original behavior here correct? The value into DC should only=
 be an 8-bit value but we have 16-bit precision from the DRM property. This=
 is truncating the bits that we don't support.
> >=20

Indeed, you're right. I'll remove this change from the patch.

> From what I could verify (printed), the driver reads a 8-bit value, and
> the shift is actually clearing the global_alpha_value:
>=20
> alpha_value >> 8;
> [   38.296885] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
> [   38.296887] amdgpu: Global alpha resulted: global_alpha_value 0x0000
> [   38.297071] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
> [   38.297072] amdgpu: Global alpha resulted: global_alpha_value 0x0000
> [   38.297601] DCN20 update mpcc: 1, 0x00, 0x00, 1
> [   38.297660] DCN20 update mpcc: 1, 0x00, 0x00, 1
>=20
> ppa =3D per_pixel_alpha
> ps/a =3D plane_state->alpha
>=20
> Values in the last prints are:
> per_pixel_alpha,
> pipe_ctx->plane_state->global_alpha_value,
> blnd_cfg.global_gain,
> blnd_cfg.pre_multiplied_alpha
>=20
> alpha_value; (no shift)
> [  +0.000003] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
> [  +0.000002] amdgpu: Global alpha resulted: global_alpha_value 0x007e
> [  +0.000001] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
> [  +0.000001] amdgpu: Global alpha resulted: global_alpha_value 0x007e
> [  +0.000553] DCN20 update mpcc: 1, 0x7e, 0x7e, 1
> [  +0.000068] DCN20 update mpcc: 1, 0x7e, 0x7e, 1
>=20
> > >       }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > > b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > > index 4290eaf11a04..b4888f91a9d0 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > > @@ -2367,6 +2367,10 @@ void dcn20_update_mpcc(struct dc *dc, struct
> > > pipe_ctx *pipe_ctx)
> > >                       =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA)
> > >               blnd_cfg.pre_multiplied_alpha =3D false;
> > >
> > > +     if (blnd_cfg.pre_multiplied_alpha) {
> > > +             blnd_cfg.alpha_mode =3D
> > > MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAI
> > > N;
> > > +             blnd_cfg.global_gain =3D blnd_cfg.global_alpha;
> > > +     }
> >=20
> > While I'm not sure we should be exposing/enabling per pixel alpha + com=
bined global gain, I think the correct logical ordering for this would be t=
o modify the check higher up in the function.
> >=20
> > If (per_pixel_alpha && pipe_ctx->plane_state->global_alpha)
> >     blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBI=
NED_GLOBAL_GAIN;
> > else if (per_pixel_alpha)
> >     blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
> > else
> >     blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
> >=20
> > This should maintain compatibility with scenarios that don't specify an=
y alpha value on the plane.
>=20
> Thanks! So, in the case that global_gain is previously set as 0xff in
> the code, is it ok to always set global_gain =3D global_alpha or should it
> only happens when _COMBINED_GLOBAL_GAIN mode is defined?
>=20
> >=20
> > Note that this logic would also need to be carried down into the dcn10_=
update_mpcc function as well.
> yeah, sure!
>=20
> Thanks a lot for your feedback! I'll try to provide more inputs.
> Also, let me know what you think about the expected behaviour of global
> plane alpha from these pixel blend mode formulas.

I'll send a new version from your feedback.

Thanks,

Melissa
>=20
> Best Regards,
>=20
> Melissa
> >=20
> > Regards,
> > Nicholas Kazlauskas
> >=20
> > >       /*
> > >        * TODO: remove hack
> > >        * Note: currently there is a bug in init_hw such that
> > > --
> > > 2.35.1
> >=20



--52pbzy446z4fh3hv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJDNwAACgkQwqF3j0dL
ehwwuhAAm77fBZNxu3QBeb918kkeL7UdTIZDm0+QklGZdAv/QabjXniOL4VrFu7M
KEPBk86J0SkUiu99W3OJiaNShHw9ftJwirOyeZU8XsUQ2ClS5jmm2/h+ly7CxVFo
ue8uwLQKuOmJK8Di24b6FHThs5zvA+FDxu3+SUVPe7GuVRPOuZ0RqAm0nwBtoph2
7Cb+QPzW4Qr9aS3Bjn7qBR+kn7eiKmTtg35/RDrhvo4a9kKIn0BRZ884eQO/1g3X
x01FhUuBq/NOhi23Sr0KBIN/wldP4j9EpkpEVFNEgPEYOEZ+i0DlNsyaF4muvcjJ
O8IXOjq+6ovu9h7PqBHzEALEfDHUKgp0Gzw5i6LdiaLweGhDvb0INx2Z2R/TEnuK
xncLJIGH6pSHemBK4Zdht3iM9pT7BcIzfrpL+b4A2/JOcDpwcqa0LsM6NJbyHebk
7BZvtfoA6opvDKy8AdnotuXv2ZJZFs2CNFF+tq0doVbv8clVY6UlOb/kWIsCnS4I
FXxtSaREX3gZB1vOU0hxnuUFqAwi7MYb6mh1/D1J0IhEBclXr05FYJi/rXap7S3S
Q4d88zgweypm/eE7ZjLRPZqR3MWkoxhkyktmnvlnwcmaGsfFzP0VQ+Nhp+Hi7qph
GxQAaCJHjcUy901kRpNTGq/7yqnq9oupTAA8TrSx0VaoFAt3fiw=
=SgWv
-----END PGP SIGNATURE-----

--52pbzy446z4fh3hv--
