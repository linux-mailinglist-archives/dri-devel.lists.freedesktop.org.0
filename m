Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B28A0068
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 21:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3807310E46B;
	Wed, 10 Apr 2024 19:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O6D/MyhR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F2710E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 19:15:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02186CE2B57;
 Wed, 10 Apr 2024 19:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F79C433C7;
 Wed, 10 Apr 2024 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712776527;
 bh=Y8HrYr9N2X54zlXcRSCoc2hhNScMqkdWP9FAh9Krwpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O6D/MyhRjX4ilUEZ8v2TxELy3AD7IFMbhHI+0f3QYn6legTjbs42EOHPa6Zy/N1Cv
 8YdZnZW13beNY1N/uwPLTXi/TBR2m5pfJzQ48FsByqAFNfWGKYGXjP3lH8eU47iMcN
 CSB/bud3Vs5fHAeuVXp7i9I4vmDpFB5W2U1iP6Z8oHNACDu9ZoGsmH7b8xVMCdLRjm
 giGQSJMdm9AAKD2Q+Mar3iE5l6Pq7TiMnEkuHcnLw+Xl8E8yOeEpYeAO4VuVf0msiJ
 CDs7PTm8dmFC/Pzq/Jg8gMPDsu6+wGfX2fqBHzQvlC4gxjU8Lrg0WmgZQrSfZDqG3+
 92LTTQTuF6w+g==
Date: Wed, 10 Apr 2024 14:15:24 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Message-ID: <20240410191524.GA903053-robh@kernel.org>
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409120211.321153-3-angelogioacchino.delregno@collabora.com>
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

On Tue, Apr 09, 2024 at 02:02:10PM +0200, AngeloGioacchino Del Regno wrote:
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
> 
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b3c6888c1457..4e9acd966aa5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -93,6 +93,29 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port connects the MMSYS/VDOSYS output to
> +      the first component of one display pipeline, for example one of
> +      the available OVL or RDMA blocks.
> +      Some MediaTek SoCs support up to three display outputs per MMSYS.

I'm have a hard time understanding this, but is it 3 outputs 
simultaneously or connect mmsys to 1 of 3. Generally it's multiple ports 
for the former and endpoints for the latter.

> +    properties:
> +      endpoint@0:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the primary display pipeline
> +
> +      endpoint@1:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the secondary display pipeline
> +
> +      endpoint@2:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the tertiary display pipeline
> +
> +    required:
> +      - endpoint@0
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.44.0
> 
