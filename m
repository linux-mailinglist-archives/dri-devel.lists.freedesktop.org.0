Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE3B12574
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657BF10EA13;
	Fri, 25 Jul 2025 20:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dbW8S110";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4992710EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2391944F67;
 Fri, 25 Jul 2025 20:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FC8C4CEE7;
 Fri, 25 Jul 2025 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475428;
 bh=ba7r3CQWnc9Pg59zckBMYOhewHfZtzF4js8BFZ+0f9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dbW8S110p3NBmLaJdPOPH54qeqD00XyhjoRdv89Oc/9seV5Gebju3lz+V2fFMuB/Q
 ZG8upnvyRHMVpuySek1hBhmyctGYtzAQ6cXCXKjp1lQQHSzkE4iUJER7UN+9bgbZVA
 QD1lVSbKRyDW0ZEe0/EMwhfbQ3E0gDpivtn/VhyvaLE9BDL80GMlVu3pdeb2Z5HYzH
 TunHOOTBpQ6fbovuC8fjR2Xisgued54rZ+8BjIfP0ES1hs+vhy0arR1Uy65Q8BhfC2
 L9k/9/uQq129XN7CqmqHgViTcChBd1BD0wYRt70Q9poeuLwbSEYOWmAUrgkw/tMMZW
 DvOdLKPmgYbZg==
Date: Fri, 25 Jul 2025 15:30:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, ck.hu@mediatek.com,
 olivia.wen@mediatek.com, linus.walleij@linaro.org,
 tglx@linutronix.de, mathieu.poirier@linaro.org,
 sean.wang@kernel.org, andy.teng@mediatek.com,
 jiaxin.yu@mediatek.com, kishon@kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 jieyy.yang@mediatek.com, simona@ffwll.ch,
 linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
 linux-remoteproc@vger.kernel.org, mwalle@kernel.org,
 davem@davemloft.net, airlied@gmail.com, chunfeng.yun@mediatek.com,
 linux-crypto@vger.kernel.org, tinghan.shen@mediatek.com,
 arnd@arndb.de, chunkuang.hu@kernel.org, atenart@kernel.org,
 linux-phy@lists.infradead.org, frank-w@public-files.de,
 linux-media@vger.kernel.org, sam.shih@mediatek.com,
 mripard@kernel.org, lgirdwood@gmail.com, daniel.lezcano@linaro.org,
 maarten.lankhorst@linux.intel.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, herbert@gondor.apana.org.au,
 matthias.bgg@gmail.com, jassisinghbrar@gmail.com, vkoul@kernel.org,
 mchehab@kernel.org, linux-gpio@vger.kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, shane.chien@mediatek.com,
 conor+dt@kernel.org, p.zabel@pengutronix.de, granquet@baylibre.com,
 jitao.shi@mediatek.com, fparent@baylibre.com, tzimmermann@suse.de,
 eugen.hristev@linaro.org, broonie@kernel.org
Subject: Re: [PATCH 12/38] dt-bindings: regulator: mediatek,mt6331: Add
 missing compatible
Message-ID: <175347542615.1838505.12887834541571951617.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:48 +0200, AngeloGioacchino Del Regno wrote:
> This binding had no compatible and for this reason would not be
> applied to anything: add the missing "mediatek,mt6331-regulator"
> comaptible.
> 
> Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6331-regulator.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

