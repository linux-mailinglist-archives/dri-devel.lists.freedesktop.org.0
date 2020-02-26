Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF075171230
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8C36EC28;
	Thu, 27 Feb 2020 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC625892A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:01:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E5E7F7746;
 Wed, 26 Feb 2020 10:01:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 26 Feb 2020 10:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=m4ZpJCtrl25F20H9lycsmonkXKn
 Jty8aZIaI2aucoXo=; b=NHQUGGrGqrSiaLq/B3LSPoXUq7TyK3kgtOCNCbwJaic
 ff/ZVnr1KBpyJjCDa6lo5pY65Do6ImobrA5nRll4VL6S/gKrCXbe4bJ6pSUs+tbQ
 WZ8+o4YZmPIy3KRrrPwFUfhxlWfFaKb6Izr6tzVptFC2NQRMoihev3JNYBgBr1Aw
 C+0UncHqPGzQCvzucF1TBh7YvPIdLgktLYPRwin3KUiLldd7288E/h1GiZeYeTvp
 aa90uGEE7fnWGNCpzM+7UsUBjGjTW5+eVJCAueKWx+b9Hlo0TzvNKKlwBzr9p7ZX
 tgGIuecRtEJCw6UWrxhewX2+Z7wMA68XJ2HcyXLTE9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=m4ZpJC
 trl25F20H9lycsmonkXKnJty8aZIaI2aucoXo=; b=yN/wgmfgqzHVfkRAgnt7mN
 9bv7hYhbQvIKN4VeC0lR25sLTJnEX2UmTIzNoCizdbDNdnH0QUCInqknkcxzTX7Q
 1hc0YxoETaSb1BeOeAchdMOAJD1UWdXfv1XKpjaF6LuhdRdlixFUPOtV1pCWKrGB
 75wpNDteNQnr2+OFo7LnvW+YlPnI96UU0XI/WlC4NMchZzjhL9msFVkJ8mqslBrp
 gxtzpLAkesMNTzyPNxaNXXqxLFZwp5TXHUNjUOF/hSHnGrEl5qmgCEtK1piSSoYL
 T6SMsZdUb3YwaU+ZZu9awCLbVA51DwUX1IMqp4ZmQiIeGXi5VjmXHczkKk+gHwYw
 ==
X-ME-Sender: <xms:O4hWXndkZMl0CN8fol2QE7iNHeKGeOSaZS7Wdw7-phP30V1Md3wyyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeggdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O4hWXsXrQIqwLxgLNO7swUQiX3AFe2o1oNBI0vCWbMc_88DGfTN-ng>
 <xmx:O4hWXlhzkVukrOGgXr-9WChP9MImXftoehjQGcDmak5gLs9jIqpo-A>
 <xmx:O4hWXog_s-mSw3G0altL6wpqbyjqzk_lJsNkGfatS5TAJ2UskmjPaQ>
 <xmx:PIhWXolBMob80y5aQ8iRvlB8OmEJYi-t-n2Wdv9lVpyjX7s_9kYCXw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 783FC328005E;
 Wed, 26 Feb 2020 10:01:15 -0500 (EST)
Date: Wed, 26 Feb 2020 16:01:13 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 07/89] clk: bcm: rpi: Allow the driver to be probed by DT
Message-ID: <20200226150113.oqymkr6h2cxs2uia@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <c358081207dcf4f320a6b7e2932f0d5365bf3242.1582533919.git-series.maxime@cerno.tech>
 <71cd7b35af81ee91c3b4dc5e7c05760ecd590c5d.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <71cd7b35af81ee91c3b4dc5e7c05760ecd590c5d.camel@suse.de>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0262278342=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0262278342==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2aqopof2crla2kds"
Content-Disposition: inline


--2aqopof2crla2kds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicolas,

On Tue, Feb 25, 2020 at 05:00:56PM +0100, Nicolas Saenz Julienne wrote:
> On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> > The current firmware clock driver for the RaspberryPi can only be probed by
> > manually registering an associated platform_device.
> >
> > While this works fine for cpufreq where the device gets attached a clkdev
> > lookup, it would be tedious to maintain a table of all the devices using
> > one of the clocks exposed by the firmware.
> >
> > Since the DT on the other hand is the perfect place to store those
> > associations, make the firmware clocks driver probe-able through the device
> > tree so that we can represent it as a node.
>
> I'm not convinced this is the right approach, and if we decide to go this way,
> there are more changes to take into account.

This was actually a shameless bait to start that discussion, so I'm
glad it worked ;)

> For one, if we create a dt node for this driver, we'd have to delete the
> platform device creation in firmware/raspberrypi.c and then we'd be even able
> to bypass raspberrypi-cpufreq altogether by creating opp tables in dt. But
> there are reasons we didn't go that way at the time.

