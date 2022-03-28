Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330174E8F83
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 09:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F64610EB5B;
	Mon, 28 Mar 2022 07:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E0410E5E7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:57:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DACEC3200D98;
 Mon, 28 Mar 2022 03:57:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 03:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=h5eykCiHJKolkq2/gxI9dBCQ8RaFOcLfxhB6pw
 SatSY=; b=P8vkNGIt2hyGzthrsB9O2FUMW4Kxmm5aFsK1328cpqc5ufUY3ZDEE+
 ZhPwn42rUh3TQpdADfVL2gV71LSLxu94IKAt2BcGF/sq6SgIQ/r0Z5CrOW/H03Ve
 /UHcUpsyQnGqSjLHVSoj9GBrfdfqm6aPptZDR4aWwEtRFhuZfnNtt5CscVhCf+XX
 iJcMcI18mJMwXwQx3GBuZ/M7sN7TQi8wHaT+xiMSTfy/NrnYt9FW/Mo8kOqH6qev
 je5qn5syY8Iz/IplHBPhf27FfLCzwtyoPUqxVnH5rP5Bkx+1RpslztezVWYdUWGp
 EVI6LujzpmRWPel+VqCKpvijdxVHuJjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=h5eykCiHJKolkq2/g
 xI9dBCQ8RaFOcLfxhB6pwSatSY=; b=g2u+cOtTzlmFzjAlS3fdOYxZDo3jOXhg6
 mF+M5bq96gEqfPx/qEhBOvUuffYoCJ+ep3WIz3ZCazusTK9rDYxR/5yTv2LXZCNG
 JE1cxKyp9+Hx2zaUhMugDnLJNNjKosI2hUqQZS7+drIqVIK3qUHL9PYfHJUjqUay
 mhOBIbUDj5HyFPit7LGOvn5njFGfbq3X3Qc+5WW708c4miNUJz66VZMhMSVuKSkz
 QMdazx51wlGEcxA/FS2IF/am0vhyzfOwi0UPLU5g25/DKIroRYxlDLZvdqid6C09
 gyaE7wF06RHlW3F+UvPZdhrD9XKMyQ4xIztnnbwZXoHBI86LqxHXA==
X-ME-Sender: <xms:gGpBYpMEDUn1v3hz7MyCXrwCfF1g9srb54L7i1e5D2rtX0qb0Rk-0Q>
 <xme:gGpBYr8gIcZl9BXCob7WhvpfRXmtwXovl-1QjGiAEslv2SY78h6iks9H8F44gz6Ni
 PFnITGqyP7fxD6vNtk>
X-ME-Received: <xmr:gGpBYoTj-uhTAr7Gq0eRVnCj8mj9x2r7f0Xt8tAM1VUE3X85lqoF6g71g2dSsUyQj1nAF0DNUuXppzseUGO2ELzfn0UwmuYhIuo8ow4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gWpBYlvjzhVLLrtWWBuH7J2mqGrEf92kO8iNqHT8raDaqHtrWWxFpQ>
 <xmx:gWpBYhdUgueAZSMTYTOg46wenPjXg244oNKWagaD2J_xmkz1i-4YNQ>
 <xmx:gWpBYh0UJaJ3fmo1oFFyAhCclT-_JLYTxT40qnBxUytT09f8KOFG5A>
 <xmx:gWpBYgy1-ez1dlCsSFEQqbCKC37kFbLQVsD1H44RAKovwFJSytk-SQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 03:57:52 -0400 (EDT)
Date: Mon, 28 Mar 2022 09:57:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Message-ID: <20220328075750.zfuvgd3q56cy5zir@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220225132258.55yh537iknxh72vw@houat>
 <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
 <20220228104718.yorlzq6264jtffak@houat>
 <CAGS_qxpu_OivRptp05gdSNhdSQzFUU_2bsdW1JSrs0c5bhGnrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2hrc3ougec5ehkah"
Content-Disposition: inline
In-Reply-To: <CAGS_qxpu_OivRptp05gdSNhdSQzFUU_2bsdW1JSrs0c5bhGnrw@mail.gmail.com>
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


