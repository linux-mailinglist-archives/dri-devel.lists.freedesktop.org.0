Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC45EC3F2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 15:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4BD10E337;
	Tue, 27 Sep 2022 13:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772F210E337
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 13:15:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8C26B32009A2;
 Tue, 27 Sep 2022 09:15:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 27 Sep 2022 09:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664284521; x=
 1664370921; bh=SUXXv33XMl//pWEuDrlkAnz26Na+QYAPZnxyyfOthW8=; b=Q
 /6bYBPMPSlim++kCMME0WAFrwCqAaRHpAwW0ZMF6wUIYgc0VsHCz99+oJFOiKsJD
 8Ft3GdG/Q7jQUNBoDJUwJUPY5gwfZDtEUArANUquh9BK5mlFPXch9yB1WIZldh17
 gQCik9mhqqW/TGArdQaIYh5XVdsmAhxhDpmEbXv/NYLApB+RH05eNDZJTO7yKkvd
 OmpmuzIvP/SFwvyRhysdpXHmcUJjxmoXYakOAg0Rkdtx30isM4jSfQDQXL8QkZFA
 EYl3Lc8Usobotpbac83I3+IlxBGle8C9y/w2Q4tD340rj62S2/EBh6BvTEyYN6gk
 5KbA0DjRfcfFnk3KPDPPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664284521; x=
 1664370921; bh=SUXXv33XMl//pWEuDrlkAnz26Na+QYAPZnxyyfOthW8=; b=B
 9NosnhsheLC5qNjJFkfoC+2V3PGSvuGSko0e4ds/FvFoQNZCGiATZ9sDWGDuo+yf
 zbIqYpG3/uDtvwp+WE+FYIRNucUsmk2k8S/fcv/zjD1Sw3nynSm7Zajs57yskR5y
 PSPpg8A9SOUZQkJU4ctBXlG7y6ib3D24HX3FY8uuUmb3qMLST7Nuh/Iegf43Yjtg
 BhZZVnEuIDLiE41g9Uj3irp5+asP3DErCNDE5vxt4Y1/SoVycbzxqE257mRCH0Kj
 agKze0VKRdP8qWpDskOxwFta2lTdLyf/RdHDCZSGZlaf+Bk5wwsoecCCgic4AISU
 Z0mgB7ZrBenc7OF8MIq6Q==
X-ME-Sender: <xms:aPcyY9VtZL6ULJmHajrZzwI9phWboZoaiUjO0EtHNpdJq3-sd5lzXA>
 <xme:aPcyY9k9wonOW_1GXQxXZtBQS53xTIW7YT4Ijr4mD6nPIopLC70nqD5o8lwEznytY
 TQtqvd49VmdIYrLdVE>
X-ME-Received: <xmr:aPcyY5ajsVTy9YJUqQKbkZUQE699NH_hLmBhSmdqfOuhfKZNkuQU3WXd-p_dkrAoevIfhhpN_zSa1gypLcx3X0TObJ2AG3zfQXou>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptdetteetvdejudejhfeggfdutdduveelhfejjedtveduffdvleehleet
 udetfeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aPcyYwXXxs990OoAlETQyY6Qx9OXk0Ha2LA4CfJcYI5Znj71_GerSw>
 <xmx:aPcyY3nPt-efsoFo2sOTshj7lzyXGFyF-yO8iyhzRhyDlUBxOXZYWA>
 <xmx:aPcyY9eoHIATbErC9DJq-Pp4apCQAZNdKxRP1aGr3tHRykZchDd5bw>
 <xmx:afcyY56dCHw04wlonMEiSBMSKxbPFxbj2d22lNvsuv5gnp0ff9UkrA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 09:15:20 -0400 (EDT)
Date: Tue, 27 Sep 2022 15:15:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927131517.3yyuswqlndcwr4pz@houat>
References: <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
 <20220927114240.xilpcte2s3b5bmcf@houat>
 <20220927122512.h5tsnhbjivcnesph@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220927122512.h5tsnhbjivcnesph@houat>
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

On Tue, Sep 27, 2022 at 02:25:12PM +0200, Maxime Ripard wrote:
> On Tue, Sep 27, 2022 at 01:42:40PM +0200, Maxime Ripard wrote:
> > On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
> > > Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> > > > On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> > > > > Hi Stefan,
> > > > >=20
> > > > > On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> > > > > > Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > > > > > > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde w=
rote:
> > > > > > > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > > > > > > Hi Marc,
> > > > > > > > >=20
> > > > > > > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > > > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > > > > > > I'm on a Raspberry Pi 3 Model B+ running current De=
bian testing ARM64,
> > > > > > > > > > > > using Debian's v5.19 kernel (Debian's v5.18 was wor=
king flawless).
> > > > > > > > > > > >=20
> > > > > > > > > > > > | [    0.000000] Booting Linux on physical CPU 0x00=
00000000 [0x410fd034]
> > > > > > > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debi=
an-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU B=
inutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > > > > > > 9-01)
> > > > > > > > > > > > | [    0.000000] Machine model: Raspberry Pi 3 Mode=
l B+
> > > > > > > > > > > > | [    3.747500] raspberrypi-firmware soc:firmware:=
 Attached to firmware from 2022-03-24T13:21:11
