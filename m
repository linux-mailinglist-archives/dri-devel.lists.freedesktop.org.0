Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5BA4AD56
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 19:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D5E10E11A;
	Sat,  1 Mar 2025 18:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="RAXDiiw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2F310E11A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 18:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HbQ1yPq8BeEqX0CXAVNZ0UfzgnFZIeuoYkVsuEjiOew=; b=RAXDiiw1szmRllTLCsfWYIkABt
 5M8maW8X5dftva5kJfNjYhbrEiREaIWbM3x+REQqlJL7bcCn1Z10xqzpbfZvPVIT45jUIVO9A+eKG
 Cbz3lXNaXNOS3gfbZe/yiGJh+8tRby+A2h95UQq9uCqY9eh9Jwqza2aZ3B1OkJ5Ub9JEF0RIv0vGP
 C/ExROWSCvB54jyp+5F+wTqmDq8p07T70hGukeIUGZH3yPeWFM+I9IDYdziOdyfh7/J5UvhOXmvm9
 hpVnlBWNUkTlOZvyvlyvemfMDjWahGTZ48J0KUdCFiVEthOngTmp8xf9oJHRfGF9ogTWYCH9m137n
 x7hiSpMw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1toRZ4-0001tc-FW; Sat, 01 Mar 2025 19:27:54 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
 Chen-Yu Tsai <wens@csie.org>, FUKAUMI Naoki <naoki@radxa.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
Date: Sat, 01 Mar 2025 19:27:52 +0100
Message-ID: <23891130.6Emhk5qWAg@diego>
In-Reply-To: <0A30138B-183E-4816-80FF-AACDCFE3B3A6@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <3337030.aeNJFYEL58@trenzalore>
 <0A30138B-183E-4816-80FF-AACDCFE3B3A6@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Samstag, 1. M=C3=A4rz 2025, 10:11:54 MEZ schrieb Piotr Oniszczuk:
>=20
> > Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova <detlev.casanova@col=
labora.com> w dniu 25 lut 2025, o godz. 15:58:
> >=20
> > From what I see, the error is not present anymore on linux 6.14-rc4. I =
tried=20
> > reverting your patch "ASoC: simple-card-utils.c: add missing dlc->of_no=
de"=20
> > (dabbd325b25edb5cdd99c94391817202dd54b651) and the error reappears.
>=20
> Guys,
>=20
> Just FYI:
>=20
> On 6.14-rc4 without 0001-ASoC-simple-card-utils-Don-t-use-__free-device_n=
ode-.patch - i still have oops like this: https://gist.github.com/warpme/ed=
75c05d3b68f995d429dbd9097005ba
> They are happening not every boot - but still happening.
>=20
> However applying 0001-ASoC-simple-card-utils-Don-t-use-__free-device_node=
=2D.patch (with some adaptations as it not applies cleanly on 6.140rc4) - d=
mesg becomes clean (10 boots; all ok)

that patch was submitted yesterday [0], so hopefully will make its
way into 6.14-rc next week or so.



[0] https://lore.kernel.org/all/87eczisyhh.wl-kuninori.morimoto.gx@renesas.=
com/T/#me866307a928c2d592a2ba883867f028c5c8b9b40


