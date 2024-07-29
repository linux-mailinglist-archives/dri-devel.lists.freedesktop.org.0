Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5AB93F98A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 17:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625D10E331;
	Mon, 29 Jul 2024 15:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WFTE+tIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7BE10E331;
 Mon, 29 Jul 2024 15:34:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E474A6170D;
 Mon, 29 Jul 2024 15:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E773C32786;
 Mon, 29 Jul 2024 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722267249;
 bh=mzYFMovn+k7oVAsF37f/0receWM06j5IkQ9VA/yeUSY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFTE+tIvunFR1D9DNkIqF55hQDwc3o0SIrQXCY63uadpyNrUK9i9Ve8Mo6yEuVuIr
 7+ZnWNChbJYYU+5kVHH0FiCKcRj76aLrBfD2MCZKJErMj7ktvMfx6KIis+kAELmq2v
 uewS370vaUQgIHEFCHKKo/5u5weNvwx8ghVBcq9m4tT+9dX5xRl756+lmbYgjNqDjx
 L68QbFr6R6HKwzxAIDAkDUZqmaS5DPoFD6zk1XYcRKNDwz+eVHS/EyHm5Gs3J6NMxG
 E1aCpNVUpWSp9z/p0pGVfxpD5lNyaKICJAdkYEdQ/l8f8B88NyANpKVYIoCGXKYYTU
 I3zn9rriTNlEQ==
Date: Mon, 29 Jul 2024 10:34:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-remoteproc@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: Batch-update Konrad Dybcio's email
Message-ID: <172226724571.728425.2439563101739958891.robh@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
 <20240726-topic-konrad_email-v1-3-f94665da2919@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726-topic-konrad_email-v1-3-f94665da2919@kernel.org>
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


On Fri, 26 Jul 2024 13:18:25 +0200, Konrad Dybcio wrote:
> Use my @kernel.org address everywhere.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6350.yaml         | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml           | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml            | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml            | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml          | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml          | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm6350-camcc.yaml          | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm6375-dispcc.yaml         | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm6375-gcc.yaml            | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml          | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml        | 2 +-
>  Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml          | 2 +-
>  Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml     | 2 +-
>  .../devicetree/bindings/display/panel/asus,z00t-tm5p5-nt35596.yaml      | 2 +-
>  Documentation/devicetree/bindings/display/panel/sony,td4353-jdi.yaml    | 2 +-
>  Documentation/devicetree/bindings/interconnect/qcom,sc7280-rpmh.yaml    | 2 +-
>  Documentation/devicetree/bindings/interconnect/qcom,sc8280xp-rpmh.yaml  | 2 +-
>  Documentation/devicetree/bindings/interconnect/qcom,sm8450-rpmh.yaml    | 2 +-
>  Documentation/devicetree/bindings/iommu/qcom,iommu.yaml                 | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-tlmm.yaml        | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml         | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml         | 2 +-
>  Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml         | 2 +-
>  Documentation/devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml   | 2 +-
>  24 files changed, 24 insertions(+), 24 deletions(-)
> 

Applied, thanks!