--2hrc3ougec5ehkah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 25, 2022 at 05:36:25PM -0500, Daniel Latypov wrote:
> On Mon, Feb 28, 2022 at 4:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Fri, Feb 25, 2022 at 01:29:03PM -0800, Daniel Latypov wrote:
> > > On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > Hi Daniel,
> > > >
> > > > On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > > > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > Let's test various parts of the rate-related clock API with the=
 kunit
> > > > > > testing framework.
> > > > > >
> > > > > > Cc: kunit-dev@googlegroups.com
> > > > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > >
> > > > > Tested-by: Daniel Latypov <dlatypov@google.com>
> > > > >
> > > > > Looks good to me on the KUnit side.
> > > > > Two small nits below.
> > > > >
> > > > > FYI, I computed the incremental coverage for this series, i.e.:
> > > > > 1) applied the full series
> > > > > 2) computed the absolute coverage
> > > > >
> > > > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> > > > > --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_DEBUG=
_KERNEL=3Dy
> > > > > --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_GCOV=
=3Dy
> > > >
> > > > I built a docker container based on ubuntu 18.04 to have gcc6 and
> > > > python3.7, but this doesn't seem to be working, I'm not entirely su=
re why:
> > > >
> > > > [13:11:22] Configuring KUnit Kernel ...
> > > > Regenerating .config ...
> > > > Populating config with:
> > > > $ make ARCH=3Dum olddefconfig CC=3D/usr/bin/gcc-6 O=3D.kunit
> > > > ERROR:root:Not all Kconfig options selected in kunitconfig were in =
the generated .config.
> > > > This is probably due to unsatisfied dependencies.
> > > > Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
> > > > Note: many Kconfig options aren't available on UML. You can try run=
ning on a different architecture with something like "--arch=3Dx86_64".
> > >
> > > Did you perhaps drop CONFIG_DEBUG_KERNEL=3Dy?
> > > Need to add 3 config options in total for coverage.
> > >
> > > If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=3Dy, I
> > > get the error message you get:
> > >
> > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> > > --make_options=3DCC=3D/usr/bin/gcc-6  --kconfig_add=3DCONFIG_DEBUG_IN=
FO=3Dy
> > > --kconfig_add=3DCONFIG_GCOV=3Dy
> > > ...
> > > Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
> > > Note: many Kconfig options aren't available on UML. You can try
> > > running on a different architecture with something like
> > > "--arch=3Dx86_64".
> >
> > It looks to me that it's more that DEBUG_INFO isn't enabled.
>=20
> Sorry for the very delayed response.
> I was largely getting internet over mobile data around when this email
> came in and didn't want to try and download docker images over that.
>=20
> It looks like that there was another change that is now merged into
> Linus' tree that causes this.
>=20
> I found that adding this helped (thanks David Gow)
>   --kconfig_add=3DDEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>=20
> Running against --kunitconfig=3Dlib/kunit, my final coverage result is
>=20
> Overall coverage rate:
>   lines......: 13.6% (18004 of 132055 lines)
>   functions..: 15.7% (1885 of 12010 functions)
>=20
> Can you give that a shot and see if it works?

It does fix the configuration issue, but I'm not able to run the tests eith=
er:

[07:53:51] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=3Dum olddefconfig O=3D/home/max/out
[07:53:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=3Dum olddefconfig O=3D/home/max/out
Building with:
$ make ARCH=3Dum --jobs=3D16 O=3D/home/max/out
[07:54:09] Starting KUnit Kernel (1/1)...
[07:54:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[07:54:09] [ERROR] Test : invalid KTAP input!
[07:54:09] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[07:54:09] Testing complete. Passed: 0, Failed: 0, Crashed: 0, Skipped: 0, =
Errors: 1
[07:54:09] Elapsed time: 18.486s total, 2.430s configuring, 16.052s buildin=
g, 0.003s running


I've tried to remove all the coverage from the equation, and I get the
same issue if I only run kunit run from inside the container, but it
works fine outside. So I guess it's my setup that is broken. Is there
some way to debug what could be going wrong there?

Thanks!
Maxime

--2hrc3ougec5ehkah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkFqfgAKCRDj7w1vZxhR
xTZ8APwLMdDa8Sr8DY4qbhNvdAZOxHRd7Wd1QQZSnxJNUWSg1wD+OeS/YGnb0oMK
0nIkR1yL47xkTzWi/lRkgKWkACzZEA8=
=nJMB
-----END PGP SIGNATURE-----

--2hrc3ougec5ehkah--
