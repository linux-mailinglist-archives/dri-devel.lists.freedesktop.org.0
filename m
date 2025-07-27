Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BDEB131BE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 22:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDA010E09C;
	Sun, 27 Jul 2025 20:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YP1Un8Ut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A6610E09C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 20:27:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B0FA456C0;
 Sun, 27 Jul 2025 20:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E84C4CEEB;
 Sun, 27 Jul 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753648064;
 bh=5nZ81Q45zXBq38DZEfLN0BWGpMbT08thVZb065qc1X8=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=YP1Un8UtCBFJ9dp5dotJeSuxHo5OFLd27K0ScDaM7nqp1oKN+MoQPRMjBPhDGxG+x
 PAE0F6yuH8AoA9u8WC3RNs39MHUq70tVg8ra0Uv92OgVGz0zocRVrsEBIL7gr22HBZ
 IRhCjCQfVR/BeP5nqZtaSUb5MEkF+6Srw+a4xLDc1gNzoPfMUuiSuSU3Qdo2HvXTQI
 TMPBLGgB3gKP3D+S5Ra5LId4d+1Fxfq+x9v1/tVGNL/9WDR3y3OjjmjjZb95ZqN1QE
 i3614ekCAQ/L9r0a6Zc7AI1Jz23koPmFfcEKvmpF6RkfIktLkp0u00qlAEdrQNjtJW
 TES2XQFgaF00g==
Date: Sun, 27 Jul 2025 15:27:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 linux-kernel@vger.kernel.org, CK Hu <ck.hu@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
In-Reply-To: <20250727071609.26037-7-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
 <20250727071609.26037-7-jay.liu@mediatek.com>
Message-Id: <175364805847.3206.14487659451507375281.robh@kernel.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: display: mediatek: dither: Add
 support for MT8196
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


On Sun, 27 Jul 2025 15:15:56 +0800, Jay Liu wrote:
> Add a compatible string for the DITHER IP found in the MT8196 SoC.
> Each DITHER IP of this SoC is fully compatible with the ones found
> in MT8183.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250727071609.26037-7-jay.liu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

