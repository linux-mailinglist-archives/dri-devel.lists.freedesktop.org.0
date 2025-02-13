Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D31A34DBB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785310E0E2;
	Thu, 13 Feb 2025 18:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="eXD6QVlY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2025 18:30:33 UTC
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2171910E0E2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:30:33 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1739470860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XESgz9twUHyVSNhT10Q8A1sgdFSZwNrxK44V9F1wSyY=;
 b=eXD6QVlYZCbI39CJiNBmZxKbgLZ2ZCMbIqo5aN5UQVanZSN4yEzDI1esH2bv+uVa38TxLZ
 mmrKt8pr/HZCYCbXLhpBKn24BB+oY9Vb/AReXJTnvu/Q5vtlplefGmm/MPSUIRaDucFEk9
 Jx/cDOnq1am34NKE+8zffc3EXqCMrxA1zXL/57UTcAYDeMhx0+f5G6NPbXrMf97jbzn2Mn
 vpBj9GNNzVZtO+lYy0EA6kzgYd02oxDqyBvuATvINC69xS4Jf6PvSIo5+W9cfGni0p4xu2
 5PkqQJomY2vFcVhw7OEItbHb8jPP9PgRje7X2FhhzxSmQR7BxA0dSfUw4SvHPg==
Content-Type: multipart/signed;
 boundary=d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 13 Feb 2025 19:20:49 +0100
Message-Id: <D7RIYCL3ZCLT.2NAZXUAH4EQC9@cknow.org>
Cc: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>, "Damon Ding"
 <damon.ding@rock-chips.com>, <heiko@sntech.de>, <robh@kernel.org>,
 <conor+dt@kernel.org>, <algea.cao@rock-chips.com>, <rfoss@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <hjc@rock-chips.com>,
 <kever.yang@rock-chips.com>, <dmitry.baryshkov@linaro.org>,
 <vkoul@kernel.org>, <andy.yan@rock-chips.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <l.stach@pengutronix.de>
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
 <m3ovwhg3h2njsjpuj2wdahxex6zq2udmxonublgmnlrdfred4z@zxtyd6xvhram>
In-Reply-To: <m3ovwhg3h2njsjpuj2wdahxex6zq2udmxonublgmnlrdfred4z@zxtyd6xvhram>
X-Migadu-Flow: FLOW_OUT
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

--d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Feb 13, 2025 at 6:33 PM CET, Sebastian Reichel wrote:
> On Thu, Feb 13, 2025 at 05:56:55PM +0100, Diederik de Haas wrote:
>> On Thu Feb 13, 2025 at 3:54 PM CET, Piotr Oniszczuk wrote:
>> > I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx boar=
d with 6.14 mainline.
>> >
>> > rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1 eDP w=
ith ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
>> > (see page3 & page29 at https://dl.radxa.com/rock5/5itx/v1110/radxa_roc=
k_5itx_v1110_schematic.pdf)
>> >
>> > I=E2=80=99m on 6.14-rc2 with applied:=20
>> > [1] Cristicc hdmi code (https://gitlab.collabora.com/cristicc/linux-ne=
xt/-/commits/rk3588-hdmi-bridge)
>> > [2] eDP support for RK3588 (https://patchwork.kernel.org/project/linux=
-rockchip/list/?series=3D927765)
>> > [3] Add eDP mode support for Rockchip Samsung HDPTX PHY (https://patch=
work.kernel.org/project/linux-rockchip/cover/20250205105157.580060-1-damon.=
ding@rock-chips.com/)
>> >
>>=20
>> I don't know if it's relevant, but while HDMI0 got enabled for quite a
>> few devices in 6.13, it did NOT get enabled for Rock 5 ITX.
>> I made a local patch (which does the same thing as was done for Rock 5B)
>> but I have no idea if it actually works (I don't have the board).
>
> I don't have the board either, but the schematics suggests that your
> patch is not correct. On the Rock 5 ITX the RK3588's first HDMI/eDP
> port should be enabled in eDP mode to be used with an eDP panel via
> connector J11. This series is needed for that.

Ah, then there was more to it then simply being overlooked/forgotten.
Thanks for the clarification :-)

Cheers,
  Diederik

--d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ644BQAKCRDXblvOeH7b
btWkAQD7Rnz8K732UfDax3W2h4oUDuihiz5E2yvEznxKy0T19AD/Y9CH2/9L+kd9
PlmYF17ranxTt4f2UCjh5/ZVNS9Mdgw=
=MIH8
-----END PGP SIGNATURE-----

--d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3--
