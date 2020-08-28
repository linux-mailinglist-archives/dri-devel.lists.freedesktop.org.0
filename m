Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65619256641
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959C56E1A3;
	Sat, 29 Aug 2020 09:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DBC6E48C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1598617280; bh=NDdup/+089plEBW+jyGfrQ2zgz1ZcQugtWmPbMt6ZPo=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=hDWe7jeFkV5vZk+D3NVJ2l0MuQLpT6+3NXep2bKmu5LzLvFm4wrkm00rtLKpOVcwM
 JjoQHXAHEAuFoHAkLhYzOBm46wCQ+OgDR/huBtM/0vJr2SBEYVF7Jh7QNLcEsNdhwq
 7hX35JFivKXGlzClTOVnd14xWupxbo31HuQhPAh4=
Date: Fri, 28 Aug 2020 14:21:19 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 13/14] [DO NOT MERGE] arm64: dts: allwinner: h6: Add
 GPU OPP table
Message-ID: <20200828122119.eadup4aiohnqldam@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
 <20200704102535.189647-14-peron.clem@gmail.com>
 <20200704121301.jfd3m3jnlghmddg4@gilmour.lan>
 <CAJiuCceMS__bNVO54E2OYnqnaOAL9pGkxRo4XAABiyqagaEtmw@mail.gmail.com>
 <CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+47htg2bA@mail.gmail.com>
 <20200824131133.hp3resve6c3r3xqq@gilmour.lan>
 <CAJiuCce=Oh-vtR8u-RvAvtAb2ZqSfK6jY+cQ6wBBh7maN30Wfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJiuCce=Oh-vtR8u-RvAvtAb2ZqSfK6jY+cQ6wBBh7maN30Wfg@mail.gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 02:16:36PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Maxime,
> =

> On Tue, 25 Aug 2020 at 15:35, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Clement,
> >
> > On Mon, Aug 03, 2020 at 09:54:05AM +0200, Cl=E9ment P=E9ron wrote:
> > > Hi Maxime and All,
> > >
> > > On Sat, 4 Jul 2020 at 16:56, Cl=E9ment P=E9ron <peron.clem@gmail.com>=
 wrote:
> > > >
> > > > Hi Maxime,
> > > >
> > > > On Sat, 4 Jul 2020 at 14:13, Maxime Ripard <maxime@cerno.tech> wrot=
e:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Sat, Jul 04, 2020 at 12:25:34PM +0200, Cl=E9ment P=E9ron wrote:
> > > > > > Add an Operating Performance Points table for the GPU to
> > > > > > enable Dynamic Voltage & Frequency Scaling on the H6.
> > > > > >
> > > > > > The voltage range is set with minival voltage set to the target
> > > > > > and the maximal voltage set to 1.2V. This allow DVFS framework =
to
> > > > > > work properly on board with fixed regulator.
> > > > > >
> > > > > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > > >
> > > > > That patch seems reasonable, why shouldn't we merge it?
> > > >
> > > > I didn't test it a lot and last time I did, some frequencies looked=
 unstable.
> > > > https://lore.kernel.org/patchwork/cover/1239739/
> > > >
> > > > This series adds regulator support to Panfrost devfreq, I will send=
 a
> > > > new one if DVFS on the H6 GPU is stable.
> > > >
> > > > I got this running glmark2 last time
> > > > # glmark2-es2-drm
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > >     glmark2 2017.07
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > >     OpenGL Information
> > > >     GL_VENDOR:     Panfrost
> > > >     GL_RENDERER:   Mali T720 (Panfrost)
> > > >     GL_VERSION:    OpenGL ES 2.0 Mesa 20.0.5
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > [   93.550063] panfrost 1800000.gpu: GPU Fault 0x00000088 (UNKNOWN)=
 at
> > > > 0x0000000080117100
> > > > [   94.045401] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
> > > > config=3D0x3700, status=3D0x8, head=3D0x21d6c00, tail=3D0x21d6c00,
> > > > sched_job=3D00000000e3c2132f
> > > >
> > > > [  328.871070] panfrost 1800000.gpu: Unhandled Page fault in AS0 at=
 VA
