Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32737576F93
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 17:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C788AB10;
	Sat, 16 Jul 2022 15:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628458ABC2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 15:00:49 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so5622527otb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OCzu8o65jRXe8kPCqql1dkNy/KOHUusXq9Qq20UZz6c=;
 b=jByed41fI6hFQz2xdF/cZBTRCTWtuNRpqfrzM4D+IZWUez7IXqMrYxyVT2I8UjNexH
 zodo3jqlUMaE/1Zk96unWmzq35cPuROjwHnFo8pNHCmlCr5P5lOz2HMAiiVztod4gA5z
 3mnF/oK0KHg2toiZoqdO6yJHd3TJSW+q8o6PGAgoSGS0rhqFz3IyxagddxIbGb8MSZcx
 Zo7z3EhOewZTZZ4ZLi5fUO5D6BpDPsXyLFPdLfi9o3pepa5WM6YWRaJef/N5UMx+KhCp
 U+kXGkV9/4Dnp8fpeVMUmYuPH7mlQ9Xv9Bnqk2Cw1L3nscgk6F56I57tD4xPMRw0Bf9d
 Y+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OCzu8o65jRXe8kPCqql1dkNy/KOHUusXq9Qq20UZz6c=;
 b=pZAzc912Q91s3qFH8uhS2MTklYq7MpgHBgV4xVWlMjIp8UCSMlgeY2TRzSuF9b5O3V
 IGokJJ8YBPWRGMNkX0ADFtEm06onSd6aDcW6OnYvZvGsdKxYQv2oKikD20jcy6Jvd2VZ
 2PzpfPj165pjXsIS8TW3uMk/Ofy9ACcDAxyDmFKUV4t3n1y8cn+T4p6SVVm8BSTOayVI
 5WII4G+/xcgSL2GnRNcbM/83MvBsnObou6EEftilKvuOf9KutKsSTLxuSUp6FrI8Km9P
 DasrUpGXVv42Jgwf0eWDtyZVc1WRojOONRH4V5QnT2Na2oBRKHfVrKeoEWF2QqtZDeaR
 Vk9A==
X-Gm-Message-State: AJIora8OG2h0ECiTvvWc8V7K+a8GrICGqUevCXfmT4/UOHDhbopdPcN0
 VYx2g24ksxKtBrhNvgXquqY3Fg==
X-Google-Smtp-Source: AGRyM1svToWbvX0jHGW2fdza8Lv63PzW2QBjLT84JxmK5lubx1xwBrqWz5tlH1ij8hv06lzx3HJqbA==
X-Received: by 2002:a9d:6443:0:b0:61c:7f6b:fef8 with SMTP id
 m3-20020a9d6443000000b0061c7f6bfef8mr4573896otl.319.1657983648466; 
 Sat, 16 Jul 2022 08:00:48 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 d8-20020a9d51c8000000b0061c7ce09091sm2684336oth.67.2022.07.16.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:00:47 -0700 (PDT)
Date: Sat, 16 Jul 2022 10:00:46 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: sc7180: split register block
 for DP controller
Message-ID: <YtLSnj9UjLBBZGFK@builder.lan>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun 10 Jul 03:41 CDT 2022, Dmitry Baryshkov wrote:

> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 47ce5787ed5b..875808cf0614 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3080,7 +3080,11 @@ mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7180-dp";
>  				status = "disabled";
>  
> -				reg = <0 0x0ae90000 0 0x1400>;
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0xc00>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
>  
>  				interrupt-parent = <&mdss>;
>  				interrupts = <12>;
> -- 
> 2.35.1
> 
