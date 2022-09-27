Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 988735EC29F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 14:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AB010E939;
	Tue, 27 Sep 2022 12:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2346610E92D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 12:25:17 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B07645C0097;
 Tue, 27 Sep 2022 08:25:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 27 Sep 2022 08:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664281515; x=
 1664367915; bh=tvWCLDPDOTtxpmxEX6xMmTxFyafTOwVyESKSA2jQXeU=; b=g
 E0I6frJM+Xwvn9XwbdAVsdRA8rMA6G9nKp6Y6ffl9D0QuwrCFdkCkz8f/rxfVVR/
 ALeIZQRtdrpGO4QPvFQ7vFPx8sOymwzLqdsy9ZEckqGL0qfTeHgRjLYmUOackjJn
 cfWyEe2eQaIEmMG8Sp4n8JR0vo5MV3QMxAz7jWHpbdZNj2zvpRABbZGSZt4RugKV
 hVKc93d3zGbXl19iDCsJ0tdifiPAr5cApYhRqwzMVAr5fP4uD9uDH6S27JpehKtl
 8KMy1Tz/FBGbhHlZoIe0UpawhO0AyuwVpyW+DXBTiVpT+tVs1CxEe6Y6c/75CvKQ
 ePr0tPZ6xlwTsONmRQCug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664281515; x=
 1664367915; bh=tvWCLDPDOTtxpmxEX6xMmTxFyafTOwVyESKSA2jQXeU=; b=k
 gKCZiTUFMlq7Eq0dqJ9tQmQdz/l1ktJLAKzi3Z8nGuVGzr0o7E9s0K76fAeHi3Pv
 0CrZKc8718HzoDYkC355jj2RkvSRKEU/RYf4ybxpxo7dzR0ynlSpuci43+x5PRmZ
 9xdDrtDs6jcWtfkpGmPhFfqU+cmsvinDVt3niJpFwgVGv1wEEox28HVHrohTNMC7
 Y3ePZvnETkNmTCEBQAhfEoA+7sCLOW0Kh6fOhhurzdFG6AWU0Cl5SzB1LgKaDEil
 35vFL11CmKqvT2fCcdxTx7wwHrHsYlnp3pQEb+8fCMD+114nrn6LB5Tjwn3tmKAJ
 Ggg6+aDbeujH3wKVDrx2A==
X-ME-Sender: <xms:q-syY_WT-LGqgwFxRB8QEqgrmgqGAOPze3qaFvdJu8JigwJr484AvA>
 <xme:q-syY3k5lz8Rf37016cLMdzrfw-9anY1_82dXLH2IL2SrvhxeA7-VCzGMnoQb0s7o
 s6gVLY59zu-d_fcwfo>
X-ME-Received: <xmr:q-syY7aG8tGdErBKImhMXn5Wz9bvaBMGVJZe82sWVwXwjcWGZbqO2wfT9aHJvs2ScuYU14HFvK2w5tgdY6bXzshvH8dwRklrug_h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptdetteetvdejudejhfeggfdutdduveelhfejjedtveduffdvleehleet
 udetfeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:q-syY6VL9pGggXstIuJqdDK4ZisCksNWJ0PE91bzKKHezsuVT4hbRw>
 <xmx:q-syY5k3NHwoFbpQ8SUfmVhpo0Bza6D21mvtuTD6ECqfuUzrJky0Hg>
 <xmx:q-syY3e-ITx9S6j3vttNMV6tTYk4F8SpGBr5ZEkbmnkZ5uCfEvI0pg>
 <xmx:q-syY76IyLUVUTJNVwu2M0_V81Qw1fHYak1XgtRjqhSDV2ub_CQslg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 08:25:14 -0400 (EDT)
Date: Tue, 27 Sep 2022 14:25:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927122512.h5tsnhbjivcnesph@houat>
References: <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
 <20220927114240.xilpcte2s3b5bmcf@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220927114240.xilpcte2s3b5bmcf@houat>
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

