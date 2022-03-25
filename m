Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649194E7A0D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7995E10E67D;
	Fri, 25 Mar 2022 17:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCB610E67D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:36:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b15so10069013edn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+IQOL/i3pOvSW6gL8acHIjGAB8zIBWe2pJauIvLBYZw=;
 b=PK7c069xFR1eQvtHVSiMSALRzvWh2zySjxDR3aRgzOJPEiJek4en3R8mqTv4RM0Fm0
 Q15wq5g4LiyyhtlLvX0+cFReBzGNVL/9UCMRcLaPL5JMwGw3XmYonPUvYiV0WiEKeqOt
 iqhMhg2q9ha8URwg8ilWZV9T2uVeWrjMiD+lGZJOFPByHA0CKxHImWSumPmmh7QTcLJx
 Km1tOailMe1I64fC2kQjcCKV4Cft/PCfy3pFuX3j2zywNcCPyulB5xts2f0c8hzysDzv
 yGsU5pdP7iNgNAo7cUtezs4p5CpJ4XSRZyEZsLHQOPQwjGyhsVNUadkBrNwzj2dY2WPF
 oPyQ==
X-Gm-Message-State: AOAM5313E9I7feYcvEeoMlwIqZlAbgPg6IhPcwpS7oAu7AzL8wuo5os1
 dIPBEX/3dSVFw8l0INdsMVU=
X-Google-Smtp-Source: ABdhPJxMwXvlpL+4JyEmyf1bVymPZHtcHyRrXsWs0hxmehdLZOEYA6fVeuX2XFBlMV/UWRok9ezgvg==
X-Received: by 2002:a50:9fad:0:b0:419:f22:46db with SMTP id
 c42-20020a509fad000000b004190f2246dbmr14492584edf.354.1648229797742; 
 Fri, 25 Mar 2022 10:36:37 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 g4-20020a170906520400b006e0b798a0b8sm490009ejm.94.2022.03.25.10.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:36:37 -0700 (PDT)
Message-ID: <da463ecb-e4ac-6e9c-c3a6-775d5c853807@kernel.org>
Date: Fri, 25 Mar 2022 18:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/22] dt-bindings: mediatek, dp_phy: Add Display Port PHY
 binding
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, angelogioacchino.delregno@collabora.com
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-4-granquet@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325171511.23493-4-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2022 18:14, Guillaume Ranquet wrote:
> This phy controller is embedded in the Display Port Controller on mt8195 SoCs.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> new file mode 100644
> index 000000000000..4180d40f4fa7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2022 MediaTek
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port PHY binding

Skip "binding"

> +
> +maintainers:
> +  - CK Hu <ck.hu@mediatek.com>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the Mediatek (embedded) Display Port PHY
> +  present on some Mediatek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-phy
> +
> +  regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Display Port node.

Need a vendor prefix and descriptive suffix (e.g. mediatek,dp-syscon).

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - regmap
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dp_phy: dp_phy {

Generic node name: just phy. Also underscores shoulk not be in node name.

> +      compatible = "mediatek,mt8195-dp-phy";
> +      regmap = <&dp_tx>;
> +      #phy-cells = <0>;
> +    };


Best regards,
Krzysztof
