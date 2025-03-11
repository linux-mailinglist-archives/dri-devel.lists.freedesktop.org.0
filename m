Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA7A5D079
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 21:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3CA10E680;
	Tue, 11 Mar 2025 20:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gjZifLhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F03D10E680
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 20:12:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B2A9A5C2568;
 Tue, 11 Mar 2025 20:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47A7C4CEE9;
 Tue, 11 Mar 2025 20:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741723941;
 bh=3+OnOIdluvq4El08WnHUY5Y/kcwnOu3x4aGLqAkuCrs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gjZifLhPPGXcer1ZAWIyK1S2tH/lt04SIftXSYzZKGfP4lXtZMsmn0Eayh4HpB96b
 9/WqmOe6ugZVmY0LQ5SSZW9kBXMR2lxu5SNeNjoFIMide30s/REq6ZNBAcdJlrVORp
 he21oJCRdGMpi/X6dYz0x6Og1QgILShA9Vtz4Zfqdtms9SIwKr6HEFsbEAuMctd6Sf
 BS0G/1eyAkCusG9Gt/HbcO5zM24U61hX4ZUeBvWsFP2u4HRO5jy6CgLN+tuJGbunvQ
 dvSLNH9QnttCUnXihzQwUAmxtSH/2kN0drCOaMIev3rf7vlKgSyJqUbc/XYZSod+Vo
 HijI7bZDk9tuQ==
From: Mark Brown <broonie@kernel.org>
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, 
 sre@kernel.org, lgirdwood@gmail.com, alexandre.belloni@bootlin.com, 
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de, 
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de, 
 linux@treblig.org
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
Subject: Re: (subset) [PATCH 0/9] Remove pcf50633
Message-Id: <174172393659.371198.1480937233663952854.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 20:12:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
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

On Sun, 09 Mar 2025 19:36:03 +0000, linux@treblig.org wrote:
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> Remove it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[6/9] regulator: pcf50633-regulator: Remove
      commit: 248bc01138b11ff3af38c3b4a39cb8db7aae6eb6

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

