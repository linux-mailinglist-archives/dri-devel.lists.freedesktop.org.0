Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC0B108F9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AAB10E932;
	Thu, 24 Jul 2025 11:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sB9F7RQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040D10E930
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BDE9C449F5;
 Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BECBC4AF09;
 Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753355972;
 bh=fKCuPREZ1fbNq7ig0PZdlTERupyUK7tD1jI8Qmyxs+g=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=sB9F7RQrKGg3BH5HBxZKEtr+kJAxtHztDJOH4j06rLBPmyPtxR8iCzQpvE8FN+9Iy
 mcD/YAzmcUN8OsUa43o8rwSj9x+YBqvRJh5DMVuUHTFfj26IXlM/FWU+DH4kTUOUnl
 FTi6NYjKApl0W1cCWyKtot5HZx3NdodGu8tGv8g+/FaCls7mqFfxAzSgirg+XBM7mp
 YGT8Ybuu8+k/A3ti+/lmcOOP8rNX+h4vLb+A/HBHRXSF2bbwqJj6IdGKM6kE5fzSw3
 zV9RNcWAGwDhEKw8LyJsm8l8Xse6hXdc0a6Hv6btUM7ggBxiqyHO9q+EUnGjDVQupz
 EcJuB5Dd0NFIg==
Date: Thu, 24 Jul 2025 06:19:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: atenart@kernel.org, maarten.lankhorst@linux.intel.com, 
 houlong.wei@mediatek.com, linux-sound@vger.kernel.org, tzimmermann@suse.de, 
 mwalle@kernel.org, dri-devel@lists.freedesktop.org, airlied@gmail.com, 
 jieyy.yang@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, herbert@gondor.apana.org.au, 
 sean.wang@kernel.org, kishon@kernel.org, arnd@arndb.de, 
 linux-media@vger.kernel.org, granquet@baylibre.com, vkoul@kernel.org, 
 lgirdwood@gmail.com, tglx@linutronix.de, devicetree@vger.kernel.org, 
 mripard@kernel.org, ck.hu@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, simona@ffwll.ch, 
 krzk+dt@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, 
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 jassisinghbrar@gmail.com, linus.walleij@linaro.org, conor+dt@kernel.org, 
 jitao.shi@mediatek.com, tinghan.shen@mediatek.com, 
 chunfeng.yun@mediatek.com, davem@davemloft.net, eugen.hristev@linaro.org, 
 linux-kernel@vger.kernel.org, mchehab@kernel.org, jiaxin.yu@mediatek.com, 
 chunkuang.hu@kernel.org, andersson@kernel.org, frank-w@public-files.de, 
 fparent@baylibre.com, linux-remoteproc@vger.kernel.org, broonie@kernel.org, 
 linux-mediatek@lists.infradead.org, andy.teng@mediatek.com, 
 sam.shih@mediatek.com, olivia.wen@mediatek.com, 
 linux-crypto@vger.kernel.org, linux-phy@lists.infradead.org, 
 shane.chien@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
Message-Id: <175335596917.1587632.3054141049365225304.robh@kernel.org>
Subject: Re: [PATCH 08/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl:
 Add missing base reg
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


On Thu, 24 Jul 2025 10:38:44 +0200, AngeloGioacchino Del Regno wrote:
> The pin controller for both MT7622 and MT7629 need both a "base"
> and an "eint" MMIO like the ones found on other MediaTek SoCs:
> while devicetrees have always been correct, the binding is not,
> as it only allows an "eint" reg.
> 
> Add "base" to reg-names and increment maxItems for reg to two.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.example.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg: [[0, 270602240, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-9-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

