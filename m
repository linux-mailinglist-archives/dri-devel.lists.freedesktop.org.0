Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B6A06FAF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437910E456;
	Thu,  9 Jan 2025 08:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jgMMWCEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE010E44C;
 Thu,  9 Jan 2025 08:06:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0AE24A4135B;
 Thu,  9 Jan 2025 08:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647B8C4CEDF;
 Thu,  9 Jan 2025 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736409983;
 bh=qBbfHEZ+8VkJLNdIID51HsKf3XuVcwLbfONladZVSUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgMMWCEhgqpNMX/qhjYAeRmSm/nEpjyi3jemX8LF8QGzlD4TYuKJcqXLIFzEYeSys
 nZPQs+hlvqI6FyW5ABCW6v8X+F+nJwtRwMTuoXkYJQ2hZ11WR+VkaMAfuPWz1fcbln
 w1ao17MeZ4sJ2fqfZkWmlw8Y2OgKayAngY2KmRfShsVLJzgB6//nIZM9XiQnK9gsz/
 RMyLLm8DY55upYh3rysEVEUV3E10uPPiHO37FZZGylwyrQ1vnQOXZfSApMW7ioDAfr
 jUIuNT5g3o613iycsvA0cs1aNILv5dYCjNRI/R/GfB8n32dvdgLoGbU3Y0wjcjiCpv
 EhbUhVHyreMRA==
Date: Thu, 9 Jan 2025 09:06:19 +0100
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
 Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <67mvekrysu2ms5dsvjyh37wbl5dmcnk2r3xnow2e5xeeqahhrr@ar5zsq3wzip3>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
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

On Thu, Jan 09, 2025 at 02:10:01AM +0530, Akhil P Oommen wrote:
> Add a new schema which extends opp-v2 to support a new vendor specific
> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> property called "qcom,opp-acd-level" carries a u32 value recommended
> for each opp needs to be shared to GMU during runtime.
> 
> Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> new file mode 100644
> index 000000000000..de1f7c6c4f0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Adreno compatible OPP supply
> +
> +description:
> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> +  ACD related information tailored for the specific chipset. This binding
> +  provides the information needed to describe such a hardware value.
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +

You need select: here. See bot's warnings and other schemas, like
primecell, how they do it.

Best regards,
Krzysztof

