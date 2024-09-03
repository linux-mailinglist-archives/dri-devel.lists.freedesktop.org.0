Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C496AD08
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 01:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914F710E633;
	Tue,  3 Sep 2024 23:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlGVn1gk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDC10E633
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 23:47:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4657C5C431F;
 Tue,  3 Sep 2024 23:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859A5C4CEC4;
 Tue,  3 Sep 2024 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725407233;
 bh=syaECrjJE2kWIzyuFy7TOxjEg6HYnVTBHVpPWpttYog=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SlGVn1gk0SxFfz9vigWKHLcKXUV+23WJ7CIDd+c5uNzmpaf/aZYK6uOZS1RQPZ/tN
 hQAVvb7MUldFyVb+I8H/aVa0F0p/oXV57TJMzSkPiXPhNsHT0VyDv7Fq2vOzlwo8sv
 HgQqYW2QhnGvPTTSKpFWy0CzYUO4QYjBdp7CIlttpKI+eGcmKCH/HzGZl2JFbrvw4/
 z6kd40ug/0TAokbkgyjxRGpHmB8AZaQdNHCB9WRH4Pqf+dS8ltl2Nt1Bw0ASUMYh6d
 AczG4sJoKR9q/H1wnI3Po2kKgG9E0V/iaqkfydnJsBTHWSdVcfyvOyVeVhqXY6QOwp
 vK/zpfWFdlylA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>, 
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>, 
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5
 board
Message-Id: <172540722527.175332.15576202732090473513.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 00:47:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
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

On Tue, 03 Sep 2024 11:22:30 -0400, Detlev Casanova wrote:
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[7/9] spi: dt-bindings: Add rockchip,rk3576-spi compatible
      commit: b0cdf9cc089525da330919d1bcd3b92655aaa621

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