On Tue, Sep 27, 2022 at 01:42:40PM +0200, Maxime Ripard wrote:
> On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
> > Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> > > On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> > > > Hi Stefan,
> > > >=20
> > > > On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> > > > > Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > > > > > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wro=
te:
> > > > > > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > > > > > Hi Marc,
> > > > > > > >=20
> > > > > > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > > > > > I'm on a Raspberry Pi 3 Model B+ running current Debi=
an testing ARM64,
> > > > > > > > > > > using Debian's v5.19 kernel (Debian's v5.18 was worki=
ng flawless).
> > > > > > > > > > >=20
> > > > > > > > > > > | [    0.000000] Booting Linux on physical CPU 0x0000=
000000 [0x410fd034]
> > > > > > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debian=
-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Bin=
utils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > > > > > 9-01)
> > > > > > > > > > > | [    0.000000] Machine model: Raspberry Pi 3 Model =
B+
> > > > > > > > > > > | [    3.747500] raspberrypi-firmware soc:firmware: A=
ttached to firmware from 2022-03-24T13:21:11
> > > > > > > > > > >=20
> > > > > > > > > > > As soon a the vc4 module is loaded the following warn=
ings hits 4
> > > > > > > > > > > times, then the machine stops.
> > > > > > > > > [...]
> > > > > > > > >=20
> > > > > > > > > > The warning itself is fixed, both upstream and in stabl=
e (5.19.7).
> > > > > > > > > Ok. Debian is using 5.19.6
> > > > > > > > >=20
> > > > > > > > > > It shouldn't have any relation to the hang though. Can =
you share your
> > > > > > > > > > setup?
> > > > > > > > > - config.txt:
> > > > > > > > >=20
> > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > > gpu_mem=3D16
> > > > > > > > > disable_splash=3D1
> > > > > > > > >=20
> > > > > > > > > arm_64bit=3D1
> > > > > > > > > enable_uart=3D1
> > > > > > > > > uart_2ndstage=3D1
> > > > > > > > >=20
> > > > > > > > > os_prefix=3D/u-boot/
> > > > > > > > >=20
> > > > > > > > > [pi3]
> > > > > > > > > force_turbo=3D1
> > > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > >=20
> > > > > > > > > - Raspberry Pi 3 Model B+
> > > > > > > > > - no HDMI connected
> > > > > > > > Does it mean, the issue only occurs without HDMI connected?
> > > > > > > > If you didn't test with HDMI yet, could you please do?
> > > > > > > The error occurs with HDMI not connected, as vc4 is the gfx d=
river I
> > > > > > > thought this might be of interest. :)
> > > > > > >=20
> > > > > > > I don't have a HDMI monitor here, but I'll come back to you a=
s soon as I
> > > > > > > get access to one (might take some time).
> > > > > > It's not the first time an issue like this one would occur. I'm=
 trying
> > > > > > to make my Pi3 boot again, and will try to bisect the issue.
> > > > > yes the issue is only triggered without HDMI connected. I was abl=
e to
> > > > > reproduce with an older vc4 firmware from 2020 (don't want to upg=
rade yet).
> > > > > Kernel was also an arm64 build with defconfig.
> > > > >=20
> > > > > Here some rough starting point for bisection:
> > > > >=20
> > > > > 5.18.0 good
> > > > > 5.19.0 bad
> > > > > 5.19.6 bad
> > > > Sorry it took a bit of time, it looks like I found another bug while
> > > > trying to test this yesterday.
> > > >=20
> > > > Your datapoints are interesting though. I have a custom configurati=
on
> > > > and it does boot 5.19 without an HDMI connected.
> > > >=20
> > > > So I guess it leaves us with either the firmware version being diff=
erent
> > > > (I'm using a newer version, from March 2022), or the configuration.=
 I'll
> > > > test with defconfig.
> > > So it turns out compiling vc4 as a module is the culprit.
> >=20
> > Do you mean regardless of the kernel version in your case?
>=20
> No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn't, like
> Marc said. But if vc4 is built in, both work.
>=20
> > In my test cases i build vc4 always as module.
> >=20
> > > It's not clear to me why at this point, but the first register write =
in
> > > vc4_hdmi_reset stalls.
> >
> > Sounds like timing issue or a missing dependency (clock or power domain)
>=20
> It felt like a clock or power domain issue to me indeed, but adding
> clk_ignore_unused and pd_ignore_unused isn't enough, so it's probably
> something a bit more complicated than just the clock / PD being
> disabled.

I found the offending patch:
https://lore.kernel.org/dri-devel/20220225143534.405820-13-maxime@cerno.tec=
h/

That code was removed because it was made irrelevant by that earlier patch:
https://lore.kernel.org/dri-devel/20220225143534.405820-10-maxime@cerno.tec=
h/

But it turns out that while it works when the driver is built-in, it
doesn't when it's a module. If we add a clk_hw_get_rate() call right
after that call to raspberrypi_fw_set_rate(), the rate returned is 0.

I'm not entirely sure why, but I wonder if it's related to:
https://github.com/raspberrypi/linux/issues/4962#issuecomment-1228593439

Maxime
