Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2F5A1296
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61D910E188;
	Thu, 25 Aug 2022 13:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B615810E188
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 13:44:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 19B495801FA;
 Thu, 25 Aug 2022 09:44:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 09:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661435052; x=1661442252; bh=AjAS+mxokB
 mADly8X+bwM1z4OrzJr2RjjjUhIDL33q8=; b=aBX2Pd5RY+tOBxJp7Q9Kg9QlAE
 xXlvpoCjmRubOY7P6I+BHGd97QgDL2AVDpf/PUw0n7ySzAAszNwsNCpT3/6eJzEW
 ZBFbOi70av8ROP3lP1CdNz7yZvvHR/yrhtbwEMZXtNh1HL3cI89A8wGRa9C3E9UV
 A+c4wlyqASoo87i0QjufCH7CVRVRSRpTF4nNZ+0z8qGhWYKmg0+XYW0ib5ztTETf
 xuwCqRc6LcdjmDg3dNjTRco2xb/pl71VGwBtufxCc+xvEUJIhri0VnpUdOWsAqo7
 mhYCwDVlz5GLR452UO+zMhnOwRTjRxovWcbVEQ9qzK6llfkPNdv4zxVP50SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661435052; x=1661442252; bh=AjAS+mxokBmADly8X+bwM1z4OrzJ
 r2RjjjUhIDL33q8=; b=wbLRi+/MnqRVf8XYD5hMxddwmSfrpNixFPg+0EmqSYBx
 jwROxs3/NjSL4LioG7sMaH+N8R/T1ro+6MeZQhmS/n89Q/3oJvLaXlNTeOANhQYk
 W6i066GwHdY+6za9liIVlBS/mMTKwUJ1LVKqRc24ThfkFz4zMBCsNU6xG4okTCZj
 YEXbQS0vrV4RKuYPBM0zprcS2is85jC2ukDCfYhR0kK7Ci75uG10EPLAzpz1TczY
 IyS3ORjSCMDrsJNgVegd7cn6gWbb4OlQlwBobnbEIt9Wo5ghJpCHAuM/FaSTEeen
 BqUrteGdd4JGYA9bRf2PwsmPhm2ZQTF1aKqCLfAkvA==
X-ME-Sender: <xms:q3wHYwJEFPKwRD-bJ0WNXQpQ6u0YGXCm5ZZAHqJAbi145PikINxAlw>
 <xme:q3wHYwLdiP1ka_ZE7YIIi9kgJ_cUq0KUIcUngIQW9aUxkAVprI2YOaS0NAaO1vNIv
 0HUL2DMMQ5V3h-Hhxs>
X-ME-Received: <xmr:q3wHYws-Dltmw0Gwp92UWSQjXICrzHSGC5rZK5B0Dvbc7RqFM0P7kaZ1mIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:q3wHY9a41ZGeJtSzfcaj6aGoJPhwlf8ciS6VwRTvQfHeJUCOksk2RA>
 <xmx:q3wHY3a7m1F_nSW3ahQtqPfda5UN-wj-3jRwNvzxCt-5sJwCBzpMtA>
 <xmx:q3wHY5BxaU8J5xmINtViC1twyVZYYENBvV6Erv1zpi7DQAOGQbFhlQ>
 <xmx:rHwHY0KHVaeKaL82Q-OroPeXq2HQX9yNggQVAJkSmXZDju0qAhQ1cA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 09:44:10 -0400 (EDT)
Date: Thu, 25 Aug 2022 15:44:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220825134408.dioj2lbycl7jm3ld@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ztityevrt7lawo2u"
Content-Disposition: inline
In-Reply-To: <37a76651-a457-e50d-9a05-00ca9ed5d729@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ztityevrt7lawo2u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Aug 20, 2022 at 10:12:46PM +0200, Noralf Tr=F8nnes wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 1e9996b33cc8..78275e68ff66 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -143,6 +143,32 @@ enum subpixel_order {
> > =20
> >  };
> > =20
> > +#define DRM_MODE_TV_NORM_NTSC_443	(1 << 0)
> > +#define DRM_MODE_TV_NORM_NTSC_J		(1 << 1)
> > +#define DRM_MODE_TV_NORM_NTSC_M		(1 << 2)
> > +#define DRM_MODE_TV_NORM_PAL_60		(1 << 3)
> > +#define DRM_MODE_TV_NORM_PAL_B		(1 << 4)
> > +#define DRM_MODE_TV_NORM_PAL_D		(1 << 5)
> > +#define DRM_MODE_TV_NORM_PAL_G		(1 << 6)
> > +#define DRM_MODE_TV_NORM_PAL_H		(1 << 7)
> > +#define DRM_MODE_TV_NORM_PAL_I		(1 << 8)
> > +#define DRM_MODE_TV_NORM_PAL_M		(1 << 9)
> > +#define DRM_MODE_TV_NORM_PAL_N		(1 << 10)
> > +#define DRM_MODE_TV_NORM_PAL_NC		(1 << 11)
> > +#define DRM_MODE_TV_NORM_SECAM_60	(1 << 12)
> > +#define DRM_MODE_TV_NORM_SECAM_B	(1 << 13)
> > +#define DRM_MODE_TV_NORM_SECAM_D	(1 << 14)
> > +#define DRM_MODE_TV_NORM_SECAM_G	(1 << 15)
> > +#define DRM_MODE_TV_NORM_SECAM_K	(1 << 16)
> > +#define DRM_MODE_TV_NORM_SECAM_K1	(1 << 17)
> > +#define DRM_MODE_TV_NORM_SECAM_L	(1 << 18)
> > +#define DRM_MODE_TV_NORM_HD480I		(1 << 19)
> > +#define DRM_MODE_TV_NORM_HD480P		(1 << 20)
> > +#define DRM_MODE_TV_NORM_HD576I		(1 << 21)
> > +#define DRM_MODE_TV_NORM_HD576P		(1 << 22)
> > +#define DRM_MODE_TV_NORM_HD720P		(1 << 23)
> > +#define DRM_MODE_TV_NORM_HD1080I	(1 << 24)
> > +
>=20
> This is an area where DRM overlaps with v4l2, see:
> - include/dt-bindings/display/sdtv-standards.h
> - v4l2_norm_to_name()
>=20
> Maybe we should follow suit, but if we do our own thing please mention
> why in the commit message.

Are you suggesting that we'd share that definition with v4l2?

I've tried to share some code in the past between v4l2 and DRM, and it
got completely shut down so it's not something I'd like to try again, if
possible.

Maxime

--ztityevrt7lawo2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwd8qAAKCRDj7w1vZxhR
xbq9AP9Ut8DrTs4R98n7uEJ4qsWpbIOQoxH89Co6dV81OZDd4AD/XTYHIrgOsCVX
KF7npRlfSwUkz5ZgJBgTt5iDHapUmAQ=
=Heqx
-----END PGP SIGNATURE-----

--ztityevrt7lawo2u--
