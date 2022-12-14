Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A929764C80F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 12:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE15410E3BD;
	Wed, 14 Dec 2022 11:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1790510E3BD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 11:32:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y25so9901089lfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 03:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GZH3XT6lTlLRNGTJ73ZDjLUEvijxVcPXVJpLiElakDk=;
 b=YGtHyBCnTJ8gs4i/HEWe9cgKVAFFzQdfLygGe0mPGvT0yIAX+RgwFAO78MQS/oa/h3
 RPXKTKm3ictGbJdL3xllATRJIyVJpUuqH1h1b4DVjgo0Tuxm2ZNpOmma6kwd2inAKaIr
 FjXMWs5HoSmseuBE6Z5e2WjvXKUEGmRBgLeVCzvRjxU/Y/jlUH4xsR9zq6R0420KAJPw
 EX8l/1nxKKtvGB1Wi/fsaXTvGsdQZ68AgfbVvJZN1yRTXlxT/VymBxmVkq4LovssUqtB
 J3YJVDZyXzZRySU3rKHzhuTps89Xuf1fmzEU6qNMZmi0LO/a94EgRdnadDBZE3XVmCrV
 ntbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GZH3XT6lTlLRNGTJ73ZDjLUEvijxVcPXVJpLiElakDk=;
 b=CtKuloJzjSk4/W08VnHV2uknutcTrtULC6uk+pnxalmxsul2rUwahHUFBLGBcX5yrF
 0Cx2wxO1yVj8nXRK7GEIR4sUk/1adp6s/ORdTky7CcQ1kJkjdAfT9vTAl6udEycR+t0u
 UqGcG3GLdtbTvqYvZvjSOZaszIZyurPDs+Qvd8n9lwkbZ8KSO/F/k/+GeYyxCYNkUDFc
 5SJCfXlqiiSOq1y+rPqvM3s1rXF2CsrNGkJ1ItYV/KHMNGZ6JT8QdZrwrmpgudukvd64
 Viy0vYheKTKiGqUfOKRFveCsgHOh8dDu7whESDkWpv0HllNtJleZl5SyRup//iTZ/GWy
 N8sw==
X-Gm-Message-State: ANoB5plrnqkJ9sRhfeS0REpUs49srxUB3Z193dpmPxJseC5F06Rc5KBD
 K1FhCCpg9VPg5it+G4HOtk4NOejU4ZtzCHAW
X-Google-Smtp-Source: AA0mqf5jw5C31aaaMe11ESCzNTaeNGoE8ERX053NGxmAW3INXjCgPRcNip5wnRUM3AQuZPy3DJEZ1A==
X-Received: by 2002:a05:6512:3a8:b0:4b5:964d:499b with SMTP id
 v8-20020a05651203a800b004b5964d499bmr6418347lfp.34.1671017538398; 
 Wed, 14 Dec 2022 03:32:18 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651234cc00b00485caa0f5dfsm780956lfr.44.2022.12.14.03.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 03:32:17 -0800 (PST)
Message-ID: <aabff507-ad37-1cd3-b1b6-ce8e6dd9269a@linaro.org>
Date: Wed, 14 Dec 2022 12:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/2] dt-bindings: display/panel: Add the Focaltech gpt3
Content-Language: en-US
To: Christophe Branchereau <cbranchereau@gmail.com>,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221214110037.149387-1-cbranchereau@gmail.com>
 <20221214110037.149387-3-cbranchereau@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214110037.149387-3-cbranchereau@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2022 12:00, Christophe Branchereau wrote:
> Add bindings for the Forcaltech gpt3, which is a 640x480 3.0" 4:3
> IPS LCD Panel found in the YLM/Anbernic RG300X handheld.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

