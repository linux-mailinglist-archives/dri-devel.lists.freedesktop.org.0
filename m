Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13963F4FAB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4BD89B66;
	Mon, 23 Aug 2021 17:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FF989B66
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 17:38:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D2CF61378;
 Mon, 23 Aug 2021 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629740315;
 bh=/EBUUWEDni1MyQopat5em0GN1R1LMCsO+1c/XNA3TjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zdt5llRQc2dcj8DuNexw5Yx32BfI0PH5l9IJkAjDmu1vA0hw+M8hkSCJd76gjo1f+
 h05QtzgIzceLgzDBx5HOY0LoBzjY52PQMTjiiiLwgnKv1sO6KWO7aAur+hj8E6P3MU
 KynJZMkKjyU/ybwM8UjMy255t5vEMlR/1D5fkgwlIFqVqS1CYzBJH9GRp7cKFNq0Gj
 zRnhixl0BOrXpQtAP51iUfgj41Xkdr3jFRfR/DSqSRmyWRxwEEwEWQoUtVGr5/c7Rg
 Zi3hg3bAbw7GTTX8/6RypyoSLzrNxnHdiudYcONEE08YXIDBKKimPLZQZ6Aix6ephf
 rXf+qB+eOrwTA==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 alsa-devel@alsa-project.org, Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: panel: ili9341: correct
 indentation
Date: Mon, 23 Aug 2021 18:37:55 +0100
Message-Id: <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Aug 2021 12:10:19 +0200, Krzysztof Kozlowski wrote:
> Correct indentation warning:
>   ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] dt-bindings: sound: rt1015p: correct indentation
      commit: 0aeb17d1728257f29131a290f0cc8e281cc7274c

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
