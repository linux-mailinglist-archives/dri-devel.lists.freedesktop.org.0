Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006951C38C
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCEE10E6BA;
	Thu,  5 May 2022 15:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442B10E6BA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:12:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0766061CED;
 Thu,  5 May 2022 15:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103ABC385A4;
 Thu,  5 May 2022 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763540;
 bh=qxrBFOrs6AqSFxwzxM170Yj2C88LG1R2VDI1TkdSIeQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L26YejisrBkcnsNiCVSf9NjN5kAh2mmyjR3oLHIql2CX1tZRCcBYLezH1Mr0CjpoJ
 ll0nUTmowpqDw8JZTwiktZf0A4/IdvudKiczjXCbbDQmsKG3SQMY553n/Qyqg2ioGg
 +DGDzI2PVdADG6EiMuuSVu5xf3C1P2H8MuCN5/vWmP4HvJuZaEp0AgQMUh39GbpRN2
 fkC1ptTotLOw9uzAAaaUKjFS58ZqdjXew6M5lCDuf1Q91bd6+Ez38S7ZP0REYYpit3
 c2U+KRnTqkhzyI3pBPfPa+dtfM2GHVRjQHryPrYByvf9LwVGI/kPhe6I8k04TftZNE
 Fwy3ktK/FcHAA==
From: Mark Brown <broonie@kernel.org>
To: marex@denx.de, dri-devel@lists.freedesktop.org
In-Reply-To: <20220430025145.640305-1-marex@denx.de>
References: <20220430025145.640305-1-marex@denx.de>
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Message-Id: <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
Date: Thu, 05 May 2022 16:12:18 +0100
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
Cc: robert.foss@linaro.org, sam@ravnborg.org, jagan@amarulasolutions.com,
 tzimmermann@suse.de, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Apr 2022 04:51:44 +0200, Marek Vasut wrote:
> Currently the regmap_config structure only allows the user to implement
> single element register read/write using .reg_read/.reg_write callbacks.
> The regmap_bus already implements bulk counterparts of both, and is being
> misused as a workaround for the missing bulk read/write callbacks in
> regmap_config by a couple of drivers. To stop this misuse, add the bulk
> read/write callbacks to regmap_config and call them from the regmap core
> code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/2] regmap: Add bulk read/write callbacks into regmap_config
      commit: d77e745613680c54708470402e2b623dcd769681

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
