Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4532B5FD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 09:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3B789E43;
	Wed,  3 Mar 2021 08:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6650989E43
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 08:45:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 983A25805E2;
 Wed,  3 Mar 2021 03:45:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 03 Mar 2021 03:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=g2WN8dh9S6beHjsSfHM2t9eCL2x
 4c0kK7t6liU13tYM=; b=eJs4935jICw/rcWK+7HalLsR4zOfpHiucCbNB2QOj/f
 uA/oipkrR1a+uBm2tqcvXMHfbEECQhnXRo3gwcLLNLdnlLPTZAmr3g6amSfOKUy4
 xIDmyxOlo4XelIJYsCdb5i01gsV0QC15FPoPctfxdvHI2KHs8QBDVnYgOyVNknFn
 arUzvz/y6UA3gXk6SASobQhfwAAOMtwehkX+a+kVlqYVmpNPmxa1CeJEz6fpx9Ay
 xjRngQN3JmL9nXzl0jMEKCr+nG9kvzP3sYgpnh5/TZ+Fp+YZfQ+1ik54m6j+9DiU
 mS3Rh6c/VcCkrmtTtYRXCwBN8wX6D8pF7BVS1Sf1ZAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=g2WN8d
 h9S6beHjsSfHM2t9eCL2x4c0kK7t6liU13tYM=; b=Y7vOGwgxXZ5RcMxAKp0Wx9
 PIfUqcWVyAZu7i0Gbali2dQJzzpZfVITW4ffqpyRHIrS6ditpr4NpPifdqpWNrRq
 525oQ29ZDAncM9rGFuHxL/dvkzi9/kIruSrl3RZoFov8Gpv/x2PkCnku5EwsHSaM
 W1wCsovs5om4Rn8PYPFbL/Fg/j930em6R+Qn63i/tEvdIPxttyEmDlwdit1wO699
 jURhBeNkrM+cdpvD/LZrnD7UzZ1OUxkLN7nN9Rid+z5r0+6n2mmtzRYWtiqf3exq
 gnTRl0UdHN+EkFgxpzOX9S49ynEoZx5QnbRn3gZTQjwMdeXmz1XEo1kTg1vOL7aw
 ==
X-ME-Sender: <xms:qkw_YGyhckhaMB7y0oyD5OMHA_Z9NamONJOy0AOK0gW7E48FIfOYaw>
 <xme:qkw_YEQuiMlZP7eMdVvHbkx6R4vdbgWSpdvTEoCJ7g6ivuFugGd4PHemk2R-UbLCW
 K8a0swHRMttqFO0UIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtuddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qkw_YBtMsi-0DaaAElAA4t7HGRV7Jvur5O-OI2jQfisKx8JfV1sLRw>
 <xmx:qkw_YOueU7PVyv3bRF5Z_jOcPG-bGGGfNAQlDbaNsmFEt-RsSwzghw>
 <xmx:qkw_YPy4sIeMeFbg6lzobTOtrkA3Uubr7ZjbwU_aIIRb27A5tWBjUQ>
 <xmx:rUw_YApjbEVu4SVmyZq6wglhpApObVBZHIatXnUCFh6nt9O80mlLZw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04D9124005C;
 Wed,  3 Mar 2021 03:45:29 -0500 (EST)
Date: Wed, 3 Mar 2021 09:45:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/8] clk: Add range accessors
Message-ID: <20210303084527.rziaoiqsr7r4bhcv@gilmour>
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-2-maxime@cerno.tech>
 <161472713858.1478170.9594904338107431350@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <161472713858.1478170.9594904338107431350@swboyd.mtv.corp.google.com>
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
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0468085749=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0468085749==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nriz3ja25tqexae2"
Content-Disposition: inline


--nriz3ja25tqexae2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Mar 02, 2021 at 03:18:58PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2021-02-25 07:59:02)
> > Some devices might need to access the current available range of a clock
> > to discover their capabilities. Let's add those accessors.
>=20
> This needs more than two sentences to describe what's required.
>=20
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
> >  include/linux/clk.h | 16 ++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 8c1d04db990d..b7307d4f090d 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2407,6 +2407,36 @@ int clk_set_max_rate(struct clk *clk, unsigned l=
ong rate)
> >  }
> >  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> > =20
> > +long clk_get_min_rate(struct clk *clk)
>=20
> I need to read the rest of the patches but I don't see the justification
> for this sort of API vs. having the consumer constrain the clk frequency
> that it wants. Is the code that's setting the min/max constraints not
> the same as the code that's calling this API? Would an OPP table better
> serve this so the device knows what frequencies are valid?s Please
> provide the use case/justification in the commit text.

The patch that uses it is the patch 4

The issue I'm trying to solve is that all the RaspberryPi have a
configuration file for the firmware, and the firmware is in charge of
the clocks communicating through a mailbox interface.

By default, one of the main clocks in the system can only reach 500MHz,
and that's the range reported by the firmware when queried. However, in
order to support display modes with a fairly high bandwidth such as 4k
at 60Hz, that clock needs to be raised to at least 550MHz, and the
firmware configuration has a special parameter for that one. Setting
that parameter will increase the range of the clock to have proper
boundaries for that display mode.

If a user doesn't enable it and tries to use those display modes, the
display will be completely blank.

There's no way to query the firmware configuration directly, so we can
instead query the range of the clock and see if the firmware enables us
to use those modes, warn the user and ignore the modes that wouldn't
work. That's what those accessors are here for

> Why two functions instead of one function to get both min and max?

Since we have clk_set_min_rate and clk_set_max_rate, it made sense to me
to mirror that, but I'd be happy to change if you think otherwise

I'll address your other commenst

Maxime

--nriz3ja25tqexae2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYD9MpwAKCRDj7w1vZxhR
xXFkAQC+xeNLEteW4viT0I9EgT4GDnxl6LNXLtMjY6QR4lk6OQD/WOWVAnP4FkZy
khC5H7aQZrwFRz+De7C2IE6KukldgAQ=
=2EUg
-----END PGP SIGNATURE-----

--nriz3ja25tqexae2--

--===============0468085749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0468085749==--
