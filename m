Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82612888736
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 02:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01A210E46E;
	Mon, 25 Mar 2024 01:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UgoRuOdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6791A10E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 01:54:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D67260DF5;
 Mon, 25 Mar 2024 01:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BD4FC43143;
 Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711331662;
 bh=rcdcVMOwAqKdq7n5jkVq5QjE+E4mBd0LmLt5lwYal+k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UgoRuOdIKc1atcNCSy+fGMyIxd2EIL85aFzdiUP5IhrVwfyLuX4y1UYA/UQBPsAMD
 3sCV/0MeXlbM7sefeRf+lmdvdlgZ0TKvCfmEeGYkPwifpZb/yub4hlREVfgCNhRtZz
 ZiY0yetiX2oMC1bHns3loNE8fmm9pIIDXR7KvrkZSK4WdOtTGUmUud3p6vcyL60zKX
 9BjSBTkapaueuWOl6AMlmsqrYlvbxlrUS29IKX7go0Y/Tq8wfA4UxOJ9FCpuAE+CY5
 CxMUxLEonlCV+T0zvdc8MGEzb5H247rE1FolcBQONxia7RxxTo1NzWXjR86IfgfIYv
 gVtR4ZEqxDVIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 886E5D2D0E3; Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/32] spi: get rid of some legacy macros
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133166255.9916.6727664409114778134.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: broonie@kernel.org, kernel@pengutronix.de, mdf@kernel.org,
 hao.wu@intel.com, yilun.xu@intel.com, trix@redhat.com,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, linux-iio@vger.kernel.org,
 dmitry.torokhov@gmail.com, Jonathan.Cameron@huawei.com,
 linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, ulf.hansson@linaro.org,
 martin.tuma@digiteqautomotive.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, serjk@netup.ru, arnd@arndb.de,
 yangyingliang@huawei.com, linux-mmc@vger.kernel.org, richard@nod.at,
 vigneshr@ti.com, robh@kernel.org, amit.kumar-mahapatra@amd.com,
 alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org, horms@kernel.org, 
 ronald.wahl@raritan.com, bleung@chromium.org, tzungbi@kernel.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev, michal.simek@amd.com,
 jcmvbkbc@gmail.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org, tzimmermann@suse.de, javierm@redhat.com,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 vireshk@kernel.org, rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
 greybus-dev@lists.linaro.org, peterhuewe@gmx.de, jarkko@kernel.org,
 jgg@ziepe.ca, linux-integrity@vger.kernel.org, herve.codina@bootlin.com,
 krzysztof.kozlowski@linaro.org, linux-usb@vger.kernel.org, deller@gmx.de,
 dario.binacchi@amarulasolutions.com, kvalo@kernel.org, dmantipov@yandex.ru,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
 corbet@lwn.net, bhelgaas@google.com, james.clark@arm.com,
 linux-doc@vger.kernel.org
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

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Mark Brown <broonie@kernel.org>:

On Wed,  7 Feb 2024 19:40:14 +0100 you wrote:
> Changes since v2
> (https://lore.kernel.org/linux-spi/cover.1705944943.git.u.kleine-koenig@pengutronix.de):
> 
>  - Drop patch "mtd: rawnand: fsl_elbc: Let .probe retry if local bus is
>    missing" which doesn't belong into this series.
>  - Fix a build failure noticed by the kernel build bot in
>    drivers/spi/spi-au1550.c. (I failed to catch this because this driver
>    is mips only, but not enabled in a mips allmodconfig. That's a bit
>    unfortunate, but not easily fixable.)
>  - Add the Reviewed-by: and Acked-by: tags I received for v2.
> 
> [...]

Here is the summary with links:
  - [v3,15/32] platform/chrome: cros_ec_spi: Follow renaming of SPI "master" to "controller"
    https://git.kernel.org/chrome-platform/c/85ad0ec049a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


