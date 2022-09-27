Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C65EC1B5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABC310E5AA;
	Tue, 27 Sep 2022 11:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E512B10E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:42:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5CFD93200954;
 Tue, 27 Sep 2022 07:42:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 27 Sep 2022 07:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664278963; x=
 1664365363; bh=tlcz0IBDdRZRsD3y2DUiHDtFNT81SI5DbxHjOC2dB6Q=; b=L
 JM6n+mmuFWKp+bzgSakSbbf8f81AfgrGknS9wttW30uMW1jU/Gz9+IAaL5q6zS6o
 oTID6v3OUVLQ1acltIw4LRn9BL63/dzCNye6LWCmsnAJ+mrWrfBU1XTtQhDfoPtE
 9VmDbgTPbNrRHximccCyGNdk3g7vdxu16gFbvtJ5kyD4agGbvrNEi5uU10KHfcDZ
 ReapawXuDcgHDvg6wMP6OgQfXoU+VZD4XmICuLSTKCN0lrgpN7F5tuDZ6wr8bNJs
 I7tVpxRqbplDcvPPvF3UkW3CO+HfV+Q/Wtpsaf4J54fKbcseqVFPdaMjYryoMHfd
 sGN/N/VbJwqGy7ACWy3mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664278963; x=
 1664365363; bh=tlcz0IBDdRZRsD3y2DUiHDtFNT81SI5DbxHjOC2dB6Q=; b=E
 OD+CK3OIMP83Eo0ktLMCVOJQkswF6dyhk1DhzFE2III2NPNFAyJEvB17Wrc/Ya6N
 meR1RlJ2Fq0CEYaVhwFt/on396cpqsFynK05O8CxtbahiK1Gc7xieqYVLQSelfIc
 WOEfGjc//6aGGU7lKvFopaJ/Nkx1wJ+KV752it1mae4jvD6BpnDG/pvWhBK2lc2S
 u0FXUF5SQqKzsnuWxiRVyW5iVyA3i52gvNkHZsWAzoIiL4DK8WOv59uY5pfuvxl6
 C9Bqw3gGryXd9oOdVVDgXMiudKRyaIA3RVSs7+6TYwV5z9javBuqyRb9+fBda25E
 GQ4WwT/ALHYmmuzU61dvw==
X-ME-Sender: <xms:s-EyY7K7LALXGSkGns0UBBwfsWKAr55h_Hv96ISUQO6DPw8jg1h0Sw>
 <xme:s-EyY_Lyu8n1o19FOcclw59nDBCBCfURHWJTxRvFcoe3jp5BiLFIA0rrTJ3CuBnaW
 9lrpbcfxkHBV8j1cf4>
X-ME-Received: <xmr:s-EyYzs1xIsjiGAzhorLz13xt6dsGjsOBALNTYXRw9esNY9ysc9LPoc6DS19Y_djoFJKJ7MulhS5WkID5HqfJvqsvo-KmOH1XYeu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
 feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:s-EyY0YYpUuUmbh8rB7dOHn9cmGip5qjxkhI9K2JiuvdB5eqGCwrzw>
 <xmx:s-EyYyb-5dkHFfCjAchNq_sTbgYpuesLiAO8dlPlN9s6wJIU-RG2uQ>
 <xmx:s-EyY4D2MSmY_xe7IL9Fk9NL0BzA5e3J75nnWcXpQbBp6ATHTPx8ng>
 <xmx:s-EyY4Pipnswmk0j0MfA1zlTmyz8BAEI0dDT6RB4j1Byc4RjQxg14A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 07:42:43 -0400 (EDT)
Date: Tue, 27 Sep 2022 13:42:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927114240.xilpcte2s3b5bmcf@houat>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
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

On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
> Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> > On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
> > > Hi Stefan,
> > >=20
> > > On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> > > > Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > > > > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
> > > > > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > > > > Hi Marc,
> > > > > > >=20
> > > > > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > > > > I'm on a Raspberry Pi 3 Model B+ running current Debian=
 testing ARM64,