> > > > > > > > > > > >=20
> > > > > > > > > > > > As soon a the vc4 module is loaded the following wa=
rnings hits 4
> > > > > > > > > > > > times, then the machine stops.
> > > > > > > > > > [...]
> > > > > > > > > >=20
> > > > > > > > > > > The warning itself is fixed, both upstream and in sta=
ble (5.19.7).
> > > > > > > > > > Ok. Debian is using 5.19.6
> > > > > > > > > >=20
> > > > > > > > > > > It shouldn't have any relation to the hang though. Ca=
n you share your
> > > > > > > > > > > setup?
> > > > > > > > > > - config.txt:
> > > > > > > > > >=20
> > > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > > gpu_mem=3D16
> > > > > > > > > > disable_splash=3D1
> > > > > > > > > >=20
> > > > > > > > > > arm_64bit=3D1
> > > > > > > > > > enable_uart=3D1
> > > > > > > > > > uart_2ndstage=3D1
> > > > > > > > > >=20
> > > > > > > > > > os_prefix=3D/u-boot/
> > > > > > > > > >=20
> > > > > > > > > > [pi3]
> > > > > > > > > > force_turbo=3D1
> > > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > >=20
> > > > > > > > > > - Raspberry Pi 3 Model B+
> > > > > > > > > > - no HDMI connected
> > > > > > > > > Does it mean, the issue only occurs without HDMI connecte=
d?
> > > > > > > > > If you didn't test with HDMI yet, could you please do?
> > > > > > > > The error occurs with HDMI not connected, as vc4 is the gfx=
 driver I
> > > > > > > > thought this might be of interest. :)
> > > > > > > >=20
> > > > > > > > I don't have a HDMI monitor here, but I'll come back to you=
 as soon as I
> > > > > > > > get access to one (might take some time).
> > > > > > > It's not the first time an issue like this one would occur. I=
'm trying
> > > > > > > to make my Pi3 boot again, and will try to bisect the issue.
> > > > > > yes the issue is only triggered without HDMI connected. I was a=
ble to
> > > > > > reproduce with an older vc4 firmware from 2020 (don't want to u=
pgrade yet).
> > > > > > Kernel was also an arm64 build with defconfig.
> > > > > >=20
> > > > > > Here some rough starting point for bisection:
> > > > > >=20
> > > > > > 5.18.0 good
> > > > > > 5.19.0 bad
> > > > > > 5.19.6 bad
> > > > > Sorry it took a bit of time, it looks like I found another bug wh=
ile
> > > > > trying to test this yesterday.
> > > > >=20
> > > > > Your datapoints are interesting though. I have a custom configura=
tion
> > > > > and it does boot 5.19 without an HDMI connected.
> > > > >=20
> > > > > So I guess it leaves us with either the firmware version being di=
fferent
> > > > > (I'm using a newer version, from March 2022), or the configuratio=
n. I'll
> > > > > test with defconfig.
> > > > So it turns out compiling vc4 as a module is the culprit.
> > >=20
> > > Do you mean regardless of the kernel version in your case?
> >=20
> > No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn't, like
> > Marc said. But if vc4 is built in, both work.
> >=20
> > > In my test cases i build vc4 always as module.
> > >=20
> > > > It's not clear to me why at this point, but the first register writ=
e in
> > > > vc4_hdmi_reset stalls.
> > >
> > > Sounds like timing issue or a missing dependency (clock or power doma=
in)
> >=20
> > It felt like a clock or power domain issue to me indeed, but adding
> > clk_ignore_unused and pd_ignore_unused isn't enough, so it's probably
> > something a bit more complicated than just the clock / PD being
> > disabled.
>=20
> I found the offending patch:
> https://lore.kernel.org/dri-devel/20220225143534.405820-13-maxime@cerno.t=
ech/
>=20
> That code was removed because it was made irrelevant by that earlier patc=
h:
> https://lore.kernel.org/dri-devel/20220225143534.405820-10-maxime@cerno.t=
ech/
>=20
> But it turns out that while it works when the driver is built-in, it
> doesn't when it's a module. If we add a clk_hw_get_rate() call right
> after that call to raspberrypi_fw_set_rate(), the rate returned is 0.
>=20
> I'm not entirely sure why, but I wonder if it's related to:
> https://github.com/raspberrypi/linux/issues/4962#issuecomment-1228593439

Turns out it's not, since the Pi3 is using the clk-bcm2835 driver.

However, even reverting that patch fails. clk_set_min_rate fails because
the rate is protected, but it doesn't look like it is anywhere for that
clock, so I'm a bit confused.

Even if we do remove the clock protection check in
clk_core_set_rate_nolock(), clk_calc_new_rates() will then fail because
the bcm2835 driver will round the clock rate below the minimum, which is
rejected.

I'm not entirely sure what to do at this point. I guess the proper fix
would be to:
  - Figure out why it's considered protected when it's not (or shouldn't be)
  - Make the driver compute an acceptable rate for that clock
  - Reintroduce the clk_set_min_rate call to HDMI's runtime_resume, or
    some other equivalent code

Maxime
