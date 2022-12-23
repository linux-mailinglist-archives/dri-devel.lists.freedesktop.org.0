Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09488654D48
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C94010E17E;
	Fri, 23 Dec 2022 08:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA3E10E184
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 08:12:34 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x11so6223345lfn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 00:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYVZ8+9h5TaYp25FjSDR2jXhSPbQaP7Gr8Ll3NIuGQk=;
 b=B/iKqnlEGIhLwnv1quGV8MJLHUTf008Jaed7bDyyOczv94ZE2cnIQ0TdGGmDWxDXM4
 0zODOlGgjRXw/BlTJ0LGS5eoZIJ7W9NQAR2FSZy93sSaIUMM5Q+syr92X9EIl3D/lRWq
 Hfb5B7Fy+AAUaasHPTSk/0ZjWeKtC96cwpNVsbABTlJIij1sWBREQQiGVkZuwdbtuKT+
 cQ3ICC8r8JqeVSvCUkfoP3/yAJDeGI5th8soBrSLm6Z8A4UwKO9jqUvfHMm93DigIvG/
 wDrWHsbfRjE4KE21ZldvhQZCwyDRpPvhrRqMF9zuZhkKwa9FYRpXlJwx5hHG1bCsl9jt
 FzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYVZ8+9h5TaYp25FjSDR2jXhSPbQaP7Gr8Ll3NIuGQk=;
 b=Ldji+ci22E9Mm+A83WmzLZTBBHvvbXegTh9caUBfq9Mk3OWYoQHoOx+e1fjUWsYqAo
 lx7EXHBKyRQarxUz2Eo28zwAnz6f3TSYJuOvZiKw3krJMMN13/NY/r/z3pU7dJ7vLrPE
 gwlBsXZt1834KJ57+K4+7wWdc9P1JBaHPzmq7vlSHYX/4W3R621tUdnZiTux9YZP6HKP
 QHJ9m7TD9YEs6NGzLzOYJIXEbs5gPkNMHTGpto/PEqr+hxNAuboQs6H/4uHhLKFY+IDV
 afku/kJl63zxlQmxyvzBJKEW0UZwN6rFML2UbNWo2+Ngcn9XiaWJ90mHPHP13FGln+p7
 HnlQ==
X-Gm-Message-State: AFqh2ko+2IrPsPmNf9fe9y2BOWPJT3OtAPRnDQqLqJA6g5r2uNYeL1MB
 76zAZSsZrWlXgr6Z9lvZx3SlRQ==
X-Google-Smtp-Source: AMrXdXvl72h7PzLSw0eEcPahBVERYar0f+JBK3mVwVFNkP/pRqDGUB4lQPHVjvZNDIQivwsK2v65JQ==
X-Received: by 2002:a05:6512:32cf:b0:4b4:6490:cbf1 with SMTP id
 f15-20020a05651232cf00b004b46490cbf1mr2677026lfg.15.1671783152848; 
 Fri, 23 Dec 2022 00:12:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a22-20020ac25e76000000b004b58d457f2dsm420515lfr.61.2022.12.23.00.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 00:12:32 -0800 (PST)
Message-ID: <9636776f-d7f5-02cf-7290-69dbba6de6ab@linaro.org>
Date: Fri, 23 Dec 2022 09:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] dt-bindings: display: Add Himax HX8394 panel
 controller bindings
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20221222223830.2494900-1-javierm@redhat.com>
 <20221222223830.2494900-3-javierm@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222223830.2494900-3-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Martijn Braam <martijn@brixit.nl>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/12/2022 23:38, Javier Martinez Canillas wrote:
> Add device tree bindings for panels based on the Himax HX8394 controller,
> such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
> through a MIPI-DSI video interface.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../bindings/display/panel/himax,hx8394.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> new file mode 100644
> index 000000000000..a8084e95f2fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx8394.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX8394 MIPI-DSI LCD panel controller device tree bindings

Drop "device tree bindings"

> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +description:
> +  Device tree bindings for panels based on the Himax HX8394 controller,
> +  such as the HannStar HSD060BHW4 720x1440 TFT LCD panel connected with
> +  a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
> +      - hannstar,hsd060bhw4
> +
> +  port: true

Put the port next to other "true" properties.

> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +

With three above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