> > > > > > > > > > using Debian's v5.19 kernel (Debian's v5.18 was working=
 flawless).
> > > > > > > > > >=20
> > > > > > > > > > | [    0.000000] Booting Linux on physical CPU 0x000000=
0000 [0x410fd034]
> > > > > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debian-k=
ernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binut=
ils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > > > > 9-01)
> > > > > > > > > > | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> > > > > > > > > > | [    3.747500] raspberrypi-firmware soc:firmware: Att=
ached to firmware from 2022-03-24T13:21:11
> > > > > > > > > >=20
> > > > > > > > > > As soon a the vc4 module is loaded the following warnin=
gs hits 4
> > > > > > > > > > times, then the machine stops.
> > > > > > > > [...]
> > > > > > > >=20
> > > > > > > > > The warning itself is fixed, both upstream and in stable =
(5.19.7).
> > > > > > > > Ok. Debian is using 5.19.6
> > > > > > > >=20
> > > > > > > > > It shouldn't have any relation to the hang though. Can yo=
u share your
> > > > > > > > > setup?
> > > > > > > > - config.txt:
> > > > > > > >=20
> > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > > gpu_mem=3D16
> > > > > > > > disable_splash=3D1
> > > > > > > >=20
> > > > > > > > arm_64bit=3D1
> > > > > > > > enable_uart=3D1
> > > > > > > > uart_2ndstage=3D1
> > > > > > > >=20
> > > > > > > > os_prefix=3D/u-boot/
> > > > > > > >=20
> > > > > > > > [pi3]
> > > > > > > > force_turbo=3D1
> > > > > > > > -------->8-------->8-------->8-------->8--------
> > > > > > > >=20
> > > > > > > > - Raspberry Pi 3 Model B+
> > > > > > > > - no HDMI connected
> > > > > > > Does it mean, the issue only occurs without HDMI connected?
> > > > > > > If you didn't test with HDMI yet, could you please do?
> > > > > > The error occurs with HDMI not connected, as vc4 is the gfx dri=
ver I
> > > > > > thought this might be of interest. :)
> > > > > >=20
> > > > > > I don't have a HDMI monitor here, but I'll come back to you as =
soon as I
> > > > > > get access to one (might take some time).
> > > > > It's not the first time an issue like this one would occur. I'm t=
rying
> > > > > to make my Pi3 boot again, and will try to bisect the issue.
> > > > yes the issue is only triggered without HDMI connected. I was able =
to
> > > > reproduce with an older vc4 firmware from 2020 (don't want to upgra=
de yet).
> > > > Kernel was also an arm64 build with defconfig.
> > > >=20
> > > > Here some rough starting point for bisection:
> > > >=20
> > > > 5.18.0 good
> > > > 5.19.0 bad
> > > > 5.19.6 bad
> > > Sorry it took a bit of time, it looks like I found another bug while
> > > trying to test this yesterday.
> > >=20
> > > Your datapoints are interesting though. I have a custom configuration
> > > and it does boot 5.19 without an HDMI connected.
> > >=20
> > > So I guess it leaves us with either the firmware version being differ=
ent
> > > (I'm using a newer version, from March 2022), or the configuration. I=
'll
> > > test with defconfig.
> > So it turns out compiling vc4 as a module is the culprit.
>=20
> Do you mean regardless of the kernel version in your case?

No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn't, like
Marc said. But if vc4 is built in, both work.

> In my test cases i build vc4 always as module.
>=20
> > It's not clear to me why at this point, but the first register write in
> > vc4_hdmi_reset stalls.
>
> Sounds like timing issue or a missing dependency (clock or power domain)

It felt like a clock or power domain issue to me indeed, but adding
clk_ignore_unused and pd_ignore_unused isn't enough, so it's probably
something a bit more complicated than just the clock / PD being
disabled.

Maxime
