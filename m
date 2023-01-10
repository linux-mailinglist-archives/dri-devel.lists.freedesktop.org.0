Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8E66380F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 05:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A831510E0DE;
	Tue, 10 Jan 2023 04:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B510E525
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 04:18:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v25so16347733lfe.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 20:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAbrvIDX21sORhEpMRKBFBGE1ijyHzGfQa4j/vy210g=;
 b=wVcLbz6qKAkEDzLBDbrj0XoNmBd3D66kdBI5sin4HTu/Q65cWDdf5OCsrbv/Li4IOa
 QObJZ6e4KFlS1s1X9cUiYRj9xcSWnXCOqbXzoV8bllvVNnB837Gqs2zgyFd6MnyEaaQ1
 ovKJW8NUZZ2r/23tlF1yuvUBJpMoetpJzHrdsoKtvoEl7lw9k0fkJmq/plYMp5TjZ6Jt
 15NHN6kLVgt1aHPiosoYWouMabAQw5dcmLFgCKOqVfYI/JRu8Ch2m++wjbIb9rkaBZHF
 rL+g1xgixhUZ+AHUpQfxu7K3iu7kQGeyqqsQnOkQX+0tptqoNocsm6pLS6PpUybla9Sx
 VYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAbrvIDX21sORhEpMRKBFBGE1ijyHzGfQa4j/vy210g=;
 b=Y4BohsEEMJwHZeimoKx4ovuJN7gTen2xbC61kx5xB+BqIVfFEd3ivmjwsD13c/Nrz9
 ZzE8WH66v1QsnnFDuY70f1nKq/unAvVWwfwPKASg11pFBw76D9bsGHMw+QqNPznjgP1z
 xqZ4dz5iiPt/Rm7CLad52w55EqYaFVa8DUOWxZuHPXLjgh7G2sSpF3r9Vs9Gibf0AQlB
 tYK/GcHWSabG7vbQqsTsCnQCckENU+ynpDYEOKDuX+jI59T6C76eOqNainX+4xozkK3k
 xeitvfN18ru1MYZKRNCGy1Vj0bZ+7F6DkYWC88Uy9V6n8Kp0U6efm54qJXVXAPphvohz
 c1pg==
X-Gm-Message-State: AFqh2kqkiVo03EmC5+Vt9zwG/2txv2STvoekLcdevGxrgdJzn6GCNUPx
 i78NhptDXHd18vn0xEly/OUplg==
X-Google-Smtp-Source: AMrXdXtGqxB5FWKeH4Hz54MIYp9cdc9vjkF+6IIeAl9xo/p4w1nnxoIC8iPDN9GOhuEaFdyvoT1vjw==
X-Received: by 2002:a05:6512:65:b0:4cb:4438:30a3 with SMTP id
 i5-20020a056512006500b004cb443830a3mr674653lfo.53.1673324288764; 
 Mon, 09 Jan 2023 20:18:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a056512200d00b004c57abccb8bsm1956949lfb.102.2023.01.09.20.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 20:18:08 -0800 (PST)
Message-ID: <e8f80539-f253-a6f7-3c5e-e6c94dac31c2@linaro.org>
Date: Tue, 10 Jan 2023 06:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/7] drm/msm: add support for SM8550
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
 <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
In-Reply-To: <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2023 01:43, Dmitry Baryshkov wrote:
> 
> On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
>> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
>>
>> This patchset is based on the SM8450 display support serie at [1].
>>
>> In order to work, the following patchsets are required:
>> - PM8550 LDO fix at [2]
>> - DISPCC driver at [3]
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: display/msm: document the SM8550 DSI PHY
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/71917f654bae
> [2/7] dt-bindings: display/msm: document DPU on SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/602082368233

These two patches were removed for now, until we have dispcc and 
interconnect bindings in place.

> [3/7] dt-bindings: display/msm: document MDSS on SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/9cb8eacfb528
> [4/7] drm/msm/dpu: add support for SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/c3cc4e88efb0
> [5/7] drm/msm: mdss: add support for SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/f96cca5ed719
> [6/7] drm/msm/dsi: add support for DSI-PHY on SM8550
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd17f93661d
> [7/7] drm/msm/dsi: add support for DSI 2.7.0
>        https://gitlab.freedesktop.org/lumag/msm/-/commit/d797ca161b87
> 
> Best regards,

-- 
With best wishes
Dmitry

