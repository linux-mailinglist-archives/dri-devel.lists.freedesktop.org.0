Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C4576F97
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 17:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6BB8AD5B;
	Sat, 16 Jul 2022 15:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B678AA0F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 15:01:15 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10c0052da61so12742308fac.12
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f3tz7nvmrPAAR/RbLohjcCYMNjuNkgsggyYfatjl8N0=;
 b=YiWcxBuOViRE9C2TQS67I+4SQqQNXu0Du8TD/CdP5T/IkfjcgiVIzaOQk4GsRZONyB
 hBHfBwShdm2mIwahbj1sBf2itVCOk3qz4dHIuupJPaLTr4cCA9RBRsFJskIaLAMBAd8Y
 tRFi/QEnIVTLqyIQtVJw9SUcqIMnW48GEdQagNbrphc2Yp1Vfb7Rwnf1genmNH1hGZwc
 e52msSV0HOqNGDigwkJYGyuDJgZ9qQA3Nz3pdqiDs8NFYPX1+6BYTCeFIruPhjSYahkG
 7w1hwRGRtSRX4rMQ17fXM/0MAPMh4hlVvlVgtuDVnRQSCVMJKdyhpNE7Gn4JBFVFAHYS
 Zp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f3tz7nvmrPAAR/RbLohjcCYMNjuNkgsggyYfatjl8N0=;
 b=3KvCaFunp0U+ZLQg4ohKSJntfp1H9BD0Acan9Ta3Ii9PInuyvlC+GkPpVLugbWqAGs
 VsLsOfas0oFutW+rlPyAGQ0UpbStaW9NRg93g1GDUrGVwiHCJ6VJH8xkzDdk1xgHQuLa
 Rp5gtGB40GXXq5aF/ed3YDy7HKg9f68cC/Dk8ayQbJ93HpSUdTYj3oXJHxpnRY35Y/im
 V5KWvbFEjcdsHj9+HypVI3ndf4SAF/TRY0J58pFHa4DoguZ4Zl+yFsZqZl4Oz+j86UnE
 wcUlCn+PeKlIcvsTsmejffUJTTFlUUwuSvuuBpbtACpN5NT5PsbJO1wxB6MFOBUPMmrV
 yHFw==
X-Gm-Message-State: AJIora9HdKm7DG1qFWbbY1/Sr+c4NuBjjbYFrkx0SVd6Sl6XitgU06Ja
 QBZhk8bg7uVivux3gpGiVDMShw==
X-Google-Smtp-Source: AGRyM1tLjSavEbjob5lq7rZJRnxO6mQsgS28vxTpRXsEGIO9iCrfC5M0YSjPOt2YndJ0FtgU1AYqhA==
X-Received: by 2002:a05:6870:14cf:b0:10b:f83f:fde with SMTP id
 l15-20020a05687014cf00b0010bf83f0fdemr13662254oab.234.1657983673883; 
 Sat, 16 Jul 2022 08:01:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 w62-20020a9d3644000000b0061c4c925c87sm3045273otb.78.2022.07.16.08.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:01:13 -0700 (PDT)
Date: Sat, 16 Jul 2022 10:01:11 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register block
 for DP controller
Message-ID: <YtLSt7NH4c5itRzI@builder.lan>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a3def1022ea2..e54c2000b098 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3810,7 +3810,11 @@ mdss_edp_phy: phy@aec2a00 {
>  			mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7280-dp";
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
