Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B0AB354D
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 12:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20D810E361;
	Mon, 12 May 2025 10:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sQcWt05A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2FC10E173;
 Mon, 12 May 2025 10:55:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 787025C5D08;
 Mon, 12 May 2025 10:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48C6C4CEED;
 Mon, 12 May 2025 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747047335;
 bh=MGOd2Z+p+ESGQAlLsoi7LwKL0U0PKPIY60mrV4IPIQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sQcWt05Aq7N0fmStblOYhERI7+0O02J46jIb9EnFzetPA31Bd+/OrkCSVUIeEwVWS
 6rklwsLm1IChMn4Tc6GD4njMR4fWzbRComYRaxYElueCtjHLba80cmK8BwlqVaaPOT
 8i3FEWf/qCQIBTy3n2eKnQ8MANwgSrCICGAMHb0Zca5r+0PqXaADurjz4IreZNuMk/
 zdk1vMejifL7DBMKUsOkmRmZuv1lRSlsxtmECOwImLrP8+H/yiGF9XMQyoACEsabo/
 mZjg7+a9GxSpeaZhLsI7HPBolRQPxIrqVD9O577NJ+j/u9HZpePoSH/Bs7y5EeAynP
 IsjHpiW2nRR4A==
Date: Mon, 12 May 2025 12:55:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display/msm/gmu: Update Adreno 623
 bindings
Message-ID: <20250512-fantastic-rapid-myna-e5ba6f@kuoka>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-1-d4da14600501@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-a623-gpu-support-v4-1-d4da14600501@quicinc.com>
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

On Fri, May 09, 2025 at 12:51:39PM GMT, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Update Adreno 623's dt-binding to remove smmu_clk which is not required
> for this GMU.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

