Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16C557EE7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 17:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3B10E337;
	Thu, 23 Jun 2022 15:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D511C10E337
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 15:48:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 265FE61ED9;
 Thu, 23 Jun 2022 15:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2336C3411B;
 Thu, 23 Jun 2022 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655999324;
 bh=E2ZHa4TN+5+ejRiD5sM6vTPpHUBc/nI7dHASx3liJUE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZJ7KRe+PPhkrhtcpZO7Hpv5xz8T2QQ0uKQ+mbtqyV/uPJUvcM/wCNVtbvASGCh0eW
 LxZLqFi0ZfwEHAwM10jCnx3B3MseWbmmw9MVCn2HrOUFl7TnUEXOr8ttdsjm/NTeX3
 H4vgCmDBDOJhcrSDODTfKXdf/e8XLiN5eeJIbv5xdDChY1Kl4oo9dCjj7heOWbo9fX
 YaqDd1k9B270LN3IkVdsdngFaUxxwC/KmVcf1sflT3ARY8nkNqRSiLi+QBvylzNvMu
 6wA51T9zaS0me1goaaGsShDd0lMpo0iF0bbAQBHI+ijzQrdrgyVKKmiasvUYLZTvyd
 Nl8WurlOZk4lA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, linux@roeck-us.net, pavel@ucw.cz, jic23@kernel.org,
 sre@kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, gregkh@linuxfoundation.org,
 heikki.krogerus@linux.intel.com, lars@metafoo.de,
 krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, deller@gmx.de,
 matthias.bgg@gmail.com, peterwu.pub@gmail.com
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
Subject: Re: (subset) [PATCH v3 00/14] Add Mediatek MT6370 PMIC support
Message-Id: <165599931844.321775.8085559092337130067.b4-ty@kernel.org>
Date: Thu, 23 Jun 2022 16:48:38 +0100
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-usb@vger.kernel.org, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022 19:56:17 +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> This patch series add Mediatek MT6370 PMIC support. The MT6370 is a
> highly-integrated smart power management IC, which includes a single
> cell Li-Ion/Li-Polymer switching battery charger, a USB
> Type-C & Power Delivery (PD) controller, dual Flash LED current sources,
> a RGB LED driver, a backlight WLED driver, a display bias driver and a
> general LDO for portable devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[09/14] regulator: mt6370: Add mt6370 DisplayBias and VibLDO support
        commit: 8171c93bac1bf9e98269b2efb19ef4e6c4e55ed7

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
