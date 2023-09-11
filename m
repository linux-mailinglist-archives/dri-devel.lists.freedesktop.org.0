Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C779A6D0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF8010E206;
	Mon, 11 Sep 2023 09:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11A10E206
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:41:16 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52c88a03f99so5098621a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694425275; x=1695030075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Rdq0URinpTcu5sLen+gjO6hyEzWhm5ftrWrOcMBRpM=;
 b=k+T9wuig/g0PhZCEYFCrKLpzU1WI45Sz1CqhxTtm+Ph6GVPq+sXBkkR0hpg/ANCwHp
 kHkCVnpyq7662ah4qxkZn5hI9lBzb7fsPdtQIS/OAdoqlZnAYQ8KAEURN/Frkut9dk5A
 vjfbFelMjqO4Tj5UN5nNrdvI64llg2WB+MbXWIBqD7U3RovYBVOzEBxKe9KzLWX0ABly
 6KE38CRttirrOVe+lazXZ/ytHRGz18m7+0ir1aRhajixOpJhUaAhFgRdD8tkDeahDQZ+
 HJu6utvWV3P+1R9U4zZ67gea0K/3k4naWGI+LLYd7neM3FLxyVEysmFcE+/sI+OCviVe
 CmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425275; x=1695030075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Rdq0URinpTcu5sLen+gjO6hyEzWhm5ftrWrOcMBRpM=;
 b=C2m2t5yKpKT8Ms7ESoYiOjERLo2rjO8oDc6+f9NdqY9cUbUEb9Z7+/SRM0rJER+U7G
 qAbrbIBOpkvxFWMn7Bgvxl0xF0INik9uLniyW76bpYv4fUk1Y25sNWzIB31hszQ2/rIC
 ab3aXqASvKbLpIaFuRp9tYVJGlbXcLiRonFlvSNMs+TGVuv3G3c452FYSELyybk7TEM7
 rUvQ6C0zewa3r6MzloxrSgYDCU9dF+2v1DlNFRcIA5pRFN3FLdkQYM3ZCfqvjNyE2DSr
 Dw8qOFDE5ztplX1ykx0tNkQyZNVcaa480hYiiC0YhA+3DnC+oWAHJlbvFm2TyYSmS2an
 Adaw==
X-Gm-Message-State: AOJu0YwTjcR6T3p6J0NpSkOkEb01bm3ohCM1WwyuMTT6lQOPgsg+YxbR
 IWlZsgRdvsh9eAEMT9y5tt3M1w==
X-Google-Smtp-Source: AGHT+IGhnpDY+O7Wu+c7whPNnupCcBmcZnCuU7k3WX1FcCTde0t4ZKRKDDZbCWg2Yu2id6JclD98fw==
X-Received: by 2002:a17:906:1019:b0:9a2:96d2:b1e6 with SMTP id
 25-20020a170906101900b009a296d2b1e6mr7687841ejm.75.1694425275244; 
 Mon, 11 Sep 2023 02:41:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709064f0e00b0099e05fb8f95sm5089570eju.137.2023.09.11.02.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 02:41:14 -0700 (PDT)
Message-ID: <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
Date: Mon, 11 Sep 2023 11:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
To: John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911090206.3121440-9-contact@jookia.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2023 11:02, John Watts wrote:
> This is a small 3.5" 640x480 IPS LCD panel.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---

Thank you for your patch. There is something to discuss/improve.

> +maintainers:
> +  - John Watts <contact@jookia.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: fascontek,fs035vg158
> +
> +  backlight: true
> +  port: true
> +  power-supply: true
> +  reg: true
> +  reset-gpios: true

Why do you need all these 5? They are allowed by panel-common.

> +
> +  spi-3wire: true
> +
> +required:
> +  - compatible

Missing reg. Probably also port.


> +  - power-supply
> +  - reset-gpios
> +


Best regards,
Krzysztof

