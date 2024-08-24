Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA695DCB0
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 09:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31BF10E1AF;
	Sat, 24 Aug 2024 07:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aWz6a6Ub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF60710E1AF
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 07:52:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42E3ACE065F;
 Sat, 24 Aug 2024 07:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36470C32781;
 Sat, 24 Aug 2024 07:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724485942;
 bh=J7CJ4ewK1ei4WvrIKvVeq7IO2mBtlvBtEoZL+GqcpiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aWz6a6UbzKGFpHdRPvkQh/kdN8iH1iiTbEgLvKfofw+awByVtTXMksxpWwxGubX+G
 AdAVZ7D2VLX3Yyw4cpTWJVxAMJvK19RXjeGUDt5/jBKq4secGcNpsJVYv0FzNdVsCI
 1X5RBcTsZ/qbDeL32MaAZ5i7U/8g+opq9kHqKe7K15YjlDvq9xjxcxWFKivUKAPaFm
 LAa30ZwXk7acwFePszse9qsy0gAtQdOnbD9es8bZU7egTxhHZ1foYLvkxazSn12C4W
 /Cs71gjB6O8boa6Rf1T8EqJ+8x8mXysDYjkK9+sm7LpwQaECHwD1GBlSGvA9+h4auM
 1ROhyqMBMd8kw==
Date: Sat, 24 Aug 2024 09:52:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, 
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, 
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Message-ID: <qqc6rj4a5hrme3b5adw4l65zeb2c7zjgtyror6hwtkhm5g3mkw@bc2xijdjddmv>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-10-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823150057.56141-10-detlev.casanova@collabora.com>
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

On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
> It is compatible with the other rockchip SoCs.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

