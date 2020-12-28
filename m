Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8102E6668
	for <lists+dri-devel@lfdr.de>; Mon, 28 Dec 2020 17:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D178899E7;
	Mon, 28 Dec 2020 16:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914FB899E7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Dec 2020 16:14:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D78D8207C9;
 Mon, 28 Dec 2020 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609172048;
 bh=naum8L8oSehOyhZmfJmb4m7YJLenIjVIzdFir8lLc4Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h1rW5zzIQZH4aI8WfiLkf/H3jx412sBhcSWA5zblH20t5VqzeAUM5+l5hlWx2HKGN
 xtaoIbdRQ6ci3wmoSmfGj5FYgAGz+Ytpo3xQVxrZcMTf4Jbi87JwHXB+cqmSTej1Hi
 jqOnT683Mx2vtMQZBuZtd47fu4vik+9M+wWEMAaffzxSWuogop784gvr0naI6ciwAV
 XUr/guDxdV56S7XLFygf/RxHXC9fef7t/ZB3JPQs1t5ZWrLrlGPaNX6I/fc4OXuQ3i
 qQ9ixa3umZpiAMsCXEybBvLvCPHYbLHYYjxT7w4+d1G7T9/kzJwV1yo24yT9xV53MS
 1XVn//AaQESiA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, jingoohan1@gmail.com, cy_huang <u0084500@gmail.com>,
 lee.jones@linaro.org, b.zolnierkie@samsung.com, daniel.thompson@linaro.org
In-Reply-To: <1608217244-314-1-git-send-email-u0084500@gmail.com>
References: <1608217244-314-1-git-send-email-u0084500@gmail.com>
Subject: Re: (subset) [PATCH v5 1/6] mfd: rt4831: Adds support for Richtek
 RT4831 core
Message-Id: <160917202696.51934.11035418068149645714.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:13:46 +0000
MIME-Version: 1.0
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
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Dec 2020 23:00:39 +0800, cy_huang wrote:
> This adds support Richtek RT4831 core. It includes four channel WLED driver
> and Display Bias Voltage outputs.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/6] regulator: rt4831: Adds DT binding document for Richtek RT4831 DSV regulator
      commit: 934b05e818620e922151734b2d0e070e388e3c53
[6/6] regulator: rt4831: Adds support for Richtek RT4831 DSV regulator
      commit: 9351ab8b0cb61ffbef30343d28d1855e329c98fb

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
