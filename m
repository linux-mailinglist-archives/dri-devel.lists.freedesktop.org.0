Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6AF681FD9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 00:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DA510E2FC;
	Mon, 30 Jan 2023 23:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE04410E30C;
 Mon, 30 Jan 2023 23:46:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34359612E4;
 Mon, 30 Jan 2023 23:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505BFC433EF;
 Mon, 30 Jan 2023 23:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675122374;
 bh=MrzmYuplehy47+jA2Yiiur0CaZV7d/G6CEmH37GtHDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OrmuO+15ACCEqvKhMq4ypFVtWcTzkeqlxW32fLL9B7Fvp6SCbDTyqxKFj7xXxtf6a
 H9vg9lfkrxs2x4jjoJPuiE7cNBgamiHVjV5X2t592jqUh2Rli6rhiKWalJJRfGTs2o
 IU2j69U7ehtsM9qTTO3rx6NOHAXkTAnLxw/Dhk5FjpAscYtAaUaqgeL1t4OQGIdBS3
 WNZpVBLg6vueIZxv5p5XW+O1HO8LT7vMADDo8FJDiINE/PZiBrZMb3n+NT4nF1Pg34
 q+E3z7h957jwtQBustKW5EckwWgkjhTlhlGDd+qww7ICxQ3m+T3wp2MVVGE3FIsQIo
 GwqHw4Gyx/y2g==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org, linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
 krzysztof.kozlowski@linaro.org
Subject: Re: (subset) [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
Date: Mon, 30 Jan 2023 17:46:10 -0600
Message-Id: <167512236602.4092892.13590634993322919413.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
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
Cc: neil.armstrong@linaro.org, loic.poulain@linaro.org,
 quic_abhinavk@quicinc.com, sean@poorly.run, swboyd@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, quic_rajeevny@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023 22:00:53 +0100, Konrad Dybcio wrote:
> v2.5.0 support was originally added for SC7280, but this hw is also
> present on SM8350, which has one more DSI host. Bump up the dsi count
> and fill in the register of the secondary host to allow it to probe.
> 
> This should not have any adverse effects on SC7280, as the secondary
> CTRL will only be touched if it's defined, anyway.
> 
> [...]

Applied, thanks!

[2/8] arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
      commit: 6636818ecf0f1d448360835017473cf94a0ee967
[3/8] arm64: dts: qcom: sm8350: Fix DSI1 interrupt
      commit: 1eed7995d9da0489e5a46c13bd888ffa987ead98
[4/8] arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
      commit: 0af6a4012b3815ebca7b8080a286edc01e4a89e1
[5/8] arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
      commit: 45cd807de14388010a279765486c13f8ac540dfa
[6/8] arm64: dts: qcom: sm8350: Fix DSI PLL size
      commit: e3e654ced376060d64ede8e2dfde0b1bac0f9086
[7/8] arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
      commit: 2a07efb8c08619888428cc8fd47643c438111f29
[8/8] arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
      commit: b904227a4b693fbb9d5eabc9d7100dc01d9eb973

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
