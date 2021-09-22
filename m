Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AAB4147CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734706EB7C;
	Wed, 22 Sep 2021 11:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022696EB7C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 11:28:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F7775C010F;
 Wed, 22 Sep 2021 07:28:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Sep 2021 07:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+Hn0TV5u1dvl16s+cyQXRPGsOus
 MPyZzM+2/BnVtTus=; b=vHIRL1EACm6MHCVW9KKU47/Qyt2QoMOlnb01OFLzHo4
 7klzgrk1z4vzhgvMeeZcn3ya8YuuFt9/D8mCiJ+2Ev15u16tcnEjACkroiCBRfcm
 iV094cSxOUo8AZrekjQbUOULVmQE4re8rNJDYgbkoDqZA9YvTxWuRnKCrdraJoZ1
 NkyGJ+vWZiA08OKIz7GLun0hraLlQo1gmjSVGKd93dSVH/IhO9WQvYck3GOIZ0Xq
 uB06Fa27L6KBs4KVP2wGgl4XMKhoCh0SzecFjtEqNtmsCf/eyNA1dCMdn8msJZtJ
 tIXlnwDw+9B0ZN2uDtkhzccdeQkOzNMFZTOpTM8pMrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+Hn0TV
 5u1dvl16s+cyQXRPGsOusMPyZzM+2/BnVtTus=; b=bNxJO8nMTyG+NTDVvpZPwo
 p9EipXpn2bAqJ8Jfjp1JaAhzUCqlfrgFSzZfVxJTY8aE2FYIjr94FuBnsqCvaQiH
 3DU5vsXVDXO8U1vFEWIeyKnefs0sCWt+tuiW/T+eZ6VhVyWYgKYLs8solrYP7Y5C
 L4aKyc4N5B0T50Hk93M5zWFa7no3/8pn+qd72CMfFI3Ge0+WKgYDryvRAbbkXGO0
 yOdj0WaACgZzyZED8MFHGlN5IIlwLWaMuJBir1MNNa7u6vHlYI4qcJinAvMZ4UQ/
 YRNlMxQl5fM0ec9mti0/5rs/vv4pQxWy/cTnZyMGupsjnv1yHWcSo6/hpvmhjaUg
 ==
X-ME-Sender: <xms:aBNLYczHO81LD0xFxh6vw9QYv34BclqEuGO_pJlOZhcWxX0Ll7rciA>
 <xme:aBNLYQR2-3d9CGto7vqLde3z2fxhfnfx9OMEBDqXhhQbUOfAdqE6Z7GLmmZgutfYe
 vC4boLsqbhs2Ff0GMA>
X-ME-Received: <xmr:aBNLYeUvKT2psrAdI2RA09CrqHEUouUEzCuOiitE6MscLghxQwiQA4cfTwN39b3ouFeNXEwpBFEzEC6waLJwCyhGG3pCDOtWUV5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveeigfdtfeegteetgfejhfeiuddvtdefhffftddthfevveejjeegtdethfeh
 teeknecuffhomhgrihhnpegtohguvghthhhinhhkrdgtohdruhhkpdhunhhhrdgvughune
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aBNLYaiOkA0qdIkv2ipxqURKVt7pltdstkb9krtshchD_ixpn612YQ>
 <xmx:aBNLYeBx2xXmK8oSyqvXZHTAfBrVZ6rLYPjcA9RM_lKwTUag0j9r7Q>
 <xmx:aBNLYbJYJTKyQZ7Ttw6DR6v870uR4SCUwgQyLCKuo7C7B8BeNb7d-A>
 <xmx:aRNLYQ24mkffD9I4QSuewbzJBg0jqGMkdVDYEJChVn2oMc7b9f2YZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 07:28:40 -0400 (EDT)
Date: Wed, 22 Sep 2021 13:28:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210922112837.asxuf5vyen2rwu7u@gilmour>
References: <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
 <20210920155350.h6624mt65vwg72p2@gilmour>
 <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bnjqga3jhevjrvlf"
