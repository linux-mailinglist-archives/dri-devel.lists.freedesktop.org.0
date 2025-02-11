Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460BA305C9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A4210E43D;
	Tue, 11 Feb 2025 08:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uW3bFcrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A49710E43D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA68D5C0450;
 Tue, 11 Feb 2025 08:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A9EC4CEE4;
 Tue, 11 Feb 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739262704;
 bh=dl4uLU/iQ9rF6gTfpw7fZJVHUwDfPTBp/2QbqtbcdMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uW3bFcrkqwYvblTFtITmlt7YgN6TQjfuDtO7NcfQLqANFXCSeoow4sAmntrkPX7iy
 Kqzx2sAfCnjHst5aKcYZCH29j82/TGmS8xCwf6VIsY5pDdbq8rq5Z/kd/RC1MFVYqh
 3GrkNQpVhidgSRHGM3JolbQXqbQ/ETWnnZD97MrnQAyimp5UoLE4J6yl+RqeYo/Tet
 bZf4vDyqkRSaLS4kfDjUMqk8fjgwSBEybDGo5Ax6PiY5ssufmGoKmUtwFicoV0VQvF
 yjbqmU0Vd6S3Iif/zW6nFW0tlSJpjUxETSKuwmbX84fhas40cyonZArnEJLF/DfhC6
 0N7iwWY7Cy4CA==
Date: Tue, 11 Feb 2025 09:31:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
Message-ID: <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
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

On Fri, Feb 07, 2025 at 04:18:32PM +0100, Louis-Alexis Eyraud wrote:
> Add a new gpu node in mt8370.dtsi to enable support for the
> ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
> Panfrost driver.
> 
> On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
> following message:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>    80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>    Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297ae360f69854e966e1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
> @@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
>  				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  };
>  
> +&gpu {
> +	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";

It's up to platform maintainers, but IMHO this is discouraged practice.
If you ever need to override compatible, this means the node is not
really shared between this and base SoC (base DTSI).

Best regards,
Krzysztof

