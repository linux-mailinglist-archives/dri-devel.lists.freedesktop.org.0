Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19E7504B4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70410E4CE;
	Wed, 12 Jul 2023 10:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627A310E4CD;
 Wed, 12 Jul 2023 10:36:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89FC66173B;
 Wed, 12 Jul 2023 10:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9964EC433C9;
 Wed, 12 Jul 2023 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689158158;
 bh=1ZR/RKV2DlzbR3SX6BTWRQmsK1bpq2+ZztUMiAfbqKc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R9SLZ09m1Rh3AEsPeUTnzP3pcQtwTY1lZJL2z1st0pNXkxRqvxcn/Nmx9tV4p9OF0
 dfh1or+wnApHIvgivfrqFfPCjcdleJk3HlTrT544ztJCqGqpe7xYEc/sQdCzTcr9uW
 HDZkEZxfUJR4t/ZezHV8ZmrbzE+sknAXDs+Pf+X9rWmVNtR70N5X9iYYz0+S6vWhXd
 XWP0U61oJttz8YxhSwptD2oXxk+s22duHZAL11/mNC8Gul82BU/V9jiwNdfZzcL0fW
 fDG+96uazkTSKaZ9A2UQtBOryEDfydBGaMzMhI+8+Xyp0KR3MUMFyQC7OqBA+tS+KH
 iipaGVMPqQP7g==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] Qualcomm REFGEN regulator
Message-Id: <168915815219.10612.17171163066599783994.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 11:35:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Jul 2023 20:15:53 +0200, Konrad Dybcio wrote:
> Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
> responsible for providing a reference voltage to some on-SoC IPs (like DSI
> or PHYs). It can be turned off when unused to save power.
> 
> This series introduces the driver for it and lets the DSI driver
> consume it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] dt-bindings: regulator: Describe Qualcomm REFGEN regulator
      commit: d16db38c2a66060ee25c6b86ee7b6d66d40fc8e0
[2/4] regulator: Introduce Qualcomm REFGEN regulator driver
      commit: 7cbfbe23796086fdb72b681e2c182b02acd36a04

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

