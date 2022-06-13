Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6D549975
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF07910F39C;
	Mon, 13 Jun 2022 17:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FE710F020
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:01:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 27554CE13D4;
 Mon, 13 Jun 2022 17:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078CDC34114;
 Mon, 13 Jun 2022 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655139710;
 bh=zH7DwkKRGFFZLBmAteDlsCQw8yPj/w0q9YqYHZgyiVA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bkjewIXiUaJie2/EFRI2Y6+WB0SV1vS+n59R8pKdxGZaIjTc2Zkr5uclzJWcg1tFu
 Hx7hvnEr8mGj3M/GTIgQAE0y8tGzsSEQHYXNZLoHPlr845yaC0jHwBWLyTHvDz4rFe
 +ss1xm/nAdObcdxocEjm2LorKEpdlFjeeEOpDugA7sdt13DkDxbaA+pV4Dp8r3mPcq
 n4DPLGyOxwKjaUYp834Om6WsBCnuSoUsCPejZwTrG0ALwOc23P/aYug+kjBExpzCtY
 cw238838J/TPZsu5YwDO2n4nLgpmQKdXIbiTusuSNgifO2xH82OYNbaimjMCmpk5K0
 eKHk2TnY291Jw==
From: Mark Brown <broonie@kernel.org>
To: andrzej.hajda@intel.com, airlied@linux.ie, kyungmin.park@samsung.com,
 jy0922.shim@samsung.com, narmstrong@baylibre.com, linux@armlinux.org.uk,
 robert.foss@linaro.org, daniel@ffwll.ch, alim.akhtar@samsung.com,
 lgirdwood@gmail.com, inki.dae@samsung.com, broonie@kernel.org,
 sw0312.kim@samsung.com
In-Reply-To: <20220602103029.3498791-1-broonie@kernel.org>
References: <20220602103029.3498791-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: hdmi-codec: Update to modern DAI terminology
Message-Id: <165513970673.636966.9826730904967146178.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 18:01:46 +0100
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 jonas@kwiboo.se, dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 12:30:29 +0200, Mark Brown wrote:
> As part of retiring the old defines used to specify DAI formats update the
> hdmi_codec driver to use the modern names, including the variables in the
> struct hdmi_codec_daifmt exported to the DRM drivers.
> 
> In updating this I did note that the only use of this information in DRM
> drivers is to reject clock provider settings, thinking about what this
> hardware is doing I rather suspect that there might not be any hardware
> out there which needs the configuration so it may be worth considering
> just having hdmi-codec support only clock consumer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: Update to modern DAI terminology
      commit: 9f1c8677724a0e6a6ac7a74d2b0192a584df859d

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
