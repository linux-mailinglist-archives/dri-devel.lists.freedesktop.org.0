Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E8CC13AC2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3611F10E5C4;
	Tue, 28 Oct 2025 09:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q/qUlU0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4944510E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:03:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B10A41986;
 Tue, 28 Oct 2025 09:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6594EC4CEE7;
 Tue, 28 Oct 2025 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761642185;
 bh=WPuS1p03nJA56MEoRrTM+Ywn8nh+8dI3UapF3Ehxvpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q/qUlU0ZPopjFTMLx4zYjlF2i9nz19usJHFqW8oZoBpQsXaVLIIUPFiJtVNUGvcem
 I6BMGesn8kLn2u8QrlcyfeImFZsBa0ksoziH8pqUYlvqfaOzbgk/ciUEd5x5ScVIiT
 6w1qAqNZVYtyb3R0ugjvBwgciveN84SPJuqnFi034iKCf1LEBRHgfZF8W76nAMcjhp
 Ol9yO16MLt0ZNc+N76hYogP/ewRNr1sCWlzoddDUoUOqow/VezgwJi/hkJ68iD6dHW
 UUL3zgb6LlJjtJi6p7arEfOAdzC4OgV3L9FMXSc3xw3DRMkpmNA7iV0Lde+fivLLdF
 hA2OqtsnlbRuA==
Date: Tue, 28 Oct 2025 10:03:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Message-ID: <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
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

On Mon, Oct 27, 2025 at 06:48:11PM +0100, Josua Mayer wrote:
> port property is used for linking dsi ports with dsi panels.
> Add port property to ronbo dsi panel binding.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> index 04f86e0cbac91..a2dc67a87fa3b 100644
> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      const: ronbo,rb070d30
>  
> +  port: true

Port is never the second property. Please look at other bindings.

Also, missing blank line and missing top-level ref for panel-common.

Best regards,
Krzysztof

