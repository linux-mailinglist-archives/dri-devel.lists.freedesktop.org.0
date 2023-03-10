Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6C6B38EB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 09:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1422910E985;
	Fri, 10 Mar 2023 08:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C301610E985
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 08:38:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id u9so17465212edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678437518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6tqTbN90TBZ0zefNDHJFQj8Y2oFNn+f8xqJtYKWO66M=;
 b=pRIzZ6UCXmZB2NcXkc7WBVCJ4vwl1sCOTvFMG/JG9/E2ijwpL3As5mJDTmX7etHMht
 WgTM2o0G/yHgu/7xR9eB3kGZC2f8kCyXdIQsjwN+HrGuFgrETv1P/8rPa2tNxxD6oi33
 frhXLk1Q5GFvR31T3l5/4FaRTdGwSo2HqtWQ0S/JQwyKkQ129k9Lc7NuWkgOffv1ilOc
 Y8iojBlVToX4Y1Y5KoZblpTphuQ3iuoO2WVQnRa0RqGEf4lispXd7kWN1algg0L5uuIm
 7U3mDuJzcm2kI6nqr+lRIlKgXojvbqImqJH7n8l7sa8Z3ODbpiOhFJk5Oxsc3czcombI
 7r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678437518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6tqTbN90TBZ0zefNDHJFQj8Y2oFNn+f8xqJtYKWO66M=;
 b=DN4P9bMDVRQkNHk8l6TlaQBZnZdJ36hoLjE/l5fkbDhkhRmYMY686TzF+Oatd1nshX
 73OqEpT3c3XUw2IWYgl1QmMYeswCblVxibqs1QZU53Ng3/MYbH7aFb/UL2PiL8lMg75b
 QfLjwhKYZr6P8CQ3dICndb3R4F4gxxu9kfyn90irfI8YDis9oLa9+y2WDcpMZuv+bYns
 fAv9JjAK/7H9HnnHFo9fP4J8c2htMFT2YGOY3CmLyIo86MLpoMwqgfRZw1d1ccY0hnet
 Cs4J8ueLjwfKcZCgwPFlgvW2+o8Mgfjyl7FqtgSrOuLIOPy4GzgmFQ9F6oUebQfhh0WB
 jSQQ==
X-Gm-Message-State: AO0yUKV9ti1ER+Uz8D91uFbqAhVqcanceQiqp6XTjnerLx2OxJ6AYGwb
 w/jBCYZJctvuLrO0pUymYREHnw==
X-Google-Smtp-Source: AK7set/h5FxPvnnKJlG+TPaefKxMrangV7NrqmrrnV6erBcJRruBPLyZhbPSj9qylkGQ7tlnCFxtog==
X-Received: by 2002:a17:906:40b:b0:8b2:7150:dcff with SMTP id
 d11-20020a170906040b00b008b27150dcffmr23818587eja.23.1678437518421; 
 Fri, 10 Mar 2023 00:38:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170906274f00b008d0dbf15b8bsm669297ejd.212.2023.03.10.00.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 00:38:38 -0800 (PST)
Message-ID: <24ba6ba6-7554-46e8-6ccd-191a385ab2bd@linaro.org>
Date: Fri, 10 Mar 2023 09:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/21] dt-bindings: pwm: add binding for mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-13-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-13-45cbc68e188b@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
> along with MT8183 SoC.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

