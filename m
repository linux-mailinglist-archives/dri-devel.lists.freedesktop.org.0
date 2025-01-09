Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ECFA0705F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1D810E382;
	Thu,  9 Jan 2025 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LpzT/UaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D9610ED2A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:54:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1218F5C5A3A;
 Thu,  9 Jan 2025 08:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D48C4CED2;
 Thu,  9 Jan 2025 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736412883;
 bh=LombH1FD70xGrzs2x51pntDQW6o2Z1wYpa9hFitkHlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LpzT/UaHrYznnPqZq03T5+rn1MsO3ikIHjM++A+fSpNYpveoizqxWcg1FM7AARFy+
 uFTDL9ym1zgSHu1Go5E0lNhq+YjNmAVRRAwQ5bHn+/EvsjxrQdaInuFa5FA815DPST
 12BQgzy84zAw308jBjHtERr+wafzu9ujZLlmrfuNpRlwtJRl2KrtrYAaGW2R5VMMYR
 zPiSQLoN3HLnQt0dnqdhL/8MAhj5MR27OPBFch0W76lnS9enoxZEPcRt7z+h5eVd0U
 v0HmSl+a49k/GhFBnUAd475JIsgqZUGKDYHOIjpCYgqbo/fRMfxorrloywtbUx/zAC
 Pw9Qiqf64Lifg==
Date: Thu, 9 Jan 2025 09:54:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 13/20] dt-bindings: display: rockchip: analogix-dp:
 Add support for RK3588
Message-ID: <gmwmnjc4pzyzzstyozlfcdaw2ntfxg6ixofio2j746hmixhblc@sjbcvwcgitmy>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-14-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-14-damon.ding@rock-chips.com>
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

On Thu, Jan 09, 2025 at 11:27:18AM +0800, Damon Ding wrote:
> Compared with RK3288/RK3399, the HBR2 link rate support is the main
> improvement of RK3588 eDP TX controller, and there are also two
> independent eDP display interfaces on RK3588 Soc.
> 
> The newly added 'apb' reset is to ensure the APB bus of eDP controller
> works well on the RK3588 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the main defferences of the RK3588 eDP and the previous versions
>   in commit message
> 
> Changes in v3:
> - Expand the property clock-names, resets and reset-names
> 
> Changes in v4:
> - Remove 'spdif' clock which added in v3
> - Add the comment of newly added 'apb' reset in commit message
> 
> Changes in v5:
> - Put the differences between RK3288/RK3399 and RK3588 into 'allOf'
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 37 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index eaf4e67e232e..3cdea9e63522 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - rockchip,rk3288-dp
>        - rockchip,rk3399-edp
> +      - rockchip,rk3588-edp
>  
>    clocks:
>      minItems: 2
> @@ -30,12 +31,6 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> -  resets:
> -    maxItems: 1
> -
> -  reset-names:
> -    const: dp

Widest constraints are always here. You only needed to add allOf.

https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml

Best regards,
Krzysztof

