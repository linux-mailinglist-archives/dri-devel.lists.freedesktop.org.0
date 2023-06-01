Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2B719462
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 09:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26FE10E047;
	Thu,  1 Jun 2023 07:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C281410E047
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 07:36:03 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-96fdc081cb3so60867166b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685604960; x=1688196960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uUJ2ScGwbr1nbCs+8+HHMHQfNtxE4ka03AMKgZpnNas=;
 b=Ao7hdccX36sLyfv15BeHhHBCDnim8s7UtC86fBmF2jiAhQdJv4sLOtSD5PxF54BICI
 BvK+7xZ0xyqOyuBMydnjdjiTpS2CP/C7HTIDkleM9VGZ6zuu2UCSIkCXxhLYyJ5+oRQq
 T4ITtTs83rKFz+a9OzQ1WumEapjTuUNgUpqIHhVIQ06yYGzZHuOJ9qrnT4fEtjDANYDe
 V1E8wCY+BCnTEThlhUi7Fw4Z78ZALzs1rrESogSis+dW2NyLwlwKHlAEHDS8/r+ttLVb
 LzWAJOZ9Ek511BCSlLsyU+nJTaElVpOG0zvVhdFDeZuab5uyIjErUuwFNw7EI5+6iszI
 Zukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685604960; x=1688196960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uUJ2ScGwbr1nbCs+8+HHMHQfNtxE4ka03AMKgZpnNas=;
 b=KmqzSUfkme2CRTPCGsO3YSEI+gq8IxIjIdHYr8OeMTrWgMDcoH9lUsCaYYZfBf+3zi
 Xo4M7upN1c+TaVVG/0FX66Algbmi3MulPk3g+HlnHY6aFj/92GJAE+pdZ/Ss+hdzXzkG
 j6hL/+xCreZtHXYTs0tvnyMAOYJa+Y3Y5Nyb5t8GDJ68CqEINs4/vUYEDBMLHo0DFhyr
 Q/pyWlNwaKuQM0h0BhYoXRMPBwfSwyDVrhiWbzOc0r+zYPOL5rUCos/eSXMawOFAJfTH
 JtlpsUHehlTsld1uToQlEaVuE0hv1ISIZmVMmuSc333bZy2URNqWgUsJTVyr7EV9rpcI
 YSZw==
X-Gm-Message-State: AC+VfDwXeB/egCpLtOM0TZ6h5U8btjehh1EHvZwGAaEw1XCf+kWyNFo+
 OwLtfJv9Iqh40iknx2ibOyoshQ==
X-Google-Smtp-Source: ACHHUZ7HMkRr4dDRuo5jOel+AfYs1E5PksGIh0CLtKGbi3pd+hKU7tozjGKdyBzBOMe1rUNq5ByPcw==
X-Received: by 2002:a17:907:9690:b0:96a:ee54:9f20 with SMTP id
 hd16-20020a170907969000b0096aee549f20mr8479579ejc.37.1685604960652; 
 Thu, 01 Jun 2023 00:36:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170906c30700b0094f410225c7sm10076421ejz.169.2023.06.01.00.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 00:36:00 -0700 (PDT)
Message-ID: <ca57abfe-714c-3a09-10f3-aa6072622f6f@linaro.org>
Date: Thu, 1 Jun 2023 09:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] dt-bindings: samsung,mipi-dsim: Use port-base reference
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230531224407.1611952-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531224407.1611952-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/06/2023 00:44, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Use port-base reference for port@1.
> 
> This fixes the following schema warning:
> 
> imx8mp-dhcom-pdk3.dtb: dsi@32e60000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> From schema: Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> 
> Fixes: 1f0d40d88f7a ("dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to yaml")
> 

No line breaks between tags (in general, no need to resend)

> Signed-off-by: Fabio Estevam <festevam@denx.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

