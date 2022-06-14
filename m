Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAD54BB96
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 22:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1798810F947;
	Tue, 14 Jun 2022 20:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE6112D09
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 20:23:39 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id a10so10612151ioe.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yn1X9tsTyWKYB/yNHVHmt00Zq59Qs2y2qulf6vb+2UM=;
 b=KvRwaS5lhB7Kj5o2TtbursS566bJGnp7SEZrOwrazlgN6zzdSzcZ+0abZCVNYRZ3CU
 uQS1xBO3aatd8gzSW14z7SddhZfvJjb1f+5yKHt9yhTRoANhD3MpKebZMwI0hYFsLO0d
 tNyexJez14mN4YA5iPBOiKjSFCN6Y5aOAYY/ovK3EBrH8wb+AvKGkAmk3FSDAbpQ5Acn
 ZXIxjxuVH4hzxtl62W7mCkiECujfeg7oVS6TMjv5EjI8k61lZzU9PegQHqcDXQbGRT2k
 YZeAVI/6+SsP3Z3d3+CbUrvtLp1VY9yeKjbQsnabuAQ2e5uN8/yrpE89x06rJNQfyVpa
 hzOA==
X-Gm-Message-State: AOAM531fFfPDzgIX4jWCwH52eNUmyPHydAQRcSINhx7VcHKHf9AQy8tX
 7GHEv16YMmgftZsHYWCtbA==
X-Google-Smtp-Source: ABdhPJx9rerqWe1Bf7zW/nGD3+1oZxHbZiDkER+sQCEKjG2+KNxYREIe+A+7VgkMnLoB33NTi+7crg==
X-Received: by 2002:a05:6638:2711:b0:332:1030:d6c2 with SMTP id
 m17-20020a056638271100b003321030d6c2mr3817608jav.263.1655238218973; 
 Tue, 14 Jun 2022 13:23:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a92c504000000b002d54d827007sm5835499ilg.17.2022.06.14.13.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:23:38 -0700 (PDT)
Received: (nullmailer pid 2415510 invoked by uid 1000);
 Tue, 14 Jun 2022 20:23:36 -0000
Date: Tue, 14 Jun 2022 14:23:36 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220614202336.GA2400714-robh@kernel.org>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610105522.13449-2-rex-bc.chen@mediatek.com>
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
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 tzimmermann@suse.de, msp@baylibre.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, granquet@baylibre.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 06:55:13PM +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Fix reviewers' comment]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> new file mode 100644
> index 000000000000..10f50a0dcf49
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port Controller
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Jitao shi <jitao.shi@mediatek.com>
> +
> +description: |
> +  Device tree bindings for the MediaTek display port and
> +  embedded display port controller present on some MediaTek SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-dp-tx
> +      - mediatek,mt8195-edp-tx
> +
> +  reg:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description: efuse data for display port calibration
> +
> +  nvmem-cell-names:
> +    const: dp_calibration_data
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the controller, usually dp_intf
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  max-lanes:
> +    maxItems: 1
> +    description: maximum number of lanes supported by the hardware.

We already have a 'data-lanes' property defined in 
'video-interfaces.yaml' that can serve this purpose.

> +
> +  max-linkrate:
> +    maxItems: 1
> +    description: maximum link rate supported by the hardware and unit is MHz.

Then use '-mhz' suffix on the property name. Then you don't need a type 
(or maxItems).
