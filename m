Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0F5EF74A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 16:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2D010E5E9;
	Thu, 29 Sep 2022 14:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EEC10E5E9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:15:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4EDC05C00A8;
 Thu, 29 Sep 2022 10:15:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Sep 2022 10:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664460951; x=1664547351; bh=7rrY6bUHCc
 XAUqNdgwvghapx5g596xMd2DdQELDw5HY=; b=XLDPGz6KCJyBf9Vbsz0L3Rnh/3
 XVMO6NUfUBBY5Ee5dYNUmiXT1RQhVt+MYABUD17F5Yy3qqcBS0NqAvF2vtKHNbTa
 N+pPg8zS0jEqcrcjiYaujoD3GteGkuUZagM1v9+G3Jw926wFDwFRpmmLv1aDbv+p
 1Fg+i4rV/wihVl6pnRY9UU1e2UyHTIcNryJ5qe+xZu3ycNlwWgTB5zIzpTJ/S6sB
 LJtXNjoumjNPQV6zh32TgcWGK7Vt7CxDFpRoqmqKwU/Cs7ck6EuvzhhWoGl61mxW
 Qci3cobgxpm6S5xKm8DXpOzCmchwlunugUY6r2AbdioDmawm/Ao3yJ8q6clg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664460951; x=1664547351; bh=7rrY6bUHCcXAUqNdgwvghapx5g59
 6xMd2DdQELDw5HY=; b=YYLTePSTm4d7VeJldNCBp4gDzRCQh7TuNKsBqGQRUhwg
 uCxmC00MpsXQBVf18LufnF3pTsjhKOTi+bfZyHjbJtrGixOR+Kd94TMJ6tn7X2Uv
 A5Ok76Thp8BVYcD+SLOpNG9UhAo16kj7mwi1PIthYVRQ0uuAVKmZfuR3GQCQDAN0
 YlJKd9t/uRdlf+01gvrGLS1vf32fx9uYYnzo+Rxw1pSBWLrqxavii133hQ18fZ6S
 6yGORYLm8NZSSpTdri7NesGvjj42wN1F2x62pKdsZGhca6SjI8lXcnGQTOgBtZQd
 KhfU7/rUVy6cZrkQqcd0NFs0JTtpPefKWq3V+W/HSQ==
X-ME-Sender: <xms:lqg1Y1NmW_5msOfKPfJb7zHrbCGQjh8fjQzap7-_RMkIfoPFduMrAA>
 <xme:lqg1Y38_UwHpCOR-61Az4_mWSZnZ8ZCq6VnQiXYapO_zgGLJoeu6RrSr2lUQmHqVN
 53EZgFDZQz_kWwUahU>
X-ME-Received: <xmr:lqg1Y0R78v11oIQScNN7DjGVtR0DKIouy5BdXVOmzHxsamxCfREJwUFnbtwl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelfedtueekkeefudeivdetgfduieffueefhfdukeegtdetgffgtddujedv
 jedtleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpsg
 hoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lqg1YxsAkdrVO1Cus8AL8HpMpmGV8heMqcfOvwPEPfvd64sHysPeRw>
 <xmx:lqg1Y9cR_RQGRu_nDUhVLHdljsl-rOOIknQz_ENioORMXUEE46in2A>
 <xmx:lqg1Y91e4rI3GkmMwWoxhYQC_XeYQ3JpjeEJNyn6oj90pbZTL8ZHpQ>
 <xmx:l6g1Y8y8BvJGoFhfM8wf8lOHIKwTk32N2Ix-ruMGLjOIfAAd6-Al5g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 10:15:50 -0400 (EDT)
Date: Thu, 29 Sep 2022 16:15:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220929141548.jmthgedgmkrftc2l@houat>
References: <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
 <20220927114240.xilpcte2s3b5bmcf@houat>
 <20220927122512.h5tsnhbjivcnesph@houat>
 <20220927131517.3yyuswqlndcwr4pz@houat>
 <20220929093513.cp2pbnbgesw3mgoy@houat>
 <a659a49d-6609-4c1a-d01b-86f8f7e9740d@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ozkz3z2tg6dd6vtv"
