Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DED81B248
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BA10E32D;
	Thu, 21 Dec 2023 09:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC5110E32D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 09:28:56 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-552d39ac3ccso3078930a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703150935; x=1703755735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A/j28HQDSe+//7LuwIWL47ztJLL4UHEPLfDCuDFQ2rg=;
 b=RWfL12VWJDGBuI8SycVZiJQKCGBKDPjsleiSShVqZ3jBJnKxE+mXzRwPAXt3Bkt/+p
 azUmGlHly7XLD0t8tRvwU3kiqQeYVFRKz6GYAcpbgF9lqIakg6tncq0vz2JY2/rBhxwm
 wXLazMtC0AEBZCjuqvKxaUTm7SZErt5CO5sEXRMyVQpbxtv3CtkZDBo0wDSol2WrPP7z
 UwaVsulVBAHXBlW9R+5+1j3vOoKeV1rPvVtJ6SDlkOxI19P3vlgdQL6xo899po6Wdl7m
 i4GCe4W+63B7kAGy43HiCo6qdRtq6QZ2kadYwkwbFIhn4uOHeaxDiZE5xZZqKaiP6Y13
 M15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703150935; x=1703755735;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A/j28HQDSe+//7LuwIWL47ztJLL4UHEPLfDCuDFQ2rg=;
 b=oGkPzQ+VsCiCmGvLSm1yS0VTguDFJrI91evVnP6Xi7VgIUjKJsQoJ3ASos6c2h3BD7
 G/wzfja6zBpEDdJuvZxqkuKCMRzk1YBySmBWRzLDqHvPQOyKtpd+l5UuLgCZ2d1o/1I4
 hPIEUF2HuQisME1dfEzjPVlbHiTiOl45Jc5lzTG0xGjCau9Xfz02eqhrNbKhu55BV/l8
 8GX10pxm9NRfNzwmasXVXXNklBchnJdFOxSId+fq3gI4KKOLkJIMUay8jeTh8fjv7zW/
 m57U6Zz+P7ttuAtrOF0sziST6QRKvOWwAZPQE2KPG++eeoShcaXG7XF0AKbDkXTmCLwG
 1Ghw==
X-Gm-Message-State: AOJu0YzqSJGYPws+7r5e2WOEAnLmtqzTayoEOelAeBXc15C9F8kixqDH
 3Tb/Lkg9XR4usoGlqM2HncuOMw==
X-Google-Smtp-Source: AGHT+IGeox3eubroGOB/okZOFCcSuvOS3/zT0hYyxtmjfYLb+a1GAQT7SRwdptMgAOe5z/Zt/eH4TQ==
X-Received: by 2002:a17:906:6a14:b0:a23:62ed:105b with SMTP id
 qw20-20020a1709066a1400b00a2362ed105bmr545323ejc.69.1703150934819; 
 Thu, 21 Dec 2023 01:28:54 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
 by smtp.gmail.com with ESMTPSA id
 el1-20020a170907284100b00a1c96e987c4sm740897ejc.101.2023.12.21.01.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 01:28:54 -0800 (PST)
Message-ID: <250fead9-868b-4063-a054-4cb966dc4ba3@linaro.org>
Date: Thu, 21 Dec 2023 10:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20231220100853.20616-1-moudy.ho@mediatek.com>
 <20231220100853.20616-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231220100853.20616-3-moudy.ho@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2023 11:08, Moudy Ho wrote:
> To simplify maintenance and avoid branches, the identical component
> should be merged and placed in the path belonging to the MDP
> (from display/* to media/*).

Combining bindings into one bigger meta-binding makes it usually more
difficult to maintain and review.

> 
> In addition, currently only MDP utilizes RDMA through CMDQ, and the
> necessary properties for "mediatek,gce-events", and "mboxes" have been
> set up for this purpose.
> Within DISP, it directly receives component interrupt signals.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 92 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++++++++-
>  2 files changed, 40 insertions(+), 95 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> deleted file mode 100644
> index 7570a0684967..000000000000
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: MediaTek MDP RDMA
> -
> -maintainers:
> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> -  - Philipp Zabel <p.zabel@pengutronix.de>
> -
> -description:
> -  The MediaTek MDP RDMA stands for Read Direct Memory Access.
> -  It provides real time data to the back-end panel driver, such as DSI,
> -  DPI and DP_INTF.
> -  It contains one line buffer to store the sufficient pixel data.
> -  RDMA device node must be siblings to the central MMSYS_CONFIG node.
> -  For a description of the MMSYS_CONFIG binding, see
> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml for details.
> -
> -properties:
> -  compatible:
> -    oneOf:
> -      - const: mediatek,mt8195-vdo1-rdma
> -      - items:
> -          - const: mediatek,mt8188-vdo1-rdma
> -          - const: mediatek,mt8195-vdo1-rdma
> -
> -  reg:
> -    maxItems: 1
> -
> -  interrupts:
> -    maxItems: 1
> -
> -  power-domains:
> -    maxItems: 1
> -
> -  clocks:
> -    items:
> -      - description: RDMA Clock
> -
> -  iommus:
> -    maxItems: 1
> -
> -  mediatek,gce-client-reg:
> -    description:
> -      The register of display function block to be set by gce. There are 4 arguments,
> -      such as gce node, subsys id, offset and register size. The subsys id that is
> -      mapping to the register of display function blocks is defined in the gce header
> -      include/dt-bindings/gce/<chip>-gce.h of each chips.
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      items:
> -        - description: phandle of GCE
> -        - description: GCE subsys id
> -        - description: register offset
> -        - description: register size
> -    maxItems: 1
> -
> -required:
> -  - compatible
> -  - reg
> -  - power-domains
> -  - clocks
> -  - iommus
> -  - mediatek,gce-client-reg
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/clock/mt8195-clk.h>
> -    #include <dt-bindings/power/mt8195-power.h>
> -    #include <dt-bindings/gce/mt8195-gce.h>
> -    #include <dt-bindings/memory/mt8195-memory-port.h>
> -
> -    soc {
> -        #address-cells = <2>;
> -        #size-cells = <2>;
> -
> -        rdma@1c104000 {
> -            compatible = "mediatek,mt8195-vdo1-rdma";
> -            reg = <0 0x1c104000 0 0x1000>;
> -            interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> -            clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> -            power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> -            iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> -            mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
> -        };
> -    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index e1ffe7eb2cdf..e9955639ce19 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -20,8 +20,12 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> +    oneOf:
>        - const: mediatek,mt8183-mdp3-rdma
> +      - const: mediatek,mt8195-vdo1-rdma
> +      - items:
> +          - const: mediatek,mt8188-vdo1-rdma
> +          - const: mediatek,mt8195-vdo1-rdma
>  
>    reg:
>      maxItems: 1
> @@ -60,6 +64,7 @@ properties:
>      items:
>        - description: RDMA clock
>        - description: RSZ clock
> +    minItems: 1
>  
>    iommus:
>      maxItems: 1
> @@ -68,6 +73,10 @@ properties:
>      items:
>        - description: used for 1st data pipe from RDMA
>        - description: used for 2nd data pipe from RDMA
> +    minItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Why existing devices now support interrupts?

>  
>    '#dma-cells':
>      const: 1
> @@ -76,13 +85,41 @@ required:
>    - compatible
>    - reg
>    - mediatek,gce-client-reg
> -  - mediatek,gce-events
>    - power-domains
>    - clocks
>    - iommus
> -  - mboxes
>    - '#dma-cells'

I see little value in this commit, considering that next month you will
want to split it because it will grow unmaintainable.

Best regards,
Krzysztof

