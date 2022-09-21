Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB565BF78D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DD110E8AB;
	Wed, 21 Sep 2022 07:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513010E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:23:49 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j16so7760368lfg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 00:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zYXoXGYBs8EW5/2+PLZ8R95umDFslhQGS8LVrgnzPFo=;
 b=amsovrYY/8Wc9eaJ9TUk8nv4JjiA70E2/qLdE6MZsxrIlKWiUx1u2X4GMzDQ2zttQg
 tsxE0Mc2Wj2KCnXOCz89fzVsMKBhRZZsqSoOdfvhd739iuH3XqWisFhu98AjsFKILigX
 GhXOj220Xx4eq58Dky2D7LSd7q0prsJ2hf5IwzP726flx9veRqYfy0Y5VNYJIz2A40Kb
 D4hVUBWtZcX2n7pubXlj0911zJe02gg93BFcy42C3M4Xi9dkJ8HO7Qm5y7guaqJVuL9b
 UiW0UOrs9kYynN3QrKVHMIJ73Buy5ccsgfzeSsKpYLrZV8N8S53sTwjF+gDu3qgvs5fZ
 qCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zYXoXGYBs8EW5/2+PLZ8R95umDFslhQGS8LVrgnzPFo=;
 b=nKVugC2pKBFqXGEwKIBjYqJwvKfu4rMmDcfqrLIttdflM7IOKvGSNIs06oCJgSmFZq
 gnW0Y2eXmgnSYtFQoANnUkENpVyMyBpAiWJkv8FJqsC0s7KusXRTXOq6ITZ4HkwbZMsk
 7GN7Mq2E7sgRgS3RHjTUCz5e668XmDW3/vUd2P4UL84OEUoLFlPLb6PSVYxmwQ0PolqF
 rlDKhcailIuomEUgLak6eRSRxgmz6R7NGSIAmyUvSlk894zvLOTqOvuCjYujRvrHJNpE
 a1HEKDnkgLQOdyuNuLkk5QDIUXeP+eouA+UhGgNFTMHpfhYObSB723rprY3fBWSgqMl1
 ojZw==
X-Gm-Message-State: ACrzQf2ZyWy73rHLvdGFGbPOC181tG1cv758ZTpau8eKARLPC3JoaBLP
 3oXjQUNQVRyJM3eFJe4Cg/GK4w==
X-Google-Smtp-Source: AMsMyM5PX4hhSKyC3P+OrU7Wo7Ik40hyrxTigVYCeDkKWLWOekLO5ZygKPrRGVHZWeJT3/WunLVoFA==
X-Received: by 2002:a05:6512:1153:b0:49d:1d20:ea47 with SMTP id
 m19-20020a056512115300b0049d1d20ea47mr8999109lfg.342.1663745027686; 
 Wed, 21 Sep 2022 00:23:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 j10-20020a056512398a00b0049a0dec6e8esm313874lfu.139.2022.09.21.00.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 00:23:47 -0700 (PDT)
Message-ID: <44899c2f-99c0-5f1a-38ad-a700269e18e8@linaro.org>
Date: Wed, 21 Sep 2022 09:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2 1/2] dt-bindings: display: panel: Add Samsung
 AMS495QA01 bindings
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220920170937.14486-1-macroalpha82@gmail.com>
 <20220920170937.14486-2-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920170937.14486-2-macroalpha82@gmail.com>
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
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2022 19:09, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the Samsung AMS495QA01 panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/samsung,ams495qa01.yaml     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> new file mode 100644
> index 000000000000..08358cdad19c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMS495QA01 4.95in 960x544 DSI/SPI panel
> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,ams495qa01

Blank line.


> +  reg: true
> +  reset-gpios: true
> +  elvdd-supply:
> +    description: regulator that supplies voltage to the panel display
> +  enable-gpios: true
> +  port: true
> +  vdd-supply:
> +    description: regulator that supplies voltage to panel logic


Best regards,
Krzysztof
