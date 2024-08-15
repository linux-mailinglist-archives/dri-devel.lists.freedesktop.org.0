Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A75953D63
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 00:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E684710E53B;
	Thu, 15 Aug 2024 22:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bAiS1evz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E93E10E539;
 Thu, 15 Aug 2024 22:44:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A51362034;
 Thu, 15 Aug 2024 22:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9291C32786;
 Thu, 15 Aug 2024 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723761878;
 bh=VQVwGklaI3ZSA24hRUS3BioayMkSZq8f6rSuQ+wiwm4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bAiS1evzyrbktfGk54uagHfLPIPhysQriDybBBU6lw5kJ9ScGMo9+MiJStry8jcDp
 NmW9NOkV0IF5umkkuqO5lKi8BVCXD7t93P2jR2Wfad41I0tqBhuARa9lLgVQIXcM7z
 Kts8mo5+nX6CDoiMoIJ0NSzZFnKk/lY5/bEkIE2lQHiTsd5gkSpcAsQIBUOwibm4j2
 F34SOcTUzFoRqp91S8zDRFg+Se2uj6RkIi9U/8QFLegpfyn6TcQW6WtgvcUwCr6eM6
 fA6hvZSooj8Y4rFBcAcVlxa1jN/ZH8IEVYynDf7f0toNZRlMkYjqzR7dvhhWxdeiw4
 QBampIF7y8Eug==
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
Date: Thu, 15 Aug 2024 17:44:32 -0500
Message-ID: <172376187142.1033860.796127870290361446.b4-ty@kernel.org>
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

[09/11] arm64: dts: qcom: sm8350: add MDSS registers interconnect
        commit: 5e1cf9f1f397a3d24dc6b06eda069be954504a16
[10/11] arm64: dts: qcom: sm8350: add refgen regulator
        commit: 08822cf3de00f1b9edb01b995d926595e48a54eb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
