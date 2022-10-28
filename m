Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29F76110F2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2176D10E820;
	Fri, 28 Oct 2022 12:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3101A10E820
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:13:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b2so7968631lfp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xR6n4tPOTRtX/oPKaIWQlGUsVv0ju4GWJB4ChrEGNQs=;
 b=oTGAMQIRL9jE0Ap9S8AnYZna2RYYXpSYyRJjE50e+VKAoeJ7tdgFkXIeMlWTiLHpDq
 n8HT2ZWqqmSZyvC9flPK5Z3Pk4e1FE1vIewgY0/2he+JonIowrPmTDE6YUnxtZLQZXNg
 qUAuwp4HcJb8pq3OGaniff/LxuiHtYWB3a66H7j69IeV63zDkb1nNHMseyGxkmaKuzBu
 R09jekptyf45syURijFOjYJquuXlE/wa3iAd+MN1W+n9YtKSTTM75d1XLMq4YKhATXC2
 1OEckM4LgtTsXAIQRXsskyWrYwN9we2m8NVVPy4jgR21tNGC49IJMwRSn5iw/vb1KfIL
 YfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xR6n4tPOTRtX/oPKaIWQlGUsVv0ju4GWJB4ChrEGNQs=;
 b=lH3KEEQXa7DUZDmzeyHUZcae6B4XaHIwk6ifwhHl43YLtbJgJVlbIlX5GjRjJw+zZS
 lhBgFYo7YLOzfU3FWRRjnKS23iU7cli9heyfymzqoJuqIShXH4MzvcqSNS8tlpUasssh
 G6mI1nRR9aLo+g4t8TcDqHlEhDZ9Hi5ek7fCTEcDoV9akPH3y+BH10Yl8jJxZoj13iW2
 A4Xeb5m5IYHfaO5WOkBBhTzhEG9K4dO9Vf8H0PJ8ZINIsDVYE6apum0pl7W6qFv5wu50
 R9JRT3uPe8eehXJ9LDEsqpL4fQhsk4l5mfhC9EGvLE2p8aEhnEnbc3p8IBEEtyuHLmQh
 27Bg==
X-Gm-Message-State: ACrzQf0gc2/7m5upqtzNicrjukMCQTJ+dFfOt0HUOzJNSFGbGh9WMsZI
 If2ZHD9GxKr5NnVUoGELzREWTA==
X-Google-Smtp-Source: AMsMyM5MbTQFq5x3e6ONcHd6Es9SsNthXHhjHeyRI7uSJVr7cGXvBBvArBxWA4ttYfN0ItFnubGLHw==
X-Received: by 2002:a05:6512:3110:b0:4af:7f73:4e9d with SMTP id
 n16-20020a056512311000b004af7f734e9dmr5132328lfb.588.1666959209457; 
 Fri, 28 Oct 2022 05:13:29 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a056512070e00b0049876c1bb24sm539842lfs.225.2022.10.28.05.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:13:29 -0700 (PDT)
Message-ID: <cde17188-734d-8000-8ed8-82a406a2b079@linaro.org>
Date: Fri, 28 Oct 2022 15:13:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 1/9] drm/msm: Add compatibles for SM8350 display
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-2-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028120812.339100-2-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2022 15:08, Robert Foss wrote:
> Add compatible string for "qcom,sm8350-dpu" and
> "qcom,sm8350-mdss".
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   drivers/gpu/drm/msm/msm_mdss.c          | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

