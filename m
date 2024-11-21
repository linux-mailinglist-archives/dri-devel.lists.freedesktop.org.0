Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E09D48C0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C82D10E3E2;
	Thu, 21 Nov 2024 08:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MVbnAJJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59710E3E2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 08:23:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 31F805C56F5;
 Thu, 21 Nov 2024 08:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0775C4CECC;
 Thu, 21 Nov 2024 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732177386;
 bh=wUfTnjHQ2yL4NbL5Y4AFUH82UDKPs5WqKTu3tB1fwgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVbnAJJB0YKzqkLAlv+RUlK1bsic7FFTr3PrQXxxLvDMpvYiEsNj+QN9blVHNBrRd
 vgV2DR9hjWxEx8BfsCc5nQUrG+ywgDIf5rE9YiVaDTVu2dv0j38g1AtXMjWtTEuaYL
 ZK3WTn+KG7uIdD+Hlb1InkCXDpAw8m1TDGBUqADKtEknIZkMLOZilgc7bmFq5JD3XA
 SQvZcTA2rS9DFCgbzPUuAckR0jEvsbjOk2a7WAqMZ00ZOBoS7ntM9I0wJAjY+jfS1h
 yvQ+7xPUT9qU1fZ6SgHFoZBI/4/5lCx4GB40DjxL5VaNtLDso7JCXBZzWx2HfnxT/y
 CjTct7UPCoYfw==
Date: Thu, 21 Nov 2024 09:23:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, kernel@esmil.dk, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 p.zabel@pengutronix.de, changhuang.liang@starfivetech.com,
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: display: bindings for
 starfive,JH7110 display pipeline
Message-ID: <fza6u77alzm6ovzptkh7isztycn72pzae2f62kqeyj3f7ognou@lmp7cg4tr3yw>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-2-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-2-keith.zhao@starfivetech.com>
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

On Wed, Nov 20, 2024 at 02:18:40PM +0800, keith zhao wrote:
> - Added bindings to support the display subsystem on the JH7110 SoC.

Please do not use "This commit/patch/change" (implied) and past tense,
but imperative mood. See longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> - Included the DC8200 display controller and Inno HDMI controller.
> 
> - Created innosilicon,inno-hdmi.yaml schema containing common properties
>   for the Inno DesignWare HDMI TX controller.
>   This isn't a full device tree binding specification,
>   but is intended to be referenced by platform-specific bindings
>   for the IP core.
> 
> Signed-off-by: keith zhao <keith.zhao@starfivetech.com>
> ---
>  .../display/bridge/innosilicon,inno-hdmi.yaml |  45 +++++
>  .../display/rockchip/rockchip,inno-hdmi.yaml  |  27 +--
>  .../starfive/starfive,jh7110-dc8200.yaml      | 176 ++++++++++++++++++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  91 +++++++++
>  .../soc/starfive/starfive,jh7110-syscon.yaml  |   1 +

I do not see how you addressed my feedback. I asked you to split the
patch. Where is the split?

Your answer to my request to split was "Background is ...", yeah, so
what? You are not going to split?


>  MAINTAINERS                                   |   8 +
>  6 files changed, 323 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
> new file mode 100644
> index 000000000000..f2543aebc312
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/innosilicon,inno-hdmi.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/innosilicon,inno-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Innosilicon HDMI TX IP
> +
> +maintainers:
> +  - keith zhao <keith.zhao@starfivetech.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.



> +  Innosilicon HDMI TX is an HDMI transmission device integrated into the zap SoC.

Keep and extend.

> +  This document specifies the device tree properties for the INNO HDMI IP core.

Keep... but what is INNO HDMI IP core? Another name? Different block?


> +  It is intended to be referenced by platform-specific device tree bindings,
> +  which will determine the necessity of each property.

Not much improved here. Last two sentences are almost useless. Again -
document the hardware. Drop this sentence.

I already complained about this. I already complained that you keep
ignoring my comments and this does not improve much.

Since you did not implement my main feedback I am going to NAK the rest
except one more thing:

...

> +
> +properties:
> +  compatible:
> +    const: "starfive,jh7110-inno-hdmi"

I could not be more specific in my previous feedback. Improvements? No.
Stop wasting our time.

NAK.

Best regards,
Krzysztof

