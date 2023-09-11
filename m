Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB279A9E8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 17:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064A910E325;
	Mon, 11 Sep 2023 15:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB37C10E325
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 15:44:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 93CADCE10DB;
 Mon, 11 Sep 2023 15:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208B9C433C8;
 Mon, 11 Sep 2023 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694447091;
 bh=UypZKzekW0Fnyf/smilvBj2pL+glSdtZ2s73jeqIa1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeFuPBsx5eG593nKlIqcbZckZNxJOEEWxbPFIgnX1pqMeBsyDlT0J4/elUxqs8uGw
 319DNMooXPc1YxiFXes6YWrgimtBwvCdbQDSWraDVqjIduYr+yItGP2o/Bk6LCtUBG
 9c7wAGtZBSZ7lS3tYpdRGX1XV6EW8hKIyadGhk+8XrqQX/qJA3i3pB3MbDCN+pLjkN
 ANBdfpsd6v+pbUezujnXqEKfaWEBk07zeD8PCfFa+IZJe3x8ZGlrC8wnyckx7HH3vT
 XSu3biW8py3ETqCF6rMlRW764U5RTVQDmHb0ajfh7qG2B/2kb5JHmmxx/lczXeeMDy
 OoW5AY0nLzs8Q==
Received: (nullmailer pid 1295173 invoked by uid 1000);
 Mon, 11 Sep 2023 15:44:48 -0000
Date: Mon, 11 Sep 2023 10:44:48 -0500
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 8/9] dt-bindings: reserved-memory: MediaTek: Add reserved
 memory for SVP
Message-ID: <20230911154448.GA1279317-robh@kernel.org>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-9-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023038.30649-9-yong.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 jianjiao.zeng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, tjmercier@google.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 10:30:37AM +0800, Yong Wu wrote:
> This adds the binding for describing a CMA memory for MediaTek SVP(Secure
> Video Path).

CMA is a Linux thing. How is this related to CMA?

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../mediatek,secure_cma_chunkmem.yaml         | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml b/Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
> new file mode 100644
> index 000000000000..cc10e00d35c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,secure_cma_chunkmem.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/mediatek,secure_cma_chunkmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Secure Video Path Reserved Memory

What makes this specific to Mediatek? Secure video path is fairly 
common, right?

> +
> +description:
> +  This binding describes the reserved memory for secure video path.
> +
> +maintainers:
> +  - Yong Wu <yong.wu@mediatek.com>
> +
> +allOf:
> +  - $ref: reserved-memory.yaml
> +
> +properties:
> +  compatible:
> +    const: mediatek,secure_cma_chunkmem
> +
> +required:
> +  - compatible
> +  - reg
> +  - reusable
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        reserved-memory@80000000 {
> +            compatible = "mediatek,secure_cma_chunkmem";
> +            reusable;
> +            reg = <0x80000000 0x18000000>;
> +        };
> +    };
> -- 
> 2.25.1
> 
