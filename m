Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D447052EF
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 17:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4455210E013;
	Tue, 16 May 2023 15:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E36E10E013
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 15:57:31 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9659f452148so2620869566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684252649; x=1686844649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YFdAn7Fjdx2rJ76WHO6PHBO3/n+aln2mjGgewNBmIEI=;
 b=xzH/noe4FPt7EO71KI0vquLTW+TrbA+rUf+puD69bV1jN0AeX/h/DHAOk+/wwPcG5t
 eQ6rIsmmGDb9JTEroExeeJ4RDEwZZHCMDml/QV/iH1B5ZcAWC+IKKKWzvhzs+561hj5A
 6t4viK34YdbKkul6MGS6Q6+rhN2xlvD88wMdWP9/51Y2P3BHNbn7MWTU0x20m88Aouk9
 299qYKp5omOenGCPn28tdD4rIeQ7noxSPkQBTuS5DGuAmOCtWKEDZoNLjMchuI9bacil
 pf7pUWmbk+2jxN6zeDC9SlMfF2D4DX82/voQUhI81UQ72aw5u38ebMfUpSwAZs3ddFMX
 mR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684252649; x=1686844649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YFdAn7Fjdx2rJ76WHO6PHBO3/n+aln2mjGgewNBmIEI=;
 b=L9Exa/5lYFaRwlfxAWMa52WKdasT+XW1C76QtIkE9rWSamvW8qvWh/kNoF9w4jaJnh
 gfCq5raKLeGiQPdu+wnh2pxS526oWZJkaHXqcf/0tqvDlfjj/6kwqEcqRKf1g5twvxlL
 RPJsYEVClx6wBcdrMtdgh2ccnsJIuIwcuzVFSYCQwhiA2TlHI1eKbaWBGGjCyPmmrosp
 3iFM23v9xX9NdMTJH70BnQl65mIZ3PjXc+GDZ2FLZAq2PJrhfoih+CMnYG1FWmY/wplv
 qFS50RGcAFKqel9aEq8hm+CPn09xu6bs34oMv+dXAmkyfSOZ21TNRRVQFSdHWFSYgz7N
 tAnQ==
X-Gm-Message-State: AC+VfDzc9G2CtN5mwtLV6t+31oNJm7FtfiERq4tZvMUBG3QL4CB8VlyO
 fZP84xdXFMgbUBBaZ69MtelR+oKccv7vY7zIb7Q=
X-Google-Smtp-Source: ACHHUZ4LicxoTrUfWiE2B86KO8Cl3YoygDk/rLnT/Sw4BYRU6yHuzrzZFmi7+8KBxCsQ26l23fn97A==
X-Received: by 2002:a17:907:7e8f:b0:969:e7da:fcb1 with SMTP id
 qb15-20020a1709077e8f00b00969e7dafcb1mr29092821ejc.13.1684252649625; 
 Tue, 16 May 2023 08:57:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc?
 ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170906a41500b00965c6c63ea3sm11074850ejz.35.2023.05.16.08.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 08:57:29 -0700 (PDT)
Message-ID: <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
Date: Tue, 16 May 2023 17:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
Content-Language: en-US
To: =?UTF-8?B?UGF1bG8gUGF2YcSNacSH?= <pavacic.p@gmail.com>,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 robh+dt@kernel.org, daniel@ffwll.ch
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 15:09, Paulo Pavačić wrote:
> Add dt-bindings documentation for panel-mipi-dsi-bringup which currently
> supports fannal,c3004 panel. Also added fannal to vendor-prefixes.

Thank you for your patch. There is something to discuss/improve.

> 
> v2 changelog:

Please put changelog after ---

Missing user of the bindings - driver or DTS. Please sent patches
together as patchset.



>   - revised driver title, now describes purpose
>   - revised description, now describes hw
>   - revised maintainers, now has only 1 mail
>   - removed diacritics from commit/commit author
>   - properties/compatible is now enum
>   - compatible using only lowercase
>   - revised dts example
>   - modified MAINTAINERS in this commit (instead of driver commit)
>   - dt_bindings_check checked yml
>   - checkpatch warning fixed
> 
> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> ---
>  .../display/panel/panel-mipi-dsi-bringup.yaml | 54 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  6 +++
>  3 files changed, 62 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml

Still wrong filename. You did not respond to my previous comments, so I
don't really understand what's this.

Judging by compatible, this should be fannal,c3004.yaml

If not, explain please.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
> b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
> new file mode 100644
> index 000000000000..c9e2b545657e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bringup.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MIPI DSI Bringup Panel Porting Bindings

Drop Bindings. I don't understand what is "Porting" in the terms of
hardware. If it these are bindings for Panel, please write here proper
hardware.

> +
> +description: |
> +  MIPI DSI Bringup Panel porting bindings to be used for a collection of panels

I have no clue what is "Bringup panel". Is it technical term for some
type of panels?

> +  from different manufacturers which don't require backlight control from the
> +  driver and have a single reset pin which is required to be passed as an
> +  argument.

Drop "driver"

> +
> +maintainers:
> +  - Paulo Pavacic <pavacic.p@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +

Drop blank line.

> +  compatible:
> +    enum:
> +      # compatible must be listed in alphabetical order, ordered by compatible.
> +      # The description in the comment is mandatory for each compatible.

Drop above comment.

> +
> +        # Fannal 480x800 panel
> +      - fannal,c3004
> +
> +  reg: true
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    //example on IMX8MM where GPIO pin 9 is used as a reset pin

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

I asked to drop the comment.

> +    mipi_dsi@32e10000 {

dsi {

There is no way it was correct in current form.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +        panel@0 {
> +            compatible = "fannal,c3004";
> +            reg = <0>;
> +            pinctrl-0 = <&pinctrl_mipi_dsi_rst>;
> +            pinctrl-names = "default";
> +            reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 82d39ab0231b..f962750f630a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -462,6 +462,8 @@ patternProperties:
>      description: Facebook
>    "^fairphone,.*":
>      description: Fairphone B.V.
> +  "^fannal,.*":
> +    description: Fannal Electronics Co., Ltd
>    "^faraday,.*":
>      description: Faraday Technology Corporation
>    "^fastrax,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ad886d3163..46f988ee60bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6566,6 +6566,12 @@ T:    git git://anongit.freedesktop.org/drm/drm-misc
>  F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>  F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c
> 
> +DRM DRIVER FOR MIPI DSI BRINGUP
> +M:    Paulo Pavacic <pavacic.p@gmail.com>
> +S:    Maintained
> +C:    mipi-dsi-bringup:matrix.org

Missing protocol. See explanation of C: entry at the beginning.

> +F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.yaml
> +
>  DRM DRIVER FOR MSM ADRENO GPU
>  M:    Rob Clark <robdclark@gmail.com>
>  M:    Abhinav Kumar <quic_abhinavk@quicinc.com>

Best regards,
Krzysztof

