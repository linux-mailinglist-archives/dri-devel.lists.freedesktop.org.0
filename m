Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44293CBA19
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 17:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B63F6E9B9;
	Fri, 16 Jul 2021 15:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CFA6E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 15:49:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 892B15C018D;
 Fri, 16 Jul 2021 11:49:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 16 Jul 2021 11:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=QlyhJS7cdg5pdgwB1W0iaPUVjwV
 J5my34LgtTTbSpdo=; b=sxTeolfZ3vzmPne9uWyyg3XYKVw+aPJnW5N66etMp/1
 dB2XZ4bzBdMPXQamBYYpX7L5ig8z+kAc5XfGdmhmzzR58O3KVJZCuQUhQRJOBSKh
 Xewlq7qZqtqcTId8kRK/n45KF4nsr+I2PtUkhANG6TygBCh+JF+gwuBLRsJ13uns
 mlw8/VC9rTMP+0vmqo6y5yOCgrJ8Ri/aukRrBovBNVD3N9LmHnTEVpbEDJr6pNk/
 nEET1WPBp+X+KPGd0haGMTFv9Z36AvlwrRqjr0Z2EC9vTmjEI7V8LJcVhDMWbfsO
 /jxBhQmVH4WFPyGIhCGvrj8L49hE1YiZzYssD41iuEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QlyhJS
 7cdg5pdgwB1W0iaPUVjwVJ5my34LgtTTbSpdo=; b=dgZ27OfFas8q1SX7T0/qhS
 TvtCkkgvpCzShhEGryY0ehF8cj4Kcx99pj97FJ4a7YUfMjMFgHwVly4nA924wLu/
 tBnktUxwDYdTsqlv4buysMtvEKKhC7oSlcYlxfPYgEAtJcZRsNjzNCcwh+hWO7XA
 Do/NELxQzzakhyZ8+UCRsoTaF3nw+8wBJUBaHY3zj7IrsrBUWAWc2gQcS8BBN7my
 /JqVOrK4hB+GXy8Fxl2hf8gdijJE4GXVyVodx4VOGmhoZYSbBt5PkqCgzaB2PZCe
 tN1sieR13kZCDXOle2YbtFM1xqkt2pJMCJyIWROAd8ekgpoxy68Ilc4RCFx9EYQA
 ==
X-ME-Sender: <xms:f6rxYDdXZp7m6G4_CGLGUwbVvODocwIQfr0NwLusf6kg_Dy1fKbBrg>
 <xme:f6rxYJOomMQae7-u4Iz3d0ceVM6Kcoi8xFl_4EoiO6QI3urkAkkGqkDNjmPhWHgrA
 eaGffbzW5Fj6WiLS0g>
X-ME-Received: <xmr:f6rxYMgwWLUetDbNDbRygDAxUSRv1AScJZ5IaKQz9n_-GFqcgNPnmcjZ94BNocNWu5feBoTkC5yPlpFaivI0H2HJyMzVHlVHw0LC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeekgeevfeeggfdtieefieejhfdvheffkeduteehjeegfeetieehffffhfelhfeg
 hfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvges
 tggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:f6rxYE_hox9jRBduRLb4jnm2oY-vz3C3L70f4qut1YRcF7anpj2v0g>
 <xmx:f6rxYPusSyhX3qFrW5dcsJ2DaJeJnlB0iUnMM_5t3ShRS6UNN5Vhow>
 <xmx:f6rxYDHF7MfWMojeIWXtPfi-fsjNPaFXE80I7n9G7N4eX5mJEEZ3DA>
 <xmx:gKrxYDj4A9XQ1a35aFfxSsofPJkAkK4UGHIp_ymtHI3iDkLxcd6doA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jul 2021 11:49:19 -0400 (EDT)
Date: Fri, 16 Jul 2021 17:49:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Fix connector detect logic
Message-ID: <20210716154917.zpeqrd32nqcspj7g@gilmour>
References: <1625520994-11065-1-git-send-email-stefan.wahren@i2se.com>
 <20210706095807.abx3v4wkc7ymwhjx@gilmour>
 <1ecde64b-3c91-dac6-e8e2-64a45022a40e@i2se.com>
 <20210706132131.4bylrs5u2xmypjcy@gilmour>
 <0ca8564a-03b8-e13f-b4c2-468bac877e4f@i2se.com>
 <20210707131156.4wo52roj4h5bg2f6@gilmour>
 <ba487ab8-509f-a1d3-e274-5f028f51e00d@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d2p2ud56uro6c5dh"
