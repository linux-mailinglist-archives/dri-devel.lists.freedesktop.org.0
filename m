Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472C5B39E9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 15:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D59710ED7C;
	Fri,  9 Sep 2022 13:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B81F10ED7E;
 Fri,  9 Sep 2022 13:54:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 11AC82B059E3;
 Fri,  9 Sep 2022 09:54:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 09 Sep 2022 09:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662731688; x=1662738888; bh=twsyF+dYRj
 XjnnGW4P2FrhcauKzDn/tda3IgcxV76Lc=; b=K8t4cEw2S1jTGUeOlMJf8kslEo
 QJyj678Lu8Kob+/9eWZagC2oRLjkSTAc0jeY16K+jwvEyPq60b7YpNsaRMptdInB
 HoJX2gz4TupUnyw1F5YdO8sItHXGsFBsUduHDRXFLN/2np2/yyd7PYvY0FVwwVit
 j3wL/7WNski567FQCYDMqTBdiIQwVqR8VPkz4UW/NqKLrjkY/qtE1LmNN7N3HRsP
 zRQsA0TJjJ8mADyZVvJIalbriX4DKPJeDthVRHRJNCgAtW7IMF3xN67/o6EthDv+
 s6gXj5TxpVtV7vZt8LM4Vt8UmWhu5zUx0uH8eR3tConKHPNbzjCftYF4MIrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662731688; x=1662738888; bh=twsyF+dYRjXjnnGW4P2FrhcauKzD
 n/tda3IgcxV76Lc=; b=RtBk1llT4lqeInj5g2sNFdZ2HVb6sArX5J8FMtXnYtZy
 6yIaShdwuTNh2CM7A3cxA6V81Laj8JF+AX9cgKHnwWhNFUfLtEf65m7QYt10l0DY
 ylhdn3JUl3zMfzz/fD+brQ9bhJUStZayX64p1pQyLXO3IGPK/wv2WRGpZB7VIzIN
 A+MsChORQ3n2DJYL+5IAkYTGs254ytq/smndyfQwCnx9png80n0uJIOwdtg+lzgI
 kkaS/f1QqyJdXEWreIsNU5HNUCK9jk9ZXnERNgZIK80BB+mduATiEQOAlg7BW/2p
 MqXeV+J8UFus2OTkVCke3KT1zcpbKW2NNwc32MuRnA==
X-ME-Sender: <xms:p0UbY9PPcVi_cAOlpxhqeVxz66Mh6lBkP6qPu1H5KanrG-JtFTEwaA>
 <xme:p0UbY_8qp8Hzt1sLplBlAJpjlyukLbD7b3xHTktsN1s9MlyFAxIRkXNZmUj8EzRMd
 BpZ6tz5Gx83ihkgpuE>
X-ME-Received: <xmr:p0UbY8TAQmH9ul3ky2SB-HR0Lzt-ZSZt5CpzRdtONm1W7ErkNLrpqwPDCz15>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtffetudfgleeukeevveevveeggfeliefhffeivdekfeeijeelledvueek
 tdfhteenucffohhmrghinhepihhtuhdrihhnthdpsghmvgdrhhhunecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhho
 rdhtvggthh
X-ME-Proxy: <xmx:p0UbY5uXL1R6lTBIJIZKSSJcjb48n2G8L5Gc7jjknEsFaeVeFxpkDA>
 <xmx:p0UbY1eToAMQkOxSYebYZ7mJ8HNyTHUl_2EtJMyTrwhNRsTDETyjvQ>
 <xmx:p0UbY12C2ZYYcGAb13oEeTH3xNYga-jddHXc-5MAQ-npF-iCg_UgQg>
 <xmx:qEUbY6MhpeZv12RGpjivI_KdabOBM4t_MLD0TMNZ879KCK8J5gAoKDVf8ck>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 09:54:46 -0400 (EDT)
