Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C854EB63E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 00:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAC210EFCA;
	Tue, 29 Mar 2022 22:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4244E10EFCA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 22:58:18 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso20409208fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LWrhu1SJIKP91XWNKb4WbsxhL8e6xpsiZxtyqvL5Z0w=;
 b=a+acq3BWnD9NEFPEwsaTvaamedNLoCO59twcRa33aAxyCNHfYEcuD69Cx5b4Grt/3o
 eereXi2ekbJ1v+9C+qdoeWdljgRDMfAr4Z1ko1xFebQZI7apdjr1Nb2Sg1FrZl8ISdQF
 4hy/MUKpbWO7Wdw/toND7ntthiZ0Qwap8KIVgPUjSKePqktJAKrWrj63tQRzW7sWB9XU
 oLkgE45YvWZym/fPi2ZlN+DgtrRj+HyVU4e7kFSE4JVXs0s1DCACtwQeWifU/Yf6KFf0
 PLB6L37qeKLF4Y1J7NgfNeqLIKg5Oc0LPq6JaMr+ODO3VjcxdT4VAL9fyqOpx7hETOkK
 aPzg==
X-Gm-Message-State: AOAM533NQJvKFbtXgrkEoRaa+xzwilq17tHZ9HBlhV2PHsGgasom9jqy
 s3PQzMpMlGtzRXA/V4hcQitjv8Haxg==
X-Google-Smtp-Source: ABdhPJz+emekgDFz5mKWRmNRlRNMSrX19JPwwY5w06pHDZVUQBWmNvGk1+vhyDXsbkBHNm4tAEBj9Q==
X-Received: by 2002:a05:6870:a106:b0:de:de08:4e3d with SMTP id
 m6-20020a056870a10600b000dede084e3dmr859501oae.256.1648594697439; 
 Tue, 29 Mar 2022 15:58:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056870959600b000d277c48d18sm9802811oao.3.2022.03.29.15.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 15:58:16 -0700 (PDT)
Received: (nullmailer pid 1505955 invoked by uid 1000);
 Tue, 29 Mar 2022 22:58:15 -0000
Date: Tue, 29 Mar 2022 17:58:15 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v9 03/22] dt-bindings: mediatek,dp_phy: Add Display Port
 PHY binding
Message-ID: <YkOPB5W7uXkOc72/@robh.at.kernel.org>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-4-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220327223927.20848-4-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, deller@gmx.de,
 kishon@ti.com, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, chunfeng.yun@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 12:39:08AM +0200, Guillaume Ranquet wrote:
> This phy controller is embedded in the Display Port Controller on mt8195 SoCs.

Sorry, but I think you need to go back to what you had in v8. While yes, 
the phy and controller IP often do change independently, this h/w looks 
pretty interwined. 

You could make the controller a phy provider to itself if you wanted.

> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
> new file mode 100644
> index 000000000000..1f5ffca4e140
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
> +title: MediaTek Display Port PHY
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
> +  mediatek,dp-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Display Port node.
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - mediatek,dp-syscon
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dp_phy: dp-phy {
> +      compatible = "mediatek,mt8195-dp-phy";
> +      mediatek,dp-syscon = <&dp_tx>;
> +      #phy-cells = <0>;
> +    };
> -- 
> 2.34.1
> 
> 
