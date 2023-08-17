Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFFC77FF28
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 22:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BE910E23C;
	Thu, 17 Aug 2023 20:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666FA10E05A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 20:34:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-31972944f30so244587f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1692304449;
 x=1692909249; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aJanSbcbdRbqlFQWo2SBp1vOjmdCAm9+u8RhmfEAHas=;
 b=HokACvUW0mjpLc8YiUL9KCHIpjZi7PunfjPeUHX6F+hjAFZ8BdwqsjEvDvr+7iRwVG
 4RUuiYx72kRPxCLwwB7DdFYF8LNXJ3naJlB86oAWLH1YmN47FzCgCLklB55s8jPnmKSv
 htCVokwgGAVZVfCchsvs3EHYtrIfyJGhbyy/int/Mmafg9jCf7KOSyodZjfmmPR91HGa
 vfqJcPLKBW6Hu4qVQ8QLDIIE5mMlYp4V8C/+6JToFay+dieiQWQWy269oXSrq9rPtrUe
 52UHXxT6IHvN+zic1Nru5lJKeD9q0GRPM2I09yq5wLSQp4EPMDxX6fz9RH8ROpVRu3Ox
 3NPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692304449; x=1692909249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aJanSbcbdRbqlFQWo2SBp1vOjmdCAm9+u8RhmfEAHas=;
 b=X5XFWcTqfzOSwg2jCMbPtoWEnUF4+9IrzypbqWJuYMLCE5D2uEIZAUD0fQzzkYKEEK
 RmBsQmNvogAhg+UySVI15gsn7jZiYwrR5QB9baFhUW5B89tblaR9CBPDS3furcINLhIx
 jwaBG4o11qxTaAE0HJDrt4Z/JKnDY9NIGw/bav8AOokE/cZjrxcFZh4ZxTtbQsJY/p04
 MvTqLgpYTGFhRRQxX2V0rmxppu3ETfs7QXaVEGCp66bRcl6xg2S+TI14xwxyDoiA2SFZ
 rHacG9LWthIPByHxDyrVe9/O5PJESHFUsHTK6vPSIAFkziuIr+UhQSpA9vpnuBW4S2CK
 tf4g==
X-Gm-Message-State: AOJu0YwRIxiatEm22uf+2AJqynQFZyL3TZU6w2pRWrmedGURmybqJBLS
 OEY3889onk+hBi0jQvQLF1SVyw==
X-Google-Smtp-Source: AGHT+IFq0O851NzocA+e/CpjQ6uPrVChiJJ+FMGBCKsk+tDIGC8ffOouYN49JM4byaw7gqWx2KgfSA==
X-Received: by 2002:adf:de8c:0:b0:317:e515:d623 with SMTP id
 w12-20020adfde8c000000b00317e515d623mr416308wrl.60.1692304449002; 
 Thu, 17 Aug 2023 13:34:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 o2-20020adfcf02000000b0031423a8f4f7sm323543wrj.56.2023.08.17.13.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 13:34:08 -0700 (PDT)
Message-ID: <653fd80b-0055-ddbd-3641-a38efaa3be9c@nexus-software.ie>
Date: Thu, 17 Aug 2023 21:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
 <20230817145940.9887-3-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230817145940.9887-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 17/08/2023 15:59, Dmitry Baryshkov wrote:
> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 52 +++++++++++++++++++++++-
>   1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 303d07f9c6e5..a4f7a9f9c22c 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -610,6 +610,46 @@ lt9611_out: endpoint {
>   /* LS-I2C1 */
>   &i2c15 {
>   	status = "okay";
> +
> +	typec-mux@1c {
> +		compatible = "onnn,nb7vpq904m";
> +		reg = <0x1c>;
> +
> +		vcc-supply = <&vreg_s4a_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_usb_con_ss: endpoint {
> +					remote-endpoint = <&pm8150b_typec_mux_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_phy_con_ss: endpoint {
> +					remote-endpoint = <&usb_1_qmpphy_out>;
> +					data-lanes = <0 1 2 3>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				redriver_usb_con_sbu: endpoint {
> +					remote-endpoint = <&pm8150b_typec_sbu_out>;
> +				};
> +			};
> +		};
> +	};
>   };
>   
>   &mdss {
> @@ -1299,7 +1339,7 @@ &usb_1_qmpphy {
>   };
>   
>   &usb_1_qmpphy_out {
> -	remote-endpoint = <&pm8150b_typec_mux_in>;
> +	remote-endpoint = <&redriver_phy_con_ss>;
>   };
>   
>   &usb_2 {
> @@ -1388,7 +1428,15 @@ pm8150b_role_switch_in: endpoint {
>   			port@1 {
>   				reg = <1>;
>   				pm8150b_typec_mux_in: endpoint {
> -					remote-endpoint = <&usb_1_qmpphy_out>;
> +					remote-endpoint = <&redriver_usb_con_ss>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				pm8150b_typec_sbu_out: endpoint {
> +					remote-endpoint = <&redriver_usb_con_sbu>;
>   				};
>   			};
>   		};

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
