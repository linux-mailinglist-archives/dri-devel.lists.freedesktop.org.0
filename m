Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5E6EB916
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 14:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B12210E036;
	Sat, 22 Apr 2023 12:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0210E036
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 12:10:58 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso11560272e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682165457; x=1684757457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XPnDF9DYM/NKDMLhSe3+ERdFQloF9vFQjHlbD109zt0=;
 b=NC5nBS9GOvTeZcG3repZOpLz3E9YKYGLizrTJ2BDD6eW2BTL5jfSVdgabcYuNCLjOM
 WW2VZxrSQwIsAWjCKE6SO2ClAaEFixljd6fDlSz7co1Y5txHKiZQk7/OnkyRzhDsTtyd
 LNvdoleCD+nUJhT75ncZESs6aeJZFlRArFHnCIWcM/oMaGx4+Ad25QFcSXC7CLrj0kdS
 SeYw4klaP90YhSK1A3kHYr4+q9dSqZLfRDw3l+ZMHlSl+RDIAHCjFh8+9/0PtUUXviQS
 9VQPGAtrSIVBRgk/Eef6z8+zsXhlygFTpsx7eh5naCThMLNbLdZ25/wgZKzu+CW/wmzl
 rZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682165457; x=1684757457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPnDF9DYM/NKDMLhSe3+ERdFQloF9vFQjHlbD109zt0=;
 b=Zrr2iGmcy+w4optx7/r8BNn2WtYFFGsulVQIWpKWLUXu+cWk5fxzefxQlnyeGDO3X2
 g+xbymBpFNv69pnCGIdX0ee04OZYPekn8UQEkYr+PaWVpa5vsPObUEO6pNCQXK35dAG/
 k00oPQzsMsfsMM6p2pUzKCFxgCmWVjAg918a0rqp0EwhEpnZPMAWykVS1gqtynpN8y2A
 Jt3CH9dM1xQk+qx8sDr2NHdKaIqAq5OJ8wvOm/MbqrDVv0q67Fqe2jrBONTJOVr4Y3bX
 JKON/FSCRSkt8ob0bumBNsnHlHUgd/cLeX5By1u+Jg4Uie3cC4plKCK4I8ed9pc3iGep
 D8LQ==
X-Gm-Message-State: AAQBX9dVntvgwGk8U8kQg/uO442cpHTzcdBSpws4wrpgxyiUDFKnYJj6
 E2NR6n2X0qGXaPUqvkjwXoGh+g==
X-Google-Smtp-Source: AKy350b+41OQZx0jt34QgFSz8mpHAcQA7Q4IfXLOTt1Aty4YMRkKmMvzXO8PsN8Eud0T9Lm1G0kumw==
X-Received: by 2002:a05:6512:3e16:b0:4eb:41ac:e33 with SMTP id
 i22-20020a0565123e1600b004eb41ac0e33mr3783203lfv.19.1682165457203; 
 Sat, 22 Apr 2023 05:10:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a056512014c00b004eed4c80b55sm866517lfo.156.2023.04.22.05.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 05:10:56 -0700 (PDT)
Message-ID: <01d06e66-9535-cb4c-6ea8-102f8b16f8b8@linaro.org>
Date: Sat, 22 Apr 2023 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8998: add hdmi cec pinctrl nodes
Content-Language: en-US
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.04.2023 20:10, Arnaud Vrac wrote:
> HDMI is not enabled yet on msm8998 so the pinctrl nodes are not
> used.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
Are they supposed to be identical?

Konrad
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index b150437a83558..fb4aa376ef117 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1312,6 +1312,20 @@ blsp2_i2c6_sleep: blsp2-i2c6-sleep-state {
>  				drive-strength = <2>;
>  				bias-pull-up;
>  			};
> +
> +			hdmi_cec_default: hdmi-cec-default-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
>  		};
>  
>  		remoteproc_mss: remoteproc@4080000 {
> 
