Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA75EBEDB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 11:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E1610E570;
	Tue, 27 Sep 2022 09:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F610E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 09:42:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B22613200AD5;
 Tue, 27 Sep 2022 05:42:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 27 Sep 2022 05:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664271723; x=
 1664358123; bh=KHMC3jjIw0Obg1T6do2/LgEIEQfzagckUj9C9bwOcq0=; b=1
 ZMYuFoTc6G+tGM/Tj0kO6HGeEB+jVbM65cNZBulvJej/5JVutOdc3+mFWQdYBqwP
 lAXq+S+4P60yX0KiJCTyuLZ4WZggXqJk5TKJCyE2XmQExQAKBPpZdqMMORxbJPt9
 PnxTvzIQ5stCgC/bqsqnpmubf19rBlVzDSZz1A3KqtRplvSZTA7iH692T5EuzXFT
 O68537F9A2ES3Zw+AxmGSmL6+Ma4h/u0W4xj3qzz8RmIjvK5ZiUSMl0AR0GrDu5C
 +7xrqexLwj37mWIWTVLAobRnxa2E9i6VnZfUj7762XB6CRE3u8H9Hc4tjrCfg4QI
 fw7zTChH69xQuPBmlljdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664271723; x=
 1664358123; bh=KHMC3jjIw0Obg1T6do2/LgEIEQfzagckUj9C9bwOcq0=; b=T
 InjoSmmNTcHE8DU6cPH6C3dbgAjUTOCBHFIqxvXXpV0e9WlRTFeNmLchqC+XfcDg
 56PONvSdTZOlnijF/SJ+KPQyVaMaiRLXCz/CLpxH2qciSUmoQae5tBIQY7kGuWMa
 HGTJpO7b/qXaMzUasusaNXfI4Xd+8V5TEoN4UPVq0Nf9aqm+cMhCIUcOr8myUaEo
 Q2iBfS6hra5apyK7ukkwnYHxj5ent4k+pk/IOTxfsAyWz+H47pNxUo3R7A/RuDq4
 YxPlmf08SOd8ngoNr+mpcYjMz7c5kAuCyIueHoIaOtAy+JU/PUy40Zs+bkuKv5IN
 DpCgrZTy1hRIew0b70XeA==
X-ME-Sender: <xms:a8UyY8nhXtcU78WVB8Q_Az9oHEYzn0dVInsxlR9b-UMoAYY6mASQlw>
 <xme:a8UyY73Ugq193Kbif1fijLmvgQ2bSJQByHH95jhGyiXJ1kIcm7WjctngPLSXYujZr
 SbJlXbGVWlEkGSIB9k>
X-ME-Received: <xmr:a8UyY6q6cmc9laPNqcgS2Z2k5tCNlQ3gEBIwjmqEqFNGaBXqXkC75jVX3ZofBf9b6KpFYtbbLoQhoQ4DesEbQ-UPnjQ0ofGAAKMG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:a8UyY4miKeUv7NFpBftreFSUblJQLZ54Zhd3PoEEqVbkFpdNbg4OHA>
 <xmx:a8UyY60OUdsliHtKDsfTtPhPDEmGIXNTC8BgoUs8OqLIagb4wm2MFA>
 <xmx:a8UyY_tJFUMAX4RAdng9lyRZTYItrxBmRWxurgn9mUjtp54Ouvza6g>
 <xmx:a8UyY7KhTba_asHmm8gzjdhLjVKPImK05QejNq3LLktq46aENdWj4w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 05:42:02 -0400 (EDT)
Date: Tue, 27 Sep 2022 11:42:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927094200.2cfw2ukick3oqr4a@houat>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220927072554.y4yrmgtlaim4b5mv@houat>
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

On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> Hi Stefan,
>=20
> On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> > Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
> > > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > > Hi Marc,
> > > > >=20
> > > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > > I'm on a Raspberry Pi 3 Model B+ running current Debian tes=
ting ARM64,
> > > > > > > > using Debian's v5.19 kernel (Debian's v5.18 was working fla=
wless).
> > > > > > > >=20
> > > > > > > > | [    0.000000] Booting Linux on physical CPU 0x0000000000=
 [0x410fd034]
> > > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kerne=
l@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils =
for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > > 9-01)
> > > > > > > > | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> > > > > > > > | [    3.747500] raspberrypi-firmware soc:firmware: Attache=
d to firmware from 2022-03-24T13:21:11
> > > > > > > >=20
> > > > > > > > As soon a the vc4 module is loaded the following warnings h=
its 4
> > > > > > > > times, then the machine stops.
> > > > > > [...]
> > > > > >=20
> > > > > > > The warning itself is fixed, both upstream and in stable (5.1=
9.7).
> > > > > > Ok. Debian is using 5.19.6
> > > > > >=20
> > > > > > > It shouldn't have any relation to the hang though. Can you sh=
are your
> > > > > > > setup?
> > > > > > - config.txt:
> > > > > >=20
> > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > gpu_mem=3D16
> > > > > > disable_splash=3D1
> > > > > >=20
> > > > > > arm_64bit=3D1
> > > > > > enable_uart=3D1
> > > > > > uart_2ndstage=3D1
> > > > > >=20
> > > > > > os_prefix=3D/u-boot/
> > > > > >=20
> > > > > > [pi3]
> > > > > > force_turbo=3D1
> > > > > > -------->8-------->8-------->8-------->8--------
> > > > > >=20
> > > > > > - Raspberry Pi 3 Model B+
> > > > > > - no HDMI connected
> > > > > Does it mean, the issue only occurs without HDMI connected?
> > > > > If you didn't test with HDMI yet, could you please do?
> > > > The error occurs with HDMI not connected, as vc4 is the gfx driver I
> > > > thought this might be of interest. :)
> > > >=20
> > > > I don't have a HDMI monitor here, but I'll come back to you as soon=
 as I
> > > > get access to one (might take some time).
> > > It's not the first time an issue like this one would occur. I'm trying
> > > to make my Pi3 boot again, and will try to bisect the issue.
> >=20
> > yes the issue is only triggered without HDMI connected. I was able to
> > reproduce with an older vc4 firmware from 2020 (don't want to upgrade y=
et).
> > Kernel was also an arm64 build with defconfig.
> >=20
> > Here some rough starting point for bisection:
> >=20
> > 5.18.0 good
> > 5.19.0 bad
> > 5.19.6 bad
>=20
> Sorry it took a bit of time, it looks like I found another bug while
> trying to test this yesterday.
>=20
> Your datapoints are interesting though. I have a custom configuration
> and it does boot 5.19 without an HDMI connected.
>=20
> So I guess it leaves us with either the firmware version being different
> (I'm using a newer version, from March 2022), or the configuration. I'll
> test with defconfig.

So it turns out compiling vc4 as a module is the culprit.

It's not clear to me why at this point, but the first register write in
vc4_hdmi_reset stalls.

Maxime
