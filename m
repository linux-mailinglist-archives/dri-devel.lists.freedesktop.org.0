Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1B640539
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A93310E6D5;
	Fri,  2 Dec 2022 10:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3F710E6D6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 10:52:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j4so6873918lfk.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 02:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2WV3hu6UK29+s0ALK9dx8GPMaHWMWWZBkgAQWdnJIgM=;
 b=qXvw2WdO15cC5leZhy1ybNVXkWVe6yyrSIT3B7vV+oNDpLWW7rHGoZO74d4/yPFjWn
 HWnN92NNeps3n0HOytoZyceBIkCtYCtK3M8ktz9uWVmJAz9LIOERMQQGmJOfKt7B8pnv
 eahhmYz9ien371VQ7Pyu+unTgNOOXCs6VUPAmgWfd95nSHu1NNj0XMMx8VXqDknU6D+B
 GcGA+/LkFkXbqHKiPg5BgOwPyTffmmL+oKOZPRLUDrn1ZV+eMntHUEnf0fAL9aOFRARL
 y35WWukKWJmN5dLBXuzvgXCx1QGNehCzzT4ydwlvews9GFTtMIyo/XntCGhv8UdIuAH8
 SGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2WV3hu6UK29+s0ALK9dx8GPMaHWMWWZBkgAQWdnJIgM=;
 b=XNAXT2hbBiPHVzc1+fwuNN2q2DsZ1D3CPFTCKfe21y4qYl9vftgHdiTGZawG4gXUze
 MNDAXA3xLiQVpCR7laUnAwvqQueX/2JFCNJQLqAVwItasKGCT0S4K01aAANjd2W6RY1W
 7GvhGsBLD1DH/KWy64GT0yxx5dQDfkD6qlV9O4uOiuEVEylopqag+UB3umFbQY1jSy40
 C9hyqYqVki9FdxPq+d5kXb4ET1wQS0208hH9oQe9N4OK1C3U23KcdxlBl3Gq3L+mmDjt
 YTwhKlK3YLmrevmX7/gsj1shCKeNo5m14nyM/QZuIR48oCoiLBg7ThwpAuCAcpbGgl1M
 wQNA==
X-Gm-Message-State: ANoB5pk3UxgBD8+IITMPKrS5V+pfaYLUUjCJ+cYtpLhR03acybKcNcJK
 dT25g21eiyZVksPTRvPxJLZe1g==
X-Google-Smtp-Source: AA0mqf41H5eGnGIB9G1oi4r1GojwonsUxZ5eSSh4/4tBP7XCusdlnst0g4hA1FRPNHRCYdlo/dGfew==
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr22895346lfs.367.1669978324002; 
 Fri, 02 Dec 2022 02:52:04 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.2.neoplus.adsl.tpnet.pl.
 [95.49.125.2]) by smtp.gmail.com with ESMTPSA id
 v1-20020a197401000000b0049876c1bb24sm972082lfe.225.2022.12.02.02.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:52:03 -0800 (PST)
Message-ID: <c168cf10-8bcf-2dc8-29ca-d94e448a7c65@linaro.org>
Date: Fri, 2 Dec 2022 11:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: sm6115: Add smmu fallback to
 qcom generic compatible
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-13-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221130200950.144618-13-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.11.2022 21:09, Adam Skladowski wrote:
> Add fallback to generic qcom mmu-500 implementation.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 38b903592a57..572bf04adf90 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -1233,7 +1233,7 @@ dispcc: clock-controller@5f00000 {
>  		};
>  
>  		apps_smmu: iommu@c600000 {
> -			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
> +			compatible = "qcom,sm6115-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
>  			#iommu-cells = <2>;
>  			#global-interrupts = <1>;
