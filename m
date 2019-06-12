Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBA43675
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E57E89A0E;
	Thu, 13 Jun 2019 13:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453BC89A0E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:26:04 +0000 (UTC)
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B10E040003;
 Thu, 13 Jun 2019 13:25:51 +0000 (UTC)
Date: Wed, 12 Jun 2019 17:34:23 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190612153423.jjcxsturjip3pn56@flea>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de>
 <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
 <20190607094030.GA12373@lst.de>
MIME-Version: 1.0
In-Reply-To: <20190607094030.GA12373@lst.de>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1114226112=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1114226112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4e2w5m2mlsciqb7"
Content-Disposition: inline


--l4e2w5m2mlsciqb7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2019 at 11:40:30AM +0200, Torsten Duwe wrote:
> On Fri, Jun 07, 2019 at 08:28:02AM +0200, Maxime Ripard wrote:
> > On Thu, Jun 06, 2019 at 03:59:27PM +0200, Harald Geyer wrote:
> > >
> > > If think valid compatible properties would be:
> > > compatible = "innolux,n116bge", "simple-panel";
> > > compatible = "edp-connector", "simple-panel";
> >
> > A connector isn't a panel.
> >
> > > compatible = "innolux,n116bge", "edp-connector", "simple-panel";
> >
> > And the innolux,n116bge is certainly not a connector either.
> >
> > > compatible = "edp-connector", "innolux,n116bge", "simple-panel";
> > >
> > > I can't make up my mind which one I prefere. However neither of these
> > > variants requires actually implmenting an edp-connector driver.
> >
> > No-one asked to do an edp-connector driver. You should use it in your
> > DT, but if you want to have some code in your driver that parses the
> > DT directly, I'm totally fine with that.
>
> I must admit I fail to understand what that extra node would be good for.
> Logically, the eDP far side is connected to the well-known n116bge.
> Inside the laptop case it might as well be a flat ribbon cable or
> soldered directly.
> In good intention, that's all I wanted to express in the DT. I don't
> know whether the relevant mechanical dimensions of the panel and the
> connector are standardised, so whether one could in theory assemble it
> with a different panel than the one it came with.

Because the panel that comes with the Teres-I is always the
same. However, that's not true for all the devices out there using the
bridge, starting with the pinebook.

> OTOH, as I checked during the discussion with anarsoul, the panel's
> supply voltage is permanently connected to the main 3.3V rail.

Again, that may be the case on the Teres-I, but not necessarily on
other boards.

> We already agreed that the eDP output port must not neccessarily be
> specified, this setup is a good example why: because the panel is
> always powered, the anx6345 can always pull valid EDID data from it
> so at this stage there's no need for any OS driver to reach beyond
> the bridge. IIRC even the backlight got switched off for the blank
> screen without.

That's not really the outcome of the discussion we had here though:
https://patchwork.freedesktop.org/patch/305035/

> All I wanted to say is that "there's usually an n116bge behind it";
> but this is mostly redundant.
>
> So, shall we just drop the output port specification (along with the
> panel node) in order to get one step further?

Depending on the outcome of the discussion above, yes or no :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--l4e2w5m2mlsciqb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQEbfwAKCRDj7w1vZxhR
xXboAP9taP8cVAug0AmgG1n+5b7orZtPN+yeWqkQV/4rx6fcdgD3Tma8ZrLudyMc
SNeQDRS8FMpPCWr42VcLCNdIMRk6CA==
=j/Ze
-----END PGP SIGNATURE-----

--l4e2w5m2mlsciqb7--

--===============1114226112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1114226112==--
