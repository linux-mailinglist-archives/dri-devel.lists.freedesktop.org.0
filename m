Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D8953B93
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 22:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8FF10E547;
	Thu, 15 Aug 2024 20:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RyV/ygaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473CE10E547;
 Thu, 15 Aug 2024 20:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BBC561FE4;
 Thu, 15 Aug 2024 20:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E154C4AF16;
 Thu, 15 Aug 2024 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723754467;
 bh=4KDaCGbSNqiZk9DvkwczOryM/7JAKZJoBwRV7J2iOQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RyV/ygaHxqLeDKcNLkST1W9hvqTOSm9jmWb3eevfspe1avEkHl0izyJ/ICLHIVGDr
 FXcCSpbOUgj6QYs00c9z2hzGjnrKDlIaNGApf8FoqWmeGX69wyjuwRFDA7SHmWAp5i
 PB2bmFUxh8LWTRR+aYlMDcib/q6klTC9QumA0GS9r1AHZakRoVGEbGyyArjtg9wEiR
 1i0ViY52R1Ms2F55YvTBoRU4J8fcRbJ4Qh9Rms1BdJL+saZ+vQ7hIz67b2eg3PEKT5
 givQyozG7FOX+qn8LZ/kn0sCCgDhmGal23HuhaZLEIpUvzumV7ptgJqEfb3jbgDgHM
 xjD86fiQAawGA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mike Tipton <quic_mdtipton@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: (subset) [PATCH 00/11] arm64: qcom: set of fixes for SM8350
 platform
Date: Thu, 15 Aug 2024 15:40:24 -0500
Message-ID: <172375444824.1011236.1594911619896752687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
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


On Sun, 04 Aug 2024 08:40:04 +0300, Dmitry Baryshkov wrote:
> A set of fixes that target stability of the SM8350 platform.
> 
> 

Applied, thanks!

[11/11] arm64: defconfig: build CONFIG_REGULATOR_QCOM_REFGEN as module
        commit: 115c14ee54aae1d61d2405f9b31f67c1e8947f4e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