> > > > 0x0000000000000000
> > > > [  328.871070] Reason: TODO
> > > > [  328.871070] raw fault status: 0xAA0003C2
> > > > [  328.871070] decoded fault status: SLAVE FAULT
> > > > [  328.871070] exception type 0xC2: TRANSLATION_FAULT_LEVEL2
> > > > [  328.871070] access type 0x3: WRITE
> > > > [  328.871070] source id 0xAA00
> > > > [  329.373327] panfrost 1800000.gpu: gpu sched timeout, js=3D1,
> > > > config=3D0x3700, status=3D0x8, head=3D0xa1a4900, tail=3D0xa1a4900,
> > > > sched_job=3D000000007ac31097
> > > > [  329.386527] panfrost 1800000.gpu: js fault, js=3D0,
> > > > status=3DDATA_INVALID_FAULT, head=3D0xa1a4c00, tail=3D0xa1a4c00
> > > > [  329.396293] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
> > > > config=3D0x3700, status=3D0x58, head=3D0xa1a4c00, tail=3D0xa1a4c00,
> > > > sched_job=3D0000000004c90381
> > > > [  329.411521] panfrost 1800000.gpu: Unhandled Page fault in AS0 at=
 VA
> > > > 0x0000000000000000
> > > > [  329.411521] Reason: TODO
> > > > [  329.411521] raw fault status: 0xAA0003C2
> > > > [  329.411521] decoded fault status: SLAVE FAULT
> > > > [  329.411521] exception type 0xC2: TRANSLATION_FAULT_LEVEL2
> > > > [  329.411521] access type 0x3: WRITE
> > > > [  329.411521] source id 0xAA00
> > >
> > > Just to keep a track of this issue.
> > >
> > > Piotr Oniszczuk give more test and seems to be software related:
> > > https://www.spinics.net/lists/dri-devel/msg264279.html
> > >
> > > Ondrej gave a great explanation about a possible origin of this issue:
> > > https://freenode.irclog.whitequark.org/linux-sunxi/2020-07-11
> > >
> > > 20:12 <megi> looks like gpu pll on H6 is NKMP clock, and those are
> > > implemented in such a way in mainline that they are prone to
> > > overshooting the frequency during output divider reduction
> > > 20:13 <megi> so disabling P divider may help
> > > 20:13 <megi> or fixing the dividers
> > > 20:14 <megi> and just allowing N to change
> > > 20:22 <megi> hmm, I haven't looked at this for quite some time, but H6
> > > BSP way of setting PLL factors actually makes the most sense out of
> > > everything I've seen/tested so far
> > > 20:23 <megi> it waits for lock not after setting NK factors, but after
> > > reducing the M factor (pre-divider)
> > > 20:24 <megi> I might as well re-run my CPU PLL tester with this
> > > algorithm, to see if it fixes the lockups
> > > 20:26 <megi> it makes sense to wait for PLL to stabilize "after"
> > > changing all the factors that actually affect the VCO, and not just
> > > some of them
> > > 20:27 <megi> warpme_: ^
> > > 20:28 <megi> it may be the same thing that plagues the CPU PLL rate
> > > changes at runtime
> >
> > I guess it's one of the bugs we never heard of...
> >
> > It would be a good idea to test it on another platform (like Rockchip?)
> > to rule out any driver issue?
> >
> > What do you think?
> =

> I can't exclude a bug in the driver, but if it was the case LE
> community or Panfrost maintainer would have heard of that.
> =

> Megi's explanations match what I observed.
> NKMP drivers seem the perfect guilty here or maybe it's a combination of =
both...
> =

> Jernej sent me this patch to test:
> https://github.com/clementperon/linux/commit/56bde359beaf8e827ce53ede1fe4=
a0ad233cb79b
> But it didn't fix the issue, If someone want to have a look at it :)

Not sure how that patch is supposed to work, but it seems to apply
all factors at once to me.

regards,
	o.

> Regards,
> Clement
> =

> >
> > Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