Date: Fri, 9 Sep 2022 15:54:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220909135444.5oi6oh6nqwuke3jl@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="exp3fcsdo7vrdnhl"
Content-Disposition: inline
In-Reply-To: <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--exp3fcsdo7vrdnhl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 07, 2022 at 11:31:21PM +0200, Mateusz Kwiatkowski wrote:
> W dniu 7.09.2022 o 16:34, Maxime Ripard pisze:
> > On Mon, Sep 05, 2022 at 06:44:42PM +0200, Mateusz Kwiatkowski wrote:
> >> Hi Maxime,
> >>
> >> W dniu 5.09.2022 o 15:37, Maxime Ripard pisze:
> >>>>> +=A0=A0=A0 vfp =3D vfp_min + (porches_rem / 2);
> >>>>> +=A0=A0=A0 vbp =3D porches - vfp;
> >>>>
> >>>> Relative position of the vertical sync within the VBI effectively mo=
ves the
> >>>> image up and down. Adding that (porches_rem / 2) moves the image up =
off center
> >>>> by that many pixels. I'd keep the VFP always at minimum to keep the =
image
> >>>> centered.
> >>>
> >>> And you would increase the back porch only then?
> >>
> >> Well, increasing vbp only gives a centered image with the default 480i=
/576i
> >> resolutions. However, only ever changing vbp will cause the image to b=
e always
> >> at the bottom of the screen when the active line count is decreased (e=
=2Eg.
> >> setting the resolution to 720x480 but for 50Hz "PAL" - like many game =
consoles
> >> did back in the day).
> >>
> >> I believe that the perfect solution would:
> >>
> >> - Use the canonical / standard-defined blanking line counts for the st=
andard
> >>=A0=A0 vertical resolutions (480/486/576)
> >> - Increase vfp and vbp from there by the same number if a smaller numb=
er of
> >>=A0=A0 active lines is specified, so that the resulting image is center=
ed
> >> - Likewise, decrease vfp and vbp by the same number if the active line=
 number
