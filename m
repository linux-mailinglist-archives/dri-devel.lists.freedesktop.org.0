Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724097C0A5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 22:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AAB10E1B5;
	Wed, 18 Sep 2024 20:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ab4D6i2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B6410E1B5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 20:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED79A5C5A55;
 Wed, 18 Sep 2024 20:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73A7C4CEC2;
 Wed, 18 Sep 2024 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726690210;
 bh=HP/zRaWLm37a0O/YnwD/z87FqywELzKP69C1iP96//k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ab4D6i2t1X8aYzasuMglH+8lIcj884En9JvHGqiJKCssXAyYDvgusG7KW/oQdp3bo
 2rvibPnGOg/5tO6Yh+uoiJQSy+vWkregpERB2YcXHJux/E4hwcjhvZbUxVbI7O3rJ0
 jojYEpuNO4DC7gb2zSdlCBH5Ffmx3RPGX0FnOIJBSi2dm9Cs8QVcZSySqewnPZ5S5l
 m5pVhJRlYTf0VeSdqjP0za6numHxK/9wyjS9y3vYp9a3T3FbW9KcwG97f+gOT9Pc6Z
 1+KprkgDs0slZmTyvMm9eC/AA1brksiHPZ5vzUWj6d4CnlTYyFPYLttA42Ht+u2RRw
 MCgNSIH5L3mLQ==
Date: Wed, 18 Sep 2024 15:10:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, kernel@collabora.com,
 Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-serial@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jagan Teki <jagan@edgeble.ai>, Thomas Zimmermann <tzimmermann@suse.de>,
 Elon Zhang <zhangzj@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>,
 Chris Morgan <macromorgan@hotmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Andy Yan <andyshrk@163.com>,
 Muhammed Efe Cetin <efectn@protonmail.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Tim Lunn <tim@feathertop.org>, David Airlie <airlied@gmail.com>,
 Ondrej Jirman <megi@xff.cz>, Liang Chen <cl@rock-chips.com>,
 linux-spi@vger.kernel.org, Jimmy Hon <honyuenkwun@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 6/9] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Message-ID: <172669020548.2047533.8189624285795132059.robh@kernel.org>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-7-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903152308.13565-7-detlev.casanova@collabora.com>
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


On Tue, 03 Sep 2024 11:22:36 -0400, Detlev Casanova wrote:
> It is compatible with the other rockchip SoCs.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

