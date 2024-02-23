Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607D86077C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 01:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AA410EABB;
	Fri, 23 Feb 2024 00:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RWcliE0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAD410EACF;
 Fri, 23 Feb 2024 00:15:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 36C3063397;
 Fri, 23 Feb 2024 00:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C7FC433C7;
 Fri, 23 Feb 2024 00:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708647299;
 bh=ALaTQHJzjzLX0q4pli/+d7/sB1mmAsYN8kZyIavFMIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RWcliE0rIhur5hiRYX4R0M8ZEPK7UCaliJX8CB+PxtbDKvi8Aahh/DYUfwYJbtQha
 QCBA903CEt/JMtUFPdFVMv+QEYYh/YWgUyd9E5d4rxuAKvqP+PdqwFXpv+JlNBdYHl
 pK67suVHaf94CGkt4q//DOt1qx2ywu6Fx27KrTH45LEGHMEIc6hPU71S8dwGp1MkzB
 9UftHahESHnfk8xvKpZw5NSbKBjXjiJ0JsZVPGoXVoY1EFgxSv+lXWzp9+Mcu54LfY
 9Irz0WiShZ4kTfru3E9cWQFyzfFT+J+S/fyPBho9o5DkzFVy9QrE9sNz7f+hFDnLp3
 T5uc4rQVWbQXg==
Date: Thu, 22 Feb 2024 17:14:50 -0700
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, David Airlie <airlied@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, iommu@lists.linux.dev,
 Rob Clark <robdclark@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Conor Dooley <conor+dt@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/8] dt-bindings: arm-smmu: Add QCM2290 GPU SMMU
Message-ID: <170864728970.3860293.1851655437327503155.robh@kernel.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-1-d260fa854707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219-topic-rb1_gpu-v1-1-d260fa854707@linaro.org>
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


On Mon, 19 Feb 2024 14:35:46 +0100, Konrad Dybcio wrote:
> The GPU SMMU on QCM2290 nicely fits into the description we already have
> for SM61[12]5. Add it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

