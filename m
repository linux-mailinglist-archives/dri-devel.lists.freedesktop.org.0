Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126B5B880
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 11:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9389CB9;
	Mon,  1 Jul 2019 09:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B0B89CB9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 09:58:53 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 300BB1BF21C;
 Mon,  1 Jul 2019 09:58:42 +0000 (UTC)
Date: Mon, 1 Jul 2019 11:58:42 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190701095842.fvganvycce2cy7jn@flea>
References: <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de>
 <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
MIME-Version: 1.0
In-Reply-To: <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1068295652=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1068295652==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwl7bnhaabkczsql"
Content-Disposition: inline


--rwl7bnhaabkczsql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

On Fri, Jun 28, 2019 at 12:39:32PM +0200, Andrzej Hajda wrote:
> On 12.06.2019 17:20, Maxime Ripard wrote:
> >> I am not sure if I understand whole discussion here, but I also do not
> >> understand whole edp-connector thing.
> > The context is this one:
> > https://patchwork.freedesktop.org/patch/257352/?series=51182&rev=1
> > https://patchwork.freedesktop.org/patch/283012/?series=56163&rev=1
> > https://patchwork.freedesktop.org/patch/286468/?series=56776&rev=2
> >
> > TL;DR: This bridge is being used on ARM laptops that can come with
> > different eDP panels. Some of these panels require a regulator to be
> > enabled for the panel to work, and this is obviously something that
> > should be in the DT.
> >
> > However, we can't really describe the panel itself, since the vendor
> > uses several of them and just relies on the eDP bus to do its job at
> > retrieving the EDIDs. A generic panel isn't really working either
> > since that would mean having a generic behaviour for all the panels
> > connected to that bus, which isn't there either.
> >
> > The connector allows to expose this nicely.
>
> As VESA presentation says[1] eDP is based on DP but is much more
> flexible, it is up to integrator (!!!) how the connection, power
> up/down, initialization sequence should be performed. Trying to cover
> every such case in edp-connector seems to me similar to panel-simple
> attempt failure. Moreover there is no such thing as physical standard
> eDP connector. Till now I though DT connector should describe physical
> connector on the device, now I am lost, are there some DT bindings
> guidelines about definition of a connector?

This might be semantics but I guess we're in some kind of grey area?

Like, for eDP, if it's soldered I guess we could say that there's no
connector. But what happens if for some other board, that signal is
routed through a ribbon?

You could argue that there's no physical connector in both cases, or
that there's one in both, or one for the ribbon and no connector for
the one soldered in.

> Maybe instead of edp-connector one would introduce integrator's specific
> connector, for example with compatible "olimex,teres-edp-connector"
> which should follow edp abstract connector rules? This will be at least
> consistent with below presentation[1] - eDP requirements depends on
> integrator. Then if olimex has standard way of dealing with panels
> present in olimex/teres platforms the driver would then create
> drm_panel/drm_connector/drm_bridge(?) according to these rules, I guess.
> Anyway it still looks fishy for me :), maybe because I am not
> familiarized with details of these platforms.

That makes sense yes

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--rwl7bnhaabkczsql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRnZUgAKCRDj7w1vZxhR
xQ/8AQCtFPO8zhV4+U5EfDXkE+JHOXvpVHx/qJISWs88VLbjXAD+PhSV9xHUBgZC
Wga4ICpNkMVIAA056iwnPqJ5wScM6Qc=
=ijEm
-----END PGP SIGNATURE-----

--rwl7bnhaabkczsql--

--===============1068295652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1068295652==--
