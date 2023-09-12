Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C7879C9AF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E069B10E3B5;
	Tue, 12 Sep 2023 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6242310E3B5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:19:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so665005766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694506797; x=1695111597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=stR6EqZjuV5HhouRZxBMlxYw04Q56qEGFFA6lvC7lcc=;
 b=CEIh1nQ/8wql1hGFAMSKHm14z7hJbRreDJeOSHcaHzIqTzlg+GvxIwRhvgHlEalVuA
 TDnqQFckLZcSMM71rQLbJ5OZnvsp32sLvKmh04bTbmRv1we+q0PRzv2wUJS5wn0JPRYp
 97zTbgBYY8ta8vx3ThgG/ayjIjHMU9LZmiOTvTBsprQY0TjsEvQT8mjvzRxPBE9SO/kd
 cni/KSTCXJyKYgX3QU5uYnvpAKlxUKZAhDYEaYK0gqftYAlMhsM5+hgCWRKSYmemzDVW
 RUG/hWI3HcPa8pbYC7aqh4FP8r1ODBoxeYHhD2ItwSwf5/dr0EopaWgIEBH6/7107bZk
 oCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694506797; x=1695111597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=stR6EqZjuV5HhouRZxBMlxYw04Q56qEGFFA6lvC7lcc=;
 b=J9ROg+PrGnXc52rW0L5XT9s02Un/vgjBJr9Oljdc7lb0HzCx1HQ+JgcdEip6VxYAg4
 T75dpU/fB8QdaYK7qjB8E7qjkgRTyX9WXhERuFmfS5Pj94vD4hyf0XWNMiQzRGtcWXau
 yWY+DVdXs0DPZhkOJZE1qyL1ltHcWccySEBpCi3Cess1Kcv5Q4N97m87+5vTioNvhnLf
 COF/EMl8g+RmFY4ODJgalDo+hE7F+SmGDLK22S1jIXVHiyYMQRtkyhw8I/zkx+nUPGhX
 nkXker233t2qaj0Ge61yqlcS+DV/G0hqYB7pv/0Gxn7ttTblzHnRzMTGnMrHrrPQhjms
 izMg==
X-Gm-Message-State: AOJu0Yxvr4k3JGWFLGaual8AmCNVyPAm9fvIcp78xkiOA72pV1a8NhL6
 iUD1ebqHe2r7esa1nRFEQCkZBw==
X-Google-Smtp-Source: AGHT+IHxLh1j6/qZJbH3ElIvOS9Ozbj27bZE0UvkopwLq9g/xzJNVDe1VEoNG2+PPxZRq+qjnUzJSg==
X-Received: by 2002:a17:907:a0c7:b0:9ad:8f26:fdba with SMTP id
 hw7-20020a170907a0c700b009ad8f26fdbamr477711ejc.15.1694506796686; 
 Tue, 12 Sep 2023 01:19:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a170906c28c00b00997c1d125fasm6476225ejz.170.2023.09.12.01.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:19:55 -0700 (PDT)
Message-ID: <e4119fa6-a4b7-f59e-7115-044fa83c9063@linaro.org>
Date: Tue, 12 Sep 2023 10:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 3/3] dt-binding: mediatek: add MediaTek mt8195 MDP3
 components
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-4-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075651.10693-4-moudy.ho@mediatek.com>
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 09:56, Moudy Ho wrote:
> Introduce more MDP3 components present in MT8195.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        |  2 +-
>  .../display/mediatek/mediatek,color.yaml      |  2 +-
>  .../display/mediatek/mediatek,merge.yaml      |  1 +
>  .../display/mediatek/mediatek,ovl.yaml        |  2 +-
>  .../display/mediatek/mediatek,split.yaml      |  1 +
>  .../bindings/media/mediatek,mdp3-fg.yaml      | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-hdr.yaml     | 60 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-pad.yaml     | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 16 ++---
>  .../bindings/media/mediatek,mdp3-stitch.yaml  | 61 +++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tcc.yaml     | 60 ++++++++++++++++++
>  .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
>  12 files changed, 378 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 7fd42c8fdc32..04b1314d00f2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-aal
>            - mediatek,mt8183-disp-aal
> +          - mediatek,mt8195-mdp3-aal
>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal
> @@ -63,7 +64,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

