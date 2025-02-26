Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D0A460FB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CFC10E918;
	Wed, 26 Feb 2025 13:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MO1HF207";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B41C10E911;
 Wed, 26 Feb 2025 13:32:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F08161237;
 Wed, 26 Feb 2025 13:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7452C4CED6;
 Wed, 26 Feb 2025 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740576729;
 bh=87XnNLS5vX+w11/Z+SmXBj0sS8D51hZWXWwqpckuLdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MO1HF207lu5OxxGlBGpLsRjkUTdAtTRgQFPFa0UKKxxPPonRiBCQcs18JJDVExy16
 8szssYjWaU8BeY1FVI37zFA49AlLuOKH5Di74fPMeTipoT/LsCT5ziGvCa3o81uQ92
 5VWuoE9Te4LYMbxo53+UC9dJx17YUlL9z02zpxkQIm0pWkiUwWswYYTk7tUlwF/2gb
 oBILwYzQ0MAvrEiIIyUNLJArSnxdWDX+6m7tH7WSXADzaYhFkoxrMKMpRz5OG3dqdv
 nORcz9g35yqluagNBkUK7KMK51uHeNzqY735133A3Je3TyTKCT7lZMEYQaF9ENuQKx
 SdPUrkl2pTlag==
Date: Wed, 26 Feb 2025 07:32:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: Add
 missing eDP phy
Message-ID: <174057672730.1813399.10950790122107114702.robh@kernel.org>
References: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
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


On Fri, 21 Feb 2025 16:13:11 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
> in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
> missing device node in the binding and extend example to silence
> dtbs_check warnings like:
> 
>   sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Fix reg size (address/size cells =1) in the example (Rob)
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

