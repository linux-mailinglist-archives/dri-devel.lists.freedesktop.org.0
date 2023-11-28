Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA6C7FBB42
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07AD10E07D;
	Tue, 28 Nov 2023 13:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F413E10E519
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:18:32 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c87adce180so66728801fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701177511; x=1701782311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tTf2yUtECbY/OYuChMFvXRgzzGsfDdzdXOehMmGhewk=;
 b=XkuSWrY1Qph4pfTqw3fsAq1c1exwf9OahJy6gyEDVK56klgkRDquxSv1bzGAHYCID2
 tvgnzJjuWBaNm/RW/z+QzAtDokDb3Rvh5QGI/HJsa5ok6w1aBsjBlrEsuN2rBbWq5Cae
 0JqCl6EPtC5h0JqJqP5+ysvtQQROR8o1/t60uGyjuCrC6uUStnsjAofqhGy1+2xXUiO2
 NPIuasPzNkEMTmTjWFdOGemXouzveo7QCgrLq9G8L/kAJBh1BxtrFXJyfxHlY+Y5bCew
 ptubUyzUP2To1CX8MrYawGfUOswuXu92uupySd6Z9mRFQjYtg2H4B4HuX2pJCO7lhVXG
 LJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177511; x=1701782311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tTf2yUtECbY/OYuChMFvXRgzzGsfDdzdXOehMmGhewk=;
 b=YxWJIaBjpAJLWw7w3iMgB/+gwG7bczitDY8euh4JiIA7HLDqU1mxO0fo7bAtnXnepj
 oOvSZOZehWkLv1RiFLDpmsokUFDQ8GtZPZCZRi99hIiMzjCDKXbEYL3usQ6m6gLdNllJ
 NcdqLngajZpyWn0DdwSKd92WXOMNMVku+zbY7OPb70+rCaPGd8r1R248Q7X4PtxB5BfP
 hF1TFu/YdaFbo9M7c7gyvfb1ZqcStnKOV5VUGAtp3/Ni9oOXto/sII9vb+4Vnrzm6hBQ
 ABExyXDPkwajGojs5nZa5yxdTAChcpVhMvVWWJRISZXbzz2kdKscgfM2hCKbh+ufNACB
 pd1g==
X-Gm-Message-State: AOJu0YwpKVVE4m9Dr4EXDjIN4zQ7XoD/lm3BHo0lDfxSQJQ6JzORIbem
 SzsIkNpMR0/EJpCmzU/LxCDPUw==
X-Google-Smtp-Source: AGHT+IGqrSCmGnNKknw600PvCwdJ4nyNLsm/yU9AqIvf2jLutSas7DdHhjfbocjXyLUEEP7CqlRP5A==
X-Received: by 2002:a05:651c:39d:b0:2c9:9983:6fba with SMTP id
 e29-20020a05651c039d00b002c999836fbamr5636031ljp.52.1701177511295; 
 Tue, 28 Nov 2023 05:18:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a2e9547000000b002b657f10b78sm1707226ljh.58.2023.11.28.05.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:18:30 -0800 (PST)
Message-ID: <83e4f84f-63bd-4f53-886e-5cff215fd802@linaro.org>
Date: Tue, 28 Nov 2023 15:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] iommu/arm-smmu-qcom: Add QCM2290 DPU compatible
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
 <20231125-topic-rb1_feat-v2-5-979b28f35e4a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-5-979b28f35e4a@linaro.org>
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
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/11/2023 17:28, Konrad Dybcio wrote:
> Add the QCM2290 DPU compatible to clients compatible list, as it also
> needs the workarounds.

Nit: MDSS, not DPU compatible

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 549ae4dba3a6..aea5e85b20ff 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -245,6 +245,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ .compatible = "qcom,adreno" },
>   	{ .compatible = "qcom,mdp4" },
>   	{ .compatible = "qcom,mdss" },
> +	{ .compatible = "qcom,qcm2290-mdss" },
>   	{ .compatible = "qcom,sc7180-mdss" },
>   	{ .compatible = "qcom,sc7180-mss-pil" },
>   	{ .compatible = "qcom,sc7280-mdss" },
> 

-- 
With best wishes
Dmitry

