Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4870A450
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 03:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D7710E62A;
	Sat, 20 May 2023 01:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957BE10E480
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 01:33:09 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af16426065so31471001fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684546388; x=1687138388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9m6FYEdyuS34WJpEKNGhiGJw26BbhauPjEFJhVqIy84=;
 b=J2WAtndni5pg8zI01jaEewzpdR8rCPsAoHbZekp+7M7wC2x3R9lV418//z863DW65n
 2lUc3KDyHqYLd/BYBzCb+uiqjLN/9CLt1T1xBY4W326Xz1VlLg27DhrsdUr4KSEGc4e7
 rwLGneMzBtX9uDKXQ2tiw+kMkyTrE3mKeqUvyAOECJqTiUVwCraa9sePU3K9gItlfFUz
 1fccnmpHkpoYH6BPpwxCn/QluiL5NGN+jeyHtyD9ahQjzJaKQvimoTnyv59pD0rWMtt5
 FbuBOuOjbn7d8xA3FKXll6cU3ijggLoMHkMRp8NIQ9Qd7KxbWm3ySAdYBfXjJ8Duwq71
 h4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684546388; x=1687138388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9m6FYEdyuS34WJpEKNGhiGJw26BbhauPjEFJhVqIy84=;
 b=DRN5Nvx4PtQFbGASnjM5JpoxXaR/hbQoynGRvrHO382FHHF4hMciNmGokijHHMDTp3
 nCg+d/i4hnNX475acNwTLzNv/Ml7rC+40GKLY2/A1EytMa+32NuOwJFPmstPNsBuMnhB
 ETKb+FmkTmwVB4JdQHCczYEbSjaqSz31T+EL/A9JLwYz5qrGXyXtU/hLG9SLupMpVffw
 pk7YUij1izUw87GECrZdTJDSp7HP42d7KSdEA4McP9iQrzkweWs3jw5UxgK2w9eC7wLJ
 TZqE8OkGVVClvk9t0zvr3VJMAtMynj3sALEO73wO7AqvKyK4tyuz7fOkrGpKzCg1sdWf
 XNaQ==
X-Gm-Message-State: AC+VfDw6bQ39xrDTeqZwqeCj7NOqbrdJ304RrQ2EKHH0rren/WDDm1IH
 jb9sb0YLwtpj/25r+QOH7ZAVqA==
X-Google-Smtp-Source: ACHHUZ7hSJky8D3B+kEQc4AR9VaHMZsAgYX95I/Fi+l7dRlfuSrwNICffM982tuTFljAsF+j/ezRAA==
X-Received: by 2002:a2e:880a:0:b0:2af:20c9:3f8a with SMTP id
 x10-20020a2e880a000000b002af20c93f8amr1515995ljh.7.1684546387794; 
 Fri, 19 May 2023 18:33:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k7-20020ac24567000000b004efe9a169d2sm92819lfm.64.2023.05.19.18.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 18:33:07 -0700 (PDT)
Message-ID: <02e1886f-801e-6100-f977-be407697df29@linaro.org>
Date: Sat, 20 May 2023 04:33:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 08/12] drm/msm/dpu: Add SM6375 support
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
 <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
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
> Add basic SM6375 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 153 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 156 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

