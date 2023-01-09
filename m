Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83B662249
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B486510E366;
	Mon,  9 Jan 2023 09:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAB410E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:59:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o15so5836083wmr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Cn4vLeVySoBtqVu3i41sS2U3Dt5cRoRgiGZVokmaYA=;
 b=q4AYeeRaibX7fUgiXkPtELQBLJ0kUN05+wyCDe6L3i2eK7oPhTomiBOt6eT3u5F9Ld
 1fuZ4+l3AgKXVPYUDY/08kPnKo94oALnGFF6UeF+5qiRcAUPjX2IqeQwtadDluJY1VL5
 ndIAwNeUBRRqNTDwD5m/Eu/bQCy0CoRHSR2Qmf+YIrDK6+iqr9iZzOVKJJcZ5xstms5z
 L74fDxuHfftSR/DFNqQG9rj4XQQ0Fe2k2DtwBskfQcgyrRWvInLRUY3MuyJSrQvZgZnD
 fk/5djVGFzQPsHyPlw1/z4KUfVK4Y6BIw9y46Q9YgkxUaVlj4mYPa5FT7dVXHN6gYQ+t
 8F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Cn4vLeVySoBtqVu3i41sS2U3Dt5cRoRgiGZVokmaYA=;
 b=KVx5Yelx/oH4C0U9cs1R0oweBmsVIskmZwj6QJ9gwkees/eJChs4I37blb9zDQms1j
 w9FGy2GXf0mf8PqGwMB26y/LqGioxqjptowNIByjM/6tYIVj/r39Z+h0s++wnUSai/VX
 hTUD2ZnSfm7CRZkxqNZzNeq0/30UCFoC7qvs3/nqF+REHo3aTILZzTlXGl9VntDxgLTo
 mS3SZjn7ua2n1yGKPc1G85g8+ZRjLZVvTbH90v8wUY6G8xxfGXkgPjHNju5WPKlYf8gQ
 j2n91vqXS1VFplVa2ORZCcWEwIabTGDjbG/xHzHvloVAVGlx72Q+uqBCMMLur4DzBl+M
 Of5A==
X-Gm-Message-State: AFqh2kqD11/jpr0hFDytinYRWjoGUfqcM9C6i8+MhLPgPwMjOWb2oVWP
 mbt5QKKjJv+yHwrYX3xkPfsx8A==
X-Google-Smtp-Source: AMrXdXumq0LLDXjebDPOt/mbrfyEvhtsOKdsYIqeFv1T90LrZOYUbvJ/vcGt8U4kT2anrYBvrbe3cw==
X-Received: by 2002:a05:600c:1d89:b0:3d3:58cb:f6a6 with SMTP id
 p9-20020a05600c1d8900b003d358cbf6a6mr45676516wms.41.1673258375373; 
 Mon, 09 Jan 2023 01:59:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm17318996wmb.42.2023.01.09.01.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:59:34 -0800 (PST)
Message-ID: <1c2312e6-73cc-af77-3ce5-75de2bc70213@linaro.org>
Date: Mon, 9 Jan 2023 10:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: display/msm: gpu: add rbcpr clock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109054407.330839-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 06:44, Dmitry Baryshkov wrote:
> Describe the RBCPR clock used on msm8996 (A530), MSM8998 (A540) and
> SDM630/660 (A508/A512).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

