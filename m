Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095555A01C9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4BB0D62;
	Wed, 24 Aug 2022 19:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5307AB99DE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:02:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC0CDB821A9;
 Thu, 18 Aug 2022 14:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F081C433D6;
 Thu, 18 Aug 2022 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660831321;
 bh=X5DsdljwcA5Tyg1NxEYQreLfQopZHf/UbXzUkOS92bc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bl3nBR6RS2+BfzxqoZDCbEKHrp+AnAJ56oPp22ZyvWRA5EpBtpF9zsf4OH+vftyKL
 laLIZ+cZUehW0ubWQJ7KGgWjuOmWD1UohDsQtt19uMEojUKuS86tgdDukUk8TzObdn
 4iGlLlTAwQw73STOhV3kB25p2xH2QnelPLXAFbpO/f26EMO26i++tDVQ9eI1VB4i/t
 1/8SrA2E4W3IK7DNEE8cDLkuzVEUNeupqUfcvwvmgWzSZs4eCFzmXTZovOtMx0lrW4
 cgba0+gEbdIshly2On6gQzRuW62SFeUVjuvUuqEvg5HFX12WoQBB8stZQdGo9aHYlM
 nbvYXwqRgOBeg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1660292316.git.mazziesaccount@gmail.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-Id: <166083131403.91659.16911525815673537629.b4-ty@kernel.org>
Date: Thu, 18 Aug 2022 15:01:54 +0100
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Nuno Sá <nuno.sa@analog.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>, Alexandru Tachici <alexandru.tachici@analog.com>, Jean Delvare <jdelvare@suse.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>, Aswath Govindraju <a-govindr
 aju@ti.com>, linux-amlogic@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johan Hovold <johan+linaro@kernel.org>, linux-hwmon@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Aug 2022 13:08:17 +0300, Matti Vaittinen wrote:
> Devm helpers for regulator get and enable
> 
> First patch in the series is actually just a simple documentation fix
> which could be taken in as it is now.
> 
> A few* drivers seem to use pattern demonstrated by pseudocode:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/7] regulator: Add devm helpers for get and enable
      commit: da279e6965b3838e99e5c0ab8f76b87bf86b31a5

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
