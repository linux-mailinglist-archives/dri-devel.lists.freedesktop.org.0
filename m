Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB16988175
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 11:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC9E10ECA0;
	Fri, 27 Sep 2024 09:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hkxn8Mp8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9112010ECA0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 09:37:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 04BD75C5C86;
 Fri, 27 Sep 2024 09:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9CCC4CEC4;
 Fri, 27 Sep 2024 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727429824;
 bh=SyUAj6YH4ZWfBAbLc9RBIAhggRIMEKY1PFIqF4T7pRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hkxn8Mp8CzphuZ480+VHOuXSuKHwmeCfwN4Vl3uBdwUd2qUaesBeFZeg+CR8YBPmF
 YHseFh2rCE4m4jb5vvPxjHcL0oYSfkCPTlG5OQuZXMSCU/HKvqTxfq9jgCZ7w0RsjA
 XRhqX1oYrtWTrlxqfi0Xwhe8pfJMx92oy0rf1OrxbNvoS+d4GDinu4oQMG/lMJILn3
 fVm0/d/FQZ0nKYQcVemdtj8hqpYw0dtP++aAHmQjIHWAIXE5ZC5gRWKs9GiUlT2fnr
 5OWy0rJqBvNtFwjYn90Zjc+rk5VOyQ9fkyXvuBM8N+jR5H1bxYDGiX2jFG/ejHnUzL
 OlxD3EVbSXDbA==
Date: Fri, 27 Sep 2024 11:37:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Message-ID: <pnpj4pexz6nff72kmk6thupwvp2dgkz32ye7o44qdpuctbewb4@kpokc7c2rflr>
References: <20240927055140.19688-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927055140.19688-1-moudy.ho@mediatek.com>
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

On Fri, Sep 27, 2024 at 01:51:40PM +0800, Moudy Ho wrote:
> From: Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>
> 
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, apply the limit by setting 'maxItems: 3' in MT8195
> additional condition.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Your SoB does not match.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> --
> The purpose of this patch is to separate the corrections for
> MediaTek SPLIT CHECK_DTBS error from the original mailing list
> mentioned below:
> https://lore.kernel.org/all/20240924103156.13119-2-macpaul.lin@mediatek.com/
> 
> Changes since v1:
>   - Adding functional descriptions and quantity restrictions.
> ---
>  .../bindings/display/mediatek/mediatek,split.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index e4affc854f3d..bce1b8b866ce 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -57,6 +57,9 @@ properties:
>    clocks:
>      items:
>        - description: SPLIT Clock
> +      - description: HDMI RX Clock
> +      - description: HDMI Metadata Clock
> +    minItems: 1
>  
>  required:
>    - compatible
> @@ -72,6 +75,9 @@ allOf:
>              const: mediatek,mt8195-mdp3-split
>  
>      then:
> +      properties:
> +        clocks:

missing minItems

Missing constraints for all the variants.

Best regards,
Krzysztof

