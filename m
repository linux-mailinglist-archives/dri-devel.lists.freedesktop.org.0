Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028E7FBB34
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A4B10E51F;
	Tue, 28 Nov 2023 13:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED86510E51F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:17:33 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c8880f14eeso69482921fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 05:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701177452; x=1701782252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAr4/m2ajzddsi7hfMwi2CwtuYecaq14RypvJQRLzWo=;
 b=BoCQAXC2hht+m30lc0s+qbnKRTt7UgE0klkWYeYo2H6Yb0yjR3eN1gBC8vWbkYAKAR
 yARo1CxJLfCNLCEUsGSFSEhs4HABGWQlRXtcUMRgBaA1hCRfik872+eEbeXin6MdG5ZO
 npnYx+KnXNLrjfLcN1LNBMJgg9/JCpjhjK1jpSvobYVdI9yN1AaXvzKebtaGl7RFGqCU
 aHYxYaVk13/8oT/r1auOMSva2E7nVgN+pyAMwLVpQs4MhbWrsrpcN1IM/lcKQaxHB0v8
 36/9hCpaHS6ZEgrPRoxI1oGmDjTM7pvRiWdOogjYoQfUndT6RXHkL7L3lcpUquzXWYdi
 WrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177452; x=1701782252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAr4/m2ajzddsi7hfMwi2CwtuYecaq14RypvJQRLzWo=;
 b=KVNJG1TGY9IEmnyvNbHl5IzOk/JGltORbNPsfL4gB6Ux9+6D7UWyL9Xe8fTEzs8pEl
 3TwhniEaTc+3XtkHesukI9jWNaxgdd+CuWkpHxZ4+tRH5j5+RJKQ5BY28M+GappWBC78
 ArLfXkPrKJ2Fvx6xqBQMel7QChMhVUId4yiKiVuBQtkIUJACevcm3Biwx2Nv0TyPVmZF
 lgArkoGOZgdntbiYfbNaUsPYzbRJ1PADNUIjB8StfKVTky8FlQ13ifG2ebnruJXTDRrW
 apMnqQWALcDbE4e9FpjQq9gB20fvicy7E5lUz0sxHPY1edKzk5BiFUAfft2Cz3gPHL0Q
 gpIw==
X-Gm-Message-State: AOJu0YzXnuHJI/5TA6Z2itCMw1KE9N85b+HUZvU3lIcUii3Q+MXxE8iO
 2CsKBXI+MHP/njGKdfO7dbcu1Q==
X-Google-Smtp-Source: AGHT+IGVxWPP0V55ZOwwGMT/RGUBPGkfdgvpKvOQb9OJayj/M/2NUiUPahV+CyCvHpaWlYuulUl4pw==
X-Received: by 2002:a2e:9b4d:0:b0:2c9:b4c6:a7ff with SMTP id
 o13-20020a2e9b4d000000b002c9b4c6a7ffmr1015094ljj.40.1701177452153; 
 Tue, 28 Nov 2023 05:17:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a2e9547000000b002b657f10b78sm1707226ljh.58.2023.11.28.05.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:17:31 -0800 (PST)
Message-ID: <c0ffb1bf-9a3a-4a6e-a62c-a7777c3458a0@linaro.org>
Date: Tue, 28 Nov 2023 15:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: qcm2290: Hook up interconnects
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
 <20231125-topic-rb1_feat-v2-9-979b28f35e4a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-9-979b28f35e4a@linaro.org>
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
> Add interconnect provider nodes and hook up interconnects to consumer
> devices, including bwmon.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 248 ++++++++++++++++++++++++++++++++++
>   1 file changed, 248 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

