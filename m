Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A125CE54FF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5034911A205;
	Sun, 28 Dec 2025 17:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="WHZlmT6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF1E11A205
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=ZUQu9H3WOitPzhsM/on3IIDEdJMpjoQS/NL13XajIJo=; b=WHZlmT6ZqPwvymsvsdX7U4GOme
 6fXTq9+nNj5l1mj8weFPe7Lv2qIJ7R+7rzeqKj0CIn/Ghm5Hk5I8SBt/RCNZTuN3EDKR7UDmwQjLD
 p0DfueNyach9h/Shjh3mrILmgpjAPMJ4r4g0LDuK2eOCUb0cafS1Q6rQP4nltnzZYtx8tXmU6Im52
 11dH5ihSkg3VhfzjaB/1Lx2sUfn8W5VEVSjGnFJyeEPCLjxlVRsJayZtgRzH5/Iq98U5aOQjfaSaN
 itxrDDQ2rTwfyfzUtf5KEmAFHow2/b/WKe3bYotuB14170LgNf0Gu2Vh7yGelJljXEHeNTgwFRr9i
 XOoqR8nA==;
Received: from i53875bca.versanet.de ([83.135.91.202] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vZulP-000Ta3-Dc; Sun, 28 Dec 2025 18:41:08 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Han Gao <rabenda.cn@gmail.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
Date: Sun, 28 Dec 2025 18:41:06 +0100
Message-ID: <2776792.KRxA6XjA2N@diego>
In-Reply-To: <3b5fd30554f91bcd083b2dc450cdf7fe2fa395e2.camel@iscas.ac.cn>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <5ce9d611.1868.19b5e9e7a61.Coremail.andyshrk@163.com>
 <3b5fd30554f91bcd083b2dc450cdf7fe2fa395e2.camel@iscas.ac.cn>
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

Am Samstag, 27. Dezember 2025, 08:22:05 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Icenowy Zheng:
> =E5=9C=A8 2025-12-27=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 15:03 +0800=EF=
=BC=8CAndy Yan=E5=86=99=E9=81=93=EF=BC=9A
> >=20
> >=20
> > Hello=EF=BC=8C
> >=20
> > =E5=9C=A8 2025-12-26 21:27:53=EF=BC=8C"Icenowy Zheng" <zhengxingda@isca=
s.ac.cn> =E5=86=99=E9=81=93=EF=BC=9A
> > > =E5=9C=A8 2025-12-25=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 19:07 +0800=
=EF=BC=8CAndy Yan=E5=86=99=E9=81=93=EF=BC=9A
> > > >=20
> > > >=20
> > > > Hello Icenowy:
> > > >=20
> > > > At 2025-12-25 00:12:01, "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
> > > > wrote:
> > > > > From: Icenowy Zheng <uwu@icenowy.me>
> > > > >=20
> > > > > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI
> > > > > controller
> > > > > (paired
> > > > > with DesignWare HDMI TX PHY Gen2) that takes the "DP" output
> > > > > from
> > > > > the
> > > > > display controller.
> > > > >=20
> > > > > Add a driver for this controller utilizing the common
> > > > > DesignWare
> > > > > HDMI
> > > > > code in the kernel.
> > > > >=20
> > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > ---
> > > > > No changes in v3, v4.
> > > > >=20
> > > > > Changes in v2:
> > > > > - Created a new function to set PHY parameters and refactored
> > > > > the
> > > > >  control flow of the configure_phy callback.
> > > > >=20
> > > > > MAINTAINERS                             |   1 +
> > > > > drivers/gpu/drm/bridge/Kconfig          |  10 ++
> > > > > drivers/gpu/drm/bridge/Makefile         |   1 +
> > > > > drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173
> > > > > ++++++++++++++++++++++++
> > > > > 4 files changed, 185 insertions(+)
> > > > > create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> > > >=20
> > > >=20
> > > > As this is a Synopsys DesignWare based IP, maybe it's better to
> > > > put
> > > > it under   "drivers/gpu/drm/bridge/synopsys/"
> > > > Or just create a dir for thead, I think there will come other
> > > > display
> > > > related drivers for thead in the future.
> > >=20
> > > It's not proper to place vendor glues to synopsys/ .
> >=20
> >=20
> > TI has precedents for doing this with Cadence IP=EF=BC=8C see=20
> >=20
> > drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-j721e.c=20
>=20
> Well for this kind of things, I prefer to hear from the maintainer of
> DW HDMI bridges (although it seems that this has no dedicated
> MAINTAINERS entry and get_maintainers just returns people for DRM
> DRIVERS FOR BRIDGE CHIPS).

I think the best way to resolve this question would be to actively ask
on the dri-devel IRC channel (on the OFTC network), because people
might not even realize this quite interesting question is in here, but
I guess most of the relevant people are on there.

But probably wait after new years, so people can actually return from
all the festivities happening right now.


Heiko


