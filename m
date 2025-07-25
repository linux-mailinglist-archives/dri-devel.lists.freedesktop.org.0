Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E730B12563
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768E10EA0F;
	Fri, 25 Jul 2025 20:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nmhx7Z8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120F010EA0F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:29:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72A155C6410;
 Fri, 25 Jul 2025 20:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE74C4CEE7;
 Fri, 25 Jul 2025 20:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475339;
 bh=2lR8zBkPfCL0XzsAZKYS6/0c97bv4h+0epH74tNqB9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nmhx7Z8/FBwNijNFPpZf4SqJoOStQ0XsxTd/CcwodEvheITYeVzDATI0vkqopVZpN
 ahWJcPhWgy+F6oKOWucoyS8HKVtTZ65qkKO8rnMdpLbkTDaCq5kdB43VdABXLgIuDr
 AM/H9YWG4msnlSmTFWa7aBLB+g4755Mt+4XTP+zmXW/Yj4MklkggEMOnWzWa+wULQ5
 WGiC6obE6FEykCeFOOC0Vg2eGT4khYCcJCTXm7Kcot8eL3Y4GZ6LqEPpW7zeM7EEVS
 8NizKGJ9SwGA6+f9JSlBLusqpEgsBUK4k1GQ/Wm6GpWdOOeE//dPy40IOSp7ZOPZfq
 Lrk5Ir8nxLrrQ==
Date: Fri, 25 Jul 2025 15:28:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, mripard@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 daniel.lezcano@linaro.org, krzk+dt@kernel.org, vkoul@kernel.org,
 chunfeng.yun@mediatek.com, tinghan.shen@mediatek.com, arnd@arndb.de,
 herbert@gondor.apana.org.au, shane.chien@mediatek.com,
 andersson@kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-phy@lists.infradead.org, airlied@gmail.com,
 matthias.bgg@gmail.com, linus.walleij@linaro.org,
 jieyy.yang@mediatek.com, granquet@baylibre.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, tglx@linutronix.de,
 conor+dt@kernel.org, jiaxin.yu@mediatek.com,
 frank-w@public-files.de, davem@davemloft.net, sam.shih@mediatek.com,
 broonie@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 chunkuang.hu@kernel.org, eugen.hristev@linaro.org, simona@ffwll.ch,
 andy.teng@mediatek.com, linux-remoteproc@vger.kernel.org,
 tzimmermann@suse.de, mwalle@kernel.org, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, p.zabel@pengutronix.de,
 olivia.wen@mediatek.com, jitao.shi@mediatek.com,
 mathieu.poirier@linaro.org, kishon@kernel.org,
 jassisinghbrar@gmail.com, sean.wang@kernel.org, atenart@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/38] dt-bindings: timer: mediatek: Add compatible for
 MT6795 GP Timer
Message-ID: <175347533780.1836400.4840892261408767765.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-7-angelogioacchino.delregno@collabora.com>
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


On Thu, 24 Jul 2025 10:38:42 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the General Purpose Timer (GPT) found on the
> MediaTek Helio X10 MT6795 SoC which is fully compatible with the
> one found in MT6577.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

