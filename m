Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99E74241C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEA710E100;
	Thu, 29 Jun 2023 10:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94A810E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:45:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so816378e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 03:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688035502; x=1690627502;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZycAiamSeAOei9N+fAI38YLBVtrmW7Hr+4Gb/tmtJdE=;
 b=F3yqPKaQcukcWpswKoEnWgsRS8CyP+vjEDX86QbJiUTKAX4Zl3N1i3AD3Dfh+CvFuD
 4DZcigkFoaA0A4Lw21po6/5LklYIR8tCeqwZJXRu9K8IyDry5AJHRY7fqCeW1dmgTh7Q
 9Jpp/Xy5X8GEFPremmquDrtEfBMIpE+Xu6HVMozAWYx5oF5vI7TXHm3pQklyWxVM5fRi
 RLLMScYeX0zUKdTRCpQrMxza0ZmyBTnF/a1PBzMBcJVObmSJhztglZgAE3E8LPSSmUHn
 IPggWVV84cEByw5AMWuSjjwHiG1SNvImf1ckL8KJObjSzIHrfNQJ7TReDUMrtGKMTEDM
 LXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688035502; x=1690627502;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZycAiamSeAOei9N+fAI38YLBVtrmW7Hr+4Gb/tmtJdE=;
 b=idZo/h+rjvlrHGEBWgCz4G+/jZHbtLp9feKLSNs0Atxy+kb601CODoORxuNECIMgQa
 9u7SWfZxwNi8bnxcUmcuvfeqDDI6w2DV3mXzH9cZeiwb6uGKKz+pCjzk8xG+dvJGftNI
 e+ZyDes3jAiO/P6ECyKUNcscvlDYtXVSV6cha2Yy2t0TMRpDrYchQsSqxWWbw3fyUuJM
 JvoZyxr+DOX/M00MvXEysXXuyWZNx+qlBzToJjGZapxesT5ZVI61sKWnzaVxgm4SLcEQ
 D1sw288PClESwutDExUw3nOgoQffBVSSBVaMk5pWlKqLIQuv7Q6ySyXtroQGJgV2v4Km
 MboA==
X-Gm-Message-State: AC+VfDxLwTKU6hzF8yjHtQf5SPJhkjyQjx50n4HowLOv87CK5phwPOTp
 utD/ni++KpqHNmqDkIrmOlkkJQ==
X-Google-Smtp-Source: ACHHUZ75RHc/BSu6OWqTmUPkHeojYgt1q2iHXJcOCWdC36jUqcV9FWlcjMVdvh5PrQGCY+XkgMVQcQ==
X-Received: by 2002:a05:6512:23a4:b0:4fb:18f4:4cd4 with SMTP id
 c36-20020a05651223a400b004fb18f44cd4mr10650284lfv.55.1688035501764; 
 Thu, 29 Jun 2023 03:45:01 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a19f708000000b004f84d7706a7sm2276290lfe.7.2023.06.29.03.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:45:01 -0700 (PDT)
Message-ID: <6874227d-ea70-cae3-8267-1dd6baad997c@linaro.org>
Date: Thu, 29 Jun 2023 12:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/4] regulator: Introduce Qualcomm REFGEN regulator driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
 <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
 <76e2f865-1a37-4517-b343-6aaea397fcf7@sirena.org.uk>
 <6109d966-b705-4e84-d8b3-c895ef540db3@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6109d966-b705-4e84-d8b3-c895ef540db3@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.2023 10:43, Konrad Dybcio wrote:
> On 28.06.2023 21:28, Mark Brown wrote:
>> On Wed, Jun 28, 2023 at 06:29:46PM +0200, Konrad Dybcio wrote:
>>
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2017, 2019-2020, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023, Linaro Limited
>>> + */
>>
>> Please use a C++ comment for the whole thing for consistency.
> Oh that's new!
> 
>>
>>> +static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
>>> +{
>>> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
>>> +
>>> +	regmap_update_bits(vreg->base, REFGEN_REG_BG_CTRL,
>>> +			   REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_ENABLE);
>>> +	regmap_write(vreg->base, REFGEN_REG_BIAS_EN, REFGEN_BIAS_EN_ENABLE);
>>
>> For the enable and disable operations we use a mix of _update_bits() and
>> absolute writes with no FIELD_PREP()...
> This absolute write was accidentally fine as the mask began at bit0...
> 
>>
>>> +static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
>>> +{
>>> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
>>> +	u32 val;
>>> +
>>> +	regmap_read(vreg->base, REFGEN_REG_BG_CTRL, &val);
>>> +	if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
>>> +		return 0;
>>> +
>>> +	regmap_read(vreg->base, REFGEN_REG_BIAS_EN, &val);
>>> +	if (FIELD_GET(REFGEN_BIAS_EN_MASK, val) != REFGEN_BIAS_EN_ENABLE)
>>> +		return 0;
>>
>> ...but when we read back the status we use FIELD_GET().  This looks like
>> a bug, and given that one of the fields starts at bit 1 it presumably is
>> one - FIELD_GET() will do shifting.
> ...but a 2-bit-wide field will never equal 6.
> Looks like I put unshifted values in the defines for REFGEN_BG_CTRL..
> 
> Thanks for spotting that!
Even worse, I noticed I've been feeding a raw address into regmap
functions.. :) 

Konrad
> 
>>
>>> +static int qcom_sm8250_refgen_enable(struct regulator_dev *rdev)
>>> +{
>>> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
>>> +
>>> +	regmap_update_bits(vreg->base, REFGEN_REG_PWRDWN_CTRL5,
>>> +			   REFGEN_PWRDWN_CTRL5_MASK, REFGEN_PWRDWN_CTRL5_ENABLE);
>>
>> This is a single bit in a single register so could use the standard
>> helpers rather than open coding, the sdm845 does need custom operations
>> due to having two fields to manage.
> Forgot that's a thing!
> 
> Konrad
