Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3B461138
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 10:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C266E221;
	Mon, 29 Nov 2021 09:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDA6E221
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 09:39:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4425B320090C;
 Mon, 29 Nov 2021 04:39:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 29 Nov 2021 04:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZVe3zv6UjeXTO4kI5ekvbwjSUuS
 cZzV/LGwknVJuSo0=; b=Pds3adz1oVXE53sq4XjyUyu6lzUi/f448XazotAUmYh
 K869KeuEaVKUO0zOzIQOZcOw9dJfTp0zbwSA7G1hfToUjgRnMPqQsoMZJqJcQCd1
 0pNQYbr0us4vS472e6+Z3vvpZ4txGq2ojRkchd7UQpJkiz4pVXMsZSOGK+KAL+px
 QSbQJIPtANuxrMrneXU4FxU2qRodnCemRz7VYK5TYDN0vVUoGGHtMDGPIVS6dWuy
 XIfZVAjg0P84FEkTgisaWRrAGRrLeRlWgmVuseG4PjUht9jBSF585Bc7kO9ImrU0
 GVDraCWPjky2v/kJZknLPgXMeH2idYxvjfxJO0gKS4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZVe3zv
 6UjeXTO4kI5ekvbwjSUuScZzV/LGwknVJuSo0=; b=SLWdi2ti1LrHE2t5yr0zRe
 WItwLzeLlNSX+XTdwonPISbPF9AsTSExUglBdqZJNgfc5z1OB8ATCL84ww33sW2i
 OK0q9Zwd71Vrgg9JCVTchkmBNycHjFqJEgTH0kI5ST4Di0LzHuekXZuRFdkzFtNX
 ZjLRd8EijmrRqYEv12DBAneinA6PyqzEVk/kzKVT9pbVwyxxU5A5XxD5Sjx5yhG/
 a0IQp6HSrYkNjFuBnRohs1tRG+LgW0wZS5bUOEfPRhzNBD3FtrbDqIGumxoepfkg
 EbgLCPYLunhy37qeMb9IKF/BGmCw+g7+fVzHRK/KQsWQHD0iCVI0YVMsVtoeyyfA
 ==
X-ME-Sender: <xms:5J-kYQaBfiks2cDlnqHQPbXtJq3SVe3FTW1VG4b1fNEGO775D4XOEw>
 <xme:5J-kYbZvRsDveG49_f6_a1r0U-ll4xo90G07pnXiJjKfwjO2jSeap3uM_snhiie3E
 rXuuSfD3CWtApqbaGM>
X-ME-Received: <xmr:5J-kYa9sg-1WizFIA16Mk-063FH0jWBivL72hcQ9ZB3s5i-3CtNG40tTZGJE1-TZ7ORiq8EIhB2hbK1saz4-_OXRjxjYYHjE2ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5J-kYars0WzYhb4-Mjh8N5ACricvFItBk9lW76BxjhDWJuuZCjq-SQ>
 <xmx:5J-kYbpE_sTihnUl_gislrCh-z3Eo2CMw_ELmnzZnUYEvOtVlkMd2w>
 <xmx:5J-kYYT7YHqLNMCorD1JlG7XEjrtZa8vhuOMaxKkgrmjZQc1UodnBw>
 <xmx:5J-kYcczRujADtS_XtCzOKmQ8qZXHshagl_QuHlHk1__SAbpQUdzgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 04:39:47 -0500 (EST)
