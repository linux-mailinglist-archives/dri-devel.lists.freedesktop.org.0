Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246C6F2F14
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 09:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE13A10E2E8;
	Mon,  1 May 2023 07:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFC410E2EE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 07:18:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94f1a6e66c9so445523666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682925501; x=1685517501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PF63v+2Tp0raGO3D/Pdo+3NZYK4zubU/qMJRCsXcpRw=;
 b=bT2nxhGBwWg62eErztF4jrVqm07T4DHRMvxHFu+V53gbHMvPzmSEAEyDbW/KPz1bKC
 2qGJ+ZhEK5Jj5j35SM53QPWbXsJFxylE8oGZpmydsAzy0/Y7tJj/ReQzcM4seMn1Shku
 X+Jg33Fbmq+HZiumtZGDYxLK4aTHKOAjPYThwpSCmjZ+OvMYbai80aWNssTrfNZNk8nl
 akLvqagNYaIx1o4idhLwW1pBUreiIqY1CoKpWgdYLdDqMcHILsYx9yV9JDCUtp5qEsLt
 ka/P6RGPNaSJuctFkJa5waJ7Zgrn6kHKIHYn6k18VLl3CO1R4rjjgjMBGeenqhtNuiF/
 /yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682925501; x=1685517501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PF63v+2Tp0raGO3D/Pdo+3NZYK4zubU/qMJRCsXcpRw=;
 b=MGbaP7DUyJJC/IN6LUa0n78oAfgzOlDMOxMIpAQ3dyawms7ahfkuGxql0QzTfMrXjP
 PmGuKWBwmdTHJN2r0LbyInSEZVhkkLXv7kBWVowFCYEtHw3CbZQqTK6Bpp5jdEK3MFB9
 V7pwOxTtFHhdaEWJoSbhRZ0nX2zM08DhSB7Ml+0is4hnjr1Ctp6tP1Z4yNJ745UMNGMm
 KwBl+T+N2VH+UY3+Q8SKJv+43qJjBJiAH0/31TSOUY9zqWpwVNBoYGbFWeSiOmfSjeo2
 AYHxlUePxqGNgkAPE1SRNy9qZ0ID6Y1eLQMfqlBi5uthpeo0M6aLDyIdNoWySQImbRSL
 xKnA==
X-Gm-Message-State: AC+VfDyaLEXrQPDfdVP9NAUj4XhMfGatWTLQqFtS1VhN464sqDUhflVu
 sNa7LffNSb1RIKEhud8dhnS+mQ==
X-Google-Smtp-Source: ACHHUZ77aR8qnFMP9Wlo++yTpYLJKfzCmm+3/O8K2BffTv0b9/d2ok/0HaO+1ntu2hR4APdaoIoTNQ==
X-Received: by 2002:a17:906:fe47:b0:94f:396d:dd32 with SMTP id
 wz7-20020a170906fe4700b0094f396ddd32mr10587304ejb.21.1682925500965; 
 Mon, 01 May 2023 00:18:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00?
 ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
 by smtp.gmail.com with ESMTPSA id
 va2-20020a17090711c200b0093a0e5977e2sm14702213ejb.225.2023.05.01.00.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 00:18:20 -0700 (PDT)
Message-ID: <e8a20f96-4a4c-e696-6a27-d7c4b48792e6@linaro.org>
Date: Mon, 1 May 2023 09:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] dt-bindings: leds: backlight: ktz8866: Add reg property
 and update example
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230428160246.16982-1-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230428160246.16982-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/04/2023 18:02, Jianhua Lu wrote:
> The kinetic,ktz8866 is a I2C driver, so add the missing reg property.
> And update example to make it clear.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

