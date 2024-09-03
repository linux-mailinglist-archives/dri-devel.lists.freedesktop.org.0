Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A294C96AAE0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8810E5FD;
	Tue,  3 Sep 2024 22:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ynWZOEXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCBC10E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cP5gkG4poHNhOgTPHW8pS6NlcCd5HhlJQScKycx9I04=; b=ynWZOEXXuI/cTZMXQbpQBTxQS1
 N+U2v78bHi+x6+pUM7YSUO+M0UxJxsIw4lNo8gB8cJABkeFbIbSRa5AYxYjEcOXoQ0qApY+NqZHw1
 yczKvbt612cG2P0OfsvSB9ZGB9XyVoqmqhXtLCuhwF9ygTL7gCPKV7sUggXrDyW6gDNbCTX9IUptC
 GJmRlAoBMs700glxYHix/bxX9oajQKXyPfNOU4QZWIrHmPuuMZwiAcqgvrU+7Xqm+aZaoCEOD390u
 ZPY8jIDdfL71mpS+HkhKUha2uCqVNtgqEQe3w5D3pEgLA7i41hRMn4WmXAifuyUV3F9b5Ww7wt5fs
 UH/Wwpzg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1slbZz-000365-3r; Wed, 04 Sep 2024 00:00:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Tim Lunn <tim@feathertop.org>, Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@protonmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jagan Teki <jagan@edgeble.ai>, Guenter Roeck <linux@roeck-us.net>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-serial@vger.kernel.org, Finley Xiao <finley.xiao@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-spi@vger.kernel.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>,
 Liang Chen <cl@rock-chips.com>, Ondrej Jirman <megi@xff.cz>,
 Jamie Iles <jamie@jamieiles.com>, kernel@collabora.com,
 Elon Zhang <zhangzj@rock-chips.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
 Andy Yan <andyshrk@163.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5 board
Date: Wed,  4 Sep 2024 00:00:46 +0200
Message-ID: <172540084163.2565171.11096510350978641735.b4-ty@sntech.de>
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

[2/9] dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml
      commit: 59420d8ad7809827524824a3891d6a081e735449

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
