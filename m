Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA484E9C70
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 18:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DA410E719;
	Mon, 28 Mar 2022 16:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89A010E719;
 Mon, 28 Mar 2022 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yht9iHSgT1GO+hhvppRGOi7RhoBKFa/H4ssR3UbTt4o=; b=durKQweUNwLxq6Rn8GgB66DugE
 PodfkaoXCFHlCC3/uk2Z2iJ8l/qQiBCJOSqnnt28ZAVhVjskUMrW+1LKHDGbmhQ1bq9jZ/VXo2m+e
 cNycob+fBX8jlHoa1nSjyQjDXgmoX0dGIW5yVTuRHiJn90e8J8AtoBaVOEuhbJ8A4FbtxMey+c2ya
 aWI4HZU0L3TJboNIIKPZcW3iRjlnmarNdlnMMmFS4jB5PgCXge3p3BC4BhrmuRvKtP7SG0cWtPJdj
 SzoqUX+2YIHzhjWiAi9JCQyl3k29ZfGfY97gTA2A1rMILQ1NsceGCWuoMqABkXfp/VS20VHMiSS5r
 c1SxrE4g==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nYsS8-0005Cc-MR; Mon, 28 Mar 2022 18:42:48 +0200
Date: Mon, 28 Mar 2022 15:42:24 -0100
From: Melissa Wen <mwen@igalia.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: Re: [RFC PATCH] drm/amd/display: dont ignore alpha property
Message-ID: <20220328164224.shj6qlw6u2akb2tj@mail.igalia.com>
References: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
 <DM4PR12MB5182CCC2B6476A1FC88E725FEC1D9@DM4PR12MB5182.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aeyx4nrdwtn56g3p"
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5182CCC2B6476A1FC88E725FEC1D9@DM4PR12MB5182.namprd12.prod.outlook.com>
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


--aeyx4nrdwtn56g3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/28, Kazlauskas, Nicholas wrote:
> [AMD Official Use Only]
>=20
> > -----Original Message-----
> > From: Melissa Wen <mwen@igalia.com>
> > Sent: Friday, March 25, 2022 4:45 PM
> > To: amd-gfx@lists.freedesktop.org; Wentland, Harry
> > <Harry.Wentland@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Siqueira, Rodrigo
> > <Rodrigo.Siqueira@amd.com>; Kazlauskas, Nicholas
> > <Nicholas.Kazlauskas@amd.com>; Gutierrez, Agustin
> > <Agustin.Gutierrez@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> > Cc: dri-devel@lists.freedesktop.org; Simon Ser <contact@emersion.fr>
> > Subject: [RFC PATCH] drm/amd/display: dont ignore alpha property
> > Importance: High
> >
> > Hi all,
> >
> > I'm examining the IGT kms_plane_alpha_blend test, specifically the
> > alpha-7efc. It fails on AMD and Intel gen8 hw, but passes on Intel
> > gen11. At first, I thought it was a rounding issue. In fact, it may be
> > the problem for different results between intel hw generations.
> >
> > However, I changed the test locally to compare CRCs for all alpha values
> > in the range before the test fails. Interestingly, it fails for all
> > values when running on AMD, even when comparing planes with zero alpha
> > (fully transparent). Moreover, I see the same CRC values regardless of
> > the value set in the alpha property.
> >
> > To ensure that the blending mode is as expected, I explicitly set the
> > Pre-multiplied blending mode in the test. Then I tried using different
> > framebuffer data and alpha values. I've tried obvious comparisons too,
> > such as fully opaque and fully transparent.
> >
> > As far as I could verify and understand, the value set for the ALPHA
> > property is totally ignored by AMD drivers. I'm not sure if this is a
> > matter of how we interpret the meaning of the premultiplied blend mode
> > or the driver's assumptions about the data in these blend modes.
> > For example, I made a change in the test as here:
> > https://paste.debian.net/1235620/
> > That basically means same framebuffer, but different alpha values for
> > each plane. And the result was succesful (but I expected it fails).
> >
>=20
> The intent was that we don't enable global plane alpha along with anythin=
g that requires per pixel alpha.
>=20
> The HW does have bits to specify a mode that's intended to work like this=
, but I don't think we've ever fully supported it in software.
>=20
> I wouldn't necessarily expect that the blending result is correct, but ma=
ybe the IGT test result says otherwise.

