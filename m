Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0C5B3451
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 11:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726B10EC56;
	Fri,  9 Sep 2022 09:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCD310EC4F;
 Fri,  9 Sep 2022 09:46:55 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 787F62B058D2;
 Fri,  9 Sep 2022 05:46:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 09 Sep 2022 05:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662716810; x=1662724010; bh=VJHkhJx0Es
 BOO/PKyemiYA7JCqQ7y/OXK0bpKjIBb2g=; b=hPcI68CgdK4CWZnZFU4/iNmvOC
 /JrbHPoDAX3pZ71k/QK6XTnM0m6HShIpRkTPLJoj71ZrWhwzA3f9P93CbHQ/2DCa
 ACcbLA8ikbfYvjBasaorgv+qvhckEa9X2CsE8zfrA7UwJqNftP7pR+U+dRWxmMJG
 nBhZ6VTFLTx9h1vDtywpfyOfJpxLtZcUZ2T2W0gDXheOJARzHX3Oh+za+ujClDc+
 8MjX77mdN7COPYL2nTxzSE1z4On90khAM5nWRo8QRIhXf3U0sRTTEC9om9UeHOLw
 iA4217eGnn1MCA1Rj3CnaczRAX14/t767xBF2WzIGKc9CDgyM5BhVHbs4a7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662716810; x=1662724010; bh=VJHkhJx0EsBOO/PKyemiYA7JCqQ7
 y/OXK0bpKjIBb2g=; b=sRdugyy4phNJD77z7TVts3ZCgUJktLwXYGzkCsBwUKb/
 hdbEjyQBooGZOm4zC3xtsEg+oZmk3+ebFojbq6hUypqooeXx8tG0jXfr3qfL8xJ9
 TNAM8dCDS0U0tK19irC17Qd4KlU5dTt7XOIyIR6CKVxl7wgupnqmDeeeuHBdwNj0
 nH0LRbk1c2t6FvaLAMOd14FqERLyBjHaxH2/AxuNyn6DyVclYEeBJvF5lDQWqu4u
 iDTBJRKhXDiRPZxooMKRg45AvfFVvTKv5m88GNFpDLKAJGB0fVKdeTmKzY8gmKyz
 n1pguvkG4bGc6RhSypj741O5FhTRE4qQYjyxdUthnQ==
X-ME-Sender: <xms:iQsbYxOur0zb5sA2a_1tZ04k9qXNhoZ42X7lxPga4idhGSBMkz77Uw>
 <xme:iQsbYz9MrLhoZdG4eiPFFGLHfqtRcve7DeVqNvATtmY-PfO5vvCcpIiJKNpCm6w-X
 PTNhkhXMHcJTICX2cY>
X-ME-Received: <xmr:iQsbYwRpUVEzOYrU6OQVGFvT10ZZ8ZJJvkT5BJsebrHOjkjLE_QadvlkaUY_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvfedtudetvdekheeijeevgfekfeegvdfgueevkedvffektdetveefvdet
 iefggfenucffohhmrghinhepfihikhhiphgvughirgdrohhrghdpsghoohhtlhhinhdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iQsbY9u6llC9-ba5vOD-GNSuyf5aXZSx9pbZRzZn8LU1LQZF8ZaZjA>
 <xmx:iQsbY5cVNiQVbtHim7s_hLPenEc4uH9BhF1wDgIFfzLQbWKgwY7k2g>
 <xmx:iQsbY513h1w-rHafmaSkP2Q5-tFHF_mp5EmP2XrEZnou0kmtWqfhQg>
 <xmx:igsbY-O2tqbCs5qziZEFCw0TVJNgcedYB3XO-oV4OCv0GiS_s5jA2fp5ttQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 05:46:48 -0400 (EDT)
Date: Fri, 9 Sep 2022 11:46:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
Message-ID: <20220909094647.aahohiwtwbbeyzj3@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
 <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
 <20220907121009.toizfolruuazcrns@houat>
 <6639fb8f-e16c-1ef5-5978-c522f76c8ded@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y7n4zefqf4avwoxu"
Content-Disposition: inline
In-Reply-To: <6639fb8f-e16c-1ef5-5978-c522f76c8ded@gmail.com>
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


--y7n4zefqf4avwoxu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 09:52:09PM +0200, Mateusz Kwiatkowski wrote:
> W dniu 7.09.2022 o 14:10, Maxime Ripard pisze:
> > Hi,
> >
> > On Fri, Sep 02, 2022 at 12:00:33AM +0200, Mateusz Kwiatkowski wrote:
> >> W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
> >>> The TV mode property has been around for a while now to select and ge=
t the
> >>> current TV mode output on an analog TV connector.
> >>>
> >>> Despite that property name being generic, its content isn't and has b=
een
> >>> driver-specific which makes it hard to build any generic behaviour on=
 top
