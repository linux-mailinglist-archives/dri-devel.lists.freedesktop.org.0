Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50C5AFF4F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6CF10E452;
	Wed,  7 Sep 2022 08:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4210E466;
 Wed,  7 Sep 2022 08:39:53 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 320A72B058ED;
 Wed,  7 Sep 2022 04:39:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 04:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662539989; x=1662547189; bh=rHnQqoPJFb
 fCoyXvlScJxF/2TX4ozlRbjwh/s/ZcTXY=; b=rlqCba81GDVgmFo9BLO/+vxElt
 00saXH5K4+1wgARPrortKc3X6tNhaIagHxtFq9FX3QmW3eYm/dcZ/Xd4W+DrIVIq
 q0ZxCwyGbK8ynlgCZPdKYsO6989NICVWzfThhQB+swIE/SocQxL0blVkHOFtYt2a
 +2+eIDIfs+YcNgfST8S5UY09pFJI0qh1RWs4gmUb3i2JerXi6IRhUpSQtzv5IYsh
 1R00Oxsydc4sydZCByQlMfEFKKC8TlhHoFWg6uhtxDCJ6cXS1GbN/TN7SCCOMP3q
 4NhkrIyfgxjadagzbyrTdMplcJk1ooyf72O8s6MEfTM5H43N/6TUUkM/iTMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662539989; x=1662547189; bh=rHnQqoPJFbfCoyXvlScJxF/2TX4o
 zlRbjwh/s/ZcTXY=; b=Ft2HiBtALvBCzHSoyFouoM2RlHha3pW36vRYiiF/Aj9p
 jgB1+hT9SxJN781aapotSR/nkYu/nTdv1O9qZsnJ5VQJfDsXDF2E1tN+Vf4mRiWm
 G3SR4pPvfJAXEDu2a05LRJ6/2dgvjxxBVBsk9pwViUxDpoVGiuqZtFXraPe+syba
 nVKdja+C+91rr9ysqLwQhbdr720KzsCw9Fz/J/VUWbcfg/4nkWZiYcuLP+R0Pc0C
 HA3z5f5hC4bLUng7cKExSmOjYAXPw/PxIhiALmfh/1nzPMTG1+X572MR4zmCPVA9
 ibD0tPdUx+IXQ3o/2bEzZzCONQqNRDoUM4Iv38uutA==
X-ME-Sender: <xms:1VgYY9PFmBkjp0A7V2bAvop2SdEyXbVH_QNWffffyTGZZlmvW9zTOg>
 <xme:1VgYY__oQcg990U2Ytw0kb6kVkiaTRlq3gCt6yktxijiRju56YzaqVM5TpIr3LCLa
 m8uXyfwKPsq_TBiKeM>
X-ME-Received: <xmr:1VgYY8Sm2V9A-f-DlbfvRBXYrF873-ZITm50jnaOpA1ZX4ooWEOKRX9mZ5I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1VgYY5uFE1WbjoOrw3Lre0EoafBbvnBB2ypQ4HWQOs-it5Cdl6-FHw>
 <xmx:1VgYY1fpgJSwUcfS6TGnANh5IEL_p7D07vbwqnvWXJKXepArMPGHHQ>
 <xmx:1VgYY10gohsFHOuwqMe2C54wVRArFsMFtgg869v4JlHnNkmOqGq3bw>
 <xmx:1VgYY6O_FMI7-UBHsQNAFH9El9UhTIjZAXjM7SKD_8RFiBosm1XRCs5wey8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:39:48 -0400 (EDT)
Date: Wed, 7 Sep 2022 10:39:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
 separate function
Message-ID: <20220907083945.3cqmz765vmnjt3ol@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
 <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
 <87czcidnb8.fsf@intel.com> <20220830120330.6f5f22d35gu7cbr3@houat>
 <875yi9etuw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qxovco4c3ldtue3z"
Content-Disposition: inline
In-Reply-To: <875yi9etuw.fsf@intel.com>
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
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qxovco4c3ldtue3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 30, 2022 at 04:36:23PM +0300, Jani Nikula wrote:
> On Tue, 30 Aug 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> > Hi,
> >
> > On Tue, Aug 30, 2022 at 01:43:07PM +0300, Jani Nikula wrote:
> >> On Tue, 30 Aug 2022, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wr=
ote:
> >> >> +#define STR_STRICT_EQ(str, len, cmp) \
> >> >> +       ((strlen(cmp) =3D=3D len) && !strncmp(str, cmp, len))
> >> >
> >> > This is not part of the move, but newly added.
> >>=20
> >> The same construct is also duplicated elsewhere in the series, and I
> >> kept being confused by it.
> >
> > I'm not sure what is confusing, but I can add a comment if needed.
>=20
> STR_STRICT_EQ() is what's confusing. I have to look at the
> implementation to understand what it means. What does "strict" string
> equality mean?

Same length, same sequence of characters

> >
> >> The above is precisely the same as:
> >>=20
> >> 	str_has_prefix(str, cmp) =3D=3D len
> >
> > Here, it's used to make sure we don't have a named mode starting with
> > either e, d, or D.
> >
> > If I understood str_has_prefix() right, str_has_prefix("DUMB-MODE", "D")
> > =3D=3D strlen("DUMB-MODE") would return true, while it's actually what =
we
> > want to avoid.
>=20
> That's not true, str_has_prefix("DUMB-MODE", "D") =3D=3D strlen("D") is.
>=20
> > It's also used indeed in drm_get_tv_mode_from_name(), where we try to
> > match a list of names with one passed as argument.
> >
> > With drm_get_tv_mode_from_name("NSTC", strlen("NTSC")), we would end up
> > calling str_has_prefix("NTSC-J", "NTSC") =3D=3D strlen("NTSC-J") which =
would
> > work. However, we end up calling prefix not a prefix, but an entire
> > string we want to match against, which is very confusing to me too.
>=20
> If I get this right, you have a string and you want to check if that has
> a certain prefix. Additionally, you want to check the prefix is a
> certain length.
>=20
> Sure, that the prefix is a certain length is more of a property of the
> string, which is NUL terminated later than at length, but that's doesn't
> really matter.
>=20
> That condition is simply str_has_prefix(string, prefix) =3D=3D length.

Ack. I'm ok with the implementation being done that way, but I'd really
prefer to still have some macro to make the name less confusing. Would
that work for you? What name would be better in your opinion?

Thanks!
Maxime

--qxovco4c3ldtue3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxhY0QAKCRDj7w1vZxhR
xa5XAP9sWfv5tHnxQJpN3hRmX3ErZIQ33tjnxBrnbPX7t8NAjwD/emsxhT5EFzpt
Y/lLUUTztSaE0qu2ofT3EG9ZeOf9fw8=
=dNn8
-----END PGP SIGNATURE-----

--qxovco4c3ldtue3z--
