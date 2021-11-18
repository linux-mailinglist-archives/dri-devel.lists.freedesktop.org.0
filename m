Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B820B4557F9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB6F6ECFD;
	Thu, 18 Nov 2021 09:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C430E6ECFD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:26:34 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mndgc-0000UD-Nv; Thu, 18 Nov 2021 10:26:30 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
Date: Thu, 18 Nov 2021 10:26:29 +0100
Message-ID: <4310886.V3yF0ifEZO@diego>
In-Reply-To: <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 =?utf-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kever,

Am Donnerstag, 18. November 2021, 02:27:10 CET schrieb Kever Yang:
> Hi Sascha Hauer,
>=20
> On 2021/11/17 =E4=B8=8B=E5=8D=8810:33, Sascha Hauer wrote:
> > This series adds initial graphics support for the Rockchip RK356[68]
> > SoCs.  Graphics support is based around the VOP2 controller which
> > replaces the VOP controller found on earlier Rockchip SoCs. The driver
> > has been tested with HDMI support included in this series and MIPI-DSI
> > which is not included because it needs some more work. The driver is
> > taken from the downstream Rockchip kernel
>=20
> Yes, you do know this is from Rockchip kernel.
>=20
> Could you point me out where is the information about original author =20
> in your commit?

The copyrights for added files seem to have stayed intact.
=46or example the added rockchip_drm_vop2.c file in patch12
does contain the copyright as

	Copyright (c) 2020 Rockchip Electronics Co., Ltd.
	Author: Andy Yan <andy.yan@rock-chips.com>


We can of course debate if the commit-author should also be set to
Andy or another Rockchip engineer, with Sascha adding a=20
"Co-developed-by" with his credentials.

That's probably a nice compromise, I guess.


> >   and heavily polished, most non
> > standard features have been removed for now.
>=20
> I don't agree with this, we do believe you have do some clean up to meet=
=20
> the requirement
>=20
> of upstream, but all the framework and feature implement are from=20
> Rockchip engineer,
>=20
> we have made a great effort to make everything work which block us to=20
> upstream this driver for now.

I don't fully understand what you mean here (language barrier probably),
but dropping non-essential functionality in a first round is pretty common
to at least get basic functionality working for everyone. With the special
features getting added again in later patches over time. This happenened
on the old vop as well.

And of course, having a kernel that can "just" do normal graphics without
the additional features is still preferable over having _NO_ graphics suppo=
rt
at all ;-)


> NAK for this series.

As you might've seen from previous graphics related patches, there
is a big number of people _and companies_ that seems to want/need
to work with the rk3566/rk3568 with a kernel based on mainline.

=2D-> Most likely even in real products!

While Rockchip did say that they want to upstream VOP2 support, there
has been _NO_ movement or even information at all on this over at least
the last year(!), so it's pretty understandable that developers will do this
themself at some point, because they don't want to wait anymore for
something that might never happen.

So a simple "NAK" without additional information is not really helpful here.

If you don't like Sascha's series, I really want to know _WHEN_ Rockchip
plans on upstreaming at least basic graphis support themself.

The kernel is often called a do-ocracy - the one who does the work, gets
to decide. So if you really don't like Sascha's series at all, I do expect
Rockchip to step up and provide a solution themself - and in a usable
timeframe.


Heiko


