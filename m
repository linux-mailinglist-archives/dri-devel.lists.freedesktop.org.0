Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02692A7F10D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 01:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1710610E3F1;
	Mon,  7 Apr 2025 23:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KDRHFtdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928C510E3F1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 23:35:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F81F5C4EAC;
 Mon,  7 Apr 2025 23:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAADC4CEDD;
 Mon,  7 Apr 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744068946;
 bh=I85j/jXCtEsELCZ/ADAT69aAEFPWO6QqVLphkunFpMc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KDRHFtdG6lE+5G1JBh3khOkm1S8pA2+mwbAqHCC4qDDeat+d+dvHQLM6np60IW9Qk
 BmP8brDh2vebAZ4zgo8Ti9NZ/rT472PhBm5igO+fw97FsxqsAewkRqJb8f1iM05So0
 e2O6OdzgrI3kBu1xzzu9ttU2lN16uGRRKVMTpI0xqhsjlPO1XlgLAr76y/fUnbB6C/
 I3drRYHgARamjKF/7e8mr9VYe43S69GFvonB2YZ1AiGXKHmba4FMehndhxc5AyKRIK
 iOn+vHo0GsdtLaDx9IJcwCh1PrB8BAIV7iaVIHupJKvyllLCjXArAQNU37mlrX02vx
 IZhbIJ8eOElPw==
From: Mark Brown <broonie@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mperttunen@nvidia.com, jonathanh@nvidia.com, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mripard@kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback
 also for SPDIF DAI ops
Message-Id: <174406894377.1337819.891174664812951152.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Sat, 29 Mar 2025 20:14:33 +0100, Martin Blumenstingl wrote:
> Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
> prepare implementation. Back then the new callback was only integrated
> with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
> It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
> input code-path).
> 
> With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
> helpers") the DRM subsystem has gained a helper framework which can be
> used by HDMI controller drivers. HDMI controller drivers are often
> tightly coupled with the hdmi-codec because of the so-called HDMI audio
> infoframe (which is often managed by the display controller).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: wire up the .prepare callback also for SPDIF DAI ops
      commit: 5533518834a3acc75919e8db671f6a8539e64f42

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

