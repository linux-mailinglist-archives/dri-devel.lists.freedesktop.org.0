Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF715EC493
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8E110E936;
	Tue, 27 Sep 2022 13:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E899F10E936
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:35:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 668E73200936;
 Tue, 27 Sep 2022 09:35:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 27 Sep 2022 09:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664285703; x=
 1664372103; bh=+dkSITxUFh/5sebrSiGSOdAAVHgfn7iApVYrNZDBuw8=; b=y
 LdU/jmK3HEUk/TTXdJwUregIFPFvQdcq+mTVLfIWnW8m17/4zfrVKQZZthCXblce
 wa5hvDlXaKSJ5qxvp2Gx6/z28OeJJqTQzpqCETc84bLArup0Gp2j3pv+RsSXQErx
 0de+sBx6FnXdT6hUsfQHSuX0R3dcCqP4wFOCWgcYcBxHeHRUC3zlzpMSadIQnTZN
 zGKoOsp77jl4ITgF1qygqIE7xHPTBv/HWZ18vBllN+VgdnyT3PaGsim9nMM7EArx
 wZGiOTV7STigsTkMz5EvevOyMDcHlmGCh6sLwgpNc88HJRHCnAyoZxbnlkcTOCIp
 QkOb/LrwP6j6xBA6EmMQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664285703; x=
 1664372103; bh=+dkSITxUFh/5sebrSiGSOdAAVHgfn7iApVYrNZDBuw8=; b=1
 j2oD/IsddxVINYwmUfjnI+uz78XBFJU3G9ECciWHv3UUzQve0KYvkI8/5bk+DXbW
 qzsgWdfSnH/Oy+Jr5WV80Nqxq6cHZoh+UcysCZw8SVXHMCdQTSnUCnNoGF9ypvbG
 y7/lmsi+Ez/Ct8vdevyrX3y8KkRSzD4sMKDH+ElmWDiFyIvK4RWCV4JPms23w6VH
 eflux+GhDSMM7VLmfPKoLm0o/0hzExYY2ssYHMH+Yc3LSOOVw2Rq7nOOSTFUBKmr
 ICIjw1Wmyp5QaD6UYh6i4TVajiFKVURY56Ykpq3AYfOCkIezeX/6rH3AY8PR+Xl7
 qE3AAY6v6qr2oRg/HD7Qw==
X-ME-Sender: <xms:B_wyYwUxWie1W--eIpRKWhqWzuGljM8bY-nvWVUcGLSZ8jM32aTkqQ>
 <xme:B_wyY0l5A5i0Q52hby6xBQv_2kn0YSfashDR-yRAnc3OytXl6OxwA1dUdIoBfXIPS
 vcXE2-7WlaHZHCNgA8>
X-ME-Received: <xmr:B_wyY0aSHu23LeBkDMAu5JM_OlmQ1x1oBGshEC-STbvHAlRfN4t7nPB9I2VwLDyNk1YhUU8xO12ks8E-Oy_FR1-NEoatUePPnPZ7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptdetteetvdejudejhfeggfdutdduveelhfejjedtveduffdvleehleet
 udetfeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B_wyY_WX2j5s4XHMxMaFRP5gc82GlfdFBKIT6aqO1oMWdmn-y94fVw>
 <xmx:B_wyY6mVuO8yllDp9-U3-d_6zvTeLOfttTT8pLs0sqPQSlTSXHz3Ng>
 <xmx:B_wyY0crwO5YbSWlO1A-HfgeILRpa5GZlajY1byu956xtstkFSR5Og>
 <xmx:B_wyY06YTjGLvqbjTB5_Zp9TR-6R_VkvdxIsQgAErRPHCP6WJ594Ww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 09:35:03 -0400 (EDT)
Date: Tue, 27 Sep 2022 15:35:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927133501.up5ddelhni7j7oqy@houat>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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

Found out that one. The HSM clock has CLK_SET_RATE_GATE that will
protect the rate for as long as the clock is enabled, so
clk_prepare_enable / clk_set_min_rate doesn't work, but clk_set_min_rate
/ clk_prepare_enable does.

Maxime
