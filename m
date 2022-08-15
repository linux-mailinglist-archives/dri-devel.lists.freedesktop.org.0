Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D3593256
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D98AD904;
	Mon, 15 Aug 2022 15:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD08CCCAF3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:44:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3598ACE1138;
 Mon, 15 Aug 2022 15:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D75C433B5;
 Mon, 15 Aug 2022 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660578291;
 bh=0cDp9g/DZRNyVyG0xcXbePrDhYuvBMojyZXBHZyUY9I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l6IQ1sWU9IPna9cOCYEFqB0HqZ5nlQHnoLXXa0NrRXBVAq8kHLEdH09q01143ONW4
 7jugllPQkwHCLzVFMmlwxzTbLH0tpat3RU3o7lxO3fDLBffpbLcShNuxNMXLBMqvkP
 cA7HQxaYo0V77Wq8V4LHRdibXl07pS0KmWCXeNhfkRBWPr2KTxmw67LQ2hwjTBvxWt
 MaoRevor5ccbGpasSuPro0ZMP6XihJePD6cFSDeDv+3Nuok5rgI8Njr5XuEUTikogP
 DeuqxKzZgzli+SyyQayzL3zxJCdUoAzLvsNdHXC8aE/WWWu5usxSihNquHZpBkA68s
 9aKEx8WUVVfUA==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1660292316.git.mazziesaccount@gmail.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-Id: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 16:44:44 +0100
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>, Alexandru Tachici <alexandru.tachici@analog.com>, Jean Delvare <jdelvare@suse.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@li
 sts.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>, Nuno Sá <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>
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

[1/7] docs: devres: regulator: Add missing devm_* functions to devres.rst
      commit: 9b6744f60b6b47bc0757a1955adb4d2c3ab22e13
[2/7] regulator: Add devm helpers for get and enable
      (no commit info)

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
