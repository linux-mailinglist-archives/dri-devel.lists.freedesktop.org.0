Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E7319D65
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 12:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3797B89026;
	Fri, 12 Feb 2021 11:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAA46E5C5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 11:34:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 73733580288;
 Fri, 12 Feb 2021 06:34:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 12 Feb 2021 06:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=SCo77A5HejQko8j3nfqh2hiWDhR
 HJSfStdaCIX7Vu0Q=; b=PEV8SbkKDHZJ/WSbJpBLEeD6nz70KEI9IzOgmeg6XME
 UPA9HBteZwIw6LzmT0KFxstGjE9ihxLWt+cVlXG6idwg9mvwkI4BN1ofnXp5CP4g
 VaYXZ6/MwhRsO05vuDbByrp+sgT5axFGTjgDJPX6LmR4FhCjdQSiktVWcHKrTiiZ
 7Y/6aaIk80d027TqU0VOkhTkE8/Yj6TlyChfM5qankht7AMN7H1kSxM1hJQP5GMr
 j64Y+w94h8ofOzT9ZDGHwgbhCIC9exe9Db33udjWxv/x0dwK6SVP5hzCAHWtCnlz
 +qvk1kChZUkWcmQj0HfRYkQDtpQp7Lp4tWdKkzpd7lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SCo77A
 5HejQko8j3nfqh2hiWDhRHJSfStdaCIX7Vu0Q=; b=tnkx0rO22nxm7nZR+dSJk8
 K8wiUWU0Eb7EmF0po2TfihJOihncjbNSvt1tVVGArODQjTV023U4DCYEKkWVFz9U
 KRkr47fWzSWPUqeNUpRBwsjISYQ7pvNca+Mh1u83lZIEp7cWiO6uXyyCXsEOVcyO
 ZJ/ZXCz4x+wvz3yEpri6QIOpR8R5ks162hCgCxdxXTDizMFcu84FNUHDbodP0poC
 Zrg8J1VmfvzW+9bh7hEGtO7P2iogkgjffH47LJ2ZUUD1LCC14naXz+zk9Efdku2g
 VyAQJKYxr4e3r3FlLQ+WtJGrgaQPjAib9zPCGYPKkdycNmvGW0GWNjV8PJMUOEfQ
 ==
X-ME-Sender: <xms:rGcmYHFHbOoCS4DzSjPRx1-Zc58QzL2WVg6NZifUx5h6J3dQDvmt7w>
 <xme:rGcmYNpgY9ZrMr8yd-0Jy871By1rOWWhEsaVe2gagkKCGQGa9vlTpU859JFZtloh4
 sFXmU2_54-aOgWIBG0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledriedugddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rGcmYAbowUyCorVdCmnZ1Excidc6cgE6l94jFauQ_T-DFsDZV9VkNg>
 <xmx:rGcmYGVNvY3ZW-N-4dzdbAMcR3yeuDyDedj1cMLOyKWdxhaBuqKaWQ>
 <xmx:rGcmYJ8oR2oErYr-GCoWRhsvC0qa5jd_ogBtmF-b-FNp_mvO7ynDOw>
 <xmx:rmcmYG_PGv-6F_W5diM_T-xfLt90SSM9CNuXfa_qsB241m1m8aEfUQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F3102240057;
 Fri, 12 Feb 2021 06:34:03 -0500 (EST)
Date: Fri, 12 Feb 2021 12:34:01 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
Message-ID: <20210212113401.rqm3373c7i3gvfaa@gilmour>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour>
 <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
 <CAPY8ntCG3vLy1NWNF09DEZWE-t_xc+q5m89Jv8GB8GofBLVp3Q@mail.gmail.com>
 <d4f8c89b-9bab-3dce-1f05-aeef39f64211@gmail.com>
 <97eef5ad872b08b174dfd4ed903508371b1baaa5.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <97eef5ad872b08b174dfd4ed903508371b1baaa5.camel@suse.de>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Marc Zyngier <maz@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0809129134=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0809129134==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="moz7vodkmjhn6f2x"
Content-Disposition: inline


--moz7vodkmjhn6f2x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 12:20:14PM +0100, Nicolas Saenz Julienne wrote:
> On Wed, 2021-02-10 at 10:49 -0800, Florian Fainelli wrote:
> > On 2/10/21 7:49 AM, Dave Stevenson wrote:
> > > Hi Marc.
> > >=20
> > > On Wed, 10 Feb 2021 at 15:30, Marc Zyngier <maz@kernel.org> wrote:
> > > >=20
> > > > Hi Maxime,
> > > >=20
> > > > On 2021-02-10 14:40, Maxime Ripard wrote:
> > > > > Hi Dave,
> > > > >=20
> > > > > On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
> > > > > > On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > >=20
> > > > > > > The BSC controllers used for the HDMI DDC have an interrupt c=
ontroller
> > > > > > > shared between both instances. Let's add it to avoid polling.
> > > > > >=20
> > > > > > This seems to have unintended side effects.
> > > > > > GIC interrupt 117 is shared between the standard I2C controllers
> > > > > > (i2c-bcm2835) and the l2-intc block handling the HDMI I2C inter=
rupts.
> > > > > >=20
> > > > > > Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
> > > > > > doesn't appear to be an option for l2-intc registering as an in=
terrupt
> > > > > > controller. i2c-bcm2835 therefore loses out and fails to regist=
er for
> > > > > > the interrupt.
> > > > > >=20
> > > > > > Is there an equivalent flag that an interrupt controller can ad=
d to
> > > > > > say that the parent interrupt is shared? Is that even supported?
> > > > >=20
> > > > > Indeed, it looks like setting an equivalent to IRQF_SHARED would =
be the
> > > > > solution, but I couldn't find anything that would allow us to in =
the
> > > > > irqchip code.
> > > > >=20
> > > > > Marc, Thomas, is it something that is allowed?
> > > >=20
> > > > No, not really. That's because the chained handler is actually an
> > > > interrupt flow, and not a normal handler. IRQF_SHARED acts at the w=
rong
> > > > level for that.
> > > >=20
> > > > I can see two possibilities:
> > > >=20
> > > > - the l2-intc gets turned into a normal handler, and does the demux
> > > > =A0=A0=A0from there. Horrible stuff.
> > > >=20
> > > > - the i2c controller gets parented to the l2c-int as a fake interru=
pt,
> > > > =A0=A0=A0and gets called from there. Horrible stuff.
> > > >=20
> > > > Pick your poison... :-/
> > >=20
> > > Thanks for the info.
> > >=20
> > > Option 3 - remove l2-intc and drop back to polling the i2c-brcmstb
> > > blocks (which the driver supports anyway).
> > > HDMI I2C generally isn't heavily used once displays are connected, so
> > > I'd be OK with that.
> > >=20
> > > (We can keep the l2-intc that handles CEC and HPD as that is on a
> > > unique GIC interrupt).
> >=20
> > Agreed, Maxime or Nicolas do you want me to send a revert of this patch?
>=20
> Reverting seems the safe move, but I'll defer to whatever Maxime says.

Yes, reverting it seems like the easiest way forward. If you can send it
Florian that would be great :)

Maxime

--moz7vodkmjhn6f2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCZnnwAKCRDj7w1vZxhR
xdTQAQC85VJJ8wGUhPixlwCo17bQ6yPOc9ss6XeEenGXEOsgkwEA73taLwLEdjTp
Vm9W4RMnUydzJnx0LRGV68eTY4SMNwE=
=X4Yr
-----END PGP SIGNATURE-----

--moz7vodkmjhn6f2x--

--===============0809129134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0809129134==--
