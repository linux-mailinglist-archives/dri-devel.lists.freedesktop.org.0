Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C320B2EE8F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 08:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A176C10E87F;
	Thu, 21 Aug 2025 06:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aqcqPhjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33410E87F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 06:47:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E4516020E;
 Thu, 21 Aug 2025 06:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A86CC4CEED;
 Thu, 21 Aug 2025 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755758866;
 bh=EgAT92RP54AVFDysaOd0tnqQ0Olfa0hsk+q5u3ZXcIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aqcqPhjBCH3w3+IQwS0SA20txlfmzkg6a/TxfrTGgl/ynO4VpKzEFt7sQXN7d/3ON
 m7322CvkaqBwGtYP/p+8/1apRnMXxAnfGiwjmsxLYmhEFREU8sXYpJa5Fiz5venMd2
 qh7xz0Sfth3pqIEvb3tIsCjdiER9Ok9oh9lbAOFs888RcZzz78ZX91fliLIdCk/gkX
 hY/JA809J+Qz1PHKvdtx6B5bJrfzy5KKyK0s6Nq2nSW1MnKz2cCa6IeL4Qe+pHUkUT
 fKQYfgXQ0jKDIH1tNyJM40B6JAZui3GS7k6S5tDV621OZMIpvyCqCHWsUJ9+c2M4o+
 zjvGNfCxO9YYw==
Date: Thu, 21 Aug 2025 08:47:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, 
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
 houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com,
 kernel@collabora.com, 
 krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
 minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de,
 pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v1 02/14] media: dt-bindings: Convert MediaTek mt8173-vpu
 bindings to YAML
Message-ID: <20250821-piquant-rapid-bear-8cedc0@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-3-ariel.dalessandro@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 20, 2025 at 02:12:50PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 Video Processor
> Unit to a YAML schema.

DT schema, not YAML. Don't say YAML at all, neither here nor in subject.

Also looks not wrapped...

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-vpu.yaml   | 76 +++++++++++++++++++
>  .../bindings/media/mediatek-vpu.txt           | 31 --------
>  2 files changed, 76 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
> new file mode 100644
> index 0000000000000..44f5d7cc44042
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8173 Video Processor Unit
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +description:
> +  Video Processor Unit is a HW video controller. It controls HW Codec including
> +  H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8173-vpu
> +
> +  reg:
> +    minItems: 2

No, from where do you get such syntax?

> +
> +  reg-names:
> +    items:
> +      - const: tcm
> +      - const: cfg_reg
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: main
> +
> +  memory-region:
> +    description:
> +      phandle to a node describing reserved memory used by VPU
> +      (see bindings/reserved-memory/reserved-memory.txt)

Drop, redundant description.

Best regards,
Krzysztof

