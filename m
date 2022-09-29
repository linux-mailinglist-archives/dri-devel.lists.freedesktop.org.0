Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3C5EF227
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 11:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1939810EA17;
	Thu, 29 Sep 2022 09:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6AC10EA17
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 09:35:16 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4BD6C5C0160;
 Thu, 29 Sep 2022 05:35:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 29 Sep 2022 05:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664444115; x=1664530515; bh=gJWcDy4GTm
 GBrAjgNYruEYMd5sCmlfBYp++ntC1eOP8=; b=ha8cShISMmPZLPZd/+aMB+6ZE3
 EtG8xqlJypL2kjFKwWoD6b3lV0/i3dYneIbzS1bBnLbDtHz1fbgHGwGFMZ7ZT8vA
 4Hecr2RBhSKd7V1g6uJJuxzZrQzX3zGEXEhuMWEhcRlEVhhFat2kjyh3Ej7STBwh
 iLGB4JsHzQuoddvvohV/fJh6CIr8iGx43g3X6q/yk0uN6J47wJQyntbtZeEq2DA5
 GNRFLejK4HVjLcMur6QzxEwtaFRHLtwqLcPDYxvsZOBmxEZ403j0eyZi2RJsKb1F
 19QXi296vA0ThVOGh1sp8FmYkKgE+d+sr6rM9B8Klc+QSqKVf6EJ+IDIPJ8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664444115; x=1664530515; bh=gJWcDy4GTmGBrAjgNYruEYMd5sCm
 lfBYp++ntC1eOP8=; b=G4TeI/RsrAW9/Pv8gZSyA9E1fArMPhUtG5ps1jzEFKO1
 wIRjo0dJz4J9muwysbs8c6tiAcdlpcVBJ5O/NH0q7gW3UVQJJ8Vyaru9cJLjlwE2
 bwWNZC+d4V+NBI1rHlPG3i2WI4u7dDdbGfgyOmfDf+gPr6LSrGaNXujRSJq14Syn
 z7HVLwR4O96ylpKFXlO3p91xFez6n9hqWo8+Q+sHabK1SzorsZbQh2SgWJ7mMDBX
 9IK9Q3U7i9dhWccdHUZYK6UrerK+OvP3NBW3w18AuWYSJCp0WM52Bc677sclJYcV
 Fz9G6Lc59X6JCVqGGhrqgmn1Fz707OIlO8Mz0F9/TQ==
X-ME-Sender: <xms:0mY1Y4YSuw2M5dZcBH-jzi54nugKpj8uDnJnxJFczKBerauew9ADAQ>
 <xme:0mY1YzZjyXr_6r7ExcoU_aRZSBfPR_hRhfIEF1Nnad8iWoYRimovOjWn0Sk_Py-kG
 6AAIQmUYgSsXKd242U>
X-ME-Received: <xmr:0mY1Yy8aCngHds2s2ilqAkBv9FDg6oIRrV5aHbkerYnPhtvLhuvpxXFUxv5f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevgfevjeetkeejteeftdfhudelgfehfeekveeghedvkeduhfeutdfhleev
 ieffudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
 vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0mY1YyrMClrOFibAgQ0PXeFHZR7XhQ3dqCFxYRZkACsORwrPCpMj3Q>
 <xmx:0mY1YzpuAunM1ywCjRRnmPoAAc4GPXFr3iZqUbThi_d9gm6bduq6fA>
 <xmx:0mY1YwSnb8-fVHkQFcPOev_2oZD4a8Ja1VjONfVuAiyul9NXVwAmkw>
 <xmx:02Y1Y3fsv0MjbMu45z3FunNQ_oEadgMoLmAMCfrblBOYU5bqRnS2dw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 05:35:14 -0400 (EDT)
Date: Thu, 29 Sep 2022 11:35:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220929093513.cp2pbnbgesw3mgoy@houat>
References: <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
 <20220927114240.xilpcte2s3b5bmcf@houat>
 <20220927122512.h5tsnhbjivcnesph@houat>
 <20220927131517.3yyuswqlndcwr4pz@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jbjxk7rhrtkgu3a2"
Content-Disposition: inline
In-Reply-To: <20220927131517.3yyuswqlndcwr4pz@houat>
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jbjxk7rhrtkgu3a2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 03:15:17PM +0200, Maxime Ripard wrote:
> On Tue, Sep 27, 2022 at 02:25:12PM +0200, Maxime Ripard wrote:
> > On Tue, Sep 27, 2022 at 01:42:40PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
> > > > Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> > > > > On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> > > > > > Hi Stefan,
> > > > > >=20
> > > > > > On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> > > > > > > Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > > > > > > > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde=
 wrote:
> > > > > > > > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > > > > > > > Hi Marc,
> > > > > > > > > >=20
> > > > > > > > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > > > > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > > > > > > > I'm on a Raspberry Pi 3 Model B+ running current =
Debian testing ARM64,
> > > > > > > > > > > > > using Debian's v5.19 kernel (Debian's v5.18 was w=
orking flawless).
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > | [    0.000000] Booting Linux on physical CPU 0x=
0000000000 [0x410fd034]
> > > > > > > > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (de=
bian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU=
 Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > > > > > > > 9-01)
