Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7F571B12
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 15:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D8811A966;
	Tue, 12 Jul 2022 13:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F31511AE35
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 13:23:38 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id m16so9839191ljh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 06:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7NpE50xIJlThXUXFOjYSw2lGGIuqwPnQSpmI3jRYAy0=;
 b=FyPS0gCOocU+YW6bG2aEfkbmbd6ZeNmQtaGPBKwFG66toMzzJF5mX1ANCO2q67C51A
 6+hKJ1SVkXJTFlffOvZpjYkh35W2hueRb18Sx+rZtaxpNH8rPDGLUFzuu/hDJ3jJs80m
 1JcdpoJqFMdmmg3SOUh6kU446SWQNKDdIBeNPiTqBXzm5F7qWl478y0XQs97FmG4vtIb
 1fhreWvfVk73PV9quj9WYoMeNs3dJ6SX2hkBmC5LBdE00T2UHtk4MgHAyyzef5y5pm4g
 XJlnBLIlJWCGM9nQxaP+kYwmQ5muCr4oasukTlI9n5SrQmIYnFG5n/1Sgw8h8yFERwuZ
 70Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7NpE50xIJlThXUXFOjYSw2lGGIuqwPnQSpmI3jRYAy0=;
 b=GHPU/lCqnEgVIJEO5usgWTNVEJllJhJTds7jr5WuWSyGiDDyWQlif4KTpWoZKre0Qx
 Nlbh4PX80BbnEgruqUdXnImklAe5EccIlu6UaAetoMp2VY4d0x7gxu2pqdaxixDd+9FV
 7twRerbKO2Io9qY1kCd+emMonl/OY+Jck+8kCuVFYZX5TVJXtmZrhXka7uiS6Nxrolvt
 asQf++PCZZ+/lvb9zyVkQgwyg8FwmXokTfKmz8mZiv0lnapJmAN2CtDBX7WkZrp1JB+p
 HU4GNj+WY1azgfVZKR8DpVh/hLgbXfvj5KHvTdu0AXHZULoQw15sp40VZKZLIxi2hVgT
 ciBA==
X-Gm-Message-State: AJIora+kHCIZpzZuFXf0CCN20gCJOgb4SAjKfmIpmNvKLd+tRWXNwL/6
 ZVkwCCRt2oNbvI0y1VUB5CKgSA==
X-Google-Smtp-Source: AGRyM1s5e/ZHQtmXKenogZYrIc+DpEwBLIre9ljOLnNr7JILkNKpTESrtc+pzI2VAATS1W9KZ/xK2g==
X-Received: by 2002:a2e:95ca:0:b0:25d:4ac4:1387 with SMTP id
 y10-20020a2e95ca000000b0025d4ac41387mr12349270ljh.145.1657632216570; 
 Tue, 12 Jul 2022 06:23:36 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a05651c200300b0025d5eb5dde7sm2350063ljo.104.2022.07.12.06.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 06:23:36 -0700 (PDT)
Message-ID: <b3cf4950-4b0a-23ff-2622-4d554cf041c2@linaro.org>
Date: Tue, 12 Jul 2022 15:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Content-Language: en-US
To: MollySophia <mollysophia379@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220709140422.56851-1-mollysophia379@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220709140422.56851-1-mollysophia379@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/07/2022 16:04, MollySophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>
> ---
>  .../display/panel/novatek,nt35596s.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> new file mode 100644
> index 000000000000..f724f101a6fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT35596S based DSI display Panels
> +
> +maintainers:
> +  - Molly Sophia <mollysophia379@gmail.com>
> +
> +description: |
> +  The nt35596s IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a JDI FHD+ LCD display panel with a
> +  resolution of 1080x2160. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - jdi,fhd-nt35596s
> +      - const: novatek,nt35596s

You need to document the novatek and idi vendor prefix in vendor-prefixes.

> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT35596S panel driver. This compatible string
> +      determines how the NT35596S panel driver is configured for the indicated
> +      panel. The novatek,nt35596s compatible shall always be provided as a fallback.

Drop description, it does not make sense and last sentence duplicates
the schema.

> +
> +  vddi0-supply:
> +    description: regulator that provides the supply voltage
> +      Power IC supply

"regulator that provides the supply voltage" is redundant, drop it.
Instead what is it supplying?

> +
> +  vddpos-supply:
> +    description: positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: negative boost supply regulator
> +
> +  reg: true

Any reg is accepted or is there only one reg? Does it come from other
schema?



Best regards,
Krzysztof
