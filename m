Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6163D8EA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68B10E47F;
	Wed, 30 Nov 2022 15:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3310E47F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 15:10:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id d6so27415071lfs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 07:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3Su5v2vdmDewKthBrtRFm+e13oXU523NmM0FV1oQU8=;
 b=UGdY4Ll7FF8qoI0YeGrA0rIaaXlaaFuBei4wsmZtPINCSzvnUJT+90MuRpjxmRuSGT
 J8EXutfubxLaShHq7c6BnttwGrHh0GFfnrxBd+XCqOBzIbwGYygrRgMcaqjYTvm3oqob
 Zvh7Kezr1vz2P6+B8KuRr3LWEJyWyNDg93grQSncIaOzm6swZKOXDMO/W9kMIQbzJrZz
 lTYqPBBvl66dq1HJqzZESIl4DrkAOONcD0ZqhAKof6+e8OwT35HaoLZ2+nYFpWOGlDY9
 sT7ecbB2956MLqPOrQbHValv6E7l1G1BtJurm6zZhqCmCjHx90DIU5oCuFuAMVcY7Ra2
 PDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3Su5v2vdmDewKthBrtRFm+e13oXU523NmM0FV1oQU8=;
 b=bxTUSPXlFk0Gc4FrKFwNHj4DUWYbncD2Ae9lSjmMpQW5A4D/lbFbilcp7n9N1CKEme
 JbS1eTFOBgY2p+BkWmslIPEPvgtZ4NC/YjnK8J0OPgmFNfMT67GEZFE2iqBVcFXxfFYL
 TdSevQCnGvYZTtpIIClCIUzbNhxzjUBlzeH9GYwcoQJbILQWlbndw12Wdyw3MfXnqh+c
 D7dH5w6glzNCjIsH7cHLZv7sgQzBHVTu/AH/06exwfwdfNZwUM8vbQOVgNHgpaWGB7Ck
 Yw+7JC+6TmV5EbgKFK4kbLUUovCclTFpf+JD83ItgaY6fO7KHoZzB3+ygt5mFpOYjif3
 AOQQ==
X-Gm-Message-State: ANoB5pm3TQDCLoW+mrRVS894UyiGeTFnA7sPLLdXuA1BJbGhZ3/PDBIh
 Mhq8DyQMNbkQ1nyDwa/9kLUSdQ==
X-Google-Smtp-Source: AA0mqf6H4COlxILbroNSMWuDH3SQhpzqcaGSWYKTuKDUwWXh9jsj1UxAf2lYa04YY2JuGCwkbkTyUA==
X-Received: by 2002:a05:6512:131b:b0:4b5:1ae4:f234 with SMTP id
 x27-20020a056512131b00b004b51ae4f234mr5110099lfu.391.1669821024300; 
 Wed, 30 Nov 2022 07:10:24 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n9-20020ac242c9000000b00494942bec60sm294211lfl.17.2022.11.30.07.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:10:23 -0800 (PST)
Message-ID: <b3c4fa2a-4904-f16e-52e4-a534f4555455@linaro.org>
Date: Wed, 30 Nov 2022 16:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 10/12] arm64: dts: qcom: sm6115: Add i2c/spi nodes
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-11-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-11-a39.skl@gmail.com>
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
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 21:46, Adam Skladowski wrote:
> Add I2C/SPI nodes for SM6115.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 287 +++++++++++++++++++++++++++
>  1 file changed, 287 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index e9de7aa1efdd..d14a4595be8a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sm6115.h>
>  #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -357,6 +358,90 @@ tlmm: pinctrl@500000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  
> +			qup_i2c0_default: qup-i2c0-default {

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Missing -state suffix. Same in other places.

> +				pins = "gpio0", "gpio1";
> +				function = "qup0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};

Best regards,
Krzysztof