Content-Disposition: inline
In-Reply-To: <a659a49d-6609-4c1a-d01b-86f8f7e9740d@i2se.com>
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


--ozkz3z2tg6dd6vtv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 03:46:01PM +0200, Stefan Wahren wrote:
> Am 29.09.22 um 11:35 schrieb Maxime Ripard:
> > On Tue, Sep 27, 2022 at 03:15:17PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 27, 2022 at 02:25:12PM +0200, Maxime Ripard wrote:
> > > > On Tue, Sep 27, 2022 at 01:42:40PM +0200, Maxime Ripard wrote:
> > > > > On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
> > > > > > Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> > > > > > > On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> > > > > > > > Hi Stefan,
> > > > > > > >=20
> > > > > > > > On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wro=
te:
> > > > > > > > > Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > > > > > > > > > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-B=
udde wrote:
> > > > > > > > > > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > > > > > > > > > Hi Marc,
> > > > > > > > > > > >=20
> > > > > > > > > > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > > > > > > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > > > > > > > > > I'm on a Raspberry Pi 3 Model B+ running curr=
ent Debian testing ARM64,
> > > > > > > > > > > > > > > using Debian's v5.19 kernel (Debian's v5.18 w=
as working flawless).
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > | [    0.000000] Booting Linux on physical CP=
U 0x0000000000 [0x410fd034]
> > > > > > > > > > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64=
 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld =
(GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > > > > > > > > > 9-01)
> > > > > > > > > > > > > > > | [    0.000000] Machine model: Raspberry Pi =
3 Model B+
> > > > > > > > > > > > > > > | [    3.747500] raspberrypi-firmware soc:fir=
mware: Attached to firmware from 2022-03-24T13:21:11
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > As soon a the vc4 module is loaded the follow=
ing warnings hits 4
> > > > > > > > > > > > > > > times, then the machine stops.
> > > > > > > > > > > > > [...]
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > The warning itself is fixed, both upstream and =
in stable (5.19.7).
> > > > > > > > > > > > > Ok. Debian is using 5.19.6
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > It shouldn't have any relation to the hang thou=
gh. Can you share your
> > > > > > > > > > > > > > setup?
> > > > > > > > > > > > > - config.txt:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > > > > > gpu_mem=3D16
> > > > > > > > > > > > > disable_splash=3D1
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > arm_64bit=3D1
> > > > > > > > > > > > > enable_uart=3D1
> > > > > > > > > > > > > uart_2ndstage=3D1
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > os_prefix=3D/u-boot/
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > [pi3]
> > > > > > > > > > > > > force_turbo=3D1
> > > > > > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > - Raspberry Pi 3 Model B+
> > > > > > > > > > > > > - no HDMI connected
> > > > > > > > > > > > Does it mean, the issue only occurs without HDMI co=
nnected?
> > > > > > > > > > > > If you didn't test with HDMI yet, could you please =
do?
> > > > > > > > > > > The error occurs with HDMI not connected, as vc4 is t=
he gfx driver I
> > > > > > > > > > > thought this might be of interest. :)
> > > > > > > > > > >=20
> > > > > > > > > > > I don't have a HDMI monitor here, but I'll come back =
to you as soon as I
> > > > > > > > > > > get access to one (might take some time).
> > > > > > > > > > It's not the first time an issue like this one would oc=
cur. I'm trying
> > > > > > > > > > to make my Pi3 boot again, and will try to bisect the i=
ssue.
> > > > > > > > > yes the issue is only triggered without HDMI connected. I=
 was able to
