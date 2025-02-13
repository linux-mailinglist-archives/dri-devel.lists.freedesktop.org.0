Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18531A34BFA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD2F10E0D7;
	Thu, 13 Feb 2025 17:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="gHt2sI3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BC010E0D7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739467992; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fsZ9tyPjguNsUc2+X1eFr5QgUPWPBVzABYeF+VSOoUx8sOk2o9TIpuy6IFgXZUjG9vZWe2oUATvThyog4cB1QGSF+7jMYZN0kw9K4ETfX3PdZ8MffVDq/wZ0EpgjNyprDhV/ILksMWZTFad0oAv+bAEhZnMftm6shmu4Q2uh+DQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739467992;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6ByzMOuDBh5R+FUdNwn2gk3LwiXzk/aPZNyTOpzuZOU=; 
 b=bta+8ZPQPOcCe9SZHB2yjLV1NS6qrkM+JiDqDJdXEM7/kUS9MuT5tKC+9VCVfIfzD8aCiVovVkZOSqExBy9M8mRQ2Z1mRt6G56DXfOz4tq350B3ZIYmhlv8R4Xu045K9k3bY3npdzZbBAxK2WJU2vsEIWL+tbEYKPRv8yV6terI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739467992; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=6ByzMOuDBh5R+FUdNwn2gk3LwiXzk/aPZNyTOpzuZOU=;
 b=gHt2sI3u9x/IyIOL7Gz7LHOOPs0dHmzj8DCoJ1j0HswtKdfzbJT6zBFQ67GzwLvu
 MPP/pAtZ4COd1DYdY5C/SpKgmnR6xnfTJ29gG6h2mt4W0K63gqqZ94CkCqga8aVXh6i
 twwysP6rbc9WuqaBcE7MNq1IW8GqH8cgBGP/ll5k=
Received: by mx.zohomail.com with SMTPS id 1739467989609795.4274306368665;
 Thu, 13 Feb 2025 09:33:09 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
 id 858F21806DE; Thu, 13 Feb 2025 18:33:04 +0100 (CET)
Date: Thu, 13 Feb 2025 18:33:04 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, 
 Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, 
 algea.cao@rock-chips.com, rfoss@kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kever.yang@rock-chips.com,
 dmitry.baryshkov@linaro.org, vkoul@kernel.org, andy.yan@rock-chips.com,
 krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
Message-ID: <m3ovwhg3h2njsjpuj2wdahxex6zq2udmxonublgmnlrdfred4z@zxtyd6xvhram>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6djyuz6okfpd5ae6"
Content-Disposition: inline
In-Reply-To: <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/239.467.69
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6djyuz6okfpd5ae6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
MIME-Version: 1.0

Hi,

On Thu, Feb 13, 2025 at 05:56:55PM +0100, Diederik de Haas wrote:
> On Thu Feb 13, 2025 at 3:54 PM CET, Piotr Oniszczuk wrote:
> >
> >
> >> Wiadomo=C5=9B=C4=87 napisana przez Damon Ding <damon.ding@rock-chips.c=
om> w dniu 23 sty 2025, o godz. 11:07:
> >>=20
> >> Picked from:
> >> https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D923=
593
> >>=20
> >> These patchs have been tested with a 1536x2048p60 eDP panel on
> >> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> >> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> >> on RK3399 sapphire excavator board.
> >> ...
> >> 9 files changed, 401 insertions(+), 89 deletions(-)
> >>=20
> >> --=20
> >> 2.34.1
> >>=20
> >
> > Damon,
> >
> > I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx board=
 with 6.14 mainline.
> >
> > rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1 eDP wi=
th ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
> > (see page3 & page29 at https://dl.radxa.com/rock5/5itx/v1110/radxa_rock=
_5itx_v1110_schematic.pdf)
> >
> > I=E2=80=99m on 6.14-rc2 with applied:=20
> > [1] Cristicc hdmi code (https://gitlab.collabora.com/cristicc/linux-nex=
t/-/commits/rk3588-hdmi-bridge)
> > [2] eDP support for RK3588 (https://patchwork.kernel.org/project/linux-=
rockchip/list/?series=3D927765)
> > [3] Add eDP mode support for Rockchip Samsung HDPTX PHY (https://patchw=
ork.kernel.org/project/linux-rockchip/cover/20250205105157.580060-1-damon.d=
ing@rock-chips.com/)
> >
> > Is edp1 supported by yours [2] series?
> >
> > If yes - may you pls hint me about required dts additions in https://gi=
t.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot=
/dts/rockchip/rk3588-rock-5-itx.dts?h=3Dv6.14-rc2 ?
>=20
> I don't know if it's relevant, but while HDMI0 got enabled for quite a
> few devices in 6.13, it did NOT get enabled for Rock 5 ITX.
> I made a local patch (which does the same thing as was done for Rock 5B)
> but I have no idea if it actually works (I don't have the board).

I don't have the board either, but the schematics suggests that your
patch is not correct. On the Rock 5 ITX the RK3588's first HDMI/eDP
port should be enabled in eDP mode to be used with an eDP panel via
connector J11. This series is needed for that.

Greetings,

-- Sebastian

--6djyuz6okfpd5ae6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmeuLNAACgkQ2O7X88g7
+pqj/g/+Ko9YwegFYiHHFc2NJHqSn9Er7V2IhdDxANKuYmDWkl238DIkPbx5N++z
dP6qxCV8/YD123iERKtHSvIikWgw7rRaV8GKkT95xc3AAfYfyt4Zjf3wWwwOrNXH
w1UK+68lroyq4n+JPwQuZlkRhKclMpv78w5lZJ2fXX/ni8PWf3m8DyBGzES03yDK
l5e0sp6dEFaxL6plKIDdB7Xw/CYW75UiJStCuBYKka1pr3I5X8IgWMuQ+oK5Lde3
hzO/3TLG9WKTiRoehs4ocJngsz0sS8o70GWVMXSiSybaMbK0NEf6NonBv1f6hA0J
RrCYZGZEsKaPnveI+HlwnvXJlTnISIjs2jw7HF35HSVl4ZaYLf9k4HFE6vrl+y7N
GPplG9bzgVKsZgK5rv1ddxBQbMZ30LlyP1/BxDPqY/78+ZyFg/9vjovfF7rG6DUa
KIgcrgB/rD/4P1wdOGhz+bwbi2mwsc0yfzAWS6qXxCw70RQ0YNKhE/ha5cM0bfwh
IyKOUaxLceZBVLXuXXXKo1aeOxLHiVSB+kblT/Dq85b4Vl71n5v81x/jfo47O80Z
LjNdgoLngofz67wKl+BHJsJAvtRvXP/NI9nNpsSgY1tLzUeKsnllS1mWYh3WE24u
vPH7IuyON+11TRur6JqaEd5LbafrMcQ2+Fqz0UdscgafmzsTyTw=
=1OmE
-----END PGP SIGNATURE-----

--6djyuz6okfpd5ae6--
