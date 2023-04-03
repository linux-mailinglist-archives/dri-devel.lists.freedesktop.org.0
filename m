Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BA6D44D0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936D110E41B;
	Mon,  3 Apr 2023 12:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EFC10E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 12:49:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id eg48so116768493edb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 05:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680526142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ISwLn6XAWbSbFdzIWp9X/wiJEWCN8LzXJ/dbGkmRRJs=;
 b=yM2ATucKwHouvbBvYy74RuU4wpRCipfUwo/ghlxpmpFt3ifZugisB+EF/PNTYaiZ72
 UpN2gstGW/kT9ZW9UxKT5hC3s6whGfFbr5XpIjuZ0+BM/TM1ADVLmiNRSqPv3byL7edh
 N54Y/Sc4XnMlyXRqr9ZFUvdKMsGK3ugQMN/kV4KhsVDd3GWKP7EBKlLmXS4wjUByc8vy
 nTtCATcSFe1Kjy7zQxhtvQKWqkg+tzlvNyuSoMqsoBlvd4Ij2ixdoPlbSB3Tsj/IcsiE
 KCfN9HjdGqnZBAMupBgR4C8MALuol3gFL47LL9wxw3NzB7F2YFoNBsC2f5BS3slJjVjc
 epDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680526142;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISwLn6XAWbSbFdzIWp9X/wiJEWCN8LzXJ/dbGkmRRJs=;
 b=caLU1uvmJd/MHGhf8auTFVARAuej1c+ZEg+jdWZ08azEQ+p6hRnl4khbKOhde0Z4dZ
 0AMH0PE1FFl34u2HZ6TUh1kaAr6jeSwvTJQbMP8gGYU9ft+68ffKC+B8w+86jqiuqqDS
 nHUSlFGxGYrYNI+muhnjaU0pP7t5AhQnz/65BHdph7rz6nnaffkfhYPoQuXLDRn69QIV
 DlXB+MtEEXfgGl/Fhc0CFo0TviEQv98G224aHHh8kXYAMs2mCPRBHLgq/XYwXA3xA074
 n9DOf9XM9BTwczFUa5GvQ9zfQZRyK4e87/jBJ+aL7NcJ3y/M9jt/4ITxw/PK/BsAT5bE
 Q0Xg==
X-Gm-Message-State: AAQBX9c53YcZtMybsY0oKHya09y0XZ4GPDVLpwCr1acSymhNOC6++BaV
 ke9P4nYfO50kqDmzoeCWrboqSA==
X-Google-Smtp-Source: AKy350aVsRdZ8lMJe5Twrh8KULuIFmwXUK3d/d6hD2HYM/7d3yDUed96iV2DI3Wtb3VFyJvzSf82lA==
X-Received: by 2002:a17:906:e0c6:b0:93b:a133:f7e6 with SMTP id
 gl6-20020a170906e0c600b0093ba133f7e6mr32628143ejb.46.1680526142326; 
 Mon, 03 Apr 2023 05:49:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906564100b0092b86d41dbasm4518263ejr.114.2023.04.03.05.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 05:49:02 -0700 (PDT)
Message-ID: <8f7f925f-638d-737c-bf47-2a66ce0eec59@linaro.org>
Date: Mon, 3 Apr 2023 14:49:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge
 to yaml
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230403124458.198631-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403124458.198631-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2023 14:44, Fabio Estevam wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Samsung MIPI DSIM bridge can be found on Exynos and NXP's 
> i.MX8M Mini/Nano/Plus SoCs.
> 
> Convert exynos_dsim.txt to yaml.
> 
> Used the example node from latest Exynos SoC instead of
> the one used in legacy exynos_dsim.txt.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v1:
> - Added samsung,mipi-dsim.yaml entry to MAINTAINERS file (Jagan)
> - Added Marek Szyprowski entry to the samsung,mipi-dsim.yaml maintainers section (Jagan)
> - Mention that i.MX8M Plus is also supported (Marek)
> - Remove endpoint@0 description as it only has one endpoint (Marek)

Where is the changelog from original submission? How your v1 differs
form it? Or did you just ignore all the feedback?

> 
>  .../display/bridge/samsung,mipi-dsim.yaml     | 271 ++++++++++++++++++
>  .../bindings/display/exynos/exynos_dsim.txt   |  92 ------
>  MAINTAINERS                                   |   1 +
>  3 files changed, 272 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> new file mode 100644
> index 000000000000..2698752dc6ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
> @@ -0,0 +1,271 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/samsung,mipi-dsim.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung MIPI DSIM bridge controller
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +  - Jagan Teki <jagan@amarulasolutions.com>
> +
> +description: |
> +  Samsung MIPI DSIM bridge controller can be found it on Exynos
> +  and i.MX8M Mini/Nano/Plus SoC's.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos3250-mipi-dsi
> +      - samsung,exynos4210-mipi-dsi
> +      - samsung,exynos5410-mipi-dsi
> +      - samsung,exynos5422-mipi-dsi
> +      - samsung,exynos5433-mipi-dsi
> +      - fsl,imx8mm-mipi-dsim
> +      - fsl,imx8mp-mipi-dsim
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +
> +  phys:
> +    maxItems: 1
> +    description: phandle to the phy module representing the DPHY

OK, so you did ignore the feedback.

NAK, go through the feedback and implement it.

Best regards,
Krzysztof

