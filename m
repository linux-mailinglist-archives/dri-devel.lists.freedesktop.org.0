Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721BEB31F9A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CEA10EB5C;
	Fri, 22 Aug 2025 15:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tBUykIQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5310EB5C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:53:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02EC6A58AFA;
 Fri, 22 Aug 2025 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8FAC4CEED;
 Fri, 22 Aug 2025 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755877978;
 bh=GZcqAUhind1yPvp4zhhO0FBJJvpJTi5iPD/E6Y6N6GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tBUykIQBRStiihtAnJe0AVIVB3jiv164suytchNLOiHzXp4/+sT3VdYIWELtCxQ/S
 k+XB53PnA2SVEHhRTUS7U4pZc/6+NTJUkZY7CKASmPvQ9QpYCcufIcSzgpR7NWVkSi
 jp9XGx5f+pZpXKidRSPAs6K+jdBokudQq0L+JSHKIQsakl6rBCtx53/+fKmRYU7AE5
 FMyFc2btLCA2xVryygJW3jkoBWIeiRMncRcBrhZrVRERgO/U1xU0HV1QVl4Lxov6FV
 dzjxYmwhLLY/zdK180LgDdUc1uFpRhZ4yyM60sjdxOlRcDnYbBAtClKHQaXm10ebIj
 AcsRl3MiOJs+A==
Date: Fri, 22 Aug 2025 10:52:57 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de,
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
Message-ID: <20250822155257.GA3865729-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:13:01PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
> controller to a YAML schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
>  .../input/touchscreen/melfas_mip4.txt         | 20 -------
>  2 files changed, 55 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
> new file mode 100644
> index 0000000000000..170fd4212467e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MELFAS MIP4 Touchscreen
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: "melfas,mip4_ts"

Drop quotes. With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
