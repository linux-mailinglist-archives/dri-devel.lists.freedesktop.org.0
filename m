Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF63D3C5CB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB6710E5B1;
	Tue, 20 Jan 2026 10:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="lxZMgDnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B910E5B1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=O2FhviPnC5jz5ZsBAwO6tzGpttxJxSsq9OxCi424fEk=; b=lxZMgDnA7WGotJ0c12IMFqkU7a
 rwtU+DoqMrphu1iorjPcGFxsr1p0/WtuZXWjU9WIWLzaIIDwgRAjmFpdOQr72wpzlEwBRKSxY1jUA
 zpKgaOK1KezXk/bc0zdRwF7YZmrCBgt3CfDv/jmR5HEsJVlsQXdkH02mqs4lak3nNBx/pU6YyXQdL
 W1t7Y+39lfIc1Tmxok2lYKPNC1R9UPgCAimMDW9NEIo2H/i1hxwJBdr+RUtsyVUVsJwuwCeaPrHVM
 9QUlDYrhBFOrjOYNZHJM4IMdbqwJz7kzu0vi+vdAwxQXChIf+0jbUeOWnPBcIZNAi5VLurg7Qy9Tg
 Oqh96xGg==;
Received: from [192.76.154.238] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vi9D4-003N5V-46; Tue, 20 Jan 2026 11:43:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com, 
 robh@kernel.org, sebastian.reichel@collabora.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 2/5] drm/bridge: synopsys: dw-dp: Set pixel mode by
 platform data
Date: Tue, 20 Jan 2026 11:43:41 +0100
Message-ID: <4083071.q0ZmV6gNhb@phil>
In-Reply-To: <20260109080054.228671-3-andyshrk@163.com>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-3-andyshrk@163.com>
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

Am Freitag, 9. Januar 2026, 09:00:45 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DW DisplayPort hardware block can be configured to work in single,
> dual,quad pixel mode on differnt platforms, so make the pixel mode set
> by plat_data to support the upcoming rk3576 variant.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

While Dmitry helped a lot with looking at bridge drivers recently,
I think your recipient list does miss a number of other people
listed as bridge reviewers/maintainers.

$ scripts/get_maintainer.pl drivers/gpu/drm/bridge
Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE =
CHIPS)
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRID=
GE CHIPS)
Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS =
=46OR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE =
CHIPS)

As you'll need to do a v2 for the binding, please add the missing people
to the recipients.


=46or the change itself, can you improve the commit message a bit.

I assume the Single/Dual/Quad-Pixel config is a real hardware-feature
that is set when the IP is integrated into the soc? Or this a runtime
setting and a soc can support multiple output variants?


Thanks
Heiko