Date: Mon, 29 Nov 2021 10:39:46 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
Message-ID: <20211129093946.xhp22mvdut3m67sc@houat>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mmhz6zluj3pfxhwm"
Content-Disposition: inline
In-Reply-To: <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mmhz6zluj3pfxhwm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 24, 2021 at 04:03:07PM -0600, David Lechner wrote:
> On 11/24/21 9:07 AM, Noralf Tr=F8nnes wrote:
> > This patchset adds a missing piece for decommissioning the
> > staging/fbtft/fb_st7735r.c driver namely a way to configure the
> > controller from Device Tree.
> >=20
> > All fbtft drivers have builtin support for one display panel and all
> > other panels using that controller are configured using the Device Tree
> > 'init' property. This property is supported by all fbtft drivers and
> > provides a generic way to set register values or issue commands
> > (depending on the type of controller).
> >=20
> > It is common for these types of displays to have a datasheet listing the
> > necessary controller settings/commands or some example code doing the
> > same.
> >=20
> > This is how the panel directly supported by the fb_st7735r staging
> > driver is described using Device Tree with that driver:
> >=20
> >      width =3D <160>;
> >      height =3D <128>;
> >=20
> >      init =3D <0x1000001
> >              0x2000096
> >              0x1000011
> >              0x20000ff
> >              0x10000B1 0x01 0x2C 0x2D
> >              0x10000B4 0x07
> >              0x10000C0 0xA2 0x02 0x84
> >              0x10000C1 0xC5
> >              0x10000C2 0x0A 0x00
> >              0x10000C5 0x0E
> >              0x100003a 0x55
> >              0x1000036 0x60
> >              0x10000E0 0x0F 0x1A 0x0F 0x18 0x2F 0x28 0x20 0x22
> >                        0x1F 0x1B 0x23 0x37 0x00 0x07 0x02 0x10
> >              0x10000E1 0x0F 0x1B 0x0F 0x17 0x33 0x2C 0x29 0x2E
> >                        0x30 0x30 0x39 0x3F 0x00 0x07 0x03 0x10
> >              0x1000029
> >              0x2000064>;
> >=20
> >=20
> > This is how the same panel is described using the st7735r drm driver and
> > this patchset:
> >=20
> >      width =3D <160>;
> >      height =3D <128>;
> >=20
> >      frmctr1 =3D [ 01 2C 2D ];
> >      invctr =3D [ 07 ];
> >      pwctr1 =3D [ A2 02 84 ];
> >      pwctr2 =3D [ C5 ];
> >      pwctr3 =3D [ 0A 00 ];
> >      vmctr1 =3D [ 0E ];
> >      madctl =3D [ 60 ];
> >      gamctrp1 =3D [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
> >      gamctrn1 =3D [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
>=20
> Do these setting correspond to actual physical properties of the display?
>=20
> What is the advantage of this compared to just adding a new compatible
> string if a new display requires different settings? (Other than being
> able to use a new display without compiling a new kernel/module.)
>
> It is nice for the driver implementation to be able to use the byte
> arrays from the binding directly, but it doesn't really make sense from
> a "device tree describes the hardware" point of view.
>=20
> For example, looking at the data sheet, frmctr1 looks like it is actually
> multiple properties, the 1-line period, front porch and back porch.

You're right, but we have two sets of problems that we want to solve,
and so far the discussion has only been to address one while ignoring
the other.

The solution you suggested works great for the problem the kernel is
facing: we want a solution that is easy to maintain over the long run,
while being reliable. Thus, we want to introduce a compatible for each
panel, that will allow us to describe the panel in the DT without
exposing too much data, the data being in the kernel.

This works great over the long run because we can update and fix any
problem we might have had, send them to stable, etc. It's awesome, but
it's mostly centered on us, the developers and maintainers.


The problem that fbtft (and this series) wants to fix is completely
different though: it wants to address the issue the users are facing.
Namely, you get a cheap display from wherever, connect it to your shiny
new SBC and wants to get something on the display.

In this situation, the user probably doesn't have the knowledge to
introduce the compatible in the kernel in the first place. But there's
also some technical barriers there: if they use secure boot, they can't
change the kernel (well, at least the knowledge required is far above
what we can expect from the average user). If the platform doesn't allow
access to the DT, you can't change the DT either.

Let's set aside those constraints for a moment though. For most of these
devices, you wouldn't even be able to come up with a proper compatible.
All of those displays are typically a panel and a controller glued
together, and the exact initialization sequence depends on both. The
panel is never really mentioned, neither is its manufacturer, or its
exact product id. In other words, we wouldn't be able to come up with a
good compatible for them.

Let's now assume we do have access to all those info and can come up
with a good, upstreamable, compatible. We now require the user to
contribute it upstream, and then expect them to wait for 1-2 years for
that patch to show up in their distribution of choice.

And then, if we were to get those patches, chances are we don't really
want them anyway since we would be drowning in those small patches
no-one really wants to review.


So yeah, the solution we have is probably a good solution for "real"
panels, glued to a device (and even then, the recent discussion around
panel-edp shows that it has a few shortcomings). But it's a *terrible*
solution for all parties involved when it comes to those kind of
displays.


I agree that it doesn't really fit in the DT either though. Noralf, what
kind of data do we need to setup a display in fbtft? The init sequence,
and maybe some enable/reset GPIO, plus some timing duration maybe?

There's one similar situation I can think of: wifi chips. Those also
need a few infos from the DT (like what bus it's connected to, enable
GPIO, etc) and a different sequence (firmware), sometimes different from
one board to the other.

Could we have a binding that would be something like:

panel@42 {
	 compatible =3D "panel-spi";
	 model =3D "panel-from-random-place-42";
	 enable-gpios =3D <&...>;
}

And then, the driver would request the init sequence through the
firmware mechanism using a name generated from the model property.

It allows to support multiple devices in a given system, since the
firmware name wouldn't conflict, it makes a decent binding, and users
can adjust the init sequence easily (maybe with a bit of tooling)

Would that work?

Maxime

--mmhz6zluj3pfxhwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaSf4gAKCRDj7w1vZxhR
xUDzAP9EGlPTaekn1uaS4vTMRgFJN8qnFDuwOynuzJzTH7awcgD+MSy/uhv9ZeLI
wz31+R3wJaJVlZw1OT2crqqOE3VKEQU=
=/HKs
-----END PGP SIGNATURE-----

--mmhz6zluj3pfxhwm--
