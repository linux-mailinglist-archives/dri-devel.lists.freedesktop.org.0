Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E06567EC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 08:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A332C10E072;
	Tue, 27 Dec 2022 07:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA41610E072
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 07:44:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bq39so10789968lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 23:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aOVYkZxxKsbhw75iIPorGD6czBegT76jGDD2E1ugnSw=;
 b=EkUsdF1Xsu/m2xxqaQd6vkNWPP72fGbMXmWvG3FRb05pNjBEbhl22BY8CbCkowAnPT
 0TM6ijjMC8IycOqIgIpFi3PQiEnyjbHjIGZj533TQxJQZQ8ZLPBOPYZ7E8VW6TNHLlE3
 JzDDdNXMToh/0OEzwcsmIsK+lvDCtVRphNnDmMOTv6xLIBB6BQ8nXat+dESmbf3P0J3/
 +vkJNqqUDojmMskeGTK3d1FX/2KZ7NcPE8FqOt/8gJMGE/BAPyvB1ZtUEDThTEcO3ZiM
 3yyhg0lknpwJJ8xALJ0j5ZRD8iXAaTIm/O+L3uYpkRvyA0XzMLShMH3KARcyaszRVr+d
 NkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aOVYkZxxKsbhw75iIPorGD6czBegT76jGDD2E1ugnSw=;
 b=NF0sBlNb2qadCHJGqh+y5gkyc+Q984Ta1LOYBVzLX/sVOMp8goIbmF2Jf9jwvCULKb
 mB+HAKQhhwnAuUGSPhIVDxRh31QQiv5J/FgfbZHjS9ZUVSdGlhqbCNiZbDjpeSDqdx42
 yWHmHMe57nYwZ3OsaJdJF3p2dHlARdMKAuNKV1ZJe/Lnu4tdT073A2zrOwkhR5Ri1+0K
 TtFNEYDTSPagkwP2iHei912RNZH53/egLM+Dzi9cKNbA/Zsu4dUp/ni5SEcvWOYnOlww
 Eayst8ecUCqWzoxPJ829s0ZbAMjGeIawWxyNhAu4EI1iZk4p8zschhXQ4+9drmj5QiOc
 U8Uw==
X-Gm-Message-State: AFqh2krXaeurbB/7meWgqrJhCkeQi+ZKBYdRHr4XYmi6ykeo6k82YZP3
 X/gC1OVI2a4BLqJlZgYrzLyljQ==
X-Google-Smtp-Source: AMrXdXsFrxQWaAaSLuxH3iop/N0+P56sRuckOjOr9ApBjTDbXw5HqvDHjO+M3IQbjGPyO2dFQnqbHw==
X-Received: by 2002:a05:6512:39ce:b0:4b4:e559:8b10 with SMTP id
 k14-20020a05651239ce00b004b4e5598b10mr6697970lfu.24.1672127068773; 
 Mon, 26 Dec 2022 23:44:28 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a056512390e00b004b5872a7003sm2153971lfu.98.2022.12.26.23.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 23:44:28 -0800 (PST)
Message-ID: <f47cab97-2c8c-a3d5-b362-774f970dffd3@linaro.org>
Date: Tue, 27 Dec 2022 08:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/4] dt-bindings: display: Add Himax HX8394 panel
 controller
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20221226134909.2822179-1-javierm@redhat.com>
 <20221226134909.2822179-3-javierm@redhat.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221226134909.2822179-3-javierm@redhat.com>
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
 Robert Mader <robert.mader@posteo.de>, dri-devel@lists.freedesktop.org,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Martijn Braam <martijn@brixit.nl>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/12/2022 14:49, Javier Martinez Canillas wrote:
> Add device tree bindings for panels based on the Himax HX8394 controller,
> such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
> through a MIPI-DSI video interface.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v2:
> - Drop redundant "bindings" in subject (Krzysztof Kozlowski).
> - Drop "device tree bindings" in title (Krzysztof Kozlowski).
> - Put port next to other "true" properties (Krzysztof Kozlowski).
> - Add Krzysztof Kozlowski's Reviewed-by tag.
> 
>  .../bindings/display/panel/himax,hx8394.yaml  | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> new file mode 100644
> index 000000000000..bead3f0b05c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx8394.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX8394 MIPI-DSI LCD panel controller
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
> +  vcc-supply:
> +    description: Panel power supply
> +
> +  iovcc-supply:
> +    description: I/O voltage supply
> +
> +  port: true
> +
> +  reset-gpios: true
> +
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - vcc-supply
> +  - iovcc-supply
> +  - port

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

