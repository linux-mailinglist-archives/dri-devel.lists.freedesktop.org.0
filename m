Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750AB06F28
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D54310E263;
	Wed, 16 Jul 2025 07:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="FTxmbPG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFFC10E263
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=qgtjBGVAZ1tS5fJXKd4+bhI2PQYUrEH4Cz/qfvC/2po=; b=FTxmbPG1x9gKKjsM5WAh+rNIRC
 /+YNAwSYKFOaLt++uJ4akLU4L1U3GETfMY892VjCy5ZAPJnsrTOxzSQtdS2Npx5vrgDaI+q2gfISo
 FaSHyV2RSkf2RiUvTVOgEFrZKhcu6NXSPclXeHBTz793LdTFZqCMt3lVmXh8gVkH2Y9keELpbryPl
 CZ8aDjoPcXgtHDjDNDuGI7sPMsDiQz0cDk4gyULnFp1hcUNUtnyUDulCnWUUWYbmuzcqXsl2lz2z8
 UFk5YsvH+HJU7Co075/zAc39Up67VtRcLRfZlG6I+JYhQdESBQ4dEJG0WcGPM0E4hvxo/GOw83Sqw
 pXOdRX6A==;
Received: from i53875a74.versanet.de ([83.135.90.116] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ubwjz-0008Vz-1P; Wed, 16 Jul 2025 09:39:47 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] phy: rockchip: phy-rockchip-typec: Add support for
 Type-C TCPM
Date: Wed, 16 Jul 2025 09:39:48 +0200
Message-ID: <23651445.EfDdHjke4D@diego>
In-Reply-To: <c84cb838-e6e7-4ed0-8d12-67b82f85ff28@rock-chips.com>
References: <20250715112456.101-1-kernel@airkyi.com>
 <eqb5m22om6bx2ypjtnlwdjmgfyycpmgrlvro34xwlwjj4j2jeq@mrarg36wetp6>
 <c84cb838-e6e7-4ed0-8d12-67b82f85ff28@rock-chips.com>
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

Am Mittwoch, 16. Juli 2025, 03:56:27 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Chaoyi Chen:
> Hi Dmitry,
>=20
> On 2025/7/15 20:05, Dmitry Baryshkov wrote:
> > On Tue, Jul 15, 2025 at 07:24:54PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> This patch add support for Type-C Port Controller Manager.
> >> The extcon device should still be supported.
> >>
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>   drivers/phy/rockchip/phy-rockchip-typec.c | 335 ++++++++++++++++++++=
=2D-
> >>   1 file changed, 319 insertions(+), 16 deletions(-)
> > Please keep TCPM implementation under drivers/usb/typec/tcpm/ . Create
> > an aux device and write an aux driver for the TCPM part.
>=20
> Sorry, the commit messages may not be described accurately enough.
>=20
> This patch adds mux/switch operations to the PHY driver to improve=20
> communication with the TCPM framework. Since this PHY is a combo USB/DP=20
> PHY, it requires configuration changes to the PHY lanes based on the=20
> USB-C  plug orientation (CC logic), similar to the existing extcon=20
> mechanism implementation. Of course, the original extcon functionality=20
> will remain fully compatible.

and looking at other users of for example typec_switch_register() [0],
there are a number of them already used in other phy drivers accross
=46reescale, Qualcomm, Rockchip and Samsung.

Grouping the mux/switch with the phy driver as this patch does, makes
way more sense than to introduce additional infrastruture.


[0] https://elixir.bootlin.com/linux/v6.15.6/A/ident/typec_switch_register


