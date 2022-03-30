Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087384EBBFE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5D810F5A4;
	Wed, 30 Mar 2022 07:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6210F594
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 07:43:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F199F3201F5A;
 Wed, 30 Mar 2022 03:43:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 30 Mar 2022 03:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=xX6gz1xhK8Ced8x34DwuQzbbZ+wnoVPlelUEwv
 c/4rI=; b=ts6jwYxW5FrRddt81vXPodjr3XtMDX0PHT9i3pEYr6/PJTud5eRCEE
 /Bkk3UAciR9h7TDeOC7A5o28Dhz1wPoZcgcyAFndvAmHU9/9JAQsswGmzgvWB0aw
 NTpA2JB+MV/6HBhTHlhJW6biW9AjumQH00wKwQtnOigHmMjorsDvUc8S83f9ijA/
 gMTf0FVaD6l5f5XxQFpTF5ss0ZdNXtSMQuP9pGb4BWsze3ulEkxgw6ZcllAmDuxA
 B17TNKg4+/o1W1yAUYifMza8l8MifiUOcmPKofO7g4uQp6TBZuGI8zEBQXFRklnV
 zkEFpT0d+yTpAxufe8mSSoOTEHlDyxTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xX6gz1xhK8Ced8x34
 DwuQzbbZ+wnoVPlelUEwvc/4rI=; b=lHnTfdj0fH4E2Yj7Ebe5GbafJDV142FG6
 Qgx+ywoOJPN2tFAzHHWLaAt/RlkqbTPNBZ5kuifpaqx2oWLhDu7YoDgVFGI/MTId
 CK5gij0w1QvztYRosPs+3UuSPGQ60PzWkGUu28X6pfkqIzvde2MkNwb9AFdYsDEZ
 QHlk2WIIlarrloq8cglnjbwfVZTMA3vdXumtysVp1CX9+cP6SyYah6MZJnWtxkFb
 kqjGGGITWB0vWJn+lmHn3RsN812nlCQ0lFZWZAw8PHjFhBpSGNigLLDLuHZycRYI
 1yVbqgi/jr9VCoyWEaPPMGUQ1Q/i4gHjTnPgXM2umfcwIKNONtO3A==
X-ME-Sender: <xms:HgpEYsRKxVTVzTWw-YA5FYaWvj1nuB8Q9QehqFxc175g1_NeVTnPWw>
 <xme:HgpEYpwJ04Xt_Zl1mZqvZ2WSk5HFOgXbJpo6HTucBgEw3iZ8PUh3Y5jXGZKjM4XRE
 xRggxda-ZyhOVirPYc>
X-ME-Received: <xmr:HgpEYp2XrbAPbjZUQvUR0mt4et5IHrlu9bVf2af4lTCAt3Bmm4E_gVh2ct-kuwRRv4qKUWZ4AmgTdKcu0dJqq3dTMsroGfUdFfY6Ilk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiuddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgueegudffffdvteeludduleekvdekjeefkeeiheehveeuleelvdekieeh
 gfegffenucffohhmrghinheplhhoghdrhihouhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HgpEYgAIwF_rpDf2gO_TgAjWepn9lnQmiP0RCysuqz_dtgBeta9juA>
 <xmx:HgpEYlgsN-iKsAVBb-r0lKvbhjo1Aj2RXWnuZmEllQvbYoCl1SsHHQ>
 <xmx:HgpEYsqNWyOqpAdmuX5umeX_PplSfKWU7k-05V9lDNT9GHrlZBwmZg>
 <xmx:HgpEYmWhFQL1IHxOLxlUQXP-tQh4Xfg9Kpnc0k7cEdUBlKp6w-Mi0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 03:43:25 -0400 (EDT)
Date: Wed, 30 Mar 2022 09:43:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Message-ID: <20220330074323.2svqaims42kouxu4@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220225132258.55yh537iknxh72vw@houat>
 <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
 <20220228104718.yorlzq6264jtffak@houat>
 <CAGS_qxpu_OivRptp05gdSNhdSQzFUU_2bsdW1JSrs0c5bhGnrw@mail.gmail.com>
 <20220328075750.zfuvgd3q56cy5zir@houat>
 <CAGS_qxoe9jX7ZN4XLJ3prT4SG_BeG8NGDX0FUes6er_3PChmpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5aqkn42tnytjzo3t"
Content-Disposition: inline
In-Reply-To: <CAGS_qxoe9jX7ZN4XLJ3prT4SG_BeG8NGDX0FUes6er_3PChmpw@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5aqkn42tnytjzo3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Mar 28, 2022 at 02:36:25PM -0500, Daniel Latypov wrote:
> On Mon, Mar 28, 2022 at 2:57 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Fri, Mar 25, 2022 at 05:36:25PM -0500, Daniel Latypov wrote:
> > > On Mon, Feb 28, 2022 at 4:47 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > On Fri, Feb 25, 2022 at 01:29:03PM -0800, Daniel Latypov wrote:
> > > > > On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > Hi Daniel,
> > > > > >
> > > > > > On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > > > > > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.t=
ech> wrote:
> > > > > > > >
> > > > > > > > Let's test various parts of the rate-related clock API with=
 the kunit