> >>> of it, both in kernel and user-space.
> >>>
> >>> Let's create a new bitmask tv norm property, that can contain any of =
the
> >>> analog TV standards currently supported by kernel drivers. Each drive=
r can
> >>> then pass in a bitmask of the modes it supports.
> >>
> >> This is not a bitmask property anymore, you've just changed it to an e=
num.
> >> The commit message is now misleading.
> >>
> >>> +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] =3D {
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
> >>> +=A0=A0=A0 { DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
> >>> +};
> >>
> >> I did not comment on it the last time, but this list looks a little bi=
t random.
> >>
> >> Compared to the standards defined by V4L2, you also define SECAM-60 (a=
 good
> >> thing to define, because why not), but don't define PAL-B1, PAL-D1, PA=
L-K,
> >> SECAM-H, SECAM-LC (whatever that is - probably just another name for S=
ECAM-L,
> >> see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of =
NTSC).
> >>
> >> Like I mentioned previously, I'm personally not a fan of including all=
 those
> >> CCIR/ITU system variants, as they don't mean any difference to the out=
put unless
> >> there is an RF modulator involved. But I get it that they have already=
 been used
> >> and regressing probably wouldn't be a very good idea. But in that case=
 keeping
> >> it consistent with the set of values used by V4L2 would be wise, I thi=
nk.
> >
> > Ack. What would be the list of standards we'd absolutely need? NSTC-M,
> > NTSC-J, PAL-60, PAL-B, PAL-M, SECAM-60 and SECAM-B?
>=20
> The "essential list" IMO is NTSC, NTSC-J, NTSC-443, PAL, PAL-M, PAL-N and=
 SECAM.
> Note that:
>=20
> - I intentionally propose "NTSC", "PAL" and "SECAM" without an ITU system
> =A0 designation. If we only consider composite signals, there's no differ=
ence
> =A0 between e.g. PAL-B, PAL-D and PAL-I, so it's better to label it as a =
generic
> =A0 mode, IMO.
>=20
> =A0 * PAL-M and PAL-N are different, because those unique color encodings=
 were
> =A0=A0=A0 only ever used with Systems M and N, respectively.
>=20
> =A0 * NTSC-J is also different, because "System J" doesn't exist anywhere=
 in ITU
> =A0=A0=A0 documents. Japan technically uses System M with a non-standard =
black level.
> =A0=A0=A0 But "NTSC-J" stuck as a universally recognized name for that va=
riant.
>=20
> - I intentionally did not list PAL-60 or SECAM-60. TBH... PAL-60 is just
> =A0 regular PAL paired with 480i60 modeline. Most if not all displays that
> =A0 accept PAL-60 input will just label it as "PAL". If we are not introd=
ucing
> =A0 strict modeline validation, then maybe separating PAL and PAL-60 isn'=
t really
> =A0 necessary? Same goes for SECAM vs. SECAM-60.
> =A0
> =A0 ...and same goes for NTSC vs. NTSC-50 a.k.a NTSC-N, which is a very e=
xotic
> =A0 mode, but known to exist at least in the Atari ST world, see also:
> =A0 https://en.wikipedia.org/wiki/NTSC#NTSC-N/NTSC50
>=20
> Combining PAL and PAL-60 into a single setting would complicate the vc4 d=
river
> a little bit, though, as the registers need to be set up differently for =
those.
>=20
> My feelings about the PAL-60 issue are not that strong, though. Merging P=
AL
> and PAL-60 in this context is just a loose suggestion, I won't even try to
> argue if you disagree.

Ack

> >>> +/**
> >>> + * drm_mode_create_tv_properties - create TV specific connector prop=
erties
> >>> + * @dev: DRM device
> >>> + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_=
TV_MODE_*)
> >>> +
> >>> + * Called by a driver's TV initialization routine, this function cre=
ates
> >>> + * the TV specific connector properties for a given device.=A0 Calle=
r is
> >>> + * responsible for allocating a list of format names and passing the=
m to
> >>> + * this routine.
> >>> + *
> >>> + * Returns:
> >>> + * 0 on success or a negative error code on failure.
> >>> + */
> >>> +int drm_mode_create_tv_properties(struct drm_device *dev,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned int sup=
ported_tv_modes)
> >>
> >> supported_tv_modes is supposed to be a bitmask of BIT(DRM_MODE_TV_MODE=
_*)
> >> (or (1<<DRM_MODE_TV_MODE_*)) rather than DRM_MODE_TV_MODE_* directly, =
but this
> >> is not said explicitly anywhere in this doc comment.
> >
> > The argument doc mentions that it's a "Bitmask of TV modes supported
> > (See DRM_MODE_TV_MODE_*)", how would you improve it?
>=20
> Maybe something like "Bitwise OR of BIT(DRM_MODE_TV_MODE_*) values"? Or m=
aybe
> just add a little usage example?

This is the way we're usually documenting it in DRM:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#=
L357
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_crtc.c#L=
861
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_blend.c#=
L546

So I'd rather keep it consistent

Maxime

--y7n4zefqf4avwoxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxsLhwAKCRDj7w1vZxhR
xQNwAQDGVy/bDydbuEelD+Un9evUL1pdEdKWiWdcQdisqFd25gEAzd+tx6ewe0Hz
X/8/nMaUMIeZCeFOXcLFqq6fiu8M7g8=
=RNUZ
-----END PGP SIGNATURE-----

--y7n4zefqf4avwoxu--
