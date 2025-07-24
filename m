Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449E9B108F8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 13:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F0C10E930;
	Thu, 24 Jul 2025 11:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KANGt0eb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA61D10E930
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CC7E44662F;
 Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E977C4CEF6;
 Thu, 24 Jul 2025 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753355973;
 bh=5cTdoI2rOUe6G6HT5nFkVFTBctNxOCQYi0uviPnvs+g=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=KANGt0ebto1MONaBI3ARQ7iBvAyPQDgayh99q1orDfo5Er0bg7f5vzXeCc2U1ZKU9
 7AIietCqp0u2n/uzXq2vyZXtIUALbpWNrw68ovOF7GDqPSQHH6aoG+Vcp2I5P4CuLc
 WDpVL+fFrBAsHRjDnxbIvYeONye17mTyba5lQKQ5X+aqK36r0WZGhGI89WPQibT0mJ
 ww9QIa3f7q2k7n213+Sfl8DZDJV3ErIdW5dEejEW6SvtxobVppRrm54brUQktp6fp7
 P5KrvWdRk9ylcHJld7sId3USeqBmub4mDblrJjjpqLvTCWCXGiXyWRzx5OcPxXR9qQ
 IY5rKBj8p/g8A==
Date: Thu, 24 Jul 2025 06:19:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mripard@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linus.walleij@linaro.org, krzk+dt@kernel.org, 
 daniel.lezcano@linaro.org, houlong.wei@mediatek.com, atenart@kernel.org, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 tinghan.shen@mediatek.com, broonie@kernel.org, sean.wang@kernel.org, 
 shane.chien@mediatek.com, sam.shih@mediatek.com, 
 linux-media@vger.kernel.org, mchehab@kernel.org, 
 linux-mediatek@lists.infradead.org, andersson@kernel.org, 
 linux-crypto@vger.kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
 eugen.hristev@linaro.org, kishon@kernel.org, mathieu.poirier@linaro.org, 
 herbert@gondor.apana.org.au, ck.hu@mediatek.com, 
 linux-sound@vger.kernel.org, p.zabel@pengutronix.de, 
 chunkuang.hu@kernel.org, maarten.lankhorst@linux.intel.com, arnd@arndb.de, 
 fparent@baylibre.com, linux-phy@lists.infradead.org, tzimmermann@suse.de, 
 davem@davemloft.net, jassisinghbrar@gmail.com, lgirdwood@gmail.com, 
 granquet@baylibre.com, andy.teng@mediatek.com, vkoul@kernel.org, 
 tglx@linutronix.de, jitao.shi@mediatek.com, frank-w@public-files.de, 
 linux-gpio@vger.kernel.org, chunfeng.yun@mediatek.com, mwalle@kernel.org, 
 olivia.wen@mediatek.com, jieyy.yang@mediatek.com, 
 linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com, simona@ffwll.ch, 
 jiaxin.yu@mediatek.com, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-10-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-10-angelogioacchino.delregno@collabora.com>
Message-Id: <175335597003.1587784.8284498888882102911.robh@kernel.org>
Subject: Re: [PATCH 09/38] dt-bindings: pinctrl: mt6779: Allow common
 MediaTek pinctrl node names
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


On Thu, 24 Jul 2025 10:38:45 +0200, AngeloGioacchino Del Regno wrote:
> Allow node names like "uart0-pins" for the main nodes and "pins-bus"
> for the children to make this binding consistent with the majority
> of the other MediaTek pinctrl bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dtb: pinctrl@10005000 (mediatek,mt6779-pinctrl): mmc0-0: 'clk-pins', 'cmd-dat-pins', 'rst-pins' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-10-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

