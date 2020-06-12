Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E66E1F8297
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318086E3D6;
	Sat, 13 Jun 2020 10:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278856E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 15:36:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 938105C01A5;
 Fri, 12 Jun 2020 11:36:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 12 Jun 2020 11:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=i46wPfrcUIR0bEAZlAykfvGtcc2
 1AKB8ziEcZQaaqkw=; b=BnwR7wP2lY41wkLEtaL3I1g01xCASKpwAAI7z2XF24F
 rNBvnzNRsYm2jdjA32TOQelLkZd9bPZ2PHiC5tU/o4VqgpnjIytRWO1aKF4gK2y8
 UZuY9GiJEfq041OS0ipEUk8lRFc8yNBEPbwRY/SNZlWvxPtCY38pcojsDRiX1Bio
 uiNxXDU0e5KPmslLxHvGhKr6mAuqCNm/JR0gGm8PHzV3IDMHKrs1xNJYppql9XRw
 NlpZ/zNQhojPrcwRsWkuaKbpHw2sXnZ1PIBCnIEgqz1RAIly95UXujl5xPquwj26
 unquYGFtTijdtxd/vw/sOU81LST4Cl190fxQVyxrSbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=i46wPf
 rcUIR0bEAZlAykfvGtcc21AKB8ziEcZQaaqkw=; b=X5b6o91SO/aDmqT6iWePhe
 lDkgjaJJ59dVQoB8qP/jnAvNqt4nMhengMrO1EPhIDRmaMRDz28TslaqLtbvJyKL
 bD02iLd6HyakJTRgqTQJIn2yVeXWGgg/8vOlqgP4oXL/Em4oRT4E4p6LZ2DUrEQP
 I6b8+fvFWqEIgTuf3nMgUOujxY8RsRSAGNdwvQYTtj6mdNuDoyYzwGpQmnTLGehY
 n0f4O4EMaVgFOql3ddH4OWcJj5a1X1q0N+OfSMx7o3orjB+UijQqLAF0gl+Fabkd
 P1ttHEs3RJFFqgdkkY8mX51LkXJSmviMOOmm8XZaBKXBi2TWJbnEczTgwGsQk3kQ
 ==
X-ME-Sender: <xms:4KDjXgEg8GE_QHnW5MKlqja3GyOfCe6e_8Bj77QSByNcAeZzVBhgSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeiuddgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4KDjXpWi4BZThfNVw3Rs8D334SYqOA4xl4d-LVhhW44eH2YMNT4SPg>
 <xmx:4KDjXqJvc54evPMOFJFdT7NaOmc0h7U4-1RFN73w6WgXtKEo7Dss_w>
 <xmx:4KDjXiGArdcVByWkVn_aveCfrcZ33-GZihId-VHUAbG6ZeTOT7b5sQ>
 <xmx:4KDjXoKHGUr-bt_Qs5S2k8v2ixtTNUqdfGgeFB9v9ItkIvAPvv5iiw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C39BA30614FA;
 Fri, 12 Jun 2020 11:35:59 -0400 (EDT)
Date: Fri, 12 Jun 2020 17:35:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 032/105] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
Message-ID: <20200612153558.3ekadlu3e2qctvf6@gilmour.lan>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <d2c1850e38e14f3def4c0307240e6826e296c14b.1590594512.git-series.maxime@cerno.tech>
 <CADaigPU7c=1u47R9GzvGCH_Z2fywY1foGYEy=KbBikjUQpwUFg@mail.gmail.com>
 <20200602141228.7zbkob7bw3owajsq@gilmour>
 <CAPY8ntDZWJeu14mL5a0jqUWHFOEWm2OOBBkh4yjjP0oLU83UCQ@mail.gmail.com>
 <CADaigPUHPhdrt9JkTfaw0iT7Z8z3Si-v2VJ-s+dhnFQaDNkAaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPUHPhdrt9JkTfaw0iT7Z8z3Si-v2VJ-s+dhnFQaDNkAaA@mail.gmail.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1133258546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1133258546==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjenvng7r4phiuyn"
Content-Disposition: inline


--kjenvng7r4phiuyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Tue, Jun 02, 2020 at 12:31:37PM -0700, Eric Anholt wrote:
> On Tue, Jun 2, 2020 at 8:02 AM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Maxime and Eric
> >
> > On Tue, 2 Jun 2020 at 15:12, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Eric
> > >
> > > On Wed, May 27, 2020 at 09:54:44AM -0700, Eric Anholt wrote:
> > > > On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > >
> > > > > The VIDEN bit in the pixelvalve currently being used to enable or=
 disable
> > > > > the pixelvalve seems to not be enough in some situations, which w=
hill end
> > > > > up with the pixelvalve stalling.
> > > > >
> > > > > In such a case, even re-enabling VIDEN doesn't bring it back and =
we need to
> > > > > clear the FIFO. This can only be done if the pixelvalve is disabl=
ed though.
> > > > >
> > > > > In order to overcome this, we can configure the pixelvalve during
> > > > > mode_set_no_fb, but only enable it in atomic_enable and flush the=
 FIFO
> > > > > there, and in atomic_disable disable the pixelvalve again.
> > > >
> > > > What displays has this been tested with?  Getting this sequencing
> > > > right is so painful, and things like DSI are tricky to get to light
> > > > up.
> > >
> > > That FIFO is between the HVS and the HDMI PVs, so this was obviously
> > > tested against that. Dave also tested the DSI output IIRC, so we shou=
ld
> > > be covered here.
> >
> > DSI wasn't working on the first patch set that Maxime sent - I haven't
> > tested this one as yet but will do so.
> > DPI was working early on to both an Adafruit 800x480 DPI panel, and
> > via a VGA666 as VGA.
> > HDMI is obviously working.
> > VEC is being ignored now. The clock structure is more restricted than
> > earlier chips, so to get the required clocks for the VEC without using
> > fractional divides it compromises the clock that other parts of the
> > system can run at (IIRC including the ARM). That's why the VEC has to
> > be explicitly enabled for the firmware to enable it as the only
> > output. It's annoying, but that's just a restriction of the chip.
>=20
> I'm more concerned with "make sure we don't regress pre-pi4 with this
> series" than "pi4 displays all work from the beginning"

I tested the DSI today on an RPI3, and I had to fix an issue with the
HVS-PV muxing, but otherwise it works with this series. Otherwise, the
HDMI and TXP work on the Pi3 too, I'll give a try to the VGA adapter on
it next week to test DPI too.

As a side note, my DSI display without my patches gives DSI transfer
timeouts at boot, since at least (mainline) 5.4, I haven't tested
further back. It just stalls the modeset for a while, but the display
works fine after that.

Does that ring any bell?

Maxime

--kjenvng7r4phiuyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXuOg3gAKCRDj7w1vZxhR
xRIVAQCQ9i9hYXPvUtEka4284eq9v67Twhyjfiex//nc2r4PIAD7BvQEVc4JW4id
g0nVDJpdj1tkhinSfTe+fu1vNaG1fgU=
=qQpW
-----END PGP SIGNATURE-----

--kjenvng7r4phiuyn--

--===============1133258546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1133258546==--
