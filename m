Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BCB6D8055
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C16110E9C9;
	Wed,  5 Apr 2023 15:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1210E9D6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:03:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 6D9712B0679B;
 Wed,  5 Apr 2023 11:03:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 05 Apr 2023 11:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680707009; x=1680714209; bh=X2
 EVnzTis2BTEg3qTs7N4aFzgNBylsDKbjb27d1is0s=; b=QRX3AGMJJt6PPwJkGv
 4UAnefP7j9j9LDd4UHTa2ziLcAZAgyxZx6jadts+8iXd66840WJhN73QQzgYn60s
 F38R2Wn619iQbvb0GqvFRssj3cIndatmZR3fx7Z/LtUOW0HllN/oUGZSEX5qdzVu
 Gs5b7cAFBvffUPMHWbFXMZ78yYNngwVcGrVe/B+EDKErHyizWMTmTmD3YJKO1/1H
 x0rWkcyxSMAHCZEj0NMaPLGtHKqoCBQaxQl2cLv6VQEN0CW8fiw4C+vhb8RNioZD
 6SZBkrfnDKo9vfMqYnPLKiyfvPmBjGKsuGi6lEQEqEYrtRb08aAYmV+tu/rWyxkr
 pwVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680707009; x=1680714209; bh=X2EVnzTis2BTE
 g3qTs7N4aFzgNBylsDKbjb27d1is0s=; b=arXC5nJ+zRop9Vs7aY85QC+CmqbMV
 tS0tsp78b7BVPv4TTygkxoECWZYyTTDA/Mx/McWzGM1hGDdyy/Xyojb/mKzkRRuh
 voNMSg9C3K9OMLd0bN4kVzM/f7pjtenXaeAQCMpYY4gNuJqbDd1GqUfnNDhEPsRM
 HlBeMqwaezTdEaH6I+vsrD2JFKEJPhah4+o0a3XzIZW/Qa9IpfT7uRRSftQMWuUa
 mF0kFrQjxLZ4e73Yp0YgaiVONaybeFWT3AiY4ctnD8CVJ39e58Y4dQbQUS8G7fuD
 HZAyCjg+K/N5apKnC7lDPrYMtmg7dw8z1nhnioMb38BQvpk+3ziX+WZ4g==
X-ME-Sender: <xms:wI0tZPoBL3YOi78ooi1kkWLUnaPmN8f0sb0vwpf_HIFW7TGYqs8m_g>
 <xme:wI0tZJqPOHQU_-TzQYIrjNbmy4PwSnyPWG4FviX8MHcbYyExQbGYQhY6eGA7i-s4K
 wk2QS815Y-EAojsjtM>
X-ME-Received: <xmr:wI0tZMPYcTKquEwYRRVst__-BPmhgE7eVWG4qhD3vADlnPZkBvwkYpoHNxVWeg2rbKaoLfxdnkCBuWanTaX43uHy3A07nN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtgfdukeeigeeuhfelheeftdfhgfegfefgudeuiefhueeuleekveetvdei
 tddvieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:wI0tZC7p3_VI1PMPUcxRZM5DsgTC85eywYkQkFYw52qk8-cKHeoqvg>
 <xmx:wI0tZO5ggfKEQFHku3refH-rwZwH_03PDaGHTnLPO9ovjO_RHWRvtA>
 <xmx:wI0tZKi1er4pVPCaZs9Lv3skNpx74ZdCWoD2TBShqh63NNwAgEavcg>
 <xmx:wY0tZE7ePYPJiXlFfORa-WHRjmcTdggvRtL0-nCedv632vmpXOBrninXw6E>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:03:27 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:03:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Message-ID: <pu3vdz4gnkwgn4thg6tndbnvfroevpnq75bqbfv7yyrh4gkv63@xxl3dsjf2ih3>
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev>
 <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
 <20230329195802.veybo3367zifw77n@penduick>
 <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3yjjmcpxi3qkranu"
Content-Disposition: inline
In-Reply-To: <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3yjjmcpxi3qkranu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 02:34:11PM +0200, Roman Beranek wrote:
> Hello Maxime,
>=20
> On Wed Mar 29, 2023 at 9:58 PM CEST, Maxime Ripard wrote:
> > > In order to preserve semantic correctness however, I propose to prefa=
ce
> > > the change with a patch that renames sun4i_dotclock and tcon-pixel-cl=
ock
> > > such that dot/pixel is replaced with d/data. What do you think?
> >
> > I don't think it's exposed to the userspace in any way so it makes sens=
e to me
> >
>=20
> Here's a new series that includes those renames:
> <https://lore.kernel.org/all/20230331110245.43527-1-me@crly.cz/>
>=20
> It turns out however that the new dclk rates can't be set exactly as
> requested without touching pll-video0*, tcon0 now therefore gets
> reparented from pll-mipi to pll-video0-2x which, as it further turns
> out, breaks DSI. While simply forbidding the video0-2x mux option seems
> to me as the right way to go because there's not much use for it with
> non-DSI interfaces either besides the opportunity to power pll-mipi
> down, I'd like to run by you first.

Sounds reasonable

> * As pll-mipi doesn't have CLK_SET_RATE_PARENT flag set, pll-video0
>   retains its boot-time rate of 294 MHz set by sunxi-dw-hdmi driver
>   in u-boot. Why 294 MHz (as opposed to the default rate of 297 MHz)?
>   The driver actually asks for 297 MHz, clock_set_pll3 rounds it to
>   294 MHz though because it limits itself to 6 MHz steps.

We could also address that though

Maxime

--3yjjmcpxi3qkranu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2NvgAKCRDj7w1vZxhR
xbITAP9byIveCVVd6a8cqjY690IWR4pqo+XDDHeelvOTXcnloAEAoqs4t+zaupHu
ywLZIz47coEFL0AyJr8kfHc1DcgKQQk=
=6Dki
-----END PGP SIGNATURE-----

--3yjjmcpxi3qkranu--
