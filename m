Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965FE9667BD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1D910E069;
	Fri, 30 Aug 2024 17:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NONv074o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542C610E069
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:14:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17E3E5C1119;
 Fri, 30 Aug 2024 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84A6C4CEC9;
 Fri, 30 Aug 2024 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725038063;
 bh=H0wJ8wsMUAah1G02ZzmrdrdnFaoSA3Mc9Ef9ZQp8UDw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NONv074ocJd0COZKyehHgQa/K5T3X51wcgIKZ0DLPRj4WPPJcMF9Lzgetr0xDpZfw
 iyX5lR6UQStuwoPjFMlb4Spzv77o6jEPx+Puo35bl+4ffPcF6Df0Upeatn9Ncbzmgt
 PDGMvOXg2HwWWPxbIJ8pJujZfzxPoqOqpAi/vp/av8RhpNC/6YxZCAymnzekHnE71O
 kSHc89slXgfRp7cOTlg4zHjJCsL1j6CICu1G5+ClSBE1nOJUi7MKlWboeHEUDi8Oi0
 TLzApWFEzGcGFWBy3ZDubain6Se8a5kDpZZVuyVv6Blsla+gQC1wlqTW6OinuTTJ/A
 Sc6d5IrFYLBag==
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20240830073511.1.Ib733229a8a19fad8179213c05e1af01b51e42328@changeid>
References: <20240830073511.1.Ib733229a8a19fad8179213c05e1af01b51e42328@changeid>
Subject: Re: [PATCH] regulator: core: Stub devm_regulator_bulk_get_const()
 if !CONFIG_REGULATOR
Message-Id: <172503806142.196819.2979143374573134626.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 18:14:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
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

On Fri, 30 Aug 2024 07:35:12 -0700, Douglas Anderson wrote:
> When adding devm_regulator_bulk_get_const() I missed adding a stub for
> when CONFIG_REGULATOR is not enabled. Under certain conditions (like
> randconfig testing) this can cause the compiler to reports errors
> like:
> 
>   error: implicit declaration of function 'devm_regulator_bulk_get_const';
>   did you mean 'devm_regulator_bulk_get_enable'?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: Stub devm_regulator_bulk_get_const() if !CONFIG_REGULATOR
      commit: 1a5caec7f80ca2e659c03f45378ee26915f4eda2

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