Why? commit msg tells nothing about it. Why interrupt is not erquired in
mt8173? How dropping such requirement is anyhow related to mt8195?


>    - power-domains
>    - clocks
>  
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> index f21e44092043..8e97b0a6a7b3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2701-disp-color
>            - mediatek,mt8167-disp-color
>            - mediatek,mt8173-disp-color
> +          - mediatek,mt8195-mdp3-color
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-color
> @@ -66,7 +67,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

Why?

>    - power-domains
>    - clocks
>  
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index eead5cb8636e..401498523404 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - mediatek,mt8173-disp-merge
>            - mediatek,mt8195-disp-merge
> +          - mediatek,mt8195-mdp3-merge
>        - items:
>            - const: mediatek,mt6795-disp-merge
>            - const: mediatek,mt8173-disp-merge
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> index 3e1069b00b56..10d4d4f64e09 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt8173-disp-ovl
>            - mediatek,mt8183-disp-ovl
>            - mediatek,mt8192-disp-ovl
> +          - mediatek,mt8195-mdp3-ovl
>        - items:
>            - enum:
>                - mediatek,mt7623-disp-ovl
> @@ -76,7 +77,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts

Why?

>    - power-domains
>    - clocks
>    - iommus
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index a8a5c9608598..a96b271e3240 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -23,6 +23,7 @@ properties:
>      oneOf:
>        - enum:
>            - mediatek,mt8173-disp-split
> +          - mediatek,mt8195-mdp3-split
>        - items:
>            - const: mediatek,mt6795-disp-split
>            - const: mediatek,mt8173-disp-split
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> new file mode 100644
> index 000000000000..71fd449de8b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 FG
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to add film grain
> +  according to AV1 spec.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-fg
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

This must be maxItems. Use existing code as an example, do not re-invent it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@14002000 {
> +        compatible = "mediatek,mt8195-mdp3-fg";
> +        reg = <0x14002000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> new file mode 100644
> index 000000000000..fb1bb5a9e57f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 HDR
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to perform HDR to SDR
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-hdr
> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Here as well. Why is this minitems?

> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@14004000 {
> +        compatible = "mediatek,mt8195-mdp3-hdr";
> +        reg = <0x14004000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
> new file mode 100644
> index 000000000000..13b66c5985fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mdp3-pad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Media Data Path 3 PADDING
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +  - Moudy Ho <moudy.ho@mediatek.com>
> +
> +description:
> +  One of Media Data Path 3 (MDP3) components used to insert
> +  pre-defined color or alpha value to arbitrary side of image.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8195-mdp3-pad

And you cannot add it to existing padding because?

> +
> +  reg:
> +    maxItems: 1
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of display function block to be set by gce. There are 4 arguments,
> +      such as gce node, subsys id, offset and register size. The subsys id that is
> +      mapping to the register of display function blocks is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:
> +        - description: phandle of GCE
> +        - description: GCE subsys id
> +        - description: register offset
> +        - description: register size
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

Nope

> +
> +required:
> +  - compatible
> +  - reg
> +  - mediatek,gce-client-reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/gce/mt8195-gce.h>
> +
> +    display@1400a000 {
> +        compatible = "mediatek,mt8195-mdp3-pad";
> +        reg = <0x1400a000 0x1000>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
> +        clocks = <&vppsys0 CLK_VPP0_PADDING>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 0c22571d8c22..17cd5b587e23 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -23,6 +23,7 @@ properties:
>      enum:
>        - mediatek,mt8183-mdp3-rdma
>        - mediatek,mt8195-vdo1-rdma
> +      - mediatek,mt8195-mdp3-rdma

m is before v

>  
>    reg:
>      maxItems: 1
> @@ -50,17 +51,19 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: RDMA clock
> -      - description: RSZ clock
> +    oneOf:
> +      - items:
> +          - description: RDMA clock
> +          - description: SRAM shared component clock
> +      - items:
> +          - description: RDMA clock

Why now mt8183 can have SRAM clock optional? How changing mt8183 is
related to this patch?

I'll finish the review, sorry fix basics here.

Best regards,
Krzysztof

