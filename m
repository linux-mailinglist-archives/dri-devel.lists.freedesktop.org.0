Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E45B03A2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C163C10E418;
	Wed,  7 Sep 2022 12:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FF510E418;
 Wed,  7 Sep 2022 12:10:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id CB3B45802A6;
 Wed,  7 Sep 2022 08:10:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Sep 2022 08:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662552614; x=1662559814; bh=mO0DxpIxEI
 aEUkrFxNz04g9y84A96XbiPwxWwzTH7i4=; b=fom/8HSsBSNM55Lsdc1X75CCSP
 PN8l87PDFyGp8TPirwp7/NKdyQyE9MOsckYzTIfsGD/eOWGZT1IjEvwX6zRlR0c8
 xyd4O5AWtoc0+t62PjFtQ3RhOXb+bOnAEcfbMUfDuJAjQ6zjcXBUAvby3kG2w20b
 j4yfradaLCNCQ4z9shorYr//Dwuft/CPwPoHfm1ruXd0ff7C+O0fdT/9xlZ8Fyd+
 LKIrBSAPvoJbYjAYVRV4xsznzw5wgSElrFDRTMXlahcPKe4Y7zn2SQlqk2E5IL40
 z9dpaDBbJUAmczQMZsMKwA3iTktpgYhzh2IM5IlJ4gdMKNv+HNHxTqw5tVvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662552614; x=1662559814; bh=mO0DxpIxEIaEUkrFxNz04g9y84A9
 6XbiPwxWwzTH7i4=; b=FbB8/owoOO+ZLDH3EfniBXdqyJiFnJp0Jors+WaT5pLQ
 82yMu72iyNa3D+sLEkaOfuaQPmMu4qBDEhaw1y1E2VPqQsh39Vmnp2mu+yG65exK
 9XCM6Ux2cTtPelDoWnm1jZ1K4lzccmE2LL/qG3GEJPQqpHeu4UVuOiGf65nzurBx
 OqflA4TM4RlvQWplqnrEGlVYw2fqBkDA5EBlljW+t7sG6IOihkY/kmK8wdQS67Sx
 J8GsmdY3H98n5BVGhwvoOrB+W0CZFuKn6e5bMYUTQKobszQuLNN7oh3oDwv8gUEz
 kJIqZqo7NoK9rL6MFL+hUomoXuhay/dgEfYX5A+HQA==
X-ME-Sender: <xms:I4oYYycILHs_ZLR117ki1XkoeLqqUVDpRjJmBH3yVU5Nu8j8qLUO0g>
 <xme:I4oYY8Oe_J6AHfDLoyTjH7Fo-tMAImiY7yMs1ESDtIa0uGa2fs2vEsuKarQgBs589
 P82kDx_abbSPcDFx-g>
X-ME-Received: <xmr:I4oYYzgjVxWAUOuEph6TExbD6A1U6of1EhT_r60bYTyp3bjib9h7zeO9YQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JIoYY_-6QayOoOGkUbElibmIA_OqIzRpgcohlNxcKGfCStYTFH0RnQ>
 <xmx:JIoYY-t8VScFMm-81-zpX7DH7PQdTruT0rrK_OygWRInoFppYX5puQ>
 <xmx:JIoYY2HuKwFropkYVWWfdzmm9aLh-9c2cP_gK9AFDAki_baEL1rWiw>
 <xmx:JooYY6ffURLJH6mELmdqCpg36o9Zir-cBfbfKsj2XMnXFNsdtLFI7Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 08:10:11 -0400 (EDT)
Date: Wed, 7 Sep 2022 14:10:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mateusz Kwiatkowski <kfyatek@gmail.com>
Subject: Re: [PATCH v2 09/41] drm/connector: Add TV standard property
Message-ID: <20220907121009.toizfolruuazcrns@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-9-459522d653a7@cerno.tech>
 <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nqpndwa6reldojsu"
Content-Disposition: inline
In-Reply-To: <30a9d7cd-d9ff-3177-ac6c-e7c1f966d89a@gmail.com>
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


