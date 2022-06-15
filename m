Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6B54C60D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 12:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD7110F305;
	Wed, 15 Jun 2022 10:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0375D10E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:28:23 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id x16so7781215qtw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VRRIXOfBq1yQuH5EfBFqRJA+XF3LzpkQlfmJRxNlHxM=;
 b=eTPtLP4NDpa8P0aI9dKapfMCGv9h90H8cChydbnDbXwDM3c9dFce+zWip7UvMIpzAj
 MwWt4NSMWMqrTbGPwJOf7l27KNudx15eMZzj6SyR4Zlj5OpOoagmM2K/3bI+5LT3Niyi
 h1vN0EW/aD3emP+jNz1Zcr7cozm+JkmhQecbNLlW+mU39R/LAtqcL2ahfL9sPHZJmXtA
 n+McjAPLlSceH+/folG8esKMX+j5OcZkgls4MZ7OITX1SzUtIIuFxa5K+LPw/fz8Cv5V
 vwmBMQsLsRdxHoNvxi45kD3Ty/9jaUWcXcCG6j3dwqXXCZ+czmFsSDp+cv482KfCuh2i
 qjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VRRIXOfBq1yQuH5EfBFqRJA+XF3LzpkQlfmJRxNlHxM=;
 b=gThHluHfVdynNorjmSh5Fkt3N7CtCCDhop4k/hzD/DWBD2zYmYsAOI98ii4CyVZO7d
 yGUtRUpYUQBa9Q/Uda6OF5vXZYFvwU9sQnLF6pXrwnhh0i5/nVa73aJD1xUhc2g3e6VH
 +gDP3auAgfWcrfgzpHH7ao0i4TqAmgfuf2G6lptkOTWVZYIedJj/iU12XHn7YGZw20qY
 7PkxXoFPFrigLqhhWswOb8S7PTMeUZwJYx5rTRg5NbRCDLNIcw73RuZOaLeVdCb7ZK6Q
 CaxCWGhev0o6lkjYZ6mMAOZwfAMkV0/lVG3LnEqqPO7rYF61E2UprQCBXQEWPb+ZGY4F
 qBRg==
X-Gm-Message-State: AOAM530MS4UKDeB9CD2S4CuZ0bljTYBCwZ6MPHs3cNmzDb9nZI3c9NHZ
 TnFYM0iLkb4x5JHnrDWXUcRBLu2VC8fw/116ssLGow==
X-Google-Smtp-Source: ABdhPJzgorGZ/k2s8/OSl6pg37NaKBcKW1yennvKVAegxKpGmun7X2J8lIgtj5Inxl+I5AXypY0S3fE/EQB34TCAN80=
X-Received: by 2002:a05:622a:1351:b0:305:2e58:939 with SMTP id
 w17-20020a05622a135100b003052e580939mr7765424qtk.295.1655288902992; Wed, 15
 Jun 2022 03:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220614230136.3726047-1-emma@anholt.net>
 <20220614230136.3726047-2-emma@anholt.net>
In-Reply-To: <20220614230136.3726047-2-emma@anholt.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Jun 2022 13:28:12 +0300
Message-ID: <CAA8EJpo=vLmsBRo16_xfbSdfFGvR1ocyuXm=2mqRR-9wyUESvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: Enable per-process page
 tables.
To: Emma Anholt <emma@anholt.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 at 02:01, Emma Anholt <emma@anholt.net> wrote:
>
> This is an SMMU for the adreno gpu, and adding this compatible lets
> the driver use per-fd page tables, which are required for security
> between GPU clients.
>
> Signed-off-by: Emma Anholt <emma@anholt.net>
> ---
>
> Tested with a full deqp-vk run on RB5, which did involve some iommu faults.
>
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index a92230bec1dd..483c0e0f1d1a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2513,7 +2513,7 @@ gpucc: clock-controller@3d90000 {
>                 };
>
>                 adreno_smmu: iommu@3da0000 {
> -                       compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
> +                       compatible = "qcom,sm8250-smmu-500", "arm,mmu-500", "qcom,adreno-smmu";

I see that other dtsi files use a bit different order for the
compatibility strings. They put "qcom,adreno-smmu" before
"arm,mmu-500". Can we please follow them?

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>                         reg = <0 0x03da0000 0 0x10000>;
>                         #iommu-cells = <2>;
>                         #global-interrupts = <2>;
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
