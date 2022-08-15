Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F34593258
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7749C20AC;
	Mon, 15 Aug 2022 15:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA4D10EC43
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:45:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06DE360FBC;
 Mon, 15 Aug 2022 15:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C419C4347C;
 Mon, 15 Aug 2022 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660578313;
 bh=JwjxJ7MOVdbsgqpb/k0rGtudkHpbtxGUbAtOmA+7kb4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=tsqfhZF0byibwTSWDbd8UBOt4qmu251PmImxGxyvih5jtAVHspXV8Bu51VzsPeM1U
 oq8g/FuG5Hj72UVtFgziDO9U27EZZRnKIvdFF6g0RAmp+IsSkcZNelH3ffc7HAg0qw
 1YPMFyCGw0I8cN27fVVcGCuhFtRUDuZo1rI2yNfIgBmyigj0ra2Gpzh7WrTia0H4vB
 v5/GQn5Xhb3dSct2jCO56KXXGQqzOEuG8Wg7EVqgb7HEWTRIZufGztGmUf3YWb7mGw
 Yc2gVUl2s1eNjrWS6zlQSyORnqVoFFb2UNHG7mJcdl17dcMQXoNODBQBVSSsEBfODd
 p3d1SN03bHSbA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 devicetree@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Bakker <xc-racer2@live.ca>, 
 Christophe Branchereau <cbranchereau@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Pratyush Yadav <p.yadav@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-spi@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
In-Reply-To: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
References: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] spi/panel: dt-bindings: drop 3-wire from common properties
Message-Id: <166057830909.697678.2981260978895066117.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 16:45:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
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

On Wed, 10 Aug 2022 16:13:11 +0300, Krzysztof Kozlowski wrote:
> The spi-3wire property is device specific and should be accepted only if
> device really needs them.  Drop it from common spi-peripheral-props.yaml
> schema, mention in few panel drivers which use it and include instead in
> the SPI controller bindings.  The controller bindings will provide
> spi-3wire type validation and one place for description.  Each device
> schema must list the property if it is applicable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi/panel: dt-bindings: drop 3-wire from common properties
      commit: 41f53a65444997f55c82c67f71a9cff05c1dee31

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