--nqpndwa6reldojsu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 02, 2022 at 12:00:33AM +0200, Mateusz Kwiatkowski wrote:
> W dniu 29.08.2022 o 15:11, Maxime Ripard pisze:
> > The TV mode property has been around for a while now to select and get =
the
> > current TV mode output on an analog TV connector.
> >
> > Despite that property name being generic, its content isn't and has been
> > driver-specific which makes it hard to build any generic behaviour on t=
op
> > of it, both in kernel and user-space.
> >
> > Let's create a new bitmask tv norm property, that can contain any of the
> > analog TV standards currently supported by kernel drivers. Each driver =
can
> > then pass in a bitmask of the modes it supports.
>=20
> This is not a bitmask property anymore, you've just changed it to an enum.
> The commit message is now misleading.
>=20
> > +static const struct drm_prop_enum_list drm_tv_mode_enum_list[] =3D {
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_NTSC_443, "NTSC-443" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_NTSC_J, "NTSC-J" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_NTSC_M, "NTSC-M" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_60, "PAL-60" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_B, "PAL-B" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_D, "PAL-D" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_G, "PAL-G" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_H, "PAL-H" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_I, "PAL-I" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_M, "PAL-M" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_N, "PAL-N" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_PAL_NC, "PAL-Nc" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_60, "SECAM-60" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_B, "SECAM-B" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_D, "SECAM-D" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_G, "SECAM-G" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_K, "SECAM-K" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_K1, "SECAM-K1" },
> > +=A0=A0 =A0{ DRM_MODE_TV_MODE_SECAM_L, "SECAM-L" },
> > +};
>=20
> I did not comment on it the last time, but this list looks a little bit r=
andom.
>=20
> Compared to the standards defined by V4L2, you also define SECAM-60 (a go=
od
> thing to define, because why not), but don't define PAL-B1, PAL-D1, PAL-K,
> SECAM-H, SECAM-LC (whatever that is - probably just another name for SECA=
M-L,
> see my comment about PAL-Nc below), or NTSC-M-KR (a Korean variant of NTS=
C).
>=20
> Like I mentioned previously, I'm personally not a fan of including all th=
ose
> CCIR/ITU system variants, as they don't mean any difference to the output=
 unless
> there is an RF modulator involved. But I get it that they have already be=
en used
> and regressing probably wouldn't be a very good idea. But in that case ke=
eping
> it consistent with the set of values used by V4L2 would be wise, I think.

Ack. What would be the list of standards we'd absolutely need? NSTC-M,
NTSC-J, PAL-60, PAL-B, PAL-M, SECAM-60 and SECAM-B?

> > +/**
> > + * drm_mode_create_tv_properties - create TV specific connector proper=
ties
> > + * @dev: DRM device
> > + * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV=
_MODE_*)
> > +
> > + * Called by a driver's TV initialization routine, this function creat=
es
> > + * the TV specific connector properties for a given device.=A0 Caller =
is
> > + * responsible for allocating a list of format names and passing them =
to
> > + * this routine.
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int drm_mode_create_tv_properties(struct drm_device *dev,
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0 unsigned int supported_tv_=
modes)
>=20
> supported_tv_modes is supposed to be a bitmask of BIT(DRM_MODE_TV_MODE_*)
> (or (1<<DRM_MODE_TV_MODE_*)) rather than DRM_MODE_TV_MODE_* directly, but=
 this
> is not said explicitly anywhere in this doc comment.

The argument doc mentions that it's a "Bitmask of TV modes supported
(See DRM_MODE_TV_MODE_*)", how would you improve it?

Thanks!
Maxime

--nqpndwa6reldojsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxiKIQAKCRDj7w1vZxhR
xQFFAQDXwgKR9pMVMn84nPWIY7c88Fvo8DwU/8cFYEx48+uZKwEAjifIFr4Dz1pH
ltskjsJPqZk1PnFrApehWE8PzkjhpAc=
=FzGO
-----END PGP SIGNATURE-----

--nqpndwa6reldojsu--
