Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1604C3006
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 16:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDD810E7BA;
	Thu, 24 Feb 2022 15:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D0410E7BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 15:40:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7197F3200F9F;
 Thu, 24 Feb 2022 10:40:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 24 Feb 2022 10:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=SlH0z6iExYHBK5adJMP5MHfvFlHFL38vAM6nEr
 Vbw4s=; b=H05jNUaY8D4SI/PPxp5TTCCNErsWQ2tTk+doVPp9rm8vudpNftDlhB
 9FbCL8ksJWcBe2mGilr+pZckLhSXvjKIxUM1ADu10H3/KJYrA6csNtlT3XNIZwvj
 LeVr3h8O8H+bJJ99iP3oyZoHvzCqKWpXNzbYRoohBcdT1D1x5woifrg5eY4251rL
 ciOEshy1loUWrsGL4S4hsYZylvHZ/qOk2ecxdNTbzDYr1/tRAqWIXQLjHZtKB2NJ
 NLXhqs7KERuS5gYrhws9CSwNxwqVeWuuIQQfVfNhdphLQPajLT4CWxzxoGG/Gy+N
 47OhRoPEqKszAxe46kQ2l+Vl6PHuWPOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SlH0z6iExYHBK5adJ
 MP5MHfvFlHFL38vAM6nErVbw4s=; b=FDOmaJyRe9/6fADVJqtKe1q6Z5zMlqX+D
 Ijzda65GyLkIsxf2tsenFhXJMR8wy9tt2c3tk/8+4cdNcCyVh6YAFjcZT/G/HWnq
 vbpnOmxLC3zRHHtiB0aGCAYo9TuRkbVJOoK6h5/bldVUQeyZZ08tysV79TEHU30F
 +Deu7NDpVnYGclkQxqJZSbnPFfDbiBx4rTddTY7mhv+xKwSEj2AToL+mdd8KRl3U
 45A6dM4ogzjAz03Y37XjwjdyZyqUbHUGRxauC1kMpBXatdFwM4QO3gWe4jGkZyFC
 /XCF+Z/UiS/z+zl4pyO9qgA7MsQ/99T6LnrDtxh5wCx7QrVjKpHeA==
X-ME-Sender: <xms:3KYXYlACOkaFK6-mgocCQvglh9OHUFrzDmm4G07nCDVF3JuFp8lNeA>
 <xme:3KYXYjj4fM4BP5g5rtAwsEOD72CQqK9unfhIFaOO2TkhGw_QyEAiYvYnwALw2wmWN
 vGebUeoG_th1TFkP-A>
X-ME-Received: <xmr:3KYXYglYOI1Y7ExwhGxqRz0ieImxKDESJY6lfvuJsLad1-rrrJdx_xsJ2ZLX0o7SwcK-wyAv7KuarS2IdbmlCy5Jltf9TEA5VdWEtvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledvgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3KYXYvz9RPsDz8rZO9HhO0YytpkkKB4-IX9D60fzwduScY6YDHNSgg>
 <xmx:3KYXYqRQJOFHwVwS3PBD_Gcg17687lJGZ6F31RLgD-nQtr7NBFmxdg>
 <xmx:3KYXYiZKAI2Iq10PpT_t621oDNyz2U764P8ayuBU_g8KLz5zAYT3JQ>
 <xmx:3qYXYoeOPZI7XKYQylLvPB7pEKxuhetR_K_Uw714ft7Yh9Ww9ObjNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Feb 2022 10:40:12 -0500 (EST)
Date: Thu, 24 Feb 2022 16:40:10 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host
 HS clock from DSI bridge
Message-ID: <20220224154010.n65epa73meznvwo3@houat>
References: <20220219002844.362157-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dkc5f3auz7vq2zlr"
Content-Disposition: inline
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dkc5f3auz7vq2zlr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 19, 2022 at 01:28:37AM +0100, Marek Vasut wrote:
> This patch series attempts to address a problem of missing support for DSI
> bridge-to-bridge or panel-to-bridge clock frequency negotiation. The prob=
lem
> has two variants.
>=20
> First, a DSI->to->x bridge derives its own internal clock from DSI HS clo=
ck,
> but the DSI HS clock cannot be set to arbitrary values. TS358767 is one s=
uch
> bridge in case it operates without Xtal. In that case, the TC358767 driver
> must be able to negotiate the specific suitable DSI HS clock frequency for
> the chip.
>=20
> Second, both DSI->to->x bridges and DSI hosts currently calculate, or rat=
her
> guess and hope they both guess the same number as their neighbor, the DSI=
 HS
> clock frequency from form of PLL=3D(width * height * bpp / lanes / 2). Th=
is is
> dangerous, since the PLL capabilities on both ends of the DSI bus might d=
iffer
> and the DSI host could easily end up generating wildly different clock th=
an
> what the DSI bridge/panel expects to receive.
>=20
> This series attempts to address these negotiation problems by extending t=
he
> existing .atomic_get_input_bus_fmts callback into .atomic_get_input_bus_c=
fgs
> callback in struct drm_bridge_funcs {}. The extended version returns not =
only
> a list of a list of bus formats supported by a bridge, but the entire lis=
t of
> struct drm_bus_cfg, which currently contains format and bus flags, but ca=
n be
> extended with other members, like desired clock frequency, as required.
>=20
> This series demonstrates such extension by adding the support for negotia=
ting
> the DSI clock and by implementing such support in DW DSI Host and TC35876=
7 DSI
> bridge.

We discussed it a bit on IRC as well but there's another issue with
this, let's imagine this setup:

encoder -> DSI-to-DPI bridge -> DPI-to-HDMI bridge -> HDMI Monitor

HDMI is fairly favorable, and it would probably use pixel clocks of
either 148.5, 297 or 594MHz. Let's simplify this a bit and assume your
DSI-to-DPI bridge can only operate at a frequency equivalent to 297MHz.

594Mhz is going to be used by those new fancy monitors, and thus the
preferred mode is likely to be using 594MHz.

With your solution, it effectively means that when the system will boot
up, the preferred mode will be reported to the userspace (and the fbdev
emulation), whatever is coming next is going to use it, and you're just
going to... refuse it because it never worked in the first place. You'll
leave a blank display, and that's it. That's not a great behavior,
really.

And since you don't get a state until you start a commit, this would
need to be able to work without one. Of course, some state parameters
will affect the clock (like the bpc count) so it won't be perfect, but
we can at least try.

Another thing is that the clock that needs to be negociated is likely to
be device specific. It's probably going to be fairly similar across
similar devices (like all the DSI bridges you mentioned are using the HS
clock), but I'm not sure we can make that assumption.

I think we could make something that work by asking the previous bridge
in the chain for a given clock rate with a given mode, and then filter
out / adjust anything we don't like. It would then be able to first
check if it can provide that clock in the first place, and then the rate
it has, and would be free to forward the query up to the encoder. And
since it's tied to the mode, it would work with mode_valid too.

Maxime

--dkc5f3auz7vq2zlr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhem2gAKCRDj7w1vZxhR
xYAEAP9pWP7LgmTdEjaPu2whDNdHO6V4rwPZzjPHpAGewJBy0QEA9N9OwIAFyShd
7juEuL5/kG3rXKGQlkqbC2pVC0l/KgI=
=JA+o
-----END PGP SIGNATURE-----

--dkc5f3auz7vq2zlr--
