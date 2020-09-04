Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FF25E4B8
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651806ED10;
	Sat,  5 Sep 2020 00:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05889394
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:09 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id d189so6949054oig.12
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=doLJDgNe0qt085BNPu/3Io3kfNCUU7JOawvznIdKbdg=;
 b=Bls3T86mzryTn+qU1zsr/9PYb0zkdzQQ2ypAxX9SKP9tu98U+eVySYDoXF3jIyFa8G
 XH3HYfOWR693y7ALBNUYECipnhoSVq9uQtmNNn8ZNJMY3gWyc7pbJWqOcy39gmSAsouj
 U8vUn6yRiuL/09+Q3ZPurtyUqlRFuuSAdVbkVyt9CLW/Hw0QFIVg8PBZUUjOuAjxdnu1
 Eak3IlxA4JLKEFyjL/fgoyooxv3/37UcREE9CZ1SSFV7DDDliFlyEcDpvFWUzCLDScXZ
 bwWi0RyelmbdQqrcGz83/qEBJCTQpYYw3g4kHp1J/RwwCAauH4+RwTUXB4UB+CfxXbSP
 lZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=doLJDgNe0qt085BNPu/3Io3kfNCUU7JOawvznIdKbdg=;
 b=TSGTxztq82jui5iquOaq/SB0oJ/szorUAcj2fIJCtXfnfAx6VQtDDMSGCeR2WeXZP2
 chd2Axb4mVoCzEMdC/Kk2lPkFAyGD33/MPvHyu7zOXsDqjB1Ou14q4Btp38sQacjfvnF
 Ul6IfNIkjGaQeIxPBpgnYfSZ9Rv9sRBgdWSHHlHH/dNW3glzwUJgwMc9GjimBHXwWAiU
 CC5qHN3vkfutNbvdFSBpTj/jluxfVbM3U3Q2ITnpTZyoULPsniTm1TCr1mQvTZPOKZ+n
 fbzIfeWqZjAjF0QClGWbC3z0hFEZzzKCruCvjOjq0ozijhdjfPE5CvU1YE+CgzNMNb9+
 sFhQ==
X-Gm-Message-State: AOAM530EQXVeeHHfJFreS43kYqhsAdj8NH1kLL+PBHmrGMIguz/geOw5
 5qbTtmW4/9d94O6g1P6r+SnpVQ==
X-Google-Smtp-Source: ABdhPJyW9FGADBJOCZRrQYFZdHWHjGtQOzqZty0xfmulX35Zut5RGG3F7ZSeSB47qhRZIBUayNPRPA==
X-Received: by 2002:a54:4f85:: with SMTP id g5mr5738063oiy.27.1599235628680;
 Fri, 04 Sep 2020 09:07:08 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id w1sm1370649oop.16.2020.09.04.09.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:07 -0700 (PDT)
Date: Fri, 4 Sep 2020 11:06:58 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v16 20/20] arm: dts: qcom: sc7180: Set the compatible
 string for the GPU SMMU
Message-ID: <20200904160658.GJ3715@yoga>
References: <20200901164707.2645413-1-robdclark@gmail.com>
 <20200901164707.2645413-21-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901164707.2645413-21-robdclark@gmail.com>
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Will Deacon <will@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 01 Sep 11:46 CDT 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> split pagetables and per-instance pagetables for drm/msm.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b3833e52f..f3bef1cad889 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1937,7 +1937,7 @@ opp-180000000 {
>  		};
>  
>  		adreno_smmu: iommu@5040000 {
> -			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
> +			compatible = "qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
>  			reg = <0 0x05040000 0 0x10000>;
>  			#iommu-cells = <1>;
>  			#global-interrupts = <2>;
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
