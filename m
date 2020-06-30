Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9592104A5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994116E827;
	Wed,  1 Jul 2020 07:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256DD6E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:27:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 348B8678;
 Tue, 30 Jun 2020 09:27:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Jun 2020 09:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=uvRgMjk2yargVvh0AOFcImSoMFMcfhqQLURB9/KG71Q=; b=hFKpn3f0
 CtDeanlC2fRPEUkQ2QkL6gk5hQmPz5PJxTtA44r8go/oQECExrZYyl1BK3OR54Gs
 UaVRvQezWyeQOYhqUmCAmpg5kGszgMNumJBVbl6CqGOL3c9iCDe+C+9FZJrZumAY
 XRp827h0qntV0WBDrkNtOX8Tj7FlliCISWxzmUzNnVqdjZohUorivaRtBXvB+Qyt
 OEvux/XObk/CY2i/yXJoWAy608WwspHTusoAvpwV1fn0GIyVuK4lnAiBr5BwG0LQ
 x7ia09EhVRHqCp8X65/4c35ZmRQSAVxP29LNemkq8RAX/d9bMHkfJhxjH9RWRT3O
 EvXVTNp205V5gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=uvRgMjk2yargVvh0AOFcImSoMFMcf
 hqQLURB9/KG71Q=; b=mC+rJlK9eKep+prHXcNQEaWavXEIzu4dbTU/AvdQr+Goz
 a8m77uiv8ukChpVvz7hta7+LbZjyBakGb3RPQCQPJ4IiNai2QKInc2pZRWeEeFDE
 TP+3UQkJoxgwZ79UOuXIPTtJmYv99yOKA62wtavLWYLE3u/LGMUCEr+tWIQjSuP1
 Cys2Nvkboj03/D+1wEAV66aGXWq1yf0eUvG2YMjjw4hI0wpqZ2jPhTj+RdMTmJy9
 YNpWI31X1lSGXRv1h6mHIMx68jPmNBnRmnkbJn63iWB3XqvKc9WfMULw8fDom1CG
 iBxG2LDuirPq3Udb/Rclcl8ZgeLCxv5qAsRFk5Xxw==
X-ME-Sender: <xms:sT37XhyY4drcW3Y1tDVjaynQ61DbqVqXX9DIGJEbiLeDCYXu0vxdhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtddtgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpefgvdeutddvvedvvddvtdehvedvleeghfeghfeluedvhfehudfhheffuefhjeffgeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeine
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sT37XhQIfarxNIsNODOG1wGUiDxRhb0abaFZcl4zfUMOrji3c2TBLw>
 <xmx:sT37XrXATq74tz36ZldCbQACMSymHwRQsarqhLtmvXnHTcEnCnK8fw>
 <xmx:sT37XjgXatqVcxKx4B4dK68zRhQn9l96PJcMBvKpNQXVqcNsu68J0A>
 <xmx:tD37Xl08lW7PhC3I2ciCsCSp1D7hBKLOt4JFxudElixbUQRUZKZMrQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F15F3280065;
 Tue, 30 Jun 2020 09:27:13 -0400 (EDT)
Date: Tue, 30 Jun 2020 15:27:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: DSI probe/bind ordering in vc4
Message-ID: <20200630132711.ezywhvoiuv3swo57@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1576747307=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1576747307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3jkvttpgjuo4erak"
Content-Disposition: inline


--3jkvttpgjuo4erak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've tried to bring-up the DSI controller on the RaspberryPi4, and I've
just encountered something that could make it troublesome to support.

For context, the RaspberryPi has an official panel that uses a DSI->DPI
bridge, a DPI panel, a touchscreen and a small micro-controller. That
microcontroller controls the power management on the screen, so
communicating with it is very much needed, and it's done through an i2c
bus.

To reflect that, the entire panel has been described in the Device Tree
as an I2C device (since that's how you would control it), together with
an OF-Graph endpoint linking that i2c device to the DSI controller[1].

That deviates a bit from the generic DSI binding though[2], since it
requires that the panel should be a subnode of the DSI controller (which
also makes sense since DCS commands is usually how you would control
that device).

This is where the trouble begins. Since the two devices are on entirely
different buses, there's basically no guarantee on the probe order. The
driver has tried to address this by using the OF-Graph and the component
framework. Indeed, the DSI driver (component-based) will register a
MIPI-DSI host in its probe, and call component_add[3]. If component_add
fails, it will remove the DSI host and return the error code. It makes
sense.

The panel on the other hand will probe, and look for a DSI host through
the OF-Graph [4]. If it isn't there, it will return EPROBE_DEFER, hoping
that it will be available at some point. It also makes complete sense.

Where the issue lies is that component_add has two very different
behaviours here that will create the bug that we see on the RPi4:

  - If there's still components to probe, component_add will simply
    return 0 [5][6]

  - And if we're the last component to probe, component_add will then
    run all the bind callbacks and return the result on error of the
    master bind callback[7]. That master bind will usually have
    component_bind_all that will return the result of the bind callback
    of each component.

Now, on the RPi4, the last component to probe is the DSI controller
since it relies on a power-domain exposed by the firmware driver, so the
driver core will defer its probe function until the power-domain is
there [8]. We're thus pretty much guaranteed to fall in the second case
above and run through all the bind callbacks. The DSI bind callback
however will try to find and attach its panel, and return EPROBE_DEFER
if it doesn't find it[9]. That error will then be propagated to the
return code of component_bind_all, then to the master bind callback, and
finally will be the return code of component_add.

And since component_add is failing, we remove the DSI host. Since the
DSI host isn't there, on the next occasion the i2c panel driver will not
probe either, and we enter a loop that cannot really be broken, since
one depends on the other.

This was working on the RPi3 because the DSI is not the last driver to
probe: indeed the v3d is depending on the same power domain[10][11] and
is further down the list of components to add in the driver [12], so
we're always in the first component_add case for DSI above, the DSI host
sticks around, and the i2c driver can probe.

I'm not entirely sure how we can fix that though. I guess the real flaw
here is the assumption that component_add will not fail if one of the
bind fails, which isn't true, but we can't really ignore those errors
either since it might be something else than DSI that returns that
error.

One way to work around it is to make the mailbox, firmware and power
domain drivers probe earlier by tweaking the initcalls at which they
register, but it's not really fixing anything and compiling them as
module would make it broken again.

Maxime

1: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
2: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/dsi-controller.yaml
3: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1661
4: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c#n397
5: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/component.c#n685
6: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/component.c#n241
7: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/component.c#n255
8: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c#n742
9: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1574
10: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2835-rpi-common.dtsi
11: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2835-rpi.dtsi#n79
12: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_drv.c#n337

--3jkvttpgjuo4erak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXvs9rwAKCRDj7w1vZxhR
xQSOAQCyTyJVD46aW4S99CgmGteTsLtcJmXTx1QvGYfiWsDwLwEApaZrlzznvFwm
NkC3QK4uM8T6YGAvJRiFLcHS1gOEoAM=
=kC9j
-----END PGP SIGNATURE-----

--3jkvttpgjuo4erak--

--===============1576747307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1576747307==--