hmm... afaiu, I think the issue here is that no formula of pixel blend
mode ignores the "global plane alpha". Looking at the description here:
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_blend.c#=
n142
I understand the global plane alpha is the plane_alpha, described as:
"Plane alpha value set by the plane "alpha" property."
And the pixel alpha is the fg.alpha, right? So, the "None" mode doesn't
care of pixel alpha, but still considers (global) plane alpha, and
"Pre-multiplied" mode is considering plane alpha and pixel alpha to
calculate how background RGB affects the resulted composition...

>=20
> > Besides that, I see that other subtests in kms_plane_alpha_blend are
> > skipped, use "None" pixel blend mode, or are not changing the
> > IGT_PLANE_ALPHA property. So, this alpha-7efc seems to be the only one
> > in the subset that is checking changes on alpha property under a
> > Pre-multiplied blend mode, and it is failing.
> >
> > I see some inputs in this issue:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/1769.
> > But them, I guessed there are different interpretations for handling
> > plane alpha in the pre-multiplied blend mode. Tbh, I'm not clear, but
> > there's always a chance of different interpretations, and I don't have
> > a third driver with CRC capabilities for further comparisons.
> >
> > I made some experiments on blnd_cfg values, changing alpha_mode vs
> > global_gain and global_alpha. I think the expected behaviour for the
> > Pre-multiplied blend mode is achieved by applying this RFC patch (for
> > Cezanne).
> >
> > Does it seems reasonable? Can anyone help me with more inputs to guide
> > me the right direction or point out what I misunderstood about these
> > concepts?
> >
> > Thanks,
> >
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 2 +-
> >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 4 ++++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 6633df7682ce..821ffafa441e 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -5438,7 +5438,7 @@ fill_blending_from_plane_state(const struct
> > drm_plane_state *plane_state,
> >
> >       if (plane_state->alpha < 0xffff) {
> >               *global_alpha =3D true;
> > -             *global_alpha_value =3D plane_state->alpha >> 8;
> > +             *global_alpha_value =3D plane_state->alpha;
>=20
> Isn't the original behavior here correct? The value into DC should only b=
e an 8-bit value but we have 16-bit precision from the DRM property. This i=
s truncating the bits that we don't support.
>=20
=46rom what I could verify (printed), the driver reads a 8-bit value, and
the shift is actually clearing the global_alpha_value:

alpha_value >> 8;
[   38.296885] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
[   38.296887] amdgpu: Global alpha resulted: global_alpha_value 0x0000
[   38.297071] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
[   38.297072] amdgpu: Global alpha resulted: global_alpha_value 0x0000
[   38.297601] DCN20 update mpcc: 1, 0x00, 0x00, 1
[   38.297660] DCN20 update mpcc: 1, 0x00, 0x00, 1

ppa =3D per_pixel_alpha
ps/a =3D plane_state->alpha

Values in the last prints are:
per_pixel_alpha,
pipe_ctx->plane_state->global_alpha_value,
blnd_cfg.global_gain,
blnd_cfg.pre_multiplied_alpha

alpha_value; (no shift)
[  +0.000003] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
[  +0.000002] amdgpu: Global alpha resulted: global_alpha_value 0x007e
[  +0.000001] amdgpu: Changing global alpha: ppa 1, ps/a 0x007e
[  +0.000001] amdgpu: Global alpha resulted: global_alpha_value 0x007e
[  +0.000553] DCN20 update mpcc: 1, 0x7e, 0x7e, 1
[  +0.000068] DCN20 update mpcc: 1, 0x7e, 0x7e, 1

> >       }
> >  }
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > index 4290eaf11a04..b4888f91a9d0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> > @@ -2367,6 +2367,10 @@ void dcn20_update_mpcc(struct dc *dc, struct
> > pipe_ctx *pipe_ctx)
> >                       =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA)
> >               blnd_cfg.pre_multiplied_alpha =3D false;
> >
> > +     if (blnd_cfg.pre_multiplied_alpha) {
> > +             blnd_cfg.alpha_mode =3D
> > MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAI
> > N;
> > +             blnd_cfg.global_gain =3D blnd_cfg.global_alpha;
> > +     }
>=20
> While I'm not sure we should be exposing/enabling per pixel alpha + combi=
ned global gain, I think the correct logical ordering for this would be to =
modify the check higher up in the function.
>=20
> If (per_pixel_alpha && pipe_ctx->plane_state->global_alpha)
>     blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINE=
D_GLOBAL_GAIN;
> else if (per_pixel_alpha)
>     blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
> else
>     blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;
>=20
> This should maintain compatibility with scenarios that don't specify any =
alpha value on the plane.

