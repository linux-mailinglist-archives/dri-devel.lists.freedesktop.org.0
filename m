Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EAD5B071D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 16:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1A710E791;
	Wed,  7 Sep 2022 14:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2724810E786;
 Wed,  7 Sep 2022 14:38:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7F43F580314;
 Wed,  7 Sep 2022 10:38:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Sep 2022 10:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662561520; x=1662568720; bh=G+dQi/CqDE
 Andi9GeELhOR4Fo+JzDcf4uQRnrofBKd8=; b=3FFUrZ7s6VxSN6vL5Cw4baUUa5
 jDBnxlmgMIp8WXQLYEovPXCkQh6iup20i9PZhFoxra1kWYALiWJTZXWq3TmijN13
 wOktSWoa4r9C2d/jfCHKOjD60uJdIV1cuw2dsF/I4D8umuBbgxF9XIjbv1CDZoRs
 RAQLXHXxejuH5YF82ejQpmx2qR/d4wDR6lZaS5Ovf+IX5gMMSapTfn7ISApQJDjD
 0cPaQ+8P46SeUgUy1AQdKInb+GK1uCL3syzskNavZvuCAYDUHrpX04Rp+DupVEhJ
 EnsexyIYQUz53CjNBZqcaUnqrZP20gelrB0FmBIrMi5bOoPfrbStmlsSbntg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662561520; x=1662568720; bh=G+dQi/CqDEAndi9GeELhOR4Fo+Jz
 Dcf4uQRnrofBKd8=; b=J1gj70TqeaZBOD/8F/Ysvvj+yYSkSbaho7x/umphLAnU
 DUE17Aqnpoa9lFiXO0DkkIV7pC8wKxK+D2hZwIdoyWZthInu9EQK//CrgXd7BAr8
 8fsdivkrN/oFOLjVGwBH91Yh0285SHGE/BsQMwS9TGegZp6Q5W5brP1C94HVf5Io
 /GjHfnowkowVZDMXD3MthtXJTnw5n6pt308G7686nBE8GmwZynE/kR4xruMshW8c
 idaoHumZSyBEg0wb9D8BPb12LjqHZD1EGRqaDa5ZJKhCd0GVZBxspLBG7bCc6E0c
 4pBJt/G9KiCH+hndbmPhXbgfK9r4uRuAQVxjn8V+YA==
X-ME-Sender: <xms:8KwYY9oHdo_fef7xbGZvQ7RU6e5VqNtiwYTPzfH5zP1cBvBRPYXXKg>
 <xme:8KwYY_pPPbFPbihsZjJJ161P5ISbfJMsmByJfwS3HxBdv_w8GnpAgHW_vZwcxeZ0U
 rxCVJgLIQv0v2LDp_I>
X-ME-Received: <xmr:8KwYY6MBzgqAzm8k0YKFAOjcXh_JzEkVwk9KeAbf6Zes-QmlekUYjit_Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8KwYY46QVtCc1FB4h9YEHP1n5sKVROo8PqNFS5ybv2YrktUHAwxqjg>
 <xmx:8KwYY87k5h0Z88PudROgDw3LEkJ-mSadMDDDdHVsk_fUwn4PfV8fMA>
 <xmx:8KwYYwgcrz8kjGCriG7u5kEQ0bQX_6R7ku9_agV9z6YwESV4urxPXg>
 <xmx:8KwYY87sl9s6K8vlDCAbttgkC_W4xWTggHCz4yAWsg7BETWXCafDog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 10:38:39 -0400 (EDT)
Date: Wed, 7 Sep 2022 16:38:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220907143837.ys76egf2yg5uyq2z@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
 <20220905133251.js26hxdosibx4r4i@houat>
 <6ac67d1f-e5b5-2687-372f-4146eed5cc5d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nnvo5o5a2xq4dkin"
Content-Disposition: inline
In-Reply-To: <6ac67d1f-e5b5-2687-372f-4146eed5cc5d@gmail.com>
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
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nnvo5o5a2xq4dkin
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 06:32:14PM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime,
>=20
> W dniu 5.09.2022 o 15:32, Maxime Ripard pisze:
> > Hi,
> >
> > On Wed, Aug 31, 2022 at 10:14:28AM +0200, Geert Uytterhoeven wrote:
> >>>> +enum drm_mode_analog {
> >>>> +=A0=A0=A0 DRM_MODE_ANALOG_NTSC,
> >>>> +=A0=A0=A0 DRM_MODE_ANALOG_PAL,
> >>>> +};
> >>>
> >>> Using "NTSC" and "PAL" to describe the 50Hz and 60Hz analog TV modes =
is common,
> >>> but strictly speaking a misnomer. Those are color encoding systems, a=
nd your
> >>> patchset fully supports lesser used, but standard encodings for those=
 (e.g.
> >>> PAL-M for 60Hz and SECAM for 50Hz). I'd propose switching to some mor=
e neutral
> >>> naming scheme. Some ideas:
> >>>
> >>> - DRM_MODE_ANALOG_60_HZ / DRM_MODE_ANALOG_50_HZ (after standard refre=
sh rate)
> >>> - DRM_MODE_ANALOG_525_LINES / DRM_MODE_ANALOG_625_LINES (after standa=
rd line
> >>>=A0=A0 count)
> >>
> >> IMHO these are bad names, as e.g. VGA640x480@60 is also analog, using
> >> 60 Hz and 525 lines.=A0 Add "TV" to the name?
> >>
> >>> - DRM_MODE_ANALOG_JM / DRM_MODE_ANALOG_BDGHIKLN (after corresponding =
ITU System
> >>>=A0=A0 Letter Designations)
> >>
> >> Or DRM_MODE_ITU_*?
> >> But given the long list of letters, this looks fragile to me.
> >
> > Does it matter at all? It's an internal API that isn't exposed at all.
> > I'd rather have a common name that everyone can understand in this case
> > rather than a *perfect* name where most will scratch their head
> > wondering what it's about.
>=20
> You may have a point. But in that case, maybe it'd make sense to at least=
 add
> a short comment explaining what do you mean by "NTSC" and "PAL" in this c=
ontext?

Consider it done :)

Maxime

--nnvo5o5a2xq4dkin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxis7QAKCRDj7w1vZxhR
xTvFAP9Y3LOGR153AWzkGlQJzp68VIaTnrTJdhwA2F1nff9iPAEA5bUMZNpshaSy
QX+PeKcbA3F+gDjgQKft9KnC247cTgA=
=3r/y
-----END PGP SIGNATURE-----

--nnvo5o5a2xq4dkin--
