Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3599C19A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484C710E3A9;
	Mon, 14 Oct 2024 07:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pQGK204I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959D310E3A9;
 Mon, 14 Oct 2024 07:40:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 912BEA415ED;
 Mon, 14 Oct 2024 07:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F5CC4CEC3;
 Mon, 14 Oct 2024 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728891617;
 bh=Wcac2XZQHtmBThH5hyHn0l9csa4sK/TVqzzdehNcWEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pQGK204IOJEOFB2eQYIjXUxFQwV3E51A1qVpfa/WwbX7JCtebBipm/AbDpFfTdXZS
 lXCF/bsJ6bi6tjRx+fzVjqhHLZzR9xOCPIO0pqeaXX2acNREA08hwdgtQzaXAcSTUR
 ggXYB1HA6eXG2uV3uA0kxMlUa8Z/FPCgx3vKyzem0Zj6OCWfPzyRXLjvFnP86rp8ZF
 q8Jos+wCeVyzdv7iMWKVFZI9rg2QOSoe6NhewPuZTyqdE7AOPAKatvbkQ7bKUDoxBJ
 4fcReYuU738t5PJ663As+jiKA2tfAgqDkBuG2N3aBehdeQ52mxWo3DV05Ct4I9eT9P
 7ZRUgJcciHR/g==
Date: Mon, 14 Oct 2024 09:40:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
Message-ID: <5axuqj4hetfkgg2f53ph4um24b7xfyumktreglxqyzfsdhy25e@deucq7vqxq5l>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-3-1e5e91aa95b6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012-gpu-acd-v1-3-1e5e91aa95b6@quicinc.com>
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

On Sat, Oct 12, 2024 at 01:59:30AM +0530, Akhil P Oommen wrote:
> Update GPU node to include acd level values.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a36076e3c56b..e6c500480eb1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3323,60 +3323,69 @@ zap-shader {
>  			};
>  
>  			gpu_opp_table: opp-table {
> -				compatible = "operating-points-v2";
> +				compatible = "operating-points-v2-adreno";

This nicely breaks all existing users of this DTS. Sorry, no. We are way
past initial bringup/development. One year past.

Best regards,
Krzysztof

