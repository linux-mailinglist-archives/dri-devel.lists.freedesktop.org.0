Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D85B1C91
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 14:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EA410E9BF;
	Thu,  8 Sep 2022 12:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B78610E67F;
 Thu,  8 Sep 2022 12:16:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id EA3332B05A0A;
 Thu,  8 Sep 2022 08:16:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 08 Sep 2022 08:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662639386; x=1662646586; bh=KrUSQEGonb
 AlAjJjGy+o4W945brRN+Avg2umBhBnQI0=; b=FDJ+i06umqUPBluRJ7zeRUbZGi
 N7jURhZXBmo5/S/Usa0N7J90mrtZzUzd9Nnaqc/FSn/y2WncCNW0R/moHpGLsUYL
 C5HWH/06WmYBIrzd3wE8FfKvD0KP4va0BIHvH8EF3nQZlPPz05ZBTb7yXqScAKuO
 2cUl3GXynvvp+pozPGU+71VCeJvYCtvKDI5tFdQJ+tdXHAMzBJCwHKqsE0lKu/Pr
 A8ao6EFdwHVEEFLchW5crqmZTnlYgKcXUd/7CLSB+FPVSiwYJTLsjONLCGGyUb5y
 BFn+4WlR1jtVnr0gwwa1yiUURtwxTD5yuFucnCU7kZFiAss3Xjxn5XHd3GhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662639386; x=1662646586; bh=KrUSQEGonbAlAjJjGy+o4W945brR
 N+Avg2umBhBnQI0=; b=qSbjZbSSlScqRRb2KD+nkNMWqkO7dm28pU786LY/qda/
 20Ta+Fxd1Nfb9NVVgPzUZ5oXSwIVH75WHvntED+kLxclil5DY0Pe1OLJHK/OlyA0
 gpWzwt0FgxfMKod2+RxptaSG392n33NPqK/rCJPfYeu9E9KTI49qaIpha15PJwFe
 n2fe8C/IedfcplqCjGsd87uRarm6rQxfP3WAZPBWsXbWbMkI3xxUOfRjmg/XKIdV
 wfYk/382pZzKgJ+qRyqYgkzd+uFzaBZ1CidqctyDK7PR+nulsm3G8tT4B47TdQdK
 yfTTbwtCbOcgqMJqt0PLyEhVSx/hdOjbLulLGn2KOQ==
X-ME-Sender: <xms:Gd0ZYx-VJ_n8fwhNzqeinW9zRoOJIB3yBBBoJyfyI0tFQTcYQ_FvOg>
 <xme:Gd0ZY1t0XkgJ6p7z-6oK4s3Ru034OpDPdtxoRb1VE7LajPBjrkGKfmnncnLXy9nN8
 7Ck7iK31cV8Qbo7GtE>
X-ME-Received: <xmr:Gd0ZY_CkBdJCltHOl2jashFOaN-V8z3B7N42MUSuy5gtYWjK0NmyFuSuXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtvddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetudffhfdtieeuleeivdevgeefvdfggfejuefhtdekueetfeduhfejfeej
 veegueenucffohhmrghinhepmhhouggvrdhimhdpghhithhhuhgsrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthh
X-ME-Proxy: <xmx:Gd0ZY1dGuvC2jLOJEshGqp-NA3ciXfOKnk7LWOZHvBKJlbHTDeS6kw>
 <xmx:Gd0ZY2Ph-WCqb7jAUhuUX7FJ_U8LaQhIzBiUa8BIUZN0-z70FI8IZA>
 <xmx:Gd0ZY3mFDu01G1S9U0_8Ss8uXVSawJwGIIWaxxMzuTa6inA22MpeFA>
 <xmx:Gt0ZY7ZmPog5GvP-mfXxmuJC3nvvPwh0VCe2U2NDnNmf_Ik9E6bz7qwRem4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 08:16:25 -0400 (EDT)
Date: Thu, 8 Sep 2022 14:16:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
Message-ID: <20220908121623.m6n2zyk3aratb6ag@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
 <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
 <20220908112312.hlb7mzneuxnethhr@houat>
 <aa510ec2-a72d-364b-424e-816872ab6923@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tdggbbxhdgn6r5uy"
Content-Disposition: inline
In-Reply-To: <aa510ec2-a72d-364b-424e-816872ab6923@gmail.com>
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
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tdggbbxhdgn6r5uy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:31:34PM +0200, Mateusz Kwiatkowski wrote:
> W dniu 08.09.2022 o 13:23, Maxime Ripard pisze:
> > Hi Noralf,
> >
> > On Tue, Aug 30, 2022 at 09:01:08PM +0200, Noralf Tr=F8nnes wrote:
> >>> +static const struct drm_prop_enum_list tv_mode_names[] =3D {
> >>
> >> Maybe call it legacy_tv_mode_enums?
> >>
> >>>
> >>> +=A0=A0 =A0{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> >>>
> >>> +=A0=A0 =A0{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
> >>>
> >>> +=A0=A0 =A0{ VC4_VEC_TV_MODE_PAL, "PAL", },
> >>>
> >>> +=A0=A0 =A0{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
> >>
> >> If you use DRM_MODE_TV_MODE_* here you don't need to translate the val=
ue
> >> using the switch statement in get/set property, you can use the value
> >> directly to get/set tv.mode.
> >
> > I'm sorry, I'm not quite sure what you mean by that. If we expose the
> > DRM_MODE_TV_MODE_* properties there, won't that change the values the
> > userspace will need to use to set that property?
>=20
> I'd just like to point out that if numerical values of these enums are yo=
ur
> concern, then you're (or perhaps I am ;) already breaking this by adding =
new
> modes in patch 33/41 in this series.
>=20
> And the values (and names!) added by that patch (33/41) don't match those
> currently used by the downstream version
> (https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/gpu/drm/vc4=
/vc4_vec.c).
> If any userspace software is manipulating this property, it's most likely
> targeting the downstream code. But since you're not aiming for consistenc=
y with
> that, I was under the impression that compatibility isn't a concern.

I'm not really concerned about the compatibility with the downstream
tree, if only because you already broke that compatibility with your
patch :)

So you're right, I'll reorganize that patch to keep the backward
compatibility.

Maxime

--tdggbbxhdgn6r5uy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxndFwAKCRDj7w1vZxhR
xZzpAQDu6178QjxcwYvkevzAeo7PrIc0OnYrnwJMv32MTXR4eQEAk5vzF3oEW4ES
B3YR/wi67B2CLlhZDDEHOYE/bL80EQ8=
=fmem
-----END PGP SIGNATURE-----

--tdggbbxhdgn6r5uy--
