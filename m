Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4ED5B023A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9A110E590;
	Wed,  7 Sep 2022 10:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E605A10E590
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:59:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p7so21832713lfu.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wKm3uG6dnmLu6065OH92LURAn1cZIHuh/RQvvLdKatw=;
 b=j6sIX7dAOU6LiLhI+DbXtEQ3xWYTMiJ2XI0X13RPmjNrxD1IldAA7mlRE/NCrLQBrs
 DtpWtC1fs6C4MtLbPNFbBb5rVlQpZbZeuo+cvsos4/r+ZdElChPoQOO4/5X84RMip1D+
 cWHx04tG8V5wmoeQZhxMvyY2RwN1l4MF1n2DoyJnq12qb04khczTwh/2Ppebtfj6W4dl
 I2nqyh40VVyforCnWUwWEKf9iflCQRLwNq42qhHa9pybEIikuI+VrECiHcZn0mnZ5O0Y
 hwbstKKv74BTdhik0/+ZYTW4trUrZMkhkwAkVPkaSCg7cuIvAJxB6rg7MGotK/Z+XanD
 NoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wKm3uG6dnmLu6065OH92LURAn1cZIHuh/RQvvLdKatw=;
 b=VKFQ6IA8A38UptILNtxtSYOn5p1jxnjVk+FOnXG6fjfhMuJ96UK0FL+r8okr00/MDa
 XjiVWxubvKsomejcYa7YCUVRYoxZ4WYHK4Taszds4Qya47sD9pf8238jY+Z4kJ81Ug2n
 OEAHsUsPsY0JgGKwqRr29eC9PYQfpQWIGYVqaAa43zfvjdMeUdnGdfxHcaJJpXuJmfPT
 i/m4fx19noiY0S+0z1ShlqZMqDSa6EljIEBN1X0uSYgsixnVPvgvrcdoh8ygUclGDM9P
 77SBLXikPaK1W4W9ICWTzGLXgwNrJPPfzKyBFxBna3SC1V4wSGe8rWeSMpMFfBH0Y2en
 VICg==
X-Gm-Message-State: ACgBeo2CCvTuSKSGqj3VtOJRoOxiNf9WJorHj9st3yRG7/rPj124Z+CB
 5l6uYqSz+MLDWe20eTU3SdQ+sQ==
X-Google-Smtp-Source: AA6agR535DSsJbmbG7MCjomzkFxhTgd6pYqx4jrn2/eODdAhxttRGXTT1odO6n5Wqo2pvRf8Yg7Pbw==
X-Received: by 2002:a05:6512:1115:b0:497:cd1:463 with SMTP id
 l21-20020a056512111500b004970cd10463mr902018lfg.24.1662548341227; 
 Wed, 07 Sep 2022 03:59:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bj33-20020a2eaaa1000000b002641ede39e1sm2562275ljb.9.2022.09.07.03.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Sep 2022 03:59:00 -0700 (PDT)
Message-ID: <c6891245-03a7-f902-1b6f-1702b2a818bb@linaro.org>
Date: Wed, 7 Sep 2022 12:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/8] dt-bindings: Add headers for NVDEC on Tegra234
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
 <20220906132823.2390953-3-cyndis@kapsi.fi>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906132823.2390953-3-cyndis@kapsi.fi>
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 15:28, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add clock, memory controller, powergate and reset dt-binding headers
> necessary for NVDEC.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(which is ack also for memory-controllers part, feel free to take it via
Tegra SoC)


Best regards,
Krzysztof
