Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3926673B67
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDB010E94F;
	Thu, 19 Jan 2023 14:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF4110E952
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:12:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u19so5953189ejm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 06:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gVwpwP4L2BBwb3CX7YjZPuDAVWCzEvEalSJdJwSRjy0=;
 b=K6D3cZTtI4P0GGX9GapAMig+nqZ+ed3QgZmNNYCNmRjkFhQdLm5Pet2+pp53RiIbvi
 rNnYocJlG6PyYNC+7s+J9isvVJ6mfH4UtxUJm3P0edKa77oKjaPAGHA/Dy6vHVP8PhlC
 zD1b6EZ1YcZRVfsAcgzaSXHDONvhCkM3/5SvjiAFRCsAWSQK4O0TabgRpOxi8Y5NcTNw
 ND56jyVHwPC+vsGkJIJGTu8U3qdX2Re0apTHvZuhQIs/xrr0LEpaD7JVAnQMuPt9cPXt
 ACHDxqzVTZzjs3jW5Nueb+B3x5IV6494792I5DX0r9sX6a7KOqLAaiv0gLbSEo+FIdj7
 4rNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gVwpwP4L2BBwb3CX7YjZPuDAVWCzEvEalSJdJwSRjy0=;
 b=g27JNEsRAYldmmgBxNIz/TFc52T0XANsYNETE2k6kgetPZEEHaT+kyp+E3HxX5lclH
 7HCHYpL2Pdi9dBZUHSsvmmg3K1QADZ+CcWyhgeaDNYo+rG7L2eHaKigaY4DtcB/jvtd6
 Z+5e3aqpY6FYYM6e5ashpd0MK/UynnHufp7C+tCSornHRdK0417yVMzrAaaZneXPnBFn
 QGjk3qAEbUGBWXjHKoZaAMXmhxenV+KMNtjJlyl/KH++WQ4IYlrhNsJsRI76Ice+pt//
 az1UOWFxiwwFNmtS8ipVmdT6dK+cneqZEG1tCfwHA7eZvOp4LBNrQarLrltWtogCbQJb
 2mQg==
X-Gm-Message-State: AFqh2krLZpJA8r+QHYeC4P7Gc2BAcT964H5+l4O3BDv+pGbwjE/TIgT1
 NeQoATW46rQqBPOLlxhdgjRnSw==
X-Google-Smtp-Source: AMrXdXuSLrB/4Yal9O+dE3vloHptxIe4v96pa+K0yU3MXj7aUevxYZtIqSE8JE+iVqmZ57coJ5RerA==
X-Received: by 2002:a17:906:eb99:b0:7ad:c8d7:4fd9 with SMTP id
 mh25-20020a170906eb9900b007adc8d74fd9mr11284421ejb.36.1674137546286; 
 Thu, 19 Jan 2023 06:12:26 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
 by smtp.gmail.com with ESMTPSA id
 kz11-20020a17090777cb00b007aece68483csm16450322ejc.193.2023.01.19.06.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 06:12:25 -0800 (PST)
Message-ID: <3ead87e3-7ba6-4455-8f21-0e482df4cee9@linaro.org>
Date: Thu, 19 Jan 2023 15:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's
 hdmipll clock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 82c795beb8a1..b7e5b45e1c04 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -867,7 +867,7 @@ mmcc: clock-controller@4000000 {
>  				 <&dsi0_phy 0>,
>  				 <0>,
>  				 <0>,
> -				 <0>;
> +				 <&hdmi_phy>;
>  			clock-names = "pxo",
>  				      "pll3",
>  				      "pll8_vote",
