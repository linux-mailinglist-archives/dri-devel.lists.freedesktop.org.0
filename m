Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D7996ABB9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FC410E147;
	Tue,  3 Sep 2024 22:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="w+y9IjSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04F310E147
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 22:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PmAan6NPVAhVozSYoq921sKeDS6etdaKRx0WGKUNzPg=; b=w+y9IjSJDl3NsTLiQuOYJKEffo
 RLLqIhTKjPF80cWIwGyfcjQX1yDaAPqgMUrXE5fzV7afKReFLBeWf7XhpEyshPQPH6XqWqbpcHLGo
 iynY4oFTmd2qzmsovTZ1CnbYmB0GR8Y8l5QrU70dkuyhYQy2iLlKm9VIKPnXVpPmDood1YGkp8lz3
 JZh6j0lfWw5LZhQy/8BqQLLKUNovMNsyQPzvSwVI93Kse7gj8yKeMTpAHPfmbY5KXjWGSMxqNZK0P
 WEq2rtZTZTgydAJ2HE/vYW4BE02Ynl2aNUkopQSyYydfcfHHdvU1xF0F5UaJ4a9BNaoOsSqR0JQ2Z
 zx+2+0dg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1slbjR-0003Ah-7l; Wed, 04 Sep 2024 00:10:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@collabora.com,
 Jamie Iles <jamie@jamieiles.com>, Chris Morgan <macromorgan@hotmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Finley Xiao <finley.xiao@rock-chips.com>, Jagan Teki <jagan@edgeble.ai>,
 Liang Chen <cl@rock-chips.com>, linux-spi@vger.kernel.org,
 Andy Yan <andyshrk@163.com>, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-rockchip@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, Daniel Vetter <daniel@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, Dragan Simic <dsimic@manjaro.org>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-serial@vger.kernel.org, Muhammed Efe Cetin <efectn@protonmail.com>,
 Tim Lunn <tim@feathertop.org>, Ondrej Jirman <megi@xff.cz>,
 Jimmy Hon <honyuenkwun@gmail.com>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>,
 Elon Zhang <zhangzj@rock-chips.com>, Alexey Charkov <alchark@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jiri Slaby <jirislaby@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5 board
Date: Wed,  4 Sep 2024 00:10:33 +0200
Message-ID: <172540141128.2569462.10719274439402034002.b4-ty@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 3 Sep 2024 11:22:30 -0400, Detlev Casanova wrote:
> Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
> and pinctrl information in rk3576-pinctrl.dtsi.
> 
> The other commits add DT bindings documentation for the devices that
> already work with the current corresponding drivers.
> 
> Note that as is, the rockchip gpio driver needs the gpio nodes
> to be children of the pinctrl node, even though this is deprecated.
> 
> [...]

Applied, thanks!

[5/9] dt-bindings: gpu: Add rockchip,rk3576-mali compatible
      commit: 053d157840870fc56aad8c4d3122690a65b2d462
      drm-misc-next

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
