Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A4A3066A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BCA10E44A;
	Tue, 11 Feb 2025 08:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P5lFMvTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE8B10E44A;
 Tue, 11 Feb 2025 08:54:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8E189A4014E;
 Tue, 11 Feb 2025 08:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF412C4CEDD;
 Tue, 11 Feb 2025 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739264060;
 bh=/dRLsDYS1EDSH23L/y6b3V/T8AFWJp0V0qlJ6R6eBRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5lFMvTeUJpX6TftMGJtnKy2l37/8p3+9fpmrkGifcV74pJklpnLVbLnNH1QO3WfQ
 skP31RjAbWndfWgbUYbwh7XpnSwOBBaAixbbyaPyDYyveyUdojEhYYoOGHAhxErUER
 cLUtFZZw3h4mJoAzVuzI0QMbqM1tnkYG8LMsUwhzHPizM43qlTdfHAYWXAV8TPWDUM
 oiaqCg/DLgPFvtBemQgI7HzIWPw36HfKTLiX+fO8AiexdiBxP1IagAVNKszkKrQb9a
 dZktFZtrzKCIjI926Jpq5e9ww4p+1eOITyimn0CjRtTxb5ruqx5ji5Z++PhKt/Lr0c
 z2ddW6JZ/Cp5A==
Date: Tue, 11 Feb 2025 09:54:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: qcom,sm8650-mdss:
 explicitly document mdp0-mem and cpu-cfg interconnect paths
Message-ID: <20250211-rainbow-dazzling-herring-2f08a0@krzk-bin>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>
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

On Mon, Feb 10, 2025 at 10:32:40AM +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
> makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg
> is required, so explicitly document the mdp0-mem/cpu-cfg interconnect
> paths and complete the example with the missing interconnect paths.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml   | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