Content-Disposition: inline
In-Reply-To: <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bnjqga3jhevjrvlf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 11:10:34AM +0100, Sudip Mukherjee wrote:
> On Wed, Sep 22, 2021 at 10:57 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Sep 20, 2021 at 06:21:42PM +0100, Sudip Mukherjee wrote:
> > > On Mon, Sep 20, 2021 at 6:10 PM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Mon, Sep 20, 2021 at 05:35:00PM +0100, Sudip Mukherjee wrote:
> > > > > On Mon, Sep 20, 2021 at 4:53 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > On Mon, Sep 20, 2021 at 05:43:33PM +0200, Maxime Ripard wrote:
> > > > > > > On Mon, Sep 20, 2021 at 04:47:31PM +0200, Maxime Ripard wrote:
> > > > > > > > On Sat, Sep 04, 2021 at 10:40:29AM +0100, Sudip Mukherjee w=
rote:
> > > > > > > > > Hi Maxime,
> > > > > > > > >
> > > > > > > > > On Sat, Sep 4, 2021 at 10:10 AM Maxime Ripard <maxime@cer=
no.tech> wrote:
> > > > > > > > > >
> > > > > > > > > > On Fri, Sep 03, 2021 at 09:09:50PM +0100, Sudip Mukherj=
ee wrote:
> > > > > > > > > > > Hi Maxime,
> > > > > > > > > > >
> > > > > > > > > > > On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@=
cerno.tech> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Sudip,
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Muk=
herjee wrote:
> > > > > > > > > > > > > Hi All,
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > <snip>
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > You can see the complete dmesg at
> > > > > > > > > > > > > https://openqa.qa.codethink.co.uk/tests/76#step/d=
mesg/8
> > > > > > > > > > > >
> > > > > > > > > > > > What test were you running?
> > > > > > > > > > >
> > > > > > > > > > > Nothing particular, its just a boot test that we do e=
very night after
> > > > > > > > > > > pulling from torvalds/linux.git
> > > > > > > > > >
> > > > > > > > > > What are you booting to then?
> > > > > > > > >
> > > > > > > > > I am not sure I understood the question.
> > > > > > > > > Its an Ubuntu image. The desktop environment is gnome. An=
d as
> > > > > > > > > mentioned earlier, we use the HEAD of linus tree every ni=
ght to boot
> > > > > > > > > the rpi4 and test that we can login via desktop environme=
nt and that
> > > > > > > > > there is no regression in dmesg.
> > > > > > > >
> > > > > > > > Looking at the CI, this isn't from a RPi but from qemu?
> > > > >
> > > > > No, this is from rpi4 board (4GB), not qemu. The CI is a little
> > > > > complicated here, lava boots the board with the new kernel and wi=
ll
> > > > > then trigger the openQA job. openQA will then connect to the board
> > > > > using vnc to test the desktop. This is the last link that I sent =
to
> > > > > Linus when he asked for it.
> > > > > https://lava.qa.codethink.co.uk/scheduler/job/164#L1356
> > > > >
> > > > > And this is the lava job for today -
> > > > > https://lava.qa.codethink.co.uk/scheduler/job/173
> > > >
> > > > Is it connected to a monitor then?
> > >
> > > Missed replying to this one earlier. I have a hdmi lilliput monitor
> > > connected to it.
> > >
> > > >
> > > > > > > >
> > > > > > > > What defconfig are you using? How did you generate the Ubun=
tu image?
> > > > > > > > Through debootstrap? Any additional package?
> > > > >
> > > > > Its the default ubuntu config. I can send you the config if you w=
ant.
> > > >
> > > > Yes, please.
> > >
> > > Attached.
> > > My build script will copy this config as .config,  do olddefconfig
> > > and then build.
> >
> > I still can't reproduce it.
> >
> > What other customisations did you do to that image? It looks like
> > there's some customs scripts in there (test-mainline.sh), what are they
> > doing?
>=20
> That test script is triggering the openqa job, but its running only
> after lava is able to login. The trace is appearing before the login
> prompt even, so test_mainline.sh should not matter here.
> The only customization done to the default ubuntu image is the initrd.
> Can you please try with the initrd from
> https://elisa-builder-00.iol.unh.edu/kernel/mainline/rpi4/initrd.gz..
> I will check with another board also.

Still works fine (and it required some mangling of the kernel command line).

If we summarize:

  - You initially just dumped a panic and a link to your QA, without any
    more context:

  - Then stating that you're not doing any test, really;

  - Well, except for booting Ubuntu, but no other modification

  - But you're not booting the standard image

  - And with a custom initrd

  - And that QA link states that you're booting from QEMU, but you're
    not.

Please provide a full documentation on what you're doing to generate
that image, from scratch, in order to get that panic you reported
previously.

I've spent an entire day trying to make sense of what you're doing
exactly to get into that situation. I have other things to work on and I
don't plan on figuring out any random CI system.

Maxime

--bnjqga3jhevjrvlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUsTZQAKCRDj7w1vZxhR
xYJaAQCtbNXddM4GAVBxBiM+0JtCLNgmjcuh1y+SwS2uLQHcjQEA5EUTM65DmXiy
HYjenCs+EkXD6mgKoGj6LeWWAbfpfgQ=
=IubQ
-----END PGP SIGNATURE-----

--bnjqga3jhevjrvlf--
