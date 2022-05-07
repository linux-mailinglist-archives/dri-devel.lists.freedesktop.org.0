Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD951E822
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 17:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D96D1135E6;
	Sat,  7 May 2022 15:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4F91135E6
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 15:26:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l18so19360446ejc.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 May 2022 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+cyldYyGeSN8orZdKQgiNqxz5MRewwWDiC7Zpl6m0ZE=;
 b=EtQEM/nj6x2u8iik/awsZGdMW9VySLzyDHn2hNOsBTfn27fYbkVvNCb/+rddUBX2ye
 lOk1+3VB9PwuftOi7MlJjWHMOvWY1+q390RvKA4pTjZm2d5rtz8FOZ8VIhp6a6Etw74V
 Kg2yUbo5WXkeHWgTQ8atIDGs7kIU9L+ehaXjXNXnImkJsVlvWJtP9gRzOSUFroYbH1KC
 VCnFQV6fglJm1Tj43wlbxyPlXCbG+pxS5fTFh5del3XIHh7Aw1naE+J/OXPl7cScEdAE
 n+tBw/R7TJqcpaNBMJCZIHUYkr+OUyIkkCO6Xru4EyUjA48CQruoDX28sOqVRuitVuTI
 LYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+cyldYyGeSN8orZdKQgiNqxz5MRewwWDiC7Zpl6m0ZE=;
 b=WwddyQkfUj4gt5mT8SU3uZTwN+W65x+gPu41p96eTAaYko+IgT17Bxk4MWZe4rz3+k
 xSQMkWrzQWrLZzLBo46VsbipN1LwatTZaMZQdltYn/oVUyANBvrYCY/0cp4Og/DVUgiD
 Wp0VGsawZIFAsxdsZdnEVOEX0djYyKNThLQoydi8ffWbVuEbERwnjqrXha2jXRizCuRi
 UW6i3d/KOIimcf0nWzMW8D2v4ko1f3buRGoJ3mqFVSCmmb10ldNpfI6E+dWTm87W7AZu
 t8lF56aOetZkfdz2RpG/yIUZ2YcdKgK/7L6lgRT16WGsiDeKUjDOp2zsExF12BBy4IW8
 7zKg==
X-Gm-Message-State: AOAM531a/ICAW4zLWwDcBFhVYD16wzvu+HTkH4cFbfZvUyr0DD/rRPLV
 WH+cDsU6ffXp0pXDK5lEF1HHxw==
X-Google-Smtp-Source: ABdhPJxhNeIRjFu28/yvbAt+uDadqUI1rvXdoSBxdbri0fQfVOftoRHil6NROgFCt+tIjBJ17hgmNw==
X-Received: by 2002:a17:906:f2c8:b0:6f5:18a1:c410 with SMTP id
 gz8-20020a170906f2c800b006f518a1c410mr7442640ejb.281.1651937210283; 
 Sat, 07 May 2022 08:26:50 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l10-20020a170906938a00b006f3ef214e68sm3129018ejx.206.2022.05.07.08.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 08:26:49 -0700 (PDT)
Message-ID: <40c22f22-8314-adb6-918e-8288090d1aea@linaro.org>
Date: Sat, 7 May 2022 17:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Content-Language: en-US
To: Joel Selvaraj <jo@jsfamily.in>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>, Oleksij Rempel
 <linux@rempel-privat.de>, Linus Walleij <linus.walleij@linaro.org>,
 Hao Fang <fanghao11@huawei.com>
References: <cover.1651835715.git.jo@jsfamily.in>
 <BY5PR02MB7009E985CDB281DC9BE9CF37D9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB7009E985CDB281DC9BE9CF37D9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2022 14:17, Joel Selvaraj wrote:
> Add a prefix for EBBG. They manufacture displays which are used in some
> Xiaomi phones, but I could not find much details about the company.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
