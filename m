Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC9A5D080
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 21:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA94010E68C;
	Tue, 11 Mar 2025 20:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HWnpb1wG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FD210E686
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 20:12:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BED515C54AC;
 Tue, 11 Mar 2025 20:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A082C4CEEC;
 Tue, 11 Mar 2025 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741723945;
 bh=aG8lVFvNtP8J6nlAUQoM2tb12NQ0LmUQ/5LfiFA5s94=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HWnpb1wGyF4g//SlyZAJpWzL1HpXqjbhBCvuxh3senUqbTFEoYXnI08G7f3cVlyG/
 kxWw+7iFj+bU9iAPzyh3NNmhyq/Uh6u2lUwZt3GzWTfZTWUa3/vxSO03XaWhH2Yw5R
 CtV13E03i48r/HmzaLxe/ad8WikUpD8VDK3GHlcQ7UUmwHAUjsWgf9jBaVJnJTYbed
 ydVBErLMkLiv8L+f+w+BFyRhvhkoiyHJ0AIDrXNdcfUgNWiCIG4zQmdYayhikpZ9e3
 y5SWYSB9XHf7KKih3K4oKfVXvvi+ZKzXapKB/GCOBsM9pcpFOEnZ0Q/foiWEIAHxNH
 VcCQREybLkm4A==
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
In-Reply-To: <20250311014959.743322-1-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
Subject: Re: (subset) [PATCH v2 0/9] Remove pcf50633
Message-Id: <174172394137.371198.5965546226649774705.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 20:12:21 +0000
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

On Tue, 11 Mar 2025 01:49:50 +0000, linux@treblig.org wrote:
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

[5/9] regulator: pcf50633-regulator: Remove
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

