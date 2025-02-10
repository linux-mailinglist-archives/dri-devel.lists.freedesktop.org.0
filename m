Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716BDA2EA08
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C22D10E4F6;
	Mon, 10 Feb 2025 10:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rx3cquvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CC610E4F8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739184754;
 bh=KBC0SN9ZNkKsUcI/8ctTgW1gIXMompB/BTtCm6ni5hQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rx3cquvwsmRw0UkoLMz0QCGKNYa1T5ZkCy6cujfIsa7/XGn/VihPwuoG/XI5uRMvJ
 GiZ4Exc644jgL1QF8/fwMdZ6bZK/3qfg7fg95mrGe7uvUMkGYojF2pI4bvurKoplXq
 Zd8rgOe7f8HqnkrhnOOu2xjNoth5VtZ0DMlUKcP9aFJ2vbSlMidUj3QmH1Le9tPngW
 Unrm4UJxU6yW8H2u8QMOlWjNbc2vWtex4uUCluEc1vygJM38JwunYAMaGzFFJSFUch
 hAixoBznnKha1lY8wlTqmZ998e9M+V21tbXlcXqQ52fJqq9fHSoJHFBvgJrr4G+dgp
 ajPU7f6DORL/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD9817E121B;
 Mon, 10 Feb 2025 11:52:33 +0100 (CET)
Message-ID: <b7ed1848-2e66-42af-a266-34689fd1c93b@collabora.com>
Date: Mon, 10 Feb 2025 11:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 07/02/25 16:18, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> This new compatible is needed for this SoC support, as the other
> existing compatibles for the same GPU architecture (MT8188, MT8192) do
> not match the required power domain number.
> The other compatibles (especially MT8186) cannot be reused because of
> GPU architecture difference.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -37,6 +37,7 @@ properties:
>             - enum:
>                 - mediatek,mt8188-mali
>                 - mediatek,mt8192-mali
> +              - mediatek,mt8370-mali
>             - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>   
>     reg:
> @@ -217,7 +218,9 @@ allOf:
>         properties:
>           compatible:
>             contains:
> -            const: mediatek,mt8186-mali
> +            enum:
> +              - mediatek,mt8186-mali
> +              - mediatek,mt8370-mali
>       then:
>         properties:
>           power-domains:
> 


