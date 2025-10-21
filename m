Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAEBF523D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1995810E2D7;
	Tue, 21 Oct 2025 08:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QROdFjdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7510E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761033833;
 bh=uRJHPyETDsTCj2+OQ1mRFlr8Bbks2lxPY6twkMXsU2I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QROdFjdgod/ROylJgy2Guz/ooeoHdSBvVBAh5Je/NIPZVw8Id9oRiFxWXCVHFjshj
 rsRD6xnfsiXOoIPMpzKWa6gwzqBRxnJMMUIlnqUbKP4ybKE7I6R4GhedPFsJ3ZE0cn
 Fyat/tvas5N+DYhHCkOokWzRItq5v/Zd0JQSmtES+G9vqj1rpn4RTI4NNADxdS9hrh
 LXFtS0yZsdBIuIYbxVdQSQpkvqS3ytSXDQfTh0SgTgTNByE7O342gjxdPj5kPaOuN7
 H4/zTP9IVJTZUkHvAUNgPFqiZR4fy2QKTfr5H1t2/iaoHCAlUctjMHye0LLH0p2Rjt
 4/RNQDNBGf7PA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 08DC317E081A;
 Tue, 21 Oct 2025 10:03:52 +0200 (CEST)
Message-ID: <0e5ca992-730d-42c5-b5b8-5ad04116b8d4@collabora.com>
Date: Tue, 21 Oct 2025 10:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add Mali GPU support for Mediatek MT8365 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
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

Il 21/10/25 09:30, Louis-Alexis Eyraud ha scritto:
> This patchset adds the support of the ARM Mali G52 MC1 GPU (Bifrost),
> integrated to the Mediatek MT8365 SoC, and its enablement to the
> Mediatek Genio 350-EVK board.
> 
> I've tested this patchset on a Mediatek Genio 350-EVK board,
> with a kernel based on linux-next (tag: next-20251021).
> 

Thanks for this one! This series is ready to be merged.

However, in order to take the DT patches I need someone to pick the binding first.

Cheers,
Angelo

> The panfrost driver probed with the following messages:
> ```
> panfrost 13040000.gpu: clock rate = 450000031
> panfrost 13040000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status
>    0x0
> panfrost 13040000.gpu: features: 00000000,00000df7, issues: 00000000,
>    00000400
> panfrost 13040000.gpu: Features: L2:0x07110206 Shader:0x00000003
>   Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
> panfrost 13040000.gpu: shader_present=0x1 l2_present=0x1
> [drm] Initialized panfrost 1.5.0 for 13040000.gpu on minor 0
> ```
> 
> Running glmark2-es2-drm with MESA 25.2 is also OK:
> ```
> =======================================================
>      glmark2 2023.01
> =======================================================
>      OpenGL Information
>      GL_VENDOR:      Mesa
>      GL_RENDERER:    Mali-G52 r1 (Panfrost)
>      GL_VERSION:     OpenGL ES 3.1 Mesa 25.2.5-1
>      Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
>      Surface Size:   1200x1920 fullscreen
> =======================================================
> [build] use-vbo=false: FPS: 513 FrameTime: 1.952 ms
> [build] use-vbo=true: FPS: 514 FrameTime: 1.947 ms
> [texture] texture-filter=nearest: FPS: 489 FrameTime: 2.046 ms
> [texture] texture-filter=linear: FPS: 486 FrameTime: 2.061 ms
> [texture] texture-filter=mipmap: FPS: 476 FrameTime: 2.101 ms
> [shading] shading=gouraud: FPS: 436 FrameTime: 2.296 ms
> [shading] shading=blinn-phong-inf: FPS: 387 FrameTime: 2.585 ms
> [shading] shading=phong: FPS: 253 FrameTime: 3.955 ms
> [shading] shading=cel: FPS: 232 FrameTime: 4.328 ms
> [bump] bump-render=high-poly: FPS: 266 FrameTime: 3.765 ms
> [bump] bump-render=normals: FPS: 421 FrameTime: 2.376 ms
> [bump] bump-render=height: FPS: 343 FrameTime: 2.922 ms
> [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 133 FrameTime: 7.521 ms
> [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 46 FrameTime:
>    21.990 ms
> [pulsar] light=false:quads=5:texture=false: FPS: 379 FrameTime: 2.645 ms
> [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4:
>    FPS: 57 FrameTime: 17.735 ms
> [desktop] effect=shadow:windows=4: FPS: 249 FrameTime: 4.018 ms
> [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
>    =0.5:update-method=map: FPS: 81 FrameTime: 12.447 ms
> [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction
>    =0.5:update-method=subdata: FPS: 81 FrameTime: 12.388 ms
> [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction
>    =0.5:update-method=map: FPS: 99 FrameTime: 10.127 ms
> [ideas] speed=duration: FPS: 287 FrameTime: 3.492 ms
> [jellyfish] <default>: FPS: 114 FrameTime: 8.842 ms
> [terrain] <default>: FPS: 14 FrameTime: 76.911 ms
> [shadow] <default>: FPS: 156 FrameTime: 6.432 ms
> [refract] <default>: FPS: 29 FrameTime: 34.791 ms
> [conditionals] fragment-steps=0:vertex-steps=0: FPS: 529 FrameTime: 1.890 ms
> [conditionals] fragment-steps=5:vertex-steps=0: FPS: 326 FrameTime: 3.076 ms
> [conditionals] fragment-steps=0:vertex-steps=5: FPS: 532 FrameTime: 1.880 ms
> [function] fragment-complexity=low:fragment-steps=5: FPS: 475 FrameTime:
>    2.106 ms
> [function] fragment-complexity=medium:fragment-steps=5: FPS: 227
>    FrameTime: 4.417 ms
> [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 475
>    FrameTime: 2.108 ms
> [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 474
>    FrameTime: 2.110 ms
> [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 226
>    FrameTime: 4.428 ms
> =======================================================
>                                    glmark2 Score: 296
> =======================================================
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Changes in v2:
> - Rebased on next-20251021 tag
> - Fixed missing blank lines in 'arm64: dts: mediatek: mt8365: Add GPU
>    support' patch
> - Added reviewed-by and acked-by trailers
> - Updated cover letter
> - Link to v1: https://lore.kernel.org/r/20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com
> 
> ---
> Louis-Alexis Eyraud (3):
>        dt-bindings: gpu: mali-bifrost: Add compatible for MT8365 SoC
>        arm64: dts: mediatek: mt8365: Add GPU support
>        arm64: dts: mediatek: mt8365-evk: Enable GPU support
> 
>   .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  1 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |  9 +++++
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 43 +++++++++++++++++++++-
>   3 files changed, 52 insertions(+), 1 deletion(-)
> ---
> base-commit: 853c202e4aec8006c2c1367b052c9f8949db019a
> change-id: 20250812-mt8365-enable-gpu-a39835dca7fc
> 
> Best regards,


