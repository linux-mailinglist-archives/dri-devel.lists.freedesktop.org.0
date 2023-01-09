Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18056621F2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65D10E391;
	Mon,  9 Jan 2023 09:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565FE10E391
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:45:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o15so5809511wmr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lLhH0B+uL7u8FwbJcnA84uIuHyq/9Ih7+fgHG/d+w/g=;
 b=U/h+91bn+r91+v1YTW1nvU4AvAAw8s6Tk2cgo4doYUseV/Bpu0rMpft+Vd9LPM0gxz
 5ohKV0lwD8VU3mmrlDRbttFGt47lR55lUefIlsgAxmIy/NigXmj1CIvn9C1LKYlMlW/C
 TYv3fERgIl3xTwlbQ7vsBaUo0CJGtENI9dO5SDFVQL1+zWVxSpz7ffyOEiC0kmfEgjKL
 pSr4f23TMg0SyxkZ+ZxkISWFKNv/HC4Hf7dPQi0gi2DM6an9hE9XLyCHsrAnx+EhoAmv
 25MNiWxPhnLAKDCH+7hgOqOnoToUXta71Ewav8+oV+s8pzy10kQ7KO9Xq9tzlz08xuak
 0KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lLhH0B+uL7u8FwbJcnA84uIuHyq/9Ih7+fgHG/d+w/g=;
 b=UyPxppOpiKEJrA7nueYkoZ8xv+ULt0Gsk/Tmid4/+Yqfq8h9ajnuiBFy3+0dyIoRuz
 pKHeR6ygEKDWMnmRXjfy3Dfnsbx82i4XirQ4cL4+Yx9tLJ0ax/h5nc2n6W5fk9a0g1mL
 KYz+8xJuhX/ZilL4FWrAsEtS36ObCxKrXXHWPQE04NuM8wdLykYQE7RPtEeE708V4Awn
 5+UJsQN+uPpCZpDIN8Z6KWOLVaaFRMCV7QTt7UdtVSvVg3iDdiqziT3YBUcZZyYG6OhI
 FdW1He8hi1/Tq8FA1PUBDhtiAc1a2VkTXtKENN37JW7cgkYjzdDI1SqN1Pj6xWfRO3I1
 0lAA==
X-Gm-Message-State: AFqh2krNxIxGaIwp3nnfRTS7rCUQSV7ki0ZRJmCv8ZI8BVikuHNq9H69
 M1Q93KJ3XEKX4oJg97OFJKwuOw==
X-Google-Smtp-Source: AMrXdXsNwwIJlURsNnzcw8mgN/L8ukGjkVQPEV1pXW7YTj9pGd9SrJeJnJMo3fMmM8r37up3DG8GMg==
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id
 a7-20020a05600c068700b003cfe7c80494mr45806546wmn.29.1673257512932; 
 Mon, 09 Jan 2023 01:45:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b003c21ba7d7d6sm11313513wmn.44.2023.01.09.01.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:45:12 -0800 (PST)
Message-ID: <e706b0b9-6b2f-7b0d-fdd1-e66bd3d6c736@linaro.org>
Date: Mon, 9 Jan 2023 10:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/7] dt-bindings: display/msm: document the SM8550 DSI
 PHY
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 10:26, Neil Armstrong wrote:
> Document the SM8550 DSI PHY which is very close from the 7nm
> and 5nm DSI PHYs found in earlier platforms.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

