Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8F7042BC
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 03:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB67810E2CD;
	Tue, 16 May 2023 01:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4F310E2CE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:16:31 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ac7ac8a4ffso141300271fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 18:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684199788; x=1686791788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HhKJ9K8sXPUHNu8qgCXbMx2ph04nrQv3JOCNnJ3r0tc=;
 b=Zin4aDiiD4dr5lMMf7axMkePl2KMRXRtEnqdqfxlifKpRjXquUxHpqqEL814lrzSYs
 7Pg+/C1a1TOGSIgSbEavUT9A/qURTYxy98faWggMB1v77BiQv9cReT3igi6XZviir7NO
 bPyV4MvvzMqIeqa/cy7d0IipDRz9Nb9iZ6XSwQ62gWdis8nipTDQgat4LCLmhbmlUsYU
 RjML3cBiFSb25Qcpcqye1jWvh4b8ngCTPvb15CmVSuNGH3wFznjQ70tYL7q39Dk5AOjM
 H89CS17IysRyxxB3TE268OPO/7sKnr8GJZR56JgGGoFMVDJ3aBZGo0yIrj8nhbUUo4mM
 YxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684199788; x=1686791788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HhKJ9K8sXPUHNu8qgCXbMx2ph04nrQv3JOCNnJ3r0tc=;
 b=iTMlsHD6jVctbpyAEudPULhMEUzMR4JkRDqia7VDG7JC9nnWT6le6F1ldB7JYlwypT
 ToOh+uB9DHqX2RVLmYDlvJ+HdCJAIvOaEScckSaVoCVbhXJipucI9LHUryuT72Ms4LlE
 Ikm966LFqGoPBAE9T24IU0lzbd9TwPBKKij1K5Wj5weJ4ARIRpKSCBTu79z6bL8O74k6
 e0u9FWInH9Onm0yukAAb/1zBH7SCx2h3xeGw76ou0TRDF+BLdk08edhyuwAK6894aRql
 bKAz7KQqR+ZqX9tRlFcb+6TmyTGhKCnCkfjOKPxeUhUgK+dbTyaUe/bB3WfxqzlmoXKG
 kKnA==
X-Gm-Message-State: AC+VfDyiigKhUdAqGBzTL8kyh2FEYQdicqtPUYv+hppwNUjwxhO02x4W
 C2mBYz2ANFbb7YsBc1MyvBW36w==
X-Google-Smtp-Source: ACHHUZ7FF4CwV/cjiS18zH9a4OjJ2CQEvHfXtMS7xd3A0Bop7xeqC+uSDo35dCJW1pJ+xQThi+u7Sg==
X-Received: by 2002:a05:651c:212:b0:2ac:8c5e:e151 with SMTP id
 y18-20020a05651c021200b002ac8c5ee151mr7562822ljn.31.1684199787856; 
 Mon, 15 May 2023 18:16:27 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a2e9ec4000000b002a8c32fd2f3sm3989061ljk.89.2023.05.15.18.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 18:16:27 -0700 (PDT)
Message-ID: <4e62a790-192c-90b6-76dc-193dc52cc996@linaro.org>
Date: Tue, 16 May 2023 03:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/2] iommu/arm-smmu-qcom: Fix missing adreno_smmu's
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org
References: <20230511145908.597683-1-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230511145908.597683-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Lepton Wu <lepton@chromium.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Adam Skladowski <a39.skl@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.05.2023 16:59, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When the special handling of qcom,adreno-smmu was moved into
> qcom_smmu_create(), it was overlooked that we didn't have all the
> required entries in qcom_smmu_impl_of_match.  So we stopped getting
> adreno_smmu_priv on sc7180, breaking per-process pgtables.
> 
> Fixes: 30b912a03d91 ("iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create")
> Suggested-by: Lepton Wu <lepton@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index d1b296b95c86..66e191773099 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -496,20 +496,21 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>  /*
>   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
>   * special handling and can not be covered by the qcom,smmu-500 entry.
>   */
>  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>  	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
>  	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +	{ .compatible = "qcom,sc7180-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>  	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
>  	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sm6350-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> @@ -540,12 +541,18 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
>  		/* Match platform for ACPI boot */
>  		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
>  			return qcom_smmu_create(smmu, &qcom_smmu_500_impl0_data);
>  	}
>  #endif
>  
>  	match = of_match_node(qcom_smmu_impl_of_match, np);
>  	if (match)
>  		return qcom_smmu_create(smmu, match->data);
>  
> +	/* If you hit this WARN_ON() you are missing an entry in the
> +	 * qcom_smmu_impl_of_match[] table, and GPU per-process page-
> +	 * tables will be broken.
> +	 */
Nit: I think people generally do
/*
 * 

but I'm not the maintainer

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: <stable@vger.kernel.org>

Konrad
> +	WARN_ON(of_device_is_compatible(np, "qcom,adreno-smmu"));
> +
>  	return smmu;
>  }
