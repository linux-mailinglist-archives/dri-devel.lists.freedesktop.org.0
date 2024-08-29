Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002CB964381
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E8B10E651;
	Thu, 29 Aug 2024 11:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="BSFNf44C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E51D10E651
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tLZ8vmFpkVpu4IvhBOz9UunW+WpkV/nZjcZ3qim3VmY=; b=BSFNf44C7QcZSYJ3IeF8hDavGL
 JZ2YxBEDZGmxXUbx3qel7FKJU1TY9i8zVYc76pwv0N7eQ9qa7NP52WVNYJwgUkQStsCdWI4HLn7ba
 DIwnks4ACBQA7N093a3FzyGXHK+XAaGvKjROcPDnV9uNEYCHdJT/iuBidO48dBWxChgcGFJMG2C9b
 eyObsZF5sdPuLdHcnbCrDbCQ/rZP1nsmxyOt87KlJWycQAEjBfaklEReRjJTglG3/bfjAoKzUE0CT
 MVE7W3kPCOLwqYLTMu45+pbGExipmw9U93rcXS7Djc/lWaBtmTwJhU6P3BkMAdK5qMhoWG0fhGfhe
 y7YmOsDQ==;
Received: from i5e861916.versanet.de ([94.134.25.22] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sjdgT-0003bn-Pb; Thu, 29 Aug 2024 13:51:25 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Elon Zhang <zhangzj@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Date: Thu, 29 Aug 2024 13:52:37 +0200
Message-ID: <61607306.matp6XCIr4@diego>
In-Reply-To: <5254cf14-65d1-4ffa-a1fb-265a51dda37d@roeck-us.net>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <3262963.l52yBJDM9G@diego>
 <5254cf14-65d1-4ffa-a1fb-265a51dda37d@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Hi Guenter,

Am Dienstag, 27. August 2024, 21:38:35 CEST schrieb Guenter Roeck:
> On 8/27/24 00:20, Heiko St=FCbner wrote:
> > Am Samstag, 24. August 2024, 18:44:29 CEST schrieb Guenter Roeck:
> >> On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
> >>> It is compatible with the other rockchip SoCs.
> >>>
> >>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> >>
> >> Acked-by: Guenter Roeck <linux@roeck-us.net>
> >=20
> > For my understanding, does this Ack mean you expect the patch to go in
> > with the other patches?
> >=20
> Yes
>=20
> > Because in theory this patch could also be picked and go through the
> > watchdog tree, similar to how the saradc binding went into the
> > iio tree already.
> >=20
>=20
> I thought it was all supposed to be pushed together.

I think at this point the rk3576 has still quite a number of separate
pieces. A series for clocks, one for mmc and I think there are more.

So for stuff that is obvious, like the saradc compatible Jonathan already,
picked or this watchdog compatible, a strategy of "someone picks the
individual" patch also is helpful, because it reduces the number of pieces
on the "chess board" ;-) .


So I guess both ways (wdt binding getting applied, or me just applying it
with the rest) are doable and we'll just follow what you feel comfortable
with doing.

Heiko




