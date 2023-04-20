Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01866E9F65
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4048510ED2B;
	Thu, 20 Apr 2023 22:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD5810ED2C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:52:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ec816c9d03so991291e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682031172; x=1684623172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NoW60Lm7GdjF79mPriJg9iX4x11OKcPemy9MLkVdBxc=;
 b=RB4YYiblAtjEpwZj0VpG1WT20iPmgOgtm07jwS9BRsoa9kYA0r794uyc6pEDrE2EeW
 IbzBcwAQ2wjGR09Ou7aT1vOmXVc1N2In3Ykw0WgC7uM8Q2BK6NBLhB0bKTXV9svxeIIQ
 4Fztrq6poxYy5Kb4lToyyXkbMaN7mRkXPoujcj5ggdaKC/tq2B//x/42WlZ1N4jFJc5G
 7z4wlltyH/IoGg51bPI6nHx7sCJzkUDPjYhkHkaBaU3x6YpM2h9zNNqp9u0VbahrRBxM
 ZTbSwdf6wVp8jBwRM8bPgUC9lg5kTSKEno5P+gnnWHZDBH4qj2PcxuMuYrR81L7+kTwz
 1XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682031172; x=1684623172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NoW60Lm7GdjF79mPriJg9iX4x11OKcPemy9MLkVdBxc=;
 b=h3Z+OoiIxKUH7z4UWjMlvsTvgRflMMib3llDDih3IS4qgvxq+/vqp5IB27binwgyE5
 5teRlUSOKs+nqszxbyl3mXLk2LtEZi27WwP0812dulc8iddweceC+opHX12UZhjhtzlm
 nkV8w2Tl07aHo7L2iobOsGUd4w04IbNLKk1/eHgHDFRYF/s6KoPWJnM91wQ52ClsgJX/
 jc9IOGTkRq4LpsjibuR4CRI1wvBKG0lf6el/d/3GK6qYTcMN6HtbgwFkC3K0GMXpkUzu
 5hsAPeYiqRiIC8bJXNJfoAHzXlnE+Pneo/Rd81zN3qt2CweXTBgyq/LigrqYvN13VdgI
 RhGw==
X-Gm-Message-State: AAQBX9cABNxtmxV5mRq5c83RpJMhXs+V689HQpgTJQVt3tDDOCbnEBBO
 lakaIixAMC46wiIprsQtw/S9Dg==
X-Google-Smtp-Source: AKy350aQqb8y+xF0W6oAo5D5GhlxWVGLI8E9FjmzqZU4jhc4y7WqtCf9P4PO6Z6YJJ/3nnM+xzL/Ng==
X-Received: by 2002:ac2:44ca:0:b0:4eb:2d45:f67f with SMTP id
 d10-20020ac244ca000000b004eb2d45f67fmr786075lfm.33.1682031171724; 
 Thu, 20 Apr 2023 15:52:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w3-20020ac254a3000000b004eafa141a12sm360784lfk.9.2023.04.20.15.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:52:51 -0700 (PDT)
Message-ID: <353b93c5-27f5-a1a5-760d-5f7ad627a583@linaro.org>
Date: Fri, 21 Apr 2023 01:52:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 11/13] iommu/arm-smmu-qcom: Add SM6375 DPU compatible
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-11-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-11-5def73f50980@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> Add the SM6375 DPU compatible to clients compatible list, as it also
> needs the workarounds.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>   1 file changed, 1 insertion(+)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