> > > > > > > > testing framework.
> > > > > > > >
> > > > > > > > Cc: kunit-dev@googlegroups.com
> > > > > > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > >
> > > > > > > Tested-by: Daniel Latypov <dlatypov@google.com>
> > > > > > >
> > > > > > > Looks good to me on the KUnit side.
> > > > > > > Two small nits below.
> > > > > > >
> > > > > > > FYI, I computed the incremental coverage for this series, i.e=
=2E:
> > > > > > > 1) applied the full series
> > > > > > > 2) computed the absolute coverage
> > > > > > >
> > > > > > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddriver=
s/clk
> > > > > > > --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_D=
EBUG_KERNEL=3Dy
> > > > > > > --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_=
GCOV=3Dy
> > > > > >
> > > > > > I built a docker container based on ubuntu 18.04 to have gcc6 a=
nd
> > > > > > python3.7, but this doesn't seem to be working, I'm not entirel=
y sure why:
> > > > > >
> > > > > > [13:11:22] Configuring KUnit Kernel ...
> > > > > > Regenerating .config ...
> > > > > > Populating config with:
> > > > > > $ make ARCH=3Dum olddefconfig CC=3D/usr/bin/gcc-6 O=3D.kunit
> > > > > > ERROR:root:Not all Kconfig options selected in kunitconfig were=
 in the generated .config.
> > > > > > This is probably due to unsatisfied dependencies.
> > > > > > Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
> > > > > > Note: many Kconfig options aren't available on UML. You can try=
 running on a different architecture with something like "--arch=3Dx86_64".
> > > > >
> > > > > Did you perhaps drop CONFIG_DEBUG_KERNEL=3Dy?
> > > > > Need to add 3 config options in total for coverage.
> > > > >
> > > > > If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=
=3Dy, I
> > > > > get the error message you get:
> > > > >
> > > > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> > > > > --make_options=3DCC=3D/usr/bin/gcc-6  --kconfig_add=3DCONFIG_DEBU=
G_INFO=3Dy
> > > > > --kconfig_add=3DCONFIG_GCOV=3Dy
> > > > > ...
> > > > > Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
> > > > > Note: many Kconfig options aren't available on UML. You can try
> > > > > running on a different architecture with something like
> > > > > "--arch=3Dx86_64".
> > > >
> > > > It looks to me that it's more that DEBUG_INFO isn't enabled.
> > >
> > > Sorry for the very delayed response.
> > > I was largely getting internet over mobile data around when this email
> > > came in and didn't want to try and download docker images over that.
> > >
> > > It looks like that there was another change that is now merged into
> > > Linus' tree that causes this.
> > >
> > > I found that adding this helped (thanks David Gow)
> > >   --kconfig_add=3DDEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > >
> > > Running against --kunitconfig=3Dlib/kunit, my final coverage result is
> > >
> > > Overall coverage rate:
> > >   lines......: 13.6% (18004 of 132055 lines)
> > >   functions..: 15.7% (1885 of 12010 functions)
> > >
> > > Can you give that a shot and see if it works?
> >
> > It does fix the configuration issue, but I'm not able to run the tests =
either:
> >
> > [07:53:51] Configuring KUnit Kernel ...
> > Generating .config ...
> > Populating config with:
> > $ make ARCH=3Dum olddefconfig O=3D/home/max/out
> > [07:53:53] Building KUnit Kernel ...
> > Populating config with:
> > $ make ARCH=3Dum olddefconfig O=3D/home/max/out
> > Building with:
> > $ make ARCH=3Dum --jobs=3D16 O=3D/home/max/out
> > [07:54:09] Starting KUnit Kernel (1/1)...
> > [07:54:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [07:54:09] [ERROR] Test : invalid KTAP input!
> > [07:54:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [07:54:09] Testing complete. Passed: 0, Failed: 0, Crashed: 0, Skipped:=
 0, Errors: 1
> > [07:54:09] Elapsed time: 18.486s total, 2.430s configuring, 16.052s bui=
lding, 0.003s running
> >
> >
> > I've tried to remove all the coverage from the equation, and I get the
> > same issue if I only run kunit run from inside the container, but it
> > works fine outside. So I guess it's my setup that is broken. Is there
> > some way to debug what could be going wrong there?
>=20
> kunit.py is failing to find any test results from the raw kernel dmesg ou=
tput.
> That is stored in $BUILD_DIR/test.log, so /home/max/out/test.log.
> (You can also have kunit.py print this out instead with `kunit.py run
> --raw_output`)

I was missing CAP_SYS_PTRACE in my container, once set it works just fine, =
thanks!
Maxime

--5aqkn42tnytjzo3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQKGwAKCRDj7w1vZxhR
xalnAQDLCFH/jwiz+d0mTWiFed6WrWnYt1WIDnHqnDcNVYbUzAD8DI2jotVCaR4G
4VMUybjRp0EOAVbe1a6LgCgSN2AppAs=
=1tCJ
-----END PGP SIGNATURE-----

--5aqkn42tnytjzo3t--
