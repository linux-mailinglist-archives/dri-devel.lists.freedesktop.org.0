Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6EB7DC053
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 20:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727DB10E0FC;
	Mon, 30 Oct 2023 19:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4041C10E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 19:22:36 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-1dd5b98d9aeso2418971fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698693755; x=1699298555;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1Fy0CpFtgcJshYzVPax3hE6Wvgw3zG9+HWgIo8OoEY=;
 b=YoJEYHlb4iHIvaaNmbHIYZFCpGipNPJ2EGnFLLZJdSx1yA8Ser5x41xOgk79ijm7o4
 yHG4gySGElN62h1zPwf80mhmy/Ek3GTJ4JqWx4Dkh9aPi4FLnI5MmdNi4u0PuvuX1Cim
 tefMgEQ+TokQaq6YAxugHVcSH4l83cu7/4aB6SjSYYxEnCMRIQY2ngWH7RZC+avU/s78
 /80MQyg56U4Tkqo4sVMnpw/lJMbc9bwLr2Y3IiMunu06T0CJCV4P07XhjZGD8UIFZpT/
 pHbBhuDm19yODHtDjP6w0cKRpjNemScxjAASO4LumujzyiTZ9shBxiKVXZbKlLHybGRF
 22WA==
X-Gm-Message-State: AOJu0YyNArg3Y/PZnSHgbX1xwaofK006cNKT7N/BKCDVOCU39OgdIPW3
 kNeOic0jQx4gQTcslESxGg==
X-Google-Smtp-Source: AGHT+IFqCpZAhcTsmCaH5gXcwYyQqwa/kJtNlFwsxXctOhLFSYJq+4Kpo0+H1/CaGdSxDzUCwVUNkA==
X-Received: by 2002:a05:6870:a18:b0:1e9:f0c5:4496 with SMTP id
 bf24-20020a0568700a1800b001e9f0c54496mr301891oac.1.1698693755333; 
 Mon, 30 Oct 2023 12:22:35 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a056870854100b001e1076a668asm1695993oaj.36.2023.10.30.12.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 12:22:34 -0700 (PDT)
Received: (nullmailer pid 1962342 invoked by uid 1000);
 Mon, 30 Oct 2023 19:22:32 -0000
Date: Mon, 30 Oct 2023 14:22:32 -0500
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Subject: Re: [PATCH v8 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Message-ID: <20231030192232.GA1922580-robh@kernel.org>
References: <20231030100022.9262-1-moudy.ho@mediatek.com>
 <20231030100022.9262-3-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030100022.9262-3-moudy.ho@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 06:00:08PM +0800, Moudy Ho wrote:
> To simplify maintenance and avoid branches, the identical component
> should be merged and placed in the path belonging to the MDP
> (from display/* to media/*).
> 
> In addition, currently only MDP utilizes RDMA through CMDQ, and the
> necessary properties for "mediatek,gce-events", and "mboxes" have been
> set up for this purpose.
> Within DISP, it directly receives component interrupt signals.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------------
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 55 +++++++++---
>  2 files changed, 45 insertions(+), 98 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml


> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..c043204cf210 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -20,8 +20,9 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - const: mediatek,mt8183-mdp3-rdma
> +    enum:
> +      - mediatek,mt8183-mdp3-rdma
> +      - mediatek,mt8195-vdo1-rdma
>  
>    reg:
>      maxItems: 1
> @@ -49,17 +50,18 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: RDMA clock
> -      - description: RSZ clock
> +    minItems: 1
> +    maxItems: 2

Keep the description here and just add 'minItems: 1' and...

>  
>    iommus:
>      maxItems: 1
>  
>    mboxes:
> -    items:
> -      - description: used for 1st data pipe from RDMA
> -      - description: used for 2nd data pipe from RDMA
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
>  
>    '#dma-cells':
>      const: 1
> @@ -68,13 +70,46 @@ required:
>    - compatible
>    - reg
>    - mediatek,gce-client-reg
> -  - mediatek,gce-events
>    - power-domains
>    - clocks
>    - iommus
> -  - mboxes
>    - '#dma-cells'
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-mdp3-rdma
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: RDMA clock
> +            - description: RSZ clock (shared SRAM with RDMA)

Then just need 'minItems: 2' here and...

> +
> +        mboxes:
> +          items:
> +            - description: used for 1st data pipe from RDMA
> +            - description: used for 2nd data pipe from RDMA
> +
> +      required:
> +        - mboxes
> +        - mediatek,gce-events
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8195-vdo1-rdma
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: RDMA clock

'maxItems: 1' here.

The same thing applies to mboxes.

Rob
