Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFEED0DAC4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 20:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0240B10E09D;
	Sat, 10 Jan 2026 19:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qCiyrFAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7010E030;
 Sat, 10 Jan 2026 19:11:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D2D260168;
 Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EEFC4CEF1;
 Sat, 10 Jan 2026 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768072294;
 bh=ifQtDtBDcokzLccqf8aQCht97s3eipcMMEmXbpDw6Aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qCiyrFAU2xicKCibTXPIf3XhBQmk0g6ZWmSgHHXVP1B02QbrV77FWTZFOP1VjWDCw
 qjMrQb+XKb5f4XadhrY/24Ap8FT4i3zPkyp8Hq83pZ7Qd05yBLYY/SjBLAoBYN1J91
 tZcXYUR9WCowuaBnwQNH+5l+izoJ34YwXyJn9pNjN9mFqtBAcF6dVgtvosb5DN2PQH
 UkWDCIMetOEIB1XAkKVOYI7Wkyc0F3Lm5PBO/vh7rnB4GSTP0L4HqCSOjm7fLM7dry
 DJ/5zv35sUADTSmPEivxJvudoLJxOMiPSlaVLC0wreck+xhcPR7Tw1K+pdiPCNoYJW
 fAQibqBj2d1ug==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 sophgo@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 00/27] clk: remove deprecated API
 divider_round_rate() and friends
Date: Sat, 10 Jan 2026 13:11:17 -0600
Message-ID: <176807228457.3708332.10766520174431957453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
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


On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied, thanks!

[14/27] clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
        commit: e1f08613e113f02a3ec18c9a7964de97f940acbf
[15/27] clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
        commit: 35a48f41b63f67c490f3a2a89b042536be67cf0f
[16/27] clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
        commit: b2f36d675e09299d9aee395c6f83d8a95d4c9441

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
