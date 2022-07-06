Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E51568DEC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59208113B4A;
	Wed,  6 Jul 2022 15:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7B11AA02
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 15:46:46 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u14so18995758ljh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xn1I8bjV+RlJzEspA44PeNwzgMS+NkPzrECsX/hzxxg=;
 b=FwUVWm8Oh1uiIdO5anRZpl+MjgDD/uMdrPsmsw/RMPc1F3mMG5lEqUhD155Ul6uxGf
 z+PakeZK1lUXOQ0uO43QlnHJuPWDf8Ao6cR+NJCGHXLie+SHIowoT3yo4EVqORUj8Ohi
 x26TloYV1bgQtTp7sYjtgIIKg9utwyXWzK8XiEt43P6f/9JTokXFneYwYRZlJR4c+qRQ
 wP+mWBp8Jd9se/fnb7X6POgATSWs01zqrxxNdmoS28kNcu1oSlWLq6dII3Y7N4e8++j6
 nEK4RXDYQVWH8OGtvPasr+H5+KtZMJx5Uqj6gHhh0Bsn0W+WGoERrKH1I3dLj+uV37j6
 KgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xn1I8bjV+RlJzEspA44PeNwzgMS+NkPzrECsX/hzxxg=;
 b=OV8OPKE+X7d4vGwjGrCOS6RDvZpKBI6gcuK3/AsSAu1YnkiH/DM4aR7yjPwExuUc9h
 CUGfDDLx0+GSwmBjq7uh1vp68Z9y+wikAuFoylS5fGZxr3hPlBSRKbCwtU31KS11rSuT
 KLMdQ7AE17IxIAmROuMlwJ/Zaa3vntcdNxhhYNnJrn40sBIhZE7IGYr95VLyJsZuZeij
 +slZrJ+8zx5IUkpu83Pq0cM9gmTPeibuDKafc7BmT9gqbCbTDt7Jn8PWqDkggfNsCDwB
 I0dziZXm8i31BgrKtrngnZgV188EUu/lJNu13+GT3qLiFffst/FNHX3jD37keKlPm1bZ
 YgVg==
X-Gm-Message-State: AJIora+fwv+1JYfXHWO0mScR45bgBdvy3crYxPes2B8PQS+DK5hLUV5W
 gecswvJWsjP5nn31AUboYTB4nQ==
X-Google-Smtp-Source: AGRyM1vs88TB8B6mXGQSMvuM1u4Ah9asL6Qs2+9vR6BHwC6N/8LHVDKikeIbBY/FLgfAqb5NQxc0jw==
X-Received: by 2002:a2e:9808:0:b0:25a:a30c:e5cb with SMTP id
 a8-20020a2e9808000000b0025aa30ce5cbmr24296595ljj.312.1657122404816; 
 Wed, 06 Jul 2022 08:46:44 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05651c211600b0025a65b784b6sm6233022ljq.33.2022.07.06.08.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 08:46:44 -0700 (PDT)
Message-ID: <793e34c4-cdfb-8629-3af6-6829aecf4fce@linaro.org>
Date: Wed, 6 Jul 2022 17:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dt-bindings: display/msm/gpu: allow specifying
 several IOMMU nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 16:52, Dmitry Baryshkov wrote:
> Different platforms require different amounts of IOMMUs. The APQ8064
> uses 64 IOMMU instances for GPU, adjust the schema accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
