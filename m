Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCE0583580
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 01:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8912A3A5;
	Wed, 27 Jul 2022 23:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BE512A36B;
 Wed, 27 Jul 2022 23:02:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5F2FB8228F;
 Wed, 27 Jul 2022 23:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1783CC433C1;
 Wed, 27 Jul 2022 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658962936;
 bh=AdsKgGHCXI9imvYfy+I20tUYhz9EyMmLwfEERQw4nl4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oKh7ksyYUToFtcczj41t5WYCMWeMIWSmuceXJVxmXmFvvYl56bdj5icCcUAyl3J7I
 tZpc9oLsLYFRAnP1z9zlRbkASFBxNRzGoJZyXGBTC2pbksftdIpzwG1Xd+JLwxnX6B
 mJKiayoovdG8qyJD1mJnlZCG4ILBLlM8EGe7SVslf72r5pFGN8SV7mNYpU3bTynZJ1
 cvbFd0t147o5oLUCe7GpHCnIFj3GjdGuxT6bPjGl6aiPjaFZIYJIsRNPpQNbmyFALn
 l6M8zg1UBz5wK7RyKuH1owNopId5w3Smbc1Tpvzgc/R6Ck18q9M7ww1qsZhKGyrwvR
 KOQT5grSI/3qg==
From: Mark Brown <broonie@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
Subject: Re: (subset) [PATCH v2 0/7] drm/msm/dsi regulator improvements
Message-Id: <165896293178.2380971.2148826667552046082.b4-ty@kernel.org>
Date: Thu, 28 Jul 2022 00:02:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>, Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>, Rajeev Nandan <quic_rajeevny@quicinc.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, Vladimir Lypak <vladimir.lypak@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>, José Expósito <jose.exposito89@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Jul 2022 10:38:17 -0700, Douglas Anderson wrote:
> The main goal of this series is to make a small dent in cleaning up
> the way we deal with regulator loads. The idea is to add some extra
> functionality to the regulator "bulk" API so that consumers can
> specify the load using that. Though I didn't convert everyone over, I
> include patches in this series that show how the Qualcomm DSI driver
> is improved by this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[4/7] regulator: core: Allow specifying an initial load w/ the bulk API
      commit: 6eabfc018e8d1033e7fc1efce30a872e2dccb537
[6/7] regulator: core: Allow drivers to define their init data as const
      commit: 1de452a0edda26f1483d1d934f692eab13ba669a

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