> > > > > > > > > > > > > | [    0.000000] Machine model: Raspberry Pi 3 Mo=
del B+
> > > > > > > > > > > > > | [    3.747500] raspberrypi-firmware soc:firmwar=
e: Attached to firmware from 2022-03-24T13:21:11
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > As soon a the vc4 module is loaded the following =
warnings hits 4
> > > > > > > > > > > > > times, then the machine stops.
> > > > > > > > > > > [...]
> > > > > > > > > > >=20
> > > > > > > > > > > > The warning itself is fixed, both upstream and in s=
table (5.19.7).
> > > > > > > > > > > Ok. Debian is using 5.19.6
> > > > > > > > > > >=20
> > > > > > > > > > > > It shouldn't have any relation to the hang though. =
Can you share your
> > > > > > > > > > > > setup?
> > > > > > > > > > > - config.txt:
> > > > > > > > > > >=20
> > > > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > > > gpu_mem=3D16
> > > > > > > > > > > disable_splash=3D1
> > > > > > > > > > >=20
> > > > > > > > > > > arm_64bit=3D1
> > > > > > > > > > > enable_uart=3D1
> > > > > > > > > > > uart_2ndstage=3D1
> > > > > > > > > > >=20
> > > > > > > > > > > os_prefix=3D/u-boot/
> > > > > > > > > > >=20
> > > > > > > > > > > [pi3]
> > > > > > > > > > > force_turbo=3D1
> > > > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > > >=20
> > > > > > > > > > > - Raspberry Pi 3 Model B+
> > > > > > > > > > > - no HDMI connected
> > > > > > > > > > Does it mean, the issue only occurs without HDMI connec=
ted?
> > > > > > > > > > If you didn't test with HDMI yet, could you please do?
> > > > > > > > > The error occurs with HDMI not connected, as vc4 is the g=
fx driver I
> > > > > > > > > thought this might be of interest. :)
> > > > > > > > >=20
> > > > > > > > > I don't have a HDMI monitor here, but I'll come back to y=
ou as soon as I
> > > > > > > > > get access to one (might take some time).
> > > > > > > > It's not the first time an issue like this one would occur.=
 I'm trying
> > > > > > > > to make my Pi3 boot again, and will try to bisect the issue.
> > > > > > > yes the issue is only triggered without HDMI connected. I was=
 able to
> > > > > > > reproduce with an older vc4 firmware from 2020 (don't want to=
 upgrade yet).
> > > > > > > Kernel was also an arm64 build with defconfig.
> > > > > > >=20
> > > > > > > Here some rough starting point for bisection:
> > > > > > >=20
> > > > > > > 5.18.0 good
> > > > > > > 5.19.0 bad
> > > > > > > 5.19.6 bad
> > > > > > Sorry it took a bit of time, it looks like I found another bug =
while
> > > > > > trying to test this yesterday.
> > > > > >=20
> > > > > > Your datapoints are interesting though. I have a custom configu=
ration
> > > > > > and it does boot 5.19 without an HDMI connected.
> > > > > >=20
> > > > > > So I guess it leaves us with either the firmware version being =
different
> > > > > > (I'm using a newer version, from March 2022), or the configurat=
ion. I'll
> > > > > > test with defconfig.
> > > > > So it turns out compiling vc4 as a module is the culprit.
> > > >=20
> > > > Do you mean regardless of the kernel version in your case?
> > >=20
> > > No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn't, l=
ike
> > > Marc said. But if vc4 is built in, both work.
> > >=20
> > > > In my test cases i build vc4 always as module.
> > > >=20
> > > > > It's not clear to me why at this point, but the first register wr=
ite in
> > > > > vc4_hdmi_reset stalls.
> > > >
> > > > Sounds like timing issue or a missing dependency (clock or power do=
main)
> > >=20
> > > It felt like a clock or power domain issue to me indeed, but adding
> > > clk_ignore_unused and pd_ignore_unused isn't enough, so it's probably
> > > something a bit more complicated than just the clock / PD being
> > > disabled.
> >=20
> > I found the offending patch:
> > https://lore.kernel.org/dri-devel/20220225143534.405820-13-maxime@cerno=
=2Etech/
> >=20
> > That code was removed because it was made irrelevant by that earlier pa=
tch:
> > https://lore.kernel.org/dri-devel/20220225143534.405820-10-maxime@cerno=
=2Etech/
> >=20
> > But it turns out that while it works when the driver is built-in, it
> > doesn't when it's a module. If we add a clk_hw_get_rate() call right
> > after that call to raspberrypi_fw_set_rate(), the rate returned is 0.
> >=20
> > I'm not entirely sure why, but I wonder if it's related to:
> > https://github.com/raspberrypi/linux/issues/4962#issuecomment-1228593439
>=20
> Turns out it's not, since the Pi3 is using the clk-bcm2835 driver.
>=20
> However, even reverting that patch fails. clk_set_min_rate fails because
> the rate is protected, but it doesn't look like it is anywhere for that
> clock, so I'm a bit confused.
>=20
> Even if we do remove the clock protection check in
> clk_core_set_rate_nolock(), clk_calc_new_rates() will then fail because
> the bcm2835 driver will round the clock rate below the minimum, which is
> rejected.
>=20
> I'm not entirely sure what to do at this point. I guess the proper fix
> would be to:
>   - Figure out why it's considered protected when it's not (or shouldn't =
be)
>   - Make the driver compute an acceptable rate for that clock

This was due to 5.19.7 missing 88110a9f6209

>   - Reintroduce the clk_set_min_rate call to HDMI's runtime_resume, or
>     some other equivalent code

I just sent a series addressing this here:
https://lore.kernel.org/r/20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296=
c@cerno.tech

Thanks for the report and the help :)
Maxime

--jbjxk7rhrtkgu3a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzVm0QAKCRDj7w1vZxhR
xQL0AQD7saf/TQD/a/A+QaioB1umnNCOf1QeL9j/QdxlBQvL5wEA032owonnB3ku
6RQJBtfvM4LpbfutxNr6dzaufIwfhgQ=
=hsdo
-----END PGP SIGNATURE-----

--jbjxk7rhrtkgu3a2--
