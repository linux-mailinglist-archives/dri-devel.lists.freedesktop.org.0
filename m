Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584F69B476
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 22:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1110E00F;
	Fri, 17 Feb 2023 21:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1B10E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 21:14:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ja15-20020a05600c556f00b003dc52fed235so1721535wmb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EW4MkRsSt97nP2OjfvV/HrGYB4OX6Pt48nDkauxGyVI=;
 b=wRikKBLe7U1qL1RunGMOmQJZb52SbsdTuBi/QKYTXpD0L7ZK1id5boXGjsYdHFf8vf
 LJIvZGWBbdvPssG79W2NBPBD75X7A6RH3cNtPCVKPvFqCP9aLLd/PFXKwRykabDpdeon
 pe3DsWjPFB+lDLA6LFksZBcxs6+Swd+CyVvO0XFJuKhvATe5hgC9jVAQm3gntTZ+ORAD
 SdDTQC8/KwWbbb/fr8ZnSKCffiPh1iLNrmCxO054pkTVH1udo2qXQjw/PEEiPXm15HNI
 HHDrLgIPXsXTUxzCcODGO1YDtlYrmsI2h3zYCsjB9yOc0J5SPItWlTZKDK8ZERv1rHiA
 F/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EW4MkRsSt97nP2OjfvV/HrGYB4OX6Pt48nDkauxGyVI=;
 b=O5XWVlHGe+3kEKjuwEYveAQKFiVLejiqKySPVoi5uOvzDmOZsM0x0HqCNhJ1eVOZOD
 7HXYA803Sm1Zzad8YerBfaRvDLLFRrk6ueL6MRVdjIIvAaXR+7tLbuFT1kFVKscF3wX4
 YQ0Xt5b4i9gheHArpgBvTEBWc0KEtFNklLqli15O/LY2ISU/rzDM4Ir0/l0eWGvUvzHR
 G/ux4y8gEFBEwDdnsqzx4fuJpiFaktVJ13t4U0kRo7QHQGKZPv9XujE2HPIpCXwXtjUx
 yYJoBU2BezR4r9HtjBYnGn6a4G7nrfAFBQz9iKzUc8vL52dcLQcKeMX83eEZeM1MzkEq
 5DzQ==
X-Gm-Message-State: AO0yUKWdyao7Ub0tpeO+R9ujeP8ZPI+ToKdOh38sJCXJlxgFDXHeZf7H
 3aQdvyqwoUpgvWLMmy5pVBbjkw==
X-Google-Smtp-Source: AK7set9bJWwf6VPImlBjocxK7OpKYe1M5pUpgHsEVTe3rlCdpxBRrmj8mEol2u8NhQQD66+cxhN0VA==
X-Received: by 2002:a05:600c:1895:b0:3e2:589:2512 with SMTP id
 x21-20020a05600c189500b003e205892512mr1723935wmp.21.1676668441188; 
 Fri, 17 Feb 2023 13:14:01 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 ip24-20020a05600ca69800b003e223fe0a3asm2771609wmb.27.2023.02.17.13.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:14:00 -0800 (PST)
Message-ID: <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
Date: Fri, 17 Feb 2023 21:13:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
> First, it would be nice to know what was the intention of Bryan's commit?

Sorry I've been grazing this thread but, not responding.

- qcom,dsi-ctrl-6g-qcm2290

is non-compliant with qcom,socid-dsi-ctrl which is our desired naming 
convention, so that's what the deprecation is about i.e. moving this 
compat to "qcom,qcm2290-dsi-ctrl"

Actually I have the question why we are deciding to go with "sm6115" 
instead of "qcm2290" ?

The stamp on the package you receive from Thundercomm says "qcm2290" not 
"sm6115"

?

---
bod