> > > > > > > > > reproduce with an older vc4 firmware from 2020 (don't wan=
t to upgrade yet).
> > > > > > > > > Kernel was also an arm64 build with defconfig.
> > > > > > > > >=20
> > > > > > > > > Here some rough starting point for bisection:
> > > > > > > > >=20
> > > > > > > > > 5.18.0 good
> > > > > > > > > 5.19.0 bad
> > > > > > > > > 5.19.6 bad
> > > > > > > > Sorry it took a bit of time, it looks like I found another =
bug while
> > > > > > > > trying to test this yesterday.
> > > > > > > >=20
> > > > > > > > Your datapoints are interesting though. I have a custom con=
figuration
> > > > > > > > and it does boot 5.19 without an HDMI connected.
> > > > > > > >=20
> > > > > > > > So I guess it leaves us with either the firmware version be=
ing different
> > > > > > > > (I'm using a newer version, from March 2022), or the config=
uration. I'll
> > > > > > > > test with defconfig.
> > > > > > > So it turns out compiling vc4 as a module is the culprit.
> > > > > > Do you mean regardless of the kernel version in your case?
> > > > > No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn'=
t, like
> > > > > Marc said. But if vc4 is built in, both work.
> > > > >=20
> > > > > > In my test cases i build vc4 always as module.
> > > > > >=20
> > > > > > > It's not clear to me why at this point, but the first registe=
r write in
> > > > > > > vc4_hdmi_reset stalls.
> > > > > > Sounds like timing issue or a missing dependency (clock or powe=
r domain)
> > > > > It felt like a clock or power domain issue to me indeed, but addi=
ng
> > > > > clk_ignore_unused and pd_ignore_unused isn't enough, so it's prob=
ably
> > > > > something a bit more complicated than just the clock / PD being
> > > > > disabled.
> > > > I found the offending patch:
> > > > https://lore.kernel.org/dri-devel/20220225143534.405820-13-maxime@c=
erno.tech/
> > > >=20
> > > > That code was removed because it was made irrelevant by that earlie=
r patch:
> > > > https://lore.kernel.org/dri-devel/20220225143534.405820-10-maxime@c=
erno.tech/
> > > >=20
> > > > But it turns out that while it works when the driver is built-in, it
> > > > doesn't when it's a module. If we add a clk_hw_get_rate() call right
> > > > after that call to raspberrypi_fw_set_rate(), the rate returned is =
0.
> > > >=20
> > > > I'm not entirely sure why, but I wonder if it's related to:
> > > > https://github.com/raspberrypi/linux/issues/4962#issuecomment-12285=
93439
> > > Turns out it's not, since the Pi3 is using the clk-bcm2835 driver.
> > >=20
> > > However, even reverting that patch fails. clk_set_min_rate fails beca=
use
> > > the rate is protected, but it doesn't look like it is anywhere for th=
at
> > > clock, so I'm a bit confused.
> > >=20
> > > Even if we do remove the clock protection check in
> > > clk_core_set_rate_nolock(), clk_calc_new_rates() will then fail becau=
se
> > > the bcm2835 driver will round the clock rate below the minimum, which=
 is
> > > rejected.
> > >=20
> > > I'm not entirely sure what to do at this point. I guess the proper fix
> > > would be to:
> > >    - Figure out why it's considered protected when it's not (or shoul=
dn't be)
> > >    - Make the driver compute an acceptable rate for that clock
> > This was due to 5.19.7 missing 88110a9f6209
>=20
> Do you really mean this commit ("clk: bcm2835: fix
> bcm2835_clock_choose_div")?
>=20
> I think this is applied in 5.19.7:
>=20
> https://elixir.bootlin.com/linux/v5.19.7/source/drivers/clk/bcm/clk-bcm28=
35.c#L944

You're right, I got confused and encountered this issue while bisecting,
so half-way from 5.18 through 5.19.

Maxime

--ozkz3z2tg6dd6vtv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzWolAAKCRDj7w1vZxhR
xQQsAQDyEaFvd7MFMqpqzVhFF/ptIMcS698yTJ7h9O+EWwm2agD/RIxR1QMOV39/
gi9dcsXm3terqiVjaQvYBqJOPGuXgAw=
=hA8d
-----END PGP SIGNATURE-----

--ozkz3z2tg6dd6vtv--