Thanks! So, in the case that global_gain is previously set as 0xff in
the code, is it ok to always set global_gain =3D global_alpha or should it
only happens when _COMBINED_GLOBAL_GAIN mode is defined?

>=20
> Note that this logic would also need to be carried down into the dcn10_up=
date_mpcc function as well.
yeah, sure!

Thanks a lot for your feedback! I'll try to provide more inputs.
Also, let me know what you think about the expected behaviour of global
plane alpha from these pixel blend mode formulas.

Best Regards,

Melissa
>=20
> Regards,
> Nicholas Kazlauskas
>=20
> >       /*
> >        * TODO: remove hack
> >        * Note: currently there is a bug in init_hw such that
> > --
> > 2.35.1
>=20

--aeyx4nrdwtn56g3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJB5WsACgkQwqF3j0dL
ehxZ/xAAhVwzsOixVcxxDM/+aw4erI/dDn3vOFAA9+tkSFY45cGoa1T7Cv/buz6a
p3x3VNZ3NlbO1TK/dXaCpdP+9md9hmC2qYXqnUJDe/u2sFnQjxZzCjj2LzV3vTwn
MeH4/uk368MPx0MQ4lQ7W9wgSdb7TWxXaoPUagep+slmbl6ymgpQ53Y4AYRF06Az
FB0j3jjAV5PvtmIMuTjwlXl2fcpGGuoHJYdejSL5zwcO+TYgBHkrxXzo30EwXnrP
toxfOOokywbnlUR0ybb+StGQWHkVJERYh+rswZWXUnbbHKH+AxBAiqV+dNaL3S+w
jQE3OcwXu/bj2q0ccPsxR44vnMxFbX5IweV+8NzzRd8Q5watiNj01pQAsk3jqvY1
oPeCz/aDW9xsLfjoKZNIpeRSpscT4bU2EJsNcDtRPB/6sZuC9UZridoaQrh8aeDC
S2BN03BwtvKGeONW+wWJDD9A9uZ7FI5KToO6IP4qwbvsP9CcML6lR0Ulkm8fplzh
zM1sc3XBa7gJFSgExPmvkoFEgU/4Kv5TFQmQTvAX2xsNKMMDTTBM8s2Ltlo+Tn9W
HBNt5SPHN6JWJSVpa+jqdZ4iMcH3hvMnuTf56HnMUPiVzxCQbSr0h5jeZ2TgNIny
1Ejs+Wp3XHITBDOx7/eMfL19KNjOGrBitvzmS38IvxX2Hrgqb9g=
=sI3r
-----END PGP SIGNATURE-----

--aeyx4nrdwtn56g3p--
