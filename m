Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF01F62FC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267D86E89D;
	Thu, 11 Jun 2020 07:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32BF6E053
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 07:12:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5639C5C00B5;
 Wed, 10 Jun 2020 03:12:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Jun 2020 03:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=g01DrXYlRa2+6yU8hRXD5BjQ2RT
 tnEPv0eJCUBaLaMk=; b=KWlDdEFghWE2OvR+qAxpbQ03RBir4WRoU6IDMf8zsUR
 Uxf9nZd0FfTOe29ko23YeXIwS3zOinpvUa1JwzQHC+f/hChipKBmiTJIlwdQVTU8
 OWTIl4Tf6KeEZyaH/7dDeZGxqrP9QutK13BUzTBjis428I9W7OpkeLxHBLQYYgQv
 3ZvEo+PLnFUV5sD/v+t0WuOHT/M1Rv0XlGii76c5pEAmviwylg2+gImTLWHsI9oX
 05lLzqIm3WmFyZPR3l6H1MGDoozqLLfoK6oXXgfJPT8ws4xco6x7rJ4H+xiZ1zXu
 fbsL7Vq3nUGAjARkRoIaJaRrt3Z5z0skUzKBHLBrxiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g01DrX
 YlRa2+6yU8hRXD5BjQ2RTtnEPv0eJCUBaLaMk=; b=KcpPr/P4/zq6AHvPomZ81x
 Q9HS5pDooERZzDlFaJ2rPOTH5LvV1WNP9N5BO5Bf9dOp0xbeZDc+e9zEwFqSqH9h
 8dsnpar9uZBgrLm/kxS93ufiiSl3A9SPa1tDMw9b8uuN4tX9hzRoYNN5tvnBRORM
 IKi1xxTpIeEfRirFY66/V2yKuD1nmjZHWhwj2O9qk0qztlqjg/bRdN1Tq7/p/RYS
 qirSmpBGV3lVOTM1/aamxmUoox+76i9AthRnrpcgU4Ck49ytcfEc0uyxLfgoI3w5
 Zb0pFhlbdL+AlbLIwwfIAhDntTq/jfSDIJAG1RNfNm7/wttd0ejxS6BQ3KxNADMQ
 ==
X-ME-Sender: <xms:5ofgXmtXoZ55T9tagIPGTNrI8lk5CNU1bOr3J05dbyy8JIvDk77NBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehhedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueev
 ieegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5ofgXrd21ielAMKgEjWS194dGk8YMboKPW7kdkIK4RkrcjF8jvzopg>
 <xmx:5ofgXhxODb-380ErNpvqA3GMia1xsEgE-ufLSfQHuHD-IGx9eMIq-g>
 <xmx:5ofgXhPWittqnw_hS4KGfzNPR9AmZRMYT_mkjPKVqHdLNhuL2r6eDA>
 <xmx:6IfgXtb07dbhuPUaZGT0ycf4z7BCb4Mi1XJsUSn-H-pxBAeYvxrmDw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3CFF7328005E;
 Wed, 10 Jun 2020 03:12:38 -0400 (EDT)
Date: Wed, 10 Jun 2020 09:12:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
Message-ID: <20200610071233.umk5pfrimluv2sd4@gilmour.lan>
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
 <1742537.tdWV9SEqCh@jernej-laptop>
 <20200415104214.ndkkxfnufkxgu53r@gilmour.lan>
 <1785843.taCxCBeP46@jernej-laptop>
 <20200422092300.444wcaurdwyrorow@gilmour.lan>
 <CAGb2v64++4rxcwdQXgz30vNbRRR5+tXehP-CFu9T7Lx7K_QOOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64++4rxcwdQXgz30vNbRRR5+tXehP-CFu9T7Lx7K_QOOw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1346915709=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1346915709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aika3toolbzzx6k2"
Content-Disposition: inline


