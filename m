Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64219A4A5B0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 23:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C5110ED57;
	Fri, 28 Feb 2025 22:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="TyCXX+0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E9210ED57
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 22:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZfcm07W8RwEaBy9lSmqnHo6WL11ba796zrsT4TrXJI=; b=TyCXX+0Y4INx6O+beYAL/qfnpw
 xrOw0ZkMweR/I6PkMC5d1ncuABaxrCMZo/JxoY7hyf68suXi20D9bp/o5Jog748TyIWhA5xTtfdhJ
 N/9WXodyRsorIeLIQ9+zLGNTYFHVsdtiPcbsloZD0vCvQINbv/s67+lmDR7NQnuJUO/+ETU16Om6R
 1HlG2XdFsLUUWvKRrskWKV9dYBOCOtVuiwOaOjEGed51G+ukhAj1rBpT5OxC8+BgQa35paN0TGDQr
 4hOOmhezcDXfbRRCWzsWXdkF0cebcaY93q/VeB5g6WxSIRp5W7DnHlnEvuEUKFlAL6zEGHxplPFXS
 kAZzc4mQ==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1to8Zk-00040X-Sb; Fri, 28 Feb 2025 23:11:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-usb@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Johan Jonker <jbx6244@gmail.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-serial@vger.kernel.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ulf.hansson@linaro.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, Tim Lunn <tim@feathertop.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, Mark Brown <broonie@kernel.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: (subset) [PATCH v3 00/15] rockchip: Add rk3562 SoC and evb support
Date: Fri, 28 Feb 2025 23:10:48 +0100
Message-ID: <174078063579.504376.4763347846550378295.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
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


On Thu, 27 Feb 2025 19:18:58 +0800, Kever Yang wrote:
> This patch set adds rk3562 SoC and its evb support.
> 
> I have split out patches need driver change for different subsystem.
> And all the modules with dt-binding document update in this patch set
> do not need any driver change. I put them together to make it clear we
> have a new SoC and board to use the new compatible. Please pick up the
> patch for your subsystem, or please let me know if the patch has to
> send separate.
> 
> [...]

Applied, thanks!

[05/15] dt-bindings: gpu: Add rockchip,rk3562-mali compatible
        commit: 049e7ac203d51fdc3a739f5f28906788e8eeea03

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
