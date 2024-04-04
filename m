Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D589900E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 23:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91810E714;
	Thu,  4 Apr 2024 21:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BF/N7Jzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21877113552;
 Thu,  4 Apr 2024 21:23:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5060ECE3152;
 Thu,  4 Apr 2024 21:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8938C433A6;
 Thu,  4 Apr 2024 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712265804;
 bh=MbiEXqECtfE28I4L/YqGCi4YdPjgXndCB5nDSOfoEwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BF/N7JzovTAagOTZHtkNL5Nhf44bvqxKxOfTeurnbJd7ifWXZD4qGmheZ2hAN5NE/
 5vyX0HAUIabCACH6ok8LXqAzklRQiIOqDWktWN+PzO2m4c5fqQn20LVqRJkXFRUTLV
 fuC1sSUDJDaK1RL0DEqTkbNsTYy/jgAPjzCFeyL4/YxlbeUv1pPogrZHx5VrI5X6KG
 Jrvlnc8iPcGZDi2CpCLdXoGDUwDuYwgHFrlN/ln6FUzfNUK71HFpTzKWgLvvrPV9Is
 uzj0uTBt0yoaMKNDzWz5jZqw8s8JueY1O24D/t91o0Dx+TJoDhclV8VaRSXKy7iXjr
 vUbnqcdslpVUg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: fix several display-related
 schema warnings
Date: Thu,  4 Apr 2024 16:22:52 -0500
Message-ID: <171226578664.615813.3296104326825996144.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
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


On Tue, 02 Apr 2024 05:57:14 +0300, Dmitry Baryshkov wrote:
> Fix several warnings produced by the display nodes.
> 
> Please excuse me for the spam for sending v3 soon after v2.
> 
> 

Applied, thanks!

[2/4] arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      commit: 7fb5680b589d5eae64ada1d917b6ff2dab82f5ae
[3/4] arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      commit: 580701ec27f61e0996dd5fcd23b091b6bf6933e3
[4/4] arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes
      commit: 1106ea2266d11ebd97c3493a0c36a45272bfb67a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
