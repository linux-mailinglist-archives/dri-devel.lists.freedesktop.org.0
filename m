Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0588A96D3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 11:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82A10FB97;
	Thu, 18 Apr 2024 09:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KtrnCasW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA7C10FB95
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 09:57:39 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso64681766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713434257; x=1714039057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zXwDxo3yNgOLbgTcANMQ9MnO25hrRBwhJ4xGHdCadxE=;
 b=KtrnCasWV/FNHUCPAqnO6y1kxOu/8+X5H1GtIPAfEVbo5J4yits7DsIRkcynTsIgZn
 JczB9E6UR8vKraI+dimcPDjtDp3imTb1QkQQIde1WkRfxed02I4J+8JCLdZjADhiT8ld
 AAy96wM4KYgvSXCYrMr0xjJimbPwpmBSboSLqFvOFGVADvziP2otzrzqsf1qND7Lrn8J
 XgMGCFyCOYz4qMGhQDdMjvB1khvpdxyRhWVrvi8dGvFacBPAWvIMwudzhiA568vQanor
 xrOZ4suLeKzFoAZw30wJ7Tpj8r4mlXMG0EfJCL2qQuwF8Y//7YN147mApuf2lpVIeKdL
 /CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713434257; x=1714039057;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXwDxo3yNgOLbgTcANMQ9MnO25hrRBwhJ4xGHdCadxE=;
 b=wSdKk0IxnaiUN3Z241kafmN4hBrgQzdHN5IBZKJ8c6fOg/6bdBOZLx1M6AYhDAF+O0
 2PPZQJcg2aT/vXa8sjt+RgsSIxyi/3FxmyvF+3HdjYME3LZcLlXr6k173RX6MB9Wzl+J
 jx2ljozAbWHsWqPbL8aan7pdeXUMkAXrNYtxl9iJZJJuPXX4Z0A/cxNIQpEapGP3vT3T
 bG82VbuIvlrKd1ak/EfUJ57IkxaGGTt7mB53HrpuFZzdcjdzYlk2rkPeELm5rs0uCv2u
 5TgIFM+UUrA22yJvrlyxIvX5IHHXWo74JPp6iiHRW6SD3E5kCRVAyEkt1PRFsod7f43O
 Kl0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW+GM+pRLpfC0BNRjbJim6R2Y4pXvQEYXdhpAV4UM+On23B14AYM0KabWFdM9qP9GgHuuXyszxT2/iX32RdNNTAjs1dEn/FmuHrN2WREfj
X-Gm-Message-State: AOJu0YySEECafvxAxeZC9Up5k7nqlEzonn0q/VKViwW+WImNn7IoAL5v
 or6RP/sb5cvu3/Nx6Nw90SHEsbnISXq+8Z7a71paqi4PA6ZVBwZONu2XXR2V5MQ=
X-Google-Smtp-Source: AGHT+IG4Ip44mhQHs2Rv5rrzJRGMGfJqeM0856BXRQLMSmmBeTtp7NnfFDK2mT/5Pr31/cdmO7qcfg==
X-Received: by 2002:a17:906:3c3:b0:a52:2e08:207e with SMTP id
 c3-20020a17090603c300b00a522e08207emr1748131eja.77.1713434257541; 
 Thu, 18 Apr 2024 02:57:37 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 i8-20020a170906264800b00a52433f0907sm664056ejc.37.2024.04.18.02.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:57:36 -0700 (PDT)
Message-ID: <132c1e03-f55c-46ba-8a22-9cea1ebdfae1@linaro.org>
Date: Thu, 18 Apr 2024 11:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/msm/adreno: Redo the speedbin assignment
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-6-c84f820b7e5b@linaro.org>
 <rilfqdvei26bjyz76hdsh5wlh4s2lcn235up2vxbs65pnolyty@rs77jbxxqzye>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <rilfqdvei26bjyz76hdsh5wlh4s2lcn235up2vxbs65pnolyty@rs77jbxxqzye>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.04.2024 1:49 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 17, 2024 at 10:02:58PM +0200, Konrad Dybcio wrote:
>> There is no need to reinvent the wheel for simple read-match-set logic.
>>
>> Make speedbin discovery and assignment generation independent.
>>
>> This implicitly removes the bogus 0x80 / BIT(7) speed bin on A5xx,
>> which has no representation in hardware whatshowever.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +	/* No speedbins defined for this GPU SKU => allow all defined OPPs */
>> +	if (!info->speedbins) {
>> +		adreno_gpu->speedbin = ADRENO_SPEEDBIN_FUSE_NODATA;
>> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> 
> BIT(0)

You mean for &supp_hw, or "1"?

1 is the "count" parameter, supp_hw is a "u32 supported_hw[count]"

> 
>> +	}
>> +
>> +	/*
>> +	 * If a real error (not counting older devicetrees having no nvmem references)
>> +	 * occurs when trying to get the fuse value, bail out.
>> +	 */
>> +	ret = adreno_read_speedbin(adreno_gpu, dev, &fuse);
>> +	if (ret) {
>> +		return ret;
>> +	} else if (fuse == ADRENO_SPEEDBIN_FUSE_NODATA) {
>> +		/* The info struct has speedbin data, but the DT is too old => allow all OPPs */
> 
> Missing assignment to adeno_gpu->speedbin ? Or is it fine?

Good catch. Only mesa (and I suppose you :D) read this value.

> 
>> +		DRM_DEV_INFO(dev, "No GPU speed bin fuse, please update your device tree\n");
>> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> 
> BIT(0)
> maybe #define it?

(ditto)

Konrad
