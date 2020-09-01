Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C221259164
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 16:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66066E444;
	Tue,  1 Sep 2020 14:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C805A6E444
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 14:50:39 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D1FA206FA;
 Tue,  1 Sep 2020 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598971839;
 bh=QhxWa/F/NMW+oameRtkqv5jXPp0FIPxPDF8V1I1dqhs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=AyJRxS3tQ10Mf0V/RCpt2UeJKOQ2AsPPul3WwEyWfe8T3NzcE8nSq+BGwr8EGrcAd
 5ivmBFoDxh0qLSJS7UAvRqAkWmLPMWHsEYxHbS8WnUtzuv7lXN7h1y53jsX41Mgv1P
 CJ/ovP+4vPqBdIW24HqlwfFO5/qx8APuDiAZ/pNw=
Date: Tue, 01 Sep 2020 15:50:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
References: <20200829142501.31478-1-krzk@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: arm: samsung: pmu: Use
 unevaluatedProperties
Message-Id: <159897179515.47719.9922715760129781914.b4-ty@kernel.org>
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
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Aug 2020 16:24:52 +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. assigned-clocks) so
> use unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: system-controller@105c0000:
>     'assigned-clock-parents', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung-i2s: Use unevaluatedProperties
      commit: 8187d8300251a99e40e288be80bef6a15b7b22e4

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
