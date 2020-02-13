Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F115D361
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400E66E505;
	Fri, 14 Feb 2020 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F4B6F582
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 09:24:43 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 850DE21C46;
 Thu, 13 Feb 2020 04:24:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Feb 2020 04:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=XbLU97l4zers+TXWwIjHkBYNF2+
 +heBtojtr9FpLezA=; b=PjV7/0LD0reTrVkK6LWSxQ0WdqVytHKg8XY8GBdfFYl
 faOVB0eImMzS+sPwiYd8gcIB0P+8YTq8/HcnjmINXhBHg4GQBMCuqcJ7TtUUhrzz
 xcIzWL4TI7rqy+frFJyvUJ4Jm9xFIQQ46d+GvFqcHUJMLC4sy8tuTEUoD7fo6zXl
 jxhC3PvvytQPjpRVz92h4OQwy3yMDiYiKB+zHyD/9lD82xbbXKvlADaoNvF/0A/L
 jTF9NbaFjUOP9SqtOdaU7dDrAD1oOHnjArwncLlZ6i5wp5kKj3tBpqFZaKATDXIt
 Ccmg5eL2+7qoUGhd3S5fDSFsHkCjE7pJ4/17hetZN4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XbLU97
 l4zers+TXWwIjHkBYNF2++heBtojtr9FpLezA=; b=1+rKNlfiBWv+hI5hu+ir17
 07IpmVM4Qfr2DyK3HvbMTJx0AJlmv4qOgqHS1VKEp34D4f0r+K+lx91VPG5h13yR
 wvfHQVIDb5kfHImBteY32tTwlskuZaVBQOwVAT23nehkbTfUm9518nSXpfYD7klZ
 6De8+39R0CxJYol8EAb2yvrLUXb5vgaq312Wz8wWnBXLvCwi8WsEV1L1CqC66R16
 RAwMIO2uqnmxA7dBOs4fcwfgJMkzPA/8bQbLRHMtOxGBE9xpPr8OamNs6BOVMR+n
 vCZsJlE0HD6SsIhXZMClLqaWqzf50I2LnyXGIvnY290XJnDDzW1SNHpZ8GSwPDBw
 ==
X-ME-Sender: <xms:0xVFXj22SZmBgqAM5__VL5EDX_HzDF5eagYmKhtZ-r2MGcR2TCEyjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epohhpvghnvhgrrhhiohdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0xVFXjXaLhA9EEJu49IXEi3mwe-qNFYRbmzmzXBp7PfNxdcB86Rlig>
 <xmx:0xVFXg_k7LVErab3Mh3Nd7qpb7JA1mnfp9gNUR2hirm1L6oirqXolQ>
 <xmx:0xVFXr2Wul32-43UW-C_2afEbUX_onNzK4s-lutcpmq3eFO09X9NBg>
 <xmx:1hVFXrJqD8tus2qi4NqZXuM_CWWC46tlFjT3bRKPudimKEByCUpx8g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 87FB03280062;
 Thu, 13 Feb 2020 04:24:35 -0500 (EST)
Date: Thu, 13 Feb 2020 10:24:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey.lebedev@gmail.com>
Subject: Re: [PATCH 1/1] Support LVDS output on Allwinner A20
Message-ID: <20200213092433.sc2rs7el63mwvf3y@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200211072004.46tbqixn5ftilxae@gilmour.lan>
 <20200211204828.GA4361@kedthinkpad>
 <20200212125345.j6e3txfjqekuxh2s@gilmour.lan>
 <20200212224653.GA19494@kedthinkpad>
MIME-Version: 1.0
In-Reply-To: <20200212224653.GA19494@kedthinkpad>
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Content-Type: multipart/mixed; boundary="===============0880574330=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0880574330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="idvbhwndshxupoi2"
Content-Disposition: inline


--idvbhwndshxupoi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 12:46:53AM +0200, Andrey Lebedev wrote:
> On Wed, Feb 12, 2020 at 01:53:45PM +0100, Maxime Ripard wrote:
> > > > Side question, this will need some DT changes too, right?
> > >
> > > Hm, I agree. I think it would be reasonable to include LVDS0/1 pins
> >
> > That, but most importantly, the reset and clocks for the LVDS
> > block. Also from looking at it, I'm not entirely sure that the TCON1
> > has a LVDS output
>
> I also have impression that LVDS is only supported on TCON0, but that's
> mostly from this comment in sun4i_lvds.c:
>
> 	/* The LVDS encoder can only work with the TCON channel 0 */

No, that's a separate thing.

Internally the TCON has two channels, one connected to panels type of
display (LVDS, Parallel, etc), the second one connected to TV outputs
(HDMI, composite).

But then, on some SoCs like the A20, you have two TCON's too. As far
as I could see, only the first TCON can use LVDS, but I'm not
definitive.

Allwinner seems to allow panels to only be tied to TCON0 in the BSP,
so I guess we can assume that.

> > do you have a board when you have been able to test it?
>
> Yes, I have the hardware (Cubieboard 2) at hand, but I cannot change the
> any physical connections on it. FWIW, it is https://openvario.org, the
> device we are (painfully) trying to upgrade from old kernel-3.4 with
> proprietary mali drivers to contemporary software.

What painpoints do you have?

> > > and sample (but disabled) lvds panel,
> >
> > That's good for the sake of the example, but it shouldn't be in the
> > same patch, it won't be merged.
>
> I jave just submitted version 2 of the patches - set of 2 patches this
> time. Addressed your comments, please take a look.

I will, thanks!
Maxime

--idvbhwndshxupoi2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkUV0QAKCRDj7w1vZxhR
xUjlAQDtP35dyCa1eG2rSVZWUhNVB5ES5QtTp0Jg/SggFeiJ6gD8DeYNvUKtzf3R
c7ZWlhAmKKf1V1zA/Xmg+D1ch/lX9A8=
=IlPs
-----END PGP SIGNATURE-----

--idvbhwndshxupoi2--

--===============0880574330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0880574330==--
