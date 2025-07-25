Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81EB12568
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D203410EA11;
	Fri, 25 Jul 2025 20:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jKwaEjYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FF110EA11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:29:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 455424348C;
 Fri, 25 Jul 2025 20:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F213AC4CEE7;
 Fri, 25 Jul 2025 20:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475376;
 bh=FpiQA0h1rzmVXkCXdxYXb5ICmJTBTxxEhCePZRRuCHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKwaEjYNVtXEiydTCcEXLSyh+1Hte1oAwHkS4BihjjRez/a8NVKcMBqFkGy3BEjuq
 +X3eWAJWkqsX9CAX38Gq9toeBq6zU0OGfjuMPHzK604QZONe0tfL0x7mgWzcHqHdZu
 vlOXoFxUcNZhtdWazggpl9Z/j9sQ4HWRJu4toM8I/xgTLt0i5/upQFIw/sO2Do7hgl
 JegXzXTVwDd0NCMgkZqdfLubKFRC5Rot6gn4SVzsCSjZDN4fLGSWCN0dGldo3Qm8wh
 nyH+PzpGN3FsB4DrzfCqJGE3Fa/7MeveQBlDdwA+V8tXz0sKj41d/P+hzWWrpzuUQ7
 o3cXKDZLnLdUw==
Date: Fri, 25 Jul 2025 15:29:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mchehab@kernel.org, houlong.wei@mediatek.com, shane.chien@mediatek.com,
 airlied@gmail.com, arnd@arndb.de, lgirdwood@gmail.com,
 kishon@kernel.org, sean.wang@kernel.org, sam.shih@mediatek.com,
 linux-sound@vger.kernel.org, jieyy.yang@mediatek.com,
 linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
 davem@davemloft.net, linux-mediatek@lists.infradead.org,
 granquet@baylibre.com, linux-crypto@vger.kernel.org,
 linux-phy@lists.infradead.org, conor+dt@kernel.org,
 andy.teng@mediatek.com, linux-gpio@vger.kernel.org,
 krzk+dt@kernel.org, mwalle@kernel.org, vkoul@kernel.org,
 chunkuang.hu@kernel.org, atenart@kernel.org, broonie@kernel.org,
 tglx@linutronix.de, jiaxin.yu@mediatek.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, chunfeng.yun@mediatek.com,
 linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com,
 herbert@gondor.apana.org.au, jitao.shi@mediatek.com,
 tinghan.shen@mediatek.com, fparent@baylibre.com,
 linux-media@vger.kernel.org, mripard@kernel.org,
 daniel.lezcano@linaro.org, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, olivia.wen@mediatek.com,
 linus.walleij@linaro.org, kyrie.wu@mediatek.corp-partner.google.com,
 dri-devel@lists.freedesktop.org, mathieu.poirier@linaro.org,
 eugen.hristev@linaro.org, tzimmermann@suse.de,
 jassisinghbrar@gmail.com, matthias.bgg@gmail.com
Subject: Re: [PATCH 10/38] dt-bindings: regulator: mediatek, mt6332-regulator:
 Add missing compatible
Message-ID: <175347537496.1837320.18080816352465991088.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:46 +0200, AngeloGioacchino Del Regno wrote:
> This binding had no compatible and for this reason would not be
> applied to anything: add the missing "mediatek,mt6332-regulator"
> compatible.
> 
> Fixes: e22943e32e1f regulator: ("Add bindings for MT6332 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6332-regulator.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