Right, I missed that one since the check for the firmware phandle was
preventing the double-probe to happen, but it's bad indeed.

> We've made an effort to avoid using dt for firmware interfaces whenever
> possible as, on one hand, it's arguable they don't fit device-tree's hardware
> description paradigm and, on the other, the lack of flexibility they impose
> once the binding is defined. VC4's firmware interfaces are not set in stone,
> nor standardized like SCMI, so the more flexible we are to future changes the
> better.

The device tree isn't just about the hardware though, but also
contains the state the bootloader / firmware left the hardware
in. You're mentionning SCMI, and SCMI clocks IDs are stored in the
device tree. Just like pen release addresses, PSCI function ids, etc.

The firmware IDs of these clocks shouldn't change too.

But you also raise a valid point with the lack of flexibility,
especially since the clock tree isn't that well understood.

> Another thing I'm not all that happy about it's how dynamic clock registering
> is handled in patch #22 (but I'll keep it here as relevant to the discussion):
>
> - Some of those fw managed clocks you're creating have their mmio counterpart
>   being registered by clk-bcm238. IMO either register one or the other, giving
>   precedence to the mmio counterpart. Note that for pllb, we deleted the
>   relevant code from clk-bcm2385.

Indeed, and it's really that part of the discussion I wanted to
start. For some reason, it looks like a good chunk of those clocks are
non-functional at the moment (they all report 0). If we're going to
use the firmware clocks as I did here, we'd have to modify most of the
device clocks used so far (UART, especially) to derive from the core
clock.

I wasn't really sure of the implications though, since it's my first
experience with the RPi clock tree.

> - The same way we were able to map the fw CPU clock into the clk tree
>   (pllb/pllb_arm) there are no reasons we shouldn't be able to do the same for
>   the VPU clocks. It's way nicer and less opaque to users (this being a
>   learning platform adds to the argument).

This would make the Linux clock tree match the one in hardware, which
would indeed be more readable to a beginner, but I see three main
drawbacks with this:

  - The parent / child relationship is already encoded in the firmware
    discovery mechanism. It's not used yet by the driver, because the
    firmware reports all of them as root clocks, but that's pretty
    easy to fix.

  - It would make the code far more complicated and confusing than it
    could, especially to beginners. And as far as I know, only the RPi
    is doing that, while pretty much all the other platforms either
    have the clock tree entirely defined, or rely on the firmware, but
    don't have an hybrid. So they would learn something that cannot
    really be applied to anywhere else.

  - I have no idea what the clock tree is supposed to look like :)

> - On top of that, having a special case for the CPU clock registration is
>   nasty. Lets settle for one solution and make everyone follow it.

It seemed to me that the CPU clock had a factor between the actual CPU
frequency and its clock? If not, then yeah we should definitely get
rid of it.

> - I don't see what's so bad about creating clock lookups. IIUC there are only
>   two clocks that need this special handling CPU & HDMI, It's manageable. You
>   don't even have to mess with the consumer driver, if there was ever to be a
>   dt provided mmio option to this clock.

V3D needs one too, and I might have missed a bunch of them in that
series given how the current debugging of the remaining issues turn
out to be. And clk_lookups are local to devices, so you need to factor
that by the number of devices you have.

Sure, it works, but it feels to me like that's going to be an issue
pretty fast, especially with the lookups on the way out?

> >  drivers/clk/bcm/clk-raspberrypi.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-
> > raspberrypi.c
> > index 1654fd0eedc9..94870234824c 100644
> > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > @@ -255,15 +255,13 @@ static int raspberrypi_clk_probe(struct platform_device
> > *pdev)
> >  	struct raspberrypi_clk *rpi;
> >  	int ret;
> >
> > -	firmware_node = of_find_compatible_node(NULL, NULL,
> > -					"raspberrypi,bcm2835-firmware");
> > +	firmware_node = of_parse_phandle(dev->of_node, "raspberrypi,firmware",
> > 0);
>
> There is no such phandle in the upstream device tree. Maybe this was aimed at
> the downstream dt?

raspberrypi,firmware is the property, it points to the /soc/firmware
node that is defined in bcm2835-rpi.dtsi

Maxime

--2aqopof2crla2kds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXlaIOQAKCRDj7w1vZxhR
xX95AQCghtDEdUEbVo09vi66HyIp5yffz/4j3kyxQivGa8e3BgD6A1NLZNaMBGxh
nnzEWO2Fktf4+XGMXJjIgBajc+epxQ8=
=+dyv
-----END PGP SIGNATURE-----

--2aqopof2crla2kds--

--===============0262278342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0262278342==--
