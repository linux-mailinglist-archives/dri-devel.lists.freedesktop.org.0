Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A692970A45A
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 03:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0924110E480;
	Sat, 20 May 2023 01:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2174B10E115
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 01:34:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac8d9399d5so45139221fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684546455; x=1687138455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pLAGUtWMudiFE1fjRVJz4UPReT3teB4CnEhketxzvG8=;
 b=jtF8SWdB4WbRVXC2NVHEZAvpwX249s2JclIrlpwexrwTZ2cgknIxXFoIhINKIkcngD
 APKbH2AD071j63Ei7ZCjRI1cp3sR8ofPnMa9S+XUjAUpqcGwkEGcPnoZpNeqQjcxKRU/
 1bZ9K5Xzfn680v4atudeR+w5P+OUWHaQixtmKmpyo99nmTydUPJRLgvoV7GLffnLjbCw
 +7c2yO4kksTWsoRJNjLgSvyjbsZdl4IxeX4OdRdo2/bILsDog/QeiCBEY6XyYVD5MgLs
 PVniMBfasG458Cuy73WkDz3ybI67t7Kj3E0BlX7pibybU/fzS8tBbrjxg1beaIWUuomF
 BFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684546455; x=1687138455;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pLAGUtWMudiFE1fjRVJz4UPReT3teB4CnEhketxzvG8=;
 b=VrnPR7/m9iQpkNBsBgsc/lEuLIZTzqu86fer1IlYhEa1EnD6arrRuYUmHHGaoag5SP
 +foUqibnttLs25wA3en7J9906UDAApMt+zad+0HIhdMHqhRHpLI1xAsBW2nlkNqdrN5J
 SVtWsCgy11+QMCneHvpTmJ2OAOfUQN2gVr3wTl22fJqVYjJ3V5ZRJ0RJuMYZopdAjujF
 UrWHwFU4epmiIHh/fYHl4O28IegD7zZCfXcri04UX4fGzKPD8wVbPYeKKyzQCL1oR7Aw
 fHTh7WCfrWusSDQHmpHoNNiKmlVQtF4YDPNK5okEP/TQvmzHA7hhoRQUpGeOPL41s5T0
 S17A==
X-Gm-Message-State: AC+VfDyE7BJxzSGkIePxrUYYbKinw+tn4nVHGb4RTRl1vtBm29W5AU0G
 EAVQo7ZnLnTR9EXTEMBD2eO6Z7lNBPiY3xrxlQc=
X-Google-Smtp-Source: ACHHUZ7G6s2ldDT/PJWyP3GIpJqiwJxUgAD9NJmFazGPXUEt5kQ8ak4Spemx2LJsae2R6elvXeTolg==
X-Received: by 2002:a2e:9ac7:0:b0:2ad:509a:22b8 with SMTP id
 p7-20020a2e9ac7000000b002ad509a22b8mr1586632ljj.16.1684546454796; 
 Fri, 19 May 2023 18:34:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a2e99d5000000b002ad333df101sm73780ljj.133.2023.05.19.18.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 18:34:14 -0700 (PDT)
Message-ID: <e04ed1b6-958e-ffc8-ea5e-7fe89bb2b9f9@linaro.org>
Date: Sat, 20 May 2023 04:34:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 10/12] iommu/arm-smmu-qcom: Sort the compatible list
 alphabetically
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v4-10-68e7e25d70e1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-10-68e7e25d70e1@linaro.org>
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

On 19/05/2023 20:04, Konrad Dybcio wrote:
> It got broken at some point, fix it up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

