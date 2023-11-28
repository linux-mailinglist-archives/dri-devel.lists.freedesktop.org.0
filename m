Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E261A7FBB3B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13510E520;
	Tue, 28 Nov 2023 13:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C2010E520
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:17:57 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9b5e50c1fso6752081fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 05:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701177476; x=1701782276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ob6Dwe9f9aR6JR07mR40cYGUta2Fbcmoo05Dfdz/Nc0=;
 b=xfOJ5RBp+f3YgQkdjWiXZbcgdhZcZIWDpdg5DaNQwVH72fJWov7ciErfHHwwMUozhp
 bnl583oEnYyd1eqPzUZmRSXyKDc8JxAoPZaR5TpEMvqbzy9Uw3zU2/7ospT9DNx/Z8j8
 q3+cr4sluXiqNhJA3l+Zr7I6GYUuueYEIef7iulsY7JrdQfo5BuOAbGJYsYGyGiqGBnf
 aWYnZWAf0nsEbXxSHP2bUhNu95Amuk59YENV5/wQx5Y2+OdMZz3dK0jpjho8gWd+Rb6e
 QGYeNoPtXFWwmcYNR1nggEfpOiUlwMqGcaAt6bMQBHQtRjsyBpcNztkMuEQHQfAzfxzu
 XXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177476; x=1701782276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ob6Dwe9f9aR6JR07mR40cYGUta2Fbcmoo05Dfdz/Nc0=;
 b=WFtLXLJ5KB0s4x5N0eitYGMZWDqBVkJL4mc4AcIMn7nth0Jq6UN4OBCf2Ow8eBKm+m
 TfAr2iiFa4Xf2YoZc0OPtbpVBYH2TTY9KJf8oP1FdYsFMUFyvQA905muYrr/I9Q11hFQ
 t4SK8KSz6Gk1ml/68gmR1QNSajG42ubNeRurjZsnZdizWhk3pOiwNiyPeB4AjAnUVB4/
 lJzaYkKn+Grs+RC7OgDj2LEnQiofT8UnscTih2XJ3f7C+dRV6lv2YoW916Bgh9MkRlYs
 1HlYO1FPrzThMQkp/XFFKlDoIujAKL4916V1ZbPfnctKXk6rvTchl3bYkH0W6lIydDYO
 6v/g==
X-Gm-Message-State: AOJu0YynhIBHvCERBBtRyne2i5b8OM2uuOk8N3wG49FeaoZpWz232ZJc
 H6aMKfzhVLIfDTJ2vXMAc+8FCg==
X-Google-Smtp-Source: AGHT+IH1GIPmjgbvzy/uIw06dHH67zeJBobtku+FnhWeFT/vxlN0iIsyhl9fDbfRokKA4LPRXfdxDg==
X-Received: by 2002:a2e:b5ad:0:b0:2c9:a1f5:488d with SMTP id
 f13-20020a2eb5ad000000b002c9a1f5488dmr3993190ljn.24.1701177475968; 
 Tue, 28 Nov 2023 05:17:55 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a2e9547000000b002b657f10b78sm1707226ljh.58.2023.11.28.05.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:17:55 -0800 (PST)
Message-ID: <e7fbb6ea-da13-4cb1-a459-99e8636bdd67@linaro.org>
Date: Tue, 28 Nov 2023 15:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm64: dts: qcom: qcm2290: Add display nodes
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
 <20231125-topic-rb1_feat-v2-8-979b28f35e4a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-8-979b28f35e4a@linaro.org>
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
> Add the required nodes to support display on QCM2290.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 214 ++++++++++++++++++++++++++++++++++
>   1 file changed, 214 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

