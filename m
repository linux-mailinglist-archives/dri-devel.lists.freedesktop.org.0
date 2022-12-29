Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F8658FBA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 18:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D183110E407;
	Thu, 29 Dec 2022 17:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B90E10E407;
 Thu, 29 Dec 2022 17:24:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61FD161856;
 Thu, 29 Dec 2022 17:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91937C433D2;
 Thu, 29 Dec 2022 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672334626;
 bh=vXZz42vBy4NTuSOw0w/VQKB5txhxb7nLQ6ic+zOL0yY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JW426D2JCegmHx6OxCzMuBSTmFSJqUnegLuKz58qKcpy3u/1hRMfPYi/NB0Mqpt14
 XijrzQ2H5uJY8zlV3W1P9lmgFPOUz1spnNLZfEi/EEDK8JRqHj8tBn/lgXg+SIl6cx
 XHOnKXq35I54pFxAc7OXQaW30AB9oQf1FIUI7q1A17I6/88/djTSU9lmIInFvY6dFV
 HbQ3Rd3dEfAs9I8TZ6G5mFiwSD7nl5DSg6KE2xcMSJK8HCGPMx0cFtLVHi+jYInvtl
 GAhKC/DHjAaK7FuInrRC6V50qPCpg9bkcxqGOhWm3wy5ZnKq2gbybICCOpAmDecMZe
 4thujMZbsiwXA==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: display/msm: Add SM8150 MDSS
 & DPU
Date: Thu, 29 Dec 2022 11:23:25 -0600
Message-Id: <167233461761.1099840.9860716141082316097.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221229100511.979972-1-konrad.dybcio@linaro.org>
References: <20221229100511.979972-1-konrad.dybcio@linaro.org>
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
Cc: krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 sean@poorly.run, quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Dec 2022 11:05:08 +0100, Konrad Dybcio wrote:
> Add bindings for the display hardware on SM8150.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: sm8150: Add DISPCC node
      commit: 2ef3bb17c45c5b83204a845bbe4045eed11bc759
[3/3] arm64: dts: qcom: sm8150: Wire up MDSS
      commit: 98874a46686b78d2f303de1a898b7b7cc611e30c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
