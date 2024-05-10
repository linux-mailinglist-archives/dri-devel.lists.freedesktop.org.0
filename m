Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A68C250C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 14:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BCB10E253;
	Fri, 10 May 2024 12:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="elRO8c91";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAB110E253
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 12:48:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 107B361E66;
 Fri, 10 May 2024 12:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EA9C113CC;
 Fri, 10 May 2024 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715345320;
 bh=V8xD1Koidl+pNdYoJfQFLAiAFVdTfdYB2dUbuhjigGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=elRO8c91+R0DCAXv7+SLp8jJSCziQgTrHU6dWu9qwHD6XqKBCLiHuCKHNSbrgbcQg
 eJsQ0tFhCPQE2Y4O65z6uB4IrPGycaFkyuaOcB+YtDbvnjSSu49cJ0WU6MuQoLwWy3
 VxtXhLaNg2Y2Mv5eWn/LmrdnOqvHRlj/7/dCfxp9tpC9NhIxjD1VnxnJ7Maz3PCPe7
 LUqVWh0Ve9W2L+elph2QaZ0lc0RXMVlxbhOlTEuz25bOZUBWskDyl4CnteT7owXUgs
 jlwx/DYGCq9Hoav6/8i3JoYd0Ef4TlYm3FuTRoOTqnsoenH6UTmIUB8FSOwqSIeAVX
 EXF9K5LfHBQVg==
Date: Fri, 10 May 2024 07:48:38 -0500
From: Rob Herring <robh@kernel.org>
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 jitao.shi@mediatek.com, mac.shen@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/2] Add dp PHY dt-bindings
Message-ID: <20240510124838.GA3916816-robh@kernel.org>
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
 <20240510110523.12524-3-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510110523.12524-3-liankun.yang@mediatek.com>
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

On Fri, May 10, 2024 at 07:04:15PM +0800, Liankun Yang wrote:
> Add dp PHY dt-bindings.
> 
> Changeds in v2:
> - Add dp PHY dt-bindings.
> https://patchwork.kernel.org/project/linux-mediatek/patch/
> 20240403040517.3279-1-liankun.yang@mediatek.com/
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
>  .../display/mediatek/mediatek.phy-dp.yaml     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml

git refuses to apply your patch because 'new file mode 100644' is 
missing. You must have edited the patch or something.

If it did apply, you'd notice it fails testing.

> index 000000000000..476bc329363f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek.phy-dp.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,phy-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Display Port Controller
> +
> +maintainers:
> +  - Mac shen <mac.shen@mediatek.com>
> +  - Liankun yang <Liankun.yang@mediatek.com>
> +
> +description: |
> +  Special settings need to be configured by MediaTek DP based on the actual
> +  hardware situation. For example, when using a certain brand's docking
> +  station for display projection, garbage may appear. Adjusting the specific
> +  ssc value can resolve this issue.
> +
> +properties:
> +  status: disabled
> +    description: |
> +      Since the DP driver has already registered the DP PHY device
> +      through mtk_dp_register_phy(), so the status is disabled.

What!? Please show me any other binding that has 'status' in it. Go read 
up on how to write bindings and what goes in them.

> +
> +  dp-ssc-setting:
> +    - ssc-delta-hbr
> +    description: Specific values are set based on the actual HW situation.
> +
> +required:
> +  - status
> +  - dp-ssc-setting
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        phy-dp@1c600000 {
> +          status = "disabled";
> +          dp-ssc-setting {
> +            ssc-delta-hbr = <0x01fe>;
> +          }
> +        };
> +    };
> -- 
> 2.18.0
> 