Content-Disposition: inline
In-Reply-To: <ba487ab8-509f-a1d3-e274-5f028f51e00d@i2se.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--d2p2ud56uro6c5dh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Wed, Jul 07, 2021 at 08:01:50PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 07.07.21 um 15:11 schrieb Maxime Ripard:
> > On Tue, Jul 06, 2021 at 05:45:27PM +0200, Stefan Wahren wrote:
> >> Hi Maxime,
> >>
> >> Am 06.07.21 um 15:21 schrieb Maxime Ripard:
> >>> Hi Stefan,
> >>>
> >>> On Tue, Jul 06, 2021 at 12:48:05PM +0200, Stefan Wahren wrote:
> >>>> Am 06.07.21 um 11:58 schrieb Maxime Ripard:
> >>>>> Hi,
> >>>>>
> >>>>> On Mon, Jul 05, 2021 at 11:36:34PM +0200, Stefan Wahren wrote:
> >>>>>> Commit "drm/vc4: hdmi: Convert to gpiod" changes the behavior of
> >>>>>> vc4_hdmi_connector_detect() which results into CPU hangs in case t=
here
> >>>>>> is no HDMI connected. Let's restore the old behavior.
> >>>>>>
> >>>>>> Reported-by: Nathan Chancellor <nathan@kernel.org>
> >>>>>> Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> >>>>>> Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
> >>>>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> >>>>> I already sent this patch last week:
> >>>>>
> >>>>> https://lore.kernel.org/dri-devel/20210628124257.140453-3-maxime@ce=
rno.tech/
> >>>> oops, i only looked in the July archive.
> >>>>
> >>>>> I'm not entirely sure how this could create a CPU hang though. With=
outh
> >>>>> this patch, if the HPD GPIO is low, we would first try to retrieve =
the
> >>>>> EDID, and then if it doesn't we would read the hotplug register.
> >>>> Yes, the real issue has been revealed by the original change and this
> >>>> patch only "hides" it again.
> >>>>> The first is using a separate i2c controller (and even if it was in=
 the
> >>>>> same power domain, we have the pm_runtime_resume call), and the reg=
ister
> >>>>> read should be fine too?
> >>>> Sorry, i don't have a clue and time for further investigations.
> >>>>
> >>>> Does it mean, you are not able to reproduce this issue?
> >>> On next-20210706 at least it works fine for me without an HDMI monitor
> >>> connected, yes:
> >> which configuration do you use? Did you tried arm/multi_v7_defconfig?
> >>
> >> I tried yesterday mainline ("a180bd1d7e16173d965b263c5a536aa40afa2a2a")
> >> with multi_v7_defconfig and the issue was there.
> > I can't boot multi_v7_defconfig on my setup, but I just tested multi_v7
> > + a few options (UART, ethernet) built-in to be able to boot, and I
> > can't reproduce what you're seeing. It boots just fine without any
> > monitor attached.
>=20
> not sure how do you boot, but USB mass storage boot for Raspberry Pi 3 B
> Plus is broken since Linux 5.13 with multi_v7_defconfig [1]. But this is
> a completely different issue.
>=20
> To be more exact the hang in this case happens a few seconds after the
> UART console (ttyS1) becomes available.
>=20
> Here is my setup:
>=20
> Raspberry Pi 3 Plus
> DTS from mainline tree
> arm/multi_v7_defconfig
> Boot from SD card
> No U-Boot
> Rootfs: Raspberry Pi OS 32bit (May 7th 2021)
> VC4 firmware: 2021-04-30T13:47:07
>=20
> Maybe next week, i have a little bit more time

A bit of an update, there's other users that reported it on 5.10, and it
turns out it seems to be (partially at least) related to the options set
in config.txt.

The tracking issue is there:
https://github.com/raspberrypi/linux/issues/4457

It seems like the reason it was working for me all along is that I had
hdmi_force_hotplug set, and it looks like it makes the issue go away.
It's not clear at this point why.

Maxime

--d2p2ud56uro6c5dh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYPGqfQAKCRDj7w1vZxhR
xSN2AP9ers0mcmjfsdlNiYfK6OXSxPjeEQtcDrV961lvdxIfyAEA59lqzE9eUDcP
tpER51x+/WonB1PePJGlSIDmc3lH6gA=
=dCfl
-----END PGP SIGNATURE-----

--d2p2ud56uro6c5dh--
