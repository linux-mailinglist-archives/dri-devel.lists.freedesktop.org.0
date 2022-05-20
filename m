Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE00252E676
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B16D11B5ED;
	Fri, 20 May 2022 07:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EC511B5ED
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 07:45:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u23so12950124lfc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+aBavLEkYJU8ppHKZfPEoTzJMPVM0ajWgFW8w1xSHTI=;
 b=lJ76KJ2sv44ZiGDsP12pyEW4q4uQr5xfyiwEalACZa8qvGzmBfyDqS+gVgH7Qk84w+
 HpHVZhzEwgzaOu48uV4DDYaKQ5Y1ffDlYlkjnpcCquL8VRF5SmY8Hq+Kwgy7HMt5EvSW
 qOKTVBru/qLwTm1sfcJmi1leUvzCmiXTuW2HOUlCvSL1PeQ36FD+zPEp2xTsJ4cOoesQ
 uIj0O0b5XCmWWI7pHW2Q3Rojxjcl9IMGsmdmpyNhFN7swsICmB1rtteOg7da0gMOfuFx
 EiBChwTia3ySw739to/i3eUzD2kk88AHr8s3BiFQMDE7vHWLoz9qcwKk09kVshszbBa4
 B2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+aBavLEkYJU8ppHKZfPEoTzJMPVM0ajWgFW8w1xSHTI=;
 b=bd6JFMM2UqAt89+E2Ouy62rXM9Kzdm24bwWm6xORJHq1Pv84ELc+9GZGy/fl0c9D5w
 R7DzJ+gXO1x0cFbFnR8yEg84vy5gagaKWF0qSMbmIaDHlQhQry8KPw/nQm4iEm5vWW22
 V5oCxCQhZRE5VShGV2651mqOmUYRSzNcDFJ6Fk2r9hYEKng+dPkcGZ6nJ1Er1S/WYKqj
 17yX1fzi+noTHDGMNQEytsiXwuGkq0DVBm0w8fKC4pBL15Kz7pW010rvNFeru8ZZ/k5B
 HV8vaYu2BP4lV01SABzsxOgckabqowdW1hXey//RZzU9WnU9VgiDbV9qKM+lkFSerU9S
 gUNQ==
X-Gm-Message-State: AOAM532M1zHOeYWmzRyJTj7CQs7OmBQoa58Lva6fZSxxX0GqmaDg+JAw
 5zvSUcZvnZXM1IeQy+MWn6sLATGEuiNAKcdJ
X-Google-Smtp-Source: ABdhPJzny5YrTxA6USed7c9Qh1HoLb1QzlJ3c45ATl9O2YI4km3mZhR7V+Wsf+RupbtwytpqfGZvig==
X-Received: by 2002:a05:6512:951:b0:477:aa57:3e9d with SMTP id
 u17-20020a056512095100b00477aa573e9dmr5763789lft.525.1653032700488; 
 Fri, 20 May 2022 00:45:00 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 n3-20020ac242c3000000b0047255d211e8sm556912lfl.279.2022.05.20.00.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 00:44:59 -0700 (PDT)
Message-ID: <02c3ef16-dbbb-e6b6-58f2-b0e691af2dfb@linaro.org>
Date: Fri, 20 May 2022 09:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RESEND 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220519162935.1585-1-macroalpha82@gmail.com>
 <20220519162935.1585-2-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519162935.1585-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2022 18:29, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add vendor prefix for Geekworm (https://geekworm.com).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
