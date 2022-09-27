Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D25EBB6D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D371410E0D1;
	Tue, 27 Sep 2022 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6CA10E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 07:26:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BA83C320090F;
 Tue, 27 Sep 2022 03:25:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 27 Sep 2022 03:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1664263558; x=
 1664349958; bh=rG0aINI9gvCXTl34x98i2+pFIR07z7HNFyz++hcLbOg=; b=h
 nqF39rCFLCCm6QeQRfqPEoSA6OXkC2+1ESLYq1e94jXt+e9XyYs2JrvWz7JN0MV4
 t544BbnoKOrE9lkQ9d0G9flJM0zqL6axKchFLejNZO5VERFdFtnpEXxCrXCkNT9P
 5ZlrBSv0en+kixR3xflOsNcGrQ5ugGjEmxwiZ2rZPVAdyQl2xNha0hUB7s02lE3U
 hq+MPzuiBJyn2mjZGXZiLBkMMExM6yz1nRhwTWEK6/poKwgEKyy5CmOgH3MEVfXi
 y6egdTFHMSMOA+QgNVPiUXpw5cM0Vqqibqy0Y4/N7C3qqbmt6iRwPGGKpL+8QYP+
 zmYwwWNd28wnvjQ3E5NSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664263558; x=
 1664349958; bh=rG0aINI9gvCXTl34x98i2+pFIR07z7HNFyz++hcLbOg=; b=N
 QMKczdxYaXNqnccyT12W+mp255lc/v7FBox1pIIDsD3X1i6ztm06cy1Bys9lXcUG
 WYYq58bdK0kVJQ58/rNLVlNBO73RB2R/84klTn7VnSe8Rs/uDlibXOsT/gT+hil7
 B3LpHOTFM9jJMn1oo+13vXuYCNJzVsAuByQ5eSmLYW094GU6oF6lczQyIZOQeIcg
 HfkMsvXjW8xcSNGFREo3S8z/Cf+hHhinkM70BqX4yCOWCxbgrUm94RDHrjCI0KMr
 NAjRvuWynHVoCfffMiJvfL9Z+XQI/6ZTlVCwvuAhYXP9CC2Fuu3AGkZCkEAhsXZW
 NhwjG2/f6ObCFHcnR645g==
X-ME-Sender: <xms:haUyY46hlZg6x1QgD4mvf26gPTgU5DqE0wUJq6ANqweXB6eZ3zvW9A>
 <xme:haUyY555ucHIyQQEV9G_FQzjxNiZb8rEAbkbcSyj0Utv-BwfZTcPtHNfg84dHXXqL
 EAHE6WyVXUTtFEDY5U>
X-ME-Received: <xmr:haUyY3cURTjTfV_vI1h2xFDS5kTixQnBPfjUjc26Gd7X-5f2z-YyV5qTZx-9qZ6AC5K8jPY2RwzIkVKqFoaCczECS83DPykkl6BV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:haUyY9IMZFpLuEqx4mpENKogoRQtLkzxk_FqqPtpID_JwRNsq-EC9w>
 <xmx:haUyY8Ll-YnrUTXzRbOT9wMVFbGzyiEYhfyYzwt7TYYCrgl3IZ8fkg>
 <xmx:haUyY-y7kc_1VZkLBTAzvsuZlAoz5GukP2-gfA8DSpVlmI08FB7sww>
 <xmx:hqUyY78ITvEb_DABXfSZsfh4JJmftBgOZbR--MmDxTw6rbl5wB_VcA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Sep 2022 03:25:57 -0400 (EDT)
Date: Tue, 27 Sep 2022 09:25:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220927072554.y4yrmgtlaim4b5mv@houat>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
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

Hi Stefan,

On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
> Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> > On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
> > > On 26.09.2022 14:08:04, Stefan Wahren wrote:
> > > > Hi Marc,
> > > >=20
> > > > Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
> > > > > On 22.09.2022 17:06:00, Maxime Ripard wrote:
> > > > > > > I'm on a Raspberry Pi 3 Model B+ running current Debian testi=
ng ARM64,
> > > > > > > using Debian's v5.19 kernel (Debian's v5.18 was working flawl=
ess).
> > > > > > >=20
> > > > > > > | [    0.000000] Booting Linux on physical CPU 0x0000000000 [=
0x410fd034]
> > > > > > > | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@=
lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils fo=
r Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> > > > > > > 9-01)
> > > > > > > | [    0.000000] Machine model: Raspberry Pi 3 Model B+
> > > > > > > | [    3.747500] raspberrypi-firmware soc:firmware: Attached =
to firmware from 2022-03-24T13:21:11
> > > > > > >=20
> > > > > > > As soon a the vc4 module is loaded the following warnings hit=
s 4
> > > > > > > times, then the machine stops.
> > > > > [...]
> > > > >=20
> > > > > > The warning itself is fixed, both upstream and in stable (5.19.=
7).
> > > > > Ok. Debian is using 5.19.6
> > > > >=20
> > > > > > It shouldn't have any relation to the hang though. Can you shar=
e your
> > > > > > setup?
> > > > > - config.txt:
> > > > >=20
> > > > > -------->8-------->8-------->8-------->8--------
> > > > > gpu_mem=3D16
> > > > > disable_splash=3D1
> > > > >=20
> > > > > arm_64bit=3D1
> > > > > enable_uart=3D1
> > > > > uart_2ndstage=3D1
> > > > >=20
> > > > > os_prefix=3D/u-boot/
> > > > >=20
> > > > > [pi3]
> > > > > force_turbo=3D1
> > > > > -------->8-------->8-------->8-------->8--------
> > > > >=20
> > > > > - Raspberry Pi 3 Model B+
> > > > > - no HDMI connected
> > > > Does it mean, the issue only occurs without HDMI connected?
> > > > If you didn't test with HDMI yet, could you please do?
> > > The error occurs with HDMI not connected, as vc4 is the gfx driver I
> > > thought this might be of interest. :)
> > >=20
> > > I don't have a HDMI monitor here, but I'll come back to you as soon a=
s I
> > > get access to one (might take some time).
> > It's not the first time an issue like this one would occur. I'm trying
> > to make my Pi3 boot again, and will try to bisect the issue.
>=20
> yes the issue is only triggered without HDMI connected. I was able to
> reproduce with an older vc4 firmware from 2020 (don't want to upgrade yet=
).
> Kernel was also an arm64 build with defconfig.
>=20
> Here some rough starting point for bisection:
>=20
> 5.18.0 good
> 5.19.0 bad
> 5.19.6 bad

Sorry it took a bit of time, it looks like I found another bug while
trying to test this yesterday.

Your datapoints are interesting though. I have a custom configuration
and it does boot 5.19 without an HDMI connected.

So I guess it leaves us with either the firmware version being different
(I'm using a newer version, from March 2022), or the configuration. I'll
test with defconfig.

Maxime
