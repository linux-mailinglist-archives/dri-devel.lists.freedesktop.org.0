Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D2A42D4D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E86E10E042;
	Mon, 24 Feb 2025 20:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qreTVj6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E8110E042
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:03:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A15046112C;
 Mon, 24 Feb 2025 20:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD12C4CED6;
 Mon, 24 Feb 2025 20:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740427429;
 bh=q+d7nm16qN8obUZdl22kTIu5V70Mi/RYYzCCy6bqBeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qreTVj6NyKUm6lrRKJbd3QXAxIqqOAJWW8G16C5zFxWhZCQDN1BM6OAGYPLK8+CyZ
 1FRGrGG5N7qqtX5xzjmsQYb8/ojIngs7HVgz2F6fXoXPi0coG24ncjg578qVp1tL6V
 CTsoZeST5a0x5h1xMyu0fuWWkWEkOVvIpp9G9PaHC2W3yNb8M4ibhsIUNMKB5dojV4
 kmpAIrzQk1gIPOzxo1dJ7Pkv4QD1dpfdlV/bNRrqNEEHL5Kd+g3HFabCw85n+SVN0q
 sIX/kHXEUh1r4I/KgO/yF9HVqbfplwRbkd+TsnyVKxb+IupTJ0hZjpXP1SlA2uRG7l
 pefph794JXEvA==
Date: Mon, 24 Feb 2025 14:03:47 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org,
 cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: rockchip: Add schema for
 RK3588 DPTX Controller
Message-ID: <20250224200347.GA4011821-robh@kernel.org>
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250223113036.74252-2-andyshrk@163.com>
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

On Sun, Feb 23, 2025 at 07:30:24PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX
> controller. And this DPTX controller need share a USBDP PHY with
> the USB 3.0 OTG controller during operation.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
>  .../display/rockchip/rockchip,dw-dp.yaml      | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> new file mode 100644
> index 000000000000..b48af8c3e68b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DW DisplayPort Transmitter
> +
> +maintainers:
> +  - Andy Yan <andy.yan@rock-chips.com>
> +
> +description: |
> +  The Rockchip RK3588 SoC integrates the Synopsys DesignWare DPTX controller
> +  which is compliant with the DisplayPort Specification Version 1.4 with the
> +  following features:
> +
> +  * DisplayPort 1.4a
> +  * Main Link: 1/2/4 lanes
> +  * Main Link Support 1.62Gbps, 2.7Gbps, 5.4Gbps and 8.1Gbps
> +  * AUX channel 1Mbps
> +  * Single Stream Transport(SST)
> +  * Multistream Transport (MST)
> +  *Type-C support (alternate mode)

???   ^

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