> >>=A0=A0 is larger and there is still leeway (this should allow for seaml=
ess handling
> >>=A0=A0 of 480i vs. 486i for 60 Hz "NTSC")
> >
> > I'm not sure I understand how that's any different than the code you
> > initially commented on.
> >
> > I would start by taking the entire blanking area, remove the sync
> > period. We only have the two porches now, and I'm starting from the
> > minimum, adding as many pixels in both (unless it's not an even number,
> > in which case the backporch will have the extra pixel).
> >
> > Isn't it the same thing?
> > [...]
> > Unless you only want me to consider the front porch maximum?
>=20
> I think you're confusing the "post-equalizing pulses" with the "vertical =
back
> porch" a little bit. The "vertical back porch" includes both the post-equ=
alizing
> pulses and the entire rest of the VBI period, for the standard resolution=
s at
> least.
>=20
> The "canonical" modelines (at least for vc4's VEC, see the notes below):
>=20
> - (vfp=3D=3D4, vsync=3D=3D6, vbp=3D=3D39) for 576i
> - (vfp=3D=3D7, vsync=3D=3D6, vbp=3D=3D32) for 480i
> - (vfp=3D=3D5, vsync=3D=3D6, vbp=3D=3D28) for 486i (full frame NTSC as or=
iginally specified)
>=20
> The numbers for vfp don't exactly match the theoretical values, because:
>=20
> - VEC actually adds a half-line pulse on top of VFP_ODD, and in the 625-l=
ine
> =A0 mode also on top of VFP_EVEN (not always, but let's not dwell too muc=
h)
> - Conversely, VEC subtracts the half-line pulse from VSYNC_ODD and VSYNC_=
EVEN
> =A0 in the 625-line mode
> - SMPTE S170M (see https://www.itu.int/rec/R-REC-BT.1700-0-200502-I/en) d=
efines
> =A0 that active picture for NTSC is on lines 21-263 and 283-525; 263 and =
283 are
> =A0 half-lines that are represented as full lines in the "486i" spec

It's going to be a bit difficult to match that into a drm_display_mode,
since as far I understand it, all the timings are the sum of the timings
of both fields in interlaced. I guess we'll have to be close enough.

> - SMPTE 314M, which is the spec for DV, defines the 480 active lines as l=
ines
> =A0 23-262 and 285-524; see Table 20 on page 26 in
> =A0 https://last.hit.bme.hu/download/firtha/video/SMPTE/SMPTE-314M%20DV25=
-50.pdf;
> =A0 this means that the standard 480i frame shaves off four topmost and t=
wo
> =A0 bottommost lines (2 and 1 per field) of the 486i full frame

I'm still struggling a bit to match that into front porch, sync period
and back porch. I guess the sync period is easy since it's pretty much
fixed. That line 0-23 is the entire blanking area though, right?

> Note that the half-line pulses in vfp/vsync may be generated in a differe=
nt way
> on encoders other than vc4's VEC. Maybe we should define some concrete
> semantics for vfp/vsync in analog TV modes, and compensate for that in the
> drivers. But anyway, that's a separate issue.
>=20
> My point is that, to get a centered image, you can then proportionately a=
dd
> values to those "canonical" vfp/vbp values. For example if someone specif=
ies
> 720x480 frame, but 50 Hz PAL, you should set (vfp=3D=3D52, vsync=3D=3D6, =
vbp=3D=3D87).

In this case, you add 48 both front porches, right? How is that
proportionate?

> Those extra vbp lines will be treated as a black bar at the top of the fr=
ame,
> and extra vfp lines will be at the bottom of the frame.
>=20
> However if someone specifies e.g. 720x604, there's nothing more you could
> remove from vfp, so your only option is to reduce vbp compared to the sta=
ndard
> mode, so you'll end up with (vfp=3D=3D4, vsync=3D=3D6, vbp=3D=3D11). The =
image will not be
> centered, the topmost lines will get cropped out, but that's the best we =
can do
> and if someone is requesting such resolution, they most likely want to ac=
tually
> access the VBI to e.g. emit teletext.
>=20
> Your current code always starts at (vfp=3D=3D5 or 6, vsync=3D6, vbp=3D=3D=
6) and then
> increases both vfp and vbp proportionately. This puts vsync dead center i=
n the
> VBI, which is not how it's supposed to be - and that in turn causes the i=
mage
> to be significantly shifted upwards.
>=20
> I hope this makes more sense to you now.

I'm really struggling with this, so thanks for explaining this further
(and patiently ;))

If I get this right, what you'd like to change is this part of the
calculus (simplified a bit, and using PAL, 576i):

  vfp_min =3D params->vfp_lines.even + params->vfp_lines.odd; // 5
  vbp_min =3D params->vbp_lines.even + params->vbp_lines.odd; // 6
  vslen =3D params->vslen_lines.even + params->vslen_lines.odd; // 6

  porches =3D params->num_lines - vactive - vslen; // 43
  porches_rem =3D porches - vfp_min - vbp_min; // 32

  vfp =3D vfp_min + (porches_rem / 2); // 21
  vbp =3D porches - vfp; // 22

Which is indeed having sync centered.

I initially changed it to:

  vfp =3D vfp_min; // 6
  vbp =3D num_lines - vactive - vslen - vfp; // 38

Which is close enough for 576i, but at 480i/50Hz would end up with 134,
so still fairly far off.

I guess your suggestion would be along the line of:

  vfp_min =3D params->vfp_lines.even + params->vfp_lines.odd; // 5
  vbp_min =3D params->vbp_lines.even + params->vbp_lines.odd; // 38
  vslen =3D params->vslen_lines.even + params->vslen_lines.odd; // 6

  porches =3D params->num_lines - vactive - vslen; // 0
  porches_rem =3D porches - vfp_min - vbp_min; // 0

  vfp =3D vfp_min + (porches_rem / 2); // 5
  vbp =3D porches - vfp; // 38

Which is still close enough for 576i, but for 480i would end up with:

  porches =3D params->num_lines - vactive - vslen; // 139
  porches_rem =3D porches - vfp_min - vbp_min; // 96

  vfp =3D vfp_min + (porches_rem / 2); // 53
  vbp =3D porches - vfp; // 86

Right?

Maxime

--exp3fcsdo7vrdnhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxtFpAAKCRDj7w1vZxhR
xQthAP48zJ8g779BqSdxUbioH+WvlR067prjIQRN+Yc036muGAD/R7i4n/1FakDa
JQXyYQwjZa0/ToIqQHeTfHP+kWLvFAM=
=rFHL
-----END PGP SIGNATURE-----

--exp3fcsdo7vrdnhl--
