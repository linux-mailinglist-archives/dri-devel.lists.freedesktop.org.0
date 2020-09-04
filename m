Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC225E4A5
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D676ECF9;
	Sat,  5 Sep 2020 00:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD7F6EC6C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:06:34 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a65so6316232otc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yGsA49rxc5hM77zu3hVnv/Snb3l8Beqqgv9O0m89n9M=;
 b=OZy7+nmo3BIaZ9T9nelyVX4l9QpEbcCuo8yllCgiWtT62uoQjY63QalRFu8zFehO6v
 ZnAVU++j55iEY2+/sYTqgpW965CzNYh5FSFLjLpJUbZlROleC0GufMN2cf17HO1cOrdh
 vlLrs+k7gUMBydn50+D7kwpNIeCJfrsHGQ7J6qgvpCSVbA6vxWMTAVSFIfjIhNhxCoo/
 vW27rwvVuBh+ZoTTMRP+K7vfGOFt0KzFaw693zfr5F+d1dEyCfujTjhQj5DYbITrbKFs
 xUlgzZm6UckT40GBkz51u7zO3ZW6Bdm3+d5Xt6kV1xFyTr++s7HS/jYv/RsDEy2rqQiv
 hg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yGsA49rxc5hM77zu3hVnv/Snb3l8Beqqgv9O0m89n9M=;
 b=EcXh6WDqjQRDkIUyrhlCwDo2/YqpsiBIrbZuaEi9ahO6BVOJdzSSD3xtBov7BBGJy5
 STvAAuZxlftvCNlvXGlL7n1gC/EcUzCkFlrF52Tb6lxr1ZcmxGQGqJgWEHw3UTjffM9Y
 cE6qE8+wdvb06DSLlFlSfs0Tf6HprF/ysuha2TK6+1f9EbG5AkPwZA7q+EHREptJMMrR
 //yJJqSDYfdcyqCvUfpz702Lr5QhZRzPaGH4C/INb/H8Vm8tLpRXQOCMh9fg0zhnvHKR
 tz0GJvzVXtbQ/6SzoLWxfNZsJHwT/PvapuW+FtLMLRepnvaOYmsEXI2qoFWmYtdAxK1y
 s7hw==
X-Gm-Message-State: AOAM530XsqDuMKHKwK/IaWZqi9Y7OKnLm23r1mNNPLJGGnohzBhinrx/
 bvxm5p1zHwllu0ArJSSzf9nQ1Q==
X-Google-Smtp-Source: ABdhPJzGRciwEc32A7jGVOPFZOIbTFY5t2o9ThvPI+Y2vdsQYpVMGnxVgGSNkXlsXYLGJPIR5XUBxw==
X-Received: by 2002:a9d:2c43:: with SMTP id f61mr6394737otb.154.1599235593662; 
 Fri, 04 Sep 2020 09:06:33 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
 by smtp.gmail.com with ESMTPSA id q9sm1264649otk.14.2020.09.04.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:06:32 -0700 (PDT)
Date: Fri, 4 Sep 2020 11:06:20 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v16 19/20] arm: dts: qcom: sm845: Set the compatible
 string for the GPU SMMU
Message-ID: <20200904160620.GI3715@yoga>
References: <20200901164707.2645413-1-robdclark@gmail.com>
 <20200901164707.2645413-20-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901164707.2645413-20-robdclark@gmail.com>
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

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> split pagetables and per-instance pagetables for drm/msm.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 64fc1bfd66fa..39f23cdcbd02 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -633,6 +633,15 @@ &mdss_mdp {
>  	status = "okay";
>  };
>  
> +/*
> + * Cheza fw does not properly program the GPU aperture to allow the
> + * GPU to update the SMMU pagetables for context switches.  Work
> + * around this by dropping the "qcom,adreno-smmu" compat string.
> + */
> +&adreno_smmu {
> +	compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> +};
> +
>  &mss_pil {
>  	iommus = <&apps_smmu 0x781 0x0>,
>  		 <&apps_smmu 0x724 0x3>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2884577dcb77..76a8a34640ae 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4058,7 +4058,7 @@ opp-257000000 {
>  		};
>  
>  		adreno_smmu: iommu@5040000 {
> -			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> +			compatible = "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
>  			reg = <0 0x5040000 0 0x10000>;
>  			#iommu-cells = <1>;
>  			#global-interrupts = <2>;
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
