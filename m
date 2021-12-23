Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C447E6C6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 18:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A37410E233;
	Thu, 23 Dec 2021 17:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DF910E233
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 17:17:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED5961EFE;
 Thu, 23 Dec 2021 17:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0E7C36AE5;
 Thu, 23 Dec 2021 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640279858;
 bh=Sk7H+nhdFE764xNL6pqceUv9O6Os6KdUst6P2k4cENc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uYm3lRLk2w/GkwN2NTWKady0B4TYkZeuXh2Ca5r4dUfvvdL8xI1kTMht9MyyjU6aT
 4S2uYNg175qVLqdfA5PoDj08+cLMDhURFyovMknc72spMJcBC4GpOzV2bNN1rgevCl
 m5Fezpow35iK0MHHjH0oI3uEEnEU1pTgrjQLwy28q81PCmrltEhRl0E5BsQjk9eti8
 VVJzzoUmmbTsDv/p0WXwplBhXrfLo1zONlFBFxQ8kmKwILrr6BAgncdV7ejj5T/611
 sNzQI+vPFVVNtxka+RNewFZ23v4sqRg/r2gHrusn6ZgSbq24R6ZEXbjA/NLy0yypjB
 1QTsnQVcL1noA==
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alexander Stein <alexander.stein@mailbox.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20211223122434.39378-1-alexander.stein@mailbox.org>
References: <20211223122434.39378-1-alexander.stein@mailbox.org>
Subject: Re: (subset) [PATCH 0/3] More amlogic sound-name-prefix DT fixes
Message-Id: <164027985607.1292681.12642503043684144882.b4-ty@kernel.org>
Date: Thu, 23 Dec 2021 17:17:36 +0000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Dec 2021 13:24:31 +0100, Alexander Stein wrote:
> Following up [1] here are more fix for missing sound-name-prefix properties in
> the arch/arm64/boot/dts/amlogic/ subtree.
> 
> [1] https://www.spinics.net/lists/devicetree/msg466125.html
> 
> Alexander Stein (3):
>   dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix
>     property
>   ASoC: dt-bindings: spdif-dit: add missing sound-name-prefix property
>   ASoC: dt-bindings: aiu: spdif-dit: add missing sound-name-prefix
>     property
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: dt-bindings: spdif-dit: add missing sound-name-prefix property
      commit: c6cef35bf723ef0152258d15179c725c5f8cbeba
[3/3] ASoC: dt-bindings: aiu: spdif-dit: add missing sound-name-prefix property
      commit: 559ec82aa47d7c9ce39f3c769f1ba5f3237f6869

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
