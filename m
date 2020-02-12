Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CFE15BA98
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9F96F554;
	Thu, 13 Feb 2020 08:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5606EAA9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 12:53:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B1CD9CB8;
 Wed, 12 Feb 2020 07:53:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 12 Feb 2020 07:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=FYMgNW1AABvOrAFmHBwSTNBjY0U
 QZ9+M+hZkuY1Xbi0=; b=QGtYjTjyb/d/6+hyPNWS9QgzrAZ8FRTBYoYt3mFEniY
 ZZZXsR9at9vwnKcGtFSfU3csQZATWV1I7rXgbQyAYpjsA8hMGHK9OimsmPQYYea5
 UepXMHz4/A+vu7yeIXYCvujD/XP8+3wCnTUFcKiWBahjlq3lPRnNL4HVVcT1ckeF
 iK4aMdqUA4gZwuQnT3iDQxQhKONL8QQT2hKhVa1nRB0U/LhvMpr+8sKTm9a++gUH
 Ve7OfkBAkMKJ2ZdplD0gS0vsdjxcTwkD/qfuhI5tXy37JNJYiJpjDZe/qUTD/v0B
 IUpNb2mMpID+lHpK/JaudS+n5+rA/+NE1HYv+6RCdXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FYMgNW
 1AABvOrAFmHBwSTNBjY0UQZ9+M+hZkuY1Xbi0=; b=1pcWMOR7GX/4RrAmeXkRAS
 NjY5pGCmmtDNFpvdb5xce3Hge8EyUrvdTo/cwAIThrtvTdKyppVK3nbefCF+cx0x
 zFwPD89xsSDcnAT092cbNoXHVbb4OyDGQSIzLdsOy7zRRJVvRJ9Q10lBlal2oNWs
 aq+6uiJb6+kOtV9PgrhjZlQb0gmXQ+8uOhaq765PB55wfk5WXNyek5L7dkBAc8+A
 7S7vVl0WgGaUICNwo0F3nZO+2ZeyYzUowTzBhhyrxeP2ZEKohymj/82mabpPcyg+
 IZahoOv0uzzyUDe+Rr8Jsdz6gbsi9ptRDQc8V4zWsL3m1Ka/1ffqwrje/OMwKjrw
 ==
X-ME-Sender: <xms:WvVDXlAJe-I_Ty-M9L3IwSBtpvB52akNRSslI7bzkmPojn-V1I4LkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:WvVDXnzMpY8RacejKxQJeEhp0OBGgrJVrRceoR27Vv2pKjCvsPIhEQ>
 <xmx:WvVDXrllSutR1NatOir2li2gQHSiDp0J7AX1wC1-KRvMWIIFomOnAw>
 <xmx:WvVDXkGPnElIH2s8uy3FwmkI2Btv6BcZoOJp5hUQ2q9n_rsgunGF9g>
 <xmx:X_VDXsoXO7sHrtGKEhPJKoZjJZZHZq_CASuU8gWkkzm7mf_NHlgUDg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D8363280065;
 Wed, 12 Feb 2020 07:53:46 -0500 (EST)
Date: Wed, 12 Feb 2020 13:53:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200212125345.j6e3txfjqekuxh2s@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200211072004.46tbqixn5ftilxae@gilmour.lan>
 <20200211204828.GA4361@kedthinkpad>
MIME-Version: 1.0
In-Reply-To: <20200211204828.GA4361@kedthinkpad>
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1163965028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1163965028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pu5japc265ilzlxp"
Content-Disposition: inline


--pu5japc265ilzlxp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

On Tue, Feb 11, 2020 at 10:48:28PM +0200, Andrey Lebedev wrote:
> Maxime, thanks for your comments. I'll update the patch, but meanwhile,
> I have some remarks/questions, see below.
>
> On Tue, Feb 11, 2020 at 08:20:04AM +0100, Maxime Ripard wrote:
> > > +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
> > > +			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
> > > +			   SUN4I_TCON0_LVDS_ANA1_UPDATE);
> >
> > You refer to U-Boot in your commit log, but the sequence is not quite
> > the same, why did you change it?
>
> I actually had two reference implementations at my hand. One was u-boot
> and another - an old (abandoned) branch of Priit Laes [1] (I took the
> split-up of u-boot SUNXI_LCDC_LVDS_ANA0 constant from there).
>
> This is an attempt to simplify the sequence, since I noticed that the
> same bit was being set to the same register twice [2] and removing that
> duplication didn't produce any observable regression. Priit
> implementation didn't have that bit set in the end of the sequence
> either, so I omitted it. That said, I agree that it could've been a bit
> naive on my side, and I can get it back to match u-boot version, if you
> feel that might be important.
>
> For the reference the U-Boot code is here: [3]
>
> [1] https://github.com/plaes/linux/commit/cc8c8bab2f2f2752ba6b11632dcd0f41bac249bc#diff-014a76a5007005a7a240825a972b8c7fR127
> [2] setbits_le32(&lcdc->lvds_ana0, SUNXI_LCDC_LVDS_ANA0_UPDATE);
> [3] https://github.com/ARM-software/u-boot/blob/master/drivers/video/sunxi/lcdc.c#L60

The U-Boot code has been here for a while and we know it's robust by
now, so I'd prefer to be conservative and use it here.

> > > +#define SUN4I_TCON0_LVDS_ANA1_REG		0x224
> > > +#define SUN4I_TCON0_LVDS_ANA1_INIT			(0x1f << 26 | 0x1f << 10)
> > > +#define SUN4I_TCON0_LVDS_ANA1_UPDATE			(0x1f << 16 | 0x1f << 00)
> >
> > Having proper defines for those fields would be great too.
>
> If by "proper" you mean "split them up to individual bits", I would
> agree, but I can't find any actual hardware reference documentation that
> would mention the meaning of these registers.

Of course we don't.. :)

It's fine to leave them as is then

> In both places (u-boot and Priit) these constants are defined the same way.
>
> I took the liberty to rename ANA1_INIT1 to ANA1_INIT and ANA1_INIT2 to
> ANA1_UPDATE to match Priit naming rather than u-boot, as I felt it was
> more descriptive. I have no strong opinion here though.
>
> > Side question, this will need some DT changes too, right?
>
> Hm, I agree. I think it would be reasonable to include LVDS0/1 pins

That, but most importantly, the reset and clocks for the LVDS
block. Also from looking at it, I'm not entirely sure that the TCON1
has a LVDS output, do you have a board when you have been able to test
it?

> and sample (but disabled) lvds panel,

That's good for the sake of the example, but it shouldn't be in the
same patch, it won't be merged.

> connected to tcon to arch/arm/boot/dts/sun7i-a20.dtsi. Does that
> make sense to you? Would you expect dts changes in the same patch or
> separate?
>
> P.S. This is my first patch to the linux kernel, please forgive me my
> inexperience.

You're doing fine so far :)
Maxime

--pu5japc265ilzlxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkP1WQAKCRDj7w1vZxhR
xZNVAQDk7kYMe1KzSTh9h8gVCxcVbKhxx1W/v2MVlCfHsy8/BQEAtsTcaVX0N/k6
q5+dn9ebIf4B0VB50BvQrFkvCbmxZA4=
=VUQU
-----END PGP SIGNATURE-----

--pu5japc265ilzlxp--

--===============1163965028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1163965028==--