--aika3toolbzzx6k2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 01:19:32PM +0800, Chen-Yu Tsai wrote:
> On Wed, Apr 22, 2020 at 5:23 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Wed, Apr 15, 2020 at 07:52:28PM +0200, Jernej =C5=A0krabec wrote:
> > > Dne sreda, 15. april 2020 ob 12:42:14 CEST je Maxime Ripard napisal(a=
):
> > > > On Mon, Apr 13, 2020 at 06:09:08PM +0200, Jernej =C5=A0krabec wrote:
> > > > > Dne ponedeljek, 13. april 2020 ob 16:12:39 CEST je Chen-Yu Tsai
> > > napisal(a):
> > > > > > On Mon, Apr 13, 2020 at 6:11 PM Chen-Yu Tsai <wens@csie.org> wr=
ote:
> > > > > > > On Mon, Apr 13, 2020 at 5:55 PM Jernej Skrabec
> > > > > > > <jernej.skrabec@siol.net>
> > > > >
> > > > > wrote:
> > > > > > > > m divider in DDC clock register is 4 bits wide. Fix that.
> > > > > > > >
> > > > > > > > Fixes: 9c5681011a0c ("drm/sun4i: Add HDMI support")
> > > > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > >
> > > > > > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > > > >
> > > > > > Cc stable?
> > > > >
> > > > > I don't think it's necessary:
> > > > > 1. It doesn't change much (anything?) for me when reading EDID. I=
 don't
> > > > > think it's super important to have precise DDC clock in order to =
properly
> > > > > read EDID. 2. No matter if it has "Cc stable" tag or not, it will=
 be
> > > > > eventually picked for stable due to fixes tag.
> > > > >
> > > > > This was only small observation when I was researching EDID reado=
ut issue
> > > > > on A20 board, but sadly, I wasn't able to figure out why reading =
it
> > > > > sometimes fails. I noticed similar issue on SoCs with DE2 (most
> > > > > prominently on OrangePi PC2 - H5), but there was easy workaround =
- I just
> > > > > disabled video driver in U- Boot. However, if A20 display driver =
gets
> > > > > disabled in U-Boot, it totally breaks video output on my TV when =
Linux
> > > > > boots (no output). I guess there is more fundamental problem with=
 clocks
> > > > > than just field size. I think we should add more constraints in c=
lock
> > > > > driver, like preset some clock parents and not allow to change pa=
rents
> > > > > when setting rate, but carefully, so simplefb doesn't break. Such
> > > > > constraints should also solve problems with dual head setups.
> > > > I disagree here. Doing all sorts of special case just doesn't scale,
> > > > and we'll never have the special cases sorted out on all the boards
> > > > (and it's a nightmare to maintain).
> > > >
> > > > Especially since it's basically putting a blanket over the actual
> > > > issue and looking the other way. If there's something wrong with how
> > > > we deal with (re)parenting, we should fix that. It impacts more than
> > > > just DRM, and all the SoCs.
> > >
> > > I agree with you that automatic solution would be best, but I just do=
n't see
> > > it how it would be done.
> >
> > > Dual head display pipeline is pretty complex for clock driver to get =
it right
> > > on it's own. There are different possible setups and some of them are=
 hot
> > > pluggable, like HDMI.
> >
> > Do you have an actual scenario that is broken right now?
> >
> > > And there are also SoC specific quirks, like A64, where for some reas=
on, MIPI
> > > DPHY and HDMI PHY share same clock parent - PLL_VIDEO0. Technically, =
MIPI DPHY
> > > can be clocked from PLL_PERIPH0 (fixed to 600 MHz), but that's not re=
ally
> > > helpful. I'm not even sure if there is any good solution to this - ce=
rtainly
> > > HDMI and MIPI can't claim exclusivity and somehow best common rate mu=
st be
> > > found for PLL_VIDEO0, if that's even possible.
> >
> > IIRC the DSI DPHY needs a clock running at 297MHz, which is pretty much=
 what the
> > HDMI PHY should need too (or 148.5, but that's pretty easy to generate =
=66rom
> > 297). So which problem do we have there?
> >
> > > I was sure that HDMI PHY on A64 can be clocked from PLL_VIDEO1, which=
 would
> > > solve main issue, but to date, I didn't find any way to do that.
> > >
> > > That's pretty off topic, so I hope original patch can be merged as-is.
> >
> > It does, sorry
> >
> > Acked-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Looks like this hasn't landed yet.

I just applied it.

Maxime

--aika3toolbzzx6k2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXuCH4QAKCRDj7w1vZxhR
xReXAP9d6b29GcEjh727p/kA9oAycPXHl/4zoa+y+ez+lswzmwD+NB0Yb6YdZty0
p+ceaQdycWA9uZfPAwFAra/NTM/IwQI=
=63/4
-----END PGP SIGNATURE-----

--aika3toolbzzx6k2--

--===============1346915709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1346915709==--
