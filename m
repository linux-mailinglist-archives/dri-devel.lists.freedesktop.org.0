Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F365AD3EE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9157D10E37C;
	Mon,  5 Sep 2022 13:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C5810E37C;
 Mon,  5 Sep 2022 13:32:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 052A0580222;
 Mon,  5 Sep 2022 09:32:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 05 Sep 2022 09:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1662384775; x=1662391975; bh=BndZD3o0f1
 E/yy3CgHU6/gGUoZque82OSFD4UL+mJ2w=; b=EO51DpMNeWzuyeJKd9el0Z+cLH
 NUdELGUgfHmAmQwc9bO1eHIsyTCjVb6fKeXAsOOP0ooT7ZtS2CvRU3B6PonShX5s
 uR1ZZJCbH9yQLk6K7VKSGB0tZzBOR3Jlv5eAjhNha5mscFH185qRmHsoEf9c+4uo
 Wklciyf30h9oq+Q1YRb7azkX0Ij2Pu+51iPcbqca2LJUTAXwKgwvEM1lPI8x3QbT
 YGUgQzEKtEgQEHFNV8Q99Xoh3iP8e2e1GWifyq6iCSJ9pG5v9BLg9b9zwlXEz+uz
 4cffC29v8jg8wdVkqY0Mm42LGPU8Bl0mUMLOg3+sgCmCurF2BMm7Lcx0DkFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1662384775; x=1662391975; bh=BndZD3o0f1E/yy3CgHU6/gGUoZqu
 e82OSFD4UL+mJ2w=; b=eU6yw1G07vynu4cue4gKD5m5vvy2eoMhdBh/KSUVFtrn
 OUHh1USV2SgljBW7GMgHjMVt1pViT9lTam3HwIj+hEA+6zBGFGRYdXyQzNUaR+P1
 s+Vw/H5yGqPzR8nsRpmlqTwvnfOcemY9NIcLfzzj4uy5i7AUbqZXWLxdQkOLY7Po
 ajXvr2CJAnU3Nw8C28s5CvVrLWnyOlrg1GnRLgKn0ODjH1LwOVW5d1gYYexnKnWr
 wiB1smyxmMIORDxbolYI3+7smjffMX8HE/C8SGJlp29qtKsYk0QXBdYWxLGiK/hN
 yUZG8hJ6HVustSYeynQVK7Ceq0Tcxc0erG6EqlYr6A==
X-ME-Sender: <xms:h_oVY3ntSP4q_zNMDo5xX_moISXZo_3a78JIoPIkWjpzZtplMSiF6A>
 <xme:h_oVY63u6evuIVUF6Y36KuJoCroqVm1wNJGkDxHFkFsgAGgkTY_pBB26geJa1KOQM
 OiVcTfteeITkIwmKAU>
X-ME-Received: <xmr:h_oVY9pl5qN70CXGDREiRUgiL9wEzYSC0SEmuWMrKPJ-jErkIkktumflK6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:h_oVY_mldv5lSIFtb7mKoEW2f0hlNSlAc-J18EeAua7zN2oMUkSQVw>
 <xmx:h_oVY10lch1CZ3LlXmV-mLsgR6-5czKaO49jNv1oc1WXeW4MSawITw>
 <xmx:h_oVY-sSzq_ImTLpiuqqa5s1CXxjawZc82_NlD6orN-th3Uf9_2_yw>
 <xmx:h_oVYzERo3S5Dd--_eLY6ZmpwGdnUPC48g_gkuWxbcQVfLpC5gZLnw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 09:32:54 -0400 (EDT)
Date: Mon, 5 Sep 2022 15:32:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220905133251.js26hxdosibx4r4i@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="33jm6ubzzouafw3w"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
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
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Mateusz Kwiatkowski <kfyatek@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--33jm6ubzzouafw3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 31, 2022 at 10:14:28AM +0200, Geert Uytterhoeven wrote:
> > > +enum drm_mode_analog {
> > > +    DRM_MODE_ANALOG_NTSC,
> > > +    DRM_MODE_ANALOG_PAL,
> > > +};
> >
> > Using "NTSC" and "PAL" to describe the 50Hz and 60Hz analog TV modes is=
 common,
> > but strictly speaking a misnomer. Those are color encoding systems, and=
 your
> > patchset fully supports lesser used, but standard encodings for those (=
e.g.
> > PAL-M for 60Hz and SECAM for 50Hz). I'd propose switching to some more =
neutral
> > naming scheme. Some ideas:
> >
> > - DRM_MODE_ANALOG_60_HZ / DRM_MODE_ANALOG_50_HZ (after standard refresh=
 rate)
> > - DRM_MODE_ANALOG_525_LINES / DRM_MODE_ANALOG_625_LINES (after standard=
 line
> >   count)
>=20
> IMHO these are bad names, as e.g. VGA640x480@60 is also analog, using
> 60 Hz and 525 lines.  Add "TV" to the name?
>=20
> > - DRM_MODE_ANALOG_JM / DRM_MODE_ANALOG_BDGHIKLN (after corresponding IT=
U System
> >   Letter Designations)
>=20
> Or DRM_MODE_ITU_*?
> But given the long list of letters, this looks fragile to me.

Does it matter at all? It's an internal API that isn't exposed at all.
I'd rather have a common name that everyone can understand in this case
rather than a *perfect* name where most will scratch their head
wondering what it's about.

Maxime

--33jm6ubzzouafw3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxX6gwAKCRDj7w1vZxhR
xRY+APwO4YqnioLJFYdWxGYCqIG80ImumXUFbL0Tx5/LHpbRnAD9GcSO3ME950qT
a6PSCUqylWFq013v3epQ49LG4896+QQ=
=dwqa
-----END PGP SIGNATURE-----

--33jm6ubzzouafw3w--
