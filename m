Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5BC507118
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D52C10EEB7;
	Tue, 19 Apr 2022 14:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1485410EEB7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:57:15 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e21so22799882wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0DRZTO1NeUJTPTgdj4ONO/VAI+utzq/eYN7rim2l5b0=;
 b=jraun7ytZqQZq56ao3bxxscfGhngwGKwKAfkEz2LTYrrvogdkfe1TuLgWzRBoof7ov
 w4R0ZJfDFJZXKF46Th+xrnK0waghATJ6aWikr/aQe/O7UTQ1Mi7IcIf4pHr667j8F6ne
 EeZzsDfwYpLATyKxEAYl5k6bakpg5VqtYcNpQgmfNjI4LHszDhj3NIujK3raJRtpteTX
 GUDJuGaNIrWaGNkzdMQ+LgEV/sn5jpXzJAl7e0QpzanddQMjo58f8qQgeT10TsdSogzy
 Oio2AlswipeGkvLU5H7vVjIAyEXrUAGLwk4QzsgesMj3c/ctEX6bTCZKCXFiQUHDLWZk
 fL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0DRZTO1NeUJTPTgdj4ONO/VAI+utzq/eYN7rim2l5b0=;
 b=0byhjdcoPLMlO6OP9Ynv484Rde19HDXjRg4xEJREhTYeJ/wyUMt1rCDWEcYzroo7a2
 hn3wrdC1ta3hyjEZf7DzUEq+maTQiKi6UiwLn+ny69340wZ3gpxhB5xjo80/2mL5sotN
 Jlg75Fcw21R7IegAq5fNVrQGRBS+yyQarPkdmbCpyjKglgmgkZcNeMrlZq3bn7G6J+i8
 FIdikdZLAJMfwR6ElNyUYJadEVF+y78JAz5PIqb7q8vPD1sETWIehZ1+315m/6ch5vjq
 asQ5TacSieQyl86Ch1rDhMv/B86HIXXKY/niVkJtMmDDGm1HNej8BYpNbQs/8qzM7pK5
 3xzw==
X-Gm-Message-State: AOAM531rO+rHFbJDSNGOGX1co1e8vQkIgpeV5/o7ZaG6h+ZAh0J2kHJe
 jFHS4jfwGHX9R9mkDXg6dOE=
X-Google-Smtp-Source: ABdhPJzS9lCTTnDaIcbKhvDwnyqNsEvnb6/Q906XwP5Bud5DsBOvL3/56eF9B7RGyuTX4pqvBDlhXw==
X-Received: by 2002:a5d:48c8:0:b0:207:afc8:13fa with SMTP id
 p8-20020a5d48c8000000b00207afc813famr11910164wrs.487.1650380233405; 
 Tue, 19 Apr 2022 07:57:13 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm13072939wrn.114.2022.04.19.07.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:57:12 -0700 (PDT)
Message-ID: <74b3f0e3-1d9f-de9e-ccf0-1f2174ba7c25@gmail.com>
Date: Tue, 19 Apr 2022 16:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419033237.23405-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2022 05:32, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../display/mediatek/mediatek,mdp-rdma.yaml   | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> new file mode 100644
> index 000000000000..6ab773569462
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mdp-rdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MDP RDMA
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>

I don't think I would be the correct person to maintain this. This should be the 
person that is maintaining the driver.

Regards,
Matthias

> +
> +description: |
> +  The mediatek MDP RDMA stands for Read Direct Memory Access.
> +  It provides real time data to the back-end panel driver, such as DSI,
> +  DPI and DP_INTF.
> +  It contains one line buffer to store the sufficient pixel data.
> +  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8195-vdo1-rdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    description: A phandle and PM domain specifier as defined by bindings of
> +      the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +
> +  clocks:
> +    items:
> +      - description: RDMA Clock
> +
> +  iommus:
> +    description:
> +      This property should point to the respective IOMMU block with master port as argument,
> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +    #include <dt-bindings/memory/mt8195-memory-port.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vdo1_rdma0: mdp-rdma@1c104000 {
> +            compatible = "mediatek,mt8195-vdo1-rdma";
> +            reg = <0 0x1c104000 0 0x1000>;
> +            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> +            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> +            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> +            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
> +        };
> +    };
